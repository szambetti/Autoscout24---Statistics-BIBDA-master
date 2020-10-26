*;
* IMPUTE VARIABLE: Tipo_di_cambio;
*;
length IMP_Tipo_di_cambio $14;
label IMP_Tipo_di_cambio = 'Imputed Tipo_di_cambio';
IMP_Tipo_di_cambio = Tipo_di_cambio;
if IMP_Tipo_di_cambio eq '' then do;
****************************************************************;
****** DECISION TREE SCORING CODE ******;
****************************************************************;
****** LENGTHS OF NEW CHARACTER VARIABLES ******;
LENGTH I_Tipo_di_cambio $ 14;
LENGTH U_Tipo_di_cambio $ 14;
LENGTH _WARN_ $ 4;
****** LABELS FOR NEW VARIABLES ******;
label P_Tipo_di_cambioAutomatico = 'Previsto: Tipo_di_cambio=Automatico';
label P_Tipo_di_cambioManuale = 'Previsto: Tipo_di_cambio=Manuale';
label P_Tipo_di_cambioSemiautomatico =
'Previsto: Tipo_di_cambio=Semiautomatico';
label Q_Tipo_di_cambioAutomatico =
'P non corretto: Tipo_di_cambio=Automatico';
label Q_Tipo_di_cambioManuale = 'P non corretto: Tipo_di_cambio=Manuale';
label Q_Tipo_di_cambioSemiautomatico =
'P non corretto: Tipo_di_cambio=Semiautomatico';
label I_Tipo_di_cambio = 'In: Tipo_di_cambio';
label U_Tipo_di_cambio = 'Non normalizzata in: Tipo_di_cambio';
label _WARN_ = 'Avvertimenti';
****** TEMPORARY VARIABLES FOR FORMATTED VALUES ******;
LENGTH _ARBFMT_14 $ 14;
DROP _ARBFMT_14;
_ARBFMT_14 = ' ';
/* Initialize to avoid warning. */
LENGTH _ARBFMT_12 $ 12;
DROP _ARBFMT_12;
_ARBFMT_12 = ' ';
/* Initialize to avoid warning. */
LENGTH _ARBFMT_20 $ 20;
DROP _ARBFMT_20;
_ARBFMT_20 = ' ';
/* Initialize to avoid warning. */
LENGTH _ARBFMT_23 $ 23;
DROP _ARBFMT_23;
_ARBFMT_23 = ' ';
/* Initialize to avoid warning. */
LENGTH _ARBFMT_10 $ 10;
DROP _ARBFMT_10;
_ARBFMT_10 = ' ';
/* Initialize to avoid warning. */
LENGTH _ARBFMT_17 $ 17;
DROP _ARBFMT_17;
_ARBFMT_17 = ' ';
/* Initialize to avoid warning. */
****** ASSIGN OBSERVATION TO NODE ******;
DROP _BRANCH_;
_BRANCH_ = -1;
_ARBFMT_12 = PUT( Marce , BEST.);
%DMNORMIP( _ARBFMT_12);
IF _ARBFMT_12 IN ('1' ,'7' ,'8' ,'4' ,'9' ) THEN DO;
_BRANCH_ = 1;
END;
ELSE IF _ARBFMT_12 IN ('5' ,'6' ) THEN DO;
_BRANCH_ = 2;
END;
IF _BRANCH_ LT 0 AND NOT MISSING(REP_price ) THEN DO;
IF 28955 <= REP_price THEN DO;
_BRANCH_ = 1;
END;
ELSE IF REP_price < 28955 THEN DO;
_BRANCH_ = 2;
END;
ELSE _BRANCH_ = 1;
END;
IF _BRANCH_ LT 0 AND NOT MISSING(Modello ) THEN DO;
_ARBFMT_20 = PUT( Modello , $20.);
%DMNORMIP( _ARBFMT_20);
IF _ARBFMT_20 IN ('Q3' ,'DS 3 CROSSBACK' ,'A4' ,'LEAF' ,'GRANDLAND X' ,
'Q5' ,'C-HR' ,'3008' ,'X3' ,'PASSAT VARIANT' ,'508' ,'520' ,'A6' ,
'CAYENNE' ,'GOLF' ,'A5' ,'A3' ,'CLA 200' ,'STELVIO' ,'ATECA' ,'WRANGLER' ,
'Q2' ,'OCTAVIA' ,'FOCUS' ,'PASSAT' ,'318' ,'SCALA' ,'GIULIA' ,'E-PACE' ,
'118' ,'B 180' ,'218' ,'216' ,'420' ,'C 220' ,'COOPER D COUNTRYMAN' ,
'CHEROKEE' ,'COOPER D CLUBMAN' ,'A4 ALLROAD' ,'320' ,'730' ) THEN DO;
_BRANCH_ = 1;
END;
ELSE IF _ARBFMT_20 IN ('FORTWO' ,'KONA' ,'208' ,'CORSA' ,'PARTNER' ,
'KANGOO' ,'NEW PANDA' ,'500' ,'PANDA' ,'YPSILON' ,'TWINGO' ,'DUSTER' ,
'500X' ,'CAPTUR' ,'TIVOLI' ,'RENEGADE' ,'COMPASS' ,'STONIC' ,'SPORTAGE' ,
'CROSSLAND X' ,'TIPO' ,'CLIO' ,'SANDERO' ,'GIULIETTA' ,'FIESTA' ,'C3' ,
'VITARA' ,'500L' ,'500C' ,'PUMA' ,'X1' ,'CX-30' ,'LEON' ,'UP!' ,'POLO' ,
'T-ROC' ,'ARONA' ,'KADJAR' ,'KAMIQ' ,'QASHQAI' ,'X-TRAIL' ,'T-CROSS' ,
'TIGUAN' ,'MEGANE' ,'TALISMAN' ,'ASTRA' ,'GOLF VARIANT' ,'308' ,
'C4 CACTUS' ,'IBIZA' ,'COMBO' ,'TUCSON' ,'GRAND C4 SPACETOURER' ,
'SCENIC' ,'DOBLO' ,'CADDY' ,'TOURAN' ,'FIORINO' ,'L200' ,'INSIGNIA' ,
'ESPACE' ,'C4 SPACETOURER' ) THEN DO;
_BRANCH_ = 2;
END;
END;
IF _BRANCH_ LT 0 THEN _BRANCH_ = 1;
IF _BRANCH_ EQ 2 THEN DO;
_BRANCH_ = -1;
IF NOT MISSING(REP_price ) AND
REP_price < 23595 THEN DO;
_BRANCH_ = 1;
END;
ELSE IF NOT MISSING(REP_price ) AND
23595 <= REP_price THEN DO;
_BRANCH_ = 2;
END;
IF _BRANCH_ LT 0 AND NOT MISSING(Modello ) THEN DO;
_ARBFMT_20 = PUT( Modello , $20.);
%DMNORMIP( _ARBFMT_20);
IF _ARBFMT_20 IN ('FORTWO' ,'KONA' ,'208' ,'CORSA' ,'PARTNER' ,
'KANGOO' ,'NEW PANDA' ,'500' ,'PANDA' ,'YPSILON' ,'TWINGO' ,'DUSTER' ,
'500X' ,'CAPTUR' ,'TIVOLI' ,'RENEGADE' ,'STONIC' ,'SPORTAGE' ,
'CROSSLAND X' ,'TIPO' ,'CLIO' ,'SANDERO' ,'GIULIETTA' ,'FIESTA' ,'C3' ,
'VITARA' ,'500L' ,'500C' ,'PUMA' ,'LEON' ,'COROLLA' ,'YARIS' ,'UP!' ,
'POLO' ,'ARONA' ,'KADJAR' ,'KAMIQ' ,'QASHQAI' ,'T-CROSS' ,'MEGANE' ,
'ASTRA' ,'FOCUS' ,'GOLF VARIANT' ,'308' ,'C4 CACTUS' ,'IBIZA' ,'SCALA' ,
'COMBO' ,'GRAND C4 SPACETOURER' ,'SCENIC' ,'DOBLO' ,'CADDY' ,'FIORINO' )
THEN DO;
_BRANCH_ = 1;
END;
ELSE IF _ARBFMT_20 IN ('NIRO' ,'COMPASS' ,'GRANDLAND X' ,'X1' ,'C-HR' ,
'CX-30' ,'GOLF' ,'A3' ,'T-ROC' ,'X-TRAIL' ,'Q2' ,'TIGUAN' ,'TALISMAN' ,
'318' ,'TUCSON' ,'218' ,'TOURAN' ,'420' ,'L200' ,'COOPER D COUNTRYMAN' ,
'INSIGNIA' ,'ESPACE' ) THEN DO;
_BRANCH_ = 2;
END;
END;
IF _BRANCH_ LT 0 AND NOT MISSING(REP_Cilindrata ) THEN DO;
IF REP_Cilindrata < 1692.5 THEN DO;
_BRANCH_ = 1;
END;
ELSE IF 1692.5 <= REP_Cilindrata THEN DO;
_BRANCH_ = 2;
END;
ELSE _BRANCH_ = 2;
END;
IF _BRANCH_ LT 0 THEN _BRANCH_ = 1;
IF _BRANCH_ EQ 2 THEN DO;
_BRANCH_ = -1;
_ARBFMT_20 = PUT( Modello , $20.);
%DMNORMIP( _ARBFMT_20);
IF _ARBFMT_20 IN ('RENEGADE' ,'X1' ,'C-HR' ,'A3' ,'TIGUAN' ,'TALISMAN' ,
'318' ,'218' ,'TOURAN' ,'420' ,'L200' ,'COOPER D COUNTRYMAN' ,
'INSIGNIA' ,'ESPACE' ) THEN DO;
_BRANCH_ = 1;
END;
ELSE IF _ARBFMT_20 IN ('COMPASS' ,'GRANDLAND X' ,'VITARA' ,'CX-30' ,
'GOLF' ,'T-ROC' ,'KADJAR' ,'QASHQAI' ,'X-TRAIL' ,'Q2' ,'SCENIC' ) THEN
DO;
_BRANCH_ = 2;
END;
IF _BRANCH_ LT 0 AND NOT MISSING(REP_price ) THEN DO;
IF 28758.5 <= REP_price THEN DO;
_BRANCH_ = 1;
END;
ELSE IF REP_price < 28758.5 THEN DO;
_BRANCH_ = 2;
END;
ELSE _BRANCH_ = 1;
END;
IF _BRANCH_ LT 0 AND NOT MISSING(REP_Cilindrata ) THEN DO;
IF 1773.5 <= REP_Cilindrata THEN DO;
_BRANCH_ = 1;
END;
ELSE IF REP_Cilindrata < 1773.5 THEN DO;
_BRANCH_ = 2;
END;
ELSE _BRANCH_ = 1;
END;
IF _BRANCH_ LT 0 THEN _BRANCH_ = 1;
IF _BRANCH_ EQ 2 THEN DO;
_BRANCH_ = -1;
IF NOT MISSING(REP_Emissioni_di_CO2 ) AND
REP_Emissioni_di_CO2 < 91.5 THEN DO;
_BRANCH_ = 1;
END;
ELSE IF NOT MISSING(REP_Emissioni_di_CO2 ) AND
91.5 <= REP_Emissioni_di_CO2 THEN DO;
_BRANCH_ = 2;
END;
IF _BRANCH_ LT 0 AND NOT MISSING(REP_Consumo_Carburante_Totale ) THEN
DO;
IF REP_Consumo_Carburante_Totale < 3.55 THEN DO;
_BRANCH_ = 1;
END;
ELSE IF 3.55 <= REP_Consumo_Carburante_Totale
THEN DO;
_BRANCH_ = 2;
END;
ELSE _BRANCH_ = 2;
END;
IF _BRANCH_ LT 0 AND NOT MISSING(REP_Cilindrata ) THEN DO;
IF REP_Cilindrata < 499 THEN DO;
_BRANCH_ = 1;
END;
ELSE IF 499 <= REP_Cilindrata THEN DO;
_BRANCH_ = 2;
END;
ELSE _BRANCH_ = 2;
END;
IF _BRANCH_ LT 0 THEN _BRANCH_ = 2;
IF _BRANCH_ EQ 1 THEN DO;
P_Tipo_di_cambioAutomatico = 0.61538461538461;
P_Tipo_di_cambioManuale = 0.07692307692307;
P_Tipo_di_cambioSemiautomatico = 0.3076923076923;
Q_Tipo_di_cambioAutomatico = 0.61538461538461;
Q_Tipo_di_cambioManuale = 0.07692307692307;
Q_Tipo_di_cambioSemiautomatico = 0.3076923076923;
I_Tipo_di_cambio = 'AUTOMATICO';
U_Tipo_di_cambio = 'Automatico';
END;
ELSE DO;
P_Tipo_di_cambioAutomatico = 0.12587412587412;
P_Tipo_di_cambioManuale = 0.86713286713286;
P_Tipo_di_cambioSemiautomatico = 0.006993006993;
Q_Tipo_di_cambioAutomatico = 0.12587412587412;
Q_Tipo_di_cambioManuale = 0.86713286713286;
Q_Tipo_di_cambioSemiautomatico = 0.006993006993;
I_Tipo_di_cambio = 'MANUALE';
U_Tipo_di_cambio = 'Manuale';
END;
END;
ELSE DO;
P_Tipo_di_cambioAutomatico = 0.62672811059907;
P_Tipo_di_cambioManuale = 0.35483870967741;
P_Tipo_di_cambioSemiautomatico = 0.0184331797235;
Q_Tipo_di_cambioAutomatico = 0.62672811059907;
Q_Tipo_di_cambioManuale = 0.35483870967741;
Q_Tipo_di_cambioSemiautomatico = 0.0184331797235;
I_Tipo_di_cambio = 'AUTOMATICO';
U_Tipo_di_cambio = 'Automatico';
END;
END;
ELSE DO;
_BRANCH_ = -1;
_ARBFMT_10 = PUT( Tipo_di_unita , $10.);
%DMNORMIP( _ARBFMT_10);
IF _ARBFMT_10 IN ('ANTERIORE' ,'4X4' ) THEN DO;
_BRANCH_ = 1;
END;
ELSE IF _ARBFMT_10 IN ('POSTERIORE' ) THEN DO;
_BRANCH_ = 2;
END;
IF _BRANCH_ LT 0 AND NOT MISSING(Carrozzeria ) THEN DO;
_ARBFMT_23 = PUT( Carrozzeria , $23.);
%DMNORMIP( _ARBFMT_23);
IF _ARBFMT_23 IN ('CITY CAR' ,'BERLINA' ,'CABRIO' ,'ALTRO' ,
'SUV/FUORISTRADA/PICK-UP' ,'STATION WAGON' ,'MONOVOLUME' ) THEN DO;
_BRANCH_ = 1;
END;
ELSE IF _ARBFMT_23 IN ('434F5550C383C2A9'x ) THEN DO;
_BRANCH_ = 2;
END;
END;
IF _BRANCH_ LT 0 AND NOT MISSING(Alimentazione ) THEN DO;
_ARBFMT_17 = PUT( Alimentazione , $17.);
%DMNORMIP( _ARBFMT_17);
IF _ARBFMT_17 IN ('BENZINA' ,'DIESEL' ,'ELETTRICA/BENZINA' ,'METANO' ,
'GPL' ) THEN DO;
_BRANCH_ = 1;
END;
ELSE IF _ARBFMT_17 IN ('ELETTRICA' ) THEN DO;
_BRANCH_ = 2;
END;
END;
IF _BRANCH_ LT 0 THEN _BRANCH_ = 1;
IF _BRANCH_ EQ 2 THEN DO;
_BRANCH_ = -1;
_ARBFMT_12 = PUT( Usato_Garantito , BEST12.);
%DMNORMIP( _ARBFMT_12);
IF _ARBFMT_12 IN ('1' ) THEN DO;
_BRANCH_ = 1;
END;
ELSE IF _ARBFMT_12 IN ('0' ) THEN DO;
_BRANCH_ = 2;
END;
IF _BRANCH_ LT 0 AND NOT MISSING(Porte ) THEN DO;
_ARBFMT_12 = PUT( Porte , BEST.);
%DMNORMIP( _ARBFMT_12);
IF _ARBFMT_12 IN ('3' ) THEN DO;
_BRANCH_ = 1;
END;
ELSE IF _ARBFMT_12 IN ('5' ) THEN DO;
_BRANCH_ = 2;
END;
END;
IF _BRANCH_ LT 0 AND NOT MISSING(Posti_a_sedere ) THEN DO;
_ARBFMT_12 = PUT( Posti_a_sedere , BEST12.);
%DMNORMIP( _ARBFMT_12);
IF _ARBFMT_12 IN ('2' ) THEN DO;
_BRANCH_ = 1;
END;
ELSE IF _ARBFMT_12 IN ('4' ,'5' ) THEN DO;
_BRANCH_ = 2;
END;
END;
IF _BRANCH_ LT 0 THEN _BRANCH_ = 1;
IF _BRANCH_ EQ 2 THEN DO;
_BRANCH_ = -1;
IF NOT MISSING(REP_price ) AND
REP_price < 15950 THEN DO;
_BRANCH_ = 1;
END;
ELSE IF NOT MISSING(REP_price ) AND
15950 <= REP_price THEN DO;
_BRANCH_ = 2;
END;
IF _BRANCH_ LT 0 AND NOT MISSING(Porte ) THEN DO;
_ARBFMT_12 = PUT( Porte , BEST.);
%DMNORMIP( _ARBFMT_12);
IF _ARBFMT_12 IN ('5' ) THEN DO;
_BRANCH_ = 1;
END;
ELSE IF _ARBFMT_12 IN ('3' ) THEN DO;
_BRANCH_ = 2;
END;
END;
IF _BRANCH_ LT 0 AND NOT MISSING(REP_Cilindrata ) THEN DO;
IF 449 <= REP_Cilindrata THEN DO;
_BRANCH_ = 1;
END;
ELSE IF REP_Cilindrata < 449 THEN DO;
_BRANCH_ = 2;
END;
ELSE _BRANCH_ = 1;
END;
IF _BRANCH_ LT 0 THEN _BRANCH_ = 1;
IF _BRANCH_ EQ 2 THEN DO;
P_Tipo_di_cambioAutomatico = 0.85714285714285;
P_Tipo_di_cambioManuale = 0.14285714285714;
P_Tipo_di_cambioSemiautomatico = 0;
Q_Tipo_di_cambioAutomatico = 0.85714285714285;
Q_Tipo_di_cambioManuale = 0.14285714285714;
Q_Tipo_di_cambioSemiautomatico = 0;
I_Tipo_di_cambio = 'AUTOMATICO';
U_Tipo_di_cambio = 'Automatico';
END;
ELSE DO;
P_Tipo_di_cambioAutomatico = 0;
P_Tipo_di_cambioManuale = 1;
P_Tipo_di_cambioSemiautomatico = 0;
Q_Tipo_di_cambioAutomatico = 0;
Q_Tipo_di_cambioManuale = 1;
Q_Tipo_di_cambioSemiautomatico = 0;
I_Tipo_di_cambio = 'MANUALE';
U_Tipo_di_cambio = 'Manuale';
END;
END;
ELSE DO;
P_Tipo_di_cambioAutomatico = 0.97826086956521;
P_Tipo_di_cambioManuale = 0.02173913043478;
P_Tipo_di_cambioSemiautomatico = 0;
Q_Tipo_di_cambioAutomatico = 0.97826086956521;
Q_Tipo_di_cambioManuale = 0.02173913043478;
Q_Tipo_di_cambioSemiautomatico = 0;
I_Tipo_di_cambio = 'AUTOMATICO';
U_Tipo_di_cambio = 'Automatico';
END;
END;
ELSE DO;
_ARBFMT_12 = PUT( Marce , BEST.);
%DMNORMIP( _ARBFMT_12);
IF _ARBFMT_12 IN ('5' ,'6' ) THEN DO;
P_Tipo_di_cambioAutomatico = 0.04097492052278;
P_Tipo_di_cambioManuale = 0.95831861533027;
P_Tipo_di_cambioSemiautomatico = 0.00070646414694;
Q_Tipo_di_cambioAutomatico = 0.04097492052278;
Q_Tipo_di_cambioManuale = 0.95831861533027;
Q_Tipo_di_cambioSemiautomatico = 0.00070646414694;
I_Tipo_di_cambio = 'MANUALE';
U_Tipo_di_cambio = 'Manuale';
END;
ELSE DO;
_BRANCH_ = -1;
_ARBFMT_20 = PUT( Modello , $20.);
%DMNORMIP( _ARBFMT_20);
IF _ARBFMT_20 IN ('500' ,'PANDA' ,'YPSILON' ,'500X' ,'CAPTUR' ,
'RENEGADE' ,'TIPO' ,'500L' ,'ASTRA' ) THEN DO;
_BRANCH_ = 1;
END;
ELSE IF _ARBFMT_20 IN ('YARIS' ,'POLO' ) THEN DO;
_BRANCH_ = 2;
END;
IF _BRANCH_ LT 0 AND NOT MISSING(Carrozzeria ) THEN DO;
_ARBFMT_23 = PUT( Carrozzeria , $23.);
%DMNORMIP( _ARBFMT_23);
IF _ARBFMT_23 IN ('BERLINA' ,'ALTRO' ,'SUV/FUORISTRADA/PICK-UP' ,
'STATION WAGON' ,'MONOVOLUME' ) THEN DO;
_BRANCH_ = 1;
END;
ELSE IF _ARBFMT_23 IN ('CITY CAR' ) THEN DO;
_BRANCH_ = 2;
END;
END;
IF _BRANCH_ LT 0 THEN _BRANCH_ = 1;
IF _BRANCH_ EQ 2 THEN DO;
P_Tipo_di_cambioAutomatico = 0.84848484848484;
P_Tipo_di_cambioManuale = 0.15151515151515;
P_Tipo_di_cambioSemiautomatico = 0;
Q_Tipo_di_cambioAutomatico = 0.84848484848484;
Q_Tipo_di_cambioManuale = 0.15151515151515;
Q_Tipo_di_cambioSemiautomatico = 0;
I_Tipo_di_cambio = 'AUTOMATICO';
U_Tipo_di_cambio = 'Automatico';
END;
ELSE DO;
_BRANCH_ = -1;
IF NOT MISSING(REP_Emissioni_di_CO2 ) AND
REP_Emissioni_di_CO2 < 81 THEN DO;
_BRANCH_ = 1;
END;
ELSE IF NOT MISSING(REP_Emissioni_di_CO2 ) AND
81 <= REP_Emissioni_di_CO2 THEN DO;
_BRANCH_ = 2;
END;
IF _BRANCH_ LT 0 AND NOT MISSING(REP_price ) THEN DO;
IF 22795 <= REP_price THEN DO;
_BRANCH_ = 1;
END;
ELSE IF REP_price < 22795 THEN DO;
_BRANCH_ = 2;
END;
ELSE _BRANCH_ = 1;
END;
IF _BRANCH_ LT 0 THEN _BRANCH_ = 2;
IF _BRANCH_ EQ 1 THEN DO;
P_Tipo_di_cambioAutomatico = 0.63636363636363;
P_Tipo_di_cambioManuale = 0.36363636363636;
P_Tipo_di_cambioSemiautomatico = 0;
Q_Tipo_di_cambioAutomatico = 0.63636363636363;
Q_Tipo_di_cambioManuale = 0.36363636363636;
Q_Tipo_di_cambioSemiautomatico = 0;
I_Tipo_di_cambio = 'AUTOMATICO';
U_Tipo_di_cambio = 'Automatico';
END;
ELSE DO;
P_Tipo_di_cambioAutomatico = 0.11675126903553;
P_Tipo_di_cambioManuale = 0.88324873096446;
P_Tipo_di_cambioSemiautomatico = 0;
Q_Tipo_di_cambioAutomatico = 0.11675126903553;
Q_Tipo_di_cambioManuale = 0.88324873096446;
Q_Tipo_di_cambioSemiautomatico = 0;
I_Tipo_di_cambio = 'MANUALE';
U_Tipo_di_cambio = 'Manuale';
END;
END;
END;
END;
END;
END;
ELSE DO;
P_Tipo_di_cambioAutomatico = 0.94772507260406;
P_Tipo_di_cambioManuale = 0.03000968054211;
P_Tipo_di_cambioSemiautomatico = 0.02226524685382;
Q_Tipo_di_cambioAutomatico = 0.94772507260406;
Q_Tipo_di_cambioManuale = 0.03000968054211;
Q_Tipo_di_cambioSemiautomatico = 0.02226524685382;
I_Tipo_di_cambio = 'AUTOMATICO';
U_Tipo_di_cambio = 'Automatico';
END;
****************************************************************;
****** END OF DECISION TREE SCORING CODE ******;
****************************************************************;
*;
* ASSIGN VALUE TO: Tipo_di_cambio;
*;
length _format200 $200;
drop _format200;
_format200 = strip(I_Tipo_di_cambio);
if _format200="SEMIAUTOMATICO" then IMP_Tipo_di_cambio = "Semiautomatico";
else
if _format200="MANUALE" then IMP_Tipo_di_cambio = "Manuale       ";
else
if _format200="AUTOMATICO" then IMP_Tipo_di_cambio = "Automatico    ";
END;
