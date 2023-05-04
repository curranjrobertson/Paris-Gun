% Attempt to solve 24 m/s < Vy < Mach 1 
% constants
c2 = 0.008; % drag coefficient (change)
g = 9.81; % acceleration due to gravity in m/s^2

tspan = [0 5]; % timespan in seconds (change)
yspan = [0 5]; % y span (change)


syms y(t)
[V] = odeToVectorField(diff(y,2) == c2*diff(y)^2 + g) % Convert ode to vector field

M = matlabFunction(V, 'vars', {'t','Y'}) % convert to function


sol = ode45(M,tspan,yspan) % solve ode

fplot(@(x)deval(sol,x,1), tspan) % Plot

