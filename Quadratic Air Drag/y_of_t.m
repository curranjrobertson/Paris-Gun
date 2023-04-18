% This script plots the y-position of the projectile as a function of t
% with linear air drag.
clear all; clc; close all

% Constants
vo = 1640; % initial velocity in m/s
th = 55; % Launch Angle in degrees
cd = 0.0027; % drag coefficient in 1/s
g = 9.81; % acceleration due to gravity in m/s^s
t_max = 182; % maximum time in seconds

% Variables
step = 0.1; % step size

% Unit Conversions
th = deg2rad(th);

for t = step:step:t_max; % time vector in seconds
    vy = ; % Equation for velocity in y direction
    if vy < M1 % If the velocity in the y-direction is less than Mach 1
        if vy < 24 % If the velocity in the y-direction is less than 24 m/s
            y = -(g/cd).*t + (cd*vo*sin(th) + g).*(1 - exp(-cd.*t))./cd^2; % Linear air drag
        else 
            y = ;% Quadratic air drag
        end
    elseif  vy >= M1 % If the velocity in the y-direction is greater than Mach 1
        y = -(g/cd).*t + (cd*vo*sin(th) + g).*(1 - exp(-cd.*t))./cd^2; % Linear air drag
    else 
        return;
    end
end

% Equation 7 y(t)
y = -(g/cd).*t + (cd*vo*sin(th) + g).*(1 - exp(-cd.*t))./cd^2;

% Plot
plot(t, y);
hold on
title('Y-Position of Projectile as a Function of Time with Linear Air Drag')
xlabel('Time (s)')
ylabel('Y-Position')