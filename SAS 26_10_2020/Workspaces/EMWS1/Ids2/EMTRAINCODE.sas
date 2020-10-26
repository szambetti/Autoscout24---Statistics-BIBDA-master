*------------------------------------------------------------*;
* Installazione dell'origine dati;
         *------------------------------------------------------------*;
libname EMWS1 "C:\Users\Maria Vallarelli\Desktop\MASTER SLIDE\STATISTICA\LABORATORIO\AUTOSCOUT\autoscout\Workspaces\EMWS1";
*------------------------------------------------------------*;
* Ids2: creazione di dati DATA;
*------------------------------------------------------------*;
data EMWS1.Ids2_DATA (label="")
/ view=EMWS1.Ids2_DATA
;
set LIB.AUTOSCOUT_TRAIN;
run;
