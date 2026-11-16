-- DATA TRANSFORMAITON FOR erp_loc_a101
INSERT INTO silver.erp_loc_a101 (cid, cntry)
SELECT 
	REPLACE(cid, '-', '') AS cid, 
	CASE WHEN TRIM(cntry) = 'DE' THEN 'Germany'
		 WHEN TRIM(cntry) IN ('US', 'USA') THEN 'United States'
		 WHEN TRIM(cntry) = '' OR cntry IS NULL THEN 'n/a'
	ELSE TRIM(cntry)
	END	cntry 
FROM bronze.erp_loc_a101;



-- Data Check
-- Distinct value of country
SELECT DISTINCT cntry
FROM bronze.erp_loc_a101;

SELECT * FROM silver.erp_loc_a101;