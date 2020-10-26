* ;
*Variable: Anno;
* ;
Label REP_Anno= 'Replacement: Anno';
length REP_Anno 8;
REP_Anno= Anno;
if Anno eq . then REP_Anno = .;
else
if Anno<2011 then REP_Anno=2011;
else
if Anno>2018 then REP_Anno=2018;
