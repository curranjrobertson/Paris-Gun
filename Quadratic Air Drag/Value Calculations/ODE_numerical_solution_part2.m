% Numerical Solution for 24 < vy < Mach 1 going down
% This solution solves Conner's original second order, nonlinear ode using
% ode45. The solution must be multiplied by a factor after calling ode45
% because there are singularities in the function using the correct tspan
% and yspan. 

clear all;clc;close all

% Constants
c2 = 0.0027; % drag coefficient (change)
g = 9.81; % acceleration due to gravity in m/s^2

tspan = [-5 8]; % timespan in seconds
yspan = [0 100]; % y span

% Solution
syms y(t)
[V] = odeToVectorField(-diff(y,2) == c2*diff(y)^2 + g); % Convert ode to vector field

M = matlabFunction(V, 'vars', {'t','Y'}); % convert to function

[t,y] = ode45(M,tspan,yspan) % solve ode

% y vector adjustment
f1 = 42300/244.7965; % Factor to make y(t) line up with correct solution (change)
y = f1*y; % multiply y by factor

% t vector adjustment
f2 = 182/12.25; % Factor to make t vector go from 0 to 182 (change)
t = f2*(t + 5);

% Plot
plot(t,y(:,1)) % plot y

% Partial Plot
figure
t_down = find(t > 93.5 & t < 143.1) % find the values in the vector where t is between the end points (Change t < 143.1 -> based on uniform acceleration on both sides)
plot(t(54:63),y(54:63,1)) % Plot y(t) section (change)
hold on
xlabel('time (s)')
ylabel('height (m)')
title('Y-Position vs. Time for quadratic drag (Needs Some adjusting)')
