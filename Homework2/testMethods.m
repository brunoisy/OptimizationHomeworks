A = [1,2;3,4];
b = [1;2];
lambda = 0.5;
x0 = [1;2];
N = 10;
epsilon = 0.1;
xOptimal = ;
fOptimal = ;

f = @(x)norm(A*x-b)^2+lambda*norm(x,1);


%%% smoothed gradient
x = smoothedGradient(A, b, lambda, x0, N, epsilon);
fx = applyToColumns(f,x);
figure
hold on
plot(1:(N+1),fx-fOptimal) % true convergence

L = 2*norm(eigs(A'*A,1))+lambda/epsilon;
bound = @(N)epsilon+L*norm(x0-xOptimal)^2/N; 
boundN = applyToColumns(bound,1:(N+1));
plot(1:(N+1),boundN);% theoretical convergence