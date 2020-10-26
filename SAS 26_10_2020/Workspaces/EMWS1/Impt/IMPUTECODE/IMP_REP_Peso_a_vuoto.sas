label IMP_REP_Peso_a_vuoto = 'Imputed: Replacement: Peso_a_vuoto';
length IMP_REP_Peso_a_vuoto 8;
IMP_REP_Peso_a_vuoto = REP_Peso_a_vuoto;
if missing(REP_Peso_a_vuoto) then IMP_REP_Peso_a_vuoto = 1320;
