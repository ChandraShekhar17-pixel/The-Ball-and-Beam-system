% System parameters
g = 9.81; % m = 0.0023266, J = (2/3)mR^2
d = 0.09;
L = 0.30;
m = 0.011;
R = 0.015;
J = (2/5) * m * R^2;
s = tf('s');
y = ((m * g * d) / (L * (m + (J / R^2)) * s^2));

% Bode Plot
figure;
margin(y); % Plot Bode plot and show margins
title('Bode Plot Analysis');
grid on;

% Design a Lead Compensator to improve phase margin and dynamic response
% Example compensator: C(s) = K * (s + z)/(s + p)
% Choose z < p for a lead compensator, typically z/p = 0.1 to 0.5.
K = 10; % Adjust gain
z = 2; % Zero location
p = 10; % Pole location
C = K * tf([1 z], [1 p]);


% Bode Plot with Compensator
figure;
margin(C * y);
title('Bode Plot with Compensator');
grid on;
