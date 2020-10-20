   
* ;
* Defining: REP_Consumo_carburante_urbano;
* ;
Length REP_Consumo_carburante_urbano$4;
Label REP_Consumo_carburante_urbano='Replacement: Consumo_carburante_urbano';
REP_Consumo_carburante_urbano=Consumo_carburante_urbano;
* ;
* Variable: Consumo_carburante_urbano;
* ;
_UFORMAT200 = strip(Consumo_carburante_urbano);
if _UFORMAT200 =  '' then
REP_Consumo_carburante_urbano='';
