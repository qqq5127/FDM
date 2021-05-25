#include "FT_62F21X_pwm.h";

unsigned char ft_user_pwm_mode = 0;
unchar pwm_rate_value = 0;
unchar pwm_colour_value = 0;

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
    P1ADTH=0;						//脉宽=P1xDT*Tt2ck*TMR2预分频
    
 
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

#ifndef	DEBUG_MODE
	PWM1_RED();
#else
	PWM1_BLUE();
#endif

    TMR2IF=0;						//清TIMER2中断标志
    TMR2IE=1;						//使能TIMER2的中断
    TMR2ON=1;						//打开定时器2
    PEIE=1;							//使能外设中断
    GIE=1;								//使能全局中断
    
}


void PWM1_RED(void)
{
    P1ADTL=0;

    P1OE=0B10000000;		//P1A0输出使能
	//BIT7: 0:禁止P1C输出到管脚;1:允许P1C输出到管脚
    //BIT6: 0:禁止P1B输出到管脚;1:允许P1B输出到管脚
    //BIT6: 0:禁止P1D输出到管脚;1:允许P1D输出到管脚
    //BIT3~BIT2: 故障下，[P1C]管脚的状态，只有当P1CALT为1时才有效 00=高阻  01=输出0  1x=输出1
    //BIT1: 0:禁止P1A0N输出到管脚;1:允许P1A0N输出到管脚
    //BIT0: 0:禁止P1A0输出到管脚;1:允许P1A0输出到管脚 
    
	P1BR1=0B00001000;
	//BIT3:P1CALT [P1C]功能映射选择, 1 = 输出 P1C, 0 = GPIO
	//BIT2:P1DALT [P1D]功能映射选择, 1 = 输出 P1D，或者 P1B 和 P1C 的逻辑波形


}

void PWM1_GREEN(void)
{
    P1ADTL=0;

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
		

}

void PWM1_BLUE(void)
{
    P1ADTL=0;

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
    P1ADTL=0;

    P1OE=0B00100000;		//P1A0输出使能
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
	if(pwm_rate_value >= 200)
	{
		pwm_rate_value = 0;
		pwm_colour_value++;
		pwm_colour_value = pwm_colour_value%4;
		if(pwm_colour_value == 0)
		{
			PWM1_RED();
		}
		else if(pwm_colour_value == 1)
		{
			PWM1_GREEN();
		}
		else if(pwm_colour_value == 2)
		{
			PWM1_BLUE();
		}
		else if(pwm_colour_value == 3)
		{
			PWM1_WHITE();
		}
	}
	if(pwm_rate_value <=100)
	{
		P1ADTL = pwm_rate_value;
	}
	else
	{
		P1ADTL = 200 - pwm_rate_value;
	}
}

