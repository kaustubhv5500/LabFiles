#include<iostream.h>
#include<stdio.h>
#include<fstream.h>
#include<stdlib.h>
#include<time.h>

class passenger
{
public:
int freqfno;
char name[50];
char gender;
int age;
char address[100];
char username[40];
char password[50];
};

class ticket:public passenger
{
protected:
char source[80];
char destination[80];
char cl;
int pnr;
int base_price;
int class_price;
int tax;
float total_fare;
public:
void reg();
int login();
int calfare();
void buy(int num);
void fileticket();
void boardingpass();
};

void ticket::reg()
{
passenger pass;
fstream f1("Flight.dat",ios::binary|ios::app);
cout<<"\t\t\t!Welcome To Air India!\n";
cout<<"Enter the Name of the Passenger\n";
gets(pass.name);
cout<<"Enter the Age of the passenger\n";
cin>>pass.age;
cout<<"Enter the Gender\n";
cin>>pass.gender;
cout<<"Enter the Address\n";
gets(pass.address);
cout<<"Enter the Username for login(20 characters Maximum)\n";
gets(pass.username);
cout<<"Enter the password(Should contain Numbers and special Characters)\n";
gets(pass.password);
f1.write((char*)&pass,sizeof(pass));
f1.close();
}


int ticket::login()
{
int flag;
passenger pass;
fstream f3("Flight.dat",ios::binary|ios::in);
char user[100],passw[100];
cout<<"Enter the Username\n";
gets(user);
cout<<"Enter the password\n";
gets(passw);

while(f3.read((char*)&pass,sizeof(pass)))
{
if((strcmp(user,pass.username)==0)&&(strcmp(passw,pass.password)==0))
{
flag=1;
break;
}
else
{
flag=0;
}
}
return flag;
f3.close();
}

void ticket::buy(int num)
{
int total=0;
for(int i=0;i<num;i++)
{
cout<<"Enter the Source Airport\n";
gets(source);
cout<<"Enter the destination\n";
gets(destination);
cout<<"Enter the Travelling class\nE:Economy\nP:Premium Economy\nB:Business\nF:First\n";
cin>>cl;
total=total+calfare();
}
cout<<"The total cost of your ticket is:"<<total;
}

int ticket::calfare()
{
if((strcmp(source,"Mumbai")==0)&&(strcmp(destination,"New Delhi")==0))
{
base_price=5000;
}
else if((strcmp(source,"New Delhi")==0)&&(strcmp(destination,"Mumbai")==0))
{
base_price=5700;
}
else if((strcmp(source,"Mumbai")==0)&&(strcmp(destination,"Channai")==0))
{
base_price=4000;
}
else if((strcmp(source,"Chennai")==0)&&(strcmp(destination,"Mumbai")==0))
{
base_price=4500;
}
else if((strcmp(source,"Chennai")==0)&&(strcmp(destination,"New Delhi")==0))
{
base_price=6000;
}
else if((strcmp(source,"New Delhi")==0)&&(strcmp(destination,"Chennai")==0))
{
base_price=6400;
}
else if((strcmp(source,"Kolkata")==0)&&(strcmp(destination,"New Delhi")==0))
{
base_price=7000;
}
else if((strcmp(source,"New Delhi")==0)&&(strcmp(destination,"Kolkata")==0))
{
base_price=8000;
}
else if((strcmp(source,"Bangalore")==0)&&(strcmp(destination,"New Delhi")==0))
{
base_price=5000;
}
else if((strcmp(source,"New Delhi")==0)&&(strcmp(destination,"Bangalore")==0))
{
base_price=5400;
}
else if((strcmp(source,"Bangalore")==0)&&(strcmp(destination,"Mumbai")==0))
{
base_price=5000;
}
else if((strcmp(source,"Mumbai")==0)&&(strcmp(destination,"Bangalore")==0))
{
base_price=6000;
}
else if((strcmp(source,"Bangalore")==0)&&(strcmp(destination,"Kolkata")==0))
{
base_price=8000;
}
else if((strcmp(source,"Kolkata")==0)&&(strcmp(destination,"Bangalore")==0))
{
base_price=10000;
}
else if((strcmp(source,"Mumbai")==0)&&(strcmp(destination,"Kolkata")==0))
{
base_price=10000;
}
else if((strcmp(source,"Kolkata")==0)&&(strcmp(destination,"Mumbai")==0))
{
base_price=12500;
}
else if((strcmp(source,"Chennai")==0)&&(strcmp(destination,"Bangalore")==0))
{
base_price=3000;
}
else if((strcmp(source,"Bangalore")==0)&&(strcmp(destination,"Chennai")==0))
{
base_price=2500;
}
else
{
cout<<"Sorry but this Flight route is not offered by our Airlines\n";
}

if(cl=='B')
{
class_price=base_price+0.1*base_price;
}
else if(cl=='P')

{class_price=base_price+0.3*base_price;
}
else if(cl=='B')
{
class_price=base_price+0.4*base_price;
}
else if(cl=='F')
{
class_price=base_price+0.5*base_price;
}
tax=0.14*class_price;
total_fare=tax+class_price;
return total_fare;
}

void ticket::fileticket()
{
srand(time(NULL));
pnr=rand()%10000+99999;
cout<<"Your PNR number is: "<<pnr<<endl<<"Please Note it down\n";
ticket t1;
fstream f2("Flight.dat",ios::binary|ios::app);
f2.write((char*)&t1,sizeof(t1));
}


void ticket::boardingpass()
{
int checkpnr;
cout<<"Enter the PNR Number\n";
cin>>checkpnr;
ticket t;
srand(time(NULL));
int seatno=rand()%50+1;
int seatchar=rand()%70+65;
int flag=0;
fstream f4("Flight.dat",ios::binary|ios::in);

while(f4.read((char*)&t,sizeof(t)))
{
if(t.pnr==checkpnr)
{
cout<<"\t\t\tAir India Airlines\n\t\t\t\tBOARDING PASS\n";
cout<<"Passenger Name: ";
puts(t.name);
cout<<"Source Airport: ";
puts(t.source);
cout<<"Destination Airport: ";
puts(t.destination);
cout<<"PNR Number is: "<<t.pnr<<endl;
cout<<"Flying Class: "<<t.cl<<endl;
cout<<"Seat Number: "<<char(seatchar)<<" "<<seatno<<endl;
break;
flag=1;
}
}
if(flag==0)
{
cout<<"PNR not valid\n";
}
}




void main()
{
ticket p1;
p1.reg();
}
