%testing script

range = 500;
ns = 10;

%small grid array, not symmetrical to test on 
gridMap = 255*ones(100, 150);
gridMap(1,:) = 0; 
gridMap(:,150) = 0;
gridMap(100,:) = 0; 
gridMap(:, 1) = 0;
gridMap(25:30, 1:10) = 0;

k = 1;

for i = 0:pi/2:(2*pi) 
    rpos = [20 60 i];
    distSonar = sonarMeasure2(gridMap, rpos, ns, range);
    figure(k);
    bar(distSonar);
    title(i);
    
    k = k+1;
end

