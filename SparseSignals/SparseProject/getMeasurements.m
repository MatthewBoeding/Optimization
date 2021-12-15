function [y] = getMeasurements(useCase, loadFactor, outage);
define_constants;
%Load Base Case
mpcb = ext2int(useCase);
%Try to mute output from powerflow
mpopt = mpoption('out.all',0,'verbose',2,'out.bus',1); 

mpcb.bus(:,PD) = loadFactor.*mpcb.bus(:,PD);
results = rundcpf(mpcb, mpopt);
%Update Contingency
if size(outage,2) == 1
    mpcb.branch(outage,11)=0; 
else 
    for k = 1:size(outage,2)
        mpcb.branch(outage(1,k),11) = 0;
    end
end
results2 = rundcpf(mpcb, mpopt);

y = results2.bus(:,9) - results.bus(:,9);
return
 