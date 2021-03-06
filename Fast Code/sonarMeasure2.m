%Written by Rachel Muradian (with assistance from Dan) 

function [distSonar, goalSighted, goalReached] = sonarMeasure2(grid_map,rpos,ns, range)
%% Input arguments: 
%   grid_map: array of 1's and 0's that form environment in which robot is 
%       traveling
%       -greyscale: 
%           -255: white, no obstacle
%           -50: red (vertical)
%           -100: green (45)
%           -150 blue (horizontal)
%
%
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
%              x
%   Because of this, we index the grid map as (x, y)
%   The map has essentially rotated 90 degrees from the normal cartesian
%   coordinate system
%   

%% Function code 

sonarBeamAngle = pi/ns;                 %angle between two adjacent sensors

[m, n] = size(grid_map);                %size of map

rx = rpos(1);                           %positon of the robot              
ry = rpos(2);
rAngle = rpos(3);
                              
%define max and min indexes to search through mapArray
maxX = rx + range;
minX = rx - range; 
maxY = ry + range;
minY = ry - range; 

minDistArray = 20000*ones(1, ns);

goalSighted = [0,0];
goalReached = 0;

robotRadius = 60/2;
 

%iterate through array to find the obstacles, distance and angleof each point 
for i = max([round(minX) 1]): min([round(maxX) m])
    for j = max([round(minY) 1]):min([round(maxY) n])
        
        %disp(i);
        %disp(j);
        
        mapVal = grid_map(i, j);
        if mapVal ~= 255
            
            distPt = sqrt((i - rx)^2 + (j-ry)^2);
            worldAng = atan2(j-ry, i-rx );               
                                        %find angle of point - from 0
            
            %change worldAng from 0 to pi and 0 to -pi to 0-2pi
            if worldAng < 0
                worldAng = worldAng + 2*pi;
            end
            
            if pi > rAngle && rAngle >= 0
                if worldAng > rAngle +pi
                    worldAng = worldAng - 2*pi;
                else
                    worldAng = worldAng;
                end
            elseif 2*pi > rAngle && rAngle >= pi
                if worldAng < rAngle-pi
                    worldAng = worldAng+2*pi;
                else
                    worldAng = worldAng;
                end
            end
            
%relAng
%            | 0
%            |            
%            |            
%    pi/2    |          - pi/2 
%   ---------|----------               
        
            relAng = worldAng - rAngle;
%bodyAng
%            | pi/2
%            |            
%            |            
%    pi      |            
%   ---------|---------- 0                 
            
            bodyAng = pi/2+relAng;
    
%            if bodyAng>= 2*pi
%                bodyAng = bodyAng-(2*pi);
%            end
            
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
                    
                    distPt = distPt - robotRadius;    
                                        %take into account the distance
                                        %from (rx, ry) to the front of the
                                        %robot, where the sensors are
                                        %located
                    
                    %check the angle of the obstacle found
                    if mapVal == 50
                        surface = pi/2;
                    elseif mapVal == 150
                        surface = 0;
                     elseif mapVal == 100
                         surface = pi/4;
                    else 
                        %bogus val for if read 0
                        surface = pi*2;
                    end
                    

                   %specularAng = pi/2;
                   
                   specularAng = specularSurface(surface, worldAng, rAngle);
                                        %get the specular angle for the 
                                        %measurement
                    if distPt < 10 && distPt ~=0
                        minDistArray(sonarPt) = 10;                    
                    elseif specularAng > 25/180*pi
                        minDistArray(sonarPt) = distPt;
                    elseif specularAng <= 25/180*pi
                         minDistArray(sonarPt)= range;
                         if (mapVal==50 || mapVal==150 || mapVal==100)
%                              fprintf(['Read specular surface at x = %d and',...
%                              'y = %d.  The specular angle hit the wall at',...
%                              '%f degrees when the robot was at angle%f', ... 
%                              'deg\n'],rx, ry, specularAng*180/pi, rAngle*180/pi);
                         end
                    end
                end  
            end
        end
    end 
end

%get rid of placeholder values 
for i = 1:length(minDistArray)
    if minDistArray(i) == 20000
        minDistArray(i) = range;
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

function specularAng = specularSurface(surface, worldAng, rAngle)
%   Inputs: -surface(the angle of the surface)
%             -worldAng (the sonar beam angle relative to the world
%                        coordinate system)
%             -rAngle (the angle of the robot wrt to world cordinate system.  Currently not used
%   Outputs: specularAng (the angle of the incident sonar beam angle wrt
%                         the surface)

%specularAng = 90;
obstacleAng = pi/4;

if surface == 0
    if worldAng >=0 && worldAng < pi/2
        specularAng = pi/2-worldAng;
    
    elseif worldAng > pi/2 && worldAng <= pi
        specularAng = worldAng-pi/2;
    
    elseif worldAng > pi && worldAng< 3*pi/2
        specularAng = pi/2-(worldAng - pi);
    
    elseif worldAng > 3*pi/2 && worldAng < 2*pi
        specularAng = worldAng-3*pi/2; 
    
    else
        specularAng = pi/2;
    end
    
elseif surface == pi/2
    if worldAng >0 && worldAng <= pi/2
        specularAng = worldAng;
    
    elseif worldAng >= pi/2 && worldAng < pi
        specularAng = pi/2- (worldAng - pi/2);
    
    elseif worldAng >= pi && worldAng <= 3*pi/2
        specularAng = worldAng-pi;
    elseif worldAng > 3*pi/2 && worldAng < 2*pi
        specularAng = worldAng - 3*pi/2;
    else
        specularAng = pi/2;
    end
    
elseif surface == obstacleAng
    
    if worldAng >=0 && worldAng < pi/2
        specularAng = pi/2 - (obstacleAng - worldAng);
    
    elseif worldAng >= 2*pi-obstacleAng && worldAng< 2*pi
        specularAng = pi/2-(2*pi-worldAng+obstacleAng);    
    
    elseif worldAng >= obstacleAng && worldAng < pi/2+obstacleAng
        specularAng = pi/2-(worldAng-obstacleAng);
    else
        specularAng = pi/2;
    end
else 
        %create so that if read a 0 (black) still runs but doesn't recognize
    %any specular
    specularAng = 30*pi/180;
end
end