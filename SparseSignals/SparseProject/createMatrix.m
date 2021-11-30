function [A,n] = createMatrix(useCase)
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
%Translate bus relations to full matrix
A = full(Ybus);

%NorAalize each column to allow for reduced coherence
for col = 1:size(A,2)
    A(:, col) = A(:, col)/norm(A(:, col));
end

%Choose a reference bus
ref = randi(n);
%Remove from our measurement bus
A(ref,:) = [];
A(:,ref) = [];

end