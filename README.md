# QuickMart Retail Store Database

## Overview
This project is a simple relational database built for QuickMart, a retail store operating across several Nigerian cities. It was created as a SQL practice assignment covering database design, table creation, data insertion, querying, filtering, sorting, updating, deleting, and altering table structure.

The database stores information about **customers**, **products**, and **sales**, and models how these three entities relate to one another in a typical retail business.

## Database Structure

The database consists of three tables:

### `customers`
| Column | Type | Description |
|---|---|---|
| customer_id | INT (PK) | Unique identifier for each customer |
| customer_name | VARCHAR(100) | Customer's full name |
| email | VARCHAR(100) | Customer's email address (nullable) |
| city | VARCHAR(50) | City the customer resides in |
| phone_number | VARCHAR(20) | Customer's contact number |
| registration_date | DATE | Date the customer registered (added via ALTER TABLE) |

### `products`
| Column | Type | Description |
|---|---|---|
| product_id | INT (PK) | Unique identifier for each product |
| product_name | VARCHAR(100) | Name of the product |
| category | VARCHAR(50) | Product category (Electronics, Furniture, Accessories, Appliances) |
| unit_price | DECIMAL(12,2) | Price per unit in Naira |
| quantity_in_stock | INT | Number of units currently in stock |
| brand | VARCHAR(50) | Product brand (added via ALTER TABLE) |

### `sales`
| Column | Type | Description |
|---|---|---|
| sale_id | INT (PK) | Unique identifier for each sale |
| customer_id | INT (FK) | References `customers.customer_id` |
| product_id | INT (FK) | References `products.product_id` |
| quantity | INT | Number of units purchased |
| sale_date | DATE | Date the sale occurred |

## Entity Relationship

```
CUSTOMERS (1) ----< SALES >---- (1) PRODUCTS
```

- One customer can make many sales.
- One product can appear in many sales.
- `sales` is the junction table connecting customers to products, using `customer_id` and `product_id` as foreign keys.

## What the SQL File Covers

The `quickmart.sql` file is organized into clearly commented sections, in this order:

1. **Database design** — table creation with appropriate data types, primary keys, and foreign keys.
2. **Data insertion** — sample data for 8+ customers, 10 products, and 15+ sales across different cities, categories, and dates.
3. **Basic retrieval** — `SELECT` queries on all tables and specific columns.
4. **Filtering** — `WHERE`, `AND`/`OR`/`NOT`, `IN`, `BETWEEN`, `LIKE`, and `NULL` checks.
5. **Sorting & duplicates** — `DISTINCT`, `ORDER BY`, and `LIMIT`.
6. **Data modification** — `UPDATE` and `DELETE` statements, each preceded and followed by a `SELECT` to confirm the correct record was targeted before and after the change.
7. **Table alterations** — `ALTER TABLE` to add `registration_date` to customers and `brand` to products.
8. **Upsert** — an `INSERT ... ON CONFLICT DO UPDATE` statement (PostgreSQL syntax) demonstrating insert-or-update logic on a product.
9. **Final challenge queries** — five business-style questions answered without being given exact syntax, covering top-N results, multi-condition filters, sorting, and multi-column updates.

## Notes on Design Choices

- One customer (`customer_id = 9`) was added and then deleted purely to demonstrate a safe `DELETE`, since all original customers have related sales records and are protected by the foreign key constraint. In a real system, deleting a customer with existing sales would require deleting their sales records first (or using `ON DELETE CASCADE`).
- All `UPDATE` and `DELETE` statements follow a select-confirm-modify-confirm pattern to avoid accidentally modifying the wrong record.
- Prices are in Nigerian Naira (₦), reflecting product categories and price ranges typical of a Nigerian retail store.

## How to Run

1. Create the database: `CREATE DATABASE quickmart;`
2. Run `quickmart.sql` against the database using your SQL client (e.g. `psql`, pgAdmin, or DBeaver).
3. Run the queries section by section to see each result, or run the whole file at once.

## Tools Used

- PostgreSQL (syntax includes `ON CONFLICT` for the upsert task; adjust to `ON DUPLICATE KEY UPDATE` if using MySQL)

## Files in This Repository

- `quickmart.sql` — full SQL script (table creation, data, and all queries)
- `screenshots/` — screenshots of major query results
- `README.md` — this file
