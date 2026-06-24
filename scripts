-- ============================================================================
-- 1. DATABASE CREATION ZONE
-- ============================================================================
USE master;
GO

-- Check if the database already exists before creating it
IF NOT EXISTS (SELECT 1 FROM sys.databases WHERE name = N'DataWarehouse')
BEGIN
    PRINT 'Creating database: DataWarehouse...';
    CREATE DATABASE DataWarehouse;
END
ELSE
BEGIN
    PRINT 'Database DataWarehouse already exists.';
END;
GO

-- Switch context to the target database
USE DataWarehouse;
GO

-- ============================================================================
-- 2. SCHEMA CREATION ZONE (Dynamic SQL prevents batch errors)
-- ============================================================================

-- Create BRONZE Schema if it doesn't exist
IF NOT EXISTS (SELECT 1 FROM sys.schemas WHERE name = N'bronze')
BEGIN
    PRINT 'Creating schema: bronze...';
    EXEC('CREATE SCHEMA bronze;');
END
ELSE
BEGIN
    PRINT 'Schema bronze already exists.';
END;
GO

-- Create SILVER Schema if it doesn't exist
IF NOT EXISTS (SELECT 1 FROM sys.schemas WHERE name = N'silver')
BEGIN
    PRINT 'Creating schema: silver...';
    EXEC('CREATE SCHEMA silver;');
END
ELSE
BEGIN
    PRINT 'Schema silver already exists.';
END;
GO

-- Create GOLD Schema if it doesn't exist
IF NOT EXISTS (SELECT 1 FROM sys.schemas WHERE name = N'gold')
BEGIN
    PRINT 'Creating schema: gold...';
    EXEC('CREATE SCHEMA gold;');
END
ELSE
BEGIN
    PRINT 'Schema gold already exists.';
END;
GO

PRINT 'Medallion Architecture initialization script completed successfully.';
GO
