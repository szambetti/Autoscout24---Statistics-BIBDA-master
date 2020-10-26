*;
/*----G_Alimentazione begin----*/
length _WARN_ $4;
label _WARN_ = 'Warnings';
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
