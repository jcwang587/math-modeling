clear;
clc;

%% Define model parameters for base case
feedFlow = 1;
feedComp = 0.6;
relVol = 1.4;
numStages = 100;
feedStage = 50;
vaporFlow = 3;
refluxFlow = 2.5;
model.feedFlow = feedFlow;
model.feedComp = feedComp;
model.relVol = relVol;
model.numStages = numStages;
model.feedStage = feedStage;
model.vaporFlow = vaporFlow;
model.refluxFlow = refluxFlow;

%% Define problem size
nEqn = 3*numStages+5;
model.nEqn = nEqn;

%% Definition of state vector: 3N+5 unknowns
% x = [B xB yB L1 x1 y1 L2 x2 y2 ... LN-1 xN-1 yN-1 LN xN yN D xD]
% Specify initial guess for state vector for base case
x0 = 0.1*ones(nEqn,1);

%% Specify options and call fsolve to solve base case
options = [];
% options = optimoptions('fsolve','UseParallel',true);
% [xBase,fval,exitflag,output,jacob] = fsolve('distillation_fsolve',x0,options,model);
% [model.feedComp exitflag]
% if exitflag ~= 1
%     return
% end

%% Perform parametric study for feed compositions
tic;
feedcompRange = 0.1:0.1:0.9;
feedcompResults = [];
% x0 = xBase;
for i = 1:length(feedcompRange)
    model.feedComp = feedcompRange(i);
    [x,fval,exitflag,output,jacob] = fsolve('distillation_fsolve',x0,options,model);
    [feedcompRange(i) exitflag]
    if exitflag == 1
        feedcompResults = [feedcompResults x];
    else
        return
    end
end
toc;

figure(1)
plot(feedcompResults(2:3:end,:))
xlim([1 numStages+2])
xlabel('Stage')
ylabel('Liquid composition')
legend(string(feedcompRange))
title('Feed Composition')
set(gca,'FontSize',14)
