%% Script to plot the robot data
clear 
close all
clc

range = 100:100:600;
%range = range./600; % Normalized

sens = 4:4:16;
%sens = sens./16; % Normalized

%% Excel read



%% 8 Sensors
% time_vs_range_ns8 = [123.735 99 99 101.874 0 0];
% dist_vs_range_ns8 = [3828 3810 3734 3674 0 0];
% hits_vs_range_ns8 = [14 20 10 15 0 0];

dist_vs_range_ns8 = zeros(1, 6);
dist_vs_range_ns8(1,1) = xlsread('MAE252W17-Robot Data_test.xlsx','8 Sensors','B13');
dist_vs_range_ns8(1, 2) = xlsread('MAE252W17-Robot Data_test.xlsx','8 Sensors','B26');
dist_vs_range_ns8(1, 3) = xlsread('MAE252W17-Robot Data_test.xlsx','8 Sensors','F13');
dist_vs_range_ns8(1, 4) = xlsread('MAE252W17-Robot Data_test.xlsx','8 Sensors','F26');
dist_vs_range_ns8(1, 5) = xlsread('MAE252W17-Robot Data_test.xlsx','8 Sensors','J13');
dist_vs_range_ns8(1, 6) = xlsread('MAE252W17-Robot Data_test.xlsx','8 Sensors','J26');

hit_vs_range_ns8 = zeros(1, 6);
hit_vs_range_ns8(1,1) = xlsread('MAE252W17-Robot Data_test.xlsx','8 Sensors','C13');
hit_vs_range_ns8(1,2) = xlsread('MAE252W17-Robot Data_test.xlsx','8 Sensors','C26');
hit_vs_range_ns8(1,3) = xlsread('MAE252W17-Robot Data_test.xlsx','8 Sensors','G13');
hit_vs_range_ns8(1,4) = xlsread('MAE252W17-Robot Data_test.xlsx','8 Sensors','G26');
hit_vs_range_ns8(1,5) = xlsread('MAE252W17-Robot Data_test.xlsx','8 Sensors','K13');
hit_vs_range_ns8(1,6) = xlsread('MAE252W17-Robot Data_test.xlsx','8 Sensors','K26');

% figure(1)
% hold on
% plot(range, time_vs_range_ns8)
% hold off

figure(2)
hold on
plot(range, dist_vs_range_ns8)
hold off

figure(3)
hold on
plot(range, hit_vs_range_ns8)
hold off

%% 10 Sensors
% time_vs_range_ns12 = [97.16 80.523 78.5 82.607 138.936 86.67];
% dist_vs_range_ns12 = [3760 3262 3168 3186 4798 3198];
% hits_vs_range_ns12 = [5 5 1 1 25 1];


dist_vs_range_ns10 = zeros(1, 6);
dist_vs_range_ns10(1, 1) = xlsread('MAE252W17-Robot Data_test.xlsx','10 Sensors','B13');
dist_vs_range_ns10(1, 2) = xlsread('MAE252W17-Robot Data_test.xlsx','10 Sensors','B26');
dist_vs_range_ns10(1, 3) = xlsread('MAE252W17-Robot Data_test.xlsx','10 Sensors','G13');
dist_vs_range_ns10(1, 4) = xlsread('MAE252W17-Robot Data_test.xlsx','10 Sensors','G26');
dist_vs_range_ns10(1, 5) = xlsread('MAE252W17-Robot Data_test.xlsx','10 Sensors','L13');
dist_vs_range_ns10(1, 6) = xlsread('MAE252W17-Robot Data_test.xlsx','10 Sensors','L26');

