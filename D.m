clear;
clc;

load('data1.mat')
Point = [];

for i = 1:length(AdjcentMatrix)

    d = find(AdjcentMatrix(i,:) == 1);
    Point(i) = length(d);

end

%%  Jackknife
% X_label = [1:1000];
% Y_label = [];
% value = 0;
% [B2,I1] = sort(Point,'descend');
% for i = 1:1000
%     t = I1(i);
%     if piinfocell{t,2} == 1 || piinfocell{t,2} == 4
%         value = value + 1;
%     end
%     Y_label(i) = value;
% end
% plot(X_label,Y_label) 

%% ¼ÆÊý
count2 = 0;
count1 = 0;
[B2,I1] = sort(Point,'descend');
for i = 1 : 1000
    t = I1(i);
    if piinfocell{t,2} == 1 || piinfocell{t,2} == 4
        count1 = count1 + 1;
    end
    count2(i) = count1;
end
for i = 100:100:600
    bar(i) = count2(i);
end

bar(bar>0)