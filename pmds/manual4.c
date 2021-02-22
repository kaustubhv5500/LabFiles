#include<stdio.h>
#include<math.h>
#define PI 3.1416


void main()
{

int n,i;
double duration,speed,heading;
double x=0,y=0;
double dist;

printf("Enter the number of segments\n");
scanf(" %d",&n);


for(int i=0;i<n;i++)
{

	printf("Enter the details for the segment %d\n\n",i+1);

	printf("Enter the Duration of this segment in minutes\n");
	scanf(" %lf",&duration);

	printf("Enter the speed at which this segment is traversed in km/h\n");
	scanf(" %lf",&speed);

	printf("Enter the Heading in Degrees East of North of this segment\n");
	scanf(" %lf",&heading);


	dist=(speed*duration)/60;
	heading=(heading*PI)/180;

	x+=dist*(sin(heading));
	y+=dist*(cos(heading));
}

printf("The final co-ordinates of the Airplane is: ( %lf, %lf ) \n",x,y);
}
