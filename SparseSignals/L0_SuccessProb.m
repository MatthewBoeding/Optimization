function L0_SuccessProb()
    tic
    res = zeros(6,4);
    found = 0;
        for i=1:6
            if i == 1
                m = 5;
            else
                m = (i-1)*10;
            end
                res(i,1) = m;
                v = ['Beginning M = ',num2str(m)];
                disp(v)
                for k=1:3
                    v = ['Method: ',num2str(k)]
                    c = 0;
                    parfor (j=1:50,4)
                        [found,loc] = L0_Minimization(m, 100, 3, k);
                        if found == 1
                            c = c + 1;
                        end
                    end
                toc
                res(i,1+k) = c;
                end
        end
    for q=1:3
        plot(res(1,q+1));
        hold on;
    end
    res
    legend('Random Time', 'Random Frequency', 'Random');
    toc
end