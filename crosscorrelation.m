%cross correlation

% x(n)=[3,11,7,0,-1,4,2]; nx = [-3:3]

% y(n)=x(n-2)+w(n)

% ryx = cross(y,x)

%

% noise sequence 1
clear all
close all
clc
[pup fs] = audioread('WS7003328k.wav');
lambda = .9;
D=20;
x = pup(1:5001); nx=[-2500:2500]; % given signal x(n)
b = [1,zeros(1,D-1),lambda];  
 y = filter(b,1,x);  
 audiowrite('aud_sig.wav',y,fs);
 h=impz(b,1);
 ny = nx;
% [y,ny] = sigshift(x,nx,2);              % obtain x(n-2)

% w = randn(1,length(y)); nw = ny;        % generate w(n)

% [y,ny] = sigadd(y,ny,w,nw);             % obtain y(n) = x(n-2) + w(n)

[y,ny] = sigfold(y,ny);                 % obtain y(-n)

[rxy,nrxy] = conv_m(y,ny,x,nx);         % cross-corrlation

subplot(1,1,1)

subplot(2,1,1);stem(nrxy,rxy)

axis([-2000,2000,-3,3]);xlabel('lag variable l')

ylabel('rxy');title('Crosscorrelation: noise sequence 1')


%

%noise sequence 
figure
%%% Generate periodic signal
nx = [-150:150];
x = cos(pi*nx); %periodic with period N = 2
z=x;
y = x;
% [y,ny] = sigshift(x,nx,2);              % obtain x(n-2)
ny = nx;
w = .15*randn(1,length(y)); nw = ny;        % generate w(n)

[y,ny] = sigadd(y,ny,w,nw);             % obtain y(n) = x(n) + w(n)

[y,ny] = sigfold(y,ny);                 % obtain y(-n)

[rxy,nrxy] = conv_m(x,nx,y,ny);         % cross-corrlation
subplot(3,1,1);stem(nx,z)
title('z vs nx')
subplot(3,1,2);stem(nx,y)
title('y vs nx')
subplot(3,1,3);stem(nrxy,rxy./101)
title('autocorrelation')
% basic and easy code

