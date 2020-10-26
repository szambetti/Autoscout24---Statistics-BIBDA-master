label IMP_REP_Cilindrata = 'Imputed: Replacement: Cilindrata';
length IMP_REP_Cilindrata 8;
IMP_REP_Cilindrata = REP_Cilindrata;
if missing(REP_Cilindrata) then IMP_REP_Cilindrata = 1368;
