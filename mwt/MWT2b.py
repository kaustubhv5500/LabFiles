# Mobile and Wireless Communication Lab
# Experiment 2b: To implement Dynamic Channel Assignment
# Date: 09/09/2021

from random import seed
from random import randint
from random import sample
import math
import numpy as np

total_channels = int(input("Enter the total number of channels: "))
cluster_size = int(input("Enter the cluster size: "))
channel_req = list()
valid_clusters = [1,3,4,7,9,12,13,19,21,27,28,31,37,39,43,48,49,52]

# Loop to Check if Cluster size is valid
flag = 0
if cluster_size in valid_clusters:
    flag = 1

# If cluster is invalid change to closest valid cluster size
if flag == 0:
    print("Invalid Cluster Size!")
    diff = np.absolute(np.array(valid_clusters) - int(cluster_size))
    index = diff.argmin()
    closestClusterSize = valid_clusters[index]
    cluster_size = closestClusterSize
    print("Changing Cluster Size to Closest Valid Value: ", closestClusterSize)

for i in range(int(cluster_size)):
    s = "Enter requirement for cell " + str(i+1) + ": "
    channel_req.append(int(input(s)))

print('\nOriginal Channel Requirement', channel_req)

if sum(channel_req) > total_channels:
    print('Channel requirement more than total number of available channels!!\nChanging channel allocation based on Blocking Probability.')
    channels_per_cell = math.ceil(total_channels / cluster_size)
    max_req = max(channel_req)
    max_diff = (abs(max_req - channels_per_cell) / (cluster_size - 1)) + channels_per_cell
    blocking_prob = max_diff / max_req
    
    for i in range(len(channel_req)):
        if channel_req[i] > channels_per_cell:
            channel_req[i] = math.ceil(blocking_prob * channel_req[i])
            if sum(channel_req) < total_channels and channel_req[i] !=0:
                channel_req[i] += math.ceil(abs(total_channels - sum(channel_req)))
    
    if sum(channel_req) > total_channels:
        channel_req[channel_req.index(max(channel_req))] -= abs(total_channels-channel_req)
    elif sum(channel_req) < total_channels:
         channel_req[channel_req.index(max(channel_req))] += abs(total_channels-channel_req)

    print('Updated Channel Requirement: ',channel_req)
total_channels = int(total_channels)
all_channels = list()

for j in range(total_channels):
    all_channels.append(j+1)

hc = math.ceil(total_channels/2)
highp_channel = sample(all_channels, hc)
print("\nHigh priority channels are: ")
print(highp_channel)

lowp_channels = list(set(all_channels).difference(highp_channel))
print("\nLow priority Channels are: ")
print(lowp_channels)

cell = list()
i = 0

print("\nThe cell assignments are: ")
for i in range(int(cluster_size)):
    for j in range(int(cluster_size)):
        num = math.ceil(channel_req[i] / 2)
        if num > len(highp_channel):
            num = len(highp_channel) // 2
        cellh = sample(highp_channel,num)
        if (channel_req[i] - num) > len(lowp_channels):
            num = len(lowp_channels) // 2
        celll = sample(lowp_channels, num)
        cell = cellh + celll
    highp_channel = list(set(highp_channel).difference(cellh))
    lowp_channels = list(set(lowp_channels).difference(celll))
    if(len(cell) < int(cluster_size)):
        zero = int(cluster_size) - len(cell)
        for k in range(zero):
            cell.append(0)
    print(cell)