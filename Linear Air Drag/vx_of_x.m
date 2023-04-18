% This script plots the velocity in the x-direction of the projectile as a
% function of x with linear air drag.
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
vx = 

% Plot
plot(x, vx);
hold on
title('X-Velocity of Projectile as a Function of X-Position with Linear Air Drag')
xlabel('X-Position (m)')
ylabel('X-Velocity (m/s)')