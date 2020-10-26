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
