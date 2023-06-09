% This script plots the y-position of the projectile as a function of t
% with linear air drag.
clear all; clc; close all

% Constants
vo = 1640; % initial velocity in m/s
th = 55; % Launch Angle in degrees
c1 = 0.0027; % drag coefficient in 1/s
g = 9.81; % acceleration due to gravity in m/s^s
t_max = 182; % maximum time in seconds

% Variables
step = 0.1; % step size
t = step:step:t_max % time vector in seconds

% Unit Conversions
th = deg2rad(th);

% Equation 7 y(t)
y = -(g/c1).*t + (c1*vo*sin(th) + g).*(1 - exp(-c1.*t))./c1^2

% Plot
plot(t, y);

hold on
title('Y-Position of Projectile as a Function of Time with Linear Air Drag')
xlabel('Time (s)')
ylabel('Y-Position')