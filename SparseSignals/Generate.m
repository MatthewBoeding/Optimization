function A = Generate(M, N, measure)
    A = zeros(M,N);
    if measure == 1
        I = eye(N);
        cols = randi(N,M,1);
        A = I(cols,:);
    elseif measure == 2
        D = dct(eye(N,N));
        cols = randi(N,M,1);
        A = D(cols, :);        
    else
        A = randn(M,N);
        A = orth(A')';        
    end
end