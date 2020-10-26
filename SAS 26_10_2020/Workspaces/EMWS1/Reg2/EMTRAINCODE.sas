*------------------------------------------------------------*;
* Reg2: Create decision matrix;
*------------------------------------------------------------*;
data WORK.target10;
  length   target10                         $  32
           COUNT                                8
           DATAPRIOR                            8
           TRAINPRIOR                           8
           DECPRIOR                             8
           DECISION1                            8
           DECISION2                            8
           ;

  label    COUNT="Level Counts"
           DATAPRIOR="Data Proportions"
           TRAINPRIOR="Training Proportions"
           DECPRIOR="Decision Priors"
           DECISION1="1"
           DECISION2="0"
           ;
  format   COUNT 10.
           ;
target10="1"; COUNT=2775; DATAPRIOR=0.4094128061375; TRAINPRIOR=0.4094128061375; DECPRIOR=0; DECISION1=1; DECISION2=0;
output;
target10="0"; COUNT=4003; DATAPRIOR=0.59058719386249; TRAINPRIOR=0.59058719386249; DECPRIOR=0; DECISION1=0; DECISION2=1;
output;
;
run;
proc datasets lib=work nolist;
modify target10(type=PROFIT label=target10);
label DECISION1= '1';
label DECISION2= '0';
run;
quit;
data EM_DMREG / view=EM_DMREG;
set EMWS1.Trans_TRAIN(keep=
Alimentazione Carrozzeria IMP_Cilindri IMP_Classe_emissioni IMP_Colore_esterno
IMP_Marce IMP_Porte IMP_Posti_a_sedere IMP_REP_Cilindrata
IMP_REP_Tipo_di_vernice IMP_Tipo_di_cambio IMP_Tipo_di_unita LG10_REP_price
Modello OPT_IMP_REP_Consumo_Carburante_T OPT_IMP_REP_Emissioni_di_CO2
OPT_IMP_REP_Peso_a_vuoto Per_neopatentati REP_Anno Tagliandi_certificati
Usato_Garantito Veicolo_per_non_fumatori conditional_on_price target10 );
run;
*------------------------------------------------------------* ;
* Reg2: DMDBClass Macro ;
*------------------------------------------------------------* ;
%macro DMDBClass;
    Alimentazione(ASC) Carrozzeria(ASC) IMP_Cilindri(ASC)
   IMP_Classe_emissioni(ASC) IMP_Colore_esterno(ASC) IMP_Marce(ASC) IMP_Porte(ASC)
   IMP_Posti_a_sedere(ASC) IMP_REP_Tipo_di_vernice(ASC) IMP_Tipo_di_cambio(ASC)
   IMP_Tipo_di_unita(ASC) Modello(ASC) OPT_IMP_REP_Consumo_Carburante_T(ASC)
   OPT_IMP_REP_Emissioni_di_CO2(ASC) OPT_IMP_REP_Peso_a_vuoto(ASC)
   Per_neopatentati(ASC) Tagliandi_certificati(ASC) Usato_Garantito(ASC)
   Veicolo_per_non_fumatori(ASC) conditional_on_price(ASC) target10(DESC)
%mend DMDBClass;
*------------------------------------------------------------* ;
* Reg2: DMDBVar Macro ;
*------------------------------------------------------------* ;
%macro DMDBVar;
    IMP_REP_Cilindrata LG10_REP_price REP_Anno
%mend DMDBVar;
*------------------------------------------------------------*;
* Reg2: Create DMDB;
*------------------------------------------------------------*;
proc dmdb batch data=WORK.EM_DMREG
dmdbcat=WORK.Reg2_DMDB
maxlevel = 513
;
class %DMDBClass;
var %DMDBVar;
target
target10
;
run;
quit;
*------------------------------------------------------------*;
* Reg2: Run DMREG procedure;
*------------------------------------------------------------*;
proc dmreg data=EM_DMREG dmdbcat=WORK.Reg2_DMDB
validata = EMWS1.Trans_VALIDATE
outest = EMWS1.Reg2_EMESTIMATE
outterms = EMWS1.Reg2_OUTTERMS
outmap= EMWS1.Reg2_MAPDS namelen=200
;
class
target10
Alimentazione
Carrozzeria
IMP_Cilindri
IMP_Classe_emissioni
IMP_Colore_esterno
IMP_Marce
IMP_Porte
IMP_Posti_a_sedere
IMP_REP_Tipo_di_vernice
IMP_Tipo_di_cambio
IMP_Tipo_di_unita
Modello
OPT_IMP_REP_Consumo_Carburante_T
OPT_IMP_REP_Emissioni_di_CO2
OPT_IMP_REP_Peso_a_vuoto
Per_neopatentati
Tagliandi_certificati
Usato_Garantito
Veicolo_per_non_fumatori
conditional_on_price
;
model target10 =
Alimentazione
Carrozzeria
IMP_Cilindri
IMP_Classe_emissioni
IMP_Colore_esterno
IMP_Marce
IMP_Porte
IMP_Posti_a_sedere
IMP_REP_Cilindrata
IMP_REP_Tipo_di_vernice
IMP_Tipo_di_cambio
IMP_Tipo_di_unita
LG10_REP_price
Modello
OPT_IMP_REP_Consumo_Carburante_T
OPT_IMP_REP_Emissioni_di_CO2
OPT_IMP_REP_Peso_a_vuoto
Per_neopatentati
REP_Anno
Tagliandi_certificati
Usato_Garantito
Veicolo_per_non_fumatori
conditional_on_price
/error=binomial link=LOGIT
coding=DEVIATION
nodesignprint
selection=BACKWARD choose=NONE
Hierarchy=CLASS
Rule=NONE
;
;
code file="C:\Users\Maria Vallarelli\Desktop\MASTER SLIDE\STATISTICA\LABORATORIO\AUTOSCOUT\autoscout\Workspaces\EMWS1\Reg2\EMPUBLISHSCORE.sas"
group=Reg2
;
code file="C:\Users\Maria Vallarelli\Desktop\MASTER SLIDE\STATISTICA\LABORATORIO\AUTOSCOUT\autoscout\Workspaces\EMWS1\Reg2\EMFLOWSCORE.sas"
group=Reg2
residual
;
run;
quit;
