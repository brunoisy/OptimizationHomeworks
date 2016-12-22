function [xopt, objs, times] = ac_newton(A, c, eps)
% minimize -log(1-||x||)2) + sum_i -log(ci-ai^Tx) 
% Examples
% ac_newton([-1 0;0 -1;1 1]', [3;1;1], 1e-6)
% m=100;n=1000;A=randn(m,n); c=0.9*ones(n,1);[xopt, objs, times] = ac_newton(A, c, 1e-12)

tic;
tau = 1/sqrt(2);
deltafinal = sqrt(2*eps);
maxiter = 100;

[m, n] = size(A);
x = zeros(m, 1); f = -sum(log(c));

k = 0; 
while k < maxiter
    k = k+1; 
    s = c-A'*x; 
    grad = A*diag(s.^(-1))*ones(n,1)     + 2*x/(1-x'*x);
    Hess = A*diag(s.^(-2))*A'            + 4*x*x'/(1-x'*x)^2 + 2*eye(m)/(1-x'*x);
    newton = -Hess\grad;

    delta = sqrt(-grad'*newton);

    if delta < deltafinal
       break;
    end

    if delta>=tau
       alpha = 1/(1+delta);
    else
       alpha = 1;
    end

    x = x + alpha*newton;
   
    oldf = f; f = -log(1-x'*x)-sum(log(c-A'*x));
    objs(k) = f;
    disp(sprintf('It %2d:  f=%8.5f | delta=%5.3f | alpha=%5.3f | dec=%5.3f', k, oldf, delta, alpha, oldf-f));
    times(k) = toc;
end
xopt = x;

clf;
opt = objs(end);
semilogy(times, objs-opt, 'ro-')
hold on; 
ax = axis; shift = (ax(2)-ax(1))/250;
for it=1:3:length(times)
    text(times(it)+shift, objs(it)-opt, num2str(it), 'Color', 'r', 'FontSize', 10);
end

legend('(damped) Newton');
grid on;
hold off;
figure(gcf)


end


