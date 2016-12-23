function y = huberFun(X)
%	huberFunction 
% it computes Huber function for X
%
% INPUT :
%	- X 
%
% OUTPUT :
%	- Y : the huber function for all X

lambda = 1;
mu = 5;

function y2 = huberFun1D(x)
    if x <= mu 
    y2 = lambda*x^2/(2*mu);   
    else
    y2 = lambda*(abs(x)-mu/2);
    end
end

y = 0;
for x = X'
    y = y + huberFun1D(x);
end

end
