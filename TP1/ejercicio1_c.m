%EJERCICIO 3 A DEL TP DE APLICACIONES DEL METODO DE MONTE CARLO
%Borrar y cerrar las ventanas
clear all;
close all;

%Variables
N = 20000; %Cantidad de muestras simuladas
bins = 100; %Cantidad de barras del histograma

%MUESTRAS DE VARIABLES UNIFORMES
U1 = rand(1,N);
U2 = rand(1,N);

%TRANSFORMACION DE VARIABLES
Z1 = sqrt(-2*log(U1)).*cos(2*pi*U2); % Variable normal estándar

%Generacion de las variables pedidas
X1 = sqrt(2)*Z1;
X2 = sqrt(2)*Z1 + 1;
X3 = 2*Z1 + 1;

%Calculo de sus esperanza y varianzas
X1_mean = mean(X1);
X2_mean = mean(X2);
X3_mean = mean(X3);

X1_var = var(X1);
X2_var = var(X2);
X3_var = var(X3);

%Impresion de media y varianza
fprintf('Media de X1: %f\n', X1_mean)
fprintf('Media de X2: %f\n', X2_mean)
fprintf('Media de X3: %f\n', X3_mean)
fprintf('Varianza de X1: %f\n', X1_var)
fprintf('Varianza de X2: %f\n', X2_var)
fprintf('Varianza de X3: %f\n', X3_var)

%HISTOGRAMAS
x1 = linspace(min(X1), max(X1), N); % Dominio de la función
x2 = linspace(min(X2), max(X2), N); % Dominio de la función
x3 = linspace(min(X3), max(X3), N); % Dominio de la función


% Grafico del histograma normalizado para X1
figure;
hold on;
histogram(X1, bins, 'Normalization', 'pdf') % Normalización (para comparar con la función de densidad)

% Superponer la función de densidad teórica de la normal estándar
f_normalx1 = normpdf(x1,0,sqrt(2));
plot(x1, f_normalx1, 'r', 'LineWidth', 2)

% Configuración del gráfico
title('Histograma de X1 con función de densidad teórica superpuesta')
xlabel('Valor de X1')
ylabel('Densidad')
legend('Histograma de X1', 'Densidad N(0,2)')
grid on;
hold off;

%grafico de X2
figure;
hold on;
histogram(X2,bins,'Normalization','pdf');

% Superponer la función de densidad teórica de la normal 
f_normalx2 = normpdf(x2,1,sqrt(2));
plot(x2, f_normalx2, 'r', 'LineWidth', 2);

% Configuración del gráfico
title('Histograma de X2 con función de densidad teórica superpuesta')
xlabel('Valor de X2')
ylabel('Densidad')
legend('Histograma de X2', 'Densidad N(1,2)')
grid on;
hold off;


%grafico de X3
figure;
hold on;
histogram(X3,bins,'Normalization','pdf');

% Superponer la función de densidad teórica de la normal 
f_normalx3 = normpdf(x3,1,2);
plot(x3, f_normalx3, 'r', 'LineWidth', 2);

% Configuración del gráfico
title('Histograma de X3 con función de densidad teórica superpuesta')
xlabel('Valor de X3')
ylabel('Densidad')
legend('Histograma de X3', 'Densidad N(1,4)')
grid on;
hold off;






