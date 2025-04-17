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
