function matrixCoherence(figureNum, M)
%Taking matrix M and figure number, generate a heatmap
%with the coherence of each row/col combination
Xray = [1:size(M,1)];
Yray = [1:size(M,2)]';
figure(figureNum);
colormap('jet');
imagesc(M, [-1 1]);
axis on;
colorbar;
