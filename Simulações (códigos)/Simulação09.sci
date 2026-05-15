// Simulação 9 - Sinal com frequência principal e componente harmônica
clc; clear; close;

// Parâmetros do sinal
N = 256;              // Número de amostras
f0 = 0.1;             // Frequência principal normalizada
fh = 2 * f0;          // Segunda harmônica: 2*f0 = 0.2
n = 0:N-1;            // Vetor de amostras

// Geração das componentes do sinal
x_fund = cos(2 * %pi * f0 * n);        // Componente fundamental
x_harm = 0.5 * cos(2 * %pi * fh * n);  // Harmônica com menor amplitude

// Sinal total: soma da fundamental com a harmônica
x_total = x_fund + x_harm;

// Cálculo da FFT
X = fft(x_total);
magX = abs(X);

// Eixo de frequência normalizada
f = (0:N-1) / N;

// Gráficos
scf(1);

subplot(2,1,1);
plot(n, x_total);
title("Sinal no domínio do tempo");
xlabel("Amostras n");
ylabel("Amplitude");

subplot(2,1,2);
plot(f, magX);
title("Espectro de magnitude obtido pela FFT");
xlabel("Frequência normalizada");
ylabel("Magnitude");
