function f = binary_mixing(t, x) 
    w1 = 10;
    x1 = 0.1;
    w2 = 2;
    x2 = 0.9;
    rhoa = 10;
    cv = 5;
    h = x(1);
    x3 = x(2);
    f(1) = (w1+w2-cv*sqrt(h))/rhoa;
    f(2) = (w1*(x1-x3)+w2*(x2-x3))/(rhoa*h);
    f = f';
end