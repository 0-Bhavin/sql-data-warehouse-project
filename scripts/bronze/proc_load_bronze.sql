/*
Stores Procedure: Load Bronze Layer (source -> Layer)

Script Purpose:
    - This Stored Procedure loads date into the 'bronze' schema from external CSV files.
    - It performs following tasks: 1. Truncates the bronze tables before loading.
                                   2. Uses the BULK INSERT command to load date from csv Files to bronze tables.

Parameters: 
    None.
    Thie Stored Procedure does not accept or return any parameters/

Usage Example: 
  EXEC bronze.load_bronze;
*/

CREATE OR ALTER PROCEDURE bronze.load_bronze AS
BEGIN
	DECLARE @start_time DATETIME, @end_time DATETIME;
	DECLARE @bronze_start_time DATETIME, @bronze_end_time DATETIME;
	
	BEGIN TRY
		SET @bronze_start_time = GETDATE();
		PRINT '======================================';
		PRINT 'Loading Bronze Layer';
		PRINT '======================================';

		PRINT '--------------------------------------';
		PRINT 'Loading CRM Tables';
		PRINT '--------------------------------------';

		SET @start_time = GETDATE();
		PRINT 'TRUNCATING Table: bronze.crm_cust_info';
		TRUNCATE TABLE bronze.crm_cust_info;
		PRINT 'INSERTING Data into: bronze.crm_cust_info'
		BULK INSERT bronze.crm_cust_info
		FROM 'C:\Users\praja\Desktop\Data Warehouse\sql-data-warehouse-project-main\01_datasets\source_crm\cust_info.csv'
		WITH (
			FIRSTROW = 2,
			FIELDTERMINATOR = ',',
			TABLOCK
		);
		SET @end_time = GETDATE();
		PRINT 'Load Duration:'+ CAST(DATEDIFF(second, @start_time, @end_time) AS NVARCHAR) + ' seconds';
		PRINT '------------------';
		--SELECT COUNT(*) FROM bronze.crm_cust_info;

		SET @start_time = GETDATE();
		PRINT 'TRUNCATING Table: bronze.crm_prd_info';
		TRUNCATE TABLE bronze.crm_prd_info;
		PRINT 'INSERTING Data into: bronze.crm_prd_info'
		BULK INSERT bronze.crm_prd_info
		FROM 'C:\Users\praja\Desktop\Data Warehouse\sql-data-warehouse-project-main\01_datasets\source_crm\prd_info.csv'
		WITH (
			FIRSTROW = 2,
			FIELDTERMINATOR = ',',
			TABLOCK
		);
		SET @end_time = GETDATE();
		PRINT 'Load Duration:'+ CAST(DATEDIFF(second, @start_time, @end_time) AS NVARCHAR) + ' seconds';
		PRINT '------------------';
		--SELECT COUNT(*) FROM bronze.crm_prd_info;

		SET @start_time = GETDATE();
		PRINT 'TRUNCATING Table: bronze.crm_sales_details';
		TRUNCATE TABLE bronze.crm_sales_details;
		PRINT 'INSERTING Data into: bronze.crm_sales_details'
		BULK INSERT bronze.crm_sales_details
		FROM 'C:\Users\praja\Desktop\Data Warehouse\sql-data-warehouse-project-main\01_datasets\source_crm\sales_details.csv'
		WITH (
			FIRSTROW = 2,
			FIELDTERMINATOR = ',',
			TABLOCK
		);
		SET @end_time = GETDATE();
		PRINT 'Load Duration:'+ CAST(DATEDIFF(second, @start_time, @end_time) AS NVARCHAR) + ' seconds';
		PRINT '------------------';
		--SELECT COUNT(*) FROM bronze.crm_sales_details;

		PRINT '--------------------------------------';
		PRINT 'Loading ERP Tables';
		PRINT '--------------------------------------';

		SET @start_time = GETDATE();
		PRINT 'TRUNCATING Table: bronze.erp_cust_az12';
		TRUNCATE TABLE bronze.erp_cust_az12;
		PRINT 'INSERTING Data into: bronze.erp_cust_az12'
		BULK INSERT bronze.erp_cust_az12
		FROM 'C:\Users\praja\Desktop\Data Warehouse\sql-data-warehouse-project-main\01_datasets\source_erp\CUST_AZ12.csv'
		WITH (
			FIRSTROW = 2,
			FIELDTERMINATOR = ',',
			TABLOCK
		);
		SET @end_time = GETDATE();
		PRINT 'Load Duration:'+ CAST(DATEDIFF(second, @start_time, @end_time) AS NVARCHAR) + ' seconds';
		PRINT '------------------';
		--SELECT COUNT(*) FROM bronze.erp_cust_az12;

		SET @start_time = GETDATE();
		PRINT 'TRUNCATING Table: bronze.erp_cust_az12';
		TRUNCATE TABLE bronze.erp_loc_a101;
		PRINT 'INSERTING Data into: bronze.erp_cust_az12'
		BULK INSERT bronze.erp_loc_a101
		FROM 'C:\Users\praja\Desktop\Data Warehouse\sql-data-warehouse-project-main\01_datasets\source_erp\LOC_A101.csv'
		WITH (
			FIRSTROW = 2,
			FIELDTERMINATOR = ',',
			TABLOCK
		);
		SET @end_time = GETDATE();
		PRINT 'Load Duration:'+ CAST(DATEDIFF(second, @start_time, @end_time) AS NVARCHAR) + ' seconds';
		PRINT '------------------';
		--SELECT COUNT(*) FROM bronze.erp_loc_a101;

		SET @start_time = GETDATE();
		PRINT 'TRUNCATING Table: bronze.erp_cust_az12';
		TRUNCATE TABLE bronze.erp_px_cat_g1v2;
		PRINT 'INSERTING Data into: bronze.erp_cust_az12'
		BULK INSERT bronze.erp_px_cat_g1v2
		FROM 'C:\Users\praja\Desktop\Data Warehouse\sql-data-warehouse-project-main\01_datasets\source_erp\PX_CAT_G1V2.csv'
		WITH (
			FIRSTROW = 2,
			FIELDTERMINATOR = ',',
			TABLOCK
		);
		SET @end_time = GETDATE();
		PRINT 'Load Duration:'+ CAST(DATEDIFF(second, @start_time, @end_time) AS NVARCHAR) + ' seconds';
		PRINT '------------------';
		--SELECT COUNT(*) FROM bronze.erp_px_cat_g1v2;

		SET @bronze_end_time = GETDATE();
		PRINT 'Load Duration for bronze layer:'+ CAST(DATEDIFF(second, @bronze_start_time, @bronze_end_time) AS NVARCHAR) + ' seconds';
	END TRY
	
	BEGIN CATCH
		PRINT '======================================';
		PRINT 'Error Occured during loading bronze layer';
		PRINT 'Error Message' + ERROR_MESSAGE();
		PRINT 'Error Number' + CAST(ERROR_NUMBER() AS NVARCHAR);
		PRINT 'Error State' + CAST(ERROR_STATE() AS NVARCHAR);
		PRINT '======================================';
	END CATCH
END
