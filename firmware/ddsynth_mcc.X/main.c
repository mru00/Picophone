
#include <p18f2450.h>
#include <GenericTypeDefs.h>
#include <pwm.h>
#include <timers.h>



#pragma config PLLDIV   = 5         // (20 MHz crystal on PICDEM FS USB board)
#pragma config CPUDIV   = OSC1_PLL2
#pragma config USBDIV   = 2         // Clock source from 96MHz PLL/2
#pragma config FOSC     = HSPLL_HS
#pragma config FCMEN    = OFF
#pragma config IESO     = OFF
#pragma config PWRT     = ON
#pragma config BOR      = OFF
//#pragma config BORV     = 28
#pragma config VREGEN   = OFF      //USB Voltage Regulator
#pragma config WDT      = OFF
#pragma config WDTPS    = 32768
#pragma config MCLRE    = ON
#pragma config LPT1OSC  = OFF
#pragma config PBADEN   = OFF
//      #pragma config CCP2MX   = ON
#pragma config STVREN   = ON
#pragma config LVP      = OFF
//      #pragma config ICPRT    = OFF       // Dedicated In-Circuit Debug/Programming
#pragma config XINST    = OFF       // Extended Instruction Set
#pragma config CP0      = OFF
#pragma config CP1      = OFF
//      #pragma config CP2      = OFF
//      #pragma config CP3      = OFF
#pragma config CPB      = OFF
//      #pragma config CPD      = OFF
#pragma config WRT0     = OFF
#pragma config WRT1     = OFF
//      #pragma config WRT2     = OFF
//      #pragma config WRT3     = OFF
#pragma config WRTB     = OFF       // Boot Block Write Protection
#pragma config WRTC     = OFF
//      #pragma config WRTD     = OFF
#pragma config EBTR0    = OFF
#pragma config EBTR1    = OFF
//      #pragma config EBTR2    = OFF
//      #pragma config EBTR3    = OFF
#pragma config EBTRB    = OFF


void updatePhase(void);
void asm_init(void);

#pragma udata

volatile BYTE var = 0;
#pragma code


void low_isr(void);
void high_isr(void);
/*
 * For PIC18 devices the low interrupt vector is found at
 * 00000018h. The following code will branch to the
 * low_interrupt_service_routine function to handle
 * interrupts that occur at the low vector.
 */
#pragma code low_vector=0x18

void interrupt_at_low_vector(void) {
    _asm GOTO low_isr _endasm
}
#pragma code /* return to the default code section */
#pragma interruptlow low_isr

void low_isr(void) {
    var = 1;
    /* ... */
}
/*
 * For PIC18 devices the high interrupt vector is found at
 * 00000008h. The following code will branch to the
 * high_interrupt_service_routine function to handle
 * interrupts that occur at the high vector.
 */
#pragma code high_vector=0x08

void interrupt_at_high_vector(void) {
    _asm GOTO high_isr _endasm
}
#pragma code /* return to the default code section */
#pragma interrupt high_isr

void high_isr(void) {
    // Timer0 Interrupt - Freq = 100000.00 Hz - Period = 0.000010 seconds
    if (INTCONbits.TMR0IF == 1) // timer 0 interrupt flag
    {
        INTCONbits.TMR0IF = 0; // clear the flag
        INTCONbits.TMR0IE = 1; // reenable the interrupt
        WriteTimer0(134);
        updatePhase();
    }
}


#pragma code

void main(void) {

    // port b is input
    TRISB = 1;
    INTCON = 0; // clear the interrpt control register

#ifdef USE_OR_MASKS
#warning use or!
#endif

    OpenTimer2(T2_PS_1_1);
    //OpenTimer1(T1_PS_1_1 & T1_SOURCE_INT & T1_16BIT_RW);
    OpenTimer0(T0_PS_1_1 & T0_SOURCE_INT & TIMER_INT_ON);

    INTCONbits.GIE = 1;

    OpenPWM1(0xff);
    SetDCPWM1(10);
    PIR1bits.TMR1IF = 0;

    asm_init();

    for (;;) {
    }
    //    for(;;){}

    //    WriteTimer1(0xff88);
}