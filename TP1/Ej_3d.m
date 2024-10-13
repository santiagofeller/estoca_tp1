n = 20;      % Número de lanzamientos por realizacion
p = 2 / 9;   % Probabilidad de obtener un éxito (suma de 7 o 11)
N = 10000;   % Número de realizaciones

% Simular las N realizaciones y n lanzamientos por realizacion
dado1 = randi([1, 6], N, n);
dado2 = randi([1, 6], N, n);
suma_dados = dado1 + dado2;

% Contar los éxitos (suma 7 o 11) para todos los turnos a la vez
exitos_totales = sum(suma_dados == 7 | suma_dados == 11, 2);

% Crear un histograma de los éxitos por turno
figure;
histogram(exitos_totales, 'Normalization', 'probability', 'BinWidth', 0.15);
xlabel('Número de éxitos (suma 7 o 11)');
ylabel('Probabilidad');
title('Distribución de éxitos en n = 20 lanzamientos');

% Probabilidad binomial teórica
k_exitos = 0:n; %cantidad de exitos en los 20 lanzamientos
prob_binomial_teorica = binopdf(k_exitos, n, p);

% Superponer la probabilidad binomial teórica
hold on;
stem(k_exitos, prob_binomial_teorica, 'r', 'LineWidth', 1.5, 'MarkerSize', 4);
legend('Distribución empírica', 'Distribución binomial teórica');
