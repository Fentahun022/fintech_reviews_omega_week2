
import pandas as pd
import os
import sys
project_root = os.path.abspath(os.path.join(os.path.dirname(__file__), '..', '..'))
sys.path.append(project_root)
# ----------------------------------------------------------------

import config
from utils.db_utils import get_db_connection, populate_banks_table, populate_reviews_table

def main():
    print("--- Starting Database Loading Process (Task 3) ---")
    
    analyzed_file_path = os.path.join(config.PROCESSED_DATA_DIR, "all_banks_reviews_analyzed.csv")

    if not os.path.exists(analyzed_file_path):
        print(f"❌ Analyzed data file not found: {analyzed_file_path}")
        return

    df = pd.read_csv(analyzed_file_path).fillna({'review_text': '', 'themes_str': ''})
    print(f"Loaded {len(df)} analyzed reviews from CSV.")

    connection = get_db_connection(config.ACTIVE_DB_CONFIG)
    if connection:
        try:
            with connection.cursor() as cursor:
                bank_id_map = populate_banks_table(cursor, df['bank_name'].unique())
                num_inserted = populate_reviews_table(cursor, df, bank_id_map)
                connection.commit()
                print(f"\n✅ Finished. Inserted or updated {num_inserted} records in the REVIEWS table.")
                print("✅ KPI Met: Working connection + insert script.")
                if len(df) > 1000:
                    print("✅ KPI Met: Table populated with >1,000 entries.")
        except Exception as e:
            print(f"❌ An error occurred: {e}")
            connection.rollback()
        finally:
            connection.close()
            print("\nDatabase connection closed.")
    
if __name__ == "__main__":
    main()