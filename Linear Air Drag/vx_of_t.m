% This script plots the velocity in the x-direction of the projectile as a function of t
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

% Equation 5 vx(t)
vx = vo*cos(th).*exp(-cd.*t);

% Plot
plot(t, vx);
hold on
title('X-Velocity of Projectile as a Function of Time with Linear Air Drag')
xlabel('time (s)')
ylabel('X-Velocity (m/s)')

% Percent Error
pe = 