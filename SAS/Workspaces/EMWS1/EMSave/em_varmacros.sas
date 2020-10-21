*------------------------------------------------------------*;
* Variable Macros;
*------------------------------------------------------------*;
*------------------------------------------------------------*;
* General Variable Macros;
*------------------------------------------------------------*;
%let EM_NUM_VARS = 40;
   %macro EM_VARS;
    Alimentazione Anno Carrozzeria Cilindrata Cilindri Classe_emissioni
   Colore_esterno Colore_originale Consumo_carburante_combinato
   Consumo_carburante_extraurb Consumo_carburante_urbano Emissioni_di_CO2 Marca
   Marce Modello Per_neopatentati Peso_a_vuoto Porte Posti_a_sedere Rivestimenti
   Tagliandi_certificati Tipo_di_cambio Tipo_di_unita Tipo_di_veicolo
   Tipo_di_vernice Usato_Garantito Veicolo_per_non_fumatori address
   conditional_on_price country discount id_annuncio link_annuncio median price
   seller target variazione_su_mediana vehicle vehicle_user_desc
   %mend EM_VARS;
%let EM_NUM_CLASS = 26;
   %macro EM_CLASS;
    Alimentazione Anno Carrozzeria Classe_emissioni Colore_esterno
   Colore_originale Consumo_carburante_combinato Consumo_carburante_extraurb
   Consumo_carburante_urbano Marca Modello Rivestimenti Tipo_di_cambio
   Tipo_di_unita Tipo_di_veicolo Tipo_di_vernice address country discount
   id_annuncio link_annuncio median seller variazione_su_mediana vehicle
   vehicle_user_desc
   %mend EM_CLASS;
%let EM_NUM_INTERVAL = 14;
   %macro EM_INTERVAL;
    Cilindrata Cilindri Emissioni_di_CO2 Marce Per_neopatentati Peso_a_vuoto Porte
   Posti_a_sedere Tagliandi_certificati Usato_Garantito Veicolo_per_non_fumatori
   conditional_on_price price target
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
    target
   %mend EM_TARGET;
%let EM_NUM_TARGET_LEVEL = 1;
   %macro EM_TARGET_LEVEL;
    INTERVAL
   %mend EM_TARGET_LEVEL;
%let EM_NUM_BINARY_TARGET = 0;
   %macro  EM_BINARY_TARGET; %mend;
%let EM_NUM_ORDINAL_TARGET = 0;
   %macro  EM_ORDINAL_TARGET; %mend;
%let EM_NUM_NOMINAL_TARGET = 0;
   %macro  EM_NOMINAL_TARGET; %mend;
%let EM_NUM_INTERVAL_TARGET = 1;
   %macro EM_INTERVAL_TARGET;
    target
   %mend EM_INTERVAL_TARGET;
*------------------------------------------------------------*;
* Input Variable Macros;
*------------------------------------------------------------*;
%let EM_NUM_INPUT = 36;
   %macro EM_INPUT;
    Alimentazione Anno Carrozzeria Cilindrata Cilindri Classe_emissioni
   Colore_esterno Colore_originale Consumo_carburante_combinato
   Consumo_carburante_extraurb Consumo_carburante_urbano Emissioni_di_CO2 Marca
   Marce Modello Per_neopatentati Peso_a_vuoto Porte Posti_a_sedere Rivestimenti
   Tagliandi_certificati Tipo_di_cambio Tipo_di_unita Tipo_di_veicolo
   Tipo_di_vernice Usato_Garantito Veicolo_per_non_fumatori address
   conditional_on_price discount median price seller variazione_su_mediana vehicle
   vehicle_user_desc
   %mend EM_INPUT;
%let EM_NUM_BINARY_INPUT = 0;
   %macro  EM_BINARY_INPUT; %mend;
%let EM_NUM_ORDINAL_INPUT = 0;
   %macro  EM_ORDINAL_INPUT; %mend;
%let EM_NUM_NOMINAL_INPUT = 23;
   %macro EM_NOMINAL_INPUT;
    Alimentazione Anno Carrozzeria Classe_emissioni Colore_esterno
   Colore_originale Consumo_carburante_combinato Consumo_carburante_extraurb
   Consumo_carburante_urbano Marca Modello Rivestimenti Tipo_di_cambio
   Tipo_di_unita Tipo_di_veicolo Tipo_di_vernice address discount median seller
   variazione_su_mediana vehicle vehicle_user_desc
   %mend EM_NOMINAL_INPUT;
%let EM_NUM_INTERVAL_INPUT = 13;
   %macro EM_INTERVAL_INPUT;
    Cilindrata Cilindri Emissioni_di_CO2 Marce Per_neopatentati Peso_a_vuoto Porte
   Posti_a_sedere Tagliandi_certificati Usato_Garantito Veicolo_per_non_fumatori
   conditional_on_price price
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
%let EM_NUM_ASSESS = 0;
   %macro  EM_ASSESS; %mend;
%let EM_NUM_INTERVAL_ASSESS = 0;
   %macro  EM_INTERVAL_ASSESS; %mend;
%let EM_NUM_CLASS_ASSESS = 0;
   %macro  EM_CLASS_ASSESS; %mend;
%let EM_NUM_CENSOR = 0;
   %macro  EM_CENSOR; %mend;
%let EM_NUM_CLASSIFICATION = 0;
   %macro  EM_CLASSIFICATION; %mend;
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
    id_annuncio
   %mend EM_ID;
%let EM_NUM_LABEL = 0;
   %macro  EM_LABEL; %mend;
%let EM_NUM_PREDICT = 0;
   %macro  EM_PREDICT; %mend;
%let EM_NUM_REFERRER = 0;
   %macro  EM_REFERRER; %mend;
%let EM_NUM_REJECTS = 0;
   %macro  EM_REJECTS; %mend;
%let EM_NUM_RESIDUAL = 0;
   %macro  EM_RESIDUAL; %mend;
%let EM_NUM_SEGMENT = 0;
   %macro  EM_SEGMENT; %mend;
%let EM_NUM_SEQUENCE = 0;
   %macro  EM_SEQUENCE; %mend;
%let EM_NUM_TEXT = 2;
   %macro EM_TEXT;
    country link_annuncio
   %mend EM_TEXT;
%let EM_NUM_TIMEID = 0;
   %macro  EM_TIMEID; %mend;
%let EM_NUM_TREATMENT = 0;
   %macro  EM_TREATMENT; %mend;
%let EM_NUM_KEY = 0;
   %macro  EM_KEY; %mend;
*------------------------------------------------------------*;
* End Create EM Macro Variables and Macros;
*------------------------------------------------------------*;
