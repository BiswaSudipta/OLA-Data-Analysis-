# 📊 **OLA Data Analysis Project – SQL + Power BI**

<p align="center">
  <img src="https://img.shields.io/badge/Tools-SQL%20%7C%20PowerBI%20%7C%20Excel-blueviolet?style=for-the-badge" />
  <img src="https://img.shields.io/badge/Domain-Data%20Analytics-green?style=for-the-badge" />
  <img src="https://img.shields.io/badge/Status-Completed-success?style=for-the-badge" />
</p>

Welcome to the **OLA Ride Booking Data Analysis Project**, where I analyzed a large dataset of ride bookings using **SQL** and built an interactive, multi-page **Power BI Dashboard** to uncover patterns in cancellations, ratings, customer behavior, vehicle performance, and revenue insights.

This end-to-end project demonstrates **data cleaning**, **SQL analysis**, **data modeling**, **visualization**, and **business decision-making**.

---

# 🚀 **Project Overview**

This project focuses on analyzing **OLA ride booking data** to answer key business questions such as:

* How many rides were successful?
* What vehicle type has the best performance?
* Revenue trends and payment method preference
* Cancellation patterns
* Customer & driver rating behaviors
* Top customers based on booking activity & revenue

The project is divided into:

### ✔ **SQL Analysis (10 Questions)**

### ✔ **5-Page Power BI Dashboard**

### ✔ **Dataset exploration with 19 columns**

### ✔ **Insights & Findings**

---

# 📁 **Repository Structure**

```
📦 OLA-Data-Analysis
│
├── 📂 Visualization_Images
│     ├── Overall.png
│     ├── Vehicle_Type.png
│     ├── Revenue.png
│     ├── Cancellation.png
│     └── Rating.png
│
├── 📂 Report & PPT
│     ├── Final_Report.pdf
│     └── Project_Presentation.pptx
│
├── Bookings.csv
├── Ola_Visualization.pbix
├── Query_for_analysis.sql
├── LICENSE
└── README.md
```

---

# 🛠 **Technologies Used**

| Tool                         | Purpose                        |
| ---------------------------- | ------------------------------ |
| **SQL (MySQL / PostgreSQL)** | Data cleaning & analysis       |
| **Power BI**                 | Interactive dashboard creation |
| **Excel / CSV**              | Raw dataset                    |
| **DAX**                      | For Power BI calculations      |
| **Views in SQL**             | For reusable analytics         |

---

# 📄 **Dataset Columns**

Your dataset contains **19 important fields**, including:

| Column Name                 | Description                   |
| --------------------------- | ----------------------------- |
| Date                        | Ride date                     |
| Time                        | Ride time                     |
| Booking_ID                  | Unique ID                     |
| Booking_Status              | Success / Cancelled           |
| Customer_ID                 | Unique customer               |
| Vehicle_Type                | Mini, Prime Sedan, Auto, etc. |
| Pickup_Location             | Starting point                |
| Drop_Location               | Destination                   |
| V_TAT                       | Vehicle Turnaround Time       |
| C_TAT                       | Customer Turnaround Time      |
| cancelled_Rides_by_Customer | Reason                        |
| cancelled_Rides_by_Driver   | Reason                        |
| Incomplete_Rides            | Yes / No                      |
| Incomplete_Rides_Reason     | Explanation                   |
| Booking_Value               | Revenue                       |
| Payment_Method              | UPI / Cash / Others           |
| Ride_Distance               | Distance in Km                |
| Driver_Ratings              | Driver performance            |
| Customer_Rating             | Customer behavior             |

---

# 🧠 **SQL Analysis – (10 Business Questions Answered)**

Here are the **actual SQL queries** used in this project, each wrapped inside a **VIEW** for easy reusability.

---

## ✅ **Q1. Retrieve all successful bookings**

```sql
CREATE OR REPLACE VIEW Successful_Bookings AS
SELECT *
FROM Bookings
WHERE Booking_Status = 'Success';
```

---

## ✅ **Q2. Average ride distance per vehicle type**

```sql
CREATE OR REPLACE VIEW ride_distance_for_each_vehicle AS
SELECT
    Vehicle_Type,
    AVG(Ride_Distance) AS avg_distance
FROM Bookings
GROUP BY Vehicle_Type;
```

---

## ✅ **Q3. Total cancelled rides by customers**

```sql
CREATE OR REPLACE VIEW cancel_ride_by_customers AS
SELECT COUNT(*)
FROM Bookings
WHERE Booking_Status = 'Canceled by Customer';
```

---

## ✅ **Q4. Top 5 customers by total ride bookings**

```sql
CREATE OR REPLACE VIEW Top_5_Customers AS
SELECT
    Customer_ID,
    COUNT(Booking_ID) AS total_rides
FROM Bookings
GROUP BY Customer_ID
ORDER BY total_rides DESC
LIMIT 5;
```

