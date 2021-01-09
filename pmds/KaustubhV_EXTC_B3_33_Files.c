#include<stdio.h>

struct student
{
	int rollno;
	char name[100];
	float marks[3];
};


struct student read() //Read a student's details
{	
	struct student s;
	printf("Enter the Roll Number of the student\n");
	scanf("%d",&s.rollno);
	
	printf("Enter the name of the Student\n");
	scanf(" %s",s.name);
	
	for(int i=0;i<3;i++)
	{
		printf("Enter the Marks of the student for subject %d\n",(i+1));
		scanf("%f",&s.marks[i]);
	}
	return s;
}

int write(char filename[],int n)  //Write to a file
{
	
	FILE *fp;
	fp=fopen(filename,"a");  //open a file
	int i;
	
	
	
	struct student s;
	
	for(i=0;i<n;i++)
	{
		s=read();
		fprintf(fp,"%d,%s,%f,%f,%f\n",s.rollno,s.name,s.marks[0],s.marks[1],s.marks[2]);
	}
	
	fclose(fp); //close the file
	return n;
}

/*void print_stu(struct student s)
{
	printf("The Roll Number of the student is: %d\n",s.rollno);
	
	printf("The name of the student is:\n");
	puts(s.name);
	
	float avg=0;
	for(int i=0;i<3;i++)
	{
	avg+=s.marks[i];
	}
	
	avg/=3;
	printf("The average marks of the student is: %f\n",avg);
	
}
*/

void readfile(char filename[],int n)
{
	FILE *fp;
	
	fp=fopen(filename,"r");
	struct student s;
	
	for(int i=0;i<n;i++)
	{
	fscanf(fp,"%d,%s,%f,%f,%f",&s.rollno,s.name,&s.marks[0],&s.marks[1],&s.marks[2]);
	float avg=(s.marks[0]+s.marks[1]+s.marks[2])/3.0;
	printf("\n%d,%s,%f,%f,%f,%f",s.rollno,s.name,s.marks[0],s.marks[1],s.marks[2],avg);
	}
	fclose(fp);
}

void main()
{
	char filename[30];
	int n;
	printf("Enter the name of the file to be created\n");
	scanf("%s",filename);
	
	printf("Enter the number of students\n");
	scanf("%d",&n);
	write(filename,n);
 	readfile(filename,n);
	
}
	
	
	
	


