if ROLE in('INPUT', 'REJECTED') then do;
if upcase(NAME) in(
'ALIMENTAZIONE'
'IMP_CLASSE_EMISSIONI'
'IMP_COLORE_ESTERNO'
'IMP_TIPO_DI_CAMBIO'
'IMP_TIPO_DI_UNITA'
'MODELLO'
'OPT_IMP_REP_CONSUMO_CARBURANTE_T'
'TAGLIANDI_CERTIFICATI'
'USATO_GARANTITO'
'VEICOLO_PER_NON_FUMATORI'
) then ROLE='INPUT';
else do;
ROLE='REJECTED';
COMMENT = "Reg2: Rifiutata utilizzando la selezione all'indietro";
end;
end;
