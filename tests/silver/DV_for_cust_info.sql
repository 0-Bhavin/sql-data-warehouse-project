SELECT * FROM bronze.crm_cust_info;

-- chcSek for null or duplicate values in cust_id
-- Exceptation: no result
SELECT cst_id, COUNT(*) FROM silver.crm_cust_info
GROUP BY cst_id
HAVING COUNT(*) > 1;

-- check for unwanted spaces
-- Expectation: no result
SELECT cst_firstname
FROM silver.crm_cust_info
WHERE cst_firstname != TRIM(cst_firstname);

-- Data Standardization & Consistency
SELECT DISTINCT cst_gndr
FROM silver.crm_cust_info;

SELECT DISTINCT cst_martial_status
FROM silver.crm_cust_info;