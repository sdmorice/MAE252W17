%% Robot Test Script

clear
clc
close all

hold all;

global hit_counter time_counter hit_challenge
hit_counter = 0;
hit_challenge = 0;
% time_counter = 0;
%define robot information 

range = 500+ 30;
ns = 16;

iter = 0;

%initial positon
rpos = [720, 60, pi/2];
%rpos = [200, 1000, pi/2];
goalReached = 0;

%goal locations
goal_1 = [60, 800];
goal_2 = [600, 1380]; 
robot_goal = goal_1;
k = 0;

%start timer of the code
tic 

%map definition 
grid_map= color_gry('prescribed_course.png');

%plot robot
draw_bot(rpos, grid_map);
drawnow;


%% Robot Moving Loop

while ~goalReached
    iter = iter + 1;
    [sonarDist, goalSighted, goalReached] = sonarMeasure2(grid_map, rpos, ns, range);
    
    sonarDist;

    
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
    [rpos, hit] = Rotate(rpos, alpha_r, grid_map);
    rpos =  drive(rpos, grid_map, hit, robot_goal);
    
    x_save(iter) = rpos(1);
    y_save(iter) = rpos(2);
    
    plot(y_save, x_save);
%     pause(0.01)

    
end

%stop timer 
timeRun = toc; 
fprintf('The simulation ran for %f seconds.\n',timeRun);

% %save plot as figure 
% saveas(figure1,'plot.jpg'); 

%%plot the path
dist = 0;
for j = 1:iter-1

    distj = sqrt((x_save(j+1) - x_save(j))^2 + (y_save(j+1) - y_save(j))^2);
    dist = distj + dist;
end

fprintf('The robot traveled %f cm.\n', dist)

disp(hit_counter);
if hit_challenge == 1 
    fprintf('dumbass robot drove into that one spot \n');
end
% fprintf('time of simulation %f', time_counter*.01);