---

## ✅ **Q5. Rides cancelled by drivers (personal/car issues)**

```sql
CREATE OR REPLACE VIEW Ride_Cancelled_by_Drivers_P_C_Issues AS
SELECT
    COUNT(*) AS Ride_can_bydr
FROM Bookings
WHERE Canceled_Rides_by_Driver = 'Personal & Car related issue';
```

---

## ✅ **Q6. Max & Min driver ratings for Prime Sedan**

```sql
CREATE OR REPLACE VIEW Max_Min_Driver_rating AS
SELECT
    MAX(Driver_Ratings) AS max_rating,
    MIN(Driver_Ratings) AS min_rating
FROM Bookings
WHERE Vehicle_Type = 'Prime Sedan';
```

---

## ✅ **Q7. Fetch all UPI payments**

```sql
CREATE OR REPLACE VIEW UPI_Payment AS
SELECT *
FROM Bookings
WHERE Payment_Method = 'UPI';
```

---

## ✅ **Q8. Average customer rating per vehicle type**

```sql
CREATE OR REPLACE VIEW Avg_Cust_Ratings AS
SELECT
    Vehicle_Type,
    AVG(Customer_Rating) AS Avg_Cust_Rating
FROM Bookings
GROUP BY Vehicle_Type;
```

---

## ✅ **Q9. Total booking value of successful rides**

```sql
CREATE OR REPLACE VIEW Total_Successfull_Ride_Value AS
SELECT
    SUM(Booking_Value) AS Total_Bookings_Value
FROM Bookings
WHERE Booking_Status = 'Success';
```

---

## ✅ **Q10. Incomplete rides with reasons**

```sql
CREATE OR REPLACE VIEW Incomplete_Rides_Reason AS
SELECT
    Booking_ID,
    Incomplete_Rides_Reason
FROM Bookings
WHERE Incomplete_Rides = 'Yes';
```

---

# 📊 **Power BI Dashboard (5 Pages)**

Below are the visualizations included in the project.

## 🟦 **1. Overall Analysis**

<img src="Visualization Images/Overall.png" />

---

## 🚗 **2. Vehicle Type Analysis**

<img src="Visualization Images/Vehicle_Type.png" />

---

## 💰 **3. Revenue Insights**

<img src="Visualization Images/Revenue.png" />

---

## ❌ **4. Cancellation Analysis**

<img src="Visualization Images/Cancellation.png" />

---

## ⭐ **5. Rating Analysis**

<img src="Visualization Images/Rating.png" />

---

# 🔍 **Key Insights From Analysis**

### 📌 **Booking & Ride Trends**

* Majority of bookings were successful.
* Ride volume varies based on date/time patterns.

### 📌 **Vehicle Type Performance**

* Some vehicle types consistently receive better customer ratings.
* Prime Sedan shows the highest driver rating variation.

### 📌 **Cancellations**

* Most customer cancellations happen due to **change in plan or wait time**.
* Driver cancellations mainly due to **personal & car-related issues**.

### 📌 **Revenue**

* **UPI** & **Cash** dominate payment methods.
* Top 5 customers contribute a significant share of revenue.

### 📌 **Ratings**

* Customer ratings are more consistent than driver ratings.
* Sedans & Prime vehicles have better feedback compared to Autos.

---

# 📥 **Files Included**

| File                     | Description              |
| ------------------------ | ------------------------ |
| `Bookings.csv`           | Raw dataset              |
| `Query_for_analysis.sql` | All SQL queries          |
| `Ola_Visualization.pbix` | Power BI report file     |
| `LICENSE`                | Open-source license      |
| `Visualization_Images`   | Screenshots of dashboard |
| `Report & PPT`           | PDF + PowerPoint Report  |

---

# 📌 **Conclusion**

This project demonstrates the complete workflow of:

✔ Data Cleaning
✔ SQL-based Data Analysis
✔ Creating powerful insights using Power BI
✔ Understanding real-world ride-booking behavior


📌 Create a **GitHub Cover Image (banner)**
📌 Create a **Professional Project Summary for LinkedIn**
📌 Generate **README badges**, **GIF analytics**, or **extra dashboards**

# 🌐 **My Kaggle Profile**

You can view the full implementation on Kaggle:

<div align="left">

[![Kaggle Badge](https://img.shields.io/badge/Kaggle-View%20Notebook-blue?style=for-the-badge\&logo=kaggle)](https://www.kaggle.com/code/sudiptbiswas1)

</div>

---

# 🔗 **Connect With Me**

<div align="left">

[![LinkedIn Badge](https://img.shields.io/badge/LinkedIn-Sudipta%20Biswas-blue?style=for-the-badge\&logo=linkedin)](https://www.linkedin.com/in/sudipta-biswas-298915271/)

</div>

---

Just tell me!
