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
	FNCALL	_main,_reset_led_status
	FNCALL	_main,_PWM_MODE_CHANGE
	FNCALL	_main,_PWM_MODE_REFRESH
	FNCALL	_main,_SET_MODE_REFRESH
	FNCALL	_SET_MODE_REFRESH,_DelayMs
	FNCALL	_SET_MODE_REFRESH,_PWM_MODE_REFRESH
	FNCALL	_DelayMs,_DelayUs
	FNCALL	_PWM_MODE_CHANGE,___lbmod
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
	line	28
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
	global	_IRbitNum
	global	_IRbitTime
	global	_ReceiveFinish
	global	_ft_user_set_mode
	global	_key_release
	global	_power_off_flag
	global	_time_15ms_cnt
	global	_time_2s_cnt
	global	_ft_user_pwm_mode
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
_ft_user_pwm_mode:
       ds      1

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

_IRbitNum:
       ds      1

_IRbitTime:
       ds      1

_ReceiveFinish:
       ds      1

_ft_user_set_mode:
       ds      1

_key_release:
       ds      1

_power_off_flag:
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
	clrf	((__pbssCOMMON)+2)&07Fh
; Clear objects allocated to BANK0
psect cinit,class=CODE,delta=2
	bcf	status, 7	;select IRP bank0
	movlw	low(__pbssBANK0)
	movwf	fsr
	movlw	low((__pbssBANK0)+0Ch)
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
	global	?_PWM_MODE_CHANGE
?_PWM_MODE_CHANGE:	; 0 bytes @ 0x0
	global	?_PWM_MODE_REFRESH
?_PWM_MODE_REFRESH:	; 0 bytes @ 0x0
	global	?_SET_MODE_REFRESH
?_SET_MODE_REFRESH:	; 0 bytes @ 0x0
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
	global	?___lbmod
?___lbmod:	; 1 bytes @ 0x3
	global	PWM1_RATE_CHANGE@pwm_value
PWM1_RATE_CHANGE@pwm_value:	; 1 bytes @ 0x3
	global	DelayUs@Time
DelayUs@Time:	; 1 bytes @ 0x3
	global	___lbmod@divisor
___lbmod@divisor:	; 1 bytes @ 0x3
	ds	1
	global	??___lbmod
??___lbmod:	; 0 bytes @ 0x4
	global	DelayUs@a
DelayUs@a:	; 1 bytes @ 0x4
	ds	1
	global	??_MIX_MODE_CHANGE
??_MIX_MODE_CHANGE:	; 0 bytes @ 0x5
	global	??_PWM_MODE_CHANGE
??_PWM_MODE_CHANGE:	; 0 bytes @ 0x5
	global	??_SET_MODE_REFRESH
??_SET_MODE_REFRESH:	; 0 bytes @ 0x5
	global	??_main
??_main:	; 0 bytes @ 0x5
	global	??_DelayMs
??_DelayMs:	; 0 bytes @ 0x5
	global	main@i
main@i:	; 1 bytes @ 0x5
	ds	1
	global	main@temp_mode
main@temp_mode:	; 1 bytes @ 0x6
	ds	1
psect	cstackBANK0,class=BANK0,space=1
global __pcstackBANK0
__pcstackBANK0:
	global	DelayMs@Time
DelayMs@Time:	; 1 bytes @ 0x0
	global	___lbmod@dividend
___lbmod@dividend:	; 1 bytes @ 0x0
	ds	1
	global	DelayMs@a
DelayMs@a:	; 1 bytes @ 0x1
	global	___lbmod@counter
___lbmod@counter:	; 1 bytes @ 0x1
	ds	1
	global	DelayMs@b
DelayMs@b:	; 1 bytes @ 0x2
	global	___lbmod@rem
___lbmod@rem:	; 1 bytes @ 0x2
	ds	1
;;Data sizes: Strings 0, constant 38, data 4, bss 15, persistent 0 stack 0
;;Auto spaces:   Size  Autos    Used
;; COMMON          14      7      11
;; BANK0           48      3      18

;;
;; Pointer list with targets:



;;
;; Critical Paths under _main in COMMON
;;
;;   _DelayMs->_DelayUs
;;   _PWM_MODE_CHANGE->___lbmod
;;   _MIX_MODE_CHANGE->___lbmod
;;
;; Critical Paths under _ISR in COMMON
;;
;;   None.
;;
;; Critical Paths under _main in BANK0
;;
;;   _SET_MODE_REFRESH->_DelayMs
;;   _PWM_MODE_CHANGE->___lbmod
;;   _MIX_MODE_CHANGE->___lbmod
;;
;; Critical Paths under _ISR in BANK0
;;
;;   None.

;;
;;Main: autosize = 0, tempsize = 0, incstack = 0, save=0
;;

;;
;;Call Graph Tables:
;;
;; ---------------------------------------------------------------------------------
;; (Depth) Function   	        Calls       Base Space   Used Autos Params    Refs
;; ---------------------------------------------------------------------------------
;; (0) _main                                                 2     2      0    1108
;;                                              5 COMMON     2     2      0
;;                      _POWER_INITIAL
;;                     _TIMER0_INITIAL
;;           _PA3_Level_Change_INITIAL
;;                       _PWM1_INITIAL
;;                   _PWM1_RATE_CHANGE
;;                   _JUMP_MODE_CHANGE
;;                    _MIX_MODE_CHANGE
;;                   _reset_led_status
;;                    _PWM_MODE_CHANGE
;;                   _PWM_MODE_REFRESH
;;                   _SET_MODE_REFRESH
;; ---------------------------------------------------------------------------------
;; (1) _SET_MODE_REFRESH                                     0     0      0     204
;;                            _DelayMs
;;                   _PWM_MODE_REFRESH
;; ---------------------------------------------------------------------------------
;; (2) _DelayMs                                              3     3      0     204
;;                                              0 BANK0      3     3      0
;;                            _DelayUs
;; ---------------------------------------------------------------------------------
;; (1) _PWM_MODE_CHANGE                                      0     0      0     232
;;                            ___lbmod
;;                   _PWM_MODE_REFRESH
;; ---------------------------------------------------------------------------------
;; (3) _DelayUs                                              2     2      0      68
;;                                              3 COMMON     2     2      0
;; ---------------------------------------------------------------------------------
;; (2) _PWM_MODE_REFRESH                                     0     0      0       0
;;                   _reset_led_status
;;                           _PWM1_RED
;; ---------------------------------------------------------------------------------
;; (1) _MIX_MODE_CHANGE                                      0     0      0     232
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
;; (2) ___lbmod                                              5     4      1     232
;;                                              3 COMMON     2     1      1
;;                                              0 BANK0      3     3      0
;; ---------------------------------------------------------------------------------
;; (2) _PWM1_WHITE                                           0     0      0       0
;; ---------------------------------------------------------------------------------
;; (2) _PWM1_BLUE                                            0     0      0       0
;; ---------------------------------------------------------------------------------
;; (2) _PWM1_GREEN                                           0     0      0       0
;; ---------------------------------------------------------------------------------
;; (3) _PWM1_RED                                             0     0      0       0
;; ---------------------------------------------------------------------------------
;; (1) _JUMP_MODE_CHANGE                                     0     0      0       0
;; ---------------------------------------------------------------------------------
;; (1) _PA3_Level_Change_INITIAL                             0     0      0       0
;; ---------------------------------------------------------------------------------
;; (1) _TIMER0_INITIAL                                       0     0      0       0
;; ---------------------------------------------------------------------------------
;; (3) _reset_led_status                                     0     0      0       0
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
;;   _reset_led_status
;;   _PWM_MODE_CHANGE
;;     ___lbmod
;;     _PWM_MODE_REFRESH
;;       _reset_led_status
;;       _PWM1_RED
;;   _PWM_MODE_REFRESH
;;     _reset_led_status
;;     _PWM1_RED
;;   _SET_MODE_REFRESH
;;     _DelayMs
;;       _DelayUs
;;     _PWM_MODE_REFRESH
;;       _reset_led_status
;;       _PWM1_RED
;;
;; _ISR (ROOT)
;;

;; Address spaces:

;;Name               Size   Autos  Total    Cost      Usage
;;SFR1                 0      0       0       2        0.0%
;;BITSFR1              0      0       0       2        0.0%
;;CODE                 0      0       0       0        0.0%
;;DATA                 0      0      20       3        0.0%
;;ABS                  0      0      1D       6        0.0%
;;NULL                 0      0       0       0        0.0%
;;STACK                0      0       3       2        0.0%
;;BANK0               30      3      12       5       37.5%
;;BITBANK0            30      0       0       4        0.0%
;;SFR0                 0      0       0       1        0.0%
;;BITSFR0              0      0       0       1        0.0%
;;COMMON               E      7       B       1       78.6%
;;BITCOMMON            E      0       0       0        0.0%
;;EEDATA              80      0       0       0        0.0%

	global	_main
psect	maintext,global,class=CODE,delta=2
global __pmaintext
__pmaintext:

;; *************** function _main *****************
;; Defined at:
;;		line 160 in file "TEST_FT62F21X_SLEEP.C"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;  temp_mode       1    6[COMMON] unsigned char 
;;  i               1    5[COMMON] unsigned char 
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
;;      Locals:         2       0
;;      Temps:          0       0
;;      Totals:         2       0
;;Total ram usage:        2 bytes
;; Hardware stack levels required when called:    4
;; This function calls:
;;		_POWER_INITIAL
;;		_TIMER0_INITIAL
;;		_PA3_Level_Change_INITIAL
;;		_PWM1_INITIAL
;;		_PWM1_RATE_CHANGE
;;		_JUMP_MODE_CHANGE
;;		_MIX_MODE_CHANGE
;;		_reset_led_status
;;		_PWM_MODE_CHANGE
;;		_PWM_MODE_REFRESH
;;		_SET_MODE_REFRESH
;; This function is called by:
;;		Startup code after reset
;; This function uses a non-reentrant model
;;
psect	maintext
	file	"TEST_FT62F21X_SLEEP.C"
	line	160
	global	__size_of_main
	__size_of_main	equ	__end_of_main-_main
	
_main:	
	opt	stack 4
; Regs used in _main: [wreg-fsr0h+status,2+status,0+pclath+cstack]
	line	161
	
l4501:	
;TEST_FT62F21X_SLEEP.C: 161: POWER_INITIAL();
	fcall	_POWER_INITIAL
	line	162
;TEST_FT62F21X_SLEEP.C: 162: TIMER0_INITIAL();
	fcall	_TIMER0_INITIAL
	line	163
;TEST_FT62F21X_SLEEP.C: 163: PA3_Level_Change_INITIAL();
	fcall	_PA3_Level_Change_INITIAL
	line	164
;TEST_FT62F21X_SLEEP.C: 164: PWM1_INITIAL();
	fcall	_PWM1_INITIAL
	line	168
	
