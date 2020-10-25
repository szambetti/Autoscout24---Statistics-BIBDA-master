****************************************************************;
******             DECISION TREE SCORING CODE             ******;
****************************************************************;
 
******         LENGTHS OF NEW CHARACTER VARIABLES         ******;
LENGTH I_target10  $   12;
LENGTH _WARN_  $    4;
 
******              LABELS FOR NEW VARIABLES              ******;
label _NODE_ = 'Nodo' ;
label _LEAF_ = 'Foglia' ;
label P_target101 = 'Previsto: target10=1' ;
label P_target100 = 'Previsto: target10=0' ;
label Q_target101 = 'P non corretto: target10=1' ;
label Q_target100 = 'P non corretto: target10=0' ;
label V_target101 = 'Convalidato: target10=1' ;
label V_target100 = 'Convalidato: target10=0' ;
label I_target10 = 'In: target10' ;
label U_target10 = 'Non normalizzata in: target10' ;
label _WARN_ = 'Avvertimenti' ;
 
 
******      TEMPORARY VARIABLES FOR FORMATTED VALUES      ******;
LENGTH _ARBFMT_12 $     12; DROP _ARBFMT_12;
_ARBFMT_12 = ' '; /* Initialize to avoid warning. */
LENGTH _ARBFMT_20 $     20; DROP _ARBFMT_20;
_ARBFMT_20 = ' '; /* Initialize to avoid warning. */
LENGTH _ARBFMT_10 $     10; DROP _ARBFMT_10;
_ARBFMT_10 = ' '; /* Initialize to avoid warning. */
LENGTH _ARBFMT_17 $     17; DROP _ARBFMT_17;
_ARBFMT_17 = ' '; /* Initialize to avoid warning. */
 
 
******             ASSIGN OBSERVATION TO NODE             ******;
_ARBFMT_20 = PUT( Modello , $20.);
 %DMNORMIP( _ARBFMT_20);
