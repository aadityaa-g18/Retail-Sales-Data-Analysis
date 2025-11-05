# 🧾 Sales Data Analysis — End-to-End Project

## 📌 Overview  
This project analyzes retail sales data to uncover business insights such as high and low-performing products, profit trends, and regional performance. The analysis involves data cleaning, transformation, and visualization to support data-driven decision-making.

---

## 🧠 Objective  
- To perform **Exploratory Data Analysis (EDA)** using **Pandas** and **PostgreSQL**.  
- To identify **top-performing and underperforming products** and regions.  
- To visualize insights using **Power BI** for actionable business recommendations.

---

## 🧰 Tools & Technologies Used  
| Category | Tools |
|-----------|--------|
| **Programming Language** | Python |
| **Libraries** | Pandas, Matplotlib |
| **Database** | PostgreSQL (pgAdmin4) |
| **Visualization** | Power BI |
| **Environment** | Jupyter Notebook / VS Code |
| **Dataset Source** | Self-created / Kaggle (Sales Data) |

---

## 📊 Dataset Information  
**File name:** `sales_data.csv`  
**Columns:**
- `order_id`
- `customer_name`
- `product`
- `quantity`
- `price`
- `order_date`
- `region`

**Sample Data:**
| order_id | customer_name | product | quantity | price | order_date | region |
|-----------|----------------|----------|-----------|--------|-------------|---------|
| 1001 | John Doe | Laptop | 1 | 55000 | 2024-12-01 | North |
| 1002 | Jane Smith | Mouse | 3 | 800 | 2024-12-02 | East |

---

## 🔍 Steps Involved  

### 1. **Data Collection**
- Downloaded dataset using **Kaggle API** into the local workspace.

### 2. **Data Cleaning (Python & Pandas)**
- Handled missing values and standardized product names.  
- Converted `order_date` to datetime format.  
- Derived new columns like `total_sales = quantity * price`.

### 3. **Data Storage (PostgreSQL)**
- Imported cleaned data into PostgreSQL using `psycopg2` / CSV import.  
- Performed SQL queries for:
  - Monthly sales trends  
  - Profit vs. region  
  - Low-performing products  

### 4. **Exploratory Data Analysis (EDA)**
- Used Pandas and Matplotlib for:
  - Sales distribution by region  
  - Top 10 products by revenue  
  - Profitability trends  

### 5. **Visualization (Power BI)**
- Connected PostgreSQL database to Power BI.  
- Built dashboards showing:
  - Total Revenue, Profit, and Quantity by Region  
  - Product-wise Performance  
  - Low-performing product segments  

---

## 📈 Key Insights  
- **Region-wise:** The **North region** generated the highest revenue, while **South region** had the lowest profit margin.  
- **Product-wise:** Products like **Laptops and Keyboards** were top performers, while **Mice and Accessories** had low sales and profit margins.  
- **Overall:** A 30% profit gap was observed between top and bottom-performing regions.

---

## 💡 Business Recommendations  
1. Focus marketing and discount campaigns in **low-performing regions** like the South.  
2. Reduce inventory or renegotiate vendor prices for **low-profit items** (e.g., accessories).  
3. Increase stock and marketing for **high-demand products** like Laptops and Keyboards.  
4. Explore **dynamic pricing** strategies to balance sales and profit margins.

---

## 📊 Results Summary  
| Metric | Value |
|---------|--------|
| Total Products Analyzed | 500+ |
| Total Orders | 10,000+ |
| Profit Gap (High vs Low) | ~30% |
| Regions Covered | 4 (North, South, East, West) |

---

## 🧩 Project Highlights (For Resume)
- Automated dataset download using **Kaggle API**, performed **EDA** in Pandas, and visualized insights in **Power BI**.  
- Analyzed **10K+ sales records** and identified a **30% profit gap** across regions.  
- Recommended actionable business strategies to optimize product and regional performance.

---

## 📁 Repository Structure  
```
Sales-Data-Analysis/
│
├── sales_data.csv
├── data_cleaning.ipynb
├── eda_analysis.ipynb
├── powerbi_dashboard.pbix
├── README.md
└── requirements.txt
```

---

## 🚀 How to Run the Project  
1. Clone this repository  
   ```bash
   git clone https://github.com/yourusername/Sales-Data-Analysis.git
   cd Sales-Data-Analysis
   ```
2. Install dependencies  
   ```bash
   pip install -r requirements.txt
   ```
3. Run Jupyter Notebook  
   ```bash
   jupyter notebook
   ```
4. Open Power BI Dashboard (`powerbi_dashboard.pbix`) to view visual insights.

---

## 📬 Contact  
**Author:** Aditya G.  
**LinkedIn:** [Your LinkedIn Profile]  
**GitHub:** [https://github.com/yourusername](https://github.com/yourusername)
