load Escherichia_coli_str_K_12_substr_MG1655.mat

LP.A          = model.S;
LP.obj        = model.c;
LP.rhs        = model.b;
LP.sense      = '=';
LP.lb         = model.lb;
LP.ub         = model.ub;
LP.modelsense = 'max';
result = gurobi(LP);
grMax  = result.objval;

disp('Part2')
iEx = find(contains(model.rxns, 'EX_'));
iUpt = find(result.x(iEx)<0);
fluxName = model.rxns(iEx(iUpt));
fluxValue = result.x(iEx(iUpt));
table(fluxName, fluxValue)

iScr = find(result.x(iEx)>0);
fluxName = model.rxns(iEx(iScr));
fluxValue = result.x(iEx(iScr));
table(fluxName, fluxValue)
% 
disp('Part 3')
% Block each non-zero secretion flux to check for alternative optima
grBlock = zeros(1, length(iScr));
params.OutputFlag = 0;
for i = 1:length(iScr)
    LP.ub(iEx(iScr(i))) = 0;
    result = gurobi(LP, params);
    grBlock(i) = result.objval;
    if grBlock(i) >= grMax
        fluxValue = result.x(iEx(iScr));
        disp(['Alternative optima detected with respect to flux ', char(fluxName(i))]);
        table(fluxName, fluxValue)
    end
    LP.ub(iEx(iScr)) = 1000;
end

% % Write table of blocked secretion fluxes and growth rates
growthRate = grBlock';
fluxName = model.rxns(iEx(iScr));
table(fluxName, growthRate)