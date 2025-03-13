function f = cstr(x)
    ko = 3.493e7;
    E = 11843;
    H = -5960;
    rhoCp = 500;
    UA = 150;
    R = 1.987;
    V = 1;
    q = 1;
    Caf = 10;
    Tf = 298;
    Tj = 298;
    Ca = x(1);
    T = x(2);
    f(1) = q/V*(Caf - Ca) - ko*exp(-E/R/T)*Ca;
    f(2) = q/V*(Tf - T) + -H*ko/rhoCp*exp(-E/R/T)*Ca + UA/(rhoCp*V)*(Tj-T);
    f=f';
end
