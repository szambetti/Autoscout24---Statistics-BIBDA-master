drop _temp_;
if (P_target101 ge 1) then do;
_temp_ = dmran(1234);
b_target10 = floor(1 + 2*_temp_);
end;
else
if (P_target101 ge 0.98181818181818) then do;
b_target10 = 3;
end;
else
if (P_target101 ge 0.97066326530612) then do;
_temp_ = dmran(1234);
b_target10 = floor(4 + 3*_temp_);
end;
else
if (P_target101 ge 0.90770609318996) then do;
b_target10 = 7;
end;
else
if (P_target101 ge 0.44554455445544) then do;
b_target10 = 8;
end;
else
if (P_target101 ge 0.18461538461538) then do;
b_target10 = 9;
end;
else
if (P_target101 ge 0.1076923076923) then do;
b_target10 = 10;
end;
else
if (P_target101 ge 0.03703703703703) then do;
b_target10 = 11;
end;
else
if (P_target101 ge 0.02145922746781) then do;
b_target10 = 12;
end;
else
do;
_temp_ = dmran(1234);
b_target10 = floor(13 + 8*_temp_);
end;
