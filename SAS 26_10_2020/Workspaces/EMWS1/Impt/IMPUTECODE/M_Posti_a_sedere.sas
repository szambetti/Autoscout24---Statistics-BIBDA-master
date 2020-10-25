label M_Posti_a_sedere = "Imputation Indicator for Posti_a_sedere";
if missing(Posti_a_sedere) then M_Posti_a_sedere = 1;
else M_Posti_a_sedere= 0;
