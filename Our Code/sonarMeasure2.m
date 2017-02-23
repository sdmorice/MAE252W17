function ds =sonarMeasure2(grid_map,rpos,ns, range)
% Input arguments: 
%   mapArray: array of 1's and 0's that form environment in which robot is 
%       traveling
%       -(1)'s make up obstacles
%       -each point is 1cm (grid size)
%       -start: (-1)
%       -end: (-2)
%   rpos:[xpos, ypos, angle]
%       -where angle is the angle that the robot is x axis of the course, in rad
%   ns: number of sensors
%   range: max distance the sonar can sense, cm

%   target = 1mx1m

%setup location of the robot 
rx = rpos(1);                 
ry = rpos(2);
rAngle = rpos(3);

sonarBeamAngle = pi/ns;              %angle between two adjacent sensors

[m, n] = size(grid_map);        %size of map



%calculate the max and min of map rows and columns that want to search 
    %through, given robot looking in a certain direction
    %so don't have to look through entire array
                              
%define max and min indexes to search through mapArray
maxRow = rx + range;
minRow = rx - range; 
maxColumn = ry + range;
minColumn = ry - range; 

obstacleArray =  zeros(m+n, 4);       %need to change size
k = 1;
%target = zeros(m+n, 2);               %need to change size 
minDistArray = 20000*ones(1, ns);

%iterate through array to find the obstacles, distance and angleof each point 
for i = max([minRow 1]): min([maxRow m])
    for j = max([minColumn 1]):min([maxColumn n])
        %need to be 1 instead of 0 because of matlab indexing
        if grid_map(i, j) == 1
            
            distPt = sqrt((i - rx)^2 + (j-ry)^2);
            worldAng = atan2(j-ry,i-rx);               %find angle of point - from 0
            
            %change worldAng from 0 to pi and 0 to -pi to 0-2pi
            if worldAng < 0
                worldAng = worldAng + 2*pi;
            end
            
            %change angPt from measured from absolute to in robot reference
            %frame - from angle of sonar start
            bodyAng = worldAng - rAngle + pi/2;
            
            if bodyAng>= 2*pi
                bodyAng = bodyAng/(2*pi);
            end
            
            sonarPt = ceil(bodyAng/sonarBeamAngle);     %returns index of sonar 
            
            %also need to check that angle is within angle ranges for the
            %sensor
            if sonarPt < 0 || sonarPt > ns
                break
            elseif sonarPt == 0
                sonarPt = 1;
            end
            
            %save value if within range and less than the smalledst value
            %sensed yet
            if distPt < minDistArray(sonarPt) 
                if distPt > range
                    minDistArray(sonarPt) = 0;  %check if inside range
                else
                    minDistArray(sonarPt) = distPt;
                end
            end 
            
            obstacleArray(k, :) = [i, j, distPt, sonarPt];
            k=k+1;
        end
    end 
end

%get rid of bogus values 

for i = 1:length(minDistArray)
    if minDistArray(i) == 20000
        minDistArray(i) = 0;
    end
end

ds = minDistArray;

end