* ;
*Variable: Peso_a_vuoto;
* ;
Label REP_Peso_a_vuoto= 'Replacement: Peso_a_vuoto';
length REP_Peso_a_vuoto 8;
REP_Peso_a_vuoto= Peso_a_vuoto;
if Peso_a_vuoto eq . then REP_Peso_a_vuoto = .;
else
if Peso_a_vuoto<563.46646748 then REP_Peso_a_vuoto=563.46646748;
else
if Peso_a_vuoto>2063.9834387 then REP_Peso_a_vuoto=2063.9834387;
