%Project 2
%Newton's redo
    x1 = linspace (-10,10,750);
    x2 = linspace (-10,10,750);
    [y,x]= meshgrid(x2,x1);
    %Function and derivative
    f = @(x,y)((x.^2+9*y.^2)/(2));
    df = @(x,y) [x  ; 9*y ];
    ddf = @(x,y) [1,0  ; 0,9 ];
    %Hessian Approximation
    B0 = [1,0;0,1];
    C0 = inv(B0);
    %Initial guess
    x0 = 9;
    y0 = 1;
    tol = 1e-6;
    M = 1000;
    
    output1 = NewtonFor2D(f, df, ddf, x0, y0, tol, M)
    
    %Plot the results
    figure; hold on;
    contour(x,y,((x.^2+9*y.^2)/(2)));
    i = 1;
    sz = size(output1);
    while i < sz(1)
        p1 = [output1(i,1) output1(i,2)];
        i=i+1;
        p2 = [output1(i,1) output1(i,2)];
        plot([p1(1) p2(1)],[p1(2) p2(2)], 'r-*');
     end
%%Task 2
   
    g = @(x,y)(100*(y-x.^2).^2+(1-x).^2);
    dg = @(x,y) [(-400*x*(y-x.^2)-2*(1-x))  ; 200*(y-x.^2)];
    ddg = @(x,y)[(-400*(y-3*x^2)+2), -400*x  ; -400*x , 200];
    %Hessian Approximation
    B0 = [1,0;0,1];
    C0 = inv(B0);
    x0 = -1.2;
    y0 = 1;
    tol = 1e-6;
    M = 1000;
    output2 = NewtonFor2D(g, dg, ddg, x0, y0, tol, M);
    
    i = 1;
    sz = size(output2);
    figure;
    x1 = linspace (-10,20,750);
    x2 = linspace (-20,40,750);
    [x,y]= meshgrid(x1,x2);
    while i < sz(1)
        p1 = [output2(i,1) output2(i,2)];
        i=i+1;
        p2 = [output2(i,1) output2(i,2)];
        plot([p1(1) p2(1)],[p1(2) p2(2)],'r-*');
        hold on;
    end
    contour(x,y,(100*(y-x.^2).^2+(1-x).^2),'-'); hold on;
    axis([-10 20 -20 40]);
    

%Section 1
%%Symmetric Rank 1 Method
    x1 = linspace (-10,10,750);
    x2 = linspace (-10,10,750);
    [y,x]= meshgrid(x2,x1);
    %Function and derivative
    f = @(x,y)((x.^2+9*y.^2)/(2));
    df = @(x,y) [x  ; 9*y ];
    %Hessian Approximation
    B0 = [1,0;0,1];
    C0 = inv(B0);
    %Initial guess
    x0 = 9;
    y0 = 1;
    tol = 1e-6;
    M = 1000;
    
    output3 = SymmetricRank1For2d(f, df, C0, x0, y0, tol, M)
    
    %Plot the results
    figure; hold on;
    contour(x,y,((x.^2+9*y.^2)/(2)));
    i = 1;
    sz = size(output3);
    while i < sz(1)
        p1 = [output3(i,2) output3(i,3)];
        i=i+1;
        p2 = [output3(i,2) output3(i,3)];
        plot([p1(1) p2(1)],[p1(2) p2(2)], 'r-*');
     end
%%Task 2
   
    g = @(x,y)(100*(y-x.^2).^2+(1-x).^2);
    dg = @(x,y) [(-400*x*(y-x.^2)-2*(1-x))  ; 200*(y-x.^2)];
    %Hessian Approximation
    B0 = [1,0;0,1];
    C0 = inv(B0);
    x0 = -1.2;
    y0 = 1;
    tol = 1e-6;
    M = 1000;
    output4 = SymmetricRank1For2d(g, dg, C0, x0, y0, tol, M);
    
    i = 1;
    sz = size(output4);
    figure;
    x1 = linspace (-10,20,750);
    x2 = linspace (-20,40,750);
    [x,y]= meshgrid(x1,x2);
    while i < sz(1)
        p1 = [output4(i,2) output4(i,3)];
        i=i+1;
        p2 = [output4(i,2) output4(i,3)];
        plot([p1(1) p2(1)],[p1(2) p2(2)],'r-*');
        hold on;
    end
    contour(x,y,(100*(y-x.^2).^2+(1-x).^2),'-'); hold on;
    axis([-10 20 -20 40]);
    
%Section 2
%%Task 3
%Project 2 Section 1
%%Symmetric Rank 1 Method
    x1 = linspace (-10,10,750);
    x2 = linspace (-10,10,750);
    [y,x]= meshgrid(x2,x1);
    %Function and derivative
    f = @(x,y)((x.^2+9*y.^2)/(2));
    df = @(x,y) [x  ; 9*y ];
    %Hessian Approximation
    B0 = [1,0;0,1];
    C0 = inv(B0);
    %Initial guess
    x0 = 9;
    y0 = 1;
    tol = 1e-6;
    M = 1000;
    
    output5 = BFGSfor2d(f, df, C0, x0, y0, tol, M)
    
    %Plot the results
    figure; hold on;
    contour(x,y,((x.^2+9*y.^2)/(2)));
    i = 1;
    sz = size(output5);
    while i < sz(1)
        p1 = [output5(i,2) output5(i,3)];
        i=i+1;
        p2 = [output5(i,2) output5(i,3)];
        plot([p1(1) p2(1)],[p1(2) p2(2)], 'r-*');
    end
 %%Task 4   
    g = @(x,y)(100*(y-x.^2).^2+(1-x).^2);
    dg = @(x,y) [(-400*x*(y-x.^2)-2*(1-x))  ; 200*(y-x.^2)];
    %Hessian Approximation
    B0 = [1,0;0,1];
    C0 = inv(B0);
    x0 = -1.2;
    y0 = 1;
    tol = 1e-6;
    M = 1000;
    output6 = BFGSfor2d(g, dg, C0, x0, y0, tol, M);
    
    i = 1;
    sz = size(output6);
    figure;
    x1 = linspace (-10,20,750);
    x2 = linspace (-20,40,750);
    [x,y]= meshgrid(x1,x2);
    while i < sz(1)
        p1 = [output6(i,2) output6(i,3)];
        i=i+1;
        p2 = [output6(i,2) output6(i,3)];
        plot([p1(1) p2(1)],[p1(2) p2(2)],'r-*');
        hold on;
    end
    contour(x,y,(100*(y-x.^2).^2+(1-x).^2),'-'); hold on;
    axis([-10 20 -20 40]);
    