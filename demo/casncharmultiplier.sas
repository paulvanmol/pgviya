/* This code is submitted on the PC using WLATIN1 encoding */
libname pgviya base "/home/student/Courses/pgviya";
data pgviya.registered;
length x $ 16; 
x='I work at SAS ®';
y=999; 
run;
/*****************************************************************************/
/*  Create a CAS library (myCaslib) for the specified path ("/filePath/")    */ 
/*  and session (mySession).  If "sessref=" is omitted, the caslib is        */ 
/*  created and activated for the current session.  Setting subdirs extends  */
/*  the scope of myCaslib to subdirectories of "/filePath".                  */
/*****************************************************************************/

caslib myCas datasource=(srctype="path") path="/home/student/Courses/pgviya" sessref=mySession subdirs;
libname myCas cas;


/* This code is then executed in the SAS Viya environment */
proc casutil;
droptable casdata="registered91" incaslib='casuser' quiet;
load casdata='registered.sas7bdat' incaslib='mycas' outcaslib='casuser'
casout='registered91';
list tables incaslib="casuser"; 
contents casdata="registered91" incaslib="casuser"; 
quit;


proc casutil;
droptable casdata="registered92" incaslib='casuser' quiet;
load casdata='registered.sas7bdat' incaslib='mycas' outcaslib='casuser'
casout='registered92'
importoptions=(filetype='basesas',charmultiplier=2 varcharconversion=16);
list tables incaslib="casuser"; 
contents casdata="registered92" incaslib="casuser"; 
quit;

libname mycas clear; 
caslib mycas clear; 