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
	FNCALL	_main,_DelayMs
	FNCALL	_main,_reset_led_status
	FNCALL	_main,_PWM_MODE_CHANGE
	FNCALL	_main,_PWM_MODE_REFRESH
	FNCALL	_SET_MODE_REFRESH,___lmul
	FNCALL	_SET_MODE_REFRESH,_DelayMs
	FNCALL	_SET_MODE_REFRESH,_PWM1_RED
	FNCALL	_SET_MODE_REFRESH,_PWM1_GREEN
	FNCALL	_SET_MODE_REFRESH,_PWM1_BLUE
	FNCALL	_SET_MODE_REFRESH,_PWM1_WHITE
	FNCALL	_SET_MODE_REFRESH,_PWM_MODE_REFRESH
	FNCALL	_PWM_MODE_CHANGE,_PWM_MODE_REFRESH
	FNCALL	_DelayMs,_DelayUs
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
	global	_jump_led_rate
	global	_set_time_mode_backup
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
psect	idataCOMMON,class=CODE,space=0,delta=2
global __pidataCOMMON
__pidataCOMMON:
	line	16

;initializer for _jump_led_rate
	retlw	064h
	line	18

;initializer for _set_time_mode_backup
	retlw	0FFh
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
	global	_pwm_rate_value
	global	_temp_mode
	global	_time_15ms_cnt
	global	_time_2s_cnt
	global	_pwm_colour_value
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
	global	_RA4
_RA4	set	44
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

psect	dataCOMMON,class=COMMON,space=1
global __pdataCOMMON
__pdataCOMMON:
	file	"FT_62F21X_pwm.c"
	line	16
_jump_led_rate:
       ds      1

psect	dataCOMMON
	file	"FT_62F21X_pwm.c"
	line	18
_set_time_mode_backup:
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

_pwm_rate_value:
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
; Clear objects allocated to BANK0
psect cinit,class=CODE,delta=2
	bcf	status, 7	;select IRP bank0
	movlw	low(__pbssBANK0)
	movwf	fsr
	movlw	low((__pbssBANK0)+014h)
	fcall	clear_ram
; Initialize objects allocated to BANK0
	global __pidataBANK0
psect cinit,class=CODE,delta=2
	fcall	__pidataBANK0+0		;fetch initializer
	movwf	__pdataBANK0+0&07fh		
	fcall	__pidataBANK0+1		;fetch initializer
	movwf	__pdataBANK0+1&07fh		
; Initialize objects allocated to COMMON
	global __pidataCOMMON
psect cinit,class=CODE,delta=2
	fcall	__pidataCOMMON+0		;fetch initializer
	movwf	__pdataCOMMON+0&07fh		
	fcall	__pidataCOMMON+1		;fetch initializer
	movwf	__pdataCOMMON+1&07fh		
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
	global	?_DelayMs
?_DelayMs:	; 0 bytes @ 0x0
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
;;   _main->_DelayMs
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
;; (0) _main                                                 5     5      0     791
;;                                              8 BANK0      5     5      0
;;                      _POWER_INITIAL
;;                     _TIMER0_INITIAL
;;           _PA3_Level_Change_INITIAL
;;                       _PWM1_INITIAL
;;                   _PWM1_RATE_CHANGE
;;                   _JUMP_MODE_CHANGE
;;                    _MIX_MODE_CHANGE
;;                   _SET_MODE_REFRESH
;;                            _DelayMs
;;                   _reset_led_status
;;                    _PWM_MODE_CHANGE
;;                   _PWM_MODE_REFRESH
;; ---------------------------------------------------------------------------------
;; (1) _SET_MODE_REFRESH                                     0     0      0     274
;;                             ___lmul
;;                            _DelayMs
;;                           _PWM1_RED
;;                         _PWM1_GREEN
;;                          _PWM1_BLUE
;;                         _PWM1_WHITE
;;                   _PWM_MODE_REFRESH
;; ---------------------------------------------------------------------------------
;; (1) _PWM_MODE_CHANGE                                      0     0      0       0
;;                   _PWM_MODE_REFRESH
;; ---------------------------------------------------------------------------------
;; (1) _DelayMs                                              3     3      0     138
;;                                              5 COMMON     3     3      0
;;                            _DelayUs
;; ---------------------------------------------------------------------------------
;; (2) _DelayUs                                              2     2      0      46
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
;; Estimated maximum stack depth 2
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
;;     _PWM1_RED
;;     _PWM1_GREEN
;;     _PWM1_BLUE
;;     _PWM1_WHITE
;;     _PWM_MODE_REFRESH
;;       _reset_led_status
;;       _PWM1_RED
;;   _DelayMs
;;     _DelayUs
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
;;		_DelayMs
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
	
l5027:	
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
	
l5029:	
# 170 "TEST_FT62F21X_SLEEP.C"
clrwdt ;#
psect	maintext
	line	172
	
l5031:	
;TEST_FT62F21X_SLEEP.C: 172: if(power_off_flag == 0)
	bcf	status, 5	;RP0=0, select bank0
	movf	(_power_off_flag),f
	skipz
	goto	u1391
	goto	u1390
u1391:
	goto	l5071
u1390:
	line	174
	
l5033:	
;TEST_FT62F21X_SLEEP.C: 173: {
;TEST_FT62F21X_SLEEP.C: 174: if(ft_user_pwm_mode == 0)
	movf	(_ft_user_pwm_mode),f
	skipz
	goto	u1401
	goto	u1400
u1401:
	goto	l5043
u1400:
	line	176
	
l5035:	
;TEST_FT62F21X_SLEEP.C: 175: {
;TEST_FT62F21X_SLEEP.C: 176: if(time_15ms_cnt > 150)
	movlw	(097h)
	subwf	(_time_15ms_cnt),w
	skipc
	goto	u1411
	goto	u1410
u1411:
	goto	l5043
u1410:
	line	178
	
l5037:	
;TEST_FT62F21X_SLEEP.C: 177: {
;TEST_FT62F21X_SLEEP.C: 178: time_15ms_cnt = 0;
	clrf	(_time_15ms_cnt)
	line	179
	
l5039:	
;TEST_FT62F21X_SLEEP.C: 179: pwm_rate_value++;
	incf	(_pwm_rate_value),f
	line	180
	
l5041:	
;TEST_FT62F21X_SLEEP.C: 180: PWM1_RATE_CHANGE();
	fcall	_PWM1_RATE_CHANGE
	line	183
	
l5043:	
;TEST_FT62F21X_SLEEP.C: 181: }
;TEST_FT62F21X_SLEEP.C: 182: }
;TEST_FT62F21X_SLEEP.C: 183: if(ft_user_pwm_mode == 5)
	movf	(_ft_user_pwm_mode),w
	xorlw	05h
	skipz
	goto	u1421
	goto	u1420
u1421:
	goto	l5057
u1420:
	line	185
	
l5045:	
;TEST_FT62F21X_SLEEP.C: 184: {
;TEST_FT62F21X_SLEEP.C: 185: if(time_15ms_cnt>200)
	movlw	(0C9h)
	subwf	(_time_15ms_cnt),w
	skipc
	goto	u1431
	goto	u1430
u1431:
	goto	l5057
u1430:
	line	187
	
l5047:	
;TEST_FT62F21X_SLEEP.C: 186: {
;TEST_FT62F21X_SLEEP.C: 187: time_2s_cnt++;
	incf	(_time_2s_cnt),f
	line	188
	
l5049:	
;TEST_FT62F21X_SLEEP.C: 188: if(time_2s_cnt > 100)
	movlw	(065h)
	subwf	(_time_2s_cnt),w
	skipc
	goto	u1441
	goto	u1440
u1441:
	goto	l5055
u1440:
	line	190
	
l5051:	
;TEST_FT62F21X_SLEEP.C: 189: {
;TEST_FT62F21X_SLEEP.C: 190: time_2s_cnt = 0;
	clrf	(_time_2s_cnt)
	line	191
	
l5053:	
;TEST_FT62F21X_SLEEP.C: 191: JUMP_MODE_CHANGE();
	fcall	_JUMP_MODE_CHANGE
	line	193
	
l5055:	
;TEST_FT62F21X_SLEEP.C: 192: }
;TEST_FT62F21X_SLEEP.C: 193: time_15ms_cnt = 0;
	clrf	(_time_15ms_cnt)
	line	197
	
l5057:	
;TEST_FT62F21X_SLEEP.C: 195: }
;TEST_FT62F21X_SLEEP.C: 196: }
;TEST_FT62F21X_SLEEP.C: 197: if(ft_user_pwm_mode == 0x0A)
	movf	(_ft_user_pwm_mode),w
	xorlw	0Ah
	skipz
	goto	u1451
	goto	u1450
u1451:
	goto	l5071
u1450:
	line	199
	
l5059:	
;TEST_FT62F21X_SLEEP.C: 198: {
;TEST_FT62F21X_SLEEP.C: 199: if(time_15ms_cnt>200)
	movlw	(0C9h)
	subwf	(_time_15ms_cnt),w
	skipc
	goto	u1461
	goto	u1460
u1461:
	goto	l5071
u1460:
	line	201
	
l5061:	
;TEST_FT62F21X_SLEEP.C: 200: {
;TEST_FT62F21X_SLEEP.C: 201: time_2s_cnt++;
	incf	(_time_2s_cnt),f
	line	202
	
l5063:	
;TEST_FT62F21X_SLEEP.C: 202: if(time_2s_cnt > 100)
	movlw	(065h)
	subwf	(_time_2s_cnt),w
	skipc
	goto	u1471
	goto	u1470
u1471:
	goto	l5069
u1470:
	line	204
	
l5065:	
;TEST_FT62F21X_SLEEP.C: 203: {
;TEST_FT62F21X_SLEEP.C: 204: time_2s_cnt = 0;
	clrf	(_time_2s_cnt)
	line	205
	
l5067:	
;TEST_FT62F21X_SLEEP.C: 205: MIX_MODE_CHANGE();
	fcall	_MIX_MODE_CHANGE
	line	207
	
l5069:	
;TEST_FT62F21X_SLEEP.C: 206: }
;TEST_FT62F21X_SLEEP.C: 207: time_15ms_cnt = 0;
	clrf	(_time_15ms_cnt)
	line	213
	
l5071:	
;TEST_FT62F21X_SLEEP.C: 209: }
;TEST_FT62F21X_SLEEP.C: 210: }
;TEST_FT62F21X_SLEEP.C: 211: }
;TEST_FT62F21X_SLEEP.C: 213: if(auto_power_off_timer_H)
	movf	(_auto_power_off_timer_H+3),w
	iorwf	(_auto_power_off_timer_H+2),w
	iorwf	(_auto_power_off_timer_H+1),w
	iorwf	(_auto_power_off_timer_H),w
	skipnz
	goto	u1481
	goto	u1480
