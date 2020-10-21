* ;
*Variable: Cilindrata;
* ;
Label REP_Cilindrata= 'Replacement: Cilindrata';
length REP_Cilindrata 8;
REP_Cilindrata= Cilindrata;
if Cilindrata eq . then REP_Cilindrata = .;
else
if Cilindrata<-39.08062513 then REP_Cilindrata=-39.08062513;
else
if Cilindrata>2753.1044295 then REP_Cilindrata=2753.1044295;
