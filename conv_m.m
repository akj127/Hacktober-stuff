% very basic code of convulation

function [y,ny] = conv_m(x,nx,h,nh)



nyb = nx(1)+nh(1); nye = nx(length(x)) + nh(length(h));

ny = [nyb:nye];

y = conv(x,h);
U = [[10 15 1]; [8 3 1]; [11 17 1]; [5 11 1]; [6 13 1]];
X = [[33 20 1]; [18 7 1]; [37 22 1]; [20 13 1]; [23 16 1]];
U1 = U.U;
U2 = U1*U;
U2_inv = inv(U2);
T = U2\(U1*X);
