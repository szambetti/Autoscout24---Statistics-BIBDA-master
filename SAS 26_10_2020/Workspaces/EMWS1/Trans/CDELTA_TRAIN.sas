*------------------------------------------------------------*;
* Computed Code;
*------------------------------------------------------------*;

if NAME="OPT_IMP_REP_Consumo_Carburante_T" then do;
   COMMENT = "Optimal Binning(4) ";
ROLE ="INPUT";
REPORT ="N";
LEVEL  ="NOMINAL";
end;
if NAME="IMP_REP_Consumo_Carburante_Total" then delete;

if NAME="OPT_IMP_REP_Emissioni_di_CO2" then do;
   COMMENT = "Optimal Binning(4) ";
ROLE ="INPUT";
REPORT ="N";
LEVEL  ="NOMINAL";
end;
if NAME="IMP_REP_Emissioni_di_CO2" then delete;

if NAME="OPT_IMP_REP_Peso_a_vuoto" then do;
   COMMENT = "Optimal Binning(4) ";
ROLE ="INPUT";
REPORT ="N";
LEVEL  ="NOMINAL";
end;
if NAME="IMP_REP_Peso_a_vuoto" then delete;

if NAME="LG10_REP_price" then do;
   COMMENT = "log10(REP_price  + 1) ";
ROLE ="INPUT";
REPORT ="N";
LEVEL  ="INTERVAL";
end;
if NAME="REP_price" then delete;
