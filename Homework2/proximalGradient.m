function [x] = proximalGradient(A, b, lambda, x0, N, epsilon)
%PROXIMALGRADIENT Summary of this function goes here
%   Detailed explanation goes here

n = length(x0);
L = 2*max(eig(A'*A));
h = lambda/L;

	function gradf1 = gradf1(x)
		gradf1 = 2*A'*(A*x-b);
	end

x = zeros(n,N+1);
x(:,1) = x0;

for k = 1:N
	x(:,k+1) = x(:,k) - h * gradf1(x(:,k));
	for j=1:n
		if(x(j,k+1)>h)
			x(j,k+1) = x(j,k+1) - h;
		elseif(x(j,k+1)<-h)
			x(j,k+1) = x(j,k+1) + h;
		else
			x(j,k+1) = 0;
		end
	end
end

end

