% Ejercicio 2 - Método de Monte Carlo para cálculo de probabilidades
clear all;
close all;

% Parámetros de la distribución normal
mu = 2;             % Media
sigma = sqrt(3);    % Desviación estándar
N = 10000;          % Número de muestras

U = randn(1, N);

% Generar N muestras de la distribución normal N(2, sqrt(3))
X = mu + sigma * U;

% Calcular los intervalos
intervalo_1sigma = [mu - sigma, mu + sigma];    % µ - σ < X < µ + σ
intervalo_2sigma = [mu - 2*sigma, mu + 2*sigma]; % µ - 2σ < X < µ + 2σ
intervalo_3sigma = [mu - 3*sigma, mu + 3*sigma]; % µ - 3σ < X < µ + 3σ

% (a) Calcular P(µ - σ < X < µ + σ)
probabilidad_1sigma = sum(X > intervalo_1sigma(1) & X < intervalo_1sigma(2)) / N;

% (b) Calcular P(µ - 2σ < X < µ + 2σ)
probabilidad_2sigma = sum(X > intervalo_2sigma(1) & X < intervalo_2sigma(2)) / N;

% (c) Calcular P(µ - 3σ < X < µ + 3σ)
probabilidad_3sigma = sum(X > intervalo_3sigma(1) & X < intervalo_3sigma(2)) / N;

% Mostrar resultados
fprintf('Probabilidad P(µ - σ < X < µ + σ): %f\n', probabilidad_1sigma);
fprintf('Probabilidad P(µ - 2σ < X < µ + 2σ): %f\n', probabilidad_2sigma);
fprintf('Probabilidad P(µ - 3σ < X < µ + 3σ): %f\n', probabilidad_3sigma);
