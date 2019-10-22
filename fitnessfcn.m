function F = fitnessfcn(X,Point)

for i  = 1: size(Point,1)
    F(i) = -sum(Point(i,X));
end

