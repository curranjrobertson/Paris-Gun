%{
Velocity in the x Direction as a function of time without air drag

Authors: Curran J. Robertson, Kyden F. DeGross 
Professor: Dr. Daniel Rederth

Last Modified: 04/24/2023
Description: Script calculates and plots the velocity in the x-direction of the Paris 
Gun projectile as function of time without air drag


OUTPUTS: 
  Figure 1: Velocity of the projectile in the y-direction as a function of time without air drag
%}
clear all; clc; close all

% Constants
vo = 1640; % initial velocity in m/s
th = 55; % Launch Angle in degrees
c1 = 0.0027; % drag coefficient in 1/s
g = 9.81; % acceleration due to gravity in m/s^2
t_max = 182; % maximum time in seconds

% Variables
step = 0.1; % step size
t = step:step:t_max; % time vector in seconds

% Unit Conversions
th = deg2rad(th);

% Derived Constants
voy = vo*sin(th); % initial velocity in the y-direction

% Equation V_y Motion of a Projectile Hibbeler Dynamics
vy = voy-g.*t;

% Plot
plot(t, vy);
hold on
title('Velocity in the Y-Direction of Projectile as a Function of Time With No Air Drag')
xlabel('time (s)')
ylabel('X position (m)')

% Percent Error
