#include "FT_62F21X_pwm.h";

extern void reset_led_status(void);

unsigned char ft_user_pwm_mode = 0;
unsigned char ft_user_set_mode = 0;
// 0: FADE 模式
// 1: 红色灯
// 2: 绿色灯
// 3: 蓝色灯
// 4: 白色灯
// 5: jump模式

unchar pwm_rate_value = 0;
unchar pwm_colour_value = 0;
unchar jump_led_rate = 100;
unchar power_off_mode_backup = 0xff;
unchar set_time_mode_backup = 0xff;
unchar power_off_flag = 0;

unchar auto_power_off_timer_L = 0;


unlong  auto_power_off_timer_H = 0;

/*-------------------------------------------------
 *	函数名: PWM1_INITIAL 
 *	功能：  PWM1初始化函数
 *	输入：  无
 *	输出：  无
 --------------------------------------------------*/
void PWM1_INITIAL(void)
{
	T2CON0=0B00000001;	//T2预分频1:4，后分频1:1
    //BIT7: 0：无意义； 1：把PR2/P1xDTy缓冲值分别更新到PR2寄存器和P1xDTy_ACT
    //BIT6~BIT3: 定时器2输出后分频比选择 0000:1:1;0001:1:2;……1:16
    //BIT2:0:关闭定时器2；1：打开定时器2
    //BIT1~0:定时器2预分频选择 00:1;01:4;1x:16
    
    T2CON1=0B00000000;	//T2时钟来自系统时钟，PWM连续模式
    //BIT4: PWM模式选择 0:连续模式；1：单脉冲模式
    //BIT3: 0:PWM模式；1：蜂鸣器模式	
    //Timer2时钟源选择：000：指令时钟；001：系统时钟；010：HIRC的2倍频；100：HIRC；101：LIRC
    
    TMR2H=0;						//定时器2计数寄存器
    TMR2L=100;
    
    PR2H=0;							//周期=（PR2+1）*Tt2ck*TMR2预分频
    PR2L=PWM_PILSE_WIDTH;

	P1CDTH=0;						//脉宽=P1xDT*Tt2ck*TMR2预分频
	P1DDTH=0;
    P1CDTL=0;
    P1DDTL=0;
 
    P1POL=0B00000000;		//P1A0高电平有效
    //BIT7: 0:P1C高电平有效;1:P1C低电平有效
    //BIT6: 0:P1B高电平有效;1:P1B低电平有效
    //BIT5: 0:P1D高电平有效;1:P1D低电平有效
    //BIT1: 0:P1A0N高电平有效;1:P1A0N低电平有效
    //BIT0: 0:P1A0高电平有效;1:P1A0低电平有效
    
    P1CON=0B00000000;
    //BIT7:PWM1 重启使能位
	//1 = 故障刹车时，P1BEVT位在退出关闭事件时自动清零，PWM1自动重启
	//0 = 故障刹车时，必须用软件将P1BEVT清零以重启PWM1
    //BIT6~0:PWM1死区时间设置
	//P1DCn = 预定MPWM信号应转变为有效与PWM信号实际转为有效之间的T2CK周期数
	
	P1AUX=0B00000000;
	//BIT1:P1DF2E 当 P1DALT 为 1 时， [P1D]管脚第 2 功能使能
			//1 = 输出 P1B 和 P1C 的同或，或者异或
			//0 = 输出 P1D
	//BIT0:P1DF2 [P1D]管脚第 2 功能选择
			//1 = 输出 P1B 和 P1C 的同或
			//0 = 输出 P1B 和 P1C 的异或		

	PWM1_RED();
	pwm_colour_value = 0;

    TMR2IF=0;						//清TIMER2中断标志
    TMR2IE=1;						//使能TIMER2的中断
    TMR2ON=1;						//打开定时器2
    PEIE=1;							//使能外设中断
    GIE=1;								//使能全局中断
    
}


