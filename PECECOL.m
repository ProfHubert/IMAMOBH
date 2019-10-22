clear;clc
load('ADJ.mat', 'AdjcentMatrix')
load('allppi2.mat','allppi')
load('AB.mat','AB')
A = AB(:,1);
B = AB(:,2);
load('PIO.mat','piinfocell')
% for i = 1:length(AdjcentMatrix)
% 
%     d = find(AdjcentMatrix(i,:) == 1);
%     D(i) = length(d);
% 
% end



for i = 1:length(AdjcentMatrix)

    d = find(AdjcentMatrix(i,:) == 1);
    D(i) = length(d);

end

Point7 = zeros(1,length(AdjcentMatrix));
for i = 1:length(AdjcentMatrix)
     d = find(AdjcentMatrix(i,:) == 1);
     for j = 1:length(d)
        
        d1 = find(AdjcentMatrix(d(j),:) == 1);
        e = intersect(d,d1);
        a1 = find(A == i);
        a2 = find(B == d(j));
        a3 = intersect(a1,a2);

        
        if ~isempty(a3)
            bio = 1;
%             for k = 1:size(allppi,2)
% 
%                 bio = bio*allppi(a3,k);
% 
%             end            
            Point7(i) = Point7(i) + (length(e) + 1)/min(D(i),D(d(j)))*allppi(a3,1); 
%             Point1(i) =  Point1(i) + (length(e))^3*c(d(j))/(D(i)*D(d(j)))*bio;
%             Point1(i) =  Point1(i) + (length(e))^2*c(i)*c(d(j))/(D(i)*D(d(j)))*bio;
        else
            a1 = find(B == i);
            a2 = find(A == d(j));
            a3 = intersect(a1,a2);  
%             bio = 1;
%             for k = 1:size(allppi,2)
% 
%                 bio = bio*allppi(a3,k);
% 
%             end            
            Point7(i) = Point7(i) + (length(e) + 1)/min(D(i),D(d(j)))*allppi(a3,1);   
%             Point1(i) =  Point1(i) + (length(e))^3*c(d(j))/(D(i)*D(d(j)))*bio;
%             Point1(i) =  Point1(i) + (length(e))^2*c(i)*c(d(j))/(D(i)*D(d(j)))*bio;

        end
    end

end


count2 = 0;
count1 = 0;
[B2,I1] = sort(Point7,'descend');
for i = 1 : 200
t = I1(i);
if piinfocell{t,2} == 1 || piinfocell{t,2} == 4
    count2 = count2 + 1;
end
end
