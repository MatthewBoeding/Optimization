function [PFPSucc, OMPSucc, SNRloc, SNR] = PFP_OMP_Run(M, K, N, sigma, freqSparse);
    PFPSucc = false;
    OMPSucc = false;
    [A,x,y,n,SNR] = SignalGenerations(M, K, N, sigma, freqSparse);
    
    % PFP via SparseLab
    pfpsol = SolvePFP(A, y, N, 'pfp');
    
    %OMP via SparseLab
    ompsol = SolveOMP(A, y, N);
    
    %Calculate Recovery SNR
    e = norm(pfpsol-x);
    %Reconstruction SNR
    PrSNR = 2*(e^2 / (M*(sigma)));
    e = norm(ompsol-x);
    OrSNR= e^2 / (M*(sigma));

    %From Experimentation 0.5 was a good Recovery SNR
    if PrSNR <= 0.5
        PFPSucc = true;
    end
    if OrSNR <= 0.5
        OMPSucc = true;
    end
    %Indexing for our heatmap
    SNRloc = floor(SNR/5) + 6;
end