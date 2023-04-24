%{
Velocity in the y-direction as a function of the x-position without air drag

Authors: Curran J. Robertson, Kyden F. DeGross 
Professor: Dr. Daniel Rederth

Last Modified: 04/24/2023
Description: Script calculates and plots the velocity in the y-direction of the Paris 
Gun projectile as function of the y-position without air drag

OUTPUTS: 
  Figure 1: Velocity of the projectile in the x-direction as a function of time without air drag
%}
clear all; clc; close all

% Constants
vo = 1640; % initial velocity in m/s
th = 55; % Launch Angle in degrees
c1 = 0.0027; % drag coefficient in 1/s
g = 9.81; % acceleration due to gravity in m/s^2
x_max = 130; % maximum x-position in m

% Variables
step = 0.1; % step size
x = step:step:x_max; % time vector in seconds

% Unit Conversions
th = deg2rad(th);

% Derived Constants
voy = vo*sin(th); % initial y-velocity in m/s

% Equation 
vy = sqrt(voy^2 - 2*g*(y));

% Plot
plot(x, vy);
hold on
title('Y-Velocity of Projectile as a Function of X-Position with Linear Air Drag')
xlabel('X-Position (m)')
ylabel('Y-Velocity (m/s)')
