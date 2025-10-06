g = 9.81; % m = 0.0023266, J = (2/3)mR^2
d = 0.09;
L = 0.30;
m = 0.011;
R = 0.015;
J = (2/5) * m * R^2;
s = tf('s');
P_ball = ((m * g * d) / (L * (m + (J / R^2)) * s^2));

% rlocus(P_ball)

zo = 0.005;
po = 4.79;
%po=7.8;
%z0= 0.006;
C=tf([1 zo],[1 po]);

rlocus(C*P_ball)
sgrid(0.70, 1.9)
% [k,poles]=rlocfind(C*P_ball);
k=4.0206;
%k= 9.6302;
sys_cl=feedback(k*C*P_ball,1);
t=0:0.01:5;
figure
step(0.25*sys_cl,t)
info = stepinfo(sys_cl);
fprintf('Maximum overshoot time : %.2f %%\n',info.Overshoot);
fprintf('Settling time : %.4f seconds\n',info.SettlingTime);