opt subtitle "HI-TECH Software Omniscient Code Generator (PRO mode) build 10920"

opt pagewidth 120

	opt pm

	processor	16F684
clrc	macro
	bcf	3,0
	endm
clrz	macro
	bcf	3,2
	endm
setc	macro
	bsf	3,0
	endm
setz	macro
	bsf	3,2
	endm
skipc	macro
	btfss	3,0
	endm
skipz	macro
	btfss	3,2
	endm
skipnc	macro
	btfsc	3,0
	endm
skipnz	macro
	btfsc	3,2
	endm
indf	equ	0
indf0	equ	0
pc	equ	2
pcl	equ	2
status	equ	3
fsr	equ	4
fsr0	equ	4
c	equ	1
z	equ	0
pclath	equ	10
	FNCALL	_main,_POWER_INITIAL
	FNCALL	_main,_TIMER0_INITIAL
	FNCALL	_main,_PA3_Level_Change_INITIAL
	FNCALL	_main,_PWM1_INITIAL
	FNCALL	_main,_PWM1_RATE_CHANGE
	FNCALL	_main,_JUMP_MODE_CHANGE
	FNCALL	_main,_MIX_MODE_CHANGE
	FNCALL	_main,_SET_MODE_REFRESH
	FNCALL	_main,_reset_led_status
	FNCALL	_main,_PWM_MODE_CHANGE
	FNCALL	_main,_PWM_MODE_REFRESH
	FNCALL	_SET_MODE_REFRESH,___lmul
	FNCALL	_SET_MODE_REFRESH,_DelayMs
	FNCALL	_SET_MODE_REFRESH,_PWM_MODE_REFRESH
	FNCALL	_DelayMs,_DelayUs
	FNCALL	_PWM_MODE_CHANGE,_PWM_MODE_REFRESH
	FNCALL	_PWM_MODE_REFRESH,_reset_led_status
	FNCALL	_PWM_MODE_REFRESH,_PWM1_RED
	FNCALL	_MIX_MODE_CHANGE,___lbmod
	FNCALL	_PWM1_RATE_CHANGE,_PWM1_RED
	FNCALL	_PWM1_RATE_CHANGE,_PWM1_GREEN
	FNCALL	_PWM1_RATE_CHANGE,_PWM1_BLUE
	FNCALL	_PWM1_RATE_CHANGE,_PWM1_WHITE
	FNCALL	_PWM1_INITIAL,_PWM1_RED
	FNROOT	_main
	FNCALL	intlevel1,_ISR
	global	intlevel1
	FNROOT	intlevel1
	global	_bitdata
	global	_power_off_mode_backup
	global	_set_time_mode_backup
	global	_jump_led_rate
psect	idataBANK0,class=CODE,space=0,delta=2
global __pidataBANK0
__pidataBANK0:
	file	"FT_62F21x_IR.c"
	line	7

;initializer for _bitdata
	retlw	01h
	file	"FT_62F21X_pwm.c"
	line	17

;initializer for _power_off_mode_backup
	retlw	0FFh
	line	18

;initializer for _set_time_mode_backup
	retlw	0FFh
psect	idataCOMMON,class=CODE,space=0,delta=2
global __pidataCOMMON
__pidataCOMMON:
	line	16

;initializer for _jump_led_rate
	retlw	064h
	global	_ir_key_value
psect	strings,class=STRING,delta=2
global __pstrings
__pstrings:
;	global	stringdir,stringtab,__stringbase
stringtab:
;	String table - string pointers are 1 byte each
stringcode:stringdir:
movlw high(stringdir)
movwf pclath
movf fsr,w
incf fsr
	addwf pc
__stringbase:
	retlw	0
psect	strings
	file	"TEST_FT62F21X_SLEEP.C"
	line	29
_ir_key_value:
	retlw	0FBh
	retlw	0
	retlw	0B2h
	retlw	05h
	retlw	0FFh
	retlw	01h
	retlw	0F5h
	retlw	02h
	retlw	0EDh
	retlw	03h
	retlw	0F6h
	retlw	04h
	retlw	0EAh
	retlw	06h
	retlw	0BFh
	retlw	07h
	retlw	0E1h
	retlw	08h
	retlw	0E4h
	retlw	09h
	retlw	0E2h
	retlw	0Ah
	retlw	0E5h
	retlw	0Bh
	retlw	0E0h
	retlw	0Ch
	retlw	0F2h
	retlw	0Dh
	retlw	0E8h
	retlw	0Eh
	retlw	0B3h
	retlw	0Fh
	retlw	0E6h
	retlw	010h
	retlw	0F1h
	retlw	011h
	retlw	0F0h
	retlw	012h
	global	_ir_key_value
	global	_IRDataTimer
	global	_auto_power_off_timer_H
	global	_IRbitNum
	global	_IRbitTime
	global	_ReceiveFinish
	global	_auto_power_off_timer_L
	global	_ft_user_pwm_mode
	global	_ft_user_set_mode
	global	_key_release
	global	_power_off_flag
	global	_temp_mode
	global	_time_15ms_cnt
	global	_time_2s_cnt
	global	_pwm_colour_value
	global	_pwm_rate_value
	global	_INTCON
_INTCON	set	11
	global	_MSCON
_MSCON	set	27
	global	_P1AUX
_P1AUX	set	30
	global	_P1BR1
_P1BR1	set	25
	global	_P1CDTH
_P1CDTH	set	26
	global	_P1CDTL
_P1CDTL	set	16
	global	_P1CON
_P1CON	set	22
	global	_P1DDTH
_P1DDTH	set	9
	global	_P1DDTL
_P1DDTL	set	8
	global	_PORTA
_PORTA	set	5
	global	_T2CON0
_T2CON0	set	18
	global	_TMR0
_TMR0	set	1
	global	_TMR2H
_TMR2H	set	19
	global	_TMR2L
_TMR2L	set	17
	global	_GIE
_GIE	set	95
	global	_PAIE
_PAIE	set	91
	global	_PAIF
_PAIF	set	88
	global	_PEIE
_PEIE	set	94
	global	_RA3
_RA3	set	43
	global	_T0IE
_T0IE	set	93
	global	_T0IF
_T0IF	set	90
	global	_TMR2IF
_TMR2IF	set	97
	global	_TMR2ON
_TMR2ON	set	146
	global	_OPTION
_OPTION	set	129
	global	_OSCCON
_OSCCON	set	143
	global	_P1OE
_P1OE	set	144
	global	_P1POL
_P1POL	set	153
	global	_PR2H
_PR2H	set	146
	global	_PR2L
_PR2L	set	145
	global	_T2CON1
_T2CON1	set	158
	global	_TRISA
_TRISA	set	133
	global	_WPUA
_WPUA	set	149
	global	_IOCA3
_IOCA3	set	1203
	global	_TMR2IE
_TMR2IE	set	1121
	global	_TRISA3
_TRISA3	set	1067
	file	"test_ft62f21x_sleep.as"
	line	#
psect cinit,class=CODE,delta=2
global start_initialization
start_initialization:

psect	bssCOMMON,class=COMMON,space=1
global __pbssCOMMON
__pbssCOMMON:
_pwm_colour_value:
       ds      1

_pwm_rate_value:
       ds      1

psect	dataCOMMON,class=COMMON,space=1
global __pdataCOMMON
__pdataCOMMON:
	file	"FT_62F21X_pwm.c"
	line	16
_jump_led_rate:
       ds      1

psect	bssBANK0,class=BANK0,space=1
global __pbssBANK0
__pbssBANK0:
_IRDataTimer:
       ds      4

_auto_power_off_timer_H:
       ds      4

_IRbitNum:
       ds      1

_IRbitTime:
       ds      1

_ReceiveFinish:
       ds      1

_auto_power_off_timer_L:
       ds      1

_ft_user_pwm_mode:
       ds      1

_ft_user_set_mode:
       ds      1

_key_release:
       ds      1

_power_off_flag:
       ds      1

_temp_mode:
       ds      1

_time_15ms_cnt:
       ds      1

_time_2s_cnt:
       ds      1

psect	dataBANK0,class=BANK0,space=1
global __pdataBANK0
__pdataBANK0:
	file	"FT_62F21x_IR.c"
	line	7
_bitdata:
       ds      1

psect	dataBANK0
	file	"FT_62F21X_pwm.c"
	line	17
_power_off_mode_backup:
       ds      1

psect	dataBANK0
	file	"FT_62F21X_pwm.c"
	line	18
_set_time_mode_backup:
       ds      1

psect clrtext,class=CODE,delta=2
global clear_ram
;	Called with FSR containing the base address, and
;	W with the last address+1
clear_ram:
	clrwdt			;clear the watchdog before getting into this loop
clrloop:
	clrf	indf		;clear RAM location pointed to by FSR
	incf	fsr,f		;increment pointer
	xorwf	fsr,w		;XOR with final address
	btfsc	status,2	;have we reached the end yet?
	retlw	0		;all done for this memory range, return
	xorwf	fsr,w		;XOR again to restore value
	goto	clrloop		;do the next byte

; Clear objects allocated to COMMON
psect cinit,class=CODE,delta=2
	clrf	((__pbssCOMMON)+0)&07Fh
	clrf	((__pbssCOMMON)+1)&07Fh
; Clear objects allocated to BANK0
psect cinit,class=CODE,delta=2
	bcf	status, 7	;select IRP bank0
	movlw	low(__pbssBANK0)
	movwf	fsr
	movlw	low((__pbssBANK0)+013h)
	fcall	clear_ram
; Initialize objects allocated to BANK0
	global __pidataBANK0
psect cinit,class=CODE,delta=2
	fcall	__pidataBANK0+0		;fetch initializer
	movwf	__pdataBANK0+0&07fh		
	fcall	__pidataBANK0+1		;fetch initializer
	movwf	__pdataBANK0+1&07fh		
	fcall	__pidataBANK0+2		;fetch initializer
	movwf	__pdataBANK0+2&07fh		
; Initialize objects allocated to COMMON
	global __pidataCOMMON
psect cinit,class=CODE,delta=2
	fcall	__pidataCOMMON+0		;fetch initializer
	movwf	__pdataCOMMON+0&07fh		
psect cinit,class=CODE,delta=2
global end_of_initialization

;End of C runtime variable initialization code

end_of_initialization:
clrf status
ljmp _main	;jump to C main() function
psect	cstackCOMMON,class=COMMON,space=1
global __pcstackCOMMON
__pcstackCOMMON:
	global	?_TIMER0_INITIAL
?_TIMER0_INITIAL:	; 0 bytes @ 0x0
	global	?_PA3_Level_Change_INITIAL
?_PA3_Level_Change_INITIAL:	; 0 bytes @ 0x0
	global	?_PWM1_INITIAL
?_PWM1_INITIAL:	; 0 bytes @ 0x0
	global	?_PWM1_RATE_CHANGE
?_PWM1_RATE_CHANGE:	; 0 bytes @ 0x0
	global	?_JUMP_MODE_CHANGE
?_JUMP_MODE_CHANGE:	; 0 bytes @ 0x0
	global	?_MIX_MODE_CHANGE
?_MIX_MODE_CHANGE:	; 0 bytes @ 0x0
	global	?_SET_MODE_REFRESH
?_SET_MODE_REFRESH:	; 0 bytes @ 0x0
	global	?_PWM_MODE_CHANGE
?_PWM_MODE_CHANGE:	; 0 bytes @ 0x0
	global	?_PWM_MODE_REFRESH
?_PWM_MODE_REFRESH:	; 0 bytes @ 0x0
	global	?_PWM1_RED
?_PWM1_RED:	; 0 bytes @ 0x0
	global	?_ISR
?_ISR:	; 0 bytes @ 0x0
	global	??_ISR
??_ISR:	; 0 bytes @ 0x0
	global	?_POWER_INITIAL
?_POWER_INITIAL:	; 0 bytes @ 0x0
	global	?_reset_led_status
?_reset_led_status:	; 0 bytes @ 0x0
	global	?_main
?_main:	; 0 bytes @ 0x0
	global	?_PWM1_GREEN
?_PWM1_GREEN:	; 0 bytes @ 0x0
	global	?_PWM1_BLUE
?_PWM1_BLUE:	; 0 bytes @ 0x0
	global	?_PWM1_WHITE
?_PWM1_WHITE:	; 0 bytes @ 0x0
	global	?_DelayUs
?_DelayUs:	; 0 bytes @ 0x0
	global	?_DelayMs
?_DelayMs:	; 0 bytes @ 0x0
	ds	3
	global	??_TIMER0_INITIAL
??_TIMER0_INITIAL:	; 0 bytes @ 0x3
	global	??_PA3_Level_Change_INITIAL
??_PA3_Level_Change_INITIAL:	; 0 bytes @ 0x3
	global	??_PWM1_INITIAL
??_PWM1_INITIAL:	; 0 bytes @ 0x3
	global	??_PWM1_RATE_CHANGE
??_PWM1_RATE_CHANGE:	; 0 bytes @ 0x3
	global	??_JUMP_MODE_CHANGE
??_JUMP_MODE_CHANGE:	; 0 bytes @ 0x3
	global	??_PWM_MODE_CHANGE
??_PWM_MODE_CHANGE:	; 0 bytes @ 0x3
	global	??_PWM_MODE_REFRESH
??_PWM_MODE_REFRESH:	; 0 bytes @ 0x3
	global	??_PWM1_RED
??_PWM1_RED:	; 0 bytes @ 0x3
	global	??_POWER_INITIAL
??_POWER_INITIAL:	; 0 bytes @ 0x3
	global	??_reset_led_status
??_reset_led_status:	; 0 bytes @ 0x3
	global	??_PWM1_GREEN
??_PWM1_GREEN:	; 0 bytes @ 0x3
	global	??_PWM1_BLUE
??_PWM1_BLUE:	; 0 bytes @ 0x3
	global	??_PWM1_WHITE
??_PWM1_WHITE:	; 0 bytes @ 0x3
	global	??_DelayUs
??_DelayUs:	; 0 bytes @ 0x3
	global	??___lmul
??___lmul:	; 0 bytes @ 0x3
	global	?___lbmod
?___lbmod:	; 1 bytes @ 0x3
	global	PWM1_RATE_CHANGE@pwm_value
PWM1_RATE_CHANGE@pwm_value:	; 1 bytes @ 0x3
	global	DelayUs@Time
DelayUs@Time:	; 1 bytes @ 0x3
	global	___lbmod@divisor
___lbmod@divisor:	; 1 bytes @ 0x3
	global	___lmul@product
___lmul@product:	; 4 bytes @ 0x3
	ds	1
	global	??___lbmod
??___lbmod:	; 0 bytes @ 0x4
	global	DelayUs@a
DelayUs@a:	; 1 bytes @ 0x4
	ds	1
	global	??_DelayMs
??_DelayMs:	; 0 bytes @ 0x5
	global	DelayMs@Time
DelayMs@Time:	; 1 bytes @ 0x5
	global	___lbmod@dividend
___lbmod@dividend:	; 1 bytes @ 0x5
	ds	1
	global	DelayMs@a
DelayMs@a:	; 1 bytes @ 0x6
	global	___lbmod@counter
___lbmod@counter:	; 1 bytes @ 0x6
	ds	1
	global	DelayMs@b
DelayMs@b:	; 1 bytes @ 0x7
	global	___lbmod@rem
___lbmod@rem:	; 1 bytes @ 0x7
	ds	1
	global	??_MIX_MODE_CHANGE
