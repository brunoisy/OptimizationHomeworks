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

%%%   	 Subgradient methods 		%%%
N = ; % To ADD
subgradient(A, b, lambda, x0, N, epsilon);
