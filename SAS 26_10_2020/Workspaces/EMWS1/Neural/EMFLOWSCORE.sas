***********************************;
*** Begin Scoring Code for Neural;
***********************************;
DROP _DM_BAD _EPS _NOCL_ _MAX_ _MAXP_ _SUM_ _NTRIALS;
 _DM_BAD = 0;
 _NOCL_ = .;
 _MAX_ = .;
 _MAXP_ = .;
 _SUM_ = .;
 _NTRIALS = .;
 _EPS =                1E-10;
LENGTH _WARN_ $4
      F_target10  $ 12
;
      label S_IMP_REP_Cilindrata = 'Standard: IMP_REP_Cilindrata' ;

      label S_LG10_REP_price = 'Standard: LG10_REP_price' ;

      label Per_neopatentati0 = 'Dummy: Per_neopatentati=0' ;

      label G_Alimentazione0 = 'Dummy: G_Alimentazione=0' ;

      label G_Alimentazione1 = 'Dummy: G_Alimentazione=1' ;

      label G_Alimentazione2 = 'Dummy: G_Alimentazione=2' ;

      label G_Carrozzeria0 = 'Dummy: G_Carrozzeria=0' ;

      label G_Carrozzeria1 = 'Dummy: G_Carrozzeria=1' ;

      label G_Carrozzeria2 = 'Dummy: G_Carrozzeria=2' ;

      label G_IMP_Cilindri0 = 'Dummy: G_IMP_Cilindri=0' ;

      label G_IMP_Cilindri1 = 'Dummy: G_IMP_Cilindri=1' ;

      label G_IMP_Cilindri2 = 'Dummy: G_IMP_Cilindri=2' ;

      label G_IMP_Colore_esterno0 = 'Dummy: G_IMP_Colore_esterno=0' ;

      label G_IMP_Colore_esterno1 = 'Dummy: G_IMP_Colore_esterno=1' ;

      label G_IMP_Colore_esterno2 = 'Dummy: G_IMP_Colore_esterno=2' ;

      label G_IMP_Colore_esterno3 = 'Dummy: G_IMP_Colore_esterno=3' ;

      label G_IMP_Colore_esterno4 = 'Dummy: G_IMP_Colore_esterno=4' ;

      label G_IMP_Marce0 = 'Dummy: G_IMP_Marce=0' ;

      label G_IMP_Marce1 = 'Dummy: G_IMP_Marce=1' ;

      label G_IMP_Marce2 = 'Dummy: G_IMP_Marce=2' ;

      label G_IMP_Marce3 = 'Dummy: G_IMP_Marce=3' ;

      label G_IMP_Posti_a_sedere0 = 'Dummy: G_IMP_Posti_a_sedere=0' ;

      label G_IMP_Posti_a_sedere1 = 'Dummy: G_IMP_Posti_a_sedere=1' ;

      label G_IMP_Tipo_di_cambio0 = 'Dummy: G_IMP_Tipo_di_cambio=0' ;

      label IMP_Tipo_di_unita4x4 = 'Dummy: IMP_Tipo_di_unita=4x4' ;

      label IMP_Tipo_di_unitaanteriore =
'Dummy: IMP_Tipo_di_unita=anteriore' ;

      label OPT_IMP_REP_Con01_low_4_35 =
'Dummy: OPT_IMP_REP_Consumo_Carburante_T=01:low-4.35' ;

      label OPT_IMP_REP_Con02_4_35_6_15__M =
'Dummy: OPT_IMP_REP_Consumo_Carburante_T=02:4.35-6.15, MISSING' ;

      label OPT_IMP_REP_Con03_6_15_7_05 =
'Dummy: OPT_IMP_REP_Consumo_Carburante_T=03:6.15-7.05' ;

      label OPT_IMP_REP_Emi01_low_92_5 =
'Dummy: OPT_IMP_REP_Emissioni_di_CO2=01:low-92.5' ;

      label OPT_IMP_REP_Emi02_92_5_121_5_ =
'Dummy: OPT_IMP_REP_Emissioni_di_CO2=02:92.5-121.5, MISSING' ;

      label OPT_IMP_REP_Pes01_low_1030 =
'Dummy: OPT_IMP_REP_Peso_a_vuoto=01:low-1030' ;

      label OPT_IMP_REP_Pes02_1030_1077_5 =
'Dummy: OPT_IMP_REP_Peso_a_vuoto=02:1030-1077.5' ;

      label OPT_IMP_REP_Pes03_1077_5_1332_ =
