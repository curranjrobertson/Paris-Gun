% Attempt to solve 24 m/s < Vy < Mach 1 

clear all;clc;close all

% Constants
c2 = 0.0027; % drag coefficient (change)
g = 9.81; % acceleration due to gravity in m/s^2

tspan = [-5 8]; % timespan in seconds
yspan = [0 100]; % y span

% Tolerance change
%options = odeset('RelTol',0.1,'AbsTol',0.1);

syms y(t)
[V] = odeToVectorField(-diff(y,2) == c2*diff(y)^2 + g) % Convert ode to vector field

M = matlabFunction(V, 'vars', {'t','Y'}) % convert to function

[t,y] = ode45(M,tspan,yspan) % solve ode
y
plot(t,y)
%fplot(@(x)deval(sol,x,1), tspan) % Plot

