%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% 	Comparison of methods		%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

time = zeros(6,1);
i=1;

%%%   	 Subgradient methods 		%%%
N = ; % To ADD
t = cputime
subgradient(A, b, lambda, x0, N, epsilon);
time(i,1) = cputime-t;
i=i+1;

%%%   Smoothed Gradient methods 	%%%
N = ; % To ADD
t = cputime
smoothedGradient(A, b, lambda, x0, N, epsilon);
time(i,1) = cputime-t;
i=i+1;

%%%   Smoothed Graident Acc methods 	%%%
N = ; % To ADD
t = cputime
smoothedGradientAcc(A, b, lambda, x0, N, epsilon);
time(i,1) = cputime-t;
i=i+1;

%%%    Proximal Gradient methods 	%%%
N = ; % To ADD
t = cputime
proximalGradient(A, b, lambda, x0, N, epsilon);
time(i,1) = cputime-t;
i=i+1;

%%%    Proximal Gradient Acc methods 	%%%
N = ; % To ADD
t = cputime
proximalGradientAcc(A, b, lambda, x0, N, epsilon);
time(i,1) = cputime-t;
i=i+1;

%%%      Interior Point Methods  	%%%
N = ; % To ADD
t = cputime
IteriorPoint(A, b, lambda, x0, N, epsilon);
time(i,1) = cputime-t;
i=i+1;