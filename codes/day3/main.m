%% clear environment
clear
clc

%% Find steady states
% low
xss1 = fsolve(@cstr, [9 300]);
% medium
xss2 = fsolve(@cstr, [5 330]);
% high
xss3 = fsolve(@cstr, [2 360]);

%% ODE
% df = @(t, x) cstr(x);
% xo1 = round(xss1);
% [t1, x1] = ode45(df, [0 100], xo1);
% plotyy(t1, x1(:,1), t1, x1(:,2));

df = @(t, x) cstr(x);
xo2 = round(xss2);
[t2, x2] = ode45(df, [0 100], xo2);
yyaxis right
plot(t2, x2(:,1));
yyaxis left
plot(t2, x2(:,2));
