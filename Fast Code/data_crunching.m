%% Script to plot the robot data
clear 
close all
clc

range = 100:100:600;
%range = range./600; % Normalized

sens = 8:2:16;
%sens = sens./16; % Normalized

%% Excel read



%% 8 Sensors
% time_vs_range_ns8 = [123.735 99 99 101.874 0 0];
% dist_vs_range_ns8 = [3828 3810 3734 3674 0 0];
% hits_vs_range_ns8 = [14 20 10 15 0 0];

dist_vs_range_ns8 = zeros(1, 6);
dist_vs_range_ns8(1) = xlsread('MAE252W17-Robot Data_test-std_dev.xlsx','8 Sensors','B13');
dist_vs_range_ns8(2) = xlsread('MAE252W17-Robot Data_test-std_dev.xlsx','8 Sensors','B26');
dist_vs_range_ns8(3) = xlsread('MAE252W17-Robot Data_test-std_dev.xlsx','8 Sensors','F13');
dist_vs_range_ns8(4) = xlsread('MAE252W17-Robot Data_test-std_dev.xlsx','8 Sensors','F26');
dist_vs_range_ns8(5) = xlsread('MAE252W17-Robot Data_test-std_dev.xlsx','8 Sensors','J13');
dist_vs_range_ns8(6) = xlsread('MAE252W17-Robot Data_test-std_dev.xlsx','8 Sensors','J26');

std_dist_ns8(1) = xlsread('MAE252W17-Robot Data_test-std_dev.xlsx','8 Sensors','B14');
std_dist_ns8(2) = xlsread('MAE252W17-Robot Data_test-std_dev.xlsx','8 Sensors','B27');
std_dist_ns8(3) = xlsread('MAE252W17-Robot Data_test-std_dev.xlsx','8 Sensors','F14');
std_dist_ns8(4) = xlsread('MAE252W17-Robot Data_test-std_dev.xlsx','8 Sensors','F27');
std_dist_ns8(5) = xlsread('MAE252W17-Robot Data_test-std_dev.xlsx','8 Sensors','J14');
std_dist_ns8(6) = xlsread('MAE252W17-Robot Data_test-std_dev.xlsx','8 Sensors','J27');

hit_vs_range_ns8 = zeros(1, 6);
hit_vs_range_ns8(1) = xlsread('MAE252W17-Robot Data_test-std_dev.xlsx','8 Sensors','C13');
hit_vs_range_ns8(2) = xlsread('MAE252W17-Robot Data_test-std_dev.xlsx','8 Sensors','C26');
hit_vs_range_ns8(3) = xlsread('MAE252W17-Robot Data_test-std_dev.xlsx','8 Sensors','G13');
hit_vs_range_ns8(4) = xlsread('MAE252W17-Robot Data_test-std_dev.xlsx','8 Sensors','G26');
hit_vs_range_ns8(5) = xlsread('MAE252W17-Robot Data_test-std_dev.xlsx','8 Sensors','K13');
hit_vs_range_ns8(6) = xlsread('MAE252W17-Robot Data_test-std_dev.xlsx','8 Sensors','K26');

% std_hit_ns8(1) = xlsread('MAE252W17-Robot Data_test-std_dev.xlsx','8 Sensors','C14');
% std_hit_ns8(2) = xlsread('MAE252W17-Robot Data_test-std_dev.xlsx','8 Sensors','C27');
% std_hit_ns8(3) = xlsread('MAE252W17-Robot Data_test-std_dev.xlsx','8 Sensors','G14');
% std_hit_ns8(4) = xlsread('MAE252W17-Robot Data_test-std_dev.xlsx','8 Sensors','G27');
% std_hit_ns8(5) = xlsread('MAE252W17-Robot Data_test-std_dev.xlsx','8 Sensors','K14');
% std_hit_ns8(6) = xlsread('MAE252W17-Robot Data_test-std_dev.xlsx','8 Sensors','K27');
% figure(1)
% hold on
% plot(range, time_vs_range_ns8)
% hold off

figure(1)
hold on
plot(range, dist_vs_range_ns8)
hold off

figure(2)
hold on
plot(range, hit_vs_range_ns8)
hold off

