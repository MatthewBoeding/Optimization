function Homework3()
    recoveryRate = zeros(10,7);
    for p = 1:6
        for j = 1:10
            M = j*10;
            recoveryRate(j,1) = M;
            rate = 0;
            for i = 1:100
               success = L1_Minimization(M,256,5,p);
               if success == 1
                   rate = rate + 1;
               end
            end
           recoveryRate(j,p+1) = rate
        end        
    end
end