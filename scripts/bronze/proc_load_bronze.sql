CREATE OR ALTER PROCEDURE bronze.load_bronze AS
BEGIN
	BEGIN TRY
		PRINT '============================';
		PRINT 'Loading bronze layer';
		PRINT '============================';

		PRINT 'Loading CRM Tables';
		SET DATEFORMAT dmy;
		TRUNCATE TABLE bronze.crm_cust_info;
		BULK INSERT bronze.crm_cust_info
		FROM 'D:\Learning\DW\datasets\source_crm\cust_info.csv'
		WITH (
			FIRSTROW = 2,
			FIELDTERMINATOR=',',
			TABLOCK
		);

		TRUNCATE TABLE bronze.crm_prd_info;
		BULK INSERT bronze.crm_prd_info
		FROM 'D:\Learning\DW\datasets\source_crm\prd_info.csv'
		WITH (
			FIRSTROW = 2,
			FIELDTERMINATOR=',',
			TABLOCK
		);

		TRUNCATE TABLE bronze.crm_sales_details;
		BULK INSERT bronze.crm_sales_details
		FROM 'D:\Learning\DW\datasets\source_crm\sales_details.csv'
		WITH (
			FIRSTROW = 2,
			FIELDTERMINATOR=',',
			TABLOCK
		);

		PRINT 'Loading ERP Tables';
		TRUNCATE TABLE bronze.erp_cust_az12;
		BULK INSERT bronze.erp_cust_az12
		FROM 'D:\Learning\DW\datasets\source_erp\cust_az12.csv'
		WITH (
			FIRSTROW = 2,
			FIELDTERMINATOR=',',
			TABLOCK
		);

		TRUNCATE TABLE bronze.erp_loc_a101;
		BULK INSERT bronze.erp_loc_a101
		FROM 'D:\Learning\DW\datasets\source_erp\loc_a101.csv'
		WITH (
			FIRSTROW = 2,
			FIELDTERMINATOR=',',
			TABLOCK
		);

		TRUNCATE TABLE bronze.erp_px_cat_g1v2;
		BULK INSERT bronze.erp_px_cat_g1v2
		FROM 'D:\Learning\DW\datasets\source_erp\px_cat_g1v2.csv'
		WITH (
			FIRSTROW = 2,
			FIELDTERMINATOR=',',
			TABLOCK
		);
	END TRY
	BEGIN CATCH
		PRINT '==================================';
		PRINT 'Error occured during loading BRONZE layer';
		PRINT 'Error Message' + ERROR_MESSAGE() + CAST(ERROR_NUMBER() AS NVARCHAR);
		PRINT 'Error Message' + ERROR_MESSAGE() + CAST(ERROR_STATE() AS NVARCHAR);
		PRINT '==================================';
	END CATCH
END