%% 10 Sensors
% time_vs_range_ns12 = [97.16 80.523 78.5 82.607 138.936 86.67];
% dist_vs_range_ns12 = [3760 3262 3168 3186 4798 3198];
% hits_vs_range_ns12 = [5 5 1 1 25 1];


dist_vs_range_ns10 = zeros(1, 6);
dist_vs_range_ns10(1) = xlsread('MAE252W17-Robot Data_test-std_dev.xlsx','10 Sensors','B13');
dist_vs_range_ns10(2) = xlsread('MAE252W17-Robot Data_test-std_dev.xlsx','10 Sensors','B26');
dist_vs_range_ns10(3) = xlsread('MAE252W17-Robot Data_test-std_dev.xlsx','10 Sensors','G13');
dist_vs_range_ns10(4) = xlsread('MAE252W17-Robot Data_test-std_dev.xlsx','10 Sensors','G26');
dist_vs_range_ns10(5) = xlsread('MAE252W17-Robot Data_test-std_dev.xlsx','10 Sensors','L13');
dist_vs_range_ns10(6) = xlsread('MAE252W17-Robot Data_test-std_dev.xlsx','10 Sensors','L26');

std_dist_ns10(1) = xlsread('MAE252W17-Robot Data_test-std_dev.xlsx','10 Sensors','B14');
std_dist_ns10(2) = xlsread('MAE252W17-Robot Data_test-std_dev.xlsx','10 Sensors','B27');
std_dist_ns10(3) = xlsread('MAE252W17-Robot Data_test-std_dev.xlsx','10 Sensors','G14');
std_dist_ns10(4) = xlsread('MAE252W17-Robot Data_test-std_dev.xlsx','10 Sensors','G27');
std_dist_ns10(5) = xlsread('MAE252W17-Robot Data_test-std_dev.xlsx','10 Sensors','L14');
std_dist_ns10(6) = xlsread('MAE252W17-Robot Data_test-std_dev.xlsx','10 Sensors','L27');


hit_vs_range_ns10 = zeros(1, 6);
hit_vs_range_ns10(1) = xlsread('MAE252W17-Robot Data_test-std_dev.xlsx','10 Sensors','C13');
hit_vs_range_ns10(2) = xlsread('MAE252W17-Robot Data_test-std_dev.xlsx','10 Sensors','C26');
hit_vs_range_ns10(3) = xlsread('MAE252W17-Robot Data_test-std_dev.xlsx','10 Sensors','H13');
hit_vs_range_ns10(4) = xlsread('MAE252W17-Robot Data_test-std_dev.xlsx','10 Sensors','H26');
hit_vs_range_ns10(5) = xlsread('MAE252W17-Robot Data_test-std_dev.xlsx','10 Sensors','M13');
hit_vs_range_ns10(6) = xlsread('MAE252W17-Robot Data_test-std_dev.xlsx','10 Sensors','M26');

% std_hit_ns10(1) = xlsread('MAE252W17-Robot Data_test-std_dev.xlsx','10 Sensors','C14');
% std_hit_ns10(2) = xlsread('MAE252W17-Robot Data_test-std_dev.xlsx','10 Sensors','C27');
% std_hit_ns10(3) = xlsread('MAE252W17-Robot Data_test-std_dev.xlsx','10 Sensors','H14');
% std_hit_ns10(4) = xlsread('MAE252W17-Robot Data_test-std_dev.xlsx','10 Sensors','H27');
% std_hit_ns10(5) = xlsread('MAE252W17-Robot Data_test-std_dev.xlsx','10 Sensors','M14');
% std_hit_ns10(6) = xlsread('MAE252W17-Robot Data_test-std_dev.xlsx','10 Sensors','M27');
% 

% figure(1)
% hold on
% plot(range, time_vs_range_ns10)
% hold off

figure(1)
hold on
plot(range, dist_vs_range_ns10)
hold off

figure(2)
hold on
plot(range, hit_vs_range_ns10)
hold off

%% 12 Sensors
% time_vs_range_ns16 = [80.442 123 80 82 86 89.446];
% dist_vs_range_ns16 = [3330 4734 3240 3250 3212 3204];
% hits_vs_range_ns16 = [3 14 10 3 8 4];

