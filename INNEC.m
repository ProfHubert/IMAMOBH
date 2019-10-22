

%%
%imroxaswc@gmail.com
%
%%
function [LP,auprc] = INNEC(AdjcentMatrix,piinfocell,A,B,allppi)
% clear;clc
% load('raw1.mat', 'AdjcentMatrix')
% load('raw1.mat','piinfocell')
% load('raw1.mat','A')
% load('raw1.mat','B')

% load('allppi.mat')

if nargin == 4
    allppi = ones(length(A),1);
end

Point = zeros(length(AdjcentMatrix),1);
Point1 = zeros(length(AdjcentMatrix),1);
for i = 1:length(AdjcentMatrix)

    d = find(AdjcentMatrix(i,:) == 1);
    D(i) = length(d);

end


c = zeros(length(AdjcentMatrix),1);
for i = 1:length(AdjcentMatrix)

    d = find(AdjcentMatrix(i,:) == 1);
    C = [];
    for j = 1:length(d)
        
        d1 = find(AdjcentMatrix(d(j),:) == 1);
        e = intersect(d,d1);
        DD = d(j)*ones(length(e),1);
        C = [C;DD, e'];

        
    end    
    C = unique(C,'rows');
    c(i) = size(C,1)/(D(i)*(D(i)));


end

% 
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
            for k = 1:size(allppi,2)

                bio = bio*allppi(a3,k);

            end            
            Point(i) = Point(i) + (length(e) + 1)/min([D(i),D(d(j))])*bio;      
            Point1(i) =  Point1(i) + (length(e))^3*c(d(j))/(D(i)*D(d(j)))*bio;
%             Point1(i) =  Point1(i) + (length(e))^2*c(i)*c(d(j))/(D(i)*D(d(j)))*bio;
        else
            a1 = find(B == i);
            a2 = find(A == d(j));
            a3 = intersect(a1,a2);  
            bio = 1;
            for k = 1:size(allppi,2)

                bio = bio*allppi(a3,k);

            end            
            Point(i) = Point(i) + (length(e) + 1)/min([D(i),D(d(j))])*bio;        
            Point1(i) =  Point1(i) + (length(e))^3*c(d(j))/(D(i)*D(d(j)))*bio;
%             Point1(i) =  Point1(i) + (length(e))^2*c(i)*c(d(j))/(D(i)*D(d(j)))*bio;

        end
    end

end


[B1,I] = sort(Point,'descend');
[B2,I2] = sort(Point1,'descend');


RankLabel = piinfocell(I,3);
RankLabelmat = cell2mat(RankLabel);
RankLabel1 = piinfocell(I2,3);
NNEC = cell2mat(RankLabel1);

%% 计数
count2 = 0;
count1 = 0;
[B2,I1] = sort(Point,'descend');
for i = 1 : 300
t = I1(i);
if piinfocell{t,2} == 1 || piinfocell{t,2} == 4
    count2 = count2 + 1;
end
end

%% AUC曲线
% count = 0;
% count1 = 0;
% TP6 = [];
% Re6 = [];
% Ree1 = [];
% TPP1 = [];
% EL = 0;
% for i = 1 : length(NNEC)
%     
%     t = NNEC(i);
%     if piinfocell{t,2} == 1 || piinfocell{t,2} == 4
%         count1 = count1 + 1;     
%     end
%         
% end
% EL = count1
% count1 = 0;
% for i = 1 : length(NNEC)
%     
%     t = NNEC(i);
%     if piinfocell{t,2} == 1 || piinfocell{t,2} == 4
%         count1 = count1 + 1;
%         m = count1/i;
%         TP6 = [TP6,m];
%         m = count1/EL;
%         Re6 = [Re6,m];          
%         Ree1 = [Ree1, i];
%         TPP1 = [TPP1,count1];         
%         
%     end
%         
% end
% 
% global rec;
% global pre;
% global x;
% global y;
% rec = [Re6];
% pre = [TP6];
% 
% x = [Ree1];
% y = [TPP1];
% 
% auprc = [];
% for c = 1
%     auprc(c) = 0.5*pre(c,1)*rec(c,1);
%     for i=2:length(pre(c,:))
%         auprc(c) = auprc(c)+0.5*(pre(c,i)+pre(c,i-1))*(rec(c,i)-rec(c,i-1))
%     end
% end
% 
% figure(1)
% plot(rec,pre)
% 
% 
% LP = NNEC;

%%  Jackknife
X_label = [1:1000];
Y_label = [];
value = 0;
[B2,I1] = sort(Point,'descend');
for i = 1:1000
    t = I1(i);
    if piinfocell{t,2} == 1 || piinfocell{t,2} == 4
        value = value + 1;
    end
    Y_label(i) = value;
end
figure(2)
plot(X_label,Y_label) 

%% 计数
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