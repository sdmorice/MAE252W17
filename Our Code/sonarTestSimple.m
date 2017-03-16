% clear 
clc
close all

%testing script

%define robot information 
range = 500;
ns = 10;

%initial positon
% rpos = [720, 60, pi/2];
rpos = [700, 700, 7*pi/4];
goalReached = 0;

%goal locations
goal_1 = [60, 800];
goal_2 = [680, 1340]; 
robot_goal = goal_2;

grid_map= color_gry('group_outline_white.png');

%plot robot
draw_bot(rpos, grid_map);


k = 1;

[sonarDist, goalSighted, goalReached] = sonarMeasure2(grid_map, rpos, ns, range);

disp(sonarDist);

alpha_r = rebound_angle(sonarDist,ns, rpos, robot_goal);
% rpos = Rotate(rpos, alpha_r, grid_map);
% 
% disp('rebound angle = '); 
% disp(alpha_r);
% disp('new rpos = ');
% disp(rpos);
% 
% rpos =  drive(rpos, grid_map);
% 
% disp('new rpos = ');
% disp(rpos);
% 
figure(2);
bar(sonarDist);
title(pi/2);
