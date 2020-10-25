*;
/*----G_Carrozzeria begin----*/
length _WARN_ $4;
label _WARN_ = 'Warnings';
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
