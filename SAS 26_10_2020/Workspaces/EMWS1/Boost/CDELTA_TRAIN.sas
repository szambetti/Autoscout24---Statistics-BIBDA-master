if upcase(NAME) = "ALIMENTAZIONE" then do;
ROLE = "INPUT";
end;
else 
if upcase(NAME) = "CARROZZERIA" then do;
ROLE = "INPUT";
end;
else 
if upcase(NAME) = "CILINDRI" then do;
ROLE = "INPUT";
end;
else 
if upcase(NAME) = "CLASSE_EMISSIONI" then do;
ROLE = "REJECTED";
end;
else 
if upcase(NAME) = "COLORE_ESTERNO" then do;
ROLE = "REJECTED";
end;
else 
if upcase(NAME) = "CONDITIONAL_ON_PRICE" then do;
ROLE = "REJECTED";
end;
else 
if upcase(NAME) = "MARCE" then do;
ROLE = "INPUT";
end;
else 
if upcase(NAME) = "MODELLO" then do;
ROLE = "INPUT";
end;
else 
if upcase(NAME) = "PER_NEOPATENTATI" then do;
ROLE = "INPUT";
end;
else 
if upcase(NAME) = "PORTE" then do;
ROLE = "INPUT";
end;
else 
if upcase(NAME) = "POSTI_A_SEDERE" then do;
ROLE = "INPUT";
end;
else 
if upcase(NAME) = "Q_TARGET100" then do;
ROLE = "ASSESS";
end;
else 
if upcase(NAME) = "Q_TARGET101" then do;
ROLE = "ASSESS";
end;
else 
if upcase(NAME) = "REP_ANNO" then do;
ROLE = "REJECTED";
end;
else 
if upcase(NAME) = "REP_CILINDRATA" then do;
ROLE = "INPUT";
end;
else 
if upcase(NAME) = "REP_CONSUMO_CARBURANTE_TOTALE" then do;
ROLE = "INPUT";
end;
else 
if upcase(NAME) = "REP_EMISSIONI_DI_CO2" then do;
ROLE = "REJECTED";
end;
else 
if upcase(NAME) = "REP_PESO_A_VUOTO" then do;
ROLE = "REJECTED";
end;
else 
if upcase(NAME) = "REP_PRICE" then do;
ROLE = "INPUT";
end;
else 
if upcase(NAME) = "REP_TIPO_DI_VERNICE" then do;
ROLE = "REJECTED";
end;
else 
if upcase(NAME) = "TAGLIANDI_CERTIFICATI" then do;
ROLE = "REJECTED";
end;
else 
if upcase(NAME) = "TIPO_DI_CAMBIO" then do;
ROLE = "INPUT";
end;
else 
if upcase(NAME) = "TIPO_DI_UNITA" then do;
ROLE = "REJECTED";
end;
else 
if upcase(NAME) = "USATO_GARANTITO" then do;
ROLE = "REJECTED";
end;
else 
if upcase(NAME) = "VEICOLO_PER_NON_FUMATORI" then do;
ROLE = "REJECTED";
end;
