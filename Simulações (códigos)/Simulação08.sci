// Simulação 8 - Influência da duração do sinal na resolução espectral
clc; clear; close;

// Frequência normalizada fundamental
f0 = 0.1;

// Dois sinais com a mesma frequência, mas durações diferentes
N1 = 64;     // sinal curto
N2 = 256;    // sinal longo

n1 = 0:N1-1;
n2 = 0:N2-1;

// Geração dos sinais
x1 = cos(2 * %pi * f0 * n1);
x2 = cos(2 * %pi * f0 * n2);

// Cálculo da FFT
X1 = abs(fft(x1));
X2 = abs(fft(x2));

// Eixos de frequência normalizada
freq1 = (0:N1-1) / N1;
freq2 = (0:N2-1) / N2;

// Gráfico do sinal curto
scf(1);
plot(freq1, X1);
xlabel("Frequência normalizada");
ylabel("Magnitude");
title("Espectro do sinal curto - N = 64");

// Gráfico do sinal longo
scf(2);
plot(freq2, X2);
xlabel("Frequência normalizada");
ylabel("Magnitude");
title("Espectro do sinal longo - N = 256");
