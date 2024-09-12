%EJERCICIO 1 A DEL TP DE APLICACIONES DEL METODO DE MONTE CARLO
%Borrar y cerrar las ventanas
clear all;
close all;

%Variables
N = 10000; %Cantidad de muestras simuladas
bins = 100; %Cantidad de barras del histograma

%MUESTRAS DE VARIABLES UNIFORMES
U1 = rand(1,N);
U2 = rand(1,N);

%TRANSFORMACION DE VARIABLES (Box-Muller)
Z1 = sqrt(-2*log(U1)).*cos(2*pi*U2); % Variable normal estándar
Z2 = sqrt(-2*log(U1)).*sin(2*pi*U2); % Otra variable normal estándar independiente

%CALCULO DE ESPERANZA
mean_Z1 = mean(Z1);
mean_Z2 = mean(Z2);

%CALCULO DE VARIANZA
var_Z1 = var(Z1);
var_Z2 = var(Z2);

% Mostrar los resultados de la media y varianza
fprintf('Media de Z1: %f\n', mean_Z1);
fprintf('Media de Z2: %f\n', mean_Z2);
fprintf('Varianza de Z1: %f\n', var_Z1);
fprintf('Varianza de Z2: %f\n', var_Z2);

%HISTOGRAMAS
x = linspace(min(Z1), max(Z1), N); % Dominio de la función

% Graficar el histograma normalizado para Z1
figure;
hold on;
histogram(Z1, bins, 'Normalization', 'pdf') % Normalización (para comparar con la función de densidad)

% Superponer la función de densidad teórica de la normal estándar
f_normal = normpdf(x,0,1);
plot(x, f_normal, 'r', 'LineWidth', 2)

% Configuración del gráfico
title('Histograma de Z1 con función de densidad teórica superpuesta')
xlabel('Valor de Z1')
ylabel('Densidad')
legend('Histograma de Z1', 'Densidad N(0,1)')
grid on;
hold off;

% Graficar el histograma normalizado
figure;
hold on;
histogram(Z2, bins, 'Normalization', 'pdf') % Normalización (para comparar con la función de densidad)
plot(x, f_normal, 'r', 'LineWidth', 2)

% Configuración del gráfico
title('Histograma de Z2 con función de densidad teórica superpuesta')
xlabel('Valor de Z2')
ylabel('Densidad')
legend('Histograma de Z2', 'Densidad N(0,1)')
grid on;
hold off;

%Grafico de Dispersion
% Crear el scatter plot
scatter(Z1, Z2)

% Agregar etiquetas y título
xlabel('Valores de Z1')
ylabel('Valores de Z2')
title('Gráfico de dispersión de Z1 vs Z2')
xlim([-6 6]) % Ajustar límites del eje X para ver más espacio
ylim([-6 6]) % Ajustar límites del eje Y para ver más espacio


%Coeficiente de Correlacion
corrcoef(Z1,Z2)


