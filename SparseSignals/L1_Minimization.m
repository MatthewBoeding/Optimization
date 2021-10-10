function [success] = L1_Minimization(M,N,K,method,time)
    options = optimoptions('linprog','Display','none');
    %Generate Signal
    x = SSGen(N,K);
    %Generate Measurement matrix from desired method
    A = MeasGenerate(M,N,method,time);
    y = A*x;

    [M,N] = size(A);
    Atil = [A  -A];
    f = ones(2*N,1);
    xtil = linprog(f,Atil,y,Atil,y,zeros(2*N,1), Inf(2*N,1),options);
    x_hat = xtil(1:N)-xtil(N+1:2*N);

    x_dif = 0;
    for c = 1:N
        x_dif = x_dif + (x_hat(c)-x(c))^2;
    end
        norm2 = norm(x_hat-x); 
        %sqrt(x_dif);

    success = 0;
    if norm2 <= 10e-5
        success = 1;
    end

end