'Dummy: OPT_IMP_REP_Peso_a_vuoto=03:1077.5-1332, MISSING' ;

      label H11 = 'Nascosto: H1=1' ;

      label H12 = 'Nascosto: H1=2' ;

      label H13 = 'Nascosto: H1=3' ;

      label I_target10 = 'In: target10' ;

      label F_target10 = 'Da: target10' ;

      label U_target10 = 'Non normalizzata in: target10' ;

      label P_target101 = 'Previsto: target10=1' ;

      label R_target101 = 'Residuo: target10=1' ;

      label P_target100 = 'Previsto: target10=0' ;

      label R_target100 = 'Residuo: target10=0' ;

      label  _WARN_ = "Warnings";

*** Generate dummy variables for Per_neopatentati ;
drop Per_neopatentati0 ;
if missing( Per_neopatentati ) then do;
   Per_neopatentati0 = .;
   substr(_warn_,1,1) = 'M';
   _DM_BAD = 1;
end;
else do;
   length _dm12 $ 12; drop _dm12 ;
   _dm12 = put( Per_neopatentati , BEST12. );
   %DMNORMIP( _dm12 )
   if _dm12 = '0'  then do;
      Per_neopatentati0 = 1;
   end;
   else if _dm12 = '1'  then do;
      Per_neopatentati0 = -1;
   end;
   else do;
      Per_neopatentati0 = .;
      substr(_warn_,2,1) = 'U';
      _DM_BAD = 1;
   end;
end;

*** Generate dummy variables for G_Alimentazione ;
drop G_Alimentazione0 G_Alimentazione1 G_Alimentazione2 ;
if missing( G_Alimentazione ) then do;
   G_Alimentazione0 = .;
   G_Alimentazione1 = .;
   G_Alimentazione2 = .;
   substr(_warn_,1,1) = 'M';
   _DM_BAD = 1;
end;
else do;
   length _dm12 $ 12; drop _dm12 ;
   _dm12 = put( G_Alimentazione , BEST12. );
   %DMNORMIP( _dm12 )
   if _dm12 = '0'  then do;
      G_Alimentazione0 = 1;
      G_Alimentazione1 = 0;
      G_Alimentazione2 = 0;
   end;
   else if _dm12 = '1'  then do;
      G_Alimentazione0 = 0;
      G_Alimentazione1 = 1;
      G_Alimentazione2 = 0;
   end;
   else if _dm12 = '3'  then do;
      G_Alimentazione0 = -1;
      G_Alimentazione1 = -1;
      G_Alimentazione2 = -1;
   end;
   else if _dm12 = '2'  then do;
      G_Alimentazione0 = 0;
      G_Alimentazione1 = 0;
      G_Alimentazione2 = 1;
   end;
   else do;
      G_Alimentazione0 = .;
      G_Alimentazione1 = .;
      G_Alimentazione2 = .;
      substr(_warn_,2,1) = 'U';
      _DM_BAD = 1;
   end;
end;

*** Generate dummy variables for G_Carrozzeria ;
drop G_Carrozzeria0 G_Carrozzeria1 G_Carrozzeria2 ;
if missing( G_Carrozzeria ) then do;
   G_Carrozzeria0 = .;
   G_Carrozzeria1 = .;
   G_Carrozzeria2 = .;
   substr(_warn_,1,1) = 'M';
   _DM_BAD = 1;
end;
else do;
   length _dm12 $ 12; drop _dm12 ;
   _dm12 = put( G_Carrozzeria , BEST12. );
   %DMNORMIP( _dm12 )
   if _dm12 = '1'  then do;
      G_Carrozzeria0 = 0;
      G_Carrozzeria1 = 1;
      G_Carrozzeria2 = 0;
   end;
   else if _dm12 = '2'  then do;
      G_Carrozzeria0 = 0;
      G_Carrozzeria1 = 0;
      G_Carrozzeria2 = 1;
   end;
   else if _dm12 = '0'  then do;
      G_Carrozzeria0 = 1;
      G_Carrozzeria1 = 0;
      G_Carrozzeria2 = 0;
   end;
   else if _dm12 = '3'  then do;
      G_Carrozzeria0 = -1;
      G_Carrozzeria1 = -1;
      G_Carrozzeria2 = -1;
   end;
   else do;
      G_Carrozzeria0 = .;
      G_Carrozzeria1 = .;
      G_Carrozzeria2 = .;
      substr(_warn_,2,1) = 'U';
      _DM_BAD = 1;
   end;
end;

*** Generate dummy variables for G_IMP_Cilindri ;
drop G_IMP_Cilindri0 G_IMP_Cilindri1 G_IMP_Cilindri2 ;
if missing( G_IMP_Cilindri ) then do;
   G_IMP_Cilindri0 = .;
   G_IMP_Cilindri1 = .;
   G_IMP_Cilindri2 = .;
   substr(_warn_,1,1) = 'M';
   _DM_BAD = 1;
