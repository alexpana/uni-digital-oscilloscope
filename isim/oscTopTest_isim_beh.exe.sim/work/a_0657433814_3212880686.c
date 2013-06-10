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

/* This file is designed for use with ISim build 0x8ef4fb42 */

#define XSI_HIDE_SYMBOL_SPEC true
#include "xsi.h"
#include <memory.h>
#ifdef __GNUC__
#include <stdlib.h>
#else
#include <malloc.h>
#define alloca _alloca
#endif
static const char *ng0 = "E:/SEM2/SSC/project-repo/uni-digital-oscilloscope/vga_ctrl.vhd";
extern char *IEEE_P_2592010699;
extern char *IEEE_P_3620187407;

unsigned char ieee_p_2592010699_sub_1690584930_503743352(char *, unsigned char );
unsigned char ieee_p_2592010699_sub_1744673427_503743352(char *, char *, unsigned int , unsigned int );
unsigned char ieee_p_3620187407_sub_2546382208_3965413181(char *, char *, char *, int );
unsigned char ieee_p_3620187407_sub_2546418145_3965413181(char *, char *, char *, int );
unsigned char ieee_p_3620187407_sub_3908131327_3965413181(char *, char *, char *, int );
char *ieee_p_3620187407_sub_436279890_3965413181(char *, char *, char *, char *, int );


static void work_a_0657433814_3212880686_p_0(char *t0)
{
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    char *t5;
    char *t6;
    char *t7;

LAB0:    xsi_set_current_line(31, ng0);

LAB3:    t1 = (t0 + 1236U);
    t2 = *((char **)t1);
    t1 = (t0 + 2836);
    t3 = (t1 + 32U);
    t4 = *((char **)t3);
    t5 = (t4 + 40U);
    t6 = *((char **)t5);
    memcpy(t6, t2, 10U);
    xsi_driver_first_trans_fast_port(t1);

LAB2:    t7 = (t0 + 2760);
    *((int *)t7) = 1;

LAB1:    return;
LAB4:    goto LAB2;

}

static void work_a_0657433814_3212880686_p_1(char *t0)
{
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    char *t5;
    char *t6;
    char *t7;

LAB0:    xsi_set_current_line(32, ng0);

LAB3:    t1 = (t0 + 1328U);
    t2 = *((char **)t1);
    t1 = (t0 + 2872);
    t3 = (t1 + 32U);
    t4 = *((char **)t3);
    t5 = (t4 + 40U);
    t6 = *((char **)t5);
    memcpy(t6, t2, 10U);
    xsi_driver_first_trans_fast_port(t1);

LAB2:    t7 = (t0 + 2768);
    *((int *)t7) = 1;

LAB1:    return;
LAB4:    goto LAB2;

}

