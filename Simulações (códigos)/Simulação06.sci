// Simulação 6 - Implementação direta da DFT e comparação com FFT
clc;
clear;
close;

// Sinal curto com poucas amostras
x = [1 2 3 4];
N = length(x);

// Vetor para armazenar a DFT direta
X_direta = zeros(1, N);

// Cálculo da DFT direta pela definição matemática
// X[k] = soma de x[n] * exp(-j*2*pi*k*n/N)
for k = 0:N-1
    for n = 0:N-1
        X_direta(k+1) = X_direta(k+1) + x(n+1) * exp(-%i * 2 * %pi * k * n / N);
    end
end

// Cálculo usando a função nativa FFT
X_fft = fft(x);

// Exibição dos resultados
disp("Resultado da DFT Direta:");
disp(X_direta);

disp("Resultado da função FFT:");
disp(X_fft);

// Cálculo do erro entre os métodos
erro = max(abs(X_direta - X_fft));
printf("\nErro máximo entre os métodos: %e\n", erro);

// Gráfico para comparação das magnitudes
k = 0:N-1;

scf(1);
plot(k, abs(X_direta), 'bo-');
plot(k, abs(X_fft), 'r*');
xlabel("Índice de frequência k");
ylabel("Magnitude");
title("Comparação entre DFT Direta e FFT");
legend("DFT Direta", "FFT");
