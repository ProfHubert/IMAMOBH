function v = GE(X)
load('AB.mat','AB')
load('allppi2.mat','allppi')
load('ADJ.mat','AdjcentMatrix');
A = AB(:,1);
B = AB(:,2);
Point = zeros(4979,1);
for i = 1:length(AdjcentMatrix)
     d = find(AdjcentMatrix(i,:) == 1);
     for j = 1:length(d)
        
        a1 = find(A == i);
        a2 = find(B == d(j));
        a3 = intersect(a1,a2);
        
        if ~isempty(a3)
       
            Point(i) = Point(i) + allppi(a3,1);      

        else
            
            a1 = find(B == i);
            a2 = find(A == d(j));
            a3 = intersect(a1,a2);  
        
            Point(i) = Point(i) + allppi(a3,1);        

        end
    end
end

v = sum(Point(X));

end