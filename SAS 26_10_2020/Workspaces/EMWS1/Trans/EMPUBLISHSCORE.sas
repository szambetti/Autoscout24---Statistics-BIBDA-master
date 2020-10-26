*------------------------------------------------------------*;
* Computed Code;
*------------------------------------------------------------*;
*------------------------------------------------------------*;
* TRANSFORM: REP_price , log10(REP_price + 1);
*------------------------------------------------------------*;
label LG10_REP_price = 'Transformed: Replacement: price';
length LG10_REP_price 8;
if REP_price eq . then LG10_REP_price = .;
else do;
if REP_price + 1 > 0 then LG10_REP_price = log10(REP_price + 1);
else LG10_REP_price = .;
end;
*------------------------------------------------------------*;
* TRANSFORM: IMP_REP_Consumo_Carburante_Total , Optimal Binning(4);
*------------------------------------------------------------*;
label OPT_IMP_REP_Consumo_Carburante_T = 'Transformed: Imputed: Replacement: Consumo_Carburante_Totale';
length OPT_IMP_REP_Consumo_Carburante_T $36;
if (IMP_REP_Consumo_Carburante_Total eq .) then OPT_IMP_REP_Consumo_Carburante_T="02:4.35-6.15, MISSING";
else
if (IMP_REP_Consumo_Carburante_Total < 4.35) then
OPT_IMP_REP_Consumo_Carburante_T = "01:low-4.35";
else
if (IMP_REP_Consumo_Carburante_Total >= 4.35 and IMP_REP_Consumo_Carburante_Total < 6.15) then
OPT_IMP_REP_Consumo_Carburante_T = "02:4.35-6.15, MISSING";
else
if (IMP_REP_Consumo_Carburante_Total >= 6.15 and IMP_REP_Consumo_Carburante_Total < 7.05) then
OPT_IMP_REP_Consumo_Carburante_T = "03:6.15-7.05";
else
if (IMP_REP_Consumo_Carburante_Total >= 7.05) then
OPT_IMP_REP_Consumo_Carburante_T = "04:7.05-high";
*------------------------------------------------------------*;
* TRANSFORM: IMP_REP_Emissioni_di_CO2 , Optimal Binning(4);
*------------------------------------------------------------*;
label OPT_IMP_REP_Emissioni_di_CO2 = 'Transformed: Imputed: Replacement: Emissioni_di_CO2';
length OPT_IMP_REP_Emissioni_di_CO2 $36;
if (IMP_REP_Emissioni_di_CO2 eq .) then OPT_IMP_REP_Emissioni_di_CO2="02:92.5-121.5, MISSING";
else
if (IMP_REP_Emissioni_di_CO2 < 92.5) then
OPT_IMP_REP_Emissioni_di_CO2 = "01:low-92.5";
else
if (IMP_REP_Emissioni_di_CO2 >= 92.5 and IMP_REP_Emissioni_di_CO2 < 121.5) then
OPT_IMP_REP_Emissioni_di_CO2 = "02:92.5-121.5, MISSING";
else
if (IMP_REP_Emissioni_di_CO2 >= 121.5) then
OPT_IMP_REP_Emissioni_di_CO2 = "03:121.5-high";
*------------------------------------------------------------*;
* TRANSFORM: IMP_REP_Peso_a_vuoto , Optimal Binning(4);
*------------------------------------------------------------*;
label OPT_IMP_REP_Peso_a_vuoto = 'Transformed: Imputed: Replacement: Peso_a_vuoto';
length OPT_IMP_REP_Peso_a_vuoto $36;
if (IMP_REP_Peso_a_vuoto eq .) then OPT_IMP_REP_Peso_a_vuoto="03:1077.5-1332, MISSING";
else
if (IMP_REP_Peso_a_vuoto < 1030) then
OPT_IMP_REP_Peso_a_vuoto = "01:low-1030";
else
if (IMP_REP_Peso_a_vuoto >= 1030 and IMP_REP_Peso_a_vuoto < 1077.5) then
OPT_IMP_REP_Peso_a_vuoto = "02:1030-1077.5";
else
if (IMP_REP_Peso_a_vuoto >= 1077.5 and IMP_REP_Peso_a_vuoto < 1332) then
OPT_IMP_REP_Peso_a_vuoto = "03:1077.5-1332, MISSING";
else
if (IMP_REP_Peso_a_vuoto >= 1332) then
OPT_IMP_REP_Peso_a_vuoto = "04:1332-high";
