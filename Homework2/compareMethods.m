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
normX0MinusXOptimal = 13.79;%||x_0 - x^*|| 

f = @(x)norm(A*x-b)^2+lambda*norm(x,1);


times = zeros(6,1);

% %%%   	 Subgradient method 		%%%
% N1 = 328974;
% tic
% subgradient(A, b, lambda, x0, N1, epsilon);
% times(1) = toc;

%%%   Smoothed Gradient method 	%%%
N2 = 14476; % To ADD
tic
smoothedGradient(A, b, lambda, x0, N, epsilon);
times(2) = toc;


%%%   Smoothed Graident Acc method 	%%%
N3 = 511; % To ADD
tic
smoothedGradientAcc(A, b, lambda, x0, N3, epsilon);
times(3) = toc;


%%%    Proximal Gradient methods 	%%%
N4 = 54; % To ADD
tic
proximalGradient(A, b, lambda, x0, N, epsilon);
times(4) = toc;


%%%    Proximal Gradient Acc methods 	%%%
N5 = 21; % To ADD
tic
proximalGradientAcc(A, b, lambda, x0, N, epsilon);
times(5) = toc;

% %%%      Interior Point Methods  	%%%
% N6 = ; % To ADD
% tic
% IteriorPoint(A, b, lambda, x0, N, epsilon);
% time(5) = toc;

bar(times)
% names = ['Subgradient', 'Smoothed Gradient', 'Accelerated Smoothed Gradient', 'Proximal Gradient', 'Accelerated Proximal Gradient' ];
% bar(times, names)
title('time to convergence for epsilon = 0.01')