% This script plots the x-position of the...
clear all; clc; close all

% Constants
vo = 1640; % initial velocity
th = 55; % Launch Angle
cd = 0.001; % drag coefficient

% Variables
t = 0.1:0.1:182

% Equation 4 x(t)
x = (vo.*cos(th)./cd).*(1-exp(-cd.*t));

plot(t, x);
hold on
title