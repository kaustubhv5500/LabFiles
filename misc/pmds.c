#include<stdio.h>
#include<string.h>
#include<math.h>
#include<time.h>
#include<stdlib.h>




struct player    //structure to store the details of a player
{
  char name[30];
  int age;
  int balance;
  long int uid;
  char password[30];
  int no_of_bets;

  struct record   //nested structure to store the details of the bet placed and the money lost and won by a player
  {
    int type;
    int bet;
    struct tm *ptm;  //for time stamps
    int win_no,lose_no;
    long int money_lost,money_won;
  }r[100];

};

char returncolour(int[],int);
struct player cases(int[],int,int,struct player);
void placebet(int[],struct player);
void write_to_file(char[],struct player,int,long int);
int win(int,int,struct player);


struct player read(struct player p)   //function to read and initialize the initial details of a player
{
  printf("Enter the Name of the player\n");
  scanf(" %s",p.name);

  printf("Enter the Age of the Player : Must be Over 21\n");
  scanf("%d",&p.age);

  p.no_of_bets=0;

  p.balance=5000;

  for(int i=0;i<100;i++)
  {
  p.r[i].win_no=0;
  p.r[i].lose_no=0;
  p.r[i].money_lost=0;
  p.r[i].money_won=0;
  }


  srand(time(NULL));
  int n=(rand()%8999)+1000;

  p.uid=n;
  printf("The UID for the player is: %li\n",p.uid);

  printf("Enter a password for your data security\n");
 	scanf(" %s",p.password);

  write_to_file("playerdata.txt",p,0,0);
  return p;


}






//initializing the wheel to be used in the roulette game
int wheel[38]={0,32,15,19,4,21,2,25,17,34,6,27,13,36,11,30,8,23,10,5,24,16,33,0,1,20,14,31,9,22,18,29,7,28,12,35,3,26};
char colour[38]={'G','R','B','R','B','R','B','R','B','R','B','R','B','R','B','R','B','R','B','R','B','R','B','G','R','B','R','B','R','B','R','B','R','B','R','B','R','B'};


char returncolour(int wheel[],int n)  //function which returns the colour of a particular slot in the wheel
{     for(int i=0;i<38;i++)
  {
  		if(wheel[i]==n)
      return colour[i];
  }
}

void write_to_file(char filename[],struct player p,int mode,long int checkuid) //Function to write to file mode(0)=first time entry,mode(1)=update
{

  if(mode==0)
  {
  FILE *fp;
  fp=fopen(filename,"a");
  fwrite(&p,sizeof(struct player),1,fp);
  fclose(fp);
  }

  else if(mode==1)  //code to update the data of a particular player
  {
  FILE *fp;
  fp=fopen(filename,"a+");


  while(fread(&p,sizeof(struct player),1,fp))
  {

    if(p.uid==checkuid)
    {
	fseek(fp,-sizeof(struct player),SEEK_CUR);
        fwrite(&p,sizeof(struct player),1,fp);
        break;
    }
 }

  fclose(fp);
}
}


void placebet(int wheel[],struct player p)   //Function to accept bets from the player
{
	time_t t = time(NULL);
        p.r[p.no_of_bets].ptm = gmtime(&t);
	int type,bet;
  	char col;
  	printf("How do You want to bet?\n: 1.On a Single Slot\n 2.On a Colour\n 3.On Even or Odd Numbers\n 4. On High 18 or Low 18\n");
  	scanf("%d",&type);

  switch(type)
  {
    case 1: printf("You chose Single slot betting mode.\n");
        	printf("Enter a number between 1-36 to bet on \n");
        		scanf("%d", &bet);
      			p=cases(wheel,type,bet,p);
     				break;
    case 2:
       printf("You chose betting on a Colour mode.\n");
      printf("Which Colour Do You Want to bet on? Enter B for Black and R for Red\n");
      			scanf(" %c",&col);
      			p=cases(wheel,type,(int)col,p);
      		  break;
    case 3: printf("You chose Odd-Even mode.\n");
      			printf("Enter 1 to bet for Odd, 2 for Even\n");
            scanf("%d",&bet);
      			p=cases(wheel,type,bet,p);
      			break;

    case 4: printf("You chose Higher-Lower mode.\n");
      			printf("Enter 1 if you want to bet for Upper 18, Enter 2 if you want to bet for lower half\n");
      			scanf("%d",&bet);
      			p=cases(wheel,type,bet,p);
      			break;

    default:
      printf("Enter the correct Operation Number\n");
     break;

  }

  write_to_file("playerdata.txt",p,1,p.uid);
}