dist_vs_range_ns12 = zeros(1, 6);
dist_vs_range_ns12(1) = xlsread('MAE252W17-Robot Data_test-std_dev.xlsx','12 Sensors','B13');
dist_vs_range_ns12(2) = xlsread('MAE252W17-Robot Data_test-std_dev.xlsx','12 Sensors','B26');
dist_vs_range_ns12(3) = xlsread('MAE252W17-Robot Data_test-std_dev.xlsx','12 Sensors','F13');
dist_vs_range_ns12(4) = xlsread('MAE252W17-Robot Data_test-std_dev.xlsx','12 Sensors','F26');
dist_vs_range_ns12(5) = xlsread('MAE252W17-Robot Data_test-std_dev.xlsx','12 Sensors','J13');
dist_vs_range_ns12(6) = xlsread('MAE252W17-Robot Data_test-std_dev.xlsx','12 Sensors','J26');

std_dist_ns12(1) = xlsread('MAE252W17-Robot Data_test-std_dev.xlsx','12 Sensors','B14');
std_dist_ns12(2) = xlsread('MAE252W17-Robot Data_test-std_dev.xlsx','12 Sensors','B27');
std_dist_ns12(3) = xlsread('MAE252W17-Robot Data_test-std_dev.xlsx','12 Sensors','F14');
std_dist_ns12(4) = xlsread('MAE252W17-Robot Data_test-std_dev.xlsx','12 Sensors','F27');
std_dist_ns12(5) = xlsread('MAE252W17-Robot Data_test-std_dev.xlsx','12 Sensors','J14');
std_dist_ns12(6) = xlsread('MAE252W17-Robot Data_test-std_dev.xlsx','12 Sensors','J27');


hit_vs_range_ns12 = zeros(1, 6);
hit_vs_range_ns12(1) = xlsread('MAE252W17-Robot Data_test-std_dev.xlsx','12 Sensors','C13');
hit_vs_range_ns12(2) = xlsread('MAE252W17-Robot Data_test-std_dev.xlsx','12 Sensors','C26');
hit_vs_range_ns12(3) = xlsread('MAE252W17-Robot Data_test-std_dev.xlsx','12 Sensors','G13');
hit_vs_range_ns12(4) = xlsread('MAE252W17-Robot Data_test-std_dev.xlsx','12 Sensors','G26');
hit_vs_range_ns12(5) = xlsread('MAE252W17-Robot Data_test-std_dev.xlsx','12 Sensors','K13');
hit_vs_range_ns12(6) = xlsread('MAE252W17-Robot Data_test-std_dev.xlsx','12 Sensors','K26');


% std_hit_ns12(1) = xlsread('MAE252W17-Robot Data_test-std_dev.xlsx','12 Sensors','C14');
% std_hit_ns12(2) = xlsread('MAE252W17-Robot Data_test-std_dev.xlsx','12 Sensors','C27');
% std_hit_ns12(3) = xlsread('MAE252W17-Robot Data_test-std_dev.xlsx','12 Sensors','G14');
% std_hit_ns12(4) = xlsread('MAE252W17-Robot Data_test-std_dev.xlsx','12 Sensors','G27');
% std_hit_ns12(5) = xlsread('MAE252W17-Robot Data_test-std_dev.xlsx','12 Sensors','K14');
% std_hit_ns12(6) = xlsread('MAE252W17-Robot Data_test-std_dev.xlsx','12 Sensors','K27');
% 

% figure(1)
% hold on
% plot(range, time_vs_range_ns12)
% hold off

figure(1)
hold on
plot(range, dist_vs_range_ns12)
hold off

figure(2)
hold on
plot(range, hit_vs_range_ns12)
hold off




%% 14 Sensors
% time_vs_range_ns16 = [80.442 123 80 82 86 89.446];
% dist_vs_range_ns16 = [3330 4734 3240 3250 3212 3204];
% hits_vs_range_ns16 = [3 14 10 3 8 4];

