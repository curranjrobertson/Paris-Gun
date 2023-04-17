% This script plots the x-position of the...
clear all; clc; close all

% Constants
vo = 1640; % initial velocity in m/s
th = 55; % Launch Angle in degrees
cd = 0.0027; % drag coefficient in 1/s

% Variables
step = 0.1; % step size
t = 0.1:step:182; % time vector in seconds

% Unit Conversions
th = deg2rad(th);

% Equation 4 x(t)
x = (vo.*cos(th)./cd).*(1-exp(-cd.*t));

plot(t, x);
hold on
title('X-Position of Projectile as a Function of Time')
xlabel('time (s)')
ylabel('X position (m)')