clear all
close all
%--------------------------------------
%EJERCICIO 1
%--------------------------------------

%Se lee el archivo con los datos y se los carga a un vector 
detecciones = (readmatrix('geiger.csv')');

%Se crea un vector con el tiempo entre cada deteccion
tiempoEntrePulsos = zeros(size(detecciones)-1);
for i = 1:(length(detecciones)-1)
    tiempoEntrePulsos(i) = detecciones(i+1) - detecciones(i);
end

%Se calcula la media y la varianza del tiempo entre detecciones
mediaTiempoEntrePulsos = mean(tiempoEntrePulsos)
varianzaTiempoEntrePulsos = var(tiempoEntrePulsos)

%Se grafica el histograma normalizado del tiempo entre pulsos
histogram(tiempoEntrePulsos, 'Normalization','pdf')

%Al histograma anterior se le superpone la curva teórica para poder
%compararlos
hold on
x = linspace(0, max(tiempoEntrePulsos));
plot(x, exppdf(x, mediaTiempoEntrePulsos),'LineWidth',2);

legend("Histograma", "PDF")
xlabel("tiempo [microsegundos]")
title("Tiempo entre pulsos")

%--------------------------------------
%EJERCICIO 2
%--------------------------------------


T = 2*10^6; %2 segundos en microsegundos
tActual = 0;
tAnterior = 0;

%Se cuentan la cantidad de detecciones que se dan en intervalos de dos
%segundos
cantParticulas  = zeros([1,round(max(detecciones)/T)+1]);
j = 1;
for i = 1:(length(detecciones))
    tActual = detecciones(i);
    if tActual- tAnterior < T
        cantParticulas(j) = cantParticulas(j) + 1;
    else
        j = j+1;
        cantParticulas(j) = cantParticulas(j) + 1;
        tAnterior = tAnterior + T;
    end
end

sum(cantParticulas)

%Se calcula la media y la varianza de la cantidad de detecciones en el
%intervalo
mediaCantParticulas = mean(cantParticulas)
varianzaCantParticulas = var(cantParticulas)

%Se grafica el histograma de la cantidad de detecciones en el intervalo
figure;
histogram(cantParticulas, 'Normalization','pdf')

%Al histograma anterior se le superpone la curva teórica para poder
%compararlos
hold on
x = 1:8;
plot(x, poisspdf(x, mediaCantParticulas),'LineWidth',2);
legend("Histograma", "PDF")
xlabel("tiempo [microsegundos]")
title("Cantidad de detecciones contadas en intervalos de 2 segundos")

%BORRAR:
[N, edges] = histcounts(cantParticulas);
centros = (edges(1:end-1) + edges(2:end)) / 2;
figure;
% Graficar el histograma
bar(centros, N, 'hist')