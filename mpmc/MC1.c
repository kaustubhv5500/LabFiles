#include <xc.h>

void main(void) {

    TRISA = 0x0; //output ports
    TRISB = 0X00;
    TRISC = 0X00;
    TRISE = 0X00;
    TRISD = 0x1; //input port

    
while (1){
    
    // Data to check the output of pins
    PORTB = 0X1A; 
    PORTC = 0X99;
    
    // Turn ON LED to check if Button is pressed
    if(PORTD.F0 == 0){     /* Read the input pin value */
        PORTA.F0 = 1;   /* Turn off LED */ 
    }
    else{
        PORTA.F0 = 0;  /* Turn on LED */
    }
}
    return;
}
