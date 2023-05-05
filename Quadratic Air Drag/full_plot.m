% Full Plot
clear all; clc; close all

% Constants
vo = 1640; % initial velocity in m/s
th = 55; % Launch Angle in degrees
c1 = 0.0027; % drag coefficient in 1/s
g = 9.81; % acceleration due to gravity in m/s^s
t_max = 182; % maximum time in seconds

% Variables
step = 0.1; % step size
t = step:step:t_max % time vector in seconds

% Unit Conversions
th = deg2rad(th);

% Equation 7 y(t)
y = -(g/c1).*t + (c1*vo*sin(th) + g).*(1 - exp(-c1.*t))./c1^2

t1 = t(1:385)
y1 = y(1:385)



% Numerical Solution for 24 < vy < Mach 1 going up
% This solution solves Conner's original second order, nonlinear ode using
% ode45. The solution must be multiplied by a factor after calling ode45
% because there are singularities in the function using the correct tspan
% and yspan. 

% Constants
c2 = 0.0027; % drag coefficient (change)
g = 9.81; % acceleration due to gravity in m/s^2

tspan = [-5 8]; % timespan in seconds
yspan = [0 100]; % y span

% Solution
syms y(t)
[V] = odeToVectorField(-diff(y,2) == c2*diff(y)^2 + g) % Convert ode to vector field

M = matlabFunction(V, 'vars', {'t','Y'}) % convert to function

[t,y] = ode45(M,tspan,yspan) % solve ode

% y vector adjustment
f1 = 42300/244.7965; % Factor to make y(t) line up with correct solution (change)
f3 = 4.2269/4.78;
y = f1*y + 5650; % reevaluate y

% t vector adjustment
f2 = 182/12.25; % Factor to make t-vector correct timespan (change)
t = f2*(t + 5); % reevaluate t

% Partial Plot
figure
t_up = find(t > 38.9 & t < 88.5) % find the values in the vector where t is between the end points

% Plot
plot(t1, y1);

hold on
title('')
xlabel('Time (s)')
ylabel('Y-Position')

% New t vector
tup = t(43:52)
yup = y(43:52,1)

plot(tup,yup(:,1)) % Plot y(t) section (change)

plot(t(54:63),y(54:63,1)) % Plot y(t) section (change)

hold off