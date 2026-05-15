// Simualação 04 - Efeito do Janelamento no Espectro
clc;
clear;
close;

// Definição do número de amostras
N = 128;

// Vetor de amostras
n = 0:N-1;

// Frequência normalizada escolhida para gerar número não inteiro de ciclos
// Isso provoca descontinuidade nas bordas do sinal finito
f0 = 10.4 / N;

// Geração do sinal discreto
x = cos(2 * %pi * f0 * n);

// FFT do sinal sem janela explícita
// Neste caso, considera-se uma janela retangular implícita
X_ret = fft(x);
mag_ret = abs(X_ret);

// Geração da janela de Hamming
w = window('hm', N);

// Aplicação da janela ao sinal
x_w = x .* w;

// FFT do sinal janelado
X_ham = fft(x_w);
mag_ham = abs(X_ham);

// Eixo de frequência normalizada
f = (0:N-1) / N;

// Representação dos espectros em escala logarítmica
scf(1);

subplot(2,1,1);
plot(f, 20*log10(mag_ret / max(mag_ret)));
title("Espectro com Janela Retangular");
xlabel("Frequência normalizada");
ylabel("Magnitude (dB)");

subplot(2,1,2);
plot(f, 20*log10(mag_ham / max(mag_ham)));
title("Espectro com Janela de Hamming");
xlabel("Frequência normalizada");
ylabel("Magnitude (dB)");
