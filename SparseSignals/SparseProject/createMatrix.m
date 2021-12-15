function [A,M,B,n] = createMatrix(useCase, refBus, genBus);
%Matpower cases for testing (see their documentation
%Small: case300, case145, case118
%Synthetic(large): case_ACTIVSg2000
caseCall = useCase;

%Get number of nodes and node indexes
%For our specific case
mpc = ext2int(caseCall);
n = size(mpc.bus,1);

%Create Bus Admittance Matrices
[Ybus, Yf, Yt] = makeYbus(mpc.baseMVA, mpc.bus, mpc.branch);
%Create incidence matrices 
M = zeros(size(Yf));
YfFull = full(Yf);
M = real(YfFull)';
Mi = zeros(size(M));
Mi(M > 0) = 1;
Mi(M < 0) = -1;

%Create reactance Matrix
Wb = diag((useCase.branch(:,4)).^(-1));
B = Mi * Wb * Mi';
%Choose a reference bus
ref = refBus;
%Remove from our measurement bus
%B = imag(full(Ybus));
B(ref,:) = [];
B(:,ref) = [];

Mi(ref,:) = [];

%Measurement Matrix Formation
B1 = inv(B);
[Q,R] = qr(B);
Q = Q';
A = Q*Mi;
A = normc(A);
M = Mi;
end