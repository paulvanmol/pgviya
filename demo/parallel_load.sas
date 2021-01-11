

caslib pvcas path='/home/student/Courses/PGVY35/data'
datasource=(srctype='path') global ;
proc casutil;
	droptable casdata="orderstest1" incaslib="pvcas"  quiet; 
load casdata='orders.sas7bdat' incaslib='pvcas'
outcaslib='pvcas' casout='orderstest1' promote
importoptions={filetype='basesas',dtm='parallel',debug='dmsglvli'};
quit;
proc casutil;
	droptable casdata="orderstest2" incaslib="pvcas"  quiet; 
load casdata='orders.sas7bdat' incaslib='pvcas'
outcaslib='pvcas' casout='orderstest2' promote
importoptions={filetype='basesas',dtm='serial',debug='dmsglvli'};
quit;