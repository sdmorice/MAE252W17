%testing script

range = 500;
ns = 10;

%small grid array, not symmetrical to test on 
gridMap = zeros(100, 100);
gridMap(1,:) = 1; 
gridMap(:,100) = 1;
gridMap(100,:) = 1; 
gridMap(:, 1) = 1;
gridMap(25:30, 1:10) = 1;
alpha = zeros(1,5);
k = 1;

for i = 0:pi/2:(2*pi) 
    rpos = [5 5 i];
    distSonar = sonarMeasure2(gridMap, rpos, ns, range);
    figure(k);
    bar(distSonar);
    title(i);
    i
    alpha(1,k) = rebound_angle(distSonar,ns)*180/pi
    k = k+1;
end