hit_vs_range_ns10 = zeros(1, 6);
hit_vs_range_ns10(1, 1) = xlsread('MAE252W17-Robot Data_test.xlsx','10 Sensors','C13');
hit_vs_range_ns10(1, 2) = xlsread('MAE252W17-Robot Data_test.xlsx','10 Sensors','C26');
hit_vs_range_ns10(1 ,3) = xlsread('MAE252W17-Robot Data_test.xlsx','10 Sensors','H13');
hit_vs_range_ns10(1, 4) = xlsread('MAE252W17-Robot Data_test.xlsx','10 Sensors','H26');
hit_vs_range_ns10(1, 5) = xlsread('MAE252W17-Robot Data_test.xlsx','10 Sensors','M13');
hit_vs_range_ns10(1, 6) = xlsread('MAE252W17-Robot Data_test.xlsx','10 Sensors','M26');

% figure(1)
% hold on
% plot(range, time_vs_range_ns10)
% hold off

figure(2)
hold on
plot(range, dist_vs_range_ns10)
hold off

figure(3)
hold on
plot(range, hit_vs_range_ns10)
hold off

%% 12 Sensors
% time_vs_range_ns16 = [80.442 123 80 82 86 89.446];
% dist_vs_range_ns16 = [3330 4734 3240 3250 3212 3204];
% hits_vs_range_ns16 = [3 14 10 3 8 4];

dist_vs_range_ns12 = zeros(1, 6);
dist_vs_range_ns12( 1) = xlsread('MAE252W17-Robot Data_test.xlsx','12 Sensors','B13');
dist_vs_range_ns12(2) = xlsread('MAE252W17-Robot Data_test.xlsx','12 Sensors','B26');
dist_vs_range_ns12(3) = xlsread('MAE252W17-Robot Data_test.xlsx','12 Sensors','F13');
dist_vs_range_ns12(4) = xlsread('MAE252W17-Robot Data_test.xlsx','12 Sensors','F26');
dist_vs_range_ns12(5) = xlsread('MAE252W17-Robot Data_test.xlsx','12 Sensors','J13');
dist_vs_range_ns12(6) = xlsread('MAE252W17-Robot Data_test.xlsx','12 Sensors','J26');

hit_vs_range_ns12 = zeros(1, 6);
hit_vs_range_ns12(1) = xlsread('MAE252W17-Robot Data_test.xlsx','12 Sensors','C13');
hit_vs_range_ns12(2) = xlsread('MAE252W17-Robot Data_test.xlsx','12 Sensors','C26');
hit_vs_range_ns12(3) = xlsread('MAE252W17-Robot Data_test.xlsx','12 Sensors','G13');
hit_vs_range_ns12(4) = xlsread('MAE252W17-Robot Data_test.xlsx','12 Sensors','G26');
hit_vs_range_ns12(5) = xlsread('MAE252W17-Robot Data_test.xlsx','12 Sensors','K13');
hit_vs_range_ns12(6) = xlsread('MAE252W17-Robot Data_test.xlsx','12 Sensors','K26');


% figure(1)
% hold on
% plot(range, time_vs_range_ns12)
% hold off

figure(2)
hold on
plot(range, dist_vs_range_ns12)
hold off

figure(3)
hold on
plot(range, hit_vs_range_ns12)
hold off




%% 14 Sensors
% time_vs_range_ns16 = [80.442 123 80 82 86 89.446];
% dist_vs_range_ns16 = [3330 4734 3240 3250 3212 3204];
% hits_vs_range_ns16 = [3 14 10 3 8 4];

dist_vs_range_ns14 = zeros(1, 6);
dist_vs_range_ns14(1) = xlsread('MAE252W17-Robot Data_test.xlsx','14 Sensors','B13');
dist_vs_range_ns14(2) = xlsread('MAE252W17-Robot Data_test.xlsx','14 Sensors','B26');
dist_vs_range_ns14(3) = xlsread('MAE252W17-Robot Data_test.xlsx','14 Sensors','G13');
dist_vs_range_ns14(4) = xlsread('MAE252W17-Robot Data_test.xlsx','14 Sensors','G26');
dist_vs_range_ns14(5) = xlsread('MAE252W17-Robot Data_test.xlsx','14 Sensors','L13');
dist_vs_range_ns14(6) = xlsread('MAE252W17-Robot Data_test.xlsx','14 Sensors','L26');


