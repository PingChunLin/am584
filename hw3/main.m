%main 
%% Square
clear all; close all; clc;
m = 10;
n = 10;
A = randn(m,n); %Target matrix
%% overdetermined
clear all; close all; clc;
m = 100;
n = 10;
A = randn(m,n); %Target matrix
%% underdetermined
clear all; close all; clc;
m = 10;
n = 100;
A = randn(m,n); %Target matrix
%% ill-conditioned
clear all; close all; clc;
m = 10;
n = 9;
A = randn(m,n); %Target matrix
A = [A A(:,1)];
%%
cn = cond(A);
[Q1,R1] = mgs(A);
absError1 = norm(Q1*R1-A);

%(i)
if m<n %check if underdetermined
    [Q2T,R2T] = qrfactor(A');
    absError2 = norm(Q2T*R2T-A'); 
else
    [Q2,R2] = qrfactor(A);
    absError2 = norm(Q2*R2-A);
end
%(ii)
[Q3,R3] = qr(A);
absError3 = norm(Q3*R3-A);



