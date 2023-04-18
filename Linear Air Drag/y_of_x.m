% This script plots the Y-Position of the projectile as a
% function of x with linear air drag.
clear all; clc; close all

% Constants
vo = 1640; % initial velocity in m/s
th = 55; % Launch Angle in degrees
c1 = 0.0027; % drag coefficient in 1/s
x_max = 130; % maximum x position in m

% Variables
step = 0.1; % step size
x = step:step:x_max; % time vector in seconds

% Unit Conversions
th = deg2rad(th);

% Equation 
y = vo*cos(th) - cd.*x

% Plot
plot(x, y);
hold on
title('Y-Position of Projectile as a Function of X-Position with Linear Air Drag')
xlabel('X-Position (m)')
ylabel('Y-Position (m)')