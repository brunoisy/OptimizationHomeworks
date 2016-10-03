set allProducts;
set periods;
set machines;
param nMachines{machines};
param time{allProducts, machines};
param profit{allProducts};
set maintenance{periods} within machines; # a maintenance is a set of machines +number!!
# ou set maintenance{periods, machines} rempli de 1 et 0 --> mieux!!
param limit{allProducts, periods};

param storage_capacity;
param storage_unit_cost;
param daysAweek;
param shiftsAday;
param hoursAshift;


var products{allProducts} >=0;
var ;

maximize profit: