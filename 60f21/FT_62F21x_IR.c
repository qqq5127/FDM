#include "FT_62F21X_IR.h";

//IR 功能
 unchar IRbitNum = 0;			 //用于记录接收到第几位数据了
 unchar IRbitTime = 0;			 //用于计时一位的时间长短
 unchar IRDataTimer[4]; 	 //存出来的4个数据
 unchar bitdata=0x01;			 //用于按位或的位数据
 unchar ReceiveFinish = 0;	 //用于记录接收完成
 unchar ReadAPin = 0;			 //用于读取IO口状态，电平变化中断标志清除
 unchar rdata1,rdata2;

 /*----------------------------------------------------
  *  函数名称：TIMER0_INITIAL
  *  功能：初始化设置定时器
  *  相关寄存器：T0CS T0CS T0SE PSA 
  *  设置TMR0定时时长560us=(1/16000000)*4*16*140(16M-2T-PSA 1:16- TMR0=255溢出) 					   
  ----------------------------------------------------*/
 void TIMER0_INITIAL (void)  
 {
	 OPTION = 0B00000011;		 //预分频器分配给Timer0，预分频比为1:16，上升沿   
	 //Bit5 T0CS Timer0时钟源选择 
	 //1-外部引脚电平变化T0CKI 0-内部时钟(FOSC/2)
	 //Bit4 T0CKI引脚触发方式 1-下降沿 0-上升沿
	 //Bit3 PSA 预分频器分配位 0-Timer0 1-WDT 
	 //Bit2:0 PS2 8个预分频比 011 - 1:16
							 
	 TMR0 = 140; 
	 T0IF = 0;								 //清空T0软件中断
 }
 /*-------------------------------------------------
  *  函数名: PA2_Level_Change_INITIAL
  *  功能：	PA端口(PA2)电平变化中断初始化
  *  输入：	无
  *  输出：	无
 --------------------------------------------------*/
 void PA3_Level_Change_INITIAL(void)
 { 
	 TRISA3 =1; 			  //SET PA3 INPUT
	 ReadAPin = PORTA;	  //清PA电平变化中断
	 PAIF =0;				  //清PA INT中断标志位
	 IOCA3 =1;				  //使能PA3电平变化中断
	 PAIE =1;				  //使能PA INT中断
 }