u1481:
	goto	l5085
u1480:
	line	215
	
l5073:	
;TEST_FT62F21X_SLEEP.C: 214: {
;TEST_FT62F21X_SLEEP.C: 215: if(auto_power_off_timer_L > 100)
	movlw	(065h)
	subwf	(_auto_power_off_timer_L),w
	skipc
	goto	u1491
	goto	u1490
u1491:
	goto	l5085
u1490:
	line	217
	
l5075:	
;TEST_FT62F21X_SLEEP.C: 216: {
;TEST_FT62F21X_SLEEP.C: 217: auto_power_off_timer_L = 0;
	clrf	(_auto_power_off_timer_L)
	line	218
	
l5077:	
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
	goto	u1505
	goto	u1506
u1505:
	subwf	(_auto_power_off_timer_H+1),f
u1506:
	movf	2+(??_main+0)+0,w
	skipc
	incfsz	2+(??_main+0)+0,w
	goto	u1507
	goto	u1508
u1507:
	subwf	(_auto_power_off_timer_H+2),f
u1508:
	movf	3+(??_main+0)+0,w
	skipc
	incfsz	3+(??_main+0)+0,w
	goto	u1509
	goto	u1500
u1509:
	subwf	(_auto_power_off_timer_H+3),f
u1500:

	line	219
	
l5079:	
;TEST_FT62F21X_SLEEP.C: 219: if(!auto_power_off_timer_H)
	movf	(_auto_power_off_timer_H+3),w
	iorwf	(_auto_power_off_timer_H+2),w
	iorwf	(_auto_power_off_timer_H+1),w
	iorwf	(_auto_power_off_timer_H),w
	skipz
	goto	u1511
	goto	u1510
u1511:
	goto	l5085
u1510:
	line	221
	
l5081:	
;TEST_FT62F21X_SLEEP.C: 220: {
;TEST_FT62F21X_SLEEP.C: 221: ft_user_set_mode = 0x12;
	movlw	(012h)
	movwf	(_ft_user_set_mode)
	line	222
	
l5083:	
;TEST_FT62F21X_SLEEP.C: 222: SET_MODE_REFRESH();
	fcall	_SET_MODE_REFRESH
	line	227
	
l5085:	
;TEST_FT62F21X_SLEEP.C: 223: }
;TEST_FT62F21X_SLEEP.C: 224: }
;TEST_FT62F21X_SLEEP.C: 225: }
;TEST_FT62F21X_SLEEP.C: 227: if(RA4)
	btfss	(44/8),(44)&7
	goto	u1521
	goto	u1520
u1521:
	goto	l5089
u1520:
	line	229
	
l5087:	
;TEST_FT62F21X_SLEEP.C: 228: {
;TEST_FT62F21X_SLEEP.C: 229: key_release = 0;
	clrf	(_key_release)
	line	230
;TEST_FT62F21X_SLEEP.C: 230: }
	goto	l5105
	line	233
	
l5089:	
;TEST_FT62F21X_SLEEP.C: 231: else
;TEST_FT62F21X_SLEEP.C: 232: {
;TEST_FT62F21X_SLEEP.C: 233: if(key_release == 0)
	movf	(_key_release),f
	skipz
	goto	u1531
	goto	u1530
u1531:
	goto	l5103
u1530:
	line	236
	
l5091:	
;TEST_FT62F21X_SLEEP.C: 234: {
;TEST_FT62F21X_SLEEP.C: 236: DelayMs(1);
	movlw	(01h)
	fcall	_DelayMs
	line	237
	
l5093:	
;TEST_FT62F21X_SLEEP.C: 237: if(!RA4)
	bcf	status, 5	;RP0=0, select bank0
	btfsc	(44/8),(44)&7
	goto	u1541
	goto	u1540
u1541:
	goto	l5103
u1540:
	line	239
	
l5095:	
;TEST_FT62F21X_SLEEP.C: 238: {
;TEST_FT62F21X_SLEEP.C: 239: DelayMs(1);
	movlw	(01h)
	fcall	_DelayMs
	line	240
	
l5097:	
;TEST_FT62F21X_SLEEP.C: 240: if(!RA4)
	bcf	status, 5	;RP0=0, select bank0
	btfsc	(44/8),(44)&7
	goto	u1551
	goto	u1550
u1551:
	goto	l5103
u1550:
	line	242
	
l5099:	
;TEST_FT62F21X_SLEEP.C: 241: {
;TEST_FT62F21X_SLEEP.C: 242: reset_led_status();
	fcall	_reset_led_status
	line	243
	
l5101:	
;TEST_FT62F21X_SLEEP.C: 243: PWM_MODE_CHANGE();
	fcall	_PWM_MODE_CHANGE
	line	253
	
l5103:	
;TEST_FT62F21X_SLEEP.C: 244: }
;TEST_FT62F21X_SLEEP.C: 246: }
;TEST_FT62F21X_SLEEP.C: 252: }
;TEST_FT62F21X_SLEEP.C: 253: key_release = 1;
	clrf	(_key_release)
	incf	(_key_release),f
	line	257
	
l5105:	
;TEST_FT62F21X_SLEEP.C: 255: }
;TEST_FT62F21X_SLEEP.C: 257: if(ReceiveFinish)
	movf	(_ReceiveFinish),w
	skipz
	goto	u1560
	goto	l5029
u1560:
	line	261
	
