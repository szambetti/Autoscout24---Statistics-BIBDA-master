* ;
*Variable: price;
* ;
Label REP_price= 'Replacement: price';
length REP_price 8;
REP_price= price;
if price eq . then REP_price = .;
else
if price<-17140.31377 then REP_price=-17140.31377;
else
if price>61735.155006 then REP_price=61735.155006;
