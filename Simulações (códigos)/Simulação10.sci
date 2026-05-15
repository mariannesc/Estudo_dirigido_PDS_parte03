
// Simulação 10 - ANÁLISE ESPECTRAL DE SINAL COM RUÍDO


clc;
clear;
close;

// ======================================================
// 1. PARÂMETROS DO SINAL
// ======================================================

fs = 1000;          // Frequência de amostragem (Hz)
N = 1024;           // Número de amostras
t = (0:N-1)/fs;     // Vetor de tempo

// Frequência da senoide principal
f0 = 50;            // Frequência do sinal em Hz

// ======================================================
// 2. GERAÇÃO DO SINAL
// ======================================================

// Sinal senoidal puro
x_senoide = sin(2 * %pi * f0 * t);

// Geração de ruído aleatório
// rand(1,N) gera números entre 0 e 1
// Multiplicamos para controlar intensidade do ruído
ruido = 0.5 * (rand(1,N) - 0.5);

// Sinal final com ruído aditivo
x = x_senoide + ruido;

// ======================================================
// 3. REPRESENTAÇÃO NO DOMÍNIO DO TEMPO
// ======================================================

scf(1);

plot(t, x);

title("Sinal com Ruido no Dominio do Tempo");
xlabel("Tempo (s)");
ylabel("Amplitude");

// ======================================================
// 4. CÁLCULO DA FFT
// ======================================================

// Transformada Rápida de Fourier
X = fft(x);

// Magnitude do espectro
magX = abs(X);

// Normalização da magnitude
magX = magX / max(magX);

// Vetor de frequências
f = (0:N-1)*(fs/N);

// ======================================================
// 5. ESPECTRO DE FREQUÊNCIA
// ======================================================

scf(2);

// Exibe apenas metade do espectro
// (parte útil para sinais reais)
plot(f(1:N/2), magX(1:N/2));

title("Espectro de Magnitude via FFT");
xlabel("Frequencia (Hz)");
ylabel("Magnitude Normalizada");

// ======================================================
// 6. IDENTIFICAÇÃO DA FREQUÊNCIA PRINCIPAL
// ======================================================

// Procura o maior valor do espectro
[valor_max, indice] = max(magX(1:N/2));

// Frequência correspondente
freq_dominante = f(indice);

// Exibe resultado no console
disp("Frequencia dominante identificada:");
disp(freq_dominante);