dist_vs_range_ns14 = zeros(1, 6);
dist_vs_range_ns14(1) = xlsread('MAE252W17-Robot Data_test-std_dev.xlsx','14 Sensors','B13');
dist_vs_range_ns14(2) = xlsread('MAE252W17-Robot Data_test-std_dev.xlsx','14 Sensors','B26');
dist_vs_range_ns14(3) = xlsread('MAE252W17-Robot Data_test-std_dev.xlsx','14 Sensors','G13');
dist_vs_range_ns14(4) = xlsread('MAE252W17-Robot Data_test-std_dev.xlsx','14 Sensors','G26');
dist_vs_range_ns14(5) = xlsread('MAE252W17-Robot Data_test-std_dev.xlsx','14 Sensors','L13');
dist_vs_range_ns14(6) = xlsread('MAE252W17-Robot Data_test-std_dev.xlsx','14 Sensors','L26');

std_dist_ns14(1) = xlsread('MAE252W17-Robot Data_test-std_dev.xlsx','14 Sensors','B14');
std_dist_ns14(2) = xlsread('MAE252W17-Robot Data_test-std_dev.xlsx','14 Sensors','B27');
std_dist_ns14(3) = xlsread('MAE252W17-Robot Data_test-std_dev.xlsx','14 Sensors','G14');
std_dist_ns14(4) = xlsread('MAE252W17-Robot Data_test-std_dev.xlsx','14 Sensors','G27');
std_dist_ns14(5) = xlsread('MAE252W17-Robot Data_test-std_dev.xlsx','14 Sensors','L14');
std_dist_ns14(6) = xlsread('MAE252W17-Robot Data_test-std_dev.xlsx','14 Sensors','L27');


hit_vs_range_ns14 = zeros(1, 6);
hit_vs_range_ns14(1) = xlsread('MAE252W17-Robot Data_test-std_dev.xlsx','14 Sensors','C13');
hit_vs_range_ns14(2) = xlsread('MAE252W17-Robot Data_test-std_dev.xlsx','14 Sensors','C26');
hit_vs_range_ns14(3) = xlsread('MAE252W17-Robot Data_test-std_dev.xlsx','14 Sensors','H13');
hit_vs_range_ns14(4) = xlsread('MAE252W17-Robot Data_test-std_dev.xlsx','14 Sensors','H26');
hit_vs_range_ns14(5) = xlsread('MAE252W17-Robot Data_test-std_dev.xlsx','14 Sensors','M13');
hit_vs_range_ns14(6) = xlsread('MAE252W17-Robot Data_test-std_dev.xlsx','14 Sensors','M26');

% std_hit_ns14(1) = xlsread('MAE252W17-Robot Data_test-std_dev.xlsx','14 Sensors','C14');
% std_hit_ns14(2) = xlsread('MAE252W17-Robot Data_test-std_dev.xlsx','14 Sensors','C27');
% std_hit_ns14(3) = xlsread('MAE252W17-Robot Data_test-std_dev.xlsx','14 Sensors','H14');
% std_hit_ns14(4) = xlsread('MAE252W17-Robot Data_test-std_dev.xlsx','14 Sensors','H27');
% std_hit_ns14(5) = xlsread('MAE252W17-Robot Data_test-std_dev.xlsx','14 Sensors','M14');
% std_hit_ns14(6) = xlsread('MAE252W17-Robot Data_test-std_dev.xlsx','14 Sensors','M27');
% 

% 
% figure(1)
% hold on
% plot(range, time_vs_range_ns14)
% hold off

figure(1)
hold on
plot(range, dist_vs_range_ns14)
hold off

figure(2)
hold on
plot(range, hit_vs_range_ns14)
hold off




%% 16 Sensors
% time_vs_range_ns16 = [80.442 123 80 82 86 89.446];
% dist_vs_range_ns16 = [3330 4734 3240 3250 3212 3204];
% hits_vs_range_ns16 = [3 14 10 3 8 4];

dist_vs_range_ns16 = zeros(1, 6);
dist_vs_range_ns16(1) = xlsread('MAE252W17-Robot Data_test-std_dev.xlsx','16 Sensors','B13');
dist_vs_range_ns16(2) = xlsread('MAE252W17-Robot Data_test-std_dev.xlsx','16 Sensors','B26');
dist_vs_range_ns16(3) = xlsread('MAE252W17-Robot Data_test-std_dev.xlsx','16 Sensors','G13');
dist_vs_range_ns16(4) = xlsread('MAE252W17-Robot Data_test-std_dev.xlsx','16 Sensors','G26');
dist_vs_range_ns16(5) = xlsread('MAE252W17-Robot Data_test-std_dev.xlsx','16 Sensors','L13');
dist_vs_range_ns16(6) = xlsread('MAE252W17-Robot Data_test-std_dev.xlsx','16 Sensors','L26');

