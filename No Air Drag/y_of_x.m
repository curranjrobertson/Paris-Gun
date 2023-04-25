%{

Y-position of the projectile as a function of the x-position

Author: Curran J. Robertson, Kyden F. DeGross 
Professor: Dr. Daniel Rederth

Description: 
  Script plots the y-position of the Paris Gun projectile as
  a function of the x-position without airdrag.

OUTPUTS: 
   Figure 1: Y-position of the Paris Gun projectile as a 
   function of the x-position without airdrag.
    
%}

clear all; clc; close all

% Constants
vo = 1640; % initial velocity in m/s
th = 55; % Launch Angle in degrees
c1 = 0.0027; % drag coefficient in 1/s
g = 9.81; % acceleration due to gravity in m/s^2
xmax = 130; % maximum x position in km

% Variables
step = 0.1; % step size
x = step:step:xmax; % position vector in km

% Unit Conversions
th = deg2rad(th);

% Derived Constants
voy = vo*sin(th); % initial y velocity in m/s
vox = vo*cos(th); % initial x velocity in m/s

% Equation Hibbler dynamics Projectile Motion 
y = voy*(x/vox) - (1/2)*g*(x/vox).^2;

% Plot
plot(x, y);
hold on
title('Y-Position of Projectile as a Function of X-Position with No Air Drag')
xlabel('X-Position (m)')
ylabel('Y-Position (m)')

% Percent Error
