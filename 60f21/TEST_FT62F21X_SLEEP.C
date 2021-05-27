//********************************************************* 
/*	文件名：TEST_FT62F21x_SLEEP.c
*	功能：	 FT62F21x-SLEEP功能演示
*	IC:		 FT62F211 SOP8
*	晶振：   16M/4T                    
*	说明：   此程序为FT62F21x-SLEEP睡眠演示程序，上电之后PA3、PA4同时置高约4s，
*				 然后置低，进入睡眠。测试FT62F21x的睡眠功耗： 
*
*                  FT62F211 SOP8 
*                 ----------------
*  led1----------|1(PA4)     (PA3)8|------------led2     
*  NC-----------|2(TKCAP)  (PA0)7|------------NC
*  VDD----------|3(VDD)     (PA1)6|------------NC
*  GND----------|4(VSS)     (PA2)5|------------NC
*			      ----------------
*/
//*********************************************************
#include	"SYSCFG.h";
#include 	"FT62F21X.h";
#include 	"FT_62F21X_pwm.h";
#include 	"FT_62F21X_IR.h";
#include 	"FT_USER_CONFIG.h";

unchar time_15ms_cnt = 0;
unchar key_release = 0;

 /*-------------------------------------------------
  *  函数名：中断处理程序
  *  功能：	 定时器2中断
  *  输入：	 无
  *  输出：	 无
  --------------------------------------------------*/
 void interrupt ISR(void)			 //PIC_HI-TECH使用
 { 
	
   //定时器2的中断处理**********************
	 if(TMR2IE && TMR2IF)			 //100us中断一次 
	 {
		 TMR2IF = 0;
		 time_15ms_cnt++;
		 //DemoPortOut = ~DemoPortOut; //翻转电平
	 } 

	//IR 中断检测
	 //定时器0的中断处理**********************
	   if(T0IE && T0IF) 				   //104us
	   {
		   TMR0 = 140;				   //注意:对TMR0重新赋值TMR0在两个周期内不变化
			
		   T0IF = 0;
		   IRbitTime++;
		   if(IRbitTime > 50)
		   {
			   T0IE = 0;
			   IRbitTime = 0;
		   }
	   } 
	   
	   //PA电平变化中断**********************
	   if(PAIE && PAIF) 	   
	   {
		   ReadAPin = PORTA;		   //读取PORTA数据清PAIF标志
		   PAIF = 0; 
		   if(IRRIO == 0)
		   {
			   T0IE = 1;
			   if(IRbitTime > 21)
			   {
				   IRDataTimer[0] = 0;
				   IRDataTimer[1] = 0;
				   IRDataTimer[2] = 0;
				   IRDataTimer[3] = 0;
				   IRbitNum = 0;
				   bitdata = 0x00;
			   }
			   else if(IRbitTime > 3)
			   {
				   IRDataTimer[IRbitNum-1] |= bitdata;
			   }
			   IRbitTime = 0;
			   bitdata<<=1;
			   if(bitdata == 0)
			   {
				   bitdata = 0x01;
				   IRbitNum++;
			   }
			   if(IRbitNum > 4)
			   {
				   IRbitNum = 0;
				   T0IE = 0;  
				   ReceiveFinish = 1;	   
			   }
	 
		   }
	   }
 }

 /*-------------------------------------------------
 *	函数名：POWER_INITIAL
 *	功能：  上电系统初始化
 *	输入：  无
 *	输出：  无
 --------------------------------------------------*/	
void POWER_INITIAL (void) 
{
	OSCCON = WDT_32K|OSC_16M|0X00;	
  //OSCCON = 0B01110000;		//WDT 32KHZ IRCF=111=16MHZ/4=4MHZ,0.25US/T

	INTCON = 0;  							//暂禁止所有中断

	PORTA = 0B00000000;				
	TRISA = 0B00010000;				//PA输入输出 0-输出 1-输入  
	WPUA = 0B00000000;     		//PA端口上拉控制 1-开上拉 0-关上拉

	OPTION = 0B00001000;			//Bit3=1 WDT MODE,PS=000=1:1 WDT RATE
													//Bit7(PAPU)=0 由WPUA决定是否上拉
	MSCON = 0B00000000;		                             
}
 /*-------------------------------------------------
 *  函数名称：DelayUs
 *  功能：    短延时函数 --16M-4T--大概快1%左右.
 *  输入参数：Time 延时时间长度 延时时长Time*2 Us
 * 	返回参数：无 
 -------------------------------------------------*/
void DelayUs(unsigned char Time)
{
	unsigned char a;
	for(a=0;a<Time;a++)
	{
		NOP();
	}
}                  
/*------------------------------------------------- 
 * 	函数名称： DelayMs
 * 	功能：    短延时函数
 * 	输入参数：Time 延时时间长度 延时时长Time ms
 * 	返回参数：无 
 -------------------------------------------------*/
void DelayMs(unsigned char Time)
{
	unsigned char a,b;
	for(a=0;a<Time;a++)
	{
		for(b=0;b<5;b++)
		{
		 	DelayUs(98);               //快1%
		}
	}
}
/*------------------------------------------------- 
 * 	函数名称：DelayS
 * 	功能：   短延时函数
 * 	输入参数：Time 延时时间长度 延时时长Time S
 * 	返回参数：无 
 -------------------------------------------------*/
void DelayS(unsigned char Time)
{
	unsigned char a,b;
	for(a=0;a<Time;a++)
	{
		for(b=0;b<10;b++)
		{
		 	DelayMs(100); 
		}
	}
}
/*-------------------------------------------------
 *	函数名: main 
 *	功能：  主函数
 *	输入：  无
 *	输出：  无
 --------------------------------------------------*/
void main(void)
{
	POWER_INITIAL();		//系统初始化
	TIMER0_INITIAL();	
	PA3_Level_Change_INITIAL();
	PWM1_INITIAL();

    while(1)
	{
    	CLRWDT();  		    //清看门狗
    	
		if(ft_user_pwm_mode == 0)
		{
			if(time_15ms_cnt > 150)
			{
				time_15ms_cnt = 0;
				pwm_rate_value++;
				PWM1_RATE_CHANGE();
			}
		}
		if(ft_user_pwm_mode == 5)
		{

		}
		if(PORTA & 0B00010000)
		{
			key_release = 0;
		}
		else
		{
			if(key_release == 0)
			{
				PWM_MODE_CHANGE();
			}
			key_release = 1;
			
		}
	}
}
