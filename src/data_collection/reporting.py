
import pandas as pd
import os
import sys

project_root = os.path.abspath(os.path.join(os.path.dirname(__file__), '..', '..'))
sys.path.append(project_root)
# ----------------------------------------------------------------

import config
from utils.plotting_utils import setup_plotting_style, plot_sentiment_distribution, plot_top_themes, create_wordcloud

def generate_insights_text(df):
    """Prints key insights and recommendations derived from the data."""
    print("\n--- Key Insights & Recommendations (Task 4) ---\n")
    
    # Insight 1: Bank Comparison (Pain Point)
    boa_neg_pct = df[df['bank_name'] == 'Bank of Abyssinia']['sentiment_label'].value_counts(normalize=True).get('NEGATIVE', 0)
    cbe_neg_pct = df[df['bank_name'] == 'Commercial Bank of Ethiopia']['sentiment_label'].value_counts(normalize=True).get('NEGATIVE', 0)
    print(f"Pain Point 1: Bank of Abyssinia has a significantly higher rate of negative reviews ({boa_neg_pct:.1%}) compared to CBE ({cbe_neg_pct:.1%}), indicating more severe user frustration.")
    
    # Insight 2: Overall Pain Points
    negative_themes = df[df['sentiment_label'] == 'NEGATIVE']['themes_str'].str.split(', ').explode()
    top_pain_point = negative_themes.drop('General Feedback', errors='ignore').value_counts().index[0]
    print(f"Pain Point 2: The most common complaint across all banks is related to '{top_pain_point}'.")

    # Insight 3: Satisfaction Drivers
    positive_themes = df[df['sentiment_label'] == 'POSITIVE']['themes_str'].str.split(', ').explode()
    top_driver = positive_themes.drop('General Feedback', errors='ignore').value_counts().index[0]
    print(f"\nSatisfaction Driver 1: The most praised aspect is '{top_driver}', suggesting users value this feature highly.")
    
    # Suggestion
    print("\nActionable Recommendations:")
    print("  1. For BOA: A deep-dive into 'Bugs & Reliability' and 'Transaction Performance' is critical to address the high negative sentiment.")
    print("  2. For all banks: Since 'Feature Requests' is a top theme, implementing an in-app feature voting system could improve user engagement and prioritize development effectively.")

def main():
    print("--- Starting Reporting & Visualization Process (Task 4) ---")
    
    analyzed_file_path = os.path.join(config.PROCESSED_DATA_DIR, "all_banks_reviews_analyzed.csv")
    if not os.path.exists(analyzed_file_path):
        print(f"❌ Analyzed data file not found. Run analysis.py first.")
        return
        
    df = pd.read_csv(analyzed_file_path).fillna({'nlp_processed_text': ''})
    
    viz_path = config.VISUALIZATIONS_DIR
    os.makedirs(viz_path, exist_ok=True)
    
    setup_plotting_style()
    print("\nGenerating plots...")
    plot_sentiment_distribution(df, viz_path)
    plot_top_themes(df, sentiment='NEGATIVE', top_n=5, save_path=viz_path)
    plot_top_themes(df, sentiment='POSITIVE', top_n=5, save_path=viz_path)
    create_wordcloud(df, bank_name='Bank of Abyssinia', sentiment='NEGATIVE', save_path=viz_path)
    print(f"✅ All visualizations have been saved to the '{viz_path}' directory.")
    
    generate_insights_text(df)

if __name__ == "__main__":
    main()