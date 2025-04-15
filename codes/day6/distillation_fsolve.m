function f = distillation_fsolve(x,model)

F = model.feedFlow;
xF = model.feedComp;
relVol = model.relVol;
N = model.numStages;
Nf = model.feedStage;
Vflow = model.vaporFlow;
R = model.refluxFlow;

% Definition of state vector: 3N+5 unknowns
% x = [B xB yB L1 x1 y1 L2 x2 y2 ... LN-1 xN-1 yN-1 LN xN yN D xD]
% Strip variables out of state vector
B = x(1);
xB = x(2);
yB = x(3);
D = x(3*N+4);
xD = x(3*N+5);
Lflow = [];
Lcomp = [];
Vcomp = [];
for i = 1:N
    Lflow = [Lflow x(3*i+1)];
    Lcomp = [Lcomp x(3*i+2)];
    Vcomp = [Vcomp x(3*i+3)];
end

% Calculate equations
f(1) = Lflow(1)-Vflow-B;
f(2) = Lflow(1)*Lcomp(1)-Vflow*yB-B*xB;
f(3) = yB-relVol*xB/(1+(relVol-1)*xB);
for i = 1:N
    if i == 1
        f(3*i+1) = Lflow(i+1)-Lflow(i);
        f(3*i+2) = Lflow(i+1)*Lcomp(i+1)+Vflow*yB-Lflow(i)*Lcomp(i)-Vflow*Vcomp(i);
        f(3*i+3) = Vcomp(i)-relVol*Lcomp(i)/(1+(relVol-1)*Lcomp(i));
    elseif i == Nf
        f(3*i+1) = F+Lflow(i+1)-Lflow(i);
        f(3*i+2) = F*xF+Lflow(i+1)*Lcomp(i+1)+Vflow*Vcomp(i-1)-Lflow(i)*Lcomp(i)-Vflow*Vcomp(i);
        f(3*i+3) = Vcomp(i)-relVol*Lcomp(i)/(1+(relVol-1)*Lcomp(i));
    elseif i == N
        f(3*i+1) = R-Lflow(i);
        f(3*i+2) = R*xD+Vflow*Vcomp(i-1)-Lflow(i)*Lcomp(i)-Vflow*Vcomp(i);
        f(3*i+3) = Vcomp(i)-relVol*Lcomp(i)/(1+(relVol-1)*Lcomp(i));
    else
        f(3*i+1) = Lflow(i+1)-Lflow(i);
        f(3*i+2) = Lflow(i+1)*Lcomp(i+1)+Vflow*Vcomp(i-1)-Lflow(i)*Lcomp(i)-Vflow*Vcomp(i);
        f(3*i+3) = Vcomp(i)-relVol*Lcomp(i)/(1+(relVol-1)*Lcomp(i));
    end
end
f(3*N+4) = Vflow-R-D;
f(3*N+5) = Vflow*Vcomp(N)-R*xD-D*xD;

end