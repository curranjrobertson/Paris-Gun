%{
Velocity in the x-direction as a function of x-position without air drag.

Authors: Curran J. Robertson, Kyden F. DeGross 
Professor: Dr. Daniel Rederth

Last Modified: 04/24/2023
Description: Script calculates and plots the velocity in the x-direction of the Paris 
Gun projectile as function of the x-position without air drag

OUTPUTS: 
  Figure 1: Velocity of the projectile in the x-direction as a function of the x-position without air drag
%}
clear all; clc; close all

% Constants
vo = 1640; % initial velocity (m/s)
th = 55; % Launch Angle (degrees)
c1 = 0.0027; % drag coefficient (1/s)
x_max = 130; % maximum x-position (m)

% Variables
step = 0.1; % step size
x = step:step:x_max; % distance vector in (m)

% Unit Conversions
th = deg2rad(th);

% Derived Constants
vox = vo*cos(th); % initial x-velocity in m/s

% Equation 
vx = vox

% Plot
plot(x, vx);
hold on
title('X-Velocity of Projectile as a Function of X-Position with Linear Air Drag')
xlabel('X-Position (m)')
ylabel('X-Velocity (m/s)')

% Percent Error
