clear all; clc; close all

syms t

% Constants (Given)
vy_5 = 1; % Replace with vy(t5) in seconds
y_5 = 1; % Replace with y(t5) in seconds
t5 = 1; % Replace with t5 in seconds
tf = 182; % final time in seconds
M1 = 343; % Mach 1 in seconds
c1 = 0.0027; % linear drag coefficient
vo = 1640; % initial velocity
th = 55 % initial angle
g = 9.81; % acceleration due to gravity in m/s^2

% Unit Change
deg2rad(th);

% Constants
k1 = M1 + g/c1 - (c1*vo*sin(th) + g)*exp(-c1*t5)/c1; % for vy
k2 = y_5 + (g/c1)*t5 - (c1*vo*sin(th) + g)*(1-exp(-c1*t5))/c1^2 % for y

% Equations
vx = @(t) vo*cos(th).*exp(-c1.*t);

vy = @(t) -g/c1 + (c1*vo*sin(th) + g)*exp(-c1*t5)/c1 + k1
y = @(t) -(g/c1)*t + (c1*vo*sin(th) + g)*(1-exp(-c1*t))/c1^2 + k2

% Final Position
% Angle of Impact
th_tf = atan(vy(tf)/vx(tf))

% Impact Velocity
vf = sqrt(vx(tf)^2 + vy(tf)^2)

% Impact Position
x_tf = vo*cos(th)*(1-exp(-c1*tf))/c1

% Position 5
x_t5 = vo*cos(th)*(1-exp(-c1*t5))/c1 % x position at t5

V_t5 = sqrt(vx(t5)^2 + vy(t5)^2) % velocity magnitude at t5

th_t5 = atan(vy(t5)/vx(t5)) % angle wrt to horizontal at t5
