
import pandas as pd
import os
import re
import nltk
from nltk.corpus import stopwords
from nltk.tokenize import word_tokenize
from nltk.stem import WordNetLemmatizer
from transformers import pipeline
from sklearn.feature_extraction.text import TfidfVectorizer
from collections import Counter
import sys
sys.path.append(os.path.abspath(os.path.join(os.path.dirname(__file__), '..')))
import config
def download_nltk_resources():
    resources = {
        "stopwords": stopwords.words('english'),
        "punkt": word_tokenize("test string"),
        "wordnet": WordNetLemmatizer().lemmatize("cats"),
        "omw-1.4": None 
    }
    for resource_name, check_func_call_or_none in resources.items():
        try:
            if check_func_call_or_none is not None:
                pass # Already implicitly checked by trying to call it
            else: # For omw-1.4, just try to download
                 nltk.data.find(f'corpora/{resource_name}')
        except LookupError:
            print(f"NLTK resource '{resource_name}' not found. Downloading...")
            nltk.download(resource_name)
        except Exception as e: # For omw-1.4, it might raise different error if path not found
            if resource_name == "omw-1.4":
                 nltk.download(resource_name)
            else:
                print(f"Error checking NLTK resource {resource_name}: {e}")


download_nltk_resources()

stop_words = set(stopwords.words('english'))
lemmatizer = WordNetLemmatizer()

# --- Sentiment Analysis ---
print("Loading sentiment analysis model...")
try:
    sentiment_classifier = pipeline(
        "sentiment-analysis",
        model=config.SENTIMENT_MODEL_NAME,
        device=-1  # Use -1 for CPU, 0 for CUDA GPU if available
    )
    print("Sentiment model loaded successfully.")
except Exception as e:
    print(f"Error loading sentiment model ({config.SENTIMENT_MODEL_NAME}): {e}")
    print("Sentiment analysis might be impacted or skipped.")
    sentiment_classifier = None

def get_sentiment_batch(text_batch):
    if sentiment_classifier is None:
        return [{'label': 'NEUTRAL', 'score': 0.0}] * len(text_batch) # Fallback

    truncated_batch = [text[:510] for text in text_batch] # Truncate for model limits
    try:
        sentiments = sentiment_classifier(truncated_batch)
        return sentiments
    except Exception as e:
        print(f"Error during sentiment prediction: {e}")
        return [{'label': 'ERROR', 'score': 0.0}] * len(text_batch)

# --- Thematic Analysis ---
def preprocess_nlp_text(text):
    if pd.isna(text): return ""
    text = str(text).lower()
    text = re.sub(r'\d+', '', text) # Remove numbers
    text = re.sub(r'[^\w\s]', '', text) # Remove punctuation (leaves only words and spaces)
    tokens = word_tokenize(text)
    # Lemmatize and remove stopwords, filter short tokens
    tokens = [lemmatizer.lemmatize(word) for word in tokens if word not in stop_words and len(word) > 2]
    return " ".join(tokens)

def extract_themes_from_text_v2(nlp_text, original_text):
    identified_themes = set()
    # Combine NLP processed and original lowercased text for broader keyword matching
    # Amharic words in original_text might be caught if keywords are also in Amharic
    # For now, THEMES_KEYWORDS are in English.
    search_text = (str(nlp_text) + " " + str(original_text).lower()).strip()

    for theme, keywords in config.THEMES_KEYWORDS.items():
        for keyword in keywords:
            # Regex for whole word matching, case-insensitive for the original_text part
            if re.search(r'\b' + re.escape(keyword) + r'\b', search_text, re.IGNORECASE):
                identified_themes.add(theme)
                # break # Optional: break if one keyword for a theme is found (assigns fewer themes per review)
    return list(identified_themes) if identified_themes else ['General Feedback']