int spin ()    //Function to return randomly generated number to simulate the spinning of the roulette wheel
{
   int n;
   srand(time(0));

    printf("\nPress ENTER to spin the roulette!\n");
    getchar();

   n=(rand()%38);
   printf("\nThe marble landed on slot:%d having colour %c :\n", wheel[n],returncolour(wheel,n));
   return n;
}


int checkbet(int bet,struct player p)   //Function to check whether the bet value is less than the balance in the players account
{
  		while((bet<=0)&&(bet>p.balance))
     		{
      		printf("Enter Valid Bet amount !! the bet shouldnt be more than 5000 nor can be less than 0\n");
        	scanf("%d", &bet);
    			}
return bet;
}

int win(int bet,int odds,struct player p)  //Funtion to modify the balance if the player wins a bet
{
  			int winning=bet*odds;
                   p.balance+=winning;
                   printf("Congratulations, you have won $%d\n",winning);
          	printf("You now have $%d in your pocket\n",p.balance);
  return p.balance;
}

int lose(int bet,struct player p)  //Function to modify the balance if the player loses a bet
{
 		p.balance-=bet;
             printf("Sorry. You've lost $%d. Your new balance is $%d\n",bet,p.balance);
       return p.balance;
}




struct player cases(int wheel[],int mode,int bet_no,struct player p)  //function to simulate the various bets the player can make
{

  		int temp;

 	 	if(mode==1)
      		 {
           	p.r[p.no_of_bets].type=1;


      		int singlebet, amount, winning;
      		 printf("\n Enter the amount you would like to bet on number %d : \n",bet_no);
     			 scanf("%d", &singlebet);
          singlebet=checkbet(singlebet,p);
       	  printf("\nYou have bet $%d on the number %d\n", singlebet, bet_no);
       	  p.r[p.no_of_bets].bet=singlebet;

         int n=spin ();
        			if (wheel[n]==bet_no)
                 {
                		temp=p.balance;
          			p.balance=win(singlebet,35,p);
                	 p.r[p.no_of_bets].win_no++;
                   p.r[p.no_of_bets].money_won+=p.balance-temp;

                  }
                else
                {
                  temp=p.balance;
                 p.balance=lose(singlebet,p);
                 p.r[p.no_of_bets].lose_no++;
                 p.r[p.no_of_bets].money_lost+=temp-p.balance;
                }
  				}

  			else if (mode==2)
        {
          p.r[p.no_of_bets].type=2;
          int amtbet;
          printf("\n Enter the amount you would like to bet on the colour %c ? Payout  is 1 to 1 ",(char)bet_no);
     			scanf("%d", &amtbet);
     			amtbet=checkbet(amtbet,p);
 	        printf("\nYou have bet $%d on the colour %c\n", amtbet, (char)bet_no);
    	 	  int n=spin();
	p.r[p.no_of_bets].bet=amtbet;
        if (returncolour(wheel,n)==(char)bet_no)
                 {
                   temp=p.balance;
          	 p.balance=win(amtbet,1,p);
                   p.r[p.no_of_bets].win_no++;
                   p.r[p.no_of_bets].money_won+=p.balance-temp;
                  }
                else
                {
                  temp=p.balance;
                 p.balance=lose(amtbet,p);
                 p.r[p.no_of_bets].lose_no++;
                 p.r[p.no_of_bets].money_lost+=temp-p.balance;
                }
				}

  	else if(mode==3)
    { p.r[p.no_of_bets].type=3;
      int amtbet;
      char parity[10];
      if(bet_no==1)
      {
        strcpy(parity,"Odd");
      }
      else
      {
        strcpy(parity,"Even");
      }

        		printf("\n Enter the amount you would like to bet on the of the outcome being %s ? Payout  is 1 to 1 \n",parity);
     				scanf("%d", &amtbet);
     				amtbet=checkbet(amtbet,p);
       		 printf("You have bet $%d on the outcome being %s\n",amtbet,parity);
       		 p.r[p.no_of_bets].bet=amtbet;

      int n=spin();
      		if(((wheel[n]%2==0)&&(bet_no==2))||((wheel[n]%2!=0)&&(bet_no==1)))
          {
                  temp=p.balance;
                   p.balance=win(amtbet,1,p);
              		 p.r[p.no_of_bets].win_no++;
                   p.r[p.no_of_bets].money_won+=p.balance-temp;

          }
      else
      {   temp=p.balance;
          p.balance=lose(amtbet,p);
        	p.r[p.no_of_bets].lose_no++;
          p.r[p.no_of_bets].money_lost+=temp-p.balance;
      }
    }

