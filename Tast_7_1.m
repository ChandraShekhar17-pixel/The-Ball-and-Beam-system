g = 9.81; % m = 0.0023266, J = (2/3)mR^2
d = 0.09;
L = 0.30;
m = 0.0023266;
R = 0.015;
J = (2/5) * m * R^2;
s = tf('s');
P_ball = ((m * g * d) / (L * (m + (J / R^2)) * s^2));

% Phase-lead compensator design
phi = 85; % Updated desired phase margin (degrees)
wbw = 1.9; % Bandwidth frequency (rad/s)
pmr = phi * pi / 180; % Convert phase margin to radians

a = (1 - sin(pmr)) / (1 + sin(pmr)); % Compute 'a'
T = sqrt(a) / wbw; % Compute 'T'
aT = 1 / (wbw * sqrt(a)); % Compute 'aT'
K = 4.0206; % Gain

C = K * (0.005 +  s) / (4.79 + s); % Compensator transfer function

% Plot root locus with compensator
figure;
rlocus(C * P_ball);
sgrid(0.70, 1.9); % Add damping ratio and natural frequency grid
title('Root Locus with Compensator');

% Closed-loop system
sys_cl = feedback(C * P_ball, 1);

% Step response
figure;
t = 0:0.01:5;
step(0.25 * sys_cl, t);
title('Step Response with Compensator');
grid on;

% Step response information
info = stepinfo(sys_cl);
fprintf('Maximum overshoot: %.2f %%\n', info.Overshoot);
fprintf('Settling time: %.4f seconds\n', info.SettlingTime);

% Bode plot of the open-loop system
figure;
bode(C * P_ball);
grid on;
title('Bode Plot of Open-Loop System');

% Verify performance
if info.Overshoot < 5 && info.SettlingTime < 3
    disp('Design meets the criteria: less than 5% overshoot and settling time less than 3 seconds.');
else
    disp('Design does NOT meet the criteria. Tuning required.');
end