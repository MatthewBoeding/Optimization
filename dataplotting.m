%convert table to array (requests mdata1 import)
data1 = table2array(mdata1); 
%divide data for later plotting
x1=data1(:,1);
y1=data1(:,2);
n1=length(x1);

%call least squares method for radius and center point (x0,y0)    
[r,x0,y0] = LeastSquaresDataFittingCircle(data1);
syms x; syms y;
figure; hold on;

%plot dataset
i = 1;
while i<=n1
    plot(x1(i),y1(i), '*');
    i = i+1;
end
%plot data fitting circle
plot(x0 + r*cos(linspace(0,2*pi)),y0 + r*sin(linspace(0,2*pi)),'-');
 
%repeat process for 2-5
%%mdata2
data2 = table2array(mdata2); 
x2=data2(:,1);
y2=data2(:,2);
n2=length(x2);

[r,x0,y0] = LeastSquaresDataFittingCircle(data2);
syms x; syms y;
figure; hold on;

i = 1;
while i<=n2
    plot(x2(i),y2(i), '*');
    i = i+1;
end
plot(x0 + r*cos(linspace(0,2*pi)),y0 + r*sin(linspace(0,2*pi)),'-')

%mdata3
data3 = table2array(mdata3); 
x3=data3(:,1);
y3=data3(:,2);
n3=length(x3);

[r,x0,y0] = LeastSquaresDataFittingCircle(data3);
syms x; syms y;
figure; hold on;

i = 1;
while i<=n3
    plot(x3(i),y3(i), '*');
    i = i+1;
end
plot(x0 + r*cos(linspace(0,2*pi)),y0 + r*sin(linspace(0,2*pi)),'-')

%mdata4
data4 = table2array(mdata4); 
x4=data4(:,1);
y4=data4(:,2);
n4=length(x4);

[r,x0,y0] = LeastSquaresDataFittingCircle(data4);
syms x; syms y;
figure; hold on;

i = 1;
while i<=n4
    plot(x4(i),y4(i), '*');
    i = i+1;
end
plot(x0 + r*cos(linspace(0,2*pi)),y0 + r*sin(linspace(0,2*pi)),'-')


%mdata5
data5 = table2array(mdata5); 
x5=data5(:,1);
y5=data5(:,2);
n5=length(x5);

[r,x0,y0] = LeastSquaresDataFittingCircle(data5);
syms x; syms y;
figure; hold on;

i = 1;
while i<=n5
    plot(x5(i),y5(i), '*');
    i = i+1;
end
plot(x0 + r*cos(linspace(0,2*pi)),y0 + r*sin(linspace(0,2*pi)),'-')