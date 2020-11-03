clear all; close all; clc;
delta = 0.001;
%2a
x = [1.920:delta:2.080];
%2a
rhs = x.^9 -18*x.^8 + 144*x.^7 -672*x.^6 + 2016*x.^5 - 4032*x.^4 + 5376*x.^3 - 4608*x.^2 + 2304*x -512;
%2b
lhs = (x -2).^9;
  
figure(1)
plot(x,rhs,'linewidth',2)
hold on 
plot(x,lhs,'linewidth',2)
xlabel("x");
ylabel("p(x)")
legend('RHS','LHS','location','best','fontsize',16)
title("numerical error comparison")


