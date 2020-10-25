*;
/*----G_IMP_Cilindri begin----*/
length _WARN_ $4;
label _WARN_ = 'Warnings';
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
