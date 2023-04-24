%{

Velocity in the x Direction as a function of time without air drag

Authors: Curran J. Robertson, Kyden F. DeGross 
Professor: Dr. Daniel Rederth

Last Modified: 04/24/2023

Description: Script calculates and plots the velocity in the x-direction of the Paris 
Gun projectile as function of time without air drag


CONSTANTS: The real ambient temperature in degrees Celcius (RealTemp) as a
real number between the range of -86<=RealTemp<=-41.

OUTPUTS: 
  Figure 1: Velocity of the projectile in the x-direction as a function of time without air drag

%}

clear all; clc; close all

% Constants
vo = 1640; % initial velocity of projectile (m/s)
th = 55; % Launch Angle (degrees)
c1 = 0.0027; % drag coefficient of the projectile (1/s)
t_max = 182; % maximum time of flight (seconds)

% Variables
step = 0.1; % step size (seconds)
t = step:step:t_max; % time vector (seconds)

% Unit Conversions
th = deg2rad(th);

% Derived Constants
vo_x = vo*cos(th); % initial velocity in x direction

% Equation V_x Motion of a Projectile Hibbeler Dynamics
vx = vo_x; % velocity in x direction

% Plot
plot(t, vx);
title('Velocity in the X-Direction of Projectile as a Function of Time With No Air Drag')
xlabel('time (s)')
ylabel('X position (m)')
