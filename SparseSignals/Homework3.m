function Homework3()
    recoveryRate = zeros(10,7);
    time = 0;
    for p = 1:6
        for j = 1:10
            M = j*10;
            recoveryRate(j,1) = M;
            rate = 0;
            for i = 1:100
               success = L1_Minimization(M,256,5,p,time);
               if success == 1
                   rate = rate + 1;
               end
            end
           recoveryRate(j,p+1) = rate
        end
        h = bar(recoveryRate(:,1),recoveryRate(:,2:7));
        grid on
        l = cell(1,6);
        l{1} = 'Random Time'; l{2} = 'Equi-Spaced Time'; l{3}= 'DCT'; l{4} = 'Low Freq Sample'; l{5} = 'Equispaced Freq'; l{6} = 'Random';
        legend(h,l);
        legend('Location', 'northwestoutside');
    end
end