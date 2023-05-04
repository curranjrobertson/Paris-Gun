% Attempt to solve 24 m/s < Vy < Mach 1 
% constants
c2 = 0.008 %
tspan = []; % timespan in seconds
yo = ; % initial y-value
[t,y] = ode45(@(t,y) c2*y^2 + g, tspan, y0)