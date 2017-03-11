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
worldGoalAng = atan2((robot_goal(2) - rpos(2)),(robot_goal(1) - rpos(1)));
%change to world coordinates
if worldGoalAng < 0
    worldGoalAng = worldGoalAng + 2*pi;
end

%robot angle: angle of the robot to the goal 
%to the left of the center line axis is + angle direction
%-should give angle so that measured 0-pi on the left side of robot and
%0-(-pi) on the right side of the robot
if rpos(3)>= pi && rpos(3) < 2*pi
    if rpos(3)> worldGoalAng && worldGoalAng >= rpos(3)-pi
        to_goal(2) = worldGoalAng - rpos(3);
    else
        to_goal(2) = worldGoalAng + 2*pi - rpos(3); 
    end
elseif rpos(3)>= 0 && rpos(3) < pi
    if rpos(3)+ pi > worldGoalAng && rpos(3) > worldGoalAng
        to_goal(2) = worldGoalAng - rpos(3); 
    else 
        to_goal(2) = worldGoalAng - 2*pi - rpos(3);
    end    
end

% %make sure is in the range pi/2--pi/2
% if to_goal(2)>pi/2
%     to_goal(2) = to_goal(2) -2*pi;
% elseif to_goal(2) < -pi/2
%     to_goal(2) = to_goal(2)+ 2*pi;
% end

%check if essentially reached goal

if to_goal(1) < 12
    goal_found = 1; 
else 
    goal_found = 0;
end

end