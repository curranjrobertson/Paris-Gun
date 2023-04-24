% This script plots the y-position of the projectile as a function of t
% with no air drag.
%{
Velocity in the x Direction as a function of time without air drag

Authors: Curran J. Robertson, Kyden F. DeGross 
Professor: Dr. Daniel Rederth

Last Modified: 04/24/2023
Description: Script calculates and plots the velocity in the y-direction of the Paris 
Gun projectile as function of time without air drag
CONSTANTS: The real ambient temperature in degrees Celcius (RealTemp) as a
real number between the range of -86<=RealTemp<=-41.
OUTPUTS: 
  Figure 1: Velocity of the projectile in the x-direction as a function of time without air drag
%}
clear all; clc; close all

% Constants
vo = 1640; % initial velocity in m/s
th = 55; % Launch Angle in degrees
c1 = 0.0027; % drag coefficient in 1/s
g = 9.81; % acceleration due to gravity in m/s
t_max = 182; % flight time in seconds

% Variables
step = 0.1; % step size
t = step:step:182; % time vector in seconds

% Unit Conversions
th = deg2rad(th);

% Derived Constants
vo_y = vo.*sin(th); % initial velocity in y direction in m/s

% Equation 
y = vo_y.*t - (1/2)*g.*t.^2;

% Plot
plot(t, y);
hold on
title('Y-Position of Projectile as a Function of Time with No Air Drag')
xlabel('Time (s)')
ylabel('Y-Position')

% Percent Error