??_MIX_MODE_CHANGE:	; 0 bytes @ 0x8
	global	??_SET_MODE_REFRESH
??_SET_MODE_REFRESH:	; 0 bytes @ 0x8
psect	cstackBANK0,class=BANK0,space=1
global __pcstackBANK0
__pcstackBANK0:
	global	?___lmul
?___lmul:	; 4 bytes @ 0x0
	global	___lmul@multiplier
___lmul@multiplier:	; 4 bytes @ 0x0
	ds	4
	global	___lmul@multiplicand
___lmul@multiplicand:	; 4 bytes @ 0x4
	ds	4
	global	??_main
??_main:	; 0 bytes @ 0x8
	ds	4
	global	main@i
main@i:	; 1 bytes @ 0xC
	ds	1
;;Data sizes: Strings 0, constant 38, data 4, bss 21, persistent 0 stack 0
;;Auto spaces:   Size  Autos    Used
;; COMMON          14      8      11
;; BANK0           48     13      35

;;
;; Pointer list with targets:

;; ?___lmul	unsigned long  size(1) Largest target is 0
;;


;;
;; Critical Paths under _main in COMMON
;;
;;   _SET_MODE_REFRESH->_DelayMs
;;   _DelayMs->_DelayUs
;;   _MIX_MODE_CHANGE->___lbmod
;;
;; Critical Paths under _ISR in COMMON
;;
;;   None.
;;
;; Critical Paths under _main in BANK0
;;
;;   _SET_MODE_REFRESH->___lmul
;;
;; Critical Paths under _ISR in BANK0
;;
;;   None.

;;
;;Main: autosize = 0, tempsize = 4, incstack = 0, save=0
;;

;;
;;Call Graph Tables:
;;
;; ---------------------------------------------------------------------------------
;; (Depth) Function   	        Calls       Base Space   Used Autos Params    Refs
;; ---------------------------------------------------------------------------------
;; (0) _main                                                 5     5      0     653
;;                                              8 BANK0      5     5      0
;;                      _POWER_INITIAL
;;                     _TIMER0_INITIAL
;;           _PA3_Level_Change_INITIAL
;;                       _PWM1_INITIAL
;;                   _PWM1_RATE_CHANGE
;;                   _JUMP_MODE_CHANGE
;;                    _MIX_MODE_CHANGE
;;                   _SET_MODE_REFRESH
;;                   _reset_led_status
;;                    _PWM_MODE_CHANGE
;;                   _PWM_MODE_REFRESH
;; ---------------------------------------------------------------------------------
;; (1) _SET_MODE_REFRESH                                     0     0      0     274
;;                             ___lmul
;;                            _DelayMs
;;                   _PWM_MODE_REFRESH
;; ---------------------------------------------------------------------------------
;; (2) _DelayMs                                              3     3      0     138
;;                                              5 COMMON     3     3      0
;;                            _DelayUs
;; ---------------------------------------------------------------------------------
;; (1) _PWM_MODE_CHANGE                                      0     0      0       0
;;                   _PWM_MODE_REFRESH
;; ---------------------------------------------------------------------------------
;; (3) _DelayUs                                              2     2      0      46
;;                                              3 COMMON     2     2      0
;; ---------------------------------------------------------------------------------
;; (1) _PWM_MODE_REFRESH                                     0     0      0       0
;;                   _reset_led_status
;;                           _PWM1_RED
;; ---------------------------------------------------------------------------------
;; (1) _MIX_MODE_CHANGE                                      0     0      0     159
;;                            ___lbmod
;; ---------------------------------------------------------------------------------
;; (1) _PWM1_RATE_CHANGE                                     1     1      0      90
;;                                              3 COMMON     1     1      0
;;                           _PWM1_RED
;;                         _PWM1_GREEN
;;                          _PWM1_BLUE
;;                         _PWM1_WHITE
;; ---------------------------------------------------------------------------------
;; (1) _PWM1_INITIAL                                         0     0      0       0
;;                           _PWM1_RED
;; ---------------------------------------------------------------------------------
;; (2) ___lmul                                              12     4      8     136
;;                                              3 COMMON     4     4      0
;;                                              0 BANK0      8     0      8
;; ---------------------------------------------------------------------------------
;; (2) ___lbmod                                              5     4      1     159
;;                                              3 COMMON     5     4      1
;; ---------------------------------------------------------------------------------
;; (2) _PWM1_WHITE                                           0     0      0       0
;; ---------------------------------------------------------------------------------
;; (2) _PWM1_BLUE                                            0     0      0       0
;; ---------------------------------------------------------------------------------
;; (2) _PWM1_GREEN                                           0     0      0       0
;; ---------------------------------------------------------------------------------
;; (2) _PWM1_RED                                             0     0      0       0
;; ---------------------------------------------------------------------------------
;; (1) _JUMP_MODE_CHANGE                                     0     0      0       0
;; ---------------------------------------------------------------------------------
;; (1) _PA3_Level_Change_INITIAL                             0     0      0       0
;; ---------------------------------------------------------------------------------
;; (1) _TIMER0_INITIAL                                       0     0      0       0
;; ---------------------------------------------------------------------------------
;; (2) _reset_led_status                                     0     0      0       0
;; ---------------------------------------------------------------------------------
;; (1) _POWER_INITIAL                                        0     0      0       0
;; ---------------------------------------------------------------------------------
;; Estimated maximum stack depth 3
;; ---------------------------------------------------------------------------------
;; (Depth) Function   	        Calls       Base Space   Used Autos Params    Refs
;; ---------------------------------------------------------------------------------
;; (4) _ISR                                                  3     3      0       0
;;                                              0 COMMON     3     3      0
;; ---------------------------------------------------------------------------------
;; Estimated maximum stack depth 4
;; ---------------------------------------------------------------------------------

;; Call Graph Graphs:

;; _main (ROOT)
;;   _POWER_INITIAL
;;   _TIMER0_INITIAL
;;   _PA3_Level_Change_INITIAL
;;   _PWM1_INITIAL
;;     _PWM1_RED
;;   _PWM1_RATE_CHANGE
;;     _PWM1_RED
;;     _PWM1_GREEN
;;     _PWM1_BLUE
;;     _PWM1_WHITE
;;   _JUMP_MODE_CHANGE
;;   _MIX_MODE_CHANGE
;;     ___lbmod
;;   _SET_MODE_REFRESH
;;     ___lmul
;;     _DelayMs
;;       _DelayUs
;;     _PWM_MODE_REFRESH
;;       _reset_led_status
;;       _PWM1_RED
;;   _reset_led_status
;;   _PWM_MODE_CHANGE
;;     _PWM_MODE_REFRESH
;;       _reset_led_status
;;       _PWM1_RED
;;   _PWM_MODE_REFRESH
;;     _reset_led_status
;;     _PWM1_RED
;;
;; _ISR (ROOT)
;;

;; Address spaces:

;;Name               Size   Autos  Total    Cost      Usage
;;SFR1                 0      0       0       2        0.0%
;;BITSFR1              0      0       0       2        0.0%
;;CODE                 0      0       0       0        0.0%
;;DATA                 0      0      31       3        0.0%
;;ABS                  0      0      2E       6        0.0%
;;NULL                 0      0       0       0        0.0%
;;STACK                0      0       3       2        0.0%
;;BANK0               30      D      23       5       72.9%
;;BITBANK0            30      0       0       4        0.0%
;;SFR0                 0      0       0       1        0.0%
;;BITSFR0              0      0       0       1        0.0%
;;COMMON               E      8       B       1       78.6%
;;BITCOMMON            E      0       0       0        0.0%
;;EEDATA              80      0       0       0        0.0%

	global	_main
psect	maintext,global,class=CODE,delta=2
global __pmaintext
__pmaintext:

;; *************** function _main *****************
;; Defined at:
;;		line 162 in file "TEST_FT62F21X_SLEEP.C"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;  i               1   12[BANK0 ] unsigned char 
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, fsr0l, fsr0h, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 17F/0
;;		On exit  : 20/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0
;;      Params:         0       0
;;      Locals:         0       1
;;      Temps:          0       4
;;      Totals:         0       5
;;Total ram usage:        5 bytes
;; Hardware stack levels required when called:    4
;; This function calls:
;;		_POWER_INITIAL
;;		_TIMER0_INITIAL
;;		_PA3_Level_Change_INITIAL
;;		_PWM1_INITIAL
;;		_PWM1_RATE_CHANGE
;;		_JUMP_MODE_CHANGE
;;		_MIX_MODE_CHANGE
;;		_SET_MODE_REFRESH
;;		_reset_led_status
;;		_PWM_MODE_CHANGE
;;		_PWM_MODE_REFRESH
;; This function is called by:
;;		Startup code after reset
;; This function uses a non-reentrant model
;;
psect	maintext
	file	"TEST_FT62F21X_SLEEP.C"
	line	162
	global	__size_of_main
	__size_of_main	equ	__end_of_main-_main
	
_main:	
	opt	stack 4
; Regs used in _main: [wreg-fsr0h+status,2+status,0+pclath+cstack]
	line	163
	
l4575:	
;TEST_FT62F21X_SLEEP.C: 163: POWER_INITIAL();
	fcall	_POWER_INITIAL
	line	164
;TEST_FT62F21X_SLEEP.C: 164: TIMER0_INITIAL();
	fcall	_TIMER0_INITIAL
	line	165
;TEST_FT62F21X_SLEEP.C: 165: PA3_Level_Change_INITIAL();
	fcall	_PA3_Level_Change_INITIAL
	line	166
;TEST_FT62F21X_SLEEP.C: 166: PWM1_INITIAL();
	fcall	_PWM1_INITIAL
	line	170
	
l4577:	
# 170 "TEST_FT62F21X_SLEEP.C"
clrwdt ;#
psect	maintext
	line	172
	
l4579:	
;TEST_FT62F21X_SLEEP.C: 172: if(power_off_flag == 0)
	bcf	status, 5	;RP0=0, select bank0
	movf	(_power_off_flag),f
	skipz
	goto	u1281
	goto	u1280
u1281:
	goto	l4619
u1280:
	line	174
	
l4581:	
;TEST_FT62F21X_SLEEP.C: 173: {
;TEST_FT62F21X_SLEEP.C: 174: if(ft_user_pwm_mode == 0)
	movf	(_ft_user_pwm_mode),f
	skipz
	goto	u1291
	goto	u1290
u1291:
	goto	l4591
u1290:
	line	176
	
l4583:	
;TEST_FT62F21X_SLEEP.C: 175: {
;TEST_FT62F21X_SLEEP.C: 176: if(time_15ms_cnt > 150)
	movlw	(097h)
	subwf	(_time_15ms_cnt),w
	skipc
	goto	u1301
	goto	u1300
u1301:
	goto	l4591
u1300:
	line	178
	
l4585:	
;TEST_FT62F21X_SLEEP.C: 177: {
;TEST_FT62F21X_SLEEP.C: 178: time_15ms_cnt = 0;
	clrf	(_time_15ms_cnt)
	line	179
	
l4587:	
;TEST_FT62F21X_SLEEP.C: 179: pwm_rate_value++;
	incf	(_pwm_rate_value),f
	line	180
	
l4589:	
;TEST_FT62F21X_SLEEP.C: 180: PWM1_RATE_CHANGE();
	fcall	_PWM1_RATE_CHANGE
	line	183
	
l4591:	
;TEST_FT62F21X_SLEEP.C: 181: }
;TEST_FT62F21X_SLEEP.C: 182: }
;TEST_FT62F21X_SLEEP.C: 183: if(ft_user_pwm_mode == 5)
	movf	(_ft_user_pwm_mode),w
	xorlw	05h
	skipz
	goto	u1311
	goto	u1310
u1311:
	goto	l4605
u1310:
	line	185
	
l4593:	
;TEST_FT62F21X_SLEEP.C: 184: {
;TEST_FT62F21X_SLEEP.C: 185: if(time_15ms_cnt>200)
	movlw	(0C9h)
	subwf	(_time_15ms_cnt),w
	skipc
	goto	u1321
	goto	u1320
u1321:
	goto	l4605
u1320:
	line	187
	
l4595:	
;TEST_FT62F21X_SLEEP.C: 186: {
;TEST_FT62F21X_SLEEP.C: 187: time_2s_cnt++;
	incf	(_time_2s_cnt),f
	line	188
	
l4597:	
;TEST_FT62F21X_SLEEP.C: 188: if(time_2s_cnt > 100)
	movlw	(065h)
	subwf	(_time_2s_cnt),w
	skipc
	goto	u1331
	goto	u1330
u1331:
	goto	l4603
u1330:
	line	190
	
l4599:	
;TEST_FT62F21X_SLEEP.C: 189: {
;TEST_FT62F21X_SLEEP.C: 190: time_2s_cnt = 0;
	clrf	(_time_2s_cnt)
	line	191
	
l4601:	
;TEST_FT62F21X_SLEEP.C: 191: JUMP_MODE_CHANGE();
	fcall	_JUMP_MODE_CHANGE
	line	193
	
l4603:	
;TEST_FT62F21X_SLEEP.C: 192: }
;TEST_FT62F21X_SLEEP.C: 193: time_15ms_cnt = 0;
	clrf	(_time_15ms_cnt)
	line	197
	
l4605:	
;TEST_FT62F21X_SLEEP.C: 195: }
;TEST_FT62F21X_SLEEP.C: 196: }
;TEST_FT62F21X_SLEEP.C: 197: if(ft_user_pwm_mode == 0x0A)
	movf	(_ft_user_pwm_mode),w
	xorlw	0Ah
	skipz
	goto	u1341
	goto	u1340
u1341:
	goto	l4619
u1340:
	line	199
	
l4607:	
;TEST_FT62F21X_SLEEP.C: 198: {
;TEST_FT62F21X_SLEEP.C: 199: if(time_15ms_cnt>200)
	movlw	(0C9h)
	subwf	(_time_15ms_cnt),w
	skipc
	goto	u1351
	goto	u1350
u1351:
	goto	l4619
u1350:
	line	201
	
l4609:	
;TEST_FT62F21X_SLEEP.C: 200: {
;TEST_FT62F21X_SLEEP.C: 201: time_2s_cnt++;
	incf	(_time_2s_cnt),f
	line	202
	
l4611:	
;TEST_FT62F21X_SLEEP.C: 202: if(time_2s_cnt > 100)
	movlw	(065h)
	subwf	(_time_2s_cnt),w
	skipc
	goto	u1361
	goto	u1360
u1361:
	goto	l4617
u1360:
	line	204
	
l4613:	
;TEST_FT62F21X_SLEEP.C: 203: {
;TEST_FT62F21X_SLEEP.C: 204: time_2s_cnt = 0;
	clrf	(_time_2s_cnt)
	line	205
	
l4615:	
;TEST_FT62F21X_SLEEP.C: 205: MIX_MODE_CHANGE();
	fcall	_MIX_MODE_CHANGE
	line	207
	
l4617:	
;TEST_FT62F21X_SLEEP.C: 206: }
;TEST_FT62F21X_SLEEP.C: 207: time_15ms_cnt = 0;
	clrf	(_time_15ms_cnt)
	line	213
	
l4619:	
;TEST_FT62F21X_SLEEP.C: 209: }
;TEST_FT62F21X_SLEEP.C: 210: }
;TEST_FT62F21X_SLEEP.C: 211: }
;TEST_FT62F21X_SLEEP.C: 213: if(auto_power_off_timer_H)
	movf	(_auto_power_off_timer_H+3),w
	iorwf	(_auto_power_off_timer_H+2),w
	iorwf	(_auto_power_off_timer_H+1),w
	iorwf	(_auto_power_off_timer_H),w
	skipnz
	goto	u1371
	goto	u1370
