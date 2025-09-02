--*****************************************************
--	Billing Views
--*****************************************************
--/**---------------------------------------------------------------------------------------
--/* Script			: crt_view_billing.sql
--/* Author			: Sridevi Tadisetti  
--/* Product		: Infor SCE Suite 
--/* Component		: Billing - Version 12.7
--/* Date			: 18/06/2025        
--/* Description	: Script to create Views for Billing
--/* RDBMS			: Postgresql
--/* Schema			: Billing
--/* Modification History:
--/*----------------------------------------------------------------------------------------
--/* Modified by	Date			Description    
--/*----------------------------------------------------------------------------------------
--/* 
--/*
--/*-----------------------------------------------------------------------------------------


 -- The query should be run at Postgresql with Postgres user


CREATE or REPLACE VIEW BILLADMIN.BIC_BILL_TO AS SELECT STORERKEY BILL_TO_CUST,
          COMPANY NAME,
          ADDRESS1 ADR1,
          ADDRESS2 ADR2,
          ADDRESS3 ADR3,
	      ADDRESS4 ADR4,
	  	  ADDRESS5 ADR5,
	  	  ADDRESS6 ADR6,
          CITY,
          STATE STATE_PROVINCE,
          ZIP,
          ISOCNTRYCODE COUNTRY_CODE,
          COUNTRY COUNTRY_NAME,
          CONTACT1,
          EMAIL1,
          PHONE1 PHONE,
          FAX1 FAX,
          CONTACT2,
          EMAIL2,
          PHONE2 PHONE2,
          FAX2 FAX2,         
	  	  NOTES1 BILL_TO_COMMENT,
          CURRCODE CURR_CODE,
          TAXEXEMPT TAX_EXEMPT,
          TAXEXEMPTCODE TAX_EXEMPT_CODE,
          INVOICETERMS INVOICE_TERMS,
		  SCAC_CODE SCAC,
		  VAT,
		  B_ADDRESS1 BILL_ADR1,
		  B_ADDRESS2 BILL_ADR2,
		  B_ADDRESS3 BILL_ADR3,
		  B_ADDRESS4 BILL_ADR4,
		  B_CITY BILL_CITY,
		  B_STATE BILL_STATE_PROVINCE,
	 	  B_ZIP BILL_ZIP,
		  B_ISOCNTRYCODE BILL_COUNTRY_CODE,
		  B_COUNTRY BILL_COUNTRY_NAME,
		  B_CONTACT1 BILL_CONTACT1,
          B_EMAIL1 BILL_EMAIL1,
          B_PHONE1 BILL_PHONE,
          B_FAX1 BILL_FAX,
		  B_CONTACT2 BILL_CONTACT2,
          B_EMAIL2 BILL_EMAIL2,
          B_PHONE2 BILL_PHONE2,
          B_FAX2 BILL_FAX2,
          LOCALE BILL_LOCALE,
		  SUSR1 BILL_TO_UDF1,
	 	  SUSR2 BILL_TO_UDF2,
	 	  SUSR3 BILL_TO_UDF3,
	 	  SUSR4 BILL_TO_UDF4,
	 	  SUSR5 BILL_TO_UDF5,
		  EXT_UDF_STR1 BILL_TEXT_UDF1,
	  	  EXT_UDF_STR2 BILL_TEXT_UDF2,
	  	  EXT_UDF_STR3 BILL_TEXT_UDF3,
	  	  EXT_UDF_STR4 BILL_TEXT_UDF4,
	  	  EXT_UDF_STR5 BILL_TEXT_UDF5,
		  EXT_UDF_DATE1 BILL_DATE_UDF1,
	 	  EXT_UDF_DATE2 BILL_DATE_UDF2,
	 	  EXT_UDF_DATE3 BILL_DATE_UDF3,
	 	  EXT_UDF_DATE4 BILL_DATE_UDF4,
	 	  EXT_UDF_DATE5 BILL_DATE_UDF5,
		  EXT_UDF_FLOAT1 BILL_NUM_UDF1,
	 	  EXT_UDF_FLOAT2 BILL_NUM_UDF2,
	 	  EXT_UDF_FLOAT3 BILL_NUM_UDF3,
	 	  EXT_UDF_FLOAT4 BILL_NUM_UDF4,
	 	  EXT_UDF_FLOAT5 BILL_NUM_UDF5
     FROM ENTERPRISE.STORER 
    WHERE STORER.TYPE = '14';
	
CREATE or REPLACE VIEW BILLADMIN.BIC_CARRIER AS SELECT STORERKEY CARRIER_CODE,
          COMPANY NAME,
          ADDRESS1 ADDR1,
          ADDRESS2 ADDR2,
          ADDRESS3 ADDR3,
          CITY,
          STATE STATE_PROVINCE,
          ZIP,
          ISOCNTRYCODE COUNTRY_CODE,
          COUNTRY COUNTRY_NAME,
          PHONE1 PHONE,
          FAX1 FAX,
          CONTACT1,
          EMAIL1,
          CONTACT2,
          EMAIL2,
          NOTES1 CARRIER_COMMENT,
          CURRCODE CURR_CODE,
		  SUSR1 CAR_UDF1,
		  SUSR2 CAR_UDF2,
		  SUSR3 CAR_UDF3,
		  SUSR4 CAR_UDF4,
		  SUSR5 CAR_UDF5,
		  EXT_UDF_STR1 CAR_TEXT_UDF1,
		  EXT_UDF_STR2 CAR_TEXT_UDF2,
		  EXT_UDF_STR3 CAR_TEXT_UDF3,
		  EXT_UDF_STR4 CAR_TEXT_UDF4,
		  EXT_UDF_STR5 CAR_TEXT_UDF5
     FROM ENTERPRISE.STORER 
    WHERE STORER.TYPE = '3';
CREATE or REPLACE VIEW BILLADMIN.BIC_CODE_FILTCONN AS SELECT CODE CONNECTOR,
          DESCRIPTION CONNECTOR_DESC,
          'en' LANGUAGE,
          SERIALKEY ROW_KEY
     FROM ENTERPRISE.CODELKUP 
    WHERE LISTNAME = 'ANDOR';
CREATE or REPLACE VIEW BILLADMIN.BIC_CODE_FILTOPER AS SELECT CODE OPERATOR,
          DESCRIPTION OPERATOR_DESC,
          'en' LANGUAGE,
          SERIALKEY ROW_KEY
     FROM ENTERPRISE.CODELKUP 
    WHERE LISTNAME = 'OPERATOR';
CREATE or REPLACE VIEW BILLADMIN.BIC_CODE_INVLEVEL AS SELECT CODE INVOICE_LEVEL,
          DESCRIPTION INV_LEVEL_DESC,
          'en' LANGUAGE,
          SERIALKEY ROW_KEY
     FROM ENTERPRISE.CODELKUP 
    WHERE LISTNAME = 'INVLEVEL';
CREATE or REPLACE VIEW BILLADMIN.BIC_CODE_MARKTYPE AS SELECT CODE MARKUP_TYPE,
          DESCRIPTION MARKUP_TYPE_DESC,
          'en' LANGUAGE,
          SERIALKEY ROW_KEY
     FROM ENTERPRISE.CODELKUP 
    WHERE LISTNAME = 'MARKTYPE';
CREATE or REPLACE VIEW BILLADMIN.BIC_CODE_MEASURE AS SELECT CODE MEASURE_CODE,
          DESCRIPTION MEASURE_DESC,
          'en' LANGUAGE,
          SERIALKEY ROW_KEY
     FROM ENTERPRISE.CODELKUP 
    WHERE LISTNAME = 'MEASURESYS';
CREATE or REPLACE VIEW BILLADMIN.BIC_CODE_NNLEVEL AS SELECT CODE NONNEG_LEVEL,
          DESCRIPTION NONNEG_LEVEL_DESC,
          'en' LANGUAGE,
          SERIALKEY ROW_KEY
     FROM ENTERPRISE.CODELKUP 
    WHERE LISTNAME = 'NONNEGLVL';
CREATE or REPLACE VIEW BILLADMIN.BIC_CODE_PERQUAL AS SELECT CODE PERIOD_QUAL,
          DESCRIPTION PERIOD_QUAL_DESC,
          'en' LANGUAGE,
          SERIALKEY ROW_KEY
     FROM ENTERPRISE.CODELKUP 
    WHERE LISTNAME = 'PERQUAL';
CREATE or REPLACE VIEW BILLADMIN.BIC_CODE_RNDMETH AS SELECT CODE ROUNDING_METH,
          DESCRIPTION METHOD_DESC,
          'en' LANGUAGE,
          SERIALKEY ROW_KEY
     FROM ENTERPRISE.CODELKUP 
    WHERE LISTNAME = 'RNDMETH';
CREATE or REPLACE VIEW BILLADMIN.BIC_CODE_SENDMETH AS SELECT CODE SEND_METHOD,
          DESCRIPTION METHOD_DESC,
          'en' LANGUAGE,
          SERIALKEY ROW_KEY
     FROM ENTERPRISE.CODELKUP 
    WHERE LISTNAME = 'SENDMETH';
CREATE or REPLACE VIEW BILLADMIN.BIC_CODE_STRGTYPE AS SELECT CODE STORAGE_TYPE,
          DESCRIPTION TYPE_DESC,
          'en' LANGUAGE,
          SERIALKEY ROW_KEY
     FROM ENTERPRISE.CODELKUP 
    WHERE LISTNAME = 'STORTYPE';
CREATE or REPLACE VIEW BILLADMIN.BIC_CODE_UOMTYPE AS SELECT CODE UOM_TYPE_CODE,
          DESCRIPTION UOM_TYPE_DESC,
          'en' LANGUAGE,
          SERIALKEY ROW_KEY
     FROM ENTERPRISE.CODELKUP 
    WHERE LISTNAME = 'UOMTYPE';
	
CREATE or REPLACE VIEW BILLADMIN.BIC_WM_COUNTRY AS SELECT CODE COUNTRY_CODE,
          DESCRIPTION COUNTRY_NAME,
          SERIALKEY ROW_KEY
     FROM ENTERPRISE.CODELKUP 
    WHERE LISTNAME = 'ISOCOUNTRY'
      AND ACTIVE = '1';
CREATE or REPLACE VIEW BILLADMIN.BIC_COUNTRY AS SELECT COUNTRY_CODE, COUNTRY_CODE COUNTRY_CODE_3, COUNTRY_CODE COUNTRY_NO, COUNTRY_NAME, 
  ' ' MEASURE_CODE, ' ' WGT_UOM, ' ' DIMEN_UOM, ' ' CUBE_UOM, ' ' MILEAGE_UOM, ' ' CURR_CODE, ' ' DEF_LANG, ROW_KEY 
from Billadmin.BIC_WM_COUNTRY;
CREATE or REPLACE VIEW BILLADMIN.BIC_CUSTOMER AS SELECT STORERKEY CUST_CODE,
          COMPANY NAME,
          ADDRESS1 ADR1,
          ADDRESS2 ADR2,
          ADDRESS3 ADR3,
          CITY,
          STATE STATE_PROVINCE,
          ZIP,
          ISOCNTRYCODE COUNTRY_CODE,
          COUNTRY COUNTRY_NAME,
          PHONE1 PHONE,
          FAX1 FAX,
          CONTACT1,
          EMAIL1,
          CONTACT2,
          EMAIL2,
          NOTES1 CUST_COMMENT,
          MEASURECODE MEASURE_CODE, 
	      WGTUOM WGT_UOM, 
	      DIMENUOM DIMEN_UOM, 
	      CUBEUOM CUBE_UOM, 
	      INVOICETERMS INVOICE_TERMS, 
	      ARCORP AR_CORP, 
	      ARDEPT AR_DEPT, 
          ARACCT AR_ACCT, 
	      INVOICELEVEL INVOICE_LEVEL, 
	      NONNEGLEVEL NONNEG_LEVEL, 
          TAXEXEMPTCODE TAXID, 
	      CURRCODE CURR_CODE, 
	      RECURCODE RECUR_CODE, 
          QFSURCHARGE QF_SURCHARGE, 
	      BFSURCHARGE BF_SURCHARGE, 
	      DUNSID,
	      B_CONTACT1 BILL_CONTACT1, 
	      B_PHONE1 BILL_PHONE, 
	      B_FAX1 BILL_FAX, 
	      B_EMAIL1 BILL_EMAIL1,
	      SUSR1 UDF1,
	      SUSR2 UDF2,
	      SUSR3 UDF3,
	      SUSR4 UDF4,
	      SUSR5 UDF5,
	      SUSR6 UDF6,
	      LOCALE,
	      TAXEXEMPT TAX_EXEMPT
     FROM ENTERPRISE.STORER 
    WHERE STORER.TYPE = '1';
CREATE or REPLACE VIEW BILLADMIN.BIC_ITEM AS SELECT  SKU ITEM, ' ' PKG, STORERKEY CUST_CODE, DESCR ITEM_DESC, RECURCODE RECUR_CODE, ' ' UPCID, ' ' EPCID,
  WGTUOM WGT_UOM, DIMENUOM DIMEN_UOM, CUBEUOM CUBE_UOM, ' ' ITEM_CLASS, FREIGHTCLASS FR_CLASS, CLASS INV_CLASS,
  ' ' TARIFF_CLASS, ' ' TARIFF_DESC, NMFCCLASS NMFC_CLASS, ' ' HAZ_CLASS, MANUFACTURERSKU MANUFACTURER_SKU, 
  RETAILSKU RETAIL_SKU, PRICE PRICE, STDORDERCOST STD_COST, CARRYCOST CARRY_COST,
  TARE TARE_WGT, STDGROSSWGT STD_GRS_WGT, STDNETWGT STD_NET_WGT, STDCUBE STD_CUBE, 
  BUSR1 USER1, BUSR2 USER2, BUSR3 USER3, BUSR4 USER4, BUSR5 USER5, 
  BUSR6 USER6, BUSR7 USER7, BUSR8 USER8, BUSR9 USER9, BUSR10 USER10,
  ' ' ITEM_LINE_NAME, ' ' ITEM_LINE_DESC, ' ' ITEM_CAT_NAME, ' ' ITEM_CAT_DESC, 
  ' ' ITEM_BRAND_NAME, ' ' ITEM_BRAND_DESC, SKUGROUP SKU_GROUP,
  LOTTABLE01LABEL LOT01_LABEL, LOTTABLE02LABEL LOT02_LABEL, LOTTABLE03LABEL LOT03_LABEL, LOTTABLE04LABEL LOT04_LABEL, 
  LOTTABLE05LABEL LOT05_LABEL, LOTTABLE06LABEL LOT06_LABEL, LOTTABLE07LABEL LOT07_LABEL, LOTTABLE08LABEL LOT08_LABEL, 
  LOTTABLE09LABEL LOT09_LABEL, LOTTABLE10LABEL LOT10_LABEL, LOTTABLE11LABEL LOT11_LABEL, LOTTABLE12LABEL LOT12_LABEL,
  STORAGETYPE STORAGE_TYPE, PACKKEY UNIT_KEY, ADDDATE, ADDWHO, EDITDATE, EDITWHO
	FROM ENTERPRISE.SKU;
CREATE or REPLACE VIEW BILLADMIN.BIC_PARTNER AS SELECT STORERKEY PARTNER_CODE,
          TYPE MATCH_TYPE,
          COMPANY NAME,
          ADDRESS1 ADR1,
          ADDRESS2 ADR2,
          ADDRESS3 ADR3,
          CITY,
          STATE STATE_PROVINCE,
          ZIP,
          ISOCNTRYCODE COUNTRY_CODE,
          COUNTRY COUNTRY_NAME,
          PHONE1 PHONE,
          FAX1 FAX,
          CONTACT1,
          EMAIL1,
          CONTACT2,
          EMAIL2,
          NOTES1 PARTNER_COMMENT,
          CURRCODE CURR_CODE,
          TAXEXEMPT TAX_EXEMPT,
          TAXEXEMPTCODE TAX_EXEMPT_CODE,
          INVOICETERMS INVOICE_TERMS
     FROM ENTERPRISE.STORER 
    WHERE STORER.TYPE IN ( '2','5','12' );

CREATE or REPLACE VIEW BILLADMIN.BIC_WM_CURRENCY AS SELECT CODE CURR_CODE,
          DESCRIPTION CURR_DESC,
          SERIALKEY ROW_KEY
     FROM ENTERPRISE.CODELKUP 
    WHERE LISTNAME = 'CURRCODE'
      AND ACTIVE = '1';
CREATE or REPLACE VIEW BILLADMIN.BIC_WM_FACILITY AS SELECT STORERKEY FACILITY_CODE,
          COMPANY NAME,
          ADDRESS1 ADR1,
          ADDRESS2 ADR2,
          ADDRESS3 ADR3,
          CITY,
          STATE STATE_PROVINCE,
          ZIP,
          ISOCNTRYCODE COUNTRY_CODE,
          COUNTRY COUNTRY_NAME,
          PHONE1 PHONE,
          FAX1 FAX,
          CONTACT1,
          EMAIL1,
          CONTACT2,
          EMAIL2,
          NOTES1 FACILITY_COMMENT,
          CURRCODE CURR_CODE,
          TAXEXEMPT TAX_EXEMPT,
          TAXEXEMPTCODE TAX_EXEMPT_CODE,
          INVOICETERMS INVOICE_TERMS,
          B_CONTACT1 BILL_CONTACT1, 
          B_PHONE1 BILL_PHONE, 
          B_FAX1 BILL_FAX, 
          B_EMAIL1 BILL_EMAIL1
     FROM ENTERPRISE.STORER 
    WHERE STORER.TYPE = '7';
CREATE or REPLACE VIEW BILLADMIN.BIC_WM_ITEMUOM AS SELECT SKU.SKU ITEM, ' ' PKG, SKU.STORERKEY CUST_CODE,
	PACK.PACKUOM3 UOM1, PACK.PACKUOM3 UOM1_DESC,
	PACK.PACKUOM2 UOM2, PACK.PACKUOM2 UOM2_DESC,
	PACK.PACKUOM1 UOM3, PACK.PACKUOM1 UOM3_DESC,
	PACK.PACKUOM4 UOM4, PACK.PACKUOM4 UOM4_DESC,
	PACK.PACKUOM2 UOM_INNER, PACK.PACKUOM1 UOM_CRTN, PACK.PACKUOM4 UOM_LOAD,
	PACK.INNERPACK UOM_1_IN_2, PACK.CASECNT UOM_1_IN_3,
	PACK.PALLET UOM_1_IN_4,
	PACK.HEIGHTUOM3 UOM1_HGT, PACK.WIDTHUOM3 UOM1_WID,
	PACK.LENGTHUOM3 UOM1_DPTH, PACK.NETWGT UOM1_WGT,
	PACK.HEIGHTUOM2 UOM2_HGT, PACK.WIDTHUOM2 UOM2_WID,
	PACK.LENGTHUOM2 UOM2_DPTH, PACK.NETWGT*PACK.INNERPACK UOM2_WGT,
	PACK.HEIGHTUOM1 UOM3_HGT, PACK.WIDTHUOM1 UOM3_WID,
	PACK.LENGTHUOM1 UOM3_DPTH, PACK.NETWGT*PACK.CASECNT UOM3_WGT,
	PACK.HEIGHTUOM4 UOM4_HGT, PACK.WIDTHUOM4 UOM4_WID,
	PACK.LENGTHUOM4 UOM4_DPTH, PACK.NETWGT*PACK.PALLET UOM4_WGT,
	SKU.WGTUOM SKU_WGTUOM, SKU.DIMENUOM SKU_DIMENUOM, SKU.CUBEUOM SKU_CUBEUOM,
	SKU.STDGROSSWGT SKU_GRSWGT, SKU.STDNETWGT SKU_NETWGT,
	SKU.TARE SKU_TARE, SKU.STDCUBE SKU_CUBE, SKU.PACKKEY SKU_UNITKEY,
	SKU.PRICE SKU_PRICE, SKU.COST SKU_COST
from ENTERPRISE.SKU, ENTERPRISE.PACK
where SKU.PACKKEY = PACK.PACKKEY;
CREATE or REPLACE VIEW BILLADMIN.BIC_WM_REPORT AS SELECT SERIALKEY, WHSEID, RPT_ID, RPT_DATAWINDOW, RPT_LIBRARY, RPT_TITLE, RPT_PURPOSE, RPT_DESCR, RPT_HEADER, RPT_ACTIVE, RPT_TYPE, 
 		   RPT_WHERE, RPT_FILTER, RPT_SORT, ENABLE_FILTER, ENABLE_SORT, AUTORETRIEVE, CATEGORY_ID, SHOW_CRITERIA, QUERY_MODE, 
 		   SHARED_RPT_ID, RPT_URL, CANACCESS, BIRTRPT_URL, PRINTOPTION, DEFAULTPRINTER, CUSTOMREPORTTYPE, SOURCEVERSION, 
 		   ADDDATE, ADDWHO, EDITDATE, EDITWHO, BASE_REPORT, COMMENTS, BIRSTURL, BIRST_REPORTPATH 
	  FROM ENTERPRISE.PBSRPT_REPORTS 
	WHERE RPT_ID LIKE 'BILL%';
CREATE or REPLACE VIEW BILLADMIN.BIC_WM_RPTCATG AS SELECT SERIALKEY, WHSEID, CATEGORY_ID, CATEGORY, ADDDATE, ADDWHO, EDITDATE, EDITWHO
	FROM ENTERPRISE.PBSRPT_CATEGORY;
CREATE or REPLACE VIEW BILLADMIN.BIC_WM_RPTINV AS SELECT SERIALKEY, WHSEID, RPT_ID, RPT_DATAWINDOW, RPT_LIBRARY, RPT_TITLE, RPT_PURPOSE, RPT_DESCR, RPT_HEADER, RPT_ACTIVE, RPT_TYPE, 
 		   RPT_WHERE, RPT_FILTER, RPT_SORT, ENABLE_FILTER, ENABLE_SORT, AUTORETRIEVE, CATEGORY_ID, SHOW_CRITERIA, QUERY_MODE, 
 		   SHARED_RPT_ID, RPT_URL, CANACCESS, BIRTRPT_URL, PRINTOPTION, DEFAULTPRINTER, CUSTOMREPORTTYPE, SOURCEVERSION, 
 		   ADDDATE, ADDWHO, EDITDATE, EDITWHO, BASE_REPORT, COMMENTS, BIRSTURL, BIRST_REPORTPATH  
	  FROM ENTERPRISE.PBSRPT_REPORTS 
	WHERE RPT_ID LIKE 'BILL%' AND RPT_ID NOT IN ('BILL17','BILL18');
CREATE or REPLACE VIEW BILLADMIN.BIC_WM_RPTREG AS SELECT SERIALKEY, WHSEID, RPT_ID, RPT_DATAWINDOW, RPT_LIBRARY, RPT_TITLE, RPT_PURPOSE, RPT_DESCR, RPT_HEADER, RPT_ACTIVE, RPT_TYPE, 
 		   RPT_WHERE, RPT_FILTER, RPT_SORT, ENABLE_FILTER, ENABLE_SORT, AUTORETRIEVE, CATEGORY_ID, SHOW_CRITERIA, QUERY_MODE, 
 		   SHARED_RPT_ID, RPT_URL, CANACCESS, BIRTRPT_URL, PRINTOPTION, DEFAULTPRINTER, CUSTOMREPORTTYPE, SOURCEVERSION, 
 		   ADDDATE, ADDWHO, EDITDATE, EDITWHO, BASE_REPORT, COMMENTS, BIRSTURL, BIRST_REPORTPATH  
	  FROM ENTERPRISE.PBSRPT_REPORTS 
	WHERE RPT_ID LIKE 'BILL%' AND RPT_ID IN ('BILL17','BILL18');
CREATE or REPLACE VIEW BILLADMIN.BIC_WM_TIMEZONE AS SELECT CODE TIMEZONE_CODE,
          DESCRIPTION TIMEZONE_GMTDESC,
	  LONG_VALUE AS TIMEZONE_DESC,
          SERIALKEY ROW_KEY
     FROM ENTERPRISE.CODELKUP 
    WHERE LISTNAME = 'TIMEZONE'
      AND ACTIVE = '1';
	  
CREATE or REPLACE VIEW BILLADMIN.PM_CHGMM_1 AS SELECT  EXTRACT(year FROM c.charge_date) AS charge_year
, TO_CHAR(c.charge_date,'MONTH') AS charge_month_name
, EXTRACT(month FROM c.charge_date) AS charge_month_num
, billto_code, cust_code, whse_code, corp_code, dept_code, SUM(charge_amt) AS charge_amt, SUM(num) AS num
from billadmin.pm_s_chg1mm c
GROUP BY  EXTRACT(year FROM c.charge_date), TO_CHAR(c.charge_date,'MONTH'), EXTRACT(month FROM c.charge_date)
, billto_code, cust_code, whse_code, corp_code, dept_code;

CREATE or REPLACE VIEW BILLADMIN.PM_CHG1MM_CUST_H AS SELECT EXTRACT(year FROM charge_date) AS charge_year, billto_code AS BillToKey, cust_code AS CustKey,
SUM(CASE EXTRACT(month FROM charge_date)  WHEN 1 THEN charge_amt  ELSE 0  END) AS AllJanSum, SUM(CASE EXTRACT(month FROM charge_date)  WHEN 2 THEN charge_amt  ELSE 0  END) AS AllFebSum, 
SUM(CASE EXTRACT(month FROM charge_date)  WHEN 3 THEN charge_amt  ELSE 0  END) AS AllMarSum, SUM(CASE EXTRACT(month FROM charge_date)  WHEN 4 THEN charge_amt  ELSE 0  END) AS AllAprSum, 
SUM(CASE EXTRACT(month FROM charge_date)  WHEN 5 THEN charge_amt  ELSE 0  END) AS AllMaySum, SUM(CASE EXTRACT(month FROM charge_date)  WHEN 6 THEN charge_amt  ELSE 0  END) AS AllJunSum, 
SUM(CASE EXTRACT(month FROM charge_date)  WHEN 7 THEN charge_amt  ELSE 0  END) AS AllJulSum, SUM(CASE EXTRACT(month FROM charge_date)  WHEN 8 THEN charge_amt  ELSE 0  END) AS AllAugSum, 
SUM(CASE EXTRACT(month FROM charge_date)  WHEN 9 THEN charge_amt  ELSE 0  END) AS AllSepSum, SUM(CASE EXTRACT(month FROM charge_date)  WHEN 10 THEN charge_amt  ELSE 0  END) AS AllOctSum, 
SUM(CASE EXTRACT(month FROM charge_date)  WHEN 11 THEN charge_amt  ELSE 0  END) AS AllNovSum, SUM(CASE EXTRACT(month FROM charge_date)  WHEN 12 THEN charge_amt  ELSE 0  END) AS AllDecSum, 
SUM(CASE EXTRACT(month FROM charge_date)  WHEN 1 THEN 1  ELSE 0  END) AS AllJanCnt, SUM(CASE EXTRACT(month FROM charge_date)  WHEN 2 THEN 1  ELSE 0  END) AS AllFebCnt, 
SUM(CASE EXTRACT(month FROM charge_date)  WHEN 3 THEN 1  ELSE 0  END) AS AllMarCnt, SUM(CASE EXTRACT(month FROM charge_date)  WHEN 4 THEN 1  ELSE 0  END) AS AllAprCnt, 
SUM(CASE EXTRACT(month FROM charge_date)  WHEN 5 THEN 1  ELSE 0  END) AS AllMayCnt, SUM(CASE EXTRACT(month FROM charge_date)  WHEN 6 THEN 1  ELSE 0  END) AS AllJunCnt, 
SUM(CASE EXTRACT(month FROM charge_date)  WHEN 7 THEN 1  ELSE 0  END) AS AllJulCnt, SUM(CASE EXTRACT(month FROM charge_date)  WHEN 8 THEN 1  ELSE 0  END) AS AllAugCnt, 
SUM(CASE EXTRACT(month FROM charge_date)  WHEN 9 THEN 1  ELSE 0  END) AS AllSepCnt, SUM(CASE EXTRACT(month FROM charge_date)  WHEN 10 THEN 1  ELSE 0  END) AS AllOctCnt, 
SUM(CASE EXTRACT(month FROM charge_date)  WHEN 11 THEN 1  ELSE 0  END) AS AllNovCnt, SUM(CASE EXTRACT(month FROM charge_date)  WHEN 12 THEN 1  ELSE 0  END) AS AllDecCnt, 
CASE  WHEN ( SUM(CASE EXTRACT(month FROM charge_date) WHEN 1 THEN 1 ELSE 0 END) = 0 ) THEN 0  WHEN ( SUM(CASE EXTRACT(month FROM charge_date) WHEN 1 THEN 1 ELSE 0 END) IS NULL ) THEN 0  ELSE ( SUM(CASE EXTRACT(month FROM charge_date) WHEN 1 THEN charge_amt ELSE 0 END) /     SUM(CASE EXTRACT(month FROM charge_date) WHEN 1 THEN 1 ELSE 0 END) ) END AS AllJanAvg, 
CASE  WHEN ( SUM(CASE EXTRACT(month FROM charge_date) WHEN 2 THEN 1 ELSE 0 END) = 0 ) THEN 0  WHEN ( SUM(CASE EXTRACT(month FROM charge_date) WHEN 2 THEN 1 ELSE 0 END) IS NULL ) THEN 0  ELSE ( SUM(CASE EXTRACT(month FROM charge_date) WHEN 2 THEN charge_amt ELSE 0 END) /     SUM(CASE EXTRACT(month FROM charge_date) WHEN 2 THEN 1 ELSE 0 END) ) END AS AllFebAvg, 
CASE  WHEN ( SUM(CASE EXTRACT(month FROM charge_date) WHEN 3 THEN 1 ELSE 0 END) = 0 ) THEN 0  WHEN ( SUM(CASE EXTRACT(month FROM charge_date) WHEN 3 THEN 1 ELSE 0 END) IS NULL ) THEN 0  ELSE ( SUM(CASE EXTRACT(month FROM charge_date) WHEN 3 THEN charge_amt ELSE 0 END) /     SUM(CASE EXTRACT(month FROM charge_date) WHEN 3 THEN 1 ELSE 0 END) ) END AS AllMarAvg, 
CASE  WHEN ( SUM(CASE EXTRACT(month FROM charge_date) WHEN 4 THEN 1 ELSE 0 END) = 0 ) THEN 0  WHEN ( SUM(CASE EXTRACT(month FROM charge_date) WHEN 4 THEN 1 ELSE 0 END) IS NULL ) THEN 0  ELSE ( SUM(CASE EXTRACT(month FROM charge_date) WHEN 4 THEN charge_amt ELSE 0 END) /     SUM(CASE EXTRACT(month FROM charge_date) WHEN 4 THEN 1 ELSE 0 END) ) END AS AllAprAvg,
CASE  WHEN ( SUM(CASE EXTRACT(month FROM charge_date) WHEN 5 THEN 1 ELSE 0 END) = 0 ) THEN 0  WHEN ( SUM(CASE EXTRACT(month FROM charge_date) WHEN 5 THEN 1 ELSE 0 END) IS NULL ) THEN 0  ELSE ( SUM(CASE EXTRACT(month FROM charge_date) WHEN 5 THEN charge_amt ELSE 0 END) /     SUM(CASE EXTRACT(month FROM charge_date) WHEN 5 THEN 1 ELSE 0 END) ) END AS AllMayAvg, 
CASE  WHEN ( SUM(CASE EXTRACT(month FROM charge_date) WHEN 6 THEN 1 ELSE 0 END) = 0 ) THEN 0  WHEN ( SUM(CASE EXTRACT(month FROM charge_date) WHEN 6 THEN 1 ELSE 0 END) IS NULL ) THEN 0  ELSE ( SUM(CASE EXTRACT(month FROM charge_date) WHEN 6 THEN charge_amt ELSE 0 END) /    SUM(CASE EXTRACT(month FROM charge_date) WHEN 6 THEN 1 ELSE 0 END) ) END AS AllJunAvg, 
CASE  WHEN ( SUM(CASE EXTRACT(month FROM charge_date) WHEN 7 THEN 1 ELSE 0 END) = 0 ) THEN 0  WHEN ( SUM(CASE EXTRACT(month FROM charge_date) WHEN 7 THEN 1 ELSE 0 END) IS NULL ) THEN 0  ELSE ( SUM(CASE EXTRACT(month FROM charge_date) WHEN 7 THEN charge_amt ELSE 0 END) /     SUM(CASE EXTRACT(month FROM charge_date) WHEN 7 THEN 1 ELSE 0 END) ) END AS AllJulAvg, 
CASE  WHEN ( SUM(CASE EXTRACT(month FROM charge_date) WHEN 8 THEN 1 ELSE 0 END) = 0 ) THEN 0  WHEN ( SUM(CASE EXTRACT(month FROM charge_date) WHEN 8 THEN 1 ELSE 0 END) IS NULL ) THEN 0  ELSE ( SUM(CASE EXTRACT(month FROM charge_date) WHEN 8 THEN charge_amt ELSE 0 END) /     SUM(CASE EXTRACT(month FROM charge_date) WHEN 8 THEN 1 ELSE 0 END) ) END AS AllAugAvg, 
CASE  WHEN ( SUM(CASE EXTRACT(month FROM charge_date) WHEN 9 THEN 1 ELSE 0 END) = 0 ) THEN 0  WHEN ( SUM(CASE EXTRACT(month FROM charge_date) WHEN 9 THEN 1 ELSE 0 END) IS NULL ) THEN 0  ELSE ( SUM(CASE EXTRACT(month FROM charge_date) WHEN 9 THEN charge_amt ELSE 0 END) /     SUM(CASE EXTRACT(month FROM charge_date) WHEN 9 THEN 1 ELSE 0 END) ) END AS AllSepAvg, 
CASE  WHEN ( SUM(CASE EXTRACT(month FROM charge_date) WHEN 10 THEN 1 ELSE 0 END) = 0 ) THEN 0  WHEN ( SUM(CASE EXTRACT(month FROM charge_date) WHEN 10 THEN 1 ELSE 0 END) IS NULL ) THEN 0  ELSE ( SUM(CASE EXTRACT(month FROM charge_date) WHEN 10 THEN charge_amt ELSE 0 END) /     SUM(CASE EXTRACT(month FROM charge_date) WHEN 10 THEN 1 ELSE 0 END) ) END AS AllOctAvg, 
CASE  WHEN ( SUM(CASE EXTRACT(month FROM charge_date) WHEN 11 THEN 1 ELSE 0 END) = 0 ) THEN 0  WHEN ( SUM(CASE EXTRACT(month FROM charge_date) WHEN 11 THEN 1 ELSE 0 END) IS NULL ) THEN 0  ELSE ( SUM(CASE EXTRACT(month FROM charge_date) WHEN 11 THEN charge_amt ELSE 0 END) /     SUM(CASE EXTRACT(month FROM charge_date) WHEN 11 THEN 1 ELSE 0 END) ) END AS AllNovAvg, 
CASE  WHEN ( SUM(CASE EXTRACT(month FROM charge_date) WHEN 12 THEN 1 ELSE 0 END) = 0 ) THEN 0  WHEN ( SUM(CASE EXTRACT(month FROM charge_date) WHEN 12 THEN 1 ELSE 0 END) IS NULL ) THEN 0  ELSE ( SUM(CASE EXTRACT(month FROM charge_date) WHEN 12 THEN charge_amt ELSE 0 END) /     SUM(CASE EXTRACT(month FROM charge_date) WHEN 12 THEN 1 ELSE 0 END) ) END AS AllDecAvg, 
SUM(CASE TO_NUMBER(TO_CHAR(charge_date,'Q'),'99')  WHEN 1 THEN charge_amt  ELSE 0  END) AS AllQ1Sum, SUM(CASE TO_NUMBER(TO_CHAR(charge_date,'Q'),'99')  WHEN 2 THEN charge_amt  ELSE 0  END) AS AllQ2Sum, 
SUM(CASE TO_NUMBER(TO_CHAR(charge_date,'Q'),'99')  WHEN 3 THEN charge_amt  ELSE 0  END) AS AllQ3Sum, SUM(CASE TO_NUMBER(TO_CHAR(charge_date,'Q'),'99')  WHEN 4 THEN charge_amt  ELSE 0  END) AS AllQ4Sum, 
SUM(CASE TO_NUMBER(TO_CHAR(charge_date,'Q'),'99')  WHEN 1 THEN 1  ELSE 0  END) AS AllQ1Cnt, SUM(CASE TO_NUMBER(TO_CHAR(charge_date,'Q'),'99')  WHEN 2 THEN 1  ELSE 0  END) AS AllQ2Cnt, 
SUM(CASE TO_NUMBER(TO_CHAR(charge_date,'Q'),'99')  WHEN 3 THEN 1  ELSE 0  END) AS AllQ3Cnt, SUM(CASE TO_NUMBER(TO_CHAR(charge_date,'Q'),'99')  WHEN 4 THEN 1  ELSE 0  END) AS AllQ4Cnt,
CASE  WHEN ( SUM(CASE TO_NUMBER(TO_CHAR(charge_date,'Q'),'99') WHEN 1 THEN 1 ELSE 0 END) = 0 ) THEN 0  WHEN ( SUM(CASE TO_NUMBER(TO_CHAR(charge_date,'Q'),'99') WHEN 1 THEN 1 ELSE 0 END) IS NULL ) THEN 0  ELSE ( SUM(CASE TO_NUMBER(TO_CHAR(charge_date,'Q'),'99') WHEN 1 THEN charge_amt ELSE 0 END) /  SUM(CASE TO_NUMBER(TO_CHAR(charge_date,'Q'),'99') WHEN 1 THEN 1 ELSE 0 END) ) END AS AllQ1Avg, 
CASE  WHEN ( SUM(CASE TO_NUMBER(TO_CHAR(charge_date,'Q'),'99') WHEN 2 THEN 1 ELSE 0 END) = 0 ) THEN 0  WHEN ( SUM(CASE TO_NUMBER(TO_CHAR(charge_date,'Q'),'99') WHEN 2 THEN 1 ELSE 0 END) IS NULL ) THEN 0  ELSE ( SUM(CASE TO_NUMBER(TO_CHAR(charge_date,'Q'),'99') WHEN 2 THEN charge_amt ELSE 0 END) /  SUM(CASE TO_NUMBER(TO_CHAR(charge_date,'Q'),'99') WHEN 2 THEN 1 ELSE 0 END) ) END AS AllQ2Avg, 
CASE  WHEN ( SUM(CASE TO_NUMBER(TO_CHAR(charge_date,'Q'),'99') WHEN 3 THEN 1 ELSE 0 END) = 0 ) THEN 0  WHEN ( SUM(CASE TO_NUMBER(TO_CHAR(charge_date,'Q'),'99') WHEN 3 THEN 1 ELSE 0 END) IS NULL ) THEN 0  ELSE ( SUM(CASE TO_NUMBER(TO_CHAR(charge_date,'Q'),'99') WHEN 3 THEN charge_amt ELSE 0 END) /  SUM(CASE TO_NUMBER(TO_CHAR(charge_date,'Q'),'99') WHEN 3 THEN 1 ELSE 0 END) ) END AS AllQ3Avg, 
CASE  WHEN ( SUM(CASE TO_NUMBER(TO_CHAR(charge_date,'Q'),'99') WHEN 4 THEN 1 ELSE 0 END) = 0 ) THEN 0  WHEN ( SUM(CASE TO_NUMBER(TO_CHAR(charge_date,'Q'),'99') WHEN 4 THEN 1 ELSE 0 END) IS NULL ) THEN 0  ELSE ( SUM(CASE TO_NUMBER(TO_CHAR(charge_date,'Q'),'99') WHEN 4 THEN charge_amt ELSE 0 END) /  SUM(CASE TO_NUMBER(TO_CHAR(charge_date,'Q'),'99') WHEN 4 THEN 1 ELSE 0 END) ) END AS AllQ4Avg,
TO_CHAR(EXTRACT(year FROM charge_date),'YYYY') AS CHARYEAR
from billadmin.pm_s_chg1mm charge GROUP BY EXTRACT(year FROM charge_date), billto_code, cust_code;

CREATE or REPLACE VIEW BILLADMIN.PM_CHGMM_RANK1 AS SELECT c.billto_code
, charge_year, charge_month_num, charge_month_name
, c.charge_amt
, RANK() OVER (PARTITION BY charge_year, charge_month_num ORDER BY c.charge_amt DESC) AS Rank
, DENSE_RANK() OVER (PARTITION BY charge_year, charge_month_num ORDER BY c.charge_amt DESC) AS DenseRank
, NTILE(4) OVER (PARTITION BY charge_year, charge_month_num ORDER BY c.charge_amt DESC) AS Quartile
, NTILE(10) OVER (PARTITION BY charge_year, charge_month_num ORDER BY c.charge_amt DESC) AS Tenths
, NTILE(100) OVER (PARTITION BY charge_year, charge_month_num ORDER BY c.charge_amt DESC) AS Percentage
from billadmin.pm_chgmm_1 c;
CREATE or REPLACE VIEW BILLADMIN.PM_CHGYY_1 AS SELECT EXTRACT(year from billadmin.pm_s_chg1mm.charge_date) AS charge_date
, billto_code, cust_code, whse_code, corp_code, dept_code, SUM(charge_amt) AS charge_amt, SUM(num) AS num
from billadmin.pm_s_chg1mm
GROUP BY EXTRACT(year from billadmin.pm_s_chg1mm.charge_date), billto_code, cust_code, whse_code, corp_code, dept_code;
CREATE or REPLACE VIEW BILLADMIN.PM_CHGYY_RANK1 AS SELECT c.billto_code
, c.charge_date AS ChargeYear
, c.charge_amt
, RANK() OVER (PARTITION BY c.charge_date ORDER BY c.charge_amt DESC) AS Rank
, DENSE_RANK() OVER (PARTITION BY c.charge_date ORDER BY c.charge_amt DESC) AS DenseRank
, NTILE(4) OVER (PARTITION BY c.charge_date ORDER BY c.charge_amt DESC) AS Quartile
, NTILE(10) OVER (PARTITION BY c.charge_date ORDER BY c.charge_amt DESC) AS Tenths
, NTILE(100) OVER (PARTITION BY c.charge_date ORDER BY c.charge_amt DESC) AS Percentage
from billadmin.pm_chgyy_1 c;
CREATE or REPLACE VIEW BILLADMIN.PM_TOPCOUNTRY_YYYY AS SELECT s.Country, s.ChargeYear
, s.TotalCharge, s.NumCharges, s.AverageCharge
, RANK() OVER (PARTITION BY s.ChargeYear ORDER BY s.TotalCharge DESC) AS OverallYearRank
FROM
(
SELECT p.isocntrycode AS Country
, EXTRACT(year FROM c.charge_date) AS ChargeYear
, SUM(c.charge_amt) AS TotalCharge
, SUM(c.num) AS NumCharges
, AVG(c.avg_charge_amt) AS AverageCharge
from billadmin.pm_s_chg1mm c
INNER JOIN enterprise.STORER p ON c.billto_code = p.STORERKEY and p.TYPE = '1'
WHERE 1=1
GROUP BY p.isocntrycode, EXTRACT(year FROM c.charge_date)
) s;
CREATE or REPLACE VIEW BILLADMIN.PM_TOPCUST_MM AS SELECT s.CustCode, s.CustName, s.Country, s.State, s.ChargeYear, s.ChargeMonth
, s.TotalCharge, s.NumCharges, s.AverageCharge
, RANK() OVER (PARTITION BY s.ChargeYear, s.ChargeMonth ORDER BY s.TotalCharge DESC) AS OverallMonthRank
, RANK() OVER (PARTITION BY s.ChargeYear, s.ChargeMonth, s.Country ORDER BY s.TotalCharge DESC) AS CountryMonthRank
, RANK() OVER (PARTITION BY s.ChargeYear, s.ChargeMonth, s.Country, s.State ORDER BY s.TotalCharge DESC) AS StateMonthRank
FROM
(
SELECT c.cust_code AS CustCode, p.company AS CustName, p.isocntrycode AS Country, p.state AS State
, EXTRACT(year FROM c.charge_date) AS ChargeYear, EXTRACT(month FROM c.charge_date) AS ChargeMonth
, SUM(c.charge_amt) AS TotalCharge
, SUM(c.num) AS NumCharges
, AVG(c.avg_charge_amt) AS AverageCharge
from billadmin.pm_s_chg1mm c
INNER JOIN enterprise.STORER p ON c.billto_code = p.STORERKEY and p.TYPE = '1'
WHERE 1=1
GROUP BY c.cust_code, p.company, p.isocntrycode, p.state
, EXTRACT(year FROM c.charge_date), EXTRACT(month FROM c.charge_date)
) s;
CREATE or REPLACE VIEW BILLADMIN.PM_TOPCUST_YYYY AS SELECT s.CustCode, s.CustName, s.Country, s.State, s.ChargeYear
, s.TotalCharge, s.NumCharges, s.AverageCharge
, RANK() OVER (PARTITION BY s.ChargeYear ORDER BY s.TotalCharge DESC) AS OverallYearRank
, RANK() OVER (PARTITION BY s.ChargeYear, s.Country ORDER BY s.TotalCharge DESC) AS CountryYearRank
, RANK() OVER (PARTITION BY s.ChargeYear, s.Country, s.State ORDER BY s.TotalCharge DESC) AS StateYearRank
FROM
(
SELECT c.cust_code AS CustCode, p.company AS CustName, p.isocntrycode AS Country, p.state AS State
, EXTRACT(year FROM c.charge_date) AS ChargeYear
, SUM(c.charge_amt) AS TotalCharge
, SUM(c.num) AS NumCharges
, AVG(c.avg_charge_amt) AS AverageCharge
from billadmin.pm_s_chg1mm c
INNER JOIN enterprise.STORER p ON c.billto_code = p.STORERKEY and p.TYPE = '1'
WHERE 1=1
GROUP BY c.cust_code, p.company, p.isocntrycode, p.state, EXTRACT(year FROM c.charge_date)
) s;
CREATE or REPLACE VIEW BILLADMIN.PM_TOPSTATE_YYYY AS SELECT s.Country, s.State, s.ChargeYear
, s.TotalCharge, s.NumCharges, s.AverageCharge
, RANK() OVER (PARTITION BY s.ChargeYear ORDER BY s.TotalCharge DESC) AS OverallYearRank
, RANK() OVER (PARTITION BY s.ChargeYear, s.Country ORDER BY s.TotalCharge DESC) AS CountryYearRank
FROM
(
SELECT p.isocntrycode AS Country, p.state AS State
, EXTRACT(year FROM c.charge_date) AS ChargeYear
, SUM(c.charge_amt) AS TotalCharge
, SUM(c.num) AS NumCharges
, AVG(c.avg_charge_amt) AS AverageCharge
from billadmin.pm_s_chg1mm c
INNER JOIN enterprise.STORER p ON c.billto_code = p.STORERKEY and p.TYPE = '1'
WHERE 1=1
GROUP BY p.isocntrycode, p.state, EXTRACT(year FROM c.charge_date)
) s;
CREATE or REPLACE VIEW BILLADMIN.VBIC_CHARGE_CODE AS SELECT 
 BIC_CHARGE_CODE.CHARGE_CODE,
    BIC_CHARGE_CODE.CHARGE_DESC
 from Billadmin.BIC_CHARGE_CODE;
CREATE or REPLACE VIEW BILLADMIN.VBIC_UOM AS SELECT 
 BIC_UOM.UOM_CODE,
    BIC_UOM.UOM_DESC
 from Billadmin.BIC_UOM;
CREATE or REPLACE VIEW BILLADMIN.VW_ACCOUNT_REGISTER AS SELECT A.BATCH_NO, 
	  A.INVOICE_NO, 
	  A.FACILITY_ID, 
	  C.NAME FACILITY_NAME, 
	  A.CUST_CODE, 	  
	  D.NAME CUST_NAME, 
	  A.BILL_TO, 
	  E.NAME BILL_TO_NAME, 
	  B.INVOICE_DATE, 
	  B.FROM_DATE, 
	  B.TO_DATE, 
	  A.CHARGE_CODE, 
	  A.POST_ACCT, 
	  A.POST_DEPT, 
	  A.POST_CORP, 
	  F.CHARGE_DESC, 
	  SUM(A.POST_AMT) POST_AMT, 
	  A.POST_CRDB
     from Billadmin.BIC_CHARGE_DIST A LEFT OUTER  join Billadmin.BIC_CHARGE_CODE F 
	ON A.CHARGE_CODE = F.CHARGE_CODE, Billadmin.BIC_INVOICE_BATCH B, Billadmin.BIC_FACILITY C, Billadmin.BIC_CUSTOMER D, Billadmin.BIC_BILL_TO E
   WHERE A.BATCH_NO = B.BATCH_NO
	AND A.FACILITY_ID = C.FACILITY_ID
	AND A.CUST_CODE = D.CUST_CODE
	AND A.BILL_TO = E.BILL_TO_CUST
   GROUP BY A.BATCH_NO, A.INVOICE_NO, A.FACILITY_ID, C.NAME, A.CUST_CODE, D.NAME, A.BILL_TO, 
		 E.NAME, B.INVOICE_DATE, B.FROM_DATE, B.TO_DATE, 
		 A.CHARGE_CODE, A.POST_ACCT, A.POST_DEPT, A.POST_CORP, F.CHARGE_DESC, A.POST_CRDB;
CREATE or REPLACE VIEW BILLADMIN.VW_ACCOUNT_SETUP AS SELECT DISTINCT A.CORP_CODE,
                   A.CORP_NAME,
                   B.DEPT_CODE,
                   B.DEPT_NAME,
                   C.ACCT_CODE,
                   C.ACCT_DESC,
                   F.CHARGE_CODE,
                   F.CHARGE_DESC,
                   F.CHARGE_GROUP,
                   G.CHARGE_CODE_TYPE,
                   G.TYPE_DESC
     from Billadmin.BIC_CORPORATION A
            LEFT  join Billadmin.BIC_DEPARTMENT B
             ON A.CORP_CODE = B.CORP_CODE
            LEFT  join Billadmin.BIC_ACCOUNT C
             ON A.CORP_CODE = B.CORP_CODE
            AND B.CORP_CODE = C.CORP_CODE
            AND B.DEPT_CODE = C.DEPT_CODE
            LEFT  join Billadmin.BIC_CHRG_ACCT_DET D
             ON C.CORP_CODE = D.CR_CORP
            AND C.DEPT_CODE = D.CR_DEPT
            AND C.ACCT_CODE = D.CR_ACCT
             join Billadmin.BIC_CHARGE_ACCT E
             ON D.CHARGE_ACCT_KEY = E.CHARGE_ACCT_KEY
            LEFT  join Billadmin.BIC_CHARGE_CODE F
             ON E.CHARGE_CODE = F.CHARGE_CODE
            LEFT  join Billadmin.BIC_CODE_CHGTYPE G
             ON F.CHARGE_CODE_TYPE = G.CHARGE_CODE_TYPE
     GROUP BY A.CORP_CODE,A.CORP_NAME,B.DEPT_CODE,B.DEPT_NAME,C.ACCT_CODE,C.ACCT_DESC,f.CHARGE_CODE,f.CHARGE_DESC,f.CHARGE_GROUP,g.CHARGE_CODE_TYPE,G.TYPE_DESC
   UNION 
   SELECT DISTINCT A.CORP_CODE,
                   A.CORP_NAME,
                   B.DEPT_CODE,
                   B.DEPT_NAME,
                   C.ACCT_CODE,
                   C.ACCT_DESC,
                   F.CHARGE_CODE,
                   F.CHARGE_DESC,
                   F.CHARGE_GROUP,
                   G.CHARGE_CODE_TYPE,
                   G.TYPE_DESC
     from Billadmin.BIC_CORPORATION A
            LEFT  join Billadmin.BIC_DEPARTMENT B
             ON A.CORP_CODE = B.CORP_CODE
            LEFT  join Billadmin.BIC_ACCOUNT C
             ON A.CORP_CODE = B.CORP_CODE
            AND B.CORP_CODE = C.CORP_CODE
            AND B.DEPT_CODE = C.DEPT_CODE
             join Billadmin.BIC_CHARGE_CODE F
             ON C.CORP_CODE = F.DEF_CR_CORP
            AND C.DEPT_CODE = F.DEF_CR_DEPT
            AND C.ACCT_CODE = F.DEF_CR_ACCT
            LEFT  join Billadmin.BIC_CODE_CHGTYPE G
             ON F.CHARGE_CODE_TYPE = G.CHARGE_CODE_TYPE
     GROUP BY A.CORP_CODE,A.CORP_NAME,B.DEPT_CODE,B.DEPT_NAME,C.ACCT_CODE,C.ACCT_DESC,f.CHARGE_CODE,f.CHARGE_DESC,f.CHARGE_GROUP,g.CHARGE_CODE_TYPE,G.TYPE_DESC;
CREATE or REPLACE VIEW BILLADMIN.VW_ACCRUED_BILLING AS SELECT A.CUST_CODE,
          E.NAME CUST_NAME,
          A.BILL_TO,
          D.NAME BILL_TO_NAME,
          A.ORDER_NO,
          A.ORDER_TYPE,
          A.INVOICE_TYPE,
          A.ORDER_LINE,
          A.BATCH_NO,
          A.INVOICE_NO,
          A.CHARGE_DATE,
          A.CHARGE_CODE,
          C.CHARGE_DESC,
          A.CHARGE_QTY,
          A.CHARGE_UOM,
          A.CHARGE_RATE,
          A.CHARGE_AMT,
          A.CHARGE_NO,
          A.FACILITY_ID,
          A.ACTIVITY_ID,
          F.NAME FACILITY_NAME,
          A.PROOF_CODE,
          A.ITEM,
          A.PKG,
          A.LOT_CODE,
          A.ITEM_GROUP
     from Billadmin.BIC_CHARGE A
            LEFT  join Billadmin.BIC_ORDER_HISTORY B
             ON B.ORDER_KEY = A.ORDER_KEY,
          Billadmin.BIC_CHARGE_CODE C,
          Billadmin.BIC_BILL_TO D,
         Billadmin. BIC_CUSTOMER E,
         Billadmin. BIC_FACILITY F
    WHERE C.CHARGE_CODE = A.CHARGE_CODE
            AND A.BILL_TO = D.BILL_TO_CUST
            AND A.CUST_CODE = E.CUST_CODE
            AND A.FACILITY_ID = F.FACILITY_ID;
CREATE or REPLACE VIEW BILLADMIN.VW_CHARGE_GROUP_SUMMARY AS select distinct inv_date AS INVOICE_DATE, inv_year AS INVOICE_YEAR, inv_month AS INVOICE_MONTH, FACILITY_ID, CUST_CODE, BILL_TO, 
       bchn.group_desc as HN_GROUP_DESC, HNTOT AS HN_TOTAL, bcst.group_desc as ST_GROUP_DESC, STTOT AS ST_TOTAL, 
       bclb.group_desc as LB_GROUP_DESC, LBTOT AS LB_TOTAL, bcof.group_desc as OF_GROUP_DESC, OFTOT AS OF_TOTAL, 
       bcld.group_desc as LD_GROUP_DESC, LDTOT AS LD_TOTAL, bcre.group_desc as RE_GROUP_DESC, RETOT AS RE_TOTAL, 
       bcms.group_desc as MS_GROUP_DESC, MSTOT AS MS_TOTAL, grptot AS CHG_GROUP_TOTAL, fname, cname, NAME
FROM
(
select    distinct FACILITY_ID, CUST_CODE, BILL_TO, 
        HN, SUM(hnamt) AS HNTOT, ST, SUM(stamt) AS STTOT, LB, SUM(lbamt) AS LBTOT, OL, SUM(ofamt) AS OFTOT, 
       LD, SUM(ldamt) AS LDTOT, RE, SUM(reamt) AS RETOT, MS, SUM(msamt) AS MSTOT, sum(grpamt) as grptot, inv_date, inv_year, inv_month, 
	   fname, cname, NAME
FROM
(
select    distinct bc.FACILITY_ID, bc.CUST_CODE, bc.BILL_TO, 
       'HN' as hn, 0 as hnamt, 'ST' as st, 0 as stamt, 'LB' as lb, 0 as lbamt, 'OF' as ol, 0 as ofamt, 
       'LD' as ld, 0 as ldamt, 'RE' as re, 0 as reamt, 'MS' as ms, 0 as msamt, 0 as grpamt,
       TO_CHAR(bi.INVOICE_DATE,'YYYY-MM')  as inv_date, TO_CHAR(bi.INVOICE_DATE,'yyyy')  as inv_year, TO_CHAR(bi.INVOICE_DATE,'MM')  as inv_month,
	   bf.NAME fname, bic.NAME cname, bbto.NAME
from Billadmin.BIC_CHARGE bc 
       inner join Billadmin.BIC_INVOICE bi on bc.INVOICE_NO=bi.INVOICE_NO and bc.CHARGE_AMT<>0 
       inner join Billadmin.BIC_CHARGE_CODE bcc on bc.CHARGE_CODE=bcc.CHARGE_CODE 
       inner join Billadmin.BIC_FACILITY bf on bc.FACILITY_ID=bf.FACILITY_ID 
       inner join Billadmin.BIC_CUSTOMER bic on bc.CUST_CODE=bic.CUST_CODE 
       inner join Billadmin.BIC_BILL_TO bbto on bc.BILL_TO=bbto.BILL_TO_CUST, 
     Billadmin.BIC_CHRG_CODE_GRP bcg 
union
select bc.FACILITY_ID, bc.CUST_CODE, bc.BILL_TO, 
       'HN' as hn, sum (bc.CHARGE_AMT) as hnamt, 'ST' as st, 0 as stamt, 'LB' as lb, 0 as lbamt, 'OF' as ol, 0 as ofamt, 
       'LD' as LD, 0 as ldamt, 'RE' as re, 0 as reamt, 'MS' as ms, 0 as msamt, sum (bc.CHARGE_AMT) as grpamt,
       TO_CHAR(bi.INVOICE_DATE,'YYYY-MM')  as inv_date, TO_CHAR(bi.INVOICE_DATE,'yyyy')  as inv_year, TO_CHAR(bi.INVOICE_DATE,'MM')  as inv_month,
	   bf.NAME fname, bic.NAME cname, bbto.NAME
from Billadmin.BIC_CHARGE bc 
       inner join Billadmin.BIC_INVOICE bi on bc.INVOICE_NO=bi.INVOICE_NO and bc.CHARGE_AMT<>0 
       inner join Billadmin.BIC_CHARGE_CODE bcc on bc.CHARGE_CODE=bcc.CHARGE_CODE  
       inner join Billadmin.BIC_FACILITY bf on bc.FACILITY_ID=bf.FACILITY_ID 
       inner join Billadmin.BIC_CUSTOMER bic on bc.CUST_CODE=bic.CUST_CODE 
       inner join Billadmin.BIC_BILL_TO bbto on bc.BILL_TO=bbto.BILL_TO_CUST 
       inner join Billadmin.BIC_CHRG_CODE_GRP bcg on bcc.CHARGE_GROUP=bcg.CHARGE_GROUP and bcg.CHARGE_GROUP = 'HN'
group by bc.FACILITY_ID,bc.CUST_CODE, bc.BILL_TO, bi.INVOICE_DATE, bf.NAME,bic.NAME,bbto.NAME
union
select bc.FACILITY_ID, bc.CUST_CODE, bc.BILL_TO,  
       'HN' as hn, 0 as hnamt, 'ST' as st, sum (bc.CHARGE_AMT) as stamt, 'LB' as lb, 0 as lbamt, 'OF' as ol, 0 as ofamt, 
       'LD' as ld, 0 as ldamt, 'RE' as re, 0 as reamt, 'MS' as ms, 0 as msamt, sum (bc.CHARGE_AMT) as grpamt,
       TO_CHAR(bi.INVOICE_DATE,'YYYY-MM')  as inv_date, TO_CHAR(bi.INVOICE_DATE,'yyyy')  as inv_year, TO_CHAR(bi.INVOICE_DATE,'MM')  as inv_month, 
	   bf.NAME fname, bic.NAME cname, bbto.NAME
from Billadmin.BIC_CHARGE bc 
       inner join Billadmin.BIC_INVOICE bi on bc.INVOICE_NO=bi.INVOICE_NO and bc.CHARGE_AMT<>0 
       inner join Billadmin.BIC_CHARGE_CODE bcc on bc.CHARGE_CODE=bcc.CHARGE_CODE  
       inner join Billadmin.BIC_FACILITY bf on bc.FACILITY_ID=bf.FACILITY_ID 
       inner join Billadmin.BIC_CUSTOMER bic on bc.CUST_CODE=bic.CUST_CODE 
       inner join Billadmin.BIC_BILL_TO bbto on bc.BILL_TO=bbto.BILL_TO_CUST 
       inner join Billadmin.BIC_CHRG_CODE_GRP bcg on bcc.CHARGE_GROUP=bcg.CHARGE_GROUP and bcg.CHARGE_GROUP = 'ST'
group by bc.FACILITY_ID,bc.CUST_CODE, bc.BILL_TO, bi.INVOICE_DATE, bf.NAME,bic.NAME,bbto.NAME
union
select bc.FACILITY_ID, bc.CUST_CODE, bc.BILL_TO,  
       'HN' as hn, 0 as hnamt, 'ST' as st, 0 as stamt, 'LB' as lb, sum (bc.CHARGE_AMT) as lbamt, 'OF' as ol, 0 as ofamt, 
       'LD' as ld, 0 as ldamt, 'RE' as re, 0 as reamt, 'MS' as ms, 0 as msamt, sum (bc.CHARGE_AMT) as grpamt,
       TO_CHAR(bi.INVOICE_DATE,'YYYY-MM')  as inv_date, TO_CHAR(bi.INVOICE_DATE,'yyyy')  as inv_year, TO_CHAR(bi.INVOICE_DATE,'MM')  as inv_month, 
	   bf.NAME fname, bic.NAME cname, bbto.NAME
from Billadmin.BIC_CHARGE bc 
       inner join Billadmin.BIC_INVOICE bi on bc.INVOICE_NO=bi.INVOICE_NO and bc.CHARGE_AMT<>0 
       inner join Billadmin.BIC_CHARGE_CODE bcc on bc.CHARGE_CODE=bcc.CHARGE_CODE  
       inner join Billadmin.BIC_FACILITY bf on bc.FACILITY_ID=bf.FACILITY_ID 
       inner join Billadmin.BIC_CUSTOMER bic on bc.CUST_CODE=bic.CUST_CODE 
       inner join Billadmin.BIC_BILL_TO bbto on bc.BILL_TO=bbto.BILL_TO_CUST 
       inner join Billadmin.BIC_CHRG_CODE_GRP bcg on bcc.CHARGE_GROUP=bcg.CHARGE_GROUP and bcg.CHARGE_GROUP = 'LB'
group by bc.FACILITY_ID,bc.CUST_CODE, bc.BILL_TO, bi.INVOICE_DATE, bf.NAME,bic.NAME,bbto.NAME
union
select bc.FACILITY_ID, bc.CUST_CODE, bc.BILL_TO,  
       'HN' as hn, 0 as hnamt, 'ST' as st, 0 as stamt, 'LB' as lb, 0 as lbamt, 'OF' as ol, sum (bc.CHARGE_AMT) as ofamt, 
       'LD' as ld, 0 as ldamt, 'RE' as re, 0 as reamt, 'MS' as ms, 0 as msamt, sum (bc.CHARGE_AMT) as grpamt,
       TO_CHAR(bi.INVOICE_DATE,'YYYY-MM')  as inv_date, TO_CHAR(bi.INVOICE_DATE,'yyyy')  as inv_year, TO_CHAR(bi.INVOICE_DATE,'MM')  as inv_month,
	   bf.NAME fname, bic.NAME cname, bbto.NAME
from Billadmin.BIC_CHARGE bc 
       inner join Billadmin.BIC_INVOICE bi on bc.INVOICE_NO=bi.INVOICE_NO and bc.CHARGE_AMT<>0 
       inner join Billadmin.BIC_CHARGE_CODE bcc on bc.CHARGE_CODE=bcc.CHARGE_CODE  
       inner join Billadmin.BIC_FACILITY bf on bc.FACILITY_ID=bf.FACILITY_ID 
       inner join Billadmin.BIC_CUSTOMER bic on bc.CUST_CODE=bic.CUST_CODE 
       inner join Billadmin.BIC_BILL_TO bbto on bc.BILL_TO=bbto.BILL_TO_CUST 
       inner join Billadmin.BIC_CHRG_CODE_GRP bcg on bcc.CHARGE_GROUP=bcg.CHARGE_GROUP and bcg.CHARGE_GROUP = 'OF'
group by bc.FACILITY_ID,bc.CUST_CODE, bc.BILL_TO, bi.INVOICE_DATE, bf.NAME,bic.NAME,bbto.NAME
union
select bc.FACILITY_ID, bc.CUST_CODE, bc.BILL_TO,  
       'HN' as hn, 0 as hnamt, 'ST' as st, 0 as stamt, 'LB' as lb, 0 as lbamt, 'OF' as ol, 0 as ofamt, 
       'LD' as ld, sum (bc.CHARGE_AMT) as ldamt, 'RE' as re, 0 as reamt, 'MS' as ms, 0 as msamt, sum (bc.CHARGE_AMT) as grpamt,
       TO_CHAR(bi.INVOICE_DATE,'YYYY-MM')  as inv_date, TO_CHAR(bi.INVOICE_DATE,'yyyy')  as inv_year, TO_CHAR(bi.INVOICE_DATE,'MM')  as inv_month, 
	   bf.NAME fname, bic.NAME cname, bbto.NAME
from Billadmin.BIC_CHARGE bc 
       inner join Billadmin.BIC_INVOICE bi on bc.INVOICE_NO=bi.INVOICE_NO and bc.CHARGE_AMT<>0 
       inner join Billadmin.BIC_CHARGE_CODE bcc on bc.CHARGE_CODE=bcc.CHARGE_CODE  
       inner join Billadmin.BIC_FACILITY bf on bc.FACILITY_ID=bf.FACILITY_ID 
       inner join Billadmin.BIC_CUSTOMER bic on bc.CUST_CODE=bic.CUST_CODE 
       inner join Billadmin.BIC_BILL_TO bbto on bc.BILL_TO=bbto.BILL_TO_CUST 
       inner join Billadmin.BIC_CHRG_CODE_GRP bcg on bcc.CHARGE_GROUP=bcg.CHARGE_GROUP and bcg.CHARGE_GROUP = 'LD'
group by bc.FACILITY_ID,bc.CUST_CODE, bc.BILL_TO, bi.INVOICE_DATE, bf.NAME,bic.NAME,bbto.NAME
union
select bc.FACILITY_ID, bc.CUST_CODE, bc.BILL_TO, 
       'HN' as hn, 0 as hnamt, 'ST' as st, 0 as stamt, 'LB' as lb, 0 as lbamt, 'OF' as ol, 0 as ofamt, 
       'LD' as ld, 0 as ldamt, 'RE' as re, sum (bc.CHARGE_AMT) as reamt, 'MS' as ms, 0 as msamt, sum (bc.CHARGE_AMT) as grpamt,
       TO_CHAR(bi.INVOICE_DATE,'YYYY-MM')  as inv_date, TO_CHAR(bi.INVOICE_DATE,'yyyy')  as inv_year, TO_CHAR(bi.INVOICE_DATE,'MM')  as inv_month, 
	   bf.NAME fname, bic.NAME cname, bbto.NAME
from Billadmin.BIC_CHARGE bc 
       inner join Billadmin.BIC_INVOICE bi on bc.INVOICE_NO=bi.INVOICE_NO and bc.CHARGE_AMT<>0 
       inner join Billadmin.BIC_CHARGE_CODE bcc on bc.CHARGE_CODE=bcc.CHARGE_CODE  
       inner join Billadmin.BIC_FACILITY bf on bc.FACILITY_ID=bf.FACILITY_ID 
       inner join Billadmin.BIC_CUSTOMER bic on bc.CUST_CODE=bic.CUST_CODE 
       inner join Billadmin.BIC_BILL_TO bbto on bc.BILL_TO=bbto.BILL_TO_CUST 
       inner join Billadmin.BIC_CHRG_CODE_GRP bcg on bcc.CHARGE_GROUP=bcg.CHARGE_GROUP and bcg.CHARGE_GROUP = 'RE'
group by bc.FACILITY_ID,bc.CUST_CODE, bc.BILL_TO,bi.INVOICE_DATE, bf.NAME,bic.NAME,bbto.NAME
union
select bc.FACILITY_ID, bc.CUST_CODE, bc.BILL_TO, 
       'HN' as hn, 0 as hnamt, 'ST' as st, 0 as stamt, 'LB' as lb, 0 as lbamt, 'OF' as ol, 0 as ofamt, 
       'LD' as ld, 0 as ldamt, 'RE' as re, 0 as reamt, 'MS' as ms, sum (bc.CHARGE_AMT) as msamt, sum (bc.CHARGE_AMT) as grpamt,
       TO_CHAR(bi.INVOICE_DATE,'YYYY-MM')  as inv_date, TO_CHAR(bi.INVOICE_DATE,'yyyy')  as inv_year, TO_CHAR(bi.INVOICE_DATE,'MM')  as inv_month, 
	   bf.NAME fname, bic.NAME cname, bbto.NAME
from Billadmin.BIC_CHARGE bc 
       inner join Billadmin.BIC_INVOICE bi on bc.INVOICE_NO=bi.INVOICE_NO and bc.CHARGE_AMT<>0 
       inner join Billadmin.BIC_CHARGE_CODE bcc on bc.CHARGE_CODE=bcc.CHARGE_CODE  
       inner join Billadmin.BIC_FACILITY bf on bc.FACILITY_ID=bf.FACILITY_ID 
       inner join Billadmin.BIC_CUSTOMER bic on bc.CUST_CODE=bic.CUST_CODE 
       inner join Billadmin.BIC_BILL_TO bbto on bc.BILL_TO=bbto.BILL_TO_CUST 
       inner join Billadmin.BIC_CHRG_CODE_GRP bcg on bcc.CHARGE_GROUP=bcg.CHARGE_GROUP and bcg.CHARGE_GROUP NOT in ('HN','ST','LB','OF','LD','RE')
group by bc.FACILITY_ID,bc.CUST_CODE, bc.BILL_TO,bi.INVOICE_DATE, bf.NAME,bic.NAME,bbto.NAME) DER1
group by FACILITY_ID, CUST_CODE, BILL_TO, INV_DATE, INV_YEAR, INV_MONTH, FNAME, CNAME, NAME, HN, ST, LB, OL, LD, RE, MS) DER2
 inner join Billadmin.BIC_CHRG_CODE_GRP bchn on DER2.hn = bchn.charge_group
 inner join Billadmin.BIC_CHRG_CODE_GRP bcst on DER2.st = bcst.charge_group
 inner join Billadmin.BIC_CHRG_CODE_GRP bclb on DER2.lb = bclb.charge_group
 inner join Billadmin.BIC_CHRG_CODE_GRP bcof on DER2.ol = bcof.charge_group
 inner join Billadmin.BIC_CHRG_CODE_GRP bcld on DER2.ld = bcld.charge_group
 inner join Billadmin.BIC_CHRG_CODE_GRP bcre on DER2.re = bcre.charge_group
 inner join Billadmin.BIC_CHRG_CODE_GRP bcms on DER2.ms = bcms.charge_group;
CREATE or REPLACE VIEW BILLADMIN.VW_CHARGE_RATES_BY_CUST_ITEM AS SELECT ITM.ITEM,
          ITM.PKG,
          CUST.CUST_CODE,
          CUST.NAME CUST_NAME,
          CONT_DET.FACILITY_ID,
          FAC.NAME FACILITY_NAME,
          RATE.EFFECT_DATE,
          RATE.EXPIRE_DATE,
          RATE.RATE_GROUP,
          RATE.CHARGE_CODE,
          RATE.RATE_UOM,
          RATE.FROM_BREAK,
          RATE.TO_BREAK,
          RATE.BREAK_UOM,
          RATE.CHARGE_RATE,
          RATE.MIN_CHARGE,
          CHG_CODE.CHARGE_DESC
     from Billadmin.BIC_CONTRACT_DET CONT_DET
            LEFT  join Billadmin.BIC_FACILITY FAC
             ON CONT_DET.FACILITY_ID = FAC.FACILITY_ID
             join Billadmin.BIC_CONTRACT CONT
             ON CONT_DET.CONTRACT_KEY = CONT.CONTRACT_KEY
             join Billadmin.BIC_CUSTOMER CUST
             ON CONT.CUST_CODE = CUST.CUST_CODE
             join Billadmin.BIC_BILL_GROUP_DET BILLGRP
             ON CONT_DET.BILL_GROUP = BILLGRP.BILL_GROUP
             join Billadmin.BIC_ITEM_GRPKEY ITEMGRP
             ON BILLGRP.ITEM_GROUP = ITEMGRP.ITEM_GROUP
             join Billadmin.BIC_ITEM ITM
             ON ITEMGRP.ITEM = ITM.ITEM AND ITEMGRP.PKG = ITM.PKG AND ITEMGRP.CUST_CODE = ITM.CUST_CODE
             join Billadmin.BIC_RATE RATE
             ON CONT_DET.RATE_GROUP = RATE.RATE_GROUP
             join Billadmin.BIC_CHARGE_CODE CHG_CODE
             ON RATE.CHARGE_CODE = CHG_CODE.CHARGE_CODE
     GROUP BY ITM.ITEM,ITM.PKG,CUST.CUST_CODE,CUST.NAME,CONT_DET.FACILITY_ID,FAC.NAME,RATE.EFFECT_DATE,RATE.EXPIRE_DATE,RATE.RATE_GROUP,RATE.CHARGE_CODE,RATE.RATE_UOM,RATE.FROM_BREAK,RATE.TO_BREAK,RATE.BREAK_UOM,RATE.CHARGE_RATE,RATE.MIN_CHARGE,CHG_CODE.CHARGE_DESC;
CREATE or REPLACE VIEW BILLADMIN.VW_CONTRACT_CHARGE_CONFIG AS SELECT 
ITM.ITEM, ITM.PKG, CUST.CUST_CODE, CUST.NAME  CUST_NAME,
	CONT_DET.FACILITY_ID, FAC.NAME  FACILITY_NAME, RATE.EFFECT_DATE, RATE.EXPIRE_DATE,  
	RATE.RATE_GROUP, RATE.CHARGE_CODE, RATE.RATE_UOM, RATE.FROM_BREAK, RATE.TO_BREAK, 
	RATE.BREAK_UOM, RATE.CHARGE_RATE, RATE.MIN_CHARGE, CHG_CODE.CHARGE_DESC,
	EVENT.INVOICE_TYPE, EVENT.ACTIVITY_ID, EVENT.BILL_LEVEL, EVENT.EVENT_SPECIAL,
	EVENT.REVIEW_FLAG, EVENT.OMIT_ZERO_QTY,
	BILLGRP.PARTNER_GROUP, BILLGRP.CARRIER_GROUP, BILLGRP.ITEM_GROUP, 
	CONT_DET.EVENT_GROUP, CONT_DET.BILL_GROUP, 1 REPORTSEQ
from Billadmin.BIC_CONTRACT_DET  CONT_DET 
	LEFT OUTER  join Billadmin.BIC_FACILITY  FAC ON CONT_DET.FACILITY_ID = FAC.FACILITY_ID 
	 inner join Billadmin.BIC_CONTRACT  CONT ON CONT_DET.CONTRACT_KEY = CONT.CONTRACT_KEY 
	 inner join Billadmin.BIC_CUSTOMER CUST ON CONT.CUST_CODE = CUST.CUST_CODE 
	 inner join Billadmin.BIC_BILL_GROUP_DET BILLGRP ON CONT_DET.BILL_GROUP = BILLGRP.BILL_GROUP 
	 inner join Billadmin.BIC_ITEM_GRPKEY ITEMGRP ON BILLGRP.ITEM_GROUP = ITEMGRP.ITEM_GROUP 
	 inner join Billadmin.BIC_ITEM ITM ON ITEMGRP.ITEM = ITM.ITEM AND ITEMGRP.CUST_CODE = ITM.CUST_CODE AND CONT.CUST_CODE = ITM.CUST_CODE 
	 inner join Billadmin.BIC_EVENT EVENT ON CONT_DET.EVENT_GROUP = EVENT.EVENT_GROUP AND EVENT.ACTIVITY_ID = 'INBOUND' 
	 inner join Billadmin.BIC_RATE RATE ON CONT_DET.RATE_GROUP = RATE.RATE_GROUP 
		AND EVENT.CHARGE_CODE = RATE.CHARGE_CODE 
	 inner join Billadmin.BIC_CHARGE_CODE CHG_CODE ON RATE.CHARGE_CODE = CHG_CODE.CHARGE_CODE
UNION
SELECT ITM.ITEM, ITM.PKG, CUST.CUST_CODE, CUST.NAME CUST_NAME,
	CONT_DET.FACILITY_ID, FAC.NAME FACILITY_NAME, RATE.EFFECT_DATE, RATE.EXPIRE_DATE,  
	RATE.RATE_GROUP, RATE.CHARGE_CODE, RATE.RATE_UOM, RATE.FROM_BREAK, RATE.TO_BREAK, 
	RATE.BREAK_UOM, RATE.CHARGE_RATE, RATE.MIN_CHARGE, CHG_CODE.CHARGE_DESC,
	EVENT.INVOICE_TYPE, EVENT.ACTIVITY_ID, EVENT.BILL_LEVEL, EVENT.EVENT_SPECIAL,
	EVENT.REVIEW_FLAG, EVENT.OMIT_ZERO_QTY,
	BILLGRP.PARTNER_GROUP, BILLGRP.CARRIER_GROUP, BILLGRP.ITEM_GROUP, 
	CONT_DET.EVENT_GROUP, CONT_DET.BILL_GROUP, 2 REPORTSEQ
from Billadmin.BIC_CONTRACT_DET CONT_DET 
	LEFT OUTER  join Billadmin.BIC_FACILITY FAC ON CONT_DET.FACILITY_ID = FAC.FACILITY_ID 
	 inner join Billadmin.BIC_CONTRACT CONT ON CONT_DET.CONTRACT_KEY = CONT.CONTRACT_KEY 
	 inner join Billadmin.BIC_CUSTOMER CUST ON CONT.CUST_CODE = CUST.CUST_CODE 
	 inner join Billadmin.BIC_BILL_GROUP_DET BILLGRP ON CONT_DET.BILL_GROUP = BILLGRP.BILL_GROUP 
	 inner join Billadmin.BIC_ITEM_GRPKEY ITEMGRP ON BILLGRP.ITEM_GROUP = ITEMGRP.ITEM_GROUP 
	 inner join Billadmin.BIC_ITEM ITM ON ITEMGRP.ITEM = ITM.ITEM AND ITEMGRP.CUST_CODE = ITM.CUST_CODE AND CONT.CUST_CODE = ITM.CUST_CODE 
	 inner join Billadmin.BIC_EVENT EVENT ON CONT_DET.EVENT_GROUP = EVENT.EVENT_GROUP AND EVENT.ACTIVITY_ID = 'SHIPMENT' 
	 inner join Billadmin.BIC_RATE RATE ON CONT_DET.RATE_GROUP = RATE.RATE_GROUP 
		AND EVENT.CHARGE_CODE = RATE.CHARGE_CODE 
	 inner join Billadmin.BIC_CHARGE_CODE CHG_CODE ON RATE.CHARGE_CODE = CHG_CODE.CHARGE_CODE
UNION
SELECT ITM.ITEM, ITM.PKG, CUST.CUST_CODE, CUST.NAME CUST_NAME,
	CONT_DET.FACILITY_ID, FAC.NAME FACILITY_NAME, RATE.EFFECT_DATE, RATE.EXPIRE_DATE,  
	RATE.RATE_GROUP, RATE.CHARGE_CODE, RATE.RATE_UOM, RATE.FROM_BREAK, RATE.TO_BREAK, 
	RATE.BREAK_UOM, RATE.CHARGE_RATE, RATE.MIN_CHARGE, CHG_CODE.CHARGE_DESC,
	EVENT.INVOICE_TYPE, EVENT.ACTIVITY_ID, EVENT.BILL_LEVEL, EVENT.EVENT_SPECIAL,
	EVENT.REVIEW_FLAG, EVENT.OMIT_ZERO_QTY,
	BILLGRP.PARTNER_GROUP, BILLGRP.CARRIER_GROUP, BILLGRP.ITEM_GROUP, 
	CONT_DET.EVENT_GROUP, CONT_DET.BILL_GROUP, 3 REPORTSEQ
from Billadmin.BIC_CONTRACT_DET CONT_DET 
	LEFT OUTER  join Billadmin.BIC_FACILITY FAC ON CONT_DET.FACILITY_ID = FAC.FACILITY_ID 
	 inner join Billadmin.BIC_CONTRACT CONT ON CONT_DET.CONTRACT_KEY = CONT.CONTRACT_KEY 
	 inner join Billadmin.BIC_CUSTOMER CUST ON CONT.CUST_CODE = CUST.CUST_CODE 
	 inner join Billadmin.BIC_BILL_GROUP_DET BILLGRP ON CONT_DET.BILL_GROUP = BILLGRP.BILL_GROUP 
	 inner join Billadmin.BIC_ITEM_GRPKEY ITEMGRP ON BILLGRP.ITEM_GROUP = ITEMGRP.ITEM_GROUP 
	 inner join Billadmin.BIC_ITEM ITM ON ITEMGRP.ITEM = ITM.ITEM AND ITEMGRP.CUST_CODE = ITM.CUST_CODE AND CONT.CUST_CODE = ITM.CUST_CODE  
	 inner join Billadmin.BIC_EVENT EVENT ON CONT_DET.EVENT_GROUP = EVENT.EVENT_GROUP AND EVENT.ACTIVITY_ID != 'INBOUND' AND EVENT.ACTIVITY_ID != 'SHIPMENT'
	 inner join Billadmin.BIC_RATE RATE ON CONT_DET.RATE_GROUP = RATE.RATE_GROUP 
		AND EVENT.CHARGE_CODE = RATE.CHARGE_CODE 
	 inner join Billadmin.BIC_CHARGE_CODE CHG_CODE ON RATE.CHARGE_CODE = CHG_CODE.CHARGE_CODE;
CREATE or REPLACE VIEW BILLADMIN.VW_CONTRACT_SHEET AS SELECT A.CUST_CODE,  D.NAME CUST_NAME, E.EFFECT_DATE, A.INVOICE_TERMS,
	F.FACILITY_ID,  F.BILL_TO, E.CHARGE_CODE, B.BILL_LEVEL, F.RATE_GROUP, F.EVENT_GROUP, 
	B.INVOICE_TYPE, B.ACTIVITY_ID, E.RATE_UOM, E.FROM_BREAK, E.TO_BREAK, E.BREAK_UOM, 
	E.CHARGE_RATE,  E.MIN_CHARGE, E.CHARGE_COST, C.EVENT_TYPE, C.EVENT_DESC
from Billadmin.BIC_CONTRACT A, Billadmin.BIC_EVENT B, Billadmin.BIC_EVENT_GROUP C, Billadmin.BIC_CUSTOMER D, Billadmin.BIC_RATE E, Billadmin.BIC_CONTRACT_DET F
WHERE A.CONTRACT_KEY = F.CONTRACT_KEY 
AND F.EVENT_GROUP = B.EVENT_GROUP
AND F.EVENT_GROUP = C.EVENT_GROUP
AND (B.BILL_TO IS null OR B.BILL_TO = F.BILL_TO)
AND A.CUST_CODE = D.CUST_CODE
AND F.RATE_GROUP = E.RATE_GROUP
AND B.CHARGE_CODE = E.CHARGE_CODE;

CREATE or REPLACE VIEW BILLADMIN.VW_INVOICE_DETAIL AS SELECT CHG.INVOICE_NO,
          CHG.BATCH_NO,
          INV.INVOICE_DATE,
          BATCH.FROM_DATE,
          BATCH.TO_DATE,
          CHG.FACILITY_ID,
          FAC.NAME FACILITY_NAME,
          INV.CUST_CODE,
          CUST.NAME CUST_NAME,
          CUST.ADR1 CUST_ADR1,
          CUST.ADR2 CUST_ADR2,
          CUST.ADR3 CUST_ADR3,
          CUST.CITY CUST_CITY,
          CUST.STATE_PROVINCE CUST_STATE,
          CUST.ZIP CUST_ZIP,
          INV.BILL_TO,
          BILL.NAME BILL_NAME,
          BILL.ADR1 BILL_ADR1,
          BILL.ADR2 BILL_ADR2,
          BILL.ADR3 BILL_ADR3,
          BILL.CITY BILL_CITY,
          BILL.STATE_PROVINCE BILL_STATE,
          BILL.ZIP BILL_ZIP,
          HIST.WM_ORDER_NO CUST_ORDER_NO,
          CHG.ORDER_NO,
          CHG.ORDER_LINE,
          CHG.CHARGE_DATE,
          CHG.CHARGE_CODE,
          CHG_CODE.CHARGE_DESC,
          CHG.ITEM,
          ITEM.ITEM_DESC,
          CHG.LOT_CODE,
          CHG.ITEM_GROUP, 
          INVDATE.ROTATION_CODE,
          CHG.GRS_BAL,
          CHG.NET_BAL,
          CHG.WGT_UOM,
          CHG.QTY_BAL,
          CHG.QTY_UOM,
          CHG.CHARGE_QTY,
          CHG.CHARGE_RATE,
          CHG.CHARGE_UOM,
          CHG.CHARGE_AMT,
          CHG.MIN_FLAG,
          CHG_CODE.CHARGE_CODE_TYPE,
          CHG.CHARGE_COMMENT,
          INVDATE.LOT01,
          INVDATE.LOT02,
          INVDATE.LOT03,
          INVDATE.LOT04,
          INVDATE.LOT05,
          INVDATE.LOT06,
          INVDATE.LOT07,
          INVDATE.LOT08,
          INVDATE.LOT09,
          INVDATE.LOT10,
          INVDATE.LOT11,
          INVDATE.LOT12       
     from Billadmin.BIC_INVOICE INV,
          Billadmin.BIC_INVOICE_BATCH BATCH,
          Billadmin.BIC_CHARGE_CODE CHG_CODE,
          Billadmin.BIC_FACILITY FAC,
          Billadmin.BIC_CUSTOMER CUST,
          Billadmin.BIC_BILL_TO BILL,
          Billadmin.BIC_CHARGE CHG
            LEFT  join Billadmin.BIC_ITEM ITEM
             ON ITEM.ITEM = CHG.ITEM AND ITEM.PKG = CHG.PKG AND ITEM.CUST_CODE = CHG.CUST_CODE
            LEFT  join Billadmin.BIC_ORDER_HISTORY HIST
             ON HIST.ORDER_KEY = CHG.ORDER_KEY
            LEFT  join Billadmin.BIC_INVENTORY INVDATE
             ON INVDATE.INVENTORY_KEY = CHG.INVENTORY_KEY
    WHERE CHG.INVOICE_NO = INV.INVOICE_NO
            AND BATCH.BATCH_NO = INV.BATCH_NO
            AND CHG_CODE.CHARGE_CODE = CHG.CHARGE_CODE
            AND CHG.FACILITY_ID = FAC.FACILITY_ID
            AND INV.CUST_CODE = CUST.CUST_CODE
            AND INV.BILL_TO = BILL.BILL_TO_CUST;
CREATE or REPLACE VIEW BILLADMIN.VW_INVOICE_DETAIL_ADDR AS SELECT CHG.INVOICE_NO,
          CHG.BATCH_NO,
          INV.INVOICE_DATE,
          BATCH.FROM_DATE,
          BATCH.TO_DATE,
          CHG.FACILITY_ID,
          FAC.NAME FACILITY_NAME,
          INV.CUST_CODE,
          CUST.NAME CUST_NAME,
          CUST.ADR1 CUST_ADR1,
          CUST.ADR2 CUST_ADR2,
          CUST.ADR3 CUST_ADR3,
          CUST.CITY CUST_CITY,
          CUST.STATE_PROVINCE CUST_STATE,
          CUST.ZIP CUST_ZIP,
          INV.BILL_TO,
          BILL.NAME BILL_NAME,
          BILL.ADR1 BILL_ADR1,
          BILL.ADR2 BILL_ADR2,
          BILL.ADR3 BILL_ADR3,
          BILL.CITY BILL_CITY,
          BILL.STATE_PROVINCE BILL_STATE,
          BILL.ZIP BILL_ZIP,
          HIST.WM_ORDER_NO CUST_ORDER_NO,
          CHG.ORDER_NO,
          CHG.ORDER_LINE,
          CHG.CHARGE_DATE,
          CHG.CHARGE_CODE,
          CHG_CODE.CHARGE_DESC,
          CHG.ITEM,
          ITEM.ITEM_DESC,
          CHG.LOT_CODE,
          INVDATE.ROTATION_CODE,
          CHG.GRS_BAL,
          CHG.NET_BAL,
          CHG.WGT_UOM,
          CHG.QTY_BAL,
          CHG.QTY_UOM,
          CHG.CHARGE_QTY,
          CHG.CHARGE_RATE,
          CHG.CHARGE_UOM,
          CHG.CHARGE_AMT,
          CHG.MIN_FLAG,
          CHG_CODE.CHARGE_CODE_TYPE,
          CHG.CHARGE_COMMENT,
          REMIT.NAME REMIT_NAME,
          REMIT.ADR1 REMIT_ADR1,
          REMIT.ADR2 REMIT_ADR2,
          REMIT.ADR3 REMIT_ADR3,
          REMIT.CITY REMIT_CITY,
          REMIT.STATE_PROVINCE REMIT_STATE,
          REMIT.ZIP REMIT_ZIP,
          REMIT.CONTACT1 REMIT_CONTACT1,
          REMIT.PHONE REMIT_PHONE,
          INV.INVOICE_TERMS,
          REMIT.FAX REMIT_FAX,
          REMIT.EMAIL1 REMIT_EMAIL,
          INV_TERMS.TERMS_DESC,
          CHG.CHARGE_CURR_CODE,
          INVDATE.LOT01,
          INVDATE.LOT02,
          INVDATE.LOT03,
          INVDATE.LOT04,
          INVDATE.LOT05,
          INVDATE.LOT06,
          INVDATE.LOT07,
          INVDATE.LOT08,
          INVDATE.LOT09,
          INVDATE.LOT10,
          INVDATE.LOT11,
          INVDATE.LOT12,
	  CHG.ITEM_GROUP
     from Billadmin.BIC_INVOICE INV
             join Billadmin.BIC_CHARGE CHG
            LEFT  join Billadmin.BIC_ITEM ITEM
             ON ITEM.ITEM = CHG.ITEM AND ITEM.PKG = CHG.PKG AND ITEM.CUST_CODE = CHG.CUST_CODE
            LEFT  join Billadmin.BIC_ORDER_HISTORY HIST
             ON HIST.ORDER_KEY = CHG.ORDER_KEY
            LEFT  join Billadmin.BIC_INVENTORY INVDATE
             ON INVDATE.INVENTORY_KEY = CHG.INVENTORY_KEY
             ON INV.INVOICE_NO = CHG.INVOICE_NO
             join Billadmin.BIC_INVOICE_BATCH BATCH
             ON INV.BATCH_NO = BATCH.BATCH_NO
             join Billadmin.BIC_CHARGE_CODE CHG_CODE
             ON CHG.CHARGE_CODE = CHG_CODE.CHARGE_CODE
             join Billadmin.BIC_FACILITY FAC
	    LEFT  join Billadmin.BIC_REMIT REMIT
	     ON REMIT.REMIT_CODE = FAC.DEF_REMIT_CODE
             ON CHG.FACILITY_ID = FAC.FACILITY_ID
             join Billadmin.BIC_CUSTOMER CUST
             ON INV.CUST_CODE = CUST.CUST_CODE
             join Billadmin.BIC_BILL_TO BILL
             ON INV.BILL_TO = BILL.BILL_TO_CUST
             join Billadmin.BIC_INVOICE_TERMS INV_TERMS
             ON INV.INVOICE_TERMS = INV_TERMS.INVOICE_TERMS;
CREATE or REPLACE VIEW BILLADMIN.VW_INVOICE_REGISTER AS SELECT B.BATCH_NO,
          A.INVOICE_DATE BATCH_DATE,
          B.FROM_DATE,
          B.TO_DATE,
          B.FACILITY_ID,
          C.NAME FACILITY_NAME,
          B.CUST_CODE,
          D.NAME CUST_NAME,
          B.BILL_TO,
          E.NAME BILL_TO_NAME,
          B.INVOICE_NO,
          B.INVOICE_TOT_AMT,
          B.INV_CURR_CODE,
          B.CUST_TOT_AMT,
          B.CUST_CURR_CODE,
          B.INVOICE_STATUS
     from Billadmin.BIC_INVOICE B
            LEFT  join Billadmin.BIC_INVOICE_BATCH A
             ON B.BATCH_NO = A.BATCH_NO
            LEFT  join Billadmin.BIC_FACILITY C
             ON B.FACILITY_ID = C.FACILITY_ID,
          Billadmin.BIC_CUSTOMER D,
          Billadmin.BIC_BILL_TO E
    WHERE B.CUST_CODE = D.CUST_CODE
            AND B.BILL_TO = E.BILL_TO_CUST;
CREATE or REPLACE VIEW BILLADMIN.VW_INVOICE_SUMMARY AS SELECT A.INVOICE_NO,
          A.BATCH_NO,
          A.INVOICE_DATE,
          B.FROM_DATE,
          B.TO_DATE,
          C.FACILITY_ID,
          G.NAME FACILITY_NAME,
          A.CUST_CODE,
          E.NAME CUST_NAME,
          A.BILL_TO,
          F.NAME BILL_TO_NAME,
          C.CHARGE_CODE,
          D.CHARGE_DESC,
          SUM(C.CHARGE_QTY) CHARGE_QTY,
          C.CHARGE_UOM,
          C.CHARGE_RATE,
          SUM(C.CHARGE_AMT) CHARGE_AMT,
          D.CHARGE_CODE_TYPE,
          A.INV_CURR_CODE,
          I.CURR_DESC INV_CURR_DESC,
          C.CHARGE_CURR_CODE,
          TO_CHAR(C.CHARGE_RATE,'FM999999.00') AS CHARGE_RATE_CHAR
     from Billadmin.BIC_INVOICE A,
          Billadmin.BIC_INVOICE_BATCH B,
          Billadmin.BIC_CURRENCY I,
          Billadmin.BIC_CHARGE C
            LEFT  join Billadmin.BIC_ORDER_HISTORY H
             ON C.ORDER_KEY = H.ORDER_KEY,
          Billadmin.BIC_CHARGE_CODE D,
          Billadmin.BIC_CUSTOMER E,
          Billadmin.BIC_BILL_TO F,
          Billadmin.BIC_FACILITY G
    WHERE A.BATCH_NO = B.BATCH_NO
            AND A.INV_CURR_CODE = I.CURR_CODE
            AND A.INVOICE_NO = C.INVOICE_NO
            AND C.CHARGE_CODE = D.CHARGE_CODE
            AND C.FACILITY_ID = G.FACILITY_ID
            AND A.CUST_CODE = E.CUST_CODE
            AND A.BILL_TO = F.BILL_TO_CUST
     GROUP BY A.INVOICE_NO,A.BATCH_NO,A.INVOICE_DATE,B.FROM_DATE,B.TO_DATE,C.FACILITY_ID,G.NAME,A.CUST_CODE,E.NAME,A.BILL_TO,F.NAME,C.CHARGE_CODE,D.CHARGE_DESC,C.CHARGE_UOM,C.CHARGE_RATE,D.CHARGE_CODE_TYPE,A.INV_CURR_CODE,I.CURR_DESC,C.CHARGE_CURR_CODE,G.DEF_REMIT_CODE;

CREATE or REPLACE VIEW BILLADMIN.VW_INVOICE_SUMMARY_ADDR AS SELECT C.CUST_CODE,
          C.CUST_NAME,
          C.BILL_TO,
          C.BILL_TO_NAME,
          C.INVOICE_NO,
          C.BATCH_NO,
          C.INVOICE_DATE,
          C.FROM_DATE,
          C.TO_DATE,
          C.FACILITY_ID,
          C.FACILITY_NAME,
          F.ADR1 FACILITY_ADR1,
          F.ADR2 FACILITY_ADR2,
          F.ADR3 FACILITY_ADR3,
          F.CITY FACILITY_CITY,
          F.STATE_PROVINCE FACILITY_STATE,
          F.ZIP FACILITY_ZIP,
          F.PHONE FACILITY_PHONE,
          F.FAX FACILITY_FAX,
          C.CHARGE_CODE,
          C.CHARGE_DESC,
          C.CHARGE_QTY,
          C.CHARGE_UOM,
          C.CHARGE_RATE,
          C.CHARGE_AMT,
          B.COUNTRY_CODE CUST_COUNTRY_CODE,
          B.COUNTRY_NAME CUST_COUNTRY_NAME,
          B.CONTACT1 CUST_CONTACT1,
          B.CONTACT2 CUST_CONTACT2,
          ' ' CUST_CONTACT3,
          B.ADR1 CUST_ADR1,
          B.ADR2 CUST_ADR2,
          B.ADR3 CUST_ADR3,
          B.CITY CUST_CITY,
          B.STATE_PROVINCE CUST_STATE,
          B.ZIP CUST_ZIP,
          B.PHONE CUST_PHONE,
          B.FAX CUST_FAX,
          B.EMAIL1 CUST_EMAIL1,
          B.EMAIL2 CUST_EMAIL2,
          ' ' CUST_EMAIL3,
          A.COUNTRY_CODE BILL_COUNTRY_CODE,
          A.COUNTRY_NAME BILL_COUNTRY_NAME,
          A.CONTACT1 BILL_CONTACT1,
          A.CONTACT2 BILL_CONTACT2,
          ' ' BILL_CONTACT3,
          A.ADR1 BILL_ADR1,
          A.ADR2 BILL_ADR2,
          A.ADR3 BILL_ADR3,
          A.CITY BILL_CITY,
          A.STATE_PROVINCE BILL_STATE,
          A.ZIP BILL_ZIP,
          A.PHONE BILL_PHONE,
          A.FAX BILL_FAX,
          A.EMAIL1 BILL_EMAIL1,
          A.EMAIL2 BILL_EMAIL2,
          ' ' BILL_EMAIL3,
          D.NAME FROM_NAME,
          D.ADR1 FROM_ADR1,
          D.ADR2 FROM_ADR2,
          D.ADR3 FROM_ADR3,
          D.CITY FROM_CITY,
          D.STATE_PROVINCE FROM_STATE,
          D.ZIP FROM_ZIP,
          D.PHONE FROM_PHONE,
          D.FAX FROM_FAX,
          D.CONTACT1 FROM_CONTACT1,
          D.EMAIL1 FROM_EMAIL1,
          E.TERMS_DESC,
          C.CHARGE_CODE_TYPE,
          C.INV_CURR_CODE,
          C.INV_CURR_DESC,
          C.CHARGE_CURR_CODE,
          TO_CHAR(C.CHARGE_RATE, 'FM999999.00') AS CHARGE_RATE_CHAR
     from Billadmin.BIC_BILL_TO A
            JOIN Billadmin.VW_INVOICE_SUMMARY C
             ON A.BILL_TO_CUST = C.BILL_TO
             join Billadmin.BIC_CUSTOMER B
            LEFT  join Billadmin.BIC_INVOICE_TERMS E
             ON E.INVOICE_TERMS = B.INVOICE_TERMS
             ON C.CUST_CODE = B.CUST_CODE
             join Billadmin.BIC_FACILITY F
             ON C.FACILITY_ID = F.FACILITY_ID
	    LEFT  join Billadmin.BIC_REMIT D
             ON F.DEF_REMIT_CODE = D.REMIT_CODE;
			 
CREATE or REPLACE VIEW BILLADMIN.VW_NON_NEGOTIABLE AS SELECT     BIC_CHARGE.INVOICE_NO, BIC_INVOICE.INVOICE_DATE, BIC_INVOICE_BATCH.FROM_DATE, BIC_INVOICE_BATCH.TO_DATE, BIC_INVOICE.BATCH_NO, BIC_CHARGE.FACILITY_ID, BIC_FACILITY.NAME AS FACILITY_NAME, 
                      BIC_FACILITY.ADR1 AS FACILITY_ADR1, BIC_FACILITY.ADR2 AS FACILITY_ADR2, BIC_FACILITY.ADR3 AS FACILITY_ADR3, BIC_FACILITY.CITY AS FACILITY_CITY, BIC_FACILITY.STATE_PROVINCE AS FACILITY_STATE, 
                      BIC_FACILITY.ZIP AS FACILITY_ZIP, BIC_INVOICE.BILL_TO, BIC_BILL_TO.NAME AS BILL_NAME, BIC_BILL_TO.ADR1 AS BILL_ADR1, BIC_BILL_TO.ADR2 AS BILL_ADR2, BIC_BILL_TO.ADR3 AS BILL_ADR3, 
                      BIC_BILL_TO.CITY AS BILL_CITY, BIC_BILL_TO.STATE_PROVINCE AS BILL_STATE, BIC_BILL_TO.ZIP AS BILL_ZIP, BIC_INVOICE.CUST_CODE, BIC_CUSTOMER.NAME AS CUST_NAME, BIC_CUSTOMER.ADR1 AS CUST_ADR1, 
                      BIC_CUSTOMER.ADR2 AS CUST_ADR2, BIC_CUSTOMER.ADR3 AS CUST_ADR3, BIC_CUSTOMER.CITY AS CUST_CITY, BIC_CUSTOMER.STATE_PROVINCE AS CUST_STATE, BIC_CUSTOMER.ZIP AS CUST_ZIP, 
                      BIC_CHARGE.ORDER_NO, BIC_ORDER_HISTORY.PO_NO, BIC_ORDER_HISTORY.PROBILL, BIC_ORDER_HISTORY.VESSEL, BIC_CHARGE.ORDER_LINE, BIC_CHARGE.ITEM, BIC_ITEM.ITEM_DESC, BIC_CHARGE.LOT_CODE, BIC_INVENTORY.ROTATION_CODE, 
                      BIC_CHARGE.GRS_BAL, BIC_CHARGE.NET_BAL, BIC_CHARGE.WGT_UOM, BIC_CHARGE.QTY_BAL, BIC_CHARGE.QTY_UOM, BIC_CHARGE.CHARGE_CODE, BIC_CHARGE.CHARGE_RATE, BIC_CHARGE.CHARGE_UOM, BIC_CHARGE.CHARGE_AMT, 
                      BIC_REMIT.NAME AS REMIT_NAME, BIC_REMIT.ADR1 AS REMIT_ADR1, BIC_REMIT.ADR2 AS REMIT_ADR2, BIC_REMIT.ADR3 AS REMIT_ADR3, BIC_REMIT.CITY AS REMIT_CITY, 
                      BIC_REMIT.STATE_PROVINCE AS REMIT_STATE, BIC_REMIT.ZIP AS REMIT_ZIP, BIC_REMIT.PHONE AS REMIT_PHONE, BIC_REMIT.CONTACT1 AS REMIT_CONTACT1, 
                      BIC_INVOICE.INVOICE_TERMS, BIC_INVOICE_TERMS.TERMS_DESC, BIC_ORDER_HISTORY.CARRIER AS CARRIER_NAME, BIC_CHARGE_CODE.CHARGE_CODE_TYPE, BIC_CHARGE.CHARGE_QTY, BIC_ITEM.CUST_CODE AS SKU_STOREKEY,BIC_ITEM.ITEM AS SKU_SKU 
FROM         billadmin.BIC_INVOICE  INNER JOIN
                      billadmin.BIC_CHARGE  LEFT OUTER JOIN
                      billadmin.BIC_ITEM  ON BIC_ITEM.ITEM = BIC_CHARGE.ITEM AND BIC_ITEM.PKG = BIC_CHARGE.PKG AND BIC_ITEM.CUST_CODE = BIC_CHARGE.CUST_CODE LEFT OUTER JOIN
                      billadmin.BIC_ORDER_HISTORY  ON BIC_ORDER_HISTORY.ORDER_KEY = BIC_CHARGE.ORDER_KEY LEFT OUTER JOIN
                      billadmin.BIC_INVENTORY  ON BIC_INVENTORY.INVENTORY_KEY = BIC_CHARGE.INVENTORY_KEY ON BIC_INVOICE.INVOICE_NO = BIC_CHARGE.INVOICE_NO INNER JOIN
                      billadmin.BIC_CHARGE_CODE  ON BIC_CHARGE.CHARGE_CODE = BIC_CHARGE_CODE.CHARGE_CODE INNER JOIN
                      billadmin.BIC_FACILITY  LEFT OUTER JOIN
                      billadmin.BIC_REMIT  ON BIC_REMIT.REMIT_CODE = BIC_FACILITY.DEF_REMIT_CODE ON BIC_CHARGE.FACILITY_ID = BIC_FACILITY.FACILITY_ID INNER JOIN
                      billadmin.BIC_CUSTOMER  ON BIC_INVOICE.CUST_CODE = BIC_CUSTOMER.CUST_CODE INNER JOIN
                      billadmin.BIC_BILL_TO  ON BIC_INVOICE.BILL_TO = BIC_BILL_TO.BILL_TO_CUST INNER JOIN
                      billadmin.BIC_INVOICE_BATCH  ON BIC_INVOICE.BATCH_NO = BIC_INVOICE_BATCH.BATCH_NO INNER JOIN
                      billadmin.BIC_INVOICE_TERMS  ON BIC_INVOICE.INVOICE_TERMS = BIC_INVOICE_TERMS.INVOICE_TERMS;
CREATE OR REPLACE VIEW BILLADMIN.VW_PROFIT_BY_CUSTOMER AS 
WITH base_data AS (
    SELECT DISTINCT c.CUST_CODE, cust.name AS custname, d.BILL_TO, billto.name AS billtoname, 
                    f.facility_id, f.NAME AS facname, pmdate.actual_date AS yrmon
    from Billadmin.BIC_CONTRACT c
     join Billadmin.BIC_CONTRACT_DET d ON c.CONTRACT_KEY = d.CONTRACT_KEY
     join Billadmin.BIC_CUSTOMER cust ON c.CUST_CODE = cust.CUST_CODE
     join Billadmin.BIC_BILL_TO billto ON d.BILL_TO = billto.BILL_TO_CUST
     join Billadmin.BIC_FACILITY f ON d.FACILITY_ID = f.FACILITY_ID
    JOIN Billadmin.PM_D_DATE pmdate ON pmdate.calendar_day = '01'
    WHERE EXISTS (
        SELECT 1 from Billadmin.BIC_CHARGE g 
        WHERE g.CUST_CODE = c.CUST_CODE AND g.BILL_TO = d.BILL_TO AND g.FACILITY_ID = f.FACILITY_ID
    )
    OR EXISTS (
        SELECT 1 from Billadmin.BIC_ORDER_HISTORY h 
        WHERE h.CUST_CODE = c.CUST_CODE AND h.FACILITY_ID = f.FACILITY_ID
    )
),
charge_data AS (
    SELECT der1.*, SUM(chg.CHARGE_AMT) AS chargeamt, 0 AS costamt
    FROM base_data der1
    LEFT  join Billadmin.BIC_CHARGE chg 
      ON der1.FACILITY_ID = chg.FACILITY_ID 
     AND der1.CUST_CODE = chg.CUST_CODE 
     AND der1.BILL_TO = chg.BILL_TO
     AND chg.invoice_status NOT IN ('O', 'H', 'P') 
     AND DATE_TRUNC('MONTH', chg.charge_date) = der1.yrmon
    GROUP BY der1.FACILITY_ID, der1.CUST_CODE, der1.BILL_TO, der1.facname, der1.custname, der1.billtoname, der1.yrmon
),
cost_data AS (
    SELECT der1.*, 0 AS chargeamt, SUM(chg.CHARGE_QTY * chg.QTY_FACTOR * chg.RATE_COST) AS costamt
    FROM base_data der1
    LEFT  join Billadmin.BIC_CHARGE chg 
      ON der1.FACILITY_ID = chg.FACILITY_ID 
     AND der1.CUST_CODE = chg.CUST_CODE 
     AND der1.BILL_TO = chg.BILL_TO
     AND chg.invoice_status NOT IN ('O', 'H', 'P') 
     AND DATE_TRUNC('MONTH', chg.charge_date) = der1.yrmon
    GROUP BY der1.FACILITY_ID, der1.CUST_CODE, der1.BILL_TO, der1.facname, der1.custname, der1.billtoname, der1.yrmon
),
cost_dist_data AS (
    SELECT der1.*, 0 AS chargeamt, SUM(cst.COST_AMT) AS costamt
    FROM base_data der1
    LEFT  join Billadmin.BIC_COST_DIST cst 
      ON der1.FACILITY_ID = cst.FACILITY_ID 
     AND der1.CUST_CODE = cst.CUST_CODE
     AND cst.COST_NO IN (
         SELECT COST_NO from Billadmin.BIC_COST t 
         WHERE DATE_TRUNC('MONTH', t.COST_DATE) = der1.yrmon
     )
    GROUP BY der1.FACILITY_ID, der1.CUST_CODE, der1.BILL_TO, der1.facname, der1.custname, der1.billtoname, der1.yrmon
)
SELECT CUST_CODE, custname, BILL_TO, billtoname, FACILITY_ID, facname, yrmon,
       SUM(chargeamt) AS CHARGEAMT, SUM(costamt) AS COSTAMT, 
       (SUM(chargeamt) - SUM(costamt)) AS profitamt
FROM (
    SELECT * FROM charge_data
    UNION ALL
    SELECT * FROM cost_data
    UNION ALL
    SELECT * FROM cost_dist_data
) combined_data
GROUP BY CUST_CODE, custname, BILL_TO, billtoname, FACILITY_ID, facname, yrmon;
CREATE or REPLACE VIEW BILLADMIN.VW_WAREHOUSE_RECEIPT AS SELECT REMIT.NAME REMIT_NAME,
          REMIT.ADR1 REMIT_ADR1,
          REMIT.ADR2 REMIT_ADR2,
          REMIT.ADR3 REMIT_ADR3,
          REMIT.CITY REMIT_CITY,
          REMIT.STATE_PROVINCE REMIT_STATE,
          REMIT.ZIP REMIT_ZIP,
          CHG.ORDER_NO,
          CHG.ORDER_TYPE,
          CHG.CHARGE_DATE,
          CARRIER.NAME CARRIER_NAME,
          CHG.FACILITY_ID,
          FAC.NAME FACILITY_NAME,
          FAC.ADR1 FACILITY_ADR1,
          FAC.ADR2 FACILITY_ADR2,
          FAC.ADR3 FACILITY_ADR3,
          FAC.CITY FACILITY_CITY,
          FAC.STATE_PROVINCE FACILITY_STATE,
          FAC.ZIP FACILITY_ZIP,
          HIST.WM_ORDER_NO,
          HIST.PO_NO,
          HIST.PROBILL,
          HIST.VESSEL,
          CHG.BATCH_NO,
          CHG.INVOICE_NO,
          CHG.CUST_CODE,
          CUST.NAME CUST_NAME,
          CUST.ADR1 CUST_ADR1,
          CUST.ADR2 CUST_ADR2,
          CUST.ADR3 CUST_ADR3,
          CUST.CITY CUST_CITY,
          CUST.STATE_PROVINCE CUST_STATE,
          CUST.ZIP CUST_ZIP,
          CHG.ORDER_LINE,
          CHG.ITEM,
          ITEM.ITEM_DESC,
          CHG.LOT_CODE,
	  CHG.UC1,
	  CHG.UC2,
	  CHG.UC3,
          CHG.CHARGE_CODE,
          CHG.QTY_BAL,
          CHG.QTY_UOM,
          CHG.CHARGE_RATE,
          CHG.CHARGE_UOM
     from Billadmin.BIC_CHARGE CHG,
          Billadmin.BIC_CHARGE_CODE CODE,
          Billadmin.BIC_CUSTOMER CUST,
          Billadmin.BIC_ITEM ITEM,
          Billadmin.BIC_ORDER_HISTORY HIST,
          Billadmin.BIC_CARRIER CARRIER,
          Billadmin.BIC_FACILITY FAC
            LEFT  join Billadmin.BIC_REMIT REMIT
             ON REMIT.REMIT_CODE = FAC.DEF_REMIT_CODE
    WHERE CODE.CHARGE_CODE = CHG.CHARGE_CODE
            AND FAC.FACILITY_ID = CHG.FACILITY_ID
            AND CUST.CUST_CODE = CHG.CUST_CODE
            AND ITEM.ITEM = CHG.ITEM AND (ITEM.PKG = CHG.PKG  OR ITEM.PKG IS NULL OR  CHG.PKG  IS NULL ) AND ITEM.CUST_CODE = CHG.CUST_CODE
            AND HIST.ORDER_KEY = CHG.ORDER_KEY
            AND HIST.ACTIVITY_ID != 'OUTBOUND'
			AND HIST.ACTIVITY_ID != 'LOAD';



