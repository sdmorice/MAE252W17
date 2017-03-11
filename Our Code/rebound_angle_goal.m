function alpha_r = rebound_angle_goal(distSonar,ns, rpos, robot_goal, range)



%calculate rebound angle


%initialize numerator and denomenator values for the rebound angle
%calculation
num_sum = 0;
den_sum = 0;
max_sensor_index = ns/2;
min_sensor_index = -ns/2;
sonarBeamAngle = pi/ns;

leftFlag = 0;
rightFlag =0;
leftFlag_goal = 0;
rightFlag_goal =0;

%want to find rebound angles for both sides of the vision system
for i = 1:floor(ns/2)
    sensor_index = (i-1)+min_sensor_index;
   
    num_add = sensor_index*sonarBeamAngle*distSonar(1,i);
    num_sum_1 = num_sum_1+num_add;
    
    den_add = distSonar(1,i);
    den_sum_1 = den_sum_1+den_add;
    
    if distSonar(1, i) == 0 || distSonar(1, i)> range/2
        leftFlag=leftFlag+1; 
    end
end

for i = floor(ns/2):ns
    sensor_index = (i)+min_sensor_index;
   
    num_add = sensor_index*sonarBeamAngle*distSonar(1,i);
    num_sum_2 = num_sum_2+num_add;
    
    den_add = distSonar(1,i);
    den_sum_2 = den_sum_2+den_add;
    
    if distSonar(1, i) == 0 || distSonar(1, i)> range/2
        rightFlag=rightFlag+1; 
    end
end



%% goal weighting
k = 100;
[to_goal, goal_found] = goal_finding(rpos, robot_goal);
sensor_index_goal = to_goal(2)/sonarBeamAngle;

%calc related sensor index for goals taking into account situation where
%goal may not be with in range of sensors
if sensor_index_goal < ns/2 || (sensor_index_goal<ns*2 && sensor_index_goal>ns*3/2)
    sensor_index_goal = (i-1)+min_sensor_index;
    leftFlag_goal = 1;
else
    sensor_index_goal = (i)+min_sensor_index;
    rightFlag_goal = 1;
end

if abs(leftFlag-rightFlag) <= 2
    %want the angle of rebound to be in the direction of the goal 
    if leftFlag_goal
        num_sum = num_sum_1;
        den_sum = den_sum_1;
    else 
        num_sum = num_sum_2; 
        den_sum = den_sum_2; 
    end
    
else 
    num_sum = num_sum_1 + num_sum_2;
    den_sum = den_sum_1 + den_sum_2; 
end

%% Calculattng the rebound angle
%if no objects, keep on going straight    

alpha_r = num_sum/den_sum;
