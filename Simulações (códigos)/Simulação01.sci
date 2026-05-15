// Simulação 1 - Senoide discreta e análise via FFT

clc;
clear;
close;

// Parâmetros do sinal
N = 128;          // Número de amostras
f0 = 0.1;         // Frequência normalizada
n = 0:N-1;        // Vetor de amostras

// Geração da senoide discreta
x = cos(2 * %pi * f0 * n);

// Cálculo da FFT
X = fft(x);

// Espectro de magnitude
magX = abs(X);

// Eixo de frequência normalizada
f = (0:N-1) / N;

// Gráfico do sinal no domínio do tempo
scf(1);
plot(n, x);
xlabel("Amostras n");
ylabel("Amplitude");
title("Sinal senoidal discreto no domínio do tempo");

// Gráfico do espectro de magnitude
scf(2);
plot(f, magX);
xlabel("Frequência normalizada");
ylabel("|X[k]|");
title("Espectro de magnitude obtido pela FFT");

