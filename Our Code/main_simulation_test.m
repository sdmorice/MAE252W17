%% Robot Test Script

clear
clc
close all

%define robot information 
range = 500;
ns = 10;

%initial positon
rpos = [710, 90, pi/2];
goalSighted = [0, 0];
goalReached = 0;

%map definition 
[grid_map, rgb] = imread('group_outline.png');

%plot robot
draw_bot(rpos, grid_map, rgb);
drawnow;

%% Robot Moving Loop

while ~goalReached
    
    [sonarDist, goalSighted, goalReached] = sonarMeasure2(grid_map, rpos, ns, range);
    alpha_r = rebound_angle(sonarDist, ns);
    
    if goalSighted(1) ==1 || goalSighted(1) == 2
        alpha_r = goalSighted(2);
        goalSighted(:) = 0; 
    end
    
    rpos = Rotate(rpos, alpha_r, grid_map, rgb);
    rpos =  drive(rpos, grid_map, rgb);
    
end

