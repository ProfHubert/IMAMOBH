clear;clc
load('matlab_dat.mat','A')
load('matlab_dat.mat','B')
load('matlab_dat.mat','allppi')
load('matlab_dat.mat','AdjcentMatrix')
load('matlab_dat.mat','piinfocell')
% for i = 1:length(AdjcentMatrix)
% 
%     d = find(AdjcentMatrix(i,:) == 1);
%     D(i) = length(d);
% 
% end

Point = zeros(length(AdjcentMatrix),1);

for i = 1:length(AdjcentMatrix)

    d = find(AdjcentMatrix(i,:) == 1);
    D(i) = length(d);

end

for i = 1:length(AdjcentMatrix)

    d = find(AdjcentMatrix(i,:) == 1);
    for j = 1:length(d)
        
        d1 = find(AdjcentMatrix(d(j),:) == 1);
        e = intersect(d,d1);
        Point(i) = Point(i) + (length(e) + 1)/min(D(i),D(d(j)));
        
    end

end


count2 = 0;
count1 = 0;
[B2,I1] = sort(Point,'descend');
for i = 1 : 450
t = I1(i);
if piinfocell{t,2} == 1 || piinfocell{t,2} == 4
    count2 = count2 + 1;
end
end