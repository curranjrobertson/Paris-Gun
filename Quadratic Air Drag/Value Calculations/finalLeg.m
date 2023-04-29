clear all; clc; close all

% Constants (Given)
vy_5 = 1; % Replace with vy(t5) in seconds
y_5 = 1; % Replace with y(t5) in seconds
t5 = 1; % Replace with t5 in seconds
tf = 182; % final time in seconds
M1 = 343; % Mach 1 in seconds
c1 = 0.0027; %
vo = ; %
g = 9.81; % acceleration due to gravity in m/s^2


% Constants
k1 = M1 + g/c1 - (c1*vo*sin(th) + g)*exp(-c1*t5)/c1