l4503:	
# 168 "TEST_FT62F21X_SLEEP.C"
clrwdt ;#
psect	maintext
	line	170
	
l4505:	
;TEST_FT62F21X_SLEEP.C: 170: if(power_off_flag == 0)
	bcf	status, 5	;RP0=0, select bank0
	movf	(_power_off_flag),f
	skipz
	goto	u1131
	goto	u1130
u1131:
	goto	l4545
u1130:
	line	172
	
l4507:	
;TEST_FT62F21X_SLEEP.C: 171: {
;TEST_FT62F21X_SLEEP.C: 172: if(ft_user_pwm_mode == 0)
	movf	(_ft_user_pwm_mode),f
	skipz
	goto	u1141
	goto	u1140
u1141:
	goto	l4517
u1140:
	line	174
	
l4509:	
;TEST_FT62F21X_SLEEP.C: 173: {
;TEST_FT62F21X_SLEEP.C: 174: if(time_15ms_cnt > 150)
	movlw	(097h)
	subwf	(_time_15ms_cnt),w
	skipc
	goto	u1151
	goto	u1150
u1151:
	goto	l4517
u1150:
	line	176
	
l4511:	
;TEST_FT62F21X_SLEEP.C: 175: {
;TEST_FT62F21X_SLEEP.C: 176: time_15ms_cnt = 0;
	clrf	(_time_15ms_cnt)
	line	177
	
l4513:	
;TEST_FT62F21X_SLEEP.C: 177: pwm_rate_value++;
	incf	(_pwm_rate_value),f
	line	178
	
l4515:	
;TEST_FT62F21X_SLEEP.C: 178: PWM1_RATE_CHANGE();
	fcall	_PWM1_RATE_CHANGE
	line	181
	
l4517:	
;TEST_FT62F21X_SLEEP.C: 179: }
;TEST_FT62F21X_SLEEP.C: 180: }
;TEST_FT62F21X_SLEEP.C: 181: if(ft_user_pwm_mode == 5)
	movf	(_ft_user_pwm_mode),w
	xorlw	05h
	skipz
	goto	u1161
	goto	u1160
u1161:
	goto	l4531
u1160:
	line	183
	
l4519:	
;TEST_FT62F21X_SLEEP.C: 182: {
;TEST_FT62F21X_SLEEP.C: 183: if(time_15ms_cnt>200)
	movlw	(0C9h)
	subwf	(_time_15ms_cnt),w
	skipc
	goto	u1171
	goto	u1170
u1171:
	goto	l4531
u1170:
	line	185
	
l4521:	
;TEST_FT62F21X_SLEEP.C: 184: {
;TEST_FT62F21X_SLEEP.C: 185: time_2s_cnt++;
	incf	(_time_2s_cnt),f
	line	186
	
l4523:	
;TEST_FT62F21X_SLEEP.C: 186: if(time_2s_cnt > 100)
	movlw	(065h)
	subwf	(_time_2s_cnt),w
	skipc
	goto	u1181
	goto	u1180
u1181:
	goto	l4529
u1180:
	line	188
	
l4525:	
;TEST_FT62F21X_SLEEP.C: 187: {
;TEST_FT62F21X_SLEEP.C: 188: time_2s_cnt = 0;
	clrf	(_time_2s_cnt)
	line	189
	
l4527:	
;TEST_FT62F21X_SLEEP.C: 189: JUMP_MODE_CHANGE();
	fcall	_JUMP_MODE_CHANGE
	line	191
	
l4529:	
;TEST_FT62F21X_SLEEP.C: 190: }
;TEST_FT62F21X_SLEEP.C: 191: time_15ms_cnt = 0;
	clrf	(_time_15ms_cnt)
	line	195
	
l4531:	
;TEST_FT62F21X_SLEEP.C: 193: }
;TEST_FT62F21X_SLEEP.C: 194: }
;TEST_FT62F21X_SLEEP.C: 195: if(ft_user_pwm_mode == 0x0A)
	movf	(_ft_user_pwm_mode),w
	xorlw	0Ah
	skipz
	goto	u1191
	goto	u1190
u1191:
	goto	l4545
u1190:
	line	197
	
l4533:	
;TEST_FT62F21X_SLEEP.C: 196: {
;TEST_FT62F21X_SLEEP.C: 197: if(time_15ms_cnt>200)
	movlw	(0C9h)
	subwf	(_time_15ms_cnt),w
	skipc
	goto	u1201
	goto	u1200
u1201:
	goto	l4545
u1200:
	line	199
	
l4535:	
;TEST_FT62F21X_SLEEP.C: 198: {
;TEST_FT62F21X_SLEEP.C: 199: time_2s_cnt++;
	incf	(_time_2s_cnt),f
	line	200
	
l4537:	
;TEST_FT62F21X_SLEEP.C: 200: if(time_2s_cnt > 100)
	movlw	(065h)
	subwf	(_time_2s_cnt),w
	skipc
	goto	u1211
	goto	u1210
u1211:
	goto	l4543
u1210:
	line	202
	
l4539:	
;TEST_FT62F21X_SLEEP.C: 201: {
;TEST_FT62F21X_SLEEP.C: 202: time_2s_cnt = 0;
	clrf	(_time_2s_cnt)
	line	203
	
l4541:	
;TEST_FT62F21X_SLEEP.C: 203: MIX_MODE_CHANGE();
	fcall	_MIX_MODE_CHANGE
	line	205
	
l4543:	
;TEST_FT62F21X_SLEEP.C: 204: }
;TEST_FT62F21X_SLEEP.C: 205: time_15ms_cnt = 0;
	clrf	(_time_15ms_cnt)
	line	212
	
l4545:	
;TEST_FT62F21X_SLEEP.C: 207: }
;TEST_FT62F21X_SLEEP.C: 208: }
;TEST_FT62F21X_SLEEP.C: 209: }
;TEST_FT62F21X_SLEEP.C: 212: if(PORTA & 0B00010000)
	btfss	(5),(4)&7
	goto	u1221
	goto	u1220
u1221:
	goto	l4549
u1220:
	line	214
	
l4547:	
;TEST_FT62F21X_SLEEP.C: 213: {
;TEST_FT62F21X_SLEEP.C: 214: key_release = 0;
	clrf	(_key_release)
	line	215
;TEST_FT62F21X_SLEEP.C: 215: }
	goto	l4557
	line	218
	
l4549:	
;TEST_FT62F21X_SLEEP.C: 216: else
;TEST_FT62F21X_SLEEP.C: 217: {
;TEST_FT62F21X_SLEEP.C: 218: if(key_release == 0)
	movf	(_key_release),f
	skipz
	goto	u1231
	goto	u1230
u1231:
	goto	l4555
u1230:
	line	220
	
l4551:	
;TEST_FT62F21X_SLEEP.C: 219: {
;TEST_FT62F21X_SLEEP.C: 220: reset_led_status();
	fcall	_reset_led_status
	line	221
	
l4553:	
;TEST_FT62F21X_SLEEP.C: 221: PWM_MODE_CHANGE();
	fcall	_PWM_MODE_CHANGE
	line	223
	
l4555:	
;TEST_FT62F21X_SLEEP.C: 222: }
;TEST_FT62F21X_SLEEP.C: 223: key_release = 1;
	clrf	(_key_release)
	incf	(_key_release),f
	line	227
	
l4557:	
;TEST_FT62F21X_SLEEP.C: 225: }
;TEST_FT62F21X_SLEEP.C: 227: if(ReceiveFinish)
	movf	(_ReceiveFinish),w
	skipz
	goto	u1240
	goto	l4503
u1240:
	line	232
	