std_dist_ns16(1) = xlsread('MAE252W17-Robot Data_test-std_dev.xlsx','16 Sensors','B14');
std_dist_ns16(2) = xlsread('MAE252W17-Robot Data_test-std_dev.xlsx','16 Sensors','B27');
std_dist_ns16(3) = xlsread('MAE252W17-Robot Data_test-std_dev.xlsx','16 Sensors','G14');
std_dist_ns16(4) = xlsread('MAE252W17-Robot Data_test-std_dev.xlsx','16 Sensors','G27');
std_dist_ns16(5) = xlsread('MAE252W17-Robot Data_test-std_dev.xlsx','16 Sensors','L14');
std_dist_ns16(6) = xlsread('MAE252W17-Robot Data_test-std_dev.xlsx','16 Sensors','L27');


hit_vs_range_ns16 = zeros(1, 6);
hit_vs_range_ns16(1) = xlsread('MAE252W17-Robot Data_test-std_dev.xlsx','16 Sensors','C13');
hit_vs_range_ns16(2) = xlsread('MAE252W17-Robot Data_test-std_dev.xlsx','16 Sensors','C26');
hit_vs_range_ns16(3) = xlsread('MAE252W17-Robot Data_test-std_dev.xlsx','16 Sensors','H13');
hit_vs_range_ns16(4) = xlsread('MAE252W17-Robot Data_test-std_dev.xlsx','16 Sensors','H26');
hit_vs_range_ns16(5) = xlsread('MAE252W17-Robot Data_test-std_dev.xlsx','16 Sensors','M13');
hit_vs_range_ns16(6) = xlsread('MAE252W17-Robot Data_test-std_dev.xlsx','16 Sensors','M26');

% std_hit_ns16(1) = xlsread('MAE252W17-Robot Data_test-std_dev.xlsx','16 Sensors','C14');
% std_hit_ns16(2) = xlsread('MAE252W17-Robot Data_test-std_dev.xlsx','16 Sensors','C27');
% std_hit_ns16(3) = xlsread('MAE252W17-Robot Data_test-std_dev.xlsx','16 Sensors','H14');
% std_hit_ns16(4) = xlsread('MAE252W17-Robot Data_test-std_dev.xlsx','16 Sensors','H27');
% std_hit_ns16(5) = xlsread('MAE252W17-Robot Data_test-std_dev.xlsx','16 Sensors','M14');
% std_hit_ns16(6) = xlsread('MAE252W17-Robot Data_test-std_dev.xlsx','16 Sensors','M27');
% 

% figure(1)
% hold on
% plot(range, time_vs_range_ns16)
% hold off

figure(1)
hold on
plot(range, dist_vs_range_ns16)
hold off

figure(2)
hold on
plot(range, hit_vs_range_ns16)
hold off

%% Plot standard deviations

%standard deviation of range
figure(5) 
hold on 
plot (range, std_dist_ns8)
plot (range, std_dist_ns10)
plot (range, std_dist_ns12)
plot (range, std_dist_ns14)
plot (range, std_dist_ns16)

xlabel('Range (cm)');
ylabel('Standard Deviation of the Distance(cm)')
legend('8 Sensors', '10 Sensors', '12 Sensors', '14 Sensors', '16 Sensors', 'Location', 'best')

hold off 
saveas(figure(5), 'stddev_dist_vs_ns.png')

% %standard deviation of hits
% figure(6)
% hold on 
% plot (range, std_hit_ns8)
% plot (range, std_hit_ns10)
% plot (range, std_hit_ns12)
% plot (range, std_hit_ns14)
% plot (range, std_hit_ns16)
% 
% xlabel('Range (cm)');
% ylabel('Standard Deviation of Hits(cm)')
% legend('8 Sensors', '10 Sensors', '12 Sensors', '14 Sensors', '16 Sensors', 'Location', 'best')
% 
% hold off




 %% Plot crap

