function [ x ] = interiorPoint(A, b, lambda)
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here

[m,n] = size(A);
Atilde = [zeros(m,n),          A, zeros(m,n), zeros(m,n),  -eye(m,m), zeros(m,1), zeros(m,1);
	  zeros(1,n), zeros(1,n), zeros(1,n), zeros(1,n), zeros(1,m),          1,          1;
	   -eye(n,n),  -eye(n,n),   eye(n,n), zeros(n,n), zeros(n,m), zeros(n,1), zeros(n,1);
	    eye(n,n),  -eye(n,n), zeros(n,n),  -eye(n,n), zeros(n,m), zeros(n,1), zeros(n,1)];
btilde = [b; 1; zeros(n,1); zeros(n,1)];
ctilde = [lambda*ones(1,n), zeros(1,n), zeros(1,n), zeros(1,n), zeros(1,m), 0, 1];

K.f = 2*n;
K.l = 2*n;
K.q = m+2;
[x,y,info]=sedumi(A, b, K);

if info.pinf ~= 0 && info.dinf ~=0
    disp(['caca');
    E = []; 
else
    disp(['Solution is' : x);
end
end

