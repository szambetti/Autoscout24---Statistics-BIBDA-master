* ;
*Variable: Cilindrata;
* ;
Label REP_Cilindrata= 'Replacement: Cilindrata';
length REP_Cilindrata 8;
REP_Cilindrata= Cilindrata;
if Cilindrata eq . then REP_Cilindrata = .;
else
if Cilindrata<-296.6252185 then REP_Cilindrata=-296.6252185;
else
if Cilindrata>3194.2619706 then REP_Cilindrata=3194.2619706;
