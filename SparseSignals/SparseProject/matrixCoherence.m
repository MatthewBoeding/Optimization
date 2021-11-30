function matrixCoherence(figureNum, M)
%Taking matrix M and figure number, generate a heatmap
%with the coherence of each row/col combination
C = real(M*M);
Xray = [1:size(M,1)];
Yray = [1:size(M,2)]';
figure(figureNum);
colormap('jet');
imagesc(C);
colorbar;
