function [gradF] = makeGradSmoothedF(A, b, mu, lambda)
%MAKEGRADSMOOTHEDF Summary of this function goes here
%   Detailed explanation goes here

    function y = gradH(x)
        if x <= mu 
            y=x/mu;
        else
            y=sign(x);
        end
    end

    function gradFofX = newGradF(x)
        n = length(x);
        gradHn = zeros(1,n);
        for i=1:n
            gradHn(i) = gradH(x(i));
        end
        gradFofX = 2*A'*(A*x-b)+lambda*gradHn;
    end
gradF = @newGradF;
end

