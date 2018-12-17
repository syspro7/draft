% 
% Define Wave Shape
%
run init.m

% file number
N = 1;

% Time emitting sound
T = 1; % [s]
t = linspace(0.0, T, T*Fs);

% Amlitude, frequancy, etc
A = 10;
f = 1500; % [1/s]
sigma = 0.001;  % [s]

% Define Wave Shape
u = A .* sin(2*pi*f*t) .* exp(-(t-T/2).^2 / sigma.^2);

wave.date = datetime('now');
wave.speaker = u;
wave.description = '';
wave.filename = ['wave' num2str(yyyymmdd(wave.date)) '-' num2str(N)];

save_data('data/waves/', wave.filename, wave)

% sound
soundsc(wave.speaker,Fs);
figure()
plot(t, u);


% N = N + 1