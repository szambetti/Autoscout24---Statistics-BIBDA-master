label M_REP_Consumo_Carburante_Total = "Imputation Indicator for REP_Consumo_Carburante_Totale";
if missing(REP_Consumo_Carburante_Totale) then M_REP_Consumo_Carburante_Total = 1;
else M_REP_Consumo_Carburante_Total= 0;
