% This script plots the Y-Position of the projectile as a
% function of x with no air drag.
clear all; clc; close all

% Constants
vo = 1640; % initial velocity in m/s
th = 55; % Launch Angle in degrees
cd = 0.0027; % drag coefficient in 1/s
g = 9.81; % acceleration due to gravity in m/s^2

% Variables
step = 0.1; % step size
x = 0.1:step:130; % time vector in seconds

% Unit Conversions
th = deg2rad(th);

% Derived Constants
voy = vo*sin(th); % initial y velocity in m/s
vox = vo*cos(th); % initial x velocity in m/s

% Equation Hibbler dynamics Projectile Motion 
y = voy*(x/vox) - (1/2)*g*(x/vox).^2;

% Plot
plot(x, y);
hold on
title('Y-Position of Projectile as a Function of X-Position with Linear Air Drag')
xlabel('X-Position (m)')
ylabel('Y-Position (m)')

% Percent Error
