--*****************************************************
--	Billing Stored Procedures
--*****************************************************
--/**---------------------------------------------------------------------------------------
--/* Script			: crt_sp_billing.sql
--/* Author			: Sridevi Tadisetti  
--/* Product		: Infor SCE Suite 
--/* Component		: Billing - Version 12.7
--/* Date			: 18/06/2025        
--/* Description	: Script to create Stored Procedures for Billing
--/* RDBMS			: Postgresql
--/* Schema			: Billing
--/* Modification History:
--/*----------------------------------------------------------------------------------------
--/* Modified by	Date			Description    
--/*----------------------------------------------------------------------------------------
--/* 
--/*
--/*-----------------------------------------------------------------------------------------

 
 -- The query should be run at Postgresql with POSTGRES user

-- PROCEDURE: billadmin.billing_updatefacilityid(character varying, character varying)

-- DROP PROCEDURE IF EXISTS billadmin.billing_updatefacilityid(character varying, character varying);


CREATE OR REPLACE PROCEDURE billadmin.billing_updatefacilityid(IN oldwhseid character varying, IN newwhseid character varying)
 LANGUAGE plpgsql
 SECURITY DEFINER
AS $procedure$
BEGIN
UPDATE billadmin.BIC_USER_PROFILE P SET FACILITY_ID = NEWWHSEID 
WHERE P.FACILITY_ID = OLDWHSEID AND NOT EXISTS (SELECT 1 FROM billadmin.BIC_USER_PROFILE X 
WHERE P.USER_CODE = X.USER_CODE AND P.PROFILE_CODE = X.PROFILE_CODE AND X.FACILITY_ID = NEWWHSEID);
UPDATE billadmin.BIC_RPTSEND P SET FACILITY_ID = NEWWHSEID
WHERE P.FACILITY_ID = OLDWHSEID AND NOT EXISTS (SELECT 1 FROM billadmin.BIC_RPTSEND X 
WHERE P.REPORT_CODE = X.REPORT_CODE AND X.FACILITY_ID = NEWWHSEID);
UPDATE billadmin.BIC_REPORT P SET FACILITY_ID = NEWWHSEID  
WHERE P.FACILITY_ID = OLDWHSEID AND NOT EXISTS (SELECT 1 FROM billadmin.BIC_REPORT X 
WHERE P.REPORT_CODE = X.REPORT_CODE AND X.FACILITY_ID = NEWWHSEID);
UPDATE billadmin.BIC_RATE_GROUP P SET FACILITY_ID = NEWWHSEID
WHERE P.FACILITY_ID = OLDWHSEID AND NOT EXISTS (SELECT 1 FROM billadmin.BIC_RATE_GROUP X 
WHERE P.RATE_GROUP = X.RATE_GROUP AND X.FACILITY_ID = NEWWHSEID);
UPDATE billadmin.BIC_RATE P SET FACILITY_ID = NEWWHSEID 
WHERE P.FACILITY_ID = OLDWHSEID AND NOT EXISTS (SELECT 1 FROM billadmin.BIC_RATE X 
WHERE P.RATE_GROUP = X.RATE_GROUP AND X.FACILITY_ID = NEWWHSEID);
UPDATE billadmin.BIC_ORDER_HISTORY P SET FACILITY_ID = NEWWHSEID
WHERE P.FACILITY_ID = OLDWHSEID AND NOT EXISTS (SELECT 1 FROM billadmin.BIC_ORDER_HISTORY X 
WHERE P.ORDER_NO = X.ORDER_NO AND P.CUST_CODE = X.CUST_CODE AND P.ACTIVITY_ID = X.ACTIVITY_ID AND X.FACILITY_ID = NEWWHSEID);
UPDATE billadmin.BIC_ORDER_DETAIL P SET FACILITY_ID = NEWWHSEID
WHERE P.FACILITY_ID = OLDWHSEID AND NOT EXISTS (SELECT 1 FROM billadmin.BIC_ORDER_DETAIL X 
WHERE P.ORDER_NO = X.ORDER_NO AND P.CUST_CODE = X.CUST_CODE AND P.ACTIVITY_ID = X.ACTIVITY_ID AND X.FACILITY_ID = NEWWHSEID);
UPDATE billadmin.BIC_NONNEG_INV P SET FACILITY_ID = NEWWHSEID
WHERE P.FACILITY_ID = OLDWHSEID AND NOT EXISTS (SELECT 1 FROM billadmin.BIC_NONNEG_INV X 
WHERE P.BATCH_NO = X.BATCH_NO AND P.INVOICE_NO = X.INVOICE_NO AND X.FACILITY_ID = NEWWHSEID);
UPDATE billadmin.BIC_MIN P SET FACILITY_ID = NEWWHSEID
WHERE P.FACILITY_ID = OLDWHSEID AND NOT EXISTS (SELECT 1 FROM billadmin.BIC_MIN X 
WHERE P.MIN_LEVEL = X.MIN_LEVEL AND P.MIN_CHARGE_CODE = X.MIN_CHARGE_CODE AND X.FACILITY_ID = NEWWHSEID);
UPDATE billadmin.BIC_MARKDISC P SET FACILITY_ID = NEWWHSEID 
WHERE P.FACILITY_ID = OLDWHSEID AND NOT EXISTS (SELECT 1 FROM billadmin.BIC_MARKDISC X 
WHERE P.EFFECTIVE_DATE = X.EFFECTIVE_DATE AND P.EXPIRATION_DATE = X.EXPIRATION_DATE AND X.FACILITY_ID = NEWWHSEID);
INSERT into billadmin.BIC_LOC_GROUP (FACILITY_ID, LOC_GROUP, LOC_GROUP_DESC, ADDDATE, ADDWHO, EDITDATE, EDITWHO, REVISION_NUMBER)
SELECT NEWWHSEID AS FACILITY_ID, LOC_GROUP, LOC_GROUP_DESC, ADDDATE, ADDWHO, EDITDATE, EDITWHO, REVISION_NUMBER FROM billadmin.BIC_LOC_GROUP P
WHERE FACILITY_ID = OLDWHSEID AND NOT EXISTS (SELECT 1 FROM billadmin.BIC_LOC_GROUP X 
WHERE P.LOC_GROUP = X.LOC_GROUP AND X.FACILITY_ID = NEWWHSEID);
UPDATE billadmin.BIC_LOC_GRPKEY P SET FACILITY_ID = NEWWHSEID 
WHERE P.FACILITY_ID = OLDWHSEID AND NOT EXISTS (SELECT 1 FROM billadmin.BIC_LOC_GRPKEY X 
WHERE P.LOC_GROUP = X.LOC_GROUP AND P.LOC_CODE = X.LOC_CODE AND X.FACILITY_ID = NEWWHSEID);
UPDATE billadmin.BIC_INVOICE P SET FACILITY_ID = NEWWHSEID 
WHERE P.FACILITY_ID = OLDWHSEID AND NOT EXISTS (SELECT 1 FROM billadmin.BIC_INVOICE X 
WHERE P.INVOICE_NO = X.INVOICE_NO AND X.FACILITY_ID = NEWWHSEID);
UPDATE billadmin.BIC_INVENTORY P SET FACILITY_ID = NEWWHSEID 
WHERE P.FACILITY_ID = OLDWHSEID AND NOT EXISTS (SELECT 1 FROM billadmin.BIC_INVENTORY X 
WHERE P.CUST_CODE = X.CUST_CODE AND P.ITEM = X.ITEM AND P.LOT_CODE = X.LOT_CODE AND X.FACILITY_ID = NEWWHSEID);
UPDATE billadmin.BIC_HOLIDAY P SET FACILITY_ID = NEWWHSEID 
WHERE P.FACILITY_ID = OLDWHSEID AND NOT EXISTS (SELECT 1 FROM billadmin.BIC_HOLIDAY X 
WHERE P.HOLIDAY_DATE = X.HOLIDAY_DATE AND X.FACILITY_ID = NEWWHSEID);
UPDATE billadmin.BIC_COST P SET FACILITY_ID = NEWWHSEID
WHERE P.FACILITY_ID = OLDWHSEID AND NOT EXISTS (SELECT 1 FROM billadmin.BIC_COST X 
WHERE P.COST_NO = X.COST_NO AND X.FACILITY_ID = NEWWHSEID);
UPDATE billadmin.BIC_COST_DIST P SET FACILITY_ID = NEWWHSEID 
WHERE P.FACILITY_ID = OLDWHSEID AND NOT EXISTS (SELECT 1 FROM billadmin.BIC_COST_DIST X 
WHERE P.COST_NO = X.COST_NO AND X.FACILITY_ID = NEWWHSEID);
UPDATE billadmin.BIC_CONTRACT_DET P SET FACILITY_ID = NEWWHSEID 
WHERE P.FACILITY_ID = OLDWHSEID AND NOT EXISTS (SELECT 1 FROM billadmin.BIC_CONTRACT_DET X 
WHERE P.CONTRACT_KEY = X.CONTRACT_KEY AND X.FACILITY_ID = NEWWHSEID);
UPDATE billadmin.BIC_CHARGE_ACCT P SET FACILITY_ID = NEWWHSEID 
WHERE P.FACILITY_ID = OLDWHSEID AND NOT EXISTS (SELECT 1 FROM billadmin.BIC_CHARGE_ACCT X 
WHERE P.CHARGE_CODE = X.CHARGE_CODE AND X.FACILITY_ID = NEWWHSEID);
UPDATE billadmin.BIC_CHARGE P SET FACILITY_ID = NEWWHSEID
WHERE P.FACILITY_ID = OLDWHSEID AND NOT EXISTS (SELECT 1 FROM billadmin.BIC_CHARGE X 
WHERE P.CHARGE_NO = X.CHARGE_NO AND X.FACILITY_ID = NEWWHSEID);
UPDATE billadmin.BIC_CHARGE_DIST P SET FACILITY_ID = NEWWHSEID
WHERE P.FACILITY_ID = OLDWHSEID AND NOT EXISTS (SELECT 1 FROM billadmin.BIC_CHARGE_DIST X 
WHERE P.CHARGE_NO = X.CHARGE_NO AND X.FACILITY_ID = NEWWHSEID);
UPDATE billadmin.BIC_BILL_GROUP_DET P SET FACILITY_ID = NEWWHSEID
WHERE P.FACILITY_ID = OLDWHSEID AND NOT EXISTS (SELECT 1 FROM billadmin.BIC_BILL_GROUP_DET X 
WHERE P.BILL_GROUP = X.BILL_GROUP AND X.FACILITY_ID = NEWWHSEID);
UPDATE billadmin.BIC_ACTIVITY_FIELD P SET FACILITY_ID = NEWWHSEID
WHERE P.FACILITY_ID = OLDWHSEID AND NOT EXISTS (SELECT 1 FROM billadmin.BIC_ACTIVITY_FIELD X 
WHERE P.ACTIVITY_ID = X.ACTIVITY_ID AND X.FACILITY_ID = NEWWHSEID);
END ;
$procedure$;

CREATE OR REPLACE PROCEDURE billadmin.sp_sce_user_anonymization(IN curuser character varying, IN newuser character varying, IN anonymization_type integer DEFAULT '-1'::integer, IN run_order integer DEFAULT '-1'::integer, IN anonymize_audit character DEFAULT 'N'::bpchar, IN tenant_id character varying DEFAULT 'INFOR'::character varying)
 LANGUAGE plpgsql
 SECURITY DEFINER
AS $procedure$
declare
    tablename VARCHAR(256);
    columnname VARCHAR(256);
    sqlStantment VARCHAR(1000);
    sqltoexecute VARCHAR(1000);
    v_new_value VARCHAR(256);
    v_old_value VARCHAR(256);
    v_isaudit VARCHAR(1);
    v_continue CHAR(1);
    v_anonymization_operation VARCHAR(1);
    v_tenant_column VARCHAR(256);
    v_ANONYMIZATION_TYPE INT;
    v_RUN_ORDER INT;
    v_cursor REFCURSOR;
	c RECORD;
BEGIN
    v_old_value := curuser;
    v_new_value := newuser;
    v_ANONYMIZATION_TYPE := ANONYMIZATION_TYPE;
    v_RUN_ORDER := RUN_ORDER;
    IF (ANONYMIZATION_TYPE = -1 AND RUN_ORDER = -1) THEN
        OPEN v_cursor FOR
           execute 'SELECT table_name, column_name, isaudit, anonymization_operation, anonymization_instruction ' ||
            'FROM USER_ANONYMIZATION_RULES ' ||
            'ORDER BY RUN_ORDER ASC';
    ELSE
        OPEN v_cursor FOR
          execute 'SELECT table_name, column_name, isaudit, anonymization_operation, anonymization_instruction ' ||
            'FROM USER_ANONYMIZATION_RULES ' ||
            'WHERE ANONYMIZATION_TYPE = ' || v_ANONYMIZATION_TYPE ||
            ' AND RUN_ORDER = ' || v_RUN_ORDER;
    END IF;
    LOOP
        FETCH v_cursor INTO tablename, columnname, v_isaudit, v_anonymization_operation, sqlStantment;
        EXIT WHEN v_cursor%NOTFOUND;
        sqltoexecute := NULL;
        v_continue := 'N';
        IF (v_isaudit = 'N') THEN
            v_continue := 'Y';
        ELSIF (v_isaudit = 'Y' AND anonymize_audit = 'Y') THEN
            v_continue := 'Y';
        END IF;
        IF (tablename = '*') THEN
            FOR c IN (
                SELECT t.table_name, c.column_name
                FROM user_tables t
                JOIN user_tab_columns c ON t.table_name = c.table_name
                WHERE t.table_name = columnname
                ORDER BY t.table_name, c.column_name DESC
            ) LOOP
                EXECUTE IMMEDIATE 'ALTER TABLE ' || c.table_name || ' DISABLE CONSTRAINT ALL';
                sqltoexecute := sqlStantment;
                v_tenant_column := NULL;
                IF (v_continue = 'Y') THEN
                    SELECT column_name INTO v_tenant_column
                    FROM user_tab_columns
                    WHERE table_name = c.table_name AND column_name LIKE 'TENANT%ID';
                    IF (v_tenant_column IS NOT NULL) THEN
                        sqltoexecute := sqlStantment || ' AND ' || v_tenant_column || ' = ''' || tenant_id || '''';
                    END IF;
                    IF (v_anonymization_operation = 'U') THEN
                        sqltoexecute := REPLACE(sqltoexecute, '${table-name}', c.table_name);
                        sqltoexecute := REPLACE(sqltoexecute, ':1', '''' || v_new_value || '''');
                        sqltoexecute := REPLACE(sqltoexecute, '${column-name}', c.column_name);
                        sqltoexecute := REPLACE(sqltoexecute, ':2', '''' || v_old_value || '''');
                        EXECUTE IMMEDIATE sqltoexecute;
                    END IF;
                    IF (v_anonymization_operation = 'D') THEN
                        sqltoexecute := REPLACE(sqltoexecute, '${table-name}', c.table_name);
                        sqltoexecute := REPLACE(sqltoexecute, '${column-name}', c.column_name);
                        sqltoexecute := REPLACE(sqltoexecute, ':1', '''' || v_old_value || '''');
                        EXECUTE IMMEDIATE sqltoexecute;
                    END IF;
                END IF;
                EXECUTE IMMEDIATE 'ALTER TABLE ' || c.table_name || ' ENABLE CONSTRAINT ALL';
            END LOOP;
        ELSE
            IF (v_continue = 'Y') THEN
                EXECUTE IMMEDIATE 'ALTER TABLE ' || tablename || ' DISABLE CONSTRAINT ALL';
                sqltoexecute := sqlStantment;
                v_tenant_column := NULL;
                SELECT column_name INTO v_tenant_column
                FROM user_tab_columns
                WHERE table_name = tablename AND column_name LIKE 'TENANT%ID';
                IF (v_tenant_column IS NOT NULL) THEN
                    sqltoexecute := sqlStantment || ' AND ' || v_tenant_column || ' = ''' || tenant_id || '''';
                END IF;
                IF (v_anonymization_operation = 'U') THEN
                    sqltoexecute := REPLACE(sqltoexecute, ':1', '''' || v_new_value || '''');
                    sqltoexecute := REPLACE(sqltoexecute, ':2', '''' || v_old_value || '''');
                    EXECUTE IMMEDIATE sqltoexecute;
                END IF;
                IF (v_anonymization_operation = 'D') THEN
                    sqltoexecute := REPLACE(sqltoexecute, ':1', '''' || v_old_value || '''');
                    EXECUTE IMMEDIATE sqltoexecute;
                END IF;
                EXECUTE IMMEDIATE 'ALTER TABLE ' || tablename || ' ENABLE CONSTRAINT ALL';
            END IF;
        END IF;
    END LOOP;
    CLOSE v_cursor;
END;
$procedure$;

CREATE OR REPLACE PROCEDURE billadmin.billing_all_archive( IN arc_days NUMERIC,IN max_recs NUMERIC DEFAULT 200)
LANGUAGE plpgsql
SECURITY DEFINER
AS $procedure$
DECLARE
    local_n_errmsg TEXT;
    local_n_err INTEGER := 0;
    n_continue INTEGER := 0;
    scriptname TEXT;
    archdays NUMERIC;
    maxrecs NUMERIC;
    archunit INTEGER;
    arccalcdays NUMERIC;
    max_days NUMERIC;

    rec RECORD;
    dyn_sql TEXT;
BEGIN
    FOR rec IN
        SELECT 
            d.archivescriptid,
            d.scriptname,
            d.archivedays,
            d.maxrecprocess,
            d.archiveunits
        FROM 
            enterprise.archiveconfighd h,
            enterprise.archiveconfigdtl d
        WHERE 
            d.component = 'BILLING'
            AND d.processname LIKE '%Archive'
            AND d.scriptname <> 'BILLING_ALL'
    LOOP
        scriptname := rec.scriptname || '_Archive';
        archdays := rec.archivedays;
        maxrecs := rec.maxrecprocess;
        archunit := rec.archiveunits;

        n_continue := 1;
        RAISE NOTICE '----Running archive script - %----', scriptname;

        IF archunit > 3 THEN
            local_n_errmsg := 'Must set days or records to archive for billing and labor scripts';
            local_n_err := 1;
        END IF;

        IF local_n_err < 1 THEN
            IF maxrecs = 0 THEN
                max_recs := 200;
            ELSE
                max_recs := maxrecs;
            END IF;

            IF archunit = 1 THEN
                arc_days := archdays;
                max_days := maxrecs;
            ELSIF archunit = 2 THEN
                arccalcdays := (archdays + 1) * 31;
                arc_days := arccalcdays;
            ELSIF archunit = 3 THEN
                arc_days := 397;
            END IF;
            dyn_sql := FORMAT('CALL billadmin.%I(%s, %s)', scriptname, arc_days, max_recs);
            BEGIN
                EXECUTE dyn_sql;
            EXCEPTION WHEN OTHERS THEN
                n_continue := 3;
                local_n_errmsg := FORMAT('ERROR: %s failed - (PostgreSQL MESSAGE = %s)', scriptname, SQLERRM);
                RAISE NOTICE '%', local_n_errmsg;
                -- do not EXIT here, allow loop to continue
            END;
        END IF;
    END LOOP;
END;
$procedure$;

CREATE OR REPLACE PROCEDURE billadmin.billing_all_purge (
    IN arc_days NUMERIC,
    IN max_recs NUMERIC DEFAULT 200
)
LANGUAGE plpgsql
SECURITY DEFINER
AS $procedure$
DECLARE
    local_n_errmsg TEXT;
    local_n_err INTEGER := 0;
    n_continue INTEGER := 0;
    scriptname TEXT;
    archdays NUMERIC;
    maxrecs NUMERIC;
    archunit INTEGER;
    arccalcdays NUMERIC;
    max_days NUMERIC;

    rec RECORD;
    dyn_sql TEXT;
BEGIN
    FOR rec IN
        SELECT 
            d.archivescriptid,
            d.scriptname,
            d.archivedays,
            d.maxrecprocess,
            d.archiveunits
        FROM 
            enterprise.archiveconfighd h,
            enterprise.archiveconfigdtl d
        WHERE 
            d.component = 'BILLING'
            AND d.processname LIKE '%Archive'
            AND d.scriptname <> 'BILLING_ALL'
    LOOP
        scriptname := rec.scriptname || '_Purge';
        archdays := rec.archivedays;
        maxrecs := rec.maxrecprocess;
        archunit := rec.archiveunits;

        n_continue := 1;
        RAISE NOTICE '----Running purge script - %----', scriptname;

        IF archunit > 3 THEN
            local_n_errmsg := 'Must set days or records to purge for billing and labor scripts';
            local_n_err := 1;
        END IF;

        IF local_n_err < 1 THEN
            IF maxrecs = 0 THEN
                max_recs := 200;
            ELSE
                max_recs := maxrecs;
            END IF;

            IF archunit = 1 THEN
                arc_days := archdays;
                max_days := maxrecs;
            ELSIF archunit = 2 THEN
                arccalcdays := (archdays + 1) * 31;
                arc_days := arccalcdays;
            ELSIF archunit = 3 THEN
                arc_days := 397;
            END IF;

            dyn_sql := FORMAT('CALL billadmin.%I(%s, %s)', scriptname, arc_days, max_recs);
            BEGIN
                EXECUTE dyn_sql;
            EXCEPTION WHEN OTHERS THEN
                n_continue := 3;
                local_n_errmsg := FORMAT('ERROR: %s failed - (PostgreSQL MESSAGE = %s)', scriptname, SQLERRM);
                RAISE NOTICE '%', local_n_errmsg;
                -- Continue with next script
            END;
        END IF;
    END LOOP;
END;
$procedure$;

CREATE OR REPLACE PROCEDURE billadmin.billing_cost_archive (
    IN dbsource VARCHAR(64),
    IN dbarch VARCHAR(64),
    IN arc_days INTEGER,
    IN max_days INTEGER,
    IN max_recs NUMERIC
)
LANGUAGE plpgsql
SECURITY DEFINER
AS $procedure$
DECLARE
    archived_number NUMERIC := 0;
    archive_total_number NUMERIC := 0;
    archive_error_total_number NUMERIC := 0;
    act_rowcount1 NUMERIC := 0;
    act_rowcount2 NUMERIC := 0;
    act_rowcountr1 NUMERIC := 0;
    act_rowcountr2 NUMERIC := 0;
    act_rowcountb1 NUMERIC := 0;
    act_rowcountb2 NUMERIC := 0;
    n_continue NUMERIC := 1;
    local_n_err NUMERIC := 0;
    local_c_errmsg VARCHAR(254) := ' ';
    local_c_msg VARCHAR(254);
    module_name VARCHAR(30) := 'BILLING_COST_Delete';
    sql VARCHAR(2048);
BEGIN
    IF max_days < arc_days AND max_days > 0 AND arc_days > 0 THEN
        arc_days := max_days;
    END IF;

    IF arc_days <= 0 THEN
        n_continue := 0;
    END IF;

    -- Create a temporary table for ALERT
    CREATE TEMP TABLE temp3 AS 
    SELECT COALESCE(MAX(alertkey), 0) AS maxalert
    FROM enterprise.alert;

    -- Increment the alertkey
    UPDATE temp3 SET maxalert = maxalert + 1;
    UPDATE temp3 SET maxalert = LPAD(maxalert::TEXT, 18, '0');

    local_c_msg := 'BILLING_COST_Delete Archive Start - Archiving for ' || arc_days || ' days';

    -- Insert into ALERT table
    INSERT INTO enterprise.alert (alertkey, modulename, alertmessage)
    SELECT maxalert, module_name, local_c_msg FROM temp3;

    RAISE NOTICE '%', local_c_msg;

    -- Drop the temp table after use
    DROP TABLE temp3;

    -- Main archive loop
    IF n_continue > 0 THEN
        LOOP
            archived_number := 0;
            act_rowcount1 := 0;
            act_rowcountb1 := 0;
            
            -- Begin transaction
            BEGIN
                -- Select records for bic_cost
                CREATE TEMP TABLE temp AS
                SELECT * 
                FROM dbsource.billadmin.bic_cost c
                WHERE c.cost_date < (CURRENT_DATE - INTERVAL '1 day' * arc_days)
                AND c.cost_no NOT IN (
                    SELECT cost_no
                    FROM dbarch.billadmin.bic_cost chk
                    WHERE c.cost_no = chk.cost_no
                )
                ORDER BY cost_no
                LIMIT 200;

                GET DIAGNOSTICS act_rowcount1 = ROW_COUNT;

                -- Select records for bic_cost_balance
                CREATE TEMP TABLE tempb AS
                SELECT * 
                FROM dbsource.billadmin.bic_cost_balance c
                WHERE c.balance_date < (CURRENT_DATE - INTERVAL '1 day' * arc_days)
                ORDER BY balance_key
                LIMIT 200;

                GET DIAGNOSTICS act_rowcountb1 = ROW_COUNT;

                IF act_rowcount1 = 0 AND act_rowcountb1 = 0 THEN
                    RAISE NOTICE 'No rows to process. Breaking out of loop.';
                    EXIT;
                END IF;

                -- Process bic_cost_dist records
                IF act_rowcount1 <> 0 THEN
                    CREATE TEMP TABLE temp2 AS
                    SELECT d.*
                    FROM temp t
                    JOIN dbsource.billadmin.bic_cost_dist d
                    ON t.cost_no = d.cost_no;

                    GET DIAGNOSTICS act_rowcountr1 = ROW_COUNT;

                    IF n_continue < 3 THEN
                        DELETE FROM dbsource.billadmin.bic_cost_dist
                        WHERE EXISTS (
                            SELECT cost_dist_key
                            FROM temp2
                            WHERE temp2.cost_dist_key = dbsource.billadmin.bic_cost_dist.cost_dist_key
                        );
                        
                        GET DIAGNOSTICS act_rowcountr2 = ROW_COUNT;

                        IF act_rowcountr1 <> act_rowcountr2 THEN
                            n_continue := 3;
                            local_c_errmsg := 'ERROR: DELETE bic_cost_dist failed';
                            RAISE NOTICE '%', local_c_errmsg;
                        END IF;

                        DELETE FROM dbsource.billadmin.bic_cost
                        WHERE EXISTS (
                            SELECT cost_no
                            FROM temp
                            WHERE temp.cost_no = dbsource.billadmin.bic_cost.cost_no
                        );
                        
                        GET DIAGNOSTICS act_rowcount2 = ROW_COUNT;

                        IF act_rowcount2 = 0 THEN
                            n_continue := 3;
                            local_c_errmsg := 'ERROR: DELETE bic_cost failed';
                            RAISE NOTICE '%', local_c_errmsg;
                        END IF;
                    END IF;
                END IF;

                -- Process bic_cost_balance records
                IF act_rowcountb1 <> 0 THEN
                    DELETE FROM dbsource.billadmin.bic_cost_balance
                    WHERE EXISTS (
                        SELECT balance_key
                        FROM tempb
                        WHERE tempb.balance_key = dbsource.billadmin.bic_cost_balance.balance_key
                    );

                    GET DIAGNOSTICS act_rowcountr2 = ROW_COUNT;

                    IF act_rowcountr2 = 0 THEN
                        n_continue := 3;
                        local_c_errmsg := 'ERROR: DELETE bic_cost_balance failed';
                        RAISE NOTICE '%', local_c_errmsg;
                    END IF;
                END IF;

                archived_number := act_rowcount1;

                IF n_continue >= 3 THEN
                    ROLLBACK;
                    archive_error_total_number := archive_error_total_number + archived_number;

                    -- Log error to ALERT table
                    CREATE TEMP TABLE temp3 AS
                    SELECT COALESCE(MAX(alertkey), 0) AS maxalert
                    FROM dbsource.enterprise.alert;

                    UPDATE temp3 SET maxalert = maxalert + 1;
                    UPDATE temp3 SET maxalert = LPAD(maxalert::TEXT, 18, '0');

                    INSERT INTO dbsource.enterprise.alert (alertkey, modulename, alertmessage)
                    SELECT maxalert, module_name, local_c_errmsg FROM temp3;

                    RAISE NOTICE '%', local_c_errmsg;

                    DROP TABLE temp3;

                    n_continue := 2;
                ELSE
                    COMMIT;
                    archive_total_number := archive_total_number + archived_number;

                    -- Clean up temp tables
                    DROP TABLE temp;
                    DROP TABLE temp2;
                    DROP TABLE tempb;

                    IF archive_total_number >= max_recs THEN
                        n_continue := 2;
                    END IF;
                END IF;
            EXCEPTION WHEN OTHERS THEN
                ROLLBACK;
                RAISE NOTICE 'Error during transaction: %', SQLERRM;
                EXIT;
            END;
        END LOOP;
    END IF;

    -- Final alert message after archiving
    CREATE TEMP TABLE temp3 AS
    SELECT COALESCE(MAX(alertkey), 0) AS maxalert
    FROM dbsource.enterprise.alert;

    UPDATE temp3 SET maxalert = maxalert + 1;
    UPDATE temp3 SET maxalert = LPAD(maxalert::TEXT, 18, '0');

    local_c_msg := 'BILLING_COST_Delete Archived Finish - ' || archive_total_number || ' records are deleted successfully, ' || archive_error_total_number || ' records fail';

    INSERT INTO dbsource.enterprise.alert (alertkey, modulename, alertmessage)
    SELECT maxalert, module_name, local_c_msg FROM temp3;

    RAISE NOTICE '%', local_c_msg;

    DROP TABLE temp3;
END;
$procedure$;

 
CREATE OR REPLACE PROCEDURE billadmin.billing_cost_purge(
    IN arc_days NUMERIC,
    IN max_recs NUMERIC
)
LANGUAGE plpgsql
AS $$
DECLARE
    archived_number INTEGER := 0;
    archive_total_number INTEGER := 0;
    archive_error_total_number INTEGER := 0;
    act_rowcount1 INTEGER := 0;
    act_rowcount2 INTEGER := 0;
    act_rowcountr1 INTEGER := 0;
    act_rowcountr2 INTEGER := 0;
    act_rowcountb1 INTEGER := 0;
    act_rowcountb2 INTEGER := 0;
    n_continue INTEGER := 1;
    local_n_err INTEGER := 0;
    local_c_errmsg TEXT := '';
    local_c_msg TEXT := '';
    modulename TEXT := 'BILLING_COST_Purge';
BEGIN
    IF arc_days <= 0 THEN
        n_continue := 0;
    END IF;

    local_c_msg := 'BILLING_COST_Purge Start Purge before ' || arc_days || ' days';
    RAISE NOTICE '%', local_c_msg;

    INSERT INTO enterprise.alert(alertkey, modulename, alertmessage)
    VALUES ((SELECT COALESCE(MAX(alertkey), 0) + 1 FROM enterprise.alert), modulename, local_c_msg);

    WHILE n_continue = 1 LOOP
        archived_number := 0;

        BEGIN
            -- Create temp tables
            CREATE TEMP TABLE temp_cost AS
            SELECT * FROM billadmin.bic_cost
            WHERE cost_date < NOW() - INTERVAL '1 day' * arc_days
            ORDER BY cost_no
            LIMIT max_recs;

            GET DIAGNOSTICS act_rowcount1 = ROW_COUNT;

            CREATE TEMP TABLE temp_costb AS
            SELECT * FROM billadmin.bic_cost_balance
            WHERE balance_date < NOW() - INTERVAL '1 day' * arc_days
            ORDER BY balance_key
            LIMIT max_recs;

            GET DIAGNOSTICS act_rowcountb1 = ROW_COUNT;

            IF act_rowcount1 = 0 AND act_rowcountb1 = 0 THEN
                RAISE NOTICE 'No records to purge.';
                n_continue := 2;
                EXIT;
            END IF;

            -- Related rows for cost_dist
            CREATE TEMP TABLE temp_cost_dist AS
            SELECT d.*
            FROM temp_cost t
            JOIN billadmin.bic_cost_dist d ON t.cost_no = d.cost_no;

            GET DIAGNOSTICS act_rowcountr1 = ROW_COUNT;

            DELETE FROM billadmin.bic_cost_dist
            WHERE cost_dist_key IN (SELECT cost_dist_key FROM temp_cost_dist);

            GET DIAGNOSTICS act_rowcountr2 = ROW_COUNT;

            IF act_rowcountr1 <> act_rowcountr2 THEN
                RAISE EXCEPTION 'Mismatch in cost_dist deletion count.';
            ELSE
                archived_number := archived_number + act_rowcountr2;
            END IF;

            DELETE FROM billadmin.bic_cost
            WHERE cost_no IN (SELECT cost_no FROM temp_cost);

            GET DIAGNOSTICS act_rowcount2 = ROW_COUNT;
            archived_number := archived_number + act_rowcount2;

            DELETE FROM billadmin.bic_cost_balance
            WHERE balance_key IN (SELECT balance_key FROM temp_costb);

            GET DIAGNOSTICS act_rowcountr2 = ROW_COUNT;
            archived_number := archived_number + act_rowcountr2;

            archive_total_number := archive_total_number + archived_number;

            -- Clean up
            DROP TABLE IF EXISTS temp_cost, temp_costb, temp_cost_dist;

            IF archived_number < max_recs THEN
                n_continue := 2;
            END IF;

        EXCEPTION
            WHEN OTHERS THEN
                archive_error_total_number := archive_error_total_number + archived_number;
                local_c_errmsg := 'ERROR: ' || SQLERRM;
                RAISE NOTICE '%', local_c_errmsg;

                INSERT INTO enterprise.alert(alertkey, modulename, alertmessage)
                VALUES ((SELECT COALESCE(MAX(alertkey), 0) + 1 FROM enterprise.alert), modulename, local_c_errmsg);

                n_continue := 2;
        END;
    END LOOP;

    local_c_msg := 'BILLING_COST_Purge Finish ' || archive_total_number || ' records deleted successfully, ' || archive_error_total_number || ' records failed';
    RAISE NOTICE '%', local_c_msg;

    INSERT INTO enterprise.alert(alertkey, modulename, alertmessage)
    VALUES ((SELECT COALESCE(MAX(alertkey), 0) + 1 FROM enterprise.alert), modulename, local_c_msg);
END;
$$;

CREATE OR REPLACE PROCEDURE billadmin.billing_inventory_archive(
    dbsource TEXT,
    dbarch TEXT,
    arc_days TEXT,
    max_days TEXT,
    max_recs NUMERIC
)
LANGUAGE plpgsql
AS $$
DECLARE
    archived_number INT := 0;
    archive_total_number INT := 0;
    archive_error_total_number INT := 0;
    act_rowcount1 INT := 0;
    act_rowcount2 INT := 0;
    act_rowcountb1 INT := 0;
    act_rowcountb2 INT := 0;
    act_rowcountb3 INT := 0;
    act_rowcountb4 INT := 0;
    n_continue INT := 1;
    local_n_err INT := 0;
    local_c_errmsg TEXT := '';
    local_c_msg TEXT := '';
    modulename TEXT := 'BILLING_INVENTORY_Delete';
    sql TEXT;
    arc_days_num INT := arc_days::INT;
    max_days_num INT := max_days::INT;
BEGIN
    IF max_days_num > 0 AND arc_days_num > 0 AND max_days_num < arc_days_num THEN
        arc_days_num := max_days_num;
    END IF;

    IF arc_days_num <= 0 THEN
        n_continue := 0;
    END IF;

    -- ALERT LOGGING: Start
    EXECUTE format($f$
        WITH max_alert AS (
            SELECT COALESCE(MAX(alertkey), 0) + 1 AS new_alert
            FROM %I.enterprise.alert
        )
        INSERT INTO %I.enterprise.alert(alertkey, modulename, alertmessage)
        SELECT LPAD(new_alert::TEXT, 18, '0'), %L, %L
        FROM max_alert;
    $f$, dbsource, dbsource, modulename, 'BILLING_INVENTORY_Delete Archive Start - Archiving for ' || arc_days_num || ' days');

    -- Loop for batches
    WHILE n_continue = 1 LOOP
        archived_number := 0;

        -- Create temp table and load data
        EXECUTE format($f$
            CREATE TEMP TABLE inventory AS
            SELECT *
            FROM %I.billadmin.bic_inventory
            WHERE inventory_key IN (
                SELECT inventory_key FROM (
                    SELECT DISTINCT i.inventory_key,
                        GREATEST(
                            COALESCE(MAX(ib.balance_date), '1900-01-01'),
                            COALESCE(i.editdate, '1900-01-01')
                        ) AS balancedate
                    FROM %I.billadmin.bic_inventory i
                    LEFT JOIN %I.billadmin.bic_inventory_bal ib ON i.inventory_key = ib.inventory_key
                    WHERE (
                        i.recur_code = 'N' AND i.editdate < CURRENT_DATE - INTERVAL '%s day'
                    ) OR (
                        ib.sku_qty <= 0
                    )
                    GROUP BY i.inventory_key, i.editdate
                ) der
                WHERE balancedate < CURRENT_DATE - INTERVAL '%s day'
                LIMIT 200
            )
        $f$, dbsource, dbsource, dbsource, arc_days_num, arc_days_num);

        GET DIAGNOSTICS act_rowcount1 = ROW_COUNT;
        IF act_rowcount1 = 0 THEN
            n_continue := 2;
            EXIT;
        END IF;

        -- Backup other tables
        EXECUTE format('CREATE TEMP TABLE inventorybal AS SELECT b.* FROM inventory i JOIN %I.billadmin.bic_inventory_bal b ON i.inventory_key = b.inventory_key', dbsource);
        GET DIAGNOSTICS act_rowcountb1 = ROW_COUNT;

        EXECUTE format('CREATE TEMP TABLE invlocbal AS SELECT b.* FROM inventory i JOIN %I.billadmin.bic_invloc_bal b ON i.inventory_key = b.inventory_key', dbsource);
        GET DIAGNOSTICS act_rowcountb3 = ROW_COUNT;

        EXECUTE format('CREATE TEMP TABLE inventoryuom AS SELECT b.* FROM inventory i JOIN %I.billadmin.bic_inventory_uom b ON i.inventory_key = b.inventory_key', dbsource);
        GET DIAGNOSTICS act_rowcountb4 = ROW_COUNT;

        -- Begin delete block
        BEGIN
            PERFORM pg_sleep(0.1); -- optional delay
            BEGIN
                EXECUTE format('DELETE FROM %I.billadmin.bic_inventory_bal WHERE inventory_key IN (SELECT inventory_key FROM inventorybal)', dbsource);
                GET DIAGNOSTICS act_rowcountb2 = ROW_COUNT;
                IF act_rowcountb1 <> act_rowcountb2 THEN
                    RAISE EXCEPTION 'DELETE bic_inventory_bal failed';
                END IF;

                EXECUTE format('DELETE FROM %I.billadmin.bic_invloc_bal WHERE inventory_key IN (SELECT inventory_key FROM invlocbal)', dbsource);
                GET DIAGNOSTICS act_rowcountb2 = ROW_COUNT;
                IF act_rowcountb3 <> act_rowcountb2 THEN
                    RAISE EXCEPTION 'DELETE bic_invloc_bal failed';
                END IF;

                EXECUTE format('DELETE FROM %I.billadmin.bic_inventory_uom WHERE inventory_key IN (SELECT inventory_key FROM inventoryuom)', dbsource);
                GET DIAGNOSTICS act_rowcountb2 = ROW_COUNT;
                IF act_rowcountb4 <> act_rowcountb2 THEN
                    RAISE EXCEPTION 'DELETE bic_inventory_uom failed';
                END IF;

                EXECUTE format('DELETE FROM %I.billadmin.bic_inventory WHERE inventory_key IN (SELECT inventory_key FROM inventory)', dbsource);
                GET DIAGNOSTICS act_rowcount2 = ROW_COUNT;
                IF act_rowcount1 <> act_rowcount2 THEN
                    RAISE EXCEPTION 'DELETE bic_inventory failed';
                END IF;
            EXCEPTION WHEN OTHERS THEN
                n_continue := 3;
                local_c_errmsg := 'ERROR: DELETE failed - ' || SQLERRM;
                RAISE NOTICE '%', local_c_errmsg;
                ROLLBACK;
            END;

            archived_number := act_rowcount1;
        END;

        -- Check for error and alert
        IF n_continue = 3 THEN
            archive_error_total_number := archive_error_total_number + archived_number;
            EXECUTE format($f$
                WITH max_alert AS (
                    SELECT COALESCE(MAX(alertkey), 0) + 1 AS new_alert
                    FROM %I.enterprise.alert
                )
                INSERT INTO %I.enterprise.alert(alertkey, modulename, alertmessage)
                SELECT LPAD(new_alert::TEXT, 18, '0'), %L, %L
                FROM max_alert;
            $f$, dbsource, dbsource, modulename, local_c_errmsg);
            n_continue := 2;
        ELSE
            archive_total_number := archive_total_number + archived_number;
            IF archive_total_number >= max_recs THEN
                n_continue := 2;
            END IF;
        END IF;

        -- Clean temp tables
        DROP TABLE IF EXISTS inventory, inventorybal, invlocbal, inventoryuom;
    END LOOP;

    -- Final success/fail message
    local_c_msg := format('BILLING_INVENTORY_Delete Archived Finish - %s records are deleted successfully, %s records fail',
                          archive_total_number, archive_error_total_number);

    EXECUTE format($f$
        WITH max_alert AS (
            SELECT COALESCE(MAX(alertkey), 0) + 1 AS new_alert
            FROM %I.enterprise.alert
        )
        INSERT INTO %I.enterprise.alert(alertkey, modulename, alertmessage)
        SELECT LPAD(new_alert::TEXT, 18, '0'), %L, %L
        FROM max_alert;
    $f$, dbsource, modulename, local_c_msg);

    RAISE NOTICE '%', local_c_msg;
END;
$$;

CREATE OR REPLACE PROCEDURE billadmin.billing_inventory_purge(
    arc_days NUMERIC,
    max_recs NUMERIC
)
LANGUAGE plpgsql
AS $$
DECLARE
    archived_number NUMERIC := 0;
    archive_total_number NUMERIC := 0;
    archive_error_total_number NUMERIC := 0;
    act_rowcount1 INT := 0;
    n_continue INT := 1;
    local_n_err INT := 0;
    local_c_errmsg TEXT := '';
    local_c_msg TEXT := '';
    modulename TEXT := 'BILLING_INVENTORY_Purge';
BEGIN
    IF arc_days <= 0 THEN
        n_continue := 0;
    END IF;

    local_c_msg := 'BILLING_INVENTORY_Purge Start Purge before ' || arc_days || ' days';
    RAISE NOTICE '%', local_c_msg;

    INSERT INTO enterprise.alert (alertkey, modulename, alertmessage)
    VALUES (
        (SELECT COALESCE(MAX(alertkey), 0) + 1 FROM enterprise.alert),
        modulename,
        local_c_msg
    );

    WHILE n_continue = 1 LOOP
        -- Replace the dynamic SQL logic here with EXECUTE + USING if needed.
        -- PostgreSQL does not support SELECT INTO ##temp or global temp tables.
        -- You’ll have to create LOCAL TEMP TABLEs and use them per session.
        -- Implement error catching using EXCEPTION blocks

        -- For example:
        BEGIN
            -- transaction start
            RAISE NOTICE 'Begin transaction logic here';
            -- Purge logic with EXECUTE dynamic SQL statements or static SQL

            -- Commit if successful
            COMMIT;
        EXCEPTION WHEN OTHERS THEN
            ROLLBACK;
            archive_error_total_number := archive_error_total_number + archived_number;
            local_c_errmsg := 'Error occurred during purge.';
            INSERT INTO enterprise.alert (alertkey, modulename, alertmessage)
            VALUES (
                (SELECT COALESCE(MAX(alertkey), 0) + 1 FROM enterprise.alert),
                modulename,
                local_c_errmsg
            );
            RAISE NOTICE '%', local_c_errmsg;
            n_continue := 2;
        END;

        -- Exit condition (no rows processed)
        IF act_rowcount1 = 0 THEN
            EXIT;
        END IF;
    END LOOP;

    local_c_msg := 'BILLING_INVENTORY_Purge Finish - ' ||
                   archive_total_number || ' records are deleted successfully, ' ||
                   archive_error_total_number || ' records fail';

    INSERT INTO enterprise.alert (alertkey, modulename, alertmessage)
    VALUES (
        (SELECT COALESCE(MAX(alertkey), 0) + 1 FROM enterprise.alert),
        modulename,
        local_c_msg
    );
    RAISE NOTICE '%', local_c_msg;
END;
$$;

CREATE OR REPLACE PROCEDURE billadmin.BILLING_INVOICE_Archive(
    DBSOURCE VARCHAR(64), 
    DBARCH VARCHAR(64), 
    Arc_days INTEGER, 
    Max_days INTEGER, 
    Max_recs NUMERIC
)
LANGUAGE plpgsql
AS
$$
DECLARE
    ArchivedNumber NUMERIC := 0;
    ArchiveTotalNumber INTEGER := 0;
    ArchiveErrorTotalNumber INTEGER := 0;
    act_rowcount1 INTEGER := 0;
    act_rowcounti1 INTEGER := 0;
    act_rowcounti2 INTEGER := 0;
    act_rowcountoc1 INTEGER := 0;
    act_rowcountoc2 INTEGER := 0;
    act_rowcountnc1 INTEGER := 0;
    act_rowcountnc2 INTEGER := 0;
    act_rowcountoh1 INTEGER := 0;
    act_rowcountoh2 INTEGER := 0;
    act_rowcountod1 INTEGER := 0;
    act_rowcountod2 INTEGER := 0;
    act_rowcountcd1 INTEGER := 0;
    act_rowcountcd2 INTEGER := 0;
    act_rowcountib1 INTEGER := 0;
    act_rowcountib2 INTEGER := 0;
    n_continue NUMERIC := 1;
    local_n_err NUMERIC := 0;
    local_c_errmsg VARCHAR(254) := ' ';
    local_c_errmsg2 VARCHAR(254) := ' ';
    local_c_msg VARCHAR(254);
    ModuleName VARCHAR(30) := 'BILLING_INVOICE';
    sql TEXT;
BEGIN
    -- Check if Max_days is less than Arc_days and adjust
    IF Max_days < Arc_days AND Max_days > 0 AND Arc_days > 0 THEN
        Arc_days := Max_days;
    END IF;

    -- Exit if Arc_days is less than or equal to 0
    IF Arc_days <= 0 THEN
        n_continue := 0;
    END IF;

    -- Insert into ALERT table
    local_c_msg := 'BILLING_INVOICE_archive Archive Start - Archiving for ' || Arc_days || ' days';
    sql := 'INSERT INTO ' || DBSOURCE || '.enterprise.ALERT (ALERTKEY, MODULENAME, ALERTMESSAGE) VALUES (nextval(''alertkey_seq''), ''' || ModuleName || ''', ''' || local_c_msg || ''')';
    EXECUTE sql;

    -- Error handling
    IF n_continue > 0 THEN
        IF n_continue = 3 THEN
            sql := 'INSERT INTO ' || DBSOURCE || '.enterprise.ALERT (ALERTKEY, MODULENAME, ALERTMESSAGE) VALUES (nextval(''alertkey_seq''), ''' || ModuleName || ''', ''' || local_c_errmsg || ''')';
            EXECUTE sql;
        END IF;

        -- Begin archiving loop
        WHILE n_continue = 1 LOOP
            -- Initialize row counts
            act_rowcounti1 := 0;
            act_rowcounti2 := 0;
            act_rowcountoc1 := 0;
            act_rowcountoc2 := 0;
            act_rowcountnc1 := 0;
            act_rowcountnc2 := 0;
            act_rowcountoh1 := 0;
            act_rowcountoh2 := 0;
            act_rowcountod1 := 0;
            act_rowcountod2 := 0;
            act_rowcountcd1 := 0;
            act_rowcountcd2 := 0;
            act_rowcountib1 := 0;
            act_rowcountib2 := 0;

            -- Start transaction
            BEGIN
                -- Get invoices to archive
                sql := 'SELECT * FROM ' || DBSOURCE || '.billadmin.bic_invoice WHERE invoice_status IN (''X'', ''C'') AND invoice_date < (CURRENT_DATE - INTERVAL ''' || Arc_days || ' days'') ORDER BY invoice_no LIMIT 1';
                EXECUTE sql;
                GET DIAGNOSTICS act_rowcounti1 = ROW_COUNT;

                -- If no rows, break out of loop
                IF act_rowcounti1 = 0 THEN
                    RAISE NOTICE 'No invoices found to archive';
                    n_continue := 0;
                    EXIT;
                END IF;

                -- Processing charge orders
                sql := 'SELECT DISTINCT c.order_key, c.invoice_no FROM ' || DBSOURCE || '.billadmin.bic_charge c, ' || DBSOURCE || '.billadmin.bic_invoice i WHERE c.invoice_no = i.invoice_no AND c.order_key IS NOT NULL AND c.order_key <> 0';
                EXECUTE sql;
                GET DIAGNOSTICS act_rowcountoc1 = ROW_COUNT;

                -- Process charge distribution
                IF act_rowcountoc1 > 0 THEN
                    sql := 'DELETE FROM ' || DBSOURCE || '.billadmin.bic_charge_dist WHERE EXISTS (SELECT 1 FROM ' || DBSOURCE || '.billadmin.bic_charge c WHERE c.charge_dist_key = ' || DBSOURCE || '.billadmin.bic_charge_dist.charge_dist_key)';
                    EXECUTE sql;
                    GET DIAGNOSTICS act_rowcountcd2 = ROW_COUNT;
                END IF;

                -- Process invoice deletion
                sql := 'DELETE FROM ' || DBSOURCE || '.billadmin.bic_invoice WHERE EXISTS (SELECT 1 FROM ' || DBSOURCE || '.billadmin.bic_charge c WHERE c.invoice_no = ' || DBSOURCE || '.billadmin.bic_invoice.invoice_no)';
                EXECUTE sql;
                GET DIAGNOSTICS act_rowcounti2 = ROW_COUNT;

                -- Error handling and exit if deletion failed
                IF act_rowcounti1 <> act_rowcounti2 THEN
                    n_continue := 3;
                    local_c_errmsg := 'ERROR: DELETE bic_invoice failed';
                    RAISE EXCEPTION 'Archiving failed: %', local_c_errmsg;
                END IF;

                -- Commit transaction
                COMMIT;
            EXCEPTION WHEN OTHERS THEN
                -- Rollback on error
                ROLLBACK;
                RAISE;
            END;
        END LOOP;
    END IF;

    -- Final alert
    IF n_continue = 0 THEN
        sql := 'INSERT INTO ' || DBSOURCE || '.enterprise.ALERT (ALERTKEY, MODULENAME, ALERTMESSAGE) VALUES (nextval(''alertkey_seq''), ''' || ModuleName || ''', ''Archiving Complete'')';
        EXECUTE sql;
    END IF;

END;
$$;

CREATE OR REPLACE PROCEDURE billadmin.billing_invoice_purge(
    i_invoice_age INTEGER,
    i_max_records INTEGER,
    i_commit_interval INTEGER DEFAULT 5000,
    i_debug BOOLEAN DEFAULT FALSE
)
LANGUAGE plpgsql
AS
$$
DECLARE
    v_cnt INTEGER := 0;
    v_commit_cnt INTEGER := 0;
    v_total_deleted INTEGER := 0;
    v_invoice_key BIGINT;
    v_process_id UUID := gen_random_uuid();
    v_debug_flag BOOLEAN := i_debug;
    cur CURSOR FOR
        SELECT inv.billing_invoice_key
        FROM billadmin.billing_invoice inv
        WHERE inv.invoice_date <= current_date - i_invoice_age
          AND NOT EXISTS (
              SELECT 1 FROM billadmin.billing_invoice_detail d
              WHERE d.billing_invoice_key = inv.billing_invoice_key
                AND d.status_flag = 'O'
          )
        ORDER BY inv.invoice_date
        LIMIT i_max_records;
BEGIN
    IF v_debug_flag THEN
        RAISE NOTICE 'Billing Invoice Purge Started at: %', clock_timestamp();
    END IF;

    CREATE TEMP TABLE tmp_deleted_invoice_keys (
        billing_invoice_key BIGINT PRIMARY KEY
    ) ON COMMIT DROP;

    OPEN cur;

    LOOP
        FETCH cur INTO v_invoice_key;
        EXIT WHEN NOT FOUND;

        INSERT INTO tmp_deleted_invoice_keys VALUES (v_invoice_key)
        ON CONFLICT DO NOTHING;

        v_cnt := v_cnt + 1;
        v_commit_cnt := v_commit_cnt + 1;

        IF v_commit_cnt >= i_commit_interval THEN
            DELETE FROM billadmin.billing_invoice_detail
            WHERE billing_invoice_key IN (SELECT billing_invoice_key FROM tmp_deleted_invoice_keys);

            DELETE FROM billadmin.billing_invoice_note
            WHERE billing_invoice_key IN (SELECT billing_invoice_key FROM tmp_deleted_invoice_keys);

            DELETE FROM billadmin.billing_invoice
            WHERE billing_invoice_key IN (SELECT billing_invoice_key FROM tmp_deleted_invoice_keys);

            v_total_deleted := v_total_deleted + v_commit_cnt;

            IF v_debug_flag THEN
                RAISE NOTICE 'Committed % deletions at %', v_commit_cnt, clock_timestamp();
            END IF;

            DELETE FROM tmp_deleted_invoice_keys;
            v_commit_cnt := 0;
        END IF;
    END LOOP;

    CLOSE cur;

    IF v_commit_cnt > 0 THEN
        DELETE FROM billadmin.billing_invoice_detail
        WHERE billing_invoice_key IN (SELECT billing_invoice_key FROM tmp_deleted_invoice_keys);

        DELETE FROM billadmin.billing_invoice_note
        WHERE billing_invoice_key IN (SELECT billing_invoice_key FROM tmp_deleted_invoice_keys);

        DELETE FROM billadmin.billing_invoice
        WHERE billing_invoice_key IN (SELECT billing_invoice_key FROM tmp_deleted_invoice_keys);

        v_total_deleted := v_total_deleted + v_commit_cnt;

        IF v_debug_flag THEN
            RAISE NOTICE 'Final batch committed: % at %', v_commit_cnt, clock_timestamp();
        END IF;
    END IF;

    IF v_debug_flag THEN
        RAISE NOTICE 'Billing Invoice Purge Completed at: % | Total Deleted: %', clock_timestamp(), v_total_deleted;
    END IF;
END;
$$;

CREATE OR REPLACE PROCEDURE billadmin."BILLING_MONTHREPORTING_Archive"(
    IN DBSOURCE TEXT,
    IN Arc_days_num INTEGER
)
LANGUAGE plpgsql
AS $$
DECLARE
    sql TEXT;
    c_date DATE;
    local_c_msg TEXT;
    ModuleName TEXT := 'BILLING_MONTHREPORTING_Archive';
BEGIN
    -- Calculate current date minus archival days
    c_date := current_date - Arc_days_num;

    -- Drop existing temp3 if exists
    DROP TABLE IF EXISTS temp3;

    -- Create temp3 to get next alertkey
    sql := format(
        'CREATE TEMP TABLE temp3 AS SELECT COALESCE(MAX(alertkey), 0) + 1 AS maxalert FROM %I.enterprise.alert',
        DBSOURCE
    );
    EXECUTE sql;

    -- Add alertkey_formatted column
    EXECUTE 'ALTER TABLE temp3 ADD COLUMN alertkey_formatted TEXT';

    -- Update with formatted alertkey (left-padded with zeros)
    EXECUTE 'UPDATE temp3 SET alertkey_formatted = LPAD(maxalert::TEXT, 18, ''0'')';

    -- Prepare alert message
    local_c_msg := format('BILLING_MONTHREPORTING_Archive Archive Start - Archiving for %s days', Arc_days_num);

    -- Insert start alert into enterprise.alert
    sql := format(
        'INSERT INTO %I.enterprise.alert (alertkey, modulename, alertmessage)
         SELECT alertkey_formatted, %L, %L FROM temp3',
        DBSOURCE, ModuleName, local_c_msg
    );
    EXECUTE sql;

    -- Drop temp3
    DROP TABLE IF EXISTS temp3;

    -- Create archive table if not exists
    sql := format(
        'CREATE TABLE IF NOT EXISTS %I.billadmin.billing_monthreporting_arc (LIKE %I.billadmin.billing_monthreporting INCLUDING ALL)',
        DBSOURCE, DBSOURCE
    );
    EXECUTE sql;

    -- Insert into archive table from main table where data is older than c_date
    sql := format(
        'INSERT INTO %I.billadmin.billing_monthreporting_arc
         SELECT * FROM %I.billadmin.billing_monthreporting
         WHERE period_date <= %L',
        DBSOURCE, DBSOURCE, c_date::TEXT
    );
    EXECUTE sql;

    -- Delete archived rows from main table
    sql := format(
        'DELETE FROM %I.billadmin.billing_monthreporting
         WHERE period_date <= %L',
        DBSOURCE, c_date::TEXT
    );
    EXECUTE sql;

    -- Recreate temp3 for end alert
    DROP TABLE IF EXISTS temp3;
    sql := format(
        'CREATE TEMP TABLE temp3 AS SELECT COALESCE(MAX(alertkey), 0) + 1 AS maxalert FROM %I.enterprise.alert',
        DBSOURCE
    );
    EXECUTE sql;

    EXECUTE 'ALTER TABLE temp3 ADD COLUMN alertkey_formatted TEXT';
    EXECUTE 'UPDATE temp3 SET alertkey_formatted = LPAD(maxalert::TEXT, 18, ''0'')';

    -- End alert message
    local_c_msg := format('BILLING_MONTHREPORTING_Archive Archive End - Archiving for %s days', Arc_days_num);

    sql := format(
        'INSERT INTO %I.enterprise.alert (alertkey, modulename, alertmessage)
         SELECT alertkey_formatted, %L, %L FROM temp3',
        DBSOURCE, ModuleName, local_c_msg
    );
    EXECUTE sql;

    DROP TABLE IF EXISTS temp3;
EXCEPTION
    WHEN OTHERS THEN
        GET STACKED DIAGNOSTICS local_c_msg = MESSAGE_TEXT;

        -- Error alert
        DROP TABLE IF EXISTS temp3;
        sql := format(
            'CREATE TEMP TABLE temp3 AS SELECT COALESCE(MAX(alertkey), 0) + 1 AS maxalert FROM %I.enterprise.alert',
            DBSOURCE
        );
        EXECUTE sql;

        EXECUTE 'ALTER TABLE temp3 ADD COLUMN alertkey_formatted TEXT';
        EXECUTE 'UPDATE temp3 SET alertkey_formatted = LPAD(maxalert::TEXT, 18, ''0'')';

        sql := format(
            'INSERT INTO %I.enterprise.alert (alertkey, modulename, alertmessage)
             SELECT alertkey_formatted, %L, %L FROM temp3',
            DBSOURCE, ModuleName, local_c_msg
        );
        EXECUTE sql;

        DROP TABLE IF EXISTS temp3;

        -- Re-raise the exception
        RAISE;
END;
$$;

CREATE OR REPLACE PROCEDURE billadmin."BILLING_MONTHREPORTING_Purge"(
    IN arc_days NUMERIC,
    IN max_recs NUMERIC
)
LANGUAGE plpgsql
AS
$$
DECLARE
    archived_number NUMERIC := 0;
    archive_total_number NUMERIC := 0;
    archive_error_total_number NUMERIC := 0;
    act_rowcount1 INTEGER := 0;
    act_rowcount2 INTEGER := 0;
    act_rowcountd1 INTEGER := 0;
    n_continue INTEGER := 1;
    local_n_err INTEGER := 0;
    local_c_errmsg VARCHAR(254) := '';
    local_c_msg VARCHAR(254);
    modulename VARCHAR(30) := 'BILLING_MONTHREPORTING_Purge';
    sql TEXT;
BEGIN
    IF arc_days <= 0 THEN
        n_continue := 0;
    END IF;

    local_c_msg := 'BILLING_MONTHREPORTING_Purge Start Purge before ' || arc_days || ' days';
    RAISE NOTICE '%', local_c_msg;

    INSERT INTO enterprise."ALERT" (alertkey, modulename, alertmessage)
    VALUES ((SELECT COALESCE(MAX(alertkey::NUMERIC), 0) + 1 FROM enterprise."ALERT"), modulename, local_c_msg);

    WHILE n_continue = 1 LOOP
        archived_number := 0;
        act_rowcount1 := 0;

        BEGIN
            EXECUTE format('CREATE TEMP TABLE "CHKMMDATE" AS
                            SELECT * FROM billadmin."pm_s_chg1mm"
                            WHERE charge_date < (CURRENT_DATE - INTERVAL ''%s day'')
                            LIMIT %s', arc_days::TEXT, max_recs::TEXT);

            GET DIAGNOSTICS act_rowcountd1 = ROW_COUNT;

            IF act_rowcountd1 = 0 THEN
                RAISE NOTICE 'No records found, exiting loop.';
                n_continue := 2;
                RETURN;
            END IF;

            -- CHG1MM
            EXECUTE 'CREATE TEMP TABLE "CHG1MM" AS
                     SELECT * FROM billadmin."pm_s_chg1mm"
                     WHERE charge_date <= (SELECT MAX(charge_date) FROM "CHKMMDATE")
                     ORDER BY charge_date';

            GET DIAGNOSTICS act_rowcount1 = ROW_COUNT;

            IF act_rowcount1 > 0 AND n_continue <> 3 THEN
                EXECUTE 'DELETE FROM billadmin."pm_s_chg1mm"
                         WHERE charge_date <= (SELECT MAX(charge_date) FROM "CHKMMDATE")';
                GET DIAGNOSTICS act_rowcount2 = ROW_COUNT;

                IF act_rowcount1 <> act_rowcount2 THEN
                    n_continue := 3;
                    local_c_errmsg := 'ERROR: DELETE pm_s_chg1mm failed - rowcount mismatch';
                ELSE
                    archived_number := archived_number + act_rowcount2;
                END IF;
            END IF;

            -- Repeat similar block for CHG1MMAVG, CHG2MM, CHG2MMAVG
            -- You can abstract this into a loop over table names if desired.

            -- CHG1MMAVG
            PERFORM purge_mm_table('CHG1MMAVG', 'pm_s_chg1mm_avg', 'charge_date', 'CHKMMDATE', archived_number, n_continue, local_c_errmsg);

            -- CHG2MM
            PERFORM purge_mm_table('CHG2MM', 'pm_s_chg2mm', 'charge_date', 'CHKMMDATE', archived_number, n_continue, local_c_errmsg);

            -- CHG2MMAVG
            PERFORM purge_mm_table('CHG2MMAVG', 'pm_s_chg2mm_avg', 'charge_date', 'CHKMMDATE', archived_number, n_continue, local_c_errmsg);

            -- CHARGEALL
            PERFORM purge_mm_table_by_year('CHARGEALL', 'pm_s_chargeall', 'charge_year', 'CHKMMDATE', archived_number, n_continue, local_c_errmsg);

            -- CHARGECUST
            PERFORM purge_mm_table_by_year('CHARGECUST', 'pm_s_chargecust', 'charge_year', 'CHKMMDATE', archived_number, n_continue, local_c_errmsg);

            -- CHARGEDEPT
            PERFORM purge_mm_table_by_year('CHARGEDEPT', 'pm_s_chargedept', 'charge_year', 'CHKMMDATE', archived_number, n_continue, local_c_errmsg);

            -- PMDDATE
            EXECUTE 'CREATE TEMP TABLE "PMDDATE" AS
                     SELECT * FROM billadmin."pm_d_date"
                     WHERE actual_date <= (SELECT MAX(charge_date) FROM "CHKMMDATE")';
            GET DIAGNOSTICS act_rowcount1 = ROW_COUNT;

            IF act_rowcount1 > 0 AND n_continue <> 3 THEN
                EXECUTE 'DELETE FROM billadmin."pm_d_date"
                         WHERE actual_date <= (SELECT MAX(charge_date) FROM "CHKMMDATE")';
                GET DIAGNOSTICS act_rowcount2 = ROW_COUNT;

                IF act_rowcount1 <> act_rowcount2 THEN
                    n_continue := 3;
                    local_c_errmsg := 'ERROR: DELETE pm_d_date failed - rowcount mismatch';
                ELSE
                    archived_number := archived_number + act_rowcount2;
                END IF;
            END IF;

            IF n_continue = 3 THEN
                RAISE NOTICE 'Rolling back transaction';
                archive_error_total_number := archive_error_total_number + archived_number;
                n_continue := 2;
            ELSE
                archive_total_number := archive_total_number + archived_number;

                DROP TABLE IF EXISTS "CHKMMDATE", "CHG1MM", "CHG1MMAVG", "CHG2MM", "CHG2MMAVG", "CHARGEALL", "CHARGECUST", "CHARGEDEPT", "PMDDATE";

                IF archived_number < max_recs THEN
                    n_continue := 2;
                END IF;
            END IF;

        EXCEPTION WHEN OTHERS THEN
            RAISE WARNING 'Exception occurred: %', SQLERRM;
            archive_error_total_number := archive_error_total_number + archived_number;
            n_continue := 2;
        END;
    END LOOP;

    local_c_msg := format('BILLING_MONTHREPORTING_Purge Finish - %s records are deleted successfully, %s records fail',
                         archive_total_number, archive_error_total_number);

    INSERT INTO enterprise."ALERT" (alertkey, modulename, alertmessage)
    VALUES ((SELECT COALESCE(MAX(alertkey::NUMERIC), 0) + 1 FROM enterprise."ALERT"), modulename, local_c_msg);

    RAISE NOTICE '%', local_c_msg;
END;
$$;

CREATE OR REPLACE PROCEDURE billadmin.billing_rate_archive(
    dbsource TEXT,
    dbarch TEXT,
    arc_days TEXT,
    max_days TEXT,
    max_recs NUMERIC
)
LANGUAGE plpgsql
AS $$
DECLARE
    archived_number INTEGER := 0;
    archive_total_number INTEGER := 0;
    archive_error_total_number INTEGER := 0;
    act_rowcount1 INTEGER := 0;
    act_rowcount2 INTEGER := 0;
    act_rowcountr1 INTEGER := 0;
    act_rowcountr2 INTEGER := 0;
    n_continue INTEGER := 1;
    local_n_err INTEGER := 0;
    local_c_errmsg TEXT := '';
    local_c_errmsg2 TEXT := '';
    local_c_msg TEXT := '';
    modulename TEXT := 'BILLING_RATE_Delete';
    sql TEXT;
    maxalert TEXT;
BEGIN
    -- Validate and adjust arc_days
    IF arc_days::NUMERIC <= 0 THEN
        n_continue := 0;
    ELSIF max_days::NUMERIC < arc_days::NUMERIC AND max_days::NUMERIC > 0 THEN
        arc_days := max_days;
    END IF;

    -- Get new alert key
    sql := FORMAT(
        'SELECT COALESCE(MAX(alertkey), 0) + 1 FROM %I.enterprise.alert',
        dbsource
    );
    EXECUTE sql INTO maxalert;
    maxalert := LPAD(maxalert, 18, '0');

    -- Log start message
    local_c_msg := FORMAT('BILLING_RATE_Delete Archive Start - Archiving for %s days', arc_days);
    sql := FORMAT(
        'INSERT INTO %I.enterprise.alert (alertkey, modulename, alertmessage) VALUES (%L, %L, %L)',
        dbsource, maxalert, modulename, local_c_msg
    );
    EXECUTE sql;

    RAISE NOTICE '%', local_c_msg;

    WHILE n_continue = 1 LOOP
        archived_number := 0;
        act_rowcount1 := 0;
        act_rowcountr1 := 0;

        -- Step 1: Select candidates to delete
        sql := FORMAT($f$
            CREATE TEMP TABLE temp_bic_rate_group AS
            SELECT * FROM %I.billadmin.bic_rate_group r
            WHERE r.rate_group IN (
                SELECT rate_group FROM (
                    SELECT g.rate_group FROM %I.billadmin.bic_rate_group g
                    WHERE g.rate_group IN (
                        SELECT d.rate_group FROM %I.billadmin.bic_contract_det d
                        WHERE d.rate_group = g.rate_group
                          AND g.expire_date < (
                              SELECT MAX(ce.effective_date)
                              FROM %I.billadmin.bic_contract ce
                              JOIN %I.billadmin.bic_contract_det de
                              ON ce.contract_key = de.contract_key
                              WHERE de.rate_group = d.rate_group
                          )
                    )
                    AND g.expire_date < (CURRENT_DATE - INTERVAL '%s days')
                    UNION
                    SELECT g.rate_group FROM %I.billadmin.bic_rate_group g
                    WHERE NOT EXISTS (
                        SELECT 1 FROM %I.billadmin.bic_rate r
                        WHERE r.rate_group = g.rate_group
                          AND r.effect_date = g.effect_date
                          AND r.expire_date = g.expire_date
                    )
                    AND g.expire_date < (CURRENT_DATE - INTERVAL '%s days')
                    UNION
                    SELECT g.rate_group FROM %I.billadmin.bic_rate_group g
                    WHERE NOT EXISTS (
                        SELECT 1 FROM %I.billadmin.bic_contract_det d
                        WHERE d.rate_group = g.rate_group
                    )
                    AND g.expire_date < (CURRENT_DATE - INTERVAL '%s days')
                ) sub
            )
            AND r.expire_date < (CURRENT_DATE - INTERVAL '%s days')
            AND NOT EXISTS (
                SELECT 1 FROM %I.billadmin.bic_rate_group g2
                WHERE g2.rate_group = r.rate_group
                  AND g2.effect_date = r.effect_date
                  AND g2.expire_date = r.expire_date
            )
            ORDER BY r.rate_group
            LIMIT 200
        $f$,
        dbsource, dbsource, dbsource, dbsource, dbsource, arc_days,
        dbsource, dbsource, arc_days, dbsource, dbsource, arc_days,
        arc_days, dbarch
        );

        EXECUTE sql;
        GET DIAGNOSTICS act_rowcount1 = ROW_COUNT;

        IF act_rowcount1 = 0 THEN
            DROP TABLE IF EXISTS temp_bic_rate_group;
            EXIT;
        END IF;

        -- Step 2: Get corresponding bic_rate records
        sql := FORMAT($f$
            CREATE TEMP TABLE temp_bic_rate AS
            SELECT r.*
            FROM temp_bic_rate_group t
            JOIN %I.billadmin.bic_rate r
              ON r.rate_group = t.rate_group
             AND r.effect_date = t.effect_date
             AND r.expire_date = t.expire_date
        $f$, dbsource);
        EXECUTE sql;
        GET DIAGNOSTICS act_rowcountr1 = ROW_COUNT;

        BEGIN
            -- Start transaction block
            BEGIN
                -- Delete from bic_rate
                sql := FORMAT(
                    'DELETE FROM %I.billadmin.bic_rate r USING temp_bic_rate t WHERE r.rate_key = t.rate_key',
                    dbsource
                );
                EXECUTE sql;
                GET DIAGNOSTICS act_rowcountr2 = ROW_COUNT;

                IF act_rowcountr1 != act_rowcountr2 THEN
                    RAISE EXCEPTION 'Mismatch in deleted rate rows: expected %, got %', act_rowcountr1, act_rowcountr2;
                END IF;

                -- Delete from bic_rate_group
                sql := FORMAT(
                    'DELETE FROM %I.billadmin.bic_rate_group r USING temp_bic_rate_group t WHERE r.rate_group = t.rate_group AND r.effect_date = t.effect_date AND r.expire_date = t.expire_date',
                    dbsource
                );
                EXECUTE sql;
                GET DIAGNOSTICS act_rowcount2 = ROW_COUNT;

                IF act_rowcount1 != act_rowcount2 THEN
                    RAISE EXCEPTION 'Mismatch in deleted rate_group rows: expected %, got %', act_rowcount1, act_rowcount2;
                END IF;

                archived_number := act_rowcount1;
                archive_total_number := archive_total_number + archived_number;

                DROP TABLE IF EXISTS temp_bic_rate_group;
                DROP TABLE IF EXISTS temp_bic_rate;

                IF archive_total_number >= max_days::INTEGER THEN
                    n_continue := 2;
                END IF;
            EXCEPTION WHEN OTHERS THEN
                ROLLBACK;
                archive_error_total_number := archive_error_total_number + act_rowcount1;
                local_c_errmsg := 'ERROR: DELETE operation failed - ' || SQLERRM;

                -- Log the error
                sql := FORMAT(
                    'SELECT COALESCE(MAX(alertkey), 0) + 1 FROM %I.enterprise.alert',
                    dbsource
                );
                EXECUTE sql INTO maxalert;
                maxalert := LPAD(maxalert, 18, '0');

                sql := FORMAT(
                    'INSERT INTO %I.enterprise.alert (alertkey, modulename, alertmessage) VALUES (%L, %L, %L)',
                    dbsource, maxalert, modulename, local_c_errmsg
                );
                EXECUTE sql;

                RAISE NOTICE '%', local_c_errmsg;

                DROP TABLE IF EXISTS temp_bic_rate_group;
                DROP TABLE IF EXISTS temp_bic_rate;
                n_continue := 2;
            END;
        END;
    END LOOP;

    -- Final log
    sql := FORMAT(
        'SELECT COALESCE(MAX(alertkey), 0) + 1 FROM %I.enterprise.alert',
        dbsource
    );
    EXECUTE sql INTO maxalert;
    maxalert := LPAD(maxalert, 18, '0');

    local_c_msg := FORMAT(
        'BILLING_RATE_Delete Archived Finish - %s records are deleted successfully, %s records failed',
        archive_total_number, archive_error_total_number
    );

    sql := FORMAT(
        'INSERT INTO %I.enterprise.alert (alertkey, modulename, alertmessage) VALUES (%L, %L, %L)',
        dbsource, maxalert, modulename, local_c_msg
    );
    EXECUTE sql;

    RAISE NOTICE '%', local_c_msg;

END;
$$;

CREATE OR REPLACE PROCEDURE billadmin.billing_rate_purge(
    IN arc_days NUMERIC,
    IN max_recs NUMERIC
)
LANGUAGE plpgsql
AS $$
DECLARE
    archivednumber NUMERIC := 0;
    archivetotalnumber NUMERIC := 0;
    archiveerrortotalnumber NUMERIC := 0;
    act_rowcount1 NUMERIC := 0;
    act_rowcount2 NUMERIC := 0;
    act_rowcountr1 NUMERIC := 0;
    act_rowcountr2 NUMERIC := 0;
    n_continue NUMERIC := 1;
    local_n_err INTEGER := 0;
    local_c_errmsg TEXT := '';
    local_c_errmsg2 TEXT := '';
    local_c_msg TEXT := '';
    modulename TEXT := 'BILLING_RATE_Purge';
    sql TEXT := '';
BEGIN
    -- Example check
    IF arc_days <= 0 THEN
        n_continue := 0;
    END IF;

    local_c_msg := 'BILLING_RATE_Purge Start Purge before ' || arc_days || ' days';
    RAISE NOTICE '%', local_c_msg;

    INSERT INTO enterprise.alert(alertkey, modulename, alertmessage)
    VALUES (
        (SELECT COALESCE(MAX(alertkey::NUMERIC), 0) + 1 FROM enterprise.alert),
        modulename,
        local_c_msg
    );

    -- Your WHILE loop and dynamic SQL logic go here...

    local_c_msg := 'BILLING_RATES_Purge Finish - ' ||
                   archivetotalnumber || ' records are deleted successfully, ' ||
                   archiveerrortotalnumber || ' records fail';

    INSERT INTO enterprise.alert(alertkey, modulename, alertmessage)
    VALUES (
        (SELECT COALESCE(MAX(alertkey::NUMERIC), 0) + 1 FROM enterprise.alert),
        modulename,
        local_c_msg
    );

    RAISE NOTICE '%', local_c_msg;

END;
$$;

CREATE OR REPLACE PROCEDURE billadmin.billing_weekreporting_archive(
    dbsource TEXT,
    dbarch TEXT,
    arc_days TEXT,
    max_days TEXT,
    max_recs NUMERIC
)
LANGUAGE plpgsql
AS
$$
DECLARE
    archived_number INTEGER := 0;
    archive_total_number INTEGER := 0;
    archive_error_total_number INTEGER := 0;
    act_rowcount1 INTEGER := 0;
    act_rowcount2 INTEGER := 0;
    n_continue INTEGER := 1;
    local_n_err INTEGER := 0;
    local_c_errmsg TEXT := '';
    local_c_msg TEXT := '';
    modulename TEXT := 'BILLING_WEEKREPORTING_Delete';
    sql TEXT;
    maxalert TEXT;
BEGIN
    -- Validate and adjust Arc_days
    IF arc_days::INTEGER <= 0 THEN
        n_continue := 0;
    ELSIF max_days::INTEGER < arc_days::INTEGER AND max_days::INTEGER > 0 THEN
        arc_days := max_days;
    END IF;

    IF n_continue = 0 THEN
        RETURN;
    END IF;

    -- Create temporary table to simulate ##TEMP3
    CREATE TEMP TABLE temp3 (maxalert TEXT);

    sql := format('SELECT COALESCE(MAX(alertkey), 0) FROM %I.enterprise.alert', dbsource);
    EXECUTE sql INTO maxalert;
    maxalert := LPAD((maxalert::BIGINT + 1)::TEXT, 18, '0');
    INSERT INTO temp3 VALUES (maxalert);

    local_c_msg := format('BILLING_WEEKREPORTING_archive Archive Start - Archiving for %s days', arc_days);

    sql := format($fmt$
        INSERT INTO %I.enterprise.alert (alertkey, modulename, alertmessage)
        VALUES ('%s', '%s', '%s')
    $fmt$, dbsource, maxalert, modulename, local_c_msg);
    EXECUTE sql;

    DROP TABLE temp3;

    WHILE n_continue = 1 LOOP
        archived_number := 0;
        act_rowcount1 := 0;

        BEGIN
            -- Create temporary CHKWWDATE table
            CREATE TEMP TABLE chkwwdate AS
            EXECUTE format(
                'SELECT * FROM %I.billadmin.pm_s_chg1ww WHERE charge_date < (current_date - INTERVAL ''%s days'') LIMIT 200',
                dbsource, arc_days
            );

            GET DIAGNOSTICS act_rowcount1 = ROW_COUNT;
            IF act_rowcount1 = 0 THEN
                RAISE NOTICE 'No more records to archive.';
                ROLLBACK;
                EXIT;
            END IF;

            -- Begin transaction for batch
            BEGIN
                -- Delete logic for each table
                PERFORM process_table('pm_s_chg1ww', dbsource, arc_days, n_continue, local_c_errmsg);
                PERFORM process_table('pm_s_chg1ww_avg', dbsource, arc_days, n_continue, local_c_errmsg);
                PERFORM process_table('pm_s_chg2ww', dbsource, arc_days, n_continue, local_c_errmsg);
                PERFORM process_table('pm_s_chg2ww_avg', dbsource, arc_days, n_continue, local_c_errmsg);
                PERFORM process_table('pm_s_chg1dd', dbsource, arc_days, n_continue, local_c_errmsg);
                PERFORM process_table('pm_s_chg1dd_avg', dbsource, arc_days, n_continue, local_c_errmsg);
                PERFORM process_table('pm_s_chg3dd', dbsource, arc_days, n_continue, local_c_errmsg);
                PERFORM process_table('pm_d_date', dbsource, arc_days, n_continue, local_c_errmsg, 'actual_date');

                archived_number := act_rowcount1;
                archive_total_number := archive_total_number + archived_number;

                IF n_continue = 3 THEN
                    RAISE NOTICE 'Error occurred, rolling back. Message: %', local_c_errmsg;
                    ROLLBACK;
                    archive_error_total_number := archive_error_total_number + 1;

                    -- Alert error message
                    CREATE TEMP TABLE temp3 (maxalert TEXT);
                    sql := format('SELECT COALESCE(MAX(alertkey), 0) FROM %I.enterprise.alert', dbsource);
                    EXECUTE sql INTO maxalert;
                    maxalert := LPAD((maxalert::BIGINT + 1)::TEXT, 18, '0');
                    INSERT INTO temp3 VALUES (maxalert);

                    sql := format(
                        'INSERT INTO %I.enterprise.alert (alertkey, modulename, alertmessage) VALUES (''%s'', ''%s'', ''%s'')',
                        dbsource, maxalert, modulename, local_c_errmsg
                    );
                    EXECUTE sql;
                    DROP TABLE temp3;
                ELSE
                    COMMIT;
                END IF;
            END;
        EXCEPTION WHEN OTHERS THEN
            RAISE WARNING 'Unexpected error: %', SQLERRM;
            ROLLBACK;
            EXIT;
        END;
    END LOOP;
END;
$$;

CREATE OR REPLACE PROCEDURE billadmin.BILLING_WEEKREPORTING_Purge(
    Arc_days NUMERIC,
    Max_recs NUMERIC
)
LANGUAGE plpgsql
AS $$
DECLARE
    ArchivedNumber NUMERIC := 0;
    ArchiveTotalNumber INTEGER := 0;
    ArchiveErrorTotalNumber INTEGER := 0;
    act_rowcount1 INTEGER := 0;
    act_rowcount2 INTEGER := 0;
    act_rowcountd1 INTEGER := 0;
    n_continue INTEGER := 1;
    local_n_err INTEGER := 0;
    local_c_errmsg VARCHAR(254) := ' ';
    local_c_msg VARCHAR(254);
    ModuleName VARCHAR(30) := 'BILLING_WEEKREPORTING_Purge';
    sql VARCHAR(2048);
BEGIN
    IF Arc_days <= 0 THEN
        n_continue := 0;
    END IF;

    local_c_msg := 'BILLING_WEEKREPORTING_Purge Start Purge before ' || CAST(Arc_days AS VARCHAR) || ' days';
    RAISE NOTICE '%', local_c_msg;

    INSERT INTO enterprise.alert (alertkey, modulename, alertmessage)
    VALUES ((SELECT COALESCE(MAX(alertkey), 0) + 1 FROM enterprise.alert), ModuleName, local_c_msg);

    WHILE n_continue = 1 LOOP
        ArchivedNumber := 0;
        act_rowcount1 := 0;
        BEGIN
            -- Set up transaction
            BEGIN
                -- Create temp table ##CHKWWDATE
                CREATE TEMP TABLE chkwwdate AS
                SELECT *
                FROM billadmin.pm_s_chg1ww
                WHERE charge_date < (CURRENT_DATE - INTERVAL '1 day' * Arc_days)
                LIMIT Max_recs;

                GET DIAGNOSTICS act_rowcountd1 = ROW_COUNT;
                
                IF act_rowcountd1 = 0 THEN
                    RAISE NOTICE 'No records to archive. Exiting.';
                    EXIT;
                END IF;

                -- Process and delete records from pm_s_chg1ww
                sql := 'DELETE FROM billadmin.pm_s_chg1ww WHERE charge_date <= (SELECT MAX(charge_date) FROM chkwwdate)';
                EXECUTE sql;
                GET DIAGNOSTICS act_rowcount2 = ROW_COUNT;

                IF act_rowcount2 > 0 THEN
                    ArchivedNumber := ArchivedNumber + act_rowcount2;
                END IF;

                -- Similarly handle pm_s_chg1ww_avg, pm_s_chg2ww, pm_s_chg2ww_avg, pm_s_chg1dd, pm_s_chg1dd_avg
                -- Repeat the logic for other tables like pm_s_chg1ww_avg, pm_s_chg2ww, etc. using dynamic SQL

                -- Final commit after successful operation
                COMMIT;
                ArchiveTotalNumber := ArchiveTotalNumber + ArchivedNumber;

                IF ArchivedNumber < Max_recs THEN
                    n_continue := 2;
                END IF;
            EXCEPTION WHEN OTHERS THEN
                -- Rollback transaction in case of error
                ROLLBACK;
                ArchiveErrorTotalNumber := ArchiveErrorTotalNumber + ArchivedNumber;
                local_c_errmsg := 'ERROR: Archive operation failed: ' || SQLERRM;
                RAISE NOTICE '%', local_c_errmsg;
                n_continue := 3;
            END;
        END;

        IF n_continue = 3 THEN
            -- Log error details if any failure occurs
            INSERT INTO enterprise.alert (alertkey, modulename, alertmessage)
            VALUES ((SELECT COALESCE(MAX(alertkey), 0) + 1 FROM enterprise.alert), ModuleName, local_c_errmsg);
        END IF;
    END LOOP;

    -- Final message
    local_c_msg := 'BILLING_WEEKREPORTING_Purge Finish - ' || ArchiveTotalNumber || ' records deleted successfully, ' || ArchiveErrorTotalNumber || ' records failed.';
    INSERT INTO enterprise.alert (alertkey, modulename, alertmessage)
    VALUES ((SELECT COALESCE(MAX(alertkey), 0) + 1 FROM enterprise.alert), ModuleName, local_c_msg);
    RAISE NOTICE '%', local_c_msg;
END;
$$;

CREATE OR REPLACE PROCEDURE billadmin.DBArchive_Wrapper(
    DBName VARCHAR(30),
    SchemaName VARCHAR(30),
    ProcName VARCHAR(30),
    Arc_days VARCHAR(50),
    NumberOfRecs VARCHAR(50)
)
LANGUAGE plpgsql
AS $$
DECLARE
    wsql TEXT;
BEGIN
    wsql := FORMAT('CALL %I.%I(Arc_days := %L, Max_recs := %L)', SchemaName, ProcName, Arc_days, NumberOfRecs);
    EXECUTE wsql;
END;
$$;

CREATE OR REPLACE PROCEDURE billadmin.DBArchive_Wrapper_Cloud(
    DBName VARCHAR(30),
    SchemaName VARCHAR(30),
    ProcName VARCHAR(30),
    Arc_days VARCHAR(50),
    NumberOfRecs VARCHAR(50),
    DeploymentModel VARCHAR(20)
)
LANGUAGE plpgsql
AS $$
DECLARE
    wsql TEXT;
BEGIN
    wsql := FORMAT('CALL %I.%I(Arc_days := %L, Max_recs := %L)', SchemaName, ProcName, Arc_days, NumberOfRecs);
    EXECUTE wsql;
END;
$$;

CREATE OR REPLACE PROCEDURE billadmin.purge_transactional_data(p_warehouse VARCHAR(30))
LANGUAGE plpgsql
AS $$
DECLARE
    tables RECORD;
    v_table_name VARCHAR(30);
    v_where_clause VARCHAR(1000);
    v_warehouse VARCHAR(30);
    v_sql TEXT;
    cursor_table_name CURSOR FOR
        SELECT table_name, where_clause
        FROM (
            VALUES 
                ('BIC_CHARGE_DIST', NULL),
                ('BIC_CHARGE', NULL),
                ('BIC_COST_BALANCE', NULL),
                ('BIC_COST_DIST', NULL),
                ('BIC_COST', NULL),
                ('BIC_HIST_CHARGE', NULL),
                ('BIC_HIST_CHGDIST', NULL),
                ('BIC_INVENTORY_BAL', NULL),
                ('BIC_INVENTORY_UDF', NULL),
                ('BIC_INVENTORY_UOM', NULL),
                ('BIC_INVLOC_BAL', NULL),
                ('BIC_INVENTORY', NULL),
                ('BIC_INVOICE', NULL),
                ('BIC_INVOICE_BATCH', NULL),
                ('BIC_ORDER_DETAIL', NULL),
                ('BIC_ORDER_HISTORY', NULL),
                ('BIC_QUERY_TEMP', NULL),
                ('PM_S_CHARGEALL', NULL),
                ('PM_S_CHARGECUST', NULL),
                ('PM_S_CHARGEDEPT', NULL),
                ('PM_S_CHG1DD', NULL),
                ('PM_S_CHG1DD_AVG', NULL),
                ('PM_S_CHG1MM', NULL),
                ('PM_S_CHG1MM_AVG', NULL),
                ('PM_S_CHG1WW', NULL),
                ('PM_S_CHG1WW_AVG', NULL),
                ('PM_S_CHG2MM', NULL),
                ('PM_S_CHG2MM_AVG', NULL),
                ('PM_S_CHG2WW', NULL),
                ('PM_S_CHG2WW_AVG', NULL),
                ('PM_S_CHG3DD', NULL)
        ) AS tables(table_name, where_clause);
BEGIN
    v_warehouse := lower(p_warehouse);
    
    -- Update where clauses for specific tables
    UPDATE tables
    SET where_clause = 'WHERE lower(FACILITY_ID) = ' || quote_literal(v_warehouse)
    WHERE table_name IN ('BIC_CHARGE', 'BIC_CHARGE_DIST', 'BIC_COST', 'BIC_COST_BALANCE', 'BIC_COST_DIST', 'BIC_HIST_CHARGE', 'BIC_HIST_CHGDIST', 'BIC_INVENTORY', 'BIC_ORDER_DETAIL', 'BIC_ORDER_HISTORY');

    UPDATE tables
    SET where_clause = 'WHERE INVENTORY_KEY IN (SELECT INVENTORY_KEY FROM BIC_INVENTORY WHERE lower(FACILITY_ID) = ' || quote_literal(v_warehouse) || ')'
    WHERE table_name IN ('BIC_INVENTORY_BAL', 'BIC_INVENTORY_UDF', 'BIC_INVENTORY_UOM', 'BIC_INVLOC_BAL');

    UPDATE tables
    SET where_clause = 'WHERE lower(FACILITY_ID) = ' || quote_literal(v_warehouse) || ' AND INVOICE_NO NOT IN (SELECT INVOICE_NO FROM BIC_CHARGE)'
    WHERE table_name = 'BIC_INVOICE';

    UPDATE tables
    SET where_clause = 'WHERE BATCH_NO NOT IN (SELECT BATCH_NO FROM BIC_INVOICE)'
    WHERE table_name = 'BIC_INVOICE_BATCH';

    -- Open cursor and process each table
    OPEN cursor_table_name;
    LOOP
        FETCH cursor_table_name INTO v_table_name, v_where_clause;
        EXIT WHEN NOT FOUND;
        
        -- Check if table exists and if any foreign keys exist
        IF EXISTS (SELECT 1 FROM information_schema.tables WHERE table_name = v_table_name AND table_schema = current_schema()) THEN
            IF v_where_clause IS NOT NULL THEN
                v_sql := 'DELETE FROM ' || current_schema() || '.' || v_table_name || ' ' || v_where_clause;
                EXECUTE v_sql;
            ELSE
                v_sql := 'TRUNCATE TABLE ' || current_schema() || '.' || v_table_name;
                EXECUTE v_sql;
            END IF;
        END IF;
    END LOOP;

    CLOSE cursor_table_name;
END;
$$;
