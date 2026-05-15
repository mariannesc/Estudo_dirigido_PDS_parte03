// Simulação 5 - Sinal senoidal com ruído aditivo e análise espectral via FFT
clc; clear; close;

// Parâmetros do sinal
N = 256;              // Número de amostras
n = 0:N-1;            // Vetor de amostras
f0 = 0.12;            // Frequência normalizada da senoide
A = 1;                // Amplitude da senoide

// Geração da senoide útil
s = A * cos(2 * %pi * f0 * n);

// Geração do ruído aditivo
ruido = 1.2 * rand(1, N, "normal"); // Ruído branco gaussiano

// Sinal corrompido por ruído
x = s + ruido;

// Cálculo da FFT
X = fft(x);
magX = abs(X);        // Magnitude do espectro
f = (0:N-1) / N;      // Eixo de frequência normalizada

// Gráfico do sinal no domínio do tempo
scf(1);
plot(n, x);
xlabel("Amostras n");
ylabel("Amplitude");
title("Sinal senoidal corrompido por ruído");

// Gráfico do espectro de magnitude
scf(2);
plot(f, magX);
xlabel("Frequência normalizada");
ylabel("Magnitude");
title("Espectro de magnitude obtido pela FFT");

// Exibição apenas da metade positiva do espectro
scf(3);
plot(f(1:N/2), magX(1:N/2));
xlabel("Frequência normalizada");
ylabel("Magnitude");
title("Metade positiva do espectro - identificação da frequência dominante");
