function [grid_map] = color_gry(grid_map_file)

X = imread(grid_map_file); %3D colored array
X_red = X(:,:,1); %Red layer
X_grn = X(:,:,2); %Green layer
X_blu = X(:,:,3); %Blue layer

grid_map = zeros(size(X_red)); %Completely black map

grid_map(X_red==255 & X_grn==255 & X_blu==255) = 255; %Adding white section

grid_map(X_red==255 & X_grn~=255 & X_blu~=255) = 50; %Adding red section
grid_map(X_red~=255 & X_grn==255 & X_blu~=255) = 100; %Adding green section
grid_map(X_red~=255 & X_grn~=255 & X_blu==255) = 150; %Adding blue section

end
