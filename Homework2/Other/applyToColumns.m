function [Y] = applyToColumns(f, X)
%APPLYTOCOLUMNS Summary of this function goes here
%   Detailed explanation goes here

Y = zeros(size(X,1),size(X,2));
for i = 1:size(X,2)
    Y(i) = f(X(:,i));
end


end

