% This script plots the y-position of the projectile as a function of t
% with quadratic air drag.
clear all; clc; close all

% Constants
vo = 1640; % initial velocity in m/s
th = 55; % Launch Angle in degrees
c1 = 0.0027; % drag coefficient in 1/s
c2 = 0.001; % second order drag coefficient (unitless)
g = 9.81; % acceleration due to gravity in m/s^s
t_max = 182; % maximum time in seconds
M1 = 343; % Value of Mach 1 (speed of sound) in m/s

% Variables
step = 0.1; % step size

% Unit Conversions
th = deg2rad(th); % convert to radians

% Derived Constants
voy = vo*sin(th); % initial velocity in the y-direction

vy = voy;
for t = step:step:t_max % time vector in seconds
    while vy < M1 % If the velocity in the y-direction is less than Mach 1
        while vy < 24 % If the velocity in the y-direction is less than 24 m/s
            vy = -g/c1 + (c1*vo*sin(th) + g).*exp(-c1.*t)./c1; % Linear air drag
            y = -(g/c1).*t + (c1*vo*sin(th) + g).*(1 - exp(-c1.*t))./c1^2; % Linear air drag
        end
        vy = -g/c2 + (c2*vo*sin(th) + g).*exp(-c2.*t)./c2; % Quadratic air drag (This might be wrong)
        y = -(g/c2).*t + (c2*vo*sin(th) + g).*(1 - exp(-c2.*t))./c2^2; % Quadratic air drag (this might be wrong)
    end
    while  vy >= M1 % If the velocity in the y-direction is greater than Mach 1
        vy = -g/c1 + (c1*vo*sin(th) + g).*exp(-c1.*t)./c1; % Linear air drag
        y = -(g/c1).*t + (c1*vo*sin(th) + g).*(1 - exp(-c1.*t))./c1^2; % Linear air drag
    end
end

% Plot
plot(t, y);
hold on
title('Y-Position of Projectile as a Function of Time with Linear Air Drag')
xlabel('Time (s)')
ylabel('Y-Position')