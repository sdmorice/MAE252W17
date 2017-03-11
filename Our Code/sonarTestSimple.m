close all
clc 
clear

%testing script

range = 500;
ns = 10;

%small grid array, not symmetrical to test on 
gridMap = ones(500, 400);
gridMap(1,:) = 0; 
gridMap(:,150) = 0;
gridMap(100,:) = 0; 
gridMap(:, 1) = 0;
gridMap(1:150, 200:300) = 0;
gridMap(350:500, 200:300)= 0;
gridMap(447:452, 347:352) = 0; 

k = 1;

for i = 0:pi/2:(2*pi) 
    rpos = [20 60 i];
    distSonar = sonarMeasure2(gridMap, rpos, ns, range);
    figure(k);
    bar(distSonar);
    title(i);
    
    k = k+1;
end

figure (6) 
draw_bot(rpos, gridMap);
