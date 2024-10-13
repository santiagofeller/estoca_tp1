clear all
close all

detecciones = (readmatrix('geiger.csv')');
tiempoEntrePulsos = zeros(size(detecciones)-1);

for i = 1:(length(detecciones)-1)
    tiempoEntrePulsos(i) = detecciones(i+1) - detecciones(i);
end

mediaTiempoEntrePulsos = mean(tiempoEntrePulsos)
varianzaTiempoEntrePulsos = var(tiempoEntrePulsos)
histogram(tiempoEntrePulsos, 'Normalization','pdf')
hold on
x = linspace(0, max(tiempoEntrePulsos));
plot(x, exppdf(x, mediaTiempoEntrePulsos),'LineWidth',2);
legend("Histograma", "PDF")
xlabel("tiempo [microsegundos]")
title("Tiempo entre pulsos")


T = 2*10^6;
tActual = 0;
tAnterior = 0;
j = 1;
%cantParticulas  = zeros([1,round(max(detecciones)/T)]);

cantParticulas  = zeros([1,573]); %BORRAR

for i = 1:(length(detecciones))
    tActual = detecciones(i);
    if tActual- tAnterior < T
        cantParticulas(j) = cantParticulas(j) + 1;
    else
        j = j+1;
        cantParticulas(j) = cantParticulas(j) + 1;
        tAnterior = tActual;
    end
end
sum(cantParticulas)
%debería dar un vector mas largo
figure;
mediaCantParticulas = mean(cantParticulas)
varianzaCantParticulas = var(cantParticulas)
histogram(cantParticulas, 'Normalization','pdf')
hold on
x = 1:8;
plot(x, poisspdf(x, mediaCantParticulas),'LineWidth',2);
legend("Histograma", "PDF")
xlabel("tiempo [microsegundos]")
title("Tiempo entre pulsos")