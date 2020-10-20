   
* ;
* Defining: REP_Colore_esterno;
* ;
Length REP_Colore_esterno$11;
Label REP_Colore_esterno='Replacement: Colore_esterno';
REP_Colore_esterno=Colore_esterno;
* ;
* Variable: Colore_esterno;
* ;
_UFORMAT200 = strip(Colore_esterno);
if _UFORMAT200 =  '' then
REP_Colore_esterno='';