hit_vs_range_ns14 = zeros(1, 6);
hit_vs_range_ns14(1) = xlsread('MAE252W17-Robot Data_test.xlsx','14 Sensors','C13');
hit_vs_range_ns14(2) = xlsread('MAE252W17-Robot Data_test.xlsx','14 Sensors','C26');
hit_vs_range_ns14(3) = xlsread('MAE252W17-Robot Data_test.xlsx','14 Sensors','H13');
hit_vs_range_ns14(4) = xlsread('MAE252W17-Robot Data_test.xlsx','14 Sensors','H26');
hit_vs_range_ns14(5) = xlsread('MAE252W17-Robot Data_test.xlsx','14 Sensors','M13');
hit_vs_range_ns14(6) = xlsread('MAE252W17-Robot Data_test.xlsx','14 Sensors','M26');

% 
% figure(1)
% hold on
% plot(range, time_vs_range_ns14)
% hold off

figure(2)
hold on
plot(range, dist_vs_range_ns14)
hold off

figure(3)
hold on
plot(range, hit_vs_range_ns14)
hold off




%% 16 Sensors
% time_vs_range_ns16 = [80.442 123 80 82 86 89.446];
% dist_vs_range_ns16 = [3330 4734 3240 3250 3212 3204];
% hits_vs_range_ns16 = [3 14 10 3 8 4];

dist_vs_range_ns16 = zeros(1, 6);
dist_vs_range_ns16(1) = xlsread('MAE252W17-Robot Data_test.xlsx','16 Sensors','B13');
dist_vs_range_ns16(2) = xlsread('MAE252W17-Robot Data_test.xlsx','16 Sensors','B26');
dist_vs_range_ns16(3) = xlsread('MAE252W17-Robot Data_test.xlsx','16 Sensors','G13');
dist_vs_range_ns16(4) = xlsread('MAE252W17-Robot Data_test.xlsx','16 Sensors','G26');
dist_vs_range_ns16(5) = xlsread('MAE252W17-Robot Data_test.xlsx','16 Sensors','L13');
dist_vs_range_ns16(6) = xlsread('MAE252W17-Robot Data_test.xlsx','16 Sensors','L26');

hit_vs_range_ns16 = zeros(1, 6);
hit_vs_range_ns16(1) = xlsread('MAE252W17-Robot Data_test.xlsx','16 Sensors','C13');
hit_vs_range_ns16(2) = xlsread('MAE252W17-Robot Data_test.xlsx','16 Sensors','C26');
hit_vs_range_ns16(3) = xlsread('MAE252W17-Robot Data_test.xlsx','16 Sensors','H13');
hit_vs_range_ns16(4) = xlsread('MAE252W17-Robot Data_test.xlsx','16 Sensors','H26');
hit_vs_range_ns16(5) = xlsread('MAE252W17-Robot Data_test.xlsx','16 Sensors','M13');
hit_vs_range_ns16(6) = xlsread('MAE252W17-Robot Data_test.xlsx','16 Sensors','M26');


% figure(1)
% hold on
% plot(range, time_vs_range_ns16)
% hold off

figure(2)
hold on
plot(range, dist_vs_range_ns16)
hold off

figure(3)
hold on
plot(range, hit_vs_range_ns16)
hold off

 %% Plot crap

figure(1)
xlabel('Range normalized by 600 cm')
ylabel('Time to goal (sec)')
legend('8 Sensors', '10 Sensors', '12 Sensors', '14 Sensors', '16 Sensors', 'Location', 'best')

figure(2)
xlabel('Range normalized by 600 cm')
ylabel('Distance traveled (cm)')
legend('8 Sensors', '10 Sensors', '12 Sensors', '14 Sensors', '16 Sensors', 'Location', 'best')

figure(3)
xlabel('Range normalized by 600 cm')
ylabel('Robot hits')
legend('8 Sensors', '10 Sensors', '12 Sensors', '14 Sensors', '16 Sensors', 'Location', 'best')
