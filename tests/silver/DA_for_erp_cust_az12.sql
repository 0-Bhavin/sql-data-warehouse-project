-- DATA CHECK

-- Out of range dates
SELECT *
FROM bronze.erp_cust_az12
WHERE bdate < '1924-01-01' OR bdate > GETDATE();

-- Data standardization & consistency
SELECT DISTINCT gen
FROM bronze.erp_cust_az12
