% This script plots the velocity in the x-direction of the projectile as a function of t
% with no air drag.
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

% Equation

plot(t, x);
hold on
title('')
xlabel('time (s)')
ylabel('')