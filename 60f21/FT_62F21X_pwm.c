#include "FT_62F21X_pwm.h";

extern void reset_led_status(void);

unsigned char ft_user_pwm_mode = 0;
unsigned char ft_user_set_mode = 0;
// 0: FADE ģʽ
// 1: ��ɫ��
// 2: ��ɫ��
// 3: ��ɫ��
// 4: ��ɫ��
// 5: jumpģʽ

unchar pwm_rate_value = 0;
unchar pwm_colour_value = 0;
unchar jump_led_rate = 100;
unchar power_off_mode_backup = 0xff;
unchar set_time_mode_backup = 0xff;
unchar power_off_flag = 0;

unchar auto_power_off_timer_L = 0;


unlong  auto_power_off_timer_H = 0;

/*-------------------------------------------------
 *	������: PWM1_INITIAL 
 *	���ܣ�  PWM1��ʼ������
 *	���룺  ��
 *	�����  ��
 --------------------------------------------------*/
void PWM1_INITIAL(void)
{
	T2CON0=0B00000001;	//T2Ԥ��Ƶ1:4�����Ƶ1:1
    //BIT7: 0�������壻 1����PR2/P1xDTy����ֵ�ֱ���µ�PR2�Ĵ�����P1xDTy_ACT
    //BIT6~BIT3: ��ʱ��2������Ƶ��ѡ�� 0000:1:1;0001:1:2;����1:16
    //BIT2:0:�رն�ʱ��2��1���򿪶�ʱ��2
    //BIT1~0:��ʱ��2Ԥ��Ƶѡ�� 00:1;01:4;1x:16
    
    T2CON1=0B00000000;	//T2ʱ������ϵͳʱ�ӣ�PWM����ģʽ
    //BIT4: PWMģʽѡ�� 0:����ģʽ��1��������ģʽ
    //BIT3: 0:PWMģʽ��1��������ģʽ	
    //Timer2ʱ��Դѡ��000��ָ��ʱ�ӣ�001��ϵͳʱ�ӣ�010��HIRC��2��Ƶ��100��HIRC��101��LIRC
    
    TMR2H=0;						//��ʱ��2�����Ĵ���
    TMR2L=100;
    
    PR2H=0;							//����=��PR2+1��*Tt2ck*TMR2Ԥ��Ƶ
    PR2L=PWM_PILSE_WIDTH;

	P1CDTH=0;						//����=P1xDT*Tt2ck*TMR2Ԥ��Ƶ
	P1DDTH=0;
    P1CDTL=0;
    P1DDTL=0;
 
    P1POL=0B00000000;		//P1A0�ߵ�ƽ��Ч
    //BIT7: 0:P1C�ߵ�ƽ��Ч;1:P1C�͵�ƽ��Ч
    //BIT6: 0:P1B�ߵ�ƽ��Ч;1:P1B�͵�ƽ��Ч
    //BIT5: 0:P1D�ߵ�ƽ��Ч;1:P1D�͵�ƽ��Ч
    //BIT1: 0:P1A0N�ߵ�ƽ��Ч;1:P1A0N�͵�ƽ��Ч
    //BIT0: 0:P1A0�ߵ�ƽ��Ч;1:P1A0�͵�ƽ��Ч
    
    P1CON=0B00000000;
    //BIT7:PWM1 ����ʹ��λ
	//1 = ����ɲ��ʱ��P1BEVTλ���˳��ر��¼�ʱ�Զ����㣬PWM1�Զ�����
	//0 = ����ɲ��ʱ�������������P1BEVT����������PWM1
    //BIT6~0:PWM1����ʱ������
	//P1DCn = Ԥ��MPWM�ź�Ӧת��Ϊ��Ч��PWM�ź�ʵ��תΪ��Ч֮���T2CK������
	
	P1AUX=0B00000000;
	//BIT1:P1DF2E �� P1DALT Ϊ 1 ʱ�� [P1D]�ܽŵ� 2 ����ʹ��
			//1 = ��� P1B �� P1C ��ͬ�򣬻������
			//0 = ��� P1D
	//BIT0:P1DF2 [P1D]�ܽŵ� 2 ����ѡ��
			//1 = ��� P1B �� P1C ��ͬ��
			//0 = ��� P1B �� P1C �����		

	PWM1_RED();
	pwm_colour_value = 0;

    TMR2IF=0;						//��TIMER2�жϱ�־
    TMR2IE=1;						//ʹ��TIMER2���ж�
    TMR2ON=1;						//�򿪶�ʱ��2
    PEIE=1;							//ʹ�������ж�
    GIE=1;								//ʹ��ȫ���ж�
    
}


void PWM1_RED(void)
{
#ifndef DEBUG_MODE
    P1CDTL=0;
    P1DDTL=0;

    P1OE=0B00000000;		//P1A0���ʹ��
	//BIT7: 0:��ֹP1C������ܽ�;1:����P1C������ܽ�
    //BIT6: 0:��ֹP1B������ܽ�;1:����P1B������ܽ�
    //BIT6: 0:��ֹP1D������ܽ�;1:����P1D������ܽ�
    //BIT3~BIT2: �����£�[P1C]�ܽŵ�״̬��ֻ�е�P1CALTΪ1ʱ����Ч 00=����  01=���0  1x=���1
    //BIT1: 0:��ֹP1A0N������ܽ�;1:����P1A0N������ܽ�
    //BIT0: 0:��ֹP1A0������ܽ�;1:����P1A0������ܽ� 
    
	P1BR1=0B00001000;
	//BIT3:P1CALT [P1C]����ӳ��ѡ��, 1 = ��� P1C, 0 = GPIO
	//BIT2:P1DALT [P1D]����ӳ��ѡ��, 1 = ��� P1D������ P1B �� P1C ���߼�����
#else
	P1CDTL=0;

	P1OE=0B00000000;		//P1A0���ʹ��
	//BIT7: 0:��ֹP1C������ܽ�;1:����P1C������ܽ�
	//BIT6: 0:��ֹP1B������ܽ�;1:����P1B������ܽ�
	//BIT6: 0:��ֹP1D������ܽ�;1:����P1D������ܽ�
	//BIT3~BIT2: �����£�[P1C]�ܽŵ�״̬��ֻ�е�P1CALTΪ1ʱ����Ч 00=����  01=���0  1x=���1
	//BIT1: 0:��ֹP1A0N������ܽ�;1:����P1A0N������ܽ�
	//BIT0: 0:��ֹP1A0������ܽ�;1:����P1A0������ܽ� 

	P1BR1=0B00000000;
#endif

}

