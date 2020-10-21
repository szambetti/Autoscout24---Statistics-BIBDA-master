if NAME="Cilindrata" then do;
ROLE="REJECTED";
COMMENT= "Replaced by Repl";
end;
else
if NAME="REP_Cilindrata" then do;
ROLE="INPUT";
LEVEL="INTERVAL";
end;
else
if NAME="Emissioni_di_CO2" then do;
ROLE="REJECTED";
COMMENT= "Replaced by Repl";
end;
else
if NAME="REP_Emissioni_di_CO2" then do;
ROLE="INPUT";
LEVEL="INTERVAL";
end;
else
if NAME="Peso_a_vuoto" then do;
ROLE="REJECTED";
COMMENT= "Replaced by Repl";
end;
else
if NAME="REP_Peso_a_vuoto" then do;
ROLE="INPUT";
LEVEL="INTERVAL";
end;
else
if NAME="price" then do;
ROLE="REJECTED";
COMMENT= "Replaced by Repl";
end;
else
if NAME="REP_price" then do;
ROLE="INPUT";
LEVEL="INTERVAL";
end;
if NAME="Classe_emissioni" then ROLE="REJECTED";
else
if NAME="REP_Classe_emissioni" then do;
ROLE="INPUT";
LEVEL="NOMINAL";
end;
else
if NAME="Colore_esterno" then ROLE="REJECTED";
else
if NAME="REP_Colore_esterno" then do;
ROLE="INPUT";
LEVEL="NOMINAL";
end;
else
if NAME="Consumo_carburante_combinato" then ROLE="REJECTED";
else
if NAME="REP_Consumo_carburante_combinato" then do;
ROLE="INPUT";
LEVEL="NOMINAL";
end;
else
if NAME="Consumo_carburante_urbano" then ROLE="REJECTED";
else
if NAME="REP_Consumo_carburante_urbano" then do;
ROLE="INPUT";
LEVEL="NOMINAL";
end;
else
if NAME="Tipo_di_cambio" then ROLE="REJECTED";
else
if NAME="REP_Tipo_di_cambio" then do;
ROLE="INPUT";
LEVEL="NOMINAL";
end;
else
if NAME="Tipo_di_unita" then ROLE="REJECTED";
else
if NAME="REP_Tipo_di_unita" then do;
ROLE="INPUT";
LEVEL="NOMINAL";
end;
else
if NAME="Tipo_di_vernice" then ROLE="REJECTED";
else
if NAME="REP_Tipo_di_vernice" then do;
ROLE="INPUT";
LEVEL="NOMINAL";
end;
