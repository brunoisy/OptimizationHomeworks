reset;

set allProducts;
set months;
set machines;

param nMachines{machines};
param time{allProducts, machines};
param profit{allProducts};
param maintenance{months, machines};
param demand{months, allProducts};

param storageCapacity;
param storageUnitCost;
param initStorage :=0;
param finalStorage;

set days;
set weeks;
param nShifts;
set shiftsAday = 1..nShifts;
param hoursAshift;


#set shifts{shiftsAday, days, weeks, months};
var production{allProducts, shiftsAday, days, weeks, months} integer >=0; #chaque produit doit 
var storage{allProducts, months} integer >=0, <=storageCapacity;# quantity of each type of product in storage at end of month
var sales{a in allProducts, m in months} integer >=0, <=demand[m,a]; #quantity of each type sold at each end of month




maximize profitTotal: sum{a in allProducts, d in days, m in months, s in shiftsAday, w in weeks} profit[a]*production[a,s,d,w,m] - storageUnitCost*sum{a in allProducts, m in months}storage[a,m];



subject to timeLimit {d in days, m in months, s in shiftsAday, w in weeks} : 
			sum{a in allProducts, ma in machines} time[production[a,s,d,w,m],ma] <= hoursAshift;
subject to timeMachineLimit {d in days, m in months, s in shiftsAday, w in weeks, ma in machines}:
			sum{a in allProducts} time[production[a,s,d,w,m],ma]<=(nMachines[ma]-maintenance[m,ma])*hoursAshift;

subject to flux{a in allProducts, m in months} : 
	sum{s in shiftsAday, d in days, w in weeks} production[a,[s,d,w,m]]-sales[a,m]==storage[a,m]-storage[a,m-1];#!?
#problème premier mois! problème écriture shift [s,d,w,m]?

subject to initStorage :

subject to finalStorage{a in allProducts} : storage[a,LASTMONTH] == finalStorage;




data Factory.dat;
option solver gurobi; # cplex is another good choice for (mixed integer) linear optimization
solve;
# display...