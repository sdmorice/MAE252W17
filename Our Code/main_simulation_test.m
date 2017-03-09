%% Robot Test Script

clear
clc
close all

%define robot information 
range = 500;
ns = 10;

%initial positon
rpos = [710, 90, pi/2];
goalReached = 0;

%goal locations
goal_1 = [721, 60];
goal_2 = [1340, 680]; 
robot_goal = goal_1;

%map definition 
grid_map= color_gry('group_outline_paint.png');

%plot robot
draw_bot(rpos, grid_map);
drawnow;

%% Robot Moving Loop

while ~goalReached
    
    [sonarDist, goalSighted, goalReached] = sonarMeasure2(grid_map, rpos, ns, range);

    [dist_to_goal, goal_found] = goal_finding(rpos, robot_goal);
    if goal_found
        robot_goal = goal_2; 
        k = k+1; 
        if k >=2
            goalReached = 1; 
        end
    end
    
    alpha_r = rebound_angle(sonarDist, ns, rpos, robot_goal);  
    
    rpos = Rotate(rpos, alpha_r, grid_map);
    rpos =  drive(rpos, grid_map);
    
end
