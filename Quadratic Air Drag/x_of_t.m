% This script plots the x-position of the projectile as a function of t
% with linear air drag. 

clear all; clc; close all

% Constants
vo = 1640; % initial velocity in m/s
th = 55; % Launch Angle in degrees
cd = 0.0027; % drag coefficient in 1/s
t_max = 182; % max time in seconds

% Variables
step = 0.1; % step size
t = step:step:t_max; % time vector in seconds

% Unit Conversions
th = deg2rad(th);

% Equation 4 x(t)
x = (vo.*cos(th)./cd).*(1-exp(-cd.*t));

% Plot
plot(t, x);
hold on
title('X-Position of Projectile as a Function of Time With Linear Air Drag')
xlabel('time (s)')
ylabel('X position (m)')