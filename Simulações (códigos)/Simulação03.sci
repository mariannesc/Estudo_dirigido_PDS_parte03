// Simulação 3 - Fenômeno de Aliasing e Taxa de Amostragem
clc; clear; close;

// Parâmetros do sinal
f_sinal = 80;          // Frequência da senoide em Hz
t = 0:0.0001:0.1;      // Eixo de tempo quase contínuo, usado como referência
x_cont = cos(2 * %pi * f_sinal * t);

// Caso 1: amostragem adequada
// Pelo critério de Nyquist, fs deve ser maior que 2*f_sinal
fs1 = 400;             
n1 = 0:1/fs1:0.1;
x1 = cos(2 * %pi * f_sinal * n1);

N1 = length(x1);
X1 = abs(fft(x1)) / (N1/2);
freq1 = (0:N1-1) * (fs1/N1);

// Caso 2: subamostragem, provocando aliasing
// Como fs2 = 100 Hz, a frequência de Nyquist é 50 Hz
// Portanto, o sinal de 80 Hz não pode ser representado corretamente
fs2 = 100;             
n2 = 0:1/fs2:0.1;
x2 = cos(2 * %pi * f_sinal * n2);

N2 = length(x2);
X2 = abs(fft(x2)) / (N2/2);
freq2 = (0:N2-1) * (fs2/N2);

// Gráficos dos espectros
scf(1);

subplot(2,1,1);
plot(freq1(1:N1/2), X1(1:N1/2));
title("Espectro sem Aliasing (fs = 400 Hz)");
xlabel("Frequência (Hz)");
ylabel("Magnitude");

subplot(2,1,2);
plot(freq2(1:N2/2), X2(1:N2/2));
title("Espectro com Aliasing (fs = 100 Hz)");
xlabel("Frequência (Hz)");
ylabel("Magnitude");
