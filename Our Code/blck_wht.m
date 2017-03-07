function [grid_map] = blck_wht(grid_map_file)

[X, map] = imread(grid_map_file);

grid_map = zeros(size(X));

grid_map(X==1) = 1;

end
