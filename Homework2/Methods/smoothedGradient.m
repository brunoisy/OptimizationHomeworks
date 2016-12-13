function [ x ] = smoothedGradient(A, b, lambda, x0, N, epsilon)

n = length(x0);
mu = epsilon/(lambda*n);
L = 2*max(eig(A'*A))+1/mu;

h = 1/L;
gradF = makeGradSmoothedF(A, b, mu);
x = zeros(n,N+1);
x(:,1) = x0;
for i = 1:N
    x(:,i+1) = x(:,i) - h*gradF(x(:,i));
end

end

