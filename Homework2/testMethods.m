load('Data-Homework-2.mat')
A = data.A;
b = data.b;
lambda = data.lambda;
x0 = data.x0;

N = 500;
epsilon = 0.01;
fOptimal = 23.673;
normX0MinusXOptimal = 5.4903;% ||x_0 - x^*||

f = @(x)norm(A*x-b)^2+lambda*norm(x,1);


methods = {@subgradient, @smoothedGradient, @smoothedGradientAcc, @proximalGradient, @proximalGradientAcc};
names = {' Subgradient', ' Smoothed Gradient', ' Accelerated Smoothed Gradient', ' Proximal Gradient', ' Accelerated Proximal Gradient'};

%%% we compute the theoretical upper bounds on convergence rates
n = length(x0);
G = 2*norm(A'*(A*x0-b))+sqrt(n)*lambda;
alpha = 2*epsilon/(G^2);
L = 2*normest(A'*A);
mu = epsilon/(lambda*n);
LSmoothed = L+lambda/mu;

bndSubgr = @(N)normX0MinusXOptimal^2/(2*alpha*N) + alpha*G^2/2;
bndSmoothGr = @(N)epsilon+LSmoothed*normX0MinusXOptimal^2/N;
bndSmoothGrAcc = @(N)epsilon+2*LSmoothed*normX0MinusXOptimal^2/(N+1)^2;
bndProxGr = @(N)L/(2*N)*normX0MinusXOptimal^2;
bndProxGrAcc = @(N)L/(2*N)*normX0MinusXOptimal^2;%same?
% boundInteriorPoint =
bounds = {applyToColumns(bndSubgr,1:N+1), applyToColumns(bndSmoothGr,1:N+1), applyToColumns(bndSmoothGrAcc,1:N+1), applyToColumns(bndProxGr,1:N+1), applyToColumns(bndProxGrAcc,1:N+1)};

% Plots (every method except interior point)
for i = 5%1:length(methods) 
    method = methods{i};
    x = method(A, b, lambda, x0, N, epsilon);
    fx = applyToColumns(f,x);
    figure
    semilogy(1:(N+1),fx-fOptimal) % true convergence
    hold on
    semilogy(1:(N+1),bounds{i});
    title(strcat('Convergence behavior for', names{i}),'FontSize',16)
    xlabel('number of iterations k','Fontsize',16);
    %     if (i==1) %subgradient method
    %         ylabel('$\min\limits_{0 \leki \le N} f(x^{(k)})-f(x^*)$','Interpreter','latex','Fontsize',16);
    %     else
    %         ylabel('$|f(x_k) - f(x^*)|$','Interpreter','latex','Fontsize',16);
    %     end
    legend('true convergence', 'theoretical bound on convergence');
end

% [~, fx] = interiorPoint(A, b, lambda);
% figure
% semilogy(1:length(fx),fx-fOptimal) % true convergence
% hold on
% %Plot Bound
% title('Convergence behavior for interior point','FontSize',16)
% xlabel('number of iterations k','Fontsize',16);
% legend('true convergence', 'theoretical bound on convergence');