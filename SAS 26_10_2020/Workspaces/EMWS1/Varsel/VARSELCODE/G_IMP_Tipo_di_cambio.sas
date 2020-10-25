*;
/*----G_IMP_Tipo_di_cambio begin----*/
length _WARN_ $4;
label _WARN_ = 'Warnings';
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