void PWM1_RED(void)
{
#ifndef DEBUG_MODE
    P1CDTL=0;
    P1DDTL=0;

    P1OE=0B00000000;		//P1A0输出使能
	//BIT7: 0:禁止P1C输出到管脚;1:允许P1C输出到管脚
    //BIT6: 0:禁止P1B输出到管脚;1:允许P1B输出到管脚
    //BIT6: 0:禁止P1D输出到管脚;1:允许P1D输出到管脚
    //BIT3~BIT2: 故障下，[P1C]管脚的状态，只有当P1CALT为1时才有效 00=高阻  01=输出0  1x=输出1
    //BIT1: 0:禁止P1A0N输出到管脚;1:允许P1A0N输出到管脚
    //BIT0: 0:禁止P1A0输出到管脚;1:允许P1A0输出到管脚 
    
	P1BR1=0B00001000;
	//BIT3:P1CALT [P1C]功能映射选择, 1 = 输出 P1C, 0 = GPIO
	//BIT2:P1DALT [P1D]功能映射选择, 1 = 输出 P1D，或者 P1B 和 P1C 的逻辑波形
#else
	P1CDTL=0;

	P1OE=0B00000000;		//P1A0输出使能
	//BIT7: 0:禁止P1C输出到管脚;1:允许P1C输出到管脚
	//BIT6: 0:禁止P1B输出到管脚;1:允许P1B输出到管脚
	//BIT6: 0:禁止P1D输出到管脚;1:允许P1D输出到管脚
	//BIT3~BIT2: 故障下，[P1C]管脚的状态，只有当P1CALT为1时才有效 00=高阻  01=输出0  1x=输出1
	//BIT1: 0:禁止P1A0N输出到管脚;1:允许P1A0N输出到管脚
	//BIT0: 0:禁止P1A0输出到管脚;1:允许P1A0输出到管脚 

	P1BR1=0B00000000;
#endif

}

void PWM1_GREEN(void)
{
#ifndef DEBUG_MODE
    P1CDTL=0;
    P1DDTL=0;

    P1OE=0B00100000;		//P1A0输出使能
	//BIT7: 0:禁止P1C输出到管脚;1:允许P1C输出到管脚
    //BIT6: 0:禁止P1B输出到管脚;1:允许P1B输出到管脚
    //BIT6: 0:禁止P1D输出到管脚;1:允许P1D输出到管脚
    //BIT3~BIT2: 故障下，[P1C]管脚的状态，只有当P1CALT为1时才有效 00=高阻  01=输出0  1x=输出1
    //BIT1: 0:禁止P1A0N输出到管脚;1:允许P1A0N输出到管脚
    //BIT0: 0:禁止P1A0输出到管脚;1:允许P1A0输出到管脚 
    
	P1BR1=0B00000000;
	//BIT3:P1CALT [P1C]功能映射选择, 1 = 输出 P1C, 0 = GPIO
	//BIT2:P1DALT [P1D]功能映射选择, 1 = 输出 P1D，或者 P1B 和 P1C 的逻辑波形
#else
	P1CDTL=0;

	P1OE=0B00000000;		//P1A0输出使能
	//BIT7: 0:禁止P1C输出到管脚;1:允许P1C输出到管脚
	//BIT6: 0:禁止P1B输出到管脚;1:允许P1B输出到管脚
	//BIT6: 0:禁止P1D输出到管脚;1:允许P1D输出到管脚
	//BIT3~BIT2: 故障下，[P1C]管脚的状态，只有当P1CALT为1时才有效 00=高阻  01=输出0  1x=输出1
	//BIT1: 0:禁止P1A0N输出到管脚;1:允许P1A0N输出到管脚
	//BIT0: 0:禁止P1A0输出到管脚;1:允许P1A0输出到管脚 

	P1BR1=0B00000000;

#endif
}

void PWM1_BLUE(void)
{
    P1CDTL=0;
    P1DDTL=0;

    P1OE=0B10000000;		//P1A0输出使能
	//BIT7: 0:禁止P1C输出到管脚;1:允许P1C输出到管脚
    //BIT6: 0:禁止P1B输出到管脚;1:允许P1B输出到管脚
    //BIT6: 0:禁止P1D输出到管脚;1:允许P1D输出到管脚
    //BIT3~BIT2: 故障下，[P1C]管脚的状态，只有当P1CALT为1时才有效 00=高阻  01=输出0  1x=输出1
    //BIT1: 0:禁止P1A0N输出到管脚;1:允许P1A0N输出到管脚
    //BIT0: 0:禁止P1A0输出到管脚;1:允许P1A0输出到管脚 
    
	P1BR1=0B00000000;
	//BIT3:P1CALT [P1C]功能映射选择, 1 = 输出 P1C, 0 = GPIO
	//BIT2:P1DALT [P1D]功能映射选择, 1 = 输出 P1D，或者 P1B 和 P1C 的逻辑波形

}

