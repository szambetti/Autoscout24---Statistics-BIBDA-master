   
* ;
* Defining: REP_Classe_emissioni;
* ;
Length REP_Classe_emissioni$12;
Label REP_Classe_emissioni='Replacement: Classe_emissioni';
REP_Classe_emissioni=Classe_emissioni;
* ;
* Variable: Classe_emissioni;
* ;
_UFORMAT200 = strip(Classe_emissioni);
if _UFORMAT200 =  '' then
REP_Classe_emissioni='';
