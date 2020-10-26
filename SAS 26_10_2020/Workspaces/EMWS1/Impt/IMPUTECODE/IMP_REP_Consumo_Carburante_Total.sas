label IMP_REP_Consumo_Carburante_Total = 'Imputed: Replacement: Consumo_Carburante_Totale';
length IMP_REP_Consumo_Carburante_Total 8;
IMP_REP_Consumo_Carburante_Total = REP_Consumo_Carburante_Totale;
if missing(REP_Consumo_Carburante_Totale) then IMP_REP_Consumo_Carburante_Total = 4.9;
