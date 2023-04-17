% This script plots the y-position of the projectile as a function of t
% with no air drag.
clear all; clc; close all

% Constants
vo = 1640; % initial velocity in m/s
th = 55; % Launch Angle in degrees
cd = 0.0027; % drag coefficient in 1/s
g = 9.81; % acceleration due to gravity in m/s

% Variables
step = 0.1; % step size
t = 0.1:step:182; % time vector in seconds

% Unit Conversions
th = deg2rad(th);

% Equation 7 y(t)
y = -(g/cd).*t + (cd*vo*sin(th) + g).*(1 - exp(-cd.*t))./cd^2;

% Plot
plot(t, y);
hold on
title('Y-Position of Projectile as a Function of Time')
xlabel('Time (s)')
ylabel('Y-Position')