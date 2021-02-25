import datetime
currentTime = datetime.datetime.now()
startTime = datetime.time(9, 15, 0)
endTime = datetime.time(15, 30, 0)
print(currentTime)
if (currentTime.time() < endTime) and (currentTime.time() > startTime):
    print("Hello")