% figure(1)
% xlabel('Range normalized by 600 cm')
% ylabel('Time to goal (sec)')
% legend('8 Sensors', '10 Sensors', '12 Sensors', '14 Sensors', '16 Sensors', 'Location', 'best')

figure(1)
%xlabel('Range normalized by 600 cm')
xlabel('Number of Sensors');
ylabel('Distance Traveled (cm)')
legend('8 Sensors', '10 Sensors', '12 Sensors', '14 Sensors', '16 Sensors', 'Location', 'best')
saveas(figure(1), 'dist_vs_ns.png')

figure(2)
%xlabel('Range normalized by 600 cm')
xlabel('Number of Sensors');
ylabel('Number of Hits')
legend('8 Sensors', '10 Sensors', '12 Sensors', '14 Sensors', '16 Sensors', 'Location', 'best')
saveas(figure(2), 'hits_vs_ns.png')

%% Plot Varied Sensors


% Range = 100

dist_vs_sens_range100 = [dist_vs_range_ns8(1) dist_vs_range_ns10(1) dist_vs_range_ns12(1) dist_vs_range_ns14(1) dist_vs_range_ns16(1)];
hit_vs_sens_range100 = [hit_vs_range_ns8(1) hit_vs_range_ns10(1) hit_vs_range_ns12(1) hit_vs_range_ns14(1) hit_vs_range_ns16(1)];

std_dist_range100 = [std_dist_ns8(1) std_dist_ns10(1) std_dist_ns12(1) std_dist_ns14(1) std_dist_ns16(1)];
%std_hit_range100 = [std_hit_ns8(1) std_hit_ns10(1) std_hit_ns12(1) std_hit_ns14(1) std_hit_ns16(1)];


figure(3)

hold on
plot(sens, dist_vs_sens_range100)
hold off

figure(4)
hold on
plot(sens, hit_vs_sens_range100)
hold off

% Range = 200

dist_vs_sens_range200 = [dist_vs_range_ns8(2) dist_vs_range_ns10(2) dist_vs_range_ns12(2) dist_vs_range_ns14(2) dist_vs_range_ns16(2)];
hit_vs_sens_range200 = [hit_vs_range_ns8(2) hit_vs_range_ns10(2) hit_vs_range_ns12(2) hit_vs_range_ns14(2) hit_vs_range_ns16(2)];

std_dist_range200 = [std_dist_ns8(2) std_dist_ns10(2) std_dist_ns12(2) std_dist_ns14(2) std_dist_ns16(2)];
%std_hit_range200 = [std_hit_ns8(2) std_hit_ns10(2) std_hit_ns12(2) std_hit_ns14(2) std_hit_ns16(2)];

figure(3)
hold on
plot(sens, dist_vs_sens_range200)
hold off

figure(4)
hold on
plot(sens, hit_vs_sens_range200)
hold off

% Range = 300

dist_vs_sens_range300 = [dist_vs_range_ns8(3) dist_vs_range_ns10(3) dist_vs_range_ns12(3) dist_vs_range_ns14(3) dist_vs_range_ns16(3)];
hit_vs_sens_range300 = [hit_vs_range_ns8(3) hit_vs_range_ns10(3) hit_vs_range_ns12(3) hit_vs_range_ns14(3) hit_vs_range_ns16(3)];

std_dist_range300 = [std_dist_ns8(3) std_dist_ns10(3) std_dist_ns12(3) std_dist_ns14(3) std_dist_ns16(3)];
%std_hit_range300 = [std_hit_ns8(3) std_hit_ns10(3) std_hit_ns12(3) std_hit_ns14(3) std_hit_ns16(3)];


figure(3)
hold on
plot(sens, dist_vs_sens_range300)
hold off

figure(4)
hold on
plot(sens, hit_vs_sens_range300)
hold off

% Range = 400

dist_vs_sens_range400 = [dist_vs_range_ns8(4) dist_vs_range_ns10(4) dist_vs_range_ns12(4) dist_vs_range_ns14(4) dist_vs_range_ns16(4)];
hit_vs_sens_range400 = [hit_vs_range_ns8(4) hit_vs_range_ns10(4) hit_vs_range_ns12(4) hit_vs_range_ns14(4) hit_vs_range_ns16(4)];

