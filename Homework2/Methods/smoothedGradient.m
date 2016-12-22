function [ x ] = smoothedGradient(A, b, lambda, x0, N, epsilon)

n = length(x0);
mu = epsilon/(lambda*n);
L = 2*normest(A'*A)+lambda/mu;

h = 1/L;
gradF = makeGradSmoothedF(A, b, mu, lambda);
x = zeros(n,N+1);
x(:,1) = x0;
for i = 1:N
    x(:,i+1) = x(:,i) - h*gradF(x(:,i));
end

end

