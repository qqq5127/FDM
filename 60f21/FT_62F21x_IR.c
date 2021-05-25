#include "FT_62F21X_IR.h";

//IR ����
 unchar IRbitNum = 0;			 //���ڼ�¼���յ��ڼ�λ������
 unchar IRbitTime = 0;			 //���ڼ�ʱһλ��ʱ�䳤��
 unchar IRDataTimer[4]; 	 //�������4������
 unchar bitdata=0x01;			 //���ڰ�λ���λ����
 unchar ReceiveFinish = 0;	 //���ڼ�¼�������
 unchar ReadAPin = 0;			 //���ڶ�ȡIO��״̬����ƽ�仯�жϱ�־���
 unchar rdata1,rdata2;

 /*----------------------------------------------------
  *  �������ƣ�TIMER0_INITIAL
  *  ���ܣ���ʼ�����ö�ʱ��
  *  ��ؼĴ�����T0CS T0CS T0SE PSA 
  *  ����TMR0��ʱʱ��560us=(1/16000000)*4*16*140(16M-2T-PSA 1:16- TMR0=255���) 					   
  ----------------------------------------------------*/
 void TIMER0_INITIAL (void)  
 {
	 OPTION = 0B00000011;		 //Ԥ��Ƶ�������Timer0��Ԥ��Ƶ��Ϊ1:16��������   
	 //Bit5 T0CS Timer0ʱ��Դѡ�� 
	 //1-�ⲿ���ŵ�ƽ�仯T0CKI 0-�ڲ�ʱ��(FOSC/2)
	 //Bit4 T0CKI���Ŵ�����ʽ 1-�½��� 0-������
	 //Bit3 PSA Ԥ��Ƶ������λ 0-Timer0 1-WDT 
	 //Bit2:0 PS2 8��Ԥ��Ƶ�� 011 - 1:16
							 
	 TMR0 = 140; 
	 T0IF = 0;								 //���T0����ж�
 }
 /*-------------------------------------------------
  *  ������: PA2_Level_Change_INITIAL
  *  ���ܣ�	PA�˿�(PA2)��ƽ�仯�жϳ�ʼ��
  *  ���룺	��
  *  �����	��
 --------------------------------------------------*/
 void PA3_Level_Change_INITIAL(void)
 { 
	 TRISA3 =1; 			  //SET PA3 INPUT
	 ReadAPin = PORTA;	  //��PA��ƽ�仯�ж�
	 PAIF =0;				  //��PA INT�жϱ�־λ
	 IOCA3 =1;				  //ʹ��PA3��ƽ�仯�ж�
	 PAIE =1;				  //ʹ��PA INT�ж�
 }

