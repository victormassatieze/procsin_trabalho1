% --- Acha potencia dos sinais:
pot_sample_0 = sum(sample_0.^2)/length(sample_0);
pot_uranus = sum(uranus.^2)/length(uranus);

% --- Como SNR = 10*log(pot_sinal/pot_ruido):
SNR = 0; % variavel, foi experimentado SNR = 10 e SNR = 0
pot_ruido_sample_0 = pot_sample_0/10^(SNR/10);
pot_ruido_uranus = pot_uranus/10^(SNR/10);

% --- pot_ruido = desvio_padrao^(1/2):
desv_sample_0 = pot_ruido_sample_0^(1/2);
desv_uranus = pot_ruido_uranus^(1/2);

% --- Contaminando os sinais:
corrupt_sample_0 = sample_0 + desv_sample_0.*randn(length(sample_0),1);
corrupt_uranus = uranus + desv_uranus.*randn(length(uranus),1);

t_corrupt_sample_0 = (1:length(corrupt_sample_0))/FS;
t_corrupt_uranus = (1:length(corrupt_uranus))/FS;

% --- Plota os sinais no tempo:
figure('units', 'centimeters', 'position', [3, 3, 20, 13])
nexttile
plot(t_corrupt_sample_0, corrupt_sample_0/max(abs(corrupt_sample_0)))
title('corrupted sample\_0.wav')
xlim([0 inf])
nexttile
plot(t_corrupt_uranus, corrupt_uranus/max(abs(corrupt_uranus)))
title('corrupted uranus.wav')
xlim([0 inf])
xlabel('tempo [s] \rightarrow')

% --- Plota os espectrogramas:
N = 512;
window = hamming(N);
Noverlap = N/2;
figure('units', 'centimeters', 'position', [2, 2, 23, 10])
spectrogram(corrupt_sample_0, window, Noverlap, N, 'yaxis')
title('sample\_0.wav')
colormap bone
figure('units', 'centimeters', 'position', [2, 2, 23, 10])
spectrogram(corrupt_uranus, window, Noverlap, N, 'yaxis')
title('uranus.wav')
colormap bone

%soundsc(corrupt_sample_0, FS)
%soundsc(corrupt_uranus, FS)