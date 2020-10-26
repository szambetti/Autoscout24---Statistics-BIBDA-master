if upcase(name) = 'ALIMENTAZIONE' then role = 'REJECTED';
else
if upcase(name) = 'CARROZZERIA' then role = 'REJECTED';
else
if upcase(name) = 'IMP_CILINDRI' then role = 'REJECTED';
else
if upcase(name) = 'IMP_CLASSE_EMISSIONI' then role = 'REJECTED';
else
if upcase(name) = 'IMP_COLORE_ESTERNO' then role = 'REJECTED';
else
if upcase(name) = 'IMP_MARCE' then role = 'REJECTED';
else
if upcase(name) = 'IMP_PORTE' then role = 'REJECTED';
else
if upcase(name) = 'IMP_POSTI_A_SEDERE' then role = 'REJECTED';
else
if upcase(name) = 'IMP_REP_TIPO_DI_VERNICE' then role = 'REJECTED';
else
if upcase(name) = 'IMP_TIPO_DI_CAMBIO' then role = 'REJECTED';
else
if upcase(name) = 'MODELLO' then role = 'REJECTED';
else
if upcase(name) = 'REP_ANNO' then role = 'REJECTED';
else
if upcase(name) = 'TAGLIANDI_CERTIFICATI' then role = 'REJECTED';
else
if upcase(name) = 'USATO_GARANTITO' then role = 'REJECTED';
else
if upcase(name) = 'VEICOLO_PER_NON_FUMATORI' then role = 'REJECTED';
else
if upcase(name) = 'CONDITIONAL_ON_PRICE' then role = 'REJECTED';
if upcase(strip(name)) = "G_IMP_POSTI_A_SEDERE" then level = "NOMINAL";
if upcase(strip(name)) = "G_ALIMENTAZIONE" then level = "NOMINAL";
if upcase(strip(name)) = "G_CARROZZERIA" then level = "NOMINAL";
if upcase(strip(name)) = "G_IMP_MARCE" then level = "NOMINAL";
if upcase(strip(name)) = "G_IMP_CILINDRI" then level = "NOMINAL";
if upcase(strip(name)) = "G_IMP_COLORE_ESTERNO" then level = "NOMINAL";
if upcase(strip(name)) = "G_IMP_TIPO_DI_CAMBIO" then level = "NOMINAL";
