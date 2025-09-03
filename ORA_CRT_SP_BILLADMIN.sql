CREATE OR REPLACE PROCEDURE BILLADMIN.PROCEDURE sp_sce_user_anonymization (
    curuser IN NVARCHAR2,
    newuser IN NVARCHAR2,
    ANONYMIZATION_TYPE IN INT DEFAULT -1,
    RUN_ORDER IN INT DEFAULT -1,
    anonymize_audit IN CHAR DEFAULT 'N',
    tenant_id IN NVARCHAR2 DEFAULT 'INFOR') AS
    tablename NVARCHAR2(256);
    columnname NVARCHAR2(256);
    sqlStantment NVARCHAR2(1000);
    sqltoexecute NVARCHAR2(1000);
    v_new_value NVARCHAR2(256);
    v_old_value NVARCHAR2(256);
    v_isaudit NVARCHAR2(1);
    v_continue CHAR(1);
    v_anonymization_operation NVARCHAR2(1);
    v_tenant_column NVARCHAR2(256);
    v_ANONYMIZATION_TYPE INT;
    v_RUN_ORDER INT;
    v_cursor SYS_REFCURSOR;
BEGIN
    v_old_value := curuser;
    v_new_value := newuser;
    v_ANONYMIZATION_TYPE := ANONYMIZATION_TYPE;
    v_RUN_ORDER := RUN_ORDER;
    IF (ANONYMIZATION_TYPE = -1 AND RUN_ORDER = -1) THEN
        OPEN v_cursor FOR
            'SELECT table_name, column_name, isaudit, anonymization_operation, anonymization_instruction ' ||
            'FROM USER_ANONYMIZATION_RULES ' ||
            'ORDER BY RUN_ORDER ASC';
    ELSE
        OPEN v_cursor FOR
            'SELECT table_name, column_name, isaudit, anonymization_operation, anonymization_instruction ' ||
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