function Phi = generateGabor(M,N)
    g = zeros(M,1);
    T = zeros(M,N);
    Wf = zeros(M,M);
    for I = 1:M
        g(I,1) = (1/sqrt(M))*exp((1i*2*pi*(I-1)^3)/M);
    end

    T(:,1) = g;
    for J = 2:N
        T(:,J) = circshift(g,J-1);
    end
    
    Phi = zeros(M,N);
    for Q = 1:floor(N/M)
        for I = 1:M
            Wf(I,I) = exp(1i*2*pi*((Q-1)/M)*I);
        end
       index = (Q-1)*M;
       if index == 0
           index = 1;
       end
       Phi(:, index:index+M-1) = Wf*T(:,index:index+M-1);
    end
    if mod(N,M)
       ind = floor(N/M)*M;
       left = N-ind+1;
       Phi(:,ind:N) = Wf*T(:,1:left);
    end
end