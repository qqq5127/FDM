#include "FT_62F21X_pwm.h";

unsigned char ft_user_pwm_mode = 0;
unchar pwm_rate_value = 0;
unchar pwm_colour_value = 0;

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
    P1ADTH=0;						//����=P1xDT*Tt2ck*TMR2Ԥ��Ƶ
    
 
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

#ifndef	DEBUG_MODE
	PWM1_RED();
#else
	PWM1_BLUE();
#endif

    TMR2IF=0;						//��TIMER2�жϱ�־
    TMR2IE=1;						//ʹ��TIMER2���ж�
    TMR2ON=1;						//�򿪶�ʱ��2
    PEIE=1;							//ʹ�������ж�
    GIE=1;								//ʹ��ȫ���ж�
    
}


void PWM1_RED(void)
{
    P1ADTL=0;

    P1OE=0B10000000;		//P1A0���ʹ��
	//BIT7: 0:��ֹP1C������ܽ�;1:����P1C������ܽ�
    //BIT6: 0:��ֹP1B������ܽ�;1:����P1B������ܽ�
    //BIT6: 0:��ֹP1D������ܽ�;1:����P1D������ܽ�
    //BIT3~BIT2: �����£�[P1C]�ܽŵ�״̬��ֻ�е�P1CALTΪ1ʱ����Ч 00=����  01=���0  1x=���1
    //BIT1: 0:��ֹP1A0N������ܽ�;1:����P1A0N������ܽ�
    //BIT0: 0:��ֹP1A0������ܽ�;1:����P1A0������ܽ� 
    
	P1BR1=0B00001000;
	//BIT3:P1CALT [P1C]����ӳ��ѡ��, 1 = ��� P1C, 0 = GPIO
	//BIT2:P1DALT [P1D]����ӳ��ѡ��, 1 = ��� P1D������ P1B �� P1C ���߼�����


}

void PWM1_GREEN(void)
{
    P1ADTL=0;

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
		

}

void PWM1_BLUE(void)
{
    P1ADTL=0;

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
    P1ADTL=0;

    P1OE=0B00100000;		//P1A0���ʹ��
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

