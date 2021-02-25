


#get_ipython().run_line_magic('matplotlib', 'inline')
import sys
print ("System Version: {}".format(sys.version))
import numpy as np
print ("NumPy Version: {}".format(np.__version__))
import pandas as pd
print ("Pandas Version: {}".format(pd.__version__))
import mglearn
print ("Mglearn Version: {}".format(mglearn.__version__))
import matplotlib.pyplot as plt
import matplotlib as mpl
print ("Matplotlib Version: {}".format(mpl.__version__))
import scipy as sp
print ("SciPy Version: {}".format(sp.__version__))
import sklearn
print("Sklearn Version: {}".format(sklearn.__version__))
import IPython
print ("IPython Version: {}\n\n".format(IPython.__version__))
from sklearn.model_selection import train_test_split
import random
from sklearn.preprocessing import MinMaxScaler
from sklearn.cluster import KMeans
import math
from sklearn.neighbors import KNeighborsClassifier
from datetime import datetime
from datetime import time
from sklearn.tree import DecisionTreeRegressor


#importing the data from excel file
locdata=[]
names=['time','latitude','longitude']
locdata=pd.read_excel(r'C:\Users\Kaustubh\Documents\locdata.xlsx',names=names)  

#print (locdata,end="\n")

#modifying the list and splitting it to be input into the algorithms
finloc=[list(a) for a in zip(locdata['latitude'],locdata['longitude'])]


#Function to find the optimum value of k in kmeans clustering using elbow method
def optimumk(X_train_scaled):
    Sum_of_squared_distances = []
    K = range(1,15)
    for k in K:
        km = KMeans(n_clusters=k)
        km = km.fit(X_train_scaled)
        Sum_of_squared_distances.append(km.inertia_)
    plt.plot(K, Sum_of_squared_distances, 'bx-')
    plt.xlabel('k')
    plt.ylabel('Sum of squared distances')
    plt.title('Elbow Method For Optimal k')
    plt.show()
    
    slp=[]
    i=0
    while i<(len(Sum_of_squared_distances)-1):
        slp.append(Sum_of_squared_distances[i]-Sum_of_squared_distances[i+1])
        i+=1
           
    x=(slp.index(max(slp))+2)
            
    return (x)
    
n=optimumk(finloc)

#Applying KMeans clustering algorithm
kmeans=KMeans(n_clusters=n,random_state=4321)
kmeans.fit(finloc)

# converting ndarray to a nested list 
ndarray = kmeans.cluster_centers_.tolist()



#Printing
print ("The number of clusters found was: {}".format(n))
print("\nList of Cluster Centroid points:\n")
print(ndarray,"\n")
plt.scatter(locdata['latitude'],locdata['longitude'],alpha=0.4)

     
        
#Converting time into decimals   
tm=locdata['time'].tolist()
tim=[(i.hour+(i.minute/60)+(i.second/3600)) for i in tm]


#Splitting the data for K-nearest neighbour classifier to predict home and office location
target=[]
for x in tim:
    if  x>19.0 or x<10.0:  #if home; target is 1
        target.append(1)
    else:                  #if office or outside; target is 0
        target.append(0)
        
timloc=[list(a) for a in zip(locdata['latitude'],locdata['longitude'],target)]
timloc=np.array(timloc)

X_train, X_test,y_train,y_test=train_test_split(timloc[:,[0,1]],timloc[:,2],random_state=42)

#Scaling and transforming
scaler=MinMaxScaler()
scaler.fit(X_train)
X_train_scaled=scaler.transform(X_train)

#Applying K neighbours classifier
knn=KNeighborsClassifier(n_neighbors=1)
knn.fit(X_train,y_train)

print ("Evaluating at test score: {:.3f}\n".format(knn.score(X_test,y_test)))

arr=np.array(ndarray)

for x in arr:
    x=x.reshape(1,-1)
    y_pred=knn.predict(x)
    
    if(y_pred[0]==0):
        print("Cluster Center {} is predicted to be found during the day and thus it is the office location\n".format(x))
    elif(y_pred[0]==1):
        print("Cluster Center {} is predicted to be found during the night and thus it is the home location\n".format(x))
        
        
        
#Using Regression to predict location at a particular time

loctim=[list(a) for a in zip(tim,locdata['latitude'],locdata['longitude'])]
loctim=np.array(loctim)

#function to  take input of time
def inputtime():
    inp=input("Enter the time at which location is to be predicted: \n")
    tim=inp.split(":")
    ret=(int(tim[0])+(int(tim[1])/60)+(int(tim[2])/3600))
    return float(ret)

query=[inputtime()]
print("\n\n")

#Splitting the data and applying the Decision Tree Regressor

EX_train = loctim[:, 0]
ylat_train=np.log(loctim[:,1])
ylon_train=np.log(loctim[:,2])
EX_train=EX_train.reshape(-1,1)

treelon=DecisionTreeRegressor(random_state=0).fit(EX_train,ylon_train)
treelat=DecisionTreeRegressor(random_state=0).fit(EX_train,ylat_train)

query=np.array(query)
query=query.reshape(1,-1)

lontree=treelon.predict(query)
lattree=treelat.predict(query)

finlon=np.exp(lontree)
finlat=np.exp(lattree)

print("The location at the queried time was found to be: ({:.4f} , {:.4f}) \n".format(finlat[0],finlon[0]))


mglearn.discrete_scatter(kmeans.cluster_centers_[:, 0], kmeans.cluster_centers_[:, 1], [0, 1],markers='^', markeredgewidth=2)
mglearn.discrete_scatter(finlat,finlon,markers='s',c='r',markeredgewidth=3)
plt.xlabel('Latitude')
plt.ylabel('Longitude')
plt.title('Centroid of Clusters')







