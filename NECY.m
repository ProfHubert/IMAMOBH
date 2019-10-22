

%%
%imroxaswc@gmail.com
%
%%
clear;clc
load('AB.mat','AB')
load('allppi2.mat','allppi')
load('ADJ.mat','AdjcentMatrix');
A = AB(:,1);
B = AB(:,2);
load('PIO.mat','piinfocell')
Point = zeros(length(AdjcentMatrix),1);
Point1 = zeros(length(AdjcentMatrix),1);
for i = 1:length(AdjcentMatrix)

    d = find(AdjcentMatrix(i,:) == 1);
    D(i) = length(d);

end

% for i = 1:length(AdjcentMatrix)
% 
%     d = find(AdjcentMatrix(i,:) == 1);
%     for j = 1:length(d)
%         
%         d1 = find(AdjcentMatrix(d(j),:) == 1);
%         e = intersect(d,d1);
%         Point(i) = Point(i) + (length(e) + 1)/min(D(i),D(d(j)));
%         
%     end
% 
% end


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
%     c(i) = 2*c(i)/(D(i)*(D(i)));
%     for j = 1:length(d)
%         
%         d1 = find(AdjcentMatrix(d(j),:) == 1);
%         e = intersect(d,d1);
%       
%         Point1(i) = Point1(i) + (length(e) + 1)^3*c(i)*c(j)/(D(i)*D(d(j)));
%         
%     end
    
%     for j = 1:length(d)
%         
%         d1 = find(AdjcentMatrix(d(j),:) == 1);
%         e = intersect(d,d1);
%         a1 = find(A == i);
%         a2 = find(B == d(j));
%         a3 = intersect(a1,a2);
%         if ~isempty(a3)
% %             Point1(i) = Point1(i) + (length(e) + 1)^3*c(i)*c(j)/(D(i)*D(d(j)));      
%             Point1(i) =  Point1(i) + (length(e) + 1)^3*c(i)/(D(i)*D(d(j)))*allppi(a3,3);
%         else
%             a1 = find(B == i);
%             a2 = find(A == d(j));
%             a3 = intersect(a1,a2);      
% %             Point1(i) = Point1(i) + (length(e) + 1)^3*c(i)*c(j)/(D(i)*D(d(j)));        
%             Point1(i) =  Point1(i) + (length(e) + 1)^3*c(i)/(D(i)*D(d(j)))*allppi(a3,3);
%         end
%     end
    
    for j = 1:length(d)
        
        d1 = find(AdjcentMatrix(d(j),:) == 1);
        e = intersect(d,d1);
        a1 = find(A == i);
        a2 = find(B == d(j));
        a3 = intersect(a1,a2);
        if ~isempty(a3)
            
            Point(i) = Point(i) + (length(e) + 1)/min(D(i),D(d(j)));
            
        else
            a1 = find(B == i);
            a2 = find(A == d(j));
            a3 = intersect(a1,a2);      
            Point(i) = Point(i) + (length(e) + 1)/min(D(i),D(d(j)));
            
        end
        
    end

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
%             Point1(i) = Point1(i) + (length(e) + 1)^3*c(i)*c(j)/(D(i)*D(d(j)));      
            Point1(i) =  Point1(i) + (length(e))^2*c(i)*c(d(j))/(D(i)*D(d(j)));
        else
            a1 = find(B == i);
            a2 = find(A == d(j));
            a3 = intersect(a1,a2);      
%             Point1(i) = Point1(i) + (length(e) + 1)^3*c(i)*c(j)/(D(i)*D(d(j)));        
            Point1(i) =  Point1(i) + (length(e))^2*c(i)*c(d(j))/(D(i)*D(d(j)));
        end
    end

end
% % 
% Point1 = mapminmax(Point1',min(D),max(D))';


[B1,I] = sort(Point,'descend');
[B2,I2] = sort(Point1,'descend');


RankLabel = piinfocell(I,3);
RankLabelmat = cell2mat(RankLabel);
RankLabel1 = piinfocell(I2,3);
RankLabelmat2 = cell2mat(RankLabel1);





% n = 1209*2;
% 
% m = 50;
% 
% N = 1209;
% 
% list_1 = RankLabelmat(1:n);
% 
% P = [];
% 
% for i = 1:m
%     
%     P(i,:) = list_1(randperm(n,N))';
%  
% end








count = 0;
count1 = 0;

for i = 1 : 100
    
    t = RankLabelmat(i);
    if piinfocell{t,2} == 1 || piinfocell{t,2} == 4
        count = count + 1;
        m = count;
        
        
    end
    t = RankLabelmat2(i);
    if piinfocell{t,2} == 1 || piinfocell{t,2} == 4
        count1 = count1 + 1;
        m = count1;
     
        
    end
        
end

