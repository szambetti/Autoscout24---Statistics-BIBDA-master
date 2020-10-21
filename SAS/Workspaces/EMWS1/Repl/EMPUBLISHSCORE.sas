* ;
* Variable: Cilindrata ;
* ;
Label REP_Cilindrata='Replacement: Cilindrata';
Length REP_Cilindrata 8;
REP_Cilindrata =Cilindrata ;
if Cilindrata  eq . then REP_Cilindrata = . ;
else
if Cilindrata <-39.08062513  then REP_Cilindrata  = -39.08062513 ;
else
if Cilindrata >2753.1044295  then REP_Cilindrata  = 2753.1044295 ;
* ;
* Variable: Emissioni_di_CO2 ;
* ;
Label REP_Emissioni_di_CO2='Replacement: Emissioni_di_CO2';
Length REP_Emissioni_di_CO2 8;
REP_Emissioni_di_CO2 =Emissioni_di_CO2 ;
if Emissioni_di_CO2  eq . then REP_Emissioni_di_CO2 = . ;
else
if Emissioni_di_CO2 <33.535862497  then REP_Emissioni_di_CO2  = 33.535862497 ;
else
if Emissioni_di_CO2 >196.82490305  then REP_Emissioni_di_CO2  = 196.82490305 ;
* ;
* Variable: Peso_a_vuoto ;
* ;
Label REP_Peso_a_vuoto='Replacement: Peso_a_vuoto';
Length REP_Peso_a_vuoto 8;
REP_Peso_a_vuoto =Peso_a_vuoto ;
if Peso_a_vuoto  eq . then REP_Peso_a_vuoto = . ;
else
if Peso_a_vuoto <563.46646748  then REP_Peso_a_vuoto  = 563.46646748 ;
else
if Peso_a_vuoto >2063.9834387  then REP_Peso_a_vuoto  = 2063.9834387 ;
* ;
* Variable: price ;
* ;
Label REP_price='Replacement: price';
Length REP_price 8;
REP_price =price ;
if price  eq . then REP_price = . ;
else
if price <-17140.31377  then REP_price  = -17140.31377 ;
else
if price >61735.155006  then REP_price  = 61735.155006 ;
   
* ;
* Defining New Variables;
* ;
Length REP_Classe_emissioni $12;
Label REP_Classe_emissioni='Replacement: Classe_emissioni';
REP_Classe_emissioni= Classe_emissioni;
Length REP_Colore_esterno $11;
Label REP_Colore_esterno='Replacement: Colore_esterno';
REP_Colore_esterno= Colore_esterno;
Length REP_Consumo_carburante_combinato $4;
Label REP_Consumo_carburante_combinato='Replacement: Consumo_carburante_combinato';
REP_Consumo_carburante_combinato= Consumo_carburante_combinato;
Length REP_Consumo_carburante_urbano $4;
Label REP_Consumo_carburante_urbano='Replacement: Consumo_carburante_urbano';
REP_Consumo_carburante_urbano= Consumo_carburante_urbano;
Length REP_Tipo_di_cambio $14;
Label REP_Tipo_di_cambio='Replacement: Tipo_di_cambio';
REP_Tipo_di_cambio= Tipo_di_cambio;
Length REP_Tipo_di_unita $10;
Label REP_Tipo_di_unita='Replacement: Tipo_di_unita';
REP_Tipo_di_unita= Tipo_di_unita;
Length REP_Tipo_di_vernice $12;
Label REP_Tipo_di_vernice='Replacement: Tipo_di_vernice';
REP_Tipo_di_vernice= Tipo_di_vernice;
   
* ;
* Replace Specific Class Levels ;
* ;
length _UFormat200 $200;
drop   _UFORMAT200;
_UFORMAT200 = " ";
* ;
* Variable: Classe_emissioni;
* ;
_UFORMAT200 = strip(Classe_emissioni);
if _UFORMAT200 =  '' then
REP_Classe_emissioni='';
* ;
* Variable: Colore_esterno;
* ;
_UFORMAT200 = strip(Colore_esterno);
if _UFORMAT200 =  '' then
REP_Colore_esterno='';
* ;
* Variable: Consumo_carburante_combinato;
* ;
_UFORMAT200 = strip(Consumo_carburante_combinato);
if _UFORMAT200 =  '' then
REP_Consumo_carburante_combinato='';
* ;
* Variable: Consumo_carburante_urbano;
* ;
_UFORMAT200 = strip(Consumo_carburante_urbano);
if _UFORMAT200 =  '' then
REP_Consumo_carburante_urbano='';
* ;
* Variable: Tipo_di_cambio;
* ;
_UFORMAT200 = strip(Tipo_di_cambio);
if _UFORMAT200 =  '' then
REP_Tipo_di_cambio='';
* ;
* Variable: Tipo_di_unita;
* ;
_UFORMAT200 = strip(Tipo_di_unita);
if _UFORMAT200 =  '' then
REP_Tipo_di_unita='';
* ;
* Variable: Tipo_di_vernice;
* ;
_UFORMAT200 = strip(Tipo_di_vernice);
if _UFORMAT200 =  '' then
REP_Tipo_di_vernice='';