static void work_a_0657433814_3212880686_p_2(char *t0)
{
    char t16[16];
    char *t1;
    unsigned char t2;
    char *t3;
    char *t4;
    unsigned char t5;
    unsigned char t6;
    char *t7;
    unsigned char t8;
    char *t9;
    char *t10;
    char *t11;
    char *t12;
    char *t13;
    char *t14;
    char *t15;
    unsigned int t17;
    unsigned int t18;

LAB0:    xsi_set_current_line(37, ng0);
    t1 = (t0 + 568U);
    t2 = ieee_p_2592010699_sub_1744673427_503743352(IEEE_P_2592010699, t1, 0U, 0U);
    if (t2 != 0)
        goto LAB2;

LAB4:
LAB3:    t1 = (t0 + 2776);
    *((int *)t1) = 1;

LAB1:    return;
LAB2:    xsi_set_current_line(39, ng0);
    t3 = (t0 + 1144U);
    t4 = *((char **)t3);
    t5 = *((unsigned char *)t4);
    t6 = (t5 == (unsigned char)3);
    if (t6 != 0)
        goto LAB5;

LAB7:
LAB6:    xsi_set_current_line(55, ng0);
    t1 = (t0 + 1144U);
    t3 = *((char **)t1);
    t2 = *((unsigned char *)t3);
    t5 = ieee_p_2592010699_sub_1690584930_503743352(IEEE_P_2592010699, t2);
    t1 = (t0 + 2980);
    t4 = (t1 + 32U);
    t7 = *((char **)t4);
    t9 = (t7 + 40U);
    t10 = *((char **)t9);
    *((unsigned char *)t10) = t5;
    xsi_driver_first_trans_fast(t1);
    goto LAB3;

LAB5:    xsi_set_current_line(42, ng0);
    t3 = (t0 + 1236U);
    t7 = *((char **)t3);
    t3 = (t0 + 5096U);
    t8 = ieee_p_3620187407_sub_2546418145_3965413181(IEEE_P_3620187407, t7, t3, 799);
    if (t8 != 0)
        goto LAB8;

LAB10:    xsi_set_current_line(51, ng0);
    t1 = (t0 + 1236U);
    t3 = *((char **)t1);
    t1 = (t0 + 5096U);
    t4 = ieee_p_3620187407_sub_436279890_3965413181(IEEE_P_3620187407, t16, t3, t1, 1);
    t7 = (t16 + 12U);
    t17 = *((unsigned int *)t7);
    t18 = (1U * t17);
    t2 = (10U != t18);
    if (t2 == 1)
        goto LAB16;

LAB17:    t9 = (t0 + 2908);
    t10 = (t9 + 32U);
    t11 = *((char **)t10);
    t12 = (t11 + 40U);
    t13 = *((char **)t12);
    memcpy(t13, t4, 10U);
    xsi_driver_first_trans_fast(t9);

LAB9:    goto LAB6;

LAB8:    xsi_set_current_line(43, ng0);
    t9 = xsi_get_transient_memory(10U);
    memset(t9, 0, 10U);
    t10 = t9;
    memset(t10, (unsigned char)2, 10U);
    t11 = (t0 + 2908);
    t12 = (t11 + 32U);
    t13 = *((char **)t12);
    t14 = (t13 + 40U);
    t15 = *((char **)t14);
    memcpy(t15, t9, 10U);
    xsi_driver_first_trans_fast(t11);
    xsi_set_current_line(45, ng0);
    t1 = (t0 + 1328U);
    t3 = *((char **)t1);
    t1 = (t0 + 5112U);
    t2 = ieee_p_3620187407_sub_2546418145_3965413181(IEEE_P_3620187407, t3, t1, 524);
    if (t2 != 0)
        goto LAB11;

LAB13:    xsi_set_current_line(48, ng0);
    t1 = (t0 + 1328U);
    t3 = *((char **)t1);
    t1 = (t0 + 5112U);
    t4 = ieee_p_3620187407_sub_436279890_3965413181(IEEE_P_3620187407, t16, t3, t1, 1);
    t7 = (t16 + 12U);
    t17 = *((unsigned int *)t7);
    t18 = (1U * t17);
    t2 = (10U != t18);
    if (t2 == 1)
        goto LAB14;

LAB15:    t9 = (t0 + 2944);
    t10 = (t9 + 32U);
    t11 = *((char **)t10);
    t12 = (t11 + 40U);
    t13 = *((char **)t12);
    memcpy(t13, t4, 10U);
    xsi_driver_first_trans_fast(t9);

LAB12:    goto LAB9;

LAB11:    xsi_set_current_line(46, ng0);
    t4 = xsi_get_transient_memory(10U);
    memset(t4, 0, 10U);
    t7 = t4;
    memset(t7, (unsigned char)2, 10U);
    t9 = (t0 + 2944);
    t10 = (t9 + 32U);
    t11 = *((char **)t10);
    t12 = (t11 + 40U);
    t13 = *((char **)t12);
    memcpy(t13, t4, 10U);
    xsi_driver_first_trans_fast(t9);
    goto LAB12;

LAB14:    xsi_size_not_matching(10U, t18, 0);
    goto LAB15;

LAB16:    xsi_size_not_matching(10U, t18, 0);
    goto LAB17;

}

