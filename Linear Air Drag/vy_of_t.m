% This script plots the velocity in the y-direction of the projectile as a function of t
% with linear air drag.
clear all; clc; close all

% Constants
vo = 1640; % initial velocity in m/s
th = 55; % Launch Angle in degrees
cd = 0.0027; % drag coefficient in 1/s
g = 9.81; % acceleration due to gravity in m/s^2

% Variables
step = 0.1; % step size
t = 0.1:step:182; % time vector in seconds

% Unit Conversions
th = deg2rad(th);

% Equation 6 vy(t)
vy = -g/cd + (cd*vo*sin(th) + g).*exp(-cd.*t)./cd;

% Plot
plot(t, vy);
hold on
title('Y-Velocity of Projectile as a Function of Time with Linear Air Drag')
xlabel('time (s)')
ylabel('Y-Velocity (m/s)')