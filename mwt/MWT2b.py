# Mobile and Wireless Communication Lab
# Experiment 2b: To implement Dynamic Channel Assignment
# Date: 09/09/2021

from random import seed
from random import randint
from random import sample
import math
import numpy as np

total_channels = input("Enter the total number of channels: ")
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
        num = math.ceil(channel_req[i]/2)
        cellh = sample(highp_channel,num)
        celll = sample(lowp_channels, channel_req[i] - num)
        cell = cellh + celll
    highp_channel = list(set(highp_channel).difference(cellh))
    lowp_channels = list(set(lowp_channels).difference(celll))
    if(len(cell) < int(cluster_size)):
        zero = int(cluster_size) - len(cell)
        for k in range(zero):
            cell.append(0)
    print(cell)