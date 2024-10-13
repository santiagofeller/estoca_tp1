% Ejercicio 2 - Método de Monte Carlo para cálculo de probabilidades
clear all;
close all;

% Parámetros de la distribución normal
mu = 2;             % Media
sigma = 3;    % Desviación estándar
N = 10000;          % Número de muestras

% Calcular los intervalos
intervalo_1sigma = [mu - sqrt(sigma), mu + sqrt(sigma)];    % µ - σ < X < µ + σ
intervalo_2sigma = [mu - 2*sqrt(sigma), mu + 2*sqrt(sigma)]; % µ - 2σ < X < µ + 2σ
intervalo_3sigma = [mu - 3*sqrt(sigma), mu + 3*sqrt(sigma)]; % µ - 3σ < X < µ + 3σ

%genero las uniformes
U1 = unifrnd(intervalo_1sigma(1),intervalo_1sigma(2),1,N);
U2 = unifrnd(intervalo_2sigma(1),intervalo_2sigma(2),1,N);
U3 = unifrnd(intervalo_3sigma(1),intervalo_3sigma(2),1,N);

%calculo las probabilidades
probabilidad_a = Aintegrar(U1,intervalo_1sigma,N,mu,sigma);
probabilidad_b = Aintegrar(U2,intervalo_2sigma,N,mu,sigma);
probabilidad_c = Aintegrar(U3,intervalo_3sigma,N,mu,sigma);

% Mostrar resultados
fprintf('Probabilidad P(µ - σ < X < µ + σ): %f\n', probabilidad_a);
fprintf('Probabilidad P(µ - 2σ < X < µ + 2σ): %f\n', probabilidad_b);
fprintf('Probabilidad P(µ - 3σ < X < µ + 3σ): %f\n', probabilidad_c);

function I = Aintegrar(U,intervalo,n,mu,sigma)
    f = (1/(sqrt(2*sigma*pi)))*exp(-((U-mu).^(2))/(2*sigma));
    a = intervalo(2) - intervalo(1);
    I = a*(sum(f))/n;
end
%deb.pensacom@gmail.com