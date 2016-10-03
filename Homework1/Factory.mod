reset;

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
param finalStorage;

set days;
set weeks;
param nShifts;
set shiftsAday = 1..nShifts;
param hoursAshift;

set shifts{shiftsAday, days, weeks, months};
var products{allProducts, shifts} >=0; #chaque produit doit être fini a la fin d'un shift


maximize profitTotal: sum{a in allProducts, s in shifts} profit[a]*products[a][s];#- stockage


subject to timeLimit {s in shifts} : 
			sum{a in allProducts, m in machines} time[products[a,s],m] <= hoursAshift;
subject to timeMachineLimit {d in days, m in months, s in shiftsAday, w in weeks, ma in machines}:
			sum{a in allproducts} time[products[a,shifts[s,d,w,m]],ma]<=(nMachines[ma]-maintenance[m,ma])*hoursAshift;
#subject to demandLimit :
#subject to storageLimit : 
#subject to finalStorageLimit :



data Factory.dat;
option solver gurobi; # cplex is another good choice for (mixed integer) linear optimization
solve;
# display...
