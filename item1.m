[sample_0, FS_sample_0] = audioread('sample-0.wav');
[uranus, FS_uranus] = audioread('uranus.wav');

FS = 16000;

% --- Alterando a freq de amostragem para FS:
if FS_sample_0 ~= FS
   sample_0 = resample(sample_0, FS, FS_sample_0);
end
if FS_uranus ~= FS
   uranus = resample(uranus, FS, FS_uranus);
end

%soundsc(sample_0, FS)
%soundsc(uranus, FS)

t_sample_0 = (1:length(sample_0))/FS;
t_uranus = (1:length(uranus))/FS;

figure('units', 'centimeters', 'position', [3, 3, 20, 13])
nexttile
plot(t_sample_0, sample_0/max(abs(sample_0)))
title('sample\_0.wav')
xlim([0 inf])
nexttile
plot(t_uranus, uranus/max(abs(uranus)))
title('uranus.wav')
xlim([0 inf])
xlabel('tempo [s] \rightarrow')