std_dist_range400 = [std_dist_ns8(4) std_dist_ns10(4) std_dist_ns12(4) std_dist_ns14(4) std_dist_ns16(4)];
%std_hit_range400 = [std_hit_ns8(4) std_hit_ns10(4) std_hit_ns12(4) std_hit_ns14(4) std_hit_ns16(4)];


figure(3)
hold on
plot(sens, dist_vs_sens_range400)
hold off

figure(4)
hold on
plot(sens, hit_vs_sens_range400)
hold off

% Range = 500

dist_vs_sens_range500 = [dist_vs_range_ns8(5) dist_vs_range_ns10(5) dist_vs_range_ns12(5) dist_vs_range_ns14(5) dist_vs_range_ns16(5)];
hit_vs_sens_range500 = [hit_vs_range_ns8(5) hit_vs_range_ns10(5) hit_vs_range_ns12(5) hit_vs_range_ns14(5) hit_vs_range_ns16(5)];

std_dist_range500 = [std_dist_ns8(5) std_dist_ns10(5) std_dist_ns12(5) std_dist_ns14(5) std_dist_ns16(5)];
%std_hit_range500 = [std_hit_ns8(5) std_hit_ns10(5) std_hit_ns12(5) std_hit_ns14(5) std_hit_ns16(5)];

figure(3)
hold on
plot(sens, dist_vs_sens_range500)
hold off

figure(4)
hold on
plot(sens, hit_vs_sens_range500)
hold off

% Range = 600

dist_vs_sens_range600 = [dist_vs_range_ns8(6) dist_vs_range_ns10(6) dist_vs_range_ns12(6) dist_vs_range_ns14(6) dist_vs_range_ns16(6)];
hit_vs_sens_range600 = [hit_vs_range_ns8(6) hit_vs_range_ns10(6) hit_vs_range_ns12(6) hit_vs_range_ns14(6) hit_vs_range_ns16(6)];

std_dist_range600 = [std_dist_ns8(6) std_dist_ns10(6) std_dist_ns12(6) std_dist_ns14(6) std_dist_ns16(6)];
%std_hit_range600 = [std_hit_ns8(6) std_hit_ns10(6) std_hit_ns12(6) std_hit_ns14(6) std_hit_ns16(6)];


figure(3)
hold on
plot(sens, dist_vs_sens_range600)
hold off

figure(4)
hold on
plot(sens, hit_vs_sens_range600)
hold off

%plot standard devs 
figure(7)
hold on 
plot(sens, std_dist_range100)
plot(sens, std_dist_range200)
plot(sens, std_dist_range300)
plot(sens, std_dist_range400)
plot(sens, std_dist_range500)
plot(sens, std_dist_range600)

xlabel('Number of sensors')
ylabel('Standard Deviation of Distance(cm)')
legend('100 cm', '200 cm', '300 cm', '400 cm', '500 cm', '600 cm', 'Location', 'best')
hold off
saveas(figure(7), 'std_dist_vs_range.png')


% figure(8)
% hold on
% plot(sens, std_hit_range100)
% plot(sens, std_hit_range200)
% plot(sens, std_hit_range300)
% plot(sens, std_hit_range400)
% plot(sens, std_hit_range500)
% plot(sens, std_hit_range600)
% 
% xlabel('Number of sensors')
% ylabel('Standard Deviation of Hits(cm)')
% legend('100 cm', '200 cm', '300 cm', '400 cm', '500 cm', '600 cm', 'Location', 'best')
% 
% hold off


% Figure formatting

figure(3)
xlabel('Sensor Range (cm)')
ylabel('Distance traveled (cm)')
legend('100 cm', '200 cm', '300 cm', '400 cm', '500 cm', '600 cm', 'Location', 'best')
saveas(figure(3), 'dist_vs_range.png')

figure(4)
xlabel('Sensor Range (cm)')
ylabel('Number of hits')
legend('100 cm', '200 cm', '300 cm', '400 cm', '500 cm', '600 cm', 'Location', 'best')
saveas(figure(4), 'hits_vs_range.png')