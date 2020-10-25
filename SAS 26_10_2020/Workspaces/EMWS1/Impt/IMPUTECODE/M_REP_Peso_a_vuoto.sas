label M_REP_Peso_a_vuoto = "Imputation Indicator for REP_Peso_a_vuoto";
if missing(REP_Peso_a_vuoto) then M_REP_Peso_a_vuoto = 1;
else M_REP_Peso_a_vuoto= 0;
