function [x] = proximalGradient(A, b, lambda, x0, N, epsilon)
%PROXIMALGRADIENT Summary of this function goes here
%   Detailed explanation goes here

n = length(x0);
L = 2*normest(A'*A);
h = 1/L; %lambda/L?
gradf1 = @(x)2*A'*(A*x-b);
prox = @(x) x+1/L*sign(x-1/L);

x = zeros(n,N+1);
x(:,1) = x0;
for k = 1:N
	x(:,k+1) = prox(x(:,k) - h * gradf1(x(:,k)));
end

end

