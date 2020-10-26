*;
/*----G_IMP_Marce begin----*/
length _WARN_ $4;
label _WARN_ = 'Warnings';
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
