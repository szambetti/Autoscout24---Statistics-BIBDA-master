   
* ;
* Defining: REP_Tipo_di_cambio;
* ;
Length REP_Tipo_di_cambio$14;
Label REP_Tipo_di_cambio='Replacement: Tipo_di_cambio';
REP_Tipo_di_cambio=Tipo_di_cambio;
* ;
* Variable: Tipo_di_cambio;
* ;
_UFORMAT200 = strip(Tipo_di_cambio);
if _UFORMAT200 =  '' then
REP_Tipo_di_cambio='';
