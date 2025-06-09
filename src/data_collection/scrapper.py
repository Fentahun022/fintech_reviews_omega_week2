
import pandas as pd
from google_play_scraper import reviews_all, Sort, reviews
import time
import os

import sys
sys.path.append(os.path.abspath(os.path.join(os.path.dirname(__file__), '..')))
import config # Now it can find config.py

def scrape_reviews_for_app(app_id, app_name, lang='en', country='et', min_reviews=400): # Changed country to 'et'
    """
    Scrapes reviews for a single app.
    Tries to get min_reviews, but might get more with reviews_all.
    If reviews_all fails or doesn't yield enough, uses paginated reviews.
    """
    print(f"Scraping reviews for {app_name} ({app_id})...")
    all_reviews_data = []
    
    try:
        # Attempt to get all reviews; this is often more efficient
        # Note: reviews_all might still be limited by Google Play in some cases
        # Using sort=Sort.NEWEST is good for recent feedback
        current_reviews = reviews_all(
            app_id,
            sleep_milliseconds=500, # Be respectful, 0 can be too fast
            lang=lang,
            country=country,
            sort=Sort.NEWEST 
        )
        all_reviews_data.extend(current_reviews)
        print(f"reviews_all fetched {len(current_reviews)} reviews for {app_name}.")

        if len(all_reviews_data) < min_reviews:
            print(f"reviews_all fetched {len(all_reviews_data)} reviews, which is less than {min_reviews}. Trying paginated fetching for more if needed.")
            # Fallback to paginated if not enough or if reviews_all has issues
            # This part is more robust for reaching a specific number
            # We need to manage continuation_token correctly.
            # reviews_all does not provide continuation_token.
            # So if reviews_all gets some, but not enough, we start paginated from scratch.
            # Or, we can decide if reviews_all result is "good enough" or always paginate.
            # For simplicity here, if reviews_all is less than min_reviews, we'll rely on the paginated logic below
            # to try and get *up to* min_reviews.
            # Let's clear and use paginated if reviews_all is insufficient:
            if len(all_reviews_data) < min_reviews : # If reviews_all didn't get enough, paginated might get more specific count
                print(f"Attempting paginated fetch to reach {min_reviews} for {app_name}")
                all_reviews_data = [] # Reset if reviews_all wasn't enough and we want paginated control
                continuation_token = None
                count_fetched_paginated = 0
                target_for_pagination = min_reviews # Target this many from pagination

                while count_fetched_paginated < target_for_pagination:
                    batch_to_fetch = min(200, target_for_pagination - count_fetched_paginated)
                    if batch_to_fetch <=0: break

                    try:
                        result_page, continuation_token = reviews(
                            app_id,
                            lang=lang,
                            country=country,
                            sort=Sort.NEWEST,
                            count=batch_to_fetch, 
                            continuation_token=continuation_token
                        )
                        if not result_page: 
                            print(f"No more paginated reviews found for {app_name} after fetching {count_fetched_paginated}.")
                            break
                        
                        all_reviews_data.extend(result_page)
                        count_fetched_paginated = len(all_reviews_data)
                        print(f"Fetched {len(result_page)} paginated reviews for {app_name}. Total (paginated only): {count_fetched_paginated}")

                        if not continuation_token or count_fetched_paginated >= target_for_pagination : 
                            break
                        time.sleep(2) # Be respectful to the server (increased sleep)
                    except Exception as e:
                        print(f"Error during paginated fetch for {app_name}: {e}")
                        break 
    except Exception as e:
        print(f"Could not scrape reviews for {app_id}: {e}")
        # If reviews_all fails, all_reviews_data might be empty.
        # We could add another paginated attempt here if desired.
        # For now, we'll proceed with what we have or an empty DF.
        pass # Let it proceed to df creation

    if not all_reviews_data:
        print(f"No reviews collected for {app_name}.")
        return pd.DataFrame()

    df = pd.DataFrame(all_reviews_data)
    
    # **MODIFICATION: Include 'reviewId' and rename columns**
    # Ensure all necessary columns exist, fill with None if not (though 'reviewId', 'content', 'score', 'at' should always be there)
    required_cols_from_scraper = ['reviewId', 'content', 'score', 'at', 'userName', 'thumbsUpCount', 'reviewCreatedVersion']
    for col in required_cols_from_scraper:
        if col not in df.columns:
            df[col] = None
            
    df['bank_name'] = app_name
    df['source'] = config.SOURCE_NAME
    
    # Select and rename
    df_formatted = df[['reviewId', 'content', 'score', 'at', 'bank_name', 'source', 'userName', 'thumbsUpCount', 'reviewCreatedVersion']].copy()
    df_formatted.rename(columns={
        'reviewId': 'review_id', 
        'content': 'review_text', 
        'score': 'rating', 
        'at': 'date',
        'userName': 'user_name',
        'thumbsUpCount': 'thumbs_up_count',
        'reviewCreatedVersion': 'app_version'
        }, inplace=True)
    
    print(f"Successfully processed {len(df_formatted)} reviews for {app_name}.")
    return df_formatted

def run_scraper():
    if not os.path.exists(config.RAW_DATA_DIR):
        os.makedirs(config.RAW_DATA_DIR)

    all_bank_reviews_list = []
    for bank_code, app_id in config.APP_IDS.items():
        # Use proper name from config.APP_NAMES or default to bank_code
        bank_name_proper = config.APP_NAMES.get(bank_code, bank_code) 

        reviews_df = scrape_reviews_for_app(app_id, bank_name_proper, min_reviews=config.MIN_REVIEWS_PER_APP)
        if not reviews_df.empty:
            all_bank_reviews_list.append(reviews_df)
            # Save individual bank reviews
            individual_path = os.path.join(config.RAW_DATA_DIR, f"{bank_code}_reviews_raw.csv")
            reviews_df.to_csv(individual_path, index=False, encoding='utf-8')
            print(f"Saved raw reviews for {bank_name_proper} to {individual_path}")
        else:
            print(f"No reviews scraped for {bank_name_proper}.")
        time.sleep(5) # Wait between scraping different apps

    if all_bank_reviews_list:
        combined_df = pd.concat(all_bank_reviews_list, ignore_index=True)
        output_path = os.path.join(config.RAW_DATA_DIR, "all_banks_reviews_raw.csv")
        combined_df.to_csv(output_path, index=False, encoding='utf-8')
        print(f"All raw reviews saved to {output_path}")
        print(f"Total reviews scraped: {len(combined_df)}")
        print("\nReview counts per bank (raw):")
        print(combined_df['bank_name'].value_counts())
    else:
        print("No reviews were scraped for any bank.")

if __name__ == "__main__":
    run_scraper()