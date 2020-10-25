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