end;
else do;
   length _dm12 $ 12; drop _dm12 ;
   _dm12 = put( G_IMP_Cilindri , BEST12. );
   %DMNORMIP( _dm12 )
   if _dm12 = '0'  then do;
      G_IMP_Cilindri0 = 1;
      G_IMP_Cilindri1 = 0;
      G_IMP_Cilindri2 = 0;
   end;
   else if _dm12 = '1'  then do;
      G_IMP_Cilindri0 = 0;
      G_IMP_Cilindri1 = 1;
      G_IMP_Cilindri2 = 0;
   end;
   else if _dm12 = '2'  then do;
      G_IMP_Cilindri0 = 0;
      G_IMP_Cilindri1 = 0;
      G_IMP_Cilindri2 = 1;
   end;
   else if _dm12 = '3'  then do;
      G_IMP_Cilindri0 = -1;
      G_IMP_Cilindri1 = -1;
      G_IMP_Cilindri2 = -1;
   end;
   else do;
      G_IMP_Cilindri0 = .;
      G_IMP_Cilindri1 = .;
      G_IMP_Cilindri2 = .;
      substr(_warn_,2,1) = 'U';
      _DM_BAD = 1;
   end;
end;

*** Generate dummy variables for G_IMP_Colore_esterno ;
drop G_IMP_Colore_esterno0 G_IMP_Colore_esterno1 G_IMP_Colore_esterno2
        G_IMP_Colore_esterno3 G_IMP_Colore_esterno4 ;
*** encoding is sparse, initialize to zero;
G_IMP_Colore_esterno0 = 0;
G_IMP_Colore_esterno1 = 0;
G_IMP_Colore_esterno2 = 0;
G_IMP_Colore_esterno3 = 0;
G_IMP_Colore_esterno4 = 0;
if missing( G_IMP_Colore_esterno ) then do;
   G_IMP_Colore_esterno0 = .;
   G_IMP_Colore_esterno1 = .;
   G_IMP_Colore_esterno2 = .;
   G_IMP_Colore_esterno3 = .;
   G_IMP_Colore_esterno4 = .;
   substr(_warn_,1,1) = 'M';
   _DM_BAD = 1;
end;
else do;
   length _dm12 $ 12; drop _dm12 ;
   _dm12 = put( G_IMP_Colore_esterno , BEST12. );
   %DMNORMIP( _dm12 )
   if _dm12 = '2'  then do;
      G_IMP_Colore_esterno2 = 1;
   end;
   else if _dm12 = '1'  then do;
      G_IMP_Colore_esterno1 = 1;
   end;
   else if _dm12 = '3'  then do;
      G_IMP_Colore_esterno3 = 1;
   end;
   else if _dm12 = '0'  then do;
      G_IMP_Colore_esterno0 = 1;
   end;
   else if _dm12 = '4'  then do;
      G_IMP_Colore_esterno4 = 1;
   end;
   else if _dm12 = '5'  then do;
      G_IMP_Colore_esterno0 = -1;
      G_IMP_Colore_esterno1 = -1;
      G_IMP_Colore_esterno2 = -1;
      G_IMP_Colore_esterno3 = -1;
      G_IMP_Colore_esterno4 = -1;
   end;
   else do;
      G_IMP_Colore_esterno0 = .;
      G_IMP_Colore_esterno1 = .;
      G_IMP_Colore_esterno2 = .;
      G_IMP_Colore_esterno3 = .;
      G_IMP_Colore_esterno4 = .;
      substr(_warn_,2,1) = 'U';
      _DM_BAD = 1;
   end;
end;

*** Generate dummy variables for G_IMP_Marce ;
drop G_IMP_Marce0 G_IMP_Marce1 G_IMP_Marce2 G_IMP_Marce3 ;
*** encoding is sparse, initialize to zero;
G_IMP_Marce0 = 0;
G_IMP_Marce1 = 0;
G_IMP_Marce2 = 0;
G_IMP_Marce3 = 0;
if missing( G_IMP_Marce ) then do;
   G_IMP_Marce0 = .;
   G_IMP_Marce1 = .;
   G_IMP_Marce2 = .;
   G_IMP_Marce3 = .;
   substr(_warn_,1,1) = 'M';
   _DM_BAD = 1;
end;
else do;
   length _dm12 $ 12; drop _dm12 ;
   _dm12 = put( G_IMP_Marce , BEST12. );
   %DMNORMIP( _dm12 )
   if _dm12 = '1'  then do;
      G_IMP_Marce1 = 1;
   end;
   else if _dm12 = '3'  then do;
      G_IMP_Marce3 = 1;
   end;
   else if _dm12 = '0'  then do;
      G_IMP_Marce0 = 1;
   end;
   else if _dm12 = '2'  then do;
      G_IMP_Marce2 = 1;
   end;
   else if _dm12 = '4'  then do;
      G_IMP_Marce0 = -1;
      G_IMP_Marce1 = -1;
      G_IMP_Marce2 = -1;
      G_IMP_Marce3 = -1;
   end;
   else do;
      G_IMP_Marce0 = .;
      G_IMP_Marce1 = .;
      G_IMP_Marce2 = .;
      G_IMP_Marce3 = .;
      substr(_warn_,2,1) = 'U';
      _DM_BAD = 1;
   end;
