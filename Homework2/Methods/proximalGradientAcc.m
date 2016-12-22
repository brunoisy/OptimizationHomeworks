function [ x ] = proximalGradientAcc(A, b, lambda, x0, N, epsilon)
%PROXIMALGRADIENTACC Summary of this function goes here
%   Detailed explanation goes here


n = length(x0);
L = 2*normest(A'*A);
gradf1 = @(x) 2*A'*(A*x-b);
prox = @(x) x-lambda/L*sign(x-lambda/L);

x = zeros(n,N+2);
x(:,1) = x0;
x(:,2) = x0;
for k = 2:N+1
	beta = (k-3)/(k);
	y = x(:,k)+beta*(x(:,k)-x(:,k-1));
	x(:,k+1) = prox(y - 1/L*gradf1(y));
end

x = x(:,2:end);

end

