function [outline_x, outline_y, hit, rel_hit] = draw_bot_non(rpos, grid_map)

% Written by Stalefish
% 
% hold off
% %show the course
% imshow(grid_map), axis image off; %colormap gray;
% 
% hold on;

hit = 0; 

rad = 60/2; % Radius of the robot nose

ort_ang = rpos(3); % Orientation angle of the robot

ang_L = ort_ang - pi/2;


ang_R = ort_ang + pi/2;

%get a semi-circle representing the robot's nose
if ang_L < ang_R
    angs = ang_L:pi/30:ang_R;
else
    angs = ang_R:pi/30:ang_L;
end
    
outline_x = rpos(1) + rad*cos(angs);
outline_y = rpos(2) + rad*sin(angs);

x_start_1 = outline_x(31);
y_start_1 = outline_y(31);

x_end_1 = x_start_1 - rad*cos(ort_ang);
y_end_1 = y_start_1 - rad*sin(ort_ang);

x_start_2 = x_end_1;
y_start_2 = y_end_1;

x_end_2 = x_start_2 + 2*rad*sin(ort_ang);
y_end_2 = y_start_2 - 2*rad*cos(ort_ang);

x_end_3 = outline_x(1);
y_end_3 = outline_y(1);

outline_x = [outline_x x_end_1 x_end_2 x_end_3];
outline_y = [outline_y y_end_1 y_end_2 y_end_3];

rel_hit = 0;


for i = 1:length(outline_y)
    if(round(outline_y(i)) < 0) || (round(outline_x(i)) < 0)
        hit = 1;
        disp('out')
%         
%          %calculating the point of the robot that was hit
%         x_hit = outline_x(i);
%         y_hit = outline_y(i);
%         
%         %find location of hit relative to the robot center
%         dist_x = outline_x(i)-rpos(1);
%         dist_y = outline_y(i)-rpos(2);
%         
%         %calculate the angle of the object relative to world map
%         theta_hit = atan2(dist_y, dist_x); 
%             if  2*pi> rpos(3) && rpos(3)>= pi
%                 if rpos(3)> theta_hit && theta_hit >= rpos(3)-pi
%                     rel_hit = theta_hit - rpos(3);
%                 else
%                     rel_hit = theta_hit + 2*pi - rpos(3); 
%                 end
%             elseif  pi> rpos(3) && rpos(3) >= 0
%                if rpos(3)+ pi > theta_hit && rpos(3) > theta_hit
%                    rel_hit = theta_hit - rpos(3);
%                else
%                    rel_hit = theta_hit - 2*pi - rpos(3);
%                end
%             end        
%         
% %         hold
%         break; 
    elseif(grid_map(round(outline_x(i)),round(outline_y(i))) ~= 255)
        %if so, return 1
        hit = 1;
        %disp('hit')
                %calculating the point of the robot that was hit
        x_hit = outline_x(i);
        y_hit = outline_y(i);
        
        %find location of hit relative to the robot center
        dist_x = outline_x(i)-rpos(1);
        dist_y = outline_y(i)-rpos(2);
        
        %calculate the angle of the object relative to world map
        theta_hit = atan2(dist_y, dist_x); 
            if  2*pi> rpos(3) && rpos(3)>= pi
                if rpos(3)> theta_hit && theta_hit >= rpos(3)-pi
                    rel_hit = theta_hit - rpos(3);
                else
                    rel_hit = theta_hit + 2*pi - rpos(3); 
                end
            elseif  pi> rpos(3) && rpos(3) >= 0
               if rpos(3)+ pi > theta_hit && rpos(3) > theta_hit
                   rel_hit = theta_hit - rpos(3);
               else
                   rel_hit = theta_hit - 2*pi - rpos(3);
               end
            end        
        
%         hold
        break;    
        
        
    end
end


% plot(outline_y, outline_x)


end
