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
	FNCALL	_main,_PWM_MODE_CHANGE
	FNCALL	_PWM_MODE_CHANGE,___lbmod
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
psect	idataCOMMON,class=CODE,space=0,delta=2
global __pidataCOMMON
__pidataCOMMON:
	file	"FT_62F21x_IR.c"
	line	7

;initializer for _bitdata
	retlw	01h
	global	_IRDataTimer
	global	_key_release
	global	_time_15ms_cnt
	global	_IRbitNum
	global	_IRbitTime
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
_IRbitNum:
       ds      1

_IRbitTime:
       ds      1

_ft_user_pwm_mode:
       ds      1

_pwm_colour_value:
       ds      1

_pwm_rate_value:
       ds      1

psect	dataCOMMON,class=COMMON,space=1
global __pdataCOMMON
__pdataCOMMON:
	file	"FT_62F21x_IR.c"
_bitdata:
       ds      1

psect	bssBANK0,class=BANK0,space=1
global __pbssBANK0
__pbssBANK0:
_IRDataTimer:
       ds      4

_key_release:
       ds      1

_time_15ms_cnt:
       ds      1

; Clear objects allocated to COMMON
psect cinit,class=CODE,delta=2
	clrf	((__pbssCOMMON)+0)&07Fh
	clrf	((__pbssCOMMON)+1)&07Fh
	clrf	((__pbssCOMMON)+2)&07Fh
	clrf	((__pbssCOMMON)+3)&07Fh
	clrf	((__pbssCOMMON)+4)&07Fh
; Clear objects allocated to BANK0
psect cinit,class=CODE,delta=2
	clrf	((__pbssBANK0)+0)&07Fh
	clrf	((__pbssBANK0)+1)&07Fh
	clrf	((__pbssBANK0)+2)&07Fh
	clrf	((__pbssBANK0)+3)&07Fh
	clrf	((__pbssBANK0)+4)&07Fh
	clrf	((__pbssBANK0)+5)&07Fh
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
	global	?_PWM_MODE_CHANGE
?_PWM_MODE_CHANGE:	; 0 bytes @ 0x0
	global	?_PWM1_RED
?_PWM1_RED:	; 0 bytes @ 0x0
	global	?_ISR
?_ISR:	; 0 bytes @ 0x0
	global	??_ISR
??_ISR:	; 0 bytes @ 0x0
	global	?_POWER_INITIAL
?_POWER_INITIAL:	; 0 bytes @ 0x0
	global	?_main
?_main:	; 0 bytes @ 0x0
	global	?_PWM1_GREEN
?_PWM1_GREEN:	; 0 bytes @ 0x0
	global	?_PWM1_BLUE
?_PWM1_BLUE:	; 0 bytes @ 0x0
	global	?_PWM1_WHITE
?_PWM1_WHITE:	; 0 bytes @ 0x0
	ds	3
	global	??_TIMER0_INITIAL
??_TIMER0_INITIAL:	; 0 bytes @ 0x3
	global	??_PA3_Level_Change_INITIAL
??_PA3_Level_Change_INITIAL:	; 0 bytes @ 0x3
	global	??_PWM1_INITIAL
??_PWM1_INITIAL:	; 0 bytes @ 0x3
	global	??_PWM1_RATE_CHANGE
??_PWM1_RATE_CHANGE:	; 0 bytes @ 0x3
	global	??_PWM1_RED
??_PWM1_RED:	; 0 bytes @ 0x3
	global	??_POWER_INITIAL
??_POWER_INITIAL:	; 0 bytes @ 0x3
	global	??_PWM1_GREEN
??_PWM1_GREEN:	; 0 bytes @ 0x3
	global	??_PWM1_BLUE
??_PWM1_BLUE:	; 0 bytes @ 0x3
	global	??_PWM1_WHITE
??_PWM1_WHITE:	; 0 bytes @ 0x3
	global	?___lbmod
?___lbmod:	; 1 bytes @ 0x3
	global	PWM1_RATE_CHANGE@pwm_value
PWM1_RATE_CHANGE@pwm_value:	; 1 bytes @ 0x3
	global	___lbmod@divisor
___lbmod@divisor:	; 1 bytes @ 0x3
	ds	1
	global	??___lbmod
??___lbmod:	; 0 bytes @ 0x4
	ds	1
	global	??_PWM_MODE_CHANGE
??_PWM_MODE_CHANGE:	; 0 bytes @ 0x5
	global	??_main
??_main:	; 0 bytes @ 0x5
psect	cstackBANK0,class=BANK0,space=1
global __pcstackBANK0
__pcstackBANK0:
	global	___lbmod@dividend
___lbmod@dividend:	; 1 bytes @ 0x0
	ds	1
	global	___lbmod@counter
___lbmod@counter:	; 1 bytes @ 0x1
	ds	1
	global	___lbmod@rem
___lbmod@rem:	; 1 bytes @ 0x2
	ds	1
;;Data sizes: Strings 0, constant 0, data 1, bss 11, persistent 0 stack 0
;;Auto spaces:   Size  Autos    Used
;; COMMON          14      5      11
;; BANK0           48      3       9

;;
;; Pointer list with targets:



;;
;; Critical Paths under _main in COMMON
;;
;;   _PWM_MODE_CHANGE->___lbmod
;;
;; Critical Paths under _ISR in COMMON
;;
;;   None.
;;
;; Critical Paths under _main in BANK0
;;
;;   _PWM_MODE_CHANGE->___lbmod
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
;; (0) _main                                                 0     0      0     322
;;                      _POWER_INITIAL
;;                     _TIMER0_INITIAL
;;           _PA3_Level_Change_INITIAL
;;                       _PWM1_INITIAL
;;                   _PWM1_RATE_CHANGE
;;                    _PWM_MODE_CHANGE
;; ---------------------------------------------------------------------------------
;; (1) _PWM_MODE_CHANGE                                      0     0      0     232
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
;; (2) _PWM1_RED                                             0     0      0       0
;; ---------------------------------------------------------------------------------
;; (1) _PA3_Level_Change_INITIAL                             0     0      0       0
;; ---------------------------------------------------------------------------------
;; (1) _TIMER0_INITIAL                                       0     0      0       0
;; ---------------------------------------------------------------------------------
;; (1) _POWER_INITIAL                                        0     0      0       0
;; ---------------------------------------------------------------------------------
;; Estimated maximum stack depth 2
;; ---------------------------------------------------------------------------------
;; (Depth) Function   	        Calls       Base Space   Used Autos Params    Refs
;; ---------------------------------------------------------------------------------
;; (3) _ISR                                                  3     3      0       0
;;                                              0 COMMON     3     3      0
;; ---------------------------------------------------------------------------------
;; Estimated maximum stack depth 3
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
;;   _PWM_MODE_CHANGE
;;     ___lbmod
;;
;; _ISR (ROOT)
;;

;; Address spaces:

;;Name               Size   Autos  Total    Cost      Usage
;;SFR1                 0      0       0       2        0.0%
;;BITSFR1              0      0       0       2        0.0%
;;CODE                 0      0       0       0        0.0%
;;DATA                 0      0      16       3        0.0%
;;ABS                  0      0      14       6        0.0%
;;NULL                 0      0       0       0        0.0%
;;STACK                0      0       2       2        0.0%
;;BANK0               30      3       9       5       18.8%
;;BITBANK0            30      0       0       4        0.0%
;;SFR0                 0      0       0       1        0.0%
;;BITSFR0              0      0       0       1        0.0%
;;COMMON               E      5       B       1       78.6%
;;BITCOMMON            E      0       0       0        0.0%
;;EEDATA              80      0       0       0        0.0%

	global	_main
psect	maintext,global,class=CODE,delta=2
global __pmaintext
__pmaintext:

;; *************** function _main *****************
;; Defined at:
;;		line 174 in file "TEST_FT62F21X_SLEEP.C"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, fsr0l, fsr0h, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 17F/0
;;		On exit  : 20/0
;;		Unchanged: FFE00/0
;; Data sizes:     COMMON   BANK0
;;      Params:         0       0
;;      Locals:         0       0
;;      Temps:          0       0
;;      Totals:         0       0
;;Total ram usage:        0 bytes
;; Hardware stack levels required when called:    3
;; This function calls:
;;		_POWER_INITIAL
;;		_TIMER0_INITIAL
;;		_PA3_Level_Change_INITIAL
;;		_PWM1_INITIAL
;;		_PWM1_RATE_CHANGE
;;		_PWM_MODE_CHANGE
;; This function is called by:
;;		Startup code after reset
;; This function uses a non-reentrant model
;;
psect	maintext
	file	"TEST_FT62F21X_SLEEP.C"
	line	174
	global	__size_of_main
	__size_of_main	equ	__end_of_main-_main
	
_main:	
	opt	stack 5
; Regs used in _main: [wreg-fsr0h+status,2+status,0+pclath+cstack]
	line	175
	
l3615:	
;TEST_FT62F21X_SLEEP.C: 175: POWER_INITIAL();
	fcall	_POWER_INITIAL
	line	176
;TEST_FT62F21X_SLEEP.C: 176: TIMER0_INITIAL();
	fcall	_TIMER0_INITIAL
	line	177
;TEST_FT62F21X_SLEEP.C: 177: PA3_Level_Change_INITIAL();
	fcall	_PA3_Level_Change_INITIAL
	line	178
;TEST_FT62F21X_SLEEP.C: 178: PWM1_INITIAL();
	fcall	_PWM1_INITIAL
	line	182
	
l3617:	
# 182 "TEST_FT62F21X_SLEEP.C"
clrwdt ;#
psect	maintext
	line	184
	
l3619:	
;TEST_FT62F21X_SLEEP.C: 184: if(ft_user_pwm_mode == 0)
	movf	(_ft_user_pwm_mode),f
	skipz
	goto	u461
	goto	u460
u461:
	goto	l3629
u460:
	line	186
	
l3621:	
;TEST_FT62F21X_SLEEP.C: 185: {
;TEST_FT62F21X_SLEEP.C: 186: if(time_15ms_cnt > 150)
	movlw	(097h)
	bcf	status, 5	;RP0=0, select bank0
	subwf	(_time_15ms_cnt),w
	skipc
	goto	u471
	goto	u470
u471:
	goto	l3629
u470:
	line	188
	
l3623:	
;TEST_FT62F21X_SLEEP.C: 187: {
;TEST_FT62F21X_SLEEP.C: 188: time_15ms_cnt = 0;
	clrf	(_time_15ms_cnt)
	line	189
	
l3625:	
;TEST_FT62F21X_SLEEP.C: 189: pwm_rate_value++;
	incf	(_pwm_rate_value),f
	line	190
	
l3627:	
;TEST_FT62F21X_SLEEP.C: 190: PWM1_RATE_CHANGE();
	fcall	_PWM1_RATE_CHANGE
	line	194
	
l3629:	
;TEST_FT62F21X_SLEEP.C: 191: }
;TEST_FT62F21X_SLEEP.C: 192: }
;TEST_FT62F21X_SLEEP.C: 194: if(PORTA & 0B00010000)
	bcf	status, 5	;RP0=0, select bank0
	btfss	(5),(4)&7
	goto	u481
	goto	u480
u481:
	goto	l3633
u480:
	line	196
	