void PWM1_WHITE(void)
{
    P1CDTL=0;
    P1DDTL=0;

    P1OE=0B00000000;		//P1A0输出使能
	//BIT7: 0:禁止P1C输出到管脚;1:允许P1C输出到管脚
    //BIT6: 0:禁止P1B输出到管脚;1:允许P1B输出到管脚
    //BIT6: 0:禁止P1D输出到管脚;1:允许P1D输出到管脚
    //BIT3~BIT2: 故障下，[P1C]管脚的状态，只有当P1CALT为1时才有效 00=高阻  01=输出0  1x=输出1
    //BIT1: 0:禁止P1A0N输出到管脚;1:允许P1A0N输出到管脚
    //BIT0: 0:禁止P1A0输出到管脚;1:允许P1A0输出到管脚 
    
	P1BR1=0B00000100;
	//BIT3:P1CALT [P1C]功能映射选择, 1 = 输出 P1C, 0 = GPIO
	//BIT2:P1DALT [P1D]功能映射选择, 1 = 输出 P1D，或者 P1B 和 P1C 的逻辑波形

}

void PWM1_RATE_CHANGE(void)
{
	unchar pwm_value;
	
	if(pwm_rate_value >= 200)
	{
		pwm_rate_value = 0;
		pwm_colour_value++;
		pwm_colour_value = pwm_colour_value%4;
		switch(pwm_colour_value)
		{
			case 0:
				PWM1_RED();
			break;
			
			case 1:
				PWM1_GREEN();
			break;
			
			case 2:
				PWM1_BLUE();
			break;
			
			case 3:
				PWM1_WHITE();
			break;

			default:

			break;
		}
	}
	if(pwm_rate_value <=100)
	{
		pwm_value = pwm_rate_value;
	}
	else
	{
		pwm_value = 200 - pwm_rate_value;
	}
	
	switch(pwm_colour_value)
	{
		case 0:
			P1CDTL = pwm_value;
		break;
		
		case 1:
			P1DDTL = pwm_value;
		break;
		
		case 2:
			P1CDTL = pwm_value;
		break;
		
		case 3:
			P1DDTL = pwm_value;
		break;
	
		default:
	
		break;
	}
	
}

void JUMP_MODE_CHANGE(void)
{
	pwm_colour_value++;
	pwm_colour_value = pwm_colour_value%4;
	switch(pwm_colour_value)
	{
		case 0:
#ifndef DEBUG_MODE
			P1OE=0B00000000;
			P1BR1=0B00001000;
#endif
		break;
		
		case 1:
#ifndef DEBUG_MODE			
			P1OE=0B00100000;
			P1BR1=0B00000000;
#endif
		break;
		
		case 2:
			P1OE=0B10000000;
			P1BR1=0B00000000;
		break;
		
		case 3:
			P1OE=0B00000000;
			P1BR1=0B00000100;
		break;

		default:

		break;
	}
}

void PWM_MODE_CHANGE(void)
{
	ft_user_pwm_mode++;
	if(ft_user_pwm_mode == 6)
	{
		ft_user_pwm_mode = 0;
	}
	if(ft_user_pwm_mode > 6)
	{
		ft_user_pwm_mode = 1;
	}
	PWM_MODE_REFRESH();

}

