%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% 	Comparison of methods		%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

load('Data-Homework-2.mat')
A = data.A;
b = data.b;
lambda = data.lambda;
x0 = data.x0;

epsilon = 0.01;
fOptimal = 23.673;
normX0MinusXOptimal = 13.79;%5.4903;% ||x_0 - x^*|| 

f = @(x)norm(A*x-b)^2+lambda*norm(x,1);


times = zeros(6,1);
i=1;

%%%   	 Subgradient method 		%%%
N1 = ;
tic
subgradient(A, b, lambda, x0, N1, epsilon);
time(1) = toc;

%%%   Smoothed Gradient method 	%%%
N2 = ; % To ADD
tic
smoothedGradient(A, b, lambda, x0, N, epsilon);
time(2) = toc;


%%%   Smoothed Graident Acc method 	%%%
N3 = ; % To ADD
tic
smoothedGradientAcc(A, b, lambda, x0, N3, epsilon);
time(3) = toc;


%%%    Proximal Gradient methods 	%%%
N4 = ; % To ADD
tic
proximalGradient(A, b, lambda, x0, N, epsilon);
time(4) = toc;


%%%    Proximal Gradient Acc methods 	%%%
N5 = ; % To ADD
tic
proximalGradientAcc(A, b, lambda, x0, N, epsilon);
time(4) = toc

%%%      Interior Point Methods  	%%%
N6 = ; % To ADD
tic
IteriorPoint(A, b, lambda, x0, N, epsilon);
time(5) = toc
