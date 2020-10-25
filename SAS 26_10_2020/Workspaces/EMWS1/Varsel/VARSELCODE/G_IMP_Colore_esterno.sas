*;
/*----G_IMP_Colore_esterno begin----*/
length _WARN_ $4;
label _WARN_ = 'Warnings';
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