l4559:	
;TEST_FT62F21X_SLEEP.C: 228: {
;TEST_FT62F21X_SLEEP.C: 229: unsigned char i;
;TEST_FT62F21X_SLEEP.C: 230: unsigned char temp_mode;
;TEST_FT62F21X_SLEEP.C: 232: ReceiveFinish = 0;
	clrf	(_ReceiveFinish)
	line	234
;TEST_FT62F21X_SLEEP.C: 234: for(i = 0;i < 19;i++)
	clrf	(main@i)
	line	236
	
l4565:	
;TEST_FT62F21X_SLEEP.C: 235: {
;TEST_FT62F21X_SLEEP.C: 236: if(ir_key_value[i*2] == IRDataTimer[3])
	clrc
	rlf	(main@i),w
	addlw	low((_ir_key_value-__stringbase))
	movwf	fsr0
	fcall	stringdir
	xorwf	0+(_IRDataTimer)+03h,w
	skipz
	goto	u1251
	goto	u1250
u1251:
	goto	l4593
u1250:
	line	238
	
l4567:	
;TEST_FT62F21X_SLEEP.C: 237: {
;TEST_FT62F21X_SLEEP.C: 238: temp_mode = ir_key_value[i*2 + 1];
	clrc
	rlf	(main@i),w
	addlw	low((_ir_key_value-__stringbase)+01h)
	movwf	fsr0
	fcall	stringdir
	movwf	(main@temp_mode)
	line	239
	
l4569:	
;TEST_FT62F21X_SLEEP.C: 239: if(temp_mode == 0x12)
	movf	(main@temp_mode),w
	xorlw	012h
	skipz
	goto	u1261
	goto	u1260
u1261:
	goto	l743
u1260:
	line	241
	
l4571:	
;TEST_FT62F21X_SLEEP.C: 240: {
;TEST_FT62F21X_SLEEP.C: 241: if(power_off_mode_backup == 0xff)
	movf	(_power_off_mode_backup),w
	xorlw	0FFh
	skipz
	goto	u1271
	goto	u1270
u1271:
	goto	l743
u1270:
	line	243
	
l4573:	
;TEST_FT62F21X_SLEEP.C: 242: {
;TEST_FT62F21X_SLEEP.C: 243: if(ft_user_pwm_mode < 0x0B)
	movlw	(0Bh)
	subwf	(_ft_user_pwm_mode),w
	skipnc
	goto	u1281
	goto	u1280
u1281:
	goto	l743
u1280:
	line	245
	
l4575:	
;TEST_FT62F21X_SLEEP.C: 244: {
;TEST_FT62F21X_SLEEP.C: 245: power_off_mode_backup = ft_user_pwm_mode;
	movf	(_ft_user_pwm_mode),w
	movwf	(_power_off_mode_backup)
	line	248
	
l743:	
	line	249
;TEST_FT62F21X_SLEEP.C: 246: }
;TEST_FT62F21X_SLEEP.C: 247: }
;TEST_FT62F21X_SLEEP.C: 248: }
;TEST_FT62F21X_SLEEP.C: 249: if(temp_mode >= 0x0D && temp_mode <= 0x10)
	movlw	(0Dh)
	subwf	(main@temp_mode),w
	skipc
	goto	u1291
	goto	u1290
u1291:
	goto	l746
u1290:
	
l4577:	
	movlw	(011h)
	subwf	(main@temp_mode),w
	skipnc
	goto	u1301
	goto	u1300
u1301:
	goto	l746
u1300:
	line	251
	
l4579:	
;TEST_FT62F21X_SLEEP.C: 250: {
;TEST_FT62F21X_SLEEP.C: 251: if(ft_user_pwm_mode < 0x0B)
	movlw	(0Bh)
	subwf	(_ft_user_pwm_mode),w
	skipnc
	goto	u1311
	goto	u1310
u1311:
	goto	l746
u1310:
	line	253
	
l4581:	
;TEST_FT62F21X_SLEEP.C: 252: {
;TEST_FT62F21X_SLEEP.C: 253: set_time_mode_backup = ft_user_pwm_mode;
	movf	(_ft_user_pwm_mode),w
	movwf	(_set_time_mode_backup)
	line	255
	
l746:	
	line	256
;TEST_FT62F21X_SLEEP.C: 254: }
;TEST_FT62F21X_SLEEP.C: 255: }
;TEST_FT62F21X_SLEEP.C: 256: if(temp_mode < 0x0B)
	movlw	(0Bh)
	subwf	(main@temp_mode),w
	skipnc
	goto	u1321
	goto	u1320
u1321:
	goto	l4589
u1320:
	line	258
	
l4583:	
;TEST_FT62F21X_SLEEP.C: 257: {
;TEST_FT62F21X_SLEEP.C: 258: if(ft_user_pwm_mode != temp_mode)
	movf	(_ft_user_pwm_mode),w
	xorwf	(main@temp_mode),w
	skipnz
	goto	u1331
	goto	u1330
u1331:
	goto	l4593
u1330:
	line	260
	
l4585:	
;TEST_FT62F21X_SLEEP.C: 259: {
;TEST_FT62F21X_SLEEP.C: 260: ft_user_pwm_mode = temp_mode;
	movf	(main@temp_mode),w
	movwf	(_ft_user_pwm_mode)
	line	261
	
l4587:	
;TEST_FT62F21X_SLEEP.C: 261: PWM_MODE_REFRESH();
	fcall	_PWM_MODE_REFRESH
	goto	l4593
	line	266
	
l4589:	
;TEST_FT62F21X_SLEEP.C: 264: else
;TEST_FT62F21X_SLEEP.C: 265: {
;TEST_FT62F21X_SLEEP.C: 266: ft_user_set_mode = temp_mode;
	movf	(main@temp_mode),w
	movwf	(_ft_user_set_mode)
	line	267
	
l4591:	
;TEST_FT62F21X_SLEEP.C: 267: SET_MODE_REFRESH();
	fcall	_SET_MODE_REFRESH
	line	234
	
l4593:	
	incf	(main@i),f
	
l4595:	
	movlw	(013h)
	subwf	(main@i),w
	skipc
	goto	u1341
	goto	u1340
u1341:
	goto	l4565
u1340:
	goto	l4503
	global	start
	ljmp	start
	opt stack 0
psect	maintext
	line	274
GLOBAL	__end_of_main
	__end_of_main:
;; =============== function _main ends ============

	signat	_main,88
	global	_SET_MODE_REFRESH
psect	text616,local,class=CODE,delta=2
global __ptext616
__ptext616:

;; *************** function _SET_MODE_REFRESH *****************
;; Defined at:
;;		line 492 in file "FT_62F21X_pwm.c"
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
;;		_DelayMs
;;		_PWM_MODE_REFRESH
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text616
	file	"FT_62F21X_pwm.c"
	line	492
	global	__size_of_SET_MODE_REFRESH
	__size_of_SET_MODE_REFRESH	equ	__end_of_SET_MODE_REFRESH-_SET_MODE_REFRESH
	
_SET_MODE_REFRESH:	
	opt	stack 4
; Regs used in _SET_MODE_REFRESH: [wreg-fsr0h+status,2+status,0+pclath+cstack]
	line	494
	
l4453:	
;FT_62F21X_pwm.c: 494: switch(ft_user_set_mode)
	goto	l4497
	line	497
	
l4455:	
;FT_62F21X_pwm.c: 497: if(jump_led_rate > 20)
	movlw	(015h)
	subwf	(_jump_led_rate),w
	skipc
	goto	u1071
	goto	u1070
u1071:
	goto	l4459
u1070:
	line	499
	
l4457:	
;FT_62F21X_pwm.c: 498: {
;FT_62F21X_pwm.c: 499: jump_led_rate = jump_led_rate - 20;
	movlw	(0ECh)
	addwf	(_jump_led_rate),f
	line	501
	
l4459:	
;FT_62F21X_pwm.c: 500: }
;FT_62F21X_pwm.c: 501: if(ft_user_pwm_mode != 0)
	movf	(_ft_user_pwm_mode),w
	skipz
	goto	u1080
	goto	l1544
u1080:
	line	503
	
l4461:	
;FT_62F21X_pwm.c: 502: {
;FT_62F21X_pwm.c: 503: P1CDTL=jump_led_rate;
	movf	(_jump_led_rate),w
	movwf	(16)	;volatile
	line	504
;FT_62F21X_pwm.c: 504: P1DDTL=jump_led_rate;
	movf	(_jump_led_rate),w
	movwf	(8)	;volatile
	goto	l1544
	line	510
	
l4463:	
;FT_62F21X_pwm.c: 510: if(jump_led_rate < 100)
	movlw	(064h)
	subwf	(_jump_led_rate),w
	skipnc
	goto	u1091
	goto	u1090
u1091:
	goto	l4467
u1090:
	line	512
	
l4465:	
;FT_62F21X_pwm.c: 511: {
;FT_62F21X_pwm.c: 512: jump_led_rate = jump_led_rate + 20;
	movlw	(014h)
	addwf	(_jump_led_rate),f
	line	514
	
l4467:	
;FT_62F21X_pwm.c: 513: }
;FT_62F21X_pwm.c: 514: if(ft_user_pwm_mode != 0)
	movf	(_ft_user_pwm_mode),w
	skipz
	goto	u1100
	goto	l1544
u1100:
	goto	l4461
	line	523
	
l1537:	
	line	525
	
l4471:	
;FT_62F21X_pwm.c: 522: case 0x0E:
;FT_62F21X_pwm.c: 523: case 0x0F:
;FT_62F21X_pwm.c: 524: case 0x10:
;FT_62F21X_pwm.c: 525: P1OE=0B10100000;
	movlw	(0A0h)
	bsf	status, 5	;RP0=1, select bank1
	movwf	(144)^080h	;volatile
	line	526
;FT_62F21X_pwm.c: 526: P1BR1=0B00001100;
	movlw	(0Ch)
	bcf	status, 5	;RP0=0, select bank0
	movwf	(25)	;volatile
	line	527
	
l4473:	
;FT_62F21X_pwm.c: 527: DelayMs(50);
	movlw	(032h)
	fcall	_DelayMs
	line	528
	
l4475:	
;FT_62F21X_pwm.c: 528: if(set_time_mode_backup != 0xff)
	movf	(_set_time_mode_backup),w
	xorlw	0FFh
	skipnz
	goto	u1111
	goto	u1110
u1111:
	goto	l1544
u1110:
	line	530
	
l4477:	
;FT_62F21X_pwm.c: 529: {
;FT_62F21X_pwm.c: 530: ft_user_pwm_mode = set_time_mode_backup;
	movf	(_set_time_mode_backup),w
	movwf	(_ft_user_pwm_mode)
	line	531
	
l4479:	
;FT_62F21X_pwm.c: 531: PWM_MODE_REFRESH();
	fcall	_PWM_MODE_REFRESH
	goto	l1544
	line	536
	
l4481:	
;FT_62F21X_pwm.c: 536: if(power_off_mode_backup != 0xff)
	movf	(_power_off_mode_backup),w
	xorlw	0FFh
	skipnz
	goto	u1121
	goto	u1120
u1121:
	goto	l4487
u1120:
	line	538
	
l4483:	
;FT_62F21X_pwm.c: 537: {
;FT_62F21X_pwm.c: 538: ft_user_pwm_mode = power_off_mode_backup;
	movf	(_power_off_mode_backup),w
	movwf	(_ft_user_pwm_mode)
	line	539
	
l4485:	
;FT_62F21X_pwm.c: 539: PWM_MODE_REFRESH();
	fcall	_PWM_MODE_REFRESH
	line	541
	
l4487:	
;FT_62F21X_pwm.c: 540: }
;FT_62F21X_pwm.c: 541: power_off_mode_backup = 0xff;
	movlw	(0FFh)
	movwf	(_power_off_mode_backup)
	line	542
	
l4489:	
;FT_62F21X_pwm.c: 542: power_off_flag = 0;
	clrf	(_power_off_flag)
	line	543
;FT_62F21X_pwm.c: 543: break;
	goto	l1544
	line	546
	
l4491:	
;FT_62F21X_pwm.c: 546: P1OE=0B00000000;
	bsf	status, 5	;RP0=1, select bank1
	clrf	(144)^080h	;volatile
	line	547
;FT_62F21X_pwm.c: 547: P1BR1=0B00000000;
	bcf	status, 5	;RP0=0, select bank0
	clrf	(25)	;volatile
	line	548
	
l4493:	
;FT_62F21X_pwm.c: 548: power_off_flag = 1;
	clrf	(_power_off_flag)
	incf	(_power_off_flag),f
	line	549
;FT_62F21X_pwm.c: 549: break;
	goto	l1544
	line	494
	
l4497:	
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
goto l1544
	movwf fsr
	movlw	8
	subwf	fsr,w
skipnc
goto l1544
movlw high(S4687)
movwf pclath
	movlw low(S4687)
	addwf fsr,w
	movwf pc
psect	swtext1,local,class=CONST,delta=2
global __pswtext1
__pswtext1:
S4687:
	ljmp	l4455
	ljmp	l4463
	ljmp	l1537
	ljmp	l4471
	ljmp	l4471
	ljmp	l4471
	ljmp	l4481
	ljmp	l4491
psect	text616

	line	557
	
l1544:	
	return
	opt stack 0
GLOBAL	__end_of_SET_MODE_REFRESH
	__end_of_SET_MODE_REFRESH:
;; =============== function _SET_MODE_REFRESH ends ============

	signat	_SET_MODE_REFRESH,88
	global	_DelayMs
psect	text617,local,class=CODE,delta=2
global __ptext617
__ptext617:

;; *************** function _DelayMs *****************
;; Defined at:
;;		line 365 in file "FT_62F21X_pwm.c"
;; Parameters:    Size  Location     Type
;;  Time            1    wreg     unsigned char 
;; Auto vars:     Size  Location     Type
;;  Time            1    0[BANK0 ] unsigned char 
;;  b               1    2[BANK0 ] unsigned char 
;;  a               1    1[BANK0 ] unsigned char 
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 20/0
;;		On exit  : 20/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0
;;      Params:         0       0
;;      Locals:         0       3
;;      Temps:          0       0
;;      Totals:         0       3
;;Total ram usage:        3 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    2
;; This function calls:
;;		_DelayUs
;; This function is called by:
;;		_SET_MODE_REFRESH
;; This function uses a non-reentrant model
;;
psect	text617
	file	"FT_62F21X_pwm.c"
	line	365
	global	__size_of_DelayMs
	__size_of_DelayMs	equ	__end_of_DelayMs-_DelayMs
	
_DelayMs:	
	opt	stack 4
; Regs used in _DelayMs: [wreg+status,2+status,0+pclath+cstack]
;DelayMs@Time stored from wreg
	line	367
	movwf	(DelayMs@Time)
	
l4435:	
;FT_62F21X_pwm.c: 366: unsigned char a,b;
;FT_62F21X_pwm.c: 367: for(a=0;a<Time;a++)
	clrf	(DelayMs@a)
	goto	l4451
	line	369
	
l4437:	
;FT_62F21X_pwm.c: 368: {
;FT_62F21X_pwm.c: 369: for(b=0;b<5;b++)
	clrf	(DelayMs@b)
	line	371
	
l4443:	
;FT_62F21X_pwm.c: 370: {
;FT_62F21X_pwm.c: 371: DelayUs(98);
	movlw	(062h)
	fcall	_DelayUs
	line	369
	
l4445:	
	bcf	status, 5	;RP0=0, select bank0
	incf	(DelayMs@b),f
	
l4447:	
	movlw	(05h)
	subwf	(DelayMs@b),w
	skipc
	goto	u1051
	goto	u1050
u1051:
	goto	l4443
u1050:
	line	367
	
l4449:	
	incf	(DelayMs@a),f
	
l4451:	
	movf	(DelayMs@Time),w
	subwf	(DelayMs@a),w
	skipc
	goto	u1061
	goto	u1060
u1061:
	goto	l4437
u1060:
	line	374
	
l1505:	
	return
	opt stack 0
GLOBAL	__end_of_DelayMs
	__end_of_DelayMs:
;; =============== function _DelayMs ends ============

	signat	_DelayMs,4216
	global	_PWM_MODE_CHANGE
psect	text618,local,class=CODE,delta=2
global __ptext618
__ptext618:

;; *************** function _PWM_MODE_CHANGE *****************
;; Defined at:
;;		line 291 in file "FT_62F21X_pwm.c"
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
;;		___lbmod
;;		_PWM_MODE_REFRESH
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text618
	file	"FT_62F21X_pwm.c"
	line	291
	global	__size_of_PWM_MODE_CHANGE
	__size_of_PWM_MODE_CHANGE	equ	__end_of_PWM_MODE_CHANGE-_PWM_MODE_CHANGE
	
_PWM_MODE_CHANGE:	
	opt	stack 4
; Regs used in _PWM_MODE_CHANGE: [wreg-fsr0h+status,2+status,0+pclath+cstack]
	line	292
	
l4429:	
;FT_62F21X_pwm.c: 292: ft_user_pwm_mode++;
	incf	(_ft_user_pwm_mode),f
	line	293
	
l4431:	
;FT_62F21X_pwm.c: 293: ft_user_pwm_mode = ft_user_pwm_mode%6;
	movlw	(06h)
	movwf	(?___lbmod)
	movf	(_ft_user_pwm_mode),w
	fcall	___lbmod
	movwf	(_ft_user_pwm_mode)
	line	294
	
l4433:	
;FT_62F21X_pwm.c: 294: PWM_MODE_REFRESH();
	fcall	_PWM_MODE_REFRESH
	line	296
	
l1479:	
	return
	opt stack 0
GLOBAL	__end_of_PWM_MODE_CHANGE
	__end_of_PWM_MODE_CHANGE:
;; =============== function _PWM_MODE_CHANGE ends ============

	signat	_PWM_MODE_CHANGE,88
	global	_DelayUs
psect	text619,local,class=CODE,delta=2
global __ptext619
__ptext619:

;; *************** function _DelayUs *****************
;; Defined at:
;;		line 351 in file "FT_62F21X_pwm.c"
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
;;		On entry : 20/0
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
psect	text619
	file	"FT_62F21X_pwm.c"
	line	351
	global	__size_of_DelayUs
	__size_of_DelayUs	equ	__end_of_DelayUs-_DelayUs
	
_DelayUs:	
	opt	stack 4
; Regs used in _DelayUs: [wreg+status,2+status,0]
;DelayUs@Time stored from wreg
	line	353
	movwf	(DelayUs@Time)
	
l4423:	
;FT_62F21X_pwm.c: 352: unsigned char a;
;FT_62F21X_pwm.c: 353: for(a=0;a<Time;a++)
	clrf	(DelayUs@a)
	goto	l4427
	line	354
	
l1495:	
	line	355
;FT_62F21X_pwm.c: 354: {
;FT_62F21X_pwm.c: 355: _nop();
	nop
	line	353
	
l4425:	
	incf	(DelayUs@a),f
	
l4427:	
	movf	(DelayUs@Time),w
	subwf	(DelayUs@a),w
	skipc
	goto	u1041
	goto	u1040
u1041:
	goto	l1495
u1040:
	line	357
	
l1497:	
	return
	opt stack 0
GLOBAL	__end_of_DelayUs
	__end_of_DelayUs:
;; =============== function _DelayUs ends ============

	signat	_DelayUs,4216
	global	_PWM_MODE_REFRESH
psect	text620,local,class=CODE,delta=2
global __ptext620
__ptext620:

;; *************** function _PWM_MODE_REFRESH *****************
;; Defined at:
;;		line 397 in file "FT_62F21X_pwm.c"
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
psect	text620
	file	"FT_62F21X_pwm.c"
	line	397
	global	__size_of_PWM_MODE_REFRESH
	__size_of_PWM_MODE_REFRESH	equ	__end_of_PWM_MODE_REFRESH-_PWM_MODE_REFRESH
	
_PWM_MODE_REFRESH:	
	opt	stack 4
; Regs used in _PWM_MODE_REFRESH: [wreg-fsr0h+status,2+status,0+pclath+cstack]
	line	398
	
l4035:	
;FT_62F21X_pwm.c: 398: reset_led_status();
	fcall	_reset_led_status
	line	400
	
l4037:	
;FT_62F21X_pwm.c: 400: jump_led_rate = 100;
	movlw	(064h)
	movwf	(_jump_led_rate)
	line	401
	
l4039:	
;FT_62F21X_pwm.c: 401: if(ft_user_pwm_mode != 0)
	movf	(_ft_user_pwm_mode),w
	skipz
	goto	u680
	goto	l1508
u680:
	line	403
	
l4041:	
;FT_62F21X_pwm.c: 402: {
;FT_62F21X_pwm.c: 403: P1CDTL=jump_led_rate;
	movf	(_jump_led_rate),w
	movwf	(16)	;volatile
	line	404
;FT_62F21X_pwm.c: 404: P1DDTL=jump_led_rate;
	movf	(_jump_led_rate),w
	movwf	(8)	;volatile
	line	405
	
l1508:	
	line	407
;FT_62F21X_pwm.c: 405: }
;FT_62F21X_pwm.c: 407: if(power_off_flag == 1)
	decf	(_power_off_flag),w
	skipz
	goto	u691
	goto	u690
u691:
	goto	l4087
u690:
	goto	l1510
	line	415
	
l4045:	
;FT_62F21X_pwm.c: 415: pwm_rate_value = 0;
	clrf	(_pwm_rate_value)
	line	416
;FT_62F21X_pwm.c: 416: pwm_colour_value = 0;
	clrf	(_pwm_colour_value)
	line	417
	
l4047:	
;FT_62F21X_pwm.c: 417: PWM1_RED();
	fcall	_PWM1_RED
	line	419
;FT_62F21X_pwm.c: 419: break;
	goto	l1510
	line	423
	
l4049:	
;FT_62F21X_pwm.c: 423: P1OE=0B00000000;
	bsf	status, 5	;RP0=1, select bank1
	clrf	(144)^080h	;volatile
	line	424
	
l4051:	
;FT_62F21X_pwm.c: 424: P1BR1=0B00001000;
	movlw	(08h)
	bcf	status, 5	;RP0=0, select bank0
	movwf	(25)	;volatile
	line	426
;FT_62F21X_pwm.c: 426: break;
	goto	l1510
	line	430
	
l4053:	
;FT_62F21X_pwm.c: 430: P1OE=0B00100000;
	movlw	(020h)
	bsf	status, 5	;RP0=1, select bank1
	movwf	(144)^080h	;volatile
	line	431
	
l4055:	
;FT_62F21X_pwm.c: 431: P1BR1=0B00000000;
	bcf	status, 5	;RP0=0, select bank0
	clrf	(25)	;volatile
	line	433
;FT_62F21X_pwm.c: 433: break;
	goto	l1510
	line	436
	
l4057:	
;FT_62F21X_pwm.c: 436: P1OE=0B10000000;
	movlw	(080h)
	bsf	status, 5	;RP0=1, select bank1
	movwf	(144)^080h	;volatile
	goto	l4055
	line	441
	
l4061:	
;FT_62F21X_pwm.c: 441: P1OE=0B00000000;
	bsf	status, 5	;RP0=1, select bank1
	clrf	(144)^080h	;volatile
	line	442
	
l4063:	
;FT_62F21X_pwm.c: 442: P1BR1=0B00000100;
	movlw	(04h)
	bcf	status, 5	;RP0=0, select bank0
	movwf	(25)	;volatile
	line	443
;FT_62F21X_pwm.c: 443: break;
	goto	l1510
	line	446
	
l4065:	
;FT_62F21X_pwm.c: 446: pwm_colour_value = 0;
	clrf	(_pwm_colour_value)
	line	448
;FT_62F21X_pwm.c: 448: P1OE=0B00000000;
	bsf	status, 5	;RP0=1, select bank1
	clrf	(144)^080h	;volatile
	goto	l4051
	line	455
	
l4069:	
;FT_62F21X_pwm.c: 455: P1OE=0B00100000;
	movlw	(020h)
	bsf	status, 5	;RP0=1, select bank1
	movwf	(144)^080h	;volatile
	line	456
;FT_62F21X_pwm.c: 456: P1BR1=0B00001000;
	movlw	(08h)
	bcf	status, 5	;RP0=0, select bank0
	movwf	(25)	;volatile
	line	458
;FT_62F21X_pwm.c: 458: break;
	goto	l1510
	line	462
	
l4071:	
;FT_62F21X_pwm.c: 462: P1OE=0B10000000;
	movlw	(080h)
	bsf	status, 5	;RP0=1, select bank1
	movwf	(144)^080h	;volatile
	line	463
;FT_62F21X_pwm.c: 463: P1BR1=0B00001000;
	movlw	(08h)
	bcf	status, 5	;RP0=0, select bank0
	movwf	(25)	;volatile
	line	466
;FT_62F21X_pwm.c: 466: break;
	goto	l1510
	line	469
	
l4073:	
;FT_62F21X_pwm.c: 469: P1OE=0B00000000;
	bsf	status, 5	;RP0=1, select bank1
	clrf	(144)^080h	;volatile
	line	470
	
l4075:	
;FT_62F21X_pwm.c: 470: P1BR1=0B00001100;
	movlw	(0Ch)
	bcf	status, 5	;RP0=0, select bank0
	movwf	(25)	;volatile
	line	471
;FT_62F21X_pwm.c: 471: break;
	goto	l1510
	line	474
	
l4077:	
;FT_62F21X_pwm.c: 474: P1OE=0B10100000;
	movlw	(0A0h)
	bsf	status, 5	;RP0=1, select bank1
	movwf	(144)^080h	;volatile
	line	475
;FT_62F21X_pwm.c: 475: P1BR1=0B00001000;
	movlw	(08h)
	bcf	status, 5	;RP0=0, select bank0
	movwf	(25)	;volatile
	line	476
;FT_62F21X_pwm.c: 476: break;
	goto	l1510
	line	479
	
l4079:	
;FT_62F21X_pwm.c: 479: pwm_colour_value = 0;
	clrf	(_pwm_colour_value)
	line	480
	
l4081:	
;FT_62F21X_pwm.c: 480: P1OE=0B00100000;
	movlw	(020h)
	bsf	status, 5	;RP0=1, select bank1
	movwf	(144)^080h	;volatile
	goto	l4051
	line	412
	
l4087:	
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
goto l1510
movlw high(S4689)
movwf pclath
	movlw low(S4689)
	addwf fsr,w
	movwf pc
psect	swtext2,local,class=CONST,delta=2
global __pswtext2
__pswtext2:
S4689:
	ljmp	l4045
	ljmp	l4049
	ljmp	l4053
	ljmp	l4057
	ljmp	l4061
	ljmp	l4065
	ljmp	l4069
	ljmp	l4071
	ljmp	l4073
	ljmp	l4077
	ljmp	l4079
psect	text620

	line	489
	
l1510:	
	return
	opt stack 0
GLOBAL	__end_of_PWM_MODE_REFRESH
	__end_of_PWM_MODE_REFRESH:
;; =============== function _PWM_MODE_REFRESH ends ============

	signat	_PWM_MODE_REFRESH,88
	global	_MIX_MODE_CHANGE
psect	text621,local,class=CODE,delta=2
global __ptext621
__ptext621:

;; *************** function _MIX_MODE_CHANGE *****************
;; Defined at:
;;		line 299 in file "FT_62F21X_pwm.c"
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
psect	text621
	file	"FT_62F21X_pwm.c"
	line	299
	global	__size_of_MIX_MODE_CHANGE
	__size_of_MIX_MODE_CHANGE	equ	__end_of_MIX_MODE_CHANGE-_MIX_MODE_CHANGE
	
_MIX_MODE_CHANGE:	
	opt	stack 5
; Regs used in _MIX_MODE_CHANGE: [wreg-fsr0h+status,2+status,0+pclath+cstack]
	line	300
	
l4395:	
;FT_62F21X_pwm.c: 300: pwm_colour_value++;
	incf	(_pwm_colour_value),f
	line	301
	
l4397:	
;FT_62F21X_pwm.c: 301: pwm_colour_value = pwm_colour_value%6;
	movlw	(06h)
	movwf	(?___lbmod)
	movf	(_pwm_colour_value),w
	fcall	___lbmod
	movwf	(_pwm_colour_value)
	line	303
;FT_62F21X_pwm.c: 303: switch(pwm_colour_value)
	goto	l4417
	line	306
	
l4399:	
;FT_62F21X_pwm.c: 306: P1OE=0B00100000;
	movlw	(020h)
	bsf	status, 5	;RP0=1, select bank1
	movwf	(144)^080h	;volatile
	line	307
;FT_62F21X_pwm.c: 307: P1BR1=0B00001000;
	movlw	(08h)
	bcf	status, 5	;RP0=0, select bank0
	movwf	(25)	;volatile
	line	308
;FT_62F21X_pwm.c: 308: break;
	goto	l1491
	line	311
	
l4401:	
;FT_62F21X_pwm.c: 311: P1OE=0B10000000;
	movlw	(080h)
	bsf	status, 5	;RP0=1, select bank1
	movwf	(144)^080h	;volatile
	line	312
;FT_62F21X_pwm.c: 312: P1BR1=0B00001000;
	movlw	(08h)
	bcf	status, 5	;RP0=0, select bank0
	movwf	(25)	;volatile
	line	314
;FT_62F21X_pwm.c: 314: break;
	goto	l1491
	line	317
	
l4403:	
;FT_62F21X_pwm.c: 317: P1OE=0B00000000;
	bsf	status, 5	;RP0=1, select bank1
	clrf	(144)^080h	;volatile
	line	318
	
l4405:	
;FT_62F21X_pwm.c: 318: P1BR1=0B00001100;
	movlw	(0Ch)
	bcf	status, 5	;RP0=0, select bank0
	movwf	(25)	;volatile
	line	320
;FT_62F21X_pwm.c: 320: break;
	goto	l1491
	line	323
	
l4407:	
;FT_62F21X_pwm.c: 323: P1OE=0B10100000;
	movlw	(0A0h)
	bsf	status, 5	;RP0=1, select bank1
	movwf	(144)^080h	;volatile
	line	324
	
l4409:	
;FT_62F21X_pwm.c: 324: P1BR1=0B00000000;
	bcf	status, 5	;RP0=0, select bank0
	clrf	(25)	;volatile
	line	325
;FT_62F21X_pwm.c: 325: break;
	goto	l1491
	line	328
	
l4411:	
;FT_62F21X_pwm.c: 328: P1OE=0B00100000;
	movlw	(020h)
	bsf	status, 5	;RP0=1, select bank1
	movwf	(144)^080h	;volatile
	line	329
;FT_62F21X_pwm.c: 329: P1BR1=0B00000100;
	movlw	(04h)
	bcf	status, 5	;RP0=0, select bank0
	movwf	(25)	;volatile
	line	330
;FT_62F21X_pwm.c: 330: break;
	goto	l1491
	line	333
	
l4413:	
;FT_62F21X_pwm.c: 333: P1OE=0B10000000;
	movlw	(080h)
	bsf	status, 5	;RP0=1, select bank1
	movwf	(144)^080h	;volatile
	line	334
;FT_62F21X_pwm.c: 334: P1BR1=0B00000100;
	movlw	(04h)
	bcf	status, 5	;RP0=0, select bank0
	movwf	(25)	;volatile
	line	335
;FT_62F21X_pwm.c: 335: break;
	goto	l1491
	line	303
	
l4417:	
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
goto l1491
movlw high(S4691)
movwf pclath
	movlw low(S4691)
	addwf fsr,w
	movwf pc
psect	swtext3,local,class=CONST,delta=2
global __pswtext3
__pswtext3:
S4691:
	ljmp	l4399
	ljmp	l4401
	ljmp	l4403
	ljmp	l4407
	ljmp	l4411
	ljmp	l4413
psect	text621

	line	341
	
l1491:	
	return
	opt stack 0
GLOBAL	__end_of_MIX_MODE_CHANGE
	__end_of_MIX_MODE_CHANGE:
;; =============== function _MIX_MODE_CHANGE ends ============

	signat	_MIX_MODE_CHANGE,88
	global	_PWM1_RATE_CHANGE
psect	text622,local,class=CODE,delta=2
global __ptext622
__ptext622:

;; *************** function _PWM1_RATE_CHANGE *****************
;; Defined at:
;;		line 189 in file "FT_62F21X_pwm.c"
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
psect	text622
	file	"FT_62F21X_pwm.c"
	line	189
	global	__size_of_PWM1_RATE_CHANGE
	__size_of_PWM1_RATE_CHANGE	equ	__end_of_PWM1_RATE_CHANGE-_PWM1_RATE_CHANGE
	
_PWM1_RATE_CHANGE:	
	opt	stack 5
; Regs used in _PWM1_RATE_CHANGE: [wreg-fsr0h+status,2+status,0+pclath+cstack]
	line	192
	
l3961:	
;FT_62F21X_pwm.c: 190: unsigned char pwm_value;
;FT_62F21X_pwm.c: 192: if(pwm_rate_value >= 200)
	movlw	(0C8h)
	subwf	(_pwm_rate_value),w
	skipc
	goto	u661
	goto	u660
u661:
	goto	l3981
u660:
	line	194
	
l3963:	
;FT_62F21X_pwm.c: 193: {
;FT_62F21X_pwm.c: 194: pwm_rate_value = 0;
	clrf	(_pwm_rate_value)
	line	195
	
l3965:	
;FT_62F21X_pwm.c: 195: pwm_colour_value++;
	incf	(_pwm_colour_value),f
	line	196
	
l3967:	
;FT_62F21X_pwm.c: 196: pwm_colour_value = pwm_colour_value%4;
	movlw	(03h)
	andwf	(_pwm_colour_value),f
	line	197
;FT_62F21X_pwm.c: 197: switch(pwm_colour_value)
	goto	l3979
	line	200
	
l3969:	
;FT_62F21X_pwm.c: 200: PWM1_RED();
	fcall	_PWM1_RED
	line	201
;FT_62F21X_pwm.c: 201: break;
	goto	l3981
	line	204
	
l3971:	
;FT_62F21X_pwm.c: 204: PWM1_GREEN();
	fcall	_PWM1_GREEN
	line	205
;FT_62F21X_pwm.c: 205: break;
	goto	l3981
	line	208
	
l3973:	
;FT_62F21X_pwm.c: 208: PWM1_BLUE();
	fcall	_PWM1_BLUE
	line	209
;FT_62F21X_pwm.c: 209: break;
	goto	l3981
	line	212
	
l3975:	
;FT_62F21X_pwm.c: 212: PWM1_WHITE();
	fcall	_PWM1_WHITE
	line	213
;FT_62F21X_pwm.c: 213: break;
	goto	l3981
	line	197
	
l3979:	
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
goto l3981
movlw high(S4693)
movwf pclath
	movlw low(S4693)
	addwf fsr,w
	movwf pc
psect	swtext4,local,class=CONST,delta=2
global __pswtext4
__pswtext4:
S4693:
	ljmp	l3969
	ljmp	l3971
	ljmp	l3973
	ljmp	l3975
psect	text622

	line	220
	
l3981:	
;FT_62F21X_pwm.c: 219: }
;FT_62F21X_pwm.c: 220: if(pwm_rate_value <=100)
	movlw	(065h)
	subwf	(_pwm_rate_value),w
	skipnc
	goto	u671
	goto	u670
u671:
	goto	l3985
u670:
	line	222
	
l3983:	
;FT_62F21X_pwm.c: 221: {
;FT_62F21X_pwm.c: 222: pwm_value = pwm_rate_value;
	movf	(_pwm_rate_value),w
	movwf	(PWM1_RATE_CHANGE@pwm_value)
	line	223
;FT_62F21X_pwm.c: 223: }
	goto	l3997
	line	226
	
l3985:	
;FT_62F21X_pwm.c: 224: else
;FT_62F21X_pwm.c: 225: {
;FT_62F21X_pwm.c: 226: pwm_value = 200 - pwm_rate_value;
	movf	(_pwm_rate_value),w
	sublw	0C8h
	movwf	(PWM1_RATE_CHANGE@pwm_value)
	goto	l3997
	line	232
	
l3987:	
;FT_62F21X_pwm.c: 232: P1CDTL = pwm_value;
	movf	(PWM1_RATE_CHANGE@pwm_value),w
	movwf	(16)	;volatile
	line	233
;FT_62F21X_pwm.c: 233: break;
	goto	l1466
	line	236
	
l3989:	
;FT_62F21X_pwm.c: 236: P1DDTL = pwm_value;
	movf	(PWM1_RATE_CHANGE@pwm_value),w
	movwf	(8)	;volatile
	line	237
;FT_62F21X_pwm.c: 237: break;
	goto	l1466
	line	229
	
l3997:	
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
goto l1466
movlw high(S4695)
movwf pclath
	movlw low(S4695)
	addwf fsr,w
	movwf pc
psect	swtext5,local,class=CONST,delta=2
global __pswtext5
__pswtext5:
S4695:
	ljmp	l3987
	ljmp	l3989
	ljmp	l3987
	ljmp	l3989
psect	text622

	line	252
	
l1466:	
	return
	opt stack 0
GLOBAL	__end_of_PWM1_RATE_CHANGE
	__end_of_PWM1_RATE_CHANGE:
;; =============== function _PWM1_RATE_CHANGE ends ============

	signat	_PWM1_RATE_CHANGE,88
	global	_PWM1_INITIAL
psect	text623,local,class=CODE,delta=2
global __ptext623
__ptext623:

;; *************** function _PWM1_INITIAL *****************
;; Defined at:
;;		line 27 in file "FT_62F21X_pwm.c"
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
psect	text623
	file	"FT_62F21X_pwm.c"
	line	27
	global	__size_of_PWM1_INITIAL
	__size_of_PWM1_INITIAL	equ	__end_of_PWM1_INITIAL-_PWM1_INITIAL
	
_PWM1_INITIAL:	
	opt	stack 5
; Regs used in _PWM1_INITIAL: [wreg+status,2+status,0+pclath+cstack]
	line	28
	
l3937:	
;FT_62F21X_pwm.c: 28: T2CON0=0B00000001;
	movlw	(01h)
	bcf	status, 5	;RP0=0, select bank0
	movwf	(18)	;volatile
	line	34
	
l3939:	
;FT_62F21X_pwm.c: 34: T2CON1=0B00000000;
	bsf	status, 5	;RP0=1, select bank1
	clrf	(158)^080h	;volatile
	line	39
	
l3941:	
;FT_62F21X_pwm.c: 39: TMR2H=0;
	bcf	status, 5	;RP0=0, select bank0
	clrf	(19)	;volatile
	line	40
;FT_62F21X_pwm.c: 40: TMR2L=100;
	movlw	(064h)
	movwf	(17)	;volatile
	line	42
	
l3943:	
;FT_62F21X_pwm.c: 42: PR2H=0;
	bsf	status, 5	;RP0=1, select bank1
	clrf	(146)^080h	;volatile
	line	43
	
l3945:	
;FT_62F21X_pwm.c: 43: PR2L=100;
	movlw	(064h)
	movwf	(145)^080h	;volatile
	line	45
;FT_62F21X_pwm.c: 45: P1CDTH=0;
	bcf	status, 5	;RP0=0, select bank0
	clrf	(26)	;volatile
	line	46
;FT_62F21X_pwm.c: 46: P1DDTH=0;
	clrf	(9)	;volatile
	line	47
;FT_62F21X_pwm.c: 47: P1CDTL=0;
	clrf	(16)	;volatile
	line	48
;FT_62F21X_pwm.c: 48: P1DDTL=0;
	clrf	(8)	;volatile
	line	50
;FT_62F21X_pwm.c: 50: P1POL=0B00000000;
	bsf	status, 5	;RP0=1, select bank1
	clrf	(153)^080h	;volatile
	line	57
;FT_62F21X_pwm.c: 57: P1CON=0B00000000;
	bcf	status, 5	;RP0=0, select bank0
	clrf	(22)	;volatile
	line	64
;FT_62F21X_pwm.c: 64: P1AUX=0B00000000;
	clrf	(30)	;volatile
	line	72
	
l3947:	
;FT_62F21X_pwm.c: 72: PWM1_RED();
	fcall	_PWM1_RED
	line	73
	
l3949:	
;FT_62F21X_pwm.c: 73: pwm_colour_value = 0;
	clrf	(_pwm_colour_value)
	line	75
	
l3951:	
;FT_62F21X_pwm.c: 75: TMR2IF=0;
	bcf	(97/8),(97)&7
	line	76
	
l3953:	
;FT_62F21X_pwm.c: 76: TMR2IE=1;
	bsf	status, 5	;RP0=1, select bank1
	bsf	(1121/8)^080h,(1121)&7
	line	77
	
l3955:	
;FT_62F21X_pwm.c: 77: TMR2ON=1;
	bcf	status, 5	;RP0=0, select bank0
	bsf	(146/8),(146)&7
	line	78
	
l3957:	
;FT_62F21X_pwm.c: 78: PEIE=1;
	bsf	(94/8),(94)&7
	line	79
	
l3959:	
;FT_62F21X_pwm.c: 79: GIE=1;
	bsf	(95/8),(95)&7
	line	81
	
l1434:	
	return
	opt stack 0
GLOBAL	__end_of_PWM1_INITIAL
	__end_of_PWM1_INITIAL:
;; =============== function _PWM1_INITIAL ends ============

	signat	_PWM1_INITIAL,88
	global	___lbmod
psect	text624,local,class=CODE,delta=2
global __ptext624
__ptext624:

;; *************** function ___lbmod *****************
;; Defined at:
;;		line 5 in file "c:\program files (x86)\fmd\fmdide\data\sources\lbmod.c"
;; Parameters:    Size  Location     Type
;;  dividend        1    wreg     unsigned char 
;;  divisor         1    3[COMMON] unsigned char 
;; Auto vars:     Size  Location     Type
;;  dividend        1    0[BANK0 ] unsigned char 
;;  rem             1    2[BANK0 ] unsigned char 
;;  counter         1    1[BANK0 ] unsigned char 
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
;;      Locals:         0       3
;;      Temps:          1       0
;;      Totals:         2       3
;;Total ram usage:        5 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_PWM_MODE_CHANGE
;;		_MIX_MODE_CHANGE
;; This function uses a non-reentrant model
;;
psect	text624
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
	
l4377:	
	movlw	(08h)
	movwf	(___lbmod@counter)
	line	10
	
l4379:	
	clrf	(___lbmod@rem)
	line	12
	
l4381:	
	movf	(___lbmod@dividend),w
	movwf	(??___lbmod+0)+0
	movlw	07h
u1015:
	clrc
	rrf	(??___lbmod+0)+0,f
	addlw	-1
	skipz
	goto	u1015
	clrc
	rlf	(___lbmod@rem),w
	iorwf	0+(??___lbmod+0)+0,w
	movwf	(___lbmod@rem)
	line	13
	
l4383:	
	clrc
	rlf	(___lbmod@dividend),f
	line	14
	
l4385:	
	movf	(___lbmod@divisor),w
	subwf	(___lbmod@rem),w
	skipc
	goto	u1021
	goto	u1020
u1021:
	goto	l4389
u1020:
	line	15
	
l4387:	
	movf	(___lbmod@divisor),w
	subwf	(___lbmod@rem),f
	line	16
	
l4389:	
	decfsz	(___lbmod@counter),f
	goto	u1031
	goto	u1030
u1031:
	goto	l4381
u1030:
	line	17
	
l4391:	
	movf	(___lbmod@rem),w
	line	18
	
l2820:	
	return
	opt stack 0
GLOBAL	__end_of___lbmod
	__end_of___lbmod:
;; =============== function ___lbmod ends ============

	signat	___lbmod,8313
	global	_PWM1_WHITE
psect	text625,local,class=CODE,delta=2
global __ptext625
__ptext625:

;; *************** function _PWM1_WHITE *****************
;; Defined at:
;;		line 170 in file "FT_62F21X_pwm.c"
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
psect	text625
	file	"FT_62F21X_pwm.c"
	line	170
	global	__size_of_PWM1_WHITE
	__size_of_PWM1_WHITE	equ	__end_of_PWM1_WHITE-_PWM1_WHITE
	
_PWM1_WHITE:	
	opt	stack 5
; Regs used in _PWM1_WHITE: [wreg+status,2]
	line	171
	
l3915:	
;FT_62F21X_pwm.c: 171: P1CDTL=0;
	clrf	(16)	;volatile
	line	172
;FT_62F21X_pwm.c: 172: P1DDTL=0;
	clrf	(8)	;volatile
	line	174
;FT_62F21X_pwm.c: 174: P1OE=0B00000000;
	bsf	status, 5	;RP0=1, select bank1
	clrf	(144)^080h	;volatile
	line	182
	
l3917:	
;FT_62F21X_pwm.c: 182: P1BR1=0B00000100;
	movlw	(04h)
	bcf	status, 5	;RP0=0, select bank0
	movwf	(25)	;volatile
	line	186
	
l1446:	
	return
	opt stack 0
GLOBAL	__end_of_PWM1_WHITE
	__end_of_PWM1_WHITE:
;; =============== function _PWM1_WHITE ends ============

	signat	_PWM1_WHITE,88
	global	_PWM1_BLUE
psect	text626,local,class=CODE,delta=2
global __ptext626
__ptext626:

;; *************** function _PWM1_BLUE *****************
;; Defined at:
;;		line 151 in file "FT_62F21X_pwm.c"
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
psect	text626
	file	"FT_62F21X_pwm.c"
	line	151
	global	__size_of_PWM1_BLUE
	__size_of_PWM1_BLUE	equ	__end_of_PWM1_BLUE-_PWM1_BLUE
	
_PWM1_BLUE:	
	opt	stack 5
; Regs used in _PWM1_BLUE: [wreg+status,2]
	line	152
	
l3909:	
;FT_62F21X_pwm.c: 152: P1CDTL=0;
	clrf	(16)	;volatile
	line	153
;FT_62F21X_pwm.c: 153: P1DDTL=0;
	clrf	(8)	;volatile
	line	155
	
l3911:	
;FT_62F21X_pwm.c: 155: P1OE=0B10000000;
	movlw	(080h)
	bsf	status, 5	;RP0=1, select bank1
	movwf	(144)^080h	;volatile
	line	163
	
l3913:	
;FT_62F21X_pwm.c: 163: P1BR1=0B00000000;
	bcf	status, 5	;RP0=0, select bank0
	clrf	(25)	;volatile
	line	167
	
l1443:	
	return
	opt stack 0
GLOBAL	__end_of_PWM1_BLUE
	__end_of_PWM1_BLUE:
;; =============== function _PWM1_BLUE ends ============

	signat	_PWM1_BLUE,88
	global	_PWM1_GREEN
psect	text627,local,class=CODE,delta=2
global __ptext627
__ptext627:

;; *************** function _PWM1_GREEN *****************
;; Defined at:
;;		line 118 in file "FT_62F21X_pwm.c"
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
psect	text627
	file	"FT_62F21X_pwm.c"
	line	118
	global	__size_of_PWM1_GREEN
	__size_of_PWM1_GREEN	equ	__end_of_PWM1_GREEN-_PWM1_GREEN
	
_PWM1_GREEN:	
	opt	stack 5
; Regs used in _PWM1_GREEN: [wreg+status,2]
	line	120
	
l3903:	
;FT_62F21X_pwm.c: 120: P1CDTL=0;
	clrf	(16)	;volatile
	line	121
;FT_62F21X_pwm.c: 121: P1DDTL=0;
	clrf	(8)	;volatile
	line	123
	
l3905:	
;FT_62F21X_pwm.c: 123: P1OE=0B00100000;
	movlw	(020h)
	bsf	status, 5	;RP0=1, select bank1
	movwf	(144)^080h	;volatile
	line	131
	
l3907:	
;FT_62F21X_pwm.c: 131: P1BR1=0B00000000;
	bcf	status, 5	;RP0=0, select bank0
	clrf	(25)	;volatile
	line	148
	
l1440:	
	return
	opt stack 0
GLOBAL	__end_of_PWM1_GREEN
	__end_of_PWM1_GREEN:
;; =============== function _PWM1_GREEN ends ============

	signat	_PWM1_GREEN,88
	global	_PWM1_RED
psect	text628,local,class=CODE,delta=2
global __ptext628
__ptext628:

;; *************** function _PWM1_RED *****************
;; Defined at:
;;		line 85 in file "FT_62F21X_pwm.c"
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
psect	text628
	file	"FT_62F21X_pwm.c"
	line	85
	global	__size_of_PWM1_RED
	__size_of_PWM1_RED	equ	__end_of_PWM1_RED-_PWM1_RED
	
_PWM1_RED:	
	opt	stack 4
; Regs used in _PWM1_RED: [wreg+status,2]
	line	87
	
l3899:	
;FT_62F21X_pwm.c: 87: P1CDTL=0;
	clrf	(16)	;volatile
	line	88
;FT_62F21X_pwm.c: 88: P1DDTL=0;
	clrf	(8)	;volatile
	line	90
;FT_62F21X_pwm.c: 90: P1OE=0B00000000;
	bsf	status, 5	;RP0=1, select bank1
	clrf	(144)^080h	;volatile
	line	98
	
l3901:	
;FT_62F21X_pwm.c: 98: P1BR1=0B00001000;
	movlw	(08h)
	bcf	status, 5	;RP0=0, select bank0
	movwf	(25)	;volatile
	line	115
	
l1437:	
	return
	opt stack 0
GLOBAL	__end_of_PWM1_RED
	__end_of_PWM1_RED:
;; =============== function _PWM1_RED ends ============

	signat	_PWM1_RED,88
	global	_JUMP_MODE_CHANGE
psect	text629,local,class=CODE,delta=2
global __ptext629
__ptext629:

;; *************** function _JUMP_MODE_CHANGE *****************
;; Defined at:
;;		line 255 in file "FT_62F21X_pwm.c"
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
psect	text629
	file	"FT_62F21X_pwm.c"
	line	255
	global	__size_of_JUMP_MODE_CHANGE
	__size_of_JUMP_MODE_CHANGE	equ	__end_of_JUMP_MODE_CHANGE-_JUMP_MODE_CHANGE
	
_JUMP_MODE_CHANGE:	
	opt	stack 6
; Regs used in _JUMP_MODE_CHANGE: [wreg-fsr0h+status,2+status,0]
	line	256
	
l3871:	
;FT_62F21X_pwm.c: 256: pwm_colour_value++;
	incf	(_pwm_colour_value),f
	line	257
	
l3873:	
;FT_62F21X_pwm.c: 257: pwm_colour_value = pwm_colour_value%4;
	movlw	(03h)
	andwf	(_pwm_colour_value),f
	line	258
;FT_62F21X_pwm.c: 258: switch(pwm_colour_value)
	goto	l3893
	line	262
	
l3875:	
;FT_62F21X_pwm.c: 262: P1OE=0B00000000;
	bsf	status, 5	;RP0=1, select bank1
	clrf	(144)^080h	;volatile
	line	263
	
l3877:	
;FT_62F21X_pwm.c: 263: P1BR1=0B00001000;
	movlw	(08h)
	bcf	status, 5	;RP0=0, select bank0
	movwf	(25)	;volatile
	line	265
;FT_62F21X_pwm.c: 265: break;
	goto	l1476
	line	269
	
l3879:	
;FT_62F21X_pwm.c: 269: P1OE=0B00100000;
	movlw	(020h)
	bsf	status, 5	;RP0=1, select bank1
	movwf	(144)^080h	;volatile
	line	270
	
l3881:	
;FT_62F21X_pwm.c: 270: P1BR1=0B00000000;
	bcf	status, 5	;RP0=0, select bank0
	clrf	(25)	;volatile
	line	272
;FT_62F21X_pwm.c: 272: break;
	goto	l1476
	line	275
	
l3883:	
;FT_62F21X_pwm.c: 275: P1OE=0B10000000;
	movlw	(080h)
	bsf	status, 5	;RP0=1, select bank1
	movwf	(144)^080h	;volatile
	goto	l3881
	line	280
	
l3887:	
;FT_62F21X_pwm.c: 280: P1OE=0B00000000;
	bsf	status, 5	;RP0=1, select bank1
	clrf	(144)^080h	;volatile
	line	281
	
l3889:	
;FT_62F21X_pwm.c: 281: P1BR1=0B00000100;
	movlw	(04h)
	bcf	status, 5	;RP0=0, select bank0
	movwf	(25)	;volatile
	line	282
;FT_62F21X_pwm.c: 282: break;
	goto	l1476
	line	258
	
l3893:	
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
movlw high(S4697)
movwf pclath
	movlw low(S4697)
	addwf fsr,w
	movwf pc
psect	swtext6,local,class=CONST,delta=2
global __pswtext6
__pswtext6:
S4697:
	ljmp	l3875
	ljmp	l3879
	ljmp	l3883
	ljmp	l3887
psect	text629

	line	288
	
l1476:	
	return
	opt stack 0
GLOBAL	__end_of_JUMP_MODE_CHANGE
	__end_of_JUMP_MODE_CHANGE:
;; =============== function _JUMP_MODE_CHANGE ends ============

	signat	_JUMP_MODE_CHANGE,88
	global	_PA3_Level_Change_INITIAL
psect	text630,local,class=CODE,delta=2
global __ptext630
__ptext630:

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
psect	text630
	file	"FT_62F21x_IR.c"
	line	37
	global	__size_of_PA3_Level_Change_INITIAL
	__size_of_PA3_Level_Change_INITIAL	equ	__end_of_PA3_Level_Change_INITIAL-_PA3_Level_Change_INITIAL
	
_PA3_Level_Change_INITIAL:	
	opt	stack 6
; Regs used in _PA3_Level_Change_INITIAL: [wreg]
	line	38
	
l3861:	
;FT_62F21x_IR.c: 38: TRISA3 =1;
	bsf	status, 5	;RP0=1, select bank1
	bsf	(1067/8)^080h,(1067)&7
	line	39
	
l3863:	
;FT_62F21x_IR.c: 39: ReadAPin = PORTA;
	bcf	status, 5	;RP0=0, select bank0
	movf	(5),w	;volatile
	line	40
	
l3865:	
;FT_62F21x_IR.c: 40: PAIF =0;
	bcf	(88/8),(88)&7
	line	41
	
l3867:	
;FT_62F21x_IR.c: 41: IOCA3 =1;
	bsf	status, 5	;RP0=1, select bank1
	bsf	(1203/8)^080h,(1203)&7
	line	42
	
l3869:	
;FT_62F21x_IR.c: 42: PAIE =1;
	bsf	(91/8),(91)&7
	line	43
	
l2220:	
	return
	opt stack 0
GLOBAL	__end_of_PA3_Level_Change_INITIAL
	__end_of_PA3_Level_Change_INITIAL:
;; =============== function _PA3_Level_Change_INITIAL ends ============

	signat	_PA3_Level_Change_INITIAL,88
	global	_TIMER0_INITIAL
psect	text631,local,class=CODE,delta=2
global __ptext631
__ptext631:

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
psect	text631
	file	"FT_62F21x_IR.c"
	line	19
	global	__size_of_TIMER0_INITIAL
	__size_of_TIMER0_INITIAL	equ	__end_of_TIMER0_INITIAL-_TIMER0_INITIAL
	
_TIMER0_INITIAL:	
	opt	stack 6
; Regs used in _TIMER0_INITIAL: [wreg]
	line	20
	
l3857:	
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
	
l3859:	
;FT_62F21x_IR.c: 28: T0IF = 0;
	bcf	(90/8),(90)&7
	line	29
	
l2217:	
	return
	opt stack 0
GLOBAL	__end_of_TIMER0_INITIAL
	__end_of_TIMER0_INITIAL:
;; =============== function _TIMER0_INITIAL ends ============

	signat	_TIMER0_INITIAL,88
	global	_reset_led_status
psect	text632,local,class=CODE,delta=2
global __ptext632
__ptext632:

;; *************** function _reset_led_status *****************
;; Defined at:
;;		line 148 in file "TEST_FT62F21X_SLEEP.C"
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
psect	text632
	file	"TEST_FT62F21X_SLEEP.C"
	line	148
	global	__size_of_reset_led_status
	__size_of_reset_led_status	equ	__end_of_reset_led_status-_reset_led_status
	
_reset_led_status:	
	opt	stack 4
; Regs used in _reset_led_status: [status,2]
	line	149
	
l3855:	
;TEST_FT62F21X_SLEEP.C: 149: time_15ms_cnt = 0;
	clrf	(_time_15ms_cnt)
	line	150
;TEST_FT62F21X_SLEEP.C: 150: time_2s_cnt = 0;
	clrf	(_time_2s_cnt)
	line	152
	
l723:	
	return
	opt stack 0
GLOBAL	__end_of_reset_led_status
	__end_of_reset_led_status:
;; =============== function _reset_led_status ends ============

	signat	_reset_led_status,88
	global	_POWER_INITIAL
psect	text633,local,class=CODE,delta=2
global __ptext633
__ptext633:

;; *************** function _POWER_INITIAL *****************
;; Defined at:
;;		line 131 in file "TEST_FT62F21X_SLEEP.C"
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
psect	text633
	file	"TEST_FT62F21X_SLEEP.C"
	line	131
	global	__size_of_POWER_INITIAL
	__size_of_POWER_INITIAL	equ	__end_of_POWER_INITIAL-_POWER_INITIAL
	
_POWER_INITIAL:	
	opt	stack 6
; Regs used in _POWER_INITIAL: [wreg+status,2]
	line	132
	
l3845:	
;TEST_FT62F21X_SLEEP.C: 132: OSCCON = 0X00|0X70|0X00;
	movlw	(070h)
	bsf	status, 5	;RP0=1, select bank1
	movwf	(143)^080h	;volatile
	line	135
	
l3847:	
;TEST_FT62F21X_SLEEP.C: 135: INTCON = 0;
	clrf	(11)	;volatile
	line	137
	
l3849:	
;TEST_FT62F21X_SLEEP.C: 137: PORTA = 0B00000000;
	bcf	status, 5	;RP0=0, select bank0
	clrf	(5)	;volatile
	line	138
;TEST_FT62F21X_SLEEP.C: 138: TRISA = 0B00010000;
	movlw	(010h)
	bsf	status, 5	;RP0=1, select bank1
	movwf	(133)^080h	;volatile
	line	139
	
l3851:	
;TEST_FT62F21X_SLEEP.C: 139: WPUA = 0B00000000;
	clrf	(149)^080h	;volatile
	line	141
	
l3853:	
;TEST_FT62F21X_SLEEP.C: 141: OPTION = 0B00001000;
	movlw	(08h)
	movwf	(129)^080h	;volatile
	line	143
;TEST_FT62F21X_SLEEP.C: 143: MSCON = 0B00000000;
	bcf	status, 5	;RP0=0, select bank0
	clrf	(27)	;volatile
	line	144
	
l720:	
	return
	opt stack 0
GLOBAL	__end_of_POWER_INITIAL
	__end_of_POWER_INITIAL:
;; =============== function _POWER_INITIAL ends ============

	signat	_POWER_INITIAL,88
	global	_ISR
psect	text634,local,class=CODE,delta=2
global __ptext634
__ptext634:

;; *************** function _ISR *****************
;; Defined at:
;;		line 60 in file "TEST_FT62F21X_SLEEP.C"
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
psect	text634
	file	"TEST_FT62F21X_SLEEP.C"
	line	60
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
psect	text634
	line	63
	
i1l3783:	
;TEST_FT62F21X_SLEEP.C: 63: if(TMR2IE && TMR2IF)
	bsf	status, 5	;RP0=1, select bank1
	btfss	(1121/8)^080h,(1121)&7
	goto	u51_21
	goto	u51_20
u51_21:
	goto	i1l3791
u51_20:
	
i1l3785:	
	bcf	status, 5	;RP0=0, select bank0
	btfss	(97/8),(97)&7
	goto	u52_21
	goto	u52_20
u52_21:
	goto	i1l3791
u52_20:
	line	65
	
i1l3787:	
;TEST_FT62F21X_SLEEP.C: 64: {
;TEST_FT62F21X_SLEEP.C: 65: TMR2IF = 0;
	bcf	(97/8),(97)&7
	line	66
	
i1l3789:	
;TEST_FT62F21X_SLEEP.C: 66: time_15ms_cnt++;
	incf	(_time_15ms_cnt),f
	line	72
	
i1l3791:	
;TEST_FT62F21X_SLEEP.C: 68: }
;TEST_FT62F21X_SLEEP.C: 72: if(T0IE && T0IF)
	btfss	(93/8),(93)&7
	goto	u53_21
	goto	u53_20
u53_21:
	goto	i1l3807
u53_20:
	
i1l3793:	
	btfss	(90/8),(90)&7
	goto	u54_21
	goto	u54_20
u54_21:
	goto	i1l3807
u54_20:
	line	74
	
i1l3795:	
;TEST_FT62F21X_SLEEP.C: 73: {
;TEST_FT62F21X_SLEEP.C: 74: TMR0 = 140;
	movlw	(08Ch)
	bcf	status, 5	;RP0=0, select bank0
	movwf	(1)	;volatile
	line	76
	
i1l3797:	
;TEST_FT62F21X_SLEEP.C: 76: T0IF = 0;
	bcf	(90/8),(90)&7
	line	77
	
i1l3799:	
;TEST_FT62F21X_SLEEP.C: 77: IRbitTime++;
	incf	(_IRbitTime),f
	line	78
	
i1l3801:	
;TEST_FT62F21X_SLEEP.C: 78: if(IRbitTime > 50)
	movlw	(033h)
	subwf	(_IRbitTime),w
	skipc
	goto	u55_21
	goto	u55_20
u55_21:
	goto	i1l3807
u55_20:
	line	80
	
i1l3803:	
;TEST_FT62F21X_SLEEP.C: 79: {
;TEST_FT62F21X_SLEEP.C: 80: T0IE = 0;
	bcf	(93/8),(93)&7
	line	81
	
i1l3805:	
;TEST_FT62F21X_SLEEP.C: 81: IRbitTime = 0;
	clrf	(_IRbitTime)
	line	86
	
i1l3807:	
;TEST_FT62F21X_SLEEP.C: 82: }
;TEST_FT62F21X_SLEEP.C: 83: }
;TEST_FT62F21X_SLEEP.C: 86: if(PAIE && PAIF)
	btfss	(91/8),(91)&7
	goto	u56_21
	goto	u56_20
u56_21:
	goto	i1l717
u56_20:
	
i1l3809:	
	btfss	(88/8),(88)&7
	goto	u57_21
	goto	u57_20
u57_21:
	goto	i1l717
u57_20:
	line	88
	
i1l3811:	
;TEST_FT62F21X_SLEEP.C: 87: {
;TEST_FT62F21X_SLEEP.C: 88: ReadAPin = PORTA;
	bcf	status, 5	;RP0=0, select bank0
	movf	(5),w	;volatile
	line	89
	
i1l3813:	
;TEST_FT62F21X_SLEEP.C: 89: PAIF = 0;
	bcf	(88/8),(88)&7
	line	90
	
i1l3815:	
;TEST_FT62F21X_SLEEP.C: 90: if(RA3 == 0)
	btfsc	(43/8),(43)&7
	goto	u58_21
	goto	u58_20
u58_21:
	goto	i1l717
u58_20:
	line	92
	
i1l3817:	
;TEST_FT62F21X_SLEEP.C: 91: {
;TEST_FT62F21X_SLEEP.C: 92: T0IE = 1;
	bsf	(93/8),(93)&7
	line	93
	
i1l3819:	
;TEST_FT62F21X_SLEEP.C: 93: if(IRbitTime > 21)
	movlw	(016h)
	subwf	(_IRbitTime),w
	skipc
	goto	u59_21
	goto	u59_20
u59_21:
	goto	i1l3823
u59_20:
	line	95
	
i1l3821:	
;TEST_FT62F21X_SLEEP.C: 94: {
;TEST_FT62F21X_SLEEP.C: 95: IRDataTimer[0] = 0;
	clrf	(_IRDataTimer)
	line	96
;TEST_FT62F21X_SLEEP.C: 96: IRDataTimer[1] = 0;
	clrf	0+(_IRDataTimer)+01h
	line	97
;TEST_FT62F21X_SLEEP.C: 97: IRDataTimer[2] = 0;
	clrf	0+(_IRDataTimer)+02h
	line	98
;TEST_FT62F21X_SLEEP.C: 98: IRDataTimer[3] = 0;
	clrf	0+(_IRDataTimer)+03h
	line	99
;TEST_FT62F21X_SLEEP.C: 99: IRbitNum = 0;
	clrf	(_IRbitNum)
	line	100
;TEST_FT62F21X_SLEEP.C: 100: bitdata = 0x00;
	clrf	(_bitdata)
	line	101
;TEST_FT62F21X_SLEEP.C: 101: }
	goto	i1l3827
	line	102
	
i1l3823:	
;TEST_FT62F21X_SLEEP.C: 102: else if(IRbitTime > 3)
	movlw	(04h)
	subwf	(_IRbitTime),w
	skipc
	goto	u60_21
	goto	u60_20
u60_21:
	goto	i1l3827
u60_20:
	line	104
	
i1l3825:	
;TEST_FT62F21X_SLEEP.C: 103: {
;TEST_FT62F21X_SLEEP.C: 104: IRDataTimer[IRbitNum-1] |= bitdata;
	movf	(_IRbitNum),w
	addlw	_IRDataTimer+-1&0ffh
	movwf	fsr0
	movf	(_bitdata),w
	bcf	status, 7	;select IRP bank0
	iorwf	indf,f
	line	106
	
i1l3827:	
;TEST_FT62F21X_SLEEP.C: 105: }
;TEST_FT62F21X_SLEEP.C: 106: IRbitTime = 0;
	clrf	(_IRbitTime)
	line	107
	
i1l3829:	
;TEST_FT62F21X_SLEEP.C: 107: bitdata<<=1;
	clrc
	rlf	(_bitdata),f
	line	108
	
i1l3831:	
;TEST_FT62F21X_SLEEP.C: 108: if(bitdata == 0)
	movf	(_bitdata),f
	skipz
	goto	u61_21
	goto	u61_20
u61_21:
	goto	i1l3837
u61_20:
	line	110
	
i1l3833:	
;TEST_FT62F21X_SLEEP.C: 109: {
;TEST_FT62F21X_SLEEP.C: 110: bitdata = 0x01;
	clrf	(_bitdata)
	incf	(_bitdata),f
	line	111
	
i1l3835:	
;TEST_FT62F21X_SLEEP.C: 111: IRbitNum++;
	incf	(_IRbitNum),f
	line	113
	
i1l3837:	
;TEST_FT62F21X_SLEEP.C: 112: }
;TEST_FT62F21X_SLEEP.C: 113: if(IRbitNum > 4)
	movlw	(05h)
	subwf	(_IRbitNum),w
	skipc
	goto	u62_21
	goto	u62_20
u62_21:
	goto	i1l717
u62_20:
	line	115
	
i1l3839:	
;TEST_FT62F21X_SLEEP.C: 114: {
;TEST_FT62F21X_SLEEP.C: 115: IRbitNum = 0;
	clrf	(_IRbitNum)
	line	116
	
i1l3841:	
;TEST_FT62F21X_SLEEP.C: 116: T0IE = 0;
	bcf	(93/8),(93)&7
	line	117
	
i1l3843:	
;TEST_FT62F21X_SLEEP.C: 117: ReceiveFinish = 1;
	clrf	(_ReceiveFinish)
	incf	(_ReceiveFinish),f
	line	122
	
i1l717:	
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
psect	text635,local,class=CODE,delta=2
global __ptext635
__ptext635:
	global	btemp
	btemp set 07Eh

	DABS	1,126,2	;btemp
	global	wtemp0
	wtemp0 set btemp
	end
