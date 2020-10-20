* ;
*Variable: Emissioni_di_CO2;
* ;
Label REP_Emissioni_di_CO2= 'Replacement: Emissioni_di_CO2';
length REP_Emissioni_di_CO2 8;
REP_Emissioni_di_CO2= Emissioni_di_CO2;
if Emissioni_di_CO2 eq . then REP_Emissioni_di_CO2 = .;
else
if Emissioni_di_CO2<33.535862497 then REP_Emissioni_di_CO2=33.535862497;
else
if Emissioni_di_CO2>196.82490305 then REP_Emissioni_di_CO2=196.82490305;
