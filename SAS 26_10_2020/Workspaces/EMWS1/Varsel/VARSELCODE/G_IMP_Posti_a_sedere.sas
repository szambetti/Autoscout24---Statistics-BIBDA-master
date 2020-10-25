/*----G_IMP_Posti_a_sedere begin----*/
length _WARN_ $4;
label _WARN_ = 'Warnings';
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