void PWM1_GREEN(void)
{
#ifndef DEBUG_MODE
    P1CDTL=0;
    P1DDTL=0;

    P1OE=0B00100000;		//P1A0���ʹ��
	//BIT7: 0:��ֹP1C������ܽ�;1:����P1C������ܽ�
    //BIT6: 0:��ֹP1B������ܽ�;1:����P1B������ܽ�
    //BIT6: 0:��ֹP1D������ܽ�;1:����P1D������ܽ�
    //BIT3~BIT2: �����£�[P1C]�ܽŵ�״̬��ֻ�е�P1CALTΪ1ʱ����Ч 00=����  01=���0  1x=���1
    //BIT1: 0:��ֹP1A0N������ܽ�;1:����P1A0N������ܽ�
    //BIT0: 0:��ֹP1A0������ܽ�;1:����P1A0������ܽ� 
    
	P1BR1=0B00000000;
	//BIT3:P1CALT [P1C]����ӳ��ѡ��, 1 = ��� P1C, 0 = GPIO
	//BIT2:P1DALT [P1D]����ӳ��ѡ��, 1 = ��� P1D������ P1B �� P1C ���߼�����
#else
	P1CDTL=0;

	P1OE=0B00000000;		//P1A0���ʹ��
	//BIT7: 0:��ֹP1C������ܽ�;1:����P1C������ܽ�
	//BIT6: 0:��ֹP1B������ܽ�;1:����P1B������ܽ�
	//BIT6: 0:��ֹP1D������ܽ�;1:����P1D������ܽ�
	//BIT3~BIT2: �����£�[P1C]�ܽŵ�״̬��ֻ�е�P1CALTΪ1ʱ����Ч 00=����  01=���0  1x=���1
	//BIT1: 0:��ֹP1A0N������ܽ�;1:����P1A0N������ܽ�
	//BIT0: 0:��ֹP1A0������ܽ�;1:����P1A0������ܽ� 

	P1BR1=0B00000000;

#endif
}

void PWM1_BLUE(void)
{
    P1CDTL=0;
    P1DDTL=0;

    P1OE=0B10000000;		//P1A0���ʹ��
	//BIT7: 0:��ֹP1C������ܽ�;1:����P1C������ܽ�
    //BIT6: 0:��ֹP1B������ܽ�;1:����P1B������ܽ�
    //BIT6: 0:��ֹP1D������ܽ�;1:����P1D������ܽ�
    //BIT3~BIT2: �����£�[P1C]�ܽŵ�״̬��ֻ�е�P1CALTΪ1ʱ����Ч 00=����  01=���0  1x=���1
    //BIT1: 0:��ֹP1A0N������ܽ�;1:����P1A0N������ܽ�
    //BIT0: 0:��ֹP1A0������ܽ�;1:����P1A0������ܽ� 
    
	P1BR1=0B00000000;
	//BIT3:P1CALT [P1C]����ӳ��ѡ��, 1 = ��� P1C, 0 = GPIO
	//BIT2:P1DALT [P1D]����ӳ��ѡ��, 1 = ��� P1D������ P1B �� P1C ���߼�����

}

void PWM1_WHITE(void)
{
    P1CDTL=0;
    P1DDTL=0;

    P1OE=0B00000000;		//P1A0���ʹ��
	//BIT7: 0:��ֹP1C������ܽ�;1:����P1C������ܽ�
    //BIT6: 0:��ֹP1B������ܽ�;1:����P1B������ܽ�
    //BIT6: 0:��ֹP1D������ܽ�;1:����P1D������ܽ�
    //BIT3~BIT2: �����£�[P1C]�ܽŵ�״̬��ֻ�е�P1CALTΪ1ʱ����Ч 00=����  01=���0  1x=���1
    //BIT1: 0:��ֹP1A0N������ܽ�;1:����P1A0N������ܽ�
    //BIT0: 0:��ֹP1A0������ܽ�;1:����P1A0������ܽ� 
    
	P1BR1=0B00000100;
	//BIT3:P1CALT [P1C]����ӳ��ѡ��, 1 = ��� P1C, 0 = GPIO
	//BIT2:P1DALT [P1D]����ӳ��ѡ��, 1 = ��� P1D������ P1B �� P1C ���߼�����

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
 *  �������ƣ�DelayUs
 *  ���ܣ�    ����ʱ���� --16M-4T--��ſ�1%����.
 *  ���������Time ��ʱʱ�䳤�� ��ʱʱ��Time*2 Us
 * 	���ز������� 
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
 * 	�������ƣ� DelayMs
 * 	���ܣ�    ����ʱ����
 * 	���������Time ��ʱʱ�䳤�� ��ʱʱ��Time ms
 * 	���ز������� 
 -------------------------------------------------*/
void DelayMs(unsigned char Time)
{
	unsigned char a,b;
	for(a=0;a<Time;a++)
	{
		for(b=0;b<5;b++)
		{
		 	DelayUs(98);               //��1%
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
