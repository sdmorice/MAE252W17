function alpha_r = rebound_angle(distSonar,ns, rpos, robot_goal)



%calculate rebound angle


%initialize numerator and denomenator values for the rebound angle
%calculation
num_sum = 0;
den_sum = 0;
max_sensor_index = ns/2;
min_sensor_index = -ns/2;
sonarBeamAngle = pi/ns;


for i = 1:ns
    if i <= ns/2
        sensor_index = (i-1)+min_sensor_index;
    else
        sensor_index = i+min_sensor_index;
    end
    num_add = sensor_index*sonarBeamAngle*distSonar(1,i);
    num_sum = num_sum+num_add;
    
    den_add = distSonar(1,i);
    den_sum = den_sum+den_add;
end


 %goal weighting
 k = 2000;

% [to_goal, goalfound] = goal_finding(rpos, robot_goal);
% num_sum = num_sum + to_goal(2)*k/sqrt(to_goal(1));
% den_sum = den_sum + k/to_goal(1); 
%  %goal weighting
%  k = 1/100;
% 
% % [to_goal, goalfound] = goal_finding(rpos, robot_goal);
% num_sum = num_sum;% + to_goal(2)*k*to_goal(1);
% den_sum = den_sum;% + k*to_goal(1); 

%Calculattng the rebound angle
%if no objects, keep on going straight    

alpha_r = num_sum/den_sum;
