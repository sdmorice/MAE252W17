%% Robot Test Script

clear
clc
close all

%define robot information 
range = 500;
ns = 10;

%initial positon
rpos = [600, 90, 0];
goalSighted = [0, 0];
goalReached = 0;

%map definition 
grid_map = imread('course with outline.png');

%% Robot Moving Loop

while ~goalReached
    
    [sonarDist, goalSighted, goalReached] = sonarMeasure2(grid_map, rpos, ns, range);
    alpha_r = rebound_angle(sonarDist, ns);
    
    if goalSighted(1) ==1 || goalSighted(1) == 2
        alpha_r = goalSighted(2);
        goalSighted(:) = 0; 
    end
    
    rpos = Rotate(rpos, alpha_r, grid_map);
    rpos =  drive(rpos, grid_map);
    
end

