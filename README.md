# Customer Churn Analysis Dashboard

## Project Overview

This project focuses on analyzing customer churn data to understand why customers leave, which customer segments have higher churn, and how customer characteristics affect revenue and retention.

I built the project as an end-to-end data analytics workflow, starting with an unclean Excel dataset and taking it through data cleaning, feature engineering, SQL analysis, and Power BI visualization.

The final output is an interactive Power BI Customer Churn Dashboard that allows users to explore customer behavior using different filters and visualizations.

## Project Objectives

The main objectives of this project were to:

- Clean and prepare an unstructured customer churn dataset.
- Identify and handle missing and duplicate values.
- Standardize inconsistent categorical values.
- Perform feature engineering to create useful analytical features.
- Store and analyze the cleaned data using MySQL.
- Use SQL queries to extract meaningful business insights.
- Build an interactive Power BI dashboard.
- Analyze churn across different customer segments.
- Understand the relationship between customer tenure, charges, contract type, subscription type, and churn.

## Project Workflow

```
Excel (Unclean Churn Data)
          ↓
Python / Pandas
          ↓
Data Cleaning
          ↓
Feature Engineering
          ↓
Clean Dataset
          ↓
MySQL Database
          ↓
SQL Analysis
          ↓
Power BI Dashboard
```

## Tools & Technologies

| Tool | Purpose |
|------|---------|
| Python | Data cleaning and preprocessing |
| Pandas | Data manipulation and transformation |
| NumPy | Numerical operations and feature creation |
| Excel | Initial data source |
| MySQL | Database storage and SQL analysis |
| SQL | Business analysis and data exploration |
| Power BI | Interactive dashboard and visualization |

## 1. Data Cleaning using Python

I used Pandas and NumPy to clean and prepare the raw churn dataset.

### Initial Data Exploration

I first examined the dataset using:

- `head()`
- `info()`
- `describe()`
- `shape`

This helped me understand the structure, data types, and basic statistics of the dataset.

### Missing Values

I checked missing values using:

```python
df.isnull().sum()
```

Missing values were handled according to the respective column. For example:

- Missing `Tech_Support` → `"No"`
- Missing `Payment_Method` → `"Unknown"`
- Missing numerical values → column mean

### Duplicate Records

I checked for duplicate records and removed them before continuing with the analysis.

```python
df.duplicated().sum()
df.drop_duplicates(inplace=True)
```

### Standardizing Dirty Values

I replaced inconsistent representations such as:

- `N/A`
- `NULL`
- `""`
- `" "`

with proper missing values. I also removed unnecessary spaces from text columns.

### Text Standardization

Categorical columns such as:

- Customer Name
- State
- City
- Subscription Type
- Contract Type

were standardized into proper case.

### Churn Standardization

The original `Churn` column contained inconsistent values such as:

- `YES`, `Yes`, `yes`
- `NO`, `No`

I standardized these into:

- `Yes`
- `No`

### Data Validation

I also:

- Converted numerical columns into numeric format.
- Removed invalid age values.
- Removed negative charge values.
- Converted the interaction date into proper date format.

## ⚙️ 2. Feature Engineering

After cleaning the data, I created additional features to make the dataset more useful for analysis.

### Customer Value

```python
df["Customer_Value"] = df["Monthly_Charges"] * df["Tenure_Months"]
```

This provides an estimate of the customer's value based on monthly charges and tenure.

### Monthly Revenue

```python
df["Monthly_Revenue"] = df["Monthly_Charges"]
```

### Tenure Group

Customers were divided into tenure groups:

- 0–12
- 13–24
- 25–48
- 49–72

### Senior Citizen Flag

I created a flag based on customer age:

- Age >= 60 → `Senior`
- Age < 60 → `Adult`

### Churn Flag

I converted the churn category into a numerical flag:

- `Yes` → `1`
- `No` → `0`

This makes the churn variable easier to use in analysis and calculations.

## 3. MySQL Database

After completing the cleaning and feature engineering process, I exported the cleaned dataset and imported it into MySQL.

The cleaned data was stored in the `customer_churn` table.

This allowed me to perform SQL-based analysis on the processed dataset.

## 4. SQL Analysis

I used SQL to answer several business-oriented questions.

### Key Analysis Performed

- Total number of customers
- Total number of churned customers
- Overall churn rate
- Average monthly charges
- Average customer tenure
- Churn by contract type
- Churn by internet service
- Churn by state
- Customers by payment method
- Customers by subscription type
- Highest revenue-generating states
- Average charges by contract type
- Senior citizen churn
- Top 10 high-value customers
- Customers without technical support

### Example

```sql
SELECT COUNT(*)
FROM customer_churn
WHERE Churn = 'Yes';
```

This query gives the total number of customers who churned.

## 5. Power BI Dashboard

The cleaned and analyzed data was then used to build an interactive Power BI dashboard.

### KPI Cards

The dashboard includes KPIs for:

- Total Customers
- Churn Customers
- Retained Customers
- Churn Rate %
- Total Revenue
- Average Monthly Charges
- Average Tenure

### Dashboard Visualizations

The dashboard contains:

- Churn by Contract Type
- Churn by Subscription Type
- Churn by State
- Monthly Charges vs Churn
- Revenue by State
- Internet Service Distribution
- Payment Method Distribution
- Senior Citizen vs Churn
- Tenure Group vs Churn
- Customer Value by Subscription

### Interactive Filters

The dashboard can be filtered using:

- State
- City
- Contract Type
- Subscription Type
- Internet Service
- Payment Method
- Senior Citizen
- Churn
- Tenure Group
- Last Interaction Date

## Key Business Questions

The dashboard was designed to help answer questions such as:

1. Which contract types have more churn?
2. Which subscription types have higher customer churn?
3. Which states contribute the most churn?
4. How does customer tenure relate to churn?
5. Does monthly charging behavior differ between churned and retained customers?
6. Which payment methods are most commonly used?
7. How does churn vary between senior and adult customers?
8. Which states generate the highest revenue?
9. Who are the highest-value customers?
10. Which customers do not have technical support?

## Project Structure

```
Customer-Churn-Analysis/
│
├── Data/
│   ├── Churn_Unclean_Project.xlsx
│   ├── Clean_Churn_Data.xlsx
│   └── Clean_Churn_Data.csv
│
├── Python/
│   └── churn_analysis.ipynb
│
├── SQL/
│   └── churn_analysis.sql
│
├── PowerBI/
│   └── Customer_Churn_Dashboard.pbix
│
├── Images/
│   └── dashboard.png
│
└── README.md
```

## Project Outcome

This project gave me hands-on experience in building an end-to-end data analytics solution.

Instead of directly creating a dashboard from raw data, I followed a complete workflow:

**Data Collection → Data Cleaning → Feature Engineering → Database → SQL Analysis → Visualization**

The final Power BI dashboard provides an interactive way to explore customer churn, retention, revenue, and customer behavior.

## Skills Demonstrated

- Python
- Pandas
- NumPy
- Data Cleaning
- Data Preprocessing
- Feature Engineering
- SQL
- MySQL
- Power BI
- DAX
- Data Visualization
- Business Analysis
- Dashboard Development

## Author

**Abhijeet Raj**
B.Tech — Electrical & Electronics Engineering
IIIT Bhubaneswar

---

⭐ If you find this project useful, feel free to explore the repository and the dashboard.