IF _ARBFMT_20 IN ('FORTWO' ,'Q3' ,'KONA' ,'A4' ,'COOPER' ,'NIRO' ,'CAPTUR' ,
  'TIVOLI' ,'RENEGADE' ,'COMPASS' ,'GRANDLAND X' ,'OUTLANDER' ,'TIPO' ,
  'CLIO' ,'GIULIETTA' ,'500C' ,'Q5' ,'NX 300' ,'3008' ,'PASSAT VARIANT' ,
  '508' ,'520' ,'A6' ,'LEON' ,'COROLLA' ,'CAYENNE' ,'GOLF' ,'A5' ,'A3' ,
  'POLO' ,'STELVIO' ,'KADJAR' ,'WRANGLER' ,'Q2' ,'OCTAVIA' ,'TALISMAN' ,
  'ASTRA' ,'GOLF VARIANT' ,'318' ,'GIULIA' ,'E-PACE' ,'GRAND C4 SPACETOURER' ,
  'SCENIC' ,'DOBLO' ,'CADDY' ,'218' ,'TOURAN' ,'FIORINO' ,'A4 ALLROAD' ,
  'ESPACE' ) THEN DO;
  IF  NOT MISSING(REP_price ) AND
                   42550 <= REP_price  THEN DO;
    _ARBFMT_20 = PUT( Modello , $20.);
     %DMNORMIP( _ARBFMT_20);
    IF _ARBFMT_20 IN ('Q5' ,'520' ,'A6' ,'CAYENNE' ,'WRANGLER' ) THEN DO;
      IF  NOT MISSING(REP_price ) AND
                       50740 <= REP_price  THEN DO;
        _NODE_  =                   23;
        _LEAF_  =                   29;
        P_target101  =                 0.45;
        P_target100  =                 0.55;
        Q_target101  =                 0.45;
        Q_target100  =                 0.55;
        V_target101  =     0.57142857142857;
        V_target100  =     0.42857142857142;
        I_target10  = '0' ;
        U_target10  =                    0;
        END;
      ELSE DO;
        _NODE_  =                   22;
        _LEAF_  =                   28;
        P_target101  =                    1;
        P_target100  =                    0;
        Q_target101  =                    1;
        Q_target100  =                    0;
        V_target101  =     0.88888888888888;
        V_target100  =     0.11111111111111;
        I_target10  = '1' ;
        U_target10  =                    1;
        END;
      END;
    ELSE DO;
      IF  NOT MISSING(REP_price ) AND
        REP_price  <                45200 THEN DO;
        IF  NOT MISSING(REP_Emissioni_di_CO2 ) AND
          REP_Emissioni_di_CO2  <                  133 THEN DO;
          _NODE_  =                   38;
          _LEAF_  =                   23;
          P_target101  =     0.07692307692307;
          P_target100  =     0.92307692307692;
          Q_target101  =     0.07692307692307;
          Q_target100  =     0.92307692307692;
          V_target101  =     0.11111111111111;
          V_target100  =     0.88888888888888;
          I_target10  = '0' ;
          U_target10  =                    0;
          END;
        ELSE DO;
          _ARBFMT_20 = PUT( Modello , $20.);
           %DMNORMIP( _ARBFMT_20);
          IF _ARBFMT_20 IN ('STELVIO' ) THEN DO;
            _NODE_  =                   64;
            _LEAF_  =                   24;
            P_target101  =                    1;
            P_target100  =                    0;
            Q_target101  =                    1;
            Q_target100  =                    0;
            V_target101  =                    1;
            V_target100  =                    0;
            I_target10  = '1' ;
            U_target10  =                    1;
            END;
          ELSE DO;
            _NODE_  =                   65;
            _LEAF_  =                   25;
            P_target101  =                  0.5;
            P_target100  =                  0.5;
            Q_target101  =                  0.5;
            Q_target100  =                  0.5;
            V_target101  =                    0;
            V_target100  =                    1;
            I_target10  = '1' ;
            U_target10  =                    1;
            END;
          END;
        END;
      ELSE DO;
        _ARBFMT_12 = PUT( Posti_a_sedere , BEST12.);
         %DMNORMIP( _ARBFMT_12);
        IF _ARBFMT_12 IN ('4' ) THEN DO;
          _NODE_  =                   40;
          _LEAF_  =                   26;
          P_target101  =                  0.4;
          P_target100  =                  0.6;
          Q_target101  =                  0.4;
          Q_target100  =                  0.6;
          V_target101  =                    1;
          V_target100  =                    0;
          I_target10  = '0' ;
          U_target10  =                    0;
          END;
        ELSE DO;
          _NODE_  =                   41;
          _LEAF_  =                   27;
          P_target101  =     0.01408450704225;
          P_target100  =     0.98591549295774;
          Q_target101  =     0.01408450704225;
          Q_target100  =     0.98591549295774;
          V_target101  =     0.03448275862068;
          V_target100  =     0.96551724137931;
          I_target10  = '0' ;
          U_target10  =                    0;
          END;
        END;
      END;
    END;
  ELSE DO;
    _ARBFMT_20 = PUT( Modello , $20.);
     %DMNORMIP( _ARBFMT_20);
    IF _ARBFMT_20 IN ('KONA' ,'COOPER' ,'NIRO' ,'TIVOLI' ,'GRANDLAND X' ,
    'CLIO' ,'COROLLA' ,'A3' ,'POLO' ,'KADJAR' ,'Q2' ,'ASTRA' ,'SCENIC' ,
    'DOBLO' ,'218' ,'FIORINO' ) THEN DO;
      IF  NOT MISSING(REP_price ) AND
        REP_price  <                18450 THEN DO;
        IF  NOT MISSING(REP_Emissioni_di_CO2 ) AND
                            96 <= REP_Emissioni_di_CO2  THEN DO;
          _NODE_  =                   35;
          _LEAF_  =                   12;
          P_target101  =     0.95238095238095;
          P_target100  =     0.04761904761904;
          Q_target101  =     0.95238095238095;
          Q_target100  =     0.04761904761904;
          V_target101  =                    1;
          V_target100  =                    0;
          I_target10  = '1' ;
          U_target10  =                    1;
          END;
        ELSE DO;
          IF  NOT MISSING(REP_price ) AND
                           15770 <= REP_price  THEN DO;
            _NODE_  =                   59;
            _LEAF_  =                   11;
            P_target101  =     0.33333333333333;
            P_target100  =     0.66666666666666;
            Q_target101  =     0.33333333333333;
            Q_target100  =     0.66666666666666;
            V_target101  =                    0;
            V_target100  =                    1;
            I_target10  = '0' ;
            U_target10  =                    0;
            END;
          ELSE DO;
            _NODE_  =                   58;
            _LEAF_  =                   10;
            P_target101  =                    1;
            P_target100  =                    0;
            Q_target101  =                    1;
            Q_target100  =                    0;
            V_target101  =                    1;
            V_target100  =                    0;
            I_target10  = '1' ;
            U_target10  =                    1;
            END;
          END;
        END;
      ELSE DO;
        _ARBFMT_20 = PUT( Modello , $20.);
         %DMNORMIP( _ARBFMT_20);
        IF _ARBFMT_20 IN ('TIVOLI' ,'CLIO' ,'POLO' ,'DOBLO' ) THEN DO;
          IF  NOT MISSING(REP_Consumo_Carburante_Totale ) AND
                            8.35 <= REP_Consumo_Carburante_Totale  THEN DO;
            _NODE_  =                   63;
            _LEAF_  =                   22;
            P_target101  =                  0.2;
            P_target100  =                  0.8;
            Q_target101  =                  0.2;
            Q_target100  =                  0.8;
            V_target101  =     0.33333333333333;
            V_target100  =     0.66666666666666;
            I_target10  = '0' ;
            U_target10  =                    0;
            END;
          ELSE DO;
            _NODE_  =                   62;
            _LEAF_  =                   21;
            P_target101  =                    0;
            P_target100  =                    1;
            Q_target101  =                    0;
            Q_target100  =                    1;
            V_target101  =                    0;
            V_target100  =                    1;
            I_target10  = '0' ;
            U_target10  =                    0;
            END;
          END;
        ELSE DO;
          IF  NOT MISSING(REP_price ) AND
                           33400 <= REP_price  THEN DO;
            _NODE_  =                   61;
            _LEAF_  =                   20;
            P_target101  =                    0;
            P_target100  =                    1;
            Q_target101  =                    0;
            Q_target100  =                    1;
            V_target101  =                    0;
            V_target100  =                    1;
            I_target10  = '0' ;
            U_target10  =                    0;
            END;
          ELSE DO;
            _ARBFMT_20 = PUT( Modello , $20.);
             %DMNORMIP( _ARBFMT_20);
            IF _ARBFMT_20 IN ('KONA' ,'NIRO' ,'COROLLA' ,'KADJAR' ,'Q2' ,
            'ASTRA' ,'SCENIC' ,'218' ) THEN DO;
              IF  NOT MISSING(REP_price ) AND
                REP_price  <                21995 THEN DO;
                _ARBFMT_20 = PUT( Modello , $20.);
                 %DMNORMIP( _ARBFMT_20);
                IF _ARBFMT_20 IN ('ASTRA' ) THEN DO;
                  IF  NOT MISSING(REP_price ) AND
                                   20425 <= REP_price  THEN DO;
                    _NODE_  =                  117;
                    _LEAF_  =                   14;
                    P_target101  =                    0;
                    P_target100  =                    1;
                    Q_target101  =                    0;
                    Q_target100  =                    1;
                    V_target101  =                    0;
                    V_target100  =                    1;
                    I_target10  = '0' ;
                    U_target10  =                    0;
                    END;
                  ELSE DO;
                    _NODE_  =                  116;
                    _LEAF_  =                   13;
                    P_target101  =                    1;
                    P_target100  =                    0;
                    Q_target101  =                    1;
                    Q_target100  =                    0;
                    V_target101  =                    1;
                    V_target100  =                    0;
                    I_target10  = '1' ;
                    U_target10  =                    1;
                    END;
                  END;
                ELSE DO;
                  _NODE_  =                  111;
                  _LEAF_  =                   15;
                  P_target101  =                    1;
                  P_target100  =                    0;
                  Q_target101  =                    1;
                  Q_target100  =                    0;
                  V_target101  =                    1;
                  V_target100  =                    0;
                  I_target10  = '1' ;
                  U_target10  =                    1;
                  END;
                END;
              ELSE DO;
                IF  NOT MISSING(REP_Cilindrata ) AND
                                1773.5 <= REP_Cilindrata  THEN DO;
                  IF  NOT MISSING(REP_price ) AND
                                   30300 <= REP_price  THEN DO;
                    _NODE_  =                  119;
                    _LEAF_  =                   18;
                    P_target101  =                    0;
                    P_target100  =                    1;
                    Q_target101  =                    0;
                    Q_target100  =                    1;
                    V_target101  =                    0;
                    V_target100  =                    1;
                    I_target10  = '0' ;
                    U_target10  =                    0;
                    END;
                  ELSE DO;
                    _NODE_  =                  118;
                    _LEAF_  =                   17;
                    P_target101  =     0.94444444444444;
                    P_target100  =     0.05555555555555;
                    Q_target101  =     0.94444444444444;
                    Q_target100  =     0.05555555555555;
                    V_target101  =     0.94736842105263;
                    V_target100  =     0.05263157894736;
                    I_target10  = '1' ;
                    U_target10  =                    1;
                    END;
                  END;
                ELSE DO;
                  _NODE_  =                  112;
                  _LEAF_  =                   16;
                  P_target101  =     0.18461538461538;
                  P_target100  =     0.81538461538461;
                  Q_target101  =     0.18461538461538;
                  Q_target100  =     0.81538461538461;
                  V_target101  =     0.23809523809523;
                  V_target100  =     0.76190476190476;
                  I_target10  = '0' ;
                  U_target10  =                    0;
                  END;
                END;
              END;
            ELSE DO;
              _NODE_  =                   85;
              _LEAF_  =                   19;
              P_target101  =                    1;
              P_target100  =                    0;
              Q_target101  =                    1;
              Q_target100  =                    0;
              V_target101  =     0.89473684210526;
              V_target100  =     0.10526315789473;
              I_target10  = '1' ;
              U_target10  =                    1;
              END;
            END;
          END;
        END;
      END;
    ELSE DO;
      _ARBFMT_20 = PUT( Modello , $20.);
       %DMNORMIP( _ARBFMT_20);
      IF _ARBFMT_20 IN ('TIPO' ,'GIULIETTA' ,'PASSAT VARIANT' ,'GOLF' ,
      'OCTAVIA' ,'GOLF VARIANT' ,'GRAND C4 SPACETOURER' ,'CADDY' ) THEN DO;
        IF  NOT MISSING(REP_price ) AND
                         25800 <= REP_price  THEN DO;
          _ARBFMT_20 = PUT( Modello , $20.);
           %DMNORMIP( _ARBFMT_20);
          IF _ARBFMT_20 IN ('PASSAT VARIANT' ) THEN DO;
            _NODE_  =                   54;
            _LEAF_  =                    6;
            P_target101  =     0.84210526315789;
            P_target100  =      0.1578947368421;
            Q_target101  =     0.84210526315789;
            Q_target100  =      0.1578947368421;
            V_target101  =                    1;
            V_target100  =                    0;
            I_target10  = '1' ;
            U_target10  =                    1;
            END;
          ELSE DO;
            _NODE_  =                   55;
            _LEAF_  =                    7;
            P_target101  =                    0;
            P_target100  =                    1;
            Q_target101  =                    0;
            Q_target100  =                    1;
            V_target101  =     0.08333333333333;
            V_target100  =     0.91666666666666;
            I_target10  = '0' ;
            U_target10  =                    0;
            END;
          END;
        ELSE DO;
          IF  NOT MISSING(REP_price ) AND
            REP_price  <                16190 THEN DO;
            _NODE_  =                   52;
            _LEAF_  =                    1;
            P_target101  =                    1;
            P_target100  =                    0;
            Q_target101  =                    1;
            Q_target100  =                    0;
            V_target101  =                    1;
            V_target100  =                    0;
            I_target10  = '1' ;
            U_target10  =                    1;
            END;
          ELSE DO;
            _ARBFMT_20 = PUT( Modello , $20.);
             %DMNORMIP( _ARBFMT_20);
            IF _ARBFMT_20 IN ('TIPO' ) THEN DO;
              _NODE_  =                   81;
              _LEAF_  =                    5;
              P_target101  =                    0;
              P_target100  =                    1;
              Q_target101  =                    0;
              Q_target100  =                    1;
              V_target101  =     0.11111111111111;
              V_target100  =     0.88888888888888;
              I_target10  = '0' ;
              U_target10  =                    0;
              END;
            ELSE DO;
              IF  NOT MISSING(REP_Emissioni_di_CO2 ) AND
                               118.5 <= REP_Emissioni_di_CO2  THEN DO;
                IF  NOT MISSING(REP_price ) AND
                                 21800 <= REP_price  THEN DO;
                  _NODE_  =                  109;
                  _LEAF_  =                    4;
                  P_target101  =     0.18181818181818;
                  P_target100  =     0.81818181818181;
                  Q_target101  =     0.18181818181818;
                  Q_target100  =     0.81818181818181;
                  V_target101  =                    0;
                  V_target100  =                    1;
                  I_target10  = '0' ;
                  U_target10  =                    0;
                  END;
                ELSE DO;
                  _NODE_  =                  108;
                  _LEAF_  =                    3;
                  P_target101  =                    1;
                  P_target100  =                    0;
                  Q_target101  =                    1;
                  Q_target100  =                    0;
                  V_target101  =                    1;
                  V_target100  =                    0;
                  I_target10  = '1' ;
                  U_target10  =                    1;
                  END;
                END;
              ELSE DO;
                _NODE_  =                   98;
                _LEAF_  =                    2;
                P_target101  =     0.98181818181818;
                P_target100  =     0.01818181818181;
                Q_target101  =     0.98181818181818;
                Q_target100  =     0.01818181818181;
                V_target101  =     0.92957746478873;
                V_target100  =     0.07042253521126;
                I_target10  = '1' ;
                U_target10  =                    1;
                END;
              END;
            END;
          END;
        END;
      ELSE DO;
        IF  NOT MISSING(REP_Emissioni_di_CO2 ) AND
          REP_Emissioni_di_CO2  <                 64.5 THEN DO;
          _NODE_  =                   32;
          _LEAF_  =                    8;
          P_target101  =                  0.6;
          P_target100  =                  0.4;
          Q_target101  =                  0.6;
          Q_target100  =                  0.4;
          V_target101  =     0.33333333333333;
          V_target100  =     0.66666666666666;
          I_target10  = '1' ;
          U_target10  =                    1;
          END;
        ELSE DO;
          _NODE_  =                   33;
          _LEAF_  =                    9;
          P_target101  =     0.97066326530612;
          P_target100  =     0.02933673469387;
          Q_target101  =     0.97066326530612;
          Q_target100  =     0.02933673469387;
          V_target101  =     0.97126436781609;
          V_target100  =      0.0287356321839;
          I_target10  = '1' ;
          U_target10  =                    1;
          END;
        END;
      END;
    END;
  END;
