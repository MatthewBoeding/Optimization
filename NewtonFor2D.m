function output = NewtonFor2D(f, df, ddf, x0, y0, tol, M)

k = 0;
output = [x0,y0];

while norm(df(x0,y0)) > tol && k < M
    %x0, y0 : old values
    %x1, y1 : new values
    %xold : old value of the vector [x_k, y_k]
    %xnew : new value of the vector [x_{k+1}, y_{k+1}]
    xold = [x0;y0];
    xnew = xold - inv(ddf(x0,y0))*df(x0,y0);
    %update new values

    x0 = xnew(1);
    y0 = xnew(2);
    output = [output ; x0,y0];
end
end