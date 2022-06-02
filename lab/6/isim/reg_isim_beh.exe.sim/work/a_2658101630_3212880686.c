/**********************************************************************/
/*   ____  ____                                                       */
/*  /   /\/   /                                                       */
/* /___/  \  /                                                        */
/* \   \   \/                                                       */
/*  \   \        Copyright (c) 2003-2009 Xilinx, Inc.                */
/*  /   /          All Right Reserved.                                 */
/* /---/   /\                                                         */
/* \   \  /  \                                                      */
/*  \___\/\___\                                                    */
/***********************************************************************/

/* This file is designed for use with ISim build 0x7708f090 */

#define XSI_HIDE_SYMBOL_SPEC true
#include "xsi.h"
#include <memory.h>
#ifdef __GNUC__
#include <stdlib.h>
#else
#include <malloc.h>
#define alloca _alloca
#endif
static const char *ng0 = "C:/Users/Farshid726/Desktop/University/Computer Design Lab/Projects/6/test/reg.vhd";
extern char *IEEE_P_2592010699;
extern char *IEEE_P_1242562249;

char *ieee_p_1242562249_sub_1830103426_1035706684(char *, char *, char *, char *, int );
char *ieee_p_1242562249_sub_2770553711_1035706684(char *, char *, char *, char *, int );
char *ieee_p_1242562249_sub_3064532541_1035706684(char *, char *, char *, char *, int );
unsigned char ieee_p_2592010699_sub_1744673427_503743352(char *, char *, unsigned int , unsigned int );


