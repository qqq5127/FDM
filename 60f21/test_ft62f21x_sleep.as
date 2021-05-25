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
	FNCALL	_main,_DelayS
	FNCALL	_DelayS,_DelayMs
	FNCALL	_DelayMs,_DelayUs
	FNROOT	_main
	global	_INTCON
psect	text53,local,class=CODE,delta=2
global __ptext53
__ptext53:
_INTCON	set	11
	global	_MSCON
_MSCON	set	27
	global	_PORTA
_PORTA	set	5
	global	_RA3
_RA3	set	43
	global	_RA4
_RA4	set	44
	global	_OPTION
_OPTION	set	129
	global	_OSCCON
_OSCCON	set	143
	global	_TRISA
_TRISA	set	133
	global	_WPUA
_WPUA	set	149
	file	"test_ft62f21x_sleep.as"
	line	#
psect cinit,class=CODE,delta=2
global start_initialization
start_initialization:

psect cinit,class=CODE,delta=2
global end_of_initialization

;End of C runtime variable initialization code

end_of_initialization:
clrf status
ljmp _main	;jump to C main() function
psect	cstackCOMMON,class=COMMON,space=1
global __pcstackCOMMON
__pcstackCOMMON:
	global	?_POWER_INITIAL
?_POWER_INITIAL:	; 0 bytes @ 0x0
	global	??_POWER_INITIAL
??_POWER_INITIAL:	; 0 bytes @ 0x0
	global	?_DelayUs
?_DelayUs:	; 0 bytes @ 0x0
	global	??_DelayUs
??_DelayUs:	; 0 bytes @ 0x0
	global	?_DelayMs
?_DelayMs:	; 0 bytes @ 0x0
	global	?_DelayS
?_DelayS:	; 0 bytes @ 0x0
	global	?_main
?_main:	; 0 bytes @ 0x0
	global	DelayUs@Time
DelayUs@Time:	; 1 bytes @ 0x0
	ds	1
	global	DelayUs@a
DelayUs@a:	; 1 bytes @ 0x1
	ds	1
	global	??_DelayMs
??_DelayMs:	; 0 bytes @ 0x2
	global	DelayMs@Time
DelayMs@Time:	; 1 bytes @ 0x2
	ds	1
	global	DelayMs@a
DelayMs@a:	; 1 bytes @ 0x3
	ds	1
	global	DelayMs@b
DelayMs@b:	; 1 bytes @ 0x4
	ds	1
	global	??_DelayS
??_DelayS:	; 0 bytes @ 0x5
	global	DelayS@Time
DelayS@Time:	; 1 bytes @ 0x5
	ds	1
	global	DelayS@a
DelayS@a:	; 1 bytes @ 0x6
	ds	1
	global	DelayS@b
DelayS@b:	; 1 bytes @ 0x7
	ds	1
	global	??_main
??_main:	; 0 bytes @ 0x8
;;Data sizes: Strings 0, constant 0, data 0, bss 0, persistent 0 stack 0
;;Auto spaces:   Size  Autos    Used
;; COMMON          14      8       8
;; BANK0           48      0       0

;;
;; Pointer list with targets:



;;
;; Critical Paths under _main in COMMON
;;
;;   _main->_DelayS
;;   _DelayS->_DelayMs
;;   _DelayMs->_DelayUs
;;
;; Critical Paths under _main in BANK0
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
;; (0) _main                                                 0     0      0     150
;;                      _POWER_INITIAL
;;                             _DelayS
;; ---------------------------------------------------------------------------------
;; (1) _DelayS                                               3     3      0     150
;;                                              5 COMMON     3     3      0
;;                            _DelayMs
;; ---------------------------------------------------------------------------------
;; (2) _DelayMs                                              3     3      0      90
;;                                              2 COMMON     3     3      0
;;                            _DelayUs
;; ---------------------------------------------------------------------------------
;; (3) _DelayUs                                              2     2      0      30
;;                                              0 COMMON     2     2      0
;; ---------------------------------------------------------------------------------
;; (1) _POWER_INITIAL                                        0     0      0       0
;; ---------------------------------------------------------------------------------
;; Estimated maximum stack depth 3
;; ---------------------------------------------------------------------------------

;; Call Graph Graphs:

;; _main (ROOT)
;;   _POWER_INITIAL
;;   _DelayS
;;     _DelayMs
;;       _DelayUs
;;

;; Address spaces:

;;Name               Size   Autos  Total    Cost      Usage
;;BITCOMMON            E      0       0       0        0.0%
;;EEDATA              80      0       0       0        0.0%
;;NULL                 0      0       0       0        0.0%
;;CODE                 0      0       0       0        0.0%
;;COMMON               E      8       8       1       57.1%
;;BITSFR0              0      0       0       1        0.0%
;;SFR0                 0      0       0       1        0.0%
;;BITSFR1              0      0       0       2        0.0%
;;SFR1                 0      0       0       2        0.0%
;;STACK                0      0       3       2        0.0%
;;DATA                 0      0       0       3        0.0%
;;BITBANK0            30      0       0       4        0.0%
;;BANK0               30      0       0       5        0.0%
;;ABS                  0      0       0       6        0.0%

	global	_main
psect	maintext,global,class=CODE,delta=2
global __pmaintext
__pmaintext:

;; *************** function _main *****************
;; Defined at:
;;		line 115 in file "TEST_FT62F21X_SLEEP.C"
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
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0
;;      Params:         0       0
;;      Locals:         0       0
;;      Temps:          0       0
;;      Totals:         0       0
;;Total ram usage:        0 bytes
;; Hardware stack levels required when called:    3
;; This function calls:
;;		_POWER_INITIAL
;;		_DelayS
;; This function is called by:
;;		Startup code after reset
;; This function uses a non-reentrant model
;;
psect	maintext
	file	"TEST_FT62F21X_SLEEP.C"
	line	115
	global	__size_of_main
	__size_of_main	equ	__end_of_main-_main
	
_main:	
	opt	stack 5
; Regs used in _main: [wreg+status,2+status,0+pclath+cstack]
	line	116
	
l1684:	
;TEST_FT62F21X_SLEEP.C: 116: POWER_INITIAL();
	fcall	_POWER_INITIAL
	line	117
	
l1686:	
;TEST_FT62F21X_SLEEP.C: 117: RA4 = 1;
	bsf	(44/8),(44)&7
	line	118
	
l1688:	
;TEST_FT62F21X_SLEEP.C: 118: RA3 = 1;
	bsf	(43/8),(43)&7
	line	119
;TEST_FT62F21X_SLEEP.C: 119: DelayS(4);
	movlw	(04h)
	fcall	_DelayS
	line	120
	
l1690:	
;TEST_FT62F21X_SLEEP.C: 120: RA4 = 0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	(44/8),(44)&7
	line	121
	
l1692:	
;TEST_FT62F21X_SLEEP.C: 121: RA3 = 0;
	bcf	(43/8),(43)&7
	line	125
	
l1694:	
# 125 "TEST_FT62F21X_SLEEP.C"
clrwdt ;#
psect	maintext
	line	126
	
l1696:	
;TEST_FT62F21X_SLEEP.C: 126: _nop();
	nop
	line	127
	
l1698:	
# 127 "TEST_FT62F21X_SLEEP.C"
sleep ;#
psect	maintext
	line	128
	
l1700:	
;TEST_FT62F21X_SLEEP.C: 128: _nop();
	nop
	line	129
	
l1702:	
;TEST_FT62F21X_SLEEP.C: 129: RA4 =~RA4;
	movlw	1<<((44)&7)
	bcf	status, 5	;RP0=0, select bank0
	xorwf	((44)/8),f
	goto	l1694
	global	start
	ljmp	start
	opt stack 0
psect	maintext
	line	131
GLOBAL	__end_of_main
	__end_of_main:
;; =============== function _main ends ============

	signat	_main,88
	global	_DelayS
psect	text54,local,class=CODE,delta=2
global __ptext54
__ptext54:

;; *************** function _DelayS *****************
;; Defined at:
;;		line 98 in file "TEST_FT62F21X_SLEEP.C"
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
;;		On entry : 17F/0
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
;;		_DelayMs
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text54
	file	"TEST_FT62F21X_SLEEP.C"
	line	98
	global	__size_of_DelayS
	__size_of_DelayS	equ	__end_of_DelayS-_DelayS
	
_DelayS:	
	opt	stack 5
; Regs used in _DelayS: [wreg+status,2+status,0+pclath+cstack]
;DelayS@Time stored from wreg
	line	100
	movwf	(DelayS@Time)
	
