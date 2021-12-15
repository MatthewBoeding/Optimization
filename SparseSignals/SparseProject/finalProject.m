function successRate = finalProject(useCase);
    define_constants;
    successRate = zeros(3,2);
    successR = singleOutage(useCase, 1);
    successRate(1,2) = successR;
    successRate(1,1) = 1;
    successR = multiOutage(useCase,2);
    successRate(2,2) = successR;
    successRate(2,1) = 1;
    successR = multiOutage(useCase,3);
    successRate(3,2) = successR;
    successRate(3,1) = 1;   
    
end

function successR = multiOutage(useCase,numOut);
    mpc = loadcase(useCase);
    angles = mpc.bus(:,9);
    refBus = find(angles == min(angles));
    [A,M,B,n] = createMatrix(useCase, refBus);
    successes = 0;
    iterations = 0;
    comb = nchoosek(n,numOut);
    combos = nchoosek([1:n],numOut);
    for i = 1:comb
       outs = combos(i,:);
       y = abs(getMeasurements(useCase,1,outs));
       y(refBus,:) = [];
       ompsol = SolveOMP(A, y, size(A, 2), numOut, 'OptTol', 1e-3);
       mat=find(ompsol ~= 0);
       if mat == outs
        successes = successes + 1;
       end
       iterations = iterations + 1;
    end
    successR = successes / iterations;
end

    
function successRate = singleOutage(useCase, load);
    mpc = loadcase(useCase);
    angles = mpc.bus(:,9);
    refBus = find(angles == min(angles));
    [A,M,B,n] = createMatrix(useCase, refBus);
    successes = 0;
    iterations = 0;
    for i = 1:n
       y = getMeasurements(useCase,load,i);
       y(refBus,:) = [];
       ompsol = SolveOMP(A, y, size(A, 2), 1);
       mat=find(ompsol ~= 0);
       T = pinv(A)*y;
       plot(abs(T));
       if mat == i
        successes = successes + 1;
       end
       iterations = iterations + 1;
    end
    successRate = successes / iterations;
end
