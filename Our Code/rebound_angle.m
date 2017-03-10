function alpha_r = rebound_angle(distSonar,ns)



%calculate rebound angle


%initialize numerator and denomenator values for the rebound angle
%calculation
num_sum = 0;
den_sum = 0;
max_sensor_index = ns/2;
min_sensor_index = -ns/2;
sonarBeamAngle = pi/ns;

for i = 1:ns
    sensor_index = (i-1)+min_sensor_index;
    num_add = sensor_index*sonarBeamAngle*distSonar(1,i);
    num_sum = num_sum+num_add;
    
    den_add = distSonar(1,i);
    den_sum = den_sum+den_add;
end

%Calculattng the rebound angle
%if no objects, keep on going straight    

alpha_r = num_sum/den_sum;