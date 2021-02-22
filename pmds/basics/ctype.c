//Program to determine whether a character is a vowel or not

#include<stdio.h>

void main()
{

char ch,op;

do
{

printf("Enter the character to be checked\n");
scanf(" %c",&ch);

if(ch=='A'||ch=='E'||ch=='I'||ch=='O'||ch=='U'||ch=='a'||ch=='e'||ch=='i'||ch=='o'||ch=='u')

printf("The Character %c is a vowel\n",ch);

else

printf("The character %c is not a vowel\n",ch);

printf("Do you want to continue? Enter Y or N\n");
scanf(" %c",&op);

}
while(op=='Y'||op=='y');
}