u1371:
	goto	l4633
u1370:
	line	215
	
l4621:	
;TEST_FT62F21X_SLEEP.C: 214: {
;TEST_FT62F21X_SLEEP.C: 215: if(auto_power_off_timer_L > 100)
	movlw	(065h)
	subwf	(_auto_power_off_timer_L),w
	skipc
	goto	u1381
	goto	u1380
u1381:
	goto	l4633
u1380:
	line	217
	
l4623:	
;TEST_FT62F21X_SLEEP.C: 216: {
;TEST_FT62F21X_SLEEP.C: 217: auto_power_off_timer_L = 0;
	clrf	(_auto_power_off_timer_L)
	line	218
	
l4625:	
;TEST_FT62F21X_SLEEP.C: 218: auto_power_off_timer_H--;
	movlw	01h
	movwf	((??_main+0)+0)
	movlw	0
	movwf	((??_main+0)+0+1)
	movlw	0
	movwf	((??_main+0)+0+2)
	movlw	0
	movwf	((??_main+0)+0+3)
	movf	0+(??_main+0)+0,w
	subwf	(_auto_power_off_timer_H),f
	movf	1+(??_main+0)+0,w
	skipc
	incfsz	1+(??_main+0)+0,w
	goto	u1395
	goto	u1396
u1395:
	subwf	(_auto_power_off_timer_H+1),f
u1396:
	movf	2+(??_main+0)+0,w
	skipc
	incfsz	2+(??_main+0)+0,w
	goto	u1397
	goto	u1398
u1397:
	subwf	(_auto_power_off_timer_H+2),f
u1398:
	movf	3+(??_main+0)+0,w
	skipc
	incfsz	3+(??_main+0)+0,w
	goto	u1399
	goto	u1390
u1399:
	subwf	(_auto_power_off_timer_H+3),f
u1390:

	line	219
	
l4627:	
;TEST_FT62F21X_SLEEP.C: 219: if(!auto_power_off_timer_H)
	movf	(_auto_power_off_timer_H+3),w
	iorwf	(_auto_power_off_timer_H+2),w
	iorwf	(_auto_power_off_timer_H+1),w
	iorwf	(_auto_power_off_timer_H),w
	skipz
	goto	u1401
	goto	u1400
u1401:
	goto	l4633
u1400:
	line	221
	
l4629:	
;TEST_FT62F21X_SLEEP.C: 220: {
;TEST_FT62F21X_SLEEP.C: 221: ft_user_set_mode = 0x12;
	movlw	(012h)
	movwf	(_ft_user_set_mode)
	line	222
	
l4631:	
;TEST_FT62F21X_SLEEP.C: 222: SET_MODE_REFRESH();
	fcall	_SET_MODE_REFRESH
	line	227
	
l4633:	
;TEST_FT62F21X_SLEEP.C: 223: }
;TEST_FT62F21X_SLEEP.C: 224: }
;TEST_FT62F21X_SLEEP.C: 225: }
;TEST_FT62F21X_SLEEP.C: 227: if(PORTA & 0B00010000)
	btfss	(5),(4)&7
	goto	u1411
	goto	u1410
u1411:
	goto	l4637
u1410:
	line	229
	
l4635:	
;TEST_FT62F21X_SLEEP.C: 228: {
;TEST_FT62F21X_SLEEP.C: 229: key_release = 0;
	clrf	(_key_release)
	line	230
;TEST_FT62F21X_SLEEP.C: 230: }
	goto	l4645
	line	233
	
l4637:	
;TEST_FT62F21X_SLEEP.C: 231: else
;TEST_FT62F21X_SLEEP.C: 232: {
;TEST_FT62F21X_SLEEP.C: 233: if(key_release == 0)
	movf	(_key_release),f
	skipz
	goto	u1421
	goto	u1420
u1421:
	goto	l4643
u1420:
	line	235
	
l4639:	
;TEST_FT62F21X_SLEEP.C: 234: {
;TEST_FT62F21X_SLEEP.C: 235: reset_led_status();
	fcall	_reset_led_status
	line	236
	
l4641:	
;TEST_FT62F21X_SLEEP.C: 236: PWM_MODE_CHANGE();
	fcall	_PWM_MODE_CHANGE
	line	238
	
l4643:	
;TEST_FT62F21X_SLEEP.C: 237: }
;TEST_FT62F21X_SLEEP.C: 238: key_release = 1;
	clrf	(_key_release)
	incf	(_key_release),f
	line	242
	
l4645:	
;TEST_FT62F21X_SLEEP.C: 240: }
;TEST_FT62F21X_SLEEP.C: 242: if(ReceiveFinish)
	movf	(_ReceiveFinish),w
	skipz
	goto	u1430
	goto	l4577
u1430:
	line	246
	
