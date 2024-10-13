N = 10000;

% Simulo los lanzamientos de dos dados
dado1 = randi([1, 6], 1, N);
dado2 = randi([1, 6], 1, N);

suma_dados = dado1 + dado2;

% Cuento los éxitos (7 u 11)
exitos = (suma_dados == 7) | (suma_dados == 11);

% Crear un histograma de los éxitos (Bernoulli: 1 = éxito, 0 = fracaso)
figure;
histogram(exitos, 'Normalization', 'probability', 'BinWidth', 0.01);
xlabel('Resultado (0 = Fracaso, 1 = Éxito)');
ylabel('Probabilidad');
title('Histograma de éxitos (suma 7 u 11) en un lanzamiento de dos dados');

% Distribución de Bernoulli teórica con p = 2/9
valores = [0, 1]; % 0 = fracaso, 1 = éxito
prob_bernoulli = [7/9, 2/9]; % Probabilidad teórica para cada caso

% Superposicion de la probabilidad teórica de la distribución de Bernoulli
hold on;
stem(valores, prob_bernoulli, 'r','Markersize',4, 'LineWidth', 1.5);
legend('Distribución empírica', 'Distribución Bernoulli teórica');
