Setup and Installation
Follow these steps to set up the project environment:

Clone the Repository:

git clone https://github.com/Fentahun022/fintech_reviews_omega_week2.git
cd fintech_reviews_omega_week2

Create and Activate a Virtual Environment: It's highly recommended to use a virtual environment to manage project dependencies.

# For Unix/macOS
python3 -m venv venv
source venv/bin/activate

# For Windows
python -m venv venv
.\venv\Scripts\activate
Install Dependencies: Install all required Python packages listed in requirements.txt.

pip install -r requirements.txt

---

### Task 3: Database Integration (PostgreSQL)

This project uses a PostgreSQL database to persistently store all cleaned and analyzed review data. The database schema is designed to be relational, separating bank information from review data for efficiency and scalability.

**Schema:**
The database consists of two primary tables:
-   `BANKS`: Stores unique bank information (`bank_id`, `bank_name`).
-   `REVIEWS`: Stores all review data, linked to the `BANKS` table via a `bank_id` foreign key.
The complete schema is defined in `sql/schema.sql`.

**Setup and Execution:**

1.  **Prerequisites:** Ensure you have PostgreSQL installed and have created a database (e.g., `bank_reviews`). Update the connection details in `config.py`.
2.  **Install Driver:** Install the necessary Python driver:
    ```bash
    pip install psycopg2-binary
    ```
3.  **Create Tables:** Connect to your database and run the `sql/schema.sql` script to create the `BANKS` and `REVIEWS` tables.
4.  **Run the Loader Script:** Execute the data loading script from the project root. This script is idempotent, meaning it can be run multiple times without creating duplicate entries.
    ```bash
    python scripts/db_loader.py
    ```

**Verification:**
To verify that the data has been loaded successfully, you can run the following SQL query:
```sql
SELECT COUNT(*) FROM REVIEWS;