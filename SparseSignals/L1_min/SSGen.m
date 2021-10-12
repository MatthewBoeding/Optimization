function x = SSGen(N,K)
    % Generate a K sparse signal of length N
    x=zeros(N,1);
    pm = randperm(N);
    x(pm(1:K))=randn(K,1);
end