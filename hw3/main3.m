clear all; close all; clc;
% part 3
%3a
m_min = 2;
m_max = 20;
count = 1;
for m = m_min:m_max
    for n = 1:m-1
        A = randn(m,n); 
        cn(count,:) = [m,n,cond(A)];
        count = count+1;
       end
end
figure(1)
plot(cn(172:end,2),cn(172:end,3),'linewidth',2)
xlabel("n");
ylabel("condition number of A")
title("Condition number as n increases")

figure(2)
scn= sortrows(cn,2);
plot(scn(20:37,1),scn(20:37,3),'linewidth',2)
xlabel("m");
ylabel("condition number of A")
title("Condition number as m increases")

%% 3b
clear all; close all; clc;
m= 3;
n = m-1;
A = [200,38;4,53;2,7];
A1 = [A A(:,1)];
cn = cond(A1);
dn = det(A1);

%% 3c
clear all; close all; clc;
m= 3;
n = m-1;
A = [200,38;4,53;2,7];
count = 1;
for eps = -14:2
    A = [200,38;4,53;2,7];
    A1 = [A A(:,1)+(10^eps)*rand(m,1)];
    cn(count,:) = [eps,cond(A1)];
    dn(count,:) = [eps,det(A1)];
    count = count+1;
end

figure(3)
plot(cn(:,1),cn(:,2),'linewidth',2)
xlabel("log epsilon");
ylabel("condition number of A")
title("Condition number as epsilon increases")

figure(4)
plot(dn(:,1),dn(:,2),'linewidth',2)
xlabel("log epsilon");
ylabel("determinant of A")
title("deteminant as epsilon increases")
