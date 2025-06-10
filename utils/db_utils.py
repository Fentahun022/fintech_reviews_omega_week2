# utils/db_utils.py
import psycopg2
import pandas as pd
from psycopg2.extras import execute_values

def get_db_connection(db_config):
    """Establishes and returns a connection to the PostgreSQL database."""
    try:
        connection = psycopg2.connect(**db_config)
        print("✅ PostgreSQL database connection successful!")
        return connection
    except Exception as e:
        print(f"❌ PostgreSQL database connection failed: {e}")
        return None

def populate_banks_table(cursor, unique_banks):
    """Inserts unique bank names and returns a name-to-ID map."""
    bank_id_map = {}
    print("Populating BANKS table...")
    for bank_name in unique_banks:
        cursor.execute("SELECT bank_id FROM BANKS WHERE bank_name = %s", (bank_name,))
        result = cursor.fetchone()
        if result:
            bank_id = result[0]
        else:
            cursor.execute("INSERT INTO BANKS (bank_name) VALUES (%s) RETURNING bank_id", (bank_name,))
            bank_id = cursor.fetchone()[0]
        bank_id_map[bank_name] = bank_id
    return bank_id_map

def populate_reviews_table(cursor, df, bank_id_map):
    """Prepares and inserts review data into the REVIEWS table. Handles conflicts gracefully."""
    print(f"\nPreparing to insert {len(df)} reviews into REVIEWS table...")
    df['bank_id'] = df['bank_name'].map(bank_id_map)
    df['review_date'] = pd.to_datetime(df['date'])

    # Prepare data, ensuring no NaN values in text fields
    reviews_to_insert = list(df[[
        'review_id', 'bank_id', 'review_text', 'rating', 'review_date',
        'sentiment_label', 'sentiment_score_model', 'themes_str'
    ]].itertuples(index=False, name=None))
    
    # This query is robust: it will not fail if a review_id already exists.
    query = """
        INSERT INTO REVIEWS (review_id, bank_id, review_text, rating, review_date, 
                             sentiment_label, sentiment_score, themes)
        VALUES %s 
        ON CONFLICT (review_id) DO NOTHING
    """
    execute_values(cursor, query, reviews_to_insert)
    
    # cursor.rowcount will tell you how many rows were actually inserted in the last operation
    return cursor.rowcount