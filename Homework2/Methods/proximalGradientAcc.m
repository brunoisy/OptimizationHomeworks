function [ x ] = proximalGradientAcc(A, b, lambda, x0, N, epsilon)
%PROXIMALGRADIENTACC Summary of this function goes here
%   Detailed explanation goes here


n = length(x0);
L = 2*normest(A'*A);
gradf1 = @(x) 2*A'*(A*x-b);
    function [y] = prox(x)%vectoriser?
        y=zeros(1,length(x));
        for i=1:length(x)
            if x(i) >lambda/L
                y(i) = x(i)-lambda/L;
            elseif abs(x(i)) <= lambda/L;
                y(i) = 0;
            else
                y(i) = x(i)+lambda/L;
            end
        end
    end

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