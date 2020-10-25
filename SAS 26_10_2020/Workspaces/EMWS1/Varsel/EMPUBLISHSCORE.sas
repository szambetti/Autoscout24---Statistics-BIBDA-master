******************************************;
*** Begin Scoring Code from PROC DMINE ***;
******************************************;

length _WARN_ $ 4;
label _WARN_ = "Avvertimenti";


/*----G_IMP_Posti_a_sedere begin----*/
length _NORM12 $ 12;
_NORM12 = put( IMP_Posti_a_sedere , BEST12. );
%DMNORMIP( _NORM12 )
drop _NORM12;
select(_NORM12);
  when('2' ) G_IMP_Posti_a_sedere = 0;
  when('3' ) G_IMP_Posti_a_sedere = 2;
  when('4' ) G_IMP_Posti_a_sedere = 2;
  when('5' ) G_IMP_Posti_a_sedere = 1;
  when('6' ) G_IMP_Posti_a_sedere = 2;
  when('7' ) G_IMP_Posti_a_sedere = 1;
  when('8' ) G_IMP_Posti_a_sedere = 2;
  when('9' ) G_IMP_Posti_a_sedere = 1;
  otherwise substr(_WARN_, 2, 1) = 'U'; 
end;
label G_IMP_Posti_a_sedere="Grouped Levels for  IMP_Posti_a_sedere";
/*----IMP_Posti_a_sedere end----*/

/*----G_Alimentazione begin----*/
length _NORM17 $ 17;
_NORM17 = put( Alimentazione , $17. );
%DMNORMIP( _NORM17 )
drop _NORM17;
select(_NORM17);
  when('BENZINA' ) G_Alimentazione = 0;
  when('DIESEL' ) G_Alimentazione = 1;
  when('ELETTRICA' ) G_Alimentazione = 3;
  when('ELETTRICA/BENZINA' ) G_Alimentazione = 3;
  when('GPL' ) G_Alimentazione = 2;
  when('METANO' ) G_Alimentazione = 0;
  otherwise substr(_WARN_, 2, 1) = 'U'; 
end;
label G_Alimentazione="Grouped Levels for  Alimentazione";
/*----Alimentazione end----*/

/*----G_Carrozzeria begin----*/
length _NORM23 $ 23;
_NORM23 = put( Carrozzeria , $23. );
%DMNORMIP( _NORM23 )
drop _NORM23;
select(_NORM23);
  when('ALTRO' ) G_Carrozzeria = 1;
  when('BERLINA' ) G_Carrozzeria = 2;
  when('CABRIO' ) G_Carrozzeria = 0;
  when('CITY CAR' ) G_Carrozzeria = 3;
  when('434F5550C383C2A9'x ) G_Carrozzeria = 0;
  when('MONOVOLUME' ) G_Carrozzeria = 1;
  when('SUV/FUORISTRADA/PICK-UP' ) G_Carrozzeria = 1;
  when('STATION WAGON' ) G_Carrozzeria = 0;
  otherwise substr(_WARN_, 2, 1) = 'U'; 
end;
label G_Carrozzeria="Grouped Levels for  Carrozzeria";
/*----Carrozzeria end----*/

/*----G_IMP_Marce begin----*/
length _NORM12 $ 12;
_NORM12 = put( IMP_Marce , BEST. );
%DMNORMIP( _NORM12 )
drop _NORM12;
select(_NORM12);
  when('1' ) G_IMP_Marce = 4;
  when('4' ) G_IMP_Marce = 4;
  when('5' ) G_IMP_Marce = 3;
  when('6' ) G_IMP_Marce = 1;
  when('7' ) G_IMP_Marce = 0;
  when('8' ) G_IMP_Marce = 2;
  when('9' ) G_IMP_Marce = 1;
  otherwise substr(_WARN_, 2, 1) = 'U'; 
end;
label G_IMP_Marce="Grouped Levels for  IMP_Marce";
/*----IMP_Marce end----*/

/*----G_IMP_Cilindri begin----*/
length _NORM12 $ 12;
_NORM12 = put( IMP_Cilindri , BEST. );
%DMNORMIP( _NORM12 )
drop _NORM12;
select(_NORM12);
  when('0' ) G_IMP_Cilindri = 2;
  when('1' ) G_IMP_Cilindri = 2;
  when('2' ) G_IMP_Cilindri = 3;
  when('3' ) G_IMP_Cilindri = 1;
  when('4' ) G_IMP_Cilindri = 0;
  when('5' ) G_IMP_Cilindri = 3;
  when('6' ) G_IMP_Cilindri = 1;
  when('8' ) G_IMP_Cilindri = 3;
  otherwise substr(_WARN_, 2, 1) = 'U'; 
end;
label G_IMP_Cilindri="Grouped Levels for  IMP_Cilindri";
/*----IMP_Cilindri end----*/

/*----G_IMP_Colore_esterno begin----*/
length _NORM11 $ 11;
%DMNORMCP( IMP_Colore_esterno , _NORM11 )
drop _NORM11;
select(_NORM11);
  when('ARANCIONE' ) G_IMP_Colore_esterno = 0;
  when('ARGENTO' ) G_IMP_Colore_esterno = 0;
  when('BEIGE' ) G_IMP_Colore_esterno = 1;
  when('BIANCO' ) G_IMP_Colore_esterno = 2;
  when('BLU/AZZURRO' ) G_IMP_Colore_esterno = 3;
  when('BRONZO' ) G_IMP_Colore_esterno = 0;
  when('GIALLO' ) G_IMP_Colore_esterno = 5;
  when('GRIGIO' ) G_IMP_Colore_esterno = 2;
  when('LILLA' ) G_IMP_Colore_esterno = 5;
  when('MARRONE' ) G_IMP_Colore_esterno = 3;
  when('NERO' ) G_IMP_Colore_esterno = 1;
  when('ORO' ) G_IMP_Colore_esterno = 5;
  when('ROSSO' ) G_IMP_Colore_esterno = 3;
  when('VERDE' ) G_IMP_Colore_esterno = 4;
  otherwise substr(_WARN_, 2, 1) = 'U'; 
end;
label G_IMP_Colore_esterno="Grouped Levels for  IMP_Colore_esterno";
/*----IMP_Colore_esterno end----*/

/*----G_IMP_Tipo_di_cambio begin----*/
length _NORM14 $ 14;
%DMNORMCP( IMP_Tipo_di_cambio , _NORM14 )
drop _NORM14;
select(_NORM14);
  when('AUTOMATICO' ) G_IMP_Tipo_di_cambio = 0;
  when('MANUALE' ) G_IMP_Tipo_di_cambio = 1;
  when('SEMIAUTOMATICO' ) G_IMP_Tipo_di_cambio = 1;
  otherwise substr(_WARN_, 2, 1) = 'U'; 
end;
label G_IMP_Tipo_di_cambio="Grouped Levels for  IMP_Tipo_di_cambio";
/*----IMP_Tipo_di_cambio end----*/


****************************************;
*** End Scoring Code from PROC DMINE ***;
****************************************;
