function [hit] = draw_bot(rpos, grid_map)

% Written by Stalefish


hold off;
%show the course
imshow(grid_map), axis image off; %colormap gray;

hold on;

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

x_start_3 = x_end_2;
y_start_3 = y_end_2;

x_end_3 = outline_x(1);
y_end_3 = outline_y(1);

outline_x = [outline_x linspace(x_start_1, x_end_1, 10) ...
    linspace(x_start_2, x_end_2, 10) linspace(x_start_3, x_end_3, 10)];
outline_y = [outline_y linspace(y_start_1, y_end_1, 10) ...
    linspace(y_start_2, y_end_2, 10) linspace(y_start_3, y_end_3, 10)];


for i = 1:length(outline_y)
    if(outline_y(i) < 0)
        hit = 1;
        disp('out')
    elseif(grid_map(round(outline_x(i)),round(outline_y(i))) == 0)
        %if so, return 1
        hit = 1;
        disp('hit')
        
        
    end
end


plot(outline_y, outline_x)

end
