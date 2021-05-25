#ifndef _FT_USR_IR_H_
#define _FT_USR_IR_H_

#include 	"FT_USER_CONFIG.h";
#include	"SYSCFG.h";
#include 	"FT62F21X.h";

#define	IRRIO   RA3

extern void IR_ISR(void);			//PIC_HI-TECH使用
extern void TIMER0_INITIAL (void);	
void PA3_Level_Change_INITIAL(void);

extern unchar IRbitNum;			//用于记录接收到第几位数据了
extern unchar IRbitTime;			//用于计时一位的时间长短
extern unchar IRDataTimer[4];		//存出来的4个数据
extern unchar bitdata;			//用于按位或的位数据
extern unchar ReceiveFinish;	//用于记录接收完成
extern unchar ReadAPin;			//用于读取IO口状态，电平变化中断标志清除
extern unchar rdata1,rdata2;

#endif
