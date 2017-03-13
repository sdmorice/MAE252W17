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

goal_found = 0;

to_goal(1) = sqrt((-rpos(2) + robot_goal(2))^2 + (-rpos(1) + robot_goal(1))^2);

%world angle
worldGoalAng = atan2((robot_goal(2)-rpos(2)), (robot_goal(1)-rpos(1)));

if  2*pi> rpos(3) && rpos(3)>= pi
    if 2*pi> worldGoalAng && worldGoalAng >= rpos(3)-pi
        to_goal(2) = worldGoalAng - rpos(3);
    else
        to_goal(2) = worldGoalAng + 2*pi - rpos(3); 
    end
elseif  pi> rpos(3) && rpos(3) >= 0
   if rpos(3)+ pi > worldGoalAng && rpos(3) > worldGoalAng
       to_goal(2) = worldGoalAng - rpos(3);
   else
       to_goal(2) = worldGoalAng - 2*pi - rpos(3);
   end
end

%robot angle: angle of the robot to the goal 
%to the left of the center line axis is + angle direction


%check if essentially reached goal

if to_goal(1) < 30
    goal_found = 1; 
else 
    goal_found = 0;
end

end