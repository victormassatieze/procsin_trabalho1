N = 1024;
window = hamming(N);
Noverlap = N/2;

% --- Salva os espectrogramas
[SPEC_sample_0, w1, t1] = spectrogram(sample_0, window, Noverlap, N);
[SPEC_uranus, w2, t2] = spectrogram(uranus, window, Noverlap, N);

% --- Plota os espectrogramas
figure('units', 'centimeters', 'position', [2, 2, 23, 10])
spectrogram(sample_0, window, Noverlap, N, 'yaxis')
title('sample\_0.wav')
colormap bone
figure('units', 'centimeters', 'position', [2, 2, 23, 10])
spectrogram(uranus, window, Noverlap, N, 'yaxis')
title('uranus.wav')
colormap bone