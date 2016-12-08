function [x] = proximalGradient(A, b, lambda, x0, N, epsilon)
%PROXIMALGRADIENT Summary of this function goes here
%   Detailed explanation goes here

n = length(x0);
L = 2*max(eig(A'*A));
h = lambda/L;

	function gradf1 = gradf1(x)
		gradf1 = 2*A'*(A*x-b);
	end

for k = 1:N

end

end