end;

*** Generate dummy variables for G_IMP_Posti_a_sedere ;
drop G_IMP_Posti_a_sedere0 G_IMP_Posti_a_sedere1 ;
if missing( G_IMP_Posti_a_sedere ) then do;
   G_IMP_Posti_a_sedere0 = .;
   G_IMP_Posti_a_sedere1 = .;
   substr(_warn_,1,1) = 'M';
   _DM_BAD = 1;
end;
else do;
   length _dm12 $ 12; drop _dm12 ;
   _dm12 = put( G_IMP_Posti_a_sedere , BEST12. );
   %DMNORMIP( _dm12 )
   if _dm12 = '1'  then do;
      G_IMP_Posti_a_sedere0 = 0;
      G_IMP_Posti_a_sedere1 = 1;
   end;
   else if _dm12 = '2'  then do;
      G_IMP_Posti_a_sedere0 = -1;
      G_IMP_Posti_a_sedere1 = -1;
   end;
   else if _dm12 = '0'  then do;
      G_IMP_Posti_a_sedere0 = 1;
      G_IMP_Posti_a_sedere1 = 0;
   end;
   else do;
      G_IMP_Posti_a_sedere0 = .;
      G_IMP_Posti_a_sedere1 = .;
      substr(_warn_,2,1) = 'U';
      _DM_BAD = 1;
   end;
end;

*** Generate dummy variables for G_IMP_Tipo_di_cambio ;
drop G_IMP_Tipo_di_cambio0 ;
if missing( G_IMP_Tipo_di_cambio ) then do;
   G_IMP_Tipo_di_cambio0 = .;
   substr(_warn_,1,1) = 'M';
   _DM_BAD = 1;
end;
else do;
   length _dm12 $ 12; drop _dm12 ;
   _dm12 = put( G_IMP_Tipo_di_cambio , BEST12. );
   %DMNORMIP( _dm12 )
   if _dm12 = '1'  then do;
      G_IMP_Tipo_di_cambio0 = -1;
   end;
   else if _dm12 = '0'  then do;
      G_IMP_Tipo_di_cambio0 = 1;
   end;
   else do;
      G_IMP_Tipo_di_cambio0 = .;
      substr(_warn_,2,1) = 'U';
      _DM_BAD = 1;
   end;
end;

*** Generate dummy variables for IMP_Tipo_di_unita ;
drop IMP_Tipo_di_unita4x4 IMP_Tipo_di_unitaanteriore ;
if missing( IMP_Tipo_di_unita ) then do;
   IMP_Tipo_di_unita4x4 = .;
   IMP_Tipo_di_unitaanteriore = .;
   substr(_warn_,1,1) = 'M';
   _DM_BAD = 1;
end;
else do;
   length _dm10 $ 10; drop _dm10 ;
   %DMNORMCP( IMP_Tipo_di_unita , _dm10 )
   if _dm10 = 'ANTERIORE'  then do;
      IMP_Tipo_di_unita4x4 = 0;
      IMP_Tipo_di_unitaanteriore = 1;
   end;
   else if _dm10 = '4X4'  then do;
      IMP_Tipo_di_unita4x4 = 1;
      IMP_Tipo_di_unitaanteriore = 0;
   end;
   else if _dm10 = 'POSTERIORE'  then do;
      IMP_Tipo_di_unita4x4 = -1;
      IMP_Tipo_di_unitaanteriore = -1;
   end;
   else do;
      IMP_Tipo_di_unita4x4 = .;
      IMP_Tipo_di_unitaanteriore = .;
      substr(_warn_,2,1) = 'U';
      _DM_BAD = 1;
   end;
end;

*** Generate dummy variables for OPT_IMP_REP_Consumo_Carburante_T ;
drop OPT_IMP_REP_Con01_low_4_35 OPT_IMP_REP_Con02_4_35_6_15__M
        OPT_IMP_REP_Con03_6_15_7_05 ;
if missing( OPT_IMP_REP_Consumo_Carburante_T ) then do;
   OPT_IMP_REP_Con01_low_4_35 = .;
   OPT_IMP_REP_Con02_4_35_6_15__M = .;
   OPT_IMP_REP_Con03_6_15_7_05 = .;
   substr(_warn_,1,1) = 'M';
   _DM_BAD = 1;
