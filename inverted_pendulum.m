
%%sources:
% Zeszyty Naukowe Wydziału Elektrotechniki i Automatyki Politechniki Gdańskiej Nr 40
% "ZMIANA POŁOŻENIA UKŁADU ODWRÓCONEGO WAHADŁA PRZY UŻYCIU STEROWANIA ŚLIZGOWEGO"
% tu sa wyprowadzone wzory (14) i (15) które przeksztalcilem do symulacji
% wrzucilem pdfa do paczki

% Jarosław Tyma "Odwrócone wahadło"
% http://jtjt.pl/odwrocone-wahadlo

close all;
clear all;

%% model information
M = 0.5; % mass of the cart [kg]
m = 0.2; % mass of the pendulum [kg]
L = 0.3; % half of the length of the pendulum [m]
I = 0.006; % moment of inertia [kgm^2]
b = 0.1; % friction coefficient [N/m(s^-1)]
g = 9.81; % gravity [m/s^2]

%% parameters for regulators
KP1 = 22;
KI1 = 18;
KD1 = 4;
KP2 = 2;
KD2 = 1;

%% optionally we can apply some force to the cart
F = 2; % force value [N]
Ftime = 6; % time after which we stop applying force [s]

%% values towards which the system is regulated
thD = 1*pi; % angle of the pendulum, for vertical position it has to be a multiplicity of pi
xD = 2; % desired cart displacement

%% initial conditions
q0 = [0 ; 0];
qprim0 = [0 ; 0];
u0 = [F ; 0];

%% simulink simulation
out = sim('inverted_pendulum_sim.slx');

figure(1);
grid on;
hold on;

subplot(2,1,1);
grid on;
hold on;

plot(out.tout,out.xprim,'b');
plot(out.tout,out.x,'r');

title('displacement of cart in x axis [m]');
legend('velocity','displacement');

subplot(2,1,2);
grid on;
hold on;

plot(out.tout,out.thetaprim,'b');
plot(out.tout,out.theta,'r');

title('angle of the pendulum [rad]');
legend('angular velocity','angle');