static void work_a_2658101630_3212880686_p_0(char *t0)
{
    char t16[16];
    char *t1;
    unsigned char t2;
    char *t3;
    char *t4;
    unsigned char t5;
    unsigned char t6;
    char *t7;
    char *t8;
    char *t9;
    char *t10;
    char *t11;
    char *t12;
    unsigned int t13;
    unsigned int t14;
    char *t15;
    char *t17;
    char *t18;
    char *t19;
    char *t20;
    char *t21;
    char *t22;
    char *t23;
    char *t24;

LAB0:    xsi_set_current_line(22, ng0);
    t1 = (t0 + 1632U);
    t2 = ieee_p_2592010699_sub_1744673427_503743352(IEEE_P_2592010699, t1, 0U, 0U);
    if (t2 != 0)
        goto LAB2;

LAB4:
LAB3:    t1 = (t0 + 3432);
    *((int *)t1) = 1;

LAB1:    return;
LAB2:    xsi_set_current_line(23, ng0);
    t3 = (t0 + 1512U);
    t4 = *((char **)t3);
    t5 = *((unsigned char *)t4);
    t6 = (t5 == (unsigned char)2);
    if (t6 != 0)
        goto LAB5;

LAB7:    t1 = (t0 + 1352U);
    t3 = *((char **)t1);
    t2 = *((unsigned char *)t3);
    t5 = (t2 == (unsigned char)3);
    if (t5 != 0)
        goto LAB8;

LAB9:    t1 = (t0 + 1192U);
    t3 = *((char **)t1);
    t1 = (t0 + 5754);
    t2 = 1;
    if (2U == 2U)
        goto LAB12;

LAB13:    t2 = 0;

LAB14:    if (t2 != 0)
        goto LAB10;

LAB11:    t9 = (t0 + 1192U);
    t10 = *((char **)t9);
    t9 = (t0 + 5756);
    t5 = 1;
    if (2U == 2U)
        goto LAB20;

LAB21:    t5 = 0;

LAB22:    if (t5 != 0)
        goto LAB18;

LAB19:    t1 = (t0 + 1192U);
    t3 = *((char **)t1);
    t1 = (t0 + 5758);
    t2 = 1;
    if (2U == 2U)
        goto LAB28;

LAB29:    t2 = 0;

LAB30:    if (t2 != 0)
        goto LAB26;

LAB27:    t1 = (t0 + 1192U);
    t3 = *((char **)t1);
    t1 = (t0 + 5760);
    t2 = 1;
    if (2U == 2U)
        goto LAB36;

LAB37:    t2 = 0;

LAB38:    if (t2 != 0)
        goto LAB34;

LAB35:
LAB6:    goto LAB3;

LAB5:    xsi_set_current_line(24, ng0);
    t3 = (t0 + 5750);
    t8 = (t0 + 3512);
    t9 = (t8 + 56U);
    t10 = *((char **)t9);
    t11 = (t10 + 56U);
    t12 = *((char **)t11);
    memcpy(t12, t3, 4U);
    xsi_driver_first_trans_fast_port(t8);
    goto LAB6;

LAB8:    xsi_set_current_line(26, ng0);
    t1 = (t0 + 1032U);
    t4 = *((char **)t1);
    t1 = (t0 + 3512);
    t7 = (t1 + 56U);
    t8 = *((char **)t7);
    t9 = (t8 + 56U);
    t10 = *((char **)t9);
    memcpy(t10, t4, 4U);
    xsi_driver_first_trans_fast_port(t1);
    goto LAB6;

LAB10:    goto LAB6;

LAB12:    t13 = 0;

LAB15:    if (t13 < 2U)
        goto LAB16;
    else
        goto LAB14;

LAB16:    t7 = (t3 + t13);
    t8 = (t1 + t13);
    if (*((unsigned char *)t7) != *((unsigned char *)t8))
        goto LAB13;

LAB17:    t13 = (t13 + 1);
    goto LAB15;

LAB18:    xsi_set_current_line(30, ng0);
    t17 = (t0 + 1832U);
    t18 = *((char **)t17);
    t17 = (t0 + 5716U);
    t19 = ieee_p_1242562249_sub_2770553711_1035706684(IEEE_P_1242562249, t16, t18, t17, 1);
    t20 = (t0 + 3512);
    t21 = (t20 + 56U);
    t22 = *((char **)t21);
    t23 = (t22 + 56U);
    t24 = *((char **)t23);
    memcpy(t24, t19, 4U);
    xsi_driver_first_trans_fast_port(t20);
    goto LAB6;

LAB20:    t14 = 0;

LAB23:    if (t14 < 2U)
        goto LAB24;
    else
        goto LAB22;

LAB24:    t12 = (t10 + t14);
    t15 = (t9 + t14);
    if (*((unsigned char *)t12) != *((unsigned char *)t15))
        goto LAB21;

LAB25:    t14 = (t14 + 1);
    goto LAB23;

LAB26:    xsi_set_current_line(32, ng0);
    t9 = (t0 + 1832U);
    t10 = *((char **)t9);
    t9 = (t0 + 5716U);
    t11 = ieee_p_1242562249_sub_3064532541_1035706684(IEEE_P_1242562249, t16, t10, t9, 1);
    t12 = (t0 + 3512);
    t15 = (t12 + 56U);
    t17 = *((char **)t15);
    t18 = (t17 + 56U);
    t19 = *((char **)t18);
    memcpy(t19, t11, 4U);
    xsi_driver_first_trans_fast_port(t12);
    goto LAB6;

LAB28:    t13 = 0;

LAB31:    if (t13 < 2U)
        goto LAB32;
    else
        goto LAB30;

LAB32:    t7 = (t3 + t13);
    t8 = (t1 + t13);
    if (*((unsigned char *)t7) != *((unsigned char *)t8))
        goto LAB29;

LAB33:    t13 = (t13 + 1);
    goto LAB31;

LAB34:    xsi_set_current_line(34, ng0);
    t9 = (t0 + 1832U);
    t10 = *((char **)t9);
    t9 = (t0 + 5716U);
    t11 = ieee_p_1242562249_sub_1830103426_1035706684(IEEE_P_1242562249, t16, t10, t9, 1);
    t12 = (t0 + 3512);
    t15 = (t12 + 56U);
    t17 = *((char **)t15);
    t18 = (t17 + 56U);
    t19 = *((char **)t18);
    memcpy(t19, t11, 4U);
    xsi_driver_first_trans_fast_port(t12);
    goto LAB6;

LAB36:    t13 = 0;

LAB39:    if (t13 < 2U)
        goto LAB40;
    else
        goto LAB38;

LAB40:    t7 = (t3 + t13);
    t8 = (t1 + t13);
    if (*((unsigned char *)t7) != *((unsigned char *)t8))
        goto LAB37;

LAB41:    t13 = (t13 + 1);
    goto LAB39;

}


extern void work_a_2658101630_3212880686_init()
{
	static char *pe[] = {(void *)work_a_2658101630_3212880686_p_0};
	xsi_register_didat("work_a_2658101630_3212880686", "isim/reg_isim_beh.exe.sim/work/a_2658101630_3212880686.didat");
	xsi_register_executes(pe);
}
