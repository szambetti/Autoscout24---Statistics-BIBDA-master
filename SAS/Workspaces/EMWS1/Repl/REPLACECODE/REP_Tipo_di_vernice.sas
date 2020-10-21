   
* ;
* Defining: REP_Tipo_di_vernice;
* ;
Length REP_Tipo_di_vernice$12;
Label REP_Tipo_di_vernice='Replacement: Tipo_di_vernice';
REP_Tipo_di_vernice=Tipo_di_vernice;
* ;
* Variable: Tipo_di_vernice;
* ;
_UFORMAT200 = strip(Tipo_di_vernice);
if _UFORMAT200 =  '' then
REP_Tipo_di_vernice='';
