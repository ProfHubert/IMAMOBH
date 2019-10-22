clear;clc
load('e_coli.mat')
%% 原
% load('ADJ.mat', 'AdjcentMatrix')
% load('PIO.mat','piinfocell')

%%
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
%% 绘图
count = 0;
count1 = 0;
TP6 = [];
Re6 = [];
Ree1 = [];
TPP1 = [];
EL = 0;
[B2,I1] = sort(Point,'descend');
for i = 1 : length(Point)

    t = I1(i);
    if piinfocell{t,2} == 1 || piinfocell{t,2} == 4
        count1 = count1 + 1;     
    end
        
end
EL = count1;
count1 = 0;
for i = 1 : length(Point)
    
    t = I1(i);
    if piinfocell{t,2} == 1 || piinfocell{t,2} == 4
        count1 = count1 + 1;
        m = count1/i;
        TP6 = [TP6,m];
        m = count1/EL;
        Re6 = [Re6,m];          
        Ree1 = [Ree1, i];
        TPP1 = [TPP1,count1];         
        
    end
        
end

global rec;
global pre;
global x;
global y;
rec = [Re6];
pre = [TP6];

x = [Ree1];
y = [TPP1];

auprc = [];
for c = 1
    auprc(c) = 0.5*pre(c,1)*rec(c,1);
    for i=2:length(pre(c,:))
        auprc(c) = auprc(c)+0.5*(pre(c,i)+pre(c,i-1))*(rec(c,i)-rec(c,i-1));
    end
end

figure(1)
plot(rec,pre)
set(gca,'YLim',[0 1]);%Y轴的数据显示范围

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