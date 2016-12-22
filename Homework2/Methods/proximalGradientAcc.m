function [ x ] = proximalGradientAcc(A, b, lambda, x0, N, epsilon)
%PROXIMALGRADIENTACC Summary of this function goes here
%   Detailed explanation goes here


n = length(x0);
L = 2*normest(A'*A);
h = lambda/L;

	function gradf1 = gradf1(x)
		gradf1 = 2*A'*(A*x-b);
	end

x = zeros(n,N+2);
x(:,1) = x0;
x(:,2) = x0;

for k = 2:N+1
	beta = (k-3)/(k);
	y = x(:,k)+beta*(x(:,k)-x(:,k-1));
	y = y - h*gradf1(y);
	for j=1:n
		if(y(j,1)>h)
			x(j,k+1) = y(j,1) - h;
		elseif(y(j,1)<-h)
			x(j,k+1) = y(j,1) + h;
		else
			x(j,k+1) = 0;
		end
	end
end

x = x(:,2:end);

end

