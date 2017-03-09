function alpha_r = rebound_angle(distSonar,ns, rpos, robot_goal)



%calculate rebound angle

%initialize numerator and denomenator values for the rebound angle
%calculation
num_sum = 0;
den_sum = 0;
sonarBeamAngle = pi/ns;
k = 1; %weighting values

[dist_to_goal, goal_found] = goal_finding(rpos, robot_goal);
goal_sonar_num = dist_to_goal(2)/sonarBeamAngle;

for i = 1:ns
    num_add = i*distSonar(1,i);
    num_sum = num_sum+num_add;
    
    den_add = distSonar(1,i);
    den_sum = den_sum+den_add;
end

%Calculattng the rebound angle
%if no objects, keep on going straight    
if num_sum == 0
    alpha_r = pi/2;
else
    %add in goal weighting
    num_sum = num_sum + 1/dist_to_goal(1) *goal_sonar_num*k;
    den_sum = den_sum + 1/dist_to_goal(1);
    %calculate rebound angle
    alpha_r = num_sum/den_sum *sonarBeamAngle;
end 