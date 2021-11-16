function Homework4(N,activity)
tic
if activity == 1
    Activity1(N)
else
   Activity2(N) 
end
toc
end

function Activity2(N)
    M=23;
    %K=5;
    sigma=0;
    freqSparse=0;
    success = 0;
    val = 0;
    for K = 2:5
    for i = 1:100
    Phi = generateGabor(M, N);
    [A,x,y,n,SNR] = SignalGenerations(M, K, N, sigma, freqSparse);
    y = Phi*x;
    y = y+n;
    f = abs((Phi')*y);
    [find(x),find(f >= min(maxk(f,K)))];
    if find(x) == find(f >= min(maxk(f,K)))
        success = success + 1;
        val = val + min(maxk(f,K));
    end
    end
    success;
    val = val/success;
    [success, val]
    success = 0;
    val = 0;
    plot(f)
    end
end

function Activity1(N)
    %Setup Variables for plotting
    measSNR = zeros(10,1);
    Mref = zeros(10,1);
    for i = 1:10
        measSNR(i) = -30 + (i*5);
        Mref(i) = 0.1*i;
    end
    pfpSuccess = zeros(10,10);
    ompSuccess = zeros(10,10);
    totSample = zeros(10,10);
    
    %Iteration time, Using K=1-5, test the success rate of algorithms for
    %various SNR and 10-100% sampling rates.
    for K = 3:5
        for M = 1:10
            temp = zeros(3,10);
            for sig = 1:20
                sigma = 0.075*sig;
                for iter = 1:20
                    [PFPSucc, OMPSucc, SNRloc, SNR] = PFP_OMP_Run(M*25, K, N, sigma, 0);
                    [SNR,SNRloc,PFPSucc,OMPSucc];
                    if 0 < SNRloc && SNRloc <= 10
                        if PFPSucc == 1
                            temp(1,SNRloc) = temp(1,SNRloc)+1;
                        end
                        if OMPSucc == 1
                            temp(2,SNRloc) = temp(2,SNRloc)+1;
                        end
                            temp(3,SNRloc) = temp(3,SNRloc)+1;
                    end
                end
            end
            pfpSuccess(M,:) = pfpSuccess(M,:) + temp(1,:);
            ompSuccess(M,:) = ompSuccess(M,:) + temp(2,:);
            totSample(M,:) = totSample(M,:)+ temp(3,:);
        end
    end
    
    %Test our sampled results and generate a heatmap
    pfpSuccess = pfpSuccess./totSample;
    ompSuccess = ompSuccess./totSample;
    heatmap(pfpSuccess,measSNR,Mref);
end

function [A,x,y,n, SNR] = SignalGenerations(M, K, N, sigma, freqSparse);
    n = normrnd(0,sigma^2,[M,1]);
    SNR = 10*log(sqrt(K)/sqrt((sum(n.^2))));
    % Measurement Matrix
    A = randn(M,N);
    A = normc(A);

    % Account for Sparse in Frequency Domain
    if freqSparse == 1
        D = (1/sqrt(N))*(dct(eye(N)));
        A = A*D;
    end

    % Sparse Signal Generation
    x=zeros(N,1);
    pm = randperm(N);
    x(pm(1:K))=randn(K,1);
    x(find(x)) = ones(K,1);
    % Output
    y=(A*x) + n;
end