ELSE DO;
  _ARBFMT_20 = PUT( Modello , $20.);
   %DMNORMIP( _ARBFMT_20);
  IF _ARBFMT_20 IN ('E-TRON' ,'DS 3 CROSSBACK' ,'LEAF' ,'208' ,'PARTNER' ,
    'KANGOO' ,'NEW PANDA' ,'500' ,'PANDA' ,'YPSILON' ,'TWINGO' ,'500X' ,
    'STONIC' ,'SPORTAGE' ,'CROSSLAND X' ,'SANDERO' ,'FIESTA' ,'C3' ,'X1' ,
    'C-HR' ,'XV' ,'YARIS' ,'A 250' ,'T-ROC' ,'ARONA' ,'ATECA' ,'KAMIQ' ,
    'QASHQAI' ,'X-TRAIL' ,'T-CROSS' ,'MEGANE' ,'FOCUS' ,'308' ,'C4 CACTUS' ,
    'IBIZA' ,'COMBO' ,'420' ,'C 220' ,'L200' ,'COOPER D COUNTRYMAN' ,
    'CHEROKEE' ,'INSIGNIA' ,'COOPER D CLUBMAN' ,'320' ,'730' ) THEN DO;
    IF  NOT MISSING(REP_price ) AND
      REP_price  <                 9445 THEN DO;
      _NODE_  =                   14;
      _LEAF_  =                   43;
      P_target101  =     0.87096774193548;
      P_target100  =     0.12903225806451;
      Q_target101  =     0.87096774193548;
      Q_target100  =     0.12903225806451;
      V_target101  =     0.83333333333333;
      V_target100  =     0.16666666666666;
      I_target10  = '1' ;
      U_target10  =                    1;
      END;
    ELSE DO;
      IF  NOT MISSING(REP_Peso_a_vuoto ) AND
                      1263.5 <= REP_Peso_a_vuoto  THEN DO;
        IF  NOT MISSING(REP_price ) AND
          REP_price  <                17125 THEN DO;
          _NODE_  =                   50;
          _LEAF_  =                   51;
          P_target101  =     0.79166666666666;
          P_target100  =     0.20833333333333;
          Q_target101  =     0.79166666666666;
          Q_target100  =     0.20833333333333;
          V_target101  =     0.83333333333333;
          V_target100  =     0.16666666666666;
          I_target10  = '1' ;
          U_target10  =                    1;
          END;
        ELSE DO;
          _ARBFMT_20 = PUT( Modello , $20.);
           %DMNORMIP( _ARBFMT_20);
          IF _ARBFMT_20 IN ('DS 3 CROSSBACK' ,'C-HR' ,'QASHQAI' ,'420' ) THEN
           DO;
            IF  NOT MISSING(REP_price ) AND
              REP_price  <                22190 THEN DO;
              _NODE_  =                   96;
              _LEAF_  =                   52;
              P_target101  =                    1;
              P_target100  =                    0;
              Q_target101  =                    1;
              Q_target100  =                    0;
              V_target101  =                 0.75;
              V_target100  =                 0.25;
              I_target10  = '1' ;
              U_target10  =                    1;
              END;
            ELSE DO;
              _NODE_  =                   97;
              _LEAF_  =                   53;
              P_target101  =      0.1076923076923;
              P_target100  =     0.89230769230769;
              Q_target101  =      0.1076923076923;
              Q_target100  =     0.89230769230769;
              V_target101  =     0.03703703703703;
              V_target100  =     0.96296296296296;
              I_target10  = '0' ;
              U_target10  =                    0;
              END;
            END;
          ELSE DO;
            _NODE_  =                   79;
            _LEAF_  =                   54;
            P_target101  =     0.02145922746781;
            P_target100  =     0.97854077253218;
            Q_target101  =     0.02145922746781;
            Q_target100  =     0.97854077253218;
            V_target101  =     0.02061855670103;
            V_target100  =     0.97938144329896;
            I_target10  = '0' ;
            U_target10  =                    0;
            END;
          END;
        END;
      ELSE DO;
        IF  NOT MISSING(REP_price ) AND
          REP_price  <                11725 THEN DO;
          _ARBFMT_20 = PUT( Modello , $20.);
           %DMNORMIP( _ARBFMT_20);
          IF _ARBFMT_20 IN ('500' ) THEN DO;
            _NODE_  =                   72;
            _LEAF_  =                   44;
            P_target101  =                    1;
            P_target100  =                    0;
            Q_target101  =                    1;
            Q_target100  =                    0;
            V_target101  =                    1;
            V_target100  =                    0;
            I_target10  = '1' ;
            U_target10  =                    1;
            END;
          ELSE DO;
            _ARBFMT_20 = PUT( Modello , $20.);
             %DMNORMIP( _ARBFMT_20);
            IF _ARBFMT_20 IN ('NEW PANDA' ,'PANDA' ,'YPSILON' ) THEN DO;
              _NODE_  =                   91;
              _LEAF_  =                   46;
              P_target101  =                    0;
              P_target100  =                    1;
              Q_target101  =                    0;
              Q_target100  =                    1;
              V_target101  =     0.01785714285714;
              V_target100  =     0.98214285714285;
              I_target10  = '0' ;
              U_target10  =                    0;
              END;
            ELSE DO;
              _NODE_  =                   90;
              _LEAF_  =                   45;
              P_target101  =     0.33333333333333;
              P_target100  =     0.66666666666666;
              Q_target101  =     0.33333333333333;
              Q_target100  =     0.66666666666666;
              V_target101  =     0.33333333333333;
              V_target100  =     0.66666666666666;
              I_target10  = '0' ;
              U_target10  =                    0;
              END;
            END;
          END;
        ELSE DO;
          _ARBFMT_20 = PUT( Modello , $20.);
           %DMNORMIP( _ARBFMT_20);
          IF _ARBFMT_20 IN ('LEAF' ,'PARTNER' ,'500' ,'PANDA' ,'YPSILON' ,
          'TWINGO' ,'500X' ,'STONIC' ,'CROSSLAND X' ,'SANDERO' ,'FIESTA' ,
          'C-HR' ,'KAMIQ' ,'X-TRAIL' ,'T-CROSS' ,'C4 CACTUS' ,'IBIZA' ,
          'COMBO' ,'INSIGNIA' ,'COOPER D CLUBMAN' ,'320' ) THEN DO;
            _ARBFMT_20 = PUT( Modello , $20.);
             %DMNORMIP( _ARBFMT_20);
            IF _ARBFMT_20 IN ('500X' ) THEN DO;
              _NODE_  =                   94;
              _LEAF_  =                   49;
              P_target101  =     0.03703703703703;
              P_target100  =     0.96296296296296;
              Q_target101  =     0.03703703703703;
              Q_target100  =     0.96296296296296;
              V_target101  =              0.03125;
              V_target100  =              0.96875;
              I_target10  = '0' ;
              U_target10  =                    0;
              END;
            ELSE DO;
              _NODE_  =                   95;
              _LEAF_  =                   50;
              P_target101  =                    0;
              P_target100  =                    1;
              Q_target101  =                    0;
              Q_target100  =                    1;
              V_target101  =     0.01106194690265;
              V_target100  =     0.98893805309734;
              I_target10  = '0' ;
              U_target10  =                    0;
              END;
            END;
          ELSE DO;
            IF  NOT MISSING(REP_price ) AND
              REP_price  <                17950 THEN DO;
              _NODE_  =                   92;
              _LEAF_  =                   47;
              P_target101  =                0.425;
              P_target100  =                0.575;
              Q_target101  =                0.425;
              Q_target100  =                0.575;
              V_target101  =     0.26666666666666;
              V_target100  =     0.73333333333333;
              I_target10  = '0' ;
              U_target10  =                    0;
              END;
            ELSE DO;
              _NODE_  =                   93;
              _LEAF_  =                   48;
              P_target101  =               0.0625;
              P_target100  =               0.9375;
              Q_target101  =               0.0625;
              Q_target100  =               0.9375;
              V_target101  =               0.0625;
              V_target100  =               0.9375;
              I_target10  = '0' ;
              U_target10  =                    0;
              END;
            END;
          END;
        END;
      END;
    END;
  ELSE DO;
    IF  NOT MISSING(REP_price ) AND
      REP_price  <                15820 THEN DO;
      _ARBFMT_20 = PUT( Modello , $20.);
       %DMNORMIP( _ARBFMT_20);
      IF _ARBFMT_20 IN ('CORSA' ,'DUSTER' ,'500L' ) THEN DO;
        _ARBFMT_20 = PUT( Modello , $20.);
         %DMNORMIP( _ARBFMT_20);
        IF _ARBFMT_20 IN ('CORSA' ,'DUSTER' ) THEN DO;
          IF  NOT MISSING(REP_price ) AND
                           15045 <= REP_price  THEN DO;
            _NODE_  =                   67;
            _LEAF_  =                   31;
            P_target101  =                  0.5;
            P_target100  =                  0.5;
            Q_target101  =                  0.5;
            Q_target100  =                  0.5;
            V_target101  =                 0.25;
            V_target100  =                 0.75;
            I_target10  = '1' ;
            U_target10  =                    1;
            END;
          ELSE DO;
            _NODE_  =                   66;
            _LEAF_  =                   30;
            P_target101  =                    1;
            P_target100  =                    0;
            Q_target101  =                    1;
            Q_target100  =                    0;
            V_target101  =                    1;
            V_target100  =                    0;
            I_target10  = '1' ;
            U_target10  =                    1;
            END;
          END;
        ELSE DO;
          _NODE_  =                   43;
          _LEAF_  =                   32;
          P_target101  =                    1;
          P_target100  =                    0;
          Q_target101  =                    1;
          Q_target100  =                    0;
          V_target101  =                    1;
          V_target100  =                    0;
          I_target10  = '1' ;
          U_target10  =                    1;
          END;
        END;
      ELSE DO;
        IF  NOT MISSING(REP_price ) AND
          REP_price  <                12550 THEN DO;
          _NODE_  =                   44;
          _LEAF_  =                   33;
          P_target101  =                 0.95;
          P_target100  =                 0.05;
          Q_target101  =                 0.95;
          Q_target100  =                 0.05;
          V_target101  =                    1;
          V_target100  =                    0;
          I_target10  = '1' ;
          U_target10  =                    1;
          END;
        ELSE DO;
          _NODE_  =                   45;
          _LEAF_  =                   34;
          P_target101  =     0.03703703703703;
          P_target100  =     0.96296296296296;
          Q_target101  =     0.03703703703703;
          Q_target100  =     0.96296296296296;
          V_target101  =     0.21052631578947;
          V_target100  =     0.78947368421052;
          I_target10  = '0' ;
          U_target10  =                    0;
          END;
        END;
      END;
    ELSE DO;
      _ARBFMT_20 = PUT( Modello , $20.);
       %DMNORMIP( _ARBFMT_20);
      IF _ARBFMT_20 IN ('CORSA' ,'DUSTER' ,'500L' ) THEN DO;
        _NODE_  =                   27;
        _LEAF_  =                   42;
        P_target101  =                    0;
        P_target100  =                    1;
        Q_target101  =                    0;
        Q_target100  =                    1;
        V_target101  =                    0;
        V_target100  =                    1;
        I_target10  = '0' ;
        U_target10  =                    0;
        END;
      ELSE DO;
        IF  NOT MISSING(REP_price ) AND
          REP_price  <                20620 THEN DO;
          IF  NOT MISSING(REP_Consumo_Carburante_Totale ) AND
                            4.15 <= REP_Consumo_Carburante_Totale  THEN DO;
            _NODE_  =                   69;
            _LEAF_  =                   36;
            P_target101  =               0.8125;
            P_target100  =               0.1875;
            Q_target101  =               0.8125;
            Q_target100  =               0.1875;
            V_target101  =     0.77419354838709;
            V_target100  =      0.2258064516129;
            I_target10  = '1' ;
            U_target10  =                    1;
            END;
          ELSE DO;
            _NODE_  =                   68;
            _LEAF_  =                   35;
            P_target101  =     0.29411764705882;
            P_target100  =     0.70588235294117;
            Q_target101  =     0.29411764705882;
            Q_target100  =     0.70588235294117;
            V_target101  =     0.16666666666666;
            V_target100  =     0.83333333333333;
            I_target10  = '0' ;
            U_target10  =                    0;
            END;
          END;
        ELSE DO;
          _ARBFMT_10 = PUT( Tipo_di_unita , $10.);
           %DMNORMIP( _ARBFMT_10);
          IF _ARBFMT_10 IN ('POSTERIORE' ) THEN DO;
            _NODE_  =                   70;
            _LEAF_  =                   37;
            P_target101  =     0.70588235294117;
            P_target100  =     0.29411764705882;
            Q_target101  =     0.70588235294117;
            Q_target100  =     0.29411764705882;
            V_target101  =     0.58333333333333;
            V_target100  =     0.41666666666666;
            I_target10  = '1' ;
            U_target10  =                    1;
            END;
          ELSE DO;
            IF  NOT MISSING(REP_Cilindrata ) AND
              REP_Cilindrata  <                 1417 THEN DO;
              _ARBFMT_17 = PUT( Alimentazione , $17.);
               %DMNORMIP( _ARBFMT_17);
              IF _ARBFMT_17 IN ('BENZINA' ) THEN DO;
                _NODE_  =                  102;
                _LEAF_  =                   38;
                P_target101  =     0.33333333333333;
                P_target100  =     0.66666666666666;
                Q_target101  =     0.33333333333333;
                Q_target100  =     0.66666666666666;
                V_target101  =                  0.2;
                V_target100  =                  0.8;
                I_target10  = '0' ;
                U_target10  =                    0;
                END;
              ELSE DO;
                _NODE_  =                  103;
                _LEAF_  =                   39;
                P_target101  =                    0;
                P_target100  =                    1;
                Q_target101  =                    0;
                Q_target100  =                    1;
                V_target101  =                    0;
                V_target100  =                    1;
                I_target10  = '0' ;
                U_target10  =                    0;
                END;
              END;
            ELSE DO;
              IF  NOT MISSING(REP_price ) AND
                REP_price  <                31850 THEN DO;
                _NODE_  =                  104;
                _LEAF_  =                   40;
                P_target101  =     0.44554455445544;
                P_target100  =     0.55445544554455;
                Q_target101  =     0.44554455445544;
                Q_target100  =     0.55445544554455;
                V_target101  =     0.47619047619047;
                V_target100  =     0.52380952380952;
                I_target10  = '0' ;
                U_target10  =                    0;
                END;
              ELSE DO;
                _NODE_  =                  105;
                _LEAF_  =                   41;
                P_target101  =     0.16981132075471;
                P_target100  =     0.83018867924528;
                Q_target101  =     0.16981132075471;
                Q_target100  =     0.83018867924528;
                V_target101  =     0.18309859154929;
                V_target100  =      0.8169014084507;
                I_target10  = '0' ;
                U_target10  =                    0;
                END;
              END;
            END;
          END;
        END;
      END;
    END;
  END;
 
****************************************************************;
******          END OF DECISION TREE SCORING CODE         ******;
****************************************************************;
 
drop _LEAF_;