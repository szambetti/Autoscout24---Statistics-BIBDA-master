* ;
*Variable: Consumo_Carburante_Totale;
* ;
Label REP_Consumo_Carburante_Totale= 'Replacement: Consumo_Carburante_Totale';
length REP_Consumo_Carburante_Totale 8;
REP_Consumo_Carburante_Totale= Consumo_Carburante_Totale;
if Consumo_Carburante_Totale eq . then REP_Consumo_Carburante_Totale = .;
else
if Consumo_Carburante_Totale<-2.6600623 then REP_Consumo_Carburante_Totale=-2.6600623;
else
if Consumo_Carburante_Totale>12.798697031 then REP_Consumo_Carburante_Totale=12.798697031;
