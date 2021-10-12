function [found, y] = L0_Minimization (M, N, K, measure)
    warning('off', 'MATLAB:rankDeficientMatrix')
    %Create x vector with K nonzero elements
    x=zeros(N,1);
    solution = zeros(N,1);
    pm = randperm(N);
    x(pm(1:K))=randn(K,1);
    %disp('Original Signal Index and values:');
    oracle = find(x);
    q = x(find(x));
    %Create Measurement Matrix A:
    A=Generate(M,N,measure);
    
    %Fun but tricky, having y = (A*x) we want to start with K = 1
    % and find x = y(pseudo-inv(A)) with lowest 0 norm. 
    y = A*x;
    
    %Setup Variables for maximum possible norm and our x values with them
    minx = zeros(N,1);
    minNorm = N+1;
    
    %found variable to break loop once we find our sparse signal with the 
    %smallest zero norm
    found = 0;
    minK = zeros(1,3);
    %Start with k-sparse signal with k=1 going up to k=5
    for c = 3:3
      %Create options for sparse signals
      Ktup = nchoosek([1:N],c)';
      %variable to loop over these options
      m = size(Ktup,2);
      for k = 1:m
      %break condition    
      if found == 0
          tempk = Ktup(:,k).';
          %Pseudo Inverse
          Ar = zeros(M,N);
          Ar(:,[tempk]) = A(:,[tempk]);
          %Ar = A([tempk],:);
          %At = Ar.';
          %Ai = pinv(Ar); %inv((At)*(Ar))*At;
          tempx = Ar\y;
          norm = c;
          T = [tempx,x];
          if sum(abs(diff(T,1,2))) < 1e-10
                if norm < minNorm
                    solution = zeros(N,1);
                    solution(tempk) = tempx(tempk);
                    minNorm = norm;
                    minK = tempk;
                    found = 1;
                end
          end
      end
      end
    end   
if found == 1
%disp('Solution found!');
    y=solution(minK);
end
end