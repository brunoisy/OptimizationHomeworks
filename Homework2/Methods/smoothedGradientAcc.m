function [ x ] = smoothedGradientAcc(A, b, lambda, x0, N, epsilon)

n = length(x0);
%mu = epsilon/(lambda*n);
mu = (-lambda*n+sqrt(lambda^6*n^4-4*n*epsilon*normest(A'*A)))/(2*n*normest(A'*A));
L = 2*normest(A'*A)+lambda/mu;

h = 1/L;
gradF = makeGradSmoothedF(A, b, mu, lambda);
x = zeros(n,N+2);
x(:,1) = x0;
x(:,2) = x0;
for k = 2:N+1
    beta = (k-3)/k;
    y = x(:,k)+beta*(x(:,k)-x(:,k-1));
    x(:,k+1) = y -h*gradF(y);
end
x = x(:,2:end); % to remove x(-1)

end

