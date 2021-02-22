//Program to find the roots of a quadratic equation

#include<math.h>
#include<stdio.h>


void main()
{

double a,b,c,det;
double x1,x2;
double temp,sq;


printf("Enter the Coefficient of x^2\n");
scanf("%lf",&a);

printf("Enter the Coefficient of x\n");
scanf("%lf",&b);

printf("Enter the Constant Term\n");
scanf("%lf",&c);

det=((b*b)-(4*a*c));

if(det>0)
{

x1=(((-(b/a))+(sqrt(det)/a))/2);
x2=(((-(b/a))-(sqrt(det)/a))/2);

printf("The Roots of the Equation are Real and Distinct and have the values:\nx1:%lf\tx2:%lf\n",x1,x2);
}

else if(det==0)
{

x1=(-(b/a))/2;

printf("The Roots are real and equal and has the value:\nx:%lf\n",x1);

}

else if(det<0)
{

temp=(-(b/a))/2;
sq=((sqrt(-det)/a))/2;

printf("The roots are Imaginary and have the values:\nx1:%lf+%lfi\nx2:%lf-%lfi\n",temp,sq,temp,sq);
}
}




