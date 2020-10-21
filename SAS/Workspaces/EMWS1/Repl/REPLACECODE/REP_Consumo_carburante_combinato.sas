   
* ;
* Defining: REP_Consumo_carburante_combinato;
* ;
Length REP_Consumo_carburante_combinato$4;
Label REP_Consumo_carburante_combinato='Replacement: Consumo_carburante_combinato';
REP_Consumo_carburante_combinato=Consumo_carburante_combinato;
* ;
* Variable: Consumo_carburante_combinato;
* ;
_UFORMAT200 = strip(Consumo_carburante_combinato);
if _UFORMAT200 =  '' then
REP_Consumo_carburante_combinato='';
