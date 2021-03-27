import socket

serverName = 'localhost'
serverPort = 12000

clientSocket = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
clientSocket.connect((serverName,serverPort))

message = bytes(input('Input lowercase sentence:'),'utf-8')
socket.getaddrinfo('localhost', 8080)
clientSocket.send(message)
modifiedMessage = clientSocket.recv(1024)

print('Input Message : ',message)
print('Response from server : ', modifiedMessage)
clientSocket.close()