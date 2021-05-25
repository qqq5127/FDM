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
	FNCALL	_PWM1_RATE_CHANGE,_PWM1_RED
	FNCALL	_PWM1_RATE_CHANGE,_PWM1_GREEN
	FNCALL	_PWM1_RATE_CHANGE,_PWM1_BLUE
	FNCALL	_PWM1_RATE_CHANGE,_PWM1_WHITE
	FNCALL	_PWM1_INITIAL,_PWM1_BLUE
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
	global	_IRbitNum
	global	_IRbitTime
	global	_pwm_colour_value
	global	_pwm_rate_value
	global	_time_15ms_cnt
	global	_INTCON
_INTCON	set	11
	global	_MSCON
_MSCON	set	27
	global	_P1ADTH
_P1ADTH	set	20
	global	_P1ADTL
_P1ADTL	set	14
	global	_P1AUX
_P1AUX	set	30
	global	_P1BR1
_P1BR1	set	25
	global	_P1CON
_P1CON	set	22
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
_IRDataTimer:
       ds      4

_IRbitNum:
       ds      1

_IRbitTime:
       ds      1

_pwm_colour_value:
       ds      1

_pwm_rate_value:
       ds      1

_time_15ms_cnt:
       ds      1

psect	dataCOMMON,class=COMMON,space=1
global __pdataCOMMON
__pdataCOMMON:
	file	"FT_62F21x_IR.c"
_bitdata:
       ds      1

; Clear objects allocated to COMMON
psect cinit,class=CODE,delta=2
	clrf	((__pbssCOMMON)+0)&07Fh
	clrf	((__pbssCOMMON)+1)&07Fh
	clrf	((__pbssCOMMON)+2)&07Fh
	clrf	((__pbssCOMMON)+3)&07Fh
	clrf	((__pbssCOMMON)+4)&07Fh
	clrf	((__pbssCOMMON)+5)&07Fh
	clrf	((__pbssCOMMON)+6)&07Fh
	clrf	((__pbssCOMMON)+7)&07Fh
	clrf	((__pbssCOMMON)+8)&07Fh
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
	global	?_PWM1_BLUE
?_PWM1_BLUE:	; 0 bytes @ 0x0
	global	?_ISR
?_ISR:	; 0 bytes @ 0x0
	global	??_ISR
??_ISR:	; 0 bytes @ 0x0
	global	?_POWER_INITIAL
?_POWER_INITIAL:	; 0 bytes @ 0x0
	global	?_main
?_main:	; 0 bytes @ 0x0
	global	?_PWM1_RED
?_PWM1_RED:	; 0 bytes @ 0x0
	global	?_PWM1_GREEN
?_PWM1_GREEN:	; 0 bytes @ 0x0
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
	global	??_PWM1_BLUE
??_PWM1_BLUE:	; 0 bytes @ 0x3
	global	??_POWER_INITIAL
??_POWER_INITIAL:	; 0 bytes @ 0x3
	global	??_main
??_main:	; 0 bytes @ 0x3
	global	??_PWM1_RED
??_PWM1_RED:	; 0 bytes @ 0x3
	global	??_PWM1_GREEN
??_PWM1_GREEN:	; 0 bytes @ 0x3
	global	??_PWM1_WHITE
??_PWM1_WHITE:	; 0 bytes @ 0x3
;;Data sizes: Strings 0, constant 0, data 1, bss 9, persistent 0 stack 0
;;Auto spaces:   Size  Autos    Used
;; COMMON          14      3      13
;; BANK0           48      0       0

;;
;; Pointer list with targets:



;;
;; Critical Paths under _main in COMMON
;;
;;   None.
;;
;; Critical Paths under _ISR in COMMON
;;
;;   None.
;;
;; Critical Paths under _main in BANK0
;;
;;   None.
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
;; (0) _main                                                 0     0      0       0
;;                      _POWER_INITIAL
;;                     _TIMER0_INITIAL
;;           _PA3_Level_Change_INITIAL
;;                       _PWM1_INITIAL
;;                   _PWM1_RATE_CHANGE
;; ---------------------------------------------------------------------------------
;; (1) _PWM1_RATE_CHANGE                                     0     0      0       0
;;                           _PWM1_RED
;;                         _PWM1_GREEN
;;                          _PWM1_BLUE
;;                         _PWM1_WHITE
;; ---------------------------------------------------------------------------------
;; (1) _PWM1_INITIAL                                         0     0      0       0
;;                          _PWM1_BLUE
;; ---------------------------------------------------------------------------------
;; (2) _PWM1_WHITE                                           0     0      0       0
;; ---------------------------------------------------------------------------------
;; (2) _PWM1_GREEN                                           0     0      0       0
;; ---------------------------------------------------------------------------------
;; (2) _PWM1_RED                                             0     0      0       0
;; ---------------------------------------------------------------------------------
;; (2) _PWM1_BLUE                                            0     0      0       0
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
;;     _PWM1_BLUE
;;   _PWM1_RATE_CHANGE
;;     _PWM1_RED
;;     _PWM1_GREEN
;;     _PWM1_BLUE
;;     _PWM1_WHITE
;;
;; _ISR (ROOT)
;;

;; Address spaces:

;;Name               Size   Autos  Total    Cost      Usage
;;SFR1                 0      0       0       2        0.0%
;;BITSFR1              0      0       0       2        0.0%
;;CODE                 0      0       0       0        0.0%
;;DATA                 0      0       F       3        0.0%
;;ABS                  0      0       D       6        0.0%
;;NULL                 0      0       0       0        0.0%
;;STACK                0      0       2       2        0.0%
;;BANK0               30      0       0       5        0.0%
;;BITBANK0            30      0       0       4        0.0%
;;SFR0                 0      0       0       1        0.0%
;;BITSFR0              0      0       0       1        0.0%
;;COMMON               E      3       D       1       92.9%
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
;;		wreg, status,2, status,0, pclath, cstack
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
; Regs used in _main: [wreg+status,2+status,0+pclath+cstack]
	line	175
	
l3178:	
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
	
l3180:	
# 182 "TEST_FT62F21X_SLEEP.C"
clrwdt ;#
psect	maintext
	line	183
	
l3182:	
;TEST_FT62F21X_SLEEP.C: 183: if(time_15ms_cnt > 15)
	movlw	(010h)
	subwf	(_time_15ms_cnt),w
	skipc
	goto	u191
	goto	u190
u191:
	goto	l3180
u190:
	line	185
	
