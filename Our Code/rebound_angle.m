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
        sensor_index = (i+1)+min_sensor_index;
    end
    num_add = sensor_index*sonarBeamAngle*distSonar(1,i);
    num_sum = num_sum+num_add;
    
    den_add = distSonar(1,i);
    den_sum = den_sum+den_add;
end

 %goal weighting
 
[to_goal, goal_found] = goal_finding(rpos, robot_goal);
%sensor_index_goal = round(to_goal(2)/sonarBeamAngle);

% %calc related sensor index for goals taking into account situation where
% %goal may not be with in range of sensors
% if sensor_index_goal < ns/2 
%     sensor_index_goal = (sensor_index_goal-1)+min_sensor_index;
% elseif (sensor_index_goal<ns*2 && sensor_index_goal>ns*3/2)
%     sensor_index_goal = sensor_index_goal - ns + min_sensor_index; 
% else
%     sensor_index_goal = (sensor_index_goal)+min_sensor_index;
% end

maxSonarRead = max(distSonar);
if to_goal(1)> maxSonarRead
    to_goal(1) = maxSonarRead;
end

k = 1; 
num_sum = num_sum + to_goal(2)*k/to_goal(1);
den_sum = den_sum + k/to_goal(1); 

%Calculattng the rebound angle
%if no objects, keep on going straight    

alpha_r = num_sum/den_sum;