def run_analysis():
    cleaned_file_path = os.path.join(config.PROCESSED_DATA_DIR, "all_banks_reviews_cleaned.csv")
    analyzed_file_path = os.path.join(config.PROCESSED_DATA_DIR, "all_banks_reviews_analyzed.csv")

    if not os.path.exists(cleaned_file_path):
        print(f"Cleaned data file not found: {cleaned_file_path}. Please run preprocess.py first.")
        return

    df = pd.read_csv(cleaned_file_path)
    # Ensure cleaned_review_text is string, handle potential NaN from CSV read
    df['cleaned_review_text'] = df['cleaned_review_text'].astype(str).fillna('')
    print(f"Loaded {len(df)} cleaned reviews for analysis.")

    # --- Sentiment Analysis ---
    if sentiment_classifier:
        print("Performing sentiment analysis...")
        batch_size = 64
        sentiments_data = []
        num_batches = (len(df) - 1) // batch_size + 1
        for i in range(0, len(df), batch_size):
            batch_texts = df['cleaned_review_text'][i:i+batch_size].tolist()
            batch_sentiments = get_sentiment_batch(batch_texts)
            sentiments_data.extend(batch_sentiments)
            print(f"  Processed sentiment batch {i//batch_size + 1}/{num_batches}")

        df['sentiment_label_raw'] = [s['label'] for s in sentiments_data]
        df['sentiment_score_raw'] = [s['score'] for s in sentiments_data]

        # Adjust sentiment score polarity and define 'sentiment_label' & 'sentiment_numeric'
        def interpret_sentiment(row):
            label_raw = row['sentiment_label_raw']
            score_raw = row['sentiment_score_raw']
            rating = row['rating']
            
            # Model specific interpretation (distilbert-sst-2-english gives POSITIVE/NEGATIVE)
            final_label = 'NEUTRAL'
            final_score = 0.5 # Neutral score default
            numeric_sentiment = 0 # -1, 0, 1

            if label_raw == 'POSITIVE':
                final_label = 'POSITIVE'
                final_score = score_raw
                numeric_sentiment = 1
            elif label_raw == 'NEGATIVE':
                final_label = 'NEGATIVE'
                final_score = 1 - score_raw # Score often represents confidence, so 1-score for negative can be misleading.
                                          # Better to use model's score directly and map label.
                                          # For distilbert, score is confidence in that label.
                final_score = score_raw # Keep model's confidence score
                numeric_sentiment = -1
            
            # Override with rating if strong disagreement or rating is neutral
            if rating == 3:
                final_label, final_score, numeric_sentiment = 'NEUTRAL', 0.5, 0
            elif rating <= 2 and final_label == 'POSITIVE': # User rated low, model said positive
                final_label, numeric_sentiment = 'NEGATIVE', -1
                # final_score could be a low confidence negative, e.g. 0.1 if score_raw was high positive
            elif rating >= 4 and final_label == 'NEGATIVE': # User rated high, model said negative
                final_label, numeric_sentiment = 'POSITIVE', 1

            return final_label, final_score, numeric_sentiment

        sentiment_cols = df.apply(interpret_sentiment, axis=1, result_type='expand')
        df['sentiment_label'] = sentiment_cols[0]
        df['sentiment_score_model'] = sentiment_cols[1] # This is the model's confidence for its label
        df['sentiment_numeric'] = sentiment_cols[2] # -1, 0, 1 based on label

        print("Sentiment analysis completed.")
        print("\nSentiment distribution (after adjustment):")
        print(df['sentiment_label'].value_counts(normalize=True))
    else:
        print("Sentiment analysis skipped (model not loaded).")
        df['sentiment_label'] = 'NOT_COMPUTED'
        df['sentiment_score_model'] = 0.0
        df['sentiment_numeric'] = 0

    # --- Thematic Analysis ---
    print("\nPerforming thematic analysis...")
    df['nlp_processed_text'] = df['cleaned_review_text'].apply(preprocess_nlp_text)
    df['identified_themes'] = df.apply(
        lambda row: extract_themes_from_text_v2(row['nlp_processed_text'], row['review_text']), axis=1
    )
    df['themes_str'] = df['identified_themes'].apply(lambda x: ', '.join(sorted(x))) # Sort for consistency

    print("Thematic analysis completed.")
    themes_exploded = df.explode('identified_themes')
    print("\nTop 15 themes identified overall:")
    print(themes_exploded['identified_themes'].value_counts().nlargest(15))

    # --- Keyword Extraction (Top N per bank using TF-IDF on nlp_processed_text) ---
    print("\nExtracting top keywords per bank (TF-IDF)...")
    df['keywords_bank'] = '' # Placeholder
    for bank_name in df['bank_name'].unique():
        bank_mask = df['bank_name'] == bank_name
        bank_texts = df.loc[bank_mask, 'nlp_processed_text'].dropna()
        
        if len(bank_texts) > 1 : # TF-IDF needs multiple documents
            try:
                vectorizer = TfidfVectorizer(max_features=100, ngram_range=(1,2), stop_words='english')
                tfidf_matrix = vectorizer.fit_transform(bank_texts)
                feature_names = vectorizer.get_feature_names_out()
                # Sum TF-IDF scores for each term (simple way to get importance)
                sum_tfidf = tfidf_matrix.sum(axis=0)
                tfidf_scores = [(feature_names[col], sum_tfidf[0, col]) for col in range(sum_tfidf.shape[1])]
                sorted_tfidf_scores = sorted(tfidf_scores, key=lambda x: x[1], reverse=True)
                top_keywords = [word for word, score in sorted_tfidf_scores[:15]] # Top 15
                
                # Add as a single string to the DataFrame for the bank (can't assign directly to slice if types differ)
                # This is not ideal for storage but shows the keywords. Better to store separately or not in this main DF.
                # For this exercise, let's print and maybe add to a summary
                print(f"  Top keywords for {bank_name}: {', '.join(top_keywords)}")
                # df.loc[bank_mask, 'keywords_bank'] = ', '.join(top_keywords) # This would repeat for all rows of the bank
            except ValueError as e: # Happens if all docs are empty after stopword removal etc.
                 print(f"  Could not extract keywords for {bank_name}: {e}")
        else:
            print(f"  Not enough documents to extract TF-IDF keywords for {bank_name}.")


    # Select relevant columns for saving
    # Keep original review_text and app_version etc. if they exist
    cols_to_save = [
        'review_id', 'review_text', 'cleaned_review_text', 'rating', 'date', 'bank_name', 'source',
        'user_name', 'thumbs_up_count', 'app_version', # From scraper
        'sentiment_label', 'sentiment_score_model', 'sentiment_numeric',
        'nlp_processed_text', 'themes_str' # 'identified_themes' is list, 'themes_str' is string
    ]
    final_df_cols = [col for col in cols_to_save if col in df.columns]
    df_analyzed = df[final_df_cols]

    df_analyzed.to_csv(analyzed_file_path, index=False, encoding='utf-8')
    print(f"\nAnalyzed data with sentiment and themes saved to {analyzed_file_path}")

if __name__ == "__main__":
    run_analysis()