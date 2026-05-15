// Simulação 02 - Soma de senoides e análise espectral via FFT
clc;
clear;
close;

// Parâmetros do sinal
N = 256;              // Número de amostras
f1 = 0.1;             // Frequência normalizada da primeira senoide
f2 = 0.25;            // Frequência normalizada da segunda senoide
n = 0:N-1;            // Vetor de índices de amostragem

// Geração das senoides
x1 = cos(2 * %pi * f1 * n);   // Senoide com frequência f1
x2 = cos(2 * %pi * f2 * n);   // Senoide com frequência f2

// Soma dos sinais
x_soma = x1 + x2;

// Cálculo da FFT do sinal resultante
X = fft(x_soma);

// Cálculo da magnitude do espectro
magX = abs(X);

// Eixo de frequência normalizada
f = (0:N-1) / N;

// Gráfico do sinal no domínio do tempo
scf(1);
plot(n, x_soma);
xlabel("Amostras n");
ylabel("Amplitude");
title("Soma de duas senoides no domínio do tempo");

// Gráfico do espectro de magnitude
scf(2);
plot(f, magX);
xlabel("Frequência normalizada");
ylabel("|X[k]|");
title("Espectro de magnitude obtido pela FFT");
