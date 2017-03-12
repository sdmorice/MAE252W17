function new_posn =  drive(posn, grid_map)
%% Written by Magnum
%Inputs: posn    (posn of robot)
%        
%
%Outputs: new_posn (the new x and y coordinates of robot)
%         
% This function takes in the position of robot, and move the object forward
% for a specific amount of time, before rereading sensor values
% Robot goes 2 m/s



%% The goods
d = 10; %distance robot travels per reading (cm)
old_posn_x = posn(1); %origninal x coordinate position
old_posn_y = posn(2); %original y coordinate position
theta = posn(3); %angle of robot heading (rad)
final_x = old_posn_x+d*cos(theta); %final distance to be traveled by robot
final_y = old_posn_y+d*sin(theta);
new_posn = posn;

speed = 200; %speed of robot (cm/s)
t_step = .01; %time step per interation of plot (s)
d_step = speed*t_step; %distance step per iteration of plot (cm)

for i=1:d_step:d
    new_posn(1) = old_posn_x + i*d_step*cos(theta);
    new_posn(2) = old_posn_y + i*d_step*sin(theta);
    [hit] = draw_bot(new_posn, grid_map);
    if hit(1) == 1
        new_posn(1) = old_posn_x + (i-2)*d_step*cos(theta);
        new_posn(2) = old_posn_y + (i-2)*d_step*sin(theta);
        draw_bot(new_posn, grid_map);
        pause(t_step)
        if hit(2) == 1
            new_posn(3) = posn(3) + pi/8;
        elseif hit(2) == 2
            new_posn(3) = posn(3) - pi/8;
        end
        draw_bot(new_posn, grid_map);
        pause(t_step)
    end   
    pause(t_step);
end
    
