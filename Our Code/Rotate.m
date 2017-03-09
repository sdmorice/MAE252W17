function new_posn = Rotate(posn, alpha_r, grid_map)
%% Written by Magnum
%Inputs: posn    (posn of robot)
%        alpha_r (rebound angle)
%
%Outputs: new_angle (the new angle of the robot)
%         
% This function takes in the position of robot, updates the rotation.
% It will also show the roation dynamics of the robot

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
%    ------------------------------------------
%% The goods
new_posn = posn;
old_angle = posn(3);
delta_angle = alpha_r-pi/2;

final_angle = old_angle+alpha_r-pi/2;
    
if final_angle >= 2*pi
        final_angle = final_angle-2*pi;
end
       
%Omolon Power bot roatates 300 deg/s
w_deg = 3; %angular rotaion in deg (3deg per .01 seconds)
w_rad = deg2rad(w_deg); %angular rotation in rad

steps = abs(ceil(delta_angle/w_rad)); %the change of angle per iteration, 

%this for loop, the program plots 3deg moved, then pauses a second
for i = 1:steps+1
 %Object hits something Clause     
    if i<steps
        new_posn(3) = sign(delta_angle)*i*w_rad+old_angle;
        if new_posn(3) >= 2*pi
            new_posn(3) = new_posn(3)-2*pi;
        end
        
        [x,y,hit]=draw_bot(new_posn, grid_map);
% %Object hits something Clause         
%         if hit ==1
%             break;
%         end        
        pause(.01);
    
    else
        new_posn(3) = final_angle;
        [x,y,hit]=draw_bot(new_posn, grid_map);
        
%  %Object hits something Clause       
%         if hit ==1
%             break;
%         end 
        pause(.01);
        
    end
end    
    