l3631:	
;TEST_FT62F21X_SLEEP.C: 195: {
;TEST_FT62F21X_SLEEP.C: 196: key_release = 0;
	clrf	(_key_release)
	line	197
;TEST_FT62F21X_SLEEP.C: 197: }
	goto	l3617
	line	200
	
l3633:	
;TEST_FT62F21X_SLEEP.C: 198: else
;TEST_FT62F21X_SLEEP.C: 199: {
;TEST_FT62F21X_SLEEP.C: 200: if(key_release == 0)
	movf	(_key_release),f
	skipz
	goto	u491
	goto	u490
u491:
	goto	l3637
u490:
	line	202
	
l3635:	
;TEST_FT62F21X_SLEEP.C: 201: {
;TEST_FT62F21X_SLEEP.C: 202: PWM_MODE_CHANGE();
	fcall	_PWM_MODE_CHANGE
	line	204
	
l3637:	
;TEST_FT62F21X_SLEEP.C: 203: }
;TEST_FT62F21X_SLEEP.C: 204: key_release = 1;
	clrf	(_key_release)
	incf	(_key_release),f
	goto	l3617
	global	start
	ljmp	start
	opt stack 0
psect	maintext
	line	208
GLOBAL	__end_of_main
	__end_of_main:
;; =============== function _main ends ============

	signat	_main,88
	global	_PWM_MODE_CHANGE
psect	text370,local,class=CODE,delta=2
global __ptext370
__ptext370:

;; *************** function _PWM_MODE_CHANGE *****************
;; Defined at:
;;		line 249 in file "FT_62F21X_pwm.c"
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
psect	text370
	file	"FT_62F21X_pwm.c"
	line	249
	global	__size_of_PWM_MODE_CHANGE
	__size_of_PWM_MODE_CHANGE	equ	__end_of_PWM_MODE_CHANGE-_PWM_MODE_CHANGE
	
_PWM_MODE_CHANGE:	
	opt	stack 5
; Regs used in _PWM_MODE_CHANGE: [wreg-fsr0h+status,2+status,0+pclath+cstack]
	line	250
	
l3605:	
;FT_62F21X_pwm.c: 250: ft_user_pwm_mode++;
	incf	(_ft_user_pwm_mode),f
	line	251
	
l3607:	
;FT_62F21X_pwm.c: 251: ft_user_pwm_mode = ft_user_pwm_mode%6;
	movlw	(06h)
	movwf	(?___lbmod)
	movf	(_ft_user_pwm_mode),w
	fcall	___lbmod
	movwf	(_ft_user_pwm_mode)
	line	252
;FT_62F21X_pwm.c: 252: switch(ft_user_pwm_mode)
	
l3611:	
	movf	(_ft_user_pwm_mode),w
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
goto l1444
movlw high(S3669)
movwf pclath
	movlw low(S3669)
	addwf fsr,w
	movwf pc
psect	swtext1,local,class=CONST,delta=2
global __pswtext1
__pswtext1:
S3669:
	ljmp	l1444
	ljmp	l1444
	ljmp	l1444
	ljmp	l1444
	ljmp	l1444
	ljmp	l1444
psect	text370

	line	282
	
l1444:	
	return
	opt stack 0
GLOBAL	__end_of_PWM_MODE_CHANGE
	__end_of_PWM_MODE_CHANGE:
;; =============== function _PWM_MODE_CHANGE ends ============

	signat	_PWM_MODE_CHANGE,88
	global	_PWM1_RATE_CHANGE
psect	text371,local,class=CODE,delta=2
global __ptext371
__ptext371:

;; *************** function _PWM1_RATE_CHANGE *****************
;; Defined at:
;;		line 183 in file "FT_62F21X_pwm.c"
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
psect	text371
	file	"FT_62F21X_pwm.c"
	line	183
	global	__size_of_PWM1_RATE_CHANGE
	__size_of_PWM1_RATE_CHANGE	equ	__end_of_PWM1_RATE_CHANGE-_PWM1_RATE_CHANGE
	
_PWM1_RATE_CHANGE:	
	opt	stack 5
; Regs used in _PWM1_RATE_CHANGE: [wreg-fsr0h+status,2+status,0+pclath+cstack]
	line	186
	
l3475:	
;FT_62F21X_pwm.c: 184: unsigned char pwm_value;
;FT_62F21X_pwm.c: 186: if(pwm_rate_value >= 200)
	movlw	(0C8h)
	subwf	(_pwm_rate_value),w
	skipc
	goto	u371
	goto	u370
u371:
	goto	l3495
u370:
	line	188
	
l3477:	
;FT_62F21X_pwm.c: 187: {
;FT_62F21X_pwm.c: 188: pwm_rate_value = 0;
	clrf	(_pwm_rate_value)
	line	189
	
l3479:	
;FT_62F21X_pwm.c: 189: pwm_colour_value++;
	incf	(_pwm_colour_value),f
	line	190
	
l3481:	
;FT_62F21X_pwm.c: 190: pwm_colour_value = pwm_colour_value%4;
	movlw	(03h)
	andwf	(_pwm_colour_value),f
	line	191
;FT_62F21X_pwm.c: 191: switch(pwm_colour_value)
	goto	l3493
	line	194
	
l3483:	
;FT_62F21X_pwm.c: 194: PWM1_RED();
	fcall	_PWM1_RED
	line	195
;FT_62F21X_pwm.c: 195: break;
	goto	l3495
	line	198
	
l3485:	
;FT_62F21X_pwm.c: 198: PWM1_GREEN();
	fcall	_PWM1_GREEN
	line	199
;FT_62F21X_pwm.c: 199: break;
	goto	l3495
	line	202
	
l3487:	
;FT_62F21X_pwm.c: 202: PWM1_BLUE();
	fcall	_PWM1_BLUE
	line	203
;FT_62F21X_pwm.c: 203: break;
	goto	l3495
	line	206
	
l3489:	
;FT_62F21X_pwm.c: 206: PWM1_WHITE();
	fcall	_PWM1_WHITE
	line	207
;FT_62F21X_pwm.c: 207: break;
	goto	l3495
	line	191
	
l3493:	
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
goto l3495
movlw high(S3671)
movwf pclath
	movlw low(S3671)
	addwf fsr,w
	movwf pc
psect	swtext2,local,class=CONST,delta=2
global __pswtext2
__pswtext2:
S3671:
	ljmp	l3483
	ljmp	l3485
	ljmp	l3487
	ljmp	l3489
psect	text371

	line	214
	
l3495:	
;FT_62F21X_pwm.c: 213: }
;FT_62F21X_pwm.c: 214: if(pwm_rate_value <=100)
	movlw	(065h)
	subwf	(_pwm_rate_value),w
	skipnc
	goto	u381
	goto	u380
u381:
	goto	l3499
u380:
	line	216
	
l3497:	
;FT_62F21X_pwm.c: 215: {
;FT_62F21X_pwm.c: 216: pwm_value = pwm_rate_value;
	movf	(_pwm_rate_value),w
	movwf	(PWM1_RATE_CHANGE@pwm_value)
	line	217
;FT_62F21X_pwm.c: 217: }
	goto	l3511
	line	220
	
l3499:	
;FT_62F21X_pwm.c: 218: else
;FT_62F21X_pwm.c: 219: {
;FT_62F21X_pwm.c: 220: pwm_value = 200 - pwm_rate_value;
	movf	(_pwm_rate_value),w
	sublw	0C8h
	movwf	(PWM1_RATE_CHANGE@pwm_value)
	goto	l3511
	line	226
	
l3501:	
;FT_62F21X_pwm.c: 226: P1CDTL = pwm_value;
	movf	(PWM1_RATE_CHANGE@pwm_value),w
	movwf	(16)	;volatile
	line	227
;FT_62F21X_pwm.c: 227: break;
	goto	l1432
	line	230
	
l3503:	
;FT_62F21X_pwm.c: 230: P1DDTL = pwm_value;
	movf	(PWM1_RATE_CHANGE@pwm_value),w
	movwf	(8)	;volatile
	line	231
;FT_62F21X_pwm.c: 231: break;
	goto	l1432
	line	223
	
l3511:	
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
goto l1432
movlw high(S3673)
movwf pclath
	movlw low(S3673)
	addwf fsr,w
	movwf pc
psect	swtext3,local,class=CONST,delta=2
global __pswtext3
__pswtext3:
S3673:
	ljmp	l3501
	ljmp	l3503
	ljmp	l3501
	ljmp	l3503
psect	text371

	line	246
	
l1432:	
	return
	opt stack 0
GLOBAL	__end_of_PWM1_RATE_CHANGE
	__end_of_PWM1_RATE_CHANGE:
;; =============== function _PWM1_RATE_CHANGE ends ============

	signat	_PWM1_RATE_CHANGE,88
	global	_PWM1_INITIAL
psect	text372,local,class=CODE,delta=2
global __ptext372
__ptext372:

;; *************** function _PWM1_INITIAL *****************
;; Defined at:
;;		line 21 in file "FT_62F21X_pwm.c"
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
psect	text372
	file	"FT_62F21X_pwm.c"
	line	21
	global	__size_of_PWM1_INITIAL
	__size_of_PWM1_INITIAL	equ	__end_of_PWM1_INITIAL-_PWM1_INITIAL
	
_PWM1_INITIAL:	
	opt	stack 5
; Regs used in _PWM1_INITIAL: [wreg+status,2+status,0+pclath+cstack]
	line	22
	
l3451:	
;FT_62F21X_pwm.c: 22: T2CON0=0B00000001;
	movlw	(01h)
	bcf	status, 5	;RP0=0, select bank0
	movwf	(18)	;volatile
	line	28
	
l3453:	
;FT_62F21X_pwm.c: 28: T2CON1=0B00000000;
	bsf	status, 5	;RP0=1, select bank1
	clrf	(158)^080h	;volatile
	line	33
	
l3455:	
;FT_62F21X_pwm.c: 33: TMR2H=0;
	bcf	status, 5	;RP0=0, select bank0
	clrf	(19)	;volatile
	line	34
;FT_62F21X_pwm.c: 34: TMR2L=100;
	movlw	(064h)
	movwf	(17)	;volatile
	line	36
	
l3457:	
;FT_62F21X_pwm.c: 36: PR2H=0;
	bsf	status, 5	;RP0=1, select bank1
	clrf	(146)^080h	;volatile
	line	37
	
l3459:	
;FT_62F21X_pwm.c: 37: PR2L=100;
	movlw	(064h)
	movwf	(145)^080h	;volatile
	line	39
;FT_62F21X_pwm.c: 39: P1CDTH=0;
	bcf	status, 5	;RP0=0, select bank0
	clrf	(26)	;volatile
	line	40
;FT_62F21X_pwm.c: 40: P1DDTH=0;
	clrf	(9)	;volatile
	line	41
;FT_62F21X_pwm.c: 41: P1CDTL=0;
	clrf	(16)	;volatile
	line	42
;FT_62F21X_pwm.c: 42: P1DDTL=0;
	clrf	(8)	;volatile
	line	44
;FT_62F21X_pwm.c: 44: P1POL=0B00000000;
	bsf	status, 5	;RP0=1, select bank1
	clrf	(153)^080h	;volatile
	line	51
;FT_62F21X_pwm.c: 51: P1CON=0B00000000;
	bcf	status, 5	;RP0=0, select bank0
	clrf	(22)	;volatile
	line	58
;FT_62F21X_pwm.c: 58: P1AUX=0B00000000;
	clrf	(30)	;volatile
	line	66
	
l3461:	
;FT_62F21X_pwm.c: 66: PWM1_RED();
	fcall	_PWM1_RED
	line	67
	
l3463:	
;FT_62F21X_pwm.c: 67: pwm_colour_value = 0;
	clrf	(_pwm_colour_value)
	line	69
	
l3465:	
;FT_62F21X_pwm.c: 69: TMR2IF=0;
	bcf	(97/8),(97)&7
	line	70
	
l3467:	
;FT_62F21X_pwm.c: 70: TMR2IE=1;
	bsf	status, 5	;RP0=1, select bank1
	bsf	(1121/8)^080h,(1121)&7
	line	71
	
l3469:	
;FT_62F21X_pwm.c: 71: TMR2ON=1;
	bcf	status, 5	;RP0=0, select bank0
	bsf	(146/8),(146)&7
	line	72
	
l3471:	
;FT_62F21X_pwm.c: 72: PEIE=1;
	bsf	(94/8),(94)&7
	line	73
	
l3473:	
;FT_62F21X_pwm.c: 73: GIE=1;
	bsf	(95/8),(95)&7
	line	75
	
l1400:	
	return
	opt stack 0
GLOBAL	__end_of_PWM1_INITIAL
	__end_of_PWM1_INITIAL:
;; =============== function _PWM1_INITIAL ends ============

	signat	_PWM1_INITIAL,88
	global	___lbmod
psect	text373,local,class=CODE,delta=2
global __ptext373
__ptext373:

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
;; This function uses a non-reentrant model
;;
psect	text373
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
	
l3587:	
	movlw	(08h)
	movwf	(___lbmod@counter)
	line	10
	
l3589:	
	clrf	(___lbmod@rem)
	line	12
	
l3591:	
	movf	(___lbmod@dividend),w
	movwf	(??___lbmod+0)+0
	movlw	07h
u435:
	clrc
	rrf	(??___lbmod+0)+0,f
	addlw	-1
	skipz
	goto	u435
	clrc
	rlf	(___lbmod@rem),w
	iorwf	0+(??___lbmod+0)+0,w
	movwf	(___lbmod@rem)
	line	13
	
l3593:	
	clrc
	rlf	(___lbmod@dividend),f
	line	14
	
l3595:	
	movf	(___lbmod@divisor),w
	subwf	(___lbmod@rem),w
	skipc
	goto	u441
	goto	u440
u441:
	goto	l3599
u440:
	line	15
	
l3597:	
	movf	(___lbmod@divisor),w
	subwf	(___lbmod@rem),f
	line	16
	
l3599:	
	decfsz	(___lbmod@counter),f
	goto	u451
	goto	u450
u451:
	goto	l3591
u450:
	line	17
	
l3601:	
	movf	(___lbmod@rem),w
	line	18
	
l2720:	
	return
	opt stack 0
GLOBAL	__end_of___lbmod
	__end_of___lbmod:
;; =============== function ___lbmod ends ============

	signat	___lbmod,8313
	global	_PWM1_WHITE
psect	text374,local,class=CODE,delta=2
global __ptext374
__ptext374:

;; *************** function _PWM1_WHITE *****************
;; Defined at:
;;		line 164 in file "FT_62F21X_pwm.c"
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
psect	text374
	file	"FT_62F21X_pwm.c"
	line	164
	global	__size_of_PWM1_WHITE
	__size_of_PWM1_WHITE	equ	__end_of_PWM1_WHITE-_PWM1_WHITE
	
_PWM1_WHITE:	
	opt	stack 5
; Regs used in _PWM1_WHITE: [wreg+status,2]
	line	165
	
l3427:	
;FT_62F21X_pwm.c: 165: P1CDTL=0;
	clrf	(16)	;volatile
	line	166
;FT_62F21X_pwm.c: 166: P1DDTL=0;
	clrf	(8)	;volatile
	line	168
	
l3429:	
;FT_62F21X_pwm.c: 168: P1OE=0B00100000;
	movlw	(020h)
	bsf	status, 5	;RP0=1, select bank1
	movwf	(144)^080h	;volatile
	line	176
	
l3431:	
;FT_62F21X_pwm.c: 176: P1BR1=0B00000100;
	movlw	(04h)
	bcf	status, 5	;RP0=0, select bank0
	movwf	(25)	;volatile
	line	180
	
l1412:	
	return
	opt stack 0
GLOBAL	__end_of_PWM1_WHITE
	__end_of_PWM1_WHITE:
;; =============== function _PWM1_WHITE ends ============

	signat	_PWM1_WHITE,88
	global	_PWM1_BLUE
psect	text375,local,class=CODE,delta=2
global __ptext375
__ptext375:

;; *************** function _PWM1_BLUE *****************
;; Defined at:
;;		line 145 in file "FT_62F21X_pwm.c"
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
psect	text375
	file	"FT_62F21X_pwm.c"
	line	145
	global	__size_of_PWM1_BLUE
	__size_of_PWM1_BLUE	equ	__end_of_PWM1_BLUE-_PWM1_BLUE
	
_PWM1_BLUE:	
	opt	stack 5
; Regs used in _PWM1_BLUE: [wreg+status,2]
	line	146
	
l3421:	
;FT_62F21X_pwm.c: 146: P1CDTL=0;
	clrf	(16)	;volatile
	line	147
;FT_62F21X_pwm.c: 147: P1DDTL=0;
	clrf	(8)	;volatile
	line	149
	
l3423:	
;FT_62F21X_pwm.c: 149: P1OE=0B10000000;
	movlw	(080h)
	bsf	status, 5	;RP0=1, select bank1
	movwf	(144)^080h	;volatile
	line	157
	
l3425:	
;FT_62F21X_pwm.c: 157: P1BR1=0B00000000;
	bcf	status, 5	;RP0=0, select bank0
	clrf	(25)	;volatile
	line	161
	
l1409:	
	return
	opt stack 0
GLOBAL	__end_of_PWM1_BLUE
	__end_of_PWM1_BLUE:
;; =============== function _PWM1_BLUE ends ============

	signat	_PWM1_BLUE,88
	global	_PWM1_GREEN
psect	text376,local,class=CODE,delta=2
global __ptext376
__ptext376:

;; *************** function _PWM1_GREEN *****************
;; Defined at:
;;		line 112 in file "FT_62F21X_pwm.c"
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
;;		_PWM1_RATE_CHANGE
;; This function uses a non-reentrant model
;;
psect	text376
	file	"FT_62F21X_pwm.c"
	line	112
	global	__size_of_PWM1_GREEN
	__size_of_PWM1_GREEN	equ	__end_of_PWM1_GREEN-_PWM1_GREEN
	
_PWM1_GREEN:	
	opt	stack 5
; Regs used in _PWM1_GREEN: [status,2]
	line	129
	
l3419:	
;FT_62F21X_pwm.c: 129: P1CDTL=0;
	clrf	(16)	;volatile
	line	131
;FT_62F21X_pwm.c: 131: P1OE=0B00000000;
	bsf	status, 5	;RP0=1, select bank1
	clrf	(144)^080h	;volatile
	line	139
;FT_62F21X_pwm.c: 139: P1BR1=0B00000000;
	bcf	status, 5	;RP0=0, select bank0
	clrf	(25)	;volatile
	line	142
	
l1406:	
	return
	opt stack 0
GLOBAL	__end_of_PWM1_GREEN
	__end_of_PWM1_GREEN:
;; =============== function _PWM1_GREEN ends ============

	signat	_PWM1_GREEN,88
	global	_PWM1_RED
psect	text377,local,class=CODE,delta=2
global __ptext377
__ptext377:

;; *************** function _PWM1_RED *****************
;; Defined at:
;;		line 79 in file "FT_62F21X_pwm.c"
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
;;		_PWM1_INITIAL
;;		_PWM1_RATE_CHANGE
;; This function uses a non-reentrant model
;;
psect	text377
	file	"FT_62F21X_pwm.c"
	line	79
	global	__size_of_PWM1_RED
	__size_of_PWM1_RED	equ	__end_of_PWM1_RED-_PWM1_RED
	
_PWM1_RED:	
	opt	stack 5
; Regs used in _PWM1_RED: [status,2]
	line	96
	
l3417:	
;FT_62F21X_pwm.c: 96: P1CDTL=0;
	clrf	(16)	;volatile
	line	98
;FT_62F21X_pwm.c: 98: P1OE=0B00000000;
	bsf	status, 5	;RP0=1, select bank1
	clrf	(144)^080h	;volatile
	line	106
;FT_62F21X_pwm.c: 106: P1BR1=0B00000000;
	bcf	status, 5	;RP0=0, select bank0
	clrf	(25)	;volatile
	line	109
	
l1403:	
	return
	opt stack 0
GLOBAL	__end_of_PWM1_RED
	__end_of_PWM1_RED:
;; =============== function _PWM1_RED ends ============

	signat	_PWM1_RED,88
	global	_PA3_Level_Change_INITIAL
psect	text378,local,class=CODE,delta=2
global __ptext378
__ptext378:

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
psect	text378
	file	"FT_62F21x_IR.c"
	line	37
	global	__size_of_PA3_Level_Change_INITIAL
	__size_of_PA3_Level_Change_INITIAL	equ	__end_of_PA3_Level_Change_INITIAL-_PA3_Level_Change_INITIAL
	
_PA3_Level_Change_INITIAL:	
	opt	stack 6
; Regs used in _PA3_Level_Change_INITIAL: [wreg]
	line	38
	
l3407:	
;FT_62F21x_IR.c: 38: TRISA3 =1;
	bsf	status, 5	;RP0=1, select bank1
	bsf	(1067/8)^080h,(1067)&7
	line	39
	
l3409:	
;FT_62F21x_IR.c: 39: ReadAPin = PORTA;
	bcf	status, 5	;RP0=0, select bank0
	movf	(5),w	;volatile
	line	40
	
l3411:	
;FT_62F21x_IR.c: 40: PAIF =0;
	bcf	(88/8),(88)&7
	line	41
	
l3413:	
;FT_62F21x_IR.c: 41: IOCA3 =1;
	bsf	status, 5	;RP0=1, select bank1
	bsf	(1203/8)^080h,(1203)&7
	line	42
	
l3415:	
;FT_62F21x_IR.c: 42: PAIE =1;
	bsf	(91/8),(91)&7
	line	43
	
l2120:	
	return
	opt stack 0
GLOBAL	__end_of_PA3_Level_Change_INITIAL
	__end_of_PA3_Level_Change_INITIAL:
;; =============== function _PA3_Level_Change_INITIAL ends ============

	signat	_PA3_Level_Change_INITIAL,88
	global	_TIMER0_INITIAL
psect	text379,local,class=CODE,delta=2
global __ptext379
__ptext379:

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
psect	text379
	file	"FT_62F21x_IR.c"
	line	19
	global	__size_of_TIMER0_INITIAL
	__size_of_TIMER0_INITIAL	equ	__end_of_TIMER0_INITIAL-_TIMER0_INITIAL
	
_TIMER0_INITIAL:	
	opt	stack 6
; Regs used in _TIMER0_INITIAL: [wreg]
	line	20
	
l3403:	
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
	
l3405:	
;FT_62F21x_IR.c: 28: T0IF = 0;
	bcf	(90/8),(90)&7
	line	29
	
l2117:	
	return
	opt stack 0
GLOBAL	__end_of_TIMER0_INITIAL
	__end_of_TIMER0_INITIAL:
;; =============== function _TIMER0_INITIAL ends ============

	signat	_TIMER0_INITIAL,88
	global	_POWER_INITIAL
psect	text380,local,class=CODE,delta=2
global __ptext380
__ptext380:

;; *************** function _POWER_INITIAL *****************
;; Defined at:
;;		line 105 in file "TEST_FT62F21X_SLEEP.C"
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
psect	text380
	file	"TEST_FT62F21X_SLEEP.C"
	line	105
	global	__size_of_POWER_INITIAL
	__size_of_POWER_INITIAL	equ	__end_of_POWER_INITIAL-_POWER_INITIAL
	
_POWER_INITIAL:	
	opt	stack 6
; Regs used in _POWER_INITIAL: [wreg+status,2]
	line	106
	
l3393:	
;TEST_FT62F21X_SLEEP.C: 106: OSCCON = 0X00|0X70|0X00;
	movlw	(070h)
	bsf	status, 5	;RP0=1, select bank1
	movwf	(143)^080h	;volatile
	line	109
	
l3395:	
;TEST_FT62F21X_SLEEP.C: 109: INTCON = 0;
	clrf	(11)	;volatile
	line	111
	
l3397:	
;TEST_FT62F21X_SLEEP.C: 111: PORTA = 0B00000000;
	bcf	status, 5	;RP0=0, select bank0
	clrf	(5)	;volatile
	line	112
;TEST_FT62F21X_SLEEP.C: 112: TRISA = 0B00010000;
	movlw	(010h)
	bsf	status, 5	;RP0=1, select bank1
	movwf	(133)^080h	;volatile
	line	113
	
l3399:	
;TEST_FT62F21X_SLEEP.C: 113: WPUA = 0B00000000;
	clrf	(149)^080h	;volatile
	line	115
	
l3401:	
;TEST_FT62F21X_SLEEP.C: 115: OPTION = 0B00001000;
	movlw	(08h)
	movwf	(129)^080h	;volatile
	line	117
;TEST_FT62F21X_SLEEP.C: 117: MSCON = 0B00000000;
	bcf	status, 5	;RP0=0, select bank0
	clrf	(27)	;volatile
	line	118
	
l702:	
	return
	opt stack 0
GLOBAL	__end_of_POWER_INITIAL
	__end_of_POWER_INITIAL:
;; =============== function _POWER_INITIAL ends ============

	signat	_POWER_INITIAL,88
	global	_ISR
psect	text381,local,class=CODE,delta=2
global __ptext381
__ptext381:

;; *************** function _ISR *****************
;; Defined at:
;;		line 34 in file "TEST_FT62F21X_SLEEP.C"
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
psect	text381
	file	"TEST_FT62F21X_SLEEP.C"
	line	34
	global	__size_of_ISR
	__size_of_ISR	equ	__end_of_ISR-_ISR
	
_ISR:	
	opt	stack 5
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
psect	text381
	line	37
	
i1l3333:	
;TEST_FT62F21X_SLEEP.C: 37: if(TMR2IE && TMR2IF)
	bsf	status, 5	;RP0=1, select bank1
	btfss	(1121/8)^080h,(1121)&7
	goto	u22_21
	goto	u22_20
u22_21:
	goto	i1l3341
u22_20:
	
i1l3335:	
	bcf	status, 5	;RP0=0, select bank0
	btfss	(97/8),(97)&7
	goto	u23_21
	goto	u23_20
u23_21:
	goto	i1l3341
u23_20:
	line	39
	
i1l3337:	
;TEST_FT62F21X_SLEEP.C: 38: {
;TEST_FT62F21X_SLEEP.C: 39: TMR2IF = 0;
	bcf	(97/8),(97)&7
	line	40
	
i1l3339:	
;TEST_FT62F21X_SLEEP.C: 40: time_15ms_cnt++;
	incf	(_time_15ms_cnt),f
	line	46
	
i1l3341:	
;TEST_FT62F21X_SLEEP.C: 42: }
;TEST_FT62F21X_SLEEP.C: 46: if(T0IE && T0IF)
	btfss	(93/8),(93)&7
	goto	u24_21
	goto	u24_20
u24_21:
	goto	i1l3357
u24_20:
	
i1l3343:	
	btfss	(90/8),(90)&7
	goto	u25_21
	goto	u25_20
u25_21:
	goto	i1l3357
u25_20:
	line	48
	
i1l3345:	
;TEST_FT62F21X_SLEEP.C: 47: {
;TEST_FT62F21X_SLEEP.C: 48: TMR0 = 140;
	movlw	(08Ch)
	bcf	status, 5	;RP0=0, select bank0
	movwf	(1)	;volatile
	line	50
	
i1l3347:	
;TEST_FT62F21X_SLEEP.C: 50: T0IF = 0;
	bcf	(90/8),(90)&7
	line	51
	
i1l3349:	
;TEST_FT62F21X_SLEEP.C: 51: IRbitTime++;
	incf	(_IRbitTime),f
	line	52
	
i1l3351:	
;TEST_FT62F21X_SLEEP.C: 52: if(IRbitTime > 50)
	movlw	(033h)
	subwf	(_IRbitTime),w
	skipc
	goto	u26_21
	goto	u26_20
u26_21:
	goto	i1l3357
u26_20:
	line	54
	
i1l3353:	
;TEST_FT62F21X_SLEEP.C: 53: {
;TEST_FT62F21X_SLEEP.C: 54: T0IE = 0;
	bcf	(93/8),(93)&7
	line	55
	
i1l3355:	
;TEST_FT62F21X_SLEEP.C: 55: IRbitTime = 0;
	clrf	(_IRbitTime)
	line	60
	
i1l3357:	
;TEST_FT62F21X_SLEEP.C: 56: }
;TEST_FT62F21X_SLEEP.C: 57: }
;TEST_FT62F21X_SLEEP.C: 60: if(PAIE && PAIF)
	btfss	(91/8),(91)&7
	goto	u27_21
	goto	u27_20
u27_21:
	goto	i1l699
u27_20:
	
i1l3359:	
	btfss	(88/8),(88)&7
	goto	u28_21
	goto	u28_20
u28_21:
	goto	i1l699
u28_20:
	line	62
	
i1l3361:	
;TEST_FT62F21X_SLEEP.C: 61: {
;TEST_FT62F21X_SLEEP.C: 62: ReadAPin = PORTA;
	bcf	status, 5	;RP0=0, select bank0
	movf	(5),w	;volatile
	line	63
	
i1l3363:	
;TEST_FT62F21X_SLEEP.C: 63: PAIF = 0;
	bcf	(88/8),(88)&7
	line	64
	
i1l3365:	
;TEST_FT62F21X_SLEEP.C: 64: if(RA3 == 0)
	btfsc	(43/8),(43)&7
	goto	u29_21
	goto	u29_20
u29_21:
	goto	i1l699
u29_20:
	line	66
	
i1l3367:	
;TEST_FT62F21X_SLEEP.C: 65: {
;TEST_FT62F21X_SLEEP.C: 66: T0IE = 1;
	bsf	(93/8),(93)&7
	line	67
	
i1l3369:	
;TEST_FT62F21X_SLEEP.C: 67: if(IRbitTime > 21)
	movlw	(016h)
	subwf	(_IRbitTime),w
	skipc
	goto	u30_21
	goto	u30_20
u30_21:
	goto	i1l3373
u30_20:
	line	69
	
i1l3371:	
;TEST_FT62F21X_SLEEP.C: 68: {
;TEST_FT62F21X_SLEEP.C: 69: IRDataTimer[0] = 0;
	clrf	(_IRDataTimer)
	line	70
;TEST_FT62F21X_SLEEP.C: 70: IRDataTimer[1] = 0;
	clrf	0+(_IRDataTimer)+01h
	line	71
;TEST_FT62F21X_SLEEP.C: 71: IRDataTimer[2] = 0;
	clrf	0+(_IRDataTimer)+02h
	line	72
;TEST_FT62F21X_SLEEP.C: 72: IRDataTimer[3] = 0;
	clrf	0+(_IRDataTimer)+03h
	line	73
;TEST_FT62F21X_SLEEP.C: 73: IRbitNum = 0;
	clrf	(_IRbitNum)
	line	74
;TEST_FT62F21X_SLEEP.C: 74: bitdata = 0x00;
	clrf	(_bitdata)
	line	75
;TEST_FT62F21X_SLEEP.C: 75: }
	goto	i1l3377
	line	76
	
i1l3373:	
;TEST_FT62F21X_SLEEP.C: 76: else if(IRbitTime > 3)
	movlw	(04h)
	subwf	(_IRbitTime),w
	skipc
	goto	u31_21
	goto	u31_20
u31_21:
	goto	i1l3377
u31_20:
	line	78
	
i1l3375:	
;TEST_FT62F21X_SLEEP.C: 77: {
;TEST_FT62F21X_SLEEP.C: 78: IRDataTimer[IRbitNum-1] |= bitdata;
	movf	(_IRbitNum),w
	addlw	_IRDataTimer+-1&0ffh
	movwf	fsr0
	movf	(_bitdata),w
	bcf	status, 7	;select IRP bank0
	iorwf	indf,f
	line	80
	
i1l3377:	
;TEST_FT62F21X_SLEEP.C: 79: }
;TEST_FT62F21X_SLEEP.C: 80: IRbitTime = 0;
	clrf	(_IRbitTime)
	line	81
	
i1l3379:	
;TEST_FT62F21X_SLEEP.C: 81: bitdata<<=1;
	clrc
	rlf	(_bitdata),f
	line	82
	
i1l3381:	
;TEST_FT62F21X_SLEEP.C: 82: if(bitdata == 0)
	movf	(_bitdata),f
	skipz
	goto	u32_21
	goto	u32_20
u32_21:
	goto	i1l3387
u32_20:
	line	84
	
i1l3383:	
;TEST_FT62F21X_SLEEP.C: 83: {
;TEST_FT62F21X_SLEEP.C: 84: bitdata = 0x01;
	clrf	(_bitdata)
	incf	(_bitdata),f
	line	85
	
i1l3385:	
;TEST_FT62F21X_SLEEP.C: 85: IRbitNum++;
	incf	(_IRbitNum),f
	line	87
	
i1l3387:	
;TEST_FT62F21X_SLEEP.C: 86: }
;TEST_FT62F21X_SLEEP.C: 87: if(IRbitNum > 4)
	movlw	(05h)
	subwf	(_IRbitNum),w
	skipc
	goto	u33_21
	goto	u33_20
u33_21:
	goto	i1l699
u33_20:
	line	89
	
i1l3389:	
;TEST_FT62F21X_SLEEP.C: 88: {
;TEST_FT62F21X_SLEEP.C: 89: IRbitNum = 0;
	clrf	(_IRbitNum)
	line	90
	
i1l3391:	
;TEST_FT62F21X_SLEEP.C: 91: ReceiveFinish = 1;
	bcf	(93/8),(93)&7
	line	96
	
i1l699:	
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
psect	text382,local,class=CODE,delta=2
global __ptext382
__ptext382:
	global	btemp
	btemp set 07Eh

	DABS	1,126,2	;btemp
	global	wtemp0
	wtemp0 set btemp
	end
