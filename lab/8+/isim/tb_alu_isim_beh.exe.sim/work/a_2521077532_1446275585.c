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
static const char *ng0 = "C:/Users/Farshid726/Desktop/az8plusplus (1)/az8plusplus/tb_alu.vhd";



static void work_a_2521077532_1446275585_p_0(char *t0)
{
    char *t1;
    char *t3;
    char *t4;
    char *t5;
    char *t6;
    char *t7;

LAB0:    xsi_set_current_line(19, ng0);

LAB3:    t1 = (t0 + 5779);
    t3 = (t0 + 3552);
    t4 = (t3 + 56U);
    t5 = *((char **)t4);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    memcpy(t7, t1, 8U);
    xsi_driver_first_trans_fast(t3);

LAB2:
LAB1:    return;
LAB4:    goto LAB2;

}

static void work_a_2521077532_1446275585_p_1(char *t0)
{
    char *t1;
    char *t3;
    char *t4;
    char *t5;
    char *t6;
    char *t7;

LAB0:    xsi_set_current_line(20, ng0);

LAB3:    t1 = (t0 + 5787);
    t3 = (t0 + 3616);
    t4 = (t3 + 56U);
    t5 = *((char **)t4);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    memcpy(t7, t1, 8U);
    xsi_driver_first_trans_fast(t3);

LAB2:
LAB1:    return;
LAB4:    goto LAB2;

}

static void work_a_2521077532_1446275585_p_2(char *t0)
{
    char *t1;
    char *t3;
    char *t4;
    char *t5;
    char *t6;
    char *t7;
    int64 t8;
    char *t9;
    char *t11;
    char *t12;
    char *t13;
    char *t14;
    char *t15;
    int64 t16;
    char *t17;
    char *t19;
    char *t20;
    char *t21;
    char *t22;
    char *t23;
    int64 t24;
    char *t25;
    char *t27;
    char *t28;
    char *t29;
    char *t30;
    char *t31;
    int64 t32;
    char *t33;
    char *t35;
    char *t36;
    char *t37;
    char *t38;
    char *t39;

LAB0:    xsi_set_current_line(21, ng0);

LAB3:    t1 = (t0 + 5795);
    t3 = (t0 + 3680);
    t4 = (t3 + 56U);
    t5 = *((char **)t4);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    memcpy(t7, t1, 3U);
    xsi_driver_first_trans_delta(t3, 0U, 3U, 0LL);
    t8 = (5 * 1000LL);
    t9 = (t0 + 5798);
    t11 = (t0 + 3680);
    t12 = (t11 + 56U);
    t13 = *((char **)t12);
    t14 = (t13 + 56U);
    t15 = *((char **)t14);
    memcpy(t15, t9, 3U);
    xsi_driver_subsequent_trans_delta(t11, 0U, 3U, t8);
    t16 = (10 * 1000LL);
    t17 = (t0 + 5801);
    t19 = (t0 + 3680);
    t20 = (t19 + 56U);
    t21 = *((char **)t20);
    t22 = (t21 + 56U);
    t23 = *((char **)t22);
    memcpy(t23, t17, 3U);
    xsi_driver_subsequent_trans_delta(t19, 0U, 3U, t16);
    t24 = (15 * 1000LL);
    t25 = (t0 + 5804);
    t27 = (t0 + 3680);
    t28 = (t27 + 56U);
    t29 = *((char **)t28);
    t30 = (t29 + 56U);
    t31 = *((char **)t30);
    memcpy(t31, t25, 3U);
    xsi_driver_subsequent_trans_delta(t27, 0U, 3U, t24);
    t32 = (20 * 1000LL);
    t33 = (t0 + 5807);
    t35 = (t0 + 3680);
    t36 = (t35 + 56U);
    t37 = *((char **)t36);
    t38 = (t37 + 56U);
    t39 = *((char **)t38);
    memcpy(t39, t33, 3U);
    xsi_driver_subsequent_trans_delta(t35, 0U, 3U, t32);

LAB2:
LAB1:    return;
LAB4:    goto LAB2;

}


extern void work_a_2521077532_1446275585_init()
{
	static char *pe[] = {(void *)work_a_2521077532_1446275585_p_0,(void *)work_a_2521077532_1446275585_p_1,(void *)work_a_2521077532_1446275585_p_2};
	xsi_register_didat("work_a_2521077532_1446275585", "isim/tb_alu_isim_beh.exe.sim/work/a_2521077532_1446275585.didat");
	xsi_register_executes(pe);
}
