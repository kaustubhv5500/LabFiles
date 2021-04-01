#include <RTL.h>                     
#include <LPC21xx.h>               
#include <stdio.h>

void init_serial (void);
void task1 (void);
void task2(void);
void init (void);
	
static unsigned char msg1[]="task1\r\n", msg2[]="task2\r\n";
static unsigned int i=0;
static OS_TID tsk1, tsk2;
static OS_SEM semaphore1;

void task1 (void) {
  OS_RESULT ret;

  while (1) {
    os_dly_wait(3);
    ret = os_sem_wait (semaphore1, 1);
    if (ret != OS_R_TMO) {
       while (msg1[i] != '\0')
            {
                    while (!(U0LSR & 0x20));
                    U0THR = msg1[i];
                   i++;
            }
            i=0;
          os_sem_send (semaphore1);
    }
  }
}

void task2 (void) {
  while (1)
  {
  
    os_sem_wait (semaphore1, 0xFFFF);
     while (msg2[i] != '\0')
            {
                    while (!(U0LSR & 0x20));
                    U0THR = msg2[i];
                   i++;
            }
            i=0;
    os_sem_send (semaphore1);
  }
}

void init (void) {
  init_serial ();
  os_sem_init (semaphore1, 1);
  tsk1 = os_tsk_create (task1, 10);
  tsk2 = os_tsk_create (task2, 0);
	os_tsk_delete_self();
}

void init_serial (void) {
  PINSEL0 = 0X0000005;                 // Enable RxD0 and TxD1             
  U0LCR = 0x83;                         // 8 bits, no Parity, 1 Stop bit    
  U0DLL = 0x61;                           // 9600 Baud Rate @ 15MHz VPB Clock 
  U0LCR = 0x03;                         // DLAB = 0                         
}
int main (void) {
  init_serial();
  os_sys_init (init);
}
