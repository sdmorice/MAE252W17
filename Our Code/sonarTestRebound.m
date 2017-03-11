clear 
clc
close all

%testing script

range = 150;
ns = 20;
robot_goal = [450, 350];
rpos = [275 50 pi/2]; 

%small grid array, not symmetrical to test on 
gridMap = 255*ones(500, 400);
gridMap(1,:) = 0; 
gridMap(:,400) = 0;
gridMap(500,:) = 0; 
gridMap(:, 1) = 0;
gridMap(1:150, 200:300) = 0;
gridMap(350:500, 200:300)= 0;
gridMap(447:452, 347:352) = 0; 

k = 1;

[sonarDist, goalSighted, goalReached] = sonarMeasure2(gridMap, rpos, ns, range);

disp(sonarDist);
draw_bot(rpos, gridMap);
pause(2);
alpha_r = rebound_angle_goal(sonarDist, ns, rpos, robot_goal, range);
rpos = Rotate(rpos, alpha_r, gridMap);

disp('rebound angle = '); 
disp(alpha_r);
disp('new rpos = ');
disp(rpos);

rpos =  drive(rpos, gridMap);

disp('new rpos = ');
disp(rpos);

figure(2);
bar(sonarDist);
title(pi/2);