l3184:	
;TEST_FT62F21X_SLEEP.C: 184: {
;TEST_FT62F21X_SLEEP.C: 185: time_15ms_cnt = 0;
	clrf	(_time_15ms_cnt)
	line	186
	
l3186:	
;TEST_FT62F21X_SLEEP.C: 186: pwm_rate_value++;
	incf	(_pwm_rate_value),f
	line	187
	
l3188:	
;TEST_FT62F21X_SLEEP.C: 187: PWM1_RATE_CHANGE();
	fcall	_PWM1_RATE_CHANGE
	goto	l3180
	global	start
	ljmp	start
	opt stack 0
psect	maintext
	line	190
GLOBAL	__end_of_main
	__end_of_main:
;; =============== function _main ends ============

	signat	_main,88
	global	_PWM1_RATE_CHANGE
psect	text129,local,class=CODE,delta=2
global __ptext129
__ptext129:

;; *************** function _PWM1_RATE_CHANGE *****************
;; Defined at:
;;		line 146 in file "FT_62F21X_pwm.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, status,2, status,0, pclath, cstack
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
psect	text129
	file	"FT_62F21X_pwm.c"
	line	146
	global	__size_of_PWM1_RATE_CHANGE
	__size_of_PWM1_RATE_CHANGE	equ	__end_of_PWM1_RATE_CHANGE-_PWM1_RATE_CHANGE
	
_PWM1_RATE_CHANGE:	
	opt	stack 5
; Regs used in _PWM1_RATE_CHANGE: [wreg+status,2+status,0+pclath+cstack]
	line	147
	
l3148:	
;FT_62F21X_pwm.c: 147: if(pwm_rate_value >= 200)
	movlw	(0C8h)
	subwf	(_pwm_rate_value),w
	skipc
	goto	u131
	goto	u130
u131:
	goto	l3172
u130:
	line	149
	
l3150:	
;FT_62F21X_pwm.c: 148: {
;FT_62F21X_pwm.c: 149: pwm_rate_value = 0;
	clrf	(_pwm_rate_value)
	line	150
	
l3152:	
;FT_62F21X_pwm.c: 150: pwm_colour_value++;
	incf	(_pwm_colour_value),f
	line	151
	
l3154:	
;FT_62F21X_pwm.c: 151: pwm_colour_value = pwm_colour_value%4;
	movlw	(03h)
	andwf	(_pwm_colour_value),f
	line	152
	
l3156:	
;FT_62F21X_pwm.c: 152: if(pwm_colour_value == 0)
	movf	(_pwm_colour_value),f
	skipz
	goto	u141
	goto	u140
u141:
	goto	l3160
u140:
	line	154
	
l3158:	
;FT_62F21X_pwm.c: 153: {
;FT_62F21X_pwm.c: 154: PWM1_RED();
	fcall	_PWM1_RED
	line	155
;FT_62F21X_pwm.c: 155: }
	goto	l3172
	line	156
	
l3160:	
;FT_62F21X_pwm.c: 156: else if(pwm_colour_value == 1)
	decf	(_pwm_colour_value),w
	skipz
	goto	u151
	goto	u150
u151:
	goto	l3164
u150:
	line	158
	
l3162:	
;FT_62F21X_pwm.c: 157: {
;FT_62F21X_pwm.c: 158: PWM1_GREEN();
	fcall	_PWM1_GREEN
	line	159
;FT_62F21X_pwm.c: 159: }
	goto	l3172
	line	160
	
l3164:	
;FT_62F21X_pwm.c: 160: else if(pwm_colour_value == 2)
	movf	(_pwm_colour_value),w
	xorlw	02h
	skipz
	goto	u161
	goto	u160
u161:
	goto	l3168
u160:
	line	162
	
l3166:	
;FT_62F21X_pwm.c: 161: {
;FT_62F21X_pwm.c: 162: PWM1_BLUE();
	fcall	_PWM1_BLUE
	line	163
;FT_62F21X_pwm.c: 163: }
	goto	l3172
	line	164
	
l3168:	
;FT_62F21X_pwm.c: 164: else if(pwm_colour_value == 3)
	movf	(_pwm_colour_value),w
	xorlw	03h
	skipz
	goto	u171
	goto	u170
u171:
	goto	l1407
u170:
	line	166
	
l3170:	
;FT_62F21X_pwm.c: 165: {
;FT_62F21X_pwm.c: 166: PWM1_WHITE();
	fcall	_PWM1_WHITE
	goto	l3172
	line	168
	
l1407:	
	line	169
	
l3172:	
;FT_62F21X_pwm.c: 167: }
;FT_62F21X_pwm.c: 168: }
;FT_62F21X_pwm.c: 169: if(pwm_rate_value <=100)
	movlw	(065h)
	subwf	(_pwm_rate_value),w
	skipnc
	goto	u181
	goto	u180
u181:
	goto	l3176
u180:
	line	171
	
l3174:	
;FT_62F21X_pwm.c: 170: {
;FT_62F21X_pwm.c: 171: P1ADTL = pwm_rate_value;
	movf	(_pwm_rate_value),w
	bcf	status, 5	;RP0=0, select bank0
	movwf	(14)	;volatile
	line	172
;FT_62F21X_pwm.c: 172: }
	goto	l1415
	line	175
	
l3176:	
;FT_62F21X_pwm.c: 173: else
;FT_62F21X_pwm.c: 174: {
;FT_62F21X_pwm.c: 175: P1ADTL = 200 - pwm_rate_value;
	movf	(_pwm_rate_value),w
	sublw	0C8h
	bcf	status, 5	;RP0=0, select bank0
	movwf	(14)	;volatile
	line	177
	
l1415:	
	return
	opt stack 0
GLOBAL	__end_of_PWM1_RATE_CHANGE
	__end_of_PWM1_RATE_CHANGE:
;; =============== function _PWM1_RATE_CHANGE ends ============

	signat	_PWM1_RATE_CHANGE,88
	global	_PWM1_INITIAL
psect	text130,local,class=CODE,delta=2
global __ptext130
__ptext130:

;; *************** function _PWM1_INITIAL *****************
;; Defined at:
;;		line 14 in file "FT_62F21X_pwm.c"
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
;;		_PWM1_BLUE
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text130
	file	"FT_62F21X_pwm.c"
	line	14
	global	__size_of_PWM1_INITIAL
	__size_of_PWM1_INITIAL	equ	__end_of_PWM1_INITIAL-_PWM1_INITIAL
	
_PWM1_INITIAL:	
	opt	stack 5
; Regs used in _PWM1_INITIAL: [wreg+status,2+status,0+pclath+cstack]
	line	15
	
l3126:	
;FT_62F21X_pwm.c: 15: T2CON0=0B00000001;
	movlw	(01h)
	bcf	status, 5	;RP0=0, select bank0
	movwf	(18)	;volatile
	line	21
	
l3128:	
;FT_62F21X_pwm.c: 21: T2CON1=0B00000000;
	bsf	status, 5	;RP0=1, select bank1
	clrf	(158)^080h	;volatile
	line	26
	
l3130:	
;FT_62F21X_pwm.c: 26: TMR2H=0;
	bcf	status, 5	;RP0=0, select bank0
	clrf	(19)	;volatile
	line	27
;FT_62F21X_pwm.c: 27: TMR2L=100;
	movlw	(064h)
	movwf	(17)	;volatile
	line	29
	
l3132:	
;FT_62F21X_pwm.c: 29: PR2H=0;
	bsf	status, 5	;RP0=1, select bank1
	clrf	(146)^080h	;volatile
	line	30
	
l3134:	
;FT_62F21X_pwm.c: 30: PR2L=100;
	movlw	(064h)
	movwf	(145)^080h	;volatile
	line	31
;FT_62F21X_pwm.c: 31: P1ADTH=0;
	bcf	status, 5	;RP0=0, select bank0
	clrf	(20)	;volatile
	line	34
;FT_62F21X_pwm.c: 34: P1POL=0B00000000;
	bsf	status, 5	;RP0=1, select bank1
	clrf	(153)^080h	;volatile
	line	41
;FT_62F21X_pwm.c: 41: P1CON=0B00000000;
	bcf	status, 5	;RP0=0, select bank0
	clrf	(22)	;volatile
	line	48
;FT_62F21X_pwm.c: 48: P1AUX=0B00000000;
	clrf	(30)	;volatile
	line	59
	
l3136:	
;FT_62F21X_pwm.c: 59: PWM1_BLUE();
	fcall	_PWM1_BLUE
	line	62
	
l3138:	
;FT_62F21X_pwm.c: 62: TMR2IF=0;
	bcf	(97/8),(97)&7
	line	63
	
l3140:	
;FT_62F21X_pwm.c: 63: TMR2IE=1;
	bsf	status, 5	;RP0=1, select bank1
	bsf	(1121/8)^080h,(1121)&7
	line	64
	
l3142:	
;FT_62F21X_pwm.c: 64: TMR2ON=1;
	bcf	status, 5	;RP0=0, select bank0
	bsf	(146/8),(146)&7
	line	65
	
l3144:	
;FT_62F21X_pwm.c: 65: PEIE=1;
	bsf	(94/8),(94)&7
	line	66
	
l3146:	
;FT_62F21X_pwm.c: 66: GIE=1;
	bsf	(95/8),(95)&7
	line	68
	
l1390:	
	return
	opt stack 0
GLOBAL	__end_of_PWM1_INITIAL
	__end_of_PWM1_INITIAL:
;; =============== function _PWM1_INITIAL ends ============

	signat	_PWM1_INITIAL,88
	global	_PWM1_WHITE
psect	text131,local,class=CODE,delta=2
global __ptext131
__ptext131:

;; *************** function _PWM1_WHITE *****************
;; Defined at:
;;		line 128 in file "FT_62F21X_pwm.c"
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
;; This function uses a non-reentrant model
;;
psect	text131
	file	"FT_62F21X_pwm.c"
	line	128
	global	__size_of_PWM1_WHITE
	__size_of_PWM1_WHITE	equ	__end_of_PWM1_WHITE-_PWM1_WHITE
	
_PWM1_WHITE:	
	opt	stack 5
; Regs used in _PWM1_WHITE: [wreg+status,2]
	line	129
	
l3120:	
;FT_62F21X_pwm.c: 129: P1ADTL=0;
	bcf	status, 5	;RP0=0, select bank0
	clrf	(14)	;volatile
	line	131
	
l3122:	
;FT_62F21X_pwm.c: 131: P1OE=0B00100000;
	movlw	(020h)
	bsf	status, 5	;RP0=1, select bank1
	movwf	(144)^080h	;volatile
	line	139
	
l3124:	
;FT_62F21X_pwm.c: 139: P1BR1=0B00000100;
	movlw	(04h)
	bcf	status, 5	;RP0=0, select bank0
	movwf	(25)	;volatile
	line	143
	
l1402:	
	return
	opt stack 0
GLOBAL	__end_of_PWM1_WHITE
	__end_of_PWM1_WHITE:
;; =============== function _PWM1_WHITE ends ============

	signat	_PWM1_WHITE,88
	global	_PWM1_GREEN
psect	text132,local,class=CODE,delta=2
global __ptext132
__ptext132:

;; *************** function _PWM1_GREEN *****************
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
;;		_PWM1_RATE_CHANGE
;; This function uses a non-reentrant model
;;
psect	text132
	file	"FT_62F21X_pwm.c"
	line	91
	global	__size_of_PWM1_GREEN
	__size_of_PWM1_GREEN	equ	__end_of_PWM1_GREEN-_PWM1_GREEN
	
_PWM1_GREEN:	
	opt	stack 5
; Regs used in _PWM1_GREEN: [wreg+status,2]
	line	92
	
l3114:	
;FT_62F21X_pwm.c: 92: P1ADTL=0;
	bcf	status, 5	;RP0=0, select bank0
	clrf	(14)	;volatile
	line	94
	
l3116:	
;FT_62F21X_pwm.c: 94: P1OE=0B00100000;
	movlw	(020h)
	bsf	status, 5	;RP0=1, select bank1
	movwf	(144)^080h	;volatile
	line	102
	
l3118:	
;FT_62F21X_pwm.c: 102: P1BR1=0B00000000;
	bcf	status, 5	;RP0=0, select bank0
	clrf	(25)	;volatile
	line	107
	
l1396:	
	return
	opt stack 0
GLOBAL	__end_of_PWM1_GREEN
	__end_of_PWM1_GREEN:
;; =============== function _PWM1_GREEN ends ============

	signat	_PWM1_GREEN,88
	global	_PWM1_RED
psect	text133,local,class=CODE,delta=2
global __ptext133
__ptext133:

;; *************** function _PWM1_RED *****************
;; Defined at:
;;		line 72 in file "FT_62F21X_pwm.c"
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
;; This function uses a non-reentrant model
;;
psect	text133
	file	"FT_62F21X_pwm.c"
	line	72
	global	__size_of_PWM1_RED
	__size_of_PWM1_RED	equ	__end_of_PWM1_RED-_PWM1_RED
	
_PWM1_RED:	
	opt	stack 5
; Regs used in _PWM1_RED: [wreg+status,2]
	line	73
	
l3108:	
;FT_62F21X_pwm.c: 73: P1ADTL=0;
	bcf	status, 5	;RP0=0, select bank0
	clrf	(14)	;volatile
	line	75
	
l3110:	
;FT_62F21X_pwm.c: 75: P1OE=0B10000000;
	movlw	(080h)
	bsf	status, 5	;RP0=1, select bank1
	movwf	(144)^080h	;volatile
	line	83
	
l3112:	
;FT_62F21X_pwm.c: 83: P1BR1=0B00001000;
	movlw	(08h)
	bcf	status, 5	;RP0=0, select bank0
	movwf	(25)	;volatile
	line	88
	
l1393:	
	return
	opt stack 0
GLOBAL	__end_of_PWM1_RED
	__end_of_PWM1_RED:
;; =============== function _PWM1_RED ends ============

	signat	_PWM1_RED,88
	global	_PWM1_BLUE
psect	text134,local,class=CODE,delta=2
global __ptext134
__ptext134:

;; *************** function _PWM1_BLUE *****************
;; Defined at:
;;		line 110 in file "FT_62F21X_pwm.c"
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
;; This function uses a non-reentrant model
;;
psect	text134
	file	"FT_62F21X_pwm.c"
	line	110
	global	__size_of_PWM1_BLUE
	__size_of_PWM1_BLUE	equ	__end_of_PWM1_BLUE-_PWM1_BLUE
	
_PWM1_BLUE:	
	opt	stack 5
; Regs used in _PWM1_BLUE: [wreg+status,2]
	line	111
	
l3102:	
;FT_62F21X_pwm.c: 111: P1ADTL=0;
	bcf	status, 5	;RP0=0, select bank0
	clrf	(14)	;volatile
	line	113
	
l3104:	
;FT_62F21X_pwm.c: 113: P1OE=0B10000000;
	movlw	(080h)
	bsf	status, 5	;RP0=1, select bank1
	movwf	(144)^080h	;volatile
	line	121
	
l3106:	
;FT_62F21X_pwm.c: 121: P1BR1=0B00000000;
	bcf	status, 5	;RP0=0, select bank0
	clrf	(25)	;volatile
	line	125
	
l1399:	
	return
	opt stack 0
GLOBAL	__end_of_PWM1_BLUE
	__end_of_PWM1_BLUE:
;; =============== function _PWM1_BLUE ends ============

	signat	_PWM1_BLUE,88
	global	_PA3_Level_Change_INITIAL
psect	text135,local,class=CODE,delta=2
global __ptext135
__ptext135:

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
psect	text135
	file	"FT_62F21x_IR.c"
	line	37
	global	__size_of_PA3_Level_Change_INITIAL
	__size_of_PA3_Level_Change_INITIAL	equ	__end_of_PA3_Level_Change_INITIAL-_PA3_Level_Change_INITIAL
	
_PA3_Level_Change_INITIAL:	
	opt	stack 6
; Regs used in _PA3_Level_Change_INITIAL: [wreg]
	line	38
	
l3092:	
;FT_62F21x_IR.c: 38: TRISA3 =1;
	bsf	status, 5	;RP0=1, select bank1
	bsf	(1067/8)^080h,(1067)&7
	line	39
	
l3094:	
;FT_62F21x_IR.c: 39: ReadAPin = PORTA;
	bcf	status, 5	;RP0=0, select bank0
	movf	(5),w	;volatile
	line	40
	
l3096:	
;FT_62F21x_IR.c: 40: PAIF =0;
	bcf	(88/8),(88)&7
	line	41
	
l3098:	
;FT_62F21x_IR.c: 41: IOCA3 =1;
	bsf	status, 5	;RP0=1, select bank1
	bsf	(1203/8)^080h,(1203)&7
	line	42
	
l3100:	
;FT_62F21x_IR.c: 42: PAIE =1;
	bsf	(91/8),(91)&7
	line	43
	
l2091:	
	return
	opt stack 0
GLOBAL	__end_of_PA3_Level_Change_INITIAL
	__end_of_PA3_Level_Change_INITIAL:
;; =============== function _PA3_Level_Change_INITIAL ends ============

	signat	_PA3_Level_Change_INITIAL,88
	global	_TIMER0_INITIAL
psect	text136,local,class=CODE,delta=2
global __ptext136
__ptext136:

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
psect	text136
	file	"FT_62F21x_IR.c"
	line	19
	global	__size_of_TIMER0_INITIAL
	__size_of_TIMER0_INITIAL	equ	__end_of_TIMER0_INITIAL-_TIMER0_INITIAL
	
_TIMER0_INITIAL:	
	opt	stack 6
; Regs used in _TIMER0_INITIAL: [wreg]
	line	20
	
l3088:	
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
	
l3090:	
;FT_62F21x_IR.c: 28: T0IF = 0;
	bcf	(90/8),(90)&7
	line	29
	
l2088:	
	return
	opt stack 0
GLOBAL	__end_of_TIMER0_INITIAL
	__end_of_TIMER0_INITIAL:
;; =============== function _TIMER0_INITIAL ends ============

	signat	_TIMER0_INITIAL,88
	global	_POWER_INITIAL
psect	text137,local,class=CODE,delta=2
global __ptext137
__ptext137:

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
psect	text137
	file	"TEST_FT62F21X_SLEEP.C"
	line	105
	global	__size_of_POWER_INITIAL
	__size_of_POWER_INITIAL	equ	__end_of_POWER_INITIAL-_POWER_INITIAL
	
_POWER_INITIAL:	
	opt	stack 6
; Regs used in _POWER_INITIAL: [wreg+status,2]
	line	106
	
l3076:	
;TEST_FT62F21X_SLEEP.C: 106: OSCCON = 0X00|0X70|0X00;
	movlw	(070h)
	bsf	status, 5	;RP0=1, select bank1
	movwf	(143)^080h	;volatile
	line	109
	
l3078:	
;TEST_FT62F21X_SLEEP.C: 109: INTCON = 0;
	clrf	(11)	;volatile
	line	111
	
l3080:	
;TEST_FT62F21X_SLEEP.C: 111: PORTA = 0B00000000;
	bcf	status, 5	;RP0=0, select bank0
	clrf	(5)	;volatile
	line	112
	
l3082:	
;TEST_FT62F21X_SLEEP.C: 112: TRISA = 0B00000000;
	bsf	status, 5	;RP0=1, select bank1
	clrf	(133)^080h	;volatile
	line	113
	
l3084:	
;TEST_FT62F21X_SLEEP.C: 113: WPUA = 0B00000000;
	clrf	(149)^080h	;volatile
	line	115
;TEST_FT62F21X_SLEEP.C: 115: OPTION = 0B00001000;
	movlw	(08h)
	movwf	(129)^080h	;volatile
	line	117
	
l3086:	
;TEST_FT62F21X_SLEEP.C: 117: MSCON = 0B00000000;
	bcf	status, 5	;RP0=0, select bank0
	clrf	(27)	;volatile
	line	118
	
l696:	
	return
	opt stack 0
GLOBAL	__end_of_POWER_INITIAL
	__end_of_POWER_INITIAL:
;; =============== function _POWER_INITIAL ends ============

	signat	_POWER_INITIAL,88
	global	_ISR
psect	text138,local,class=CODE,delta=2
global __ptext138
__ptext138:

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
;;		Unchanged: FFFDF/0
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
psect	text138
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
psect	text138
	line	37
	
i1l3016:	
;TEST_FT62F21X_SLEEP.C: 37: if(TMR2IE && TMR2IF)
	bsf	status, 5	;RP0=1, select bank1
	btfss	(1121/8)^080h,(1121)&7
	goto	u1_21
	goto	u1_20
u1_21:
	goto	i1l3024
u1_20:
	
i1l3018:	
	bcf	status, 5	;RP0=0, select bank0
	btfss	(97/8),(97)&7
	goto	u2_21
	goto	u2_20
u2_21:
	goto	i1l3024
u2_20:
	line	39
	
i1l3020:	
;TEST_FT62F21X_SLEEP.C: 38: {
;TEST_FT62F21X_SLEEP.C: 39: TMR2IF = 0;
	bcf	(97/8),(97)&7
	line	40
	
i1l3022:	
;TEST_FT62F21X_SLEEP.C: 40: time_15ms_cnt++;
	incf	(_time_15ms_cnt),f
	line	46
	
i1l3024:	
;TEST_FT62F21X_SLEEP.C: 42: }
;TEST_FT62F21X_SLEEP.C: 46: if(T0IE && T0IF)
	btfss	(93/8),(93)&7
	goto	u3_21
	goto	u3_20
u3_21:
	goto	i1l3040
u3_20:
	
i1l3026:	
	btfss	(90/8),(90)&7
	goto	u4_21
	goto	u4_20
u4_21:
	goto	i1l3040
u4_20:
	line	48
	
i1l3028:	
;TEST_FT62F21X_SLEEP.C: 47: {
;TEST_FT62F21X_SLEEP.C: 48: TMR0 = 140;
	movlw	(08Ch)
	bcf	status, 5	;RP0=0, select bank0
	movwf	(1)	;volatile
	line	50
	
i1l3030:	
;TEST_FT62F21X_SLEEP.C: 50: T0IF = 0;
	bcf	(90/8),(90)&7
	line	51
	
i1l3032:	
;TEST_FT62F21X_SLEEP.C: 51: IRbitTime++;
	incf	(_IRbitTime),f
	line	52
	
i1l3034:	
;TEST_FT62F21X_SLEEP.C: 52: if(IRbitTime > 50)
	movlw	(033h)
	subwf	(_IRbitTime),w
	skipc
	goto	u5_21
	goto	u5_20
u5_21:
	goto	i1l3040
u5_20:
	line	54
	
i1l3036:	
;TEST_FT62F21X_SLEEP.C: 53: {
;TEST_FT62F21X_SLEEP.C: 54: T0IE = 0;
	bcf	(93/8),(93)&7
	line	55
	
i1l3038:	
;TEST_FT62F21X_SLEEP.C: 55: IRbitTime = 0;
	clrf	(_IRbitTime)
	line	60
	
i1l3040:	
;TEST_FT62F21X_SLEEP.C: 56: }
;TEST_FT62F21X_SLEEP.C: 57: }
;TEST_FT62F21X_SLEEP.C: 60: if(PAIE && PAIF)
	btfss	(91/8),(91)&7
	goto	u6_21
	goto	u6_20
u6_21:
	goto	i1l693
u6_20:
	
i1l3042:	
	btfss	(88/8),(88)&7
	goto	u7_21
	goto	u7_20
u7_21:
	goto	i1l693
u7_20:
	line	62
	
i1l3044:	
;TEST_FT62F21X_SLEEP.C: 61: {
;TEST_FT62F21X_SLEEP.C: 62: ReadAPin = PORTA;
	bcf	status, 5	;RP0=0, select bank0
	movf	(5),w	;volatile
	line	63
	
i1l3046:	
;TEST_FT62F21X_SLEEP.C: 63: PAIF = 0;
	bcf	(88/8),(88)&7
	line	64
	
i1l3048:	
;TEST_FT62F21X_SLEEP.C: 64: if(RA3 == 0)
	btfsc	(43/8),(43)&7
	goto	u8_21
	goto	u8_20
u8_21:
	goto	i1l693
u8_20:
	line	66
	
i1l3050:	
;TEST_FT62F21X_SLEEP.C: 65: {
;TEST_FT62F21X_SLEEP.C: 66: T0IE = 1;
	bsf	(93/8),(93)&7
	line	67
	
i1l3052:	
;TEST_FT62F21X_SLEEP.C: 67: if(IRbitTime > 21)
	movlw	(016h)
	subwf	(_IRbitTime),w
	skipc
	goto	u9_21
	goto	u9_20
u9_21:
	goto	i1l3056
u9_20:
	line	69
	
i1l3054:	
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
	goto	i1l3060
	line	76
	
i1l3056:	
;TEST_FT62F21X_SLEEP.C: 76: else if(IRbitTime > 3)
	movlw	(04h)
	subwf	(_IRbitTime),w
	skipc
	goto	u10_21
	goto	u10_20
u10_21:
	goto	i1l3060
u10_20:
	line	78
	
i1l3058:	
;TEST_FT62F21X_SLEEP.C: 77: {
;TEST_FT62F21X_SLEEP.C: 78: IRDataTimer[IRbitNum-1] |= bitdata;
	movf	(_IRbitNum),w
	addlw	_IRDataTimer+-1&0ffh
	movwf	fsr0
	movf	(_bitdata),w
	iorwf	indf,f
	line	80
	
i1l3060:	
;TEST_FT62F21X_SLEEP.C: 79: }
;TEST_FT62F21X_SLEEP.C: 80: IRbitTime = 0;
	clrf	(_IRbitTime)
	line	81
	
i1l3062:	
;TEST_FT62F21X_SLEEP.C: 81: bitdata<<=1;
	clrc
	rlf	(_bitdata),f
	line	82
	
i1l3064:	
;TEST_FT62F21X_SLEEP.C: 82: if(bitdata == 0)
	movf	(_bitdata),f
	skipz
	goto	u11_21
	goto	u11_20
u11_21:
	goto	i1l3070
u11_20:
	line	84
	
i1l3066:	
;TEST_FT62F21X_SLEEP.C: 83: {
;TEST_FT62F21X_SLEEP.C: 84: bitdata = 0x01;
	clrf	(_bitdata)
	incf	(_bitdata),f
	line	85
	
i1l3068:	
;TEST_FT62F21X_SLEEP.C: 85: IRbitNum++;
	incf	(_IRbitNum),f
	line	87
	
i1l3070:	
;TEST_FT62F21X_SLEEP.C: 86: }
;TEST_FT62F21X_SLEEP.C: 87: if(IRbitNum > 4)
	movlw	(05h)
	subwf	(_IRbitNum),w
	skipc
	goto	u12_21
	goto	u12_20
u12_21:
	goto	i1l693
u12_20:
	line	89
	
i1l3072:	
;TEST_FT62F21X_SLEEP.C: 88: {
;TEST_FT62F21X_SLEEP.C: 89: IRbitNum = 0;
	clrf	(_IRbitNum)
	line	90
	
i1l3074:	
;TEST_FT62F21X_SLEEP.C: 91: ReceiveFinish = 1;
	bcf	(93/8),(93)&7
	line	96
	
i1l693:	
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
psect	text139,local,class=CODE,delta=2
global __ptext139
__ptext139:
	global	btemp
	btemp set 07Eh

	DABS	1,126,2	;btemp
	global	wtemp0
	wtemp0 set btemp
	end
