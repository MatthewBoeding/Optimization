function output = BFGSfor2d(f, df, C0, x0, y0, tol, M)
    %f, df are the function and gradient inputs with C0 as Hessian approximation
    %x0,y0 is the initial guess
    %tol is the tolerance and M is the maximum number of iterations
    
    k=0;
    z = f(x0,y0);
    output = [k, x0,y0, z];

    
    while norm(df(x0,y0)) > tol && k < M
        %x0, y0 : old values
        %x1, y1 : new values
        %xold : old value of the vector [x_k, y_k]
        %xnew : new value of the vector [x_{k+1}, y_{k+1}]
        %C0 : old hessian approximation C_k
        %C1 : new approximation C_{k+1}
        
        xold = [x0;y0];
        xnew = xold - C0*(df(x0,y0));
        
        sk= xnew - xold;
        yk = df(xnew(1),xnew(2)) - df(x0,y0);
        C1 = C0 + (((sk.'*yk+yk.'*C0*yk)*(sk*sk.'))/(sk.'*yk).^2)-((C0*yk*sk.'+sk*yk.'*C0)/(sk.'*yk));
        %update new values
        x0 = xnew(1);
        y0 = xnew(2);
        C0 = C1;
        %add term for each iteration (Rebuilds matrix, should optimize out later)         
        k = k+1;
        output = [output ;  k,x0,y0, f(x0,y0)];
    end
    
end