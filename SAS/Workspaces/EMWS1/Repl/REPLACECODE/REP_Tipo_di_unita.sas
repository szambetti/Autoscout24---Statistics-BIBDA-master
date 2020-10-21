   
* ;
* Defining: REP_Tipo_di_unita;
* ;
Length REP_Tipo_di_unita$10;
Label REP_Tipo_di_unita='Replacement: Tipo_di_unita';
REP_Tipo_di_unita=Tipo_di_unita;
* ;
* Variable: Tipo_di_unita;
* ;
_UFORMAT200 = strip(Tipo_di_unita);
if _UFORMAT200 =  '' then
REP_Tipo_di_unita='';
