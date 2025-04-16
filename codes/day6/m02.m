%% Data
N = 2;  % 2-component
unary = cell(1, N);  % For storing single-component isotherm data

% Water (i=1)
unary{1} = [11302.2610129966	1.36700000000000
14364.6529853734	34.3890000000000
9340.51863399253	0.543000000000000
28470.7854653153	38.5490000000000
19445.1261937855	36.6080000000000
5590.66087161370	0.188000000000000
8029.28485475674	0.454000000000000
4723.04409949260	0.166000000000000];

% Ethanol (i=2)
unary{2} = [12.5900000000000	0.333000000000000
127.200000000000	7.59500000000000
1609	12.3150000000000
1.70000000000000	0.0350000000000000
170	8.75300000000000
235	9.75500000000000
2591	12.6910000000000
29	1.10500000000000
324.900000000000	10.3280000000000
43.0900000000000	1.94000000000000
4319	13.6230000000000
449.100000000000	10.8760000000000
4.62600000000000	0.103000000000000
620.900000000000	11.3870000000000
64.0200000000000	3.59100000000000
7200	14.0790000000000
95.1100000000000	6.09100000000000
999.600000000000	11.8020000000000];

binary = [4655.70000000000	75.3760000000000	0.971200000000000	5.30690000000000
4034.20000000000	4791.30000000000	0.514140000000000	13.5640000000000
993.760000000000	6567.20000000000	0.0925440000000000	14.1030000000000
3401.40000000000	5464.50000000000	0.349740000000000	13.8620000000000
482.410000000000	7080.80000000000	0.0526630000000000	14.1460000000000
2617.30000000000	5664.20000000000	0.297660000000000	13.8300000000000
282.440000000000	6739.10000000000	0.0249860000000000	14.3180000000000
1724	6481.10000000000	0.169230000000000	14.0560000000000
4198.80000000000	3976.80000000000	0.658300000000000	13.2350000000000
4641.80000000000	46.5730000000000	0.577310000000000	2.68310000000000
4621.50000000000	3082.80000000000	0.752380000000000	12.8810000000000
4709.40000000000	30.4150000000000	0.385560000000000	1.36690000000000
4631.40000000000	239.940000000000	1.21470000000000	9.82450000000000];

%% Part 1
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
    [minlnP(i), fval, exitflag, output, jacobian] = fsolve(isotherm{i}, min(lnP), options)
end

%% Part 3: Plotting
p_range = linspace(min(minlnP), max(maxlnP), 100);
hold on
semilogx(exp(p_range), isotherm{1}(p_range), 'b')
semilogx(exp(p_range), isotherm{2}(p_range), 'r')

%% Part 4
figure;
semilogx(binary(:,2), binary(:,3), 'bo')
hold on; semilogx(binary(:,2), binary(:,4), 'r^')
xlabel('p_{EtOH} / [Pa]')
ylabel('Loading N [molec/uc]')

%% Part 5
tol = 1e-5;
ads_pot = cell(1, N);
for i = 1 : N
    ads_pot{i} = @(y)integral(isotherm{i}, minlnP(i), y);

    % Alternative analytical implementation using the polynomial coefficients; see the end of this file.
    % ads_pot{i} = @(y)piecewise_polynomial_ads_pot(y, isotherm_pp, minlnP(i));
end

%% Parts 6 & 7
binary_reduced =binary([1, 7, 13], :);
ndata = size(binary_reduced, 1);

options = optimset('FinDiffType', 'central', 'FunValCheck', 'on', 'MaxFunEvals', 800, 'MaxIter', 100, 'TolFun', 1e-6, 'TolX', 1e-6, 'Display', 'iter');
z = zeros(ndata, 2*N-1);
err = zeros(ndata, 2*N-1);
lnP0 = zeros(ndata, N);
psi = zeros(ndata, N);
N_tot = zeros(ndata, 1);
Z = zeros(ndata, N);
lnP0 = zeros(ndata, N);

lnP_binary = log(binary_reduced(:,1:2));
for i = 1:ndata
    fprintf('\n======Data point %d ======\n', i);
    % Part 6
    func = @(x)IAST_func(x, lnP_binary(i, :), ads_pot);
    lb = [zeros(1, N-1), minlnP];  % First N-1 values are lower bounds for z_i, last N values are lower bounds for lnP_i^0
    ub = [ones(1, N-1), 2*maxlnP];  % First N-1 values are upper bounds for z_i, last N values are upper bounds for lnP_i^0
    x0 = [ones(1, N-1) * 1/N, lnP_binary(i, :) - log(1/N)];  % lnP_i^0 = lnP_i - lnz_i
    [z1, resnorm, residual, exitflags(i), output, lambda, jacobian] = lsqnonlin(func, x0, lb, ub, options)

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

%% Part 7: Displaying IAST predicted data
err
lnP0
psi
hold on
semilogx(binary_reduced(:,2), N_predicted(:, 1), 'bo', 'MarkerFaceColor', 'b')
semilogx(binary_reduced(:,2), N_predicted(:,2), 'r^',  'MarkerFaceColor', 'r')

%% Nonlinear equation systems
function [err, lnP0, psi] = IAST_func(x, lnP, ads_pot)
% IAST equations for N-component systems
%
% Syntax
%   y = IAST_func(x, lnP, ads_pot)
%
% Description
%   x(i), 1<=i<=N-1: absorbed-phase mole fraction for the i-th component
%   x(N-1+i), 1<=i<=N: ln p_i^0
%   lnP(i), 1<=i<=N: ln(bulk phase pressure)

tol = 1e-5;

N = numel(lnP);
z = [x(1:N-1), 1-sum(x(1:N-1))];  % x1, x2, ..., xN = 1-x1-x2-...-x(N-1)

err = zeros(1, 2*N-1);
lnP0 = x(N:2*N-1);
psi = zeros(1, N);

psi(N) = ads_pot{N}(lnP0(N));
for i = 1:N-1
    psi(i) = ads_pot{i}(lnP0(i));
    diff = abs(psi(N) - psi(i));  % Eqn. 2: Pi_i^0 (p_i^0) = Pi_N^0 (p_N^0)
    err(N+i) = diff/(psi(N)+tol) + diff/(psi(i)+tol);
end
err(1:N) = exp(lnP-lnP0) - z;  % Eqn. 1: P*y1/P_i^0 - x_i*gamma_i = 0
end

%% Alternative implementation of adsorption potential functions
function y = piecewise_polynomial_ads_pot(maxlnP, isotherm_pp, minlnP)
% Analytical integration of piecewise polynomials to compute adsorption
% potential

% coeffs(j, 1) * [x - breaks(j)] + coeffs(j, 2) for interval [breaks(j), breaks(j+1)]
[breaks, coeffs, num_interval, num_coeffs] = unmkpp(isotherm_pp);

% Extend in both directions so that we can do extrapolations
coeffs = [coeffs(1, 1), coeffs(1,1)*(minlnP-breaks(1))+coeffs(1,2); coeffs; coeffs(end, 1), coeffs(end, 1)*(breaks(end)-breaks(end-1))+coeffs(end, 2)];
breaks = [minlnP, breaks, maxlnP];

% integration constants
prefactor = 1./(num_coeffs+1-[1:num_coeffs]);
exponents = num_coeffs:-1:1;

y = 0;
for j = 1:num_interval+2
    if breaks(j) >= maxlnP
        break;
    elseif breaks(j+1) < maxlnP
        upper_limit = breaks(j+1);
    else
        upper_limit = maxlnP;
    end
    y = y + sum(coeffs(j, :) .* prefactor .* ((upper_limit - breaks(j)).^exponents));
end

end