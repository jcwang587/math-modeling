function f = redlich(x)
    T = 390;
    P = 174;
    R = 0.08314;
    a = 16.82;
    b = 0.02219;
    V = x;
    f = -P+R*T/(V-b)-a/(sqrt(T)*V*(V-b));
end