l4647:	
;TEST_FT62F21X_SLEEP.C: 243: {
;TEST_FT62F21X_SLEEP.C: 244: unsigned char i;
;TEST_FT62F21X_SLEEP.C: 246: ReceiveFinish = 0;
	clrf	(_ReceiveFinish)
	line	248
;TEST_FT62F21X_SLEEP.C: 248: for(i = 0;i < 19;i++)
	clrf	(main@i)
	line	250
	
l4653:	
;TEST_FT62F21X_SLEEP.C: 249: {
;TEST_FT62F21X_SLEEP.C: 250: if(ir_key_value[i*2] == IRDataTimer[3])
	clrc
	rlf	(main@i),w
	addlw	low((_ir_key_value-__stringbase))
	movwf	fsr0
	fcall	stringdir
	xorwf	0+(_IRDataTimer)+03h,w
	skipz
	goto	u1441
	goto	u1440
u1441:
	goto	l4675
u1440:
	line	252
	
l4655:	
;TEST_FT62F21X_SLEEP.C: 251: {
;TEST_FT62F21X_SLEEP.C: 252: temp_mode = ir_key_value[i*2 + 1];
	clrc
	rlf	(main@i),w
	addlw	low((_ir_key_value-__stringbase)+01h)
	movwf	fsr0
	fcall	stringdir
	movwf	(_temp_mode)
	line	253
	
l4657:	
;TEST_FT62F21X_SLEEP.C: 253: if(temp_mode == 0x12)
	movf	(_temp_mode),w
	xorlw	012h
	skipz
	goto	u1451
	goto	u1450
u1451:
	goto	l752
u1450:
	line	255
	
l4659:	
;TEST_FT62F21X_SLEEP.C: 254: {
;TEST_FT62F21X_SLEEP.C: 255: power_off_mode_backup = ft_user_pwm_mode;
	movf	(_ft_user_pwm_mode),w
	movwf	(_power_off_mode_backup)
	line	256
	
l752:	
	line	257
;TEST_FT62F21X_SLEEP.C: 256: }
;TEST_FT62F21X_SLEEP.C: 257: if(temp_mode >= 0x0D && temp_mode <= 0x10)
	movlw	(0Dh)
	subwf	(_temp_mode),w
	skipc
	goto	u1461
	goto	u1460
u1461:
	goto	l753
u1460:
	
l4661:	
	movlw	(011h)
	subwf	(_temp_mode),w
	skipnc
	goto	u1471
	goto	u1470
u1471:
	goto	l753
u1470:
	line	259
	
l4663:	
;TEST_FT62F21X_SLEEP.C: 258: {
;TEST_FT62F21X_SLEEP.C: 259: set_time_mode_backup = ft_user_pwm_mode;
	movf	(_ft_user_pwm_mode),w
	movwf	(_set_time_mode_backup)
	line	260
	
l753:	
	line	261
;TEST_FT62F21X_SLEEP.C: 260: }
;TEST_FT62F21X_SLEEP.C: 261: if(temp_mode < 0x0B)
	movlw	(0Bh)
	subwf	(_temp_mode),w
	skipnc
	goto	u1481
	goto	u1480
u1481:
	goto	l4671
u1480:
	line	263
	
l4665:	
;TEST_FT62F21X_SLEEP.C: 262: {
;TEST_FT62F21X_SLEEP.C: 263: if(ft_user_pwm_mode != temp_mode)
	movf	(_ft_user_pwm_mode),w
	xorwf	(_temp_mode),w
	skipnz
	goto	u1491
	goto	u1490
u1491:
	goto	l4675
u1490:
	line	265
	
l4667:	
;TEST_FT62F21X_SLEEP.C: 264: {
;TEST_FT62F21X_SLEEP.C: 265: ft_user_pwm_mode = temp_mode;
	movf	(_temp_mode),w
	movwf	(_ft_user_pwm_mode)
	line	266
	
l4669:	
;TEST_FT62F21X_SLEEP.C: 266: PWM_MODE_REFRESH();
	fcall	_PWM_MODE_REFRESH
	goto	l4675
	line	271
	
l4671:	
;TEST_FT62F21X_SLEEP.C: 269: else
;TEST_FT62F21X_SLEEP.C: 270: {
;TEST_FT62F21X_SLEEP.C: 271: ft_user_set_mode = temp_mode;
	movf	(_temp_mode),w
	movwf	(_ft_user_set_mode)
	line	272
	
l4673:	
;TEST_FT62F21X_SLEEP.C: 272: SET_MODE_REFRESH();
	fcall	_SET_MODE_REFRESH
	line	248
	
l4675:	
	incf	(main@i),f
	
l4677:	
	movlw	(013h)
	subwf	(main@i),w
	skipc
	goto	u1501
	goto	u1500
u1501:
	goto	l4653
u1500:
	goto	l4577
	global	start
	ljmp	start
	opt stack 0
psect	maintext
	line	279
GLOBAL	__end_of_main
	__end_of_main:
;; =============== function _main ends ============

	signat	_main,88
	global	_SET_MODE_REFRESH
psect	text641,local,class=CODE,delta=2
global __ptext641
__ptext641:

;; *************** function _SET_MODE_REFRESH *****************
;; Defined at:
;;		line 509 in file "FT_62F21X_pwm.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, fsr0l, fsr0h, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 20/0
;;		On exit  : 20/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0
;;      Params:         0       0
;;      Locals:         0       0
;;      Temps:          0       0
;;      Totals:         0       0
;;Total ram usage:        0 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    3
;; This function calls:
;;		___lmul
;;		_DelayMs
;;		_PWM_MODE_REFRESH
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text641
	file	"FT_62F21X_pwm.c"
	line	509
	global	__size_of_SET_MODE_REFRESH
	__size_of_SET_MODE_REFRESH	equ	__end_of_SET_MODE_REFRESH-_SET_MODE_REFRESH
	
_SET_MODE_REFRESH:	
	opt	stack 4
; Regs used in _SET_MODE_REFRESH: [wreg-fsr0h+status,2+status,0+pclath+cstack]
	line	510
	
l4507:	
;FT_62F21X_pwm.c: 510: if(power_off_flag == 1)
	decf	(_power_off_flag),w
	skipz
	goto	u1201
	goto	u1200
u1201:
	goto	l4569
u1200:
	line	512
	
l4509:	
;FT_62F21X_pwm.c: 511: {
;FT_62F21X_pwm.c: 512: if(ft_user_set_mode != 0x11)
	movf	(_ft_user_set_mode),w
	xorlw	011h
	skipnz
	goto	u1211
	goto	u1210
u1211:
	goto	l4569
u1210:
	goto	l1542
	line	521
	
l4513:	
;FT_62F21X_pwm.c: 521: if(jump_led_rate > 20)
	movlw	(015h)
	subwf	(_jump_led_rate),w
	skipc
	goto	u1221
	goto	u1220
u1221:
	goto	l4517
u1220:
	line	523
	
l4515:	
;FT_62F21X_pwm.c: 522: {
;FT_62F21X_pwm.c: 523: jump_led_rate = jump_led_rate - 20;
	movlw	(0ECh)
	addwf	(_jump_led_rate),f
	line	525
	
l4517:	
;FT_62F21X_pwm.c: 524: }
;FT_62F21X_pwm.c: 525: if(ft_user_pwm_mode != 0)
	movf	(_ft_user_pwm_mode),w
	skipz
	goto	u1230
	goto	l1542
u1230:
	line	527
	
l4519:	
;FT_62F21X_pwm.c: 526: {
;FT_62F21X_pwm.c: 527: P1CDTL=jump_led_rate;
	movf	(_jump_led_rate),w
	movwf	(16)	;volatile
	line	528
;FT_62F21X_pwm.c: 528: P1DDTL=jump_led_rate;
	movf	(_jump_led_rate),w
	movwf	(8)	;volatile
	goto	l1542
	line	534
	
l4521:	
;FT_62F21X_pwm.c: 534: if(jump_led_rate < 100)
	movlw	(064h)
	subwf	(_jump_led_rate),w
	skipnc
	goto	u1241
	goto	u1240
u1241:
	goto	l4525
u1240:
	line	536
	
l4523:	
;FT_62F21X_pwm.c: 535: {
;FT_62F21X_pwm.c: 536: jump_led_rate = jump_led_rate + 20;
	movlw	(014h)
	addwf	(_jump_led_rate),f
	line	538
	
l4525:	
;FT_62F21X_pwm.c: 537: }
;FT_62F21X_pwm.c: 538: if(ft_user_pwm_mode != 0)
	movf	(_ft_user_pwm_mode),w
	skipz
	goto	u1250
	goto	l1542
u1250:
	goto	l4519
	line	547
	
l1553:	
	line	549
	
l4529:	
;FT_62F21X_pwm.c: 546: case 0x0E:
;FT_62F21X_pwm.c: 547: case 0x0F:
;FT_62F21X_pwm.c: 548: case 0x10:
;FT_62F21X_pwm.c: 549: auto_power_off_timer_H = (ft_user_set_mode - 0x0C);
	movf	(_ft_user_set_mode),w
	addlw	low(-12)
	movwf	(_auto_power_off_timer_H)
	movlw	high(-12)
	skipnc
	movlw	(high(-12)+1)&0ffh
	movwf	((_auto_power_off_timer_H))+1
	clrf	(_auto_power_off_timer_H)+2
	btfsc	(_auto_power_off_timer_H)+1,7
	decf	2+(_auto_power_off_timer_H),f
	movf	(_auto_power_off_timer_H)+2,w
	movwf	3+(_auto_power_off_timer_H)
	line	550
	
l4531:	
;FT_62F21X_pwm.c: 550: auto_power_off_timer_H = auto_power_off_timer_H*180000;
	movlw	0
	movwf	(?___lmul+3)
	movlw	02h
	movwf	(?___lmul+2)
	movlw	0BFh
	movwf	(?___lmul+1)
	movlw	020h
	movwf	(?___lmul)

	movf	(_auto_power_off_timer_H+3),w
	movwf	3+(?___lmul)+04h
	movf	(_auto_power_off_timer_H+2),w
	movwf	2+(?___lmul)+04h
	movf	(_auto_power_off_timer_H+1),w
	movwf	1+(?___lmul)+04h
	movf	(_auto_power_off_timer_H),w
	movwf	0+(?___lmul)+04h

	fcall	___lmul
	movf	(3+(?___lmul)),w
	movwf	(_auto_power_off_timer_H+3)
	movf	(2+(?___lmul)),w
	movwf	(_auto_power_off_timer_H+2)
	movf	(1+(?___lmul)),w
	movwf	(_auto_power_off_timer_H+1)
	movf	(0+(?___lmul)),w
	movwf	(_auto_power_off_timer_H)

	line	551
	
l4533:	
;FT_62F21X_pwm.c: 551: P1CDTL=100;
	movlw	(064h)
	movwf	(16)	;volatile
	line	552
	
l4535:	
;FT_62F21X_pwm.c: 552: P1DDTL=100;
	movlw	(064h)
	movwf	(8)	;volatile
	line	553
	
l4537:	
;FT_62F21X_pwm.c: 553: P1OE=0B10100000;
	movlw	(0A0h)
	bsf	status, 5	;RP0=1, select bank1
	movwf	(144)^080h	;volatile
	line	554
	
l4539:	
;FT_62F21X_pwm.c: 554: P1BR1=0B00001100;
	movlw	(0Ch)
	bcf	status, 5	;RP0=0, select bank0
	movwf	(25)	;volatile
	line	555
	
l4541:	
;FT_62F21X_pwm.c: 555: DelayMs(50);
	movlw	(032h)
	fcall	_DelayMs
	line	556
;FT_62F21X_pwm.c: 556: if(set_time_mode_backup != 0xff)
	bcf	status, 5	;RP0=0, select bank0
	movf	(_set_time_mode_backup),w
	xorlw	0FFh
	skipnz
	goto	u1261
	goto	u1260
u1261:
	goto	l1542
u1260:
	line	558
	
l4543:	
;FT_62F21X_pwm.c: 557: {
;FT_62F21X_pwm.c: 558: ft_user_pwm_mode = set_time_mode_backup;
	movf	(_set_time_mode_backup),w
	movwf	(_ft_user_pwm_mode)
	line	559
	
l4545:	
;FT_62F21X_pwm.c: 559: PWM_MODE_REFRESH();
	fcall	_PWM_MODE_REFRESH
	goto	l1542
	line	564
	
l4547:	
;FT_62F21X_pwm.c: 564: power_off_flag = 0;
	clrf	(_power_off_flag)
	line	566
	
l4549:	
;FT_62F21X_pwm.c: 566: if(power_off_mode_backup < 0x0B)
	movlw	(0Bh)
	subwf	(_power_off_mode_backup),w
	skipnc
	goto	u1271
	goto	u1270
u1271:
	goto	l4555
u1270:
	line	568
	
l4551:	
;FT_62F21X_pwm.c: 567: {
;FT_62F21X_pwm.c: 568: ft_user_pwm_mode = power_off_mode_backup;
	movf	(_power_off_mode_backup),w
	movwf	(_ft_user_pwm_mode)
	line	569
	
l4553:	
;FT_62F21X_pwm.c: 569: PWM_MODE_REFRESH();
	fcall	_PWM_MODE_REFRESH
	line	570
;FT_62F21X_pwm.c: 570: }
	goto	l4559
	line	573
	
l4555:	
;FT_62F21X_pwm.c: 571: else
;FT_62F21X_pwm.c: 572: {
;FT_62F21X_pwm.c: 573: ft_user_pwm_mode = 0;
	clrf	(_ft_user_pwm_mode)
	goto	l4553
	line	576
	
l4559:	
;FT_62F21X_pwm.c: 575: }
;FT_62F21X_pwm.c: 576: power_off_mode_backup = 0xff;
	movlw	(0FFh)
	movwf	(_power_off_mode_backup)
	line	577
;FT_62F21X_pwm.c: 577: break;
	goto	l1542
	line	580
	
l4561:	
;FT_62F21X_pwm.c: 580: P1OE=0B00000000;
	bsf	status, 5	;RP0=1, select bank1
	clrf	(144)^080h	;volatile
	line	581
;FT_62F21X_pwm.c: 581: P1BR1=0B00000000;
	bcf	status, 5	;RP0=0, select bank0
	clrf	(25)	;volatile
	line	582
	
l4563:	
;FT_62F21X_pwm.c: 582: power_off_flag = 1;
	clrf	(_power_off_flag)
	incf	(_power_off_flag),f
	line	583
	
l4565:	
;FT_62F21X_pwm.c: 583: auto_power_off_timer_H = 0;
	clrf	(_auto_power_off_timer_H)
	clrf	(_auto_power_off_timer_H+1)
	clrf	(_auto_power_off_timer_H+2)
	clrf	(_auto_power_off_timer_H+3)
	line	584
;FT_62F21X_pwm.c: 584: break;
	goto	l1542
	line	518
	
l4569:	
	movf	(_ft_user_set_mode),w
	; Switch size 1, requested type "space"
; Number of cases is 8, Range of values is 11 to 18
; switch strategies available:
; Name         Instructions Cycles
; direct_byte           17     9 (fixed)
; simple_byte           25    13 (average)
; jumptable            263     9 (fixed)
;	Chosen strategy is direct_byte

	addlw	-11
	skipc
goto l1542
	movwf fsr
	movlw	8
	subwf	fsr,w
skipnc
goto l1542
movlw high(S4779)
movwf pclath
	movlw low(S4779)
	addwf fsr,w
	movwf pc
psect	swtext1,local,class=CONST,delta=2
global __pswtext1
__pswtext1:
S4779:
	ljmp	l4513
	ljmp	l4521
	ljmp	l1553
	ljmp	l4529
	ljmp	l4529
	ljmp	l4529
	ljmp	l4547
	ljmp	l4561
psect	text641

	line	592
	
l1542:	
	return
	opt stack 0
GLOBAL	__end_of_SET_MODE_REFRESH
	__end_of_SET_MODE_REFRESH:
;; =============== function _SET_MODE_REFRESH ends ============

	signat	_SET_MODE_REFRESH,88
	global	_DelayMs
psect	text642,local,class=CODE,delta=2
global __ptext642
__ptext642:

;; *************** function _DelayMs *****************
;; Defined at:
;;		line 378 in file "FT_62F21X_pwm.c"
;; Parameters:    Size  Location     Type
;;  Time            1    wreg     unsigned char 
;; Auto vars:     Size  Location     Type
;;  Time            1    5[COMMON] unsigned char 
;;  b               1    7[COMMON] unsigned char 
;;  a               1    6[COMMON] unsigned char 
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 20/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0
;;      Params:         0       0
;;      Locals:         3       0
;;      Temps:          0       0
;;      Totals:         3       0
;;Total ram usage:        3 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    2
;; This function calls:
;;		_DelayUs
;; This function is called by:
;;		_SET_MODE_REFRESH
;; This function uses a non-reentrant model
;;
psect	text642
	file	"FT_62F21X_pwm.c"
	line	378
	global	__size_of_DelayMs
	__size_of_DelayMs	equ	__end_of_DelayMs-_DelayMs
	
_DelayMs:	
	opt	stack 4
; Regs used in _DelayMs: [wreg+status,2+status,0+pclath+cstack]
;DelayMs@Time stored from wreg
	line	380
	movwf	(DelayMs@Time)
	
l4201:	
;FT_62F21X_pwm.c: 379: unsigned char a,b;
;FT_62F21X_pwm.c: 380: for(a=0;a<Time;a++)
	clrf	(DelayMs@a)
	goto	l4217
	line	382
	
l4203:	
;FT_62F21X_pwm.c: 381: {
;FT_62F21X_pwm.c: 382: for(b=0;b<5;b++)
	clrf	(DelayMs@b)
	line	384
	
l4209:	
;FT_62F21X_pwm.c: 383: {
;FT_62F21X_pwm.c: 384: DelayUs(98);
	movlw	(062h)
	fcall	_DelayUs
	line	382
	
l4211:	
	incf	(DelayMs@b),f
	
l4213:	
	movlw	(05h)
	subwf	(DelayMs@b),w
	skipc
	goto	u841
	goto	u840
u841:
	goto	l4209
u840:
	line	380
	
l4215:	
	incf	(DelayMs@a),f
	
l4217:	
	movf	(DelayMs@Time),w
	subwf	(DelayMs@a),w
	skipc
	goto	u851
	goto	u850
u851:
	goto	l4203
u850:
	line	387
	
l1517:	
	return
	opt stack 0
GLOBAL	__end_of_DelayMs
	__end_of_DelayMs:
;; =============== function _DelayMs ends ============

	signat	_DelayMs,4216
	global	_PWM_MODE_CHANGE
psect	text643,local,class=CODE,delta=2
global __ptext643
__ptext643:

;; *************** function _PWM_MODE_CHANGE *****************
;; Defined at:
;;		line 297 in file "FT_62F21X_pwm.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, fsr0l, fsr0h, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 20/0
;;		On exit  : 20/0
;;		Unchanged: FFFDF/0
;; Data sizes:     COMMON   BANK0
;;      Params:         0       0
;;      Locals:         0       0
;;      Temps:          0       0
;;      Totals:         0       0
;;Total ram usage:        0 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    3
;; This function calls:
;;		_PWM_MODE_REFRESH
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text643
	file	"FT_62F21X_pwm.c"
	line	297
	global	__size_of_PWM_MODE_CHANGE
	__size_of_PWM_MODE_CHANGE	equ	__end_of_PWM_MODE_CHANGE-_PWM_MODE_CHANGE
	
_PWM_MODE_CHANGE:	
	opt	stack 4
; Regs used in _PWM_MODE_CHANGE: [wreg-fsr0h+status,2+status,0+pclath+cstack]
	line	298
	
l4189:	
;FT_62F21X_pwm.c: 298: ft_user_pwm_mode++;
	incf	(_ft_user_pwm_mode),f
	line	299
	
l4191:	
;FT_62F21X_pwm.c: 299: if(ft_user_pwm_mode == 6)
	movf	(_ft_user_pwm_mode),w
	xorlw	06h
	skipz
	goto	u821
	goto	u820
u821:
	goto	l4195
u820:
	line	301
	
l4193:	
;FT_62F21X_pwm.c: 300: {
;FT_62F21X_pwm.c: 301: ft_user_pwm_mode = 0;
	clrf	(_ft_user_pwm_mode)
	line	303
	
l4195:	
;FT_62F21X_pwm.c: 302: }
;FT_62F21X_pwm.c: 303: if(ft_user_pwm_mode > 6)
	movlw	(07h)
	subwf	(_ft_user_pwm_mode),w
	skipc
	goto	u831
	goto	u830
u831:
	goto	l4199
u830:
	line	305
	
l4197:	
;FT_62F21X_pwm.c: 304: {
;FT_62F21X_pwm.c: 305: ft_user_pwm_mode = 1;
	clrf	(_ft_user_pwm_mode)
	incf	(_ft_user_pwm_mode),f
	line	307
	
l4199:	
;FT_62F21X_pwm.c: 306: }
;FT_62F21X_pwm.c: 307: PWM_MODE_REFRESH();
	fcall	_PWM_MODE_REFRESH
	line	309
	
l1491:	
	return
	opt stack 0
GLOBAL	__end_of_PWM_MODE_CHANGE
	__end_of_PWM_MODE_CHANGE:
;; =============== function _PWM_MODE_CHANGE ends ============

	signat	_PWM_MODE_CHANGE,88
	global	_DelayUs
psect	text644,local,class=CODE,delta=2
global __ptext644
__ptext644:

;; *************** function _DelayUs *****************
;; Defined at:
;;		line 364 in file "FT_62F21X_pwm.c"
;; Parameters:    Size  Location     Type
;;  Time            1    wreg     unsigned char 
;; Auto vars:     Size  Location     Type
;;  Time            1    3[COMMON] unsigned char 
;;  a               1    4[COMMON] unsigned char 
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, status,2, status,0
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0
;;      Params:         0       0
;;      Locals:         2       0
;;      Temps:          0       0
;;      Totals:         2       0
;;Total ram usage:        2 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_DelayMs
;; This function uses a non-reentrant model
;;
psect	text644
	file	"FT_62F21X_pwm.c"
	line	364
	global	__size_of_DelayUs
	__size_of_DelayUs	equ	__end_of_DelayUs-_DelayUs
	
_DelayUs:	
	opt	stack 4
; Regs used in _DelayUs: [wreg+status,2+status,0]
;DelayUs@Time stored from wreg
	line	366
	movwf	(DelayUs@Time)
	
l4183:	
;FT_62F21X_pwm.c: 365: unsigned char a;
;FT_62F21X_pwm.c: 366: for(a=0;a<Time;a++)
	clrf	(DelayUs@a)
	goto	l4187
	line	367
	
l1507:	
	line	368
;FT_62F21X_pwm.c: 367: {
;FT_62F21X_pwm.c: 368: _nop();
	nop
	line	366
	
l4185:	
	incf	(DelayUs@a),f
	
l4187:	
	movf	(DelayUs@Time),w
	subwf	(DelayUs@a),w
	skipc
	goto	u811
	goto	u810
u811:
	goto	l1507
u810:
	line	370
	
l1509:	
	return
	opt stack 0
GLOBAL	__end_of_DelayUs
	__end_of_DelayUs:
;; =============== function _DelayUs ends ============

	signat	_DelayUs,4216
	global	_PWM_MODE_REFRESH
psect	text645,local,class=CODE,delta=2
global __ptext645
__ptext645:

;; *************** function _PWM_MODE_REFRESH *****************
;; Defined at:
;;		line 410 in file "FT_62F21X_pwm.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, fsr0l, fsr0h, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 20/0
;;		On exit  : 20/0
;;		Unchanged: FFFDF/0
;; Data sizes:     COMMON   BANK0
;;      Params:         0       0
;;      Locals:         0       0
;;      Temps:          0       0
;;      Totals:         0       0
;;Total ram usage:        0 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    2
;; This function calls:
;;		_reset_led_status
;;		_PWM1_RED
;; This function is called by:
;;		_main
;;		_PWM_MODE_CHANGE
;;		_SET_MODE_REFRESH
;; This function uses a non-reentrant model
;;
psect	text645
	file	"FT_62F21X_pwm.c"
	line	410
	global	__size_of_PWM_MODE_REFRESH
	__size_of_PWM_MODE_REFRESH	equ	__end_of_PWM_MODE_REFRESH-_PWM_MODE_REFRESH
	
_PWM_MODE_REFRESH:	
	opt	stack 5
; Regs used in _PWM_MODE_REFRESH: [wreg-fsr0h+status,2+status,0+pclath+cstack]
	line	411
	
l4121:	
;FT_62F21X_pwm.c: 411: reset_led_status();
	fcall	_reset_led_status
	line	413
	
l4123:	
;FT_62F21X_pwm.c: 413: if(ft_user_pwm_mode != 0)
	movf	(_ft_user_pwm_mode),w
	skipz
	goto	u790
	goto	l4127
u790:
	line	415
	
l4125:	
;FT_62F21X_pwm.c: 414: {
;FT_62F21X_pwm.c: 415: P1CDTL=jump_led_rate;
	movf	(_jump_led_rate),w
	movwf	(16)	;volatile
	line	416
;FT_62F21X_pwm.c: 416: P1DDTL=jump_led_rate;
	movf	(_jump_led_rate),w
	movwf	(8)	;volatile
	line	417
;FT_62F21X_pwm.c: 417: }
	goto	l4129
	line	420
	
l4127:	
;FT_62F21X_pwm.c: 418: else
;FT_62F21X_pwm.c: 419: {
;FT_62F21X_pwm.c: 420: P1CDTL=0;
	clrf	(16)	;volatile
	line	421
;FT_62F21X_pwm.c: 421: P1DDTL=0;
	clrf	(8)	;volatile
	line	424
	
l4129:	
;FT_62F21X_pwm.c: 422: }
;FT_62F21X_pwm.c: 424: if(power_off_flag == 1)
	decf	(_power_off_flag),w
	skipz
	goto	u801
	goto	u800
u801:
	goto	l4175
u800:
	goto	l1523
	line	432
	
l4133:	
;FT_62F21X_pwm.c: 432: pwm_rate_value = 0;
	clrf	(_pwm_rate_value)
	line	433
;FT_62F21X_pwm.c: 433: pwm_colour_value = 0;
	clrf	(_pwm_colour_value)
	line	434
	
l4135:	
;FT_62F21X_pwm.c: 434: PWM1_RED();
	fcall	_PWM1_RED
	line	436
;FT_62F21X_pwm.c: 436: break;
	goto	l1523
	line	440
	
l4137:	
;FT_62F21X_pwm.c: 440: P1OE=0B00000000;
	bsf	status, 5	;RP0=1, select bank1
	clrf	(144)^080h	;volatile
	line	441
	
l4139:	
;FT_62F21X_pwm.c: 441: P1BR1=0B00001000;
	movlw	(08h)
	bcf	status, 5	;RP0=0, select bank0
	movwf	(25)	;volatile
	line	443
;FT_62F21X_pwm.c: 443: break;
	goto	l1523
	line	447
	
l4141:	
;FT_62F21X_pwm.c: 447: P1OE=0B00100000;
	movlw	(020h)
	bsf	status, 5	;RP0=1, select bank1
	movwf	(144)^080h	;volatile
	line	448
	
l4143:	
;FT_62F21X_pwm.c: 448: P1BR1=0B00000000;
	bcf	status, 5	;RP0=0, select bank0
	clrf	(25)	;volatile
	line	450
;FT_62F21X_pwm.c: 450: break;
	goto	l1523
	line	453
	
l4145:	
;FT_62F21X_pwm.c: 453: P1OE=0B10000000;
	movlw	(080h)
	bsf	status, 5	;RP0=1, select bank1
	movwf	(144)^080h	;volatile
	goto	l4143
	line	458
	
l4149:	
;FT_62F21X_pwm.c: 458: P1OE=0B00000000;
	bsf	status, 5	;RP0=1, select bank1
	clrf	(144)^080h	;volatile
	line	459
	
l4151:	
;FT_62F21X_pwm.c: 459: P1BR1=0B00000100;
	movlw	(04h)
	bcf	status, 5	;RP0=0, select bank0
	movwf	(25)	;volatile
	line	460
;FT_62F21X_pwm.c: 460: break;
	goto	l1523
	line	463
	
l4153:	
;FT_62F21X_pwm.c: 463: pwm_colour_value = 0;
	clrf	(_pwm_colour_value)
	line	465
;FT_62F21X_pwm.c: 465: P1OE=0B00000000;
	bsf	status, 5	;RP0=1, select bank1
	clrf	(144)^080h	;volatile
	goto	l4139
	line	472
	
l4157:	
;FT_62F21X_pwm.c: 472: P1OE=0B00100000;
	movlw	(020h)
	bsf	status, 5	;RP0=1, select bank1
	movwf	(144)^080h	;volatile
	line	473
;FT_62F21X_pwm.c: 473: P1BR1=0B00001000;
	movlw	(08h)
	bcf	status, 5	;RP0=0, select bank0
	movwf	(25)	;volatile
	line	475
;FT_62F21X_pwm.c: 475: break;
	goto	l1523
	line	479
	
l4159:	
;FT_62F21X_pwm.c: 479: P1OE=0B10000000;
	movlw	(080h)
	bsf	status, 5	;RP0=1, select bank1
	movwf	(144)^080h	;volatile
	line	480
;FT_62F21X_pwm.c: 480: P1BR1=0B00001000;
	movlw	(08h)
	bcf	status, 5	;RP0=0, select bank0
	movwf	(25)	;volatile
	line	483
;FT_62F21X_pwm.c: 483: break;
	goto	l1523
	line	486
	
l4161:	
;FT_62F21X_pwm.c: 486: P1OE=0B00000000;
	bsf	status, 5	;RP0=1, select bank1
	clrf	(144)^080h	;volatile
	line	487
	
l4163:	
;FT_62F21X_pwm.c: 487: P1BR1=0B00001100;
	movlw	(0Ch)
	bcf	status, 5	;RP0=0, select bank0
	movwf	(25)	;volatile
	line	488
;FT_62F21X_pwm.c: 488: break;
	goto	l1523
	line	491
	
l4165:	
;FT_62F21X_pwm.c: 491: P1OE=0B10100000;
	movlw	(0A0h)
	bsf	status, 5	;RP0=1, select bank1
	movwf	(144)^080h	;volatile
	line	492
;FT_62F21X_pwm.c: 492: P1BR1=0B00001000;
	movlw	(08h)
	bcf	status, 5	;RP0=0, select bank0
	movwf	(25)	;volatile
	line	493
;FT_62F21X_pwm.c: 493: break;
	goto	l1523
	line	496
	
l4167:	
;FT_62F21X_pwm.c: 496: pwm_colour_value = 0;
	clrf	(_pwm_colour_value)
	line	497
	
l4169:	
;FT_62F21X_pwm.c: 497: P1OE=0B00100000;
	movlw	(020h)
	bsf	status, 5	;RP0=1, select bank1
	movwf	(144)^080h	;volatile
	goto	l4139
	line	429
	
l4175:	
	movf	(_ft_user_pwm_mode),w
	; Switch size 1, requested type "space"
; Number of cases is 11, Range of values is 0 to 10
; switch strategies available:
; Name         Instructions Cycles
; direct_byte           17     6 (fixed)
; simple_byte           34    18 (average)
; jumptable            260     6 (fixed)
; rangetable            15     6 (fixed)
; spacedrange           28     9 (fixed)
; locatedrange          11     3 (fixed)
;	Chosen strategy is direct_byte

	movwf fsr
	movlw	11
	subwf	fsr,w
skipnc
goto l1523
movlw high(S4781)
movwf pclath
	movlw low(S4781)
	addwf fsr,w
	movwf pc
psect	swtext2,local,class=CONST,delta=2
global __pswtext2
__pswtext2:
S4781:
	ljmp	l4133
	ljmp	l4137
	ljmp	l4141
	ljmp	l4145
	ljmp	l4149
	ljmp	l4153
	ljmp	l4157
	ljmp	l4159
	ljmp	l4161
	ljmp	l4165
	ljmp	l4167
psect	text645

	line	506
	
l1523:	
	return
	opt stack 0
GLOBAL	__end_of_PWM_MODE_REFRESH
	__end_of_PWM_MODE_REFRESH:
;; =============== function _PWM_MODE_REFRESH ends ============

	signat	_PWM_MODE_REFRESH,88
	global	_MIX_MODE_CHANGE
psect	text646,local,class=CODE,delta=2
global __ptext646
__ptext646:

;; *************** function _MIX_MODE_CHANGE *****************
;; Defined at:
;;		line 312 in file "FT_62F21X_pwm.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, fsr0l, fsr0h, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 20/0
;;		On exit  : 20/0
;;		Unchanged: FFFDF/0
;; Data sizes:     COMMON   BANK0
;;      Params:         0       0
;;      Locals:         0       0
;;      Temps:          0       0
;;      Totals:         0       0
;;Total ram usage:        0 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    2
;; This function calls:
;;		___lbmod
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text646
	file	"FT_62F21X_pwm.c"
	line	312
	global	__size_of_MIX_MODE_CHANGE
	__size_of_MIX_MODE_CHANGE	equ	__end_of_MIX_MODE_CHANGE-_MIX_MODE_CHANGE
	
_MIX_MODE_CHANGE:	
	opt	stack 5
; Regs used in _MIX_MODE_CHANGE: [wreg-fsr0h+status,2+status,0+pclath+cstack]
	line	313
	
l4093:	
;FT_62F21X_pwm.c: 313: pwm_colour_value++;
	incf	(_pwm_colour_value),f
	line	314
	
l4095:	
;FT_62F21X_pwm.c: 314: pwm_colour_value = pwm_colour_value%6;
	movlw	(06h)
	movwf	(?___lbmod)
	movf	(_pwm_colour_value),w
	fcall	___lbmod
	movwf	(_pwm_colour_value)
	line	316
;FT_62F21X_pwm.c: 316: switch(pwm_colour_value)
	goto	l4115
	line	319
	
l4097:	
;FT_62F21X_pwm.c: 319: P1OE=0B00100000;
	movlw	(020h)
	bsf	status, 5	;RP0=1, select bank1
	movwf	(144)^080h	;volatile
	line	320
;FT_62F21X_pwm.c: 320: P1BR1=0B00001000;
	movlw	(08h)
	bcf	status, 5	;RP0=0, select bank0
	movwf	(25)	;volatile
	line	321
;FT_62F21X_pwm.c: 321: break;
	goto	l1503
	line	324
	
l4099:	
;FT_62F21X_pwm.c: 324: P1OE=0B10000000;
	movlw	(080h)
	bsf	status, 5	;RP0=1, select bank1
	movwf	(144)^080h	;volatile
	line	325
;FT_62F21X_pwm.c: 325: P1BR1=0B00001000;
	movlw	(08h)
	bcf	status, 5	;RP0=0, select bank0
	movwf	(25)	;volatile
	line	327
;FT_62F21X_pwm.c: 327: break;
	goto	l1503
	line	330
	
l4101:	
;FT_62F21X_pwm.c: 330: P1OE=0B00000000;
	bsf	status, 5	;RP0=1, select bank1
	clrf	(144)^080h	;volatile
	line	331
	
l4103:	
;FT_62F21X_pwm.c: 331: P1BR1=0B00001100;
	movlw	(0Ch)
	bcf	status, 5	;RP0=0, select bank0
	movwf	(25)	;volatile
	line	333
;FT_62F21X_pwm.c: 333: break;
	goto	l1503
	line	336
	
l4105:	
;FT_62F21X_pwm.c: 336: P1OE=0B10100000;
	movlw	(0A0h)
	bsf	status, 5	;RP0=1, select bank1
	movwf	(144)^080h	;volatile
	line	337
	
l4107:	
;FT_62F21X_pwm.c: 337: P1BR1=0B00000000;
	bcf	status, 5	;RP0=0, select bank0
	clrf	(25)	;volatile
	line	338
;FT_62F21X_pwm.c: 338: break;
	goto	l1503
	line	341
	
l4109:	
;FT_62F21X_pwm.c: 341: P1OE=0B00100000;
	movlw	(020h)
	bsf	status, 5	;RP0=1, select bank1
	movwf	(144)^080h	;volatile
	line	342
;FT_62F21X_pwm.c: 342: P1BR1=0B00000100;
	movlw	(04h)
	bcf	status, 5	;RP0=0, select bank0
	movwf	(25)	;volatile
	line	343
;FT_62F21X_pwm.c: 343: break;
	goto	l1503
	line	346
	
l4111:	
;FT_62F21X_pwm.c: 346: P1OE=0B10000000;
	movlw	(080h)
	bsf	status, 5	;RP0=1, select bank1
	movwf	(144)^080h	;volatile
	line	347
;FT_62F21X_pwm.c: 347: P1BR1=0B00000100;
	movlw	(04h)
	bcf	status, 5	;RP0=0, select bank0
	movwf	(25)	;volatile
	line	348
;FT_62F21X_pwm.c: 348: break;
	goto	l1503
	line	316
	
l4115:	
	movf	(_pwm_colour_value),w
	; Switch size 1, requested type "space"
; Number of cases is 6, Range of values is 0 to 5
; switch strategies available:
; Name         Instructions Cycles
; direct_byte           12     6 (fixed)
; simple_byte           19    10 (average)
; jumptable            260     6 (fixed)
; rangetable            10     6 (fixed)
; spacedrange           18     9 (fixed)
; locatedrange           6     3 (fixed)
;	Chosen strategy is direct_byte

	movwf fsr
	movlw	6
	subwf	fsr,w
skipnc
goto l1503
movlw high(S4783)
movwf pclath
	movlw low(S4783)
	addwf fsr,w
	movwf pc
psect	swtext3,local,class=CONST,delta=2
global __pswtext3
__pswtext3:
S4783:
	ljmp	l4097
	ljmp	l4099
	ljmp	l4101
	ljmp	l4105
	ljmp	l4109
	ljmp	l4111
psect	text646

	line	354
	
l1503:	
	return
	opt stack 0
GLOBAL	__end_of_MIX_MODE_CHANGE
	__end_of_MIX_MODE_CHANGE:
;; =============== function _MIX_MODE_CHANGE ends ============

	signat	_MIX_MODE_CHANGE,88
	global	_PWM1_RATE_CHANGE
psect	text647,local,class=CODE,delta=2
global __ptext647
__ptext647:

;; *************** function _PWM1_RATE_CHANGE *****************
;; Defined at:
;;		line 195 in file "FT_62F21X_pwm.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;  pwm_value       1    3[COMMON] unsigned char 
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, fsr0l, fsr0h, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 20/0
;;		On exit  : 20/0
;;		Unchanged: FFFDF/0
;; Data sizes:     COMMON   BANK0
;;      Params:         0       0
;;      Locals:         1       0
;;      Temps:          0       0
;;      Totals:         1       0
;;Total ram usage:        1 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    2
;; This function calls:
;;		_PWM1_RED
;;		_PWM1_GREEN
;;		_PWM1_BLUE
;;		_PWM1_WHITE
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text647
	file	"FT_62F21X_pwm.c"
	line	195
	global	__size_of_PWM1_RATE_CHANGE
	__size_of_PWM1_RATE_CHANGE	equ	__end_of_PWM1_RATE_CHANGE-_PWM1_RATE_CHANGE
	
_PWM1_RATE_CHANGE:	
	opt	stack 5
; Regs used in _PWM1_RATE_CHANGE: [wreg-fsr0h+status,2+status,0+pclath+cstack]
	line	198
	
l4047:	
;FT_62F21X_pwm.c: 196: unsigned char pwm_value;
;FT_62F21X_pwm.c: 198: if(pwm_rate_value >= 200)
	movlw	(0C8h)
	subwf	(_pwm_rate_value),w
	skipc
	goto	u771
	goto	u770
u771:
	goto	l4067
u770:
	line	200
	
l4049:	
;FT_62F21X_pwm.c: 199: {
;FT_62F21X_pwm.c: 200: pwm_rate_value = 0;
	clrf	(_pwm_rate_value)
	line	201
	
l4051:	
;FT_62F21X_pwm.c: 201: pwm_colour_value++;
	incf	(_pwm_colour_value),f
	line	202
	
l4053:	
;FT_62F21X_pwm.c: 202: pwm_colour_value = pwm_colour_value%4;
	movlw	(03h)
	andwf	(_pwm_colour_value),f
	line	203
;FT_62F21X_pwm.c: 203: switch(pwm_colour_value)
	goto	l4065
	line	206
	
l4055:	
;FT_62F21X_pwm.c: 206: PWM1_RED();
	fcall	_PWM1_RED
	line	207
;FT_62F21X_pwm.c: 207: break;
	goto	l4067
	line	210
	
l4057:	
;FT_62F21X_pwm.c: 210: PWM1_GREEN();
	fcall	_PWM1_GREEN
	line	211
;FT_62F21X_pwm.c: 211: break;
	goto	l4067
	line	214
	
l4059:	
;FT_62F21X_pwm.c: 214: PWM1_BLUE();
	fcall	_PWM1_BLUE
	line	215
;FT_62F21X_pwm.c: 215: break;
	goto	l4067
	line	218
	
l4061:	
;FT_62F21X_pwm.c: 218: PWM1_WHITE();
	fcall	_PWM1_WHITE
	line	219
;FT_62F21X_pwm.c: 219: break;
	goto	l4067
	line	203
	
l4065:	
	movf	(_pwm_colour_value),w
	; Switch size 1, requested type "space"
; Number of cases is 4, Range of values is 0 to 3
; switch strategies available:
; Name         Instructions Cycles
; direct_byte           10     6 (fixed)
; simple_byte           13     7 (average)
; jumptable            260     6 (fixed)
; rangetable             8     6 (fixed)
; spacedrange           14     9 (fixed)
; locatedrange           4     3 (fixed)
;	Chosen strategy is direct_byte

	movwf fsr
	movlw	4
	subwf	fsr,w
skipnc
goto l4067
movlw high(S4785)
movwf pclath
	movlw low(S4785)
	addwf fsr,w
	movwf pc
psect	swtext4,local,class=CONST,delta=2
global __pswtext4
__pswtext4:
S4785:
	ljmp	l4055
	ljmp	l4057
	ljmp	l4059
	ljmp	l4061
psect	text647

	line	226
	
l4067:	
;FT_62F21X_pwm.c: 225: }
;FT_62F21X_pwm.c: 226: if(pwm_rate_value <=100)
	movlw	(065h)
	subwf	(_pwm_rate_value),w
	skipnc
	goto	u781
	goto	u780
u781:
	goto	l4071
u780:
	line	228
	
l4069:	
;FT_62F21X_pwm.c: 227: {
;FT_62F21X_pwm.c: 228: pwm_value = pwm_rate_value;
	movf	(_pwm_rate_value),w
	movwf	(PWM1_RATE_CHANGE@pwm_value)
	line	229
;FT_62F21X_pwm.c: 229: }
	goto	l4083
	line	232
	
l4071:	
;FT_62F21X_pwm.c: 230: else
;FT_62F21X_pwm.c: 231: {
;FT_62F21X_pwm.c: 232: pwm_value = 200 - pwm_rate_value;
	movf	(_pwm_rate_value),w
	sublw	0C8h
	movwf	(PWM1_RATE_CHANGE@pwm_value)
	goto	l4083
	line	238
	
l4073:	
;FT_62F21X_pwm.c: 238: P1CDTL = pwm_value;
	movf	(PWM1_RATE_CHANGE@pwm_value),w
	movwf	(16)	;volatile
	line	239
;FT_62F21X_pwm.c: 239: break;
	goto	l1476
	line	242
	
l4075:	
;FT_62F21X_pwm.c: 242: P1DDTL = pwm_value;
	movf	(PWM1_RATE_CHANGE@pwm_value),w
	movwf	(8)	;volatile
	line	243
;FT_62F21X_pwm.c: 243: break;
	goto	l1476
	line	235
	
l4083:	
	movf	(_pwm_colour_value),w
	; Switch size 1, requested type "space"
; Number of cases is 4, Range of values is 0 to 3
; switch strategies available:
; Name         Instructions Cycles
; direct_byte           10     6 (fixed)
; simple_byte           13     7 (average)
; jumptable            260     6 (fixed)
; rangetable             8     6 (fixed)
; spacedrange           14     9 (fixed)
; locatedrange           4     3 (fixed)
;	Chosen strategy is direct_byte

	movwf fsr
	movlw	4
	subwf	fsr,w
skipnc
goto l1476
movlw high(S4787)
movwf pclath
	movlw low(S4787)
	addwf fsr,w
	movwf pc
psect	swtext5,local,class=CONST,delta=2
global __pswtext5
__pswtext5:
S4787:
	ljmp	l4073
	ljmp	l4075
	ljmp	l4073
	ljmp	l4075
psect	text647

	line	258
	
l1476:	
	return
	opt stack 0
GLOBAL	__end_of_PWM1_RATE_CHANGE
	__end_of_PWM1_RATE_CHANGE:
;; =============== function _PWM1_RATE_CHANGE ends ============

	signat	_PWM1_RATE_CHANGE,88
	global	_PWM1_INITIAL
psect	text648,local,class=CODE,delta=2
global __ptext648
__ptext648:

;; *************** function _PWM1_INITIAL *****************
;; Defined at:
;;		line 33 in file "FT_62F21X_pwm.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 17F/20
;;		On exit  : 17F/0
;;		Unchanged: FFE80/0
;; Data sizes:     COMMON   BANK0
;;      Params:         0       0
;;      Locals:         0       0
;;      Temps:          0       0
;;      Totals:         0       0
;;Total ram usage:        0 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    2
;; This function calls:
;;		_PWM1_RED
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text648
	file	"FT_62F21X_pwm.c"
	line	33
	global	__size_of_PWM1_INITIAL
	__size_of_PWM1_INITIAL	equ	__end_of_PWM1_INITIAL-_PWM1_INITIAL
	
_PWM1_INITIAL:	
	opt	stack 5
; Regs used in _PWM1_INITIAL: [wreg+status,2+status,0+pclath+cstack]
	line	34
	
l4023:	
;FT_62F21X_pwm.c: 34: T2CON0=0B00000001;
	movlw	(01h)
	bcf	status, 5	;RP0=0, select bank0
	movwf	(18)	;volatile
	line	40
	
l4025:	
;FT_62F21X_pwm.c: 40: T2CON1=0B00000000;
	bsf	status, 5	;RP0=1, select bank1
	clrf	(158)^080h	;volatile
	line	45
	
l4027:	
;FT_62F21X_pwm.c: 45: TMR2H=0;
	bcf	status, 5	;RP0=0, select bank0
	clrf	(19)	;volatile
	line	46
;FT_62F21X_pwm.c: 46: TMR2L=100;
	movlw	(064h)
	movwf	(17)	;volatile
	line	48
	
l4029:	
;FT_62F21X_pwm.c: 48: PR2H=0;
	bsf	status, 5	;RP0=1, select bank1
	clrf	(146)^080h	;volatile
	line	49
	
l4031:	
;FT_62F21X_pwm.c: 49: PR2L=100;
	movlw	(064h)
	movwf	(145)^080h	;volatile
	line	51
;FT_62F21X_pwm.c: 51: P1CDTH=0;
	bcf	status, 5	;RP0=0, select bank0
	clrf	(26)	;volatile
	line	52
;FT_62F21X_pwm.c: 52: P1DDTH=0;
	clrf	(9)	;volatile
	line	53
;FT_62F21X_pwm.c: 53: P1CDTL=0;
	clrf	(16)	;volatile
	line	54
;FT_62F21X_pwm.c: 54: P1DDTL=0;
	clrf	(8)	;volatile
	line	56
;FT_62F21X_pwm.c: 56: P1POL=0B00000000;
	bsf	status, 5	;RP0=1, select bank1
	clrf	(153)^080h	;volatile
	line	63
;FT_62F21X_pwm.c: 63: P1CON=0B00000000;
	bcf	status, 5	;RP0=0, select bank0
	clrf	(22)	;volatile
	line	70
;FT_62F21X_pwm.c: 70: P1AUX=0B00000000;
	clrf	(30)	;volatile
	line	78
	
l4033:	
;FT_62F21X_pwm.c: 78: PWM1_RED();
	fcall	_PWM1_RED
	line	79
	
l4035:	
;FT_62F21X_pwm.c: 79: pwm_colour_value = 0;
	clrf	(_pwm_colour_value)
	line	81
	
l4037:	
;FT_62F21X_pwm.c: 81: TMR2IF=0;
	bcf	(97/8),(97)&7
	line	82
	
l4039:	
;FT_62F21X_pwm.c: 82: TMR2IE=1;
	bsf	status, 5	;RP0=1, select bank1
	bsf	(1121/8)^080h,(1121)&7
	line	83
	
l4041:	
;FT_62F21X_pwm.c: 83: TMR2ON=1;
	bcf	status, 5	;RP0=0, select bank0
	bsf	(146/8),(146)&7
	line	84
	
l4043:	
;FT_62F21X_pwm.c: 84: PEIE=1;
	bsf	(94/8),(94)&7
	line	85
	
l4045:	
;FT_62F21X_pwm.c: 85: GIE=1;
	bsf	(95/8),(95)&7
	line	87
	
l1444:	
	return
	opt stack 0
GLOBAL	__end_of_PWM1_INITIAL
	__end_of_PWM1_INITIAL:
;; =============== function _PWM1_INITIAL ends ============

	signat	_PWM1_INITIAL,88
	global	___lmul
psect	text649,local,class=CODE,delta=2
global __ptext649
__ptext649:

;; *************** function ___lmul *****************
;; Defined at:
;;		line 3 in file "c:\program files (x86)\fmd\fmdide\data\sources\lmul.c"
;; Parameters:    Size  Location     Type
;;  multiplier      4    0[BANK0 ] unsigned long 
;;  multiplicand    4    4[BANK0 ] unsigned long 
;; Auto vars:     Size  Location     Type
;;  product         4    3[COMMON] unsigned long 
;; Return value:  Size  Location     Type
;;                  4    0[BANK0 ] unsigned long 
;; Registers used:
;;		wreg, status,2, status,0
;; Tracked objects:
;;		On entry : 20/0
;;		On exit  : 20/0
;;		Unchanged: FFFDF/0
;; Data sizes:     COMMON   BANK0
;;      Params:         0       8
;;      Locals:         4       0
;;      Temps:          0       0
;;      Totals:         4       8
;;Total ram usage:       12 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_SET_MODE_REFRESH
;; This function uses a non-reentrant model
;;
psect	text649
	file	"c:\program files (x86)\fmd\fmdide\data\sources\lmul.c"
	line	3
	global	__size_of___lmul
	__size_of___lmul	equ	__end_of___lmul-___lmul
	
___lmul:	
	opt	stack 5
; Regs used in ___lmul: [wreg+status,2+status,0]
	line	4
	
l4495:	
	clrf	(___lmul@product)
	clrf	(___lmul@product+1)
	clrf	(___lmul@product+2)
	clrf	(___lmul@product+3)
	line	6
	
l2872:	
	line	7
	btfss	(___lmul@multiplier),(0)&7
	goto	u1171
	goto	u1170
u1171:
	goto	l4499
u1170:
	line	8
	
l4497:	
	movf	(___lmul@multiplicand),w
	addwf	(___lmul@product),f
	movf	(___lmul@multiplicand+1),w
	clrz
	skipnc
	addlw	1
	skipnz
	goto	u1181
	addwf	(___lmul@product+1),f
u1181:
	movf	(___lmul@multiplicand+2),w
	clrz
	skipnc
	addlw	1
	skipnz
	goto	u1182
	addwf	(___lmul@product+2),f
u1182:
	movf	(___lmul@multiplicand+3),w
	clrz
	skipnc
	addlw	1
	skipnz
	goto	u1183
	addwf	(___lmul@product+3),f
u1183:

	line	9
	
l4499:	
	clrc
	rlf	(___lmul@multiplicand),f
	rlf	(___lmul@multiplicand+1),f
	rlf	(___lmul@multiplicand+2),f
	rlf	(___lmul@multiplicand+3),f
	line	10
	
l4501:	
	clrc
	rrf	(___lmul@multiplier+3),f
	rrf	(___lmul@multiplier+2),f
	rrf	(___lmul@multiplier+1),f
	rrf	(___lmul@multiplier),f
	line	11
	movf	(___lmul@multiplier+3),w
	iorwf	(___lmul@multiplier+2),w
	iorwf	(___lmul@multiplier+1),w
	iorwf	(___lmul@multiplier),w
	skipz
	goto	u1191
	goto	u1190
u1191:
	goto	l2872
u1190:
	line	12
	
l4503:	
	movf	(___lmul@product+3),w
	movwf	(?___lmul+3)
	movf	(___lmul@product+2),w
	movwf	(?___lmul+2)
	movf	(___lmul@product+1),w
	movwf	(?___lmul+1)
	movf	(___lmul@product),w
	movwf	(?___lmul)

	line	13
	
l2875:	
	return
	opt stack 0
GLOBAL	__end_of___lmul
	__end_of___lmul:
;; =============== function ___lmul ends ============

	signat	___lmul,8316
	global	___lbmod
psect	text650,local,class=CODE,delta=2
global __ptext650
__ptext650:

;; *************** function ___lbmod *****************
;; Defined at:
;;		line 5 in file "c:\program files (x86)\fmd\fmdide\data\sources\lbmod.c"
;; Parameters:    Size  Location     Type
;;  dividend        1    wreg     unsigned char 
;;  divisor         1    3[COMMON] unsigned char 
;; Auto vars:     Size  Location     Type
;;  dividend        1    5[COMMON] unsigned char 
;;  rem             1    7[COMMON] unsigned char 
;;  counter         1    6[COMMON] unsigned char 
;; Return value:  Size  Location     Type
;;                  1    wreg      unsigned char 
;; Registers used:
;;		wreg, status,2, status,0
;; Tracked objects:
;;		On entry : 20/0
;;		On exit  : 20/0
;;		Unchanged: FFFDF/0
;; Data sizes:     COMMON   BANK0
;;      Params:         1       0
;;      Locals:         3       0
;;      Temps:          1       0
;;      Totals:         5       0
;;Total ram usage:        5 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_MIX_MODE_CHANGE
;; This function uses a non-reentrant model
;;
psect	text650
	file	"c:\program files (x86)\fmd\fmdide\data\sources\lbmod.c"
	line	5
	global	__size_of___lbmod
	__size_of___lbmod	equ	__end_of___lbmod-___lbmod
	
___lbmod:	
	opt	stack 5
; Regs used in ___lbmod: [wreg+status,2+status,0]
;___lbmod@dividend stored from wreg
	line	9
	movwf	(___lbmod@dividend)
	
l3993:	
	movlw	(08h)
	movwf	(___lbmod@counter)
	line	10
	
l3995:	
	clrf	(___lbmod@rem)
	line	12
	
l3997:	
	movf	(___lbmod@dividend),w
	movwf	(??___lbmod+0)+0
	movlw	07h
u715:
	clrc
	rrf	(??___lbmod+0)+0,f
	addlw	-1
	skipz
	goto	u715
	clrc
	rlf	(___lbmod@rem),w
	iorwf	0+(??___lbmod+0)+0,w
	movwf	(___lbmod@rem)
	line	13
	
l3999:	
	clrc
	rlf	(___lbmod@dividend),f
	line	14
	
l4001:	
	movf	(___lbmod@divisor),w
	subwf	(___lbmod@rem),w
	skipc
	goto	u721
	goto	u720
u721:
	goto	l4005
u720:
	line	15
	
l4003:	
	movf	(___lbmod@divisor),w
	subwf	(___lbmod@rem),f
	line	16
	
l4005:	
	decfsz	(___lbmod@counter),f
	goto	u731
	goto	u730
u731:
	goto	l3997
u730:
	line	17
	
l4007:	
	movf	(___lbmod@rem),w
	line	18
	
l2836:	
	return
	opt stack 0
GLOBAL	__end_of___lbmod
	__end_of___lbmod:
;; =============== function ___lbmod ends ============

	signat	___lbmod,8313
	global	_PWM1_WHITE
psect	text651,local,class=CODE,delta=2
global __ptext651
__ptext651:

;; *************** function _PWM1_WHITE *****************
;; Defined at:
;;		line 176 in file "FT_62F21X_pwm.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, status,2
;; Tracked objects:
;;		On entry : 20/0
;;		On exit  : 20/0
;;		Unchanged: FFFDF/0
;; Data sizes:     COMMON   BANK0
;;      Params:         0       0
;;      Locals:         0       0
;;      Temps:          0       0
;;      Totals:         0       0
;;Total ram usage:        0 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_PWM1_RATE_CHANGE
;; This function uses a non-reentrant model
;;
psect	text651
	file	"FT_62F21X_pwm.c"
	line	176
	global	__size_of_PWM1_WHITE
	__size_of_PWM1_WHITE	equ	__end_of_PWM1_WHITE-_PWM1_WHITE
	
_PWM1_WHITE:	
	opt	stack 5
; Regs used in _PWM1_WHITE: [wreg+status,2]
	line	177
	
l3989:	
;FT_62F21X_pwm.c: 177: P1CDTL=0;
	clrf	(16)	;volatile
	line	178
;FT_62F21X_pwm.c: 178: P1DDTL=0;
	clrf	(8)	;volatile
	line	180
;FT_62F21X_pwm.c: 180: P1OE=0B00000000;
	bsf	status, 5	;RP0=1, select bank1
	clrf	(144)^080h	;volatile
	line	188
	
l3991:	
;FT_62F21X_pwm.c: 188: P1BR1=0B00000100;
	movlw	(04h)
	bcf	status, 5	;RP0=0, select bank0
	movwf	(25)	;volatile
	line	192
	
l1456:	
	return
	opt stack 0
GLOBAL	__end_of_PWM1_WHITE
	__end_of_PWM1_WHITE:
;; =============== function _PWM1_WHITE ends ============

	signat	_PWM1_WHITE,88
	global	_PWM1_BLUE
psect	text652,local,class=CODE,delta=2
global __ptext652
__ptext652:

;; *************** function _PWM1_BLUE *****************
;; Defined at:
;;		line 157 in file "FT_62F21X_pwm.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, status,2
;; Tracked objects:
;;		On entry : 20/0
;;		On exit  : 20/0
;;		Unchanged: FFFDF/0
;; Data sizes:     COMMON   BANK0
;;      Params:         0       0
;;      Locals:         0       0
;;      Temps:          0       0
;;      Totals:         0       0
;;Total ram usage:        0 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_PWM1_RATE_CHANGE
;; This function uses a non-reentrant model
;;
psect	text652
	file	"FT_62F21X_pwm.c"
	line	157
	global	__size_of_PWM1_BLUE
	__size_of_PWM1_BLUE	equ	__end_of_PWM1_BLUE-_PWM1_BLUE
	
_PWM1_BLUE:	
	opt	stack 5
; Regs used in _PWM1_BLUE: [wreg+status,2]
	line	158
	
l3983:	
;FT_62F21X_pwm.c: 158: P1CDTL=0;
	clrf	(16)	;volatile
	line	159
;FT_62F21X_pwm.c: 159: P1DDTL=0;
	clrf	(8)	;volatile
	line	161
	
l3985:	
;FT_62F21X_pwm.c: 161: P1OE=0B10000000;
	movlw	(080h)
	bsf	status, 5	;RP0=1, select bank1
	movwf	(144)^080h	;volatile
	line	169
	
l3987:	
;FT_62F21X_pwm.c: 169: P1BR1=0B00000000;
	bcf	status, 5	;RP0=0, select bank0
	clrf	(25)	;volatile
	line	173
	
l1453:	
	return
	opt stack 0
GLOBAL	__end_of_PWM1_BLUE
	__end_of_PWM1_BLUE:
;; =============== function _PWM1_BLUE ends ============

	signat	_PWM1_BLUE,88
	global	_PWM1_GREEN
psect	text653,local,class=CODE,delta=2
global __ptext653
__ptext653:

;; *************** function _PWM1_GREEN *****************
;; Defined at:
;;		line 124 in file "FT_62F21X_pwm.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, status,2
;; Tracked objects:
;;		On entry : 20/0
;;		On exit  : 20/0
;;		Unchanged: FFFDF/0
;; Data sizes:     COMMON   BANK0
;;      Params:         0       0
;;      Locals:         0       0
;;      Temps:          0       0
;;      Totals:         0       0
;;Total ram usage:        0 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_PWM1_RATE_CHANGE
;; This function uses a non-reentrant model
;;
psect	text653
	file	"FT_62F21X_pwm.c"
	line	124
	global	__size_of_PWM1_GREEN
	__size_of_PWM1_GREEN	equ	__end_of_PWM1_GREEN-_PWM1_GREEN
	
_PWM1_GREEN:	
	opt	stack 5
; Regs used in _PWM1_GREEN: [wreg+status,2]
	line	126
	
l3977:	
;FT_62F21X_pwm.c: 126: P1CDTL=0;
	clrf	(16)	;volatile
	line	127
;FT_62F21X_pwm.c: 127: P1DDTL=0;
	clrf	(8)	;volatile
	line	129
	
l3979:	
;FT_62F21X_pwm.c: 129: P1OE=0B00100000;
	movlw	(020h)
	bsf	status, 5	;RP0=1, select bank1
	movwf	(144)^080h	;volatile
	line	137
	
l3981:	
;FT_62F21X_pwm.c: 137: P1BR1=0B00000000;
	bcf	status, 5	;RP0=0, select bank0
	clrf	(25)	;volatile
	line	154
	
l1450:	
	return
	opt stack 0
GLOBAL	__end_of_PWM1_GREEN
	__end_of_PWM1_GREEN:
;; =============== function _PWM1_GREEN ends ============

	signat	_PWM1_GREEN,88
	global	_PWM1_RED
psect	text654,local,class=CODE,delta=2
global __ptext654
__ptext654:

;; *************** function _PWM1_RED *****************
;; Defined at:
;;		line 91 in file "FT_62F21X_pwm.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, status,2
;; Tracked objects:
;;		On entry : 20/0
;;		On exit  : 20/0
;;		Unchanged: FFFDF/0
;; Data sizes:     COMMON   BANK0
;;      Params:         0       0
;;      Locals:         0       0
;;      Temps:          0       0
;;      Totals:         0       0
;;Total ram usage:        0 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_PWM1_INITIAL
;;		_PWM1_RATE_CHANGE
;;		_PWM_MODE_REFRESH
;; This function uses a non-reentrant model
;;
psect	text654
	file	"FT_62F21X_pwm.c"
	line	91
	global	__size_of_PWM1_RED
	__size_of_PWM1_RED	equ	__end_of_PWM1_RED-_PWM1_RED
	
_PWM1_RED:	
	opt	stack 5
; Regs used in _PWM1_RED: [wreg+status,2]
	line	93
	
l3973:	
;FT_62F21X_pwm.c: 93: P1CDTL=0;
	clrf	(16)	;volatile
	line	94
;FT_62F21X_pwm.c: 94: P1DDTL=0;
	clrf	(8)	;volatile
	line	96
;FT_62F21X_pwm.c: 96: P1OE=0B00000000;
	bsf	status, 5	;RP0=1, select bank1
	clrf	(144)^080h	;volatile
	line	104
	
l3975:	
;FT_62F21X_pwm.c: 104: P1BR1=0B00001000;
	movlw	(08h)
	bcf	status, 5	;RP0=0, select bank0
	movwf	(25)	;volatile
	line	121
	
l1447:	
	return
	opt stack 0
GLOBAL	__end_of_PWM1_RED
	__end_of_PWM1_RED:
;; =============== function _PWM1_RED ends ============

	signat	_PWM1_RED,88
	global	_JUMP_MODE_CHANGE
psect	text655,local,class=CODE,delta=2
global __ptext655
__ptext655:

;; *************** function _JUMP_MODE_CHANGE *****************
;; Defined at:
;;		line 261 in file "FT_62F21X_pwm.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, fsr0l, fsr0h, status,2, status,0
;; Tracked objects:
;;		On entry : 20/0
;;		On exit  : 20/0
;;		Unchanged: FFFDF/0
;; Data sizes:     COMMON   BANK0
;;      Params:         0       0
;;      Locals:         0       0
;;      Temps:          0       0
;;      Totals:         0       0
;;Total ram usage:        0 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text655
	file	"FT_62F21X_pwm.c"
	line	261
	global	__size_of_JUMP_MODE_CHANGE
	__size_of_JUMP_MODE_CHANGE	equ	__end_of_JUMP_MODE_CHANGE-_JUMP_MODE_CHANGE
	
_JUMP_MODE_CHANGE:	
	opt	stack 6
; Regs used in _JUMP_MODE_CHANGE: [wreg-fsr0h+status,2+status,0]
	line	262
	
l3945:	
;FT_62F21X_pwm.c: 262: pwm_colour_value++;
	incf	(_pwm_colour_value),f
	line	263
	
l3947:	
;FT_62F21X_pwm.c: 263: pwm_colour_value = pwm_colour_value%4;
	movlw	(03h)
	andwf	(_pwm_colour_value),f
	line	264
;FT_62F21X_pwm.c: 264: switch(pwm_colour_value)
	goto	l3967
	line	268
	
l3949:	
;FT_62F21X_pwm.c: 268: P1OE=0B00000000;
	bsf	status, 5	;RP0=1, select bank1
	clrf	(144)^080h	;volatile
	line	269
	
l3951:	
;FT_62F21X_pwm.c: 269: P1BR1=0B00001000;
	movlw	(08h)
	bcf	status, 5	;RP0=0, select bank0
	movwf	(25)	;volatile
	line	271
;FT_62F21X_pwm.c: 271: break;
	goto	l1486
	line	275
	
l3953:	
;FT_62F21X_pwm.c: 275: P1OE=0B00100000;
	movlw	(020h)
	bsf	status, 5	;RP0=1, select bank1
	movwf	(144)^080h	;volatile
	line	276
	
l3955:	
;FT_62F21X_pwm.c: 276: P1BR1=0B00000000;
	bcf	status, 5	;RP0=0, select bank0
	clrf	(25)	;volatile
	line	278
;FT_62F21X_pwm.c: 278: break;
	goto	l1486
	line	281
	
l3957:	
;FT_62F21X_pwm.c: 281: P1OE=0B10000000;
	movlw	(080h)
	bsf	status, 5	;RP0=1, select bank1
	movwf	(144)^080h	;volatile
	goto	l3955
	line	286
	
l3961:	
;FT_62F21X_pwm.c: 286: P1OE=0B00000000;
	bsf	status, 5	;RP0=1, select bank1
	clrf	(144)^080h	;volatile
	line	287
	
l3963:	
;FT_62F21X_pwm.c: 287: P1BR1=0B00000100;
	movlw	(04h)
	bcf	status, 5	;RP0=0, select bank0
	movwf	(25)	;volatile
	line	288
;FT_62F21X_pwm.c: 288: break;
	goto	l1486
	line	264
	
l3967:	
	movf	(_pwm_colour_value),w
	; Switch size 1, requested type "space"
; Number of cases is 4, Range of values is 0 to 3
; switch strategies available:
; Name         Instructions Cycles
; direct_byte           10     6 (fixed)
; simple_byte           13     7 (average)
; jumptable            260     6 (fixed)
; rangetable             8     6 (fixed)
; spacedrange           14     9 (fixed)
; locatedrange           4     3 (fixed)
;	Chosen strategy is direct_byte

	movwf fsr
	movlw	4
	subwf	fsr,w
skipnc
goto l1486
movlw high(S4789)
movwf pclath
	movlw low(S4789)
	addwf fsr,w
	movwf pc
psect	swtext6,local,class=CONST,delta=2
global __pswtext6
__pswtext6:
S4789:
	ljmp	l3949
	ljmp	l3953
	ljmp	l3957
	ljmp	l3961
psect	text655

	line	294
	
l1486:	
	return
	opt stack 0
GLOBAL	__end_of_JUMP_MODE_CHANGE
	__end_of_JUMP_MODE_CHANGE:
;; =============== function _JUMP_MODE_CHANGE ends ============

	signat	_JUMP_MODE_CHANGE,88
	global	_PA3_Level_Change_INITIAL
psect	text656,local,class=CODE,delta=2
global __ptext656
__ptext656:

;; *************** function _PA3_Level_Change_INITIAL *****************
;; Defined at:
;;		line 37 in file "FT_62F21x_IR.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg
;; Tracked objects:
;;		On entry : 17F/0
;;		On exit  : 17F/20
;;		Unchanged: FFE80/0
;; Data sizes:     COMMON   BANK0
;;      Params:         0       0
;;      Locals:         0       0
;;      Temps:          0       0
;;      Totals:         0       0
;;Total ram usage:        0 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text656
	file	"FT_62F21x_IR.c"
	line	37
	global	__size_of_PA3_Level_Change_INITIAL
	__size_of_PA3_Level_Change_INITIAL	equ	__end_of_PA3_Level_Change_INITIAL-_PA3_Level_Change_INITIAL
	
_PA3_Level_Change_INITIAL:	
	opt	stack 6
; Regs used in _PA3_Level_Change_INITIAL: [wreg]
	line	38
	
l3935:	
;FT_62F21x_IR.c: 38: TRISA3 =1;
	bsf	status, 5	;RP0=1, select bank1
	bsf	(1067/8)^080h,(1067)&7
	line	39
	
l3937:	
;FT_62F21x_IR.c: 39: ReadAPin = PORTA;
	bcf	status, 5	;RP0=0, select bank0
	movf	(5),w	;volatile
	line	40
	
l3939:	
;FT_62F21x_IR.c: 40: PAIF =0;
	bcf	(88/8),(88)&7
	line	41
	
l3941:	
;FT_62F21x_IR.c: 41: IOCA3 =1;
	bsf	status, 5	;RP0=1, select bank1
	bsf	(1203/8)^080h,(1203)&7
	line	42
	
l3943:	
;FT_62F21x_IR.c: 42: PAIE =1;
	bsf	(91/8),(91)&7
	line	43
	
l2236:	
	return
	opt stack 0
GLOBAL	__end_of_PA3_Level_Change_INITIAL
	__end_of_PA3_Level_Change_INITIAL:
;; =============== function _PA3_Level_Change_INITIAL ends ============

	signat	_PA3_Level_Change_INITIAL,88
	global	_TIMER0_INITIAL
psect	text657,local,class=CODE,delta=2
global __ptext657
__ptext657:

;; *************** function _TIMER0_INITIAL *****************
;; Defined at:
;;		line 19 in file "FT_62F21x_IR.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg
;; Tracked objects:
;;		On entry : 17F/0
;;		On exit  : 17F/0
;;		Unchanged: FFE80/0
;; Data sizes:     COMMON   BANK0
;;      Params:         0       0
;;      Locals:         0       0
;;      Temps:          0       0
;;      Totals:         0       0
;;Total ram usage:        0 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text657
	file	"FT_62F21x_IR.c"
	line	19
	global	__size_of_TIMER0_INITIAL
	__size_of_TIMER0_INITIAL	equ	__end_of_TIMER0_INITIAL-_TIMER0_INITIAL
	
_TIMER0_INITIAL:	
	opt	stack 6
; Regs used in _TIMER0_INITIAL: [wreg]
	line	20
	
l3931:	
;FT_62F21x_IR.c: 20: OPTION = 0B00000011;
	movlw	(03h)
	bsf	status, 5	;RP0=1, select bank1
	movwf	(129)^080h	;volatile
	line	27
;FT_62F21x_IR.c: 27: TMR0 = 140;
	movlw	(08Ch)
	bcf	status, 5	;RP0=0, select bank0
	movwf	(1)	;volatile
	line	28
	
l3933:	
;FT_62F21x_IR.c: 28: T0IF = 0;
	bcf	(90/8),(90)&7
	line	29
	
l2233:	
	return
	opt stack 0
GLOBAL	__end_of_TIMER0_INITIAL
	__end_of_TIMER0_INITIAL:
;; =============== function _TIMER0_INITIAL ends ============

	signat	_TIMER0_INITIAL,88
	global	_reset_led_status
psect	text658,local,class=CODE,delta=2
global __ptext658
__ptext658:

;; *************** function _reset_led_status *****************
;; Defined at:
;;		line 150 in file "TEST_FT62F21X_SLEEP.C"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		status,2
;; Tracked objects:
;;		On entry : 20/0
;;		On exit  : 20/0
;;		Unchanged: FFFDF/0
;; Data sizes:     COMMON   BANK0
;;      Params:         0       0
;;      Locals:         0       0
;;      Temps:          0       0
;;      Totals:         0       0
;;Total ram usage:        0 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_main
;;		_PWM_MODE_REFRESH
;; This function uses a non-reentrant model
;;
psect	text658
	file	"TEST_FT62F21X_SLEEP.C"
	line	150
	global	__size_of_reset_led_status
	__size_of_reset_led_status	equ	__end_of_reset_led_status-_reset_led_status
	
_reset_led_status:	
	opt	stack 5
; Regs used in _reset_led_status: [status,2]
	line	151
	
l3929:	
;TEST_FT62F21X_SLEEP.C: 151: time_15ms_cnt = 0;
	clrf	(_time_15ms_cnt)
	line	152
;TEST_FT62F21X_SLEEP.C: 152: time_2s_cnt = 0;
	clrf	(_time_2s_cnt)
	line	154
	
l729:	
	return
	opt stack 0
GLOBAL	__end_of_reset_led_status
	__end_of_reset_led_status:
;; =============== function _reset_led_status ends ============

	signat	_reset_led_status,88
	global	_POWER_INITIAL
psect	text659,local,class=CODE,delta=2
global __ptext659
__ptext659:

;; *************** function _POWER_INITIAL *****************
;; Defined at:
;;		line 133 in file "TEST_FT62F21X_SLEEP.C"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, status,2
;; Tracked objects:
;;		On entry : 17F/0
;;		On exit  : 17F/0
;;		Unchanged: FFE80/0
;; Data sizes:     COMMON   BANK0
;;      Params:         0       0
;;      Locals:         0       0
;;      Temps:          0       0
;;      Totals:         0       0
;;Total ram usage:        0 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text659
	file	"TEST_FT62F21X_SLEEP.C"
	line	133
	global	__size_of_POWER_INITIAL
	__size_of_POWER_INITIAL	equ	__end_of_POWER_INITIAL-_POWER_INITIAL
	
_POWER_INITIAL:	
	opt	stack 6
; Regs used in _POWER_INITIAL: [wreg+status,2]
	line	134
	
l3919:	
;TEST_FT62F21X_SLEEP.C: 134: OSCCON = 0X00|0X70|0X00;
	movlw	(070h)
	bsf	status, 5	;RP0=1, select bank1
	movwf	(143)^080h	;volatile
	line	137
	
l3921:	
;TEST_FT62F21X_SLEEP.C: 137: INTCON = 0;
	clrf	(11)	;volatile
	line	139
	
l3923:	
;TEST_FT62F21X_SLEEP.C: 139: PORTA = 0B00000000;
	bcf	status, 5	;RP0=0, select bank0
	clrf	(5)	;volatile
	line	140
;TEST_FT62F21X_SLEEP.C: 140: TRISA = 0B00010000;
	movlw	(010h)
	bsf	status, 5	;RP0=1, select bank1
	movwf	(133)^080h	;volatile
	line	141
	
l3925:	
;TEST_FT62F21X_SLEEP.C: 141: WPUA = 0B00000000;
	clrf	(149)^080h	;volatile
	line	143
	
l3927:	
;TEST_FT62F21X_SLEEP.C: 143: OPTION = 0B00001000;
	movlw	(08h)
	movwf	(129)^080h	;volatile
	line	145
;TEST_FT62F21X_SLEEP.C: 145: MSCON = 0B00000000;
	bcf	status, 5	;RP0=0, select bank0
	clrf	(27)	;volatile
	line	146
	
l726:	
	return
	opt stack 0
GLOBAL	__end_of_POWER_INITIAL
	__end_of_POWER_INITIAL:
;; =============== function _POWER_INITIAL ends ============

	signat	_POWER_INITIAL,88
	global	_ISR
psect	text660,local,class=CODE,delta=2
global __ptext660
__ptext660:

;; *************** function _ISR *****************
;; Defined at:
;;		line 61 in file "TEST_FT62F21X_SLEEP.C"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, fsr0l, fsr0h, status,2, status,0
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: FFEDF/0
;; Data sizes:     COMMON   BANK0
;;      Params:         0       0
;;      Locals:         0       0
;;      Temps:          3       0
;;      Totals:         3       0
;;Total ram usage:        3 bytes
;; Hardware stack levels used:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		Interrupt level 1
;; This function uses a non-reentrant model
;;
psect	text660
	file	"TEST_FT62F21X_SLEEP.C"
	line	61
	global	__size_of_ISR
	__size_of_ISR	equ	__end_of_ISR-_ISR
	
_ISR:	
	opt	stack 4
; Regs used in _ISR: [wreg-fsr0h+status,2+status,0]
psect	intentry,class=CODE,delta=2
global __pintentry
__pintentry:
global interrupt_function
interrupt_function:
	global saved_w
	saved_w	set	btemp+0
	movwf	saved_w
	swapf	status,w
	movwf	(??_ISR+0)
	movf	fsr0,w
	movwf	(??_ISR+1)
	movf	pclath,w
	movwf	(??_ISR+2)
	ljmp	_ISR
psect	text660
	line	64
	
i1l3857:	
;TEST_FT62F21X_SLEEP.C: 64: if(TMR2IE && TMR2IF)
	bsf	status, 5	;RP0=1, select bank1
	btfss	(1121/8)^080h,(1121)&7
	goto	u59_21
	goto	u59_20
u59_21:
	goto	i1l3865
u59_20:
	
i1l3859:	
	bcf	status, 5	;RP0=0, select bank0
	btfss	(97/8),(97)&7
	goto	u60_21
	goto	u60_20
u60_21:
	goto	i1l3865
u60_20:
	line	66
	
i1l3861:	
;TEST_FT62F21X_SLEEP.C: 65: {
;TEST_FT62F21X_SLEEP.C: 66: TMR2IF = 0;
	bcf	(97/8),(97)&7
	line	67
	
i1l3863:	
;TEST_FT62F21X_SLEEP.C: 67: time_15ms_cnt++;
	incf	(_time_15ms_cnt),f
	line	68
;TEST_FT62F21X_SLEEP.C: 68: auto_power_off_timer_L++;
	incf	(_auto_power_off_timer_L),f
	line	74
	
i1l3865:	
;TEST_FT62F21X_SLEEP.C: 70: }
;TEST_FT62F21X_SLEEP.C: 74: if(T0IE && T0IF)
	btfss	(93/8),(93)&7
	goto	u61_21
	goto	u61_20
u61_21:
	goto	i1l3881
u61_20:
	
i1l3867:	
	btfss	(90/8),(90)&7
	goto	u62_21
	goto	u62_20
u62_21:
	goto	i1l3881
u62_20:
	line	76
	
i1l3869:	
;TEST_FT62F21X_SLEEP.C: 75: {
;TEST_FT62F21X_SLEEP.C: 76: TMR0 = 140;
	movlw	(08Ch)
	bcf	status, 5	;RP0=0, select bank0
	movwf	(1)	;volatile
	line	78
	
i1l3871:	
;TEST_FT62F21X_SLEEP.C: 78: T0IF = 0;
	bcf	(90/8),(90)&7
	line	79
	
i1l3873:	
;TEST_FT62F21X_SLEEP.C: 79: IRbitTime++;
	incf	(_IRbitTime),f
	line	80
	
i1l3875:	
;TEST_FT62F21X_SLEEP.C: 80: if(IRbitTime > 50)
	movlw	(033h)
	subwf	(_IRbitTime),w
	skipc
	goto	u63_21
	goto	u63_20
u63_21:
	goto	i1l3881
u63_20:
	line	82
	
i1l3877:	
;TEST_FT62F21X_SLEEP.C: 81: {
;TEST_FT62F21X_SLEEP.C: 82: T0IE = 0;
	bcf	(93/8),(93)&7
	line	83
	
i1l3879:	
;TEST_FT62F21X_SLEEP.C: 83: IRbitTime = 0;
	clrf	(_IRbitTime)
	line	88
	
i1l3881:	
;TEST_FT62F21X_SLEEP.C: 84: }
;TEST_FT62F21X_SLEEP.C: 85: }
;TEST_FT62F21X_SLEEP.C: 88: if(PAIE && PAIF)
	btfss	(91/8),(91)&7
	goto	u64_21
	goto	u64_20
u64_21:
	goto	i1l723
u64_20:
	
i1l3883:	
	btfss	(88/8),(88)&7
	goto	u65_21
	goto	u65_20
u65_21:
	goto	i1l723
u65_20:
	line	90
	
i1l3885:	
;TEST_FT62F21X_SLEEP.C: 89: {
;TEST_FT62F21X_SLEEP.C: 90: ReadAPin = PORTA;
	bcf	status, 5	;RP0=0, select bank0
	movf	(5),w	;volatile
	line	91
	
i1l3887:	
;TEST_FT62F21X_SLEEP.C: 91: PAIF = 0;
	bcf	(88/8),(88)&7
	line	92
	
i1l3889:	
;TEST_FT62F21X_SLEEP.C: 92: if(RA3 == 0)
	btfsc	(43/8),(43)&7
	goto	u66_21
	goto	u66_20
u66_21:
	goto	i1l723
u66_20:
	line	94
	
i1l3891:	
;TEST_FT62F21X_SLEEP.C: 93: {
;TEST_FT62F21X_SLEEP.C: 94: T0IE = 1;
	bsf	(93/8),(93)&7
	line	95
	
i1l3893:	
;TEST_FT62F21X_SLEEP.C: 95: if(IRbitTime > 21)
	movlw	(016h)
	subwf	(_IRbitTime),w
	skipc
	goto	u67_21
	goto	u67_20
u67_21:
	goto	i1l3897
u67_20:
	line	97
	
i1l3895:	
;TEST_FT62F21X_SLEEP.C: 96: {
;TEST_FT62F21X_SLEEP.C: 97: IRDataTimer[0] = 0;
	clrf	(_IRDataTimer)
	line	98
;TEST_FT62F21X_SLEEP.C: 98: IRDataTimer[1] = 0;
	clrf	0+(_IRDataTimer)+01h
	line	99
;TEST_FT62F21X_SLEEP.C: 99: IRDataTimer[2] = 0;
	clrf	0+(_IRDataTimer)+02h
	line	100
;TEST_FT62F21X_SLEEP.C: 100: IRDataTimer[3] = 0;
	clrf	0+(_IRDataTimer)+03h
	line	101
;TEST_FT62F21X_SLEEP.C: 101: IRbitNum = 0;
	clrf	(_IRbitNum)
	line	102
;TEST_FT62F21X_SLEEP.C: 102: bitdata = 0x00;
	clrf	(_bitdata)
	line	103
;TEST_FT62F21X_SLEEP.C: 103: }
	goto	i1l3901
	line	104
	
i1l3897:	
;TEST_FT62F21X_SLEEP.C: 104: else if(IRbitTime > 3)
	movlw	(04h)
	subwf	(_IRbitTime),w
	skipc
	goto	u68_21
	goto	u68_20
u68_21:
	goto	i1l3901
u68_20:
	line	106
	
i1l3899:	
;TEST_FT62F21X_SLEEP.C: 105: {
;TEST_FT62F21X_SLEEP.C: 106: IRDataTimer[IRbitNum-1] |= bitdata;
	movf	(_IRbitNum),w
	addlw	_IRDataTimer+-1&0ffh
	movwf	fsr0
	movf	(_bitdata),w
	bcf	status, 7	;select IRP bank0
	iorwf	indf,f
	line	108
	
i1l3901:	
;TEST_FT62F21X_SLEEP.C: 107: }
;TEST_FT62F21X_SLEEP.C: 108: IRbitTime = 0;
	clrf	(_IRbitTime)
	line	109
	
i1l3903:	
;TEST_FT62F21X_SLEEP.C: 109: bitdata<<=1;
	clrc
	rlf	(_bitdata),f
	line	110
	
i1l3905:	
;TEST_FT62F21X_SLEEP.C: 110: if(bitdata == 0)
	movf	(_bitdata),f
	skipz
	goto	u69_21
	goto	u69_20
u69_21:
	goto	i1l3911
u69_20:
	line	112
	
i1l3907:	
;TEST_FT62F21X_SLEEP.C: 111: {
;TEST_FT62F21X_SLEEP.C: 112: bitdata = 0x01;
	clrf	(_bitdata)
	incf	(_bitdata),f
	line	113
	
i1l3909:	
;TEST_FT62F21X_SLEEP.C: 113: IRbitNum++;
	incf	(_IRbitNum),f
	line	115
	
i1l3911:	
;TEST_FT62F21X_SLEEP.C: 114: }
;TEST_FT62F21X_SLEEP.C: 115: if(IRbitNum > 4)
	movlw	(05h)
	subwf	(_IRbitNum),w
	skipc
	goto	u70_21
	goto	u70_20
u70_21:
	goto	i1l723
u70_20:
	line	117
	
i1l3913:	
;TEST_FT62F21X_SLEEP.C: 116: {
;TEST_FT62F21X_SLEEP.C: 117: IRbitNum = 0;
	clrf	(_IRbitNum)
	line	118
	
i1l3915:	
;TEST_FT62F21X_SLEEP.C: 118: T0IE = 0;
	bcf	(93/8),(93)&7
	line	119
	
i1l3917:	
;TEST_FT62F21X_SLEEP.C: 119: ReceiveFinish = 1;
	clrf	(_ReceiveFinish)
	incf	(_ReceiveFinish),f
	line	124
	
i1l723:	
	movf	(??_ISR+2),w
	movwf	pclath
	movf	(??_ISR+1),w
	movwf	fsr0
	swapf	(??_ISR+0)^0FFFFFF80h,w
	movwf	status
	swapf	saved_w,f
	swapf	saved_w,w
	retfie
	opt stack 0
GLOBAL	__end_of_ISR
	__end_of_ISR:
;; =============== function _ISR ends ============

	signat	_ISR,88
psect	text661,local,class=CODE,delta=2
global __ptext661
__ptext661:
	global	btemp
	btemp set 07Eh

	DABS	1,126,2	;btemp
	global	wtemp0
	wtemp0 set btemp
	end
