A = [1,2;3,4];
b = [1;2];
lambda = 0.5;
x0 = [1;2];
N = 10;
epsilon = 0.1;

f = @(x)norm(A*x-b)^2+lambda*norm(x,1);

x = smoothedGradient(A, b, lambda, x0, N, epsilon);

fx = zeros(1,N+1);
for i=1:(N+1)
    fx(i) = f(x(:,i));
end
plot(1:(N+1),fx)

