% Mobile and Wireless Communication Lab
% Experiment 2: To implement Fixed Channel Assignment
% MATLAB Version: R2018a
% Date: 02/09/2021

clc;
clear;

% Taking input of total number of Channels and Cluster size
total_channels = input('Enter the Total Number of Channels: ');
control_channels = ceil(0.15 * total_channels);
clusters = input('Enter the Number of Clusters: ');

traffic_channels = total_channels - control_channels;
valid_clusters = [1 3 4 7 9 12 13];

% Loop to Check if Cluster size is valid
flag=0;
for i=1:10
    for j=1:10
        if clusters == (i*i+j*j+i*j)
            flag = 1;
            break;
        end
    end
end

% If cluster is invalid change to closest valid cluster size
if flag == 0
    disp("Invalid Cluster Size!");
    [minValue,index] = min(abs(valid_clusters-clusters));
    closestClusterSize = valid_clusters(index);
    clusters = closestClusterSize;
    fprintf("Changing Cluster Size to Closest Valid Value: %d\n",clusters);
end

t_channels = ceil(traffic_channels/clusters);
c_channels = ceil(control_channels/clusters);

% Calculating Control Channel Assignment
disp("Control Channel Assignment")
num = 1 + traffic_channels;
count = 0;
mat_control = zeros(clusters,c_channels);

for i=1:c_channels
    temp = num;
    for j=1:clusters
        if num <= total_channels
            mat_control(j,i) = num;
            num = num+1;
        else
            count = count + 1;
            if count < 3
                num = temp;
                mat_control(j,i) = num;
                num = num + 1;
            else
                mat_control(j,i)=0;
            end
        end
    end
end

disp(mat_control);

% Calculating Traffic Channel Assignment
disp('Traffic Channel Assignment: ');
mat_traffic = zeros(clusters, t_channels);
n = clusters * t_channels;
x = 1;
for i = 1: t_channels
    for j = 1:clusters
        if x <= traffic_channels
            mat_traffic(j,i) = x;
            x = x + 1;
        else
            mat_traffic(j,i) = 0;
        end
    end
end

disp(mat_traffic);