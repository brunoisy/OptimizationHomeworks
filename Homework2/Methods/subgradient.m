function [ x ] = subgradient(A, b, lambda, x0, N, epsilon)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here

n= length(x0);
G = 2*norm(A'*(A*x0-b))+sqrt(n)*lambda;
alpha = epsilon/(G^2);

x = zeros(n,N+1);
x(:,1) = x0;

for k = 1:N
	g = 2*A'*(A*x(:,k)-b)+sign(x(:,k))*lambda;
	x(:,k+1) = x(:,k)-alpha*g;
end

end

