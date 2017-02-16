% Grid Gen_RobotCrap
% Sam Morice

%clear
close all
%clc

% Overall Map
grid_size_x = 3000;
grid_size_y = grid_size_x/2;
grid_map = zeros(grid_size_x, grid_size_y);

% x and y locations
x = 1:grid_size_x;
y = 1:grid_size_y;
[Y,X] = meshgrid(y,x);
cmap = [1 0 0; 0 0 1; 1 1 1; 0 0 0; 1 0 1];

% Outer walls
grid_map(1, :) = 1;
grid_map(grid_size_x, :) = 1;
grid_map(:, 1) = 1;
grid_map(:, grid_size_y) = 1;

% Obstacles

x1 = 450;
y1 = 151;
x1size = 50;
y1size = 150;

grid_map = obstacle(grid_map, x1, y1, x1size, y1size);

x2 = 300;
y2 = 800;
x2size = 75;
y2size = 100;

grid_map = obstacle(grid_map, x2, y2, x2size, y2size);

x3 = 1000;
y3 = 700;
x3size = 50;
y3size = 75;

grid_map = obstacle(grid_map, x3, y3, x3size, y3size);

x4 = 2250;
y4 = 900;
x4size = 100;
y4size = 300;

grid_map = obstacle(grid_map, x4, y4, x4size, y4size);

x5 = 1700;
y5 = 350;
x5size = 75;
y5size = 75;

grid_map = obstacle(grid_map, x5, y5, x5size, y5size);

x5 = 1400;
y5 = 1200;
x5size = 150;
y5size = 75;

grid_map = obstacle(grid_map, x5, y5, x5size, y5size);

% Start and Stop
xstart = 51;
ystart = 51;
xstartsize = 50;
ystartsize = 50;

grid_map = start(grid_map, xstart, ystart, xstartsize, ystartsize);

xstop = grid_size_x - 51;
ystop = grid_size_y - 51;
xstopsize = 50;
ystopsize = 50;

grid_map = stop(grid_map, xstop, ystop, xstopsize, ystopsize);


% Robot
xrob = 1;
yrob = 1;
xrobsize = 50;
yrobsize = 50;

grid_map = robot(grid_map, xrob, yrob, xrobsize, yrobsize);

% Plot
figure(1)
surf(X,Y,grid_map, 'FaceColor', 'texturemap', 'LineStyle', 'none')
colormap(cmap)
axis 'equal'

view(0,90)


%Functions
function grid_map = obstacle(grid_map, x, y, xsize, ysize)
for i = -xsize:xsize
    for j = -ysize:ysize        
        grid_map(x+i, y+j) = 1;
    end
end
end

function grid_map = start(grid_map, x, y, xsize, ysize)
for i = -xsize:xsize
    for j = -ysize:ysize        
        grid_map(x+i, y+j) = -1;
    end
end
end

function grid_map = stop(grid_map, x, y, xsize, ysize)
for i = -xsize:xsize
    for j = -ysize:ysize        
        grid_map(x+i, y+j) = -2;
    end
end
end

function grid_map = robot(grid_map, x, y, xsize, ysize)
for i = 0:xsize
    for j = 0:ysize        
        grid_map(x+i, y+j) = 2;
    end
end
end