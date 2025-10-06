% System parameters
g = 9.81;
d = 0.09;
L = 0.30;
m = 0.011;
R = 0.015;
J = (2/5) * m * R^2;
s = tf('s');
y = ((m * g * d) / (L * (m + (J / R^2)) * s^2));

% Root Locus Plot
figure;
rlocus(y);
title('Root Locus Plot');
xlabel('Real Axis');
ylabel('Imaginary Axis');
grid on;

% Comment on Stability
% Stability analysis can be done by observing pole locations in the root locus.

% Bode Plot
figure;
[gm, pm, wcg, wcp] = margin(y); % Calculate gain margin, phase margin, and their respective frequencies
margin(y); % Plot Bode plot
title('Bode Plot');
grid on;

% Display Gain Margin and Phase Margin
fprintf('Gain Margin: %.2f dB at frequency %.2f rad/s\n', 20*log10(gm), wcg);
fprintf('Phase Margin: %.2f degrees at frequency %.2f rad/s\n', pm, wcp);
