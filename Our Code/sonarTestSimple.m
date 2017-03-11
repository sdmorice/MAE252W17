clear 
clc
close all

%testing script

range = 500;
ns = 20;
robot_goal = [680, 1340]; 
rpos = [550 900 pi*7/4]; 

%small grid array, not symmetrical to test on 
grid_map= color_gry('group_outline_paint.png');

k = 1;

[sonarDist, goalSighted, goalReached] = sonarMeasure2(grid_map, rpos, ns, range);

disp(sonarDist);
draw_bot(rpos, grid_map);
pause(2);
alpha_r = rebound_angle(sonarDist,ns, rpos, robot_goal);
rpos = Rotate(rpos, alpha_r, grid_map);

disp('rebound angle = '); 
disp(alpha_r);
disp('new rpos = ');
disp(rpos);

rpos =  drive(rpos, grid_map);

disp('new rpos = ');
disp(rpos);

figure(2);
bar(sonarDist);
title(pi/2);
