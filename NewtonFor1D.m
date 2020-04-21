function output = NewtonFor1D(f, df, ddf, x0, eps, M)

k = 0;
output = zeros(M,1);
output(1,1) = x0;
while abs(df(x0)) > eps && k < M
    %x0 : old values
    %x1 : new values
    x1 = x0 - df(x0)/ddf(x0);
    %update new values
    k = k + 1;
    x0 = x1;
    output(k+1,1) = x0;
end