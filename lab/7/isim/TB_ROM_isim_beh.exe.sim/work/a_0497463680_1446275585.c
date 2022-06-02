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
static const char *ng0 = "D:/ISE Projects/az7/ROM.vhd";
extern char *IEEE_P_1242562249;
extern char *IEEE_P_2592010699;

int ieee_p_1242562249_sub_1657552908_1035706684(char *, char *, char *);
char *ieee_p_1242562249_sub_180853171_1035706684(char *, char *, int , int );
unsigned char ieee_p_2592010699_sub_1744673427_503743352(char *, char *, unsigned int , unsigned int );


static void work_a_0497463680_1446275585_p_0(char *t0)
{
    char t6[16];
    int t1;
    char *t2;
    char *t3;
    int t4;
    int t5;
    char *t7;
    int t8;
    int t9;
    unsigned int t10;
    char *t11;
    char *t12;
    int t13;
    int t14;
    unsigned int t15;
    unsigned int t16;
    unsigned int t17;
    char *t18;
    char *t19;
    char *t20;
    char *t21;
    char *t22;
    unsigned char t23;
    unsigned char t24;
    unsigned char t25;
    char *t26;

LAB0:    xsi_set_current_line(32, ng0);
    t1 = (8 - 1);
    t2 = (t0 + 5954);
    *((int *)t2) = 0;
    t3 = (t0 + 5958);
    *((int *)t3) = t1;
    t4 = 0;
    t5 = t1;

LAB2:    if (t4 <= t5)
        goto LAB3;

LAB5:    xsi_set_current_line(37, ng0);
    t2 = (t0 + 1352U);
    t3 = *((char **)t2);
    t23 = *((unsigned char *)t3);
    t24 = (t23 == (unsigned char)2);
    if (t24 != 0)
        goto LAB7;

LAB9:    t2 = (t0 + 1152U);
    t23 = ieee_p_2592010699_sub_1744673427_503743352(IEEE_P_2592010699, t2, 0U, 0U);
    if (t23 != 0)
        goto LAB10;

LAB11:
LAB8:    t2 = (t0 + 3672);
    *((int *)t2) = 1;

LAB1:    return;
LAB3:    xsi_set_current_line(34, ng0);
    t7 = (t0 + 5954);
    t8 = (4 - 1);
    t9 = (0 - t8);
    t10 = (t9 * -1);
    t10 = (t10 + 1);
    t11 = ieee_p_1242562249_sub_180853171_1035706684(IEEE_P_1242562249, t6, *((int *)t7), ((t10)));
    t12 = (t0 + 5954);
    t13 = *((int *)t12);
    t14 = (t13 - 0);
    t15 = (t14 * 1);
    t16 = (4U * t15);
    t17 = (0U + t16);
    t18 = (t0 + 3752);
    t19 = (t18 + 56U);
    t20 = *((char **)t19);
    t21 = (t20 + 56U);
    t22 = *((char **)t21);
    memcpy(t22, t11, 4U);
    xsi_driver_first_trans_delta(t18, t17, 4U, 0LL);

LAB4:    t2 = (t0 + 5954);
    t4 = *((int *)t2);
    t3 = (t0 + 5958);
    t5 = *((int *)t3);
    if (t4 == t5)
        goto LAB5;

LAB6:    t1 = (t4 + 1);
    t4 = t1;
    t7 = (t0 + 5954);
    *((int *)t7) = t4;
    goto LAB2;

LAB7:    xsi_set_current_line(39, ng0);
    t2 = (t0 + 5962);
    t11 = (t0 + 3816);
    t12 = (t11 + 56U);
    t18 = *((char **)t12);
    t19 = (t18 + 56U);
    t20 = *((char **)t19);
    memcpy(t20, t2, 4U);
    xsi_driver_first_trans_fast_port(t11);
    goto LAB8;

LAB10:    xsi_set_current_line(42, ng0);
    t3 = (t0 + 1032U);
    t7 = *((char **)t3);
    t24 = *((unsigned char *)t7);
    t25 = (t24 == (unsigned char)3);
    if (t25 != 0)
        goto LAB12;

LAB14:
LAB13:    goto LAB8;

LAB12:    xsi_set_current_line(43, ng0);
    t3 = (t0 + 1832U);
    t11 = *((char **)t3);
    t3 = (t0 + 1512U);
    t12 = *((char **)t3);
    t3 = (t0 + 5832U);
    t1 = ieee_p_1242562249_sub_1657552908_1035706684(IEEE_P_1242562249, t12, t3);
    t4 = (t1 - 0);
    t10 = (t4 * 1);
    xsi_vhdl_check_range_of_index(0, 7, 1, t1);
    t15 = (4U * t10);
    t16 = (0 + t15);
    t18 = (t11 + t16);
    t19 = (t0 + 3816);
    t20 = (t19 + 56U);
    t21 = *((char **)t20);
    t22 = (t21 + 56U);
    t26 = *((char **)t22);
    memcpy(t26, t18, 4U);
    xsi_driver_first_trans_fast_port(t19);
    goto LAB13;

}


extern void work_a_0497463680_1446275585_init()
{
	static char *pe[] = {(void *)work_a_0497463680_1446275585_p_0};
	xsi_register_didat("work_a_0497463680_1446275585", "isim/TB_ROM_isim_beh.exe.sim/work/a_0497463680_1446275585.didat");
	xsi_register_executes(pe);
}