l1666:	
;TEST_FT62F21X_SLEEP.C: 99: unsigned char a,b;
;TEST_FT62F21X_SLEEP.C: 100: for(a=0;a<Time;a++)
	clrf	(DelayS@a)
	goto	l1682
	line	102
	
l1668:	
;TEST_FT62F21X_SLEEP.C: 101: {
;TEST_FT62F21X_SLEEP.C: 102: for(b=0;b<10;b++)
	clrf	(DelayS@b)
	line	104
	
l1674:	
;TEST_FT62F21X_SLEEP.C: 103: {
;TEST_FT62F21X_SLEEP.C: 104: DelayMs(100);
	movlw	(064h)
	fcall	_DelayMs
	line	102
	
l1676:	
	incf	(DelayS@b),f
	
l1678:	
	movlw	(0Ah)
	subwf	(DelayS@b),w
	skipc
	goto	u41
	goto	u40
u41:
	goto	l1674
u40:
	line	100
	
l1680:	
	incf	(DelayS@a),f
	
l1682:	
	movf	(DelayS@Time),w
	subwf	(DelayS@a),w
	skipc
	goto	u51
	goto	u50
u51:
	goto	l1668
u50:
	line	107
	
l699:	
	return
	opt stack 0
GLOBAL	__end_of_DelayS
	__end_of_DelayS:
;; =============== function _DelayS ends ============

	signat	_DelayS,4216
	global	_DelayMs
psect	text55,local,class=CODE,delta=2
global __ptext55
__ptext55:

;; *************** function _DelayMs *****************
;; Defined at:
;;		line 81 in file "TEST_FT62F21X_SLEEP.C"
;; Parameters:    Size  Location     Type
;;  Time            1    wreg     unsigned char 
;; Auto vars:     Size  Location     Type
;;  Time            1    2[COMMON] unsigned char 
;;  b               1    4[COMMON] unsigned char 
;;  a               1    3[COMMON] unsigned char 
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0
;;      Params:         0       0
;;      Locals:         3       0
;;      Temps:          0       0
;;      Totals:         3       0
;;Total ram usage:        3 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    1
;; This function calls:
;;		_DelayUs
;; This function is called by:
;;		_DelayS
;; This function uses a non-reentrant model
;;
psect	text55
	file	"TEST_FT62F21X_SLEEP.C"
	line	81
	global	__size_of_DelayMs
	__size_of_DelayMs	equ	__end_of_DelayMs-_DelayMs
	
_DelayMs:	
	opt	stack 5
; Regs used in _DelayMs: [wreg+status,2+status,0+pclath+cstack]
;DelayMs@Time stored from wreg
	line	83
	movwf	(DelayMs@Time)
	
l1648:	
;TEST_FT62F21X_SLEEP.C: 82: unsigned char a,b;
;TEST_FT62F21X_SLEEP.C: 83: for(a=0;a<Time;a++)
	clrf	(DelayMs@a)
	goto	l1664
	line	85
	
l1650:	
;TEST_FT62F21X_SLEEP.C: 84: {
;TEST_FT62F21X_SLEEP.C: 85: for(b=0;b<5;b++)
	clrf	(DelayMs@b)
	line	87
	
l1656:	
;TEST_FT62F21X_SLEEP.C: 86: {
;TEST_FT62F21X_SLEEP.C: 87: DelayUs(98);
	movlw	(062h)
	fcall	_DelayUs
	line	85
	
l1658:	
	incf	(DelayMs@b),f
	
l1660:	
	movlw	(05h)
	subwf	(DelayMs@b),w
	skipc
	goto	u21
	goto	u20
u21:
	goto	l1656
u20:
	line	83
	
l1662:	
	incf	(DelayMs@a),f
	
l1664:	
	movf	(DelayMs@Time),w
	subwf	(DelayMs@a),w
	skipc
	goto	u31
	goto	u30
u31:
	goto	l1650
u30:
	line	90
	
l691:	
	return
	opt stack 0
GLOBAL	__end_of_DelayMs
	__end_of_DelayMs:
;; =============== function _DelayMs ends ============

	signat	_DelayMs,4216
	global	_DelayUs
psect	text56,local,class=CODE,delta=2
global __ptext56
__ptext56:

;; *************** function _DelayUs *****************
;; Defined at:
;;		line 67 in file "TEST_FT62F21X_SLEEP.C"
;; Parameters:    Size  Location     Type
;;  Time            1    wreg     unsigned char 
;; Auto vars:     Size  Location     Type
;;  Time            1    0[COMMON] unsigned char 
;;  a               1    1[COMMON] unsigned char 
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
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_DelayMs
;; This function uses a non-reentrant model
;;
psect	text56
	file	"TEST_FT62F21X_SLEEP.C"
	line	67
	global	__size_of_DelayUs
	__size_of_DelayUs	equ	__end_of_DelayUs-_DelayUs
	
_DelayUs:	
	opt	stack 5
; Regs used in _DelayUs: [wreg+status,2+status,0]
;DelayUs@Time stored from wreg
	line	69
	movwf	(DelayUs@Time)
	
l1642:	
;TEST_FT62F21X_SLEEP.C: 68: unsigned char a;
;TEST_FT62F21X_SLEEP.C: 69: for(a=0;a<Time;a++)
	clrf	(DelayUs@a)
	goto	l1646
	line	70
	
l681:	
	line	71
;TEST_FT62F21X_SLEEP.C: 70: {
;TEST_FT62F21X_SLEEP.C: 71: _nop();
	nop
	line	69
	
l1644:	
	incf	(DelayUs@a),f
	
l1646:	
	movf	(DelayUs@Time),w
	subwf	(DelayUs@a),w
	skipc
	goto	u11
	goto	u10
u11:
	goto	l681
u10:
	line	73
	
l683:	
	return
	opt stack 0
GLOBAL	__end_of_DelayUs
	__end_of_DelayUs:
;; =============== function _DelayUs ends ============

	signat	_DelayUs,4216
	global	_POWER_INITIAL
psect	text57,local,class=CODE,delta=2
global __ptext57
__ptext57:

;; *************** function _POWER_INITIAL *****************
;; Defined at:
;;		line 46 in file "TEST_FT62F21X_SLEEP.C"
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
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text57
	file	"TEST_FT62F21X_SLEEP.C"
	line	46
	global	__size_of_POWER_INITIAL
	__size_of_POWER_INITIAL	equ	__end_of_POWER_INITIAL-_POWER_INITIAL
	
_POWER_INITIAL:	
	opt	stack 7
; Regs used in _POWER_INITIAL: [wreg+status,2]
	line	47
	
l1630:	
;TEST_FT62F21X_SLEEP.C: 47: OSCCON = 0X00|0X70|0X00;
	movlw	(070h)
	bsf	status, 5	;RP0=1, select bank1
	movwf	(143)^080h	;volatile
	line	50
	
l1632:	
;TEST_FT62F21X_SLEEP.C: 50: INTCON = 0;
	clrf	(11)	;volatile
	line	52
	
l1634:	
;TEST_FT62F21X_SLEEP.C: 52: PORTA = 0B00000000;
	bcf	status, 5	;RP0=0, select bank0
	clrf	(5)	;volatile
	line	53
	
l1636:	
;TEST_FT62F21X_SLEEP.C: 53: TRISA = 0B00000000;
	bsf	status, 5	;RP0=1, select bank1
	clrf	(133)^080h	;volatile
	line	54
	
l1638:	
;TEST_FT62F21X_SLEEP.C: 54: WPUA = 0B00000000;
	clrf	(149)^080h	;volatile
	line	56
;TEST_FT62F21X_SLEEP.C: 56: OPTION = 0B00001000;
	movlw	(08h)
	movwf	(129)^080h	;volatile
	line	58
	
l1640:	
;TEST_FT62F21X_SLEEP.C: 58: MSCON = 0B00000000;
	bcf	status, 5	;RP0=0, select bank0
	clrf	(27)	;volatile
	line	59
	
l677:	
	return
	opt stack 0
GLOBAL	__end_of_POWER_INITIAL
	__end_of_POWER_INITIAL:
;; =============== function _POWER_INITIAL ends ============

	signat	_POWER_INITIAL,88
psect	text58,local,class=CODE,delta=2
global __ptext58
__ptext58:
	global	btemp
	btemp set 07Eh

	DABS	1,126,2	;btemp
	global	wtemp0
	wtemp0 set btemp
	end
