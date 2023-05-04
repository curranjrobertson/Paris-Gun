% Attempt to solve 24 m/s < Vy < Mach 1 
clear all;clc;close all
% constants
c2 = 0.0027; % drag coefficient (change)
g = 9.81; % acceleration due to gravity in m/s^2

tspan = [38.9 88.5]; % timespan in seconds
yspan = [3.55 4.89]; % y span (change)

% tolerance change
options = odeset('RelTol',1e-8,'AbsTol',1e-10)


syms y(t)
[V] = odeToVectorField(-diff(y,2) == c2*diff(y)^2 + g) % Convert ode to vector field

M = matlabFunction(V, 'vars', {'t','Y'}) % convert to function

sol = ode45(M,tspan,yspan) % solve ode

fplot(@(x)deval(sol,x,1), tspan) % Plot