static void work_a_0657433814_3212880686_p_3(char *t0)
{
    unsigned char t1;
    char *t2;
    char *t3;
    unsigned char t4;
    char *t5;
    char *t6;
    unsigned char t7;
    char *t8;
    char *t9;
    char *t10;
    char *t11;
    char *t12;

LAB0:    xsi_set_current_line(61, ng0);
    t2 = (t0 + 1328U);
    t3 = *((char **)t2);
    t2 = (t0 + 5112U);
    t4 = ieee_p_3620187407_sub_3908131327_3965413181(IEEE_P_3620187407, t3, t2, 490);
    if (t4 == 1)
        goto LAB5;

LAB6:    t1 = (unsigned char)0;

LAB7:    if (t1 != 0)
        goto LAB2;

LAB4:    xsi_set_current_line(64, ng0);
    t2 = (t0 + 3016);
    t3 = (t2 + 32U);
    t5 = *((char **)t3);
    t6 = (t5 + 40U);
    t8 = *((char **)t6);
    *((unsigned char *)t8) = (unsigned char)3;
    xsi_driver_first_trans_fast_port(t2);

LAB3:    xsi_set_current_line(67, ng0);
    t2 = (t0 + 1236U);
    t3 = *((char **)t2);
    t2 = (t0 + 5096U);
    t4 = ieee_p_3620187407_sub_3908131327_3965413181(IEEE_P_3620187407, t3, t2, 656);
    if (t4 == 1)
        goto LAB11;

LAB12:    t1 = (unsigned char)0;

LAB13:    if (t1 != 0)
        goto LAB8;

LAB10:    xsi_set_current_line(70, ng0);
    t2 = (t0 + 3052);
    t3 = (t2 + 32U);
    t5 = *((char **)t3);
    t6 = (t5 + 40U);
    t8 = *((char **)t6);
    *((unsigned char *)t8) = (unsigned char)3;
    xsi_driver_first_trans_fast_port(t2);

LAB9:    t2 = (t0 + 2784);
    *((int *)t2) = 1;

LAB1:    return;
LAB2:    xsi_set_current_line(62, ng0);
    t8 = (t0 + 3016);
    t9 = (t8 + 32U);
    t10 = *((char **)t9);
    t11 = (t10 + 40U);
    t12 = *((char **)t11);
    *((unsigned char *)t12) = (unsigned char)2;
    xsi_driver_first_trans_fast_port(t8);
    goto LAB3;

LAB5:    t5 = (t0 + 1328U);
    t6 = *((char **)t5);
    t5 = (t0 + 5112U);
    t7 = ieee_p_3620187407_sub_2546382208_3965413181(IEEE_P_3620187407, t6, t5, 492);
    t1 = t7;
    goto LAB7;

LAB8:    xsi_set_current_line(68, ng0);
    t8 = (t0 + 3052);
    t9 = (t8 + 32U);
    t10 = *((char **)t9);
    t11 = (t10 + 40U);
    t12 = *((char **)t11);
    *((unsigned char *)t12) = (unsigned char)2;
    xsi_driver_first_trans_fast_port(t8);
    goto LAB9;

LAB11:    t5 = (t0 + 1236U);
    t6 = *((char **)t5);
    t5 = (t0 + 5096U);
    t7 = ieee_p_3620187407_sub_2546382208_3965413181(IEEE_P_3620187407, t6, t5, 752);
    t1 = t7;
    goto LAB13;

}

static void work_a_0657433814_3212880686_p_4(char *t0)
{
    unsigned char t1;
    char *t2;
    char *t3;
    unsigned char t4;
    char *t5;
    char *t6;
    unsigned char t7;
    char *t8;
    char *t9;
    char *t10;
    char *t11;
    char *t12;

LAB0:    xsi_set_current_line(76, ng0);
    t2 = (t0 + 1236U);
    t3 = *((char **)t2);
    t2 = (t0 + 5096U);
    t4 = ieee_p_3620187407_sub_2546382208_3965413181(IEEE_P_3620187407, t3, t2, 640);
    if (t4 == 1)
        goto LAB5;

LAB6:    t1 = (unsigned char)0;

LAB7:    if (t1 != 0)
        goto LAB2;

LAB4:    xsi_set_current_line(79, ng0);
    t2 = (t0 + 3088);
    t3 = (t2 + 32U);
    t5 = *((char **)t3);
    t6 = (t5 + 40U);
    t8 = *((char **)t6);
    *((unsigned char *)t8) = (unsigned char)2;
    xsi_driver_first_trans_fast_port(t2);

LAB3:    t2 = (t0 + 2792);
    *((int *)t2) = 1;

LAB1:    return;
LAB2:    xsi_set_current_line(77, ng0);
    t8 = (t0 + 3088);
    t9 = (t8 + 32U);
    t10 = *((char **)t9);
    t11 = (t10 + 40U);
    t12 = *((char **)t11);
    *((unsigned char *)t12) = (unsigned char)3;
    xsi_driver_first_trans_fast_port(t8);
    goto LAB3;

LAB5:    t5 = (t0 + 1328U);
    t6 = *((char **)t5);
    t5 = (t0 + 5112U);
    t7 = ieee_p_3620187407_sub_2546382208_3965413181(IEEE_P_3620187407, t6, t5, 480);
    t1 = t7;
    goto LAB7;

}


extern void work_a_0657433814_3212880686_init()
{
	static char *pe[] = {(void *)work_a_0657433814_3212880686_p_0,(void *)work_a_0657433814_3212880686_p_1,(void *)work_a_0657433814_3212880686_p_2,(void *)work_a_0657433814_3212880686_p_3,(void *)work_a_0657433814_3212880686_p_4};
	xsi_register_didat("work_a_0657433814_3212880686", "isim/oscTopTest_isim_beh.exe.sim/work/a_0657433814_3212880686.didat");
	xsi_register_executes(pe);
}
