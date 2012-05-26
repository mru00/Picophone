#include <P18F4450.INC>

    global updatePhase, asm_init

NR_INPUTS equ D'8'
output  equ CCPR1L
inputs  equ PORTD

    udata
taboff res 1
cnt1    res 1
phases  res 2*NR_INPUTS
was_carry res 1
FSR1_save_h   res 1
FSR1_save_l   res 1


    code

#include tables.inc


updatePhase

    lfsr FSR0, phases

    local i = 0
    while i < NR_INPUTS

    btfsc inputs, i, A                              ; if input is not active
    goto input_not_active#v(i)                      ; goto done
    goto input_active#v(i)

input_not_active#v(i)

    movlw 0
    movwf POSTINC0
    movwf POSTINC0

    goto loop_end#v(i)

input_active#v(i)
    clrf was_carry

; input is active


    ; same with lo-byte
    movlw i*2
    call TABLE_ph_incr_lo
    addwf INDF0,W
    movwf POSTINC0,A
    btfsc STATUS, C
    bsf was_carry, 1



    ; add hi-byte from phases_incr
    movlw i*2 
    call TABLE_ph_incr_hi
    ; and add it to phases
    addwf INDF0,W
    btfsc was_carry, 1
    incf WREG,W
    movwf POSTINC0,A

    ; now high-byte of current phase is in W

;    movf cnt1,W

; workaround: cannot access 256byte table

    call TABLE_waveform
    addlw 0x80
    movwf output

    goto end_of_fun         ; skip rest of the notes & pwm stop


loop_end#v(i)

i = i + 1
    endw

; no single note was played; stop the pwm

    movlw 0x00
    movwf output


end_of_fun
    return


asm_init
    clrf cnt1
    return


    end