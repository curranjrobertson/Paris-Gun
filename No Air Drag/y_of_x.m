% This script plots the Y-Position of the projectile as a
% function of x with no air drag.
clear all; clc; close all

% Constants
vo = 1640; % initial velocity in m/s
th = 55; % Launch Angle in degrees
cd = 0.0027; % drag coefficient in 1/s

% Variables
step = 0.1; % step size
x = 0.1:step:130; % time vector in seconds

% Unit Conversions
th = deg2rad(th);

% Equation 
y = 

% Plot
plot(x, y);
hold on
title('Y-Position of Projectile as a Function of X-Position with Linear Air Drag')
xlabel('X-Position (m)')
ylabel('Y-Position (m)')

% Percent Error
