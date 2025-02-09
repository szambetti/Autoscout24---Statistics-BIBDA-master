*;
* IMPUTE VARIABLE: Cilindri;
*;
length IMP_Cilindri 8;
format IMP_Cilindri BEST.;
label IMP_Cilindri = 'Imputed: Cilindri';
IMP_Cilindri = Cilindri;
if missing(IMP_Cilindri) then do;
****************************************************************;
****** DECISION TREE SCORING CODE ******;
****************************************************************;
****** LENGTHS OF NEW CHARACTER VARIABLES ******;
LENGTH I_Cilindri $ 12;
LENGTH _WARN_ $ 4;
****** LABELS FOR NEW VARIABLES ******;
label P_Cilindri0 = 'Previsto: Cilindri=0';
label P_Cilindri3 = 'Previsto: Cilindri=3';
label P_Cilindri4 = 'Previsto: Cilindri=4';
label P_Cilindri1 = 'Previsto: Cilindri=1';
label P_Cilindri2 = 'Previsto: Cilindri=2';
label P_Cilindri6 = 'Previsto: Cilindri=6';
label P_Cilindri8 = 'Previsto: Cilindri=8';
label P_Cilindri5 = 'Previsto: Cilindri=5';
label Q_Cilindri0 = 'P non corretto: Cilindri=0';
label Q_Cilindri3 = 'P non corretto: Cilindri=3';
label Q_Cilindri4 = 'P non corretto: Cilindri=4';
label Q_Cilindri1 = 'P non corretto: Cilindri=1';
label Q_Cilindri2 = 'P non corretto: Cilindri=2';
label Q_Cilindri6 = 'P non corretto: Cilindri=6';
label Q_Cilindri8 = 'P non corretto: Cilindri=8';
label Q_Cilindri5 = 'P non corretto: Cilindri=5';
label I_Cilindri = 'In: Cilindri';
label U_Cilindri = 'Non normalizzata in: Cilindri';
label _WARN_ = 'Avvertimenti';
****** TEMPORARY VARIABLES FOR FORMATTED VALUES ******;
LENGTH _ARBFMT_12 $ 12;
DROP _ARBFMT_12;
_ARBFMT_12 = ' ';
/* Initialize to avoid warning. */
LENGTH _ARBFMT_17 $ 17;
DROP _ARBFMT_17;
_ARBFMT_17 = ' ';
/* Initialize to avoid warning. */
LENGTH _ARBFMT_20 $ 20;
DROP _ARBFMT_20;
_ARBFMT_20 = ' ';
/* Initialize to avoid warning. */
LENGTH _ARBFMT_14 $ 14;
DROP _ARBFMT_14;
_ARBFMT_14 = ' ';
/* Initialize to avoid warning. */
LENGTH _ARBFMT_23 $ 23;
DROP _ARBFMT_23;
_ARBFMT_23 = ' ';
/* Initialize to avoid warning. */
LENGTH _ARBFMT_10 $ 10;
DROP _ARBFMT_10;
_ARBFMT_10 = ' ';
/* Initialize to avoid warning. */
****** ASSIGN OBSERVATION TO NODE ******;
DROP _BRANCH_;
_BRANCH_ = -1;
IF NOT MISSING(REP_Cilindrata ) AND
REP_Cilindrata < 886.5 THEN DO;
_BRANCH_ = 1;
END;
ELSE IF NOT MISSING(REP_Cilindrata ) AND
886.5 <= REP_Cilindrata THEN DO;
_BRANCH_ = 2;
END;
IF _BRANCH_ LT 0 AND NOT MISSING(Alimentazione ) THEN DO;
_ARBFMT_17 = PUT( Alimentazione , $17.);
%DMNORMIP( _ARBFMT_17);
IF _ARBFMT_17 IN ('ELETTRICA' ) THEN DO;
_BRANCH_ = 1;
END;
ELSE IF _ARBFMT_17 IN ('BENZINA' ,'DIESEL' ,'ELETTRICA/BENZINA' ,
'METANO' ,'GPL' ) THEN DO;
_BRANCH_ = 2;
END;
END;
IF _BRANCH_ LT 0 AND NOT MISSING(REP_price ) THEN DO;
IF REP_price < 7220 THEN DO;
_BRANCH_ = 1;
END;
ELSE IF 7220 <= REP_price THEN DO;
_BRANCH_ = 2;
END;
ELSE _BRANCH_ = 2;
END;
IF _BRANCH_ LT 0 THEN _BRANCH_ = 2;
IF _BRANCH_ EQ 1 THEN DO;
_BRANCH_ = -1;
IF NOT MISSING(REP_Cilindrata ) AND
REP_Cilindrata < 1 THEN DO;
_BRANCH_ = 1;
END;
ELSE IF NOT MISSING(REP_Cilindrata ) AND
1 <= REP_Cilindrata THEN DO;
_BRANCH_ = 2;
END;
IF _BRANCH_ LT 0 AND NOT MISSING(Tipo_di_cambio ) THEN DO;
_ARBFMT_14 = PUT( Tipo_di_cambio , $14.);
%DMNORMIP( _ARBFMT_14);
IF _ARBFMT_14 IN ('AUTOMATICO' ) THEN DO;
_BRANCH_ = 1;
END;
ELSE IF _ARBFMT_14 IN ('MANUALE' ) THEN DO;
_BRANCH_ = 2;
END;
END;
IF _BRANCH_ LT 0 AND NOT MISSING(Alimentazione ) THEN DO;
_ARBFMT_17 = PUT( Alimentazione , $17.);
%DMNORMIP( _ARBFMT_17);
IF _ARBFMT_17 IN ('ELETTRICA' ) THEN DO;
_BRANCH_ = 1;
END;
ELSE IF _ARBFMT_17 IN ('BENZINA' ,'METANO' ) THEN DO;
_BRANCH_ = 2;
END;
END;
IF _BRANCH_ LT 0 THEN _BRANCH_ = 2;
IF _BRANCH_ EQ 1 THEN DO;
P_Cilindri0 = 0.98275862068965;
P_Cilindri3 = 0;
P_Cilindri4 = 0;
P_Cilindri1 = 0.01724137931034;
P_Cilindri2 = 0;
P_Cilindri6 = 0;
P_Cilindri8 = 0;
P_Cilindri5 = 0;
Q_Cilindri0 = 0.98275862068965;
Q_Cilindri3 = 0;
Q_Cilindri4 = 0;
Q_Cilindri1 = 0.01724137931034;
Q_Cilindri2 = 0;
Q_Cilindri6 = 0;
Q_Cilindri8 = 0;
Q_Cilindri5 = 0;
I_Cilindri = '0';
U_Cilindri = 0;
END;
ELSE DO;
P_Cilindri0 = 0;
P_Cilindri3 = 0;
P_Cilindri4 = 0.02857142857142;
P_Cilindri1 = 0;
P_Cilindri2 = 0.97142857142857;
P_Cilindri6 = 0;
P_Cilindri8 = 0;
P_Cilindri5 = 0;
Q_Cilindri0 = 0;
Q_Cilindri3 = 0;
Q_Cilindri4 = 0.02857142857142;
Q_Cilindri1 = 0;
Q_Cilindri2 = 0.97142857142857;
Q_Cilindri6 = 0;
Q_Cilindri8 = 0;
Q_Cilindri5 = 0;
I_Cilindri = '2';
U_Cilindri = 2;
END;
END;
ELSE DO;
_BRANCH_ = -1;
IF NOT MISSING(REP_Cilindrata ) AND
REP_Cilindrata < 1214 THEN DO;
_BRANCH_ = 1;
END;
ELSE IF NOT MISSING(REP_Cilindrata ) AND
1214 <= REP_Cilindrata THEN DO;
_BRANCH_ = 2;
END;
IF _BRANCH_ LT 0 AND NOT MISSING(Modello ) THEN DO;
_ARBFMT_20 = PUT( Modello , $20.);
%DMNORMIP( _ARBFMT_20);
IF _ARBFMT_20 IN ('FORTWO' ,'500' ,'TWINGO' ,'DUSTER' ,'500X' ,
'CAPTUR' ,'RENEGADE' ,'CROSSLAND X' ,'CLIO' ,'500C' ,'PUMA' ,'3008' ,
'A 250' ,'UP!' ,'ARONA' ,'KAMIQ' ,'FOCUS' ,'308' ,'C4 CACTUS' ,'IBIZA' ,
'GRAND C4 SPACETOURER' ) THEN DO;
_BRANCH_ = 1;
END;
ELSE IF _ARBFMT_20 IN ('Q3' ,'KONA' ,'DS 3 CROSSBACK' ,'A4' ,'208' ,
'CORSA' ,'PARTNER' ,'KANGOO' ,'NEW PANDA' ,'PANDA' ,'YPSILON' ,
'TIVOLI' ,'COMPASS' ,'STONIC' ,'SPORTAGE' ,'GRANDLAND X' ,'OUTLANDER' ,
'TIPO' ,'SANDERO' ,'GIULIETTA' ,'FIESTA' ,'C3' ,'VITARA' ,'500L' ,'Q5' ,
'NX 300' ,'UX 250H' ,'X1' ,'C-HR' ,'CX-30' ,'X3' ,'PASSAT VARIANT' ,
'508' ,'520' ,'A6' ,'LEON' ,'COROLLA' ,'CAYENNE' ,'GOLF' ,'YARIS' ,
'A5' ,'A3' ,'POLO' ,'T-ROC' ,'CLA 200' ,'STELVIO' ,'ATECA' ,'KADJAR' ,
'QASHQAI' ,'X-TRAIL' ,'WRANGLER' ,'T-CROSS' ,'Q2' ,'TIGUAN' ,'OCTAVIA' ,
'MEGANE' ,'TALISMAN' ,'ASTRA' ,'GOLF VARIANT' ,'PASSAT' ,'318' ,
'SCALA' ,'GIULIA' ,'E-PACE' ,'COMBO' ,'118' ,'TUCSON' ,'SCENIC' ,
'DOBLO' ,'CADDY' ,'B 180' ,'218' ,'216' ,'TOURAN' ,'FIORINO' ,'420' ,
'C 220' ,'L200' ,'COOPER D COUNTRYMAN' ,'CHEROKEE' ,'INSIGNIA' ,
'COOPER D CLUBMAN' ,'A4 ALLROAD' ,'320' ,'730' ,'ESPACE' ,
'C4 SPACETOURER' ) THEN DO;
_BRANCH_ = 2;
END;
END;
IF _BRANCH_ LT 0 AND NOT MISSING(Alimentazione ) THEN DO;
_ARBFMT_17 = PUT( Alimentazione , $17.);
%DMNORMIP( _ARBFMT_17);
IF _ARBFMT_17 IN ('ELETTRICA' ,'ELETTRICA/BENZINA' ) THEN DO;
_BRANCH_ = 1;
END;
ELSE IF _ARBFMT_17 IN ('BENZINA' ,'DIESEL' ,'METANO' ,'GPL' ) THEN DO;
_BRANCH_ = 2;
END;
END;
IF _BRANCH_ LT 0 THEN _BRANCH_ = 2;
IF _BRANCH_ EQ 1 THEN DO;
_ARBFMT_12 = PUT( Porte , BEST.);
%DMNORMIP( _ARBFMT_12);
IF _ARBFMT_12 IN ('5' ,'3' ) THEN DO;
_BRANCH_ = -1;
IF NOT MISSING(REP_Consumo_Carburante_Totale ) AND
REP_Consumo_Carburante_Totale < 1.45 THEN DO;
_BRANCH_ = 1;
END;
ELSE IF NOT MISSING(REP_Consumo_Carburante_Totale ) AND
1.45 <= REP_Consumo_Carburante_Totale THEN DO;
_BRANCH_ = 2;
END;
IF _BRANCH_ LT 0 AND NOT MISSING(Alimentazione ) THEN DO;
_ARBFMT_17 = PUT( Alimentazione , $17.);
%DMNORMIP( _ARBFMT_17);
IF _ARBFMT_17 IN ('ELETTRICA' ) THEN DO;
_BRANCH_ = 1;
END;
ELSE IF _ARBFMT_17 IN ('BENZINA' ,'ELETTRICA/BENZINA' ,'METANO' ,
'GPL' ) THEN DO;
_BRANCH_ = 2;
END;
END;
IF _BRANCH_ LT 0 AND NOT MISSING(REP_Emissioni_di_CO2 ) THEN DO;
IF REP_Emissioni_di_CO2 < 57.25837399 THEN DO;
_BRANCH_ = 1;
END;
ELSE IF 57.25837399 <= REP_Emissioni_di_CO2 THEN DO;
_BRANCH_ = 2;
END;
ELSE _BRANCH_ = 2;
END;
IF _BRANCH_ LT 0 THEN _BRANCH_ = 2;
IF _BRANCH_ EQ 1 THEN DO;
P_Cilindri0 = 0.2;
P_Cilindri3 = 0;
P_Cilindri4 = 0;
P_Cilindri1 = 0.8;
P_Cilindri2 = 0;
P_Cilindri6 = 0;
P_Cilindri8 = 0;
P_Cilindri5 = 0;
Q_Cilindri0 = 0.2;
Q_Cilindri3 = 0;
Q_Cilindri4 = 0;
Q_Cilindri1 = 0.8;
Q_Cilindri2 = 0;
Q_Cilindri6 = 0;
Q_Cilindri8 = 0;
Q_Cilindri5 = 0;
I_Cilindri = '1';
U_Cilindri = 1;
END;
ELSE DO;
_BRANCH_ = -1;
_ARBFMT_10 = PUT( Tipo_di_unita , $10.);
%DMNORMIP( _ARBFMT_10);
IF _ARBFMT_10 IN ('ANTERIORE' ) THEN DO;
_BRANCH_ = 1;
END;
ELSE IF _ARBFMT_10 IN ('POSTERIORE' ) THEN DO;
_BRANCH_ = 2;
END;
IF _BRANCH_ LT 0 AND NOT MISSING(Posti_a_sedere ) THEN DO;
_ARBFMT_12 = PUT( Posti_a_sedere , BEST12.);
%DMNORMIP( _ARBFMT_12);
IF _ARBFMT_12 IN ('4' ,'5' ) THEN DO;
_BRANCH_ = 1;
END;
ELSE IF _ARBFMT_12 IN ('2' ) THEN DO;
_BRANCH_ = 2;
END;
END;
IF _BRANCH_ LT 0 AND NOT MISSING(Carrozzeria ) THEN DO;
_ARBFMT_23 = PUT( Carrozzeria , $23.);
%DMNORMIP( _ARBFMT_23);
IF _ARBFMT_23 IN ('CITY CAR' ,'BERLINA' ,'CABRIO' ,
'SUV/FUORISTRADA/PICK-UP' ,'STATION WAGON' ,'ALTRO' ,
'MONOVOLUME' ) THEN DO;
_BRANCH_ = 1;
END;
ELSE IF _ARBFMT_23 IN ('434F5550C383C2A9'x ) THEN DO;
_BRANCH_ = 2;
END;
END;
IF _BRANCH_ LT 0 THEN _BRANCH_ = 1;
IF _BRANCH_ EQ 2 THEN DO;
_BRANCH_ = -1;
_ARBFMT_23 = PUT( Carrozzeria , $23.);
%DMNORMIP( _ARBFMT_23);
IF _ARBFMT_23 IN ('ALTRO' ) THEN DO;
_BRANCH_ = 1;
END;
ELSE IF _ARBFMT_23 IN ('CITY CAR' ,'BERLINA' ,'CABRIO' ,
'434F5550C383C2A9'x ) THEN DO;
_BRANCH_ = 2;
END;
IF _BRANCH_ LT 0 AND NOT MISSING(conditional_on_price ) THEN DO;
_ARBFMT_12 = PUT( conditional_on_price , BEST.);
%DMNORMIP( _ARBFMT_12);
IF _ARBFMT_12 IN ('1' ) THEN DO;
_BRANCH_ = 1;
END;
ELSE IF _ARBFMT_12 IN ('12' ) THEN DO;
_BRANCH_ = 2;
END;
END;
IF _BRANCH_ LT 0 AND NOT MISSING(Posti_a_sedere ) THEN DO;
_ARBFMT_12 = PUT( Posti_a_sedere , BEST12.);
%DMNORMIP( _ARBFMT_12);
IF _ARBFMT_12 IN ('4' ) THEN DO;
_BRANCH_ = 1;
END;
ELSE IF _ARBFMT_12 IN ('2' ,'5' ) THEN DO;
_BRANCH_ = 2;
END;
END;
IF _BRANCH_ LT 0 THEN _BRANCH_ = 2;
IF _BRANCH_ EQ 1 THEN DO;
P_Cilindri0 = 0;
P_Cilindri3 = 0;
P_Cilindri4 = 0;
P_Cilindri1 = 1;
P_Cilindri2 = 0;
P_Cilindri6 = 0;
P_Cilindri8 = 0;
P_Cilindri5 = 0;
Q_Cilindri0 = 0;
Q_Cilindri3 = 0;
Q_Cilindri4 = 0;
Q_Cilindri1 = 1;
Q_Cilindri2 = 0;
Q_Cilindri6 = 0;
Q_Cilindri8 = 0;
Q_Cilindri5 = 0;
I_Cilindri = '1';
U_Cilindri = 1;
END;
ELSE DO;
P_Cilindri0 = 0;
P_Cilindri3 = 1;
P_Cilindri4 = 0;
P_Cilindri1 = 0;
P_Cilindri2 = 0;
P_Cilindri6 = 0;
P_Cilindri8 = 0;
P_Cilindri5 = 0;
Q_Cilindri0 = 0;
Q_Cilindri3 = 1;
Q_Cilindri4 = 0;
Q_Cilindri1 = 0;
Q_Cilindri2 = 0;
Q_Cilindri6 = 0;
Q_Cilindri8 = 0;
Q_Cilindri5 = 0;
I_Cilindri = '3';
U_Cilindri = 3;
END;
END;
ELSE DO;
P_Cilindri0 = 0;
P_Cilindri3 = 0.99457994579945;
P_Cilindri4 = 0.00451671183378;
P_Cilindri1 = 0;
P_Cilindri2 = 0;
P_Cilindri6 = 0;
P_Cilindri8 = 0;
P_Cilindri5 = 0.00090334236675;
Q_Cilindri0 = 0;
Q_Cilindri3 = 0.99457994579945;
Q_Cilindri4 = 0.00451671183378;
Q_Cilindri1 = 0;
Q_Cilindri2 = 0;
Q_Cilindri6 = 0;
Q_Cilindri8 = 0;
Q_Cilindri5 = 0.00090334236675;
I_Cilindri = '3';
U_Cilindri = 3;
END;
END;
END;
ELSE DO;
P_Cilindri0 = 0;
P_Cilindri3 = 0.06666666666666;
P_Cilindri4 = 0;
P_Cilindri1 = 0.93333333333333;
P_Cilindri2 = 0;
P_Cilindri6 = 0;
P_Cilindri8 = 0;
P_Cilindri5 = 0;
Q_Cilindri0 = 0;
Q_Cilindri3 = 0.06666666666666;
Q_Cilindri4 = 0;
Q_Cilindri1 = 0.93333333333333;
Q_Cilindri2 = 0;
Q_Cilindri6 = 0;
Q_Cilindri8 = 0;
Q_Cilindri5 = 0;
I_Cilindri = '1';
U_Cilindri = 1;
END;
END;
ELSE DO;
IF NOT MISSING(REP_price ) AND
61903.072743 <= REP_price THEN DO;
IF NOT MISSING(REP_Cilindrata ) AND
REP_Cilindrata < 2446.5 THEN DO;
P_Cilindri0 = 0;
P_Cilindri3 = 0.1;
P_Cilindri4 = 0.9;
P_Cilindri1 = 0;
P_Cilindri2 = 0;
P_Cilindri6 = 0;
P_Cilindri8 = 0;
P_Cilindri5 = 0;
Q_Cilindri0 = 0;
Q_Cilindri3 = 0.1;
Q_Cilindri4 = 0.9;
Q_Cilindri1 = 0;
Q_Cilindri2 = 0;
Q_Cilindri6 = 0;
Q_Cilindri8 = 0;
Q_Cilindri5 = 0;
I_Cilindri = '4';
U_Cilindri = 4;
END;
ELSE DO;
IF NOT MISSING(REP_Cilindrata ) AND
3096.6309853 <= REP_Cilindrata THEN DO;
P_Cilindri0 = 0;
P_Cilindri3 = 0;
P_Cilindri4 = 0;
P_Cilindri1 = 0;
P_Cilindri2 = 0;
P_Cilindri6 = 0;
P_Cilindri8 = 1;
P_Cilindri5 = 0;
Q_Cilindri0 = 0;
Q_Cilindri3 = 0;
Q_Cilindri4 = 0;
Q_Cilindri1 = 0;
Q_Cilindri2 = 0;
Q_Cilindri6 = 0;
Q_Cilindri8 = 1;
Q_Cilindri5 = 0;
I_Cilindri = '8';
U_Cilindri = 8;
END;
ELSE DO;
P_Cilindri0 = 0;
P_Cilindri3 = 0;
P_Cilindri4 = 0;
P_Cilindri1 = 0;
P_Cilindri2 = 0;
P_Cilindri6 = 1;
P_Cilindri8 = 0;
P_Cilindri5 = 0;
Q_Cilindri0 = 0;
Q_Cilindri3 = 0;
Q_Cilindri4 = 0;
Q_Cilindri1 = 0;
Q_Cilindri2 = 0;
Q_Cilindri6 = 1;
Q_Cilindri8 = 0;
Q_Cilindri5 = 0;
I_Cilindri = '6';
U_Cilindri = 6;
END;
END;
END;
ELSE DO;
IF NOT MISSING(REP_Consumo_Carburante_Totale ) AND
REP_Consumo_Carburante_Totale < 1.35 THEN DO;
P_Cilindri0 = 0.33333333333333;
P_Cilindri3 = 0;
P_Cilindri4 = 0.66666666666666;
P_Cilindri1 = 0;
P_Cilindri2 = 0;
P_Cilindri6 = 0;
P_Cilindri8 = 0;
P_Cilindri5 = 0;
Q_Cilindri0 = 0.33333333333333;
Q_Cilindri3 = 0;
Q_Cilindri4 = 0.66666666666666;
Q_Cilindri1 = 0;
Q_Cilindri2 = 0;
Q_Cilindri6 = 0;
Q_Cilindri8 = 0;
Q_Cilindri5 = 0;
I_Cilindri = '4';
U_Cilindri = 4;
END;
ELSE DO;
_BRANCH_ = -1;
IF NOT MISSING(REP_Cilindrata ) AND
REP_Cilindrata < 2871.5 THEN DO;
_BRANCH_ = 1;
END;
ELSE IF NOT MISSING(REP_Cilindrata ) AND
2871.5 <= REP_Cilindrata THEN DO;
_BRANCH_ = 2;
END;
IF _BRANCH_ LT 0 AND NOT MISSING(Tagliandi_certificati ) THEN DO;
_ARBFMT_12 = PUT( Tagliandi_certificati , BEST12.);
%DMNORMIP( _ARBFMT_12);
IF _ARBFMT_12 IN ('0' ) THEN DO;
_BRANCH_ = 1;
END;
ELSE IF _ARBFMT_12 IN ('1' ) THEN DO;
_BRANCH_ = 2;
END;
END;
IF _BRANCH_ LT 0 THEN _BRANCH_ = 1;
IF _BRANCH_ EQ 2 THEN DO;
_BRANCH_ = -1;
IF NOT MISSING(REP_Peso_a_vuoto ) AND
REP_Peso_a_vuoto < 1840 THEN DO;
_BRANCH_ = 1;
END;
ELSE IF NOT MISSING(REP_Peso_a_vuoto ) AND
1840 <= REP_Peso_a_vuoto THEN DO;
_BRANCH_ = 2;
END;
IF _BRANCH_ LT 0 AND NOT MISSING(REP_price ) THEN DO;
IF REP_price < 48600 THEN DO;
_BRANCH_ = 1;
END;
ELSE IF 48600 <= REP_price THEN DO;
_BRANCH_ = 2;
END;
ELSE _BRANCH_ = 2;
END;
IF _BRANCH_ LT 0 THEN _BRANCH_ = 2;
IF _BRANCH_ EQ 1 THEN DO;
P_Cilindri0 = 0;
P_Cilindri3 = 0.31538461538461;
P_Cilindri4 = 0.66923076923076;
P_Cilindri1 = 0;
P_Cilindri2 = 0;
P_Cilindri6 = 0.01538461538461;
P_Cilindri8 = 0;
P_Cilindri5 = 0;
Q_Cilindri0 = 0;
Q_Cilindri3 = 0.31538461538461;
Q_Cilindri4 = 0.66923076923076;
Q_Cilindri1 = 0;
Q_Cilindri2 = 0;
Q_Cilindri6 = 0.01538461538461;
Q_Cilindri8 = 0;
Q_Cilindri5 = 0;
I_Cilindri = '4';
U_Cilindri = 4;
END;
ELSE DO;
P_Cilindri0 = 0;
P_Cilindri3 = 0;
P_Cilindri4 = 0;
P_Cilindri1 = 0;
P_Cilindri2 = 0;
P_Cilindri6 = 1;
P_Cilindri8 = 0;
P_Cilindri5 = 0;
Q_Cilindri0 = 0;
Q_Cilindri3 = 0;
Q_Cilindri4 = 0;
Q_Cilindri1 = 0;
Q_Cilindri2 = 0;
Q_Cilindri6 = 1;
Q_Cilindri8 = 0;
Q_Cilindri5 = 0;
I_Cilindri = '6';
U_Cilindri = 6;
END;
END;
ELSE DO;
_ARBFMT_20 = PUT( Modello , $20.);
%DMNORMIP( _ARBFMT_20);
IF _ARBFMT_20 IN ('X1' ,'YARIS' ,'ASTRA' ,'216' ) THEN DO;
P_Cilindri0 = 0;
P_Cilindri3 = 0.54098360655737;
P_Cilindri4 = 0.45901639344262;
P_Cilindri1 = 0;
P_Cilindri2 = 0;
P_Cilindri6 = 0;
P_Cilindri8 = 0;
P_Cilindri5 = 0;
Q_Cilindri0 = 0;
Q_Cilindri3 = 0.54098360655737;
Q_Cilindri4 = 0.45901639344262;
Q_Cilindri1 = 0;
Q_Cilindri2 = 0;
Q_Cilindri6 = 0;
Q_Cilindri8 = 0;
Q_Cilindri5 = 0;
I_Cilindri = '3';
U_Cilindri = 3;
END;
ELSE DO;
P_Cilindri0 = 0;
P_Cilindri3 = 0.00357142857142;
P_Cilindri4 = 0.99642857142857;
P_Cilindri1 = 0;
P_Cilindri2 = 0;
P_Cilindri6 = 0;
P_Cilindri8 = 0;
P_Cilindri5 = 0;
Q_Cilindri0 = 0;
Q_Cilindri3 = 0.00357142857142;
Q_Cilindri4 = 0.99642857142857;
Q_Cilindri1 = 0;
Q_Cilindri2 = 0;
Q_Cilindri6 = 0;
Q_Cilindri8 = 0;
Q_Cilindri5 = 0;
I_Cilindri = '4';
U_Cilindri = 4;
END;
END;
END;
END;
END;
END;
****************************************************************;
****** END OF DECISION TREE SCORING CODE ******;
****************************************************************;
*;
* ASSIGN VALUE TO: Cilindri;
*;
length _format200 $200;
drop _format200;
_format200 = strip(I_Cilindri);
if _format200="8" then IMP_Cilindri = 8;
else
if _format200="6" then IMP_Cilindri = 6;
else
if _format200="5" then IMP_Cilindri = 5;
else
if _format200="4" then IMP_Cilindri = 4;
else
if _format200="3" then IMP_Cilindri = 3;
else
if _format200="2" then IMP_Cilindri = 2;
else
if _format200="1" then IMP_Cilindri = 1;
else
if _format200="0" then IMP_Cilindri = 0;
END;
