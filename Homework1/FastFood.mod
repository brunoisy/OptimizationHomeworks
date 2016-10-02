set allProducts;
set nutriments;

param valNutr{allProducts, nutriments};
param prix{allProducts};
param lowerBound{nutriments};
param upperBound{nutriments};

var products{allProducts} integer >=0; # each product chosen for the menu (==1 if product is chosen)
# binary variable (?)

minimize cost: sum{a in allProducts} prix[a]*products[a];

subject to lowerBounds{n in nutriments} : sum{a in allProducts} valNutr[a,n]*products[a] >= lowerBound[n];
subject to upperBounds{n in nutriments} : sum{a in allProducts} valNutr[a,n]*products[a] <= upperBound[n];


data FastFood.dat
option solver gurobi;
solve;
display products;
display cost;
