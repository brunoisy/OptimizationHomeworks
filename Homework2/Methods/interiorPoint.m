function [ x, z ] = interiorPoint(A, b, lambda)
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here

[m,n] = size(A);
Atilde = [zeros(m,n),          A, zeros(m,n), zeros(m,n), zeros(m,1), zeros(m,1),  -eye(m,m);
	  zeros(1,n), zeros(1,n), zeros(1,n), zeros(1,n),          1,          0, zeros(1,m);
	   -eye(n,n),  -eye(n,n),   eye(n,n), zeros(n,n), zeros(n,1), zeros(n,1), zeros(n,m);
	    eye(n,n),  -eye(n,n), zeros(n,n),  -eye(n,n), zeros(n,1), zeros(n,1), zeros(n,m)];
btilde = [b; 1/2; zeros(n,1); zeros(n,1)];
ctilde = [lambda*ones(1,n), zeros(1,n), zeros(1,n), zeros(1,n), 0, 1, zeros(1,m)];

K.f = 2*n;
K.l = 2*n;
K.r = m+2;
[x,y,info]=sedumi_objs(Atilde, btilde, ctilde, K);

z = ctilde*x;

x = x(n+1:2*n);
 
end

