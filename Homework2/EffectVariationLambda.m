load('Data-Homework-2.mat')
A = data.A;
b = data.b;
x0 = data.x0;
epsilon = 0.01;
fOptimal = 23.673;

N = 500; % default number of iterations
lambdavec = [1, 0.5, 0.1, 0.05, 0.01, 0.001];

n = length(lambdavec);

f = @(x)norm(A*x-b)^2+lambda*norm(x,1);

figure;
for i = 1:n
	lambda = lambdavec(i);
	x = proximalGradient(A, b, lambda, x0, N, epsilon);
	%[x, objs] = interiorPoint(A, b, lambda)
	fx = applyToColumns(f,x);
	semilogy(1:(N+1),fx-fOptimal) 
    hold on	
end	
title('Convergence behavior for subgradient in function of $\lambda$','Interpreter','latex','FontSize',16)
ylabel('$|f(x_k) - f(x^*)|$','Interpreter','latex','Fontsize',16)
xlabel('number of iterations k','Fontsize',16);
legend('1', '0.5','0.1','0.05','0.01','0.001');
