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

syms y(t)
[V] = odeToVectorField(-diff(y,2) == c2*diff(y)^2 + g) % Convert ode to vector field

M = matlabFunction(V, 'vars', {'t','Y'}) % convert to function

[t,y] = ode45(M,tspan,yspan) % solve ode

%
f1 = 42300/244.7965 % Factor to make y(t) line up with correct solution
y = f1*y %multiply y by factor

plot(t,y(:,1)) % plot y


