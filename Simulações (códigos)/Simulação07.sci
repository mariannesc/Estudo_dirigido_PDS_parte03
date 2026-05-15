// Simulação 7 - Resposta ao impulso de um sistema discreto
clc;
clear;
close;

// Definição do número de amostras
N = 30;

// Vetor de tempo discreto
n = 0:N-1;

// Resposta ao impulso do sistema
// H(z) = 1 / (1 - 0.8z^-1)
// h[n] = (0.8)^n u[n]
h = (0.8).^n;

// Exibição dos primeiros valores
disp("Primeiros valores da resposta ao impulso:");
disp(h(1:10));

// Representação gráfica da resposta ao impulso
scf(1);
plot2d3(n, h);
xlabel("Amostras n");
ylabel("h[n]");
title("Resposta ao impulso h[n] = (0.8)^n u[n]");
xgrid();
