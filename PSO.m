close all
clear;clc
fitness = @(x,y)fitnessfcn(x,y);
nvars = 600;
nobj = 2;
narc = 50;
ncan = 4979;


% load('matlab_dat.mat','A')
% load('matlab_dat.mat','B')
% load('matlab_dat.mat','allppi')
% load('matlab_dat.mat','AdjcentMatrix')
% load('matlab_dat.mat','piinfocell')

load('AB.mat','AB')
load('allppi2.mat','allppi')
load('ADJ.mat','AdjcentMatrix');
A = AB(:,1);
B = AB(:,2);
load('PIO.mat','piinfocell')

G = graph(AdjcentMatrix,'OmitSelfLoops');
% p = plot(G,'Layout','force','EdgeAlpha',0.005,'NodeColor','r');

Point5 = centrality(G,'betweenness');
% Point6 = centrality(G,'closeness');


Point = zeros(ncan,1);

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



for i = 1:length(AdjcentMatrix)

    d = find(AdjcentMatrix(i,:) == 1);
    D(i) = length(d);

end

Point3 = zeros(ncan,1);
Point6 = zeros(ncan,1);
for i = 1:length(AdjcentMatrix)
     d = find(AdjcentMatrix(i,:) == 1);
     for j = 1:length(d)
        
        d1 = find(AdjcentMatrix(d(j),:) == 1);
        e = intersect(d,d1);
        a1 = find(A == i);
        a2 = find(B == d(j));
        a3 = intersect(a1,a2);
        
        if ~isempty(a3)
       
            Point3(i) = Point3(i) + (length(e) + 1)/D(i);      
%             Point6(i) = Point6(i) + allppi(a3,3); 
        else
            
            a1 = find(B == i);
            a2 = find(A == d(j));
            a3 = intersect(a1,a2);  
        
            Point3(i) = Point3(i) + (length(e) + 1)/D(i);        
%             Point6(i) = Point6(i) + allppi(a3,3); 
        end
    end
end



Point1 = zeros(ncan,1);

for i = 1:length(AdjcentMatrix)
     d = find(AdjcentMatrix(i,:) == 1);
     for j = 1:length(d)
        
        d1 = find(AdjcentMatrix(d(j),:) == 1);
        e = intersect(d,d1);
        Point1(i) = Point1(i) + (length(e) + 1)/min([D(i),D(d(j))]);
%          Point1(i) = Point1(i) + (length(e) + 1);
    end

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
            Point7(i) = Point7(i) + (length(e) + 1)/min([D(i),D(d(j))])*allppi(a3,1);      
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
            Point7(i) = Point7(i) + (length(e) + 1)/min([D(i),D(d(j))])*allppi(a3,1);       
%             Point1(i) =  Point1(i) + (length(e))^3*c(d(j))/(D(i)*D(d(j)))*bio;
%             Point1(i) =  Point1(i) + (length(e))^2*c(i)*c(d(j))/(D(i)*D(d(j)))*bio;

        end
    end

end

Point8 = zeros(1,length(AdjcentMatrix));
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
            Point8(i) = Point8(i) + (length(e) + 1) + allppi(a3,1) + allppi(a3,2) + allppi(a3,3);      
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
            Point8(i) = Point8(i) + (length(e) + 1) + allppi(a3,1) + allppi(a3,2) + allppi(a3,3);    
%             Point1(i) =  Point1(i) + (length(e))^3*c(d(j))/(D(i)*D(d(j)))*bio;
%             Point1(i) =  Point1(i) + (length(e))^2*c(i)*c(d(j))/(D(i)*D(d(j)))*bio;

        end
    end

end

Point9 = zeros(1,length(AdjcentMatrix));
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
            Point9(i) = Point9(i) + allppi(a3,2);
            
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
            Point9(i) = Point9(i) + allppi(a3,2);       
%             Point1(i) =  Point1(i) + (length(e))^3*c(d(j))/(D(i)*D(d(j)))*bio;
%             Point1(i) =  Point1(i) + (length(e))^2*c(i)*c(d(j))/(D(i)*D(d(j)))*bio;

        end
    end

end



Point7 = mapminmax(Point7,1,100);
Point8 = Point8/(sum(Point8));
Point9 = mapminmax(Point9,1,100);
Point = mapminmax(Point',1,100);
Point1 = mapminmax(Point1',1,100);
Point3 = mapminmax(Point3',1,100);
Point6 = mapminmax(Point6',1,100);
Point5 = mapminmax(Point5',1,100);
Point4 = [Point7;Point9];




% bh_option = struct('maxgen',100,'sizestar',200,'els_max',0.3,'els_min',0.1);
% [X,fval] = MultiESS(fitness,nvars,nobj,narc,ncan,bh_option,Point4)





X1 = unique(X);

for i = 1 : length(X1)
    
    m = 0;
    for j =1:size(X,1)
        
        k = find(X(j,:) == X1(i));
        if ~isempty(k)
            m = m + 1;
        end
%         t = X(1,i);
%         if piinfocell{t,2} == 1 || piinfocell{t,2} == 4
%             count1 = count1 + 1;     
%         end
    end
    Point2(i) = m;    
end


[B1,I] = sort(Point2,'descend');
X2 = X1(I(1:nvars));
count2 = 0;
count1 = 0;

[B2,I1] = sort(Point7,'descend');

for i = 1 : length(X2)
    
        t = X2(i);
        if piinfocell{t,2} == 1 || piinfocell{t,2} == 4
            count1 = count1 + 1;     
        end
        t = I1(i);
        if piinfocell{t,2} == 1 || piinfocell{t,2} == 4
            count2 = count2 + 1;     
        end        

end