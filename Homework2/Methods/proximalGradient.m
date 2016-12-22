function [x] = proximalGradient(A, b, lambda, x0, N, epsilon)
%PROXIMALGRADIENT Summary of this function goes here
%   Detailed explanation goes here

n = length(x0);
L = 2*normest(A'*A);
gradf1 = @(x) 2*A'*(A*x-b);
prox = @(x) x-lambda/L*sign(x-lambda/L);

x = zeros(n,N+1);
x(:,1) = x0;
for k = 1:N
	x(:,k+1) = prox(x(:,k) - 1/L * gradf1(x(:,k)));
end

end

