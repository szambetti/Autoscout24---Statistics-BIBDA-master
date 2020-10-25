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
