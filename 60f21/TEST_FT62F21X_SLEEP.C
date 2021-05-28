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
unchar time_2s_cnt = 0;
unchar key_release = 0;
unchar temp_mode;

const unchar ir_key_value[]=
{
	0xFB,0x00,		// fade mode
	0xB2,0x05,		// jump mode
	0xFF,0x01,		// RED  mode
	0xF5,0x02,		// GREEN mode
	0xED,0x03,      // BLUE mode
	0xF6,0x04,      // WHITE mode
	0xEA,0x06,		// RG mode
	0xBF,0x07,		// RB  mode
	0xE1,0x08,		// RY mode
	0xE4,0x09,		// RGB mode	
	0xE2,0x0A,		// MIX COLOR MODE
	0xE5,0x0B,		// - rate
	0xE0,0x0C,		// + rate

	0xF2,0x0D,		// 0.5H
	0xE8,0x0E,		// 1.0H
	0xB3,0x0F,		// 1.5H
	0xE6,0x10,		// 2.0H
	
	0xF1,0x11,		// POWER ON
	0xF0,0x12,		// POWER OFF
};

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
		 auto_power_off_timer_L++;
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


void reset_led_status(void)
{
	time_15ms_cnt = 0;
	time_2s_cnt = 0;

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

		if(power_off_flag == 0)
		{
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
				if(time_15ms_cnt>200)
				{
					time_2s_cnt++;
					if(time_2s_cnt > 100)
					{
						time_2s_cnt = 0;
						JUMP_MODE_CHANGE();
					}
					time_15ms_cnt = 0;
			
				}
			}
			if(ft_user_pwm_mode == 0x0A)
			{
				if(time_15ms_cnt>200)
				{
					time_2s_cnt++;
					if(time_2s_cnt > 100)
					{
						time_2s_cnt = 0;
						MIX_MODE_CHANGE();
					}
					time_15ms_cnt = 0;
			
				}
			}
		}

		if(auto_power_off_timer_H)
		{
			if(auto_power_off_timer_L > 100)
			{
				auto_power_off_timer_L = 0;
				auto_power_off_timer_H--;
				if(!auto_power_off_timer_H)
				{
					ft_user_set_mode = 0x12;
					SET_MODE_REFRESH();
				}
			}
		}
		
		if(PORTA & 0B00010000)
		{
			key_release = 0;
		}
		else
		{
			if(key_release == 0)
			{
				reset_led_status();
				PWM_MODE_CHANGE();
			}
			key_release = 1;
			
		}

		if(ReceiveFinish)
		{
			unchar i;
			
			ReceiveFinish = 0;

			for(i = 0;i < 19;i++)
			{
				if(ir_key_value[i*2] == IRDataTimer[3])
				{
					temp_mode = ir_key_value[i*2 + 1];					
					if(temp_mode == 0x12)
					{
						power_off_mode_backup = ft_user_pwm_mode;
					}
					if(temp_mode >= 0x0D && temp_mode <= 0x10)
					{
						set_time_mode_backup = ft_user_pwm_mode;
					}
					if(temp_mode < 0x0B)
					{
						if(ft_user_pwm_mode != temp_mode)
						{
							ft_user_pwm_mode = temp_mode;
							PWM_MODE_REFRESH();
						}
					}
					else
					{
						ft_user_set_mode = temp_mode;
						SET_MODE_REFRESH();
					}
				}
			}
			
		}
	}
}
