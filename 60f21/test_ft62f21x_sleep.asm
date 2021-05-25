//Deviec:FT62F21X
//-----------------------Variable---------------------------------
//-----------------------Variable END---------------------------------
		ORG		0000H
		LJUMP 	3B7H 			//0000 	3BB7
		ORG		03B7H
		CLRR 	STATUS 			//03B7 	0103
		LJUMP 	3F0H 			//03B8 	3BF0
		STR 	70H 			//03B9 	01F0

		//;TEST_FT62F21X_SLEEP.C: 68: unsigned char a;
		//;TEST_FT62F21X_SLEEP.C: 69: for(a=0;a<Time;a++)
		CLRR 	71H 			//03BA 	0171
		LDR 	70H,0 			//03BB 	0870
		SUBWR 	71H,0 			//03BC 	0C71
		BTSC 	STATUS,0 		//03BD 	1403
		RET		 					//03BE 	0004
		ORG		03BFH

		//;TEST_FT62F21X_SLEEP.C: 70: {
		//;TEST_FT62F21X_SLEEP.C: 71: _nop();
		NOP		 					//03BF 	0000
		INCR	71H,1 			//03C0 	09F1
		LJUMP 	3BBH 			//03C1 	3BBB

		//;TEST_FT62F21X_SLEEP.C: 47: OSCCON = 0X00|0X70|0X00;
		LDWI 	70H 			//03C2 	2A70
		BSR 	STATUS,5 		//03C3 	1A83
		STR 	FH 			//03C4 	018F

		//;TEST_FT62F21X_SLEEP.C: 50: INTCON = 0;
		CLRR 	INTCON 			//03C5 	010B

		//;TEST_FT62F21X_SLEEP.C: 52: PORTA = 0B00000000;
		BCR 	STATUS,5 		//03C6 	1283
		ORG		03C7H
		CLRR 	5H 			//03C7 	0105

		//;TEST_FT62F21X_SLEEP.C: 53: TRISA = 0B00000000;
		BSR 	STATUS,5 		//03C8 	1A83
		CLRR 	5H 			//03C9 	0105

		//;TEST_FT62F21X_SLEEP.C: 54: WPUA = 0B00000000;
		CLRR 	15H 			//03CA 	0115

		//;TEST_FT62F21X_SLEEP.C: 56: OPTION = 0B00001000;
		LDWI 	8H 			//03CB 	2A08
		STR 	1H 			//03CC 	0181

		//;TEST_FT62F21X_SLEEP.C: 58: MSCON = 0B00000000;
		BCR 	STATUS,5 		//03CD 	1283
		CLRR 	1BH 			//03CE 	011B
		ORG		03CFH
		RET		 					//03CF 	0004
		STR 	72H 			//03D0 	01F2

		//;TEST_FT62F21X_SLEEP.C: 82: unsigned char a,b;
		//;TEST_FT62F21X_SLEEP.C: 83: for(a=0;a<Time;a++)
		CLRR 	73H 			//03D1 	0173
		LDR 	72H,0 			//03D2 	0872
		SUBWR 	73H,0 			//03D3 	0C73
		BTSC 	STATUS,0 		//03D4 	1403
		RET		 					//03D5 	0004

		//;TEST_FT62F21X_SLEEP.C: 84: {
		//;TEST_FT62F21X_SLEEP.C: 85: for(b=0;b<5;b++)
		CLRR 	74H 			//03D6 	0174
		ORG		03D7H

		//;TEST_FT62F21X_SLEEP.C: 86: {
		//;TEST_FT62F21X_SLEEP.C: 87: DelayUs(98);
		LDWI 	62H 			//03D7 	2A62
		LCALL 	3B9H 			//03D8 	33B9
		LDWI 	5H 			//03D9 	2A05
		INCR	74H,1 			//03DA 	09F4
		SUBWR 	74H,0 			//03DB 	0C74
		BTSS 	STATUS,0 		//03DC 	1C03
		LJUMP 	3D7H 			//03DD 	3BD7
		INCR	73H,1 			//03DE 	09F3
		ORG		03DFH
		LJUMP 	3D2H 			//03DF 	3BD2
		STR 	75H 			//03E0 	01F5

		//;TEST_FT62F21X_SLEEP.C: 99: unsigned char a,b;
		//;TEST_FT62F21X_SLEEP.C: 100: for(a=0;a<Time;a++)
		CLRR 	76H 			//03E1 	0176
		LDR 	75H,0 			//03E2 	0875
		SUBWR 	76H,0 			//03E3 	0C76
		BTSC 	STATUS,0 		//03E4 	1403
		RET		 					//03E5 	0004

		//;TEST_FT62F21X_SLEEP.C: 101: {
		//;TEST_FT62F21X_SLEEP.C: 102: for(b=0;b<10;b++)
		CLRR 	77H 			//03E6 	0177
		ORG		03E7H

		//;TEST_FT62F21X_SLEEP.C: 103: {
		//;TEST_FT62F21X_SLEEP.C: 104: DelayMs(100);
		LDWI 	64H 			//03E7 	2A64
		LCALL 	3D0H 			//03E8 	33D0
		LDWI 	AH 			//03E9 	2A0A
		INCR	77H,1 			//03EA 	09F7
		SUBWR 	77H,0 			//03EB 	0C77
		BTSS 	STATUS,0 		//03EC 	1C03
		LJUMP 	3E7H 			//03ED 	3BE7
		INCR	76H,1 			//03EE 	09F6
		ORG		03EFH
		LJUMP 	3E2H 			//03EF 	3BE2

		//;TEST_FT62F21X_SLEEP.C: 116: POWER_INITIAL();
		LCALL 	3C2H 			//03F0 	33C2
		LDWI 	4H 			//03F1 	2A04

		//;TEST_FT62F21X_SLEEP.C: 117: RA4 = 1;
		BSR 	5H,4 			//03F2 	1A05
		BSR 	5H,3 			//03F3 	1985

		//;TEST_FT62F21X_SLEEP.C: 119: DelayS(4);
		LCALL 	3E0H 			//03F4 	33E0

		//;TEST_FT62F21X_SLEEP.C: 120: RA4 = 0;
		BCR 	STATUS,5 		//03F5 	1283
		BCR 	5H,4 			//03F6 	1205
		ORG		03F7H

		//;TEST_FT62F21X_SLEEP.C: 121: RA3 = 0;
		BCR 	5H,3 			//03F7 	1185
		CLRWDT	 			//03F8 	0001

		//;TEST_FT62F21X_SLEEP.C: 126: _nop();
		NOP		 					//03F9 	0000
		SLEEP	 			//03FA 	0002

		//;TEST_FT62F21X_SLEEP.C: 128: _nop();
		NOP		 					//03FB 	0000

		//;TEST_FT62F21X_SLEEP.C: 129: RA4 =~RA4;
		LDWI 	10H 			//03FC 	2A10
		BCR 	STATUS,5 		//03FD 	1283
		XORWR 	5H,1 			//03FE 	0485
		ORG		03FFH
		LJUMP 	3F8H 			//03FF 	3BF8
			END
