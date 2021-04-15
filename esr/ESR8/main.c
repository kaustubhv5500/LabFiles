#include <RTL.h>
#include <lpc21xx.h>
#include <stdio.h>

void init_serial (void);
static OS_TID tsk1,tsk2;
static char  cnt1,cnt2,test2;
static void job1 (void);
static void job2 (void);
static char arr1[20],arr2[20];
static unsigned int i = 0;

void job1 (void)
 {
  os_tsk_prio_self (2);
  while (1)
   {
 os_tsk_create (job2, 1);
             os_evt_wait_or (0x0001, 0x0000);
             cnt1++;
             sprintf(arr1,"counter1 :%d",cnt1);
          while (arr1[i] != '\0')
          {
                    while (!(U0LSR & 0x20));
                    U0THR = arr1[i];
                   i++;
          }
          i=0;
          while (!(U0LSR & 0x20));
          U0THR = '\r'; 
          if (cnt1==0x05)
          cnt1=0;
          os_dly_wait(1);                                            
    }
}

void job2 (void)
{
	while (1){
          cnt2++;
		sprintf(arr2,"counter2 :%d",cnt2);
		while (arr2[i] != '\0'){
			while (!(U0LSR & 0x20)){
				U0THR = arr2[i];
        i++;
			}
			os_dly_wait(3);
			i=0;  
			while (!(U0LSR & 0x20)){  
          U0THR = '\n';        
          if(cnt2==0x0f){
						cnt2=0;
						os_evt_set (0x0001, tsk1);
					}
					test2=22;
          os_dly_wait(3);
          test2=0;
          os_dly_wait(3);
			}
		}
	}
}
int main (void) 
{
	cnt1=0;
	cnt2=0;
  init_serial ();
  os_sys_init (job1);
  while (1);
}

void init_serial (void) {
  PINSEL0 = 0X0000005;                 // Enable RxD0 and TxD0              
  U0LCR = 0x83;                         // 8 bits, no Parity, 1 Stop bit     
  U0DLL = 0x61;                           // 9600 Baud Rate @ 15MHz VPB Clock  
  U0LCR = 0x03;                         // DLAB = 0                          
}
