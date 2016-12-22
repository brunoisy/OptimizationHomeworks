load('Data-Homework-2.mat')
A = data.A;
b = data.b;
lambda = data.lambda;
x0 = data.x0;

N = 500;
epsilon = 0.01;
xOptimal = 0;% to change!
fOptimal = 23.7;% to change!

f = @(x)norm(A*x-b)^2+lambda*norm(x,1);

methods = {@proximalGradientAcc};
%methods = {@subgradient, @smoothedGradient, @smoothedGradientAcc, @smoothedGradientAcc, @proximalGradient, @proximalGradientAcc, @interiorPoint};
names = {'Subgradient', 'Smoothed Gradient', 'Accelerated Smoothed Gradient', 'Proximal Gradient', 'Accelerated Proximal Gradient', 'Interior Point'};


% G = ***;% ??
% alpha = 2*epsilon/(G^2);
% LSmoothed = 2*norm(eigs(A'*A,1))+lambda/epsilon;
%  
% boundSubgradient = @(N)norm(x0 - xOptimal)^2/(2*alpha*N) + alpha*G^2/2;
% boundSmoothedGradient = @(N)epsilon+LSmoothed*norm(x0-xOptimal)^2/N;
% boundSmoothedGradientAcc = @(N)lambda*mu*N+2*L*norm(x0-xOptimal)^2/(N+1)^2;
% boundProximalGradient = 
% boundProximalGradientAcc =
% boundInteriorPoint = 
% bounds = {@boundSubgradient, @boundSmoothedGradient, @boundSmoothedGradientAcc, @boundProximalGradient, @boundProximalGradientAcc, @boundInteriorPoint};

% Plots
for i = 1:length(methods)
    method = methods{i};
    x = method(A, b, lambda, x0, N, epsilon);
    size(x)
    fx = applyToColumns(f,x);
    figure
    plot(1:(N+1),fx)
    %semilogy(1:(N+1),fx-fOptimal) % true convergence.
    hold on
    title(strcat('Convergence behavior for ', names{i}),'FontSize',16)
    xlabel('number of iterations k','Fontsize',16);
%     if (i==1) %subgradient method
%         ylabel('$\min\limits_{0 \leki \le N} f(x^{(k)})-f(x^*)$','Interpreter','latex','Fontsize',16);
%     else
%         ylabel('$|f(x_k) - f(x^*)|$','Interpreter','latex','Fontsize',16);
%     end
    legend('true convergence', 'theoretical convergence');
end

