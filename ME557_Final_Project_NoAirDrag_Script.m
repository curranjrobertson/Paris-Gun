%{
ME 557 Paris Gun Final Project.

Model of the Projectile dynamics assuming air drag is negligable

Author: Curran J. Robertson, Kyden F. DeGross, Roger Nakagawa

Professor: Dr. Daniel Rederth

Description: Script calculates and plots the dynamics of the Paris Gun
Projectile for both the X and Y directions.

OUTPUTS: 
    Figure 1: 
        x-position of the Paris Gun projectile as a function of time.

        Velocity in the x-direction of the Paris Gun projectile as a
        function of time.
        
        Velocity in the x-direction of the Paris Gun projectile as a
        function of the x-position.
    
    Figure 2: 
        y-position of the Paris Gun projectile as a function of time

        Velocity in the y-direction of the Paris Gun projectile as a
        function of time

        Velocity in the y-direction of the Paris Gun projectile as a
        function of the x-position
    
        y-position of hte Paris Gun projectile as a function of the
        x-position

    
%}

clear; clc; close all


%% Constants
v0 = 1640; % initial velocity  (m/s)
theta = 55; % Launch Angle (degrees)
g = 9.81; % acceleration due to gravity (m/s^2)

%% Solving for time of flight (TOF)
tpeak = (v0*sind(theta))/g;
tflight = 2*tpeak;

%% Solving for Maximum Range in x-direction
xmax = v0*cosd(theta)*tflight; % Maximum distance traveled in the x-direction (m)
xmaxkm = xmax/1000;
step = 0.1; % step size (m)
timevector = 0:step:tflight; % time vector (m)

ypositionvectorairdrag = zeros(1,length(timevector));
yvelocityvectorairdrag = zeros(1,length(timevector));

%% Descritized Vectors for Dynamics without Air Drag

xpositionvectornoairdrag= v0*cosd(theta)*timevector;
ypositionvectornoairdrag = v0*sind(theta)*timevector-0.5*g*(timevector.^2);

xvelocityvectornoairdrag = v0*cosd(theta)+0*timevector;
yvelocityvectornoairdrag = v0*sind(theta)-g*timevector;

%% Calculation of X direction Air Drag
cd1a = 0.0027; %perseconds
xpositionvectorairdrag(1:1820)= (v0*cosd(theta)/cd1a)*(1-exp(-cd1a*timevector(1:1820)));
xvelocityvectorairdrag(1:1820) = (v0*cosd(theta)*exp(-cd1a*timevector(1:1820)));
%% Stage 1 Equations (y) 0<Vy<343 Air Drag

%Vy>M3
ypositionvectorairdrag(1:242) = (((v0*sind(theta)*cd1a)+g)/cd1a^2)*(1-exp(-cd1a*timevector(1:242)))-(g*timevector(1:242)/cd1a);
yvelocityvectorairdrag(1:242) = (-g/cd1a)+((cd1a*v0*sind(theta)+g)/cd1a)*exp(-cd1a*timevector(1:242));

%M2<Vy<M3
cd1b = 0.04;
theta1b = 49.4;
ypositionvectorairdrag(242:320) = (((343*3*sind(theta1b)*cd1b)+g)/cd1b^2)*(1-exp(-cd1b*timevector(1:79)))-(g*timevector(1:79)/cd1b)+ypositionvectorairdrag(242);
yvelocityvectorairdrag(242:320) = (-g/cd1b)+((cd1b*343*3*sind(theta1b)+g)/cd1b)*exp(-cd1b*timevector(1:79))+250;

%M1<Vy<M2
cd1c = 0.08;
theta1c = 38.5;
ypositionvectorairdrag(321:389) = (((2*343*sind(theta1c)*cd1c)+g)/cd1c^2)*(1-exp(-cd1c*timevector(1:69)))-(g*timevector(1:69)/cd1c)+ypositionvectorairdrag(319);
yvelocityvectorairdrag(321:389) = (-g/cd1c)+((cd1c*2*343*sind(theta1c)+g)/cd1c)*exp(-cd1c*timevector(1:69))+329.1;
%% Stage 2 Equations (y) Air Drag
cd2 = 0.0027;
ypositionvectorairdrag(390:885)=(-log(cos(timevector(1:496)*g*cd2))/cd2)+ypositionvectorairdrag(389);
yvelocityvectorairdrag(390:885)=(tan(timevector(1:496)*sqrt(g*cd2))*g/sqrt(g*cd2));
%% Stage 3 & 4
ypositionvectorairdrag(885:910)= 4.2269e+04 + 0.5*(24)*timevector(1:26);
yvelocityvectorairdrag(885:910) = 24-g*timevector(1:26);

ypositionvectorairdrag(910:935)= 4.23e+04 + 0.5*(-24)*timevector(1:26);
yvelocityvectorairdrag(910:935) = 0+g*timevector(1:26);
%% Stage 5
%% Stage 6