end;
else do;
   length _dm32 $ 32; drop _dm32 ;
   %DMNORMCP( OPT_IMP_REP_Consumo_Carburante_T , _dm32 )
   if _dm32 = '02:4.35-6.15, MISSING'  then do;
      OPT_IMP_REP_Con01_low_4_35 = 0;
      OPT_IMP_REP_Con02_4_35_6_15__M = 1;
      OPT_IMP_REP_Con03_6_15_7_05 = 0;
   end;
   else if _dm32 = '01:LOW-4.35'  then do;
      OPT_IMP_REP_Con01_low_4_35 = 1;
      OPT_IMP_REP_Con02_4_35_6_15__M = 0;
      OPT_IMP_REP_Con03_6_15_7_05 = 0;
   end;
   else if _dm32 = '03:6.15-7.05'  then do;
      OPT_IMP_REP_Con01_low_4_35 = 0;
      OPT_IMP_REP_Con02_4_35_6_15__M = 0;
      OPT_IMP_REP_Con03_6_15_7_05 = 1;
   end;
   else if _dm32 = '04:7.05-HIGH'  then do;
      OPT_IMP_REP_Con01_low_4_35 = -1;
      OPT_IMP_REP_Con02_4_35_6_15__M = -1;
      OPT_IMP_REP_Con03_6_15_7_05 = -1;
   end;
   else do;
      OPT_IMP_REP_Con01_low_4_35 = .;
      OPT_IMP_REP_Con02_4_35_6_15__M = .;
      OPT_IMP_REP_Con03_6_15_7_05 = .;
      substr(_warn_,2,1) = 'U';
      _DM_BAD = 1;
   end;
end;

*** Generate dummy variables for OPT_IMP_REP_Emissioni_di_CO2 ;
drop OPT_IMP_REP_Emi01_low_92_5 OPT_IMP_REP_Emi02_92_5_121_5_ ;
if missing( OPT_IMP_REP_Emissioni_di_CO2 ) then do;
   OPT_IMP_REP_Emi01_low_92_5 = .;
   OPT_IMP_REP_Emi02_92_5_121_5_ = .;
   substr(_warn_,1,1) = 'M';
   _DM_BAD = 1;
end;
else do;
   length _dm32 $ 32; drop _dm32 ;
   %DMNORMCP( OPT_IMP_REP_Emissioni_di_CO2 , _dm32 )
   if _dm32 = '02:92.5-121.5, MISSING'  then do;
      OPT_IMP_REP_Emi01_low_92_5 = 0;
      OPT_IMP_REP_Emi02_92_5_121_5_ = 1;
   end;
   else if _dm32 = '03:121.5-HIGH'  then do;
      OPT_IMP_REP_Emi01_low_92_5 = -1;
      OPT_IMP_REP_Emi02_92_5_121_5_ = -1;
   end;
   else if _dm32 = '01:LOW-92.5'  then do;
      OPT_IMP_REP_Emi01_low_92_5 = 1;
      OPT_IMP_REP_Emi02_92_5_121_5_ = 0;
   end;
   else do;
      OPT_IMP_REP_Emi01_low_92_5 = .;
      OPT_IMP_REP_Emi02_92_5_121_5_ = .;
      substr(_warn_,2,1) = 'U';
      _DM_BAD = 1;
   end;
end;

*** Generate dummy variables for OPT_IMP_REP_Peso_a_vuoto ;
drop OPT_IMP_REP_Pes01_low_1030 OPT_IMP_REP_Pes02_1030_1077_5
        OPT_IMP_REP_Pes03_1077_5_1332_ ;
if missing( OPT_IMP_REP_Peso_a_vuoto ) then do;
   OPT_IMP_REP_Pes01_low_1030 = .;
   OPT_IMP_REP_Pes02_1030_1077_5 = .;
   OPT_IMP_REP_Pes03_1077_5_1332_ = .;
   substr(_warn_,1,1) = 'M';
   _DM_BAD = 1;
end;
else do;
   length _dm32 $ 32; drop _dm32 ;
   %DMNORMCP( OPT_IMP_REP_Peso_a_vuoto , _dm32 )
   if _dm32 = '03:1077.5-1332, MISSING'  then do;
      OPT_IMP_REP_Pes01_low_1030 = 0;
      OPT_IMP_REP_Pes02_1030_1077_5 = 0;
      OPT_IMP_REP_Pes03_1077_5_1332_ = 1;
   end;
   else if _dm32 = '04:1332-HIGH'  then do;
      OPT_IMP_REP_Pes01_low_1030 = -1;
      OPT_IMP_REP_Pes02_1030_1077_5 = -1;
      OPT_IMP_REP_Pes03_1077_5_1332_ = -1;
   end;
   else if _dm32 = '02:1030-1077.5'  then do;
      OPT_IMP_REP_Pes01_low_1030 = 0;
      OPT_IMP_REP_Pes02_1030_1077_5 = 1;
      OPT_IMP_REP_Pes03_1077_5_1332_ = 0;
   end;
   else if _dm32 = '01:LOW-1030'  then do;
      OPT_IMP_REP_Pes01_low_1030 = 1;
      OPT_IMP_REP_Pes02_1030_1077_5 = 0;
      OPT_IMP_REP_Pes03_1077_5_1332_ = 0;
   end;
   else do;
      OPT_IMP_REP_Pes01_low_1030 = .;
      OPT_IMP_REP_Pes02_1030_1077_5 = .;
      OPT_IMP_REP_Pes03_1077_5_1332_ = .;
      substr(_warn_,2,1) = 'U';
      _DM_BAD = 1;
   end;