void MIX_MODE_CHANGE(void)
{
	pwm_colour_value++;
	pwm_colour_value = pwm_colour_value%6;

	switch(pwm_colour_value)
	{
		case 0:
			P1OE=0B00100000;
			P1BR1=0B00001000;
		break;

		case 1:
			P1OE=0B10000000;
			P1BR1=0B00001000;

		break;

		case 2:
			P1OE=0B00000000;
			P1BR1=0B00001100;

		break;

		case 3:
			P1OE=0B10100000;
			P1BR1=0B00000000;
		break;

		case 4:
			P1OE=0B00100000;
			P1BR1=0B00000100;
		break;

		case 5:
			P1OE=0B10000000;
			P1BR1=0B00000100;
		break;

		default:

		break;
	}
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


/*
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

*/

void PWM_MODE_REFRESH(void)
{
	reset_led_status();

	if(ft_user_pwm_mode != 0)
	{
		P1CDTL=jump_led_rate;
		P1DDTL=jump_led_rate;
	}
	else
	{
		P1CDTL=0;
		P1DDTL=0;
	}

	if(power_off_flag == 1)
	{
			return;
	}
	
	switch(ft_user_pwm_mode)
	{
		case 0x00:
			pwm_rate_value = 0;
			pwm_colour_value = 0;
			PWM1_RED();

		break;
		
		case 0x01:
#ifndef DEBUG_MODE
			P1OE=0B00000000;
			P1BR1=0B00001000;
#endif
		break;
		
		case 0x02:
#ifndef DEBUG_MODE			
			P1OE=0B00100000;
			P1BR1=0B00000000;
#endif
		break;
		
		case 0x03:
			P1OE=0B10000000;
			P1BR1=0B00000000;
		break;
		
		case 0x04:
			P1OE=0B00000000;
			P1BR1=0B00000100;
		break;
		
		case 0x05:
			pwm_colour_value = 0;
#ifndef DEBUG_MODE
			P1OE=0B00000000;
			P1BR1=0B00001000;
#endif
		break;

		case 0x06:
#ifndef	 DEBUG_MODE
		P1OE=0B00100000;
		P1BR1=0B00001000;
#endif
		break;

		case 0x07:
#ifndef	 DEBUG_MODE
		P1OE=0B10000000;
		P1BR1=0B00001000;
		
#endif
		break;

		case 0x08:
			P1OE=0B00000000;
			P1BR1=0B00001100;
		break;

		case 0x09:
			P1OE=0B10100000;
			P1BR1=0B00001000;
		break;

		case 0x0A:
			pwm_colour_value = 0;
			P1OE=0B00100000;
			P1BR1=0B00001000;

		break;
				default:
		
				break;
			}
		
}

void SET_MODE_REFRESH(void)
{
	if(power_off_flag == 1)
	{
		if(ft_user_set_mode != 0x11)
		{
			return;
		}
	}
	
	switch(ft_user_set_mode)
		{
		case 0x0B:
			if(jump_led_rate > 20)
			{
				jump_led_rate = jump_led_rate - 20;
			}
			if(ft_user_pwm_mode != 0)
			{
				P1CDTL=jump_led_rate;
				P1DDTL=jump_led_rate;
			}
		break;

		
		case 0x0C:
			if(jump_led_rate < 100)
			{
				jump_led_rate = jump_led_rate + 20;
			}
			if(ft_user_pwm_mode != 0)
			{
				P1CDTL=jump_led_rate;
				P1DDTL=jump_led_rate;
			}
		break;
					
		case 0x0D:
		case 0x0E:
		case 0x0F:
		case 0x10:
			auto_power_off_timer_H = (ft_user_set_mode - 0x0C);
		    auto_power_off_timer_H = auto_power_off_timer_H*180000;
			P1CDTL=100;
			P1DDTL=100;
			P1OE=0B10100000;
			P1BR1=0B00001100;
			DelayMs(50);
			if(set_time_mode_backup != 0xff)
			{
				ft_user_pwm_mode = set_time_mode_backup;
				PWM_MODE_REFRESH();
			}
		break;
		
		case 0x11:
			power_off_flag = 0;
			//jump_led_rate = 100;		//cuixu test
			if(power_off_mode_backup < 0x0B)
			{
				ft_user_pwm_mode = power_off_mode_backup;
				PWM_MODE_REFRESH();
			}
			else
			{
				ft_user_pwm_mode = 0;	// cuixu test
				PWM_MODE_REFRESH();
			}
			power_off_mode_backup = 0xff;			
		break;

		case 0x12:
			P1OE=0B00000000;
			P1BR1=0B00000000;
			power_off_flag = 1;
			auto_power_off_timer_H = 0;
		break;

		
		default:

		break;
	}

}
