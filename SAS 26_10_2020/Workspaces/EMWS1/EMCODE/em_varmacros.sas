*------------------------------------------------------------*;
* Variable Macros;
*------------------------------------------------------------*;
*------------------------------------------------------------*;
* General Variable Macros;
*------------------------------------------------------------*;
%let EM_NUM_VARS = 25;
   %macro EM_VARS;
    EM_CLASSIFICATION EM_CLASSTARGET EM_EVENTPROBABILITY EM_PROBABILITY EM_SEGMENT
   F_target10 Modello Q_target100 Q_target101 REP_Cilindrata
   REP_Consumo_Carburante_Totale REP_Emissioni_di_CO2 REP_Peso_a_vuoto REP_price
   R_target100 R_target101 Tipo_di_unita U_target10 V_target100 V_target101 _NODE_
   _WARN_ _dataobs_ b_target10 target10
   %mend EM_VARS;
%let EM_NUM_CLASS = 11;
   %macro EM_CLASS;
    EM_CLASSIFICATION EM_CLASSTARGET EM_SEGMENT F_target10 Modello Tipo_di_unita
   U_target10 _NODE_ _WARN_ b_target10 target10
   %mend EM_CLASS;
%let EM_NUM_INTERVAL = 14;
   %macro EM_INTERVAL;
    EM_EVENTPROBABILITY EM_PROBABILITY Q_target100 Q_target101 REP_Cilindrata
   REP_Consumo_Carburante_Totale REP_Emissioni_di_CO2 REP_Peso_a_vuoto REP_price
   R_target100 R_target101 V_target100 V_target101 _dataobs_
   %mend EM_INTERVAL;
%let EM_NUM_REPORT_VARS = 0;
   %macro  EM_REPORT_VARS; %mend;
%let EM_NUM_CLASS_REPORT = 0;
   %macro  EM_CLASS_REPORT; %mend;
%let EM_NUM_INTERVAL_REPORT = 0;
   %macro  EM_INTERVAL_REPORT; %mend;
*------------------------------------------------------------*;
* Target Variable Macros;
*------------------------------------------------------------*;
%let EM_NUM_TARGET = 1;
   %macro EM_TARGET;
    target10
   %mend EM_TARGET;
%let EM_NUM_TARGET_LEVEL = 1;
   %macro EM_TARGET_LEVEL;
    BINARY
   %mend EM_TARGET_LEVEL;
%let EM_NUM_BINARY_TARGET = 1;
   %macro EM_BINARY_TARGET;
    target10
   %mend EM_BINARY_TARGET;
%let EM_NUM_ORDINAL_TARGET = 0;
   %macro  EM_ORDINAL_TARGET; %mend;
%let EM_NUM_NOMINAL_TARGET = 0;
   %macro  EM_NOMINAL_TARGET; %mend;
%let EM_NUM_INTERVAL_TARGET = 0;
   %macro  EM_INTERVAL_TARGET; %mend;
*------------------------------------------------------------*;
* Input Variable Macros;
*------------------------------------------------------------*;
%let EM_NUM_INPUT = 7;
   %macro EM_INPUT;
    Modello REP_Cilindrata REP_Consumo_Carburante_Totale REP_Emissioni_di_CO2
   REP_Peso_a_vuoto REP_price Tipo_di_unita
   %mend EM_INPUT;
%let EM_NUM_BINARY_INPUT = 0;
   %macro  EM_BINARY_INPUT; %mend;
%let EM_NUM_ORDINAL_INPUT = 0;
   %macro  EM_ORDINAL_INPUT; %mend;
%let EM_NUM_NOMINAL_INPUT = 2;
   %macro EM_NOMINAL_INPUT;
    Modello Tipo_di_unita
   %mend EM_NOMINAL_INPUT;
%let EM_NUM_INTERVAL_INPUT = 5;
   %macro EM_INTERVAL_INPUT;
    REP_Cilindrata REP_Consumo_Carburante_Totale REP_Emissioni_di_CO2
   REP_Peso_a_vuoto REP_price
   %mend EM_INTERVAL_INPUT;
