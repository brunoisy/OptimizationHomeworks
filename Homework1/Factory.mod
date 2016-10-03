set allProducts;
param nmonths; # remplacer par set.size(months)?
set months;
set machines;

param nMachines{machines};
param time{allProducts, machines};
param profit{allProducts};
param maintenance{months, machines} #rempli de 0,1,2...
param demand{months, allProducts};

param storageCapacity;
param storageUnitCost;
param finalStorage;

param daysAmonth;
param shiftsAday;
param hoursAshift;

set shifts = 1..shiftsAday*daysAmonth*nmonths; #a modif pr présentation?
var products{allProducts, shifts} >=0; #chaque produit doit être fini a la fin d'un shift


maximize profit: sum{a in allProducts, s in shifts} profit[a]*products[a][s];#- stockage


subject to timeLimit : 
subject to machineLimit :
subject to demandLimit :
subject to storageLimit : 
subject to finalStorageLimit :



data Factory.dat;
option solver gurobi; # cplex is another good choice for (mixed integer) linear optimization
solve;
# display...
