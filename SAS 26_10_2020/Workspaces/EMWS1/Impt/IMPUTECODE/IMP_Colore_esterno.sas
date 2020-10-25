*;
* IMPUTE VARIABLE: Colore_esterno;
*;
length IMP_Colore_esterno $11;
label IMP_Colore_esterno = 'Imputed Colore_esterno';
IMP_Colore_esterno = Colore_esterno;
if IMP_Colore_esterno eq '' then do;
****************************************************************;
****** DECISION TREE SCORING CODE ******;
****************************************************************;
****** LENGTHS OF NEW CHARACTER VARIABLES ******;
LENGTH I_Colore_esterno $ 11;
LENGTH U_Colore_esterno $ 11;
LENGTH _WARN_ $ 4;
****** LABELS FOR NEW VARIABLES ******;
label P_Colore_esternoNero = 'Previsto: Colore_esterno=Nero';
label P_Colore_esternoBlu_Azzurro = 'Previsto: Colore_esterno=Blu/Azzurro';
label P_Colore_esternoGrigio = 'Previsto: Colore_esterno=Grigio';
label P_Colore_esternoArgento = 'Previsto: Colore_esterno=Argento';
label P_Colore_esternoBianco = 'Previsto: Colore_esterno=Bianco';
label P_Colore_esternoRosso = 'Previsto: Colore_esterno=Rosso';
label P_Colore_esternoLilla = 'Previsto: Colore_esterno=Lilla';
label P_Colore_esternoArancione = 'Previsto: Colore_esterno=Arancione';
label P_Colore_esternoVerde = 'Previsto: Colore_esterno=Verde';
label P_Colore_esternoMarrone = 'Previsto: Colore_esterno=Marrone';
label P_Colore_esternoGiallo = 'Previsto: Colore_esterno=Giallo';
label P_Colore_esternoOro = 'Previsto: Colore_esterno=Oro';
label P_Colore_esternoBeige = 'Previsto: Colore_esterno=Beige';
label P_Colore_esternoBronzo = 'Previsto: Colore_esterno=Bronzo';
label Q_Colore_esternoNero = 'P non corretto: Colore_esterno=Nero';
label Q_Colore_esternoBlu_Azzurro =
'P non corretto: Colore_esterno=Blu/Azzurro';
label Q_Colore_esternoGrigio = 'P non corretto: Colore_esterno=Grigio';
label Q_Colore_esternoArgento = 'P non corretto: Colore_esterno=Argento';
label Q_Colore_esternoBianco = 'P non corretto: Colore_esterno=Bianco';
label Q_Colore_esternoRosso = 'P non corretto: Colore_esterno=Rosso';
label Q_Colore_esternoLilla = 'P non corretto: Colore_esterno=Lilla';
label Q_Colore_esternoArancione = 'P non corretto: Colore_esterno=Arancione';
label Q_Colore_esternoVerde = 'P non corretto: Colore_esterno=Verde';
label Q_Colore_esternoMarrone = 'P non corretto: Colore_esterno=Marrone';
label Q_Colore_esternoGiallo = 'P non corretto: Colore_esterno=Giallo';
label Q_Colore_esternoOro = 'P non corretto: Colore_esterno=Oro';
label Q_Colore_esternoBeige = 'P non corretto: Colore_esterno=Beige';
label Q_Colore_esternoBronzo = 'P non corretto: Colore_esterno=Bronzo';
label I_Colore_esterno = 'In: Colore_esterno';
label U_Colore_esterno = 'Non normalizzata in: Colore_esterno';
label _WARN_ = 'Avvertimenti';
****** TEMPORARY VARIABLES FOR FORMATTED VALUES ******;
LENGTH _ARBFMT_11 $ 11;
DROP _ARBFMT_11;
_ARBFMT_11 = ' ';
/* Initialize to avoid warning. */
LENGTH _ARBFMT_12 $ 12;
DROP _ARBFMT_12;
_ARBFMT_12 = ' ';
/* Initialize to avoid warning. */
LENGTH _ARBFMT_20 $ 20;
DROP _ARBFMT_20;
_ARBFMT_20 = ' ';
/* Initialize to avoid warning. */
LENGTH _ARBFMT_10 $ 10;
DROP _ARBFMT_10;
_ARBFMT_10 = ' ';
/* Initialize to avoid warning. */
****** ASSIGN OBSERVATION TO NODE ******;
_ARBFMT_12 = PUT( REP_Tipo_di_vernice , $12.);
%DMNORMIP( _ARBFMT_12);
IF _ARBFMT_12 IN ('METALLIZZATO' ) THEN DO;
DROP _BRANCH_;
_BRANCH_ = -1;
IF NOT MISSING(REP_price ) AND
REP_price < 18845 THEN DO;
_BRANCH_ = 1;
END;
ELSE IF NOT MISSING(REP_price ) AND
18845 <= REP_price THEN DO;
_BRANCH_ = 2;
END;
IF _BRANCH_ LT 0 AND NOT MISSING(Modello ) THEN DO;
_ARBFMT_20 = PUT( Modello , $20.);
%DMNORMIP( _ARBFMT_20);
IF _ARBFMT_20 IN ('FORTWO' ,'208' ,'CORSA' ,'NEW PANDA' ,'500' ,
'PANDA' ,'YPSILON' ,'DUSTER' ,'500X' ,'CAPTUR' ,'STONIC' ,
'CROSSLAND X' ,'TIPO' ,'CLIO' ,'SANDERO' ,'FIESTA' ,'500L' ,'500C' ,
'IBIZA' ,'DOBLO' ) THEN DO;
_BRANCH_ = 1;
END;
ELSE IF _ARBFMT_20 IN ('Q3' ,'KONA' ,'A4' ,'TIVOLI' ,'RENEGADE' ,
'COMPASS' ,'SPORTAGE' ,'GRANDLAND X' ,'GIULIETTA' ,'VITARA' ,'PUMA' ,
'NX 300' ,'UX 250H' ,'X1' ,'C-HR' ,'X3' ,'PASSAT VARIANT' ,'508' ,
'520' ,'A6' ,'LEON' ,'COROLLA' ,'GOLF' ,'A5' ,'A3' ,'A 250' ,'POLO' ,
'T-ROC' ,'ARONA' ,'STELVIO' ,'ATECA' ,'KADJAR' ,'KAMIQ' ,'QASHQAI' ,
'X-TRAIL' ,'T-CROSS' ,'TIGUAN' ,'OCTAVIA' ,'MEGANE' ,'TALISMAN' ,
'ASTRA' ,'FOCUS' ,'GOLF VARIANT' ,'308' ,'PASSAT' ,'318' ,'SCALA' ,
'GIULIA' ,'SCENIC' ,'218' ,'216' ,'TOURAN' ,'420' ,'C 220' ,
'COOPER D CLUBMAN' ,'320' ,'730' ) THEN DO;
_BRANCH_ = 2;
END;
END;
IF _BRANCH_ LT 0 AND NOT MISSING(REP_Cilindrata ) THEN DO;
IF REP_Cilindrata < 1370.5 THEN DO;
_BRANCH_ = 1;
END;
ELSE IF 1370.5 <= REP_Cilindrata THEN DO;
_BRANCH_ = 2;
END;
ELSE _BRANCH_ = 2;
END;
IF _BRANCH_ LT 0 THEN _BRANCH_ = 2;
IF _BRANCH_ EQ 1 THEN DO;
_BRANCH_ = -1;
_ARBFMT_10 = PUT( Tipo_di_unita , $10.);
%DMNORMIP( _ARBFMT_10);
IF _ARBFMT_10 IN ('POSTERIORE' ,'ANTERIORE' ) THEN DO;
_BRANCH_ = 1;
END;
ELSE IF _ARBFMT_10 IN ('4X4' ) THEN DO;
_BRANCH_ = 2;
END;
IF _BRANCH_ LT 0 AND NOT MISSING(REP_price ) THEN DO;
IF 7470 <= REP_price THEN DO;
_BRANCH_ = 1;
END;
ELSE IF REP_price < 7470 THEN DO;
_BRANCH_ = 2;
END;
ELSE _BRANCH_ = 1;
END;
IF _BRANCH_ LT 0 THEN _BRANCH_ = 1;
IF _BRANCH_ EQ 2 THEN DO;
P_Colore_esternoNero = 0;
P_Colore_esternoBlu_Azzurro = 0;
P_Colore_esternoGrigio = 0.4;
P_Colore_esternoArgento = 0.1;
P_Colore_esternoBianco = 0;
P_Colore_esternoRosso = 0;
P_Colore_esternoLilla = 0;
P_Colore_esternoArancione = 0;
P_Colore_esternoVerde = 0.4;
P_Colore_esternoMarrone = 0;
P_Colore_esternoGiallo = 0.1;
P_Colore_esternoOro = 0;
P_Colore_esternoBeige = 0;
P_Colore_esternoBronzo = 0;
Q_Colore_esternoNero = 0;
Q_Colore_esternoBlu_Azzurro = 0;
Q_Colore_esternoGrigio = 0.4;
Q_Colore_esternoArgento = 0.1;
Q_Colore_esternoBianco = 0;
Q_Colore_esternoRosso = 0;
Q_Colore_esternoLilla = 0;
Q_Colore_esternoArancione = 0;
Q_Colore_esternoVerde = 0.4;
Q_Colore_esternoMarrone = 0;
Q_Colore_esternoGiallo = 0.1;
Q_Colore_esternoOro = 0;
Q_Colore_esternoBeige = 0;
Q_Colore_esternoBronzo = 0;
I_Colore_esterno = 'GRIGIO';
U_Colore_esterno = 'Grigio';
END;
ELSE DO;
_ARBFMT_12 = PUT( Posti_a_sedere , BEST12.);
%DMNORMIP( _ARBFMT_12);
IF _ARBFMT_12 IN ('2' ) THEN DO;
P_Colore_esternoNero = 0;
P_Colore_esternoBlu_Azzurro = 0;
P_Colore_esternoGrigio = 0.13333333333333;
P_Colore_esternoArgento = 0.66666666666666;
P_Colore_esternoBianco = 0.2;
P_Colore_esternoRosso = 0;
P_Colore_esternoLilla = 0;
P_Colore_esternoArancione = 0;
P_Colore_esternoVerde = 0;
P_Colore_esternoMarrone = 0;
P_Colore_esternoGiallo = 0;
P_Colore_esternoOro = 0;
P_Colore_esternoBeige = 0;
P_Colore_esternoBronzo = 0;
Q_Colore_esternoNero = 0;
Q_Colore_esternoBlu_Azzurro = 0;
Q_Colore_esternoGrigio = 0.13333333333333;
Q_Colore_esternoArgento = 0.66666666666666;
Q_Colore_esternoBianco = 0.2;
Q_Colore_esternoRosso = 0;
Q_Colore_esternoLilla = 0;
Q_Colore_esternoArancione = 0;
Q_Colore_esternoVerde = 0;
Q_Colore_esternoMarrone = 0;
Q_Colore_esternoGiallo = 0;
Q_Colore_esternoOro = 0;
Q_Colore_esternoBeige = 0;
Q_Colore_esternoBronzo = 0;
I_Colore_esterno = 'ARGENTO';
U_Colore_esterno = 'Argento';
END;
ELSE DO;
_ARBFMT_12 = PUT( Cilindri , BEST.);
%DMNORMIP( _ARBFMT_12);
IF _ARBFMT_12 IN ('1' ) THEN DO;
P_Colore_esternoNero = 0;
P_Colore_esternoBlu_Azzurro = 0;
P_Colore_esternoGrigio = 0;
P_Colore_esternoArgento = 0;
P_Colore_esternoBianco = 0.72727272727272;
P_Colore_esternoRosso = 0.18181818181818;
P_Colore_esternoLilla = 0;
P_Colore_esternoArancione = 0;
P_Colore_esternoVerde = 0.09090909090909;
P_Colore_esternoMarrone = 0;
P_Colore_esternoGiallo = 0;
P_Colore_esternoOro = 0;
P_Colore_esternoBeige = 0;
P_Colore_esternoBronzo = 0;
Q_Colore_esternoNero = 0;
Q_Colore_esternoBlu_Azzurro = 0;
Q_Colore_esternoGrigio = 0;
Q_Colore_esternoArgento = 0;
Q_Colore_esternoBianco = 0.72727272727272;
Q_Colore_esternoRosso = 0.18181818181818;
Q_Colore_esternoLilla = 0;
Q_Colore_esternoArancione = 0;
Q_Colore_esternoVerde = 0.09090909090909;
Q_Colore_esternoMarrone = 0;
Q_Colore_esternoGiallo = 0;
Q_Colore_esternoOro = 0;
Q_Colore_esternoBeige = 0;
Q_Colore_esternoBronzo = 0;
I_Colore_esterno = 'BIANCO';
U_Colore_esterno = 'Bianco';
END;
ELSE DO;
P_Colore_esternoNero = 0.18477043673012;
P_Colore_esternoBlu_Azzurro = 0.18812989921612;
P_Colore_esternoGrigio = 0.36730123180291;
P_Colore_esternoArgento = 0.07390817469204;
P_Colore_esternoBianco = 0.07390817469204;
P_Colore_esternoRosso = 0.0515117581187;
P_Colore_esternoLilla = 0.00111982082866;
P_Colore_esternoArancione = 0.00447928331466;
P_Colore_esternoVerde = 0.03583426651735;
P_Colore_esternoMarrone = 0.00223964165733;
P_Colore_esternoGiallo = 0.00111982082866;
P_Colore_esternoOro = 0.00223964165733;
P_Colore_esternoBeige = 0.00111982082866;
P_Colore_esternoBronzo = 0.01231802911534;
Q_Colore_esternoNero = 0.18477043673012;
Q_Colore_esternoBlu_Azzurro = 0.18812989921612;
Q_Colore_esternoGrigio = 0.36730123180291;
Q_Colore_esternoArgento = 0.07390817469204;
Q_Colore_esternoBianco = 0.07390817469204;
Q_Colore_esternoRosso = 0.0515117581187;
Q_Colore_esternoLilla = 0.00111982082866;
Q_Colore_esternoArancione = 0.00447928331466;
Q_Colore_esternoVerde = 0.03583426651735;
Q_Colore_esternoMarrone = 0.00223964165733;
Q_Colore_esternoGiallo = 0.00111982082866;
Q_Colore_esternoOro = 0.00223964165733;
Q_Colore_esternoBeige = 0.00111982082866;
Q_Colore_esternoBronzo = 0.01231802911534;
I_Colore_esterno = 'GRIGIO';
U_Colore_esterno = 'Grigio';
END;
END;
END;
END;
ELSE DO;
IF NOT MISSING(REP_Consumo_Carburante_Totale ) AND
8.95 <= REP_Consumo_Carburante_Totale THEN DO;
P_Colore_esternoNero = 0.3;
P_Colore_esternoBlu_Azzurro = 0;
P_Colore_esternoGrigio = 0.2;
P_Colore_esternoArgento = 0.1;
P_Colore_esternoBianco = 0.2;
P_Colore_esternoRosso = 0;
P_Colore_esternoLilla = 0;
P_Colore_esternoArancione = 0.2;
P_Colore_esternoVerde = 0;
P_Colore_esternoMarrone = 0;
P_Colore_esternoGiallo = 0;
P_Colore_esternoOro = 0;
P_Colore_esternoBeige = 0;
P_Colore_esternoBronzo = 0;
Q_Colore_esternoNero = 0.3;
Q_Colore_esternoBlu_Azzurro = 0;
Q_Colore_esternoGrigio = 0.2;
Q_Colore_esternoArgento = 0.1;
Q_Colore_esternoBianco = 0.2;
Q_Colore_esternoRosso = 0;
Q_Colore_esternoLilla = 0;
Q_Colore_esternoArancione = 0.2;
Q_Colore_esternoVerde = 0;
Q_Colore_esternoMarrone = 0;
Q_Colore_esternoGiallo = 0;
Q_Colore_esternoOro = 0;
Q_Colore_esternoBeige = 0;
Q_Colore_esternoBronzo = 0;
I_Colore_esterno = 'NERO';
U_Colore_esterno = 'Nero';
END;
ELSE DO;
IF NOT MISSING(REP_Peso_a_vuoto ) AND
REP_Peso_a_vuoto < 1236.5 THEN DO;
P_Colore_esternoNero = 0.10526315789473;
P_Colore_esternoBlu_Azzurro = 0.05263157894736;
P_Colore_esternoGrigio = 0.10526315789473;
P_Colore_esternoArgento = 0.1578947368421;
P_Colore_esternoBianco = 0.26315789473684;
P_Colore_esternoRosso = 0.26315789473684;
P_Colore_esternoLilla = 0;
P_Colore_esternoArancione = 0;
P_Colore_esternoVerde = 0;
P_Colore_esternoMarrone = 0;
P_Colore_esternoGiallo = 0;
P_Colore_esternoOro = 0;
P_Colore_esternoBeige = 0.05263157894736;
P_Colore_esternoBronzo = 0;
Q_Colore_esternoNero = 0.10526315789473;
Q_Colore_esternoBlu_Azzurro = 0.05263157894736;
Q_Colore_esternoGrigio = 0.10526315789473;
Q_Colore_esternoArgento = 0.1578947368421;
Q_Colore_esternoBianco = 0.26315789473684;
Q_Colore_esternoRosso = 0.26315789473684;
Q_Colore_esternoLilla = 0;
Q_Colore_esternoArancione = 0;
Q_Colore_esternoVerde = 0;
Q_Colore_esternoMarrone = 0;
Q_Colore_esternoGiallo = 0;
Q_Colore_esternoOro = 0;
Q_Colore_esternoBeige = 0.05263157894736;
Q_Colore_esternoBronzo = 0;
I_Colore_esterno = 'BIANCO';
U_Colore_esterno = 'Bianco';
END;
ELSE DO;
P_Colore_esternoNero = 0.23758278145695;
P_Colore_esternoBlu_Azzurro = 0.10347682119205;
P_Colore_esternoGrigio = 0.34519867549668;
P_Colore_esternoArgento = 0.14155629139072;
P_Colore_esternoBianco = 0.13990066225165;
P_Colore_esternoRosso = 0.01655629139072;
P_Colore_esternoLilla = 0;
P_Colore_esternoArancione = 0.00331125827814;
P_Colore_esternoVerde = 0.0024834437086;
P_Colore_esternoMarrone = 0.0024834437086;
P_Colore_esternoGiallo = 0.00165562913907;
P_Colore_esternoOro = 0.00165562913907;
P_Colore_esternoBeige = 0.00413907284768;
P_Colore_esternoBronzo = 0;
Q_Colore_esternoNero = 0.23758278145695;
Q_Colore_esternoBlu_Azzurro = 0.10347682119205;
Q_Colore_esternoGrigio = 0.34519867549668;
Q_Colore_esternoArgento = 0.14155629139072;
Q_Colore_esternoBianco = 0.13990066225165;
Q_Colore_esternoRosso = 0.01655629139072;
Q_Colore_esternoLilla = 0;
Q_Colore_esternoArancione = 0.00331125827814;
Q_Colore_esternoVerde = 0.0024834437086;
Q_Colore_esternoMarrone = 0.0024834437086;
Q_Colore_esternoGiallo = 0.00165562913907;
Q_Colore_esternoOro = 0.00165562913907;
Q_Colore_esternoBeige = 0.00413907284768;
Q_Colore_esternoBronzo = 0;
I_Colore_esterno = 'GRIGIO';
U_Colore_esterno = 'Grigio';
END;
END;
END;
END;
ELSE DO;
IF NOT MISSING(REP_price ) AND
REP_price < 8550 THEN DO;
P_Colore_esternoNero = 0;
P_Colore_esternoBlu_Azzurro = 0;
P_Colore_esternoGrigio = 0.22222222222222;
P_Colore_esternoArgento = 0;
P_Colore_esternoBianco = 0.11111111111111;
P_Colore_esternoRosso = 0;
P_Colore_esternoLilla = 0;
P_Colore_esternoArancione = 0.66666666666666;
P_Colore_esternoVerde = 0;
P_Colore_esternoMarrone = 0;
P_Colore_esternoGiallo = 0;
P_Colore_esternoOro = 0;
P_Colore_esternoBeige = 0;
P_Colore_esternoBronzo = 0;
Q_Colore_esternoNero = 0;
Q_Colore_esternoBlu_Azzurro = 0;
Q_Colore_esternoGrigio = 0.22222222222222;
Q_Colore_esternoArgento = 0;
Q_Colore_esternoBianco = 0.11111111111111;
Q_Colore_esternoRosso = 0;
Q_Colore_esternoLilla = 0;
Q_Colore_esternoArancione = 0.66666666666666;
Q_Colore_esternoVerde = 0;
Q_Colore_esternoMarrone = 0;
Q_Colore_esternoGiallo = 0;
Q_Colore_esternoOro = 0;
Q_Colore_esternoBeige = 0;
Q_Colore_esternoBronzo = 0;
I_Colore_esterno = 'ARANCIONE';
U_Colore_esterno = 'Arancione';
END;
ELSE DO;
_BRANCH_ = -1;
_ARBFMT_12 = PUT( Cilindri , BEST.);
%DMNORMIP( _ARBFMT_12);
IF _ARBFMT_12 IN ('0' ,'3' ,'4' ,'6' ) THEN DO;
_BRANCH_ = 1;
END;
ELSE IF _ARBFMT_12 IN ('1' ,'2' ) THEN DO;
_BRANCH_ = 2;
END;
IF _BRANCH_ LT 0 AND NOT MISSING(REP_Cilindrata ) THEN DO;
IF 886.5 <= REP_Cilindrata THEN DO;
_BRANCH_ = 1;
END;
ELSE IF REP_Cilindrata < 886.5 THEN DO;
_BRANCH_ = 2;
END;
ELSE _BRANCH_ = 1;
END;
IF _BRANCH_ LT 0 THEN _BRANCH_ = 1;
IF _BRANCH_ EQ 2 THEN DO;
P_Colore_esternoNero = 0.09090909090909;
P_Colore_esternoBlu_Azzurro = 0.0340909090909;
P_Colore_esternoGrigio = 0.19318181818181;
P_Colore_esternoArgento = 0.01136363636363;
P_Colore_esternoBianco = 0.27272727272727;
P_Colore_esternoRosso = 0.07954545454545;
P_Colore_esternoLilla = 0;
P_Colore_esternoArancione = 0.0340909090909;
P_Colore_esternoVerde = 0.125;
P_Colore_esternoMarrone = 0;
P_Colore_esternoGiallo = 0.14772727272727;
P_Colore_esternoOro = 0;
P_Colore_esternoBeige = 0.01136363636363;
P_Colore_esternoBronzo = 0;
Q_Colore_esternoNero = 0.09090909090909;
Q_Colore_esternoBlu_Azzurro = 0.0340909090909;
Q_Colore_esternoGrigio = 0.19318181818181;
Q_Colore_esternoArgento = 0.01136363636363;
Q_Colore_esternoBianco = 0.27272727272727;
Q_Colore_esternoRosso = 0.07954545454545;
Q_Colore_esternoLilla = 0;
Q_Colore_esternoArancione = 0.0340909090909;
Q_Colore_esternoVerde = 0.125;
Q_Colore_esternoMarrone = 0;
Q_Colore_esternoGiallo = 0.14772727272727;
Q_Colore_esternoOro = 0;
Q_Colore_esternoBeige = 0.01136363636363;
Q_Colore_esternoBronzo = 0;
I_Colore_esterno = 'BIANCO';
U_Colore_esterno = 'Bianco';
END;
ELSE DO;
IF NOT MISSING(REP_price ) AND
REP_price < 9670 THEN DO;
P_Colore_esternoNero = 0.07142857142857;
P_Colore_esternoBlu_Azzurro = 0;
P_Colore_esternoGrigio = 0.21428571428571;
P_Colore_esternoArgento = 0;
P_Colore_esternoBianco = 0.42857142857142;
P_Colore_esternoRosso = 0.07142857142857;
P_Colore_esternoLilla = 0;
P_Colore_esternoArancione = 0.21428571428571;
P_Colore_esternoVerde = 0;
P_Colore_esternoMarrone = 0;
P_Colore_esternoGiallo = 0;
P_Colore_esternoOro = 0;
P_Colore_esternoBeige = 0;
P_Colore_esternoBronzo = 0;
Q_Colore_esternoNero = 0.07142857142857;
Q_Colore_esternoBlu_Azzurro = 0;
Q_Colore_esternoGrigio = 0.21428571428571;
Q_Colore_esternoArgento = 0;
Q_Colore_esternoBianco = 0.42857142857142;
Q_Colore_esternoRosso = 0.07142857142857;
Q_Colore_esternoLilla = 0;
Q_Colore_esternoArancione = 0.21428571428571;
Q_Colore_esternoVerde = 0;
Q_Colore_esternoMarrone = 0;
Q_Colore_esternoGiallo = 0;
Q_Colore_esternoOro = 0;
Q_Colore_esternoBeige = 0;
Q_Colore_esternoBronzo = 0;
I_Colore_esterno = 'BIANCO';
U_Colore_esterno = 'Bianco';
END;
ELSE DO;
_ARBFMT_12 = PUT( REP_Tipo_di_vernice , $12.);
%DMNORMIP( _ARBFMT_12);
IF _ARBFMT_12 IN ('BASE' ) THEN DO;
_ARBFMT_12 = PUT( Cilindri , BEST.);
%DMNORMIP( _ARBFMT_12);
IF _ARBFMT_12 IN ('0' ,'3' ,'4' ) THEN DO;
P_Colore_esternoNero = 0.11993517017828;
P_Colore_esternoBlu_Azzurro = 0.02917341977309;
P_Colore_esternoGrigio = 0.11345218800648;
P_Colore_esternoArgento = 0.06482982171799;
P_Colore_esternoBianco = 0.57374392220421;
P_Colore_esternoRosso = 0.07131280388978;
P_Colore_esternoLilla = 0;
P_Colore_esternoArancione = 0.00486223662884;
P_Colore_esternoVerde = 0.01944894651539;
P_Colore_esternoMarrone = 0.00162074554294;
P_Colore_esternoGiallo = 0;
P_Colore_esternoOro = 0;
P_Colore_esternoBeige = 0.00162074554294;
P_Colore_esternoBronzo = 0;
Q_Colore_esternoNero = 0.11993517017828;
Q_Colore_esternoBlu_Azzurro = 0.02917341977309;
Q_Colore_esternoGrigio = 0.11345218800648;
Q_Colore_esternoArgento = 0.06482982171799;
Q_Colore_esternoBianco = 0.57374392220421;
Q_Colore_esternoRosso = 0.07131280388978;
Q_Colore_esternoLilla = 0;
Q_Colore_esternoArancione = 0.00486223662884;
Q_Colore_esternoVerde = 0.01944894651539;
Q_Colore_esternoMarrone = 0.00162074554294;
Q_Colore_esternoGiallo = 0;
Q_Colore_esternoOro = 0;
Q_Colore_esternoBeige = 0.00162074554294;
Q_Colore_esternoBronzo = 0;
I_Colore_esterno = 'BIANCO';
U_Colore_esterno = 'Bianco';
END;
ELSE DO;
P_Colore_esternoNero = 0.13392857142857;
P_Colore_esternoBlu_Azzurro = 0.125;
P_Colore_esternoGrigio = 0.29464285714285;
P_Colore_esternoArgento = 0.08035714285714;
P_Colore_esternoBianco = 0.28571428571428;
P_Colore_esternoRosso = 0.03571428571428;
P_Colore_esternoLilla = 0;
P_Colore_esternoArancione = 0;
P_Colore_esternoVerde = 0.03571428571428;
P_Colore_esternoMarrone = 0;
P_Colore_esternoGiallo = 0.00892857142857;
P_Colore_esternoOro = 0;
P_Colore_esternoBeige = 0;
P_Colore_esternoBronzo = 0;
Q_Colore_esternoNero = 0.13392857142857;
Q_Colore_esternoBlu_Azzurro = 0.125;
Q_Colore_esternoGrigio = 0.29464285714285;
Q_Colore_esternoArgento = 0.08035714285714;
Q_Colore_esternoBianco = 0.28571428571428;
Q_Colore_esternoRosso = 0.03571428571428;
Q_Colore_esternoLilla = 0;
Q_Colore_esternoArancione = 0;
Q_Colore_esternoVerde = 0.03571428571428;
Q_Colore_esternoMarrone = 0;
Q_Colore_esternoGiallo = 0.00892857142857;
Q_Colore_esternoOro = 0;
Q_Colore_esternoBeige = 0;
Q_Colore_esternoBronzo = 0;
I_Colore_esterno = 'GRIGIO';
U_Colore_esterno = 'Grigio';
END;
END;
ELSE DO;
P_Colore_esternoNero = 0.15426497277676;
P_Colore_esternoBlu_Azzurro = 0.08227465214761;
P_Colore_esternoGrigio = 0.25650332728372;
P_Colore_esternoArgento = 0.04174228675136;
P_Colore_esternoBianco = 0.37931034482758;
P_Colore_esternoRosso = 0.04295220810647;
P_Colore_esternoLilla = 0.00060496067755;
P_Colore_esternoArancione = 0.00483968542044;
P_Colore_esternoVerde = 0.01451905626134;
P_Colore_esternoMarrone = 0.00907441016333;
P_Colore_esternoGiallo = 0.00423472474289;
P_Colore_esternoOro = 0.00120992135511;
P_Colore_esternoBeige = 0.00665456745311;
P_Colore_esternoBronzo = 0.00181488203266;
Q_Colore_esternoNero = 0.15426497277676;
Q_Colore_esternoBlu_Azzurro = 0.08227465214761;
Q_Colore_esternoGrigio = 0.25650332728372;
Q_Colore_esternoArgento = 0.04174228675136;
Q_Colore_esternoBianco = 0.37931034482758;
Q_Colore_esternoRosso = 0.04295220810647;
Q_Colore_esternoLilla = 0.00060496067755;
Q_Colore_esternoArancione = 0.00483968542044;
Q_Colore_esternoVerde = 0.01451905626134;
Q_Colore_esternoMarrone = 0.00907441016333;
Q_Colore_esternoGiallo = 0.00423472474289;
Q_Colore_esternoOro = 0.00120992135511;
Q_Colore_esternoBeige = 0.00665456745311;
Q_Colore_esternoBronzo = 0.00181488203266;
I_Colore_esterno = 'BIANCO';
U_Colore_esterno = 'Bianco';
END;
END;
END;
END;
END;
****************************************************************;
****** END OF DECISION TREE SCORING CODE ******;
****************************************************************;
*;
* ASSIGN VALUE TO: Colore_esterno;
*;
length _format200 $200;
drop _format200;
_format200 = strip(I_Colore_esterno);
if _format200="VERDE" then IMP_Colore_esterno = "Verde      ";
else
if _format200="ROSSO" then IMP_Colore_esterno = "Rosso      ";
else
if _format200="ORO" then IMP_Colore_esterno = "Oro        ";
else
if _format200="NERO" then IMP_Colore_esterno = "Nero       ";
else
if _format200="MARRONE" then IMP_Colore_esterno = "Marrone    ";
else
if _format200="LILLA" then IMP_Colore_esterno = "Lilla      ";
else
if _format200="GRIGIO" then IMP_Colore_esterno = "Grigio     ";
else
if _format200="GIALLO" then IMP_Colore_esterno = "Giallo     ";
else
if _format200="BRONZO" then IMP_Colore_esterno = "Bronzo     ";
else
if _format200="BLU/AZZURRO" then IMP_Colore_esterno = "Blu/Azzurro";
else
if _format200="BIANCO" then IMP_Colore_esterno = "Bianco     ";
else
if _format200="BEIGE" then IMP_Colore_esterno = "Beige      ";
else
if _format200="ARGENTO" then IMP_Colore_esterno = "Argento    ";
else
if _format200="ARANCIONE" then IMP_Colore_esterno = "Arancione  ";
END;