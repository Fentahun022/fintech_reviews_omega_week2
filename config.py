
APP_IDS = {
    "CBE": "com.combanketh.mobilebanking",
    "BOA": "com.boa.boaMobileBanking",
    "Dashen": "com.dashen.dashensuperapp",
    "ENAT": "com.enatbankeuthopialive"  
}

# Optional: Mapping for proper bank names if not handled elsewhere
APP_NAMES = {
    "CBE": "Commercial Bank of Ethiopia",
    "BOA": "Bank of Abyssinia",
    "Dashen": "Dashen Bank",
    "ENAT": "Enat Bank"  
}

MIN_REVIEWS_PER_APP = 400 # As per challenge: 400 reviews per bank
SOURCE_NAME = "Google Play"

# --- NLP Configuration ---
SENTIMENT_MODEL_NAME = "distilbert-base-uncased-finetuned-sst-2-english"

# --- Database Configuration ---
# Option 1: Oracle (ensure oracledb is installed)
ORACLE_DB_CONFIG = {
    "user": "your_oracle_username",
    "password": "your_oracle_password",
    "dsn": "localhost:1521/XE"
}

# Option 2: PostgreSQL (ensure psycopg2-binary is installed)
POSTGRES_DB_CONFIG = {
    "dbname": "bank_reviews",
    "user": "your_postgres_user",
    "password": "your_postgres_password",
    "host": "localhost",
    "port": "5432"
}
# Choose which DB config to use in db_loader.py, or add logic to select
ACTIVE_DB_CONFIG = ORACLE_DB_CONFIG # or POSTGRES_DB_CONFIG
DB_TYPE = "ORACLE" # or "POSTGRES"


# --- Directory Paths ---
RAW_DATA_DIR = "data/raw/"
PROCESSED_DATA_DIR = "data/processed/"
VISUALIZATIONS_DIR = "visualizations/"
REPORTS_DIR = "reports/"
SQL_DIR = "sql/"
LOG_DIR = "logs/"

# --- Thematic Analysis Keywords ---
THEMES_KEYWORDS = {
    'Account Access Issues': ['login', 'password', 'signin', 'access', 'unable', 'lock', 'verification', 'otp', 'authenticate', 'register', 'locked out'],
    'Transaction Performance': ['transfer', 'slow', 'fast', 'quick', 'delay', 'pending', 'transaction', 'payment', 'send', 'receive', 'fee', 'charge', 'limit', 'failed', 'successful', 'stuck'],
    'User Interface & Experience': ['ui', 'ux', 'interface', 'design', 'look', 'feel', 'easy', 'simple', 'confusing', 'difficult', 'navigate', 'navigation', 'intuitive', 'layout', 'clunky', 'modern', 'outdated', 'user friendly', 'hard to use'],
    'Bugs & Reliability': ['bug', 'error', 'crash', 'issue', 'problem', 'fix', 'work', 'broken', 'glitch', 'freeze', 'stable', 'reliable', 'unavailable', 'maintenance', 'not working', 'keeps stopping'],
    'Customer Support': ['support', 'customer service', 'help', 'contact', 'response', 'helpline', 'agent', 'call center', 'resolve', 'no response', 'helpful'],
    'Feature Requests': ['feature', 'add', 'wish', 'fingerprint', 'biometric', 'dark mode', 'notification', 'statement', 'loan', 'suggestion', 'integrate', 'option', 'update', 'new version', 'needs'],
    'Security Concerns': ['security', 'secure', 'fraud', 'safe', 'hack', 'vulnerable', 'trust', 'privacy'],
    'App Speed & Performance': ['slow', 'loading', 'performance', 'speed', 'lag', 'responsive', 'optimize', 'takes time', 'efficient']
}