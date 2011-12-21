%% Filter Simulation; MATLAB
% ECEL 303 
% Lab 8
% Fall 2011
% Hicks

clear; clc;

% define our circuit:
f_0 = 363; % (hertz)
omega_c = (2*pi) * (3*f_0); %3*f_0 in rad/s

% define the transfer function, 
%  - from appendix.mm (E. L. Gerber), equation 10:
s = tf('s');
H = omega_c^3 / (s^3 + 2*omega_c*s^2 + 2*omega_c^2*s + omega_c^3);

% system input
t = 0 : 1e-6 : 5e-3;
input = 5 * square( (2*pi*f_0)*t );

% system output, through the transfer function
output = lsim(H, input, t);