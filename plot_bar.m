clear,clc

%% ½ÍÄ¸¾ú
% DC = [58, 103, 149, 191, 241, 291];
% NC = [55, 125, 175, 233, 282, 327];
% PeC = [83, 146, 210, 262, 302, 348];
% LAC = [61, 125, 182, 236, 286, 333];
% INNEC = [80, 156, 208, 268, 321, 369];

%% ´ó³¦¸Ë¾ú
DC = [37    70    94   122   142   163];
NC = [35    62    89   113   136   160];
PeC = [46    76   108   129   147   177];
LAC = [21    52    76    96   122   147];
INNEC = [52    83   122   156   186   222];

%% ×¢ÒâXÖá×ø±êÖµ
i = 1;
    figure(i)
    set(gca, 'Fontname', 'Times newman', 'Fontsize', 16);
    hold on
    scale = i;
    width = 0.5;
    c1 = categorical({'DC'});
    c2 = categorical({'NC'});
    c3 = categorical({'PeC'});
    c4 = categorical({'LAC'});
    c5 = categorical({'INNEC'});
    bar(c1, DC(scale), width);
    bar(c2, NC(scale), width);
    bar(c3, PeC(scale), width);
    bar(c4, LAC(scale), width);
    bar(c5, INNEC(scale), width);
    xlabel('TOP 100'), ylabel('The number of true essential proteins')
    x = [DC(scale), NC(scale), PeC(scale), LAC(scale),INNEC(scale)];
    xx = [0.9, 1.9, 2.9, 3.9, 4.9];
        for ii = 1:length(x)
             y  = 1.2 * i + x(ii);
             text(xx(ii), y, num2str(x(ii)));
        end