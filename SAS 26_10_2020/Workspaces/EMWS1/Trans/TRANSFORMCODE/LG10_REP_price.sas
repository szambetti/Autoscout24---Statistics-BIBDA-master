label LG10_REP_price = 'Transformed: Replacement: price';
length LG10_REP_price 8;
if REP_price eq . then LG10_REP_price = .;
else do;
if REP_price + 1 > 0 then LG10_REP_price = log10(REP_price + 1);
else LG10_REP_price = .;
end;
