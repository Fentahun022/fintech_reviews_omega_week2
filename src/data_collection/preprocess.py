
import pandas as pd
import os
import re
import sys
sys.path.append(os.path.abspath(os.path.join(os.path.dirname(__file__), '..')))
import config

def clean_text_basic(text):
    if pd.isna(text):
        return ""
    text = str(text)
    text = text.lower()  # Lowercase
    text = re.sub(r'\s+', ' ', text)  # Replace multiple spaces with single
    text = re.sub(r'[^\w\s\.\?\!\'\u1200-\u137F]', '', text) # Added Amharic unicode range
    text = text.strip()
    return text

def preprocess_reviews(df_raw):
    print(f"Initial number of reviews: {len(df_raw)}")
    df = df_raw.copy()

    essential_cols = ['review_id', 'review_text', 'rating', 'date', 'bank_name', 'source']
    for col in essential_cols:
        if col not in df.columns:
            raise ValueError(f"Essential column '{col}' not found in raw data.")
    df.dropna(subset=['review_text', 'rating', 'review_id'], inplace=True) # review_id also crucial
    print(f"Reviews after dropping NA in text/rating/review_id: {len(df)}")

    # Remove duplicates based on 'review_id'
    df.drop_duplicates(subset=['review_id'], keep='first', inplace=True)
    print(f"Reviews after dropping duplicates by review_id: {len(df)}")

    # Normalize dates (to YYYY-MM-DD)
    # 'date' column from scraper is already datetime, convert to string
    try:
        df['date'] = pd.to_datetime(df['date']).dt.strftime('%Y-%m-%d')
    except Exception as e:
        print(f"Warning: Could not parse all dates. Error: {e}. Check date column format.")
        df['date'] = pd.to_datetime(df['date'], errors='coerce')
        df.dropna(subset=['date'], inplace=True)
        df['date'] = df['date'].dt.strftime('%Y-%m-%d')


    # Clean review text
    df['cleaned_review_text'] = df['review_text'].apply(clean_text_basic)

    # Filter out reviews with very short text after cleaning (e.g., less than 3 words)
    df = df[df['cleaned_review_text'].apply(lambda x: len(str(x).split()) > 2)]
    print(f"Reviews after filtering short cleaned texts: {len(df)}")

    # Select final columns
    # Keeping original review_text is good for reference
    final_columns = [
        'review_id', 'cleaned_review_text', 'rating', 'date', 'bank_name', 'source',
        'user_name', 'thumbs_up_count', 'app_version', 'review_text' # Original
    ]
    # Only include columns that actually exist in the df
    final_columns = [col for col in final_columns if col in df.columns]
    df_cleaned = df[final_columns]
    
    return df_cleaned

def run_preprocessing():
    raw_file_path = os.path.join(config.RAW_DATA_DIR, "all_banks_reviews_raw.csv")
    processed_file_path = os.path.join(config.PROCESSED_DATA_DIR, "all_banks_reviews_cleaned.csv")

    if not os.path.exists(raw_file_path):
        print(f"Raw data file not found: {raw_file_path}. Please run scraper.py first.")
        return

    if not os.path.exists(config.PROCESSED_DATA_DIR):
        os.makedirs(config.PROCESSED_DATA_DIR)

    df_raw = pd.read_csv(raw_file_path)
    
    print("Missing data percentages before preprocessing:")
    print((df_raw.isnull().sum() / len(df_raw)) * 100)

    df_cleaned = preprocess_reviews(df_raw)

    print(f"\nTotal cleaned reviews: {len(df_cleaned)}")
    missing_percentage_cleaned = (df_cleaned.isnull().sum() / len(df_cleaned)) * 100
    print("\nMissing data percentages after cleaning:")
    print(missing_percentage_cleaned)
    
    # KPI Check: <5% missing data in critical columns
    critical_cols_check = ['cleaned_review_text', 'rating', 'date', 'bank_name']
    if missing_percentage_cleaned[critical_cols_check].max() < 5:
        print("\nData quality KPI met (<5% missing in critical columns).")
    else:
        print("\nWarning: Data quality KPI NOT met (>=5% missing in critical columns).")
        print(missing_percentage_cleaned[critical_cols_check])

    df_cleaned.to_csv(processed_file_path, index=False, encoding='utf-8')
    print(f"\nCleaned data saved to {processed_file_path}")
    print("\nReview counts per bank in cleaned data:")
    print(df_cleaned['bank_name'].value_counts())

if __name__ == "__main__":
    run_preprocessing()