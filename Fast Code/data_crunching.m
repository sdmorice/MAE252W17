%% Script to plot the robot data
clear 
close all
clc

range = 100:100:600;
range = range./600; % Normalized

sens = 4:4:16;
sens = sens./16; % Normalized

%% 8 Sensors
time_vs_range_ns8 = [123.735 99 99 101.874 0 0];
dist_vs_range_ns8 = [3828 3810 3734 3674 0 0];
hits_vs_range_ns8 = [14 20 10 15 0 0];

figure(1)
hold on
plot(range, time_vs_range_ns8)
hold off

figure(2)
hold on
plot(range, dist_vs_range_ns8)
hold off

figure(3)
hold on
plot(range, hits_vs_range_ns8)
hold off


%% 12 Sensors
time_vs_range_ns12 = [97.16 80.523 78.5 82.607 138.936 86.67];
dist_vs_range_ns12 = [3760 3262 3168 3186 4798 3198];
hits_vs_range_ns12 = [5 5 1 1 25 1];

figure(1)
hold on
plot(range, time_vs_range_ns12)
hold off

figure(2)
hold on
plot(range, dist_vs_range_ns12)
hold off

figure(3)
hold on
plot(range, hits_vs_range_ns12)
hold off



%% 16 Sensors
time_vs_range_ns16 = [80.442 123 80 82 86 89.446];
dist_vs_range_ns16 = [3330 4734 3240 3250 3212 3204];
hits_vs_range_ns16 = [3 14 10 3 8 4];

figure(1)
hold on
plot(range, time_vs_range_ns16)
hold off

figure(2)
hold on
plot(range, dist_vs_range_ns16)
hold off

figure(3)
hold on
plot(range, hits_vs_range_ns16)
hold off


%% Plot crap

figure(1)
xlabel('Range normalized by 600 cm')
ylabel('Time to goal (sec)')
legend('8 Sensors', '12 Sensors', '16 Sensors', 'Location', 'best')

figure(2)
xlabel('Range normalized by 600 cm')
ylabel('Distance traveled (cm)')
legend('8 Sensors', '12 Sensors', '16 Sensors', 'Location', 'best')

figure(3)
xlabel('Range normalized by 600 cm')
ylabel('Robot hits')
legend('8 Sensors', '12 Sensors', '16 Sensors', 'Location', 'best')