  			else if (mode==4)
        {
          p.r[p.no_of_bets].type=4;
          int amtbet;
          char highlow[10];
          if(bet_no==1)
          {
            strcpy(highlow,"High");
          }
          else
          {
            strcpy(highlow,"Low");
          }
          printf("\n Enter the amount you would like to bet on the of the outcome being %s 18 ? Payout  is 1 to 1 \n",highlow);
     			scanf("%d", &amtbet);
     		 amtbet=checkbet(amtbet,p);
         printf("You have bet $%d on the outcome being %s 18\n",amtbet,highlow);
         p.r[p.no_of_bets].bet=amtbet;

         int n=spin();
         if(((bet_no==1)&&(wheel[n]>18))||((bet_no==2)&&(wheel[n]<=18)))
           {
             temp=p.balance;
              p.balance=win(amtbet,1,p);
              p.r[p.no_of_bets].win_no++;
              p.r[p.no_of_bets].money_won+=p.balance-temp;

     }
 else
 {   temp=p.balance;
     p.balance=lose(amtbet,p);
     p.r[p.no_of_bets].lose_no++;
     p.r[p.no_of_bets].money_lost+=temp-p.balance;
 }
}

  return p;
  p.no_of_bets++;
}



struct player login()   //Function to simulate a login screen
{
  struct player p;
  FILE *fp;
  fp=fopen("playerdata.txt","r");
  long int ud;
  char pass[40];
  int flag=0;

  do
  {

  printf("Enter the User ID for login\n");
  scanf("%li",&ud);

  printf("Enter the password\n");
  scanf("%s",pass);


  while(fread(&p,sizeof(struct player),1,fp))
  {

  if((p.uid==ud)&&(strcmp(p.password,pass)==0))
  {
    return p;
    flag=1;
  }
 }


if(flag==0)
{
  printf("Wrong User ID or Password...Please Enter Again!!\n");
}
}
while(flag!=1);
fclose(fp);
}


void menu()   //Function to simulate the menu for the program
{
  int op;
  struct player Q;

  printf("MAIN MENU\nEnter the Operation Number\n1.Login\n2.Create Account\n3.Exit\n");
  scanf("%d",&op);

  switch(op)
  {

    case 1:
    Q=login();
    break;

    case 2:
    Q=read(Q);
    break;

    case 3:
    exit(0);
    break;

    defualt:
    printf("Enter the correct Operation number\n");
    break;

  }

int bet_op;
do
{

printf("BET MENU\n1.Place Bet\n2.Logout\n");
scanf("%d",&bet_op);
switch(bet_op)
{
case 1:
placebet(wheel,Q);
break;

case 2:
menu();   //Recursive to call back the menu function
break;

default:
printf("Enter the correct operation number\n");
break;
}
}
while(op!=2);
}



void analyse_money(struct player p)   //Total money lost and won by all the players
{
FILE *fp;
fp=fopen("playerdata.txt","r");

long int tot_money_lost=0,tot_money_won=0;

	while(fread(&p,sizeof(struct player),1,fp))
	{

		for(int i=0;i<p.no_of_bets;i++)
		{
		tot_money_lost+=p.r[i].money_lost;
		tot_money_won+=p.r[i].money_won;
		}
	}


printf("The total money lost by all the players is: %li \n",tot_money_lost);
printf("The total money won by all the players is: %li \n",tot_money_won);

fclose(fp);
}


void analyse_bet(struct player p)
{

FILE *fp;
fp=fopen("playerdata.txt","r");

int bet_no[]={0,0,0,0};
int bet_typeno[]={1,2,3,4};
int riskybet=0;

	while(fread(&p,sizeof(struct player),1,fp))
	{

		for(int i=0;i<p.no_of_bets;i++)
		{
			for(int j=0;j<4;j++)
			{

				if(p.r[i].type==bet_typeno[j])
				{
					bet_no[j]++;
				}

			}


			if((p.r[i].bet>p.r[i-1].bet)&&(p.r[i-1].money_lost!=0)&&(i!=0))
			{

				riskybet++;
			}

		}
	}
}




void main()
{
  menu();
}
