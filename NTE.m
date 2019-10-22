function v = NTE(X)

load('ADJ.mat','AdjcentMatrix');
for i = 1:length(AdjcentMatrix)

    d = find(AdjcentMatrix(i,:) == 1);
    D(i) = length(d);

end

Point = zeros(length(AdjcentMatrix),1);

for i = 1:length(AdjcentMatrix)
     d = find(AdjcentMatrix(i,:) == 1);
     for j = 1:length(d)
        
        d1 = find(AdjcentMatrix(d(j),:) == 1);
        e = intersect(d,d1);
        Point(i) = Point(i) + (length(e) + 1)/min([D(i),D(d(j))]);

    end

end

v = sum(Point(X));

end