l5107:	
;TEST_FT62F21X_SLEEP.C: 258: {
;TEST_FT62F21X_SLEEP.C: 259: unsigned char i;
;TEST_FT62F21X_SLEEP.C: 261: ReceiveFinish = 0;
	clrf	(_ReceiveFinish)
	line	263
;TEST_FT62F21X_SLEEP.C: 263: for(i = 0;i < 19;i++)
	clrf	(main@i)
	line	265
	
l5113:	
;TEST_FT62F21X_SLEEP.C: 264: {
;TEST_FT62F21X_SLEEP.C: 265: if(ir_key_value[i*2] == IRDataTimer[3])
	clrc
	rlf	(main@i),w
	addlw	low((_ir_key_value-__stringbase))
	movwf	fsr0
	fcall	stringdir
	xorwf	0+(_IRDataTimer)+03h,w
	skipz
	goto	u1571
	goto	u1570
u1571:
	goto	l5133
u1570:
	line	267
	
l5115:	
;TEST_FT62F21X_SLEEP.C: 266: {
;TEST_FT62F21X_SLEEP.C: 267: temp_mode = ir_key_value[i*2 + 1];
	clrc
	rlf	(main@i),w
	addlw	low((_ir_key_value-__stringbase)+01h)
	movwf	fsr0
	fcall	stringdir
	movwf	(_temp_mode)
	line	268
	
l5117:	
;TEST_FT62F21X_SLEEP.C: 268: if(temp_mode >= 0x0D && temp_mode <= 0x10)
	movlw	(0Dh)
	subwf	(_temp_mode),w
	skipc
	goto	u1581
	goto	u1580
u1581:
	goto	l754
u1580:
	
l5119:	
	movlw	(011h)
	subwf	(_temp_mode),w
	skipnc
	goto	u1591
	goto	u1590
u1591:
	goto	l754
u1590:
	line	270
	
l5121:	
;TEST_FT62F21X_SLEEP.C: 269: {
;TEST_FT62F21X_SLEEP.C: 270: set_time_mode_backup = ft_user_pwm_mode;
	movf	(_ft_user_pwm_mode),w
	movwf	(_set_time_mode_backup)
	line	271
	
l754:	
	line	272
;TEST_FT62F21X_SLEEP.C: 271: }
;TEST_FT62F21X_SLEEP.C: 272: if(temp_mode < 0x0B)
	movlw	(0Bh)
	subwf	(_temp_mode),w
	skipnc
	goto	u1601
	goto	u1600
u1601:
	goto	l5129
u1600:
	line	274
	
l5123:	
;TEST_FT62F21X_SLEEP.C: 273: {
;TEST_FT62F21X_SLEEP.C: 274: if(ft_user_pwm_mode != temp_mode)
	movf	(_ft_user_pwm_mode),w
	xorwf	(_temp_mode),w
	skipnz
	goto	u1611
	goto	u1610
u1611:
	goto	l5133
u1610:
	line	276
	
l5125:	
;TEST_FT62F21X_SLEEP.C: 275: {
;TEST_FT62F21X_SLEEP.C: 276: ft_user_pwm_mode = temp_mode;
	movf	(_temp_mode),w
	movwf	(_ft_user_pwm_mode)
	line	277
	
l5127:	
;TEST_FT62F21X_SLEEP.C: 277: PWM_MODE_REFRESH();
	fcall	_PWM_MODE_REFRESH
	goto	l5133
	line	282
	
l5129:	
;TEST_FT62F21X_SLEEP.C: 280: else
;TEST_FT62F21X_SLEEP.C: 281: {
;TEST_FT62F21X_SLEEP.C: 282: ft_user_set_mode = temp_mode;
	movf	(_temp_mode),w
	movwf	(_ft_user_set_mode)
	line	283
	
l5131:	
;TEST_FT62F21X_SLEEP.C: 283: SET_MODE_REFRESH();
	fcall	_SET_MODE_REFRESH
	line	263
	
l5133:	
	incf	(main@i),f
	
l5135:	
	movlw	(013h)
	subwf	(main@i),w
	skipc
	goto	u1621
	goto	u1620
u1621:
	goto	l5113
u1620:
	goto	l5029
	global	start
	ljmp	start
	opt stack 0
psect	maintext
	line	290
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
;;		_PWM1_RED
;;		_PWM1_GREEN
;;		_PWM1_BLUE
;;		_PWM1_WHITE
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
	
l4863:	
;FT_62F21X_pwm.c: 510: if(power_off_flag == 1)
	decf	(_power_off_flag),w
	skipz
	goto	u1281
	goto	u1280
u1281:
	goto	l5009
u1280:
	line	512
	
l4865:	
;FT_62F21X_pwm.c: 511: {
;FT_62F21X_pwm.c: 512: if(ft_user_set_mode != 0x11)
	movf	(_ft_user_set_mode),w
	xorlw	011h
	skipnz
	goto	u1291
	goto	u1290
u1291:
	goto	l5009
u1290:
	goto	l1543
	line	521
	
l4869:	
;FT_62F21X_pwm.c: 521: if(jump_led_rate > 20)
	movlw	(015h)
	subwf	(_jump_led_rate),w
	skipc
	goto	u1301
	goto	u1300
u1301:
	goto	l4873
u1300:
	line	523
	
l4871:	
;FT_62F21X_pwm.c: 522: {
;FT_62F21X_pwm.c: 523: jump_led_rate = jump_led_rate - 20;
	movlw	(0ECh)
	addwf	(_jump_led_rate),f
	line	525
	
l4873:	
;FT_62F21X_pwm.c: 524: }
;FT_62F21X_pwm.c: 525: if(ft_user_pwm_mode != 0)
	movf	(_ft_user_pwm_mode),w
	skipz
	goto	u1310
	goto	l1543
u1310:
	line	527
	
l4875:	
;FT_62F21X_pwm.c: 526: {
;FT_62F21X_pwm.c: 527: P1CDTL=jump_led_rate;
	movf	(_jump_led_rate),w
	movwf	(16)	;volatile
	line	528
;FT_62F21X_pwm.c: 528: P1DDTL=jump_led_rate;
	movf	(_jump_led_rate),w
	movwf	(8)	;volatile
	goto	l1543
	line	534
	
l4877:	
;FT_62F21X_pwm.c: 534: if(jump_led_rate < 100)
	movlw	(064h)
	subwf	(_jump_led_rate),w
	skipnc
	goto	u1321
	goto	u1320
u1321:
	goto	l4881
u1320:
	line	536
	
l4879:	
;FT_62F21X_pwm.c: 535: {
;FT_62F21X_pwm.c: 536: jump_led_rate = jump_led_rate + 20;
	movlw	(014h)
	addwf	(_jump_led_rate),f
	line	538
	
l4881:	
;FT_62F21X_pwm.c: 537: }
;FT_62F21X_pwm.c: 538: if(ft_user_pwm_mode != 0)
	movf	(_ft_user_pwm_mode),w
	skipz
	goto	u1330
	goto	l1543
u1330:
	goto	l4875
	line	547
	
l1554:	
	line	549
	
l4885:	
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
	
l4887:	
;FT_62F21X_pwm.c: 550: auto_power_off_timer_H = auto_power_off_timer_H*0x180000;
	movlw	0
	movwf	(?___lmul+3)
	movlw	018h
	movwf	(?___lmul+2)
	movlw	0
	movwf	(?___lmul+1)
	movlw	0
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
	
l4889:	
;FT_62F21X_pwm.c: 551: P1OE=0B00000000;
	bsf	status, 5	;RP0=1, select bank1
	clrf	(144)^080h	;volatile
	line	552
	
l4891:	
;FT_62F21X_pwm.c: 552: P1BR1=0B00000000;
	bcf	status, 5	;RP0=0, select bank0
	clrf	(25)	;volatile
	line	553
	
l4893:	
;FT_62F21X_pwm.c: 553: DelayMs(50);
	movlw	(032h)
	fcall	_DelayMs
	line	554
;FT_62F21X_pwm.c: 554: P1CDTL=100;
	movlw	(064h)
	bcf	status, 5	;RP0=0, select bank0
	movwf	(16)	;volatile
	line	555
;FT_62F21X_pwm.c: 555: P1DDTL=100;
	movlw	(064h)
	movwf	(8)	;volatile
	line	556
;FT_62F21X_pwm.c: 556: P1OE=0B10100000;
	movlw	(0A0h)
	bsf	status, 5	;RP0=1, select bank1
	movwf	(144)^080h	;volatile
	line	557
;FT_62F21X_pwm.c: 557: P1BR1=0B00001100;
	movlw	(0Ch)
	bcf	status, 5	;RP0=0, select bank0
	movwf	(25)	;volatile
	line	558
	
l4895:	
;FT_62F21X_pwm.c: 558: DelayMs(50);
	movlw	(032h)
	fcall	_DelayMs
	line	559
	
l4897:	
;FT_62F21X_pwm.c: 559: P1OE=0B00000000;
	bsf	status, 5	;RP0=1, select bank1
	clrf	(144)^080h	;volatile
	line	560
	
l4899:	
;FT_62F21X_pwm.c: 560: P1BR1=0B00000000;
	bcf	status, 5	;RP0=0, select bank0
	clrf	(25)	;volatile
	line	561
	
l4901:	
;FT_62F21X_pwm.c: 561: DelayMs(50);
	movlw	(032h)
	fcall	_DelayMs
	line	562
;FT_62F21X_pwm.c: 562: P1CDTL=100;
	movlw	(064h)
	bcf	status, 5	;RP0=0, select bank0
	movwf	(16)	;volatile
	line	563
;FT_62F21X_pwm.c: 563: P1DDTL=100;
	movlw	(064h)
	movwf	(8)	;volatile
	line	564
;FT_62F21X_pwm.c: 564: P1OE=0B10100000;
	movlw	(0A0h)
	bsf	status, 5	;RP0=1, select bank1
	movwf	(144)^080h	;volatile
	line	565
;FT_62F21X_pwm.c: 565: P1BR1=0B00001100;
	movlw	(0Ch)
	bcf	status, 5	;RP0=0, select bank0
	movwf	(25)	;volatile
	line	566
	
l4903:	
;FT_62F21X_pwm.c: 566: DelayMs(50);
	movlw	(032h)
	fcall	_DelayMs
	line	567
	
l4905:	
;FT_62F21X_pwm.c: 567: P1OE=0B00000000;
	bsf	status, 5	;RP0=1, select bank1
	clrf	(144)^080h	;volatile
	line	568
	
l4907:	
;FT_62F21X_pwm.c: 568: P1BR1=0B00000000;
	bcf	status, 5	;RP0=0, select bank0
	clrf	(25)	;volatile
	line	569
	
l4909:	
;FT_62F21X_pwm.c: 569: DelayMs(50);
	movlw	(032h)
	fcall	_DelayMs
	line	570
	
l4911:	
;FT_62F21X_pwm.c: 570: if(set_time_mode_backup == 0x00)
	movf	(_set_time_mode_backup),f
	skipz
	goto	u1341
	goto	u1340
u1341:
	goto	l4927
u1340:
	goto	l4925
	line	575
	
l4915:	
;FT_62F21X_pwm.c: 575: PWM1_RED();
	fcall	_PWM1_RED
	line	576
;FT_62F21X_pwm.c: 576: break;
	goto	l4981
	line	579
	
l4917:	
;FT_62F21X_pwm.c: 579: PWM1_GREEN();
	fcall	_PWM1_GREEN
	line	580
;FT_62F21X_pwm.c: 580: break;
	goto	l4981
	line	583
	
l4919:	
;FT_62F21X_pwm.c: 583: PWM1_BLUE();
	fcall	_PWM1_BLUE
	line	584
;FT_62F21X_pwm.c: 584: break;
	goto	l4981
	line	587
	
l4921:	
;FT_62F21X_pwm.c: 587: PWM1_WHITE();
	fcall	_PWM1_WHITE
	line	588
;FT_62F21X_pwm.c: 588: break;
	goto	l4981
	line	572
	
l4925:	
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
goto l4981
movlw high(S5297)
movwf pclath
	movlw low(S5297)
	addwf fsr,w
	movwf pc
psect	swtext1,local,class=CONST,delta=2
global __pswtext1
__pswtext1:
S5297:
	ljmp	l4915
	ljmp	l4917
	ljmp	l4919
	ljmp	l4921
psect	text641

	line	596
	
l4927:	
;FT_62F21X_pwm.c: 596: else if(set_time_mode_backup == 0x05)
	movf	(_set_time_mode_backup),w
	xorlw	05h
	skipz
	goto	u1351
	goto	u1350
u1351:
	goto	l4951
u1350:
	goto	l4949
	line	602
	
l4931:	
;FT_62F21X_pwm.c: 602: P1OE=0B00000000;
	bsf	status, 5	;RP0=1, select bank1
	clrf	(144)^080h	;volatile
	line	603
	
l4933:	
;FT_62F21X_pwm.c: 603: P1BR1=0B00001000;
	movlw	(08h)
	bcf	status, 5	;RP0=0, select bank0
	movwf	(25)	;volatile
	line	605
;FT_62F21X_pwm.c: 605: break;
	goto	l4981
	line	609
	
l4935:	
;FT_62F21X_pwm.c: 609: P1OE=0B00100000;
	movlw	(020h)
	bsf	status, 5	;RP0=1, select bank1
	movwf	(144)^080h	;volatile
	line	610
	
l4937:	
;FT_62F21X_pwm.c: 610: P1BR1=0B00000000;
	bcf	status, 5	;RP0=0, select bank0
	clrf	(25)	;volatile
	line	612
;FT_62F21X_pwm.c: 612: break;
	goto	l4981
	line	615
	
l4939:	
;FT_62F21X_pwm.c: 615: P1OE=0B10000000;
	movlw	(080h)
	bsf	status, 5	;RP0=1, select bank1
	movwf	(144)^080h	;volatile
	goto	l4937
	line	620
	
l4943:	
;FT_62F21X_pwm.c: 620: P1OE=0B00000000;
	bsf	status, 5	;RP0=1, select bank1
	clrf	(144)^080h	;volatile
	line	621
	
l4945:	
;FT_62F21X_pwm.c: 621: P1BR1=0B00000100;
	movlw	(04h)
	bcf	status, 5	;RP0=0, select bank0
	movwf	(25)	;volatile
	line	622
;FT_62F21X_pwm.c: 622: break;
	goto	l4981
	line	598
	
l4949:	
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
goto l4981
movlw high(S5299)
movwf pclath
	movlw low(S5299)
	addwf fsr,w
	movwf pc
psect	swtext2,local,class=CONST,delta=2
global __pswtext2
__pswtext2:
S5299:
	ljmp	l4931
	ljmp	l4935
	ljmp	l4939
	ljmp	l4943
psect	text641

	line	629
	
l4951:	
;FT_62F21X_pwm.c: 629: else if(set_time_mode_backup == 0x0A)
	movf	(_set_time_mode_backup),w
	xorlw	0Ah
	skipz
	goto	u1361
	goto	u1360
u1361:
	goto	l4975
u1360:
	goto	l4973
	line	634
	
l4955:	
;FT_62F21X_pwm.c: 634: P1OE=0B00100000;
	movlw	(020h)
	bsf	status, 5	;RP0=1, select bank1
	movwf	(144)^080h	;volatile
	line	635
;FT_62F21X_pwm.c: 635: P1BR1=0B00001000;
	movlw	(08h)
	bcf	status, 5	;RP0=0, select bank0
	movwf	(25)	;volatile
	line	636
;FT_62F21X_pwm.c: 636: break;
	goto	l4981
	line	639
	
l4957:	
;FT_62F21X_pwm.c: 639: P1OE=0B10000000;
	movlw	(080h)
	bsf	status, 5	;RP0=1, select bank1
	movwf	(144)^080h	;volatile
	line	640
;FT_62F21X_pwm.c: 640: P1BR1=0B00001000;
	movlw	(08h)
	bcf	status, 5	;RP0=0, select bank0
	movwf	(25)	;volatile
	line	642
;FT_62F21X_pwm.c: 642: break;
	goto	l4981
	line	645
	
l4959:	
;FT_62F21X_pwm.c: 645: P1OE=0B00000000;
	bsf	status, 5	;RP0=1, select bank1
	clrf	(144)^080h	;volatile
	line	646
	
l4961:	
;FT_62F21X_pwm.c: 646: P1BR1=0B00001100;
	movlw	(0Ch)
	bcf	status, 5	;RP0=0, select bank0
	movwf	(25)	;volatile
	line	648
;FT_62F21X_pwm.c: 648: break;
	goto	l4981
	line	651
	
l4963:	
;FT_62F21X_pwm.c: 651: P1OE=0B10100000;
	movlw	(0A0h)
	bsf	status, 5	;RP0=1, select bank1
	movwf	(144)^080h	;volatile
	goto	l4937
	line	656
	
l4967:	
;FT_62F21X_pwm.c: 656: P1OE=0B00100000;
	movlw	(020h)
	bsf	status, 5	;RP0=1, select bank1
	movwf	(144)^080h	;volatile
	line	657
;FT_62F21X_pwm.c: 657: P1BR1=0B00000100;
	movlw	(04h)
	bcf	status, 5	;RP0=0, select bank0
	movwf	(25)	;volatile
	line	658
;FT_62F21X_pwm.c: 658: break;
	goto	l4981
	line	661
	
l4969:	
;FT_62F21X_pwm.c: 661: P1OE=0B10000000;
	movlw	(080h)
	bsf	status, 5	;RP0=1, select bank1
	movwf	(144)^080h	;volatile
	line	662
;FT_62F21X_pwm.c: 662: P1BR1=0B00000100;
	movlw	(04h)
	bcf	status, 5	;RP0=0, select bank0
	movwf	(25)	;volatile
	line	663
;FT_62F21X_pwm.c: 663: break;
	goto	l4981
	line	631
	
l4973:	
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
goto l4981
movlw high(S5301)
movwf pclath
	movlw low(S5301)
	addwf fsr,w
	movwf pc
psect	swtext3,local,class=CONST,delta=2
global __pswtext3
__pswtext3:
S5301:
	ljmp	l4955
	ljmp	l4957
	ljmp	l4959
	ljmp	l4963
	ljmp	l4967
	ljmp	l4969
psect	text641

	line	670
	
l4975:	
;FT_62F21X_pwm.c: 670: else if(set_time_mode_backup != 0xff)
	movf	(_set_time_mode_backup),w
	xorlw	0FFh
	skipnz
	goto	u1371
	goto	u1370
u1371:
	goto	l4981
u1370:
	line	672
	
l4977:	
;FT_62F21X_pwm.c: 671: {
;FT_62F21X_pwm.c: 672: ft_user_pwm_mode = set_time_mode_backup;
	movf	(_set_time_mode_backup),w
	bcf	status, 5	;RP0=0, select bank0
	movwf	(_ft_user_pwm_mode)
	line	673
	
l4979:	
;FT_62F21X_pwm.c: 673: PWM_MODE_REFRESH();
	fcall	_PWM_MODE_REFRESH
	line	675
	
l4981:	
;FT_62F21X_pwm.c: 674: }
;FT_62F21X_pwm.c: 675: power_off_mode_backup = ft_user_pwm_mode;
	bcf	status, 5	;RP0=0, select bank0
	movf	(_ft_user_pwm_mode),w
	movwf	(_power_off_mode_backup)
	line	676
;FT_62F21X_pwm.c: 676: break;
	goto	l1543
	line	679
	
l4983:	
;FT_62F21X_pwm.c: 679: power_off_flag = 0;
	clrf	(_power_off_flag)
	line	680
	
l4985:	
;FT_62F21X_pwm.c: 680: jump_led_rate = 100;
	movlw	(064h)
	movwf	(_jump_led_rate)
	line	681
	
l4987:	
;FT_62F21X_pwm.c: 681: if(power_off_mode_backup < 0x0B)
	movlw	(0Bh)
	subwf	(_power_off_mode_backup),w
	skipnc
	goto	u1381
	goto	u1380
u1381:
	goto	l4993
u1380:
	line	683
	
l4989:	
;FT_62F21X_pwm.c: 682: {
;FT_62F21X_pwm.c: 683: ft_user_pwm_mode = power_off_mode_backup;
	movf	(_power_off_mode_backup),w
	movwf	(_ft_user_pwm_mode)
	line	684
	
l4991:	
;FT_62F21X_pwm.c: 684: PWM_MODE_REFRESH();
	fcall	_PWM_MODE_REFRESH
	line	685
;FT_62F21X_pwm.c: 685: }
	goto	l4997
	line	688
	
l4993:	
;FT_62F21X_pwm.c: 686: else
;FT_62F21X_pwm.c: 687: {
;FT_62F21X_pwm.c: 688: ft_user_pwm_mode = 0;
	clrf	(_ft_user_pwm_mode)
	goto	l4991
	line	691
	
l4997:	
;FT_62F21X_pwm.c: 690: }
;FT_62F21X_pwm.c: 691: power_off_mode_backup = 0xff;
	movlw	(0FFh)
	movwf	(_power_off_mode_backup)
	line	692
;FT_62F21X_pwm.c: 692: break;
	goto	l1543
	line	695
	
l4999:	
;FT_62F21X_pwm.c: 695: P1OE=0B00000000;
	bsf	status, 5	;RP0=1, select bank1
	clrf	(144)^080h	;volatile
	line	696
;FT_62F21X_pwm.c: 696: P1BR1=0B00000000;
	bcf	status, 5	;RP0=0, select bank0
	clrf	(25)	;volatile
	line	697
	
l5001:	
;FT_62F21X_pwm.c: 697: power_off_flag = 1;
	clrf	(_power_off_flag)
	incf	(_power_off_flag),f
	line	698
	
l5003:	
;FT_62F21X_pwm.c: 698: auto_power_off_timer_H = 0;
	clrf	(_auto_power_off_timer_H)
	clrf	(_auto_power_off_timer_H+1)
	clrf	(_auto_power_off_timer_H+2)
	clrf	(_auto_power_off_timer_H+3)
	goto	l4981
	line	518
	
l5009:	
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
goto l1543
	movwf fsr
	movlw	8
	subwf	fsr,w
skipnc
goto l1543
movlw high(S5303)
movwf pclath
	movlw low(S5303)
	addwf fsr,w
	movwf pc
psect	swtext4,local,class=CONST,delta=2
global __pswtext4
__pswtext4:
S5303:
	ljmp	l4869
	ljmp	l4877
	ljmp	l1554
	ljmp	l4885
	ljmp	l4885
	ljmp	l4885
	ljmp	l4983
	ljmp	l4999
psect	text641

	line	708
	
l1543:	
	return
	opt stack 0
GLOBAL	__end_of_SET_MODE_REFRESH
	__end_of_SET_MODE_REFRESH:
;; =============== function _SET_MODE_REFRESH ends ============

	signat	_SET_MODE_REFRESH,88
	global	_PWM_MODE_CHANGE
psect	text642,local,class=CODE,delta=2
global __ptext642
__ptext642:

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
psect	text642
	file	"FT_62F21X_pwm.c"
	line	297
	global	__size_of_PWM_MODE_CHANGE
	__size_of_PWM_MODE_CHANGE	equ	__end_of_PWM_MODE_CHANGE-_PWM_MODE_CHANGE
	
_PWM_MODE_CHANGE:	
	opt	stack 4
; Regs used in _PWM_MODE_CHANGE: [wreg-fsr0h+status,2+status,0+pclath+cstack]
	line	298
	
l4395:	
;FT_62F21X_pwm.c: 298: ft_user_pwm_mode++;
	incf	(_ft_user_pwm_mode),f
	line	299
	
l4397:	
;FT_62F21X_pwm.c: 299: if(ft_user_pwm_mode == 6)
	movf	(_ft_user_pwm_mode),w
	xorlw	06h
	skipz
	goto	u881
	goto	u880
u881:
	goto	l4401
u880:
	line	301
	
l4399:	
;FT_62F21X_pwm.c: 300: {
;FT_62F21X_pwm.c: 301: ft_user_pwm_mode = 0;
	clrf	(_ft_user_pwm_mode)
	line	303
	
l4401:	
;FT_62F21X_pwm.c: 302: }
;FT_62F21X_pwm.c: 303: if(ft_user_pwm_mode > 6)
	movlw	(07h)
	subwf	(_ft_user_pwm_mode),w
	skipc
	goto	u891
	goto	u890
u891:
	goto	l4405
u890:
	line	305
	
l4403:	
;FT_62F21X_pwm.c: 304: {
;FT_62F21X_pwm.c: 305: ft_user_pwm_mode = 1;
	clrf	(_ft_user_pwm_mode)
	incf	(_ft_user_pwm_mode),f
	line	307
	
l4405:	
;FT_62F21X_pwm.c: 306: }
;FT_62F21X_pwm.c: 307: PWM_MODE_REFRESH();
	fcall	_PWM_MODE_REFRESH
	line	309
	
l1492:	
	return
	opt stack 0
GLOBAL	__end_of_PWM_MODE_CHANGE
	__end_of_PWM_MODE_CHANGE:
;; =============== function _PWM_MODE_CHANGE ends ============

	signat	_PWM_MODE_CHANGE,88
	global	_DelayMs
psect	text643,local,class=CODE,delta=2
global __ptext643
__ptext643:

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
;;		_main
;;		_SET_MODE_REFRESH
;; This function uses a non-reentrant model
;;
psect	text643
	file	"FT_62F21X_pwm.c"
	line	378
	global	__size_of_DelayMs
	__size_of_DelayMs	equ	__end_of_DelayMs-_DelayMs
	
_DelayMs:	
	opt	stack 5
; Regs used in _DelayMs: [wreg+status,2+status,0+pclath+cstack]
;DelayMs@Time stored from wreg
	line	380
	movwf	(DelayMs@Time)
	
l4377:	
;FT_62F21X_pwm.c: 379: unsigned char a,b;
;FT_62F21X_pwm.c: 380: for(a=0;a<Time;a++)
	clrf	(DelayMs@a)
	goto	l4393
	line	382
	
l4379:	
;FT_62F21X_pwm.c: 381: {
;FT_62F21X_pwm.c: 382: for(b=0;b<5;b++)
	clrf	(DelayMs@b)
	line	384
	
l4385:	
;FT_62F21X_pwm.c: 383: {
;FT_62F21X_pwm.c: 384: DelayUs(98);
	movlw	(062h)
	fcall	_DelayUs
	line	382
	
l4387:	
	incf	(DelayMs@b),f
	
l4389:	
	movlw	(05h)
	subwf	(DelayMs@b),w
	skipc
	goto	u861
	goto	u860
u861:
	goto	l4385
u860:
	line	380
	
l4391:	
	incf	(DelayMs@a),f
	
l4393:	
	movf	(DelayMs@Time),w
	subwf	(DelayMs@a),w
	skipc
	goto	u871
	goto	u870
u871:
	goto	l4379
u870:
	line	387
	
l1518:	
	return
	opt stack 0
GLOBAL	__end_of_DelayMs
	__end_of_DelayMs:
;; =============== function _DelayMs ends ============

	signat	_DelayMs,4216
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
	opt	stack 5
; Regs used in _DelayUs: [wreg+status,2+status,0]
;DelayUs@Time stored from wreg
	line	366
	movwf	(DelayUs@Time)
	
l4371:	
;FT_62F21X_pwm.c: 365: unsigned char a;
;FT_62F21X_pwm.c: 366: for(a=0;a<Time;a++)
	clrf	(DelayUs@a)
	goto	l4375
	line	367
	
l1508:	
	line	368
;FT_62F21X_pwm.c: 367: {
;FT_62F21X_pwm.c: 368: _nop();
	nop
	line	366
	
l4373:	
	incf	(DelayUs@a),f
	
l4375:	
	movf	(DelayUs@Time),w
	subwf	(DelayUs@a),w
	skipc
	goto	u851
	goto	u850
u851:
	goto	l1508
u850:
	line	370
	
l1510:	
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
	
l4309:	
;FT_62F21X_pwm.c: 411: reset_led_status();
	fcall	_reset_led_status
	line	413
	
l4311:	
;FT_62F21X_pwm.c: 413: if(ft_user_pwm_mode != 0)
	movf	(_ft_user_pwm_mode),w
	skipz
	goto	u830
	goto	l4315
u830:
	line	415
	
l4313:	
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
	goto	l4317
	line	420
	
l4315:	
;FT_62F21X_pwm.c: 418: else
;FT_62F21X_pwm.c: 419: {
;FT_62F21X_pwm.c: 420: P1CDTL=0;
	clrf	(16)	;volatile
	line	421
;FT_62F21X_pwm.c: 421: P1DDTL=0;
	clrf	(8)	;volatile
	line	424
	
l4317:	
;FT_62F21X_pwm.c: 422: }
;FT_62F21X_pwm.c: 424: if(power_off_flag == 1)
	decf	(_power_off_flag),w
	skipz
	goto	u841
	goto	u840
u841:
	goto	l4363
u840:
	goto	l1524
	line	432
	
l4321:	
;FT_62F21X_pwm.c: 432: pwm_rate_value = 0;
	clrf	(_pwm_rate_value)
	line	433
;FT_62F21X_pwm.c: 433: pwm_colour_value = 0;
	clrf	(_pwm_colour_value)
	line	434
	
l4323:	
;FT_62F21X_pwm.c: 434: PWM1_RED();
	fcall	_PWM1_RED
	line	436
;FT_62F21X_pwm.c: 436: break;
	goto	l1524
	line	440
	
l4325:	
;FT_62F21X_pwm.c: 440: P1OE=0B00000000;
	bsf	status, 5	;RP0=1, select bank1
	clrf	(144)^080h	;volatile
	line	441
	
l4327:	
;FT_62F21X_pwm.c: 441: P1BR1=0B00001000;
	movlw	(08h)
	bcf	status, 5	;RP0=0, select bank0
	movwf	(25)	;volatile
	line	443
;FT_62F21X_pwm.c: 443: break;
	goto	l1524
	line	447
	
l4329:	
;FT_62F21X_pwm.c: 447: P1OE=0B00100000;
	movlw	(020h)
	bsf	status, 5	;RP0=1, select bank1
	movwf	(144)^080h	;volatile
	line	448
	
l4331:	
;FT_62F21X_pwm.c: 448: P1BR1=0B00000000;
	bcf	status, 5	;RP0=0, select bank0
	clrf	(25)	;volatile
	line	450
;FT_62F21X_pwm.c: 450: break;
	goto	l1524
	line	453
	
l4333:	
;FT_62F21X_pwm.c: 453: P1OE=0B10000000;
	movlw	(080h)
	bsf	status, 5	;RP0=1, select bank1
	movwf	(144)^080h	;volatile
	goto	l4331
	line	458
	
l4337:	
;FT_62F21X_pwm.c: 458: P1OE=0B00000000;
	bsf	status, 5	;RP0=1, select bank1
	clrf	(144)^080h	;volatile
	line	459
	
l4339:	
;FT_62F21X_pwm.c: 459: P1BR1=0B00000100;
	movlw	(04h)
	bcf	status, 5	;RP0=0, select bank0
	movwf	(25)	;volatile
	line	460
;FT_62F21X_pwm.c: 460: break;
	goto	l1524
	line	463
	
l4341:	
;FT_62F21X_pwm.c: 463: pwm_colour_value = 0;
	clrf	(_pwm_colour_value)
	line	465
;FT_62F21X_pwm.c: 465: P1OE=0B00000000;
	bsf	status, 5	;RP0=1, select bank1
	clrf	(144)^080h	;volatile
	goto	l4327
	line	472
	
l4345:	
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
	goto	l1524
	line	479
	
l4347:	
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
	goto	l1524
	line	486
	
l4349:	
;FT_62F21X_pwm.c: 486: P1OE=0B00000000;
	bsf	status, 5	;RP0=1, select bank1
	clrf	(144)^080h	;volatile
	line	487
	
l4351:	
;FT_62F21X_pwm.c: 487: P1BR1=0B00001100;
	movlw	(0Ch)
	bcf	status, 5	;RP0=0, select bank0
	movwf	(25)	;volatile
	line	488
;FT_62F21X_pwm.c: 488: break;
	goto	l1524
	line	491
	
l4353:	
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
	goto	l1524
	line	496
	
l4355:	
;FT_62F21X_pwm.c: 496: pwm_colour_value = 0;
	clrf	(_pwm_colour_value)
	line	497
	
l4357:	
;FT_62F21X_pwm.c: 497: P1OE=0B00100000;
	movlw	(020h)
	bsf	status, 5	;RP0=1, select bank1
	movwf	(144)^080h	;volatile
	goto	l4327
	line	429
	
l4363:	
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
goto l1524
movlw high(S5305)
movwf pclath
	movlw low(S5305)
	addwf fsr,w
	movwf pc
psect	swtext5,local,class=CONST,delta=2
global __pswtext5
__pswtext5:
S5305:
	ljmp	l4321
	ljmp	l4325
	ljmp	l4329
	ljmp	l4333
	ljmp	l4337
	ljmp	l4341
	ljmp	l4345
	ljmp	l4347
	ljmp	l4349
	ljmp	l4353
	ljmp	l4355
psect	text645

	line	506
	
l1524:	
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
	
l4281:	
;FT_62F21X_pwm.c: 313: pwm_colour_value++;
	incf	(_pwm_colour_value),f
	line	314
	
l4283:	
;FT_62F21X_pwm.c: 314: pwm_colour_value = pwm_colour_value%6;
	movlw	(06h)
	movwf	(?___lbmod)
	movf	(_pwm_colour_value),w
	fcall	___lbmod
	movwf	(_pwm_colour_value)
	line	316
;FT_62F21X_pwm.c: 316: switch(pwm_colour_value)
	goto	l4303
	line	319
	
l4285:	
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
	goto	l1504
	line	324
	
l4287:	
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
	goto	l1504
	line	330
	
l4289:	
;FT_62F21X_pwm.c: 330: P1OE=0B00000000;
	bsf	status, 5	;RP0=1, select bank1
	clrf	(144)^080h	;volatile
	line	331
	
l4291:	
;FT_62F21X_pwm.c: 331: P1BR1=0B00001100;
	movlw	(0Ch)
	bcf	status, 5	;RP0=0, select bank0
	movwf	(25)	;volatile
	line	333
;FT_62F21X_pwm.c: 333: break;
	goto	l1504
	line	336
	
l4293:	
;FT_62F21X_pwm.c: 336: P1OE=0B10100000;
	movlw	(0A0h)
	bsf	status, 5	;RP0=1, select bank1
	movwf	(144)^080h	;volatile
	line	337
	
l4295:	
;FT_62F21X_pwm.c: 337: P1BR1=0B00000000;
	bcf	status, 5	;RP0=0, select bank0
	clrf	(25)	;volatile
	line	338
;FT_62F21X_pwm.c: 338: break;
	goto	l1504
	line	341
	
l4297:	
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
	goto	l1504
	line	346
	
l4299:	
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
	goto	l1504
	line	316
	
l4303:	
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
goto l1504
movlw high(S5307)
movwf pclath
	movlw low(S5307)
	addwf fsr,w
	movwf pc
psect	swtext6,local,class=CONST,delta=2
global __pswtext6
__pswtext6:
S5307:
	ljmp	l4285
	ljmp	l4287
	ljmp	l4289
	ljmp	l4293
	ljmp	l4297
	ljmp	l4299
psect	text646

	line	354
	
l1504:	
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
	
l4235:	
;FT_62F21X_pwm.c: 196: unsigned char pwm_value;
;FT_62F21X_pwm.c: 198: if(pwm_rate_value >= 200)
	movlw	(0C8h)
	subwf	(_pwm_rate_value),w
	skipc
	goto	u811
	goto	u810
u811:
	goto	l4255
u810:
	line	200
	
l4237:	
;FT_62F21X_pwm.c: 199: {
;FT_62F21X_pwm.c: 200: pwm_rate_value = 0;
	clrf	(_pwm_rate_value)
	line	201
	
l4239:	
;FT_62F21X_pwm.c: 201: pwm_colour_value++;
	incf	(_pwm_colour_value),f
	line	202
	
l4241:	
;FT_62F21X_pwm.c: 202: pwm_colour_value = pwm_colour_value%4;
	movlw	(03h)
	andwf	(_pwm_colour_value),f
	line	203
;FT_62F21X_pwm.c: 203: switch(pwm_colour_value)
	goto	l4253
	line	206
	
l4243:	
;FT_62F21X_pwm.c: 206: PWM1_RED();
	fcall	_PWM1_RED
	line	207
;FT_62F21X_pwm.c: 207: break;
	goto	l4255
	line	210
	
l4245:	
;FT_62F21X_pwm.c: 210: PWM1_GREEN();
	fcall	_PWM1_GREEN
	line	211
;FT_62F21X_pwm.c: 211: break;
	goto	l4255
	line	214
	
l4247:	
;FT_62F21X_pwm.c: 214: PWM1_BLUE();
	fcall	_PWM1_BLUE
	line	215
;FT_62F21X_pwm.c: 215: break;
	goto	l4255
	line	218
	
l4249:	
;FT_62F21X_pwm.c: 218: PWM1_WHITE();
	fcall	_PWM1_WHITE
	line	219
;FT_62F21X_pwm.c: 219: break;
	goto	l4255
	line	203
	
l4253:	
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
goto l4255
movlw high(S5309)
movwf pclath
	movlw low(S5309)
	addwf fsr,w
	movwf pc
psect	swtext7,local,class=CONST,delta=2
global __pswtext7
__pswtext7:
S5309:
	ljmp	l4243
	ljmp	l4245
	ljmp	l4247
	ljmp	l4249
psect	text647

	line	226
	
l4255:	
;FT_62F21X_pwm.c: 225: }
;FT_62F21X_pwm.c: 226: if(pwm_rate_value <=100)
	movlw	(065h)
	subwf	(_pwm_rate_value),w
	skipnc
	goto	u821
	goto	u820
u821:
	goto	l4259
u820:
	line	228
	
l4257:	
;FT_62F21X_pwm.c: 227: {
;FT_62F21X_pwm.c: 228: pwm_value = pwm_rate_value;
	movf	(_pwm_rate_value),w
	movwf	(PWM1_RATE_CHANGE@pwm_value)
	line	229
;FT_62F21X_pwm.c: 229: }
	goto	l4271
	line	232
	
l4259:	
;FT_62F21X_pwm.c: 230: else
;FT_62F21X_pwm.c: 231: {
;FT_62F21X_pwm.c: 232: pwm_value = 200 - pwm_rate_value;
	movf	(_pwm_rate_value),w
	sublw	0C8h
	movwf	(PWM1_RATE_CHANGE@pwm_value)
	goto	l4271
	line	238
	
l4261:	
;FT_62F21X_pwm.c: 238: P1CDTL = pwm_value;
	movf	(PWM1_RATE_CHANGE@pwm_value),w
	movwf	(16)	;volatile
	line	239
;FT_62F21X_pwm.c: 239: break;
	goto	l1477
	line	242
	
l4263:	
;FT_62F21X_pwm.c: 242: P1DDTL = pwm_value;
	movf	(PWM1_RATE_CHANGE@pwm_value),w
	movwf	(8)	;volatile
	line	243
;FT_62F21X_pwm.c: 243: break;
	goto	l1477
	line	235
	
l4271:	
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
goto l1477
movlw high(S5311)
movwf pclath
	movlw low(S5311)
	addwf fsr,w
	movwf pc
psect	swtext8,local,class=CONST,delta=2
global __pswtext8
__pswtext8:
S5311:
	ljmp	l4261
	ljmp	l4263
	ljmp	l4261
	ljmp	l4263
psect	text647

	line	258
	
l1477:	
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
	
l4211:	
;FT_62F21X_pwm.c: 34: T2CON0=0B00000001;
	movlw	(01h)
	bcf	status, 5	;RP0=0, select bank0
	movwf	(18)	;volatile
	line	40
	
l4213:	
;FT_62F21X_pwm.c: 40: T2CON1=0B00000000;
	bsf	status, 5	;RP0=1, select bank1
	clrf	(158)^080h	;volatile
	line	45
	
l4215:	
;FT_62F21X_pwm.c: 45: TMR2H=0;
	bcf	status, 5	;RP0=0, select bank0
	clrf	(19)	;volatile
	line	46
;FT_62F21X_pwm.c: 46: TMR2L=100;
	movlw	(064h)
	movwf	(17)	;volatile
	line	48
	
l4217:	
;FT_62F21X_pwm.c: 48: PR2H=0;
	bsf	status, 5	;RP0=1, select bank1
	clrf	(146)^080h	;volatile
	line	49
	
l4219:	
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
	
l4221:	
;FT_62F21X_pwm.c: 78: PWM1_RED();
	fcall	_PWM1_RED
	line	79
	
l4223:	
;FT_62F21X_pwm.c: 79: pwm_colour_value = 0;
	clrf	(_pwm_colour_value)
	line	81
	
l4225:	
;FT_62F21X_pwm.c: 81: TMR2IF=0;
	bcf	(97/8),(97)&7
	line	82
	
l4227:	
;FT_62F21X_pwm.c: 82: TMR2IE=1;
	bsf	status, 5	;RP0=1, select bank1
	bsf	(1121/8)^080h,(1121)&7
	line	83
	
l4229:	
;FT_62F21X_pwm.c: 83: TMR2ON=1;
	bcf	status, 5	;RP0=0, select bank0
	bsf	(146/8),(146)&7
	line	84
	
l4231:	
;FT_62F21X_pwm.c: 84: PEIE=1;
	bsf	(94/8),(94)&7
	line	85
	
l4233:	
;FT_62F21X_pwm.c: 85: GIE=1;
	bsf	(95/8),(95)&7
	line	87
	
l1445:	
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
	
l4851:	
	clrf	(___lmul@product)
	clrf	(___lmul@product+1)
	clrf	(___lmul@product+2)
	clrf	(___lmul@product+3)
	line	6
	
l2902:	
	line	7
	btfss	(___lmul@multiplier),(0)&7
	goto	u1251
	goto	u1250
u1251:
	goto	l4855
u1250:
	line	8
	
l4853:	
	movf	(___lmul@multiplicand),w
	addwf	(___lmul@product),f
	movf	(___lmul@multiplicand+1),w
	clrz
	skipnc
	addlw	1
	skipnz
	goto	u1261
	addwf	(___lmul@product+1),f
u1261:
	movf	(___lmul@multiplicand+2),w
	clrz
	skipnc
	addlw	1
	skipnz
	goto	u1262
	addwf	(___lmul@product+2),f
u1262:
	movf	(___lmul@multiplicand+3),w
	clrz
	skipnc
	addlw	1
	skipnz
	goto	u1263
	addwf	(___lmul@product+3),f
u1263:

	line	9
	
l4855:	
	clrc
	rlf	(___lmul@multiplicand),f
	rlf	(___lmul@multiplicand+1),f
	rlf	(___lmul@multiplicand+2),f
	rlf	(___lmul@multiplicand+3),f
	line	10
	
l4857:	
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
	goto	u1271
	goto	u1270
u1271:
	goto	l2902
u1270:
	line	12
	
l4859:	
	movf	(___lmul@product+3),w
	movwf	(?___lmul+3)
	movf	(___lmul@product+2),w
	movwf	(?___lmul+2)
	movf	(___lmul@product+1),w
	movwf	(?___lmul+1)
	movf	(___lmul@product),w
	movwf	(?___lmul)

	line	13
	
l2905:	
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
	
l4181:	
	movlw	(08h)
	movwf	(___lbmod@counter)
	line	10
	
l4183:	
	clrf	(___lbmod@rem)
	line	12
	
l4185:	
	movf	(___lbmod@dividend),w
	movwf	(??___lbmod+0)+0
	movlw	07h
u755:
	clrc
	rrf	(??___lbmod+0)+0,f
	addlw	-1
	skipz
	goto	u755
	clrc
	rlf	(___lbmod@rem),w
	iorwf	0+(??___lbmod+0)+0,w
	movwf	(___lbmod@rem)
	line	13
	
l4187:	
	clrc
	rlf	(___lbmod@dividend),f
	line	14
	
l4189:	
	movf	(___lbmod@divisor),w
	subwf	(___lbmod@rem),w
	skipc
	goto	u761
	goto	u760
u761:
	goto	l4193
u760:
	line	15
	
l4191:	
	movf	(___lbmod@divisor),w
	subwf	(___lbmod@rem),f
	line	16
	
l4193:	
	decfsz	(___lbmod@counter),f
	goto	u771
	goto	u770
u771:
	goto	l4185
u770:
	line	17
	
l4195:	
	movf	(___lbmod@rem),w
	line	18
	
l2866:	
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
;;		On entry : 0/0
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
;;		_SET_MODE_REFRESH
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
	
l4177:	
;FT_62F21X_pwm.c: 177: P1CDTL=0;
	bcf	status, 5	;RP0=0, select bank0
	clrf	(16)	;volatile
	line	178
;FT_62F21X_pwm.c: 178: P1DDTL=0;
	clrf	(8)	;volatile
	line	180
;FT_62F21X_pwm.c: 180: P1OE=0B00000000;
	bsf	status, 5	;RP0=1, select bank1
	clrf	(144)^080h	;volatile
	line	188
	
l4179:	
;FT_62F21X_pwm.c: 188: P1BR1=0B00000100;
	movlw	(04h)
	bcf	status, 5	;RP0=0, select bank0
	movwf	(25)	;volatile
	line	192
	
l1457:	
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
;;		On entry : 0/0
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
;;		_SET_MODE_REFRESH
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
	
l4171:	
;FT_62F21X_pwm.c: 158: P1CDTL=0;
	bcf	status, 5	;RP0=0, select bank0
	clrf	(16)	;volatile
	line	159
;FT_62F21X_pwm.c: 159: P1DDTL=0;
	clrf	(8)	;volatile
	line	161
	
l4173:	
;FT_62F21X_pwm.c: 161: P1OE=0B10000000;
	movlw	(080h)
	bsf	status, 5	;RP0=1, select bank1
	movwf	(144)^080h	;volatile
	line	169
	
l4175:	
;FT_62F21X_pwm.c: 169: P1BR1=0B00000000;
	bcf	status, 5	;RP0=0, select bank0
	clrf	(25)	;volatile
	line	173
	
l1454:	
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
;;		On entry : 0/0
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
;;		_SET_MODE_REFRESH
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
	
l4165:	
;FT_62F21X_pwm.c: 126: P1CDTL=0;
	bcf	status, 5	;RP0=0, select bank0
	clrf	(16)	;volatile
	line	127
;FT_62F21X_pwm.c: 127: P1DDTL=0;
	clrf	(8)	;volatile
	line	129
	
l4167:	
;FT_62F21X_pwm.c: 129: P1OE=0B00100000;
	movlw	(020h)
	bsf	status, 5	;RP0=1, select bank1
	movwf	(144)^080h	;volatile
	line	137
	
l4169:	
;FT_62F21X_pwm.c: 137: P1BR1=0B00000000;
	bcf	status, 5	;RP0=0, select bank0
	clrf	(25)	;volatile
	line	154
	
l1451:	
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
;;		On entry : 0/0
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
;;		_SET_MODE_REFRESH
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
	
l4161:	
;FT_62F21X_pwm.c: 93: P1CDTL=0;
	bcf	status, 5	;RP0=0, select bank0
	clrf	(16)	;volatile
	line	94
;FT_62F21X_pwm.c: 94: P1DDTL=0;
	clrf	(8)	;volatile
	line	96
;FT_62F21X_pwm.c: 96: P1OE=0B00000000;
	bsf	status, 5	;RP0=1, select bank1
	clrf	(144)^080h	;volatile
	line	104
	
l4163:	
;FT_62F21X_pwm.c: 104: P1BR1=0B00001000;
	movlw	(08h)
	bcf	status, 5	;RP0=0, select bank0
	movwf	(25)	;volatile
	line	121
	
l1448:	
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
	
l4133:	
;FT_62F21X_pwm.c: 262: pwm_colour_value++;
	incf	(_pwm_colour_value),f
	line	263
	
l4135:	
;FT_62F21X_pwm.c: 263: pwm_colour_value = pwm_colour_value%4;
	movlw	(03h)
	andwf	(_pwm_colour_value),f
	line	264
;FT_62F21X_pwm.c: 264: switch(pwm_colour_value)
	goto	l4155
	line	268
	
l4137:	
;FT_62F21X_pwm.c: 268: P1OE=0B00000000;
	bsf	status, 5	;RP0=1, select bank1
	clrf	(144)^080h	;volatile
	line	269
	
l4139:	
;FT_62F21X_pwm.c: 269: P1BR1=0B00001000;
	movlw	(08h)
	bcf	status, 5	;RP0=0, select bank0
	movwf	(25)	;volatile
	line	271
;FT_62F21X_pwm.c: 271: break;
	goto	l1487
	line	275
	
l4141:	
;FT_62F21X_pwm.c: 275: P1OE=0B00100000;
	movlw	(020h)
	bsf	status, 5	;RP0=1, select bank1
	movwf	(144)^080h	;volatile
	line	276
	
l4143:	
;FT_62F21X_pwm.c: 276: P1BR1=0B00000000;
	bcf	status, 5	;RP0=0, select bank0
	clrf	(25)	;volatile
	line	278
;FT_62F21X_pwm.c: 278: break;
	goto	l1487
	line	281
	
l4145:	
;FT_62F21X_pwm.c: 281: P1OE=0B10000000;
	movlw	(080h)
	bsf	status, 5	;RP0=1, select bank1
	movwf	(144)^080h	;volatile
	goto	l4143
	line	286
	
l4149:	
;FT_62F21X_pwm.c: 286: P1OE=0B00000000;
	bsf	status, 5	;RP0=1, select bank1
	clrf	(144)^080h	;volatile
	line	287
	
l4151:	
;FT_62F21X_pwm.c: 287: P1BR1=0B00000100;
	movlw	(04h)
	bcf	status, 5	;RP0=0, select bank0
	movwf	(25)	;volatile
	line	288
;FT_62F21X_pwm.c: 288: break;
	goto	l1487
	line	264
	
l4155:	
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
goto l1487
movlw high(S5313)
movwf pclath
	movlw low(S5313)
	addwf fsr,w
	movwf pc
psect	swtext9,local,class=CONST,delta=2
global __pswtext9
__pswtext9:
S5313:
	ljmp	l4137
	ljmp	l4141
	ljmp	l4145
	ljmp	l4149
psect	text655

	line	294
	
l1487:	
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
	
l4123:	
;FT_62F21x_IR.c: 38: TRISA3 =1;
	bsf	status, 5	;RP0=1, select bank1
	bsf	(1067/8)^080h,(1067)&7
	line	39
	
l4125:	
;FT_62F21x_IR.c: 39: ReadAPin = PORTA;
	bcf	status, 5	;RP0=0, select bank0
	movf	(5),w	;volatile
	line	40
	
l4127:	
;FT_62F21x_IR.c: 40: PAIF =0;
	bcf	(88/8),(88)&7
	line	41
	
l4129:	
;FT_62F21x_IR.c: 41: IOCA3 =1;
	bsf	status, 5	;RP0=1, select bank1
	bsf	(1203/8)^080h,(1203)&7
	line	42
	
l4131:	
;FT_62F21x_IR.c: 42: PAIE =1;
	bsf	(91/8),(91)&7
	line	43
	
l2266:	
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
	
l4119:	
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
	
l4121:	
;FT_62F21x_IR.c: 28: T0IF = 0;
	bcf	(90/8),(90)&7
	line	29
	
l2263:	
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
	
l4117:	
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
	
l4109:	
;TEST_FT62F21X_SLEEP.C: 134: OSCCON = 0X00|0X70|0X00;
	movlw	(070h)
	bsf	status, 5	;RP0=1, select bank1
	movwf	(143)^080h	;volatile
	line	137
	
l4111:	
;TEST_FT62F21X_SLEEP.C: 137: INTCON = 0;
	clrf	(11)	;volatile
	line	139
	
l4113:	
;TEST_FT62F21X_SLEEP.C: 139: PORTA = 0B00000000;
	bcf	status, 5	;RP0=0, select bank0
	clrf	(5)	;volatile
	line	140
;TEST_FT62F21X_SLEEP.C: 140: TRISA = 0B00010000;
	movlw	(010h)
	bsf	status, 5	;RP0=1, select bank1
	movwf	(133)^080h	;volatile
	line	141
;TEST_FT62F21X_SLEEP.C: 141: WPUA = 0B00010000;
	movlw	(010h)
	movwf	(149)^080h	;volatile
	line	143
;TEST_FT62F21X_SLEEP.C: 143: OPTION = 0B00001000;
	movlw	(08h)
	movwf	(129)^080h	;volatile
	line	145
	
l4115:	
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
	
i1l4047:	
;TEST_FT62F21X_SLEEP.C: 64: if(TMR2IE && TMR2IF)
	bsf	status, 5	;RP0=1, select bank1
	btfss	(1121/8)^080h,(1121)&7
	goto	u63_21
	goto	u63_20
u63_21:
	goto	i1l4055
u63_20:
	
i1l4049:	
	bcf	status, 5	;RP0=0, select bank0
	btfss	(97/8),(97)&7
	goto	u64_21
	goto	u64_20
u64_21:
	goto	i1l4055
u64_20:
	line	66
	
i1l4051:	
;TEST_FT62F21X_SLEEP.C: 65: {
;TEST_FT62F21X_SLEEP.C: 66: TMR2IF = 0;
	bcf	(97/8),(97)&7
	line	67
	
i1l4053:	
;TEST_FT62F21X_SLEEP.C: 67: time_15ms_cnt++;
	incf	(_time_15ms_cnt),f
	line	68
;TEST_FT62F21X_SLEEP.C: 68: auto_power_off_timer_L++;
	incf	(_auto_power_off_timer_L),f
	line	74
	
i1l4055:	
;TEST_FT62F21X_SLEEP.C: 70: }
;TEST_FT62F21X_SLEEP.C: 74: if(T0IE && T0IF)
	btfss	(93/8),(93)&7
	goto	u65_21
	goto	u65_20
u65_21:
	goto	i1l4071
u65_20:
	
i1l4057:	
	btfss	(90/8),(90)&7
	goto	u66_21
	goto	u66_20
u66_21:
	goto	i1l4071
u66_20:
	line	76
	
i1l4059:	
;TEST_FT62F21X_SLEEP.C: 75: {
;TEST_FT62F21X_SLEEP.C: 76: TMR0 = 140;
	movlw	(08Ch)
	bcf	status, 5	;RP0=0, select bank0
	movwf	(1)	;volatile
	line	78
	
i1l4061:	
;TEST_FT62F21X_SLEEP.C: 78: T0IF = 0;
	bcf	(90/8),(90)&7
	line	79
	
i1l4063:	
;TEST_FT62F21X_SLEEP.C: 79: IRbitTime++;
	incf	(_IRbitTime),f
	line	80
	
i1l4065:	
;TEST_FT62F21X_SLEEP.C: 80: if(IRbitTime > 50)
	movlw	(033h)
	subwf	(_IRbitTime),w
	skipc
	goto	u67_21
	goto	u67_20
u67_21:
	goto	i1l4071
u67_20:
	line	82
	
i1l4067:	
;TEST_FT62F21X_SLEEP.C: 81: {
;TEST_FT62F21X_SLEEP.C: 82: T0IE = 0;
	bcf	(93/8),(93)&7
	line	83
	
i1l4069:	
;TEST_FT62F21X_SLEEP.C: 83: IRbitTime = 0;
	clrf	(_IRbitTime)
	line	88
	
i1l4071:	
;TEST_FT62F21X_SLEEP.C: 84: }
;TEST_FT62F21X_SLEEP.C: 85: }
;TEST_FT62F21X_SLEEP.C: 88: if(PAIE && PAIF)
	btfss	(91/8),(91)&7
	goto	u68_21
	goto	u68_20
u68_21:
	goto	i1l723
u68_20:
	
i1l4073:	
	btfss	(88/8),(88)&7
	goto	u69_21
	goto	u69_20
u69_21:
	goto	i1l723
u69_20:
	line	90
	
i1l4075:	
;TEST_FT62F21X_SLEEP.C: 89: {
;TEST_FT62F21X_SLEEP.C: 90: ReadAPin = PORTA;
	bcf	status, 5	;RP0=0, select bank0
	movf	(5),w	;volatile
	line	91
	
i1l4077:	
;TEST_FT62F21X_SLEEP.C: 91: PAIF = 0;
	bcf	(88/8),(88)&7
	line	92
	
i1l4079:	
;TEST_FT62F21X_SLEEP.C: 92: if(RA3 == 0)
	btfsc	(43/8),(43)&7
	goto	u70_21
	goto	u70_20
u70_21:
	goto	i1l723
u70_20:
	line	94
	
i1l4081:	
;TEST_FT62F21X_SLEEP.C: 93: {
;TEST_FT62F21X_SLEEP.C: 94: T0IE = 1;
	bsf	(93/8),(93)&7
	line	95
	
i1l4083:	
;TEST_FT62F21X_SLEEP.C: 95: if(IRbitTime > 21)
	movlw	(016h)
	subwf	(_IRbitTime),w
	skipc
	goto	u71_21
	goto	u71_20
u71_21:
	goto	i1l4087
u71_20:
	line	97
	
i1l4085:	
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
	goto	i1l4091
	line	104
	
i1l4087:	
;TEST_FT62F21X_SLEEP.C: 104: else if(IRbitTime > 3)
	movlw	(04h)
	subwf	(_IRbitTime),w
	skipc
	goto	u72_21
	goto	u72_20
u72_21:
	goto	i1l4091
u72_20:
	line	106
	
i1l4089:	
;TEST_FT62F21X_SLEEP.C: 105: {
;TEST_FT62F21X_SLEEP.C: 106: IRDataTimer[IRbitNum-1] |= bitdata;
	movf	(_IRbitNum),w
	addlw	_IRDataTimer+-1&0ffh
	movwf	fsr0
	movf	(_bitdata),w
	bcf	status, 7	;select IRP bank0
	iorwf	indf,f
	line	108
	
i1l4091:	
;TEST_FT62F21X_SLEEP.C: 107: }
;TEST_FT62F21X_SLEEP.C: 108: IRbitTime = 0;
	clrf	(_IRbitTime)
	line	109
	
i1l4093:	
;TEST_FT62F21X_SLEEP.C: 109: bitdata<<=1;
	clrc
	rlf	(_bitdata),f
	line	110
	
i1l4095:	
;TEST_FT62F21X_SLEEP.C: 110: if(bitdata == 0)
	movf	(_bitdata),f
	skipz
	goto	u73_21
	goto	u73_20
u73_21:
	goto	i1l4101
u73_20:
	line	112
	
i1l4097:	
;TEST_FT62F21X_SLEEP.C: 111: {
;TEST_FT62F21X_SLEEP.C: 112: bitdata = 0x01;
	clrf	(_bitdata)
	incf	(_bitdata),f
	line	113
	
i1l4099:	
;TEST_FT62F21X_SLEEP.C: 113: IRbitNum++;
	incf	(_IRbitNum),f
	line	115
	
i1l4101:	
;TEST_FT62F21X_SLEEP.C: 114: }
;TEST_FT62F21X_SLEEP.C: 115: if(IRbitNum > 4)
	movlw	(05h)
	subwf	(_IRbitNum),w
	skipc
	goto	u74_21
	goto	u74_20
u74_21:
	goto	i1l723
u74_20:
	line	117
	
i1l4103:	
;TEST_FT62F21X_SLEEP.C: 116: {
;TEST_FT62F21X_SLEEP.C: 117: IRbitNum = 0;
	clrf	(_IRbitNum)
	line	118
	
i1l4105:	
;TEST_FT62F21X_SLEEP.C: 118: T0IE = 0;
	bcf	(93/8),(93)&7
	line	119
	
i1l4107:	
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
