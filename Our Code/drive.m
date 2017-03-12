function new_posn =  drive(posn, grid_map, hit, robot_goal)
%% Written by Magnum
%Inputs: posn    (posn of robot)
%        hit (whether or not the robot hit a wall, if hit = 1 than it hit 
%             something, else it would 
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
   [outline_x, outline_y, hit, rel_hit] =draw_bot(new_posn, grid_map);
       if hit ==1
            old_posn_x_hit = new_posn(1);
            old_posn_y_hit = new_posn(2);
            turn = -1*sign(rel_hit); %turn the opposite direction in which
%                                    the wall was hit            
            
            if abs(rel_hit) <= pi/2
                for j=1: d_step: 10
                    new_posn(1) = old_posn_x_hit - j*d_step*cos(theta);
                    new_posn(2) = old_posn_y_hit - j*d_step*sin(theta);
                    draw_bot(new_posn, grid_map);
                    pause(t_step)

                end
                    new_posn(3) = posn(3)+turn*30*pi/180;
                break 
            else
                  for j=1:d_step: 4
                        new_posn(1) = old_posn_x_hit + j*d_step*cos(theta);
                        new_posn(2) = old_posn_y_hit + j*d_step*sin(theta);
                        draw_bot(new_posn, grid_map);   
                        pause(t_step)
                  end
              break
            end
       end
        
       
    pause(t_step);
end
    
