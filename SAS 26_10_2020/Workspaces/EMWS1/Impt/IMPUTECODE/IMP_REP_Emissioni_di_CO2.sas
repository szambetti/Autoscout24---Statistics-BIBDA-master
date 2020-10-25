label IMP_REP_Emissioni_di_CO2 = 'Imputed: Replacement: Emissioni_di_CO2';
length IMP_REP_Emissioni_di_CO2 8;
IMP_REP_Emissioni_di_CO2 = REP_Emissioni_di_CO2;
if missing(REP_Emissioni_di_CO2) then IMP_REP_Emissioni_di_CO2 = 116;
