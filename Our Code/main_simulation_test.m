%% Robot Test Script

clear
clc
close all

%define robot information 
range = 500;
ns = 20;


%initial positon
rpos = [350, 200, pi/2];
goalReached = 0;

%goal locations
goal_1 = [60, 721];
goal_2 = [680, 1340]; 
robot_goal = goal_1;
k = 0;

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
        disp(k);
        if k >=2
            goalReached = 1; 
        end
    end
    
    alpha_r = rebound_angle(sonarDist, ns, rpos, robot_goal);  
    
    rpos = Rotate(rpos, alpha_r, grid_map);
    rpos =  drive(rpos, grid_map);
    
end
