%Written by Rachel Muradian (with assistance from Dan) 

function [distSonar, goalSighted, goalReached] = sonarMeasure2(grid_map,rpos,ns, range)
%% Input arguments: 
%   grid_map: array of 1's and 0's that form environment in which robot is 
%       traveling
%       -greyscale: 
%           -255: white, no obstacle
%           -0: black, obstacle
%       -each point is 1cm (grid size)
%   rpos = [xpos, ypos, angle]
%       -angle: measured from x-axis from centerpoint of half circle at the
%       front of the robot
%   ns: number of sensors
%   range: max distance the sonar can sense, cm
%
%   The map has an origin as follows: 
%       (1, 1) .--------------> Y
%              |
%              |
%              |
%              |
%              V
%              Y
%   Because of this, we index the grid map as (y, x)
%
%   
%% Function code 

sonarBeamAngle = pi/ns;                 %angle between two adjacent sensors

[m, n] = size(grid_map);                %size of map

rx = rpos(2);                           %positon of the robot              
ry = rpos(1);
rAngle = rpos(3);
                              
%define max and min indexes to search through mapArray
maxX = rx + range;
minX = rx - range; 
maxY = ry + range;
minY = ry - range; 

minDistArray = 20000*ones(1, ns);

goalSighted = [0,0];
goalReached = 0;

%iterate through array to find the obstacles, distance and angleof each point 
for i = max([minX 1]): min([maxX m])
    for j = max([minY 1]):min([maxY n])
        
        mapVal = grid_map(j, i);
        if mapVal ~= 255
            
            distPt = sqrt((i - rx)^2 + (j-ry)^2);
            worldAng = atan2(j-ry,i-rx);               
                                        %find angle of point - from 0
            
            %change worldAng from 0 to pi and 0 to -pi to 0-2pi
            if worldAng < 0
                worldAng = worldAng + 2*pi;
            end
            
            bodyAng = worldAng - rAngle + pi/2;
                                        %change angPt from measured from 
                                        %absolute to in robot reference
                                        %frame - from angle of sonar start
            
            if bodyAng>= 2*pi
                bodyAng = bodyAng-(2*pi);
            end
            
            sonarPt = ceil(bodyAng/sonarBeamAngle);     %returns index of sonar 
            if sonarPt == 0 
                sonarPt = 1;
            end
            
            %also need to check that angle is within angle ranges for the
            %sensor
            if sonarPt > 0 && sonarPt <= ns
            
                %save value if within range and less than the smalledst value
                %sensed yet
                if distPt < minDistArray(sonarPt) && distPt <= range
                    
                    distPt = distPt - 37.5;    
                                        %take into account the distance
                                        %from (rx, ry) to the front of the
                                        %robot, where the sensors are
                                        %located
                    
                    %check the angle of the obstacle found
                    if mapVal == 119
                        surface = pi/2;
                    elseif mapVal == 225
                        surface = 0;
                    elseif mapVal == 15         %intermediate goal
                        goalSighted = [1, bodyAng]; 
                    elseif mapVal ==67          %end goal
                        goalSighted = [2, bodyAng];
                        if distPt < 50
                            goalReached = 1;
                        end
                    else 
                        surface = pi/3;
                    end
                    
                    specularAng = specularSurface(surface, worldAng, rAngle);
                                        %get the specular angle for the 
                                        %measurement
                    if distPt < 10
                        minDistArray(sonarPt) = 10;                    
                    elseif specularAng > 25/180*pi
                        minDistArray(sonarPt) = distPt;
                    end
                end  
            end
        end
    end 
end

%get rid of placeholder values 
for i = 1:length(minDistArray)
    if minDistArray(i) == 20000
        minDistArray(i) = 0;
    end
end


distSonar = uncertaintyAdd(minDistArray, range);
                                %add in uncertianty


end


%% uncertaintyAdd - adds measure of uncertainty to the already calculated 
    %values in the array sonarDist
function arrayWithU = uncertaintyAdd(sonarDist, range)
%sonarDist - output array with length ns from sonar calculated
%range is the range of sonar
%newVals is the array with random uncertainty added to each entry of the
%sonarDist array

%maxUncertainty = 0.02*range;
maxUncertainty = 2; 
arrayWithU = zeros(1, length(sonarDist));

for i = 1:length(sonarDist)
    
    u = rand(1)*maxUncertainty;         %calc random uncertainty up to the 
                                            %val of maxUncertainty
    sign = round(rand(1));            	%calc value 0 or 1 to get random 
                                            %add or subtract
    
    if sign == 0
        %subtract uncertainty
        arrayWithU(i) = sonarDist(i) - u;
    elseif sign == 1
        %add uncertainty
        arrayWithU(i) = sonarDist(i) + u;
    end
end
end

%% specularSurface calculates the specular angle for a particular sonar 
%   reading
function specularAng = specularSurface(surface, worldAng, rAngle)

specularAng = 90;
obstacleAng = pi/3;

if surface == 0
    if worldAng >=0 && worldAng < pi/2
        specularAng = worldAng;
    elseif worldAng >= pi/2 && worldAng < pi
        specularAng = pi - worldAng;
    elseif worldAng >= pi && worldAng< 3*pi/2
        specularAng = world - pi;
    else
        specularAng = 2*pi - world;     
    end
elseif surface == pi/2
    if worldAng >=0 && worldAng < pi/2
        specularAng = 90 - world;
    elseif worldAng >= pi/2 && worldAng < pi
        specularAng = world - pi/2;
    elseif worldAng >= pi && worldAng< 3*pi/2
        specularAng = 3*pi/2 - world;
    else
        specularAng = world - 3*pi/2;     
    end
elseif surface == obstacleAng
    if worldAng >=0 && worldAng < pi/2
        specularAng = pi/2 - obstacleAng - worldAng;
    elseif worldAng >= 3*pi/2 && worldAng< 2*pi
        specularAng = worldAng- (180+obstacleAng);     
    end
end

end
