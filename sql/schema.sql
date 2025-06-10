
DROP TABLE IF EXISTS REVIEWS CASCADE;
DROP TABLE IF EXISTS BANKS CASCADE;

-- Create the BANKS table for unique bank information
CREATE TABLE BANKS (
    bank_id SERIAL PRIMARY KEY,
    bank_name VARCHAR(100) NOT NULL UNIQUE
);

-- Create the REVIEWS table to store all processed review data
CREATE TABLE REVIEWS (
    review_id VARCHAR(255) PRIMARY KEY,
    bank_id INTEGER NOT NULL,
    review_text TEXT,
    rating INT NOT NULL,
    review_date DATE NOT NULL,
    sentiment_label VARCHAR(20),
    sentiment_score NUMERIC(10, 9),
    themes VARCHAR(500),
    CONSTRAINT fk_bank
        FOREIGN KEY (bank_id)
        REFERENCES BANKS(bank_id)
);

COMMENT ON TABLE BANKS IS 'Stores unique information about the mobile banking applications.';
COMMENT ON COLUMN REVIEWS.review_text IS 'The original, unprocessed user review text.';