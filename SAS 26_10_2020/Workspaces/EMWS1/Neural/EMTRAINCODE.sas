*------------------------------------------------------------*;
* Neural: Create decision matrix;
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
data EM_Neural;
set EMWS1.Varsel_TRAIN(keep=
G_Alimentazione G_Carrozzeria G_IMP_Cilindri G_IMP_Colore_esterno G_IMP_Marce
G_IMP_Posti_a_sedere G_IMP_Tipo_di_cambio IMP_REP_Cilindrata IMP_Tipo_di_unita
LG10_REP_price OPT_IMP_REP_Consumo_Carburante_T OPT_IMP_REP_Emissioni_di_CO2
OPT_IMP_REP_Peso_a_vuoto Per_neopatentati target10 );
run;
*------------------------------------------------------------* ;
* Neural: DMDBClass Macro ;
*------------------------------------------------------------* ;
%macro DMDBClass;
    G_Alimentazione(ASC) G_Carrozzeria(ASC) G_IMP_Cilindri(ASC)
   G_IMP_Colore_esterno(ASC) G_IMP_Marce(ASC) G_IMP_Posti_a_sedere(ASC)
   G_IMP_Tipo_di_cambio(ASC) IMP_Tipo_di_unita(ASC)
   OPT_IMP_REP_Consumo_Carburante_T(ASC) OPT_IMP_REP_Emissioni_di_CO2(ASC)
   OPT_IMP_REP_Peso_a_vuoto(ASC) Per_neopatentati(ASC) target10(DESC)
%mend DMDBClass;
*------------------------------------------------------------* ;
* Neural: DMDBVar Macro ;
*------------------------------------------------------------* ;
%macro DMDBVar;
    IMP_REP_Cilindrata LG10_REP_price
%mend DMDBVar;
*------------------------------------------------------------*;
* Neural: Create DMDB;
*------------------------------------------------------------*;
proc dmdb batch data=WORK.EM_Neural
dmdbcat=WORK.Neural_DMDB
maxlevel = 513
;
class %DMDBClass;
var %DMDBVar;
target
target10
;
run;
quit;
*------------------------------------------------------------* ;
* Neural: Interval Input Variables Macro ;
*------------------------------------------------------------* ;
%macro INTINPUTS;
    IMP_REP_Cilindrata LG10_REP_price
%mend INTINPUTS;
*------------------------------------------------------------* ;
* Neural: Variabili di input binarie Macro ;
*------------------------------------------------------------* ;
%macro BININPUTS;
    Per_neopatentati
%mend BININPUTS;
*------------------------------------------------------------* ;
* Neural: Variabili di input nominali Macro ;
*------------------------------------------------------------* ;
%macro NOMINPUTS;
    G_Alimentazione G_Carrozzeria G_IMP_Cilindri G_IMP_Colore_esterno G_IMP_Marce
   G_IMP_Posti_a_sedere G_IMP_Tipo_di_cambio IMP_Tipo_di_unita
   OPT_IMP_REP_Consumo_Carburante_T OPT_IMP_REP_Emissioni_di_CO2
   OPT_IMP_REP_Peso_a_vuoto
%mend NOMINPUTS;
*------------------------------------------------------------* ;
* Neural: Variabili di input ordinali Macro ;
*------------------------------------------------------------* ;
%macro ORDINPUTS;

%mend ORDINPUTS;
*------------------------------------------------------------*;
* Training rete neurale;
;
*------------------------------------------------------------*;
proc neural data=EM_Neural dmdbcat=WORK.Neural_DMDB
validdata = EMWS1.Varsel_VALIDATE
random=12345
;
nloptions
;
performance alldetails noutilfile;
netopts
decay=0;
input %INTINPUTS / level=interval id=intvl
;
input %BININPUTS / level=nominal id=bin
;
input %NOMINPUTS / level=nominal id=nom
;
target target10 / level=NOMINAL id=target10
bias
;
arch MLP
Hidden=3
direct
;
Prelim 5 preiter=10
pretime=3600
Outest=EMWS1.Neural_PRELIM_OUTEST
;
save network=EMWS1.Neural_NETWORK.dm_neural;
train Maxiter=50
maxtime=14400
Outest=EMWS1.Neural_outest estiter=1
Outfit=EMWS1.Neural_OUTFIT
;
run;
quit;
proc sort data=EMWS1.Neural_OUTFIT(where=(_iter_ ne . and _NAME_="OVERALL")) out=fit_Neural;
by _VAVERR_;
run;
%GLOBAL ITER;
data _null_;
set fit_Neural(obs=1);
call symput('ITER',put(_ITER_, 6.));
run;
data EMWS1.Neural_INITIAL;
set EMWS1.Neural_outest(where=(_ITER_ eq &ITER and _OBJ_ ne .));
run;
*------------------------------------------------------------*;
* Selezione del modello della rete neurale;
;
*------------------------------------------------------------*;
proc neural data=EM_Neural dmdbcat=WORK.Neural_DMDB
validdata = EMWS1.Varsel_VALIDATE
network = EMWS1.Neural_NETWORK.dm_neural
random=12345
;
nloptions noprint;
performance alldetails noutilfile;
initial inest=EMWS1.Neural_INITIAL;
train tech=NONE;
code file="C:\Users\Maria Vallarelli\Desktop\MASTER SLIDE\STATISTICA\LABORATORIO\AUTOSCOUT\autoscout\Workspaces\EMWS1\Neural\SCORECODE.sas"
group=Neural
;
;
code file="C:\Users\Maria Vallarelli\Desktop\MASTER SLIDE\STATISTICA\LABORATORIO\AUTOSCOUT\autoscout\Workspaces\EMWS1\Neural\RESIDUALSCORECODE.sas"
group=Neural
residual
;
;
score data=EMWS1.Varsel_TRAIN out=_NULL_
outfit=WORK.FIT1
role=TRAIN
outkey=EMWS1.Neural_OUTKEY;
score data=EMWS1.Varsel_VALIDATE out=_NULL_
outfit=WORK.FIT2
role=VALID
outkey=EMWS1.Neural_OUTKEY;
run;
quit;
data EMWS1.Neural_OUTFIT;
merge WORK.FIT1 WORK.FIT2;
run;
data EMWS1.Neural_EMESTIMATE;
set EMWS1.Neural_outest;
if _type_ ^in('HESSIAN' 'GRAD');
run;
proc datasets lib=work nolist;
delete EM_Neural;
run;
quit;
