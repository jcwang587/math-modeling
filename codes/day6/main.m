%% Load data
clear;
clc;
N = 2;
unary = cell(2);
load data.mat

%% Part 1
figure(1)
semilogx(unary{1}(:,1), unary{1}(:,2), 'bo')
hold on; semilogx(unary{2}(:,1), unary{2}(:,2), 'r^')
xlabel('p / [Pa]')
ylabel('Loading N [molec/uc]')

%% Parts 2 & 3
isotherm = cell(1, N);
maxlnP = zeros(1, N);  % For storing the maximum pressure in the isotherm data
minlnP = zeros(1, N);
options = optimset('FinDiffType', 'central', 'FunValCheck', 'on', 'MaxFunEvals', 600, 'MaxIter', 100, 'Display', 'off');

for i = 1 : N
    lnP = log(unary{i}(:,1));
    maxlnP(i) = max(lnP);
    [lnP, indices] = sort(lnP);
    unary{i} = unary{i}(indices, :);

    % Part 2
    isotherm_pp = griddedInterpolant(lnP, unary{i}(:,2), 'linear');
    isotherm{i} = @(x)isotherm_pp(x);

    % Part 3
    [minlnP(i), fval, exitflag, output, jacobian] = fsolve(isotherm{i}, min(lnP), options);
end

%% Part 3: Plotting
p_range = linspace(min(minlnP), max(maxlnP), 100);
hold on
semilogx(exp(p_range), isotherm{1}(p_range), 'b')
semilogx(exp(p_range), isotherm{2}(p_range), 'r')

%% Part 4
figure(2)
semilogx(binary(:,2), binary(:,3), 'bo')
hold on; semilogx(binary(:,2), binary(:,4), 'r^')
xlabel('p_{EtOH} / [Pa]')
ylabel('Loading N [molec/uc]')

%% Part 5
tol = 1e-5;
ads_pot = cell(1, N);
for i = 1 : N
    ads_pot{i} = @(y)integral(isotherm{i}, minlnP(i), y);
end

%% Parts 6 & 7
binary_reduced =binary([1, 7, 13], :);
ndata = size(binary_reduced, 1);

options = optimset('FinDiffType', 'central', 'FunValCheck', 'on', 'MaxFunEvals', 800, 'MaxIter', 100, 'TolFun', 1e-6, 'TolX', 1e-6, 'Display', 'iter');
z = zeros(ndata, 2*N-1);
err = zeros(ndata, 2*N-1);
psi = zeros(ndata, N);
N_tot = zeros(ndata, 1);
Z = zeros(ndata, N);
lnP0 = zeros(ndata, N);
exitflags = zeros(ndata);

lnP_binary = log(binary_reduced(:,1:2));
for i = 1:ndata
    fprintf('\n======Data point %d ======\n', i);
    % Part 6
    func = @(x)IAST_func(x, lnP_binary(i, :), ads_pot);
    lb = [zeros(1, N-1), minlnP];  % First N-1 values are lower bounds for z_i, last N values are lower bounds for lnP_i^0
    ub = [ones(1, N-1), 2*maxlnP];  % First N-1 values are upper bounds for z_i, last N values are upper bounds for lnP_i^0
    x0 = [ones(1, N-1) * 1/N, lnP_binary(i, :) - log(1/N)];  % lnP_i^0 = lnP_i - lnz_i
    [z1, resnorm, residual, exitflags(i), output, lambda, jacobian] = lsqnonlin(func, x0, lb, ub, options);

    % Part 7. Below is written for a general N-component mixture
    z(i, :) = z1;
    [err(i, :), lnP0(i, :), psi(i, :)] = func(z1);
    Z(i, 1:N-1) = z1(1:N-1);
    Z(i, N) = 1 - sum(Z(i, 1:N-1));
    for j = 1 : N
        N_tot(i) = N_tot(i) + Z(i, j) / isotherm{j}(lnP0(i, j));  % Eqn. 3
    end
    N_tot(i) = 1 / N_tot(i);

end
N_predicted = N_tot .* Z;  % Eqn. 4

%% Part 7: Display IAST predicted data
hold on
semilogx(binary_reduced(:,2), N_predicted(:, 1), 'bo', 'MarkerFaceColor', 'b')
semilogx(binary_reduced(:,2), N_predicted(:,2), 'r^',  'MarkerFaceColor', 'r')
