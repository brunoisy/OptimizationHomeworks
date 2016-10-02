set days;
set allProducts;
set nutriments;

param valNutr{allProducts, nutriments};
param prix{allProducts};
param lowerBound{nutriments};
param upperBound{nutriments};

var products{allProducts, days} integer >=0; # quantity of each product chosen for the menu for each day

minimize cost: sum{a in allProducts, d in days} prix[a]*products[a, d];

subject to lowerBounds{n in nutriments, d in days} : sum{a in allProducts} valNutr[a,n]*products[a,d] >= lowerBound[n];
subject to upperBounds{n in nutriments, d in days} : sum{a in allProducts} valNutr[a,n]*products[a,d] <= upperBound[n];
subject to variety{a in allProducts}: sum{d in days} products[a,d] <= 3;
# each product can at most be chosen 3 times during the week (doesn't work?)

data FastFoodWeek.dat
option solver gurobi;
solve;
display products;
display cost;

