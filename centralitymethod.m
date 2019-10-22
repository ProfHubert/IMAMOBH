clear;clc
load('ADJ.mat', 'AdjcentMatrix')
% load('raw1.mat','piinfocell')
% load('raw1.mat','A')
% load('raw1.mat','B')
% load('raw1.mat','allppi')

G = graph(AdjcentMatrix,'OmitSelfLoops');
% p = plot(G,'Layout','force','EdgeAlpha',0.005,'NodeColor','r');

Point1 = centrality(G,'degree');


count2 = 0;
count1 = 0;
[B2,I1] = sort(Point1,'descend');
for i = 1 : 800
t = I1(i);
if piinfocell{t,2} == 1 || piinfocell{t,2} == 4
count2 = count2 + 1;
end
end



