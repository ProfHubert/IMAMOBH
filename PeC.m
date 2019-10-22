clear;clc
load('data1.mat')


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
           
            Point7(i) = Point7(i) + (length(e) + 1)/min(D(i),D(d(j)))*allppi(a3,1); 

        else
            a1 = find(B == i);
            a2 = find(A == d(j));
            a3 = intersect(a1,a2);  
        
            Point7(i) = Point7(i) + (length(e) + 1)/min(D(i),D(d(j)))*allppi(a3,1);   


        end
    end

end


count2 = 0;
count1 = 0;
[B2,I1] = sort(Point7,'descend');
for i = 1 : 450
t = I1(i);
if piinfocell{t,2} == 1 || piinfocell{t,2} == 4
    count2 = count2 + 1;
end
end

%% 绘图
% count = 0;
% count1 = 0;
% TP6 = [];
% Re6 = [];
% Ree1 = [];
% TPP1 = [];
% EL = 0;
% [B2,I1] = sort(Point7,'descend');
% for i = 1 : length(Point7)
% 
%     t = I1(i);
%     if piinfocell{t,2} == 1 || piinfocell{t,2} == 4
%         count1 = count1 + 1;     
%     end
%         
% end
% EL = count1;
% count1 = 0;
% for i = 1 : length(Point7)
%     
%     t = I1(i);
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
%         auprc(c) = auprc(c)+0.5*(pre(c,i)+pre(c,i-1))*(rec(c,i)-rec(c,i-1));
%     end
% end
% 
% figure(1)
% plot(rec,pre)
% set(gca,'YLim',[0 1]);%Y轴的数据显示范围

%%  Jackknife
X_label = [1:1000];
Y_label = [];
value = 0;
[B2,I1] = sort(Point7,'descend');
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
[B2,I1] = sort(Point7,'descend');
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