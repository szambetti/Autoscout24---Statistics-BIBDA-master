if NAME="Anno" then do;
ROLE="REJECTED";
COMMENT= "Replaced by Repl";
end;
else
if NAME="REP_Anno" then do;
ROLE="INPUT";
LEVEL="INTERVAL";
end;
else
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
if NAME="Consumo_Carburante_Totale" then do;
ROLE="REJECTED";
COMMENT= "Replaced by Repl";
end;
else
if NAME="REP_Consumo_Carburante_Totale" then do;
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
if NAME="Tipo_di_vernice" then ROLE="REJECTED";
else
if NAME="REP_Tipo_di_vernice" then do;
ROLE="INPUT";
LEVEL="NOMINAL";
end;
