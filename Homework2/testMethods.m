A = [1,2;3,4];
b = [1;2];
lambda = 0.5;
x0 = [1;2];
N = 10;
epsilon = 0.1;

x = smoothedGradient(A, b, lambda, x0, N, epsilon);
plot(1:(N+1),x)