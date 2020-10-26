* ;
*Variable: Peso_a_vuoto;
* ;
Label REP_Peso_a_vuoto= 'Replacement: Peso_a_vuoto';
length REP_Peso_a_vuoto 8;
REP_Peso_a_vuoto= Peso_a_vuoto;
if Peso_a_vuoto eq . then REP_Peso_a_vuoto = .;
else
if Peso_a_vuoto<562.90603943 then REP_Peso_a_vuoto=562.90603943;
else
if Peso_a_vuoto>2065.7059456 then REP_Peso_a_vuoto=2065.7059456;
