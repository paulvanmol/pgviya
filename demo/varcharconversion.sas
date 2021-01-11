%let homedir=%sysget(HOME);

%let path=&homedir/Courses/PGVY35;

libname pvbase "&path/data";
cas mySession sessopts=(caslib=casuser timeout=1800 metrics=true);
libname casuser cas; 


/*****************************************************************************/
/*  Load a table ("sourceTableName") from the specified caslib               */
/*  ("sourceCaslib") to the target Caslib ("targetCaslib") and save it as    */
/*  "targetTableName".                                                       */
/*****************************************************************************/
libname pvcas cas caslib=pvcas; 

proc casutil;
	droptable casdata="customers" incaslib="casuser" quiet; 
	load casdata="customers.xlsx" incaslib="pvcas" 
	outcaslib="casuser" casout="customers" ;
	save casdata='customers' incaslib='casuser' outcaslib="casuser" replace; 
	list files incaslib='casuser';
	contents casdata='customers' incaslib='casuser';
run;

proc import datafile="/home/student/Courses/PGVY35/data/customers.xlsx"
	dbms=xlsx
	out=work.customers; 
run;

data casuser.customers_imp; 
	set work.customers; 
run; 

proc casutil; 
	save casdata='customers_imp' incaslib='casuser' outcaslib="casuser" replace; 
	list files incaslib='casuser';
	contents casdata='customers_imp' incaslib='casuser';
	quit; 