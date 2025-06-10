
import matplotlib.pyplot as plt
import seaborn as sns
from wordcloud import WordCloud
import os

def setup_plotting_style():
    """Sets a consistent style for all plots."""
    sns.set_style("whitegrid")
    plt.rcParams['figure.figsize'] = (12, 7)
    plt.rcParams['font.size'] = 12

def plot_sentiment_distribution(df, save_path):
    """Plots and saves the sentiment distribution by bank."""
    plt.figure()
    order = df['bank_name'].value_counts().index
    sns.countplot(data=df, x='bank_name', hue='sentiment_label', order=order,
                  palette={'POSITIVE': '#2ca02c', 'NEGATIVE': '#d62728', 'NEUTRAL': '#8c564b'})
    plt.title('Sentiment Distribution by Bank', fontsize=16, fontweight='bold')
    plt.xlabel('Bank Name'); plt.ylabel('Number of Reviews')
    plt.legend(title='Sentiment'); plt.xticks(rotation=15, ha="right"); plt.tight_layout()
    plt.savefig(os.path.join(save_path, "1_sentiment_distribution_by_bank.png"))
    plt.close()

def plot_top_themes(df, sentiment, top_n, save_path):
    """Plots the top N themes for a given sentiment (pain points or drivers)."""
    if sentiment == 'NEGATIVE':
        title, palette, filename = f'Top {top_n} Pain Points', 'Reds_r', "2_top_pain_points.png"
    else:
        title, palette, filename = f'Top {top_n} Satisfaction Drivers', 'Greens_r', "3_top_satisfaction_drivers.png"

    subset_df = df[df['sentiment_label'] == sentiment]
    themes = subset_df['themes_str'].str.split(', ').explode()
    top_themes = themes[themes != 'General Feedback'].value_counts().nlargest(top_n)
    
    plt.figure()
    sns.barplot(x=top_themes.values, y=top_themes.index, palette=palette)
    plt.title(title, fontsize=16, fontweight='bold')
    plt.xlabel(f'Number of Mentions in {sentiment.title()} Reviews'); plt.ylabel('Theme')
    plt.tight_layout()
    plt.savefig(os.path.join(save_path, filename))
    plt.close()

def create_wordcloud(df, bank_name, sentiment, save_path):
    """Generates and saves a word cloud for a specific bank and sentiment."""
    text_data = " ".join(review for review in df[(df['bank_name'] == bank_name) & (df['sentiment_label'] == sentiment)]['nlp_processed_text'] if review)
    
    if not text_data: return

    wordcloud = WordCloud(width=800, height=400, background_color='white', colormap='Reds').generate(text_data)
    plt.figure(figsize=(15, 8))
    plt.imshow(wordcloud, interpolation='bilinear'); plt.axis("off")
    plt.title(f'Word Cloud of Pain Points for {bank_name}', fontsize=16, fontweight='bold')
    plt.tight_layout()
    plt.savefig(os.path.join(save_path, f"4_wordcloud_{bank_name.replace(' ', '_')}.png"))
    plt.close()