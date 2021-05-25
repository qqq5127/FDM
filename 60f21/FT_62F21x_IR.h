#ifndef _FT_USR_IR_H_
#define _FT_USR_IR_H_

#include 	"FT_USER_CONFIG.h";
#include	"SYSCFG.h";
#include 	"FT62F21X.h";

#define	IRRIO   RA3

extern void IR_ISR(void);			//PIC_HI-TECHʹ��
extern void TIMER0_INITIAL (void);	
void PA3_Level_Change_INITIAL(void);

extern unchar IRbitNum;			//���ڼ�¼���յ��ڼ�λ������
extern unchar IRbitTime;			//���ڼ�ʱһλ��ʱ�䳤��
extern unchar IRDataTimer[4];		//�������4������
extern unchar bitdata;			//���ڰ�λ���λ����
extern unchar ReceiveFinish;	//���ڼ�¼�������
extern unchar ReadAPin;			//���ڶ�ȡIO��״̬����ƽ�仯�жϱ�־���
extern unchar rdata1,rdata2;

#endif