*------------------------------------------------------------*;
* Rejected Variable Macros;
*------------------------------------------------------------*;
%let EM_NUM_REJECTED = 0;
   %macro  EM_REJECTED; %mend;
%let EM_NUM_BINARY_REJECTED = 0;
   %macro  EM_BINARY_REJECTED; %mend;
%let EM_NUM_ORDINAL_REJECTED = 0;
   %macro  EM_ORDINAL_REJECTED; %mend;
%let EM_NUM_NOMINAL_REJECTED = 0;
   %macro  EM_NOMINAL_REJECTED; %mend;
%let EM_NUM_INTERVAL_REJECTED = 0;
   %macro  EM_INTERVAL_REJECTED; %mend;
*------------------------------------------------------------*;
* Misc Variable Macros;
*------------------------------------------------------------*;
%let EM_NUM_ASSESS = 4;
   %macro EM_ASSESS;
    EM_CLASSTARGET Q_target100 Q_target101 _WARN_
   %mend EM_ASSESS;
%let EM_NUM_INTERVAL_ASSESS = 2;
   %macro EM_INTERVAL_ASSESS;
    Q_target100 Q_target101
   %mend EM_INTERVAL_ASSESS;
%let EM_NUM_CLASS_ASSESS = 2;
   %macro EM_CLASS_ASSESS;
    EM_CLASSTARGET _WARN_
   %mend EM_CLASS_ASSESS;
%let EM_NUM_CENSOR = 0;
   %macro  EM_CENSOR; %mend;
%let EM_NUM_CLASSIFICATION = 3;
   %macro EM_CLASSIFICATION;
    EM_CLASSIFICATION F_target10 U_target10
   %mend EM_CLASSIFICATION;
%let EM_NUM_COST = 0;
   %macro  EM_COST; %mend;
%let EM_NUM_CROSSID = 0;
   %macro  EM_CROSSID; %mend;
%let EM_NUM_DECISION = 0;
   %macro  EM_DECISION; %mend;
%let EM_NUM_FREQ = 0;
   %macro  EM_FREQ; %mend;
%let EM_NUM_ID = 1;
   %macro EM_ID;
    _dataobs_
   %mend EM_ID;
%let EM_NUM_LABEL = 0;
   %macro  EM_LABEL; %mend;
%let EM_NUM_PREDICT = 4;
   %macro EM_PREDICT;
    EM_EVENTPROBABILITY EM_PROBABILITY V_target100 V_target101
   %mend EM_PREDICT;
%let EM_NUM_REFERRER = 0;
   %macro  EM_REFERRER; %mend;
%let EM_NUM_REJECTS = 26;
   %macro EM_REJECTS;
    Alimentazione Anno Carrozzeria Cilindrata Cilindri Classe_emissioni
   Colore_esterno Consumo_Carburante_Totale Emissioni_di_CO2 I_target10 Marce
   P_target100 P_target101 Per_neopatentati Peso_a_vuoto Porte Posti_a_sedere
   REP_Anno REP_Tipo_di_vernice Tagliandi_certificati Tipo_di_cambio
   Tipo_di_vernice Usato_Garantito Veicolo_per_non_fumatori conditional_on_price
   price
   %mend EM_REJECTS;
%let EM_NUM_RESIDUAL = 2;
   %macro EM_RESIDUAL;
    R_target100 R_target101
   %mend EM_RESIDUAL;
%let EM_NUM_SEGMENT = 3;
   %macro EM_SEGMENT;
    EM_SEGMENT _NODE_ b_target10
   %mend EM_SEGMENT;
%let EM_NUM_SEQUENCE = 0;
   %macro  EM_SEQUENCE; %mend;
%let EM_NUM_TEXT = 0;
   %macro  EM_TEXT; %mend;
%let EM_NUM_TIMEID = 0;
   %macro  EM_TIMEID; %mend;
%let EM_NUM_TREATMENT = 0;
   %macro  EM_TREATMENT; %mend;
%let EM_NUM_KEY = 0;
   %macro  EM_KEY; %mend;
*------------------------------------------------------------*;
* End Create EM Macro Variables and Macros;
*------------------------------------------------------------*;
