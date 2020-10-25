proc sort data= Lib.AUTOSCOUT_SCORE_DATA out= bestlist;
by descending ep_target_b;
run;
proc print data= bestlist;
var control_number ep_target_b;
run;
