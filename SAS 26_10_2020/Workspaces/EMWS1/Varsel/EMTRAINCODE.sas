*------------------------------------------------------------* ;
* EM: DMDBClass Macro ;
*------------------------------------------------------------* ;
%macro DMDBClass;
    Alimentazione(ASC) Carrozzeria(ASC) IMP_Cilindri(ASC)
   IMP_Classe_emissioni(ASC) IMP_Colore_esterno(ASC) IMP_Marce(ASC) IMP_Porte(ASC)
   IMP_Posti_a_sedere(ASC) IMP_REP_Tipo_di_vernice(ASC) IMP_Tipo_di_cambio(ASC)
   IMP_Tipo_di_unita(ASC) OPT_IMP_REP_Consumo_Carburante_T(ASC)
   OPT_IMP_REP_Emissioni_di_CO2(ASC) OPT_IMP_REP_Peso_a_vuoto(ASC)
   Per_neopatentati(ASC) Tagliandi_certificati(ASC) Usato_Garantito(ASC)
   Veicolo_per_non_fumatori(ASC) conditional_on_price(ASC) target10(DESC)
%mend DMDBClass;
*------------------------------------------------------------* ;
* EM: DMDBVar Macro ;
*------------------------------------------------------------* ;
%macro DMDBVar;
    IMP_REP_Cilindrata LG10_REP_price REP_Anno
%mend DMDBVar;
*------------------------------------------------------------*;
* EM: Create DMDB;
*------------------------------------------------------------*;
libname _spdslib SPDE "C:\Users\MARIAV~1\AppData\Local\Temp\SAS Temporary Files\_TD13764_DESKTOP-NN2L3RB_";
proc dmdb batch data=EMWS1.Trans_TRAIN
dmdbcat=WORK.EM_DMDB
maxlevel = 101
out=_spdslib.EM_DMDB
;
class %DMDBClass;
var %DMDBVar;
target
target10
;
run;
quit;
*------------------------------------------------------------* ;
* Varsel: Input Variables Macro ;
*------------------------------------------------------------* ;
%macro INPUTS;
               ALIMENTAZIONE CARROZZERIA IMP_CILINDRI IMP_CLASSE_EMISSIONI IMP_COLORE_ESTERNO
              IMP_Marce IMP_PORTE IMP_POSTI_A_SEDERE IMP_REP_CILINDRATA
              IMP_REP_Tipo_di_vernice IMP_TIPO_DI_CAMBIO IMP_TIPO_DI_UNITA LG10_REP_PRICE
              OPT_IMP_REP_Consumo_Carburante_T OPT_IMP_REP_EMISSIONI_DI_CO2
              OPT_IMP_REP_Peso_a_vuoto PER_NEOPATENTATI REP_ANNO TAGLIANDI_CERTIFICATI
   Usato_Garantito VEICOLO_PER_NON_FUMATORI CONDITIONAL_ON_PRICE
%mend INPUTS;
proc dmine data=_spdslib.EM_DMDB dmdbcat=WORK.EM_DMDB
minr2=0.005 maxrows=3000 stopr2=0.0005 NOAOV16 NOINTER USEGROUPS OUTGROUP=EMWS1.Varsel_OUTGROUP outest=EMWS1.Varsel_OUTESTDMINE outeffect=EMWS1.Varsel_OUTEFFECT outrsquare =EMWS1.Varsel_OUTRSQUARE
NOMONITOR
PSHORT
;
var %INPUTS;
target target10;
code file="C:\Users\Maria Vallarelli\Desktop\MASTER SLIDE\STATISTICA\LABORATORIO\AUTOSCOUT\autoscout\Workspaces\EMWS1\Varsel\EMFLOWSCORE.sas";
code file="C:\Users\Maria Vallarelli\Desktop\MASTER SLIDE\STATISTICA\LABORATORIO\AUTOSCOUT\autoscout\Workspaces\EMWS1\Varsel\EMPUBLISHSCORE.sas";
run;
quit;
/*      proc print data =EMWS1.Varsel_OUTEFFECT;      proc print data =EMWS1.Varsel_OUTRSQUARE;      */
run;
