if ROLE in('INPUT', 'REJECTED') then do;
if upcase(NAME) in(
'MODELLO'
) then ROLE='INPUT';
else do;
ROLE='REJECTED';
COMMENT = "Reg3: Rifiutata utilizzando la selezione stepwise";
end;
end;
