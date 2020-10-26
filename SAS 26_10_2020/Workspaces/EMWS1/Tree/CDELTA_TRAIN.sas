if upcase(NAME) = "ALIMENTAZIONE" then do;
ROLE = "REJECTED";
end;
else 
if upcase(NAME) = "CARROZZERIA" then do;
ROLE = "REJECTED";
end;
else 
if upcase(NAME) = "CILINDRI" then do;
ROLE = "REJECTED";
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
ROLE = "REJECTED";
end;
else 
if upcase(NAME) = "PER_NEOPATENTATI" then do;
ROLE = "REJECTED";
end;
else 
if upcase(NAME) = "PORTE" then do;
ROLE = "REJECTED";
end;
else 
if upcase(NAME) = "POSTI_A_SEDERE" then do;
ROLE = "REJECTED";
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
if upcase(NAME) = "REP_TIPO_DI_VERNICE" then do;
ROLE = "REJECTED";
end;
else 
if upcase(NAME) = "TAGLIANDI_CERTIFICATI" then do;
ROLE = "REJECTED";
end;
else 
if upcase(NAME) = "TIPO_DI_CAMBIO" then do;
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
else 
if upcase(NAME) = "_NODE_" then do;
ROLE = "SEGMENT";
LEVEL = "NOMINAL";
end;
