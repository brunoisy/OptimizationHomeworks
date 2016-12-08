function [gradF] = makeGradSmoothedF(A, b, lambda, mu)
%MAKEGRADSMOOTHEDF Summary of this function goes here
%   Detailed explanation goes here

    function gradFofX = newGradF(x)
        if norm(x,1) <= mu
            gradFofX = 2*A'*(A*x-b)+lambda/mu*norm(x,1);
        else
            gradFofX = 2*A'*(A*x-b)+lambda*sign(x);
        end
    end
gradF = @newGradF;
end

