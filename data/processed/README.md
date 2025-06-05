# Omega Consultancy - Bank App Review Analysis

This project analyzes customer satisfaction with mobile banking apps for three Ethiopian banks: CBE, BOA, and Dashen Bank.


1.  **Web Scraping:**
    *   User reviews were scraped from the Google Play Store using the `google-play-scraper` Python library.
    *   Target applications:
        *   Commercial Bank of Ethiopia (com.combanketh.mobilebankign)
        *   Bank of Abyssinia (com.boa.boamobilebanking)
        *   Dashen Bank (com.dashen.dashensuperapp)
        *   ENAT Bank(com.enatbankeuthopialive)
    *   At least 400 reviews per bank were targeted, focusing on the newest reviews in English (`lang='en'`, `country='et'`).
    *   Data collected: Review ID, User Name, Review Text, Rating (1-5 stars), Thumbs Up Count, Review Created Version, Posting Date, Reply Content, Replied At, Bank Name, and Source (Google Play).
    *   Raw data was saved to `data/raw/all_bank_reviews_raw.csv`.

2.  **Preprocessing:**
    *   The raw data was loaded using Pandas.
    *   **Missing Data Handling:** Reviews with missing `review_text` or `rating` were dropped.
    *   **Duplicate Removal:** Duplicates were removed based on `review_id`.
    *   **Date Normalization:** Posting dates were standardized to `YYYY-MM-DD` format.
    *   **Text Cleaning:** Review text was converted to lowercase, extraneous whitespace was removed, and non-alphanumeric characters (except basic punctuation) were stripped. A new column `cleaned_review_text` was created.
    *   **Filtering:** Reviews with very short cleaned text (e.g., less than 3 words) were removed.
    *   The cleaned dataset was saved to `data/processed/all_bank_reviews_cleaned.csv` with columns: `review_id`, `cleaned_review_text`, `rating`, `date`, `bank`, `source`, `review_text` (original).