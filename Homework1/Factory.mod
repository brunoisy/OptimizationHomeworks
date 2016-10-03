reset;# deplacable?

set allProducts;
set months;
set machines;

param nMachines{machines};
param time{allProducts, machines};
param profit{allProducts};
param maintenance{months, machines}; #rempli de 0,1,2...
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

set shifts{shiftsAday, days, weeks, months};
var production{allProducts, shifts} integer >=0; #chaque produit doit être fini a la fin d'un shift
var storage{allProducts, months} integer >=0, <=storageCapacity;# quantity of each type of product in storage at end of month
var sales{a in allProducts, m in months} integer >=0, <=demand[m,a]; #quantity of each type sold at each end of month




maximize profitTotal: sum{a in allProducts, s in shifts} profit[a]*products[a,s] - storageUnitCost*sum{a in allProducts, m in months}storage[a,m];


subject to timeLimit {s in shifts} : 
			sum{a in allProducts, m in machines} time[production[a,s],m] <= hoursAshift;

subject to timeMachineLimit {d in days, m in months, s in shiftsAday, w in weeks, ma in machines}:
			sum{a in allProducts} time[production[a,shifts[s,d,w,m]],ma]<=(nMachines[ma]-maintenance[m,ma])*hoursAshift;

subject to flux{a in allProducts, m in months} : 
	sum{s in shiftsAday, d in days, w in weeks} production[a,[s,d,w,m]]-sales[a,[s,d,w,m]]==storage[a,[s,d,w,m]]-storage[a,[s,d,w,m-1]];#!?
#problème premier/dernier mois! problème écriture shift [s,d,w,m]?

subject to initStorage :

subject to finalStorage{a in allProducts} : storage[a,LASTMONTH] == finalStorage;



data Factory.dat;
option solver gurobi; # cplex is another good choice for (mixed integer) linear optimization
solve;
# display...
