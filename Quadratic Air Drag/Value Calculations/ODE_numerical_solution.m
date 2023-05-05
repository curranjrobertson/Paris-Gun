% Numerical Solution for 24 < vy < Mach 1 going up
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

% Full Plot
plot(t,y(:,1)) % plot y(t)

% Partial Plot
figure
t_up = find(t > 38.9 & t < 88.5) % find the values in the vector where t is between the end points

% New t vector
tup = t(43:52)
yup = y(43:52,1)

% % grad vector addition
% % vector
% length(tup); %find the length of the t vector
% 
% grad = linspace(0, 5.5155e03, length(tup))'
% ynew = yup - grad

plot(tup,yup(:,1)) % Plot y(t) section (change)
hold on
xlabel('time (s)')
ylabel('height (m)')
title('Y-Position vs. Time for quadratic drag (Needs Some adjusting)')



