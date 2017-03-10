function [dist_to_goal, goal_found] = goal_finding(rpos, robot_goal)

dist_to_goal(1) = sqrt((rpos(2) - robot_goal(2))^2 + (rpos(1) - robot_goal(1))^2);
dist_to_goal(2) = atan2((rpos(1) - robot_goal(1)),(rpos(2) - robot_goal(2)));

if dist_to_goal(2) < 0
    dist_to_goal(2) = dist_to_goal(2) + 2*pi;
end

%check if essentially reached goal
<<<<<<< HEAD
if dist_to_goal(1) < 15
=======
if dist_to_goal(1) < 12
>>>>>>> 5290033d0f8e607e1deb4798f2892e4ad887eb21
    goal_found = 1; 
else 
    goal_found = 0;
end

end