% This script plots the y-position of the projectile as a function of t
% with quadratic air drag.
clear all; clc; close all

% Constants
vo = 1640; % initial velocity in m/s
th = 55; % Launch Angle in degrees
c1 = 0.0027; % drag coefficient in 1/s
c2 = 0.001; % second order drag coefficient (unitless)
g = 9.81; % acceleration due to gravity in m/s^s
t_max = 250; % maximum time in seconds
M1 = 343; % Value of Mach 1 (speed of sound) in m/s

% Variables
step = 0.1; % step size

% Unit Conversions
th = deg2rad(th); % convert to radians

% Derived Constants
voy = vo*sin(th); % initial velocity in the y-direction

vy = voy; % Init vy
for t = step:step:t_max
    if vy < M1 && t < t_max % If the velocity in the y-direction is less than Mach 1
        if vy < 24  % If the velocity in the y-direction is less than 24 m/s
            vy = -g/c1 + (c1*vo*sin(th) + g).*exp(-c1.*t)./c1 % Linear air drag
            y = -(g/c1).*t + (c1*vo*sin(th) + g).*(1 - exp(-c1.*t))./c1^2 % Linear air drag
        elseif vy >= 24
            vy = -g/c2 + (c2*vo*sin(th) + g).*exp(-c2.*t)./c2 % Quadratic Air drag (Change)
            y = -(g/c2).*t + (c2.*vo*sin(th) + g).*(1 - exp(-c2.*t))./c2^2 % Quadratic Air drag (Change)
        else
            return;
        end
    elseif vy >= M1 && t < t_max  % If the velocity in the y-direction is greater than Mach 1
        vy = -g/c1 + (c1*vo*sin(th) + g).*exp(-c1.*t)./c1 % Linear air drag
        y = -(g/c1).*t + (c1*vo*sin(th) + g).*(1 - exp(-c1.*t))./c1^2;% Linear air drag
    else 
        return;
    end
% Plot
hold on
plot(t, y, '-o')
title('Y-Position of Projectile as a Function of Time with Compound Air Drag')
xlabel('Time (s)')
ylabel('Y-Position')
end

