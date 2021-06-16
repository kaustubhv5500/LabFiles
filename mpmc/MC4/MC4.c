/*
 * File:   main.c
 * Author: Kaustubh Venkatesh
 *
 * Created on 14 June, 2021, 8:04 PM
 */

#include "config.h"
#include <xc.h>

void main(void) {
    TRISA=0xFF;
    TRISB=0x00;
    TRISD=0x00;
    //Converting clock to Fosc/16
    ADCON0bits.ADCS0=1;
    ADCON0bits.ADCS1=0;
    ADCON1bits.ADCS2=1;
    
    //Selecting channel 0
    ADCON0bits.CHS0=0;
    ADCON0bits.CHS1=0;
    ADCON0bits.CHS2=0;
    
    //Right justifying ADRESH
    ADCON1bits.ADFM=1;
    
    //Port configuration
    
    ADCON1bits.PCFG0=0;
    ADCON1bits.PCFG1=0;
    ADCON1bits.PCFG2=0;
    ADCON1bits.PCFG3=0;
    
    //Setting the GO/DONE
    
    ADCON0bits.GO_DONE=1;
    
    ADCON0bits.ADON=1;
    while(1){
        if(ADCON0bits.GO_DONE==0){
            ADCON0bits.GO_DONE=1;
            PORTB=ADRESL;
            PORTD=ADRESH;
            
          
        
        }
    
    }
}

