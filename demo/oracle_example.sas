libname orabase oracle path=orcl user=student pw=Metadata0 schema=STUDENT; 


/*****************************************************************************/
/*  Load SAS data set from a Base engine library (library.tableName) into    */
/*  the specified caslib ("myCaslib") and save as "targetTableName".         */
/*****************************************************************************/

proc casutil;
	droptable casdata="ORDERS_LIB" incaslib="casuser" quiet; 
	load data=orabase.ORDERS outcaslib="casuser"
	casout="orders_lib";
run;

/*****************************************************************************/
/*  Load a table ("sourceTableName") from the specified caslib               */
/*  ("sourceCaslib") to the target Caslib ("targetCaslib") and save it as    */
/*  "targetTableName".                                                       */
/*****************************************************************************/

proc casutil;
	droptable casdata="ORDERS_CAS" incaslib="ORADATA" quiet; 
	load casdata="ORDERS" incaslib="oradata" 
	outcaslib="oradata" casout="orders_cas";
run;

