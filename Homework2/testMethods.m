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
fx = zeros(1,N+1);
for i=1:(N+1)% NOT CLEAN
    fx(i) = f(x(:,i));
end
figure
hold on
plot(1:(N+1),fx-fOptimal) % true convergence
L = 2*max(eig(A'*A))+lambda/epsilon;
bound = @(N)epsilon+L*norm(x0-xOptimal)^2/N; % theoretical convergence
plot(1:(N+1), bound(