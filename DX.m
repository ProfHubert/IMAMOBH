function v = DX(X)
load('ADJ.mat','AdjcentMatrix');
for i = 1:length(AdjcentMatrix)

    d = find(AdjcentMatrix(i,:) == 1);
    D(i) = length(d);

end

v = sum(D(X));