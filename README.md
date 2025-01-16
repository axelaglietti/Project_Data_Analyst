# Customer Analytics SQL Project

This project focuses on analyzing customer behavior and performance metrics using SQL. The datasets and SQL scripts provided are designed to explore insights into customer performance, shipment logs, advanced insights, and performance ratings. The primary aim is to deliver actionable insights for business decision-making.

---

## **Project Structure**

### Files

- **`ontime_insights.sql`**: SQL queries focused on analyzing on-time delivery.
- **`Ship_Log.sql`**: SQL queries to analyze shipping efficiency and weights relationship.
- **`advanced_insights.sql`**: Advanced queries to group shipments into high, medium, and low-risk categories based on factors like Weight_in_gms, Mode_of_Shipment, and Discount_offered
- **`Performance_ratings.sql`**: Analysis of customer performance ratings and related metrics.
- **`customer_analysis.sql`**: General customer analysis queries, including customer care effectivness.
- **`Train.sql`**: to fill the database.

---

## **Setup and Requirements**

### Prerequisites

1. **Database Management System**: Install any SQL-compatible database system (e.g., MySQL, PostgreSQL, SQLite).
2. **SQL Client**: Tools like DBeaver, MySQL Workbench, or pgAdmin for running SQL queries.
3. **Dataset**: The original dataset was sourced from Kaggle.
   - **Dataset Link**: [Kaggle Customer Analytics Dataset](https://www.kaggle.com/datasets/prachi13/customer-analytics/discussion).

### Steps to Set Up the Project

1. **Import SQL Files**:
   - Open your SQL client or command-line tool.
   - Execute the provided `.sql` files to create tables and populate data.
     ```bash
     sqlite3 customer_analytics.db < customer_analysis.sql
     ```

2. **Explore the Data**:
   - Use the SQL scripts to query the database and analyze results.

3. **Modify and Extend**:
   - Extend queries to suit your specific analysis needs.

---

## **Usage**

1. **Run Queries**:
   - Use the SQL files to gain insights from the customer analytics database.

2. **Examples**:
   - **On-time Insights**: Explore on-time delivery by using `ontime_insights.sql`.
   - **Shipping Analysis**: Analyze shipping efficiency and weights relationship by using `Ship_Log.sql`.
   - **Advanced Insights**: Clustering delivery risk from `advanced_insights.sql`.
   - **Performance Ratings**: Analyze customer satisfaction using `Performance_ratings.sql`.

3. **Visualization**:
   - Import results into visualization tools like Tableau or Power BI for dashboard creation.

---

## **Resources**

- **Original Dataset**: [Kaggle Customer Analytics Dataset](https://www.kaggle.com/datasets/prachi13/customer-analytics/discussion)

---

## **Contributors**

- Axel Aglietti Zampalla

---

## **License**

This project is shared under the [MIT License](https://opensource.org/licenses/MIT). You are free to use, modify, and distribute this project as long as proper attribution is given.

