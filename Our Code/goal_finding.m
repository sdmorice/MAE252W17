function [to_goal, goal_found] = goal_finding(rpos, robot_goal)

%
%
%   pos(3) =  pi/2           pos(3)=90, pi
%                               |
%                             + + +
%   ++++++++                 +  |  +                
%   +        +              +   |   +              
%   +         +             +   |   +                   
%   +        +              +   |   +             
%   ++++++++                +   |   +                  
%                           ++++|++++               
%    ------------------------------------------------------



to_goal(1) = sqrt((rpos(2) - robot_goal(2))^2 + (rpos(1) - robot_goal(1))^2);
%world angle
worldAng = atan2((rpos(2) - robot_goal(2)),(rpos(1) - robot_goal(1)));

if worldAng < 0
    worldAng = worldAng + 2*pi;
end

%robot angle: angle of the robot to the goal 
%to the left of the center line axis is + angle direction
to_goal(2) = rpos(3) - worldAng;

%check if essentially reached goal

if to_goal(1) < 12
    goal_found = 1; 
else 
    goal_found = 0;
end

end