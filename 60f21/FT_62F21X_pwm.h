#ifndef _FT_USR_PWM_H_
#define _FT_USR_PWM_H_

#include 	"FT_USER_CONFIG.h";
#include	"SYSCFG.h";
#include 	"FT62F21X.h";

#define	PWM_PILSE_WIDTH		100
extern unsigned char ft_user_pwm_mode;
extern unchar pwm_rate_value;
extern unchar power_off_mode_backup;
extern unchar set_time_mode_backup;
extern unchar ft_user_set_mode;
extern unchar power_off_flag;
extern unchar auto_power_off_timer_L;
extern unlong  auto_power_off_timer_H;


extern void PWM1_INITIAL(void);
extern void PWM1_RED(void);
extern void PWM1_GREEN(void);
extern void PWM1_BLUE(void);
extern void PWM1_WHITE(void);
extern void PWM1_RATE_CHANGE(void);
extern void PWM_MODE_CHANGE(void);
extern void JUMP_MODE_CHANGE(void);
extern void PWM_MODE_REFRESH(void);
extern void MIX_MODE_CHANGE(void);
extern void SET_MODE_REFRESH(void);

#endif