%M1<Vy<M2
cd1c = 0.08;
theta1c = 38.5;
ypositionvectorairdrag(321:389) = (((2*343*sind(theta1c)*cd1c)+g)/cd1c^2)*(1-exp(-cd1c*timevector(1:69)))-(g*timevector(1:69)/cd1c)+ypositionvectorairdrag(319);
yvelocityvectorairdrag(321:389) = (-g/cd1c)+((cd1c*2*343*sind(theta1c)+g)/cd1c)*exp(-cd1c*timevector(1:69))+329.1;


%M2<Vy<M3
cd1b = 0.04;
theta1b = 49.4;
ypositionvectorairdrag(242:320) = (((343*3*sind(theta1b)*cd1b)+g)/cd1b^2)*(1-exp(-cd1b*timevector(1:79)))-(g*timevector(1:79)/cd1b)+ypositionvectorairdrag(242);
yvelocityvectorairdrag(242:320) = (-g/cd1b)+((cd1b*343*3*sind(theta1b)+g)/cd1b)*exp(-cd1b*timevector(1:79))+250;

%Vy>M3
ypositionvectorairdrag(1:242) = (((v0*sind(theta)*cd1a)+g)/cd1a^2)*(1-exp(-cd1a*timevector(1:242)))-(g*timevector(1:242)/cd1a);
yvelocityvectorairdrag(1:242) = (-g/cd1a)+((cd1a*v0*sind(theta)+g)/cd1a)*exp(-cd1a*timevector(1:242));

%% Plots for projectile motion with both no airdrag(blue) and airdrag(orange)

% X-position vs Time
figure(1)
subplot(3,1,1)
plot(timevector,xpositionvectornoairdrag);
hold on
subplot(3,1,1)
plot(timevector(1:1820),xpositionvectorairdrag);
title('x(t) of the Paris Gun Projectile');
xlabel('time (s)');
ylabel('x-position (m)');
legend('No Air Drag','Air Drag');


% X-velocity vs Time
subplot(3,1,2)
plot(timevector,xvelocityvectornoairdrag);
title('Vx(t) of the Paris Gun Projectile');
xlabel('time (s)');
ylabel('x-velocity (m/s)');
hold on;
subplot(3,1,2)
plot(timevector(1:1820),xvelocityvectorairdrag);
legend('No Air Drag','Air Drag');

% X-velocity vs X-position
subplot(3,1,3)
plot(xpositionvectornoairdrag,xvelocityvectornoairdrag);
title('Vx(x) of the Paris Gun Projectile');
xlabel('x-position (m)');
ylabel('x-velocity (m/s)');
hold on
subplot(3,1,3)
plot(xpositionvectorairdrag,xvelocityvectorairdrag);
legend('No Air Drag','Air Drag');


% Figure 2 is y components and total plot
% Y-position vs Time
figure(2)
subplot(3,1,1)
plot(timevector,ypositionvectornoairdrag);
title('y(t) of the Paris Gun Projectile');
xlabel('time (s)');
ylabel('y-position (m)');
hold on
subplot(3,1,1)
plot(timevector,ypositionvectorairdrag);
legend('No Air Drag','Air Drag');

% Y-velocity vs Time
subplot(3,1,2)
plot(timevector,yvelocityvectornoairdrag);
title('Vy(t) of the Paris Gun Projectile');
xlabel('time (s)');
ylabel('y-velocity (m/s)');
hold on
subplot(3,1,2)
plot(timevector,yvelocityvectorairdrag);
legend('No Air Drag','Air Drag');

% Y-velocity vs Y-position
subplot(3,1,3)
plot(ypositionvectornoairdrag,yvelocityvectornoairdrag);
title('Vy(y) of the Paris Gun Projectile');
xlabel('y-position (m)');
ylabel('y-velocity (m/s)');
hold on
subplot(3,1,3)
plot(ypositionvectorairdrag,yvelocityvectorairdrag);
legend('No Air Drag','Air Drag');

% Y-position vs X-position (Total Flight)
figure(3)
plot(xpositionvectornoairdrag,ypositionvectornoairdrag)
title('y(x) of the Paris Gun Projectile')
xlabel('x-position (m)')
ylabel('y-position (m)')
hold on
plot(xpositionvectorairdrag,ypositionvectorairdrag(1:1820))
plot(xpositionvectorairdrag(242),ypositionvectorairdrag(242),'kx');
plot(xpositionvectorairdrag(320),ypositionvectorairdrag(320),'kx');
plot(xpositionvectorairdrag(389),ypositionvectorairdrag(389),'kx');
plot(xpositionvectorairdrag(885),ypositionvectorairdrag(885),'kx');
plot(xpositionvectorairdrag(910),ypositionvectorairdrag(910),'kx');
plot(xpositionvectorairdrag(935),ypositionvectorairdrag(935),'kx');
plot(xpositionvectorairdrag(242),ypositionvectorairdrag(242),'kx');
legend('No Air Drag','Air Drag','Stage 1a','Stage 1b','Stage 1c','Stage 2','Stage 3', 'Stage 4','Stage 5a');

