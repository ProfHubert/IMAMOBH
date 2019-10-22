clear;clc

load('matlab_dat.mat','A')
load('matlab_dat.mat','B')
load('matlab_dat.mat','allppi')
load('matlab_dat.mat','AdjcentMatrix')
load('matlab_dat.mat','piinfocell')
G = graph(AdjcentMatrix,'OmitSelfLoops');

% p = plot(G,'Layout','force','EdgeAlpha',0.005,'NodeColor','r');

Point1 = centrality(G,'eigenvector');


count2 = 0;
count1 = 0;
[B2,I1] = sort(Point1,'descend');
for i = 1 : 450
t = I1(i);
if piinfocell{t,2} == 1 || piinfocell{t,2} == 4
count2 = count2 + 1;
end
end