end;

*** *************************;
*** Checking missing input Interval
*** *************************;

IF NMISS(
   IMP_REP_Cilindrata ,
   LG10_REP_price   ) THEN DO;
   SUBSTR(_WARN_, 1, 1) = 'M';

   _DM_BAD = 1;
END;
*** *************************;
*** Writing the Node intvl ;
*** *************************;
IF _DM_BAD EQ 0 THEN DO;
   S_IMP_REP_Cilindrata  =    -2.84223600920808 +     0.00198787073647 *
        IMP_REP_Cilindrata ;
   S_LG10_REP_price  =     -23.437760892026 +     5.45223836282292 *
        LG10_REP_price ;
END;
ELSE DO;
   IF MISSING( IMP_REP_Cilindrata ) THEN S_IMP_REP_Cilindrata  = . ;
   ELSE S_IMP_REP_Cilindrata  =    -2.84223600920808 +     0.00198787073647 *
        IMP_REP_Cilindrata ;
   IF MISSING( LG10_REP_price ) THEN S_LG10_REP_price  = . ;
   ELSE S_LG10_REP_price  =     -23.437760892026 +     5.45223836282292 *
        LG10_REP_price ;
END;
*** *************************;
*** Writing the Node bin ;
*** *************************;
*** *************************;
*** Writing the Node nom ;
*** *************************;
*** *************************;
*** Writing the Node H1 ;
*** *************************;
IF _DM_BAD EQ 0 THEN DO;
   H11  =    -0.27010190803744 * S_IMP_REP_Cilindrata
          +    -0.83460810929897 * S_LG10_REP_price ;
   H12  =     1.34144843762097 * S_IMP_REP_Cilindrata
          +    -1.02223831885959 * S_LG10_REP_price ;
   H13  =     0.09607960744067 * S_IMP_REP_Cilindrata
          +     0.57068237484445 * S_LG10_REP_price ;
   H11  = H11  +     0.01871736650437 * Per_neopatentati0 ;
   H12  = H12  +    -0.42203303215684 * Per_neopatentati0 ;
   H13  = H13  +     0.91737678240787 * Per_neopatentati0 ;
   H11  = H11  +     0.33410949058618 * G_Alimentazione0
          +    -0.07147863947102 * G_Alimentazione1  +     1.07055311924656 *
        G_Alimentazione2  +    -0.87659654149732 * G_Carrozzeria0
          +    -0.48134085814851 * G_Carrozzeria1  +    -0.41740813517206 *
        G_Carrozzeria2  +    -0.04978195330725 * G_IMP_Cilindri0
          +     0.69534551644822 * G_IMP_Cilindri1  +     0.01804242642599 *
        G_IMP_Cilindri2  +    -0.09236607587382 * G_IMP_Colore_esterno0
          +     -0.3455382976836 * G_IMP_Colore_esterno1
          +     0.24162509508539 * G_IMP_Colore_esterno2
          +     0.23615677529871 * G_IMP_Colore_esterno3
          +    -0.07331175431956 * G_IMP_Colore_esterno4
          +    -0.45175804985469 * G_IMP_Marce0  +    -0.20439718945952 *
        G_IMP_Marce1  +    -0.05428584189942 * G_IMP_Marce2
          +     0.12577636681549 * G_IMP_Marce3  +    -0.41330017537798 *
        G_IMP_Posti_a_sedere0  +     0.73288158092794 * G_IMP_Posti_a_sedere1
          +     0.33891944035447 * G_IMP_Tipo_di_cambio0
          +    -0.19849477223839 * IMP_Tipo_di_unita4x4
          +     0.25587835097401 * IMP_Tipo_di_unitaanteriore
          +    -0.78842214297293 * OPT_IMP_REP_Con01_low_4_35
          +    -0.20561929820833 * OPT_IMP_REP_Con02_4_35_6_15__M
          +    -0.32176555943516 * OPT_IMP_REP_Con03_6_15_7_05
          +      0.2493152626842 * OPT_IMP_REP_Emi01_low_92_5
          +    -0.22755368721019 * OPT_IMP_REP_Emi02_92_5_121_5_
          +    -0.57725222223021 * OPT_IMP_REP_Pes01_low_1030
          +    -1.09008072066733 * OPT_IMP_REP_Pes02_1030_1077_5
          +    -0.49174314721185 * OPT_IMP_REP_Pes03_1077_5_1332_ ;
   H12  = H12  +    -0.58464616358909 * G_Alimentazione0
          +      0.1111114958547 * G_Alimentazione1  +    -0.90528768520536 *
        G_Alimentazione2  +     0.47554965703018 * G_Carrozzeria0
          +    -0.56447842509865 * G_Carrozzeria1  +     0.22394098398651 *
        G_Carrozzeria2  +    -1.42633412716837 * G_IMP_Cilindri0
          +     2.76685774497156 * G_IMP_Cilindri1  +    -0.10096818058767 *
        G_IMP_Cilindri2  +     0.24297064796669 * G_IMP_Colore_esterno0
          +    -0.30088029843094 * G_IMP_Colore_esterno1
          +       -0.17932156274 * G_IMP_Colore_esterno2
          +    -0.30350117573743 * G_IMP_Colore_esterno3
          +      0.3611897851523 * G_IMP_Colore_esterno4
          +    -0.64556366257457 * G_IMP_Marce0  +     0.07735691496314 *
        G_IMP_Marce1  +    -0.97968515270435 * G_IMP_Marce2
          +    -1.53767941803203 * G_IMP_Marce3  +    -0.00346948499427 *
        G_IMP_Posti_a_sedere0  +     0.01976954513317 * G_IMP_Posti_a_sedere1
          +     0.29681161913762 * G_IMP_Tipo_di_cambio0
          +    -1.00513881528261 * IMP_Tipo_di_unita4x4
          +     1.08020629261908 * IMP_Tipo_di_unitaanteriore
          +     0.48593365760496 * OPT_IMP_REP_Con01_low_4_35
          +    -0.03943612366535 * OPT_IMP_REP_Con02_4_35_6_15__M
          +    -0.45100038995619 * OPT_IMP_REP_Con03_6_15_7_05
          +      0.3530540113764 * OPT_IMP_REP_Emi01_low_92_5
          +     0.07127750072608 * OPT_IMP_REP_Emi02_92_5_121_5_
          +     0.36145668168378 * OPT_IMP_REP_Pes01_low_1030
          +    -0.36275018022385 * OPT_IMP_REP_Pes02_1030_1077_5
          +     0.37231904461413 * OPT_IMP_REP_Pes03_1077_5_1332_ ;
   H13  = H13  +     0.64058123083916 * G_Alimentazione0
          +    -0.41599397158203 * G_Alimentazione1  +     0.77179003905431 *
        G_Alimentazione2  +    -1.42197941092449 * G_Carrozzeria0
          +     0.27496982201956 * G_Carrozzeria1  +     0.63407394899622 *
        G_Carrozzeria2  +     0.12689998389827 * G_IMP_Cilindri0
          +    -0.50831237481084 * G_IMP_Cilindri1  +     0.47656652706894 *
        G_IMP_Cilindri2  +    -0.12151795009643 * G_IMP_Colore_esterno0
          +     0.15170559760008 * G_IMP_Colore_esterno1
          +     0.07028465391261 * G_IMP_Colore_esterno2
          +     0.03174315096904 * G_IMP_Colore_esterno3
          +    -0.37104697385992 * G_IMP_Colore_esterno4
          +    -0.01817236658239 * G_IMP_Marce0  +     0.55252398066158 *
        G_IMP_Marce1  +     0.31770534243804 * G_IMP_Marce2
          +    -0.36545874024421 * G_IMP_Marce3  +    -0.58922966776932 *
        G_IMP_Posti_a_sedere0  +     0.69601103010215 * G_IMP_Posti_a_sedere1
          +     0.26190436767535 * G_IMP_Tipo_di_cambio0
          +     0.13761669958012 * IMP_Tipo_di_unita4x4
          +     0.12644781040831 * IMP_Tipo_di_unitaanteriore
          +    -0.20500450980192 * OPT_IMP_REP_Con01_low_4_35
          +     0.21184378885146 * OPT_IMP_REP_Con02_4_35_6_15__M
          +    -0.33924421547093 * OPT_IMP_REP_Con03_6_15_7_05
          +     0.22272463445929 * OPT_IMP_REP_Emi01_low_92_5
          +    -0.13354462157451 * OPT_IMP_REP_Emi02_92_5_121_5_
          +    -0.33496804070579 * OPT_IMP_REP_Pes01_low_1030
          +     0.07581359860944 * OPT_IMP_REP_Pes02_1030_1077_5
          +    -0.30654894560956 * OPT_IMP_REP_Pes03_1077_5_1332_ ;
   H11  =     1.21610558295354 + H11 ;
   H12  =     1.88549705770966 + H12 ;
   H13  =    -2.65499541395309 + H13 ;
   H11  = TANH(H11 );
   H12  = TANH(H12 );
   H13  = TANH(H13 );
