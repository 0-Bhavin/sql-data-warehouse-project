-- Data Analysis

-- check for nulls or duplicates in primary key
-- expectation:no result
SELECT prd_id, COUNT(*)
FROM bronze.crm_prd_info
GROUP BY prd_id
HAVING prd_id IS NULL OR COUNT(*) > 1;

-- check for unwanted space
-- expectation: no result
SELECT prd_nm
FROM bronze.crm_prd_info
WHERE TRIM(prd_nm) != prd_nm;

-- Check for NULL or Negative value
-- Expectation: no result
SELECT prd_cost
FROM bronze.crm_prd_info
WHERE prd_cost IS NULL OR prd_cost < 0;

-- check start date and end date
SELECT *
FROM bronze.crm_prd_info
WHERE prd_start_dt > prd_end_dt;