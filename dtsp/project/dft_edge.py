# -*- coding: utf-8 -*-

#import libraries 
import os
import cv2
import matplotlib.pyplot as plt
import re
from sklearn.cluster import DBSCAN  # For DBSCAN
import numpy as np
import shutil


# Dividing dataset into tampered and original

"""
I. Amerini, L. Ballan, R. Caldelli, A. Del Bimbo, G. Serra. 
“A SIFT-based forensic method for copy-move attack detection and transformation recovery”, 
IEEE Transactions on Information Forensics and Security, vol. 6, issue 3, pp. 1099-1110, 2011.
"""

image_paths=[] #List to store path of all images
file_paths = []

for dirname, _, filenames in os.walk('MICC-F2000'):
    for filename in filenames:
        if '.txt' in filename:
            continue
        image_paths.append(os.path.join(dirname, filename))
        
original_images=[]
tampered_images=[]
count = 0

for path in image_paths:
    if 'tamp' in path:              # As Observed from the above list tampered images name has tamp
        tampered_images.append(path)
    else:
        original_images.append(path)
        
def plot_image(img,size=(8,8)):
    plt.figure(figsize = size)
    plt.imshow(cv2.cvtColor(img,cv2.COLOR_BGR2RGB)) 
    
tampered1 = cv2.imread(tampered_images[0])
plot_image(tampered1)

        
tampered_images.sort()
original_images.sort()

print(len(original_images),len(tampered_images))
