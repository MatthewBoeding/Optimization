function [r, x0, y0] = LeastSquaresDataFittingCircle(data)
%find length of elements to be called later
L = length(data);

%With a column of 1's as our b vector
b = ones(L,1);

%create A with columns x^2+y^2, x, y
newcol = zeros(L,1);
i=1;
while(i<= L)
    newcol(i) = -(data(i,1).^2+ data(i,2).^2);
    i=i+1;
end
A = [newcol, data];

%solve min ||Ax-b||^2
C = (A'*A)\(A'*b);

%the return values x0, y0, r 
x0= (C(2)/(2*C(1)));
y0= (C(3)/(2*C(1)));
r = sqrt((-(1)/C(1))+x0^2+y0^2);
end