END;
ELSE DO;
   H11  = .;
   H12  = .;
   H13  = .;
END;
*** *************************;
*** Writing the Node target10 ;
*** *************************;

*** Generate dummy variables for target10 ;
drop target101 target100 ;
label F_target10 = 'Da: target10' ;
length F_target10 $ 12;
F_target10 = put( target10 , BEST. );
%DMNORMIP( F_target10 )
if missing( target10 ) then do;
   target101 = .;
   target100 = .;
end;
else do;
   if F_target10 = '0'  then do;
      target101 = 0;
      target100 = 1;
   end;
   else if F_target10 = '1'  then do;
      target101 = 1;
      target100 = 0;
   end;
   else do;
      target101 = .;
      target100 = .;
   end;
end;
IF _DM_BAD EQ 0 THEN DO;
   P_target101  =    -1.47865080199411 * H11  +     2.11313772820151 * H12
          +     3.08982057010903 * H13 ;
   P_target101  = P_target101  +    -0.31004646548089 * S_IMP_REP_Cilindrata
          +    -1.72160786135623 * S_LG10_REP_price ;
   P_target101  = P_target101  +    -0.00917363107871 * Per_neopatentati0 ;
   P_target101  = P_target101  +      0.3731769461381 * G_Alimentazione0
          +      0.1570324107646 * G_Alimentazione1  +    -0.08417845031924 *
        G_Alimentazione2  +     1.71349498363569 * G_Carrozzeria0
          +    -0.47129195966062 * G_Carrozzeria1  +    -1.45234079088716 *
        G_Carrozzeria2  +     1.62743961195839 * G_IMP_Cilindri0
          +     0.84081882799049 * G_IMP_Cilindri1  +    -0.15103130405123 *
        G_IMP_Cilindri2  +     0.92872200569665 * G_IMP_Colore_esterno0
          +     0.62495926264859 * G_IMP_Colore_esterno1
          +     0.88529325634452 * G_IMP_Colore_esterno2
          +     0.83659360728568 * G_IMP_Colore_esterno3
          +    -0.17783163908443 * G_IMP_Colore_esterno4
          +     0.50655320228089 * G_IMP_Marce0  +     -0.9482336220709 *
        G_IMP_Marce1  +    -0.38636671798424 * G_IMP_Marce2
          +     0.45790826700305 * G_IMP_Marce3  +     1.40273472986265 *
        G_IMP_Posti_a_sedere0  +    -0.30328866835105 * G_IMP_Posti_a_sedere1
          +    -0.29792711419486 * G_IMP_Tipo_di_cambio0
          +    -0.25488959246675 * IMP_Tipo_di_unita4x4
          +    -1.48101648676129 * IMP_Tipo_di_unitaanteriore
          +    -0.67464838857943 * OPT_IMP_REP_Con01_low_4_35
          +      -0.212413725376 * OPT_IMP_REP_Con02_4_35_6_15__M
          +     1.50400194129029 * OPT_IMP_REP_Con03_6_15_7_05
          +     -0.5459527440155 * OPT_IMP_REP_Emi01_low_92_5
          +    -0.12152053348465 * OPT_IMP_REP_Emi02_92_5_121_5_
          +    -0.92552550154121 * OPT_IMP_REP_Pes01_low_1030
          +    -0.92819670320428 * OPT_IMP_REP_Pes02_1030_1077_5
          +     0.37349699248323 * OPT_IMP_REP_Pes03_1077_5_1332_ ;
   P_target101  =     0.51435665292243 + P_target101 ;
   P_target100  = 0;
   _MAX_ = MAX (P_target101 , P_target100 );
   _SUM_ = 0.;
   P_target101  = EXP(P_target101  - _MAX_);
   _SUM_ = _SUM_ + P_target101 ;
   P_target100  = EXP(P_target100  - _MAX_);
   _SUM_ = _SUM_ + P_target100 ;
   P_target101  = P_target101  / _SUM_;
   P_target100  = P_target100  / _SUM_;
END;
ELSE DO;
   P_target101  = .;
   P_target100  = .;
END;
IF _DM_BAD EQ 1 THEN DO;
   P_target101  =     0.40944549862955;
   P_target100  =     0.59055450137044;
END;
*** *****************************;
*** Writing the Residuals  of the Node target10 ;
*** ******************************;
IF MISSING( target101 ) THEN R_target101  = . ;
ELSE R_target101  = target101  - P_target101 ;
IF MISSING( target100 ) THEN R_target100  = . ;
ELSE R_target100  = target100  - P_target100 ;
*** *************************;
*** Writing the I_target10  AND U_target10 ;
*** *************************;
_MAXP_ = P_target101 ;
I_target10  = "1           " ;
U_target10  =                    1;
IF( _MAXP_ LT P_target100  ) THEN DO;
   _MAXP_ = P_target100 ;
   I_target10  = "0           " ;
   U_target10  =                    0;
END;
********************************;
*** End Scoring Code for Neural;
********************************;
drop
S_IMP_REP_Cilindrata
S_LG10_REP_price
;
