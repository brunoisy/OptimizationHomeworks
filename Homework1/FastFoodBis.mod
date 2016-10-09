reset;

set allProducts;
set nutriments;

param valNutr{allProducts, nutriments};
param prix{allProducts};
param lowerBound{nutriments};
param upperBound{nutriments};

var products{allProducts} integer >=0; # quantity of each product chosen for the menu
# binary variable (?)

minimize cost: sum{a in allProducts} prix[a]*products[a];

subject to lowerBounds{n in nutriments} : sum{a in allProducts} valNutr[a,n]*products[a] >= 0.8*lowerBound[n];
subject to upperBounds{n in nutriments} : sum{a in allProducts} valNutr[a,n]*products[a] <= 1.2*upperBound[n];
subject to maxProduct{a in allProducts} : products[a] <= 2;

data FastFood.dat
option solver gurobi;
solve;
display products;
display cost;