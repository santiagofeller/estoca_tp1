% Ejercicio 2 - Método de Monte Carlo para cálculo de probabilidades
clear all;
close all;

% Parámetros de la distribución normal
mu = 2;             % Media
sigma = 3;    % Desviación estándar
N = [10,100,1000,10000,100000,1000000];       % Número de muestras

% Calcular los intervalos
intervalo_1sigma = [mu - sqrt(sigma), mu + sqrt(sigma)];    % µ - σ < X < µ + σ

%genero las uniformes
U1 = unifrnd(intervalo_1sigma(1),intervalo_1sigma(2),1,N(1));
U2 = unifrnd(intervalo_1sigma(1),intervalo_1sigma(2),1,N(2));
U3 = unifrnd(intervalo_1sigma(1),intervalo_1sigma(2),1,N(3));
U4 = unifrnd(intervalo_1sigma(1),intervalo_1sigma(2),1,N(4));
U5 = unifrnd(intervalo_1sigma(1),intervalo_1sigma(2),1,N(5));
U6 = unifrnd(intervalo_1sigma(1),intervalo_1sigma(2),1,N(6));


A1 = Aintegrar(U1,intervalo_1sigma,N(1),mu,sigma);
A2 = Aintegrar(U2,intervalo_1sigma,N(2),mu,sigma);
A3 = Aintegrar(U3,intervalo_1sigma,N(3),mu,sigma);
A4 = Aintegrar(U4,intervalo_1sigma,N(4),mu,sigma);
A5 = Aintegrar(U5,intervalo_1sigma,N(5),mu,sigma);
A6 = Aintegrar(U6,intervalo_1sigma,N(6),mu,sigma);

A = [A1,A2,A3,A4,A5,A6];

% Mostrar resultados
for i = 1:length(N)
    fprintf('Probabilidad P(µ - σ < X < µ + σ) con N =%d: %f\n',N(i), A(i));
end


MSE1 = errorCuadraticoMedio(U1,intervalo_1sigma,N(1),mu,sigma);
MSE2 = errorCuadraticoMedio(U2,intervalo_1sigma,N(2),mu,sigma);
MSE3 = errorCuadraticoMedio(U3,intervalo_1sigma,N(3),mu,sigma);
MSE4 = errorCuadraticoMedio(U4,intervalo_1sigma,N(4),mu,sigma);
MSE5 = errorCuadraticoMedio(U5,intervalo_1sigma,N(5),mu,sigma);
MSE6 = errorCuadraticoMedio(U6,intervalo_1sigma,N(6),mu,sigma);


function MSE = errorCuadraticoMedio(U,intervalo,n,mu,sigma)
    MSE = 0;
    for k = 1:50
        MSE = MSE + (Aintegrar(U,intervalo,n,mu,sigma)-0.682687273250961)^2;
    end
    MSE = MSE/50;
end


function I = Aintegrar(U,intervalo,n,mu,sigma)
    f = (1/(sqrt(2*sigma*pi)))*exp(-((U-mu).^(2))/(2*sigma));
    a = intervalo(2) - intervalo(1);
    I = a*(sum(f))/n;
end


%deb.pensacom@gmail.com