% System parameters
g = 9.81;
d = 0.09;
L = 0.30;
m = 0.011;
R = 0.015;
J = (2/5) * m * R^2;
v = ((m * g * d) / (L * (m + (J / R^2))))
s = tf('s');
y = ((m * g * d) / (L * (m + (J / R^2)) * s^2));

% Root Locus Plot
figure;
rlocus(y);
title('Root Locus with Design Criteria');
xlabel('Real Axis');
ylabel('Imaginary Axis');
grid on;

% Add design criteria: less than 5% overshoot and Ts < 3 seconds
sgrid(0.7, 1.9); % Damping ratio of 0.7 and natural frequency >= 1.9 rad/s
axis([-5 5 -2 2])
% Analysis and Compensator Design Recommendation
% If the poles don't meet the criteria, add a compensator:
% Example compensator: C(s) = (s + z)/(s + p)
% Here z and p can be adjusted to shift the locus into the desired region.
