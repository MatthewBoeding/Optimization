function A = MeasGenerate(M,N,method)
 %Designed for homework 3 file
 %The three methods are time sampling at random,
 %Equidistant time sampling and discrete cosine transform
    if method == 1
        I = eye(N);
        cols = randi(N,M,1);
        A = I(cols,:);
    elseif method == 2
        I = eye(N);
        inter = floor(N/M);
        %Be sure to handle if we don't divide evenly. 
        cols = 1:inter:(inter*M-1);
        A = I(cols,:);
    elseif method == 3
        D = dct(eye(N));
        cols = randi(N,M,1);
        A = D(cols,:);    
    elseif method == 4
        D = dct(eye(N));
        A = D(1:M,:);
    elseif method == 5
        D = dct(eye(N));
        inter = floor(N/M);
        %Be sure to handle if we don't divide evenly. 
        cols = 1:inter:(inter*M-1);
        A = D(cols,:);
    elseif method == 6
        A = randn(M,N);
        A = normc(A);
    end
end