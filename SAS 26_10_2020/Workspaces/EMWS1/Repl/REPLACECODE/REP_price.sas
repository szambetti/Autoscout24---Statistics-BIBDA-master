* ;
*Variable: price;
* ;
Label REP_price= 'Replacement: price';
length REP_price 8;
REP_price= price;
if price eq . then REP_price = .;
else
if price<-17259.44298 then REP_price=-17259.44298;
else
if price>61906.145486 then REP_price=61906.145486;
