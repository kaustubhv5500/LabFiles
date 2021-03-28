import socket

serverName = 'localhost'
serverPort = 12000

clientSocket = socket.socket(socket.AF_INET,socket.SOCK_DGRAM)
message = bytes(input('Input lowercase sentence:'),'utf-8')
socket.getaddrinfo('localhost', 8080)
clientSocket.sendto(message,(serverName, serverPort))

modifiedMessage, serverAddress = clientSocket.recvfrom(2048)
print('Input Message : ',message)
print('Received Message :',modifiedMessage)
clientSocket.close()
