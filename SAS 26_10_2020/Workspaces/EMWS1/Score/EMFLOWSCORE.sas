*------------------------------------------------------------*;
* Score: creazione di nomi fissi;
*------------------------------------------------------------*;
LABEL EM_SEGMENT = 'Nodo';
EM_SEGMENT = _NODE_;
LENGTH EM_EVENTPROBABILITY 8;
LABEL EM_EVENTPROBABILITY = 'Probability for level 1 of target10';
EM_EVENTPROBABILITY = P_target101;
LENGTH EM_PROBABILITY 8;
LABEL EM_PROBABILITY = 'Probability of Classification';
EM_PROBABILITY =
max(
P_target101
,
P_target100
);
LENGTH EM_CLASSIFICATION $%dmnorlen;
LABEL EM_CLASSIFICATION = "Prediction for target10";
EM_CLASSIFICATION = I_target10;
LABEL EM_CLASSTARGET = 'Target Variable: target10';
EM_CLASSTARGET = F_target10;
