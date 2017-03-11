%testing script

range = 500;
ns = 10;

%small grid array, not symmetrical to test on 
gridMap = ones(500, 400);
gridMap(1,:) = 0; 
gridMap(:,150) = 0;
gridMap(100,:) = 0; 
gridMap(:, 1) = 0;
gridMap(150:300, 1:110) = 0;

k = 1;

rpos = [110 110 3*pi/4]; 
rgb = [0, 0, 0; 1, 1, 1]; 


[sonarDist, goalSighted, goalReached] = sonarMeasure2(gridMap, rpos, ns, range);

disp(sonarDist);

alpha_r = rebound_angle(sonarDist, ns);
rpos = Rotate(rpos, alpha_r, gridMap, rgb);

disp('rebound angle = '); 
disp(alpha_r);
disp('new rpos = ');
disp(rpos);

rpos =  drive(rpos, gridMap, rgb);

disp('new rpos = ');
disp(rpos);

figure(1);
bar(sonarDist);
title(pi/2);
