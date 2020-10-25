* ;
* Variable: Anno ;
* ;
Label REP_Anno='Replacement: Anno';
Length REP_Anno 8;
REP_Anno =Anno ;
if Anno  eq . then REP_Anno = . ;
else
if Anno <2011  then REP_Anno  = 2011 ;
else
if Anno >2018  then REP_Anno  = 2018 ;
* ;
* Variable: Cilindrata ;
* ;
Label REP_Cilindrata='Replacement: Cilindrata';
Length REP_Cilindrata 8;
REP_Cilindrata =Cilindrata ;
if Cilindrata  eq . then REP_Cilindrata = . ;
else
if Cilindrata <-296.6252185  then REP_Cilindrata  = -296.6252185 ;
else
if Cilindrata >3194.2619706  then REP_Cilindrata  = 3194.2619706 ;
* ;
* Variable: Consumo_Carburante_Totale ;
* ;
Label REP_Consumo_Carburante_Totale='Replacement: Consumo_Carburante_Totale';
Length REP_Consumo_Carburante_Totale 8;
REP_Consumo_Carburante_Totale =Consumo_Carburante_Totale ;
if Consumo_Carburante_Totale  eq . then REP_Consumo_Carburante_Totale = . ;
else
if Consumo_Carburante_Totale <-2.6600623  then REP_Consumo_Carburante_Totale  = -2.6600623 ;
else
if Consumo_Carburante_Totale >12.798697031  then REP_Consumo_Carburante_Totale  = 12.798697031 ;
* ;
* Variable: Emissioni_di_CO2 ;
* ;
Label REP_Emissioni_di_CO2='Replacement: Emissioni_di_CO2';
Length REP_Emissioni_di_CO2 8;
REP_Emissioni_di_CO2 =Emissioni_di_CO2 ;
if Emissioni_di_CO2  eq . then REP_Emissioni_di_CO2 = . ;
else
if Emissioni_di_CO2 <33.51674798  then REP_Emissioni_di_CO2  = 33.51674798 ;
else
if Emissioni_di_CO2 >196.87253944  then REP_Emissioni_di_CO2  = 196.87253944 ;
* ;
* Variable: Peso_a_vuoto ;
* ;
Label REP_Peso_a_vuoto='Replacement: Peso_a_vuoto';
Length REP_Peso_a_vuoto 8;
REP_Peso_a_vuoto =Peso_a_vuoto ;
if Peso_a_vuoto  eq . then REP_Peso_a_vuoto = . ;
else
if Peso_a_vuoto <562.90603943  then REP_Peso_a_vuoto  = 562.90603943 ;
else
if Peso_a_vuoto >2065.7059456  then REP_Peso_a_vuoto  = 2065.7059456 ;
* ;
* Variable: price ;
* ;
Label REP_price='Replacement: price';
Length REP_price 8;
REP_price =price ;
if price  eq . then REP_price = . ;
else
if price <-17259.44298  then REP_price  = -17259.44298 ;
else
if price >61906.145486  then REP_price  = 61906.145486 ;
   
* ;
* Defining New Variables;
* ;
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
* Variable: Tipo_di_vernice;
* ;
_UFORMAT200 = strip(Tipo_di_vernice);
if _UFORMAT200 =  '' then
REP_Tipo_di_vernice='';
