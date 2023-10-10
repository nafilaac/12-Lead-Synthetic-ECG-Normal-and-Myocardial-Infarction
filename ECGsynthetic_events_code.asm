_step1:
;step1.h,1 :: 		void step1()
SUB	SP, SP, #20
STR	LR, [SP, #0]
;step1.h,3 :: 		float f1 = 0.1;
; f1 start address is: 36 (R9)
MOVW	R0, #52429
MOVT	R0, #15820
VMOV	S9, R0
;step1.h,4 :: 		float f2 = 0.25;
; f2 start address is: 32 (R8)
VMOV.F32	S8, #0.25
;step1.h,5 :: 		float c1 = 0.01;
; c1 start address is: 28 (R7)
MOVW	R0, #55050
MOVT	R0, #15395
VMOV	S7, R0
;step1.h,6 :: 		float c2 = 0.01;
; c2 start address is: 24 (R6)
MOVW	R0, #55050
MOVT	R0, #15395
VMOV	S6, R0
;step1.h,7 :: 		float tau1 = 0.06;
; tau1 start address is: 20 (R5)
MOVW	R0, #49807
MOVT	R0, #15733
VMOV	S5, R0
;step1.h,8 :: 		float tau2 = 0.0848;
; tau2 start address is: 16 (R4)
MOVW	R0, #43935
MOVT	R0, #15789
VMOV	S4, R0
;step1.h,9 :: 		int scale = 1;
; scale start address is: 20 (R5)
MOVW	R5, #1
SXTH	R5, R5
;step1.h,10 :: 		int jumlahData = 256;
;step1.h,11 :: 		int n, k = 0;
;step1.h,14 :: 		for (n = 0; n < 256; n++)
; n start address is: 0 (R0)
MOVS	R0, #0
SXTH	R0, R0
; scale end address is: 20 (R5)
; tau2 end address is: 16 (R4)
; tau1 end address is: 20 (R5)
; c2 end address is: 24 (R6)
; c1 end address is: 28 (R7)
; f2 end address is: 32 (R8)
; f1 end address is: 36 (R9)
; n end address is: 0 (R0)
STRH	R5, [SP, #4]
SXTH	R6, R0
LDRSH	R5, [SP, #4]
L_step10:
; n start address is: 24 (R6)
; scale start address is: 20 (R5)
; tau2 start address is: 16 (R4)
; tau1 start address is: 20 (R5)
; c2 start address is: 24 (R6)
; c1 start address is: 28 (R7)
; f2 start address is: 32 (R8)
; f1 start address is: 36 (R9)
CMP	R6, #256
IT	GE
BGE	L_step11
;step1.h,16 :: 		f = (float)n / 255.0;
VMOV	S1, R6
VCVT.F32	#1, S1, S1
MOVW	R0, #0
MOVT	R0, #17279
VMOV	S0, R0
VDIV.F32	S0, S1, S0
MOVW	R0, #lo_addr(_f+0)
MOVT	R0, #hi_addr(_f+0)
VSTR	#1, S0, [R0, #0]
;step1.h,17 :: 		s[n] = (((tau1*tau1) / (sqrt(2 * pi * (c1*c1)))) * exp(-((f - f1)*(f - f1)) / (2 * (c1*c1)))) +
LSLS	R1, R6, #2
MOVW	R0, #lo_addr(_s+0)
MOVT	R0, #hi_addr(_s+0)
ADDS	R0, R0, R1
STR	R0, [SP, #16]
VMUL.F32	S0, S5, S5
VSTR	#1, S0, [SP, #8]
VMUL.F32	S1, S7, S7
MOVW	R0, #4059
MOVT	R0, #16585
VMOV	S0, R0
VMUL.F32	S0, S0, S1
BL	_sqrt+0
VLDR	#1, S1, [SP, #8]
VDIV.F32	S0, S1, S0
VSTR	#1, S0, [SP, #8]
MOVW	R0, #lo_addr(_f+0)
MOVT	R0, #hi_addr(_f+0)
VLDR	#1, S0, [R0, #0]
VSUB.F32	S0, S0, S9
VMUL.F32	S0, S0, S0
VNEG.F32	S2, S0
VMUL.F32	S1, S7, S7
VMOV.F32	S0, #2
VMUL.F32	S0, S0, S1
VDIV.F32	S0, S2, S0
BL	_exp+0
VLDR	#1, S1, [SP, #8]
VMUL.F32	S0, S1, S0
VSTR	#1, S0, [SP, #12]
;step1.h,18 :: 		(((tau2*tau2) / (sqrt(2 * pi * (c2*c2)))) * exp(-((f - f2)*(f - f2)) / (2 * (c2*c2))));
VMUL.F32	S0, S4, S4
VSTR	#1, S0, [SP, #8]
VMUL.F32	S1, S6, S6
MOVW	R0, #4059
MOVT	R0, #16585
VMOV	S0, R0
VMUL.F32	S0, S0, S1
BL	_sqrt+0
VLDR	#1, S1, [SP, #8]
VDIV.F32	S0, S1, S0
VSTR	#1, S0, [SP, #8]
MOVW	R0, #lo_addr(_f+0)
MOVT	R0, #hi_addr(_f+0)
VLDR	#1, S0, [R0, #0]
VSUB.F32	S0, S0, S8
VMUL.F32	S0, S0, S0
VNEG.F32	S2, S0
VMUL.F32	S1, S6, S6
VMOV.F32	S0, #2
VMUL.F32	S0, S0, S1
VDIV.F32	S0, S2, S0
BL	_exp+0
VLDR	#1, S1, [SP, #8]
VMUL.F32	S1, S1, S0
VLDR	#1, S0, [SP, #12]
VADD.F32	S0, S0, S1
LDR	R0, [SP, #16]
VSTR	#1, S0, [R0, #0]
;step1.h,14 :: 		for (n = 0; n < 256; n++)
ADDS	R6, R6, #1
SXTH	R6, R6
;step1.h,19 :: 		}
STRH	R5, [SP, #4]
; n end address is: 24 (R6)
STRH	R6, [SP, #6]
LDRSH	R6, [SP, #6]
LDRSH	R5, [SP, #4]
IT	AL
BAL	L_step10
L_step11:
;step1.h,21 :: 		for (n = 0; n <= 128; n++)
; n start address is: 16 (R4)
MOVS	R4, #0
SXTH	R4, R4
; scale end address is: 20 (R5)
; tau2 end address is: 16 (R4)
; tau1 end address is: 20 (R5)
; c2 end address is: 24 (R6)
; c1 end address is: 28 (R7)
; f2 end address is: 32 (R8)
; f1 end address is: 36 (R9)
; n end address is: 16 (R4)
STRH	R4, [SP, #4]
SXTH	R3, R5
LDRSH	R4, [SP, #4]
L_step13:
; n start address is: 16 (R4)
; f1 start address is: 36 (R9)
; f2 start address is: 32 (R8)
; c1 start address is: 28 (R7)
; c2 start address is: 24 (R6)
; tau1 start address is: 20 (R5)
; tau2 start address is: 16 (R4)
; scale start address is: 12 (R3)
CMP	R4, #128
IT	GT
BGT	L_step14
;step1.h,23 :: 		f = (float)n / 255.0;
VMOV	S1, R4
VCVT.F32	#1, S1, S1
MOVW	R0, #0
MOVT	R0, #17279
VMOV	S0, R0
VDIV.F32	S0, S1, S0
MOVW	R0, #lo_addr(_f+0)
MOVT	R0, #hi_addr(_f+0)
VSTR	#1, S0, [R0, #0]
;step1.h,24 :: 		sm[n] = sqrt(s[n]);
LSLS	R1, R4, #2
MOVW	R0, #lo_addr(_sm+0)
MOVT	R0, #hi_addr(_sm+0)
ADDS	R0, R0, R1
STR	R0, [SP, #8]
MOVW	R0, #lo_addr(_s+0)
MOVT	R0, #hi_addr(_s+0)
ADDS	R0, R0, R1
VLDR	#1, S0, [R0, #0]
BL	_sqrt+0
LDR	R0, [SP, #8]
VSTR	#1, S0, [R0, #0]
;step1.h,21 :: 		for (n = 0; n <= 128; n++)
ADDS	R4, R4, #1
SXTH	R4, R4
;step1.h,25 :: 		}
STRH	R4, [SP, #4]
; n end address is: 16 (R4)
LDRSH	R4, [SP, #4]
IT	AL
BAL	L_step13
L_step14:
;step1.h,27 :: 		for (n = 128; n < 256; n++)
; n start address is: 24 (R6)
MOVS	R6, #128
SXTH	R6, R6
; n end address is: 24 (R6)
; scale end address is: 12 (R3)
STRH	R6, [SP, #4]
SXTH	R5, R3
LDRSH	R6, [SP, #4]
L_step16:
; n start address is: 24 (R6)
; scale start address is: 20 (R5)
; tau2 start address is: 16 (R4)
; tau2 end address is: 16 (R4)
; tau1 start address is: 20 (R5)
; tau1 end address is: 20 (R5)
; c2 start address is: 24 (R6)
; c2 end address is: 24 (R6)
; c1 start address is: 28 (R7)
; c1 end address is: 28 (R7)
; f2 start address is: 32 (R8)
; f2 end address is: 32 (R8)
; f1 start address is: 36 (R9)
; f1 end address is: 36 (R9)
CMP	R6, #256
IT	GE
BGE	L_step17
; tau2 end address is: 16 (R4)
; tau1 end address is: 20 (R5)
; c2 end address is: 24 (R6)
; c1 end address is: 28 (R7)
; f2 end address is: 32 (R8)
; f1 end address is: 36 (R9)
;step1.h,29 :: 		f = (float)n / 255.0;
; f1 start address is: 36 (R9)
; f2 start address is: 32 (R8)
; c1 start address is: 28 (R7)
; c2 start address is: 24 (R6)
; tau1 start address is: 20 (R5)
; tau2 start address is: 16 (R4)
VMOV	S1, R6
VCVT.F32	#1, S1, S1
MOVW	R0, #0
MOVT	R0, #17279
VMOV	S0, R0
VDIV.F32	S1, S1, S0
MOVW	R0, #lo_addr(_f+0)
MOVT	R0, #hi_addr(_f+0)
VSTR	#1, S1, [R0, #0]
;step1.h,30 :: 		fm = 1.0 - f;
VMOV.F32	S0, #1
VSUB.F32	S0, S0, S1
MOVW	R0, #lo_addr(_fm+0)
MOVT	R0, #hi_addr(_fm+0)
VSTR	#1, S0, [R0, #0]
;step1.h,31 :: 		sm[n] = sqrt((((tau1*tau1) / (sqrt(2 * pi * (c1*c1)))) * exp(-((fm - f1)*(fm - f1)) / (2 * (c1*c1)))) +
LSLS	R1, R6, #2
MOVW	R0, #lo_addr(_sm+0)
MOVT	R0, #hi_addr(_sm+0)
ADDS	R0, R0, R1
STR	R0, [SP, #16]
VMUL.F32	S0, S5, S5
VSTR	#1, S0, [SP, #8]
VMUL.F32	S1, S7, S7
MOVW	R0, #4059
MOVT	R0, #16585
VMOV	S0, R0
VMUL.F32	S0, S0, S1
BL	_sqrt+0
VLDR	#1, S1, [SP, #8]
VDIV.F32	S0, S1, S0
VSTR	#1, S0, [SP, #8]
MOVW	R0, #lo_addr(_fm+0)
MOVT	R0, #hi_addr(_fm+0)
VLDR	#1, S0, [R0, #0]
VSUB.F32	S0, S0, S9
VMUL.F32	S0, S0, S0
VNEG.F32	S2, S0
VMUL.F32	S1, S7, S7
VMOV.F32	S0, #2
VMUL.F32	S0, S0, S1
VDIV.F32	S0, S2, S0
BL	_exp+0
VLDR	#1, S1, [SP, #8]
VMUL.F32	S0, S1, S0
VSTR	#1, S0, [SP, #12]
;step1.h,32 :: 		(((tau2*tau2) / (sqrt(2 * pi * (c2*c2)))) * exp(-((fm - f2)*(fm - f2)) / (2 * (c2*c2)))));
VMUL.F32	S0, S4, S4
VSTR	#1, S0, [SP, #8]
VMUL.F32	S1, S6, S6
MOVW	R0, #4059
MOVT	R0, #16585
VMOV	S0, R0
VMUL.F32	S0, S0, S1
BL	_sqrt+0
VLDR	#1, S1, [SP, #8]
VDIV.F32	S0, S1, S0
VSTR	#1, S0, [SP, #8]
MOVW	R0, #lo_addr(_fm+0)
MOVT	R0, #hi_addr(_fm+0)
VLDR	#1, S0, [R0, #0]
VSUB.F32	S0, S0, S8
VMUL.F32	S0, S0, S0
VNEG.F32	S2, S0
VMUL.F32	S1, S6, S6
VMOV.F32	S0, #2
VMUL.F32	S0, S0, S1
VDIV.F32	S0, S2, S0
BL	_exp+0
VLDR	#1, S1, [SP, #8]
VMUL.F32	S1, S1, S0
VLDR	#1, S0, [SP, #12]
VADD.F32	S0, S0, S1
BL	_sqrt+0
LDR	R0, [SP, #16]
VSTR	#1, S0, [R0, #0]
;step1.h,27 :: 		for (n = 128; n < 256; n++)
ADDS	R6, R6, #1
SXTH	R6, R6
;step1.h,33 :: 		}
STRH	R5, [SP, #4]
; tau2 end address is: 16 (R4)
; tau1 end address is: 20 (R5)
; c2 end address is: 24 (R6)
; c1 end address is: 28 (R7)
; f2 end address is: 32 (R8)
; f1 end address is: 36 (R9)
; n end address is: 24 (R6)
STRH	R6, [SP, #6]
LDRSH	R6, [SP, #6]
LDRSH	R5, [SP, #4]
IT	AL
BAL	L_step16
L_step17:
;step1.h,35 :: 		for (n = 0; n < 256; n++)
; n start address is: 12 (R3)
MOVS	R3, #0
SXTH	R3, R3
; scale end address is: 20 (R5)
; n end address is: 12 (R3)
SXTH	R4, R5
L_step19:
; n start address is: 12 (R3)
; scale start address is: 16 (R4)
CMP	R3, #256
IT	GE
BGE	L_step110
;step1.h,37 :: 		real[n] = sm[n] * (cosE3(2 * pi * rand())*0.001);
LSLS	R1, R3, #2
MOVW	R0, #lo_addr(_real+0)
MOVT	R0, #hi_addr(_real+0)
ADDS	R0, R0, R1
STR	R0, [SP, #8]
MOVW	R0, #lo_addr(_sm+0)
MOVT	R0, #hi_addr(_sm+0)
ADDS	R0, R0, R1
VLDR	#1, S0, [R0, #0]
VMOV.F32	S2, S0
BL	_rand+0
VMOV	S1, R0
VCVT.F32	#1, S1, S1
MOVW	R0, #4059
MOVT	R0, #16585
VMOV	S0, R0
VMUL.F32	S0, S0, S1
VCVT	#1, .F32, S0, S0
VMOV	R0, S0
UXTH	R0, R0
BL	_cosE3+0
VMOV	S1, R0
VCVT.F32	#1, S1, S1
MOVW	R0, #4719
MOVT	R0, #14979
VMOV	S0, R0
VMUL.F32	S1, S1, S0
VMOV.F32	S0, S2
VMUL.F32	S0, S0, S1
LDR	R0, [SP, #8]
VSTR	#1, S0, [R0, #0]
;step1.h,38 :: 		im[n] = sm[n] * (sinE3(2 * pi * rand())*0.001);
LSLS	R1, R3, #2
MOVW	R0, #lo_addr(_im+0)
MOVT	R0, #hi_addr(_im+0)
ADDS	R0, R0, R1
STR	R0, [SP, #8]
MOVW	R0, #lo_addr(_sm+0)
MOVT	R0, #hi_addr(_sm+0)
ADDS	R0, R0, R1
VLDR	#1, S0, [R0, #0]
VMOV.F32	S2, S0
BL	_rand+0
VMOV	S1, R0
VCVT.F32	#1, S1, S1
MOVW	R0, #4059
MOVT	R0, #16585
VMOV	S0, R0
VMUL.F32	S0, S0, S1
VCVT	#1, .F32, S0, S0
VMOV	R0, S0
UXTH	R0, R0
BL	_sinE3+0
VMOV	S1, R0
VCVT.F32	#1, S1, S1
MOVW	R0, #4719
MOVT	R0, #14979
VMOV	S0, R0
VMUL.F32	S1, S1, S0
VMOV.F32	S0, S2
VMUL.F32	S0, S0, S1
LDR	R0, [SP, #8]
VSTR	#1, S0, [R0, #0]
;step1.h,35 :: 		for (n = 0; n < 256; n++)
ADDS	R3, R3, #1
SXTH	R3, R3
;step1.h,39 :: 		}
; n end address is: 12 (R3)
IT	AL
BAL	L_step19
L_step110:
;step1.h,42 :: 		for (n = 0; n < 256; n++)
; n start address is: 24 (R6)
MOVS	R6, #0
SXTH	R6, R6
; scale end address is: 16 (R4)
; n end address is: 24 (R6)
L_step112:
; n start address is: 24 (R6)
; scale start address is: 16 (R4)
CMP	R6, #256
IT	GE
BGE	L_step113
;step1.h,44 :: 		idft_re[n] = 0;
LSLS	R1, R6, #2
MOVW	R0, #lo_addr(_idft_re+0)
MOVT	R0, #hi_addr(_idft_re+0)
ADDS	R1, R0, R1
MOV	R0, #0
VMOV	S0, R0
VSTR	#1, S0, [R1, #0]
;step1.h,45 :: 		idft_im[n] = 0;
LSLS	R1, R6, #2
MOVW	R0, #lo_addr(_idft_im+0)
MOVT	R0, #hi_addr(_idft_im+0)
ADDS	R1, R0, R1
MOV	R0, #0
VMOV	S0, R0
VSTR	#1, S0, [R1, #0]
;step1.h,47 :: 		for (k = 0; k < 256; k++)
; k start address is: 20 (R5)
MOVS	R5, #0
SXTH	R5, R5
; scale end address is: 16 (R4)
; k end address is: 20 (R5)
; n end address is: 24 (R6)
L_step115:
; k start address is: 20 (R5)
; scale start address is: 16 (R4)
; n start address is: 24 (R6)
CMP	R5, #256
IT	GE
BGE	L_step116
;step1.h,49 :: 		idft_re[n] = idft_re[n] + ((cos((float)(2.0 * pi * n * k /256.0)))*(real[k])) + ((sin((float)(2.0 * pi * n * k /256.0)))*(im[k]));
LSLS	R1, R6, #2
MOVW	R0, #lo_addr(_idft_re+0)
MOVT	R0, #hi_addr(_idft_re+0)
ADDS	R0, R0, R1
STR	R0, [SP, #12]
VLDR	#1, S0, [R0, #0]
VSTR	#1, S0, [SP, #8]
VMOV	S1, R6
VCVT.F32	#1, S1, S1
MOVW	R0, #4059
MOVT	R0, #16585
VMOV	S0, R0
VMUL.F32	S1, S0, S1
VMOV	S0, R5
VCVT.F32	#1, S0, S0
VMUL.F32	S1, S1, S0
MOV	R0, #1132462080
VMOV	S0, R0
VDIV.F32	S0, S1, S0
VMOV.F32	S0, S0
BL	_cos+0
LSLS	R1, R5, #2
MOVW	R0, #lo_addr(_real+0)
MOVT	R0, #hi_addr(_real+0)
ADDS	R0, R0, R1
VLDR	#1, S1, [R0, #0]
VMUL.F32	S1, S0, S1
VLDR	#1, S0, [SP, #8]
VADD.F32	S0, S0, S1
VSTR	#1, S0, [SP, #8]
VMOV	S1, R6
VCVT.F32	#1, S1, S1
MOVW	R0, #4059
MOVT	R0, #16585
VMOV	S0, R0
VMUL.F32	S1, S0, S1
VMOV	S0, R5
VCVT.F32	#1, S0, S0
VMUL.F32	S1, S1, S0
MOV	R0, #1132462080
VMOV	S0, R0
VDIV.F32	S0, S1, S0
VMOV.F32	S0, S0
BL	_sin+0
LSLS	R1, R5, #2
MOVW	R0, #lo_addr(_im+0)
MOVT	R0, #hi_addr(_im+0)
ADDS	R0, R0, R1
VLDR	#1, S1, [R0, #0]
VMUL.F32	S1, S0, S1
VLDR	#1, S0, [SP, #8]
VADD.F32	S0, S0, S1
LDR	R0, [SP, #12]
VSTR	#1, S0, [R0, #0]
;step1.h,50 :: 		idft_im[n] = idft_im[n] + ((cos(2.0 * pi * n * k /256.0))*(real[k]) + (sin(2.0 * pi * n * k /256.0))*(im[k]));
LSLS	R1, R6, #2
MOVW	R0, #lo_addr(_idft_im+0)
MOVT	R0, #hi_addr(_idft_im+0)
ADDS	R0, R0, R1
STR	R0, [SP, #16]
VLDR	#1, S0, [R0, #0]
VSTR	#1, S0, [SP, #12]
VMOV	S1, R6
VCVT.F32	#1, S1, S1
MOVW	R0, #4059
MOVT	R0, #16585
VMOV	S0, R0
VMUL.F32	S1, S0, S1
VMOV	S0, R5
VCVT.F32	#1, S0, S0
VMUL.F32	S1, S1, S0
MOV	R0, #1132462080
VMOV	S0, R0
VDIV.F32	S0, S1, S0
BL	_cos+0
LSLS	R1, R5, #2
MOVW	R0, #lo_addr(_real+0)
MOVT	R0, #hi_addr(_real+0)
ADDS	R0, R0, R1
VLDR	#1, S1, [R0, #0]
VMUL.F32	S0, S0, S1
VSTR	#1, S0, [SP, #8]
VMOV	S1, R6
VCVT.F32	#1, S1, S1
MOVW	R0, #4059
MOVT	R0, #16585
VMOV	S0, R0
VMUL.F32	S1, S0, S1
VMOV	S0, R5
VCVT.F32	#1, S0, S0
VMUL.F32	S1, S1, S0
MOV	R0, #1132462080
VMOV	S0, R0
VDIV.F32	S0, S1, S0
BL	_sin+0
LSLS	R1, R5, #2
MOVW	R0, #lo_addr(_im+0)
MOVT	R0, #hi_addr(_im+0)
ADDS	R0, R0, R1
VLDR	#1, S1, [R0, #0]
VMUL.F32	S1, S0, S1
VLDR	#1, S0, [SP, #8]
VADD.F32	S1, S0, S1
VLDR	#1, S0, [SP, #12]
VADD.F32	S0, S0, S1
LDR	R0, [SP, #16]
VSTR	#1, S0, [R0, #0]
;step1.h,51 :: 		idft_sig[n] = (idft_re[n] + idft_im[n]) / (float)(256.0);
LSLS	R2, R6, #2
MOVW	R0, #lo_addr(_idft_sig+0)
MOVT	R0, #hi_addr(_idft_sig+0)
ADDS	R1, R0, R2
MOVW	R0, #lo_addr(_idft_re+0)
MOVT	R0, #hi_addr(_idft_re+0)
ADDS	R0, R0, R2
VLDR	#1, S1, [R0, #0]
MOVW	R0, #lo_addr(_idft_im+0)
MOVT	R0, #hi_addr(_idft_im+0)
ADDS	R0, R0, R2
VLDR	#1, S0, [R0, #0]
VADD.F32	S1, S1, S0
MOV	R0, #1132462080
VMOV	S0, R0
VDIV.F32	S0, S1, S0
VSTR	#1, S0, [R1, #0]
;step1.h,47 :: 		for (k = 0; k < 256; k++)
ADDS	R5, R5, #1
SXTH	R5, R5
;step1.h,52 :: 		}
; k end address is: 20 (R5)
IT	AL
BAL	L_step115
L_step116:
;step1.h,42 :: 		for (n = 0; n < 256; n++)
ADDS	R6, R6, #1
SXTH	R6, R6
;step1.h,53 :: 		}
; n end address is: 24 (R6)
IT	AL
BAL	L_step112
L_step113:
;step1.h,55 :: 		for (n = 0; n < 256; n++)
; n start address is: 0 (R0)
MOVS	R0, #0
SXTH	R0, R0
; scale end address is: 16 (R4)
; n end address is: 0 (R0)
SXTH	R3, R4
SXTH	R4, R0
L_step118:
; n start address is: 16 (R4)
; scale start address is: 12 (R3)
; scale start address is: 12 (R3)
; scale end address is: 12 (R3)
CMP	R4, #256
IT	GE
BGE	L_step119
; scale end address is: 12 (R3)
;step1.h,57 :: 		scale_sig[n] = scale * idft_sig[n] + (float)(60.0 / (float)hmean);
; scale start address is: 12 (R3)
LSLS	R1, R4, #2
MOVW	R0, #lo_addr(_scale_sig+0)
MOVT	R0, #hi_addr(_scale_sig+0)
ADDS	R2, R0, R1
MOVW	R0, #lo_addr(_idft_sig+0)
MOVT	R0, #hi_addr(_idft_sig+0)
ADDS	R0, R0, R1
VMOV	S1, R3
VCVT.F32	#1, S1, S1
VLDR	#1, S0, [R0, #0]
VMUL.F32	S2, S1, S0
MOVW	R0, #lo_addr(_hmean+0)
MOVT	R0, #hi_addr(_hmean+0)
VLDR	#1, S1, [R0, #0]
MOVW	R0, #0
MOVT	R0, #17008
VMOV	S0, R0
VDIV.F32	S0, S0, S1
VADD.F32	S0, S2, S0
VSTR	#1, S0, [R2, #0]
;step1.h,55 :: 		for (n = 0; n < 256; n++)
ADDS	R4, R4, #1
SXTH	R4, R4
;step1.h,58 :: 		}
; scale end address is: 12 (R3)
; n end address is: 16 (R4)
IT	AL
BAL	L_step118
L_step119:
;step1.h,61 :: 		}
L_end_step1:
LDR	LR, [SP, #0]
ADD	SP, SP, #20
BX	LR
; end of _step1
_normal1:
;parameter_normal.h,1 :: 		void normal1()
SUB	SP, SP, #8
STR	LR, [SP, #0]
;parameter_normal.h,4 :: 		modFactor = sqrt((float)hmean / 60.0);
MOVW	R0, #lo_addr(_hmean+0)
MOVT	R0, #hi_addr(_hmean+0)
VLDR	#1, S1, [R0, #0]
MOVW	R0, #0
MOVT	R0, #17008
VMOV	S0, R0
VDIV.F32	S0, S1, S0
BL	_sqrt+0
MOVW	R0, #lo_addr(_modFactor+0)
MOVT	R0, #hi_addr(_modFactor+0)
VSTR	#1, S0, [R0, #0]
;parameter_normal.h,6 :: 		ti[1] = -60 * sqrt(modFactor);
VMOV.F32	S0, S0
BL	_sqrt+0
MOVW	R0, #0
MOVT	R0, #49776
VMOV	S1, R0
VMUL.F32	S0, S1, S0
MOVW	R0, #lo_addr(_ti+4)
MOVT	R0, #hi_addr(_ti+4)
VSTR	#1, S0, [R0, #0]
;parameter_normal.h,7 :: 		ai[1] = 0.8 * 18;
MOVW	R0, #26215
MOVT	R0, #16742
VMOV	S0, R0
MOVW	R0, #lo_addr(_ai+4)
MOVT	R0, #hi_addr(_ai+4)
VSTR	#1, S0, [R0, #0]
;parameter_normal.h,8 :: 		bi[1] = 0.2 * modFactor;
MOVW	R1, #lo_addr(_modFactor+0)
MOVT	R1, #hi_addr(_modFactor+0)
VLDR	#1, S1, [R1, #0]
MOVW	R0, #52429
MOVT	R0, #15948
VMOV	S0, R0
VMUL.F32	S0, S0, S1
MOVW	R0, #lo_addr(_bi+4)
MOVT	R0, #hi_addr(_bi+4)
VSTR	#1, S0, [R0, #0]
;parameter_normal.h,9 :: 		ti[2] = -15 * modFactor;
MOV	R0, R1
VLDR	#1, S1, [R0, #0]
VMOV.F32	S0, #-15
VMUL.F32	S0, S0, S1
MOVW	R0, #lo_addr(_ti+8)
MOVT	R0, #hi_addr(_ti+8)
VSTR	#1, S0, [R0, #0]
;parameter_normal.h,10 :: 		ai[2] = -5 * 18;
MOVW	R0, #0
MOVT	R0, #49844
VMOV	S0, R0
MOVW	R0, #lo_addr(_ai+8)
MOVT	R0, #hi_addr(_ai+8)
VSTR	#1, S0, [R0, #0]
;parameter_normal.h,11 :: 		bi[2] = 0.1 * modFactor;
MOV	R0, R1
VLDR	#1, S1, [R0, #0]
MOVW	R0, #52429
MOVT	R0, #15820
VMOV	S0, R0
VMUL.F32	S0, S0, S1
MOVW	R0, #lo_addr(_bi+8)
MOVT	R0, #hi_addr(_bi+8)
VSTR	#1, S0, [R0, #0]
;parameter_normal.h,12 :: 		ti[3] = 0;
MOV	R0, #0
VMOV	S0, R0
MOVW	R0, #lo_addr(_ti+12)
MOVT	R0, #hi_addr(_ti+12)
VSTR	#1, S0, [R0, #0]
;parameter_normal.h,13 :: 		ai[3] = 30 * 18;
MOVW	R0, #0
MOVT	R0, #17415
VMOV	S0, R0
MOVW	R0, #lo_addr(_ai+12)
MOVT	R0, #hi_addr(_ai+12)
VSTR	#1, S0, [R0, #0]
;parameter_normal.h,14 :: 		bi[3] = 0.1 * modFactor;
MOV	R0, R1
VLDR	#1, S1, [R0, #0]
MOVW	R0, #52429
MOVT	R0, #15820
VMOV	S0, R0
VMUL.F32	S0, S0, S1
MOVW	R0, #lo_addr(_bi+12)
MOVT	R0, #hi_addr(_bi+12)
VSTR	#1, S0, [R0, #0]
;parameter_normal.h,15 :: 		ti[4] = 15 * modFactor;
MOV	R0, R1
VLDR	#1, S1, [R0, #0]
VMOV.F32	S0, #15
VMUL.F32	S0, S0, S1
MOVW	R0, #lo_addr(_ti+16)
MOVT	R0, #hi_addr(_ti+16)
VSTR	#1, S0, [R0, #0]
;parameter_normal.h,16 :: 		ai[4] = -7.5 * 18;
MOVW	R0, #0
MOVT	R0, #49927
VMOV	S0, R0
MOVW	R0, #lo_addr(_ai+16)
MOVT	R0, #hi_addr(_ai+16)
VSTR	#1, S0, [R0, #0]
;parameter_normal.h,17 :: 		bi[4] = 0.1 * modFactor;
MOV	R0, R1
VLDR	#1, S1, [R0, #0]
MOVW	R0, #52429
MOVT	R0, #15820
VMOV	S0, R0
VMUL.F32	S0, S0, S1
MOVW	R0, #lo_addr(_bi+16)
MOVT	R0, #hi_addr(_bi+16)
VSTR	#1, S0, [R0, #0]
;parameter_normal.h,18 :: 		ti[5] = 97 * sqrt(modFactor);
MOV	R0, R1
VLDR	#1, S0, [R0, #0]
BL	_sqrt+0
MOVW	R0, #0
MOVT	R0, #17090
VMOV	S1, R0
VMUL.F32	S0, S1, S0
MOVW	R0, #lo_addr(_ti+20)
MOVT	R0, #hi_addr(_ti+20)
VSTR	#1, S0, [R0, #0]
;parameter_normal.h,19 :: 		ai[5] = 0.5 * ((modFactor * modFactor)*sqrt(modFactor)) * 18;
MOVW	R1, #lo_addr(_modFactor+0)
MOVT	R1, #hi_addr(_modFactor+0)
VLDR	#1, S1, [R1, #0]
MOV	R0, R1
VLDR	#1, S0, [R0, #0]
VMUL.F32	S0, S0, S1
VSTR	#1, S0, [SP, #4]
MOV	R0, R1
VLDR	#1, S0, [R0, #0]
BL	_sqrt+0
VLDR	#1, S1, [SP, #4]
VMUL.F32	S1, S1, S0
VMOV.F32	S0, #0.5
VMUL.F32	S1, S0, S1
VMOV.F32	S0, #18
VMUL.F32	S0, S1, S0
MOVW	R0, #lo_addr(_ai+20)
MOVT	R0, #hi_addr(_ai+20)
VSTR	#1, S0, [R0, #0]
;parameter_normal.h,20 :: 		bi[5] = 0.4 / modFactor;
MOVW	R1, #lo_addr(_modFactor+0)
MOVT	R1, #hi_addr(_modFactor+0)
VLDR	#1, S1, [R1, #0]
MOVW	R0, #52429
MOVT	R0, #16076
VMOV	S0, R0
VDIV.F32	S0, S0, S1
MOVW	R0, #lo_addr(_bi+20)
MOVT	R0, #hi_addr(_bi+20)
VSTR	#1, S0, [R0, #0]
;parameter_normal.h,21 :: 		ti[6] = 100 * sqrt(modFactor);
MOV	R0, R1
VLDR	#1, S0, [R0, #0]
BL	_sqrt+0
MOVW	R0, #0
MOVT	R0, #17096
VMOV	S1, R0
VMUL.F32	S0, S1, S0
MOVW	R0, #lo_addr(_ti+24)
MOVT	R0, #hi_addr(_ti+24)
VSTR	#1, S0, [R0, #0]
;parameter_normal.h,22 :: 		ai[6] = 0.75 *((modFactor * modFactor)*sqrt(modFactor)) * 18;
MOVW	R1, #lo_addr(_modFactor+0)
MOVT	R1, #hi_addr(_modFactor+0)
VLDR	#1, S1, [R1, #0]
MOV	R0, R1
VLDR	#1, S0, [R0, #0]
VMUL.F32	S0, S0, S1
VSTR	#1, S0, [SP, #4]
MOV	R0, R1
VLDR	#1, S0, [R0, #0]
BL	_sqrt+0
VLDR	#1, S1, [SP, #4]
VMUL.F32	S1, S1, S0
VMOV.F32	S0, #0.75
VMUL.F32	S1, S0, S1
VMOV.F32	S0, #18
VMUL.F32	S0, S1, S0
MOVW	R0, #lo_addr(_ai+24)
MOVT	R0, #hi_addr(_ai+24)
VSTR	#1, S0, [R0, #0]
;parameter_normal.h,23 :: 		bi[6] = 0.2 * modFactor;
MOVW	R0, #lo_addr(_modFactor+0)
MOVT	R0, #hi_addr(_modFactor+0)
VLDR	#1, S1, [R0, #0]
MOVW	R0, #52429
MOVT	R0, #15948
VMOV	S0, R0
VMUL.F32	S0, S0, S1
MOVW	R0, #lo_addr(_bi+24)
MOVT	R0, #hi_addr(_bi+24)
VSTR	#1, S0, [R0, #0]
;parameter_normal.h,26 :: 		for (i = 1; i <= 6; i++)
; i start address is: 12 (R3)
MOVS	R3, #1
SXTH	R3, R3
; i end address is: 12 (R3)
L_normal121:
; i start address is: 12 (R3)
CMP	R3, #6
IT	GT
BGT	L_normal122
;parameter_normal.h,28 :: 		ti[i] = ti[i] * (pi / 180.0); // konversi ke radian
LSLS	R1, R3, #2
MOVW	R0, #lo_addr(_ti+0)
MOVT	R0, #hi_addr(_ti+0)
ADDS	R2, R0, R1
VLDR	#1, S1, [R2, #0]
MOVW	R0, #64053
MOVT	R0, #15502
VMOV	S0, R0
VMUL.F32	S0, S1, S0
VSTR	#1, S0, [R2, #0]
;parameter_normal.h,26 :: 		for (i = 1; i <= 6; i++)
ADDS	R3, R3, #1
SXTH	R3, R3
;parameter_normal.h,29 :: 		}
; i end address is: 12 (R3)
IT	AL
BAL	L_normal121
L_normal122:
;parameter_normal.h,30 :: 		}
L_end_normal1:
LDR	LR, [SP, #0]
ADD	SP, SP, #8
BX	LR
; end of _normal1
_normal2:
;parameter_normal.h,32 :: 		void normal2()
SUB	SP, SP, #8
STR	LR, [SP, #0]
;parameter_normal.h,35 :: 		modFactor = sqrt((float)hmean / 60.0);
MOVW	R0, #lo_addr(_hmean+0)
MOVT	R0, #hi_addr(_hmean+0)
VLDR	#1, S1, [R0, #0]
MOVW	R0, #0
MOVT	R0, #17008
VMOV	S0, R0
VDIV.F32	S0, S1, S0
BL	_sqrt+0
MOVW	R0, #lo_addr(_modFactor+0)
MOVT	R0, #hi_addr(_modFactor+0)
VSTR	#1, S0, [R0, #0]
;parameter_normal.h,37 :: 		ti[1] = -60 * sqrt(modFactor);
VMOV.F32	S0, S0
BL	_sqrt+0
MOVW	R0, #0
MOVT	R0, #49776
VMOV	S1, R0
VMUL.F32	S0, S1, S0
MOVW	R0, #lo_addr(_ti+4)
MOVT	R0, #hi_addr(_ti+4)
VSTR	#1, S0, [R0, #0]
;parameter_normal.h,38 :: 		ai[1] = 1.2 * 18;
MOVW	R0, #52429
MOVT	R0, #16812
VMOV	S0, R0
MOVW	R0, #lo_addr(_ai+4)
MOVT	R0, #hi_addr(_ai+4)
VSTR	#1, S0, [R0, #0]
;parameter_normal.h,39 :: 		bi[1] = 0.2 * modFactor;
MOVW	R1, #lo_addr(_modFactor+0)
MOVT	R1, #hi_addr(_modFactor+0)
VLDR	#1, S1, [R1, #0]
MOVW	R0, #52429
MOVT	R0, #15948
VMOV	S0, R0
VMUL.F32	S0, S0, S1
MOVW	R0, #lo_addr(_bi+4)
MOVT	R0, #hi_addr(_bi+4)
VSTR	#1, S0, [R0, #0]
;parameter_normal.h,40 :: 		ti[2] = -15 * modFactor;
MOV	R0, R1
VLDR	#1, S1, [R0, #0]
VMOV.F32	S0, #-15
VMUL.F32	S0, S0, S1
MOVW	R0, #lo_addr(_ti+8)
MOVT	R0, #hi_addr(_ti+8)
VSTR	#1, S0, [R0, #0]
;parameter_normal.h,41 :: 		ai[2] = -6 * 18;
MOVW	R0, #0
MOVT	R0, #49880
VMOV	S0, R0
MOVW	R0, #lo_addr(_ai+8)
MOVT	R0, #hi_addr(_ai+8)
VSTR	#1, S0, [R0, #0]
;parameter_normal.h,42 :: 		bi[2] = 0.1 * modFactor;
MOV	R0, R1
VLDR	#1, S1, [R0, #0]
MOVW	R0, #52429
MOVT	R0, #15820
VMOV	S0, R0
VMUL.F32	S0, S0, S1
MOVW	R0, #lo_addr(_bi+8)
MOVT	R0, #hi_addr(_bi+8)
VSTR	#1, S0, [R0, #0]
;parameter_normal.h,43 :: 		ti[3] = 0;
MOV	R0, #0
VMOV	S0, R0
MOVW	R0, #lo_addr(_ti+12)
MOVT	R0, #hi_addr(_ti+12)
VSTR	#1, S0, [R0, #0]
;parameter_normal.h,44 :: 		ai[3] = 52.5 * 18;
MOVW	R0, #16384
MOVT	R0, #17516
VMOV	S0, R0
MOVW	R0, #lo_addr(_ai+12)
MOVT	R0, #hi_addr(_ai+12)
VSTR	#1, S0, [R0, #0]
;parameter_normal.h,45 :: 		bi[3] = 0.1 * modFactor;
MOV	R0, R1
VLDR	#1, S1, [R0, #0]
MOVW	R0, #52429
MOVT	R0, #15820
VMOV	S0, R0
VMUL.F32	S0, S0, S1
MOVW	R0, #lo_addr(_bi+12)
MOVT	R0, #hi_addr(_bi+12)
VSTR	#1, S0, [R0, #0]
;parameter_normal.h,46 :: 		ti[4] = 15 * modFactor;
MOV	R0, R1
VLDR	#1, S1, [R0, #0]
VMOV.F32	S0, #15
VMUL.F32	S0, S0, S1
MOVW	R0, #lo_addr(_ti+16)
MOVT	R0, #hi_addr(_ti+16)
VSTR	#1, S0, [R0, #0]
;parameter_normal.h,47 :: 		ai[4] = 0.5 * 18;
VMOV.F32	S0, #9
MOVW	R0, #lo_addr(_ai+16)
MOVT	R0, #hi_addr(_ai+16)
VSTR	#1, S0, [R0, #0]
;parameter_normal.h,48 :: 		bi[4] = 0.1 * modFactor;
MOV	R0, R1
VLDR	#1, S1, [R0, #0]
MOVW	R0, #52429
MOVT	R0, #15820
VMOV	S0, R0
VMUL.F32	S0, S0, S1
MOVW	R0, #lo_addr(_bi+16)
MOVT	R0, #hi_addr(_bi+16)
VSTR	#1, S0, [R0, #0]
;parameter_normal.h,49 :: 		ti[5] = 97 * sqrt(modFactor);
MOV	R0, R1
VLDR	#1, S0, [R0, #0]
BL	_sqrt+0
MOVW	R0, #0
MOVT	R0, #17090
VMOV	S1, R0
VMUL.F32	S0, S1, S0
MOVW	R0, #lo_addr(_ti+20)
MOVT	R0, #hi_addr(_ti+20)
VSTR	#1, S0, [R0, #0]
;parameter_normal.h,50 :: 		ai[5] = 0.67 * ((modFactor * modFactor)*sqrt(modFactor)) * 18;
MOVW	R1, #lo_addr(_modFactor+0)
MOVT	R1, #hi_addr(_modFactor+0)
VLDR	#1, S1, [R1, #0]
MOV	R0, R1
VLDR	#1, S0, [R0, #0]
VMUL.F32	S0, S0, S1
VSTR	#1, S0, [SP, #4]
MOV	R0, R1
VLDR	#1, S0, [R0, #0]
BL	_sqrt+0
VLDR	#1, S1, [SP, #4]
VMUL.F32	S1, S1, S0
MOVW	R0, #34079
MOVT	R0, #16171
VMOV	S0, R0
VMUL.F32	S1, S0, S1
VMOV.F32	S0, #18
VMUL.F32	S0, S1, S0
MOVW	R0, #lo_addr(_ai+20)
MOVT	R0, #hi_addr(_ai+20)
VSTR	#1, S0, [R0, #0]
;parameter_normal.h,51 :: 		bi[5] = 0.4 / modFactor;
MOVW	R1, #lo_addr(_modFactor+0)
MOVT	R1, #hi_addr(_modFactor+0)
VLDR	#1, S1, [R1, #0]
MOVW	R0, #52429
MOVT	R0, #16076
VMOV	S0, R0
VDIV.F32	S0, S0, S1
MOVW	R0, #lo_addr(_bi+20)
MOVT	R0, #hi_addr(_bi+20)
VSTR	#1, S0, [R0, #0]
;parameter_normal.h,52 :: 		ti[6] = 100 * sqrt(modFactor);
MOV	R0, R1
VLDR	#1, S0, [R0, #0]
BL	_sqrt+0
MOVW	R0, #0
MOVT	R0, #17096
VMOV	S1, R0
VMUL.F32	S0, S1, S0
MOVW	R0, #lo_addr(_ti+24)
MOVT	R0, #hi_addr(_ti+24)
VSTR	#1, S0, [R0, #0]
;parameter_normal.h,53 :: 		ai[6] = 1 *((modFactor * modFactor)*sqrt(modFactor)) * 18;
MOVW	R1, #lo_addr(_modFactor+0)
MOVT	R1, #hi_addr(_modFactor+0)
VLDR	#1, S1, [R1, #0]
MOV	R0, R1
VLDR	#1, S0, [R0, #0]
VMUL.F32	S0, S0, S1
VSTR	#1, S0, [SP, #4]
MOV	R0, R1
VLDR	#1, S0, [R0, #0]
BL	_sqrt+0
VLDR	#1, S1, [SP, #4]
VMUL.F32	S1, S1, S0
VMOV.F32	S0, #18
VMUL.F32	S0, S1, S0
MOVW	R0, #lo_addr(_ai+24)
MOVT	R0, #hi_addr(_ai+24)
VSTR	#1, S0, [R0, #0]
;parameter_normal.h,54 :: 		bi[6] = 0.2 * modFactor;
MOVW	R0, #lo_addr(_modFactor+0)
MOVT	R0, #hi_addr(_modFactor+0)
VLDR	#1, S1, [R0, #0]
MOVW	R0, #52429
MOVT	R0, #15948
VMOV	S0, R0
VMUL.F32	S0, S0, S1
MOVW	R0, #lo_addr(_bi+24)
MOVT	R0, #hi_addr(_bi+24)
VSTR	#1, S0, [R0, #0]
;parameter_normal.h,57 :: 		for (i = 1; i <= 6; i++)
; i start address is: 12 (R3)
MOVS	R3, #1
SXTH	R3, R3
; i end address is: 12 (R3)
L_normal224:
; i start address is: 12 (R3)
CMP	R3, #6
IT	GT
BGT	L_normal225
;parameter_normal.h,59 :: 		ti[i] = ti[i] * (pi / 180.0); // konversi ke radian
LSLS	R1, R3, #2
MOVW	R0, #lo_addr(_ti+0)
MOVT	R0, #hi_addr(_ti+0)
ADDS	R2, R0, R1
VLDR	#1, S1, [R2, #0]
MOVW	R0, #64053
MOVT	R0, #15502
VMOV	S0, R0
VMUL.F32	S0, S1, S0
VSTR	#1, S0, [R2, #0]
;parameter_normal.h,57 :: 		for (i = 1; i <= 6; i++)
ADDS	R3, R3, #1
SXTH	R3, R3
;parameter_normal.h,60 :: 		}
; i end address is: 12 (R3)
IT	AL
BAL	L_normal224
L_normal225:
;parameter_normal.h,61 :: 		}
L_end_normal2:
LDR	LR, [SP, #0]
ADD	SP, SP, #8
BX	LR
; end of _normal2
_normal3:
;parameter_normal.h,63 :: 		void normal3()
SUB	SP, SP, #8
STR	LR, [SP, #0]
;parameter_normal.h,66 :: 		modFactor = sqrt((float)hmean / 60.0);
MOVW	R0, #lo_addr(_hmean+0)
MOVT	R0, #hi_addr(_hmean+0)
VLDR	#1, S1, [R0, #0]
MOVW	R0, #0
MOVT	R0, #17008
VMOV	S0, R0
VDIV.F32	S0, S1, S0
BL	_sqrt+0
MOVW	R0, #lo_addr(_modFactor+0)
MOVT	R0, #hi_addr(_modFactor+0)
VSTR	#1, S0, [R0, #0]
;parameter_normal.h,68 :: 		ti[1] = -60 * sqrt(modFactor);
VMOV.F32	S0, S0
BL	_sqrt+0
MOVW	R0, #0
MOVT	R0, #49776
VMOV	S1, R0
VMUL.F32	S0, S1, S0
MOVW	R0, #lo_addr(_ti+4)
MOVT	R0, #hi_addr(_ti+4)
VSTR	#1, S0, [R0, #0]
;parameter_normal.h,69 :: 		ai[1] = 0.8 * 18;
MOVW	R0, #26215
MOVT	R0, #16742
VMOV	S0, R0
MOVW	R0, #lo_addr(_ai+4)
MOVT	R0, #hi_addr(_ai+4)
VSTR	#1, S0, [R0, #0]
;parameter_normal.h,70 :: 		bi[1] = 0.2 * modFactor;
MOVW	R1, #lo_addr(_modFactor+0)
MOVT	R1, #hi_addr(_modFactor+0)
VLDR	#1, S1, [R1, #0]
MOVW	R0, #52429
MOVT	R0, #15948
VMOV	S0, R0
VMUL.F32	S0, S0, S1
MOVW	R0, #lo_addr(_bi+4)
MOVT	R0, #hi_addr(_bi+4)
VSTR	#1, S0, [R0, #0]
;parameter_normal.h,71 :: 		ti[2] = -15 * modFactor;
MOV	R0, R1
VLDR	#1, S1, [R0, #0]
VMOV.F32	S0, #-15
VMUL.F32	S0, S0, S1
MOVW	R0, #lo_addr(_ti+8)
MOVT	R0, #hi_addr(_ti+8)
VSTR	#1, S0, [R0, #0]
;parameter_normal.h,72 :: 		ai[2] = -6 * 18;
MOVW	R0, #0
MOVT	R0, #49880
VMOV	S0, R0
MOVW	R0, #lo_addr(_ai+8)
MOVT	R0, #hi_addr(_ai+8)
VSTR	#1, S0, [R0, #0]
;parameter_normal.h,73 :: 		bi[2] = 0.1 * modFactor;
MOV	R0, R1
VLDR	#1, S1, [R0, #0]
MOVW	R0, #52429
MOVT	R0, #15820
VMOV	S0, R0
VMUL.F32	S0, S0, S1
MOVW	R0, #lo_addr(_bi+8)
MOVT	R0, #hi_addr(_bi+8)
VSTR	#1, S0, [R0, #0]
;parameter_normal.h,74 :: 		ti[3] = 0;
MOV	R0, #0
VMOV	S0, R0
MOVW	R0, #lo_addr(_ti+12)
MOVT	R0, #hi_addr(_ti+12)
VSTR	#1, S0, [R0, #0]
;parameter_normal.h,75 :: 		ai[3] = 33.75 * 18;
MOVW	R0, #57344
MOVT	R0, #17431
VMOV	S0, R0
MOVW	R0, #lo_addr(_ai+12)
MOVT	R0, #hi_addr(_ai+12)
VSTR	#1, S0, [R0, #0]
;parameter_normal.h,76 :: 		bi[3] = 0.1 * modFactor;
MOV	R0, R1
VLDR	#1, S1, [R0, #0]
MOVW	R0, #52429
MOVT	R0, #15820
VMOV	S0, R0
VMUL.F32	S0, S0, S1
MOVW	R0, #lo_addr(_bi+12)
MOVT	R0, #hi_addr(_bi+12)
VSTR	#1, S0, [R0, #0]
;parameter_normal.h,77 :: 		ti[4] = 15 * modFactor;
MOV	R0, R1
VLDR	#1, S1, [R0, #0]
VMOV.F32	S0, #15
VMUL.F32	S0, S0, S1
MOVW	R0, #lo_addr(_ti+16)
MOVT	R0, #hi_addr(_ti+16)
VSTR	#1, S0, [R0, #0]
;parameter_normal.h,78 :: 		ai[4] = 0.5 * 18;
VMOV.F32	S0, #9
MOVW	R0, #lo_addr(_ai+16)
MOVT	R0, #hi_addr(_ai+16)
VSTR	#1, S0, [R0, #0]
;parameter_normal.h,79 :: 		bi[4] = 0.1 * modFactor;
MOV	R0, R1
VLDR	#1, S1, [R0, #0]
MOVW	R0, #52429
MOVT	R0, #15820
VMOV	S0, R0
VMUL.F32	S0, S0, S1
MOVW	R0, #lo_addr(_bi+16)
MOVT	R0, #hi_addr(_bi+16)
VSTR	#1, S0, [R0, #0]
;parameter_normal.h,80 :: 		ti[5] = 97 * sqrt(modFactor);
MOV	R0, R1
VLDR	#1, S0, [R0, #0]
BL	_sqrt+0
MOVW	R0, #0
MOVT	R0, #17090
VMOV	S1, R0
VMUL.F32	S0, S1, S0
MOVW	R0, #lo_addr(_ti+20)
MOVT	R0, #hi_addr(_ti+20)
VSTR	#1, S0, [R0, #0]
;parameter_normal.h,81 :: 		ai[5] = 0.3 * ((modFactor * modFactor)*sqrt(modFactor)) * 18;
MOVW	R1, #lo_addr(_modFactor+0)
MOVT	R1, #hi_addr(_modFactor+0)
VLDR	#1, S1, [R1, #0]
MOV	R0, R1
VLDR	#1, S0, [R0, #0]
VMUL.F32	S0, S0, S1
VSTR	#1, S0, [SP, #4]
MOV	R0, R1
VLDR	#1, S0, [R0, #0]
BL	_sqrt+0
VLDR	#1, S1, [SP, #4]
VMUL.F32	S1, S1, S0
MOVW	R0, #39322
MOVT	R0, #16025
VMOV	S0, R0
VMUL.F32	S1, S0, S1
VMOV.F32	S0, #18
VMUL.F32	S0, S1, S0
MOVW	R0, #lo_addr(_ai+20)
MOVT	R0, #hi_addr(_ai+20)
VSTR	#1, S0, [R0, #0]
;parameter_normal.h,82 :: 		bi[5] = 0.4 / modFactor;
MOVW	R1, #lo_addr(_modFactor+0)
MOVT	R1, #hi_addr(_modFactor+0)
VLDR	#1, S1, [R1, #0]
MOVW	R0, #52429
MOVT	R0, #16076
VMOV	S0, R0
VDIV.F32	S0, S0, S1
MOVW	R0, #lo_addr(_bi+20)
MOVT	R0, #hi_addr(_bi+20)
VSTR	#1, S0, [R0, #0]
;parameter_normal.h,83 :: 		ti[6] = 100 * sqrt(modFactor);
MOV	R0, R1
VLDR	#1, S0, [R0, #0]
BL	_sqrt+0
MOVW	R0, #0
MOVT	R0, #17096
VMOV	S1, R0
VMUL.F32	S0, S1, S0
MOVW	R0, #lo_addr(_ti+24)
MOVT	R0, #hi_addr(_ti+24)
VSTR	#1, S0, [R0, #0]
;parameter_normal.h,84 :: 		ai[6] = 0.5 *((modFactor * modFactor)*sqrt(modFactor)) * 18;
MOVW	R1, #lo_addr(_modFactor+0)
MOVT	R1, #hi_addr(_modFactor+0)
VLDR	#1, S1, [R1, #0]
MOV	R0, R1
VLDR	#1, S0, [R0, #0]
VMUL.F32	S0, S0, S1
VSTR	#1, S0, [SP, #4]
MOV	R0, R1
VLDR	#1, S0, [R0, #0]
BL	_sqrt+0
VLDR	#1, S1, [SP, #4]
VMUL.F32	S1, S1, S0
VMOV.F32	S0, #0.5
VMUL.F32	S1, S0, S1
VMOV.F32	S0, #18
VMUL.F32	S0, S1, S0
MOVW	R0, #lo_addr(_ai+24)
MOVT	R0, #hi_addr(_ai+24)
VSTR	#1, S0, [R0, #0]
;parameter_normal.h,85 :: 		bi[6] = 0.2 * modFactor;
MOVW	R0, #lo_addr(_modFactor+0)
MOVT	R0, #hi_addr(_modFactor+0)
VLDR	#1, S1, [R0, #0]
MOVW	R0, #52429
MOVT	R0, #15948
VMOV	S0, R0
VMUL.F32	S0, S0, S1
MOVW	R0, #lo_addr(_bi+24)
MOVT	R0, #hi_addr(_bi+24)
VSTR	#1, S0, [R0, #0]
;parameter_normal.h,88 :: 		for (i = 1; i <= 6; i++)
; i start address is: 12 (R3)
MOVS	R3, #1
SXTH	R3, R3
; i end address is: 12 (R3)
L_normal327:
; i start address is: 12 (R3)
CMP	R3, #6
IT	GT
BGT	L_normal328
;parameter_normal.h,90 :: 		ti[i] = ti[i] * (pi / 180.0); // konversi ke radian
LSLS	R1, R3, #2
MOVW	R0, #lo_addr(_ti+0)
MOVT	R0, #hi_addr(_ti+0)
ADDS	R2, R0, R1
VLDR	#1, S1, [R2, #0]
MOVW	R0, #64053
MOVT	R0, #15502
VMOV	S0, R0
VMUL.F32	S0, S1, S0
VSTR	#1, S0, [R2, #0]
;parameter_normal.h,88 :: 		for (i = 1; i <= 6; i++)
ADDS	R3, R3, #1
SXTH	R3, R3
;parameter_normal.h,91 :: 		}
; i end address is: 12 (R3)
IT	AL
BAL	L_normal327
L_normal328:
;parameter_normal.h,92 :: 		}
L_end_normal3:
LDR	LR, [SP, #0]
ADD	SP, SP, #8
BX	LR
; end of _normal3
_normalaVR:
;parameter_normal.h,94 :: 		void normalaVR()
SUB	SP, SP, #8
STR	LR, [SP, #0]
;parameter_normal.h,97 :: 		modFactor = sqrt((float)hmean / 60.0);
MOVW	R0, #lo_addr(_hmean+0)
MOVT	R0, #hi_addr(_hmean+0)
VLDR	#1, S1, [R0, #0]
MOVW	R0, #0
MOVT	R0, #17008
VMOV	S0, R0
VDIV.F32	S0, S1, S0
BL	_sqrt+0
MOVW	R0, #lo_addr(_modFactor+0)
MOVT	R0, #hi_addr(_modFactor+0)
VSTR	#1, S0, [R0, #0]
;parameter_normal.h,99 :: 		ti[1] = -60 * sqrt(modFactor);
VMOV.F32	S0, S0
BL	_sqrt+0
MOVW	R0, #0
MOVT	R0, #49776
VMOV	S1, R0
VMUL.F32	S0, S1, S0
MOVW	R0, #lo_addr(_ti+4)
MOVT	R0, #hi_addr(_ti+4)
VSTR	#1, S0, [R0, #0]
;parameter_normal.h,100 :: 		ai[1] = -0.8 * 18;
MOVW	R0, #26215
MOVT	R0, #49510
VMOV	S0, R0
MOVW	R0, #lo_addr(_ai+4)
MOVT	R0, #hi_addr(_ai+4)
VSTR	#1, S0, [R0, #0]
;parameter_normal.h,101 :: 		bi[1] = 0.2 * modFactor;
MOVW	R1, #lo_addr(_modFactor+0)
MOVT	R1, #hi_addr(_modFactor+0)
VLDR	#1, S1, [R1, #0]
MOVW	R0, #52429
MOVT	R0, #15948
VMOV	S0, R0
VMUL.F32	S0, S0, S1
MOVW	R0, #lo_addr(_bi+4)
MOVT	R0, #hi_addr(_bi+4)
VSTR	#1, S0, [R0, #0]
;parameter_normal.h,102 :: 		ti[2] = -15 * modFactor;
MOV	R0, R1
VLDR	#1, S1, [R0, #0]
VMOV.F32	S0, #-15
VMUL.F32	S0, S0, S1
MOVW	R0, #lo_addr(_ti+8)
MOVT	R0, #hi_addr(_ti+8)
VSTR	#1, S0, [R0, #0]
;parameter_normal.h,103 :: 		ai[2] = 5 * 18;
MOVW	R0, #0
MOVT	R0, #17076
VMOV	S0, R0
MOVW	R0, #lo_addr(_ai+8)
MOVT	R0, #hi_addr(_ai+8)
VSTR	#1, S0, [R0, #0]
;parameter_normal.h,104 :: 		bi[2] = 0.1 * modFactor;
MOV	R0, R1
VLDR	#1, S1, [R0, #0]
MOVW	R0, #52429
MOVT	R0, #15820
VMOV	S0, R0
VMUL.F32	S0, S0, S1
MOVW	R0, #lo_addr(_bi+8)
MOVT	R0, #hi_addr(_bi+8)
VSTR	#1, S0, [R0, #0]
;parameter_normal.h,105 :: 		ti[3] = 0;
MOV	R0, #0
VMOV	S0, R0
MOVW	R0, #lo_addr(_ti+12)
MOVT	R0, #hi_addr(_ti+12)
VSTR	#1, S0, [R0, #0]
;parameter_normal.h,106 :: 		ai[3] = -30 * 18;
MOVW	R0, #0
MOVT	R0, #50183
VMOV	S0, R0
MOVW	R0, #lo_addr(_ai+12)
MOVT	R0, #hi_addr(_ai+12)
VSTR	#1, S0, [R0, #0]
;parameter_normal.h,107 :: 		bi[3] = 0.1 * modFactor;
MOV	R0, R1
VLDR	#1, S1, [R0, #0]
MOVW	R0, #52429
MOVT	R0, #15820
VMOV	S0, R0
VMUL.F32	S0, S0, S1
MOVW	R0, #lo_addr(_bi+12)
MOVT	R0, #hi_addr(_bi+12)
VSTR	#1, S0, [R0, #0]
;parameter_normal.h,108 :: 		ti[4] = 15 * modFactor;
MOV	R0, R1
VLDR	#1, S1, [R0, #0]
VMOV.F32	S0, #15
VMUL.F32	S0, S0, S1
MOVW	R0, #lo_addr(_ti+16)
MOVT	R0, #hi_addr(_ti+16)
VSTR	#1, S0, [R0, #0]
;parameter_normal.h,109 :: 		ai[4] = -0.5 * 18;
VMOV.F32	S0, #-9
MOVW	R0, #lo_addr(_ai+16)
MOVT	R0, #hi_addr(_ai+16)
VSTR	#1, S0, [R0, #0]
;parameter_normal.h,110 :: 		bi[4] = 0.1 * modFactor;
MOV	R0, R1
VLDR	#1, S1, [R0, #0]
MOVW	R0, #52429
MOVT	R0, #15820
VMOV	S0, R0
VMUL.F32	S0, S0, S1
MOVW	R0, #lo_addr(_bi+16)
MOVT	R0, #hi_addr(_bi+16)
VSTR	#1, S0, [R0, #0]
;parameter_normal.h,111 :: 		ti[5] = 97 * sqrt(modFactor);
MOV	R0, R1
VLDR	#1, S0, [R0, #0]
BL	_sqrt+0
MOVW	R0, #0
MOVT	R0, #17090
VMOV	S1, R0
VMUL.F32	S0, S1, S0
MOVW	R0, #lo_addr(_ti+20)
MOVT	R0, #hi_addr(_ti+20)
VSTR	#1, S0, [R0, #0]
;parameter_normal.h,112 :: 		ai[5] = -0.5 * ((modFactor * modFactor)*sqrt(modFactor)) * 18;
MOVW	R1, #lo_addr(_modFactor+0)
MOVT	R1, #hi_addr(_modFactor+0)
VLDR	#1, S1, [R1, #0]
MOV	R0, R1
VLDR	#1, S0, [R0, #0]
VMUL.F32	S0, S0, S1
VSTR	#1, S0, [SP, #4]
MOV	R0, R1
VLDR	#1, S0, [R0, #0]
BL	_sqrt+0
VLDR	#1, S1, [SP, #4]
VMUL.F32	S1, S1, S0
VMOV.F32	S0, #-0.5
VMUL.F32	S1, S0, S1
VMOV.F32	S0, #18
VMUL.F32	S0, S1, S0
MOVW	R0, #lo_addr(_ai+20)
MOVT	R0, #hi_addr(_ai+20)
VSTR	#1, S0, [R0, #0]
;parameter_normal.h,113 :: 		bi[5] = 0.4 / modFactor;
MOVW	R1, #lo_addr(_modFactor+0)
MOVT	R1, #hi_addr(_modFactor+0)
VLDR	#1, S1, [R1, #0]
MOVW	R0, #52429
MOVT	R0, #16076
VMOV	S0, R0
VDIV.F32	S0, S0, S1
MOVW	R0, #lo_addr(_bi+20)
MOVT	R0, #hi_addr(_bi+20)
VSTR	#1, S0, [R0, #0]
;parameter_normal.h,114 :: 		ti[6] = 100 * sqrt(modFactor);
MOV	R0, R1
VLDR	#1, S0, [R0, #0]
BL	_sqrt+0
MOVW	R0, #0
MOVT	R0, #17096
VMOV	S1, R0
VMUL.F32	S0, S1, S0
MOVW	R0, #lo_addr(_ti+24)
MOVT	R0, #hi_addr(_ti+24)
VSTR	#1, S0, [R0, #0]
;parameter_normal.h,115 :: 		ai[6] = -0.75 *((modFactor * modFactor)*sqrt(modFactor)) * 18;
MOVW	R1, #lo_addr(_modFactor+0)
MOVT	R1, #hi_addr(_modFactor+0)
VLDR	#1, S1, [R1, #0]
MOV	R0, R1
VLDR	#1, S0, [R0, #0]
VMUL.F32	S0, S0, S1
VSTR	#1, S0, [SP, #4]
MOV	R0, R1
VLDR	#1, S0, [R0, #0]
BL	_sqrt+0
VLDR	#1, S1, [SP, #4]
VMUL.F32	S1, S1, S0
VMOV.F32	S0, #-0.75
VMUL.F32	S1, S0, S1
VMOV.F32	S0, #18
VMUL.F32	S0, S1, S0
MOVW	R0, #lo_addr(_ai+24)
MOVT	R0, #hi_addr(_ai+24)
VSTR	#1, S0, [R0, #0]
;parameter_normal.h,116 :: 		bi[6] = 0.2 * modFactor;
MOVW	R0, #lo_addr(_modFactor+0)
MOVT	R0, #hi_addr(_modFactor+0)
VLDR	#1, S1, [R0, #0]
MOVW	R0, #52429
MOVT	R0, #15948
VMOV	S0, R0
VMUL.F32	S0, S0, S1
MOVW	R0, #lo_addr(_bi+24)
MOVT	R0, #hi_addr(_bi+24)
VSTR	#1, S0, [R0, #0]
;parameter_normal.h,119 :: 		for (i = 1; i <= 6; i++)
; i start address is: 12 (R3)
MOVS	R3, #1
SXTH	R3, R3
; i end address is: 12 (R3)
L_normalaVR30:
; i start address is: 12 (R3)
CMP	R3, #6
IT	GT
BGT	L_normalaVR31
;parameter_normal.h,121 :: 		ti[i] = ti[i] * (pi / 180.0); // konversi ke radian
LSLS	R1, R3, #2
MOVW	R0, #lo_addr(_ti+0)
MOVT	R0, #hi_addr(_ti+0)
ADDS	R2, R0, R1
VLDR	#1, S1, [R2, #0]
MOVW	R0, #64053
MOVT	R0, #15502
VMOV	S0, R0
VMUL.F32	S0, S1, S0
VSTR	#1, S0, [R2, #0]
;parameter_normal.h,119 :: 		for (i = 1; i <= 6; i++)
ADDS	R3, R3, #1
SXTH	R3, R3
;parameter_normal.h,122 :: 		}
; i end address is: 12 (R3)
IT	AL
BAL	L_normalaVR30
L_normalaVR31:
;parameter_normal.h,123 :: 		}
L_end_normalaVR:
LDR	LR, [SP, #0]
ADD	SP, SP, #8
BX	LR
; end of _normalaVR
_normalaVL:
;parameter_normal.h,125 :: 		void normalaVL()
SUB	SP, SP, #8
STR	LR, [SP, #0]
;parameter_normal.h,128 :: 		modFactor = sqrt((float)hmean / 60.0);
MOVW	R0, #lo_addr(_hmean+0)
MOVT	R0, #hi_addr(_hmean+0)
VLDR	#1, S1, [R0, #0]
MOVW	R0, #0
MOVT	R0, #17008
VMOV	S0, R0
VDIV.F32	S0, S1, S0
BL	_sqrt+0
MOVW	R0, #lo_addr(_modFactor+0)
MOVT	R0, #hi_addr(_modFactor+0)
VSTR	#1, S0, [R0, #0]
;parameter_normal.h,130 :: 		ti[1] = -60 * sqrt(modFactor);
VMOV.F32	S0, S0
BL	_sqrt+0
MOVW	R0, #0
MOVT	R0, #49776
VMOV	S1, R0
VMUL.F32	S0, S1, S0
MOVW	R0, #lo_addr(_ti+4)
MOVT	R0, #hi_addr(_ti+4)
VSTR	#1, S0, [R0, #0]
;parameter_normal.h,131 :: 		ai[1] = -0.2 * 18;
MOVW	R0, #26215
MOVT	R0, #49254
VMOV	S0, R0
MOVW	R0, #lo_addr(_ai+4)
MOVT	R0, #hi_addr(_ai+4)
VSTR	#1, S0, [R0, #0]
;parameter_normal.h,132 :: 		bi[1] = 0.2 * modFactor;
MOVW	R1, #lo_addr(_modFactor+0)
MOVT	R1, #hi_addr(_modFactor+0)
VLDR	#1, S1, [R1, #0]
MOVW	R0, #52429
MOVT	R0, #15948
VMOV	S0, R0
VMUL.F32	S0, S0, S1
MOVW	R0, #lo_addr(_bi+4)
MOVT	R0, #hi_addr(_bi+4)
VSTR	#1, S0, [R0, #0]
;parameter_normal.h,133 :: 		ti[2] = -15 * modFactor;
MOV	R0, R1
VLDR	#1, S1, [R0, #0]
VMOV.F32	S0, #-15
VMUL.F32	S0, S0, S1
MOVW	R0, #lo_addr(_ti+8)
MOVT	R0, #hi_addr(_ti+8)
VSTR	#1, S0, [R0, #0]
;parameter_normal.h,134 :: 		ai[2] = 7 * 18;
MOVW	R0, #0
MOVT	R0, #17148
VMOV	S0, R0
MOVW	R0, #lo_addr(_ai+8)
MOVT	R0, #hi_addr(_ai+8)
VSTR	#1, S0, [R0, #0]
;parameter_normal.h,135 :: 		bi[2] = 0.1 * modFactor;
MOV	R0, R1
VLDR	#1, S1, [R0, #0]
MOVW	R0, #52429
MOVT	R0, #15820
VMOV	S0, R0
VMUL.F32	S0, S0, S1
MOVW	R0, #lo_addr(_bi+8)
MOVT	R0, #hi_addr(_bi+8)
VSTR	#1, S0, [R0, #0]
;parameter_normal.h,136 :: 		ti[3] = 0;
MOV	R0, #0
VMOV	S0, R0
MOVW	R0, #lo_addr(_ti+12)
MOVT	R0, #hi_addr(_ti+12)
VSTR	#1, S0, [R0, #0]
;parameter_normal.h,137 :: 		ai[3] = -15 * 18;
MOVW	R0, #0
MOVT	R0, #50055
VMOV	S0, R0
MOVW	R0, #lo_addr(_ai+12)
MOVT	R0, #hi_addr(_ai+12)
VSTR	#1, S0, [R0, #0]
;parameter_normal.h,138 :: 		bi[3] = 0.1 * modFactor;
MOV	R0, R1
VLDR	#1, S1, [R0, #0]
MOVW	R0, #52429
MOVT	R0, #15820
VMOV	S0, R0
VMUL.F32	S0, S0, S1
MOVW	R0, #lo_addr(_bi+12)
MOVT	R0, #hi_addr(_bi+12)
VSTR	#1, S0, [R0, #0]
;parameter_normal.h,139 :: 		ti[4] = 15 * modFactor;
MOV	R0, R1
VLDR	#1, S1, [R0, #0]
VMOV.F32	S0, #15
VMUL.F32	S0, S0, S1
MOVW	R0, #lo_addr(_ti+16)
MOVT	R0, #hi_addr(_ti+16)
VSTR	#1, S0, [R0, #0]
;parameter_normal.h,140 :: 		ai[4] = -0.5 * 18;
VMOV.F32	S0, #-9
MOVW	R0, #lo_addr(_ai+16)
MOVT	R0, #hi_addr(_ai+16)
VSTR	#1, S0, [R0, #0]
;parameter_normal.h,141 :: 		bi[4] = 0.1 * modFactor;
MOV	R0, R1
VLDR	#1, S1, [R0, #0]
MOVW	R0, #52429
MOVT	R0, #15820
VMOV	S0, R0
VMUL.F32	S0, S0, S1
MOVW	R0, #lo_addr(_bi+16)
MOVT	R0, #hi_addr(_bi+16)
VSTR	#1, S0, [R0, #0]
;parameter_normal.h,142 :: 		ti[5] = 97 * sqrt(modFactor);
MOV	R0, R1
VLDR	#1, S0, [R0, #0]
BL	_sqrt+0
MOVW	R0, #0
MOVT	R0, #17090
VMOV	S1, R0
VMUL.F32	S0, S1, S0
MOVW	R0, #lo_addr(_ti+20)
MOVT	R0, #hi_addr(_ti+20)
VSTR	#1, S0, [R0, #0]
;parameter_normal.h,143 :: 		ai[5] = 0.17 * ((modFactor * modFactor)*sqrt(modFactor)) * 18;
MOVW	R1, #lo_addr(_modFactor+0)
MOVT	R1, #hi_addr(_modFactor+0)
VLDR	#1, S1, [R1, #0]
MOV	R0, R1
VLDR	#1, S0, [R0, #0]
VMUL.F32	S0, S0, S1
VSTR	#1, S0, [SP, #4]
MOV	R0, R1
VLDR	#1, S0, [R0, #0]
BL	_sqrt+0
VLDR	#1, S1, [SP, #4]
VMUL.F32	S1, S1, S0
MOVW	R0, #5243
MOVT	R0, #15918
VMOV	S0, R0
VMUL.F32	S1, S0, S1
VMOV.F32	S0, #18
VMUL.F32	S0, S1, S0
MOVW	R0, #lo_addr(_ai+20)
MOVT	R0, #hi_addr(_ai+20)
VSTR	#1, S0, [R0, #0]
;parameter_normal.h,144 :: 		bi[5] = 0.4 / modFactor;
MOVW	R1, #lo_addr(_modFactor+0)
MOVT	R1, #hi_addr(_modFactor+0)
VLDR	#1, S1, [R1, #0]
MOVW	R0, #52429
MOVT	R0, #16076
VMOV	S0, R0
VDIV.F32	S0, S0, S1
MOVW	R0, #lo_addr(_bi+20)
MOVT	R0, #hi_addr(_bi+20)
VSTR	#1, S0, [R0, #0]
;parameter_normal.h,145 :: 		ti[6] = 100 * sqrt(modFactor);
MOV	R0, R1
VLDR	#1, S0, [R0, #0]
BL	_sqrt+0
MOVW	R0, #0
MOVT	R0, #17096
VMOV	S1, R0
VMUL.F32	S0, S1, S0
MOVW	R0, #lo_addr(_ti+24)
MOVT	R0, #hi_addr(_ti+24)
VSTR	#1, S0, [R0, #0]
;parameter_normal.h,146 :: 		ai[6] = 0.25 *((modFactor * modFactor)*sqrt(modFactor)) * 18;
MOVW	R1, #lo_addr(_modFactor+0)
MOVT	R1, #hi_addr(_modFactor+0)
VLDR	#1, S1, [R1, #0]
MOV	R0, R1
VLDR	#1, S0, [R0, #0]
VMUL.F32	S0, S0, S1
VSTR	#1, S0, [SP, #4]
MOV	R0, R1
VLDR	#1, S0, [R0, #0]
BL	_sqrt+0
VLDR	#1, S1, [SP, #4]
VMUL.F32	S1, S1, S0
VMOV.F32	S0, #0.25
VMUL.F32	S1, S0, S1
VMOV.F32	S0, #18
VMUL.F32	S0, S1, S0
MOVW	R0, #lo_addr(_ai+24)
MOVT	R0, #hi_addr(_ai+24)
VSTR	#1, S0, [R0, #0]
;parameter_normal.h,147 :: 		bi[6] = 0.2 * modFactor;
MOVW	R0, #lo_addr(_modFactor+0)
MOVT	R0, #hi_addr(_modFactor+0)
VLDR	#1, S1, [R0, #0]
MOVW	R0, #52429
MOVT	R0, #15948
VMOV	S0, R0
VMUL.F32	S0, S0, S1
MOVW	R0, #lo_addr(_bi+24)
MOVT	R0, #hi_addr(_bi+24)
VSTR	#1, S0, [R0, #0]
;parameter_normal.h,150 :: 		for (i = 1; i <= 6; i++)
; i start address is: 12 (R3)
MOVS	R3, #1
SXTH	R3, R3
; i end address is: 12 (R3)
L_normalaVL33:
; i start address is: 12 (R3)
CMP	R3, #6
IT	GT
BGT	L_normalaVL34
;parameter_normal.h,152 :: 		ti[i] = ti[i] * (pi / 180.0); // konversi ke radian
LSLS	R1, R3, #2
MOVW	R0, #lo_addr(_ti+0)
MOVT	R0, #hi_addr(_ti+0)
ADDS	R2, R0, R1
VLDR	#1, S1, [R2, #0]
MOVW	R0, #64053
MOVT	R0, #15502
VMOV	S0, R0
VMUL.F32	S0, S1, S0
VSTR	#1, S0, [R2, #0]
;parameter_normal.h,150 :: 		for (i = 1; i <= 6; i++)
ADDS	R3, R3, #1
SXTH	R3, R3
;parameter_normal.h,153 :: 		}
; i end address is: 12 (R3)
IT	AL
BAL	L_normalaVL33
L_normalaVL34:
;parameter_normal.h,154 :: 		}
L_end_normalaVL:
LDR	LR, [SP, #0]
ADD	SP, SP, #8
BX	LR
; end of _normalaVL
_normalaVF:
;parameter_normal.h,156 :: 		void normalaVF()
SUB	SP, SP, #8
STR	LR, [SP, #0]
;parameter_normal.h,159 :: 		modFactor = sqrt((float)hmean / 60.0);
MOVW	R0, #lo_addr(_hmean+0)
MOVT	R0, #hi_addr(_hmean+0)
VLDR	#1, S1, [R0, #0]
MOVW	R0, #0
MOVT	R0, #17008
VMOV	S0, R0
VDIV.F32	S0, S1, S0
BL	_sqrt+0
MOVW	R0, #lo_addr(_modFactor+0)
MOVT	R0, #hi_addr(_modFactor+0)
VSTR	#1, S0, [R0, #0]
;parameter_normal.h,161 :: 		ti[1] = -60 * sqrt(modFactor);
VMOV.F32	S0, S0
BL	_sqrt+0
MOVW	R0, #0
MOVT	R0, #49776
VMOV	S1, R0
VMUL.F32	S0, S1, S0
MOVW	R0, #lo_addr(_ti+4)
MOVT	R0, #hi_addr(_ti+4)
VSTR	#1, S0, [R0, #0]
;parameter_normal.h,162 :: 		ai[1] = 1 * 18;
VMOV.F32	S0, #18
MOVW	R0, #lo_addr(_ai+4)
MOVT	R0, #hi_addr(_ai+4)
VSTR	#1, S0, [R0, #0]
;parameter_normal.h,163 :: 		bi[1] = 0.2 * modFactor;
MOVW	R1, #lo_addr(_modFactor+0)
MOVT	R1, #hi_addr(_modFactor+0)
VLDR	#1, S1, [R1, #0]
MOVW	R0, #52429
MOVT	R0, #15948
VMOV	S0, R0
VMUL.F32	S0, S0, S1
MOVW	R0, #lo_addr(_bi+4)
MOVT	R0, #hi_addr(_bi+4)
VSTR	#1, S0, [R0, #0]
;parameter_normal.h,164 :: 		ti[2] = -15 * modFactor;
MOV	R0, R1
VLDR	#1, S1, [R0, #0]
VMOV.F32	S0, #-15
VMUL.F32	S0, S0, S1
MOVW	R0, #lo_addr(_ti+8)
MOVT	R0, #hi_addr(_ti+8)
VSTR	#1, S0, [R0, #0]
;parameter_normal.h,165 :: 		ai[2] = -6 * 18;
MOVW	R0, #0
MOVT	R0, #49880
VMOV	S0, R0
MOVW	R0, #lo_addr(_ai+8)
MOVT	R0, #hi_addr(_ai+8)
VSTR	#1, S0, [R0, #0]
;parameter_normal.h,166 :: 		bi[2] = 0.1 * modFactor;
MOV	R0, R1
VLDR	#1, S1, [R0, #0]
MOVW	R0, #52429
MOVT	R0, #15820
VMOV	S0, R0
VMUL.F32	S0, S0, S1
MOVW	R0, #lo_addr(_bi+8)
MOVT	R0, #hi_addr(_bi+8)
VSTR	#1, S0, [R0, #0]
;parameter_normal.h,167 :: 		ti[3] = 0;
MOV	R0, #0
VMOV	S0, R0
MOVW	R0, #lo_addr(_ti+12)
MOVT	R0, #hi_addr(_ti+12)
VSTR	#1, S0, [R0, #0]
;parameter_normal.h,168 :: 		ai[3] = 40 * 18;
MOVW	R0, #0
MOVT	R0, #17460
VMOV	S0, R0
MOVW	R0, #lo_addr(_ai+12)
MOVT	R0, #hi_addr(_ai+12)
VSTR	#1, S0, [R0, #0]
;parameter_normal.h,169 :: 		bi[3] = 0.1 * modFactor;
MOV	R0, R1
VLDR	#1, S1, [R0, #0]
MOVW	R0, #52429
MOVT	R0, #15820
VMOV	S0, R0
VMUL.F32	S0, S0, S1
MOVW	R0, #lo_addr(_bi+12)
MOVT	R0, #hi_addr(_bi+12)
VSTR	#1, S0, [R0, #0]
;parameter_normal.h,170 :: 		ti[4] = 15 * modFactor;
MOV	R0, R1
VLDR	#1, S1, [R0, #0]
VMOV.F32	S0, #15
VMUL.F32	S0, S0, S1
MOVW	R0, #lo_addr(_ti+16)
MOVT	R0, #hi_addr(_ti+16)
VSTR	#1, S0, [R0, #0]
;parameter_normal.h,171 :: 		ai[4] = 0.5 * 18;
VMOV.F32	S0, #9
MOVW	R0, #lo_addr(_ai+16)
MOVT	R0, #hi_addr(_ai+16)
VSTR	#1, S0, [R0, #0]
;parameter_normal.h,172 :: 		bi[4] = 0.1 * modFactor;
MOV	R0, R1
VLDR	#1, S1, [R0, #0]
MOVW	R0, #52429
MOVT	R0, #15820
VMOV	S0, R0
VMUL.F32	S0, S0, S1
MOVW	R0, #lo_addr(_bi+16)
MOVT	R0, #hi_addr(_bi+16)
VSTR	#1, S0, [R0, #0]
;parameter_normal.h,173 :: 		ti[5] = 97 * sqrt(modFactor);
MOV	R0, R1
VLDR	#1, S0, [R0, #0]
BL	_sqrt+0
MOVW	R0, #0
MOVT	R0, #17090
VMOV	S1, R0
VMUL.F32	S0, S1, S0
MOVW	R0, #lo_addr(_ti+20)
MOVT	R0, #hi_addr(_ti+20)
VSTR	#1, S0, [R0, #0]
;parameter_normal.h,174 :: 		ai[5] = 0.4 * ((modFactor * modFactor)*sqrt(modFactor)) * 18;
MOVW	R1, #lo_addr(_modFactor+0)
MOVT	R1, #hi_addr(_modFactor+0)
VLDR	#1, S1, [R1, #0]
MOV	R0, R1
VLDR	#1, S0, [R0, #0]
VMUL.F32	S0, S0, S1
VSTR	#1, S0, [SP, #4]
MOV	R0, R1
VLDR	#1, S0, [R0, #0]
BL	_sqrt+0
VLDR	#1, S1, [SP, #4]
VMUL.F32	S1, S1, S0
MOVW	R0, #52429
MOVT	R0, #16076
VMOV	S0, R0
VMUL.F32	S1, S0, S1
VMOV.F32	S0, #18
VMUL.F32	S0, S1, S0
MOVW	R0, #lo_addr(_ai+20)
MOVT	R0, #hi_addr(_ai+20)
VSTR	#1, S0, [R0, #0]
;parameter_normal.h,175 :: 		bi[5] = 0.4 / modFactor;
MOVW	R1, #lo_addr(_modFactor+0)
MOVT	R1, #hi_addr(_modFactor+0)
VLDR	#1, S1, [R1, #0]
MOVW	R0, #52429
MOVT	R0, #16076
VMOV	S0, R0
VDIV.F32	S0, S0, S1
MOVW	R0, #lo_addr(_bi+20)
MOVT	R0, #hi_addr(_bi+20)
VSTR	#1, S0, [R0, #0]
;parameter_normal.h,176 :: 		ti[6] = 100 * sqrt(modFactor);
MOV	R0, R1
VLDR	#1, S0, [R0, #0]
BL	_sqrt+0
MOVW	R0, #0
MOVT	R0, #17096
VMOV	S1, R0
VMUL.F32	S0, S1, S0
MOVW	R0, #lo_addr(_ti+24)
MOVT	R0, #hi_addr(_ti+24)
VSTR	#1, S0, [R0, #0]
;parameter_normal.h,177 :: 		ai[6] = 0.6 *((modFactor * modFactor)*sqrt(modFactor)) * 18;
MOVW	R1, #lo_addr(_modFactor+0)
MOVT	R1, #hi_addr(_modFactor+0)
VLDR	#1, S1, [R1, #0]
MOV	R0, R1
VLDR	#1, S0, [R0, #0]
VMUL.F32	S0, S0, S1
VSTR	#1, S0, [SP, #4]
MOV	R0, R1
VLDR	#1, S0, [R0, #0]
BL	_sqrt+0
VLDR	#1, S1, [SP, #4]
VMUL.F32	S1, S1, S0
MOVW	R0, #39322
MOVT	R0, #16153
VMOV	S0, R0
VMUL.F32	S1, S0, S1
VMOV.F32	S0, #18
VMUL.F32	S0, S1, S0
MOVW	R0, #lo_addr(_ai+24)
MOVT	R0, #hi_addr(_ai+24)
VSTR	#1, S0, [R0, #0]
;parameter_normal.h,178 :: 		bi[6] = 0.2 * modFactor;
MOVW	R0, #lo_addr(_modFactor+0)
MOVT	R0, #hi_addr(_modFactor+0)
VLDR	#1, S1, [R0, #0]
MOVW	R0, #52429
MOVT	R0, #15948
VMOV	S0, R0
VMUL.F32	S0, S0, S1
MOVW	R0, #lo_addr(_bi+24)
MOVT	R0, #hi_addr(_bi+24)
VSTR	#1, S0, [R0, #0]
;parameter_normal.h,181 :: 		for (i = 1; i <= 6; i++)
; i start address is: 12 (R3)
MOVS	R3, #1
SXTH	R3, R3
; i end address is: 12 (R3)
L_normalaVF36:
; i start address is: 12 (R3)
CMP	R3, #6
IT	GT
BGT	L_normalaVF37
;parameter_normal.h,183 :: 		ti[i] = ti[i] * (pi / 180.0); // konversi ke radian
LSLS	R1, R3, #2
MOVW	R0, #lo_addr(_ti+0)
MOVT	R0, #hi_addr(_ti+0)
ADDS	R2, R0, R1
VLDR	#1, S1, [R2, #0]
MOVW	R0, #64053
MOVT	R0, #15502
VMOV	S0, R0
VMUL.F32	S0, S1, S0
VSTR	#1, S0, [R2, #0]
;parameter_normal.h,181 :: 		for (i = 1; i <= 6; i++)
ADDS	R3, R3, #1
SXTH	R3, R3
;parameter_normal.h,184 :: 		}
; i end address is: 12 (R3)
IT	AL
BAL	L_normalaVF36
L_normalaVF37:
;parameter_normal.h,185 :: 		}
L_end_normalaVF:
LDR	LR, [SP, #0]
ADD	SP, SP, #8
BX	LR
; end of _normalaVF
_normalV1:
;parameter_normal.h,187 :: 		void normalV1()
SUB	SP, SP, #8
STR	LR, [SP, #0]
;parameter_normal.h,190 :: 		modFactor = sqrt((float)hmean / 60.0);
MOVW	R0, #lo_addr(_hmean+0)
MOVT	R0, #hi_addr(_hmean+0)
VLDR	#1, S1, [R0, #0]
MOVW	R0, #0
MOVT	R0, #17008
VMOV	S0, R0
VDIV.F32	S0, S1, S0
BL	_sqrt+0
MOVW	R0, #lo_addr(_modFactor+0)
MOVT	R0, #hi_addr(_modFactor+0)
VSTR	#1, S0, [R0, #0]
;parameter_normal.h,192 :: 		ti[1] = -60 * sqrt(modFactor);
VMOV.F32	S0, S0
BL	_sqrt+0
MOVW	R0, #0
MOVT	R0, #49776
VMOV	S1, R0
VMUL.F32	S0, S1, S0
MOVW	R0, #lo_addr(_ti+4)
MOVT	R0, #hi_addr(_ti+4)
VSTR	#1, S0, [R0, #0]
;parameter_normal.h,193 :: 		ai[1] = 0.8 * 18;
MOVW	R0, #26215
MOVT	R0, #16742
VMOV	S0, R0
MOVW	R0, #lo_addr(_ai+4)
MOVT	R0, #hi_addr(_ai+4)
VSTR	#1, S0, [R0, #0]
;parameter_normal.h,194 :: 		bi[1] = 0.2 * modFactor;
MOVW	R1, #lo_addr(_modFactor+0)
MOVT	R1, #hi_addr(_modFactor+0)
VLDR	#1, S1, [R1, #0]
MOVW	R0, #52429
MOVT	R0, #15948
VMOV	S0, R0
VMUL.F32	S0, S0, S1
MOVW	R0, #lo_addr(_bi+4)
MOVT	R0, #hi_addr(_bi+4)
VSTR	#1, S0, [R0, #0]
;parameter_normal.h,195 :: 		ti[2] = -15 * modFactor;
MOV	R0, R1
VLDR	#1, S1, [R0, #0]
VMOV.F32	S0, #-15
VMUL.F32	S0, S0, S1
MOVW	R0, #lo_addr(_ti+8)
MOVT	R0, #hi_addr(_ti+8)
VSTR	#1, S0, [R0, #0]
;parameter_normal.h,196 :: 		ai[2] = 4 * 18;
MOVW	R0, #0
MOVT	R0, #17040
VMOV	S0, R0
MOVW	R0, #lo_addr(_ai+8)
MOVT	R0, #hi_addr(_ai+8)
VSTR	#1, S0, [R0, #0]
;parameter_normal.h,197 :: 		bi[2] = 0.1 * modFactor;
MOV	R0, R1
VLDR	#1, S1, [R0, #0]
MOVW	R0, #52429
MOVT	R0, #15820
VMOV	S0, R0
VMUL.F32	S0, S0, S1
MOVW	R0, #lo_addr(_bi+8)
MOVT	R0, #hi_addr(_bi+8)
VSTR	#1, S0, [R0, #0]
;parameter_normal.h,198 :: 		ti[3] = 0;
MOV	R0, #0
VMOV	S0, R0
MOVW	R0, #lo_addr(_ti+12)
MOVT	R0, #hi_addr(_ti+12)
VSTR	#1, S0, [R0, #0]
;parameter_normal.h,199 :: 		ai[3] = -37.5 * 18;
MOVW	R0, #49152
MOVT	R0, #50216
VMOV	S0, R0
MOVW	R0, #lo_addr(_ai+12)
MOVT	R0, #hi_addr(_ai+12)
VSTR	#1, S0, [R0, #0]
;parameter_normal.h,200 :: 		bi[3] = 0.1 * modFactor;
MOV	R0, R1
VLDR	#1, S1, [R0, #0]
MOVW	R0, #52429
MOVT	R0, #15820
VMOV	S0, R0
VMUL.F32	S0, S0, S1
MOVW	R0, #lo_addr(_bi+12)
MOVT	R0, #hi_addr(_bi+12)
VSTR	#1, S0, [R0, #0]
;parameter_normal.h,201 :: 		ti[4] = 15 * modFactor;
MOV	R0, R1
VLDR	#1, S1, [R0, #0]
VMOV.F32	S0, #15
VMUL.F32	S0, S0, S1
MOVW	R0, #lo_addr(_ti+16)
MOVT	R0, #hi_addr(_ti+16)
VSTR	#1, S0, [R0, #0]
;parameter_normal.h,202 :: 		ai[4] = -1 * 18;
VMOV.F32	S0, #-18
MOVW	R0, #lo_addr(_ai+16)
MOVT	R0, #hi_addr(_ai+16)
VSTR	#1, S0, [R0, #0]
;parameter_normal.h,203 :: 		bi[4] = 0.1 * modFactor;
MOV	R0, R1
VLDR	#1, S1, [R0, #0]
MOVW	R0, #52429
MOVT	R0, #15820
VMOV	S0, R0
VMUL.F32	S0, S0, S1
MOVW	R0, #lo_addr(_bi+16)
MOVT	R0, #hi_addr(_bi+16)
VSTR	#1, S0, [R0, #0]
;parameter_normal.h,204 :: 		ti[5] = 97 * sqrt(modFactor);
MOV	R0, R1
VLDR	#1, S0, [R0, #0]
BL	_sqrt+0
MOVW	R0, #0
MOVT	R0, #17090
VMOV	S1, R0
VMUL.F32	S0, S1, S0
MOVW	R0, #lo_addr(_ti+20)
MOVT	R0, #hi_addr(_ti+20)
VSTR	#1, S0, [R0, #0]
;parameter_normal.h,205 :: 		ai[5] = 0.17 * ((modFactor * modFactor)*sqrt(modFactor)) * 18;
MOVW	R1, #lo_addr(_modFactor+0)
MOVT	R1, #hi_addr(_modFactor+0)
VLDR	#1, S1, [R1, #0]
MOV	R0, R1
VLDR	#1, S0, [R0, #0]
VMUL.F32	S0, S0, S1
VSTR	#1, S0, [SP, #4]
MOV	R0, R1
VLDR	#1, S0, [R0, #0]
BL	_sqrt+0
VLDR	#1, S1, [SP, #4]
VMUL.F32	S1, S1, S0
MOVW	R0, #5243
MOVT	R0, #15918
VMOV	S0, R0
VMUL.F32	S1, S0, S1
VMOV.F32	S0, #18
VMUL.F32	S0, S1, S0
MOVW	R0, #lo_addr(_ai+20)
MOVT	R0, #hi_addr(_ai+20)
VSTR	#1, S0, [R0, #0]
;parameter_normal.h,206 :: 		bi[5] = 0.4 / modFactor;
MOVW	R1, #lo_addr(_modFactor+0)
MOVT	R1, #hi_addr(_modFactor+0)
VLDR	#1, S1, [R1, #0]
MOVW	R0, #52429
MOVT	R0, #16076
VMOV	S0, R0
VDIV.F32	S0, S0, S1
MOVW	R0, #lo_addr(_bi+20)
MOVT	R0, #hi_addr(_bi+20)
VSTR	#1, S0, [R0, #0]
;parameter_normal.h,207 :: 		ti[6] = 100 * sqrt(modFactor);
MOV	R0, R1
VLDR	#1, S0, [R0, #0]
BL	_sqrt+0
MOVW	R0, #0
MOVT	R0, #17096
VMOV	S1, R0
VMUL.F32	S0, S1, S0
MOVW	R0, #lo_addr(_ti+24)
MOVT	R0, #hi_addr(_ti+24)
VSTR	#1, S0, [R0, #0]
;parameter_normal.h,208 :: 		ai[6] = 0.25 *((modFactor * modFactor)*sqrt(modFactor)) * 18;
MOVW	R1, #lo_addr(_modFactor+0)
MOVT	R1, #hi_addr(_modFactor+0)
VLDR	#1, S1, [R1, #0]
MOV	R0, R1
VLDR	#1, S0, [R0, #0]
VMUL.F32	S0, S0, S1
VSTR	#1, S0, [SP, #4]
MOV	R0, R1
VLDR	#1, S0, [R0, #0]
BL	_sqrt+0
VLDR	#1, S1, [SP, #4]
VMUL.F32	S1, S1, S0
VMOV.F32	S0, #0.25
VMUL.F32	S1, S0, S1
VMOV.F32	S0, #18
VMUL.F32	S0, S1, S0
MOVW	R0, #lo_addr(_ai+24)
MOVT	R0, #hi_addr(_ai+24)
VSTR	#1, S0, [R0, #0]
;parameter_normal.h,209 :: 		bi[6] = 0.2 * modFactor;
MOVW	R0, #lo_addr(_modFactor+0)
MOVT	R0, #hi_addr(_modFactor+0)
VLDR	#1, S1, [R0, #0]
MOVW	R0, #52429
MOVT	R0, #15948
VMOV	S0, R0
VMUL.F32	S0, S0, S1
MOVW	R0, #lo_addr(_bi+24)
MOVT	R0, #hi_addr(_bi+24)
VSTR	#1, S0, [R0, #0]
;parameter_normal.h,212 :: 		for (i = 1; i <= 6; i++)
; i start address is: 12 (R3)
MOVS	R3, #1
SXTH	R3, R3
; i end address is: 12 (R3)
L_normalV139:
; i start address is: 12 (R3)
CMP	R3, #6
IT	GT
BGT	L_normalV140
;parameter_normal.h,214 :: 		ti[i] = ti[i] * (pi / 180.0); // konversi ke radian
LSLS	R1, R3, #2
MOVW	R0, #lo_addr(_ti+0)
MOVT	R0, #hi_addr(_ti+0)
ADDS	R2, R0, R1
VLDR	#1, S1, [R2, #0]
MOVW	R0, #64053
MOVT	R0, #15502
VMOV	S0, R0
VMUL.F32	S0, S1, S0
VSTR	#1, S0, [R2, #0]
;parameter_normal.h,212 :: 		for (i = 1; i <= 6; i++)
ADDS	R3, R3, #1
SXTH	R3, R3
;parameter_normal.h,215 :: 		}
; i end address is: 12 (R3)
IT	AL
BAL	L_normalV139
L_normalV140:
;parameter_normal.h,216 :: 		}
L_end_normalV1:
LDR	LR, [SP, #0]
ADD	SP, SP, #8
BX	LR
; end of _normalV1
_normalV2:
;parameter_normal.h,218 :: 		void normalV2()
SUB	SP, SP, #8
STR	LR, [SP, #0]
;parameter_normal.h,221 :: 		modFactor = sqrt((float)hmean / 60.0);
MOVW	R0, #lo_addr(_hmean+0)
MOVT	R0, #hi_addr(_hmean+0)
VLDR	#1, S1, [R0, #0]
MOVW	R0, #0
MOVT	R0, #17008
VMOV	S0, R0
VDIV.F32	S0, S1, S0
BL	_sqrt+0
MOVW	R0, #lo_addr(_modFactor+0)
MOVT	R0, #hi_addr(_modFactor+0)
VSTR	#1, S0, [R0, #0]
;parameter_normal.h,223 :: 		ti[1] = -60 * sqrt(modFactor);
VMOV.F32	S0, S0
BL	_sqrt+0
MOVW	R0, #0
MOVT	R0, #49776
VMOV	S1, R0
VMUL.F32	S0, S1, S0
MOVW	R0, #lo_addr(_ti+4)
MOVT	R0, #hi_addr(_ti+4)
VSTR	#1, S0, [R0, #0]
;parameter_normal.h,224 :: 		ai[1] = 0.8 * 18;
MOVW	R0, #26215
MOVT	R0, #16742
VMOV	S0, R0
MOVW	R0, #lo_addr(_ai+4)
MOVT	R0, #hi_addr(_ai+4)
VSTR	#1, S0, [R0, #0]
;parameter_normal.h,225 :: 		bi[1] = 0.2 * modFactor;
MOVW	R1, #lo_addr(_modFactor+0)
MOVT	R1, #hi_addr(_modFactor+0)
VLDR	#1, S1, [R1, #0]
MOVW	R0, #52429
MOVT	R0, #15948
VMOV	S0, R0
VMUL.F32	S0, S0, S1
MOVW	R0, #lo_addr(_bi+4)
MOVT	R0, #hi_addr(_bi+4)
VSTR	#1, S0, [R0, #0]
;parameter_normal.h,226 :: 		ti[2] = -15 * modFactor;
MOV	R0, R1
VLDR	#1, S1, [R0, #0]
VMOV.F32	S0, #-15
VMUL.F32	S0, S0, S1
MOVW	R0, #lo_addr(_ti+8)
MOVT	R0, #hi_addr(_ti+8)
VSTR	#1, S0, [R0, #0]
;parameter_normal.h,227 :: 		ai[2] = 10 * 18;
MOVW	R0, #0
MOVT	R0, #17204
VMOV	S0, R0
MOVW	R0, #lo_addr(_ai+8)
MOVT	R0, #hi_addr(_ai+8)
VSTR	#1, S0, [R0, #0]
;parameter_normal.h,228 :: 		bi[2] = 0.1 * modFactor;
MOV	R0, R1
VLDR	#1, S1, [R0, #0]
MOVW	R0, #52429
MOVT	R0, #15820
VMOV	S0, R0
VMUL.F32	S0, S0, S1
MOVW	R0, #lo_addr(_bi+8)
MOVT	R0, #hi_addr(_bi+8)
VSTR	#1, S0, [R0, #0]
;parameter_normal.h,229 :: 		ti[3] = 0;
MOV	R0, #0
VMOV	S0, R0
MOVW	R0, #lo_addr(_ti+12)
MOVT	R0, #hi_addr(_ti+12)
VSTR	#1, S0, [R0, #0]
;parameter_normal.h,230 :: 		ai[3] = -67.5 * 18;
MOVW	R0, #57344
MOVT	R0, #50327
VMOV	S0, R0
MOVW	R0, #lo_addr(_ai+12)
MOVT	R0, #hi_addr(_ai+12)
VSTR	#1, S0, [R0, #0]
;parameter_normal.h,231 :: 		bi[3] = 0.1 * modFactor;
MOV	R0, R1
VLDR	#1, S1, [R0, #0]
MOVW	R0, #52429
MOVT	R0, #15820
VMOV	S0, R0
VMUL.F32	S0, S0, S1
MOVW	R0, #lo_addr(_bi+12)
MOVT	R0, #hi_addr(_bi+12)
VSTR	#1, S0, [R0, #0]
;parameter_normal.h,232 :: 		ti[4] = 15 * modFactor;
MOV	R0, R1
VLDR	#1, S1, [R0, #0]
VMOV.F32	S0, #15
VMUL.F32	S0, S0, S1
MOVW	R0, #lo_addr(_ti+16)
MOVT	R0, #hi_addr(_ti+16)
VSTR	#1, S0, [R0, #0]
;parameter_normal.h,233 :: 		ai[4] = -1 * 18;
VMOV.F32	S0, #-18
MOVW	R0, #lo_addr(_ai+16)
MOVT	R0, #hi_addr(_ai+16)
VSTR	#1, S0, [R0, #0]
;parameter_normal.h,234 :: 		bi[4] = 0.1 * modFactor;
MOV	R0, R1
VLDR	#1, S1, [R0, #0]
MOVW	R0, #52429
MOVT	R0, #15820
VMOV	S0, R0
VMUL.F32	S0, S0, S1
MOVW	R0, #lo_addr(_bi+16)
MOVT	R0, #hi_addr(_bi+16)
VSTR	#1, S0, [R0, #0]
;parameter_normal.h,235 :: 		ti[5] = 97 * sqrt(modFactor);
MOV	R0, R1
VLDR	#1, S0, [R0, #0]
BL	_sqrt+0
MOVW	R0, #0
MOVT	R0, #17090
VMOV	S1, R0
VMUL.F32	S0, S1, S0
MOVW	R0, #lo_addr(_ti+20)
MOVT	R0, #hi_addr(_ti+20)
VSTR	#1, S0, [R0, #0]
;parameter_normal.h,236 :: 		ai[5] = 0.9 * ((modFactor * modFactor)*sqrt(modFactor)) * 18;
MOVW	R1, #lo_addr(_modFactor+0)
MOVT	R1, #hi_addr(_modFactor+0)
VLDR	#1, S1, [R1, #0]
MOV	R0, R1
VLDR	#1, S0, [R0, #0]
VMUL.F32	S0, S0, S1
VSTR	#1, S0, [SP, #4]
MOV	R0, R1
VLDR	#1, S0, [R0, #0]
BL	_sqrt+0
VLDR	#1, S1, [SP, #4]
VMUL.F32	S1, S1, S0
MOVW	R0, #26214
MOVT	R0, #16230
VMOV	S0, R0
VMUL.F32	S1, S0, S1
VMOV.F32	S0, #18
VMUL.F32	S0, S1, S0
MOVW	R0, #lo_addr(_ai+20)
MOVT	R0, #hi_addr(_ai+20)
VSTR	#1, S0, [R0, #0]
;parameter_normal.h,237 :: 		bi[5] = 0.4 / modFactor;
MOVW	R1, #lo_addr(_modFactor+0)
MOVT	R1, #hi_addr(_modFactor+0)
VLDR	#1, S1, [R1, #0]
MOVW	R0, #52429
MOVT	R0, #16076
VMOV	S0, R0
VDIV.F32	S0, S0, S1
MOVW	R0, #lo_addr(_bi+20)
MOVT	R0, #hi_addr(_bi+20)
VSTR	#1, S0, [R0, #0]
;parameter_normal.h,238 :: 		ti[6] = 100 * sqrt(modFactor);
MOV	R0, R1
VLDR	#1, S0, [R0, #0]
BL	_sqrt+0
MOVW	R0, #0
MOVT	R0, #17096
VMOV	S1, R0
VMUL.F32	S0, S1, S0
MOVW	R0, #lo_addr(_ti+24)
MOVT	R0, #hi_addr(_ti+24)
VSTR	#1, S0, [R0, #0]
;parameter_normal.h,239 :: 		ai[6] = 1.5 *((modFactor * modFactor)*sqrt(modFactor)) * 18;
MOVW	R1, #lo_addr(_modFactor+0)
MOVT	R1, #hi_addr(_modFactor+0)
VLDR	#1, S1, [R1, #0]
MOV	R0, R1
VLDR	#1, S0, [R0, #0]
VMUL.F32	S0, S0, S1
VSTR	#1, S0, [SP, #4]
MOV	R0, R1
VLDR	#1, S0, [R0, #0]
BL	_sqrt+0
VLDR	#1, S1, [SP, #4]
VMUL.F32	S1, S1, S0
VMOV.F32	S0, #1.5
VMUL.F32	S1, S0, S1
VMOV.F32	S0, #18
VMUL.F32	S0, S1, S0
MOVW	R0, #lo_addr(_ai+24)
MOVT	R0, #hi_addr(_ai+24)
VSTR	#1, S0, [R0, #0]
;parameter_normal.h,240 :: 		bi[6] = 0.2 * modFactor;
MOVW	R0, #lo_addr(_modFactor+0)
MOVT	R0, #hi_addr(_modFactor+0)
VLDR	#1, S1, [R0, #0]
MOVW	R0, #52429
MOVT	R0, #15948
VMOV	S0, R0
VMUL.F32	S0, S0, S1
MOVW	R0, #lo_addr(_bi+24)
MOVT	R0, #hi_addr(_bi+24)
VSTR	#1, S0, [R0, #0]
;parameter_normal.h,243 :: 		for (i = 1; i <= 6; i++)
; i start address is: 12 (R3)
MOVS	R3, #1
SXTH	R3, R3
; i end address is: 12 (R3)
L_normalV242:
; i start address is: 12 (R3)
CMP	R3, #6
IT	GT
BGT	L_normalV243
;parameter_normal.h,245 :: 		ti[i] = ti[i] * (pi / 180.0); // konversi ke radian
LSLS	R1, R3, #2
MOVW	R0, #lo_addr(_ti+0)
MOVT	R0, #hi_addr(_ti+0)
ADDS	R2, R0, R1
VLDR	#1, S1, [R2, #0]
MOVW	R0, #64053
MOVT	R0, #15502
VMOV	S0, R0
VMUL.F32	S0, S1, S0
VSTR	#1, S0, [R2, #0]
;parameter_normal.h,243 :: 		for (i = 1; i <= 6; i++)
ADDS	R3, R3, #1
SXTH	R3, R3
;parameter_normal.h,246 :: 		}
; i end address is: 12 (R3)
IT	AL
BAL	L_normalV242
L_normalV243:
;parameter_normal.h,247 :: 		}
L_end_normalV2:
LDR	LR, [SP, #0]
ADD	SP, SP, #8
BX	LR
; end of _normalV2
_normalV3:
;parameter_normal.h,249 :: 		void normalV3()
SUB	SP, SP, #8
STR	LR, [SP, #0]
;parameter_normal.h,252 :: 		modFactor = sqrt((float)hmean / 60.0);
MOVW	R0, #lo_addr(_hmean+0)
MOVT	R0, #hi_addr(_hmean+0)
VLDR	#1, S1, [R0, #0]
MOVW	R0, #0
MOVT	R0, #17008
VMOV	S0, R0
VDIV.F32	S0, S1, S0
BL	_sqrt+0
MOVW	R0, #lo_addr(_modFactor+0)
MOVT	R0, #hi_addr(_modFactor+0)
VSTR	#1, S0, [R0, #0]
;parameter_normal.h,254 :: 		ti[1] = -60 * sqrt(modFactor);
VMOV.F32	S0, S0
BL	_sqrt+0
MOVW	R0, #0
MOVT	R0, #49776
VMOV	S1, R0
VMUL.F32	S0, S1, S0
MOVW	R0, #lo_addr(_ti+4)
MOVT	R0, #hi_addr(_ti+4)
VSTR	#1, S0, [R0, #0]
;parameter_normal.h,255 :: 		ai[1] = 0.8 * 18;
MOVW	R0, #26215
MOVT	R0, #16742
VMOV	S0, R0
MOVW	R0, #lo_addr(_ai+4)
MOVT	R0, #hi_addr(_ai+4)
VSTR	#1, S0, [R0, #0]
;parameter_normal.h,256 :: 		bi[1] = 0.2 * modFactor;
MOVW	R1, #lo_addr(_modFactor+0)
MOVT	R1, #hi_addr(_modFactor+0)
VLDR	#1, S1, [R1, #0]
MOVW	R0, #52429
MOVT	R0, #15948
VMOV	S0, R0
VMUL.F32	S0, S0, S1
MOVW	R0, #lo_addr(_bi+4)
MOVT	R0, #hi_addr(_bi+4)
VSTR	#1, S0, [R0, #0]
;parameter_normal.h,257 :: 		ti[2] = -15 * modFactor;
MOV	R0, R1
VLDR	#1, S1, [R0, #0]
VMOV.F32	S0, #-15
VMUL.F32	S0, S0, S1
MOVW	R0, #lo_addr(_ti+8)
MOVT	R0, #hi_addr(_ti+8)
VSTR	#1, S0, [R0, #0]
;parameter_normal.h,258 :: 		ai[2] = 18 * 18;
MOVW	R0, #0
MOVT	R0, #17314
VMOV	S0, R0
MOVW	R0, #lo_addr(_ai+8)
MOVT	R0, #hi_addr(_ai+8)
VSTR	#1, S0, [R0, #0]
;parameter_normal.h,259 :: 		bi[2] = 0.1 * modFactor;
MOV	R0, R1
VLDR	#1, S1, [R0, #0]
MOVW	R0, #52429
MOVT	R0, #15820
VMOV	S0, R0
VMUL.F32	S0, S0, S1
MOVW	R0, #lo_addr(_bi+8)
MOVT	R0, #hi_addr(_bi+8)
VSTR	#1, S0, [R0, #0]
;parameter_normal.h,260 :: 		ti[3] = 0;
MOV	R0, #0
VMOV	S0, R0
MOVW	R0, #lo_addr(_ti+12)
MOVT	R0, #hi_addr(_ti+12)
VSTR	#1, S0, [R0, #0]
;parameter_normal.h,261 :: 		ai[3] = -33.75 * 18;
MOVW	R0, #57344
MOVT	R0, #50199
VMOV	S0, R0
MOVW	R0, #lo_addr(_ai+12)
MOVT	R0, #hi_addr(_ai+12)
VSTR	#1, S0, [R0, #0]
;parameter_normal.h,262 :: 		bi[3] = 0.1 * modFactor;
MOV	R0, R1
VLDR	#1, S1, [R0, #0]
MOVW	R0, #52429
MOVT	R0, #15820
VMOV	S0, R0
VMUL.F32	S0, S0, S1
MOVW	R0, #lo_addr(_bi+12)
MOVT	R0, #hi_addr(_bi+12)
VSTR	#1, S0, [R0, #0]
;parameter_normal.h,263 :: 		ti[4] = 15 * modFactor;
MOV	R0, R1
VLDR	#1, S1, [R0, #0]
VMOV.F32	S0, #15
VMUL.F32	S0, S0, S1
MOVW	R0, #lo_addr(_ti+16)
MOVT	R0, #hi_addr(_ti+16)
VSTR	#1, S0, [R0, #0]
;parameter_normal.h,264 :: 		ai[4] = -1 * 18;
VMOV.F32	S0, #-18
MOVW	R0, #lo_addr(_ai+16)
MOVT	R0, #hi_addr(_ai+16)
VSTR	#1, S0, [R0, #0]
;parameter_normal.h,265 :: 		bi[4] = 0.1 * modFactor;
MOV	R0, R1
VLDR	#1, S1, [R0, #0]
MOVW	R0, #52429
MOVT	R0, #15820
VMOV	S0, R0
VMUL.F32	S0, S0, S1
MOVW	R0, #lo_addr(_bi+16)
MOVT	R0, #hi_addr(_bi+16)
VSTR	#1, S0, [R0, #0]
;parameter_normal.h,266 :: 		ti[5] = 97 * sqrt(modFactor);
MOV	R0, R1
VLDR	#1, S0, [R0, #0]
BL	_sqrt+0
MOVW	R0, #0
MOVT	R0, #17090
VMOV	S1, R0
VMUL.F32	S0, S1, S0
MOVW	R0, #lo_addr(_ti+20)
MOVT	R0, #hi_addr(_ti+20)
VSTR	#1, S0, [R0, #0]
;parameter_normal.h,267 :: 		ai[5] = 1 * ((modFactor * modFactor)*sqrt(modFactor)) * 18;
MOVW	R1, #lo_addr(_modFactor+0)
MOVT	R1, #hi_addr(_modFactor+0)
VLDR	#1, S1, [R1, #0]
MOV	R0, R1
VLDR	#1, S0, [R0, #0]
VMUL.F32	S0, S0, S1
VSTR	#1, S0, [SP, #4]
MOV	R0, R1
VLDR	#1, S0, [R0, #0]
BL	_sqrt+0
VLDR	#1, S1, [SP, #4]
VMUL.F32	S1, S1, S0
VMOV.F32	S0, #18
VMUL.F32	S0, S1, S0
MOVW	R0, #lo_addr(_ai+20)
MOVT	R0, #hi_addr(_ai+20)
VSTR	#1, S0, [R0, #0]
;parameter_normal.h,268 :: 		bi[5] = 0.4 / modFactor;
MOVW	R1, #lo_addr(_modFactor+0)
MOVT	R1, #hi_addr(_modFactor+0)
VLDR	#1, S1, [R1, #0]
MOVW	R0, #52429
MOVT	R0, #16076
VMOV	S0, R0
VDIV.F32	S0, S0, S1
MOVW	R0, #lo_addr(_bi+20)
MOVT	R0, #hi_addr(_bi+20)
VSTR	#1, S0, [R0, #0]
;parameter_normal.h,269 :: 		ti[6] = 100 * sqrt(modFactor);
MOV	R0, R1
VLDR	#1, S0, [R0, #0]
BL	_sqrt+0
MOVW	R0, #0
MOVT	R0, #17096
VMOV	S1, R0
VMUL.F32	S0, S1, S0
MOVW	R0, #lo_addr(_ti+24)
MOVT	R0, #hi_addr(_ti+24)
VSTR	#1, S0, [R0, #0]
;parameter_normal.h,270 :: 		ai[6] = 2 *((modFactor * modFactor)*sqrt(modFactor)) * 18;
MOVW	R1, #lo_addr(_modFactor+0)
MOVT	R1, #hi_addr(_modFactor+0)
VLDR	#1, S1, [R1, #0]
MOV	R0, R1
VLDR	#1, S0, [R0, #0]
VMUL.F32	S0, S0, S1
VSTR	#1, S0, [SP, #4]
MOV	R0, R1
VLDR	#1, S0, [R0, #0]
BL	_sqrt+0
VLDR	#1, S1, [SP, #4]
VMUL.F32	S1, S1, S0
VMOV.F32	S0, #2
VMUL.F32	S1, S0, S1
VMOV.F32	S0, #18
VMUL.F32	S0, S1, S0
MOVW	R0, #lo_addr(_ai+24)
MOVT	R0, #hi_addr(_ai+24)
VSTR	#1, S0, [R0, #0]
;parameter_normal.h,271 :: 		bi[6] = 0.2 * modFactor;
MOVW	R0, #lo_addr(_modFactor+0)
MOVT	R0, #hi_addr(_modFactor+0)
VLDR	#1, S1, [R0, #0]
MOVW	R0, #52429
MOVT	R0, #15948
VMOV	S0, R0
VMUL.F32	S0, S0, S1
MOVW	R0, #lo_addr(_bi+24)
MOVT	R0, #hi_addr(_bi+24)
VSTR	#1, S0, [R0, #0]
;parameter_normal.h,274 :: 		for (i = 1; i <= 6; i++)
; i start address is: 12 (R3)
MOVS	R3, #1
SXTH	R3, R3
; i end address is: 12 (R3)
L_normalV345:
; i start address is: 12 (R3)
CMP	R3, #6
IT	GT
BGT	L_normalV346
;parameter_normal.h,276 :: 		ti[i] = ti[i] * (pi / 180.0); // konversi ke radian
LSLS	R1, R3, #2
MOVW	R0, #lo_addr(_ti+0)
MOVT	R0, #hi_addr(_ti+0)
ADDS	R2, R0, R1
VLDR	#1, S1, [R2, #0]
MOVW	R0, #64053
MOVT	R0, #15502
VMOV	S0, R0
VMUL.F32	S0, S1, S0
VSTR	#1, S0, [R2, #0]
;parameter_normal.h,274 :: 		for (i = 1; i <= 6; i++)
ADDS	R3, R3, #1
SXTH	R3, R3
;parameter_normal.h,277 :: 		}
; i end address is: 12 (R3)
IT	AL
BAL	L_normalV345
L_normalV346:
;parameter_normal.h,278 :: 		}
L_end_normalV3:
LDR	LR, [SP, #0]
ADD	SP, SP, #8
BX	LR
; end of _normalV3
_normalV4:
;parameter_normal.h,280 :: 		void normalV4()
SUB	SP, SP, #8
STR	LR, [SP, #0]
;parameter_normal.h,283 :: 		modFactor = sqrt((float)hmean / 60.0);
MOVW	R0, #lo_addr(_hmean+0)
MOVT	R0, #hi_addr(_hmean+0)
VLDR	#1, S1, [R0, #0]
MOVW	R0, #0
MOVT	R0, #17008
VMOV	S0, R0
VDIV.F32	S0, S1, S0
BL	_sqrt+0
MOVW	R0, #lo_addr(_modFactor+0)
MOVT	R0, #hi_addr(_modFactor+0)
VSTR	#1, S0, [R0, #0]
;parameter_normal.h,285 :: 		ti[1] = -60 * sqrt(modFactor);
VMOV.F32	S0, S0
BL	_sqrt+0
MOVW	R0, #0
MOVT	R0, #49776
VMOV	S1, R0
VMUL.F32	S0, S1, S0
MOVW	R0, #lo_addr(_ti+4)
MOVT	R0, #hi_addr(_ti+4)
VSTR	#1, S0, [R0, #0]
;parameter_normal.h,286 :: 		ai[1] = 0.8 * 18;
MOVW	R0, #26215
MOVT	R0, #16742
VMOV	S0, R0
MOVW	R0, #lo_addr(_ai+4)
MOVT	R0, #hi_addr(_ai+4)
VSTR	#1, S0, [R0, #0]
;parameter_normal.h,287 :: 		bi[1] = 0.2 * modFactor;
MOVW	R1, #lo_addr(_modFactor+0)
MOVT	R1, #hi_addr(_modFactor+0)
VLDR	#1, S1, [R1, #0]
MOVW	R0, #52429
MOVT	R0, #15948
VMOV	S0, R0
VMUL.F32	S0, S0, S1
MOVW	R0, #lo_addr(_bi+4)
MOVT	R0, #hi_addr(_bi+4)
VSTR	#1, S0, [R0, #0]
;parameter_normal.h,288 :: 		ti[2] = -15 * modFactor;
MOV	R0, R1
VLDR	#1, S1, [R0, #0]
VMOV.F32	S0, #-15
VMUL.F32	S0, S0, S1
MOVW	R0, #lo_addr(_ti+8)
MOVT	R0, #hi_addr(_ti+8)
VSTR	#1, S0, [R0, #0]
;parameter_normal.h,289 :: 		ai[2] = 0.5 * 18;
VMOV.F32	S0, #9
MOVW	R0, #lo_addr(_ai+8)
MOVT	R0, #hi_addr(_ai+8)
VSTR	#1, S0, [R0, #0]
;parameter_normal.h,290 :: 		bi[2] = 0.1 * modFactor;
MOV	R0, R1
VLDR	#1, S1, [R0, #0]
MOVW	R0, #52429
MOVT	R0, #15820
VMOV	S0, R0
VMUL.F32	S0, S0, S1
MOVW	R0, #lo_addr(_bi+8)
MOVT	R0, #hi_addr(_bi+8)
VSTR	#1, S0, [R0, #0]
;parameter_normal.h,291 :: 		ti[3] = 0;
MOV	R0, #0
VMOV	S0, R0
MOVW	R0, #lo_addr(_ti+12)
MOVT	R0, #hi_addr(_ti+12)
VSTR	#1, S0, [R0, #0]
;parameter_normal.h,292 :: 		ai[3] = 45 * 18;
MOVW	R0, #32768
MOVT	R0, #17482
VMOV	S0, R0
MOVW	R0, #lo_addr(_ai+12)
MOVT	R0, #hi_addr(_ai+12)
VSTR	#1, S0, [R0, #0]
;parameter_normal.h,293 :: 		bi[3] = 0.1 * modFactor;
MOV	R0, R1
VLDR	#1, S1, [R0, #0]
MOVW	R0, #52429
MOVT	R0, #15820
VMOV	S0, R0
VMUL.F32	S0, S0, S1
MOVW	R0, #lo_addr(_bi+12)
MOVT	R0, #hi_addr(_bi+12)
VSTR	#1, S0, [R0, #0]
;parameter_normal.h,294 :: 		ti[4] = 15 * modFactor;
MOV	R0, R1
VLDR	#1, S1, [R0, #0]
VMOV.F32	S0, #15
VMUL.F32	S0, S0, S1
MOVW	R0, #lo_addr(_ti+16)
MOVT	R0, #hi_addr(_ti+16)
VSTR	#1, S0, [R0, #0]
;parameter_normal.h,295 :: 		ai[4] = -15 * 18;
MOVW	R0, #0
MOVT	R0, #50055
VMOV	S0, R0
MOVW	R0, #lo_addr(_ai+16)
MOVT	R0, #hi_addr(_ai+16)
VSTR	#1, S0, [R0, #0]
;parameter_normal.h,296 :: 		bi[4] = 0.1 * modFactor;
MOV	R0, R1
VLDR	#1, S1, [R0, #0]
MOVW	R0, #52429
MOVT	R0, #15820
VMOV	S0, R0
VMUL.F32	S0, S0, S1
MOVW	R0, #lo_addr(_bi+16)
MOVT	R0, #hi_addr(_bi+16)
VSTR	#1, S0, [R0, #0]
;parameter_normal.h,297 :: 		ti[5] = 97 * sqrt(modFactor);
MOV	R0, R1
VLDR	#1, S0, [R0, #0]
BL	_sqrt+0
MOVW	R0, #0
MOVT	R0, #17090
VMOV	S1, R0
VMUL.F32	S0, S1, S0
MOVW	R0, #lo_addr(_ti+20)
MOVT	R0, #hi_addr(_ti+20)
VSTR	#1, S0, [R0, #0]
;parameter_normal.h,298 :: 		ai[5] = 1 * ((modFactor * modFactor)*sqrt(modFactor)) * 18;
MOVW	R1, #lo_addr(_modFactor+0)
MOVT	R1, #hi_addr(_modFactor+0)
VLDR	#1, S1, [R1, #0]
MOV	R0, R1
VLDR	#1, S0, [R0, #0]
VMUL.F32	S0, S0, S1
VSTR	#1, S0, [SP, #4]
MOV	R0, R1
VLDR	#1, S0, [R0, #0]
BL	_sqrt+0
VLDR	#1, S1, [SP, #4]
VMUL.F32	S1, S1, S0
VMOV.F32	S0, #18
VMUL.F32	S0, S1, S0
MOVW	R0, #lo_addr(_ai+20)
MOVT	R0, #hi_addr(_ai+20)
VSTR	#1, S0, [R0, #0]
;parameter_normal.h,299 :: 		bi[5] = 0.4 / modFactor;
MOVW	R1, #lo_addr(_modFactor+0)
MOVT	R1, #hi_addr(_modFactor+0)
VLDR	#1, S1, [R1, #0]
MOVW	R0, #52429
MOVT	R0, #16076
VMOV	S0, R0
VDIV.F32	S0, S0, S1
MOVW	R0, #lo_addr(_bi+20)
MOVT	R0, #hi_addr(_bi+20)
VSTR	#1, S0, [R0, #0]
;parameter_normal.h,300 :: 		ti[6] = 100 * sqrt(modFactor);
MOV	R0, R1
VLDR	#1, S0, [R0, #0]
BL	_sqrt+0
MOVW	R0, #0
MOVT	R0, #17096
VMOV	S1, R0
VMUL.F32	S0, S1, S0
MOVW	R0, #lo_addr(_ti+24)
MOVT	R0, #hi_addr(_ti+24)
VSTR	#1, S0, [R0, #0]
;parameter_normal.h,301 :: 		ai[6] = 2 *((modFactor * modFactor)*sqrt(modFactor)) * 18;
MOVW	R1, #lo_addr(_modFactor+0)
MOVT	R1, #hi_addr(_modFactor+0)
VLDR	#1, S1, [R1, #0]
MOV	R0, R1
VLDR	#1, S0, [R0, #0]
VMUL.F32	S0, S0, S1
VSTR	#1, S0, [SP, #4]
MOV	R0, R1
VLDR	#1, S0, [R0, #0]
BL	_sqrt+0
VLDR	#1, S1, [SP, #4]
VMUL.F32	S1, S1, S0
VMOV.F32	S0, #2
VMUL.F32	S1, S0, S1
VMOV.F32	S0, #18
VMUL.F32	S0, S1, S0
MOVW	R0, #lo_addr(_ai+24)
MOVT	R0, #hi_addr(_ai+24)
VSTR	#1, S0, [R0, #0]
;parameter_normal.h,302 :: 		bi[6] = 0.2 * modFactor;
MOVW	R0, #lo_addr(_modFactor+0)
MOVT	R0, #hi_addr(_modFactor+0)
VLDR	#1, S1, [R0, #0]
MOVW	R0, #52429
MOVT	R0, #15948
VMOV	S0, R0
VMUL.F32	S0, S0, S1
MOVW	R0, #lo_addr(_bi+24)
MOVT	R0, #hi_addr(_bi+24)
VSTR	#1, S0, [R0, #0]
;parameter_normal.h,305 :: 		for (i = 1; i <= 6; i++)
; i start address is: 12 (R3)
MOVS	R3, #1
SXTH	R3, R3
; i end address is: 12 (R3)
L_normalV448:
; i start address is: 12 (R3)
CMP	R3, #6
IT	GT
BGT	L_normalV449
;parameter_normal.h,307 :: 		ti[i] = ti[i] * (pi / 180.0); // konversi ke radian
LSLS	R1, R3, #2
MOVW	R0, #lo_addr(_ti+0)
MOVT	R0, #hi_addr(_ti+0)
ADDS	R2, R0, R1
VLDR	#1, S1, [R2, #0]
MOVW	R0, #64053
MOVT	R0, #15502
VMOV	S0, R0
VMUL.F32	S0, S1, S0
VSTR	#1, S0, [R2, #0]
;parameter_normal.h,305 :: 		for (i = 1; i <= 6; i++)
ADDS	R3, R3, #1
SXTH	R3, R3
;parameter_normal.h,308 :: 		}
; i end address is: 12 (R3)
IT	AL
BAL	L_normalV448
L_normalV449:
;parameter_normal.h,309 :: 		}
L_end_normalV4:
LDR	LR, [SP, #0]
ADD	SP, SP, #8
BX	LR
; end of _normalV4
_normalV5:
;parameter_normal.h,311 :: 		void normalV5()
SUB	SP, SP, #8
STR	LR, [SP, #0]
;parameter_normal.h,314 :: 		modFactor = sqrt((float)hmean / 60.0);
MOVW	R0, #lo_addr(_hmean+0)
MOVT	R0, #hi_addr(_hmean+0)
VLDR	#1, S1, [R0, #0]
MOVW	R0, #0
MOVT	R0, #17008
VMOV	S0, R0
VDIV.F32	S0, S1, S0
BL	_sqrt+0
MOVW	R0, #lo_addr(_modFactor+0)
MOVT	R0, #hi_addr(_modFactor+0)
VSTR	#1, S0, [R0, #0]
;parameter_normal.h,316 :: 		ti[1] = -60 * sqrt(modFactor);
VMOV.F32	S0, S0
BL	_sqrt+0
MOVW	R0, #0
MOVT	R0, #49776
VMOV	S1, R0
VMUL.F32	S0, S1, S0
MOVW	R0, #lo_addr(_ti+4)
MOVT	R0, #hi_addr(_ti+4)
VSTR	#1, S0, [R0, #0]
;parameter_normal.h,317 :: 		ai[1] = 0.8 * 18;
MOVW	R0, #26215
MOVT	R0, #16742
VMOV	S0, R0
MOVW	R0, #lo_addr(_ai+4)
MOVT	R0, #hi_addr(_ai+4)
VSTR	#1, S0, [R0, #0]
;parameter_normal.h,318 :: 		bi[1] = 0.2 * modFactor;
MOVW	R1, #lo_addr(_modFactor+0)
MOVT	R1, #hi_addr(_modFactor+0)
VLDR	#1, S1, [R1, #0]
MOVW	R0, #52429
MOVT	R0, #15948
VMOV	S0, R0
VMUL.F32	S0, S0, S1
MOVW	R0, #lo_addr(_bi+4)
MOVT	R0, #hi_addr(_bi+4)
VSTR	#1, S0, [R0, #0]
;parameter_normal.h,319 :: 		ti[2] = -15 * modFactor;
MOV	R0, R1
VLDR	#1, S1, [R0, #0]
VMOV.F32	S0, #-15
VMUL.F32	S0, S0, S1
MOVW	R0, #lo_addr(_ti+8)
MOVT	R0, #hi_addr(_ti+8)
VSTR	#1, S0, [R0, #0]
;parameter_normal.h,320 :: 		ai[2] = -5 * 18;
MOVW	R0, #0
MOVT	R0, #49844
VMOV	S0, R0
MOVW	R0, #lo_addr(_ai+8)
MOVT	R0, #hi_addr(_ai+8)
VSTR	#1, S0, [R0, #0]
;parameter_normal.h,321 :: 		bi[2] = 0.1 * modFactor;
MOV	R0, R1
VLDR	#1, S1, [R0, #0]
MOVW	R0, #52429
MOVT	R0, #15820
VMOV	S0, R0
VMUL.F32	S0, S0, S1
MOVW	R0, #lo_addr(_bi+8)
MOVT	R0, #hi_addr(_bi+8)
VSTR	#1, S0, [R0, #0]
;parameter_normal.h,322 :: 		ti[3] = 0;
MOV	R0, #0
VMOV	S0, R0
MOVW	R0, #lo_addr(_ti+12)
MOVT	R0, #hi_addr(_ti+12)
VSTR	#1, S0, [R0, #0]
;parameter_normal.h,323 :: 		ai[3] = 48.75 * 18;
MOVW	R0, #24576
MOVT	R0, #17499
VMOV	S0, R0
MOVW	R0, #lo_addr(_ai+12)
MOVT	R0, #hi_addr(_ai+12)
VSTR	#1, S0, [R0, #0]
;parameter_normal.h,324 :: 		bi[3] = 0.1 * modFactor;
MOV	R0, R1
VLDR	#1, S1, [R0, #0]
MOVW	R0, #52429
MOVT	R0, #15820
VMOV	S0, R0
VMUL.F32	S0, S0, S1
MOVW	R0, #lo_addr(_bi+12)
MOVT	R0, #hi_addr(_bi+12)
VSTR	#1, S0, [R0, #0]
;parameter_normal.h,325 :: 		ti[4] = 15 * modFactor;
MOV	R0, R1
VLDR	#1, S1, [R0, #0]
VMOV.F32	S0, #15
VMUL.F32	S0, S0, S1
MOVW	R0, #lo_addr(_ti+16)
MOVT	R0, #hi_addr(_ti+16)
VSTR	#1, S0, [R0, #0]
;parameter_normal.h,326 :: 		ai[4] = -5 * 18;
MOVW	R0, #0
MOVT	R0, #49844
VMOV	S0, R0
MOVW	R0, #lo_addr(_ai+16)
MOVT	R0, #hi_addr(_ai+16)
VSTR	#1, S0, [R0, #0]
;parameter_normal.h,327 :: 		bi[4] = 0.1 * modFactor;
MOV	R0, R1
VLDR	#1, S1, [R0, #0]
MOVW	R0, #52429
MOVT	R0, #15820
VMOV	S0, R0
VMUL.F32	S0, S0, S1
MOVW	R0, #lo_addr(_bi+16)
MOVT	R0, #hi_addr(_bi+16)
VSTR	#1, S0, [R0, #0]
;parameter_normal.h,328 :: 		ti[5] = 97 * sqrt(modFactor);
MOV	R0, R1
VLDR	#1, S0, [R0, #0]
BL	_sqrt+0
MOVW	R0, #0
MOVT	R0, #17090
VMOV	S1, R0
VMUL.F32	S0, S1, S0
MOVW	R0, #lo_addr(_ti+20)
MOVT	R0, #hi_addr(_ti+20)
VSTR	#1, S0, [R0, #0]
;parameter_normal.h,329 :: 		ai[5] = 1 * ((modFactor * modFactor)*sqrt(modFactor)) * 18;
MOVW	R1, #lo_addr(_modFactor+0)
MOVT	R1, #hi_addr(_modFactor+0)
VLDR	#1, S1, [R1, #0]
MOV	R0, R1
VLDR	#1, S0, [R0, #0]
VMUL.F32	S0, S0, S1
VSTR	#1, S0, [SP, #4]
MOV	R0, R1
VLDR	#1, S0, [R0, #0]
BL	_sqrt+0
VLDR	#1, S1, [SP, #4]
VMUL.F32	S1, S1, S0
VMOV.F32	S0, #18
VMUL.F32	S0, S1, S0
MOVW	R0, #lo_addr(_ai+20)
MOVT	R0, #hi_addr(_ai+20)
VSTR	#1, S0, [R0, #0]
;parameter_normal.h,330 :: 		bi[5] = 0.4 / modFactor;
MOVW	R1, #lo_addr(_modFactor+0)
MOVT	R1, #hi_addr(_modFactor+0)
VLDR	#1, S1, [R1, #0]
MOVW	R0, #52429
MOVT	R0, #16076
VMOV	S0, R0
VDIV.F32	S0, S0, S1
MOVW	R0, #lo_addr(_bi+20)
MOVT	R0, #hi_addr(_bi+20)
VSTR	#1, S0, [R0, #0]
;parameter_normal.h,331 :: 		ti[6] = 100 * sqrt(modFactor);
MOV	R0, R1
VLDR	#1, S0, [R0, #0]
BL	_sqrt+0
MOVW	R0, #0
MOVT	R0, #17096
VMOV	S1, R0
VMUL.F32	S0, S1, S0
MOVW	R0, #lo_addr(_ti+24)
MOVT	R0, #hi_addr(_ti+24)
VSTR	#1, S0, [R0, #0]
;parameter_normal.h,332 :: 		ai[6] = 1.5 *((modFactor * modFactor)*sqrt(modFactor)) * 18;
MOVW	R1, #lo_addr(_modFactor+0)
MOVT	R1, #hi_addr(_modFactor+0)
VLDR	#1, S1, [R1, #0]
MOV	R0, R1
VLDR	#1, S0, [R0, #0]
VMUL.F32	S0, S0, S1
VSTR	#1, S0, [SP, #4]
MOV	R0, R1
VLDR	#1, S0, [R0, #0]
BL	_sqrt+0
VLDR	#1, S1, [SP, #4]
VMUL.F32	S1, S1, S0
VMOV.F32	S0, #1.5
VMUL.F32	S1, S0, S1
VMOV.F32	S0, #18
VMUL.F32	S0, S1, S0
MOVW	R0, #lo_addr(_ai+24)
MOVT	R0, #hi_addr(_ai+24)
VSTR	#1, S0, [R0, #0]
;parameter_normal.h,333 :: 		bi[6] = 0.2 * modFactor;
MOVW	R0, #lo_addr(_modFactor+0)
MOVT	R0, #hi_addr(_modFactor+0)
VLDR	#1, S1, [R0, #0]
MOVW	R0, #52429
MOVT	R0, #15948
VMOV	S0, R0
VMUL.F32	S0, S0, S1
MOVW	R0, #lo_addr(_bi+24)
MOVT	R0, #hi_addr(_bi+24)
VSTR	#1, S0, [R0, #0]
;parameter_normal.h,336 :: 		for (i = 1; i <= 6; i++)
; i start address is: 12 (R3)
MOVS	R3, #1
SXTH	R3, R3
; i end address is: 12 (R3)
L_normalV551:
; i start address is: 12 (R3)
CMP	R3, #6
IT	GT
BGT	L_normalV552
;parameter_normal.h,338 :: 		ti[i] = ti[i] * (pi / 180.0); // konversi ke radian
LSLS	R1, R3, #2
MOVW	R0, #lo_addr(_ti+0)
MOVT	R0, #hi_addr(_ti+0)
ADDS	R2, R0, R1
VLDR	#1, S1, [R2, #0]
MOVW	R0, #64053
MOVT	R0, #15502
VMOV	S0, R0
VMUL.F32	S0, S1, S0
VSTR	#1, S0, [R2, #0]
;parameter_normal.h,336 :: 		for (i = 1; i <= 6; i++)
ADDS	R3, R3, #1
SXTH	R3, R3
;parameter_normal.h,339 :: 		}
; i end address is: 12 (R3)
IT	AL
BAL	L_normalV551
L_normalV552:
;parameter_normal.h,340 :: 		}
L_end_normalV5:
LDR	LR, [SP, #0]
ADD	SP, SP, #8
BX	LR
; end of _normalV5
_normalV6:
;parameter_normal.h,342 :: 		void normalV6()
SUB	SP, SP, #8
STR	LR, [SP, #0]
;parameter_normal.h,345 :: 		modFactor = sqrt((float)hmean / 60.0);
MOVW	R0, #lo_addr(_hmean+0)
MOVT	R0, #hi_addr(_hmean+0)
VLDR	#1, S1, [R0, #0]
MOVW	R0, #0
MOVT	R0, #17008
VMOV	S0, R0
VDIV.F32	S0, S1, S0
BL	_sqrt+0
MOVW	R0, #lo_addr(_modFactor+0)
MOVT	R0, #hi_addr(_modFactor+0)
VSTR	#1, S0, [R0, #0]
;parameter_normal.h,347 :: 		ti[1] = -60 * sqrt(modFactor);
VMOV.F32	S0, S0
BL	_sqrt+0
MOVW	R0, #0
MOVT	R0, #49776
VMOV	S1, R0
VMUL.F32	S0, S1, S0
MOVW	R0, #lo_addr(_ti+4)
MOVT	R0, #hi_addr(_ti+4)
VSTR	#1, S0, [R0, #0]
;parameter_normal.h,348 :: 		ai[1] = 0.8 * 18;
MOVW	R0, #26215
MOVT	R0, #16742
VMOV	S0, R0
MOVW	R0, #lo_addr(_ai+4)
MOVT	R0, #hi_addr(_ai+4)
VSTR	#1, S0, [R0, #0]
;parameter_normal.h,349 :: 		bi[1] = 0.2 * modFactor;
MOVW	R1, #lo_addr(_modFactor+0)
MOVT	R1, #hi_addr(_modFactor+0)
VLDR	#1, S1, [R1, #0]
MOVW	R0, #52429
MOVT	R0, #15948
VMOV	S0, R0
VMUL.F32	S0, S0, S1
MOVW	R0, #lo_addr(_bi+4)
MOVT	R0, #hi_addr(_bi+4)
VSTR	#1, S0, [R0, #0]
;parameter_normal.h,350 :: 		ti[2] = -15 * modFactor;
MOV	R0, R1
VLDR	#1, S1, [R0, #0]
VMOV.F32	S0, #-15
VMUL.F32	S0, S0, S1
MOVW	R0, #lo_addr(_ti+8)
MOVT	R0, #hi_addr(_ti+8)
VSTR	#1, S0, [R0, #0]
;parameter_normal.h,351 :: 		ai[2] = -5 * 18;
MOVW	R0, #0
MOVT	R0, #49844
VMOV	S0, R0
MOVW	R0, #lo_addr(_ai+8)
MOVT	R0, #hi_addr(_ai+8)
VSTR	#1, S0, [R0, #0]
;parameter_normal.h,352 :: 		bi[2] = 0.1 * modFactor;
MOV	R0, R1
VLDR	#1, S1, [R0, #0]
MOVW	R0, #52429
MOVT	R0, #15820
VMOV	S0, R0
VMUL.F32	S0, S0, S1
MOVW	R0, #lo_addr(_bi+8)
MOVT	R0, #hi_addr(_bi+8)
VSTR	#1, S0, [R0, #0]
;parameter_normal.h,353 :: 		ti[3] = 0;
MOV	R0, #0
VMOV	S0, R0
MOVW	R0, #lo_addr(_ti+12)
MOVT	R0, #hi_addr(_ti+12)
VSTR	#1, S0, [R0, #0]
;parameter_normal.h,354 :: 		ai[3] = 45 * 18;
MOVW	R0, #32768
MOVT	R0, #17482
VMOV	S0, R0
MOVW	R0, #lo_addr(_ai+12)
MOVT	R0, #hi_addr(_ai+12)
VSTR	#1, S0, [R0, #0]
;parameter_normal.h,355 :: 		bi[3] = 0.1 * modFactor;
MOV	R0, R1
VLDR	#1, S1, [R0, #0]
MOVW	R0, #52429
MOVT	R0, #15820
VMOV	S0, R0
VMUL.F32	S0, S0, S1
MOVW	R0, #lo_addr(_bi+12)
MOVT	R0, #hi_addr(_bi+12)
VSTR	#1, S0, [R0, #0]
;parameter_normal.h,356 :: 		ti[4] = 15 * modFactor;
MOV	R0, R1
VLDR	#1, S1, [R0, #0]
VMOV.F32	S0, #15
VMUL.F32	S0, S0, S1
MOVW	R0, #lo_addr(_ti+16)
MOVT	R0, #hi_addr(_ti+16)
VSTR	#1, S0, [R0, #0]
;parameter_normal.h,357 :: 		ai[4] = 0.5 * 18;
VMOV.F32	S0, #9
MOVW	R0, #lo_addr(_ai+16)
MOVT	R0, #hi_addr(_ai+16)
VSTR	#1, S0, [R0, #0]
;parameter_normal.h,358 :: 		bi[4] = 0.1 * modFactor;
MOV	R0, R1
VLDR	#1, S1, [R0, #0]
MOVW	R0, #52429
MOVT	R0, #15820
VMOV	S0, R0
VMUL.F32	S0, S0, S1
MOVW	R0, #lo_addr(_bi+16)
MOVT	R0, #hi_addr(_bi+16)
VSTR	#1, S0, [R0, #0]
;parameter_normal.h,359 :: 		ti[5] = 97 * sqrt(modFactor);
MOV	R0, R1
VLDR	#1, S0, [R0, #0]
BL	_sqrt+0
MOVW	R0, #0
MOVT	R0, #17090
VMOV	S1, R0
VMUL.F32	S0, S1, S0
MOVW	R0, #lo_addr(_ti+20)
MOVT	R0, #hi_addr(_ti+20)
VSTR	#1, S0, [R0, #0]
;parameter_normal.h,360 :: 		ai[5] = 0.8 * ((modFactor * modFactor)*sqrt(modFactor)) * 18;
MOVW	R1, #lo_addr(_modFactor+0)
MOVT	R1, #hi_addr(_modFactor+0)
VLDR	#1, S1, [R1, #0]
MOV	R0, R1
VLDR	#1, S0, [R0, #0]
VMUL.F32	S0, S0, S1
VSTR	#1, S0, [SP, #4]
MOV	R0, R1
VLDR	#1, S0, [R0, #0]
BL	_sqrt+0
VLDR	#1, S1, [SP, #4]
VMUL.F32	S1, S1, S0
MOVW	R0, #52429
MOVT	R0, #16204
VMOV	S0, R0
VMUL.F32	S1, S0, S1
VMOV.F32	S0, #18
VMUL.F32	S0, S1, S0
MOVW	R0, #lo_addr(_ai+20)
MOVT	R0, #hi_addr(_ai+20)
VSTR	#1, S0, [R0, #0]
;parameter_normal.h,361 :: 		bi[5] = 0.4 / modFactor;
MOVW	R1, #lo_addr(_modFactor+0)
MOVT	R1, #hi_addr(_modFactor+0)
VLDR	#1, S1, [R1, #0]
MOVW	R0, #52429
MOVT	R0, #16076
VMOV	S0, R0
VDIV.F32	S0, S0, S1
MOVW	R0, #lo_addr(_bi+20)
MOVT	R0, #hi_addr(_bi+20)
VSTR	#1, S0, [R0, #0]
;parameter_normal.h,362 :: 		ti[6] = 100 * sqrt(modFactor);
MOV	R0, R1
VLDR	#1, S0, [R0, #0]
BL	_sqrt+0
MOVW	R0, #0
MOVT	R0, #17096
VMOV	S1, R0
VMUL.F32	S0, S1, S0
MOVW	R0, #lo_addr(_ti+24)
MOVT	R0, #hi_addr(_ti+24)
VSTR	#1, S0, [R0, #0]
;parameter_normal.h,363 :: 		ai[6] = 0.9 *((modFactor * modFactor)*sqrt(modFactor)) * 18;
MOVW	R1, #lo_addr(_modFactor+0)
MOVT	R1, #hi_addr(_modFactor+0)
VLDR	#1, S1, [R1, #0]
MOV	R0, R1
VLDR	#1, S0, [R0, #0]
VMUL.F32	S0, S0, S1
VSTR	#1, S0, [SP, #4]
MOV	R0, R1
VLDR	#1, S0, [R0, #0]
BL	_sqrt+0
VLDR	#1, S1, [SP, #4]
VMUL.F32	S1, S1, S0
MOVW	R0, #26214
MOVT	R0, #16230
VMOV	S0, R0
VMUL.F32	S1, S0, S1
VMOV.F32	S0, #18
VMUL.F32	S0, S1, S0
MOVW	R0, #lo_addr(_ai+24)
MOVT	R0, #hi_addr(_ai+24)
VSTR	#1, S0, [R0, #0]
;parameter_normal.h,364 :: 		bi[6] = 0.2 * modFactor;
MOVW	R0, #lo_addr(_modFactor+0)
MOVT	R0, #hi_addr(_modFactor+0)
VLDR	#1, S1, [R0, #0]
MOVW	R0, #52429
MOVT	R0, #15948
VMOV	S0, R0
VMUL.F32	S0, S0, S1
MOVW	R0, #lo_addr(_bi+24)
MOVT	R0, #hi_addr(_bi+24)
VSTR	#1, S0, [R0, #0]
;parameter_normal.h,367 :: 		for (i = 1; i <= 6; i++)
; i start address is: 12 (R3)
MOVS	R3, #1
SXTH	R3, R3
; i end address is: 12 (R3)
L_normalV654:
; i start address is: 12 (R3)
CMP	R3, #6
IT	GT
BGT	L_normalV655
;parameter_normal.h,369 :: 		ti[i] = ti[i] * (pi / 180.0); // konversi ke radian
LSLS	R1, R3, #2
MOVW	R0, #lo_addr(_ti+0)
MOVT	R0, #hi_addr(_ti+0)
ADDS	R2, R0, R1
VLDR	#1, S1, [R2, #0]
MOVW	R0, #64053
MOVT	R0, #15502
VMOV	S0, R0
VMUL.F32	S0, S1, S0
VSTR	#1, S0, [R2, #0]
;parameter_normal.h,367 :: 		for (i = 1; i <= 6; i++)
ADDS	R3, R3, #1
SXTH	R3, R3
;parameter_normal.h,370 :: 		}
; i end address is: 12 (R3)
IT	AL
BAL	L_normalV654
L_normalV655:
;parameter_normal.h,371 :: 		}
L_end_normalV6:
LDR	LR, [SP, #0]
ADD	SP, SP, #8
BX	LR
; end of _normalV6
_anterior1:
;parameter_anterior.h,1 :: 		void anterior1()
SUB	SP, SP, #8
STR	LR, [SP, #0]
;parameter_anterior.h,4 :: 		modFactor = sqrt((float)hmean / 60.0);
MOVW	R0, #lo_addr(_hmean+0)
MOVT	R0, #hi_addr(_hmean+0)
VLDR	#1, S1, [R0, #0]
MOVW	R0, #0
MOVT	R0, #17008
VMOV	S0, R0
VDIV.F32	S0, S1, S0
BL	_sqrt+0
MOVW	R0, #lo_addr(_modFactor+0)
MOVT	R0, #hi_addr(_modFactor+0)
VSTR	#1, S0, [R0, #0]
;parameter_anterior.h,6 :: 		ti[1] = -60 * sqrt(modFactor);
VMOV.F32	S0, S0
BL	_sqrt+0
MOVW	R0, #0
MOVT	R0, #49776
VMOV	S1, R0
VMUL.F32	S0, S1, S0
MOVW	R0, #lo_addr(_ti+4)
MOVT	R0, #hi_addr(_ti+4)
VSTR	#1, S0, [R0, #0]
;parameter_anterior.h,7 :: 		ai[1] = 0.8 * 18;
MOVW	R0, #26215
MOVT	R0, #16742
VMOV	S0, R0
MOVW	R0, #lo_addr(_ai+4)
MOVT	R0, #hi_addr(_ai+4)
VSTR	#1, S0, [R0, #0]
;parameter_anterior.h,8 :: 		bi[1] = 0.2 * modFactor;
MOVW	R1, #lo_addr(_modFactor+0)
MOVT	R1, #hi_addr(_modFactor+0)
VLDR	#1, S1, [R1, #0]
MOVW	R0, #52429
MOVT	R0, #15948
VMOV	S0, R0
VMUL.F32	S0, S0, S1
MOVW	R0, #lo_addr(_bi+4)
MOVT	R0, #hi_addr(_bi+4)
VSTR	#1, S0, [R0, #0]
;parameter_anterior.h,9 :: 		ti[2] = -15 * modFactor;
MOV	R0, R1
VLDR	#1, S1, [R0, #0]
VMOV.F32	S0, #-15
VMUL.F32	S0, S0, S1
MOVW	R0, #lo_addr(_ti+8)
MOVT	R0, #hi_addr(_ti+8)
VSTR	#1, S0, [R0, #0]
;parameter_anterior.h,10 :: 		ai[2] = -5 * 18;
MOVW	R0, #0
MOVT	R0, #49844
VMOV	S0, R0
MOVW	R0, #lo_addr(_ai+8)
MOVT	R0, #hi_addr(_ai+8)
VSTR	#1, S0, [R0, #0]
;parameter_anterior.h,11 :: 		bi[2] = 0.1 * modFactor;
MOV	R0, R1
VLDR	#1, S1, [R0, #0]
MOVW	R0, #52429
MOVT	R0, #15820
VMOV	S0, R0
VMUL.F32	S0, S0, S1
MOVW	R0, #lo_addr(_bi+8)
MOVT	R0, #hi_addr(_bi+8)
VSTR	#1, S0, [R0, #0]
;parameter_anterior.h,12 :: 		ti[3] = 0;
MOV	R0, #0
VMOV	S0, R0
MOVW	R0, #lo_addr(_ti+12)
MOVT	R0, #hi_addr(_ti+12)
VSTR	#1, S0, [R0, #0]
;parameter_anterior.h,13 :: 		ai[3] = 30 * 18;
MOVW	R0, #0
MOVT	R0, #17415
VMOV	S0, R0
MOVW	R0, #lo_addr(_ai+12)
MOVT	R0, #hi_addr(_ai+12)
VSTR	#1, S0, [R0, #0]
;parameter_anterior.h,14 :: 		bi[3] = 0.1 * modFactor;
MOV	R0, R1
VLDR	#1, S1, [R0, #0]
MOVW	R0, #52429
MOVT	R0, #15820
VMOV	S0, R0
VMUL.F32	S0, S0, S1
MOVW	R0, #lo_addr(_bi+12)
MOVT	R0, #hi_addr(_bi+12)
VSTR	#1, S0, [R0, #0]
;parameter_anterior.h,15 :: 		ti[4] = 15 * modFactor;
MOV	R0, R1
VLDR	#1, S1, [R0, #0]
VMOV.F32	S0, #15
VMUL.F32	S0, S0, S1
MOVW	R0, #lo_addr(_ti+16)
MOVT	R0, #hi_addr(_ti+16)
VSTR	#1, S0, [R0, #0]
;parameter_anterior.h,16 :: 		ai[4] = -7.5 * 18;
MOVW	R0, #0
MOVT	R0, #49927
VMOV	S0, R0
MOVW	R0, #lo_addr(_ai+16)
MOVT	R0, #hi_addr(_ai+16)
VSTR	#1, S0, [R0, #0]
;parameter_anterior.h,17 :: 		bi[4] = 0.1 * modFactor;
MOV	R0, R1
VLDR	#1, S1, [R0, #0]
MOVW	R0, #52429
MOVT	R0, #15820
VMOV	S0, R0
VMUL.F32	S0, S0, S1
MOVW	R0, #lo_addr(_bi+16)
MOVT	R0, #hi_addr(_bi+16)
VSTR	#1, S0, [R0, #0]
;parameter_anterior.h,18 :: 		ti[5] = 97 * sqrt(modFactor);
MOV	R0, R1
VLDR	#1, S0, [R0, #0]
BL	_sqrt+0
MOVW	R0, #0
MOVT	R0, #17090
VMOV	S1, R0
VMUL.F32	S0, S1, S0
MOVW	R0, #lo_addr(_ti+20)
MOVT	R0, #hi_addr(_ti+20)
VSTR	#1, S0, [R0, #0]
;parameter_anterior.h,19 :: 		ai[5] = 0.5 * ((modFactor * modFactor)*sqrt(modFactor)) * 18;
MOVW	R1, #lo_addr(_modFactor+0)
MOVT	R1, #hi_addr(_modFactor+0)
VLDR	#1, S1, [R1, #0]
MOV	R0, R1
VLDR	#1, S0, [R0, #0]
VMUL.F32	S0, S0, S1
VSTR	#1, S0, [SP, #4]
MOV	R0, R1
VLDR	#1, S0, [R0, #0]
BL	_sqrt+0
VLDR	#1, S1, [SP, #4]
VMUL.F32	S1, S1, S0
VMOV.F32	S0, #0.5
VMUL.F32	S1, S0, S1
VMOV.F32	S0, #18
VMUL.F32	S0, S1, S0
MOVW	R0, #lo_addr(_ai+20)
MOVT	R0, #hi_addr(_ai+20)
VSTR	#1, S0, [R0, #0]
;parameter_anterior.h,20 :: 		bi[5] = 0.4 / modFactor;
MOVW	R1, #lo_addr(_modFactor+0)
MOVT	R1, #hi_addr(_modFactor+0)
VLDR	#1, S1, [R1, #0]
MOVW	R0, #52429
MOVT	R0, #16076
VMOV	S0, R0
VDIV.F32	S0, S0, S1
MOVW	R0, #lo_addr(_bi+20)
MOVT	R0, #hi_addr(_bi+20)
VSTR	#1, S0, [R0, #0]
;parameter_anterior.h,21 :: 		ti[6] = 100 * sqrt(modFactor);
MOV	R0, R1
VLDR	#1, S0, [R0, #0]
BL	_sqrt+0
MOVW	R0, #0
MOVT	R0, #17096
VMOV	S1, R0
VMUL.F32	S0, S1, S0
MOVW	R0, #lo_addr(_ti+24)
MOVT	R0, #hi_addr(_ti+24)
VSTR	#1, S0, [R0, #0]
;parameter_anterior.h,22 :: 		ai[6] = 0.75 *((modFactor * modFactor)*sqrt(modFactor)) * 18;
MOVW	R1, #lo_addr(_modFactor+0)
MOVT	R1, #hi_addr(_modFactor+0)
VLDR	#1, S1, [R1, #0]
MOV	R0, R1
VLDR	#1, S0, [R0, #0]
VMUL.F32	S0, S0, S1
VSTR	#1, S0, [SP, #4]
MOV	R0, R1
VLDR	#1, S0, [R0, #0]
BL	_sqrt+0
VLDR	#1, S1, [SP, #4]
VMUL.F32	S1, S1, S0
VMOV.F32	S0, #0.75
VMUL.F32	S1, S0, S1
VMOV.F32	S0, #18
VMUL.F32	S0, S1, S0
MOVW	R0, #lo_addr(_ai+24)
MOVT	R0, #hi_addr(_ai+24)
VSTR	#1, S0, [R0, #0]
;parameter_anterior.h,23 :: 		bi[6] = 0.2 * modFactor;
MOVW	R0, #lo_addr(_modFactor+0)
MOVT	R0, #hi_addr(_modFactor+0)
VLDR	#1, S1, [R0, #0]
MOVW	R0, #52429
MOVT	R0, #15948
VMOV	S0, R0
VMUL.F32	S0, S0, S1
MOVW	R0, #lo_addr(_bi+24)
MOVT	R0, #hi_addr(_bi+24)
VSTR	#1, S0, [R0, #0]
;parameter_anterior.h,26 :: 		for (i = 1; i <= 6; i++)
; i start address is: 12 (R3)
MOVS	R3, #1
SXTH	R3, R3
; i end address is: 12 (R3)
L_anterior157:
; i start address is: 12 (R3)
CMP	R3, #6
IT	GT
BGT	L_anterior158
;parameter_anterior.h,28 :: 		ti[i] = ti[i] * (pi / 180.0); // konversi ke radian
LSLS	R1, R3, #2
MOVW	R0, #lo_addr(_ti+0)
MOVT	R0, #hi_addr(_ti+0)
ADDS	R2, R0, R1
VLDR	#1, S1, [R2, #0]
MOVW	R0, #64053
MOVT	R0, #15502
VMOV	S0, R0
VMUL.F32	S0, S1, S0
VSTR	#1, S0, [R2, #0]
;parameter_anterior.h,26 :: 		for (i = 1; i <= 6; i++)
ADDS	R3, R3, #1
SXTH	R3, R3
;parameter_anterior.h,29 :: 		}
; i end address is: 12 (R3)
IT	AL
BAL	L_anterior157
L_anterior158:
;parameter_anterior.h,30 :: 		}
L_end_anterior1:
LDR	LR, [SP, #0]
ADD	SP, SP, #8
BX	LR
; end of _anterior1
_anterior2:
;parameter_anterior.h,32 :: 		void anterior2()
SUB	SP, SP, #8
STR	LR, [SP, #0]
;parameter_anterior.h,35 :: 		modFactor = sqrt((float)hmean / 60.0);
MOVW	R0, #lo_addr(_hmean+0)
MOVT	R0, #hi_addr(_hmean+0)
VLDR	#1, S1, [R0, #0]
MOVW	R0, #0
MOVT	R0, #17008
VMOV	S0, R0
VDIV.F32	S0, S1, S0
BL	_sqrt+0
MOVW	R0, #lo_addr(_modFactor+0)
MOVT	R0, #hi_addr(_modFactor+0)
VSTR	#1, S0, [R0, #0]
;parameter_anterior.h,37 :: 		ti[1] = -60 * sqrt(modFactor);
VMOV.F32	S0, S0
BL	_sqrt+0
MOVW	R0, #0
MOVT	R0, #49776
VMOV	S1, R0
VMUL.F32	S0, S1, S0
MOVW	R0, #lo_addr(_ti+4)
MOVT	R0, #hi_addr(_ti+4)
VSTR	#1, S0, [R0, #0]
;parameter_anterior.h,38 :: 		ai[1] = 0.8 * 18;
MOVW	R0, #26215
MOVT	R0, #16742
VMOV	S0, R0
MOVW	R0, #lo_addr(_ai+4)
MOVT	R0, #hi_addr(_ai+4)
VSTR	#1, S0, [R0, #0]
;parameter_anterior.h,39 :: 		bi[1] = 0.2 * modFactor;
MOVW	R1, #lo_addr(_modFactor+0)
MOVT	R1, #hi_addr(_modFactor+0)
VLDR	#1, S1, [R1, #0]
MOVW	R0, #52429
MOVT	R0, #15948
VMOV	S0, R0
VMUL.F32	S0, S0, S1
MOVW	R0, #lo_addr(_bi+4)
MOVT	R0, #hi_addr(_bi+4)
VSTR	#1, S0, [R0, #0]
;parameter_anterior.h,40 :: 		ti[2] = -15 * modFactor;
MOV	R0, R1
VLDR	#1, S1, [R0, #0]
VMOV.F32	S0, #-15
VMUL.F32	S0, S0, S1
MOVW	R0, #lo_addr(_ti+8)
MOVT	R0, #hi_addr(_ti+8)
VSTR	#1, S0, [R0, #0]
;parameter_anterior.h,41 :: 		ai[2] = 0.5 * 18;
VMOV.F32	S0, #9
MOVW	R0, #lo_addr(_ai+8)
MOVT	R0, #hi_addr(_ai+8)
VSTR	#1, S0, [R0, #0]
;parameter_anterior.h,42 :: 		bi[2] = 0.1 * modFactor;
MOV	R0, R1
VLDR	#1, S1, [R0, #0]
MOVW	R0, #52429
MOVT	R0, #15820
VMOV	S0, R0
VMUL.F32	S0, S0, S1
MOVW	R0, #lo_addr(_bi+8)
MOVT	R0, #hi_addr(_bi+8)
VSTR	#1, S0, [R0, #0]
;parameter_anterior.h,43 :: 		ti[3] = 0;
MOV	R0, #0
VMOV	S0, R0
MOVW	R0, #lo_addr(_ti+12)
MOVT	R0, #hi_addr(_ti+12)
VSTR	#1, S0, [R0, #0]
;parameter_anterior.h,44 :: 		ai[3] = 30 * 18;
MOVW	R0, #0
MOVT	R0, #17415
VMOV	S0, R0
MOVW	R0, #lo_addr(_ai+12)
MOVT	R0, #hi_addr(_ai+12)
VSTR	#1, S0, [R0, #0]
;parameter_anterior.h,45 :: 		bi[3] = 0.1 * modFactor;
MOV	R0, R1
VLDR	#1, S1, [R0, #0]
MOVW	R0, #52429
MOVT	R0, #15820
VMOV	S0, R0
VMUL.F32	S0, S0, S1
MOVW	R0, #lo_addr(_bi+12)
MOVT	R0, #hi_addr(_bi+12)
VSTR	#1, S0, [R0, #0]
;parameter_anterior.h,46 :: 		ti[4] = 15 * modFactor;
MOV	R0, R1
VLDR	#1, S1, [R0, #0]
VMOV.F32	S0, #15
VMUL.F32	S0, S0, S1
MOVW	R0, #lo_addr(_ti+16)
MOVT	R0, #hi_addr(_ti+16)
VSTR	#1, S0, [R0, #0]
;parameter_anterior.h,47 :: 		ai[4] = 0.5 * 18;
VMOV.F32	S0, #9
MOVW	R0, #lo_addr(_ai+16)
MOVT	R0, #hi_addr(_ai+16)
VSTR	#1, S0, [R0, #0]
;parameter_anterior.h,48 :: 		bi[4] = 0.1 * modFactor;
MOV	R0, R1
VLDR	#1, S1, [R0, #0]
MOVW	R0, #52429
MOVT	R0, #15820
VMOV	S0, R0
VMUL.F32	S0, S0, S1
MOVW	R0, #lo_addr(_bi+16)
MOVT	R0, #hi_addr(_bi+16)
VSTR	#1, S0, [R0, #0]
;parameter_anterior.h,49 :: 		ti[5] = 97 * sqrt(modFactor);
MOV	R0, R1
VLDR	#1, S0, [R0, #0]
BL	_sqrt+0
MOVW	R0, #0
MOVT	R0, #17090
VMOV	S1, R0
VMUL.F32	S0, S1, S0
MOVW	R0, #lo_addr(_ti+20)
MOVT	R0, #hi_addr(_ti+20)
VSTR	#1, S0, [R0, #0]
;parameter_anterior.h,50 :: 		ai[5] = 0.2 * ((modFactor * modFactor)*sqrt(modFactor)) * 18;
MOVW	R1, #lo_addr(_modFactor+0)
MOVT	R1, #hi_addr(_modFactor+0)
VLDR	#1, S1, [R1, #0]
MOV	R0, R1
VLDR	#1, S0, [R0, #0]
VMUL.F32	S0, S0, S1
VSTR	#1, S0, [SP, #4]
MOV	R0, R1
VLDR	#1, S0, [R0, #0]
BL	_sqrt+0
VLDR	#1, S1, [SP, #4]
VMUL.F32	S1, S1, S0
MOVW	R0, #52429
MOVT	R0, #15948
VMOV	S0, R0
VMUL.F32	S1, S0, S1
VMOV.F32	S0, #18
VMUL.F32	S0, S1, S0
MOVW	R0, #lo_addr(_ai+20)
MOVT	R0, #hi_addr(_ai+20)
VSTR	#1, S0, [R0, #0]
;parameter_anterior.h,51 :: 		bi[5] = 0.4 / modFactor;
MOVW	R1, #lo_addr(_modFactor+0)
MOVT	R1, #hi_addr(_modFactor+0)
VLDR	#1, S1, [R1, #0]
MOVW	R0, #52429
MOVT	R0, #16076
VMOV	S0, R0
VDIV.F32	S0, S0, S1
MOVW	R0, #lo_addr(_bi+20)
MOVT	R0, #hi_addr(_bi+20)
VSTR	#1, S0, [R0, #0]
;parameter_anterior.h,52 :: 		ti[6] = 100 * sqrt(modFactor);
MOV	R0, R1
VLDR	#1, S0, [R0, #0]
BL	_sqrt+0
MOVW	R0, #0
MOVT	R0, #17096
VMOV	S1, R0
VMUL.F32	S0, S1, S0
MOVW	R0, #lo_addr(_ti+24)
MOVT	R0, #hi_addr(_ti+24)
VSTR	#1, S0, [R0, #0]
;parameter_anterior.h,53 :: 		ai[6] = 0.3 *((modFactor * modFactor)*sqrt(modFactor)) * 18;
MOVW	R1, #lo_addr(_modFactor+0)
MOVT	R1, #hi_addr(_modFactor+0)
VLDR	#1, S1, [R1, #0]
MOV	R0, R1
VLDR	#1, S0, [R0, #0]
VMUL.F32	S0, S0, S1
VSTR	#1, S0, [SP, #4]
MOV	R0, R1
VLDR	#1, S0, [R0, #0]
BL	_sqrt+0
VLDR	#1, S1, [SP, #4]
VMUL.F32	S1, S1, S0
MOVW	R0, #39322
MOVT	R0, #16025
VMOV	S0, R0
VMUL.F32	S1, S0, S1
VMOV.F32	S0, #18
VMUL.F32	S0, S1, S0
MOVW	R0, #lo_addr(_ai+24)
MOVT	R0, #hi_addr(_ai+24)
VSTR	#1, S0, [R0, #0]
;parameter_anterior.h,54 :: 		bi[6] = 0.2 * modFactor;
MOVW	R0, #lo_addr(_modFactor+0)
MOVT	R0, #hi_addr(_modFactor+0)
VLDR	#1, S1, [R0, #0]
MOVW	R0, #52429
MOVT	R0, #15948
VMOV	S0, R0
VMUL.F32	S0, S0, S1
MOVW	R0, #lo_addr(_bi+24)
MOVT	R0, #hi_addr(_bi+24)
VSTR	#1, S0, [R0, #0]
;parameter_anterior.h,57 :: 		for (i = 1; i <= 6; i++)
; i start address is: 12 (R3)
MOVS	R3, #1
SXTH	R3, R3
; i end address is: 12 (R3)
L_anterior260:
; i start address is: 12 (R3)
CMP	R3, #6
IT	GT
BGT	L_anterior261
;parameter_anterior.h,59 :: 		ti[i] = ti[i] * (pi / 180.0); // konversi ke radian
LSLS	R1, R3, #2
MOVW	R0, #lo_addr(_ti+0)
MOVT	R0, #hi_addr(_ti+0)
ADDS	R2, R0, R1
VLDR	#1, S1, [R2, #0]
MOVW	R0, #64053
MOVT	R0, #15502
VMOV	S0, R0
VMUL.F32	S0, S1, S0
VSTR	#1, S0, [R2, #0]
;parameter_anterior.h,57 :: 		for (i = 1; i <= 6; i++)
ADDS	R3, R3, #1
SXTH	R3, R3
;parameter_anterior.h,60 :: 		}
; i end address is: 12 (R3)
IT	AL
BAL	L_anterior260
L_anterior261:
;parameter_anterior.h,61 :: 		}
L_end_anterior2:
LDR	LR, [SP, #0]
ADD	SP, SP, #8
BX	LR
; end of _anterior2
_anterior3:
;parameter_anterior.h,63 :: 		void anterior3()
SUB	SP, SP, #8
STR	LR, [SP, #0]
;parameter_anterior.h,66 :: 		modFactor = sqrt((float)hmean / 60.0);
MOVW	R0, #lo_addr(_hmean+0)
MOVT	R0, #hi_addr(_hmean+0)
VLDR	#1, S1, [R0, #0]
MOVW	R0, #0
MOVT	R0, #17008
VMOV	S0, R0
VDIV.F32	S0, S1, S0
BL	_sqrt+0
MOVW	R0, #lo_addr(_modFactor+0)
MOVT	R0, #hi_addr(_modFactor+0)
VSTR	#1, S0, [R0, #0]
;parameter_anterior.h,68 :: 		ti[1] = -60 * sqrt(modFactor);
VMOV.F32	S0, S0
BL	_sqrt+0
MOVW	R0, #0
MOVT	R0, #49776
VMOV	S1, R0
VMUL.F32	S0, S1, S0
MOVW	R0, #lo_addr(_ti+4)
MOVT	R0, #hi_addr(_ti+4)
VSTR	#1, S0, [R0, #0]
;parameter_anterior.h,69 :: 		ai[1] = 0.8 * 18;
MOVW	R0, #26215
MOVT	R0, #16742
VMOV	S0, R0
MOVW	R0, #lo_addr(_ai+4)
MOVT	R0, #hi_addr(_ai+4)
VSTR	#1, S0, [R0, #0]
;parameter_anterior.h,70 :: 		bi[1] = 0.2 * modFactor;
MOVW	R1, #lo_addr(_modFactor+0)
MOVT	R1, #hi_addr(_modFactor+0)
VLDR	#1, S1, [R1, #0]
MOVW	R0, #52429
MOVT	R0, #15948
VMOV	S0, R0
VMUL.F32	S0, S0, S1
MOVW	R0, #lo_addr(_bi+4)
MOVT	R0, #hi_addr(_bi+4)
VSTR	#1, S0, [R0, #0]
;parameter_anterior.h,71 :: 		ti[2] = -15 * modFactor;
MOV	R0, R1
VLDR	#1, S1, [R0, #0]
VMOV.F32	S0, #-15
VMUL.F32	S0, S0, S1
MOVW	R0, #lo_addr(_ti+8)
MOVT	R0, #hi_addr(_ti+8)
VSTR	#1, S0, [R0, #0]
;parameter_anterior.h,72 :: 		ai[2] = 9 * 18;
MOVW	R0, #0
MOVT	R0, #17186
VMOV	S0, R0
MOVW	R0, #lo_addr(_ai+8)
MOVT	R0, #hi_addr(_ai+8)
VSTR	#1, S0, [R0, #0]
;parameter_anterior.h,73 :: 		bi[2] = 0.1 * modFactor;
MOV	R0, R1
VLDR	#1, S1, [R0, #0]
MOVW	R0, #52429
MOVT	R0, #15820
VMOV	S0, R0
VMUL.F32	S0, S0, S1
MOVW	R0, #lo_addr(_bi+8)
MOVT	R0, #hi_addr(_bi+8)
VSTR	#1, S0, [R0, #0]
;parameter_anterior.h,74 :: 		ti[3] = 0;
MOV	R0, #0
VMOV	S0, R0
MOVW	R0, #lo_addr(_ti+12)
MOVT	R0, #hi_addr(_ti+12)
VSTR	#1, S0, [R0, #0]
;parameter_anterior.h,75 :: 		ai[3] = -18.75 * 18;
MOVW	R0, #49152
MOVT	R0, #50088
VMOV	S0, R0
MOVW	R0, #lo_addr(_ai+12)
MOVT	R0, #hi_addr(_ai+12)
VSTR	#1, S0, [R0, #0]
;parameter_anterior.h,76 :: 		bi[3] = 0.1 * modFactor;
MOV	R0, R1
VLDR	#1, S1, [R0, #0]
MOVW	R0, #52429
MOVT	R0, #15820
VMOV	S0, R0
VMUL.F32	S0, S0, S1
MOVW	R0, #lo_addr(_bi+12)
MOVT	R0, #hi_addr(_bi+12)
VSTR	#1, S0, [R0, #0]
;parameter_anterior.h,77 :: 		ti[4] = 15 * modFactor;
MOV	R0, R1
VLDR	#1, S1, [R0, #0]
VMOV.F32	S0, #15
VMUL.F32	S0, S0, S1
MOVW	R0, #lo_addr(_ti+16)
MOVT	R0, #hi_addr(_ti+16)
VSTR	#1, S0, [R0, #0]
;parameter_anterior.h,78 :: 		ai[4] = -0.5 * 18;
VMOV.F32	S0, #-9
MOVW	R0, #lo_addr(_ai+16)
MOVT	R0, #hi_addr(_ai+16)
VSTR	#1, S0, [R0, #0]
;parameter_anterior.h,79 :: 		bi[4] = 0.1 * modFactor;
MOV	R0, R1
VLDR	#1, S1, [R0, #0]
MOVW	R0, #52429
MOVT	R0, #15820
VMOV	S0, R0
VMUL.F32	S0, S0, S1
MOVW	R0, #lo_addr(_bi+16)
MOVT	R0, #hi_addr(_bi+16)
VSTR	#1, S0, [R0, #0]
;parameter_anterior.h,80 :: 		ti[5] = 97 * sqrt(modFactor);
MOV	R0, R1
VLDR	#1, S0, [R0, #0]
BL	_sqrt+0
MOVW	R0, #0
MOVT	R0, #17090
VMOV	S1, R0
VMUL.F32	S0, S1, S0
MOVW	R0, #lo_addr(_ti+20)
MOVT	R0, #hi_addr(_ti+20)
VSTR	#1, S0, [R0, #0]
;parameter_anterior.h,81 :: 		ai[5] = 0.15 * ((modFactor * modFactor)*sqrt(modFactor)) * 18;
MOVW	R1, #lo_addr(_modFactor+0)
MOVT	R1, #hi_addr(_modFactor+0)
VLDR	#1, S1, [R1, #0]
MOV	R0, R1
VLDR	#1, S0, [R0, #0]
VMUL.F32	S0, S0, S1
VSTR	#1, S0, [SP, #4]
MOV	R0, R1
VLDR	#1, S0, [R0, #0]
BL	_sqrt+0
VLDR	#1, S1, [SP, #4]
VMUL.F32	S1, S1, S0
MOVW	R0, #39322
MOVT	R0, #15897
VMOV	S0, R0
VMUL.F32	S1, S0, S1
VMOV.F32	S0, #18
VMUL.F32	S0, S1, S0
MOVW	R0, #lo_addr(_ai+20)
MOVT	R0, #hi_addr(_ai+20)
VSTR	#1, S0, [R0, #0]
;parameter_anterior.h,82 :: 		bi[5] = 0.4 / modFactor;
MOVW	R1, #lo_addr(_modFactor+0)
MOVT	R1, #hi_addr(_modFactor+0)
VLDR	#1, S1, [R1, #0]
MOVW	R0, #52429
MOVT	R0, #16076
VMOV	S0, R0
VDIV.F32	S0, S0, S1
MOVW	R0, #lo_addr(_bi+20)
MOVT	R0, #hi_addr(_bi+20)
VSTR	#1, S0, [R0, #0]
;parameter_anterior.h,83 :: 		ti[6] = 100 * sqrt(modFactor);
MOV	R0, R1
VLDR	#1, S0, [R0, #0]
BL	_sqrt+0
MOVW	R0, #0
MOVT	R0, #17096
VMOV	S1, R0
VMUL.F32	S0, S1, S0
MOVW	R0, #lo_addr(_ti+24)
MOVT	R0, #hi_addr(_ti+24)
VSTR	#1, S0, [R0, #0]
;parameter_anterior.h,84 :: 		ai[6] = 0.25 *((modFactor * modFactor)*sqrt(modFactor)) * 18;
MOVW	R1, #lo_addr(_modFactor+0)
MOVT	R1, #hi_addr(_modFactor+0)
VLDR	#1, S1, [R1, #0]
MOV	R0, R1
VLDR	#1, S0, [R0, #0]
VMUL.F32	S0, S0, S1
VSTR	#1, S0, [SP, #4]
MOV	R0, R1
VLDR	#1, S0, [R0, #0]
BL	_sqrt+0
VLDR	#1, S1, [SP, #4]
VMUL.F32	S1, S1, S0
VMOV.F32	S0, #0.25
VMUL.F32	S1, S0, S1
VMOV.F32	S0, #18
VMUL.F32	S0, S1, S0
MOVW	R0, #lo_addr(_ai+24)
MOVT	R0, #hi_addr(_ai+24)
VSTR	#1, S0, [R0, #0]
;parameter_anterior.h,85 :: 		bi[6] = 0.2 * modFactor;
MOVW	R0, #lo_addr(_modFactor+0)
MOVT	R0, #hi_addr(_modFactor+0)
VLDR	#1, S1, [R0, #0]
MOVW	R0, #52429
MOVT	R0, #15948
VMOV	S0, R0
VMUL.F32	S0, S0, S1
MOVW	R0, #lo_addr(_bi+24)
MOVT	R0, #hi_addr(_bi+24)
VSTR	#1, S0, [R0, #0]
;parameter_anterior.h,88 :: 		for (i = 1; i <= 6; i++)
; i start address is: 12 (R3)
MOVS	R3, #1
SXTH	R3, R3
; i end address is: 12 (R3)
L_anterior363:
; i start address is: 12 (R3)
CMP	R3, #6
IT	GT
BGT	L_anterior364
;parameter_anterior.h,90 :: 		ti[i] = ti[i] * (pi / 180.0); // konversi ke radian
LSLS	R1, R3, #2
MOVW	R0, #lo_addr(_ti+0)
MOVT	R0, #hi_addr(_ti+0)
ADDS	R2, R0, R1
VLDR	#1, S1, [R2, #0]
MOVW	R0, #64053
MOVT	R0, #15502
VMOV	S0, R0
VMUL.F32	S0, S1, S0
VSTR	#1, S0, [R2, #0]
;parameter_anterior.h,88 :: 		for (i = 1; i <= 6; i++)
ADDS	R3, R3, #1
SXTH	R3, R3
;parameter_anterior.h,91 :: 		}
; i end address is: 12 (R3)
IT	AL
BAL	L_anterior363
L_anterior364:
;parameter_anterior.h,92 :: 		}
L_end_anterior3:
LDR	LR, [SP, #0]
ADD	SP, SP, #8
BX	LR
; end of _anterior3
_anterioraVR:
;parameter_anterior.h,94 :: 		void anterioraVR()
SUB	SP, SP, #8
STR	LR, [SP, #0]
;parameter_anterior.h,97 :: 		modFactor = sqrt((float)hmean / 60.0);
MOVW	R0, #lo_addr(_hmean+0)
MOVT	R0, #hi_addr(_hmean+0)
VLDR	#1, S1, [R0, #0]
MOVW	R0, #0
MOVT	R0, #17008
VMOV	S0, R0
VDIV.F32	S0, S1, S0
BL	_sqrt+0
MOVW	R0, #lo_addr(_modFactor+0)
MOVT	R0, #hi_addr(_modFactor+0)
VSTR	#1, S0, [R0, #0]
;parameter_anterior.h,99 :: 		ti[1] = -60 * sqrt(modFactor);
VMOV.F32	S0, S0
BL	_sqrt+0
MOVW	R0, #0
MOVT	R0, #49776
VMOV	S1, R0
VMUL.F32	S0, S1, S0
MOVW	R0, #lo_addr(_ti+4)
MOVT	R0, #hi_addr(_ti+4)
VSTR	#1, S0, [R0, #0]
;parameter_anterior.h,100 :: 		ai[1] = -0.8 * 18;
MOVW	R0, #26215
MOVT	R0, #49510
VMOV	S0, R0
MOVW	R0, #lo_addr(_ai+4)
MOVT	R0, #hi_addr(_ai+4)
VSTR	#1, S0, [R0, #0]
;parameter_anterior.h,101 :: 		bi[1] = 0.2 * modFactor;
MOVW	R1, #lo_addr(_modFactor+0)
MOVT	R1, #hi_addr(_modFactor+0)
VLDR	#1, S1, [R1, #0]
MOVW	R0, #52429
MOVT	R0, #15948
VMOV	S0, R0
VMUL.F32	S0, S0, S1
MOVW	R0, #lo_addr(_bi+4)
MOVT	R0, #hi_addr(_bi+4)
VSTR	#1, S0, [R0, #0]
;parameter_anterior.h,102 :: 		ti[2] = -15 * modFactor;
MOV	R0, R1
VLDR	#1, S1, [R0, #0]
VMOV.F32	S0, #-15
VMUL.F32	S0, S0, S1
MOVW	R0, #lo_addr(_ti+8)
MOVT	R0, #hi_addr(_ti+8)
VSTR	#1, S0, [R0, #0]
;parameter_anterior.h,103 :: 		ai[2] = 5 * 18;
MOVW	R0, #0
MOVT	R0, #17076
VMOV	S0, R0
MOVW	R0, #lo_addr(_ai+8)
MOVT	R0, #hi_addr(_ai+8)
VSTR	#1, S0, [R0, #0]
;parameter_anterior.h,104 :: 		bi[2] = 0.1 * modFactor;
MOV	R0, R1
VLDR	#1, S1, [R0, #0]
MOVW	R0, #52429
MOVT	R0, #15820
VMOV	S0, R0
VMUL.F32	S0, S0, S1
MOVW	R0, #lo_addr(_bi+8)
MOVT	R0, #hi_addr(_bi+8)
VSTR	#1, S0, [R0, #0]
;parameter_anterior.h,105 :: 		ti[3] = 0;
MOV	R0, #0
VMOV	S0, R0
MOVW	R0, #lo_addr(_ti+12)
MOVT	R0, #hi_addr(_ti+12)
VSTR	#1, S0, [R0, #0]
;parameter_anterior.h,106 :: 		ai[3] = -30 * 18;
MOVW	R0, #0
MOVT	R0, #50183
VMOV	S0, R0
MOVW	R0, #lo_addr(_ai+12)
MOVT	R0, #hi_addr(_ai+12)
VSTR	#1, S0, [R0, #0]
;parameter_anterior.h,107 :: 		bi[3] = 0.1 * modFactor;
MOV	R0, R1
VLDR	#1, S1, [R0, #0]
MOVW	R0, #52429
MOVT	R0, #15820
VMOV	S0, R0
VMUL.F32	S0, S0, S1
MOVW	R0, #lo_addr(_bi+12)
MOVT	R0, #hi_addr(_bi+12)
VSTR	#1, S0, [R0, #0]
;parameter_anterior.h,108 :: 		ti[4] = 15 * modFactor;
MOV	R0, R1
VLDR	#1, S1, [R0, #0]
VMOV.F32	S0, #15
VMUL.F32	S0, S0, S1
MOVW	R0, #lo_addr(_ti+16)
MOVT	R0, #hi_addr(_ti+16)
VSTR	#1, S0, [R0, #0]
;parameter_anterior.h,109 :: 		ai[4] = -0.5 * 18;
VMOV.F32	S0, #-9
MOVW	R0, #lo_addr(_ai+16)
MOVT	R0, #hi_addr(_ai+16)
VSTR	#1, S0, [R0, #0]
;parameter_anterior.h,110 :: 		bi[4] = 0.1 * modFactor;
MOV	R0, R1
VLDR	#1, S1, [R0, #0]
MOVW	R0, #52429
MOVT	R0, #15820
VMOV	S0, R0
VMUL.F32	S0, S0, S1
MOVW	R0, #lo_addr(_bi+16)
MOVT	R0, #hi_addr(_bi+16)
VSTR	#1, S0, [R0, #0]
;parameter_anterior.h,111 :: 		ti[5] = 97 * sqrt(modFactor);
MOV	R0, R1
VLDR	#1, S0, [R0, #0]
BL	_sqrt+0
MOVW	R0, #0
MOVT	R0, #17090
VMOV	S1, R0
VMUL.F32	S0, S1, S0
MOVW	R0, #lo_addr(_ti+20)
MOVT	R0, #hi_addr(_ti+20)
VSTR	#1, S0, [R0, #0]
;parameter_anterior.h,112 :: 		ai[5] = -0.5 * ((modFactor * modFactor)*sqrt(modFactor)) * 18;
MOVW	R1, #lo_addr(_modFactor+0)
MOVT	R1, #hi_addr(_modFactor+0)
VLDR	#1, S1, [R1, #0]
MOV	R0, R1
VLDR	#1, S0, [R0, #0]
VMUL.F32	S0, S0, S1
VSTR	#1, S0, [SP, #4]
MOV	R0, R1
VLDR	#1, S0, [R0, #0]
BL	_sqrt+0
VLDR	#1, S1, [SP, #4]
VMUL.F32	S1, S1, S0
VMOV.F32	S0, #-0.5
VMUL.F32	S1, S0, S1
VMOV.F32	S0, #18
VMUL.F32	S0, S1, S0
MOVW	R0, #lo_addr(_ai+20)
MOVT	R0, #hi_addr(_ai+20)
VSTR	#1, S0, [R0, #0]
;parameter_anterior.h,113 :: 		bi[5] = 0.4 / modFactor;
MOVW	R1, #lo_addr(_modFactor+0)
MOVT	R1, #hi_addr(_modFactor+0)
VLDR	#1, S1, [R1, #0]
MOVW	R0, #52429
MOVT	R0, #16076
VMOV	S0, R0
VDIV.F32	S0, S0, S1
MOVW	R0, #lo_addr(_bi+20)
MOVT	R0, #hi_addr(_bi+20)
VSTR	#1, S0, [R0, #0]
;parameter_anterior.h,114 :: 		ti[6] = 100 * sqrt(modFactor);
MOV	R0, R1
VLDR	#1, S0, [R0, #0]
BL	_sqrt+0
MOVW	R0, #0
MOVT	R0, #17096
VMOV	S1, R0
VMUL.F32	S0, S1, S0
MOVW	R0, #lo_addr(_ti+24)
MOVT	R0, #hi_addr(_ti+24)
VSTR	#1, S0, [R0, #0]
;parameter_anterior.h,115 :: 		ai[6] = -0.75 *((modFactor * modFactor)*sqrt(modFactor)) * 18;
MOVW	R1, #lo_addr(_modFactor+0)
MOVT	R1, #hi_addr(_modFactor+0)
VLDR	#1, S1, [R1, #0]
MOV	R0, R1
VLDR	#1, S0, [R0, #0]
VMUL.F32	S0, S0, S1
VSTR	#1, S0, [SP, #4]
MOV	R0, R1
VLDR	#1, S0, [R0, #0]
BL	_sqrt+0
VLDR	#1, S1, [SP, #4]
VMUL.F32	S1, S1, S0
VMOV.F32	S0, #-0.75
VMUL.F32	S1, S0, S1
VMOV.F32	S0, #18
VMUL.F32	S0, S1, S0
MOVW	R0, #lo_addr(_ai+24)
MOVT	R0, #hi_addr(_ai+24)
VSTR	#1, S0, [R0, #0]
;parameter_anterior.h,116 :: 		bi[6] = 0.2 * modFactor;
MOVW	R0, #lo_addr(_modFactor+0)
MOVT	R0, #hi_addr(_modFactor+0)
VLDR	#1, S1, [R0, #0]
MOVW	R0, #52429
MOVT	R0, #15948
VMOV	S0, R0
VMUL.F32	S0, S0, S1
MOVW	R0, #lo_addr(_bi+24)
MOVT	R0, #hi_addr(_bi+24)
VSTR	#1, S0, [R0, #0]
;parameter_anterior.h,119 :: 		for (i = 1; i <= 6; i++)
; i start address is: 12 (R3)
MOVS	R3, #1
SXTH	R3, R3
; i end address is: 12 (R3)
L_anterioraVR66:
; i start address is: 12 (R3)
CMP	R3, #6
IT	GT
BGT	L_anterioraVR67
;parameter_anterior.h,121 :: 		ti[i] = ti[i] * (pi / 180.0); // konversi ke radian
LSLS	R1, R3, #2
MOVW	R0, #lo_addr(_ti+0)
MOVT	R0, #hi_addr(_ti+0)
ADDS	R2, R0, R1
VLDR	#1, S1, [R2, #0]
MOVW	R0, #64053
MOVT	R0, #15502
VMOV	S0, R0
VMUL.F32	S0, S1, S0
VSTR	#1, S0, [R2, #0]
;parameter_anterior.h,119 :: 		for (i = 1; i <= 6; i++)
ADDS	R3, R3, #1
SXTH	R3, R3
;parameter_anterior.h,122 :: 		}
; i end address is: 12 (R3)
IT	AL
BAL	L_anterioraVR66
L_anterioraVR67:
;parameter_anterior.h,123 :: 		}
L_end_anterioraVR:
LDR	LR, [SP, #0]
ADD	SP, SP, #8
BX	LR
; end of _anterioraVR
_anterioraVL:
;parameter_anterior.h,125 :: 		void anterioraVL()
SUB	SP, SP, #8
STR	LR, [SP, #0]
;parameter_anterior.h,128 :: 		modFactor = sqrt((float)hmean / 60.0);
MOVW	R0, #lo_addr(_hmean+0)
MOVT	R0, #hi_addr(_hmean+0)
VLDR	#1, S1, [R0, #0]
MOVW	R0, #0
MOVT	R0, #17008
VMOV	S0, R0
VDIV.F32	S0, S1, S0
BL	_sqrt+0
MOVW	R0, #lo_addr(_modFactor+0)
MOVT	R0, #hi_addr(_modFactor+0)
VSTR	#1, S0, [R0, #0]
;parameter_anterior.h,130 :: 		ti[1] = -60 * sqrt(modFactor);
VMOV.F32	S0, S0
BL	_sqrt+0
MOVW	R0, #0
MOVT	R0, #49776
VMOV	S1, R0
VMUL.F32	S0, S1, S0
MOVW	R0, #lo_addr(_ti+4)
MOVT	R0, #hi_addr(_ti+4)
VSTR	#1, S0, [R0, #0]
;parameter_anterior.h,131 :: 		ai[1] = 0.8 * 18;
MOVW	R0, #26215
MOVT	R0, #16742
VMOV	S0, R0
MOVW	R0, #lo_addr(_ai+4)
MOVT	R0, #hi_addr(_ai+4)
VSTR	#1, S0, [R0, #0]
;parameter_anterior.h,132 :: 		bi[1] = 0.2 * modFactor;
MOVW	R1, #lo_addr(_modFactor+0)
MOVT	R1, #hi_addr(_modFactor+0)
VLDR	#1, S1, [R1, #0]
MOVW	R0, #52429
MOVT	R0, #15948
VMOV	S0, R0
VMUL.F32	S0, S0, S1
MOVW	R0, #lo_addr(_bi+4)
MOVT	R0, #hi_addr(_bi+4)
VSTR	#1, S0, [R0, #0]
;parameter_anterior.h,133 :: 		ti[2] = -15 * modFactor;
MOV	R0, R1
VLDR	#1, S1, [R0, #0]
VMOV.F32	S0, #-15
VMUL.F32	S0, S0, S1
MOVW	R0, #lo_addr(_ti+8)
MOVT	R0, #hi_addr(_ti+8)
VSTR	#1, S0, [R0, #0]
;parameter_anterior.h,134 :: 		ai[2] = 0.5 * 18;
VMOV.F32	S0, #9
MOVW	R0, #lo_addr(_ai+8)
MOVT	R0, #hi_addr(_ai+8)
VSTR	#1, S0, [R0, #0]
;parameter_anterior.h,135 :: 		bi[2] = 0.1 * modFactor;
MOV	R0, R1
VLDR	#1, S1, [R0, #0]
MOVW	R0, #52429
MOVT	R0, #15820
VMOV	S0, R0
VMUL.F32	S0, S0, S1
MOVW	R0, #lo_addr(_bi+8)
MOVT	R0, #hi_addr(_bi+8)
VSTR	#1, S0, [R0, #0]
;parameter_anterior.h,136 :: 		ti[3] = 0;
MOV	R0, #0
VMOV	S0, R0
MOVW	R0, #lo_addr(_ti+12)
MOVT	R0, #hi_addr(_ti+12)
VSTR	#1, S0, [R0, #0]
;parameter_anterior.h,137 :: 		ai[3] = 33.75 * 18;
MOVW	R0, #57344
MOVT	R0, #17431
VMOV	S0, R0
MOVW	R0, #lo_addr(_ai+12)
MOVT	R0, #hi_addr(_ai+12)
VSTR	#1, S0, [R0, #0]
;parameter_anterior.h,138 :: 		bi[3] = 0.1 * modFactor;
MOV	R0, R1
VLDR	#1, S1, [R0, #0]
MOVW	R0, #52429
MOVT	R0, #15820
VMOV	S0, R0
VMUL.F32	S0, S0, S1
MOVW	R0, #lo_addr(_bi+12)
MOVT	R0, #hi_addr(_bi+12)
VSTR	#1, S0, [R0, #0]
;parameter_anterior.h,139 :: 		ti[4] = 15 * modFactor;
MOV	R0, R1
VLDR	#1, S1, [R0, #0]
VMOV.F32	S0, #15
VMUL.F32	S0, S0, S1
MOVW	R0, #lo_addr(_ti+16)
MOVT	R0, #hi_addr(_ti+16)
VSTR	#1, S0, [R0, #0]
;parameter_anterior.h,140 :: 		ai[4] = 0.5 * 18;
VMOV.F32	S0, #9
MOVW	R0, #lo_addr(_ai+16)
MOVT	R0, #hi_addr(_ai+16)
VSTR	#1, S0, [R0, #0]
;parameter_anterior.h,141 :: 		bi[4] = 0.1 * modFactor;
MOV	R0, R1
VLDR	#1, S1, [R0, #0]
MOVW	R0, #52429
MOVT	R0, #15820
VMOV	S0, R0
VMUL.F32	S0, S0, S1
MOVW	R0, #lo_addr(_bi+16)
MOVT	R0, #hi_addr(_bi+16)
VSTR	#1, S0, [R0, #0]
;parameter_anterior.h,142 :: 		ti[5] = 97 * sqrt(modFactor);
MOV	R0, R1
VLDR	#1, S0, [R0, #0]
BL	_sqrt+0
MOVW	R0, #0
MOVT	R0, #17090
VMOV	S1, R0
VMUL.F32	S0, S1, S0
MOVW	R0, #lo_addr(_ti+20)
MOVT	R0, #hi_addr(_ti+20)
VSTR	#1, S0, [R0, #0]
;parameter_anterior.h,143 :: 		ai[5] = 0.2 * ((modFactor * modFactor)*sqrt(modFactor)) * 18;
MOVW	R1, #lo_addr(_modFactor+0)
MOVT	R1, #hi_addr(_modFactor+0)
VLDR	#1, S1, [R1, #0]
MOV	R0, R1
VLDR	#1, S0, [R0, #0]
VMUL.F32	S0, S0, S1
VSTR	#1, S0, [SP, #4]
MOV	R0, R1
VLDR	#1, S0, [R0, #0]
BL	_sqrt+0
VLDR	#1, S1, [SP, #4]
VMUL.F32	S1, S1, S0
MOVW	R0, #52429
MOVT	R0, #15948
VMOV	S0, R0
VMUL.F32	S1, S0, S1
VMOV.F32	S0, #18
VMUL.F32	S0, S1, S0
MOVW	R0, #lo_addr(_ai+20)
MOVT	R0, #hi_addr(_ai+20)
VSTR	#1, S0, [R0, #0]
;parameter_anterior.h,144 :: 		bi[5] = 0.4 / modFactor;
MOVW	R1, #lo_addr(_modFactor+0)
MOVT	R1, #hi_addr(_modFactor+0)
VLDR	#1, S1, [R1, #0]
MOVW	R0, #52429
MOVT	R0, #16076
VMOV	S0, R0
VDIV.F32	S0, S0, S1
MOVW	R0, #lo_addr(_bi+20)
MOVT	R0, #hi_addr(_bi+20)
VSTR	#1, S0, [R0, #0]
;parameter_anterior.h,145 :: 		ti[6] = 100 * sqrt(modFactor);
MOV	R0, R1
VLDR	#1, S0, [R0, #0]
BL	_sqrt+0
MOVW	R0, #0
MOVT	R0, #17096
VMOV	S1, R0
VMUL.F32	S0, S1, S0
MOVW	R0, #lo_addr(_ti+24)
MOVT	R0, #hi_addr(_ti+24)
VSTR	#1, S0, [R0, #0]
;parameter_anterior.h,146 :: 		ai[6] = 0.3 *((modFactor * modFactor)*sqrt(modFactor)) * 18;
MOVW	R1, #lo_addr(_modFactor+0)
MOVT	R1, #hi_addr(_modFactor+0)
VLDR	#1, S1, [R1, #0]
MOV	R0, R1
VLDR	#1, S0, [R0, #0]
VMUL.F32	S0, S0, S1
VSTR	#1, S0, [SP, #4]
MOV	R0, R1
VLDR	#1, S0, [R0, #0]
BL	_sqrt+0
VLDR	#1, S1, [SP, #4]
VMUL.F32	S1, S1, S0
MOVW	R0, #39322
MOVT	R0, #16025
VMOV	S0, R0
VMUL.F32	S1, S0, S1
VMOV.F32	S0, #18
VMUL.F32	S0, S1, S0
MOVW	R0, #lo_addr(_ai+24)
MOVT	R0, #hi_addr(_ai+24)
VSTR	#1, S0, [R0, #0]
;parameter_anterior.h,147 :: 		bi[6] = 0.2 * modFactor;
MOVW	R0, #lo_addr(_modFactor+0)
MOVT	R0, #hi_addr(_modFactor+0)
VLDR	#1, S1, [R0, #0]
MOVW	R0, #52429
MOVT	R0, #15948
VMOV	S0, R0
VMUL.F32	S0, S0, S1
MOVW	R0, #lo_addr(_bi+24)
MOVT	R0, #hi_addr(_bi+24)
VSTR	#1, S0, [R0, #0]
;parameter_anterior.h,150 :: 		for (i = 1; i <= 6; i++)
; i start address is: 12 (R3)
MOVS	R3, #1
SXTH	R3, R3
; i end address is: 12 (R3)
L_anterioraVL69:
; i start address is: 12 (R3)
CMP	R3, #6
IT	GT
BGT	L_anterioraVL70
;parameter_anterior.h,152 :: 		ti[i] = ti[i] * (pi / 180.0); // konversi ke radian
LSLS	R1, R3, #2
MOVW	R0, #lo_addr(_ti+0)
MOVT	R0, #hi_addr(_ti+0)
ADDS	R2, R0, R1
VLDR	#1, S1, [R2, #0]
MOVW	R0, #64053
MOVT	R0, #15502
VMOV	S0, R0
VMUL.F32	S0, S1, S0
VSTR	#1, S0, [R2, #0]
;parameter_anterior.h,150 :: 		for (i = 1; i <= 6; i++)
ADDS	R3, R3, #1
SXTH	R3, R3
;parameter_anterior.h,153 :: 		}
; i end address is: 12 (R3)
IT	AL
BAL	L_anterioraVL69
L_anterioraVL70:
;parameter_anterior.h,154 :: 		}
L_end_anterioraVL:
LDR	LR, [SP, #0]
ADD	SP, SP, #8
BX	LR
; end of _anterioraVL
_anterioraVF:
;parameter_anterior.h,156 :: 		void anterioraVF()
SUB	SP, SP, #8
STR	LR, [SP, #0]
;parameter_anterior.h,159 :: 		modFactor = sqrt((float)hmean / 60.0);
MOVW	R0, #lo_addr(_hmean+0)
MOVT	R0, #hi_addr(_hmean+0)
VLDR	#1, S1, [R0, #0]
MOVW	R0, #0
MOVT	R0, #17008
VMOV	S0, R0
VDIV.F32	S0, S1, S0
BL	_sqrt+0
MOVW	R0, #lo_addr(_modFactor+0)
MOVT	R0, #hi_addr(_modFactor+0)
VSTR	#1, S0, [R0, #0]
;parameter_anterior.h,161 :: 		ti[1] = -60 * sqrt(modFactor);
VMOV.F32	S0, S0
BL	_sqrt+0
MOVW	R0, #0
MOVT	R0, #49776
VMOV	S1, R0
VMUL.F32	S0, S1, S0
MOVW	R0, #lo_addr(_ti+4)
MOVT	R0, #hi_addr(_ti+4)
VSTR	#1, S0, [R0, #0]
;parameter_anterior.h,162 :: 		ai[1] = 0.8 * 18;
MOVW	R0, #26215
MOVT	R0, #16742
VMOV	S0, R0
MOVW	R0, #lo_addr(_ai+4)
MOVT	R0, #hi_addr(_ai+4)
VSTR	#1, S0, [R0, #0]
;parameter_anterior.h,163 :: 		bi[1] = 0.2 * modFactor;
MOVW	R1, #lo_addr(_modFactor+0)
MOVT	R1, #hi_addr(_modFactor+0)
VLDR	#1, S1, [R1, #0]
MOVW	R0, #52429
MOVT	R0, #15948
VMOV	S0, R0
VMUL.F32	S0, S0, S1
MOVW	R0, #lo_addr(_bi+4)
MOVT	R0, #hi_addr(_bi+4)
VSTR	#1, S0, [R0, #0]
;parameter_anterior.h,164 :: 		ti[2] = -15 * modFactor;
MOV	R0, R1
VLDR	#1, S1, [R0, #0]
VMOV.F32	S0, #-15
VMUL.F32	S0, S0, S1
MOVW	R0, #lo_addr(_ti+8)
MOVT	R0, #hi_addr(_ti+8)
VSTR	#1, S0, [R0, #0]
;parameter_anterior.h,165 :: 		ai[2] = -4 * 18;
MOVW	R0, #0
MOVT	R0, #49808
VMOV	S0, R0
MOVW	R0, #lo_addr(_ai+8)
MOVT	R0, #hi_addr(_ai+8)
VSTR	#1, S0, [R0, #0]
;parameter_anterior.h,166 :: 		bi[2] = 0.1 * modFactor;
MOV	R0, R1
VLDR	#1, S1, [R0, #0]
MOVW	R0, #52429
MOVT	R0, #15820
VMOV	S0, R0
VMUL.F32	S0, S0, S1
MOVW	R0, #lo_addr(_bi+8)
MOVT	R0, #hi_addr(_bi+8)
VSTR	#1, S0, [R0, #0]
;parameter_anterior.h,167 :: 		ti[3] = 0;
MOV	R0, #0
VMOV	S0, R0
MOVW	R0, #lo_addr(_ti+12)
MOVT	R0, #hi_addr(_ti+12)
VSTR	#1, S0, [R0, #0]
;parameter_anterior.h,168 :: 		ai[3] = 18.75 * 18;
MOVW	R0, #49152
MOVT	R0, #17320
VMOV	S0, R0
MOVW	R0, #lo_addr(_ai+12)
MOVT	R0, #hi_addr(_ai+12)
VSTR	#1, S0, [R0, #0]
;parameter_anterior.h,169 :: 		bi[3] = 0.1 * modFactor;
MOV	R0, R1
VLDR	#1, S1, [R0, #0]
MOVW	R0, #52429
MOVT	R0, #15820
VMOV	S0, R0
VMUL.F32	S0, S0, S1
MOVW	R0, #lo_addr(_bi+12)
MOVT	R0, #hi_addr(_bi+12)
VSTR	#1, S0, [R0, #0]
;parameter_anterior.h,170 :: 		ti[4] = 15 * modFactor;
MOV	R0, R1
VLDR	#1, S1, [R0, #0]
VMOV.F32	S0, #15
VMUL.F32	S0, S0, S1
MOVW	R0, #lo_addr(_ti+16)
MOVT	R0, #hi_addr(_ti+16)
VSTR	#1, S0, [R0, #0]
;parameter_anterior.h,171 :: 		ai[4] = 0.5 * 18;
VMOV.F32	S0, #9
MOVW	R0, #lo_addr(_ai+16)
MOVT	R0, #hi_addr(_ai+16)
VSTR	#1, S0, [R0, #0]
;parameter_anterior.h,172 :: 		bi[4] = 0.1 * modFactor;
MOV	R0, R1
VLDR	#1, S1, [R0, #0]
MOVW	R0, #52429
MOVT	R0, #15820
VMOV	S0, R0
VMUL.F32	S0, S0, S1
MOVW	R0, #lo_addr(_bi+16)
MOVT	R0, #hi_addr(_bi+16)
VSTR	#1, S0, [R0, #0]
;parameter_anterior.h,173 :: 		ti[5] = 97 * sqrt(modFactor);
MOV	R0, R1
VLDR	#1, S0, [R0, #0]
BL	_sqrt+0
MOVW	R0, #0
MOVT	R0, #17090
VMOV	S1, R0
VMUL.F32	S0, S1, S0
MOVW	R0, #lo_addr(_ti+20)
MOVT	R0, #hi_addr(_ti+20)
VSTR	#1, S0, [R0, #0]
;parameter_anterior.h,174 :: 		ai[5] = 0.2 * ((modFactor * modFactor)*sqrt(modFactor)) * 18;
MOVW	R1, #lo_addr(_modFactor+0)
MOVT	R1, #hi_addr(_modFactor+0)
VLDR	#1, S1, [R1, #0]
MOV	R0, R1
VLDR	#1, S0, [R0, #0]
VMUL.F32	S0, S0, S1
VSTR	#1, S0, [SP, #4]
MOV	R0, R1
VLDR	#1, S0, [R0, #0]
BL	_sqrt+0
VLDR	#1, S1, [SP, #4]
VMUL.F32	S1, S1, S0
MOVW	R0, #52429
MOVT	R0, #15948
VMOV	S0, R0
VMUL.F32	S1, S0, S1
VMOV.F32	S0, #18
VMUL.F32	S0, S1, S0
MOVW	R0, #lo_addr(_ai+20)
MOVT	R0, #hi_addr(_ai+20)
VSTR	#1, S0, [R0, #0]
;parameter_anterior.h,175 :: 		bi[5] = 0.4 / modFactor;
MOVW	R1, #lo_addr(_modFactor+0)
MOVT	R1, #hi_addr(_modFactor+0)
VLDR	#1, S1, [R1, #0]
MOVW	R0, #52429
MOVT	R0, #16076
VMOV	S0, R0
VDIV.F32	S0, S0, S1
MOVW	R0, #lo_addr(_bi+20)
MOVT	R0, #hi_addr(_bi+20)
VSTR	#1, S0, [R0, #0]
;parameter_anterior.h,176 :: 		ti[6] = 100 * sqrt(modFactor);
MOV	R0, R1
VLDR	#1, S0, [R0, #0]
BL	_sqrt+0
MOVW	R0, #0
MOVT	R0, #17096
VMOV	S1, R0
VMUL.F32	S0, S1, S0
MOVW	R0, #lo_addr(_ti+24)
MOVT	R0, #hi_addr(_ti+24)
VSTR	#1, S0, [R0, #0]
;parameter_anterior.h,177 :: 		ai[6] = 0.25 *((modFactor * modFactor)*sqrt(modFactor)) * 18;
MOVW	R1, #lo_addr(_modFactor+0)
MOVT	R1, #hi_addr(_modFactor+0)
VLDR	#1, S1, [R1, #0]
MOV	R0, R1
VLDR	#1, S0, [R0, #0]
VMUL.F32	S0, S0, S1
VSTR	#1, S0, [SP, #4]
MOV	R0, R1
VLDR	#1, S0, [R0, #0]
BL	_sqrt+0
VLDR	#1, S1, [SP, #4]
VMUL.F32	S1, S1, S0
VMOV.F32	S0, #0.25
VMUL.F32	S1, S0, S1
VMOV.F32	S0, #18
VMUL.F32	S0, S1, S0
MOVW	R0, #lo_addr(_ai+24)
MOVT	R0, #hi_addr(_ai+24)
VSTR	#1, S0, [R0, #0]
;parameter_anterior.h,178 :: 		bi[6] = 0.2 * modFactor;
MOVW	R0, #lo_addr(_modFactor+0)
MOVT	R0, #hi_addr(_modFactor+0)
VLDR	#1, S1, [R0, #0]
MOVW	R0, #52429
MOVT	R0, #15948
VMOV	S0, R0
VMUL.F32	S0, S0, S1
MOVW	R0, #lo_addr(_bi+24)
MOVT	R0, #hi_addr(_bi+24)
VSTR	#1, S0, [R0, #0]
;parameter_anterior.h,181 :: 		for (i = 1; i <= 6; i++)
; i start address is: 12 (R3)
MOVS	R3, #1
SXTH	R3, R3
; i end address is: 12 (R3)
L_anterioraVF72:
; i start address is: 12 (R3)
CMP	R3, #6
IT	GT
BGT	L_anterioraVF73
;parameter_anterior.h,183 :: 		ti[i] = ti[i] * (pi / 180.0); // konversi ke radian
LSLS	R1, R3, #2
MOVW	R0, #lo_addr(_ti+0)
MOVT	R0, #hi_addr(_ti+0)
ADDS	R2, R0, R1
VLDR	#1, S1, [R2, #0]
MOVW	R0, #64053
MOVT	R0, #15502
VMOV	S0, R0
VMUL.F32	S0, S1, S0
VSTR	#1, S0, [R2, #0]
;parameter_anterior.h,181 :: 		for (i = 1; i <= 6; i++)
ADDS	R3, R3, #1
SXTH	R3, R3
;parameter_anterior.h,184 :: 		}
; i end address is: 12 (R3)
IT	AL
BAL	L_anterioraVF72
L_anterioraVF73:
;parameter_anterior.h,185 :: 		}
L_end_anterioraVF:
LDR	LR, [SP, #0]
ADD	SP, SP, #8
BX	LR
; end of _anterioraVF
_anteriorV1:
;parameter_anterior.h,187 :: 		void anteriorV1()
SUB	SP, SP, #8
STR	LR, [SP, #0]
;parameter_anterior.h,190 :: 		modFactor = sqrt((float)hmean / 60.0);
MOVW	R0, #lo_addr(_hmean+0)
MOVT	R0, #hi_addr(_hmean+0)
VLDR	#1, S1, [R0, #0]
MOVW	R0, #0
MOVT	R0, #17008
VMOV	S0, R0
VDIV.F32	S0, S1, S0
BL	_sqrt+0
MOVW	R0, #lo_addr(_modFactor+0)
MOVT	R0, #hi_addr(_modFactor+0)
VSTR	#1, S0, [R0, #0]
;parameter_anterior.h,192 :: 		ti[1] = -60 * sqrt(modFactor);
VMOV.F32	S0, S0
BL	_sqrt+0
MOVW	R0, #0
MOVT	R0, #49776
VMOV	S1, R0
VMUL.F32	S0, S1, S0
MOVW	R0, #lo_addr(_ti+4)
MOVT	R0, #hi_addr(_ti+4)
VSTR	#1, S0, [R0, #0]
;parameter_anterior.h,193 :: 		ai[1] = -0.8 * 18;
MOVW	R0, #26215
MOVT	R0, #49510
VMOV	S0, R0
MOVW	R0, #lo_addr(_ai+4)
MOVT	R0, #hi_addr(_ai+4)
VSTR	#1, S0, [R0, #0]
;parameter_anterior.h,194 :: 		bi[1] = 0.2 * modFactor;
MOVW	R1, #lo_addr(_modFactor+0)
MOVT	R1, #hi_addr(_modFactor+0)
VLDR	#1, S1, [R1, #0]
MOVW	R0, #52429
MOVT	R0, #15948
VMOV	S0, R0
VMUL.F32	S0, S0, S1
MOVW	R0, #lo_addr(_bi+4)
MOVT	R0, #hi_addr(_bi+4)
VSTR	#1, S0, [R0, #0]
;parameter_anterior.h,195 :: 		ti[2] = -15 * modFactor;
MOV	R0, R1
VLDR	#1, S1, [R0, #0]
VMOV.F32	S0, #-15
VMUL.F32	S0, S0, S1
MOVW	R0, #lo_addr(_ti+8)
MOVT	R0, #hi_addr(_ti+8)
VSTR	#1, S0, [R0, #0]
;parameter_anterior.h,196 :: 		ai[2] = 0.5 * 18;
VMOV.F32	S0, #9
MOVW	R0, #lo_addr(_ai+8)
MOVT	R0, #hi_addr(_ai+8)
VSTR	#1, S0, [R0, #0]
;parameter_anterior.h,197 :: 		bi[2] = 0.1 * modFactor;
MOV	R0, R1
VLDR	#1, S1, [R0, #0]
MOVW	R0, #52429
MOVT	R0, #15820
VMOV	S0, R0
VMUL.F32	S0, S0, S1
MOVW	R0, #lo_addr(_bi+8)
MOVT	R0, #hi_addr(_bi+8)
VSTR	#1, S0, [R0, #0]
;parameter_anterior.h,198 :: 		ti[3] = 0;
MOV	R0, #0
VMOV	S0, R0
MOVW	R0, #lo_addr(_ti+12)
MOVT	R0, #hi_addr(_ti+12)
VSTR	#1, S0, [R0, #0]
;parameter_anterior.h,199 :: 		ai[3] = -41.25 * 18;
MOVW	R0, #40960
MOVT	R0, #50233
VMOV	S0, R0
MOVW	R0, #lo_addr(_ai+12)
MOVT	R0, #hi_addr(_ai+12)
VSTR	#1, S0, [R0, #0]
;parameter_anterior.h,200 :: 		bi[3] = 0.1 * modFactor;
MOV	R0, R1
VLDR	#1, S1, [R0, #0]
MOVW	R0, #52429
MOVT	R0, #15820
VMOV	S0, R0
VMUL.F32	S0, S0, S1
MOVW	R0, #lo_addr(_bi+12)
MOVT	R0, #hi_addr(_bi+12)
VSTR	#1, S0, [R0, #0]
;parameter_anterior.h,201 :: 		ti[4] = 15 * modFactor;
MOV	R0, R1
VLDR	#1, S1, [R0, #0]
VMOV.F32	S0, #15
VMUL.F32	S0, S0, S1
MOVW	R0, #lo_addr(_ti+16)
MOVT	R0, #hi_addr(_ti+16)
VSTR	#1, S0, [R0, #0]
;parameter_anterior.h,202 :: 		ai[4] = -1 * 18;
VMOV.F32	S0, #-18
MOVW	R0, #lo_addr(_ai+16)
MOVT	R0, #hi_addr(_ai+16)
VSTR	#1, S0, [R0, #0]
;parameter_anterior.h,203 :: 		bi[4] = 0.1 * modFactor;
MOV	R0, R1
VLDR	#1, S1, [R0, #0]
MOVW	R0, #52429
MOVT	R0, #15820
VMOV	S0, R0
VMUL.F32	S0, S0, S1
MOVW	R0, #lo_addr(_bi+16)
MOVT	R0, #hi_addr(_bi+16)
VSTR	#1, S0, [R0, #0]
;parameter_anterior.h,204 :: 		ti[5] = 97 * sqrt(modFactor);
MOV	R0, R1
VLDR	#1, S0, [R0, #0]
BL	_sqrt+0
MOVW	R0, #0
MOVT	R0, #17090
VMOV	S1, R0
VMUL.F32	S0, S1, S0
MOVW	R0, #lo_addr(_ti+20)
MOVT	R0, #hi_addr(_ti+20)
VSTR	#1, S0, [R0, #0]
;parameter_anterior.h,205 :: 		ai[5] = 0.75 * ((modFactor * modFactor)*sqrt(modFactor)) * 18;
MOVW	R1, #lo_addr(_modFactor+0)
MOVT	R1, #hi_addr(_modFactor+0)
VLDR	#1, S1, [R1, #0]
MOV	R0, R1
VLDR	#1, S0, [R0, #0]
VMUL.F32	S0, S0, S1
VSTR	#1, S0, [SP, #4]
MOV	R0, R1
VLDR	#1, S0, [R0, #0]
BL	_sqrt+0
VLDR	#1, S1, [SP, #4]
VMUL.F32	S1, S1, S0
VMOV.F32	S0, #0.75
VMUL.F32	S1, S0, S1
VMOV.F32	S0, #18
VMUL.F32	S0, S1, S0
MOVW	R0, #lo_addr(_ai+20)
MOVT	R0, #hi_addr(_ai+20)
VSTR	#1, S0, [R0, #0]
;parameter_anterior.h,206 :: 		bi[5] = 0.4 / modFactor;
MOVW	R1, #lo_addr(_modFactor+0)
MOVT	R1, #hi_addr(_modFactor+0)
VLDR	#1, S1, [R1, #0]
MOVW	R0, #52429
MOVT	R0, #16076
VMOV	S0, R0
VDIV.F32	S0, S0, S1
MOVW	R0, #lo_addr(_bi+20)
MOVT	R0, #hi_addr(_bi+20)
VSTR	#1, S0, [R0, #0]
;parameter_anterior.h,207 :: 		ti[6] = 100 * sqrt(modFactor);
MOV	R0, R1
VLDR	#1, S0, [R0, #0]
BL	_sqrt+0
MOVW	R0, #0
MOVT	R0, #17096
VMOV	S1, R0
VMUL.F32	S0, S1, S0
MOVW	R0, #lo_addr(_ti+24)
MOVT	R0, #hi_addr(_ti+24)
VSTR	#1, S0, [R0, #0]
;parameter_anterior.h,208 :: 		ai[6] = 0.55 *((modFactor * modFactor)*sqrt(modFactor)) * 18;
MOVW	R1, #lo_addr(_modFactor+0)
MOVT	R1, #hi_addr(_modFactor+0)
VLDR	#1, S1, [R1, #0]
MOV	R0, R1
VLDR	#1, S0, [R0, #0]
VMUL.F32	S0, S0, S1
VSTR	#1, S0, [SP, #4]
MOV	R0, R1
VLDR	#1, S0, [R0, #0]
BL	_sqrt+0
VLDR	#1, S1, [SP, #4]
VMUL.F32	S1, S1, S0
MOVW	R0, #52429
MOVT	R0, #16140
VMOV	S0, R0
VMUL.F32	S1, S0, S1
VMOV.F32	S0, #18
VMUL.F32	S0, S1, S0
MOVW	R0, #lo_addr(_ai+24)
MOVT	R0, #hi_addr(_ai+24)
VSTR	#1, S0, [R0, #0]
;parameter_anterior.h,209 :: 		bi[6] = 0.2 * modFactor;
MOVW	R0, #lo_addr(_modFactor+0)
MOVT	R0, #hi_addr(_modFactor+0)
VLDR	#1, S1, [R0, #0]
MOVW	R0, #52429
MOVT	R0, #15948
VMOV	S0, R0
VMUL.F32	S0, S0, S1
MOVW	R0, #lo_addr(_bi+24)
MOVT	R0, #hi_addr(_bi+24)
VSTR	#1, S0, [R0, #0]
;parameter_anterior.h,212 :: 		for (i = 1; i <= 6; i++)
; i start address is: 12 (R3)
MOVS	R3, #1
SXTH	R3, R3
; i end address is: 12 (R3)
L_anteriorV175:
; i start address is: 12 (R3)
CMP	R3, #6
IT	GT
BGT	L_anteriorV176
;parameter_anterior.h,214 :: 		ti[i] = ti[i] * (pi / 180.0); // konversi ke radian
LSLS	R1, R3, #2
MOVW	R0, #lo_addr(_ti+0)
MOVT	R0, #hi_addr(_ti+0)
ADDS	R2, R0, R1
VLDR	#1, S1, [R2, #0]
MOVW	R0, #64053
MOVT	R0, #15502
VMOV	S0, R0
VMUL.F32	S0, S1, S0
VSTR	#1, S0, [R2, #0]
;parameter_anterior.h,212 :: 		for (i = 1; i <= 6; i++)
ADDS	R3, R3, #1
SXTH	R3, R3
;parameter_anterior.h,215 :: 		}
; i end address is: 12 (R3)
IT	AL
BAL	L_anteriorV175
L_anteriorV176:
;parameter_anterior.h,216 :: 		}
L_end_anteriorV1:
LDR	LR, [SP, #0]
ADD	SP, SP, #8
BX	LR
; end of _anteriorV1
_anteriorV2:
;parameter_anterior.h,218 :: 		void anteriorV2()
SUB	SP, SP, #8
STR	LR, [SP, #0]
;parameter_anterior.h,221 :: 		modFactor = sqrt((float)hmean / 60.0);
MOVW	R0, #lo_addr(_hmean+0)
MOVT	R0, #hi_addr(_hmean+0)
VLDR	#1, S1, [R0, #0]
MOVW	R0, #0
MOVT	R0, #17008
VMOV	S0, R0
VDIV.F32	S0, S1, S0
BL	_sqrt+0
MOVW	R0, #lo_addr(_modFactor+0)
MOVT	R0, #hi_addr(_modFactor+0)
VSTR	#1, S0, [R0, #0]
;parameter_anterior.h,223 :: 		ti[1] = -60 * sqrt(modFactor);
VMOV.F32	S0, S0
BL	_sqrt+0
MOVW	R0, #0
MOVT	R0, #49776
VMOV	S1, R0
VMUL.F32	S0, S1, S0
MOVW	R0, #lo_addr(_ti+4)
MOVT	R0, #hi_addr(_ti+4)
VSTR	#1, S0, [R0, #0]
;parameter_anterior.h,224 :: 		ai[1] = 0.8 * 18;
MOVW	R0, #26215
MOVT	R0, #16742
VMOV	S0, R0
MOVW	R0, #lo_addr(_ai+4)
MOVT	R0, #hi_addr(_ai+4)
VSTR	#1, S0, [R0, #0]
;parameter_anterior.h,225 :: 		bi[1] = 0.2 * modFactor;
MOVW	R1, #lo_addr(_modFactor+0)
MOVT	R1, #hi_addr(_modFactor+0)
VLDR	#1, S1, [R1, #0]
MOVW	R0, #52429
MOVT	R0, #15948
VMOV	S0, R0
VMUL.F32	S0, S0, S1
MOVW	R0, #lo_addr(_bi+4)
MOVT	R0, #hi_addr(_bi+4)
VSTR	#1, S0, [R0, #0]
;parameter_anterior.h,226 :: 		ti[2] = -15 * modFactor;
MOV	R0, R1
VLDR	#1, S1, [R0, #0]
VMOV.F32	S0, #-15
VMUL.F32	S0, S0, S1
MOVW	R0, #lo_addr(_ti+8)
MOVT	R0, #hi_addr(_ti+8)
VSTR	#1, S0, [R0, #0]
;parameter_anterior.h,227 :: 		ai[2] = 7 * 18;
MOVW	R0, #0
MOVT	R0, #17148
VMOV	S0, R0
MOVW	R0, #lo_addr(_ai+8)
MOVT	R0, #hi_addr(_ai+8)
VSTR	#1, S0, [R0, #0]
;parameter_anterior.h,228 :: 		bi[2] = 0.1 * modFactor;
MOV	R0, R1
VLDR	#1, S1, [R0, #0]
MOVW	R0, #52429
MOVT	R0, #15820
VMOV	S0, R0
VMUL.F32	S0, S0, S1
MOVW	R0, #lo_addr(_bi+8)
MOVT	R0, #hi_addr(_bi+8)
VSTR	#1, S0, [R0, #0]
;parameter_anterior.h,229 :: 		ti[3] = 0;
MOV	R0, #0
VMOV	S0, R0
MOVW	R0, #lo_addr(_ti+12)
MOVT	R0, #hi_addr(_ti+12)
VSTR	#1, S0, [R0, #0]
;parameter_anterior.h,230 :: 		ai[3] = -67.5 * 18;
MOVW	R0, #57344
MOVT	R0, #50327
VMOV	S0, R0
MOVW	R0, #lo_addr(_ai+12)
MOVT	R0, #hi_addr(_ai+12)
VSTR	#1, S0, [R0, #0]
;parameter_anterior.h,231 :: 		bi[3] = 0.1 * modFactor;
MOV	R0, R1
VLDR	#1, S1, [R0, #0]
MOVW	R0, #52429
MOVT	R0, #15820
VMOV	S0, R0
VMUL.F32	S0, S0, S1
MOVW	R0, #lo_addr(_bi+12)
MOVT	R0, #hi_addr(_bi+12)
VSTR	#1, S0, [R0, #0]
;parameter_anterior.h,232 :: 		ti[4] = 15 * modFactor;
MOV	R0, R1
VLDR	#1, S1, [R0, #0]
VMOV.F32	S0, #15
VMUL.F32	S0, S0, S1
MOVW	R0, #lo_addr(_ti+16)
MOVT	R0, #hi_addr(_ti+16)
VSTR	#1, S0, [R0, #0]
;parameter_anterior.h,233 :: 		ai[4] = -1 * 18;
VMOV.F32	S0, #-18
MOVW	R0, #lo_addr(_ai+16)
MOVT	R0, #hi_addr(_ai+16)
VSTR	#1, S0, [R0, #0]
;parameter_anterior.h,234 :: 		bi[4] = 0.1 * modFactor;
MOV	R0, R1
VLDR	#1, S1, [R0, #0]
MOVW	R0, #52429
MOVT	R0, #15820
VMOV	S0, R0
VMUL.F32	S0, S0, S1
MOVW	R0, #lo_addr(_bi+16)
MOVT	R0, #hi_addr(_bi+16)
VSTR	#1, S0, [R0, #0]
;parameter_anterior.h,235 :: 		ti[5] = 97 * sqrt(modFactor);
MOV	R0, R1
VLDR	#1, S0, [R0, #0]
BL	_sqrt+0
MOVW	R0, #0
MOVT	R0, #17090
VMOV	S1, R0
VMUL.F32	S0, S1, S0
MOVW	R0, #lo_addr(_ti+20)
MOVT	R0, #hi_addr(_ti+20)
VSTR	#1, S0, [R0, #0]
;parameter_anterior.h,236 :: 		ai[5] = 0.85 * ((modFactor * modFactor)*sqrt(modFactor)) * 18;
MOVW	R1, #lo_addr(_modFactor+0)
MOVT	R1, #hi_addr(_modFactor+0)
VLDR	#1, S1, [R1, #0]
MOV	R0, R1
VLDR	#1, S0, [R0, #0]
VMUL.F32	S0, S0, S1
VSTR	#1, S0, [SP, #4]
MOV	R0, R1
VLDR	#1, S0, [R0, #0]
BL	_sqrt+0
VLDR	#1, S1, [SP, #4]
VMUL.F32	S1, S1, S0
MOVW	R0, #39322
MOVT	R0, #16217
VMOV	S0, R0
VMUL.F32	S1, S0, S1
VMOV.F32	S0, #18
VMUL.F32	S0, S1, S0
MOVW	R0, #lo_addr(_ai+20)
MOVT	R0, #hi_addr(_ai+20)
VSTR	#1, S0, [R0, #0]
;parameter_anterior.h,237 :: 		bi[5] = 0.4 / modFactor;
MOVW	R1, #lo_addr(_modFactor+0)
MOVT	R1, #hi_addr(_modFactor+0)
VLDR	#1, S1, [R1, #0]
MOVW	R0, #52429
MOVT	R0, #16076
VMOV	S0, R0
VDIV.F32	S0, S0, S1
MOVW	R0, #lo_addr(_bi+20)
MOVT	R0, #hi_addr(_bi+20)
VSTR	#1, S0, [R0, #0]
;parameter_anterior.h,238 :: 		ti[6] = 100 * sqrt(modFactor);
MOV	R0, R1
VLDR	#1, S0, [R0, #0]
BL	_sqrt+0
MOVW	R0, #0
MOVT	R0, #17096
VMOV	S1, R0
VMUL.F32	S0, S1, S0
MOVW	R0, #lo_addr(_ti+24)
MOVT	R0, #hi_addr(_ti+24)
VSTR	#1, S0, [R0, #0]
;parameter_anterior.h,239 :: 		ai[6] = 1.25 *((modFactor * modFactor)*sqrt(modFactor)) * 18;
MOVW	R1, #lo_addr(_modFactor+0)
MOVT	R1, #hi_addr(_modFactor+0)
VLDR	#1, S1, [R1, #0]
MOV	R0, R1
VLDR	#1, S0, [R0, #0]
VMUL.F32	S0, S0, S1
VSTR	#1, S0, [SP, #4]
MOV	R0, R1
VLDR	#1, S0, [R0, #0]
BL	_sqrt+0
VLDR	#1, S1, [SP, #4]
VMUL.F32	S1, S1, S0
VMOV.F32	S0, #1.25
VMUL.F32	S1, S0, S1
VMOV.F32	S0, #18
VMUL.F32	S0, S1, S0
MOVW	R0, #lo_addr(_ai+24)
MOVT	R0, #hi_addr(_ai+24)
VSTR	#1, S0, [R0, #0]
;parameter_anterior.h,240 :: 		bi[6] = 0.2 * modFactor;
MOVW	R0, #lo_addr(_modFactor+0)
MOVT	R0, #hi_addr(_modFactor+0)
VLDR	#1, S1, [R0, #0]
MOVW	R0, #52429
MOVT	R0, #15948
VMOV	S0, R0
VMUL.F32	S0, S0, S1
MOVW	R0, #lo_addr(_bi+24)
MOVT	R0, #hi_addr(_bi+24)
VSTR	#1, S0, [R0, #0]
;parameter_anterior.h,243 :: 		for (i = 1; i <= 6; i++)
; i start address is: 12 (R3)
MOVS	R3, #1
SXTH	R3, R3
; i end address is: 12 (R3)
L_anteriorV278:
; i start address is: 12 (R3)
CMP	R3, #6
IT	GT
BGT	L_anteriorV279
;parameter_anterior.h,245 :: 		ti[i] = ti[i] * (pi / 180.0); // konversi ke radian
LSLS	R1, R3, #2
MOVW	R0, #lo_addr(_ti+0)
MOVT	R0, #hi_addr(_ti+0)
ADDS	R2, R0, R1
VLDR	#1, S1, [R2, #0]
MOVW	R0, #64053
MOVT	R0, #15502
VMOV	S0, R0
VMUL.F32	S0, S1, S0
VSTR	#1, S0, [R2, #0]
;parameter_anterior.h,243 :: 		for (i = 1; i <= 6; i++)
ADDS	R3, R3, #1
SXTH	R3, R3
;parameter_anterior.h,246 :: 		}
; i end address is: 12 (R3)
IT	AL
BAL	L_anteriorV278
L_anteriorV279:
;parameter_anterior.h,247 :: 		}
L_end_anteriorV2:
LDR	LR, [SP, #0]
ADD	SP, SP, #8
BX	LR
; end of _anteriorV2
_anteriorV3:
;parameter_anterior.h,249 :: 		void anteriorV3()
SUB	SP, SP, #8
STR	LR, [SP, #0]
;parameter_anterior.h,252 :: 		modFactor = sqrt((float)hmean / 60.0);
MOVW	R0, #lo_addr(_hmean+0)
MOVT	R0, #hi_addr(_hmean+0)
VLDR	#1, S1, [R0, #0]
MOVW	R0, #0
MOVT	R0, #17008
VMOV	S0, R0
VDIV.F32	S0, S1, S0
BL	_sqrt+0
MOVW	R0, #lo_addr(_modFactor+0)
MOVT	R0, #hi_addr(_modFactor+0)
VSTR	#1, S0, [R0, #0]
;parameter_anterior.h,254 :: 		ti[1] = -60 * sqrt(modFactor);
VMOV.F32	S0, S0
BL	_sqrt+0
MOVW	R0, #0
MOVT	R0, #49776
VMOV	S1, R0
VMUL.F32	S0, S1, S0
MOVW	R0, #lo_addr(_ti+4)
MOVT	R0, #hi_addr(_ti+4)
VSTR	#1, S0, [R0, #0]
;parameter_anterior.h,255 :: 		ai[1] = 0.8 * 18;
MOVW	R0, #26215
MOVT	R0, #16742
VMOV	S0, R0
MOVW	R0, #lo_addr(_ai+4)
MOVT	R0, #hi_addr(_ai+4)
VSTR	#1, S0, [R0, #0]
;parameter_anterior.h,256 :: 		bi[1] = 0.2 * modFactor;
MOVW	R1, #lo_addr(_modFactor+0)
MOVT	R1, #hi_addr(_modFactor+0)
VLDR	#1, S1, [R1, #0]
MOVW	R0, #52429
MOVT	R0, #15948
VMOV	S0, R0
VMUL.F32	S0, S0, S1
MOVW	R0, #lo_addr(_bi+4)
MOVT	R0, #hi_addr(_bi+4)
VSTR	#1, S0, [R0, #0]
;parameter_anterior.h,257 :: 		ti[2] = -15 * modFactor;
MOV	R0, R1
VLDR	#1, S1, [R0, #0]
VMOV.F32	S0, #-15
VMUL.F32	S0, S0, S1
MOVW	R0, #lo_addr(_ti+8)
MOVT	R0, #hi_addr(_ti+8)
VSTR	#1, S0, [R0, #0]
;parameter_anterior.h,258 :: 		ai[2] = 15 * 18;
MOVW	R0, #0
MOVT	R0, #17287
VMOV	S0, R0
MOVW	R0, #lo_addr(_ai+8)
MOVT	R0, #hi_addr(_ai+8)
VSTR	#1, S0, [R0, #0]
;parameter_anterior.h,259 :: 		bi[2] = 0.1 * modFactor;
MOV	R0, R1
VLDR	#1, S1, [R0, #0]
MOVW	R0, #52429
MOVT	R0, #15820
VMOV	S0, R0
VMUL.F32	S0, S0, S1
MOVW	R0, #lo_addr(_bi+8)
MOVT	R0, #hi_addr(_bi+8)
VSTR	#1, S0, [R0, #0]
;parameter_anterior.h,260 :: 		ti[3] = 0;
MOV	R0, #0
VMOV	S0, R0
MOVW	R0, #lo_addr(_ti+12)
MOVT	R0, #hi_addr(_ti+12)
VSTR	#1, S0, [R0, #0]
;parameter_anterior.h,261 :: 		ai[3] = -37.5 * 18;
MOVW	R0, #49152
MOVT	R0, #50216
VMOV	S0, R0
MOVW	R0, #lo_addr(_ai+12)
MOVT	R0, #hi_addr(_ai+12)
VSTR	#1, S0, [R0, #0]
;parameter_anterior.h,262 :: 		bi[3] = 0.1 * modFactor;
MOV	R0, R1
VLDR	#1, S1, [R0, #0]
MOVW	R0, #52429
MOVT	R0, #15820
VMOV	S0, R0
VMUL.F32	S0, S0, S1
MOVW	R0, #lo_addr(_bi+12)
MOVT	R0, #hi_addr(_bi+12)
VSTR	#1, S0, [R0, #0]
;parameter_anterior.h,263 :: 		ti[4] = 25 * modFactor;
MOV	R0, R1
VLDR	#1, S1, [R0, #0]
VMOV.F32	S0, #25
VMUL.F32	S0, S0, S1
MOVW	R0, #lo_addr(_ti+16)
MOVT	R0, #hi_addr(_ti+16)
VSTR	#1, S0, [R0, #0]
;parameter_anterior.h,264 :: 		ai[4] = 2.5 * 18;
MOVW	R0, #0
MOVT	R0, #16948
VMOV	S0, R0
MOVW	R0, #lo_addr(_ai+16)
MOVT	R0, #hi_addr(_ai+16)
VSTR	#1, S0, [R0, #0]
;parameter_anterior.h,265 :: 		bi[4] = 0.2 * modFactor;
MOV	R0, R1
VLDR	#1, S1, [R0, #0]
MOVW	R0, #52429
MOVT	R0, #15948
VMOV	S0, R0
VMUL.F32	S0, S0, S1
MOVW	R0, #lo_addr(_bi+16)
MOVT	R0, #hi_addr(_bi+16)
VSTR	#1, S0, [R0, #0]
;parameter_anterior.h,266 :: 		ti[5] = 67 * sqrt(modFactor);
MOV	R0, R1
VLDR	#1, S0, [R0, #0]
BL	_sqrt+0
MOVW	R0, #0
MOVT	R0, #17030
VMOV	S1, R0
VMUL.F32	S0, S1, S0
MOVW	R0, #lo_addr(_ti+20)
MOVT	R0, #hi_addr(_ti+20)
VSTR	#1, S0, [R0, #0]
;parameter_anterior.h,267 :: 		ai[5] = 2.5 * ((modFactor * modFactor)*sqrt(modFactor)) * 18;
MOVW	R1, #lo_addr(_modFactor+0)
MOVT	R1, #hi_addr(_modFactor+0)
VLDR	#1, S1, [R1, #0]
MOV	R0, R1
VLDR	#1, S0, [R0, #0]
VMUL.F32	S0, S0, S1
VSTR	#1, S0, [SP, #4]
MOV	R0, R1
VLDR	#1, S0, [R0, #0]
BL	_sqrt+0
VLDR	#1, S1, [SP, #4]
VMUL.F32	S1, S1, S0
VMOV.F32	S0, #2.5
VMUL.F32	S1, S0, S1
VMOV.F32	S0, #18
VMUL.F32	S0, S1, S0
MOVW	R0, #lo_addr(_ai+20)
MOVT	R0, #hi_addr(_ai+20)
VSTR	#1, S0, [R0, #0]
;parameter_anterior.h,268 :: 		bi[5] = 0.4 / modFactor;
MOVW	R1, #lo_addr(_modFactor+0)
MOVT	R1, #hi_addr(_modFactor+0)
VLDR	#1, S1, [R1, #0]
MOVW	R0, #52429
MOVT	R0, #16076
VMOV	S0, R0
VDIV.F32	S0, S0, S1
MOVW	R0, #lo_addr(_bi+20)
MOVT	R0, #hi_addr(_bi+20)
VSTR	#1, S0, [R0, #0]
;parameter_anterior.h,269 :: 		ti[6] = 70 * sqrt(modFactor);
MOV	R0, R1
VLDR	#1, S0, [R0, #0]
BL	_sqrt+0
MOVW	R0, #0
MOVT	R0, #17036
VMOV	S1, R0
VMUL.F32	S0, S1, S0
MOVW	R0, #lo_addr(_ti+24)
MOVT	R0, #hi_addr(_ti+24)
VSTR	#1, S0, [R0, #0]
;parameter_anterior.h,270 :: 		ai[6] = 2.7 *((modFactor * modFactor)*sqrt(modFactor)) * 18;
MOVW	R1, #lo_addr(_modFactor+0)
MOVT	R1, #hi_addr(_modFactor+0)
VLDR	#1, S1, [R1, #0]
MOV	R0, R1
VLDR	#1, S0, [R0, #0]
VMUL.F32	S0, S0, S1
VSTR	#1, S0, [SP, #4]
MOV	R0, R1
VLDR	#1, S0, [R0, #0]
BL	_sqrt+0
VLDR	#1, S1, [SP, #4]
VMUL.F32	S1, S1, S0
MOVW	R0, #52429
MOVT	R0, #16428
VMOV	S0, R0
VMUL.F32	S1, S0, S1
VMOV.F32	S0, #18
VMUL.F32	S0, S1, S0
MOVW	R0, #lo_addr(_ai+24)
MOVT	R0, #hi_addr(_ai+24)
VSTR	#1, S0, [R0, #0]
;parameter_anterior.h,271 :: 		bi[6] = 0.2 * modFactor;
MOVW	R0, #lo_addr(_modFactor+0)
MOVT	R0, #hi_addr(_modFactor+0)
VLDR	#1, S1, [R0, #0]
MOVW	R0, #52429
MOVT	R0, #15948
VMOV	S0, R0
VMUL.F32	S0, S0, S1
MOVW	R0, #lo_addr(_bi+24)
MOVT	R0, #hi_addr(_bi+24)
VSTR	#1, S0, [R0, #0]
;parameter_anterior.h,274 :: 		for (i = 1; i <= 6; i++)
; i start address is: 12 (R3)
MOVS	R3, #1
SXTH	R3, R3
; i end address is: 12 (R3)
L_anteriorV381:
; i start address is: 12 (R3)
CMP	R3, #6
IT	GT
BGT	L_anteriorV382
;parameter_anterior.h,276 :: 		ti[i] = ti[i] * (pi / 180.0); // konversi ke radian
LSLS	R1, R3, #2
MOVW	R0, #lo_addr(_ti+0)
MOVT	R0, #hi_addr(_ti+0)
ADDS	R2, R0, R1
VLDR	#1, S1, [R2, #0]
MOVW	R0, #64053
MOVT	R0, #15502
VMOV	S0, R0
VMUL.F32	S0, S1, S0
VSTR	#1, S0, [R2, #0]
;parameter_anterior.h,274 :: 		for (i = 1; i <= 6; i++)
ADDS	R3, R3, #1
SXTH	R3, R3
;parameter_anterior.h,277 :: 		}
; i end address is: 12 (R3)
IT	AL
BAL	L_anteriorV381
L_anteriorV382:
;parameter_anterior.h,278 :: 		}
L_end_anteriorV3:
LDR	LR, [SP, #0]
ADD	SP, SP, #8
BX	LR
; end of _anteriorV3
_anteriorV4:
;parameter_anterior.h,280 :: 		void anteriorV4()
SUB	SP, SP, #8
STR	LR, [SP, #0]
;parameter_anterior.h,283 :: 		modFactor = sqrt((float)hmean / 60.0);
MOVW	R0, #lo_addr(_hmean+0)
MOVT	R0, #hi_addr(_hmean+0)
VLDR	#1, S1, [R0, #0]
MOVW	R0, #0
MOVT	R0, #17008
VMOV	S0, R0
VDIV.F32	S0, S1, S0
BL	_sqrt+0
MOVW	R0, #lo_addr(_modFactor+0)
MOVT	R0, #hi_addr(_modFactor+0)
VSTR	#1, S0, [R0, #0]
;parameter_anterior.h,285 :: 		ti[1] = -60 * sqrt(modFactor);
VMOV.F32	S0, S0
BL	_sqrt+0
MOVW	R0, #0
MOVT	R0, #49776
VMOV	S1, R0
VMUL.F32	S0, S1, S0
MOVW	R0, #lo_addr(_ti+4)
MOVT	R0, #hi_addr(_ti+4)
VSTR	#1, S0, [R0, #0]
;parameter_anterior.h,286 :: 		ai[1] = 0.8 * 18;
MOVW	R0, #26215
MOVT	R0, #16742
VMOV	S0, R0
MOVW	R0, #lo_addr(_ai+4)
MOVT	R0, #hi_addr(_ai+4)
VSTR	#1, S0, [R0, #0]
;parameter_anterior.h,287 :: 		bi[1] = 0.2 * modFactor;
MOVW	R1, #lo_addr(_modFactor+0)
MOVT	R1, #hi_addr(_modFactor+0)
VLDR	#1, S1, [R1, #0]
MOVW	R0, #52429
MOVT	R0, #15948
VMOV	S0, R0
VMUL.F32	S0, S0, S1
MOVW	R0, #lo_addr(_bi+4)
MOVT	R0, #hi_addr(_bi+4)
VSTR	#1, S0, [R0, #0]
;parameter_anterior.h,288 :: 		ti[2] = -15 * modFactor;
MOV	R0, R1
VLDR	#1, S1, [R0, #0]
VMOV.F32	S0, #-15
VMUL.F32	S0, S0, S1
MOVW	R0, #lo_addr(_ti+8)
MOVT	R0, #hi_addr(_ti+8)
VSTR	#1, S0, [R0, #0]
;parameter_anterior.h,289 :: 		ai[2] = 0.5 * 18;
VMOV.F32	S0, #9
MOVW	R0, #lo_addr(_ai+8)
MOVT	R0, #hi_addr(_ai+8)
VSTR	#1, S0, [R0, #0]
;parameter_anterior.h,290 :: 		bi[2] = 0.1 * modFactor;
MOV	R0, R1
VLDR	#1, S1, [R0, #0]
MOVW	R0, #52429
MOVT	R0, #15820
VMOV	S0, R0
VMUL.F32	S0, S0, S1
MOVW	R0, #lo_addr(_bi+8)
MOVT	R0, #hi_addr(_bi+8)
VSTR	#1, S0, [R0, #0]
;parameter_anterior.h,291 :: 		ti[3] = 0;
MOV	R0, #0
VMOV	S0, R0
MOVW	R0, #lo_addr(_ti+12)
MOVT	R0, #hi_addr(_ti+12)
VSTR	#1, S0, [R0, #0]
;parameter_anterior.h,292 :: 		ai[3] = 45 * 18;
MOVW	R0, #32768
MOVT	R0, #17482
VMOV	S0, R0
MOVW	R0, #lo_addr(_ai+12)
MOVT	R0, #hi_addr(_ai+12)
VSTR	#1, S0, [R0, #0]
;parameter_anterior.h,293 :: 		bi[3] = 0.1 * modFactor;
MOV	R0, R1
VLDR	#1, S1, [R0, #0]
MOVW	R0, #52429
MOVT	R0, #15820
VMOV	S0, R0
VMUL.F32	S0, S0, S1
MOVW	R0, #lo_addr(_bi+12)
MOVT	R0, #hi_addr(_bi+12)
VSTR	#1, S0, [R0, #0]
;parameter_anterior.h,294 :: 		ti[4] = 15 * modFactor;
MOV	R0, R1
VLDR	#1, S1, [R0, #0]
VMOV.F32	S0, #15
VMUL.F32	S0, S0, S1
MOVW	R0, #lo_addr(_ti+16)
MOVT	R0, #hi_addr(_ti+16)
VSTR	#1, S0, [R0, #0]
;parameter_anterior.h,295 :: 		ai[4] = -18.75 * 18;
MOVW	R0, #49152
MOVT	R0, #50088
VMOV	S0, R0
MOVW	R0, #lo_addr(_ai+16)
MOVT	R0, #hi_addr(_ai+16)
VSTR	#1, S0, [R0, #0]
;parameter_anterior.h,296 :: 		bi[4] = 0.13 * modFactor;
MOV	R0, R1
VLDR	#1, S1, [R0, #0]
MOVW	R0, #7864
MOVT	R0, #15877
VMOV	S0, R0
VMUL.F32	S0, S0, S1
MOVW	R0, #lo_addr(_bi+16)
MOVT	R0, #hi_addr(_bi+16)
VSTR	#1, S0, [R0, #0]
;parameter_anterior.h,297 :: 		ti[5] = 67 * sqrt(modFactor);
MOV	R0, R1
VLDR	#1, S0, [R0, #0]
BL	_sqrt+0
MOVW	R0, #0
MOVT	R0, #17030
VMOV	S1, R0
VMUL.F32	S0, S1, S0
MOVW	R0, #lo_addr(_ti+20)
MOVT	R0, #hi_addr(_ti+20)
VSTR	#1, S0, [R0, #0]
;parameter_anterior.h,298 :: 		ai[5] = 1.7 * ((modFactor * modFactor)*sqrt(modFactor)) * 18;
MOVW	R1, #lo_addr(_modFactor+0)
MOVT	R1, #hi_addr(_modFactor+0)
VLDR	#1, S1, [R1, #0]
MOV	R0, R1
VLDR	#1, S0, [R0, #0]
VMUL.F32	S0, S0, S1
VSTR	#1, S0, [SP, #4]
MOV	R0, R1
VLDR	#1, S0, [R0, #0]
BL	_sqrt+0
VLDR	#1, S1, [SP, #4]
VMUL.F32	S1, S1, S0
MOVW	R0, #39322
MOVT	R0, #16345
VMOV	S0, R0
VMUL.F32	S1, S0, S1
VMOV.F32	S0, #18
VMUL.F32	S0, S1, S0
MOVW	R0, #lo_addr(_ai+20)
MOVT	R0, #hi_addr(_ai+20)
VSTR	#1, S0, [R0, #0]
;parameter_anterior.h,299 :: 		bi[5] = 0.45 / modFactor;
MOVW	R1, #lo_addr(_modFactor+0)
MOVT	R1, #hi_addr(_modFactor+0)
VLDR	#1, S1, [R1, #0]
MOVW	R0, #26214
MOVT	R0, #16102
VMOV	S0, R0
VDIV.F32	S0, S0, S1
MOVW	R0, #lo_addr(_bi+20)
MOVT	R0, #hi_addr(_bi+20)
VSTR	#1, S0, [R0, #0]
;parameter_anterior.h,300 :: 		ti[6] = 70 * sqrt(modFactor);
MOV	R0, R1
VLDR	#1, S0, [R0, #0]
BL	_sqrt+0
MOVW	R0, #0
MOVT	R0, #17036
VMOV	S1, R0
VMUL.F32	S0, S1, S0
MOVW	R0, #lo_addr(_ti+24)
MOVT	R0, #hi_addr(_ti+24)
VSTR	#1, S0, [R0, #0]
;parameter_anterior.h,301 :: 		ai[6] = 2.5 *((modFactor * modFactor)*sqrt(modFactor)) * 18;
MOVW	R1, #lo_addr(_modFactor+0)
MOVT	R1, #hi_addr(_modFactor+0)
VLDR	#1, S1, [R1, #0]
MOV	R0, R1
VLDR	#1, S0, [R0, #0]
VMUL.F32	S0, S0, S1
VSTR	#1, S0, [SP, #4]
MOV	R0, R1
VLDR	#1, S0, [R0, #0]
BL	_sqrt+0
VLDR	#1, S1, [SP, #4]
VMUL.F32	S1, S1, S0
VMOV.F32	S0, #2.5
VMUL.F32	S1, S0, S1
VMOV.F32	S0, #18
VMUL.F32	S0, S1, S0
MOVW	R0, #lo_addr(_ai+24)
MOVT	R0, #hi_addr(_ai+24)
VSTR	#1, S0, [R0, #0]
;parameter_anterior.h,302 :: 		bi[6] = 0.25 * modFactor;
MOVW	R0, #lo_addr(_modFactor+0)
MOVT	R0, #hi_addr(_modFactor+0)
VLDR	#1, S1, [R0, #0]
VMOV.F32	S0, #0.25
VMUL.F32	S0, S0, S1
MOVW	R0, #lo_addr(_bi+24)
MOVT	R0, #hi_addr(_bi+24)
VSTR	#1, S0, [R0, #0]
;parameter_anterior.h,305 :: 		for (i = 1; i <= 6; i++)
; i start address is: 12 (R3)
MOVS	R3, #1
SXTH	R3, R3
; i end address is: 12 (R3)
L_anteriorV484:
; i start address is: 12 (R3)
CMP	R3, #6
IT	GT
BGT	L_anteriorV485
;parameter_anterior.h,307 :: 		ti[i] = ti[i] * (pi / 180.0); // konversi ke radian
LSLS	R1, R3, #2
MOVW	R0, #lo_addr(_ti+0)
MOVT	R0, #hi_addr(_ti+0)
ADDS	R2, R0, R1
VLDR	#1, S1, [R2, #0]
MOVW	R0, #64053
MOVT	R0, #15502
VMOV	S0, R0
VMUL.F32	S0, S1, S0
VSTR	#1, S0, [R2, #0]
;parameter_anterior.h,305 :: 		for (i = 1; i <= 6; i++)
ADDS	R3, R3, #1
SXTH	R3, R3
;parameter_anterior.h,308 :: 		}
; i end address is: 12 (R3)
IT	AL
BAL	L_anteriorV484
L_anteriorV485:
;parameter_anterior.h,309 :: 		}
L_end_anteriorV4:
LDR	LR, [SP, #0]
ADD	SP, SP, #8
BX	LR
; end of _anteriorV4
_anteriorV5:
;parameter_anterior.h,311 :: 		void anteriorV5()
SUB	SP, SP, #8
STR	LR, [SP, #0]
;parameter_anterior.h,314 :: 		modFactor = sqrt((float)hmean / 60.0);
MOVW	R0, #lo_addr(_hmean+0)
MOVT	R0, #hi_addr(_hmean+0)
VLDR	#1, S1, [R0, #0]
MOVW	R0, #0
MOVT	R0, #17008
VMOV	S0, R0
VDIV.F32	S0, S1, S0
BL	_sqrt+0
MOVW	R0, #lo_addr(_modFactor+0)
MOVT	R0, #hi_addr(_modFactor+0)
VSTR	#1, S0, [R0, #0]
;parameter_anterior.h,316 :: 		ti[1] = -60 * sqrt(modFactor);
VMOV.F32	S0, S0
BL	_sqrt+0
MOVW	R0, #0
MOVT	R0, #49776
VMOV	S1, R0
VMUL.F32	S0, S1, S0
MOVW	R0, #lo_addr(_ti+4)
MOVT	R0, #hi_addr(_ti+4)
VSTR	#1, S0, [R0, #0]
;parameter_anterior.h,317 :: 		ai[1] = 0.8 * 18;
MOVW	R0, #26215
MOVT	R0, #16742
VMOV	S0, R0
MOVW	R0, #lo_addr(_ai+4)
MOVT	R0, #hi_addr(_ai+4)
VSTR	#1, S0, [R0, #0]
;parameter_anterior.h,318 :: 		bi[1] = 0.2 * modFactor;
MOVW	R1, #lo_addr(_modFactor+0)
MOVT	R1, #hi_addr(_modFactor+0)
VLDR	#1, S1, [R1, #0]
MOVW	R0, #52429
MOVT	R0, #15948
VMOV	S0, R0
VMUL.F32	S0, S0, S1
MOVW	R0, #lo_addr(_bi+4)
MOVT	R0, #hi_addr(_bi+4)
VSTR	#1, S0, [R0, #0]
;parameter_anterior.h,319 :: 		ti[2] = -15 * modFactor;
MOV	R0, R1
VLDR	#1, S1, [R0, #0]
VMOV.F32	S0, #-15
VMUL.F32	S0, S0, S1
MOVW	R0, #lo_addr(_ti+8)
MOVT	R0, #hi_addr(_ti+8)
VSTR	#1, S0, [R0, #0]
;parameter_anterior.h,320 :: 		ai[2] = -5 * 18;
MOVW	R0, #0
MOVT	R0, #49844
VMOV	S0, R0
MOVW	R0, #lo_addr(_ai+8)
MOVT	R0, #hi_addr(_ai+8)
VSTR	#1, S0, [R0, #0]
;parameter_anterior.h,321 :: 		bi[2] = 0.1 * modFactor;
MOV	R0, R1
VLDR	#1, S1, [R0, #0]
MOVW	R0, #52429
MOVT	R0, #15820
VMOV	S0, R0
VMUL.F32	S0, S0, S1
MOVW	R0, #lo_addr(_bi+8)
MOVT	R0, #hi_addr(_bi+8)
VSTR	#1, S0, [R0, #0]
;parameter_anterior.h,322 :: 		ti[3] = 0;
MOV	R0, #0
VMOV	S0, R0
MOVW	R0, #lo_addr(_ti+12)
MOVT	R0, #hi_addr(_ti+12)
VSTR	#1, S0, [R0, #0]
;parameter_anterior.h,323 :: 		ai[3] = 48.75 * 18;
MOVW	R0, #24576
MOVT	R0, #17499
VMOV	S0, R0
MOVW	R0, #lo_addr(_ai+12)
MOVT	R0, #hi_addr(_ai+12)
VSTR	#1, S0, [R0, #0]
;parameter_anterior.h,324 :: 		bi[3] = 0.1 * modFactor;
MOV	R0, R1
VLDR	#1, S1, [R0, #0]
MOVW	R0, #52429
MOVT	R0, #15820
VMOV	S0, R0
VMUL.F32	S0, S0, S1
MOVW	R0, #lo_addr(_bi+12)
MOVT	R0, #hi_addr(_bi+12)
VSTR	#1, S0, [R0, #0]
;parameter_anterior.h,325 :: 		ti[4] = 15 * modFactor;
MOV	R0, R1
VLDR	#1, S1, [R0, #0]
VMOV.F32	S0, #15
VMUL.F32	S0, S0, S1
MOVW	R0, #lo_addr(_ti+16)
MOVT	R0, #hi_addr(_ti+16)
VSTR	#1, S0, [R0, #0]
;parameter_anterior.h,326 :: 		ai[4] = -5 * 18;
MOVW	R0, #0
MOVT	R0, #49844
VMOV	S0, R0
MOVW	R0, #lo_addr(_ai+16)
MOVT	R0, #hi_addr(_ai+16)
VSTR	#1, S0, [R0, #0]
;parameter_anterior.h,327 :: 		bi[4] = 0.1 * modFactor;
MOV	R0, R1
VLDR	#1, S1, [R0, #0]
MOVW	R0, #52429
MOVT	R0, #15820
VMOV	S0, R0
VMUL.F32	S0, S0, S1
MOVW	R0, #lo_addr(_bi+16)
MOVT	R0, #hi_addr(_bi+16)
VSTR	#1, S0, [R0, #0]
;parameter_anterior.h,328 :: 		ti[5] = 97 * sqrt(modFactor);
MOV	R0, R1
VLDR	#1, S0, [R0, #0]
BL	_sqrt+0
MOVW	R0, #0
MOVT	R0, #17090
VMOV	S1, R0
VMUL.F32	S0, S1, S0
MOVW	R0, #lo_addr(_ti+20)
MOVT	R0, #hi_addr(_ti+20)
VSTR	#1, S0, [R0, #0]
;parameter_anterior.h,329 :: 		ai[5] = 1 * ((modFactor * modFactor)*sqrt(modFactor)) * 18;
MOVW	R1, #lo_addr(_modFactor+0)
MOVT	R1, #hi_addr(_modFactor+0)
VLDR	#1, S1, [R1, #0]
MOV	R0, R1
VLDR	#1, S0, [R0, #0]
VMUL.F32	S0, S0, S1
VSTR	#1, S0, [SP, #4]
MOV	R0, R1
VLDR	#1, S0, [R0, #0]
BL	_sqrt+0
VLDR	#1, S1, [SP, #4]
VMUL.F32	S1, S1, S0
VMOV.F32	S0, #18
VMUL.F32	S0, S1, S0
MOVW	R0, #lo_addr(_ai+20)
MOVT	R0, #hi_addr(_ai+20)
VSTR	#1, S0, [R0, #0]
;parameter_anterior.h,330 :: 		bi[5] = 0.4 / modFactor;
MOVW	R1, #lo_addr(_modFactor+0)
MOVT	R1, #hi_addr(_modFactor+0)
VLDR	#1, S1, [R1, #0]
MOVW	R0, #52429
MOVT	R0, #16076
VMOV	S0, R0
VDIV.F32	S0, S0, S1
MOVW	R0, #lo_addr(_bi+20)
MOVT	R0, #hi_addr(_bi+20)
VSTR	#1, S0, [R0, #0]
;parameter_anterior.h,331 :: 		ti[6] = 100 * sqrt(modFactor);
MOV	R0, R1
VLDR	#1, S0, [R0, #0]
BL	_sqrt+0
MOVW	R0, #0
MOVT	R0, #17096
VMOV	S1, R0
VMUL.F32	S0, S1, S0
MOVW	R0, #lo_addr(_ti+24)
MOVT	R0, #hi_addr(_ti+24)
VSTR	#1, S0, [R0, #0]
;parameter_anterior.h,332 :: 		ai[6] = 1.5 *((modFactor * modFactor)*sqrt(modFactor)) * 18;
MOVW	R1, #lo_addr(_modFactor+0)
MOVT	R1, #hi_addr(_modFactor+0)
VLDR	#1, S1, [R1, #0]
MOV	R0, R1
VLDR	#1, S0, [R0, #0]
VMUL.F32	S0, S0, S1
VSTR	#1, S0, [SP, #4]
MOV	R0, R1
VLDR	#1, S0, [R0, #0]
BL	_sqrt+0
VLDR	#1, S1, [SP, #4]
VMUL.F32	S1, S1, S0
VMOV.F32	S0, #1.5
VMUL.F32	S1, S0, S1
VMOV.F32	S0, #18
VMUL.F32	S0, S1, S0
MOVW	R0, #lo_addr(_ai+24)
MOVT	R0, #hi_addr(_ai+24)
VSTR	#1, S0, [R0, #0]
;parameter_anterior.h,333 :: 		bi[6] = 0.2 * modFactor;
MOVW	R0, #lo_addr(_modFactor+0)
MOVT	R0, #hi_addr(_modFactor+0)
VLDR	#1, S1, [R0, #0]
MOVW	R0, #52429
MOVT	R0, #15948
VMOV	S0, R0
VMUL.F32	S0, S0, S1
MOVW	R0, #lo_addr(_bi+24)
MOVT	R0, #hi_addr(_bi+24)
VSTR	#1, S0, [R0, #0]
;parameter_anterior.h,336 :: 		for (i = 1; i <= 6; i++)
; i start address is: 12 (R3)
MOVS	R3, #1
SXTH	R3, R3
; i end address is: 12 (R3)
L_anteriorV587:
; i start address is: 12 (R3)
CMP	R3, #6
IT	GT
BGT	L_anteriorV588
;parameter_anterior.h,338 :: 		ti[i] = ti[i] * (pi / 180.0); // konversi ke radian
LSLS	R1, R3, #2
MOVW	R0, #lo_addr(_ti+0)
MOVT	R0, #hi_addr(_ti+0)
ADDS	R2, R0, R1
VLDR	#1, S1, [R2, #0]
MOVW	R0, #64053
MOVT	R0, #15502
VMOV	S0, R0
VMUL.F32	S0, S1, S0
VSTR	#1, S0, [R2, #0]
;parameter_anterior.h,336 :: 		for (i = 1; i <= 6; i++)
ADDS	R3, R3, #1
SXTH	R3, R3
;parameter_anterior.h,339 :: 		}
; i end address is: 12 (R3)
IT	AL
BAL	L_anteriorV587
L_anteriorV588:
;parameter_anterior.h,340 :: 		}
L_end_anteriorV5:
LDR	LR, [SP, #0]
ADD	SP, SP, #8
BX	LR
; end of _anteriorV5
_anteriorV6:
;parameter_anterior.h,342 :: 		void anteriorV6()
SUB	SP, SP, #8
STR	LR, [SP, #0]
;parameter_anterior.h,345 :: 		modFactor = sqrt((float)hmean / 60.0);
MOVW	R0, #lo_addr(_hmean+0)
MOVT	R0, #hi_addr(_hmean+0)
VLDR	#1, S1, [R0, #0]
MOVW	R0, #0
MOVT	R0, #17008
VMOV	S0, R0
VDIV.F32	S0, S1, S0
BL	_sqrt+0
MOVW	R0, #lo_addr(_modFactor+0)
MOVT	R0, #hi_addr(_modFactor+0)
VSTR	#1, S0, [R0, #0]
;parameter_anterior.h,347 :: 		ti[1] = -60 * sqrt(modFactor);
VMOV.F32	S0, S0
BL	_sqrt+0
MOVW	R0, #0
MOVT	R0, #49776
VMOV	S1, R0
VMUL.F32	S0, S1, S0
MOVW	R0, #lo_addr(_ti+4)
MOVT	R0, #hi_addr(_ti+4)
VSTR	#1, S0, [R0, #0]
;parameter_anterior.h,348 :: 		ai[1] = 0.8 * 18;
MOVW	R0, #26215
MOVT	R0, #16742
VMOV	S0, R0
MOVW	R0, #lo_addr(_ai+4)
MOVT	R0, #hi_addr(_ai+4)
VSTR	#1, S0, [R0, #0]
;parameter_anterior.h,349 :: 		bi[1] = 0.2 * modFactor;
MOVW	R1, #lo_addr(_modFactor+0)
MOVT	R1, #hi_addr(_modFactor+0)
VLDR	#1, S1, [R1, #0]
MOVW	R0, #52429
MOVT	R0, #15948
VMOV	S0, R0
VMUL.F32	S0, S0, S1
MOVW	R0, #lo_addr(_bi+4)
MOVT	R0, #hi_addr(_bi+4)
VSTR	#1, S0, [R0, #0]
;parameter_anterior.h,350 :: 		ti[2] = -15 * modFactor;
MOV	R0, R1
VLDR	#1, S1, [R0, #0]
VMOV.F32	S0, #-15
VMUL.F32	S0, S0, S1
MOVW	R0, #lo_addr(_ti+8)
MOVT	R0, #hi_addr(_ti+8)
VSTR	#1, S0, [R0, #0]
;parameter_anterior.h,351 :: 		ai[2] = -5 * 18;
MOVW	R0, #0
MOVT	R0, #49844
VMOV	S0, R0
MOVW	R0, #lo_addr(_ai+8)
MOVT	R0, #hi_addr(_ai+8)
VSTR	#1, S0, [R0, #0]
;parameter_anterior.h,352 :: 		bi[2] = 0.1 * modFactor;
MOV	R0, R1
VLDR	#1, S1, [R0, #0]
MOVW	R0, #52429
MOVT	R0, #15820
VMOV	S0, R0
VMUL.F32	S0, S0, S1
MOVW	R0, #lo_addr(_bi+8)
MOVT	R0, #hi_addr(_bi+8)
VSTR	#1, S0, [R0, #0]
;parameter_anterior.h,353 :: 		ti[3] = 0;
MOV	R0, #0
VMOV	S0, R0
MOVW	R0, #lo_addr(_ti+12)
MOVT	R0, #hi_addr(_ti+12)
VSTR	#1, S0, [R0, #0]
;parameter_anterior.h,354 :: 		ai[3] = 45 * 18;
MOVW	R0, #32768
MOVT	R0, #17482
VMOV	S0, R0
MOVW	R0, #lo_addr(_ai+12)
MOVT	R0, #hi_addr(_ai+12)
VSTR	#1, S0, [R0, #0]
;parameter_anterior.h,355 :: 		bi[3] = 0.1 * modFactor;
MOV	R0, R1
VLDR	#1, S1, [R0, #0]
MOVW	R0, #52429
MOVT	R0, #15820
VMOV	S0, R0
VMUL.F32	S0, S0, S1
MOVW	R0, #lo_addr(_bi+12)
MOVT	R0, #hi_addr(_bi+12)
VSTR	#1, S0, [R0, #0]
;parameter_anterior.h,356 :: 		ti[4] = 15 * modFactor;
MOV	R0, R1
VLDR	#1, S1, [R0, #0]
VMOV.F32	S0, #15
VMUL.F32	S0, S0, S1
MOVW	R0, #lo_addr(_ti+16)
MOVT	R0, #hi_addr(_ti+16)
VSTR	#1, S0, [R0, #0]
;parameter_anterior.h,357 :: 		ai[4] = 0.5 * 18;
VMOV.F32	S0, #9
MOVW	R0, #lo_addr(_ai+16)
MOVT	R0, #hi_addr(_ai+16)
VSTR	#1, S0, [R0, #0]
;parameter_anterior.h,358 :: 		bi[4] = 0.1 * modFactor;
MOV	R0, R1
VLDR	#1, S1, [R0, #0]
MOVW	R0, #52429
MOVT	R0, #15820
VMOV	S0, R0
VMUL.F32	S0, S0, S1
MOVW	R0, #lo_addr(_bi+16)
MOVT	R0, #hi_addr(_bi+16)
VSTR	#1, S0, [R0, #0]
;parameter_anterior.h,359 :: 		ti[5] = 97 * sqrt(modFactor);
MOV	R0, R1
VLDR	#1, S0, [R0, #0]
BL	_sqrt+0
MOVW	R0, #0
MOVT	R0, #17090
VMOV	S1, R0
VMUL.F32	S0, S1, S0
MOVW	R0, #lo_addr(_ti+20)
MOVT	R0, #hi_addr(_ti+20)
VSTR	#1, S0, [R0, #0]
;parameter_anterior.h,360 :: 		ai[5] = 0.8 * ((modFactor * modFactor)*sqrt(modFactor)) * 18;
MOVW	R1, #lo_addr(_modFactor+0)
MOVT	R1, #hi_addr(_modFactor+0)
VLDR	#1, S1, [R1, #0]
MOV	R0, R1
VLDR	#1, S0, [R0, #0]
VMUL.F32	S0, S0, S1
VSTR	#1, S0, [SP, #4]
MOV	R0, R1
VLDR	#1, S0, [R0, #0]
BL	_sqrt+0
VLDR	#1, S1, [SP, #4]
VMUL.F32	S1, S1, S0
MOVW	R0, #52429
MOVT	R0, #16204
VMOV	S0, R0
VMUL.F32	S1, S0, S1
VMOV.F32	S0, #18
VMUL.F32	S0, S1, S0
MOVW	R0, #lo_addr(_ai+20)
MOVT	R0, #hi_addr(_ai+20)
VSTR	#1, S0, [R0, #0]
;parameter_anterior.h,361 :: 		bi[5] = 0.4 / modFactor;
MOVW	R1, #lo_addr(_modFactor+0)
MOVT	R1, #hi_addr(_modFactor+0)
VLDR	#1, S1, [R1, #0]
MOVW	R0, #52429
MOVT	R0, #16076
VMOV	S0, R0
VDIV.F32	S0, S0, S1
MOVW	R0, #lo_addr(_bi+20)
MOVT	R0, #hi_addr(_bi+20)
VSTR	#1, S0, [R0, #0]
;parameter_anterior.h,362 :: 		ti[6] = 100 * sqrt(modFactor);
MOV	R0, R1
VLDR	#1, S0, [R0, #0]
BL	_sqrt+0
MOVW	R0, #0
MOVT	R0, #17096
VMOV	S1, R0
VMUL.F32	S0, S1, S0
MOVW	R0, #lo_addr(_ti+24)
MOVT	R0, #hi_addr(_ti+24)
VSTR	#1, S0, [R0, #0]
;parameter_anterior.h,363 :: 		ai[6] = 0.9 *((modFactor * modFactor)*sqrt(modFactor)) * 18;
MOVW	R1, #lo_addr(_modFactor+0)
MOVT	R1, #hi_addr(_modFactor+0)
VLDR	#1, S1, [R1, #0]
MOV	R0, R1
VLDR	#1, S0, [R0, #0]
VMUL.F32	S0, S0, S1
VSTR	#1, S0, [SP, #4]
MOV	R0, R1
VLDR	#1, S0, [R0, #0]
BL	_sqrt+0
VLDR	#1, S1, [SP, #4]
VMUL.F32	S1, S1, S0
MOVW	R0, #26214
MOVT	R0, #16230
VMOV	S0, R0
VMUL.F32	S1, S0, S1
VMOV.F32	S0, #18
VMUL.F32	S0, S1, S0
MOVW	R0, #lo_addr(_ai+24)
MOVT	R0, #hi_addr(_ai+24)
VSTR	#1, S0, [R0, #0]
;parameter_anterior.h,364 :: 		bi[6] = 0.2 * modFactor;
MOVW	R0, #lo_addr(_modFactor+0)
MOVT	R0, #hi_addr(_modFactor+0)
VLDR	#1, S1, [R0, #0]
MOVW	R0, #52429
MOVT	R0, #15948
VMOV	S0, R0
VMUL.F32	S0, S0, S1
MOVW	R0, #lo_addr(_bi+24)
MOVT	R0, #hi_addr(_bi+24)
VSTR	#1, S0, [R0, #0]
;parameter_anterior.h,367 :: 		for (i = 1; i <= 6; i++)
; i start address is: 12 (R3)
MOVS	R3, #1
SXTH	R3, R3
; i end address is: 12 (R3)
L_anteriorV690:
; i start address is: 12 (R3)
CMP	R3, #6
IT	GT
BGT	L_anteriorV691
;parameter_anterior.h,369 :: 		ti[i] = ti[i] * (pi / 180.0); // konversi ke radian
LSLS	R1, R3, #2
MOVW	R0, #lo_addr(_ti+0)
MOVT	R0, #hi_addr(_ti+0)
ADDS	R2, R0, R1
VLDR	#1, S1, [R2, #0]
MOVW	R0, #64053
MOVT	R0, #15502
VMOV	S0, R0
VMUL.F32	S0, S1, S0
VSTR	#1, S0, [R2, #0]
;parameter_anterior.h,367 :: 		for (i = 1; i <= 6; i++)
ADDS	R3, R3, #1
SXTH	R3, R3
;parameter_anterior.h,370 :: 		}
; i end address is: 12 (R3)
IT	AL
BAL	L_anteriorV690
L_anteriorV691:
;parameter_anterior.h,371 :: 		}
L_end_anteriorV6:
LDR	LR, [SP, #0]
ADD	SP, SP, #8
BX	LR
; end of _anteriorV6
_inferior1:
;parameter_inferior.h,1 :: 		void inferior1()
SUB	SP, SP, #8
STR	LR, [SP, #0]
;parameter_inferior.h,4 :: 		modFactor = sqrt((float)hmean / 60.0);
MOVW	R0, #lo_addr(_hmean+0)
MOVT	R0, #hi_addr(_hmean+0)
VLDR	#1, S1, [R0, #0]
MOVW	R0, #0
MOVT	R0, #17008
VMOV	S0, R0
VDIV.F32	S0, S1, S0
BL	_sqrt+0
MOVW	R0, #lo_addr(_modFactor+0)
MOVT	R0, #hi_addr(_modFactor+0)
VSTR	#1, S0, [R0, #0]
;parameter_inferior.h,6 :: 		ti[1] = -60 * sqrt(modFactor);
VMOV.F32	S0, S0
BL	_sqrt+0
MOVW	R0, #0
MOVT	R0, #49776
VMOV	S1, R0
VMUL.F32	S0, S1, S0
MOVW	R0, #lo_addr(_ti+4)
MOVT	R0, #hi_addr(_ti+4)
VSTR	#1, S0, [R0, #0]
;parameter_inferior.h,7 :: 		ai[1] = 0.8 * 18;
MOVW	R0, #26215
MOVT	R0, #16742
VMOV	S0, R0
MOVW	R0, #lo_addr(_ai+4)
MOVT	R0, #hi_addr(_ai+4)
VSTR	#1, S0, [R0, #0]
;parameter_inferior.h,8 :: 		bi[1] = 0.2 * modFactor;
MOVW	R1, #lo_addr(_modFactor+0)
MOVT	R1, #hi_addr(_modFactor+0)
VLDR	#1, S1, [R1, #0]
MOVW	R0, #52429
MOVT	R0, #15948
VMOV	S0, R0
VMUL.F32	S0, S0, S1
MOVW	R0, #lo_addr(_bi+4)
MOVT	R0, #hi_addr(_bi+4)
VSTR	#1, S0, [R0, #0]
;parameter_inferior.h,9 :: 		ti[2] = -15 * modFactor;
MOV	R0, R1
VLDR	#1, S1, [R0, #0]
VMOV.F32	S0, #-15
VMUL.F32	S0, S0, S1
MOVW	R0, #lo_addr(_ti+8)
MOVT	R0, #hi_addr(_ti+8)
VSTR	#1, S0, [R0, #0]
;parameter_inferior.h,10 :: 		ai[2] = 0.5 * 18;
VMOV.F32	S0, #9
MOVW	R0, #lo_addr(_ai+8)
MOVT	R0, #hi_addr(_ai+8)
VSTR	#1, S0, [R0, #0]
;parameter_inferior.h,11 :: 		bi[2] = 0.1 * modFactor;
MOV	R0, R1
VLDR	#1, S1, [R0, #0]
MOVW	R0, #52429
MOVT	R0, #15820
VMOV	S0, R0
VMUL.F32	S0, S0, S1
MOVW	R0, #lo_addr(_bi+8)
MOVT	R0, #hi_addr(_bi+8)
VSTR	#1, S0, [R0, #0]
;parameter_inferior.h,12 :: 		ti[3] = 0;
MOV	R0, #0
VMOV	S0, R0
MOVW	R0, #lo_addr(_ti+12)
MOVT	R0, #hi_addr(_ti+12)
VSTR	#1, S0, [R0, #0]
;parameter_inferior.h,13 :: 		ai[3] = 37.5 * 18;
MOVW	R0, #49152
MOVT	R0, #17448
VMOV	S0, R0
MOVW	R0, #lo_addr(_ai+12)
MOVT	R0, #hi_addr(_ai+12)
VSTR	#1, S0, [R0, #0]
;parameter_inferior.h,14 :: 		bi[3] = 0.1 * modFactor;
MOV	R0, R1
VLDR	#1, S1, [R0, #0]
MOVW	R0, #52429
MOVT	R0, #15820
VMOV	S0, R0
VMUL.F32	S0, S0, S1
MOVW	R0, #lo_addr(_bi+12)
MOVT	R0, #hi_addr(_bi+12)
VSTR	#1, S0, [R0, #0]
;parameter_inferior.h,15 :: 		ti[4] = 15 * modFactor;
MOV	R0, R1
VLDR	#1, S1, [R0, #0]
VMOV.F32	S0, #15
VMUL.F32	S0, S0, S1
MOVW	R0, #lo_addr(_ti+16)
MOVT	R0, #hi_addr(_ti+16)
VSTR	#1, S0, [R0, #0]
;parameter_inferior.h,16 :: 		ai[4] = -7 * 18;
MOVW	R0, #0
MOVT	R0, #49916
VMOV	S0, R0
MOVW	R0, #lo_addr(_ai+16)
MOVT	R0, #hi_addr(_ai+16)
VSTR	#1, S0, [R0, #0]
;parameter_inferior.h,17 :: 		bi[4] = 0.1 * modFactor;
MOV	R0, R1
VLDR	#1, S1, [R0, #0]
MOVW	R0, #52429
MOVT	R0, #15820
VMOV	S0, R0
VMUL.F32	S0, S0, S1
MOVW	R0, #lo_addr(_bi+16)
MOVT	R0, #hi_addr(_bi+16)
VSTR	#1, S0, [R0, #0]
;parameter_inferior.h,18 :: 		ti[5] = 97 * sqrt(modFactor);
MOV	R0, R1
VLDR	#1, S0, [R0, #0]
BL	_sqrt+0
MOVW	R0, #0
MOVT	R0, #17090
VMOV	S1, R0
VMUL.F32	S0, S1, S0
MOVW	R0, #lo_addr(_ti+20)
MOVT	R0, #hi_addr(_ti+20)
VSTR	#1, S0, [R0, #0]
;parameter_inferior.h,19 :: 		ai[5] = 0.25 * ((modFactor * modFactor)*sqrt(modFactor)) * 18;
MOVW	R1, #lo_addr(_modFactor+0)
MOVT	R1, #hi_addr(_modFactor+0)
VLDR	#1, S1, [R1, #0]
MOV	R0, R1
VLDR	#1, S0, [R0, #0]
VMUL.F32	S0, S0, S1
VSTR	#1, S0, [SP, #4]
MOV	R0, R1
VLDR	#1, S0, [R0, #0]
BL	_sqrt+0
VLDR	#1, S1, [SP, #4]
VMUL.F32	S1, S1, S0
VMOV.F32	S0, #0.25
VMUL.F32	S1, S0, S1
VMOV.F32	S0, #18
VMUL.F32	S0, S1, S0
MOVW	R0, #lo_addr(_ai+20)
MOVT	R0, #hi_addr(_ai+20)
VSTR	#1, S0, [R0, #0]
;parameter_inferior.h,20 :: 		bi[5] = 0.4 / modFactor;
MOVW	R1, #lo_addr(_modFactor+0)
MOVT	R1, #hi_addr(_modFactor+0)
VLDR	#1, S1, [R1, #0]
MOVW	R0, #52429
MOVT	R0, #16076
VMOV	S0, R0
VDIV.F32	S0, S0, S1
MOVW	R0, #lo_addr(_bi+20)
MOVT	R0, #hi_addr(_bi+20)
VSTR	#1, S0, [R0, #0]
;parameter_inferior.h,21 :: 		ti[6] = 100 * sqrt(modFactor);
MOV	R0, R1
VLDR	#1, S0, [R0, #0]
BL	_sqrt+0
MOVW	R0, #0
MOVT	R0, #17096
VMOV	S1, R0
VMUL.F32	S0, S1, S0
MOVW	R0, #lo_addr(_ti+24)
MOVT	R0, #hi_addr(_ti+24)
VSTR	#1, S0, [R0, #0]
;parameter_inferior.h,22 :: 		ai[6] = 0.35 *((modFactor * modFactor)*sqrt(modFactor)) * 18;
MOVW	R1, #lo_addr(_modFactor+0)
MOVT	R1, #hi_addr(_modFactor+0)
VLDR	#1, S1, [R1, #0]
MOV	R0, R1
VLDR	#1, S0, [R0, #0]
VMUL.F32	S0, S0, S1
VSTR	#1, S0, [SP, #4]
MOV	R0, R1
VLDR	#1, S0, [R0, #0]
BL	_sqrt+0
VLDR	#1, S1, [SP, #4]
VMUL.F32	S1, S1, S0
MOVW	R0, #13107
MOVT	R0, #16051
VMOV	S0, R0
VMUL.F32	S1, S0, S1
VMOV.F32	S0, #18
VMUL.F32	S0, S1, S0
MOVW	R0, #lo_addr(_ai+24)
MOVT	R0, #hi_addr(_ai+24)
VSTR	#1, S0, [R0, #0]
;parameter_inferior.h,23 :: 		bi[6] = 0.2 * modFactor;
MOVW	R0, #lo_addr(_modFactor+0)
MOVT	R0, #hi_addr(_modFactor+0)
VLDR	#1, S1, [R0, #0]
MOVW	R0, #52429
MOVT	R0, #15948
VMOV	S0, R0
VMUL.F32	S0, S0, S1
MOVW	R0, #lo_addr(_bi+24)
MOVT	R0, #hi_addr(_bi+24)
VSTR	#1, S0, [R0, #0]
;parameter_inferior.h,26 :: 		for (i = 1; i <= 6; i++)
; i start address is: 12 (R3)
MOVS	R3, #1
SXTH	R3, R3
; i end address is: 12 (R3)
L_inferior193:
; i start address is: 12 (R3)
CMP	R3, #6
IT	GT
BGT	L_inferior194
;parameter_inferior.h,28 :: 		ti[i] = ti[i] * (pi / 180.0); // konversi ke radian
LSLS	R1, R3, #2
MOVW	R0, #lo_addr(_ti+0)
MOVT	R0, #hi_addr(_ti+0)
ADDS	R2, R0, R1
VLDR	#1, S1, [R2, #0]
MOVW	R0, #64053
MOVT	R0, #15502
VMOV	S0, R0
VMUL.F32	S0, S1, S0
VSTR	#1, S0, [R2, #0]
;parameter_inferior.h,26 :: 		for (i = 1; i <= 6; i++)
ADDS	R3, R3, #1
SXTH	R3, R3
;parameter_inferior.h,29 :: 		}
; i end address is: 12 (R3)
IT	AL
BAL	L_inferior193
L_inferior194:
;parameter_inferior.h,30 :: 		}
L_end_inferior1:
LDR	LR, [SP, #0]
ADD	SP, SP, #8
BX	LR
; end of _inferior1
_inferior2:
;parameter_inferior.h,32 :: 		void inferior2()
SUB	SP, SP, #8
STR	LR, [SP, #0]
;parameter_inferior.h,35 :: 		modFactor = sqrt((float)hmean / 60.0);
MOVW	R0, #lo_addr(_hmean+0)
MOVT	R0, #hi_addr(_hmean+0)
VLDR	#1, S1, [R0, #0]
MOVW	R0, #0
MOVT	R0, #17008
VMOV	S0, R0
VDIV.F32	S0, S1, S0
BL	_sqrt+0
MOVW	R0, #lo_addr(_modFactor+0)
MOVT	R0, #hi_addr(_modFactor+0)
VSTR	#1, S0, [R0, #0]
;parameter_inferior.h,37 :: 		ti[1] = -60 * sqrt(modFactor);
VMOV.F32	S0, S0
BL	_sqrt+0
MOVW	R0, #0
MOVT	R0, #49776
VMOV	S1, R0
VMUL.F32	S0, S1, S0
MOVW	R0, #lo_addr(_ti+4)
MOVT	R0, #hi_addr(_ti+4)
VSTR	#1, S0, [R0, #0]
;parameter_inferior.h,38 :: 		ai[1] = 1.2 * 18;
MOVW	R0, #52429
MOVT	R0, #16812
VMOV	S0, R0
MOVW	R0, #lo_addr(_ai+4)
MOVT	R0, #hi_addr(_ai+4)
VSTR	#1, S0, [R0, #0]
;parameter_inferior.h,39 :: 		bi[1] = 0.2 * modFactor;
MOVW	R1, #lo_addr(_modFactor+0)
MOVT	R1, #hi_addr(_modFactor+0)
VLDR	#1, S1, [R1, #0]
MOVW	R0, #52429
MOVT	R0, #15948
VMOV	S0, R0
VMUL.F32	S0, S0, S1
MOVW	R0, #lo_addr(_bi+4)
MOVT	R0, #hi_addr(_bi+4)
VSTR	#1, S0, [R0, #0]
;parameter_inferior.h,40 :: 		ti[2] = -15 * modFactor;
MOV	R0, R1
VLDR	#1, S1, [R0, #0]
VMOV.F32	S0, #-15
VMUL.F32	S0, S0, S1
MOVW	R0, #lo_addr(_ti+8)
MOVT	R0, #hi_addr(_ti+8)
VSTR	#1, S0, [R0, #0]
;parameter_inferior.h,41 :: 		ai[2] = -6 * 18;
MOVW	R0, #0
MOVT	R0, #49880
VMOV	S0, R0
MOVW	R0, #lo_addr(_ai+8)
MOVT	R0, #hi_addr(_ai+8)
VSTR	#1, S0, [R0, #0]
;parameter_inferior.h,42 :: 		bi[2] = 0.1 * modFactor;
MOV	R0, R1
VLDR	#1, S1, [R0, #0]
MOVW	R0, #52429
MOVT	R0, #15820
VMOV	S0, R0
VMUL.F32	S0, S0, S1
MOVW	R0, #lo_addr(_bi+8)
MOVT	R0, #hi_addr(_bi+8)
VSTR	#1, S0, [R0, #0]
;parameter_inferior.h,43 :: 		ti[3] = 0;
MOV	R0, #0
VMOV	S0, R0
MOVW	R0, #lo_addr(_ti+12)
MOVT	R0, #hi_addr(_ti+12)
VSTR	#1, S0, [R0, #0]
;parameter_inferior.h,44 :: 		ai[3] = 52.5 * 18;
MOVW	R0, #16384
MOVT	R0, #17516
VMOV	S0, R0
MOVW	R0, #lo_addr(_ai+12)
MOVT	R0, #hi_addr(_ai+12)
VSTR	#1, S0, [R0, #0]
;parameter_inferior.h,45 :: 		bi[3] = 0.1 * modFactor;
MOV	R0, R1
VLDR	#1, S1, [R0, #0]
MOVW	R0, #52429
MOVT	R0, #15820
VMOV	S0, R0
VMUL.F32	S0, S0, S1
MOVW	R0, #lo_addr(_bi+12)
MOVT	R0, #hi_addr(_bi+12)
VSTR	#1, S0, [R0, #0]
;parameter_inferior.h,46 :: 		ti[4] = 15 * modFactor;
MOV	R0, R1
VLDR	#1, S1, [R0, #0]
VMOV.F32	S0, #15
VMUL.F32	S0, S0, S1
MOVW	R0, #lo_addr(_ti+16)
MOVT	R0, #hi_addr(_ti+16)
VSTR	#1, S0, [R0, #0]
;parameter_inferior.h,47 :: 		ai[4] = 0.5 * 18;
VMOV.F32	S0, #9
MOVW	R0, #lo_addr(_ai+16)
MOVT	R0, #hi_addr(_ai+16)
VSTR	#1, S0, [R0, #0]
;parameter_inferior.h,48 :: 		bi[4] = 0.2 * modFactor;
MOV	R0, R1
VLDR	#1, S1, [R0, #0]
MOVW	R0, #52429
MOVT	R0, #15948
VMOV	S0, R0
VMUL.F32	S0, S0, S1
MOVW	R0, #lo_addr(_bi+16)
MOVT	R0, #hi_addr(_bi+16)
VSTR	#1, S0, [R0, #0]
;parameter_inferior.h,49 :: 		ti[5] = 67 * sqrt(modFactor);
MOV	R0, R1
VLDR	#1, S0, [R0, #0]
BL	_sqrt+0
MOVW	R0, #0
MOVT	R0, #17030
VMOV	S1, R0
VMUL.F32	S0, S1, S0
MOVW	R0, #lo_addr(_ti+20)
MOVT	R0, #hi_addr(_ti+20)
VSTR	#1, S0, [R0, #0]
;parameter_inferior.h,50 :: 		ai[5] = 1.67 * ((modFactor * modFactor)*sqrt(modFactor)) * 18;
MOVW	R1, #lo_addr(_modFactor+0)
MOVT	R1, #hi_addr(_modFactor+0)
VLDR	#1, S1, [R1, #0]
MOV	R0, R1
VLDR	#1, S0, [R0, #0]
VMUL.F32	S0, S0, S1
VSTR	#1, S0, [SP, #4]
MOV	R0, R1
VLDR	#1, S0, [R0, #0]
BL	_sqrt+0
VLDR	#1, S1, [SP, #4]
VMUL.F32	S1, S1, S0
MOVW	R0, #49807
MOVT	R0, #16341
VMOV	S0, R0
VMUL.F32	S1, S0, S1
VMOV.F32	S0, #18
VMUL.F32	S0, S1, S0
MOVW	R0, #lo_addr(_ai+20)
MOVT	R0, #hi_addr(_ai+20)
VSTR	#1, S0, [R0, #0]
;parameter_inferior.h,51 :: 		bi[5] = 0.4 / modFactor;
MOVW	R1, #lo_addr(_modFactor+0)
MOVT	R1, #hi_addr(_modFactor+0)
VLDR	#1, S1, [R1, #0]
MOVW	R0, #52429
MOVT	R0, #16076
VMOV	S0, R0
VDIV.F32	S0, S0, S1
MOVW	R0, #lo_addr(_bi+20)
MOVT	R0, #hi_addr(_bi+20)
VSTR	#1, S0, [R0, #0]
;parameter_inferior.h,52 :: 		ti[6] = 70 * sqrt(modFactor);
MOV	R0, R1
VLDR	#1, S0, [R0, #0]
BL	_sqrt+0
MOVW	R0, #0
MOVT	R0, #17036
VMOV	S1, R0
VMUL.F32	S0, S1, S0
MOVW	R0, #lo_addr(_ti+24)
MOVT	R0, #hi_addr(_ti+24)
VSTR	#1, S0, [R0, #0]
;parameter_inferior.h,53 :: 		ai[6] = 2.5 *((modFactor * modFactor)*sqrt(modFactor)) * 18;
MOVW	R1, #lo_addr(_modFactor+0)
MOVT	R1, #hi_addr(_modFactor+0)
VLDR	#1, S1, [R1, #0]
MOV	R0, R1
VLDR	#1, S0, [R0, #0]
VMUL.F32	S0, S0, S1
VSTR	#1, S0, [SP, #4]
MOV	R0, R1
VLDR	#1, S0, [R0, #0]
BL	_sqrt+0
VLDR	#1, S1, [SP, #4]
VMUL.F32	S1, S1, S0
VMOV.F32	S0, #2.5
VMUL.F32	S1, S0, S1
VMOV.F32	S0, #18
VMUL.F32	S0, S1, S0
MOVW	R0, #lo_addr(_ai+24)
MOVT	R0, #hi_addr(_ai+24)
VSTR	#1, S0, [R0, #0]
;parameter_inferior.h,54 :: 		bi[6] = 0.2 * modFactor;
MOVW	R0, #lo_addr(_modFactor+0)
MOVT	R0, #hi_addr(_modFactor+0)
VLDR	#1, S1, [R0, #0]
MOVW	R0, #52429
MOVT	R0, #15948
VMOV	S0, R0
VMUL.F32	S0, S0, S1
MOVW	R0, #lo_addr(_bi+24)
MOVT	R0, #hi_addr(_bi+24)
VSTR	#1, S0, [R0, #0]
;parameter_inferior.h,57 :: 		for (i = 1; i <= 6; i++)
; i start address is: 12 (R3)
MOVS	R3, #1
SXTH	R3, R3
; i end address is: 12 (R3)
L_inferior296:
; i start address is: 12 (R3)
CMP	R3, #6
IT	GT
BGT	L_inferior297
;parameter_inferior.h,59 :: 		ti[i] = ti[i] * (pi / 180.0); // konversi ke radian
LSLS	R1, R3, #2
MOVW	R0, #lo_addr(_ti+0)
MOVT	R0, #hi_addr(_ti+0)
ADDS	R2, R0, R1
VLDR	#1, S1, [R2, #0]
MOVW	R0, #64053
MOVT	R0, #15502
VMOV	S0, R0
VMUL.F32	S0, S1, S0
VSTR	#1, S0, [R2, #0]
;parameter_inferior.h,57 :: 		for (i = 1; i <= 6; i++)
ADDS	R3, R3, #1
SXTH	R3, R3
;parameter_inferior.h,60 :: 		}
; i end address is: 12 (R3)
IT	AL
BAL	L_inferior296
L_inferior297:
;parameter_inferior.h,61 :: 		}
L_end_inferior2:
LDR	LR, [SP, #0]
ADD	SP, SP, #8
BX	LR
; end of _inferior2
_inferior3:
;parameter_inferior.h,63 :: 		void inferior3()
SUB	SP, SP, #8
STR	LR, [SP, #0]
;parameter_inferior.h,66 :: 		modFactor = sqrt((float)hmean / 60.0);
MOVW	R0, #lo_addr(_hmean+0)
MOVT	R0, #hi_addr(_hmean+0)
VLDR	#1, S1, [R0, #0]
MOVW	R0, #0
MOVT	R0, #17008
VMOV	S0, R0
VDIV.F32	S0, S1, S0
BL	_sqrt+0
MOVW	R0, #lo_addr(_modFactor+0)
MOVT	R0, #hi_addr(_modFactor+0)
VSTR	#1, S0, [R0, #0]
;parameter_inferior.h,68 :: 		ti[1] = -60 * sqrt(modFactor);
VMOV.F32	S0, S0
BL	_sqrt+0
MOVW	R0, #0
MOVT	R0, #49776
VMOV	S1, R0
VMUL.F32	S0, S1, S0
MOVW	R0, #lo_addr(_ti+4)
MOVT	R0, #hi_addr(_ti+4)
VSTR	#1, S0, [R0, #0]
;parameter_inferior.h,69 :: 		ai[1] = 0.8 * 18;
MOVW	R0, #26215
MOVT	R0, #16742
VMOV	S0, R0
MOVW	R0, #lo_addr(_ai+4)
MOVT	R0, #hi_addr(_ai+4)
VSTR	#1, S0, [R0, #0]
;parameter_inferior.h,70 :: 		bi[1] = 0.2 * modFactor;
MOVW	R1, #lo_addr(_modFactor+0)
MOVT	R1, #hi_addr(_modFactor+0)
VLDR	#1, S1, [R1, #0]
MOVW	R0, #52429
MOVT	R0, #15948
VMOV	S0, R0
VMUL.F32	S0, S0, S1
MOVW	R0, #lo_addr(_bi+4)
MOVT	R0, #hi_addr(_bi+4)
VSTR	#1, S0, [R0, #0]
;parameter_inferior.h,71 :: 		ti[2] = -15 * modFactor;
MOV	R0, R1
VLDR	#1, S1, [R0, #0]
VMOV.F32	S0, #-15
VMUL.F32	S0, S0, S1
MOVW	R0, #lo_addr(_ti+8)
MOVT	R0, #hi_addr(_ti+8)
VSTR	#1, S0, [R0, #0]
;parameter_inferior.h,72 :: 		ai[2] = -6 * 18;
MOVW	R0, #0
MOVT	R0, #49880
VMOV	S0, R0
MOVW	R0, #lo_addr(_ai+8)
MOVT	R0, #hi_addr(_ai+8)
VSTR	#1, S0, [R0, #0]
;parameter_inferior.h,73 :: 		bi[2] = 0.1 * modFactor;
MOV	R0, R1
VLDR	#1, S1, [R0, #0]
MOVW	R0, #52429
MOVT	R0, #15820
VMOV	S0, R0
VMUL.F32	S0, S0, S1
MOVW	R0, #lo_addr(_bi+8)
MOVT	R0, #hi_addr(_bi+8)
VSTR	#1, S0, [R0, #0]
;parameter_inferior.h,74 :: 		ti[3] = 0;
MOV	R0, #0
VMOV	S0, R0
MOVW	R0, #lo_addr(_ti+12)
MOVT	R0, #hi_addr(_ti+12)
VSTR	#1, S0, [R0, #0]
;parameter_inferior.h,75 :: 		ai[3] = 33.75 * 18;
MOVW	R0, #57344
MOVT	R0, #17431
VMOV	S0, R0
MOVW	R0, #lo_addr(_ai+12)
MOVT	R0, #hi_addr(_ai+12)
VSTR	#1, S0, [R0, #0]
;parameter_inferior.h,76 :: 		bi[3] = 0.1 * modFactor;
MOV	R0, R1
VLDR	#1, S1, [R0, #0]
MOVW	R0, #52429
MOVT	R0, #15820
VMOV	S0, R0
VMUL.F32	S0, S0, S1
MOVW	R0, #lo_addr(_bi+12)
MOVT	R0, #hi_addr(_bi+12)
VSTR	#1, S0, [R0, #0]
;parameter_inferior.h,77 :: 		ti[4] = 15 * modFactor;
MOV	R0, R1
VLDR	#1, S1, [R0, #0]
VMOV.F32	S0, #15
VMUL.F32	S0, S0, S1
MOVW	R0, #lo_addr(_ti+16)
MOVT	R0, #hi_addr(_ti+16)
VSTR	#1, S0, [R0, #0]
;parameter_inferior.h,78 :: 		ai[4] = 0.5 * 18;
VMOV.F32	S0, #9
MOVW	R0, #lo_addr(_ai+16)
MOVT	R0, #hi_addr(_ai+16)
VSTR	#1, S0, [R0, #0]
;parameter_inferior.h,79 :: 		bi[4] = 0.2 * modFactor;
MOV	R0, R1
VLDR	#1, S1, [R0, #0]
MOVW	R0, #52429
MOVT	R0, #15948
VMOV	S0, R0
VMUL.F32	S0, S0, S1
MOVW	R0, #lo_addr(_bi+16)
MOVT	R0, #hi_addr(_bi+16)
VSTR	#1, S0, [R0, #0]
;parameter_inferior.h,80 :: 		ti[5] = 67 * sqrt(modFactor);
MOV	R0, R1
VLDR	#1, S0, [R0, #0]
BL	_sqrt+0
MOVW	R0, #0
MOVT	R0, #17030
VMOV	S1, R0
VMUL.F32	S0, S1, S0
MOVW	R0, #lo_addr(_ti+20)
MOVT	R0, #hi_addr(_ti+20)
VSTR	#1, S0, [R0, #0]
;parameter_inferior.h,81 :: 		ai[5] = 0.9 * ((modFactor * modFactor)*sqrt(modFactor)) * 18;
MOVW	R1, #lo_addr(_modFactor+0)
MOVT	R1, #hi_addr(_modFactor+0)
VLDR	#1, S1, [R1, #0]
MOV	R0, R1
VLDR	#1, S0, [R0, #0]
VMUL.F32	S0, S0, S1
VSTR	#1, S0, [SP, #4]
MOV	R0, R1
VLDR	#1, S0, [R0, #0]
BL	_sqrt+0
VLDR	#1, S1, [SP, #4]
VMUL.F32	S1, S1, S0
MOVW	R0, #26214
MOVT	R0, #16230
VMOV	S0, R0
VMUL.F32	S1, S0, S1
VMOV.F32	S0, #18
VMUL.F32	S0, S1, S0
MOVW	R0, #lo_addr(_ai+20)
MOVT	R0, #hi_addr(_ai+20)
VSTR	#1, S0, [R0, #0]
;parameter_inferior.h,82 :: 		bi[5] = 0.45 / modFactor;
MOVW	R1, #lo_addr(_modFactor+0)
MOVT	R1, #hi_addr(_modFactor+0)
VLDR	#1, S1, [R1, #0]
MOVW	R0, #26214
MOVT	R0, #16102
VMOV	S0, R0
VDIV.F32	S0, S0, S1
MOVW	R0, #lo_addr(_bi+20)
MOVT	R0, #hi_addr(_bi+20)
VSTR	#1, S0, [R0, #0]
;parameter_inferior.h,83 :: 		ti[6] = 70 * sqrt(modFactor);
MOV	R0, R1
VLDR	#1, S0, [R0, #0]
BL	_sqrt+0
MOVW	R0, #0
MOVT	R0, #17036
VMOV	S1, R0
VMUL.F32	S0, S1, S0
MOVW	R0, #lo_addr(_ti+24)
MOVT	R0, #hi_addr(_ti+24)
VSTR	#1, S0, [R0, #0]
;parameter_inferior.h,84 :: 		ai[6] = 1.5 *((modFactor * modFactor)*sqrt(modFactor)) * 18;
MOVW	R1, #lo_addr(_modFactor+0)
MOVT	R1, #hi_addr(_modFactor+0)
VLDR	#1, S1, [R1, #0]
MOV	R0, R1
VLDR	#1, S0, [R0, #0]
VMUL.F32	S0, S0, S1
VSTR	#1, S0, [SP, #4]
MOV	R0, R1
VLDR	#1, S0, [R0, #0]
BL	_sqrt+0
VLDR	#1, S1, [SP, #4]
VMUL.F32	S1, S1, S0
VMOV.F32	S0, #1.5
VMUL.F32	S1, S0, S1
VMOV.F32	S0, #18
VMUL.F32	S0, S1, S0
MOVW	R0, #lo_addr(_ai+24)
MOVT	R0, #hi_addr(_ai+24)
VSTR	#1, S0, [R0, #0]
;parameter_inferior.h,85 :: 		bi[6] = 0.25 * modFactor;
MOVW	R0, #lo_addr(_modFactor+0)
MOVT	R0, #hi_addr(_modFactor+0)
VLDR	#1, S1, [R0, #0]
VMOV.F32	S0, #0.25
VMUL.F32	S0, S0, S1
MOVW	R0, #lo_addr(_bi+24)
MOVT	R0, #hi_addr(_bi+24)
VSTR	#1, S0, [R0, #0]
;parameter_inferior.h,88 :: 		for (i = 1; i <= 6; i++)
; i start address is: 12 (R3)
MOVS	R3, #1
SXTH	R3, R3
; i end address is: 12 (R3)
L_inferior399:
; i start address is: 12 (R3)
CMP	R3, #6
IT	GT
BGT	L_inferior3100
;parameter_inferior.h,90 :: 		ti[i] = ti[i] * (pi / 180.0); // konversi ke radian
LSLS	R1, R3, #2
MOVW	R0, #lo_addr(_ti+0)
MOVT	R0, #hi_addr(_ti+0)
ADDS	R2, R0, R1
VLDR	#1, S1, [R2, #0]
MOVW	R0, #64053
MOVT	R0, #15502
VMOV	S0, R0
VMUL.F32	S0, S1, S0
VSTR	#1, S0, [R2, #0]
;parameter_inferior.h,88 :: 		for (i = 1; i <= 6; i++)
ADDS	R3, R3, #1
SXTH	R3, R3
;parameter_inferior.h,91 :: 		}
; i end address is: 12 (R3)
IT	AL
BAL	L_inferior399
L_inferior3100:
;parameter_inferior.h,92 :: 		}
L_end_inferior3:
LDR	LR, [SP, #0]
ADD	SP, SP, #8
BX	LR
; end of _inferior3
_inferioraVR:
;parameter_inferior.h,94 :: 		void inferioraVR()
SUB	SP, SP, #8
STR	LR, [SP, #0]
;parameter_inferior.h,97 :: 		modFactor = sqrt((float)hmean / 60.0);
MOVW	R0, #lo_addr(_hmean+0)
MOVT	R0, #hi_addr(_hmean+0)
VLDR	#1, S1, [R0, #0]
MOVW	R0, #0
MOVT	R0, #17008
VMOV	S0, R0
VDIV.F32	S0, S1, S0
BL	_sqrt+0
MOVW	R0, #lo_addr(_modFactor+0)
MOVT	R0, #hi_addr(_modFactor+0)
VSTR	#1, S0, [R0, #0]
;parameter_inferior.h,99 :: 		ti[1] = -60 * sqrt(modFactor);
VMOV.F32	S0, S0
BL	_sqrt+0
MOVW	R0, #0
MOVT	R0, #49776
VMOV	S1, R0
VMUL.F32	S0, S1, S0
MOVW	R0, #lo_addr(_ti+4)
MOVT	R0, #hi_addr(_ti+4)
VSTR	#1, S0, [R0, #0]
;parameter_inferior.h,100 :: 		ai[1] = -0.8 * 18;
MOVW	R0, #26215
MOVT	R0, #49510
VMOV	S0, R0
MOVW	R0, #lo_addr(_ai+4)
MOVT	R0, #hi_addr(_ai+4)
VSTR	#1, S0, [R0, #0]
;parameter_inferior.h,101 :: 		bi[1] = 0.2 * modFactor;
MOVW	R1, #lo_addr(_modFactor+0)
MOVT	R1, #hi_addr(_modFactor+0)
VLDR	#1, S1, [R1, #0]
MOVW	R0, #52429
MOVT	R0, #15948
VMOV	S0, R0
VMUL.F32	S0, S0, S1
MOVW	R0, #lo_addr(_bi+4)
MOVT	R0, #hi_addr(_bi+4)
VSTR	#1, S0, [R0, #0]
;parameter_inferior.h,102 :: 		ti[2] = -15 * modFactor;
MOV	R0, R1
VLDR	#1, S1, [R0, #0]
VMOV.F32	S0, #-15
VMUL.F32	S0, S0, S1
MOVW	R0, #lo_addr(_ti+8)
MOVT	R0, #hi_addr(_ti+8)
VSTR	#1, S0, [R0, #0]
;parameter_inferior.h,103 :: 		ai[2] = 0.5 * 18;
VMOV.F32	S0, #9
MOVW	R0, #lo_addr(_ai+8)
MOVT	R0, #hi_addr(_ai+8)
VSTR	#1, S0, [R0, #0]
;parameter_inferior.h,104 :: 		bi[2] = 0.1 * modFactor;
MOV	R0, R1
VLDR	#1, S1, [R0, #0]
MOVW	R0, #52429
MOVT	R0, #15820
VMOV	S0, R0
VMUL.F32	S0, S0, S1
MOVW	R0, #lo_addr(_bi+8)
MOVT	R0, #hi_addr(_bi+8)
VSTR	#1, S0, [R0, #0]
;parameter_inferior.h,105 :: 		ti[3] = 0;
MOV	R0, #0
VMOV	S0, R0
MOVW	R0, #lo_addr(_ti+12)
MOVT	R0, #hi_addr(_ti+12)
VSTR	#1, S0, [R0, #0]
;parameter_inferior.h,106 :: 		ai[3] = -26.25 * 18;
MOVW	R0, #16384
MOVT	R0, #50156
VMOV	S0, R0
MOVW	R0, #lo_addr(_ai+12)
MOVT	R0, #hi_addr(_ai+12)
VSTR	#1, S0, [R0, #0]
;parameter_inferior.h,107 :: 		bi[3] = 0.1 * modFactor;
MOV	R0, R1
VLDR	#1, S1, [R0, #0]
MOVW	R0, #52429
MOVT	R0, #15820
VMOV	S0, R0
VMUL.F32	S0, S0, S1
MOVW	R0, #lo_addr(_bi+12)
MOVT	R0, #hi_addr(_bi+12)
VSTR	#1, S0, [R0, #0]
;parameter_inferior.h,108 :: 		ti[4] = 15 * modFactor;
MOV	R0, R1
VLDR	#1, S1, [R0, #0]
VMOV.F32	S0, #15
VMUL.F32	S0, S0, S1
MOVW	R0, #lo_addr(_ti+16)
MOVT	R0, #hi_addr(_ti+16)
VSTR	#1, S0, [R0, #0]
;parameter_inferior.h,109 :: 		ai[4] = 2 * 18;
MOVW	R0, #0
MOVT	R0, #16912
VMOV	S0, R0
MOVW	R0, #lo_addr(_ai+16)
MOVT	R0, #hi_addr(_ai+16)
VSTR	#1, S0, [R0, #0]
;parameter_inferior.h,110 :: 		bi[4] = 0.15 * modFactor;
MOV	R0, R1
VLDR	#1, S1, [R0, #0]
MOVW	R0, #39322
MOVT	R0, #15897
VMOV	S0, R0
VMUL.F32	S0, S0, S1
MOVW	R0, #lo_addr(_bi+16)
MOVT	R0, #hi_addr(_bi+16)
VSTR	#1, S0, [R0, #0]
;parameter_inferior.h,111 :: 		ti[5] = 97 * sqrt(modFactor);
MOV	R0, R1
VLDR	#1, S0, [R0, #0]
BL	_sqrt+0
MOVW	R0, #0
MOVT	R0, #17090
VMOV	S1, R0
VMUL.F32	S0, S1, S0
MOVW	R0, #lo_addr(_ti+20)
MOVT	R0, #hi_addr(_ti+20)
VSTR	#1, S0, [R0, #0]
;parameter_inferior.h,112 :: 		ai[5] = -0.3 * ((modFactor * modFactor)*sqrt(modFactor)) * 18;
MOVW	R1, #lo_addr(_modFactor+0)
MOVT	R1, #hi_addr(_modFactor+0)
VLDR	#1, S1, [R1, #0]
MOV	R0, R1
VLDR	#1, S0, [R0, #0]
VMUL.F32	S0, S0, S1
VSTR	#1, S0, [SP, #4]
MOV	R0, R1
VLDR	#1, S0, [R0, #0]
BL	_sqrt+0
VLDR	#1, S1, [SP, #4]
VMUL.F32	S1, S1, S0
MOVW	R0, #39322
MOVT	R0, #48793
VMOV	S0, R0
VMUL.F32	S1, S0, S1
VMOV.F32	S0, #18
VMUL.F32	S0, S1, S0
MOVW	R0, #lo_addr(_ai+20)
MOVT	R0, #hi_addr(_ai+20)
VSTR	#1, S0, [R0, #0]
;parameter_inferior.h,113 :: 		bi[5] = 0.4 / modFactor;
MOVW	R1, #lo_addr(_modFactor+0)
MOVT	R1, #hi_addr(_modFactor+0)
VLDR	#1, S1, [R1, #0]
MOVW	R0, #52429
MOVT	R0, #16076
VMOV	S0, R0
VDIV.F32	S0, S0, S1
MOVW	R0, #lo_addr(_bi+20)
MOVT	R0, #hi_addr(_bi+20)
VSTR	#1, S0, [R0, #0]
;parameter_inferior.h,114 :: 		ti[6] = 100 * sqrt(modFactor);
MOV	R0, R1
VLDR	#1, S0, [R0, #0]
BL	_sqrt+0
MOVW	R0, #0
MOVT	R0, #17096
VMOV	S1, R0
VMUL.F32	S0, S1, S0
MOVW	R0, #lo_addr(_ti+24)
MOVT	R0, #hi_addr(_ti+24)
VSTR	#1, S0, [R0, #0]
;parameter_inferior.h,115 :: 		ai[6] = -0.4 *((modFactor * modFactor)*sqrt(modFactor)) * 18;
MOVW	R1, #lo_addr(_modFactor+0)
MOVT	R1, #hi_addr(_modFactor+0)
VLDR	#1, S1, [R1, #0]
MOV	R0, R1
VLDR	#1, S0, [R0, #0]
VMUL.F32	S0, S0, S1
VSTR	#1, S0, [SP, #4]
MOV	R0, R1
VLDR	#1, S0, [R0, #0]
BL	_sqrt+0
VLDR	#1, S1, [SP, #4]
VMUL.F32	S1, S1, S0
MOVW	R0, #52429
MOVT	R0, #48844
VMOV	S0, R0
VMUL.F32	S1, S0, S1
VMOV.F32	S0, #18
VMUL.F32	S0, S1, S0
MOVW	R0, #lo_addr(_ai+24)
MOVT	R0, #hi_addr(_ai+24)
VSTR	#1, S0, [R0, #0]
;parameter_inferior.h,116 :: 		bi[6] = 0.2 * modFactor;
MOVW	R0, #lo_addr(_modFactor+0)
MOVT	R0, #hi_addr(_modFactor+0)
VLDR	#1, S1, [R0, #0]
MOVW	R0, #52429
MOVT	R0, #15948
VMOV	S0, R0
VMUL.F32	S0, S0, S1
MOVW	R0, #lo_addr(_bi+24)
MOVT	R0, #hi_addr(_bi+24)
VSTR	#1, S0, [R0, #0]
;parameter_inferior.h,119 :: 		for (i = 1; i <= 6; i++)
; i start address is: 12 (R3)
MOVS	R3, #1
SXTH	R3, R3
; i end address is: 12 (R3)
L_inferioraVR102:
; i start address is: 12 (R3)
CMP	R3, #6
IT	GT
BGT	L_inferioraVR103
;parameter_inferior.h,121 :: 		ti[i] = ti[i] * (pi / 180.0); // konversi ke radian
LSLS	R1, R3, #2
MOVW	R0, #lo_addr(_ti+0)
MOVT	R0, #hi_addr(_ti+0)
ADDS	R2, R0, R1
VLDR	#1, S1, [R2, #0]
MOVW	R0, #64053
MOVT	R0, #15502
VMOV	S0, R0
VMUL.F32	S0, S1, S0
VSTR	#1, S0, [R2, #0]
;parameter_inferior.h,119 :: 		for (i = 1; i <= 6; i++)
ADDS	R3, R3, #1
SXTH	R3, R3
;parameter_inferior.h,122 :: 		}
; i end address is: 12 (R3)
IT	AL
BAL	L_inferioraVR102
L_inferioraVR103:
;parameter_inferior.h,123 :: 		}
L_end_inferioraVR:
LDR	LR, [SP, #0]
ADD	SP, SP, #8
BX	LR
; end of _inferioraVR
_inferioraVL:
;parameter_inferior.h,125 :: 		void inferioraVL()
SUB	SP, SP, #8
STR	LR, [SP, #0]
;parameter_inferior.h,128 :: 		modFactor = sqrt((float)hmean / 60.0);
MOVW	R0, #lo_addr(_hmean+0)
MOVT	R0, #hi_addr(_hmean+0)
VLDR	#1, S1, [R0, #0]
MOVW	R0, #0
MOVT	R0, #17008
VMOV	S0, R0
VDIV.F32	S0, S1, S0
BL	_sqrt+0
MOVW	R0, #lo_addr(_modFactor+0)
MOVT	R0, #hi_addr(_modFactor+0)
VSTR	#1, S0, [R0, #0]
;parameter_inferior.h,130 :: 		ti[1] = -60 * sqrt(modFactor);
VMOV.F32	S0, S0
BL	_sqrt+0
MOVW	R0, #0
MOVT	R0, #49776
VMOV	S1, R0
VMUL.F32	S0, S1, S0
MOVW	R0, #lo_addr(_ti+4)
MOVT	R0, #hi_addr(_ti+4)
VSTR	#1, S0, [R0, #0]
;parameter_inferior.h,131 :: 		ai[1] = 0.8 * 18;
MOVW	R0, #26215
MOVT	R0, #16742
VMOV	S0, R0
MOVW	R0, #lo_addr(_ai+4)
MOVT	R0, #hi_addr(_ai+4)
VSTR	#1, S0, [R0, #0]
;parameter_inferior.h,132 :: 		bi[1] = 0.2 * modFactor;
MOVW	R1, #lo_addr(_modFactor+0)
MOVT	R1, #hi_addr(_modFactor+0)
VLDR	#1, S1, [R1, #0]
MOVW	R0, #52429
MOVT	R0, #15948
VMOV	S0, R0
VMUL.F32	S0, S0, S1
MOVW	R0, #lo_addr(_bi+4)
MOVT	R0, #hi_addr(_bi+4)
VSTR	#1, S0, [R0, #0]
;parameter_inferior.h,133 :: 		ti[2] = -15 * modFactor;
MOV	R0, R1
VLDR	#1, S1, [R0, #0]
VMOV.F32	S0, #-15
VMUL.F32	S0, S0, S1
MOVW	R0, #lo_addr(_ti+8)
MOVT	R0, #hi_addr(_ti+8)
VSTR	#1, S0, [R0, #0]
;parameter_inferior.h,134 :: 		ai[2] = -0.5 * 18;
VMOV.F32	S0, #-9
MOVW	R0, #lo_addr(_ai+8)
MOVT	R0, #hi_addr(_ai+8)
VSTR	#1, S0, [R0, #0]
;parameter_inferior.h,135 :: 		bi[2] = 0.1 * modFactor;
MOV	R0, R1
VLDR	#1, S1, [R0, #0]
MOVW	R0, #52429
MOVT	R0, #15820
VMOV	S0, R0
VMUL.F32	S0, S0, S1
MOVW	R0, #lo_addr(_bi+8)
MOVT	R0, #hi_addr(_bi+8)
VSTR	#1, S0, [R0, #0]
;parameter_inferior.h,136 :: 		ti[3] = 0;
MOV	R0, #0
VMOV	S0, R0
MOVW	R0, #lo_addr(_ti+12)
MOVT	R0, #hi_addr(_ti+12)
VSTR	#1, S0, [R0, #0]
;parameter_inferior.h,137 :: 		ai[3] = 41.25 * 18;
MOVW	R0, #40960
MOVT	R0, #17465
VMOV	S0, R0
MOVW	R0, #lo_addr(_ai+12)
MOVT	R0, #hi_addr(_ai+12)
VSTR	#1, S0, [R0, #0]
;parameter_inferior.h,138 :: 		bi[3] = 0.1 * modFactor;
MOV	R0, R1
VLDR	#1, S1, [R0, #0]
MOVW	R0, #52429
MOVT	R0, #15820
VMOV	S0, R0
VMUL.F32	S0, S0, S1
MOVW	R0, #lo_addr(_bi+12)
MOVT	R0, #hi_addr(_bi+12)
VSTR	#1, S0, [R0, #0]
;parameter_inferior.h,139 :: 		ti[4] = 15 * modFactor;
MOV	R0, R1
VLDR	#1, S1, [R0, #0]
VMOV.F32	S0, #15
VMUL.F32	S0, S0, S1
MOVW	R0, #lo_addr(_ti+16)
MOVT	R0, #hi_addr(_ti+16)
VSTR	#1, S0, [R0, #0]
;parameter_inferior.h,140 :: 		ai[4] = -0.5 * 18;
VMOV.F32	S0, #-9
MOVW	R0, #lo_addr(_ai+16)
MOVT	R0, #hi_addr(_ai+16)
VSTR	#1, S0, [R0, #0]
;parameter_inferior.h,141 :: 		bi[4] = 0.2 * modFactor;
MOV	R0, R1
VLDR	#1, S1, [R0, #0]
MOVW	R0, #52429
MOVT	R0, #15948
VMOV	S0, R0
VMUL.F32	S0, S0, S1
MOVW	R0, #lo_addr(_bi+16)
MOVT	R0, #hi_addr(_bi+16)
VSTR	#1, S0, [R0, #0]
;parameter_inferior.h,142 :: 		ti[5] = 97 * sqrt(modFactor);
MOV	R0, R1
VLDR	#1, S0, [R0, #0]
BL	_sqrt+0
MOVW	R0, #0
MOVT	R0, #17090
VMOV	S1, R0
VMUL.F32	S0, S1, S0
MOVW	R0, #lo_addr(_ti+20)
MOVT	R0, #hi_addr(_ti+20)
VSTR	#1, S0, [R0, #0]
;parameter_inferior.h,143 :: 		ai[5] = -0.8 * ((modFactor * modFactor)*sqrt(modFactor)) * 18;
MOVW	R1, #lo_addr(_modFactor+0)
MOVT	R1, #hi_addr(_modFactor+0)
VLDR	#1, S1, [R1, #0]
MOV	R0, R1
VLDR	#1, S0, [R0, #0]
VMUL.F32	S0, S0, S1
VSTR	#1, S0, [SP, #4]
MOV	R0, R1
VLDR	#1, S0, [R0, #0]
BL	_sqrt+0
VLDR	#1, S1, [SP, #4]
VMUL.F32	S1, S1, S0
MOVW	R0, #52429
MOVT	R0, #48972
VMOV	S0, R0
VMUL.F32	S1, S0, S1
VMOV.F32	S0, #18
VMUL.F32	S0, S1, S0
MOVW	R0, #lo_addr(_ai+20)
MOVT	R0, #hi_addr(_ai+20)
VSTR	#1, S0, [R0, #0]
;parameter_inferior.h,144 :: 		bi[5] = 0.4 / modFactor;
MOVW	R1, #lo_addr(_modFactor+0)
MOVT	R1, #hi_addr(_modFactor+0)
VLDR	#1, S1, [R1, #0]
MOVW	R0, #52429
MOVT	R0, #16076
VMOV	S0, R0
VDIV.F32	S0, S0, S1
MOVW	R0, #lo_addr(_bi+20)
MOVT	R0, #hi_addr(_bi+20)
VSTR	#1, S0, [R0, #0]
;parameter_inferior.h,145 :: 		ti[6] = 100 * sqrt(modFactor);
MOV	R0, R1
VLDR	#1, S0, [R0, #0]
BL	_sqrt+0
MOVW	R0, #0
MOVT	R0, #17096
VMOV	S1, R0
VMUL.F32	S0, S1, S0
MOVW	R0, #lo_addr(_ti+24)
MOVT	R0, #hi_addr(_ti+24)
VSTR	#1, S0, [R0, #0]
;parameter_inferior.h,146 :: 		ai[6] = -1 *((modFactor * modFactor)*sqrt(modFactor)) * 18;
MOVW	R1, #lo_addr(_modFactor+0)
MOVT	R1, #hi_addr(_modFactor+0)
VLDR	#1, S1, [R1, #0]
MOV	R0, R1
VLDR	#1, S0, [R0, #0]
VMUL.F32	S0, S0, S1
VSTR	#1, S0, [SP, #4]
MOV	R0, R1
VLDR	#1, S0, [R0, #0]
BL	_sqrt+0
VLDR	#1, S1, [SP, #4]
VMUL.F32	S1, S1, S0
VMOV.F32	S0, #-1
VMUL.F32	S1, S0, S1
VMOV.F32	S0, #18
VMUL.F32	S0, S1, S0
MOVW	R0, #lo_addr(_ai+24)
MOVT	R0, #hi_addr(_ai+24)
VSTR	#1, S0, [R0, #0]
;parameter_inferior.h,147 :: 		bi[6] = 0.2 * modFactor;
MOVW	R0, #lo_addr(_modFactor+0)
MOVT	R0, #hi_addr(_modFactor+0)
VLDR	#1, S1, [R0, #0]
MOVW	R0, #52429
MOVT	R0, #15948
VMOV	S0, R0
VMUL.F32	S0, S0, S1
MOVW	R0, #lo_addr(_bi+24)
MOVT	R0, #hi_addr(_bi+24)
VSTR	#1, S0, [R0, #0]
;parameter_inferior.h,150 :: 		for (i = 1; i <= 6; i++)
; i start address is: 12 (R3)
MOVS	R3, #1
SXTH	R3, R3
; i end address is: 12 (R3)
L_inferioraVL105:
; i start address is: 12 (R3)
CMP	R3, #6
IT	GT
BGT	L_inferioraVL106
;parameter_inferior.h,152 :: 		ti[i] = ti[i] * (pi / 180.0); // konversi ke radian
LSLS	R1, R3, #2
MOVW	R0, #lo_addr(_ti+0)
MOVT	R0, #hi_addr(_ti+0)
ADDS	R2, R0, R1
VLDR	#1, S1, [R2, #0]
MOVW	R0, #64053
MOVT	R0, #15502
VMOV	S0, R0
VMUL.F32	S0, S1, S0
VSTR	#1, S0, [R2, #0]
;parameter_inferior.h,150 :: 		for (i = 1; i <= 6; i++)
ADDS	R3, R3, #1
SXTH	R3, R3
;parameter_inferior.h,153 :: 		}
; i end address is: 12 (R3)
IT	AL
BAL	L_inferioraVL105
L_inferioraVL106:
;parameter_inferior.h,154 :: 		}
L_end_inferioraVL:
LDR	LR, [SP, #0]
ADD	SP, SP, #8
BX	LR
; end of _inferioraVL
_inferioraVF:
;parameter_inferior.h,156 :: 		void inferioraVF()
SUB	SP, SP, #8
STR	LR, [SP, #0]
;parameter_inferior.h,159 :: 		modFactor = sqrt((float)hmean / 60.0);
MOVW	R0, #lo_addr(_hmean+0)
MOVT	R0, #hi_addr(_hmean+0)
VLDR	#1, S1, [R0, #0]
MOVW	R0, #0
MOVT	R0, #17008
VMOV	S0, R0
VDIV.F32	S0, S1, S0
BL	_sqrt+0
MOVW	R0, #lo_addr(_modFactor+0)
MOVT	R0, #hi_addr(_modFactor+0)
VSTR	#1, S0, [R0, #0]
;parameter_inferior.h,161 :: 		ti[1] = -60 * sqrt(modFactor);
VMOV.F32	S0, S0
BL	_sqrt+0
MOVW	R0, #0
MOVT	R0, #49776
VMOV	S1, R0
VMUL.F32	S0, S1, S0
MOVW	R0, #lo_addr(_ti+4)
MOVT	R0, #hi_addr(_ti+4)
VSTR	#1, S0, [R0, #0]
;parameter_inferior.h,162 :: 		ai[1] = 0.8 * 18;
MOVW	R0, #26215
MOVT	R0, #16742
VMOV	S0, R0
MOVW	R0, #lo_addr(_ai+4)
MOVT	R0, #hi_addr(_ai+4)
VSTR	#1, S0, [R0, #0]
;parameter_inferior.h,163 :: 		bi[1] = 0.2 * modFactor;
MOVW	R1, #lo_addr(_modFactor+0)
MOVT	R1, #hi_addr(_modFactor+0)
VLDR	#1, S1, [R1, #0]
MOVW	R0, #52429
MOVT	R0, #15948
VMOV	S0, R0
VMUL.F32	S0, S0, S1
MOVW	R0, #lo_addr(_bi+4)
MOVT	R0, #hi_addr(_bi+4)
VSTR	#1, S0, [R0, #0]
;parameter_inferior.h,164 :: 		ti[2] = -15 * modFactor;
MOV	R0, R1
VLDR	#1, S1, [R0, #0]
VMOV.F32	S0, #-15
VMUL.F32	S0, S0, S1
MOVW	R0, #lo_addr(_ti+8)
MOVT	R0, #hi_addr(_ti+8)
VSTR	#1, S0, [R0, #0]
;parameter_inferior.h,165 :: 		ai[2] = -6 * 18;
MOVW	R0, #0
MOVT	R0, #49880
VMOV	S0, R0
MOVW	R0, #lo_addr(_ai+8)
MOVT	R0, #hi_addr(_ai+8)
VSTR	#1, S0, [R0, #0]
;parameter_inferior.h,166 :: 		bi[2] = 0.1 * modFactor;
MOV	R0, R1
VLDR	#1, S1, [R0, #0]
MOVW	R0, #52429
MOVT	R0, #15820
VMOV	S0, R0
VMUL.F32	S0, S0, S1
MOVW	R0, #lo_addr(_bi+8)
MOVT	R0, #hi_addr(_bi+8)
VSTR	#1, S0, [R0, #0]
;parameter_inferior.h,167 :: 		ti[3] = 0;
MOV	R0, #0
VMOV	S0, R0
MOVW	R0, #lo_addr(_ti+12)
MOVT	R0, #hi_addr(_ti+12)
VSTR	#1, S0, [R0, #0]
;parameter_inferior.h,168 :: 		ai[3] = 41.25 * 18;
MOVW	R0, #40960
MOVT	R0, #17465
VMOV	S0, R0
MOVW	R0, #lo_addr(_ai+12)
MOVT	R0, #hi_addr(_ai+12)
VSTR	#1, S0, [R0, #0]
;parameter_inferior.h,169 :: 		bi[3] = 0.1 * modFactor;
MOV	R0, R1
VLDR	#1, S1, [R0, #0]
MOVW	R0, #52429
MOVT	R0, #15820
VMOV	S0, R0
VMUL.F32	S0, S0, S1
MOVW	R0, #lo_addr(_bi+12)
MOVT	R0, #hi_addr(_bi+12)
VSTR	#1, S0, [R0, #0]
;parameter_inferior.h,170 :: 		ti[4] = 15 * modFactor;
MOV	R0, R1
VLDR	#1, S1, [R0, #0]
VMOV.F32	S0, #15
VMUL.F32	S0, S0, S1
MOVW	R0, #lo_addr(_ti+16)
MOVT	R0, #hi_addr(_ti+16)
VSTR	#1, S0, [R0, #0]
;parameter_inferior.h,171 :: 		ai[4] = 0.5 * 18;
VMOV.F32	S0, #9
MOVW	R0, #lo_addr(_ai+16)
MOVT	R0, #hi_addr(_ai+16)
VSTR	#1, S0, [R0, #0]
;parameter_inferior.h,172 :: 		bi[4] = 0.2 * modFactor;
MOV	R0, R1
VLDR	#1, S1, [R0, #0]
MOVW	R0, #52429
MOVT	R0, #15948
VMOV	S0, R0
VMUL.F32	S0, S0, S1
MOVW	R0, #lo_addr(_bi+16)
MOVT	R0, #hi_addr(_bi+16)
VSTR	#1, S0, [R0, #0]
;parameter_inferior.h,173 :: 		ti[5] = 67 * sqrt(modFactor);
MOV	R0, R1
VLDR	#1, S0, [R0, #0]
BL	_sqrt+0
MOVW	R0, #0
MOVT	R0, #17030
VMOV	S1, R0
VMUL.F32	S0, S1, S0
MOVW	R0, #lo_addr(_ti+20)
MOVT	R0, #hi_addr(_ti+20)
VSTR	#1, S0, [R0, #0]
;parameter_inferior.h,174 :: 		ai[5] = 1.2 * ((modFactor * modFactor)*sqrt(modFactor)) * 18;
MOVW	R1, #lo_addr(_modFactor+0)
MOVT	R1, #hi_addr(_modFactor+0)
VLDR	#1, S1, [R1, #0]
MOV	R0, R1
VLDR	#1, S0, [R0, #0]
VMUL.F32	S0, S0, S1
VSTR	#1, S0, [SP, #4]
MOV	R0, R1
VLDR	#1, S0, [R0, #0]
BL	_sqrt+0
VLDR	#1, S1, [SP, #4]
VMUL.F32	S1, S1, S0
MOVW	R0, #39322
MOVT	R0, #16281
VMOV	S0, R0
VMUL.F32	S1, S0, S1
VMOV.F32	S0, #18
VMUL.F32	S0, S1, S0
MOVW	R0, #lo_addr(_ai+20)
MOVT	R0, #hi_addr(_ai+20)
VSTR	#1, S0, [R0, #0]
;parameter_inferior.h,175 :: 		bi[5] = 0.4 / modFactor;
MOVW	R1, #lo_addr(_modFactor+0)
MOVT	R1, #hi_addr(_modFactor+0)
VLDR	#1, S1, [R1, #0]
MOVW	R0, #52429
MOVT	R0, #16076
VMOV	S0, R0
VDIV.F32	S0, S0, S1
MOVW	R0, #lo_addr(_bi+20)
MOVT	R0, #hi_addr(_bi+20)
VSTR	#1, S0, [R0, #0]
;parameter_inferior.h,176 :: 		ti[6] = 70 * sqrt(modFactor);
MOV	R0, R1
VLDR	#1, S0, [R0, #0]
BL	_sqrt+0
MOVW	R0, #0
MOVT	R0, #17036
VMOV	S1, R0
VMUL.F32	S0, S1, S0
MOVW	R0, #lo_addr(_ti+24)
MOVT	R0, #hi_addr(_ti+24)
VSTR	#1, S0, [R0, #0]
;parameter_inferior.h,177 :: 		ai[6] = 2 *((modFactor * modFactor)*sqrt(modFactor)) * 18;
MOVW	R1, #lo_addr(_modFactor+0)
MOVT	R1, #hi_addr(_modFactor+0)
VLDR	#1, S1, [R1, #0]
MOV	R0, R1
VLDR	#1, S0, [R0, #0]
VMUL.F32	S0, S0, S1
VSTR	#1, S0, [SP, #4]
MOV	R0, R1
VLDR	#1, S0, [R0, #0]
BL	_sqrt+0
VLDR	#1, S1, [SP, #4]
VMUL.F32	S1, S1, S0
VMOV.F32	S0, #2
VMUL.F32	S1, S0, S1
VMOV.F32	S0, #18
VMUL.F32	S0, S1, S0
MOVW	R0, #lo_addr(_ai+24)
MOVT	R0, #hi_addr(_ai+24)
VSTR	#1, S0, [R0, #0]
;parameter_inferior.h,178 :: 		bi[6] = 0.2 * modFactor;
MOVW	R0, #lo_addr(_modFactor+0)
MOVT	R0, #hi_addr(_modFactor+0)
VLDR	#1, S1, [R0, #0]
MOVW	R0, #52429
MOVT	R0, #15948
VMOV	S0, R0
VMUL.F32	S0, S0, S1
MOVW	R0, #lo_addr(_bi+24)
MOVT	R0, #hi_addr(_bi+24)
VSTR	#1, S0, [R0, #0]
;parameter_inferior.h,181 :: 		for (i = 1; i <= 6; i++)
; i start address is: 12 (R3)
MOVS	R3, #1
SXTH	R3, R3
; i end address is: 12 (R3)
L_inferioraVF108:
; i start address is: 12 (R3)
CMP	R3, #6
IT	GT
BGT	L_inferioraVF109
;parameter_inferior.h,183 :: 		ti[i] = ti[i] * (pi / 180.0); // konversi ke radian
LSLS	R1, R3, #2
MOVW	R0, #lo_addr(_ti+0)
MOVT	R0, #hi_addr(_ti+0)
ADDS	R2, R0, R1
VLDR	#1, S1, [R2, #0]
MOVW	R0, #64053
MOVT	R0, #15502
VMOV	S0, R0
VMUL.F32	S0, S1, S0
VSTR	#1, S0, [R2, #0]
;parameter_inferior.h,181 :: 		for (i = 1; i <= 6; i++)
ADDS	R3, R3, #1
SXTH	R3, R3
;parameter_inferior.h,184 :: 		}
; i end address is: 12 (R3)
IT	AL
BAL	L_inferioraVF108
L_inferioraVF109:
;parameter_inferior.h,185 :: 		}
L_end_inferioraVF:
LDR	LR, [SP, #0]
ADD	SP, SP, #8
BX	LR
; end of _inferioraVF
_inferiorV1:
;parameter_inferior.h,187 :: 		void inferiorV1()
SUB	SP, SP, #8
STR	LR, [SP, #0]
;parameter_inferior.h,190 :: 		modFactor = sqrt((float)hmean / 60.0);
MOVW	R0, #lo_addr(_hmean+0)
MOVT	R0, #hi_addr(_hmean+0)
VLDR	#1, S1, [R0, #0]
MOVW	R0, #0
MOVT	R0, #17008
VMOV	S0, R0
VDIV.F32	S0, S1, S0
BL	_sqrt+0
MOVW	R0, #lo_addr(_modFactor+0)
MOVT	R0, #hi_addr(_modFactor+0)
VSTR	#1, S0, [R0, #0]
;parameter_inferior.h,192 :: 		ti[1] = -60 * sqrt(modFactor);
VMOV.F32	S0, S0
BL	_sqrt+0
MOVW	R0, #0
MOVT	R0, #49776
VMOV	S1, R0
VMUL.F32	S0, S1, S0
MOVW	R0, #lo_addr(_ti+4)
MOVT	R0, #hi_addr(_ti+4)
VSTR	#1, S0, [R0, #0]
;parameter_inferior.h,193 :: 		ai[1] = 0.8 * 18;
MOVW	R0, #26215
MOVT	R0, #16742
VMOV	S0, R0
MOVW	R0, #lo_addr(_ai+4)
MOVT	R0, #hi_addr(_ai+4)
VSTR	#1, S0, [R0, #0]
;parameter_inferior.h,194 :: 		bi[1] = 0.2 * modFactor;
MOVW	R1, #lo_addr(_modFactor+0)
MOVT	R1, #hi_addr(_modFactor+0)
VLDR	#1, S1, [R1, #0]
MOVW	R0, #52429
MOVT	R0, #15948
VMOV	S0, R0
VMUL.F32	S0, S0, S1
MOVW	R0, #lo_addr(_bi+4)
MOVT	R0, #hi_addr(_bi+4)
VSTR	#1, S0, [R0, #0]
;parameter_inferior.h,195 :: 		ti[2] = -15 * modFactor;
MOV	R0, R1
VLDR	#1, S1, [R0, #0]
VMOV.F32	S0, #-15
VMUL.F32	S0, S0, S1
MOVW	R0, #lo_addr(_ti+8)
MOVT	R0, #hi_addr(_ti+8)
VSTR	#1, S0, [R0, #0]
;parameter_inferior.h,196 :: 		ai[2] = 0.5 * 18;
VMOV.F32	S0, #9
MOVW	R0, #lo_addr(_ai+8)
MOVT	R0, #hi_addr(_ai+8)
VSTR	#1, S0, [R0, #0]
;parameter_inferior.h,197 :: 		bi[2] = 0.1 * modFactor;
MOV	R0, R1
VLDR	#1, S1, [R0, #0]
MOVW	R0, #52429
MOVT	R0, #15820
VMOV	S0, R0
VMUL.F32	S0, S0, S1
MOVW	R0, #lo_addr(_bi+8)
MOVT	R0, #hi_addr(_bi+8)
VSTR	#1, S0, [R0, #0]
;parameter_inferior.h,198 :: 		ti[3] = 0;
MOV	R0, #0
VMOV	S0, R0
MOVW	R0, #lo_addr(_ti+12)
MOVT	R0, #hi_addr(_ti+12)
VSTR	#1, S0, [R0, #0]
;parameter_inferior.h,199 :: 		ai[3] = -32 * 18;
MOVW	R0, #0
MOVT	R0, #50192
VMOV	S0, R0
MOVW	R0, #lo_addr(_ai+12)
MOVT	R0, #hi_addr(_ai+12)
VSTR	#1, S0, [R0, #0]
;parameter_inferior.h,200 :: 		bi[3] = 0.1 * modFactor;
MOV	R0, R1
VLDR	#1, S1, [R0, #0]
MOVW	R0, #52429
MOVT	R0, #15820
VMOV	S0, R0
VMUL.F32	S0, S0, S1
MOVW	R0, #lo_addr(_bi+12)
MOVT	R0, #hi_addr(_bi+12)
VSTR	#1, S0, [R0, #0]
;parameter_inferior.h,201 :: 		ti[4] = 15 * modFactor;
MOV	R0, R1
VLDR	#1, S1, [R0, #0]
VMOV.F32	S0, #15
VMUL.F32	S0, S0, S1
MOVW	R0, #lo_addr(_ti+16)
MOVT	R0, #hi_addr(_ti+16)
VSTR	#1, S0, [R0, #0]
;parameter_inferior.h,202 :: 		ai[4] = -1 * 18;
VMOV.F32	S0, #-18
MOVW	R0, #lo_addr(_ai+16)
MOVT	R0, #hi_addr(_ai+16)
VSTR	#1, S0, [R0, #0]
;parameter_inferior.h,203 :: 		bi[4] = 0.1 * modFactor;
MOV	R0, R1
VLDR	#1, S1, [R0, #0]
MOVW	R0, #52429
MOVT	R0, #15820
VMOV	S0, R0
VMUL.F32	S0, S0, S1
MOVW	R0, #lo_addr(_bi+16)
MOVT	R0, #hi_addr(_bi+16)
VSTR	#1, S0, [R0, #0]
;parameter_inferior.h,204 :: 		ti[5] = 97 * sqrt(modFactor);
MOV	R0, R1
VLDR	#1, S0, [R0, #0]
BL	_sqrt+0
MOVW	R0, #0
MOVT	R0, #17090
VMOV	S1, R0
VMUL.F32	S0, S1, S0
MOVW	R0, #lo_addr(_ti+20)
MOVT	R0, #hi_addr(_ti+20)
VSTR	#1, S0, [R0, #0]
;parameter_inferior.h,205 :: 		ai[5] = 0.51 * ((modFactor * modFactor)*sqrt(modFactor)) * 18;
MOVW	R1, #lo_addr(_modFactor+0)
MOVT	R1, #hi_addr(_modFactor+0)
VLDR	#1, S1, [R1, #0]
MOV	R0, R1
VLDR	#1, S0, [R0, #0]
VMUL.F32	S0, S0, S1
VSTR	#1, S0, [SP, #4]
MOV	R0, R1
VLDR	#1, S0, [R0, #0]
BL	_sqrt+0
VLDR	#1, S1, [SP, #4]
VMUL.F32	S1, S1, S0
MOVW	R0, #36700
MOVT	R0, #16130
VMOV	S0, R0
VMUL.F32	S1, S0, S1
VMOV.F32	S0, #18
VMUL.F32	S0, S1, S0
MOVW	R0, #lo_addr(_ai+20)
MOVT	R0, #hi_addr(_ai+20)
VSTR	#1, S0, [R0, #0]
;parameter_inferior.h,206 :: 		bi[5] = 0.4 / modFactor;
MOVW	R1, #lo_addr(_modFactor+0)
MOVT	R1, #hi_addr(_modFactor+0)
VLDR	#1, S1, [R1, #0]
MOVW	R0, #52429
MOVT	R0, #16076
VMOV	S0, R0
VDIV.F32	S0, S0, S1
MOVW	R0, #lo_addr(_bi+20)
MOVT	R0, #hi_addr(_bi+20)
VSTR	#1, S0, [R0, #0]
;parameter_inferior.h,207 :: 		ti[6] = 100 * sqrt(modFactor);
MOV	R0, R1
VLDR	#1, S0, [R0, #0]
BL	_sqrt+0
MOVW	R0, #0
MOVT	R0, #17096
VMOV	S1, R0
VMUL.F32	S0, S1, S0
MOVW	R0, #lo_addr(_ti+24)
MOVT	R0, #hi_addr(_ti+24)
VSTR	#1, S0, [R0, #0]
;parameter_inferior.h,208 :: 		ai[6] = 0.75 *((modFactor * modFactor)*sqrt(modFactor)) * 18;
MOVW	R1, #lo_addr(_modFactor+0)
MOVT	R1, #hi_addr(_modFactor+0)
VLDR	#1, S1, [R1, #0]
MOV	R0, R1
VLDR	#1, S0, [R0, #0]
VMUL.F32	S0, S0, S1
VSTR	#1, S0, [SP, #4]
MOV	R0, R1
VLDR	#1, S0, [R0, #0]
BL	_sqrt+0
VLDR	#1, S1, [SP, #4]
VMUL.F32	S1, S1, S0
VMOV.F32	S0, #0.75
VMUL.F32	S1, S0, S1
VMOV.F32	S0, #18
VMUL.F32	S0, S1, S0
MOVW	R0, #lo_addr(_ai+24)
MOVT	R0, #hi_addr(_ai+24)
VSTR	#1, S0, [R0, #0]
;parameter_inferior.h,209 :: 		bi[6] = 0.2 * modFactor;
MOVW	R0, #lo_addr(_modFactor+0)
MOVT	R0, #hi_addr(_modFactor+0)
VLDR	#1, S1, [R0, #0]
MOVW	R0, #52429
MOVT	R0, #15948
VMOV	S0, R0
VMUL.F32	S0, S0, S1
MOVW	R0, #lo_addr(_bi+24)
MOVT	R0, #hi_addr(_bi+24)
VSTR	#1, S0, [R0, #0]
;parameter_inferior.h,212 :: 		for (i = 1; i <= 6; i++)
; i start address is: 12 (R3)
MOVS	R3, #1
SXTH	R3, R3
; i end address is: 12 (R3)
L_inferiorV1111:
; i start address is: 12 (R3)
CMP	R3, #6
IT	GT
BGT	L_inferiorV1112
;parameter_inferior.h,214 :: 		ti[i] = ti[i] * (pi / 180.0); // konversi ke radian
LSLS	R1, R3, #2
MOVW	R0, #lo_addr(_ti+0)
MOVT	R0, #hi_addr(_ti+0)
ADDS	R2, R0, R1
VLDR	#1, S1, [R2, #0]
MOVW	R0, #64053
MOVT	R0, #15502
VMOV	S0, R0
VMUL.F32	S0, S1, S0
VSTR	#1, S0, [R2, #0]
;parameter_inferior.h,212 :: 		for (i = 1; i <= 6; i++)
ADDS	R3, R3, #1
SXTH	R3, R3
;parameter_inferior.h,215 :: 		}
; i end address is: 12 (R3)
IT	AL
BAL	L_inferiorV1111
L_inferiorV1112:
;parameter_inferior.h,216 :: 		}
L_end_inferiorV1:
LDR	LR, [SP, #0]
ADD	SP, SP, #8
BX	LR
; end of _inferiorV1
_inferiorV2:
;parameter_inferior.h,218 :: 		void inferiorV2()
SUB	SP, SP, #8
STR	LR, [SP, #0]
;parameter_inferior.h,221 :: 		modFactor = sqrt((float)hmean / 60.0);
MOVW	R0, #lo_addr(_hmean+0)
MOVT	R0, #hi_addr(_hmean+0)
VLDR	#1, S1, [R0, #0]
MOVW	R0, #0
MOVT	R0, #17008
VMOV	S0, R0
VDIV.F32	S0, S1, S0
BL	_sqrt+0
MOVW	R0, #lo_addr(_modFactor+0)
MOVT	R0, #hi_addr(_modFactor+0)
VSTR	#1, S0, [R0, #0]
;parameter_inferior.h,223 :: 		ti[1] = -60 * sqrt(modFactor);
VMOV.F32	S0, S0
BL	_sqrt+0
MOVW	R0, #0
MOVT	R0, #49776
VMOV	S1, R0
VMUL.F32	S0, S1, S0
MOVW	R0, #lo_addr(_ti+4)
MOVT	R0, #hi_addr(_ti+4)
VSTR	#1, S0, [R0, #0]
;parameter_inferior.h,224 :: 		ai[1] = 0.8 * 18;
MOVW	R0, #26215
MOVT	R0, #16742
VMOV	S0, R0
MOVW	R0, #lo_addr(_ai+4)
MOVT	R0, #hi_addr(_ai+4)
VSTR	#1, S0, [R0, #0]
;parameter_inferior.h,225 :: 		bi[1] = 0.2 * modFactor;
MOVW	R1, #lo_addr(_modFactor+0)
MOVT	R1, #hi_addr(_modFactor+0)
VLDR	#1, S1, [R1, #0]
MOVW	R0, #52429
MOVT	R0, #15948
VMOV	S0, R0
VMUL.F32	S0, S0, S1
MOVW	R0, #lo_addr(_bi+4)
MOVT	R0, #hi_addr(_bi+4)
VSTR	#1, S0, [R0, #0]
;parameter_inferior.h,226 :: 		ti[2] = -15 * modFactor;
MOV	R0, R1
VLDR	#1, S1, [R0, #0]
VMOV.F32	S0, #-15
VMUL.F32	S0, S0, S1
MOVW	R0, #lo_addr(_ti+8)
MOVT	R0, #hi_addr(_ti+8)
VSTR	#1, S0, [R0, #0]
;parameter_inferior.h,227 :: 		ai[2] = 15.75 * 18;
MOVW	R0, #49152
MOVT	R0, #17293
VMOV	S0, R0
MOVW	R0, #lo_addr(_ai+8)
MOVT	R0, #hi_addr(_ai+8)
VSTR	#1, S0, [R0, #0]
;parameter_inferior.h,228 :: 		bi[2] = 0.1 * modFactor;
MOV	R0, R1
VLDR	#1, S1, [R0, #0]
MOVW	R0, #52429
MOVT	R0, #15820
VMOV	S0, R0
VMUL.F32	S0, S0, S1
MOVW	R0, #lo_addr(_bi+8)
MOVT	R0, #hi_addr(_bi+8)
VSTR	#1, S0, [R0, #0]
;parameter_inferior.h,229 :: 		ti[3] = 0;
MOV	R0, #0
VMOV	S0, R0
MOVW	R0, #lo_addr(_ti+12)
MOVT	R0, #hi_addr(_ti+12)
VSTR	#1, S0, [R0, #0]
;parameter_inferior.h,230 :: 		ai[3] = -37.5 * 18;
MOVW	R0, #49152
MOVT	R0, #50216
VMOV	S0, R0
MOVW	R0, #lo_addr(_ai+12)
MOVT	R0, #hi_addr(_ai+12)
VSTR	#1, S0, [R0, #0]
;parameter_inferior.h,231 :: 		bi[3] = 0.1 * modFactor;
MOV	R0, R1
VLDR	#1, S1, [R0, #0]
MOVW	R0, #52429
MOVT	R0, #15820
VMOV	S0, R0
VMUL.F32	S0, S0, S1
MOVW	R0, #lo_addr(_bi+12)
MOVT	R0, #hi_addr(_bi+12)
VSTR	#1, S0, [R0, #0]
;parameter_inferior.h,232 :: 		ti[4] = 15 * modFactor;
MOV	R0, R1
VLDR	#1, S1, [R0, #0]
VMOV.F32	S0, #15
VMUL.F32	S0, S0, S1
MOVW	R0, #lo_addr(_ti+16)
MOVT	R0, #hi_addr(_ti+16)
VSTR	#1, S0, [R0, #0]
;parameter_inferior.h,233 :: 		ai[4] = -1 * 18;
VMOV.F32	S0, #-18
MOVW	R0, #lo_addr(_ai+16)
MOVT	R0, #hi_addr(_ai+16)
VSTR	#1, S0, [R0, #0]
;parameter_inferior.h,234 :: 		bi[4] = 0.1 * modFactor;
MOV	R0, R1
VLDR	#1, S1, [R0, #0]
MOVW	R0, #52429
MOVT	R0, #15820
VMOV	S0, R0
VMUL.F32	S0, S0, S1
MOVW	R0, #lo_addr(_bi+16)
MOVT	R0, #hi_addr(_bi+16)
VSTR	#1, S0, [R0, #0]
;parameter_inferior.h,235 :: 		ti[5] = 97 * sqrt(modFactor);
MOV	R0, R1
VLDR	#1, S0, [R0, #0]
BL	_sqrt+0
MOVW	R0, #0
MOVT	R0, #17090
VMOV	S1, R0
VMUL.F32	S0, S1, S0
MOVW	R0, #lo_addr(_ti+20)
MOVT	R0, #hi_addr(_ti+20)
VSTR	#1, S0, [R0, #0]
;parameter_inferior.h,236 :: 		ai[5] = 0.56 * ((modFactor * modFactor)*sqrt(modFactor)) * 18;
MOVW	R1, #lo_addr(_modFactor+0)
MOVT	R1, #hi_addr(_modFactor+0)
VLDR	#1, S1, [R1, #0]
MOV	R0, R1
VLDR	#1, S0, [R0, #0]
VMUL.F32	S0, S0, S1
VSTR	#1, S0, [SP, #4]
MOV	R0, R1
VLDR	#1, S0, [R0, #0]
BL	_sqrt+0
VLDR	#1, S1, [SP, #4]
VMUL.F32	S1, S1, S0
MOVW	R0, #23593
MOVT	R0, #16143
VMOV	S0, R0
VMUL.F32	S1, S0, S1
VMOV.F32	S0, #18
VMUL.F32	S0, S1, S0
MOVW	R0, #lo_addr(_ai+20)
MOVT	R0, #hi_addr(_ai+20)
VSTR	#1, S0, [R0, #0]
;parameter_inferior.h,237 :: 		bi[5] = 0.4 / modFactor;
MOVW	R1, #lo_addr(_modFactor+0)
MOVT	R1, #hi_addr(_modFactor+0)
VLDR	#1, S1, [R1, #0]
MOVW	R0, #52429
MOVT	R0, #16076
VMOV	S0, R0
VDIV.F32	S0, S0, S1
MOVW	R0, #lo_addr(_bi+20)
MOVT	R0, #hi_addr(_bi+20)
VSTR	#1, S0, [R0, #0]
;parameter_inferior.h,238 :: 		ti[6] = 100 * sqrt(modFactor);
MOV	R0, R1
VLDR	#1, S0, [R0, #0]
BL	_sqrt+0
MOVW	R0, #0
MOVT	R0, #17096
VMOV	S1, R0
VMUL.F32	S0, S1, S0
MOVW	R0, #lo_addr(_ti+24)
MOVT	R0, #hi_addr(_ti+24)
VSTR	#1, S0, [R0, #0]
;parameter_inferior.h,239 :: 		ai[6] = 0.83 *((modFactor * modFactor)*sqrt(modFactor)) * 18;
MOVW	R1, #lo_addr(_modFactor+0)
MOVT	R1, #hi_addr(_modFactor+0)
VLDR	#1, S1, [R1, #0]
MOV	R0, R1
VLDR	#1, S0, [R0, #0]
VMUL.F32	S0, S0, S1
VSTR	#1, S0, [SP, #4]
MOV	R0, R1
VLDR	#1, S0, [R0, #0]
BL	_sqrt+0
VLDR	#1, S1, [SP, #4]
VMUL.F32	S1, S1, S0
MOVW	R0, #31457
MOVT	R0, #16212
VMOV	S0, R0
VMUL.F32	S1, S0, S1
VMOV.F32	S0, #18
VMUL.F32	S0, S1, S0
MOVW	R0, #lo_addr(_ai+24)
MOVT	R0, #hi_addr(_ai+24)
VSTR	#1, S0, [R0, #0]
;parameter_inferior.h,240 :: 		bi[6] = 0.2 * modFactor;
MOVW	R0, #lo_addr(_modFactor+0)
MOVT	R0, #hi_addr(_modFactor+0)
VLDR	#1, S1, [R0, #0]
MOVW	R0, #52429
MOVT	R0, #15948
VMOV	S0, R0
VMUL.F32	S0, S0, S1
MOVW	R0, #lo_addr(_bi+24)
MOVT	R0, #hi_addr(_bi+24)
VSTR	#1, S0, [R0, #0]
;parameter_inferior.h,243 :: 		for (i = 1; i <= 6; i++)
; i start address is: 12 (R3)
MOVS	R3, #1
SXTH	R3, R3
; i end address is: 12 (R3)
L_inferiorV2114:
; i start address is: 12 (R3)
CMP	R3, #6
IT	GT
BGT	L_inferiorV2115
;parameter_inferior.h,245 :: 		ti[i] = ti[i] * (pi / 180.0); // konversi ke radian
LSLS	R1, R3, #2
MOVW	R0, #lo_addr(_ti+0)
MOVT	R0, #hi_addr(_ti+0)
ADDS	R2, R0, R1
VLDR	#1, S1, [R2, #0]
MOVW	R0, #64053
MOVT	R0, #15502
VMOV	S0, R0
VMUL.F32	S0, S1, S0
VSTR	#1, S0, [R2, #0]
;parameter_inferior.h,243 :: 		for (i = 1; i <= 6; i++)
ADDS	R3, R3, #1
SXTH	R3, R3
;parameter_inferior.h,246 :: 		}
; i end address is: 12 (R3)
IT	AL
BAL	L_inferiorV2114
L_inferiorV2115:
;parameter_inferior.h,247 :: 		}
L_end_inferiorV2:
LDR	LR, [SP, #0]
ADD	SP, SP, #8
BX	LR
; end of _inferiorV2
_inferiorV3:
;parameter_inferior.h,249 :: 		void inferiorV3()
SUB	SP, SP, #8
STR	LR, [SP, #0]
;parameter_inferior.h,252 :: 		modFactor = sqrt((float)hmean / 60.0);
MOVW	R0, #lo_addr(_hmean+0)
MOVT	R0, #hi_addr(_hmean+0)
VLDR	#1, S1, [R0, #0]
MOVW	R0, #0
MOVT	R0, #17008
VMOV	S0, R0
VDIV.F32	S0, S1, S0
BL	_sqrt+0
MOVW	R0, #lo_addr(_modFactor+0)
MOVT	R0, #hi_addr(_modFactor+0)
VSTR	#1, S0, [R0, #0]
;parameter_inferior.h,254 :: 		ti[1] = -60 * sqrt(modFactor);
VMOV.F32	S0, S0
BL	_sqrt+0
MOVW	R0, #0
MOVT	R0, #49776
VMOV	S1, R0
VMUL.F32	S0, S1, S0
MOVW	R0, #lo_addr(_ti+4)
MOVT	R0, #hi_addr(_ti+4)
VSTR	#1, S0, [R0, #0]
;parameter_inferior.h,255 :: 		ai[1] = 0.8 * 18;
MOVW	R0, #26215
MOVT	R0, #16742
VMOV	S0, R0
MOVW	R0, #lo_addr(_ai+4)
MOVT	R0, #hi_addr(_ai+4)
VSTR	#1, S0, [R0, #0]
;parameter_inferior.h,256 :: 		bi[1] = 0.2 * modFactor;
MOVW	R1, #lo_addr(_modFactor+0)
MOVT	R1, #hi_addr(_modFactor+0)
VLDR	#1, S1, [R1, #0]
MOVW	R0, #52429
MOVT	R0, #15948
VMOV	S0, R0
VMUL.F32	S0, S0, S1
MOVW	R0, #lo_addr(_bi+4)
MOVT	R0, #hi_addr(_bi+4)
VSTR	#1, S0, [R0, #0]
;parameter_inferior.h,257 :: 		ti[2] = -15 * modFactor;
MOV	R0, R1
VLDR	#1, S1, [R0, #0]
VMOV.F32	S0, #-15
VMUL.F32	S0, S0, S1
MOVW	R0, #lo_addr(_ti+8)
MOVT	R0, #hi_addr(_ti+8)
VSTR	#1, S0, [R0, #0]
;parameter_inferior.h,258 :: 		ai[2] = 23 * 18;
MOVW	R0, #0
MOVT	R0, #17359
VMOV	S0, R0
MOVW	R0, #lo_addr(_ai+8)
MOVT	R0, #hi_addr(_ai+8)
VSTR	#1, S0, [R0, #0]
;parameter_inferior.h,259 :: 		bi[2] = 0.1 * modFactor;
MOV	R0, R1
VLDR	#1, S1, [R0, #0]
MOVW	R0, #52429
MOVT	R0, #15820
VMOV	S0, R0
VMUL.F32	S0, S0, S1
MOVW	R0, #lo_addr(_bi+8)
MOVT	R0, #hi_addr(_bi+8)
VSTR	#1, S0, [R0, #0]
;parameter_inferior.h,260 :: 		ti[3] = 0;
MOV	R0, #0
VMOV	S0, R0
MOVW	R0, #lo_addr(_ti+12)
MOVT	R0, #hi_addr(_ti+12)
VSTR	#1, S0, [R0, #0]
;parameter_inferior.h,261 :: 		ai[3] = -33.75 * 18;
MOVW	R0, #57344
MOVT	R0, #50199
VMOV	S0, R0
MOVW	R0, #lo_addr(_ai+12)
MOVT	R0, #hi_addr(_ai+12)
VSTR	#1, S0, [R0, #0]
;parameter_inferior.h,262 :: 		bi[3] = 0.1 * modFactor;
MOV	R0, R1
VLDR	#1, S1, [R0, #0]
MOVW	R0, #52429
MOVT	R0, #15820
VMOV	S0, R0
VMUL.F32	S0, S0, S1
MOVW	R0, #lo_addr(_bi+12)
MOVT	R0, #hi_addr(_bi+12)
VSTR	#1, S0, [R0, #0]
;parameter_inferior.h,263 :: 		ti[4] = 15 * modFactor;
MOV	R0, R1
VLDR	#1, S1, [R0, #0]
VMOV.F32	S0, #15
VMUL.F32	S0, S0, S1
MOVW	R0, #lo_addr(_ti+16)
MOVT	R0, #hi_addr(_ti+16)
VSTR	#1, S0, [R0, #0]
;parameter_inferior.h,264 :: 		ai[4] = -1 * 18;
VMOV.F32	S0, #-18
MOVW	R0, #lo_addr(_ai+16)
MOVT	R0, #hi_addr(_ai+16)
VSTR	#1, S0, [R0, #0]
;parameter_inferior.h,265 :: 		bi[4] = 0.1 * modFactor;
MOV	R0, R1
VLDR	#1, S1, [R0, #0]
MOVW	R0, #52429
MOVT	R0, #15820
VMOV	S0, R0
VMUL.F32	S0, S0, S1
MOVW	R0, #lo_addr(_bi+16)
MOVT	R0, #hi_addr(_bi+16)
VSTR	#1, S0, [R0, #0]
;parameter_inferior.h,266 :: 		ti[5] = 97 * sqrt(modFactor);
MOV	R0, R1
VLDR	#1, S0, [R0, #0]
BL	_sqrt+0
MOVW	R0, #0
MOVT	R0, #17090
VMOV	S1, R0
VMUL.F32	S0, S1, S0
MOVW	R0, #lo_addr(_ti+20)
MOVT	R0, #hi_addr(_ti+20)
VSTR	#1, S0, [R0, #0]
;parameter_inferior.h,267 :: 		ai[5] = 0.7 * ((modFactor * modFactor)*sqrt(modFactor)) * 18;
MOVW	R1, #lo_addr(_modFactor+0)
MOVT	R1, #hi_addr(_modFactor+0)
VLDR	#1, S1, [R1, #0]
MOV	R0, R1
VLDR	#1, S0, [R0, #0]
VMUL.F32	S0, S0, S1
VSTR	#1, S0, [SP, #4]
MOV	R0, R1
VLDR	#1, S0, [R0, #0]
BL	_sqrt+0
VLDR	#1, S1, [SP, #4]
VMUL.F32	S1, S1, S0
MOVW	R0, #13107
MOVT	R0, #16179
VMOV	S0, R0
VMUL.F32	S1, S0, S1
VMOV.F32	S0, #18
VMUL.F32	S0, S1, S0
MOVW	R0, #lo_addr(_ai+20)
MOVT	R0, #hi_addr(_ai+20)
VSTR	#1, S0, [R0, #0]
;parameter_inferior.h,268 :: 		bi[5] = 0.4 / modFactor;
MOVW	R1, #lo_addr(_modFactor+0)
MOVT	R1, #hi_addr(_modFactor+0)
VLDR	#1, S1, [R1, #0]
MOVW	R0, #52429
MOVT	R0, #16076
VMOV	S0, R0
VDIV.F32	S0, S0, S1
MOVW	R0, #lo_addr(_bi+20)
MOVT	R0, #hi_addr(_bi+20)
VSTR	#1, S0, [R0, #0]
;parameter_inferior.h,269 :: 		ti[6] = 100 * sqrt(modFactor);
MOV	R0, R1
VLDR	#1, S0, [R0, #0]
BL	_sqrt+0
MOVW	R0, #0
MOVT	R0, #17096
VMOV	S1, R0
VMUL.F32	S0, S1, S0
MOVW	R0, #lo_addr(_ti+24)
MOVT	R0, #hi_addr(_ti+24)
VSTR	#1, S0, [R0, #0]
;parameter_inferior.h,270 :: 		ai[6] = 0.8 *((modFactor * modFactor)*sqrt(modFactor)) * 18;
MOVW	R1, #lo_addr(_modFactor+0)
MOVT	R1, #hi_addr(_modFactor+0)
VLDR	#1, S1, [R1, #0]
MOV	R0, R1
VLDR	#1, S0, [R0, #0]
VMUL.F32	S0, S0, S1
VSTR	#1, S0, [SP, #4]
MOV	R0, R1
VLDR	#1, S0, [R0, #0]
BL	_sqrt+0
VLDR	#1, S1, [SP, #4]
VMUL.F32	S1, S1, S0
MOVW	R0, #52429
MOVT	R0, #16204
VMOV	S0, R0
VMUL.F32	S1, S0, S1
VMOV.F32	S0, #18
VMUL.F32	S0, S1, S0
MOVW	R0, #lo_addr(_ai+24)
MOVT	R0, #hi_addr(_ai+24)
VSTR	#1, S0, [R0, #0]
;parameter_inferior.h,271 :: 		bi[6] = 0.2 * modFactor;
MOVW	R0, #lo_addr(_modFactor+0)
MOVT	R0, #hi_addr(_modFactor+0)
VLDR	#1, S1, [R0, #0]
MOVW	R0, #52429
MOVT	R0, #15948
VMOV	S0, R0
VMUL.F32	S0, S0, S1
MOVW	R0, #lo_addr(_bi+24)
MOVT	R0, #hi_addr(_bi+24)
VSTR	#1, S0, [R0, #0]
;parameter_inferior.h,274 :: 		for (i = 1; i <= 6; i++)
; i start address is: 12 (R3)
MOVS	R3, #1
SXTH	R3, R3
; i end address is: 12 (R3)
L_inferiorV3117:
; i start address is: 12 (R3)
CMP	R3, #6
IT	GT
BGT	L_inferiorV3118
;parameter_inferior.h,276 :: 		ti[i] = ti[i] * (pi / 180.0); // konversi ke radian
LSLS	R1, R3, #2
MOVW	R0, #lo_addr(_ti+0)
MOVT	R0, #hi_addr(_ti+0)
ADDS	R2, R0, R1
VLDR	#1, S1, [R2, #0]
MOVW	R0, #64053
MOVT	R0, #15502
VMOV	S0, R0
VMUL.F32	S0, S1, S0
VSTR	#1, S0, [R2, #0]
;parameter_inferior.h,274 :: 		for (i = 1; i <= 6; i++)
ADDS	R3, R3, #1
SXTH	R3, R3
;parameter_inferior.h,277 :: 		}
; i end address is: 12 (R3)
IT	AL
BAL	L_inferiorV3117
L_inferiorV3118:
;parameter_inferior.h,278 :: 		}
L_end_inferiorV3:
LDR	LR, [SP, #0]
ADD	SP, SP, #8
BX	LR
; end of _inferiorV3
_inferiorV4:
;parameter_inferior.h,280 :: 		void inferiorV4()
SUB	SP, SP, #8
STR	LR, [SP, #0]
;parameter_inferior.h,283 :: 		modFactor = sqrt((float)hmean / 60.0);
MOVW	R0, #lo_addr(_hmean+0)
MOVT	R0, #hi_addr(_hmean+0)
VLDR	#1, S1, [R0, #0]
MOVW	R0, #0
MOVT	R0, #17008
VMOV	S0, R0
VDIV.F32	S0, S1, S0
BL	_sqrt+0
MOVW	R0, #lo_addr(_modFactor+0)
MOVT	R0, #hi_addr(_modFactor+0)
VSTR	#1, S0, [R0, #0]
;parameter_inferior.h,285 :: 		ti[1] = -60 * sqrt(modFactor);
VMOV.F32	S0, S0
BL	_sqrt+0
MOVW	R0, #0
MOVT	R0, #49776
VMOV	S1, R0
VMUL.F32	S0, S1, S0
MOVW	R0, #lo_addr(_ti+4)
MOVT	R0, #hi_addr(_ti+4)
VSTR	#1, S0, [R0, #0]
;parameter_inferior.h,286 :: 		ai[1] = 0.8 * 18;
MOVW	R0, #26215
MOVT	R0, #16742
VMOV	S0, R0
MOVW	R0, #lo_addr(_ai+4)
MOVT	R0, #hi_addr(_ai+4)
VSTR	#1, S0, [R0, #0]
;parameter_inferior.h,287 :: 		bi[1] = 0.2 * modFactor;
MOVW	R1, #lo_addr(_modFactor+0)
MOVT	R1, #hi_addr(_modFactor+0)
VLDR	#1, S1, [R1, #0]
MOVW	R0, #52429
MOVT	R0, #15948
VMOV	S0, R0
VMUL.F32	S0, S0, S1
MOVW	R0, #lo_addr(_bi+4)
MOVT	R0, #hi_addr(_bi+4)
VSTR	#1, S0, [R0, #0]
;parameter_inferior.h,288 :: 		ti[2] = -15 * modFactor;
MOV	R0, R1
VLDR	#1, S1, [R0, #0]
VMOV.F32	S0, #-15
VMUL.F32	S0, S0, S1
MOVW	R0, #lo_addr(_ti+8)
MOVT	R0, #hi_addr(_ti+8)
VSTR	#1, S0, [R0, #0]
;parameter_inferior.h,289 :: 		ai[2] = 0.5 * 18;
VMOV.F32	S0, #9
MOVW	R0, #lo_addr(_ai+8)
MOVT	R0, #hi_addr(_ai+8)
VSTR	#1, S0, [R0, #0]
;parameter_inferior.h,290 :: 		bi[2] = 0.1 * modFactor;
MOV	R0, R1
VLDR	#1, S1, [R0, #0]
MOVW	R0, #52429
MOVT	R0, #15820
VMOV	S0, R0
VMUL.F32	S0, S0, S1
MOVW	R0, #lo_addr(_bi+8)
MOVT	R0, #hi_addr(_bi+8)
VSTR	#1, S0, [R0, #0]
;parameter_inferior.h,291 :: 		ti[3] = 0;
MOV	R0, #0
VMOV	S0, R0
MOVW	R0, #lo_addr(_ti+12)
MOVT	R0, #hi_addr(_ti+12)
VSTR	#1, S0, [R0, #0]
;parameter_inferior.h,292 :: 		ai[3] = 45 * 18;
MOVW	R0, #32768
MOVT	R0, #17482
VMOV	S0, R0
MOVW	R0, #lo_addr(_ai+12)
MOVT	R0, #hi_addr(_ai+12)
VSTR	#1, S0, [R0, #0]
;parameter_inferior.h,293 :: 		bi[3] = 0.1 * modFactor;
MOV	R0, R1
VLDR	#1, S1, [R0, #0]
MOVW	R0, #52429
MOVT	R0, #15820
VMOV	S0, R0
VMUL.F32	S0, S0, S1
MOVW	R0, #lo_addr(_bi+12)
MOVT	R0, #hi_addr(_bi+12)
VSTR	#1, S0, [R0, #0]
;parameter_inferior.h,294 :: 		ti[4] = 15 * modFactor;
MOV	R0, R1
VLDR	#1, S1, [R0, #0]
VMOV.F32	S0, #15
VMUL.F32	S0, S0, S1
MOVW	R0, #lo_addr(_ti+16)
MOVT	R0, #hi_addr(_ti+16)
VSTR	#1, S0, [R0, #0]
;parameter_inferior.h,295 :: 		ai[4] = -15 * 18;
MOVW	R0, #0
MOVT	R0, #50055
VMOV	S0, R0
MOVW	R0, #lo_addr(_ai+16)
MOVT	R0, #hi_addr(_ai+16)
VSTR	#1, S0, [R0, #0]
;parameter_inferior.h,296 :: 		bi[4] = 0.1 * modFactor;
MOV	R0, R1
VLDR	#1, S1, [R0, #0]
MOVW	R0, #52429
MOVT	R0, #15820
VMOV	S0, R0
VMUL.F32	S0, S0, S1
MOVW	R0, #lo_addr(_bi+16)
MOVT	R0, #hi_addr(_bi+16)
VSTR	#1, S0, [R0, #0]
;parameter_inferior.h,297 :: 		ti[5] = 97 * sqrt(modFactor);
MOV	R0, R1
VLDR	#1, S0, [R0, #0]
BL	_sqrt+0
MOVW	R0, #0
MOVT	R0, #17090
VMOV	S1, R0
VMUL.F32	S0, S1, S0
MOVW	R0, #lo_addr(_ti+20)
MOVT	R0, #hi_addr(_ti+20)
VSTR	#1, S0, [R0, #0]
;parameter_inferior.h,298 :: 		ai[5] = 1 * ((modFactor * modFactor)*sqrt(modFactor)) * 18;
MOVW	R1, #lo_addr(_modFactor+0)
MOVT	R1, #hi_addr(_modFactor+0)
VLDR	#1, S1, [R1, #0]
MOV	R0, R1
VLDR	#1, S0, [R0, #0]
VMUL.F32	S0, S0, S1
VSTR	#1, S0, [SP, #4]
MOV	R0, R1
VLDR	#1, S0, [R0, #0]
BL	_sqrt+0
VLDR	#1, S1, [SP, #4]
VMUL.F32	S1, S1, S0
VMOV.F32	S0, #18
VMUL.F32	S0, S1, S0
MOVW	R0, #lo_addr(_ai+20)
MOVT	R0, #hi_addr(_ai+20)
VSTR	#1, S0, [R0, #0]
;parameter_inferior.h,299 :: 		bi[5] = 0.4 / modFactor;
MOVW	R1, #lo_addr(_modFactor+0)
MOVT	R1, #hi_addr(_modFactor+0)
VLDR	#1, S1, [R1, #0]
MOVW	R0, #52429
MOVT	R0, #16076
VMOV	S0, R0
VDIV.F32	S0, S0, S1
MOVW	R0, #lo_addr(_bi+20)
MOVT	R0, #hi_addr(_bi+20)
VSTR	#1, S0, [R0, #0]
;parameter_inferior.h,300 :: 		ti[6] = 100 * sqrt(modFactor);
MOV	R0, R1
VLDR	#1, S0, [R0, #0]
BL	_sqrt+0
MOVW	R0, #0
MOVT	R0, #17096
VMOV	S1, R0
VMUL.F32	S0, S1, S0
MOVW	R0, #lo_addr(_ti+24)
MOVT	R0, #hi_addr(_ti+24)
VSTR	#1, S0, [R0, #0]
;parameter_inferior.h,301 :: 		ai[6] = 2 *((modFactor * modFactor)*sqrt(modFactor)) * 18;
MOVW	R1, #lo_addr(_modFactor+0)
MOVT	R1, #hi_addr(_modFactor+0)
VLDR	#1, S1, [R1, #0]
MOV	R0, R1
VLDR	#1, S0, [R0, #0]
VMUL.F32	S0, S0, S1
VSTR	#1, S0, [SP, #4]
MOV	R0, R1
VLDR	#1, S0, [R0, #0]
BL	_sqrt+0
VLDR	#1, S1, [SP, #4]
VMUL.F32	S1, S1, S0
VMOV.F32	S0, #2
VMUL.F32	S1, S0, S1
VMOV.F32	S0, #18
VMUL.F32	S0, S1, S0
MOVW	R0, #lo_addr(_ai+24)
MOVT	R0, #hi_addr(_ai+24)
VSTR	#1, S0, [R0, #0]
;parameter_inferior.h,302 :: 		bi[6] = 0.2 * modFactor;
MOVW	R0, #lo_addr(_modFactor+0)
MOVT	R0, #hi_addr(_modFactor+0)
VLDR	#1, S1, [R0, #0]
MOVW	R0, #52429
MOVT	R0, #15948
VMOV	S0, R0
VMUL.F32	S0, S0, S1
MOVW	R0, #lo_addr(_bi+24)
MOVT	R0, #hi_addr(_bi+24)
VSTR	#1, S0, [R0, #0]
;parameter_inferior.h,305 :: 		for (i = 1; i <= 6; i++)
; i start address is: 12 (R3)
MOVS	R3, #1
SXTH	R3, R3
; i end address is: 12 (R3)
L_inferiorV4120:
; i start address is: 12 (R3)
CMP	R3, #6
IT	GT
BGT	L_inferiorV4121
;parameter_inferior.h,307 :: 		ti[i] = ti[i] * (pi / 180.0); // konversi ke radian
LSLS	R1, R3, #2
MOVW	R0, #lo_addr(_ti+0)
MOVT	R0, #hi_addr(_ti+0)
ADDS	R2, R0, R1
VLDR	#1, S1, [R2, #0]
MOVW	R0, #64053
MOVT	R0, #15502
VMOV	S0, R0
VMUL.F32	S0, S1, S0
VSTR	#1, S0, [R2, #0]
;parameter_inferior.h,305 :: 		for (i = 1; i <= 6; i++)
ADDS	R3, R3, #1
SXTH	R3, R3
;parameter_inferior.h,308 :: 		}
; i end address is: 12 (R3)
IT	AL
BAL	L_inferiorV4120
L_inferiorV4121:
;parameter_inferior.h,309 :: 		}
L_end_inferiorV4:
LDR	LR, [SP, #0]
ADD	SP, SP, #8
BX	LR
; end of _inferiorV4
_inferiorV5:
;parameter_inferior.h,311 :: 		void inferiorV5()
SUB	SP, SP, #8
STR	LR, [SP, #0]
;parameter_inferior.h,314 :: 		modFactor = sqrt((float)hmean / 60.0);
MOVW	R0, #lo_addr(_hmean+0)
MOVT	R0, #hi_addr(_hmean+0)
VLDR	#1, S1, [R0, #0]
MOVW	R0, #0
MOVT	R0, #17008
VMOV	S0, R0
VDIV.F32	S0, S1, S0
BL	_sqrt+0
MOVW	R0, #lo_addr(_modFactor+0)
MOVT	R0, #hi_addr(_modFactor+0)
VSTR	#1, S0, [R0, #0]
;parameter_inferior.h,316 :: 		ti[1] = -60 * sqrt(modFactor);
VMOV.F32	S0, S0
BL	_sqrt+0
MOVW	R0, #0
MOVT	R0, #49776
VMOV	S1, R0
VMUL.F32	S0, S1, S0
MOVW	R0, #lo_addr(_ti+4)
MOVT	R0, #hi_addr(_ti+4)
VSTR	#1, S0, [R0, #0]
;parameter_inferior.h,317 :: 		ai[1] = 0.8 * 18;
MOVW	R0, #26215
MOVT	R0, #16742
VMOV	S0, R0
MOVW	R0, #lo_addr(_ai+4)
MOVT	R0, #hi_addr(_ai+4)
VSTR	#1, S0, [R0, #0]
;parameter_inferior.h,318 :: 		bi[1] = 0.2 * modFactor;
MOVW	R1, #lo_addr(_modFactor+0)
MOVT	R1, #hi_addr(_modFactor+0)
VLDR	#1, S1, [R1, #0]
MOVW	R0, #52429
MOVT	R0, #15948
VMOV	S0, R0
VMUL.F32	S0, S0, S1
MOVW	R0, #lo_addr(_bi+4)
MOVT	R0, #hi_addr(_bi+4)
VSTR	#1, S0, [R0, #0]
;parameter_inferior.h,319 :: 		ti[2] = -15 * modFactor;
MOV	R0, R1
VLDR	#1, S1, [R0, #0]
VMOV.F32	S0, #-15
VMUL.F32	S0, S0, S1
MOVW	R0, #lo_addr(_ti+8)
MOVT	R0, #hi_addr(_ti+8)
VSTR	#1, S0, [R0, #0]
;parameter_inferior.h,320 :: 		ai[2] = -5 * 18;
MOVW	R0, #0
MOVT	R0, #49844
VMOV	S0, R0
MOVW	R0, #lo_addr(_ai+8)
MOVT	R0, #hi_addr(_ai+8)
VSTR	#1, S0, [R0, #0]
;parameter_inferior.h,321 :: 		bi[2] = 0.1 * modFactor;
MOV	R0, R1
VLDR	#1, S1, [R0, #0]
MOVW	R0, #52429
MOVT	R0, #15820
VMOV	S0, R0
VMUL.F32	S0, S0, S1
MOVW	R0, #lo_addr(_bi+8)
MOVT	R0, #hi_addr(_bi+8)
VSTR	#1, S0, [R0, #0]
;parameter_inferior.h,322 :: 		ti[3] = 0;
MOV	R0, #0
VMOV	S0, R0
MOVW	R0, #lo_addr(_ti+12)
MOVT	R0, #hi_addr(_ti+12)
VSTR	#1, S0, [R0, #0]
;parameter_inferior.h,323 :: 		ai[3] = 48.75 * 18;
MOVW	R0, #24576
MOVT	R0, #17499
VMOV	S0, R0
MOVW	R0, #lo_addr(_ai+12)
MOVT	R0, #hi_addr(_ai+12)
VSTR	#1, S0, [R0, #0]
;parameter_inferior.h,324 :: 		bi[3] = 0.1 * modFactor;
MOV	R0, R1
VLDR	#1, S1, [R0, #0]
MOVW	R0, #52429
MOVT	R0, #15820
VMOV	S0, R0
VMUL.F32	S0, S0, S1
MOVW	R0, #lo_addr(_bi+12)
MOVT	R0, #hi_addr(_bi+12)
VSTR	#1, S0, [R0, #0]
;parameter_inferior.h,325 :: 		ti[4] = 15 * modFactor;
MOV	R0, R1
VLDR	#1, S1, [R0, #0]
VMOV.F32	S0, #15
VMUL.F32	S0, S0, S1
MOVW	R0, #lo_addr(_ti+16)
MOVT	R0, #hi_addr(_ti+16)
VSTR	#1, S0, [R0, #0]
;parameter_inferior.h,326 :: 		ai[4] = -5 * 18;
MOVW	R0, #0
MOVT	R0, #49844
VMOV	S0, R0
MOVW	R0, #lo_addr(_ai+16)
MOVT	R0, #hi_addr(_ai+16)
VSTR	#1, S0, [R0, #0]
;parameter_inferior.h,327 :: 		bi[4] = 0.1 * modFactor;
MOV	R0, R1
VLDR	#1, S1, [R0, #0]
MOVW	R0, #52429
MOVT	R0, #15820
VMOV	S0, R0
VMUL.F32	S0, S0, S1
MOVW	R0, #lo_addr(_bi+16)
MOVT	R0, #hi_addr(_bi+16)
VSTR	#1, S0, [R0, #0]
;parameter_inferior.h,328 :: 		ti[5] = 97 * sqrt(modFactor);
MOV	R0, R1
VLDR	#1, S0, [R0, #0]
BL	_sqrt+0
MOVW	R0, #0
MOVT	R0, #17090
VMOV	S1, R0
VMUL.F32	S0, S1, S0
MOVW	R0, #lo_addr(_ti+20)
MOVT	R0, #hi_addr(_ti+20)
VSTR	#1, S0, [R0, #0]
;parameter_inferior.h,329 :: 		ai[5] = 1 * ((modFactor * modFactor)*sqrt(modFactor)) * 18;
MOVW	R1, #lo_addr(_modFactor+0)
MOVT	R1, #hi_addr(_modFactor+0)
VLDR	#1, S1, [R1, #0]
MOV	R0, R1
VLDR	#1, S0, [R0, #0]
VMUL.F32	S0, S0, S1
VSTR	#1, S0, [SP, #4]
MOV	R0, R1
VLDR	#1, S0, [R0, #0]
BL	_sqrt+0
VLDR	#1, S1, [SP, #4]
VMUL.F32	S1, S1, S0
VMOV.F32	S0, #18
VMUL.F32	S0, S1, S0
MOVW	R0, #lo_addr(_ai+20)
MOVT	R0, #hi_addr(_ai+20)
VSTR	#1, S0, [R0, #0]
;parameter_inferior.h,330 :: 		bi[5] = 0.4 / modFactor;
MOVW	R1, #lo_addr(_modFactor+0)
MOVT	R1, #hi_addr(_modFactor+0)
VLDR	#1, S1, [R1, #0]
MOVW	R0, #52429
MOVT	R0, #16076
VMOV	S0, R0
VDIV.F32	S0, S0, S1
MOVW	R0, #lo_addr(_bi+20)
MOVT	R0, #hi_addr(_bi+20)
VSTR	#1, S0, [R0, #0]
;parameter_inferior.h,331 :: 		ti[6] = 100 * sqrt(modFactor);
MOV	R0, R1
VLDR	#1, S0, [R0, #0]
BL	_sqrt+0
MOVW	R0, #0
MOVT	R0, #17096
VMOV	S1, R0
VMUL.F32	S0, S1, S0
MOVW	R0, #lo_addr(_ti+24)
MOVT	R0, #hi_addr(_ti+24)
VSTR	#1, S0, [R0, #0]
;parameter_inferior.h,332 :: 		ai[6] = 1.5 *((modFactor * modFactor)*sqrt(modFactor)) * 18;
MOVW	R1, #lo_addr(_modFactor+0)
MOVT	R1, #hi_addr(_modFactor+0)
VLDR	#1, S1, [R1, #0]
MOV	R0, R1
VLDR	#1, S0, [R0, #0]
VMUL.F32	S0, S0, S1
VSTR	#1, S0, [SP, #4]
MOV	R0, R1
VLDR	#1, S0, [R0, #0]
BL	_sqrt+0
VLDR	#1, S1, [SP, #4]
VMUL.F32	S1, S1, S0
VMOV.F32	S0, #1.5
VMUL.F32	S1, S0, S1
VMOV.F32	S0, #18
VMUL.F32	S0, S1, S0
MOVW	R0, #lo_addr(_ai+24)
MOVT	R0, #hi_addr(_ai+24)
VSTR	#1, S0, [R0, #0]
;parameter_inferior.h,333 :: 		bi[6] = 0.2 * modFactor;
MOVW	R0, #lo_addr(_modFactor+0)
MOVT	R0, #hi_addr(_modFactor+0)
VLDR	#1, S1, [R0, #0]
MOVW	R0, #52429
MOVT	R0, #15948
VMOV	S0, R0
VMUL.F32	S0, S0, S1
MOVW	R0, #lo_addr(_bi+24)
MOVT	R0, #hi_addr(_bi+24)
VSTR	#1, S0, [R0, #0]
;parameter_inferior.h,336 :: 		for (i = 1; i <= 6; i++)
; i start address is: 12 (R3)
MOVS	R3, #1
SXTH	R3, R3
; i end address is: 12 (R3)
L_inferiorV5123:
; i start address is: 12 (R3)
CMP	R3, #6
IT	GT
BGT	L_inferiorV5124
;parameter_inferior.h,338 :: 		ti[i] = ti[i] * (pi / 180.0); // konversi ke radian
LSLS	R1, R3, #2
MOVW	R0, #lo_addr(_ti+0)
MOVT	R0, #hi_addr(_ti+0)
ADDS	R2, R0, R1
VLDR	#1, S1, [R2, #0]
MOVW	R0, #64053
MOVT	R0, #15502
VMOV	S0, R0
VMUL.F32	S0, S1, S0
VSTR	#1, S0, [R2, #0]
;parameter_inferior.h,336 :: 		for (i = 1; i <= 6; i++)
ADDS	R3, R3, #1
SXTH	R3, R3
;parameter_inferior.h,339 :: 		}
; i end address is: 12 (R3)
IT	AL
BAL	L_inferiorV5123
L_inferiorV5124:
;parameter_inferior.h,340 :: 		}
L_end_inferiorV5:
LDR	LR, [SP, #0]
ADD	SP, SP, #8
BX	LR
; end of _inferiorV5
_inferiorV6:
;parameter_inferior.h,342 :: 		void inferiorV6()
SUB	SP, SP, #8
STR	LR, [SP, #0]
;parameter_inferior.h,345 :: 		modFactor = sqrt((float)hmean / 60.0);
MOVW	R0, #lo_addr(_hmean+0)
MOVT	R0, #hi_addr(_hmean+0)
VLDR	#1, S1, [R0, #0]
MOVW	R0, #0
MOVT	R0, #17008
VMOV	S0, R0
VDIV.F32	S0, S1, S0
BL	_sqrt+0
MOVW	R0, #lo_addr(_modFactor+0)
MOVT	R0, #hi_addr(_modFactor+0)
VSTR	#1, S0, [R0, #0]
;parameter_inferior.h,347 :: 		ti[1] = -60 * sqrt(modFactor);
VMOV.F32	S0, S0
BL	_sqrt+0
MOVW	R0, #0
MOVT	R0, #49776
VMOV	S1, R0
VMUL.F32	S0, S1, S0
MOVW	R0, #lo_addr(_ti+4)
MOVT	R0, #hi_addr(_ti+4)
VSTR	#1, S0, [R0, #0]
;parameter_inferior.h,348 :: 		ai[1] = 0.8 * 18;
MOVW	R0, #26215
MOVT	R0, #16742
VMOV	S0, R0
MOVW	R0, #lo_addr(_ai+4)
MOVT	R0, #hi_addr(_ai+4)
VSTR	#1, S0, [R0, #0]
;parameter_inferior.h,349 :: 		bi[1] = 0.2 * modFactor;
MOVW	R1, #lo_addr(_modFactor+0)
MOVT	R1, #hi_addr(_modFactor+0)
VLDR	#1, S1, [R1, #0]
MOVW	R0, #52429
MOVT	R0, #15948
VMOV	S0, R0
VMUL.F32	S0, S0, S1
MOVW	R0, #lo_addr(_bi+4)
MOVT	R0, #hi_addr(_bi+4)
VSTR	#1, S0, [R0, #0]
;parameter_inferior.h,350 :: 		ti[2] = -15 * modFactor;
MOV	R0, R1
VLDR	#1, S1, [R0, #0]
VMOV.F32	S0, #-15
VMUL.F32	S0, S0, S1
MOVW	R0, #lo_addr(_ti+8)
MOVT	R0, #hi_addr(_ti+8)
VSTR	#1, S0, [R0, #0]
;parameter_inferior.h,351 :: 		ai[2] = -5 * 18;
MOVW	R0, #0
MOVT	R0, #49844
VMOV	S0, R0
MOVW	R0, #lo_addr(_ai+8)
MOVT	R0, #hi_addr(_ai+8)
VSTR	#1, S0, [R0, #0]
;parameter_inferior.h,352 :: 		bi[2] = 0.1 * modFactor;
MOV	R0, R1
VLDR	#1, S1, [R0, #0]
MOVW	R0, #52429
MOVT	R0, #15820
VMOV	S0, R0
VMUL.F32	S0, S0, S1
MOVW	R0, #lo_addr(_bi+8)
MOVT	R0, #hi_addr(_bi+8)
VSTR	#1, S0, [R0, #0]
;parameter_inferior.h,353 :: 		ti[3] = 0;
MOV	R0, #0
VMOV	S0, R0
MOVW	R0, #lo_addr(_ti+12)
MOVT	R0, #hi_addr(_ti+12)
VSTR	#1, S0, [R0, #0]
;parameter_inferior.h,354 :: 		ai[3] = 45 * 18;
MOVW	R0, #32768
MOVT	R0, #17482
VMOV	S0, R0
MOVW	R0, #lo_addr(_ai+12)
MOVT	R0, #hi_addr(_ai+12)
VSTR	#1, S0, [R0, #0]
;parameter_inferior.h,355 :: 		bi[3] = 0.1 * modFactor;
MOV	R0, R1
VLDR	#1, S1, [R0, #0]
MOVW	R0, #52429
MOVT	R0, #15820
VMOV	S0, R0
VMUL.F32	S0, S0, S1
MOVW	R0, #lo_addr(_bi+12)
MOVT	R0, #hi_addr(_bi+12)
VSTR	#1, S0, [R0, #0]
;parameter_inferior.h,356 :: 		ti[4] = 15 * modFactor;
MOV	R0, R1
VLDR	#1, S1, [R0, #0]
VMOV.F32	S0, #15
VMUL.F32	S0, S0, S1
MOVW	R0, #lo_addr(_ti+16)
MOVT	R0, #hi_addr(_ti+16)
VSTR	#1, S0, [R0, #0]
;parameter_inferior.h,357 :: 		ai[4] = 0.5 * 18;
VMOV.F32	S0, #9
MOVW	R0, #lo_addr(_ai+16)
MOVT	R0, #hi_addr(_ai+16)
VSTR	#1, S0, [R0, #0]
;parameter_inferior.h,358 :: 		bi[4] = 0.1 * modFactor;
MOV	R0, R1
VLDR	#1, S1, [R0, #0]
MOVW	R0, #52429
MOVT	R0, #15820
VMOV	S0, R0
VMUL.F32	S0, S0, S1
MOVW	R0, #lo_addr(_bi+16)
MOVT	R0, #hi_addr(_bi+16)
VSTR	#1, S0, [R0, #0]
;parameter_inferior.h,359 :: 		ti[5] = 97 * sqrt(modFactor);
MOV	R0, R1
VLDR	#1, S0, [R0, #0]
BL	_sqrt+0
MOVW	R0, #0
MOVT	R0, #17090
VMOV	S1, R0
VMUL.F32	S0, S1, S0
MOVW	R0, #lo_addr(_ti+20)
MOVT	R0, #hi_addr(_ti+20)
VSTR	#1, S0, [R0, #0]
;parameter_inferior.h,360 :: 		ai[5] = 0.8 * ((modFactor * modFactor)*sqrt(modFactor)) * 18;
MOVW	R1, #lo_addr(_modFactor+0)
MOVT	R1, #hi_addr(_modFactor+0)
VLDR	#1, S1, [R1, #0]
MOV	R0, R1
VLDR	#1, S0, [R0, #0]
VMUL.F32	S0, S0, S1
VSTR	#1, S0, [SP, #4]
MOV	R0, R1
VLDR	#1, S0, [R0, #0]
BL	_sqrt+0
VLDR	#1, S1, [SP, #4]
VMUL.F32	S1, S1, S0
MOVW	R0, #52429
MOVT	R0, #16204
VMOV	S0, R0
VMUL.F32	S1, S0, S1
VMOV.F32	S0, #18
VMUL.F32	S0, S1, S0
MOVW	R0, #lo_addr(_ai+20)
MOVT	R0, #hi_addr(_ai+20)
VSTR	#1, S0, [R0, #0]
;parameter_inferior.h,361 :: 		bi[5] = 0.4 / modFactor;
MOVW	R1, #lo_addr(_modFactor+0)
MOVT	R1, #hi_addr(_modFactor+0)
VLDR	#1, S1, [R1, #0]
MOVW	R0, #52429
MOVT	R0, #16076
VMOV	S0, R0
VDIV.F32	S0, S0, S1
MOVW	R0, #lo_addr(_bi+20)
MOVT	R0, #hi_addr(_bi+20)
VSTR	#1, S0, [R0, #0]
;parameter_inferior.h,362 :: 		ti[6] = 100 * sqrt(modFactor);
MOV	R0, R1
VLDR	#1, S0, [R0, #0]
BL	_sqrt+0
MOVW	R0, #0
MOVT	R0, #17096
VMOV	S1, R0
VMUL.F32	S0, S1, S0
MOVW	R0, #lo_addr(_ti+24)
MOVT	R0, #hi_addr(_ti+24)
VSTR	#1, S0, [R0, #0]
;parameter_inferior.h,363 :: 		ai[6] = 0.9 *((modFactor * modFactor)*sqrt(modFactor)) * 18;
MOVW	R1, #lo_addr(_modFactor+0)
MOVT	R1, #hi_addr(_modFactor+0)
VLDR	#1, S1, [R1, #0]
MOV	R0, R1
VLDR	#1, S0, [R0, #0]
VMUL.F32	S0, S0, S1
VSTR	#1, S0, [SP, #4]
MOV	R0, R1
VLDR	#1, S0, [R0, #0]
BL	_sqrt+0
VLDR	#1, S1, [SP, #4]
VMUL.F32	S1, S1, S0
MOVW	R0, #26214
MOVT	R0, #16230
VMOV	S0, R0
VMUL.F32	S1, S0, S1
VMOV.F32	S0, #18
VMUL.F32	S0, S1, S0
MOVW	R0, #lo_addr(_ai+24)
MOVT	R0, #hi_addr(_ai+24)
VSTR	#1, S0, [R0, #0]
;parameter_inferior.h,364 :: 		bi[6] = 0.2 * modFactor;
MOVW	R0, #lo_addr(_modFactor+0)
MOVT	R0, #hi_addr(_modFactor+0)
VLDR	#1, S1, [R0, #0]
MOVW	R0, #52429
MOVT	R0, #15948
VMOV	S0, R0
VMUL.F32	S0, S0, S1
MOVW	R0, #lo_addr(_bi+24)
MOVT	R0, #hi_addr(_bi+24)
VSTR	#1, S0, [R0, #0]
;parameter_inferior.h,367 :: 		for (i = 1; i <= 6; i++)
; i start address is: 12 (R3)
MOVS	R3, #1
SXTH	R3, R3
; i end address is: 12 (R3)
L_inferiorV6126:
; i start address is: 12 (R3)
CMP	R3, #6
IT	GT
BGT	L_inferiorV6127
;parameter_inferior.h,369 :: 		ti[i] = ti[i] * (pi / 180.0); // konversi ke radian
LSLS	R1, R3, #2
MOVW	R0, #lo_addr(_ti+0)
MOVT	R0, #hi_addr(_ti+0)
ADDS	R2, R0, R1
VLDR	#1, S1, [R2, #0]
MOVW	R0, #64053
MOVT	R0, #15502
VMOV	S0, R0
VMUL.F32	S0, S1, S0
VSTR	#1, S0, [R2, #0]
;parameter_inferior.h,367 :: 		for (i = 1; i <= 6; i++)
ADDS	R3, R3, #1
SXTH	R3, R3
;parameter_inferior.h,370 :: 		}
; i end address is: 12 (R3)
IT	AL
BAL	L_inferiorV6126
L_inferiorV6127:
;parameter_inferior.h,371 :: 		}
L_end_inferiorV6:
LDR	LR, [SP, #0]
ADD	SP, SP, #8
BX	LR
; end of _inferiorV6
_lateral1:
;parameter_lateral.h,1 :: 		void lateral1()
SUB	SP, SP, #8
STR	LR, [SP, #0]
;parameter_lateral.h,4 :: 		modFactor = sqrt((float)hmean / 60.0);
MOVW	R0, #lo_addr(_hmean+0)
MOVT	R0, #hi_addr(_hmean+0)
VLDR	#1, S1, [R0, #0]
MOVW	R0, #0
MOVT	R0, #17008
VMOV	S0, R0
VDIV.F32	S0, S1, S0
BL	_sqrt+0
MOVW	R0, #lo_addr(_modFactor+0)
MOVT	R0, #hi_addr(_modFactor+0)
VSTR	#1, S0, [R0, #0]
;parameter_lateral.h,6 :: 		ti[1] = -60 * sqrt(modFactor);
VMOV.F32	S0, S0
BL	_sqrt+0
MOVW	R0, #0
MOVT	R0, #49776
VMOV	S1, R0
VMUL.F32	S0, S1, S0
MOVW	R0, #lo_addr(_ti+4)
MOVT	R0, #hi_addr(_ti+4)
VSTR	#1, S0, [R0, #0]
;parameter_lateral.h,7 :: 		ai[1] = 0.8 * 18;
MOVW	R0, #26215
MOVT	R0, #16742
VMOV	S0, R0
MOVW	R0, #lo_addr(_ai+4)
MOVT	R0, #hi_addr(_ai+4)
VSTR	#1, S0, [R0, #0]
;parameter_lateral.h,8 :: 		bi[1] = 0.2 * modFactor;
MOVW	R1, #lo_addr(_modFactor+0)
MOVT	R1, #hi_addr(_modFactor+0)
VLDR	#1, S1, [R1, #0]
MOVW	R0, #52429
MOVT	R0, #15948
VMOV	S0, R0
VMUL.F32	S0, S0, S1
MOVW	R0, #lo_addr(_bi+4)
MOVT	R0, #hi_addr(_bi+4)
VSTR	#1, S0, [R0, #0]
;parameter_lateral.h,9 :: 		ti[2] = -15 * modFactor;
MOV	R0, R1
VLDR	#1, S1, [R0, #0]
VMOV.F32	S0, #-15
VMUL.F32	S0, S0, S1
MOVW	R0, #lo_addr(_ti+8)
MOVT	R0, #hi_addr(_ti+8)
VSTR	#1, S0, [R0, #0]
;parameter_lateral.h,10 :: 		ai[2] = -5 * 18;
MOVW	R0, #0
MOVT	R0, #49844
VMOV	S0, R0
MOVW	R0, #lo_addr(_ai+8)
MOVT	R0, #hi_addr(_ai+8)
VSTR	#1, S0, [R0, #0]
;parameter_lateral.h,11 :: 		bi[2] = 0.1 * modFactor;
MOV	R0, R1
VLDR	#1, S1, [R0, #0]
MOVW	R0, #52429
MOVT	R0, #15820
VMOV	S0, R0
VMUL.F32	S0, S0, S1
MOVW	R0, #lo_addr(_bi+8)
MOVT	R0, #hi_addr(_bi+8)
VSTR	#1, S0, [R0, #0]
;parameter_lateral.h,12 :: 		ti[3] = 0;
MOV	R0, #0
VMOV	S0, R0
MOVW	R0, #lo_addr(_ti+12)
MOVT	R0, #hi_addr(_ti+12)
VSTR	#1, S0, [R0, #0]
;parameter_lateral.h,13 :: 		ai[3] = 30 * 18;
MOVW	R0, #0
MOVT	R0, #17415
VMOV	S0, R0
MOVW	R0, #lo_addr(_ai+12)
MOVT	R0, #hi_addr(_ai+12)
VSTR	#1, S0, [R0, #0]
;parameter_lateral.h,14 :: 		bi[3] = 0.1 * modFactor;
MOV	R0, R1
VLDR	#1, S1, [R0, #0]
MOVW	R0, #52429
MOVT	R0, #15820
VMOV	S0, R0
VMUL.F32	S0, S0, S1
MOVW	R0, #lo_addr(_bi+12)
MOVT	R0, #hi_addr(_bi+12)
VSTR	#1, S0, [R0, #0]
;parameter_lateral.h,15 :: 		ti[4] = 15 * modFactor;
MOV	R0, R1
VLDR	#1, S1, [R0, #0]
VMOV.F32	S0, #15
VMUL.F32	S0, S0, S1
MOVW	R0, #lo_addr(_ti+16)
MOVT	R0, #hi_addr(_ti+16)
VSTR	#1, S0, [R0, #0]
;parameter_lateral.h,16 :: 		ai[4] = -7.5 * 18;
MOVW	R0, #0
MOVT	R0, #49927
VMOV	S0, R0
MOVW	R0, #lo_addr(_ai+16)
MOVT	R0, #hi_addr(_ai+16)
VSTR	#1, S0, [R0, #0]
;parameter_lateral.h,17 :: 		bi[4] = 0.1 * modFactor;
MOV	R0, R1
VLDR	#1, S1, [R0, #0]
MOVW	R0, #52429
MOVT	R0, #15820
VMOV	S0, R0
VMUL.F32	S0, S0, S1
MOVW	R0, #lo_addr(_bi+16)
MOVT	R0, #hi_addr(_bi+16)
VSTR	#1, S0, [R0, #0]
;parameter_lateral.h,18 :: 		ti[5] = 77 * sqrt(modFactor);
MOV	R0, R1
VLDR	#1, S0, [R0, #0]
BL	_sqrt+0
MOVW	R0, #0
MOVT	R0, #17050
VMOV	S1, R0
VMUL.F32	S0, S1, S0
MOVW	R0, #lo_addr(_ti+20)
MOVT	R0, #hi_addr(_ti+20)
VSTR	#1, S0, [R0, #0]
;parameter_lateral.h,19 :: 		ai[5] = 0.83 * ((modFactor * modFactor)*sqrt(modFactor)) * 18;
MOVW	R1, #lo_addr(_modFactor+0)
MOVT	R1, #hi_addr(_modFactor+0)
VLDR	#1, S1, [R1, #0]
MOV	R0, R1
VLDR	#1, S0, [R0, #0]
VMUL.F32	S0, S0, S1
VSTR	#1, S0, [SP, #4]
MOV	R0, R1
VLDR	#1, S0, [R0, #0]
BL	_sqrt+0
VLDR	#1, S1, [SP, #4]
VMUL.F32	S1, S1, S0
MOVW	R0, #31457
MOVT	R0, #16212
VMOV	S0, R0
VMUL.F32	S1, S0, S1
VMOV.F32	S0, #18
VMUL.F32	S0, S1, S0
MOVW	R0, #lo_addr(_ai+20)
MOVT	R0, #hi_addr(_ai+20)
VSTR	#1, S0, [R0, #0]
;parameter_lateral.h,20 :: 		bi[5] = 0.4 / modFactor;
MOVW	R1, #lo_addr(_modFactor+0)
MOVT	R1, #hi_addr(_modFactor+0)
VLDR	#1, S1, [R1, #0]
MOVW	R0, #52429
MOVT	R0, #16076
VMOV	S0, R0
VDIV.F32	S0, S0, S1
MOVW	R0, #lo_addr(_bi+20)
MOVT	R0, #hi_addr(_bi+20)
VSTR	#1, S0, [R0, #0]
;parameter_lateral.h,21 :: 		ti[6] = 80 * sqrt(modFactor);
MOV	R0, R1
VLDR	#1, S0, [R0, #0]
BL	_sqrt+0
MOVW	R0, #0
MOVT	R0, #17056
VMOV	S1, R0
VMUL.F32	S0, S1, S0
MOVW	R0, #lo_addr(_ti+24)
MOVT	R0, #hi_addr(_ti+24)
VSTR	#1, S0, [R0, #0]
;parameter_lateral.h,22 :: 		ai[6] = 1.25 *((modFactor * modFactor)*sqrt(modFactor)) * 18;
MOVW	R1, #lo_addr(_modFactor+0)
MOVT	R1, #hi_addr(_modFactor+0)
VLDR	#1, S1, [R1, #0]
MOV	R0, R1
VLDR	#1, S0, [R0, #0]
VMUL.F32	S0, S0, S1
VSTR	#1, S0, [SP, #4]
MOV	R0, R1
VLDR	#1, S0, [R0, #0]
BL	_sqrt+0
VLDR	#1, S1, [SP, #4]
VMUL.F32	S1, S1, S0
VMOV.F32	S0, #1.25
VMUL.F32	S1, S0, S1
VMOV.F32	S0, #18
VMUL.F32	S0, S1, S0
MOVW	R0, #lo_addr(_ai+24)
MOVT	R0, #hi_addr(_ai+24)
VSTR	#1, S0, [R0, #0]
;parameter_lateral.h,23 :: 		bi[6] = 0.2 * modFactor;
MOVW	R0, #lo_addr(_modFactor+0)
MOVT	R0, #hi_addr(_modFactor+0)
VLDR	#1, S1, [R0, #0]
MOVW	R0, #52429
MOVT	R0, #15948
VMOV	S0, R0
VMUL.F32	S0, S0, S1
MOVW	R0, #lo_addr(_bi+24)
MOVT	R0, #hi_addr(_bi+24)
VSTR	#1, S0, [R0, #0]
;parameter_lateral.h,26 :: 		for (i = 1; i <= 6; i++)
; i start address is: 12 (R3)
MOVS	R3, #1
SXTH	R3, R3
; i end address is: 12 (R3)
L_lateral1129:
; i start address is: 12 (R3)
CMP	R3, #6
IT	GT
BGT	L_lateral1130
;parameter_lateral.h,28 :: 		ti[i] = ti[i] * (pi / 180.0); // konversi ke radian
LSLS	R1, R3, #2
MOVW	R0, #lo_addr(_ti+0)
MOVT	R0, #hi_addr(_ti+0)
ADDS	R2, R0, R1
VLDR	#1, S1, [R2, #0]
MOVW	R0, #64053
MOVT	R0, #15502
VMOV	S0, R0
VMUL.F32	S0, S1, S0
VSTR	#1, S0, [R2, #0]
;parameter_lateral.h,26 :: 		for (i = 1; i <= 6; i++)
ADDS	R3, R3, #1
SXTH	R3, R3
;parameter_lateral.h,29 :: 		}
; i end address is: 12 (R3)
IT	AL
BAL	L_lateral1129
L_lateral1130:
;parameter_lateral.h,30 :: 		}
L_end_lateral1:
LDR	LR, [SP, #0]
ADD	SP, SP, #8
BX	LR
; end of _lateral1
_lateral2:
;parameter_lateral.h,32 :: 		void lateral2()
SUB	SP, SP, #8
STR	LR, [SP, #0]
;parameter_lateral.h,35 :: 		modFactor = sqrt((float)hmean / 60.0);
MOVW	R0, #lo_addr(_hmean+0)
MOVT	R0, #hi_addr(_hmean+0)
VLDR	#1, S1, [R0, #0]
MOVW	R0, #0
MOVT	R0, #17008
VMOV	S0, R0
VDIV.F32	S0, S1, S0
BL	_sqrt+0
MOVW	R0, #lo_addr(_modFactor+0)
MOVT	R0, #hi_addr(_modFactor+0)
VSTR	#1, S0, [R0, #0]
;parameter_lateral.h,37 :: 		ti[1] = -60 * sqrt(modFactor);
VMOV.F32	S0, S0
BL	_sqrt+0
MOVW	R0, #0
MOVT	R0, #49776
VMOV	S1, R0
VMUL.F32	S0, S1, S0
MOVW	R0, #lo_addr(_ti+4)
MOVT	R0, #hi_addr(_ti+4)
VSTR	#1, S0, [R0, #0]
;parameter_lateral.h,38 :: 		ai[1] = 1.2 * 18;
MOVW	R0, #52429
MOVT	R0, #16812
VMOV	S0, R0
MOVW	R0, #lo_addr(_ai+4)
MOVT	R0, #hi_addr(_ai+4)
VSTR	#1, S0, [R0, #0]
;parameter_lateral.h,39 :: 		bi[1] = 0.2 * modFactor;
MOVW	R1, #lo_addr(_modFactor+0)
MOVT	R1, #hi_addr(_modFactor+0)
VLDR	#1, S1, [R1, #0]
MOVW	R0, #52429
MOVT	R0, #15948
VMOV	S0, R0
VMUL.F32	S0, S0, S1
MOVW	R0, #lo_addr(_bi+4)
MOVT	R0, #hi_addr(_bi+4)
VSTR	#1, S0, [R0, #0]
;parameter_lateral.h,40 :: 		ti[2] = -15 * modFactor;
MOV	R0, R1
VLDR	#1, S1, [R0, #0]
VMOV.F32	S0, #-15
VMUL.F32	S0, S0, S1
MOVW	R0, #lo_addr(_ti+8)
MOVT	R0, #hi_addr(_ti+8)
VSTR	#1, S0, [R0, #0]
;parameter_lateral.h,41 :: 		ai[2] = -6 * 18;
MOVW	R0, #0
MOVT	R0, #49880
VMOV	S0, R0
MOVW	R0, #lo_addr(_ai+8)
MOVT	R0, #hi_addr(_ai+8)
VSTR	#1, S0, [R0, #0]
;parameter_lateral.h,42 :: 		bi[2] = 0.1 * modFactor;
MOV	R0, R1
VLDR	#1, S1, [R0, #0]
MOVW	R0, #52429
MOVT	R0, #15820
VMOV	S0, R0
VMUL.F32	S0, S0, S1
MOVW	R0, #lo_addr(_bi+8)
MOVT	R0, #hi_addr(_bi+8)
VSTR	#1, S0, [R0, #0]
;parameter_lateral.h,43 :: 		ti[3] = 0;
MOV	R0, #0
VMOV	S0, R0
MOVW	R0, #lo_addr(_ti+12)
MOVT	R0, #hi_addr(_ti+12)
VSTR	#1, S0, [R0, #0]
;parameter_lateral.h,44 :: 		ai[3] = 22.5 * 18;
MOVW	R0, #32768
MOVT	R0, #17354
VMOV	S0, R0
MOVW	R0, #lo_addr(_ai+12)
MOVT	R0, #hi_addr(_ai+12)
VSTR	#1, S0, [R0, #0]
;parameter_lateral.h,45 :: 		bi[3] = 0.1 * modFactor;
MOV	R0, R1
VLDR	#1, S1, [R0, #0]
MOVW	R0, #52429
MOVT	R0, #15820
VMOV	S0, R0
VMUL.F32	S0, S0, S1
MOVW	R0, #lo_addr(_bi+12)
MOVT	R0, #hi_addr(_bi+12)
VSTR	#1, S0, [R0, #0]
;parameter_lateral.h,46 :: 		ti[4] = 15 * modFactor;
MOV	R0, R1
VLDR	#1, S1, [R0, #0]
VMOV.F32	S0, #15
VMUL.F32	S0, S0, S1
MOVW	R0, #lo_addr(_ti+16)
MOVT	R0, #hi_addr(_ti+16)
VSTR	#1, S0, [R0, #0]
;parameter_lateral.h,47 :: 		ai[4] = 0.5 * 18;
VMOV.F32	S0, #9
MOVW	R0, #lo_addr(_ai+16)
MOVT	R0, #hi_addr(_ai+16)
VSTR	#1, S0, [R0, #0]
;parameter_lateral.h,48 :: 		bi[4] = 0.1 * modFactor;
MOV	R0, R1
VLDR	#1, S1, [R0, #0]
MOVW	R0, #52429
MOVT	R0, #15820
VMOV	S0, R0
VMUL.F32	S0, S0, S1
MOVW	R0, #lo_addr(_bi+16)
MOVT	R0, #hi_addr(_bi+16)
VSTR	#1, S0, [R0, #0]
;parameter_lateral.h,49 :: 		ti[5] = 97 * sqrt(modFactor);
MOV	R0, R1
VLDR	#1, S0, [R0, #0]
BL	_sqrt+0
MOVW	R0, #0
MOVT	R0, #17090
VMOV	S1, R0
VMUL.F32	S0, S1, S0
MOVW	R0, #lo_addr(_ti+20)
MOVT	R0, #hi_addr(_ti+20)
VSTR	#1, S0, [R0, #0]
;parameter_lateral.h,50 :: 		ai[5] = 0.17 * ((modFactor * modFactor)*sqrt(modFactor)) * 18;
MOVW	R1, #lo_addr(_modFactor+0)
MOVT	R1, #hi_addr(_modFactor+0)
VLDR	#1, S1, [R1, #0]
MOV	R0, R1
VLDR	#1, S0, [R0, #0]
VMUL.F32	S0, S0, S1
VSTR	#1, S0, [SP, #4]
MOV	R0, R1
VLDR	#1, S0, [R0, #0]
BL	_sqrt+0
VLDR	#1, S1, [SP, #4]
VMUL.F32	S1, S1, S0
MOVW	R0, #5243
MOVT	R0, #15918
VMOV	S0, R0
VMUL.F32	S1, S0, S1
VMOV.F32	S0, #18
VMUL.F32	S0, S1, S0
MOVW	R0, #lo_addr(_ai+20)
MOVT	R0, #hi_addr(_ai+20)
VSTR	#1, S0, [R0, #0]
;parameter_lateral.h,51 :: 		bi[5] = 0.4 / modFactor;
MOVW	R1, #lo_addr(_modFactor+0)
MOVT	R1, #hi_addr(_modFactor+0)
VLDR	#1, S1, [R1, #0]
MOVW	R0, #52429
MOVT	R0, #16076
VMOV	S0, R0
VDIV.F32	S0, S0, S1
MOVW	R0, #lo_addr(_bi+20)
MOVT	R0, #hi_addr(_bi+20)
VSTR	#1, S0, [R0, #0]
;parameter_lateral.h,52 :: 		ti[6] = 100 * sqrt(modFactor);
MOV	R0, R1
VLDR	#1, S0, [R0, #0]
BL	_sqrt+0
MOVW	R0, #0
MOVT	R0, #17096
VMOV	S1, R0
VMUL.F32	S0, S1, S0
MOVW	R0, #lo_addr(_ti+24)
MOVT	R0, #hi_addr(_ti+24)
VSTR	#1, S0, [R0, #0]
;parameter_lateral.h,53 :: 		ai[6] = 0.25 *((modFactor * modFactor)*sqrt(modFactor)) * 18;
MOVW	R1, #lo_addr(_modFactor+0)
MOVT	R1, #hi_addr(_modFactor+0)
VLDR	#1, S1, [R1, #0]
MOV	R0, R1
VLDR	#1, S0, [R0, #0]
VMUL.F32	S0, S0, S1
VSTR	#1, S0, [SP, #4]
MOV	R0, R1
VLDR	#1, S0, [R0, #0]
BL	_sqrt+0
VLDR	#1, S1, [SP, #4]
VMUL.F32	S1, S1, S0
VMOV.F32	S0, #0.25
VMUL.F32	S1, S0, S1
VMOV.F32	S0, #18
VMUL.F32	S0, S1, S0
MOVW	R0, #lo_addr(_ai+24)
MOVT	R0, #hi_addr(_ai+24)
VSTR	#1, S0, [R0, #0]
;parameter_lateral.h,54 :: 		bi[6] = 0.2 * modFactor;
MOVW	R0, #lo_addr(_modFactor+0)
MOVT	R0, #hi_addr(_modFactor+0)
VLDR	#1, S1, [R0, #0]
MOVW	R0, #52429
MOVT	R0, #15948
VMOV	S0, R0
VMUL.F32	S0, S0, S1
MOVW	R0, #lo_addr(_bi+24)
MOVT	R0, #hi_addr(_bi+24)
VSTR	#1, S0, [R0, #0]
;parameter_lateral.h,57 :: 		for (i = 1; i <= 6; i++)
; i start address is: 12 (R3)
MOVS	R3, #1
SXTH	R3, R3
; i end address is: 12 (R3)
L_lateral2132:
; i start address is: 12 (R3)
CMP	R3, #6
IT	GT
BGT	L_lateral2133
;parameter_lateral.h,59 :: 		ti[i] = ti[i] * (pi / 180.0); // konversi ke radian
LSLS	R1, R3, #2
MOVW	R0, #lo_addr(_ti+0)
MOVT	R0, #hi_addr(_ti+0)
ADDS	R2, R0, R1
VLDR	#1, S1, [R2, #0]
MOVW	R0, #64053
MOVT	R0, #15502
VMOV	S0, R0
VMUL.F32	S0, S1, S0
VSTR	#1, S0, [R2, #0]
;parameter_lateral.h,57 :: 		for (i = 1; i <= 6; i++)
ADDS	R3, R3, #1
SXTH	R3, R3
;parameter_lateral.h,60 :: 		}
; i end address is: 12 (R3)
IT	AL
BAL	L_lateral2132
L_lateral2133:
;parameter_lateral.h,61 :: 		}
L_end_lateral2:
LDR	LR, [SP, #0]
ADD	SP, SP, #8
BX	LR
; end of _lateral2
_lateral3:
;parameter_lateral.h,63 :: 		void lateral3()
SUB	SP, SP, #8
STR	LR, [SP, #0]
;parameter_lateral.h,66 :: 		modFactor = sqrt((float)hmean / 60.0);
MOVW	R0, #lo_addr(_hmean+0)
MOVT	R0, #hi_addr(_hmean+0)
VLDR	#1, S1, [R0, #0]
MOVW	R0, #0
MOVT	R0, #17008
VMOV	S0, R0
VDIV.F32	S0, S1, S0
BL	_sqrt+0
MOVW	R0, #lo_addr(_modFactor+0)
MOVT	R0, #hi_addr(_modFactor+0)
VSTR	#1, S0, [R0, #0]
;parameter_lateral.h,68 :: 		ti[1] = -60 * sqrt(modFactor);
VMOV.F32	S0, S0
BL	_sqrt+0
MOVW	R0, #0
MOVT	R0, #49776
VMOV	S1, R0
VMUL.F32	S0, S1, S0
MOVW	R0, #lo_addr(_ti+4)
MOVT	R0, #hi_addr(_ti+4)
VSTR	#1, S0, [R0, #0]
;parameter_lateral.h,69 :: 		ai[1] = 0.8 * 18;
MOVW	R0, #26215
MOVT	R0, #16742
VMOV	S0, R0
MOVW	R0, #lo_addr(_ai+4)
MOVT	R0, #hi_addr(_ai+4)
VSTR	#1, S0, [R0, #0]
;parameter_lateral.h,70 :: 		bi[1] = 0.2 * modFactor;
MOVW	R1, #lo_addr(_modFactor+0)
MOVT	R1, #hi_addr(_modFactor+0)
VLDR	#1, S1, [R1, #0]
MOVW	R0, #52429
MOVT	R0, #15948
VMOV	S0, R0
VMUL.F32	S0, S0, S1
MOVW	R0, #lo_addr(_bi+4)
MOVT	R0, #hi_addr(_bi+4)
VSTR	#1, S0, [R0, #0]
;parameter_lateral.h,71 :: 		ti[2] = -15 * modFactor;
MOV	R0, R1
VLDR	#1, S1, [R0, #0]
VMOV.F32	S0, #-15
VMUL.F32	S0, S0, S1
MOVW	R0, #lo_addr(_ti+8)
MOVT	R0, #hi_addr(_ti+8)
VSTR	#1, S0, [R0, #0]
;parameter_lateral.h,72 :: 		ai[2] = -0.5 * 18;
VMOV.F32	S0, #-9
MOVW	R0, #lo_addr(_ai+8)
MOVT	R0, #hi_addr(_ai+8)
VSTR	#1, S0, [R0, #0]
;parameter_lateral.h,73 :: 		bi[2] = 0.1 * modFactor;
MOV	R0, R1
VLDR	#1, S1, [R0, #0]
MOVW	R0, #52429
MOVT	R0, #15820
VMOV	S0, R0
VMUL.F32	S0, S0, S1
MOVW	R0, #lo_addr(_bi+8)
MOVT	R0, #hi_addr(_bi+8)
VSTR	#1, S0, [R0, #0]
;parameter_lateral.h,74 :: 		ti[3] = 0;
MOV	R0, #0
VMOV	S0, R0
MOVW	R0, #lo_addr(_ti+12)
MOVT	R0, #hi_addr(_ti+12)
VSTR	#1, S0, [R0, #0]
;parameter_lateral.h,75 :: 		ai[3] = 26.25 * 18;
MOVW	R0, #16384
MOVT	R0, #17388
VMOV	S0, R0
MOVW	R0, #lo_addr(_ai+12)
MOVT	R0, #hi_addr(_ai+12)
VSTR	#1, S0, [R0, #0]
;parameter_lateral.h,76 :: 		bi[3] = 0.1 * modFactor;
MOV	R0, R1
VLDR	#1, S1, [R0, #0]
MOVW	R0, #52429
MOVT	R0, #15820
VMOV	S0, R0
VMUL.F32	S0, S0, S1
MOVW	R0, #lo_addr(_bi+12)
MOVT	R0, #hi_addr(_bi+12)
VSTR	#1, S0, [R0, #0]
;parameter_lateral.h,77 :: 		ti[4] = 15 * modFactor;
MOV	R0, R1
VLDR	#1, S1, [R0, #0]
VMOV.F32	S0, #15
VMUL.F32	S0, S0, S1
MOVW	R0, #lo_addr(_ti+16)
MOVT	R0, #hi_addr(_ti+16)
VSTR	#1, S0, [R0, #0]
;parameter_lateral.h,78 :: 		ai[4] = -11.25 * 18;
MOVW	R0, #32768
MOVT	R0, #49994
VMOV	S0, R0
MOVW	R0, #lo_addr(_ai+16)
MOVT	R0, #hi_addr(_ai+16)
VSTR	#1, S0, [R0, #0]
;parameter_lateral.h,79 :: 		bi[4] = 0.1 * modFactor;
MOV	R0, R1
VLDR	#1, S1, [R0, #0]
MOVW	R0, #52429
MOVT	R0, #15820
VMOV	S0, R0
VMUL.F32	S0, S0, S1
MOVW	R0, #lo_addr(_bi+16)
MOVT	R0, #hi_addr(_bi+16)
VSTR	#1, S0, [R0, #0]
;parameter_lateral.h,80 :: 		ti[5] = 97 * sqrt(modFactor);
MOV	R0, R1
VLDR	#1, S0, [R0, #0]
BL	_sqrt+0
MOVW	R0, #0
MOVT	R0, #17090
VMOV	S1, R0
VMUL.F32	S0, S1, S0
MOVW	R0, #lo_addr(_ti+20)
MOVT	R0, #hi_addr(_ti+20)
VSTR	#1, S0, [R0, #0]
;parameter_lateral.h,81 :: 		ai[5] = 0.25 * ((modFactor * modFactor)*sqrt(modFactor)) * 18;
MOVW	R1, #lo_addr(_modFactor+0)
MOVT	R1, #hi_addr(_modFactor+0)
VLDR	#1, S1, [R1, #0]
MOV	R0, R1
VLDR	#1, S0, [R0, #0]
VMUL.F32	S0, S0, S1
VSTR	#1, S0, [SP, #4]
MOV	R0, R1
VLDR	#1, S0, [R0, #0]
BL	_sqrt+0
VLDR	#1, S1, [SP, #4]
VMUL.F32	S1, S1, S0
VMOV.F32	S0, #0.25
VMUL.F32	S1, S0, S1
VMOV.F32	S0, #18
VMUL.F32	S0, S1, S0
MOVW	R0, #lo_addr(_ai+20)
MOVT	R0, #hi_addr(_ai+20)
VSTR	#1, S0, [R0, #0]
;parameter_lateral.h,82 :: 		bi[5] = 0.4 / modFactor;
MOVW	R1, #lo_addr(_modFactor+0)
MOVT	R1, #hi_addr(_modFactor+0)
VLDR	#1, S1, [R1, #0]
MOVW	R0, #52429
MOVT	R0, #16076
VMOV	S0, R0
VDIV.F32	S0, S0, S1
MOVW	R0, #lo_addr(_bi+20)
MOVT	R0, #hi_addr(_bi+20)
VSTR	#1, S0, [R0, #0]
;parameter_lateral.h,83 :: 		ti[6] = 100 * sqrt(modFactor);
MOV	R0, R1
VLDR	#1, S0, [R0, #0]
BL	_sqrt+0
MOVW	R0, #0
MOVT	R0, #17096
VMOV	S1, R0
VMUL.F32	S0, S1, S0
MOVW	R0, #lo_addr(_ti+24)
MOVT	R0, #hi_addr(_ti+24)
VSTR	#1, S0, [R0, #0]
;parameter_lateral.h,84 :: 		ai[6] = 0.3 *((modFactor * modFactor)*sqrt(modFactor)) * 18;
MOVW	R1, #lo_addr(_modFactor+0)
MOVT	R1, #hi_addr(_modFactor+0)
VLDR	#1, S1, [R1, #0]
MOV	R0, R1
VLDR	#1, S0, [R0, #0]
VMUL.F32	S0, S0, S1
VSTR	#1, S0, [SP, #4]
MOV	R0, R1
VLDR	#1, S0, [R0, #0]
BL	_sqrt+0
VLDR	#1, S1, [SP, #4]
VMUL.F32	S1, S1, S0
MOVW	R0, #39322
MOVT	R0, #16025
VMOV	S0, R0
VMUL.F32	S1, S0, S1
VMOV.F32	S0, #18
VMUL.F32	S0, S1, S0
MOVW	R0, #lo_addr(_ai+24)
MOVT	R0, #hi_addr(_ai+24)
VSTR	#1, S0, [R0, #0]
;parameter_lateral.h,85 :: 		bi[6] = 0.2 * modFactor;
MOVW	R0, #lo_addr(_modFactor+0)
MOVT	R0, #hi_addr(_modFactor+0)
VLDR	#1, S1, [R0, #0]
MOVW	R0, #52429
MOVT	R0, #15948
VMOV	S0, R0
VMUL.F32	S0, S0, S1
MOVW	R0, #lo_addr(_bi+24)
MOVT	R0, #hi_addr(_bi+24)
VSTR	#1, S0, [R0, #0]
;parameter_lateral.h,88 :: 		for (i = 1; i <= 6; i++)
; i start address is: 12 (R3)
MOVS	R3, #1
SXTH	R3, R3
; i end address is: 12 (R3)
L_lateral3135:
; i start address is: 12 (R3)
CMP	R3, #6
IT	GT
BGT	L_lateral3136
;parameter_lateral.h,90 :: 		ti[i] = ti[i] * (pi / 180.0); // konversi ke radian
LSLS	R1, R3, #2
MOVW	R0, #lo_addr(_ti+0)
MOVT	R0, #hi_addr(_ti+0)
ADDS	R2, R0, R1
VLDR	#1, S1, [R2, #0]
MOVW	R0, #64053
MOVT	R0, #15502
VMOV	S0, R0
VMUL.F32	S0, S1, S0
VSTR	#1, S0, [R2, #0]
;parameter_lateral.h,88 :: 		for (i = 1; i <= 6; i++)
ADDS	R3, R3, #1
SXTH	R3, R3
;parameter_lateral.h,91 :: 		}
; i end address is: 12 (R3)
IT	AL
BAL	L_lateral3135
L_lateral3136:
;parameter_lateral.h,92 :: 		}
L_end_lateral3:
LDR	LR, [SP, #0]
ADD	SP, SP, #8
BX	LR
; end of _lateral3
_lateralaVR:
;parameter_lateral.h,94 :: 		void lateralaVR()
SUB	SP, SP, #8
STR	LR, [SP, #0]
;parameter_lateral.h,97 :: 		modFactor = sqrt((float)hmean / 60.0);
MOVW	R0, #lo_addr(_hmean+0)
MOVT	R0, #hi_addr(_hmean+0)
VLDR	#1, S1, [R0, #0]
MOVW	R0, #0
MOVT	R0, #17008
VMOV	S0, R0
VDIV.F32	S0, S1, S0
BL	_sqrt+0
MOVW	R0, #lo_addr(_modFactor+0)
MOVT	R0, #hi_addr(_modFactor+0)
VSTR	#1, S0, [R0, #0]
;parameter_lateral.h,99 :: 		ti[1] = -60 * sqrt(modFactor);
VMOV.F32	S0, S0
BL	_sqrt+0
MOVW	R0, #0
MOVT	R0, #49776
VMOV	S1, R0
VMUL.F32	S0, S1, S0
MOVW	R0, #lo_addr(_ti+4)
MOVT	R0, #hi_addr(_ti+4)
VSTR	#1, S0, [R0, #0]
;parameter_lateral.h,100 :: 		ai[1] = -0.8 * 18;
MOVW	R0, #26215
MOVT	R0, #49510
VMOV	S0, R0
MOVW	R0, #lo_addr(_ai+4)
MOVT	R0, #hi_addr(_ai+4)
VSTR	#1, S0, [R0, #0]
;parameter_lateral.h,101 :: 		bi[1] = 0.2 * modFactor;
MOVW	R1, #lo_addr(_modFactor+0)
MOVT	R1, #hi_addr(_modFactor+0)
VLDR	#1, S1, [R1, #0]
MOVW	R0, #52429
MOVT	R0, #15948
VMOV	S0, R0
VMUL.F32	S0, S0, S1
MOVW	R0, #lo_addr(_bi+4)
MOVT	R0, #hi_addr(_bi+4)
VSTR	#1, S0, [R0, #0]
;parameter_lateral.h,102 :: 		ti[2] = -15 * modFactor;
MOV	R0, R1
VLDR	#1, S1, [R0, #0]
VMOV.F32	S0, #-15
VMUL.F32	S0, S0, S1
MOVW	R0, #lo_addr(_ti+8)
MOVT	R0, #hi_addr(_ti+8)
VSTR	#1, S0, [R0, #0]
;parameter_lateral.h,103 :: 		ai[2] = 8 * 18;
MOVW	R0, #0
MOVT	R0, #17168
VMOV	S0, R0
MOVW	R0, #lo_addr(_ai+8)
MOVT	R0, #hi_addr(_ai+8)
VSTR	#1, S0, [R0, #0]
;parameter_lateral.h,104 :: 		bi[2] = 0.1 * modFactor;
MOV	R0, R1
VLDR	#1, S1, [R0, #0]
MOVW	R0, #52429
MOVT	R0, #15820
VMOV	S0, R0
VMUL.F32	S0, S0, S1
MOVW	R0, #lo_addr(_bi+8)
MOVT	R0, #hi_addr(_bi+8)
VSTR	#1, S0, [R0, #0]
;parameter_lateral.h,105 :: 		ti[3] = 0;
MOV	R0, #0
VMOV	S0, R0
MOVW	R0, #lo_addr(_ti+12)
MOVT	R0, #hi_addr(_ti+12)
VSTR	#1, S0, [R0, #0]
;parameter_lateral.h,106 :: 		ai[3] = -37.5 * 18;
MOVW	R0, #49152
MOVT	R0, #50216
VMOV	S0, R0
MOVW	R0, #lo_addr(_ai+12)
MOVT	R0, #hi_addr(_ai+12)
VSTR	#1, S0, [R0, #0]
;parameter_lateral.h,107 :: 		bi[3] = 0.1 * modFactor;
MOV	R0, R1
VLDR	#1, S1, [R0, #0]
MOVW	R0, #52429
MOVT	R0, #15820
VMOV	S0, R0
VMUL.F32	S0, S0, S1
MOVW	R0, #lo_addr(_bi+12)
MOVT	R0, #hi_addr(_bi+12)
VSTR	#1, S0, [R0, #0]
;parameter_lateral.h,108 :: 		ti[4] = 15 * modFactor;
MOV	R0, R1
VLDR	#1, S1, [R0, #0]
VMOV.F32	S0, #15
VMUL.F32	S0, S0, S1
MOVW	R0, #lo_addr(_ti+16)
MOVT	R0, #hi_addr(_ti+16)
VSTR	#1, S0, [R0, #0]
;parameter_lateral.h,109 :: 		ai[4] = -0.5 * 18;
VMOV.F32	S0, #-9
MOVW	R0, #lo_addr(_ai+16)
MOVT	R0, #hi_addr(_ai+16)
VSTR	#1, S0, [R0, #0]
;parameter_lateral.h,110 :: 		bi[4] = 0.1 * modFactor;
MOV	R0, R1
VLDR	#1, S1, [R0, #0]
MOVW	R0, #52429
MOVT	R0, #15820
VMOV	S0, R0
VMUL.F32	S0, S0, S1
MOVW	R0, #lo_addr(_bi+16)
MOVT	R0, #hi_addr(_bi+16)
VSTR	#1, S0, [R0, #0]
;parameter_lateral.h,111 :: 		ti[5] = 97 * sqrt(modFactor);
MOV	R0, R1
VLDR	#1, S0, [R0, #0]
BL	_sqrt+0
MOVW	R0, #0
MOVT	R0, #17090
VMOV	S1, R0
VMUL.F32	S0, S1, S0
MOVW	R0, #lo_addr(_ti+20)
MOVT	R0, #hi_addr(_ti+20)
VSTR	#1, S0, [R0, #0]
;parameter_lateral.h,112 :: 		ai[5] = -0.3 * ((modFactor * modFactor)*sqrt(modFactor)) * 18;
MOVW	R1, #lo_addr(_modFactor+0)
MOVT	R1, #hi_addr(_modFactor+0)
VLDR	#1, S1, [R1, #0]
MOV	R0, R1
VLDR	#1, S0, [R0, #0]
VMUL.F32	S0, S0, S1
VSTR	#1, S0, [SP, #4]
MOV	R0, R1
VLDR	#1, S0, [R0, #0]
BL	_sqrt+0
VLDR	#1, S1, [SP, #4]
VMUL.F32	S1, S1, S0
MOVW	R0, #39322
MOVT	R0, #48793
VMOV	S0, R0
VMUL.F32	S1, S0, S1
VMOV.F32	S0, #18
VMUL.F32	S0, S1, S0
MOVW	R0, #lo_addr(_ai+20)
MOVT	R0, #hi_addr(_ai+20)
VSTR	#1, S0, [R0, #0]
;parameter_lateral.h,113 :: 		bi[5] = 0.4 / modFactor;
MOVW	R1, #lo_addr(_modFactor+0)
MOVT	R1, #hi_addr(_modFactor+0)
VLDR	#1, S1, [R1, #0]
MOVW	R0, #52429
MOVT	R0, #16076
VMOV	S0, R0
VDIV.F32	S0, S0, S1
MOVW	R0, #lo_addr(_bi+20)
MOVT	R0, #hi_addr(_bi+20)
VSTR	#1, S0, [R0, #0]
;parameter_lateral.h,114 :: 		ti[6] = 100 * sqrt(modFactor);
MOV	R0, R1
VLDR	#1, S0, [R0, #0]
BL	_sqrt+0
MOVW	R0, #0
MOVT	R0, #17096
VMOV	S1, R0
VMUL.F32	S0, S1, S0
MOVW	R0, #lo_addr(_ti+24)
MOVT	R0, #hi_addr(_ti+24)
VSTR	#1, S0, [R0, #0]
;parameter_lateral.h,115 :: 		ai[6] = -0.5 *((modFactor * modFactor)*sqrt(modFactor)) * 18;
MOVW	R1, #lo_addr(_modFactor+0)
MOVT	R1, #hi_addr(_modFactor+0)
VLDR	#1, S1, [R1, #0]
MOV	R0, R1
VLDR	#1, S0, [R0, #0]
VMUL.F32	S0, S0, S1
VSTR	#1, S0, [SP, #4]
MOV	R0, R1
VLDR	#1, S0, [R0, #0]
BL	_sqrt+0
VLDR	#1, S1, [SP, #4]
VMUL.F32	S1, S1, S0
VMOV.F32	S0, #-0.5
VMUL.F32	S1, S0, S1
VMOV.F32	S0, #18
VMUL.F32	S0, S1, S0
MOVW	R0, #lo_addr(_ai+24)
MOVT	R0, #hi_addr(_ai+24)
VSTR	#1, S0, [R0, #0]
;parameter_lateral.h,116 :: 		bi[6] = 0.2 * modFactor;
MOVW	R0, #lo_addr(_modFactor+0)
MOVT	R0, #hi_addr(_modFactor+0)
VLDR	#1, S1, [R0, #0]
MOVW	R0, #52429
MOVT	R0, #15948
VMOV	S0, R0
VMUL.F32	S0, S0, S1
MOVW	R0, #lo_addr(_bi+24)
MOVT	R0, #hi_addr(_bi+24)
VSTR	#1, S0, [R0, #0]
;parameter_lateral.h,119 :: 		for (i = 1; i <= 6; i++)
; i start address is: 12 (R3)
MOVS	R3, #1
SXTH	R3, R3
; i end address is: 12 (R3)
L_lateralaVR138:
; i start address is: 12 (R3)
CMP	R3, #6
IT	GT
BGT	L_lateralaVR139
;parameter_lateral.h,121 :: 		ti[i] = ti[i] * (pi / 180.0); // konversi ke radian
LSLS	R1, R3, #2
MOVW	R0, #lo_addr(_ti+0)
MOVT	R0, #hi_addr(_ti+0)
ADDS	R2, R0, R1
VLDR	#1, S1, [R2, #0]
MOVW	R0, #64053
MOVT	R0, #15502
VMOV	S0, R0
VMUL.F32	S0, S1, S0
VSTR	#1, S0, [R2, #0]
;parameter_lateral.h,119 :: 		for (i = 1; i <= 6; i++)
ADDS	R3, R3, #1
SXTH	R3, R3
;parameter_lateral.h,122 :: 		}
; i end address is: 12 (R3)
IT	AL
BAL	L_lateralaVR138
L_lateralaVR139:
;parameter_lateral.h,123 :: 		}
L_end_lateralaVR:
LDR	LR, [SP, #0]
ADD	SP, SP, #8
BX	LR
; end of _lateralaVR
_lateralaVL:
;parameter_lateral.h,125 :: 		void lateralaVL()
SUB	SP, SP, #8
STR	LR, [SP, #0]
;parameter_lateral.h,128 :: 		modFactor = sqrt((float)hmean / 60.0);
MOVW	R0, #lo_addr(_hmean+0)
MOVT	R0, #hi_addr(_hmean+0)
VLDR	#1, S1, [R0, #0]
MOVW	R0, #0
MOVT	R0, #17008
VMOV	S0, R0
VDIV.F32	S0, S1, S0
BL	_sqrt+0
MOVW	R0, #lo_addr(_modFactor+0)
MOVT	R0, #hi_addr(_modFactor+0)
VSTR	#1, S0, [R0, #0]
;parameter_lateral.h,130 :: 		ti[1] = -60 * sqrt(modFactor);
VMOV.F32	S0, S0
BL	_sqrt+0
MOVW	R0, #0
MOVT	R0, #49776
VMOV	S1, R0
VMUL.F32	S0, S1, S0
MOVW	R0, #lo_addr(_ti+4)
MOVT	R0, #hi_addr(_ti+4)
VSTR	#1, S0, [R0, #0]
;parameter_lateral.h,131 :: 		ai[1] = 0.8 * 18;
MOVW	R0, #26215
MOVT	R0, #16742
VMOV	S0, R0
MOVW	R0, #lo_addr(_ai+4)
MOVT	R0, #hi_addr(_ai+4)
VSTR	#1, S0, [R0, #0]
;parameter_lateral.h,132 :: 		bi[1] = 0.2 * modFactor;
MOVW	R1, #lo_addr(_modFactor+0)
MOVT	R1, #hi_addr(_modFactor+0)
VLDR	#1, S1, [R1, #0]
MOVW	R0, #52429
MOVT	R0, #15948
VMOV	S0, R0
VMUL.F32	S0, S0, S1
MOVW	R0, #lo_addr(_bi+4)
MOVT	R0, #hi_addr(_bi+4)
VSTR	#1, S0, [R0, #0]
;parameter_lateral.h,133 :: 		ti[2] = -15 * modFactor;
MOV	R0, R1
VLDR	#1, S1, [R0, #0]
VMOV.F32	S0, #-15
VMUL.F32	S0, S0, S1
MOVW	R0, #lo_addr(_ti+8)
MOVT	R0, #hi_addr(_ti+8)
VSTR	#1, S0, [R0, #0]
;parameter_lateral.h,134 :: 		ai[2] = -13 * 18;
MOVW	R0, #0
MOVT	R0, #50026
VMOV	S0, R0
MOVW	R0, #lo_addr(_ai+8)
MOVT	R0, #hi_addr(_ai+8)
VSTR	#1, S0, [R0, #0]
;parameter_lateral.h,135 :: 		bi[2] = 0.1 * modFactor;
MOV	R0, R1
VLDR	#1, S1, [R0, #0]
MOVW	R0, #52429
MOVT	R0, #15820
VMOV	S0, R0
VMUL.F32	S0, S0, S1
MOVW	R0, #lo_addr(_bi+8)
MOVT	R0, #hi_addr(_bi+8)
VSTR	#1, S0, [R0, #0]
;parameter_lateral.h,136 :: 		ti[3] = 0;
MOV	R0, #0
VMOV	S0, R0
MOVW	R0, #lo_addr(_ti+12)
MOVT	R0, #hi_addr(_ti+12)
VSTR	#1, S0, [R0, #0]
;parameter_lateral.h,137 :: 		ai[3] = 38 * 18;
MOVW	R0, #0
MOVT	R0, #17451
VMOV	S0, R0
MOVW	R0, #lo_addr(_ai+12)
MOVT	R0, #hi_addr(_ai+12)
VSTR	#1, S0, [R0, #0]
;parameter_lateral.h,138 :: 		bi[3] = 0.1 * modFactor;
MOV	R0, R1
VLDR	#1, S1, [R0, #0]
MOVW	R0, #52429
MOVT	R0, #15820
VMOV	S0, R0
VMUL.F32	S0, S0, S1
MOVW	R0, #lo_addr(_bi+12)
MOVT	R0, #hi_addr(_bi+12)
VSTR	#1, S0, [R0, #0]
;parameter_lateral.h,139 :: 		ti[4] = 15 * modFactor;
MOV	R0, R1
VLDR	#1, S1, [R0, #0]
VMOV.F32	S0, #15
VMUL.F32	S0, S0, S1
MOVW	R0, #lo_addr(_ti+16)
MOVT	R0, #hi_addr(_ti+16)
VSTR	#1, S0, [R0, #0]
;parameter_lateral.h,140 :: 		ai[4] = 1 * 18;
VMOV.F32	S0, #18
MOVW	R0, #lo_addr(_ai+16)
MOVT	R0, #hi_addr(_ai+16)
VSTR	#1, S0, [R0, #0]
;parameter_lateral.h,141 :: 		bi[4] = 0.2 * modFactor;
MOV	R0, R1
VLDR	#1, S1, [R0, #0]
MOVW	R0, #52429
MOVT	R0, #15948
VMOV	S0, R0
VMUL.F32	S0, S0, S1
MOVW	R0, #lo_addr(_bi+16)
MOVT	R0, #hi_addr(_bi+16)
VSTR	#1, S0, [R0, #0]
;parameter_lateral.h,142 :: 		ti[5] = 67 * sqrt(modFactor);
MOV	R0, R1
VLDR	#1, S0, [R0, #0]
BL	_sqrt+0
MOVW	R0, #0
MOVT	R0, #17030
VMOV	S1, R0
VMUL.F32	S0, S1, S0
MOVW	R0, #lo_addr(_ti+20)
MOVT	R0, #hi_addr(_ti+20)
VSTR	#1, S0, [R0, #0]
;parameter_lateral.h,143 :: 		ai[5] = 0.68 * ((modFactor * modFactor)*sqrt(modFactor)) * 18;
MOVW	R1, #lo_addr(_modFactor+0)
MOVT	R1, #hi_addr(_modFactor+0)
VLDR	#1, S1, [R1, #0]
MOV	R0, R1
VLDR	#1, S0, [R0, #0]
VMUL.F32	S0, S0, S1
VSTR	#1, S0, [SP, #4]
MOV	R0, R1
VLDR	#1, S0, [R0, #0]
BL	_sqrt+0
VLDR	#1, S1, [SP, #4]
VMUL.F32	S1, S1, S0
MOVW	R0, #5243
MOVT	R0, #16174
VMOV	S0, R0
VMUL.F32	S1, S0, S1
VMOV.F32	S0, #18
VMUL.F32	S0, S1, S0
MOVW	R0, #lo_addr(_ai+20)
MOVT	R0, #hi_addr(_ai+20)
VSTR	#1, S0, [R0, #0]
;parameter_lateral.h,144 :: 		bi[5] = 0.4 / modFactor;
MOVW	R1, #lo_addr(_modFactor+0)
MOVT	R1, #hi_addr(_modFactor+0)
VLDR	#1, S1, [R1, #0]
MOVW	R0, #52429
MOVT	R0, #16076
VMOV	S0, R0
VDIV.F32	S0, S0, S1
MOVW	R0, #lo_addr(_bi+20)
MOVT	R0, #hi_addr(_bi+20)
VSTR	#1, S0, [R0, #0]
;parameter_lateral.h,145 :: 		ti[6] = 70 * sqrt(modFactor);
MOV	R0, R1
VLDR	#1, S0, [R0, #0]
BL	_sqrt+0
MOVW	R0, #0
MOVT	R0, #17036
VMOV	S1, R0
VMUL.F32	S0, S1, S0
MOVW	R0, #lo_addr(_ti+24)
MOVT	R0, #hi_addr(_ti+24)
VSTR	#1, S0, [R0, #0]
;parameter_lateral.h,146 :: 		ai[6] = 1 *((modFactor * modFactor)*sqrt(modFactor)) * 18;
MOVW	R1, #lo_addr(_modFactor+0)
MOVT	R1, #hi_addr(_modFactor+0)
VLDR	#1, S1, [R1, #0]
MOV	R0, R1
VLDR	#1, S0, [R0, #0]
VMUL.F32	S0, S0, S1
VSTR	#1, S0, [SP, #4]
MOV	R0, R1
VLDR	#1, S0, [R0, #0]
BL	_sqrt+0
VLDR	#1, S1, [SP, #4]
VMUL.F32	S1, S1, S0
VMOV.F32	S0, #18
VMUL.F32	S0, S1, S0
MOVW	R0, #lo_addr(_ai+24)
MOVT	R0, #hi_addr(_ai+24)
VSTR	#1, S0, [R0, #0]
;parameter_lateral.h,147 :: 		bi[6] = 0.2 * modFactor;
MOVW	R0, #lo_addr(_modFactor+0)
MOVT	R0, #hi_addr(_modFactor+0)
VLDR	#1, S1, [R0, #0]
MOVW	R0, #52429
MOVT	R0, #15948
VMOV	S0, R0
VMUL.F32	S0, S0, S1
MOVW	R0, #lo_addr(_bi+24)
MOVT	R0, #hi_addr(_bi+24)
VSTR	#1, S0, [R0, #0]
;parameter_lateral.h,150 :: 		for (i = 1; i <= 6; i++)
; i start address is: 12 (R3)
MOVS	R3, #1
SXTH	R3, R3
; i end address is: 12 (R3)
L_lateralaVL141:
; i start address is: 12 (R3)
CMP	R3, #6
IT	GT
BGT	L_lateralaVL142
;parameter_lateral.h,152 :: 		ti[i] = ti[i] * (pi / 180.0); // konversi ke radian
LSLS	R1, R3, #2
MOVW	R0, #lo_addr(_ti+0)
MOVT	R0, #hi_addr(_ti+0)
ADDS	R2, R0, R1
VLDR	#1, S1, [R2, #0]
MOVW	R0, #64053
MOVT	R0, #15502
VMOV	S0, R0
VMUL.F32	S0, S1, S0
VSTR	#1, S0, [R2, #0]
;parameter_lateral.h,150 :: 		for (i = 1; i <= 6; i++)
ADDS	R3, R3, #1
SXTH	R3, R3
;parameter_lateral.h,153 :: 		}
; i end address is: 12 (R3)
IT	AL
BAL	L_lateralaVL141
L_lateralaVL142:
;parameter_lateral.h,154 :: 		}
L_end_lateralaVL:
LDR	LR, [SP, #0]
ADD	SP, SP, #8
BX	LR
; end of _lateralaVL
_lateralaVF:
;parameter_lateral.h,156 :: 		void lateralaVF()
SUB	SP, SP, #8
STR	LR, [SP, #0]
;parameter_lateral.h,159 :: 		modFactor = sqrt((float)hmean / 60.0);
MOVW	R0, #lo_addr(_hmean+0)
MOVT	R0, #hi_addr(_hmean+0)
VLDR	#1, S1, [R0, #0]
MOVW	R0, #0
MOVT	R0, #17008
VMOV	S0, R0
VDIV.F32	S0, S1, S0
BL	_sqrt+0
MOVW	R0, #lo_addr(_modFactor+0)
MOVT	R0, #hi_addr(_modFactor+0)
VSTR	#1, S0, [R0, #0]
;parameter_lateral.h,161 :: 		ti[1] = -60 * sqrt(modFactor);
VMOV.F32	S0, S0
BL	_sqrt+0
MOVW	R0, #0
MOVT	R0, #49776
VMOV	S1, R0
VMUL.F32	S0, S1, S0
MOVW	R0, #lo_addr(_ti+4)
MOVT	R0, #hi_addr(_ti+4)
VSTR	#1, S0, [R0, #0]
;parameter_lateral.h,162 :: 		ai[1] = 0.8 * 18;
MOVW	R0, #26215
MOVT	R0, #16742
VMOV	S0, R0
MOVW	R0, #lo_addr(_ai+4)
MOVT	R0, #hi_addr(_ai+4)
VSTR	#1, S0, [R0, #0]
;parameter_lateral.h,163 :: 		bi[1] = 0.2 * modFactor;
MOVW	R1, #lo_addr(_modFactor+0)
MOVT	R1, #hi_addr(_modFactor+0)
VLDR	#1, S1, [R1, #0]
MOVW	R0, #52429
MOVT	R0, #15948
VMOV	S0, R0
VMUL.F32	S0, S0, S1
MOVW	R0, #lo_addr(_bi+4)
MOVT	R0, #hi_addr(_bi+4)
VSTR	#1, S0, [R0, #0]
;parameter_lateral.h,164 :: 		ti[2] = -15 * modFactor;
MOV	R0, R1
VLDR	#1, S1, [R0, #0]
VMOV.F32	S0, #-15
VMUL.F32	S0, S0, S1
MOVW	R0, #lo_addr(_ti+8)
MOVT	R0, #hi_addr(_ti+8)
VSTR	#1, S0, [R0, #0]
;parameter_lateral.h,165 :: 		ai[2] = 0.5 * 18;
VMOV.F32	S0, #9
MOVW	R0, #lo_addr(_ai+8)
MOVT	R0, #hi_addr(_ai+8)
VSTR	#1, S0, [R0, #0]
;parameter_lateral.h,166 :: 		bi[2] = 0.1 * modFactor;
MOV	R0, R1
VLDR	#1, S1, [R0, #0]
MOVW	R0, #52429
MOVT	R0, #15820
VMOV	S0, R0
VMUL.F32	S0, S0, S1
MOVW	R0, #lo_addr(_bi+8)
MOVT	R0, #hi_addr(_bi+8)
VSTR	#1, S0, [R0, #0]
;parameter_lateral.h,167 :: 		ti[3] = 0;
MOV	R0, #0
VMOV	S0, R0
MOVW	R0, #lo_addr(_ti+12)
MOVT	R0, #hi_addr(_ti+12)
VSTR	#1, S0, [R0, #0]
;parameter_lateral.h,168 :: 		ai[3] = 30 * 18;
MOVW	R0, #0
MOVT	R0, #17415
VMOV	S0, R0
MOVW	R0, #lo_addr(_ai+12)
MOVT	R0, #hi_addr(_ai+12)
VSTR	#1, S0, [R0, #0]
;parameter_lateral.h,169 :: 		bi[3] = 0.1 * modFactor;
MOV	R0, R1
VLDR	#1, S1, [R0, #0]
MOVW	R0, #52429
MOVT	R0, #15820
VMOV	S0, R0
VMUL.F32	S0, S0, S1
MOVW	R0, #lo_addr(_bi+12)
MOVT	R0, #hi_addr(_bi+12)
VSTR	#1, S0, [R0, #0]
;parameter_lateral.h,170 :: 		ti[4] = 15 * modFactor;
MOV	R0, R1
VLDR	#1, S1, [R0, #0]
VMOV.F32	S0, #15
VMUL.F32	S0, S0, S1
MOVW	R0, #lo_addr(_ti+16)
MOVT	R0, #hi_addr(_ti+16)
VSTR	#1, S0, [R0, #0]
;parameter_lateral.h,171 :: 		ai[4] = -11.25 * 18;
MOVW	R0, #32768
MOVT	R0, #49994
VMOV	S0, R0
MOVW	R0, #lo_addr(_ai+16)
MOVT	R0, #hi_addr(_ai+16)
VSTR	#1, S0, [R0, #0]
;parameter_lateral.h,172 :: 		bi[4] = 0.1 * modFactor;
MOV	R0, R1
VLDR	#1, S1, [R0, #0]
MOVW	R0, #52429
MOVT	R0, #15820
VMOV	S0, R0
VMUL.F32	S0, S0, S1
MOVW	R0, #lo_addr(_bi+16)
MOVT	R0, #hi_addr(_bi+16)
VSTR	#1, S0, [R0, #0]
;parameter_lateral.h,173 :: 		ti[5] = 97 * sqrt(modFactor);
MOV	R0, R1
VLDR	#1, S0, [R0, #0]
BL	_sqrt+0
MOVW	R0, #0
MOVT	R0, #17090
VMOV	S1, R0
VMUL.F32	S0, S1, S0
MOVW	R0, #lo_addr(_ti+20)
MOVT	R0, #hi_addr(_ti+20)
VSTR	#1, S0, [R0, #0]
;parameter_lateral.h,174 :: 		ai[5] = 0.3 * ((modFactor * modFactor)*sqrt(modFactor)) * 18;
MOVW	R1, #lo_addr(_modFactor+0)
MOVT	R1, #hi_addr(_modFactor+0)
VLDR	#1, S1, [R1, #0]
MOV	R0, R1
VLDR	#1, S0, [R0, #0]
VMUL.F32	S0, S0, S1
VSTR	#1, S0, [SP, #4]
MOV	R0, R1
VLDR	#1, S0, [R0, #0]
BL	_sqrt+0
VLDR	#1, S1, [SP, #4]
VMUL.F32	S1, S1, S0
MOVW	R0, #39322
MOVT	R0, #16025
VMOV	S0, R0
VMUL.F32	S1, S0, S1
VMOV.F32	S0, #18
VMUL.F32	S0, S1, S0
MOVW	R0, #lo_addr(_ai+20)
MOVT	R0, #hi_addr(_ai+20)
VSTR	#1, S0, [R0, #0]
;parameter_lateral.h,175 :: 		bi[5] = 0.4 / modFactor;
MOVW	R1, #lo_addr(_modFactor+0)
MOVT	R1, #hi_addr(_modFactor+0)
VLDR	#1, S1, [R1, #0]
MOVW	R0, #52429
MOVT	R0, #16076
VMOV	S0, R0
VDIV.F32	S0, S0, S1
MOVW	R0, #lo_addr(_bi+20)
MOVT	R0, #hi_addr(_bi+20)
VSTR	#1, S0, [R0, #0]
;parameter_lateral.h,176 :: 		ti[6] = 100 * sqrt(modFactor);
MOV	R0, R1
VLDR	#1, S0, [R0, #0]
BL	_sqrt+0
MOVW	R0, #0
MOVT	R0, #17096
VMOV	S1, R0
VMUL.F32	S0, S1, S0
MOVW	R0, #lo_addr(_ti+24)
MOVT	R0, #hi_addr(_ti+24)
VSTR	#1, S0, [R0, #0]
;parameter_lateral.h,177 :: 		ai[6] = 0.5 *((modFactor * modFactor)*sqrt(modFactor)) * 18;
MOVW	R1, #lo_addr(_modFactor+0)
MOVT	R1, #hi_addr(_modFactor+0)
VLDR	#1, S1, [R1, #0]
MOV	R0, R1
VLDR	#1, S0, [R0, #0]
VMUL.F32	S0, S0, S1
VSTR	#1, S0, [SP, #4]
MOV	R0, R1
VLDR	#1, S0, [R0, #0]
BL	_sqrt+0
VLDR	#1, S1, [SP, #4]
VMUL.F32	S1, S1, S0
VMOV.F32	S0, #0.5
VMUL.F32	S1, S0, S1
VMOV.F32	S0, #18
VMUL.F32	S0, S1, S0
MOVW	R0, #lo_addr(_ai+24)
MOVT	R0, #hi_addr(_ai+24)
VSTR	#1, S0, [R0, #0]
;parameter_lateral.h,178 :: 		bi[6] = 0.2 * modFactor;
MOVW	R0, #lo_addr(_modFactor+0)
MOVT	R0, #hi_addr(_modFactor+0)
VLDR	#1, S1, [R0, #0]
MOVW	R0, #52429
MOVT	R0, #15948
VMOV	S0, R0
VMUL.F32	S0, S0, S1
MOVW	R0, #lo_addr(_bi+24)
MOVT	R0, #hi_addr(_bi+24)
VSTR	#1, S0, [R0, #0]
;parameter_lateral.h,181 :: 		for (i = 1; i <= 6; i++)
; i start address is: 12 (R3)
MOVS	R3, #1
SXTH	R3, R3
; i end address is: 12 (R3)
L_lateralaVF144:
; i start address is: 12 (R3)
CMP	R3, #6
IT	GT
BGT	L_lateralaVF145
;parameter_lateral.h,183 :: 		ti[i] = ti[i] * (pi / 180.0); // konversi ke radian
LSLS	R1, R3, #2
MOVW	R0, #lo_addr(_ti+0)
MOVT	R0, #hi_addr(_ti+0)
ADDS	R2, R0, R1
VLDR	#1, S1, [R2, #0]
MOVW	R0, #64053
MOVT	R0, #15502
VMOV	S0, R0
VMUL.F32	S0, S1, S0
VSTR	#1, S0, [R2, #0]
;parameter_lateral.h,181 :: 		for (i = 1; i <= 6; i++)
ADDS	R3, R3, #1
SXTH	R3, R3
;parameter_lateral.h,184 :: 		}
; i end address is: 12 (R3)
IT	AL
BAL	L_lateralaVF144
L_lateralaVF145:
;parameter_lateral.h,185 :: 		}
L_end_lateralaVF:
LDR	LR, [SP, #0]
ADD	SP, SP, #8
BX	LR
; end of _lateralaVF
_lateralV1:
;parameter_lateral.h,187 :: 		void lateralV1()
SUB	SP, SP, #8
STR	LR, [SP, #0]
;parameter_lateral.h,190 :: 		modFactor = sqrt((float)hmean / 60.0);
MOVW	R0, #lo_addr(_hmean+0)
MOVT	R0, #hi_addr(_hmean+0)
VLDR	#1, S1, [R0, #0]
MOVW	R0, #0
MOVT	R0, #17008
VMOV	S0, R0
VDIV.F32	S0, S1, S0
BL	_sqrt+0
MOVW	R0, #lo_addr(_modFactor+0)
MOVT	R0, #hi_addr(_modFactor+0)
VSTR	#1, S0, [R0, #0]
;parameter_lateral.h,192 :: 		ti[1] = -60 * sqrt(modFactor);
VMOV.F32	S0, S0
BL	_sqrt+0
MOVW	R0, #0
MOVT	R0, #49776
VMOV	S1, R0
VMUL.F32	S0, S1, S0
MOVW	R0, #lo_addr(_ti+4)
MOVT	R0, #hi_addr(_ti+4)
VSTR	#1, S0, [R0, #0]
;parameter_lateral.h,193 :: 		ai[1] = 0.8 * 18;
MOVW	R0, #26215
MOVT	R0, #16742
VMOV	S0, R0
MOVW	R0, #lo_addr(_ai+4)
MOVT	R0, #hi_addr(_ai+4)
VSTR	#1, S0, [R0, #0]
;parameter_lateral.h,194 :: 		bi[1] = 0.2 * modFactor;
MOVW	R1, #lo_addr(_modFactor+0)
MOVT	R1, #hi_addr(_modFactor+0)
VLDR	#1, S1, [R1, #0]
MOVW	R0, #52429
MOVT	R0, #15948
VMOV	S0, R0
VMUL.F32	S0, S0, S1
MOVW	R0, #lo_addr(_bi+4)
MOVT	R0, #hi_addr(_bi+4)
VSTR	#1, S0, [R0, #0]
;parameter_lateral.h,195 :: 		ti[2] = -15 * modFactor;
MOV	R0, R1
VLDR	#1, S1, [R0, #0]
VMOV.F32	S0, #-15
VMUL.F32	S0, S0, S1
MOVW	R0, #lo_addr(_ti+8)
MOVT	R0, #hi_addr(_ti+8)
VSTR	#1, S0, [R0, #0]
;parameter_lateral.h,196 :: 		ai[2] = -5 * 18;
MOVW	R0, #0
MOVT	R0, #49844
VMOV	S0, R0
MOVW	R0, #lo_addr(_ai+8)
MOVT	R0, #hi_addr(_ai+8)
VSTR	#1, S0, [R0, #0]
;parameter_lateral.h,197 :: 		bi[2] = 0.1 * modFactor;
MOV	R0, R1
VLDR	#1, S1, [R0, #0]
MOVW	R0, #52429
MOVT	R0, #15820
VMOV	S0, R0
VMUL.F32	S0, S0, S1
MOVW	R0, #lo_addr(_bi+8)
MOVT	R0, #hi_addr(_bi+8)
VSTR	#1, S0, [R0, #0]
;parameter_lateral.h,198 :: 		ti[3] = 0;
MOV	R0, #0
VMOV	S0, R0
MOVW	R0, #lo_addr(_ti+12)
MOVT	R0, #hi_addr(_ti+12)
VSTR	#1, S0, [R0, #0]
;parameter_lateral.h,199 :: 		ai[3] = -30 * 18;
MOVW	R0, #0
MOVT	R0, #50183
VMOV	S0, R0
MOVW	R0, #lo_addr(_ai+12)
MOVT	R0, #hi_addr(_ai+12)
VSTR	#1, S0, [R0, #0]
;parameter_lateral.h,200 :: 		bi[3] = 0.1 * modFactor;
MOV	R0, R1
VLDR	#1, S1, [R0, #0]
MOVW	R0, #52429
MOVT	R0, #15820
VMOV	S0, R0
VMUL.F32	S0, S0, S1
MOVW	R0, #lo_addr(_bi+12)
MOVT	R0, #hi_addr(_bi+12)
VSTR	#1, S0, [R0, #0]
;parameter_lateral.h,201 :: 		ti[4] = 15 * modFactor;
MOV	R0, R1
VLDR	#1, S1, [R0, #0]
VMOV.F32	S0, #15
VMUL.F32	S0, S0, S1
MOVW	R0, #lo_addr(_ti+16)
MOVT	R0, #hi_addr(_ti+16)
VSTR	#1, S0, [R0, #0]
;parameter_lateral.h,202 :: 		ai[4] = -0.5 * 18;
VMOV.F32	S0, #-9
MOVW	R0, #lo_addr(_ai+16)
MOVT	R0, #hi_addr(_ai+16)
VSTR	#1, S0, [R0, #0]
;parameter_lateral.h,203 :: 		bi[4] = 0.25 * modFactor;
MOV	R0, R1
VLDR	#1, S1, [R0, #0]
VMOV.F32	S0, #0.25
VMUL.F32	S0, S0, S1
MOVW	R0, #lo_addr(_bi+16)
MOVT	R0, #hi_addr(_bi+16)
VSTR	#1, S0, [R0, #0]
;parameter_lateral.h,204 :: 		ti[5] = 97 * sqrt(modFactor);
MOV	R0, R1
VLDR	#1, S0, [R0, #0]
BL	_sqrt+0
MOVW	R0, #0
MOVT	R0, #17090
VMOV	S1, R0
VMUL.F32	S0, S1, S0
MOVW	R0, #lo_addr(_ti+20)
MOVT	R0, #hi_addr(_ti+20)
VSTR	#1, S0, [R0, #0]
;parameter_lateral.h,205 :: 		ai[5] = 0.25 * ((modFactor * modFactor)*sqrt(modFactor)) * 18;
MOVW	R1, #lo_addr(_modFactor+0)
MOVT	R1, #hi_addr(_modFactor+0)
VLDR	#1, S1, [R1, #0]
MOV	R0, R1
VLDR	#1, S0, [R0, #0]
VMUL.F32	S0, S0, S1
VSTR	#1, S0, [SP, #4]
MOV	R0, R1
VLDR	#1, S0, [R0, #0]
BL	_sqrt+0
VLDR	#1, S1, [SP, #4]
VMUL.F32	S1, S1, S0
VMOV.F32	S0, #0.25
VMUL.F32	S1, S0, S1
VMOV.F32	S0, #18
VMUL.F32	S0, S1, S0
MOVW	R0, #lo_addr(_ai+20)
MOVT	R0, #hi_addr(_ai+20)
VSTR	#1, S0, [R0, #0]
;parameter_lateral.h,206 :: 		bi[5] = 0.4 / modFactor;
MOVW	R1, #lo_addr(_modFactor+0)
MOVT	R1, #hi_addr(_modFactor+0)
VLDR	#1, S1, [R1, #0]
MOVW	R0, #52429
MOVT	R0, #16076
VMOV	S0, R0
VDIV.F32	S0, S0, S1
MOVW	R0, #lo_addr(_bi+20)
MOVT	R0, #hi_addr(_bi+20)
VSTR	#1, S0, [R0, #0]
;parameter_lateral.h,207 :: 		ti[6] = 100 * sqrt(modFactor);
MOV	R0, R1
VLDR	#1, S0, [R0, #0]
BL	_sqrt+0
MOVW	R0, #0
MOVT	R0, #17096
VMOV	S1, R0
VMUL.F32	S0, S1, S0
MOVW	R0, #lo_addr(_ti+24)
MOVT	R0, #hi_addr(_ti+24)
VSTR	#1, S0, [R0, #0]
;parameter_lateral.h,208 :: 		ai[6] = 0.35 *((modFactor * modFactor)*sqrt(modFactor)) * 18;
MOVW	R1, #lo_addr(_modFactor+0)
MOVT	R1, #hi_addr(_modFactor+0)
VLDR	#1, S1, [R1, #0]
MOV	R0, R1
VLDR	#1, S0, [R0, #0]
VMUL.F32	S0, S0, S1
VSTR	#1, S0, [SP, #4]
MOV	R0, R1
VLDR	#1, S0, [R0, #0]
BL	_sqrt+0
VLDR	#1, S1, [SP, #4]
VMUL.F32	S1, S1, S0
MOVW	R0, #13107
MOVT	R0, #16051
VMOV	S0, R0
VMUL.F32	S1, S0, S1
VMOV.F32	S0, #18
VMUL.F32	S0, S1, S0
MOVW	R0, #lo_addr(_ai+24)
MOVT	R0, #hi_addr(_ai+24)
VSTR	#1, S0, [R0, #0]
;parameter_lateral.h,209 :: 		bi[6] = 0.2 * modFactor;
MOVW	R0, #lo_addr(_modFactor+0)
MOVT	R0, #hi_addr(_modFactor+0)
VLDR	#1, S1, [R0, #0]
MOVW	R0, #52429
MOVT	R0, #15948
VMOV	S0, R0
VMUL.F32	S0, S0, S1
MOVW	R0, #lo_addr(_bi+24)
MOVT	R0, #hi_addr(_bi+24)
VSTR	#1, S0, [R0, #0]
;parameter_lateral.h,212 :: 		for (i = 1; i <= 6; i++)
; i start address is: 12 (R3)
MOVS	R3, #1
SXTH	R3, R3
; i end address is: 12 (R3)
L_lateralV1147:
; i start address is: 12 (R3)
CMP	R3, #6
IT	GT
BGT	L_lateralV1148
;parameter_lateral.h,214 :: 		ti[i] = ti[i] * (pi / 180.0); // konversi ke radian
LSLS	R1, R3, #2
MOVW	R0, #lo_addr(_ti+0)
MOVT	R0, #hi_addr(_ti+0)
ADDS	R2, R0, R1
VLDR	#1, S1, [R2, #0]
MOVW	R0, #64053
MOVT	R0, #15502
VMOV	S0, R0
VMUL.F32	S0, S1, S0
VSTR	#1, S0, [R2, #0]
;parameter_lateral.h,212 :: 		for (i = 1; i <= 6; i++)
ADDS	R3, R3, #1
SXTH	R3, R3
;parameter_lateral.h,215 :: 		}
; i end address is: 12 (R3)
IT	AL
BAL	L_lateralV1147
L_lateralV1148:
;parameter_lateral.h,216 :: 		}
L_end_lateralV1:
LDR	LR, [SP, #0]
ADD	SP, SP, #8
BX	LR
; end of _lateralV1
_lateralV2:
;parameter_lateral.h,218 :: 		void lateralV2()
SUB	SP, SP, #8
STR	LR, [SP, #0]
;parameter_lateral.h,221 :: 		modFactor = sqrt((float)hmean / 60.0);
MOVW	R0, #lo_addr(_hmean+0)
MOVT	R0, #hi_addr(_hmean+0)
VLDR	#1, S1, [R0, #0]
MOVW	R0, #0
MOVT	R0, #17008
VMOV	S0, R0
VDIV.F32	S0, S1, S0
BL	_sqrt+0
MOVW	R0, #lo_addr(_modFactor+0)
MOVT	R0, #hi_addr(_modFactor+0)
VSTR	#1, S0, [R0, #0]
;parameter_lateral.h,223 :: 		ti[1] = -60 * sqrt(modFactor);
VMOV.F32	S0, S0
BL	_sqrt+0
MOVW	R0, #0
MOVT	R0, #49776
VMOV	S1, R0
VMUL.F32	S0, S1, S0
MOVW	R0, #lo_addr(_ti+4)
MOVT	R0, #hi_addr(_ti+4)
VSTR	#1, S0, [R0, #0]
;parameter_lateral.h,224 :: 		ai[1] = 0.8 * 18;
MOVW	R0, #26215
MOVT	R0, #16742
VMOV	S0, R0
MOVW	R0, #lo_addr(_ai+4)
MOVT	R0, #hi_addr(_ai+4)
VSTR	#1, S0, [R0, #0]
;parameter_lateral.h,225 :: 		bi[1] = 0.2 * modFactor;
MOVW	R1, #lo_addr(_modFactor+0)
MOVT	R1, #hi_addr(_modFactor+0)
VLDR	#1, S1, [R1, #0]
MOVW	R0, #52429
MOVT	R0, #15948
VMOV	S0, R0
VMUL.F32	S0, S0, S1
MOVW	R0, #lo_addr(_bi+4)
MOVT	R0, #hi_addr(_bi+4)
VSTR	#1, S0, [R0, #0]
;parameter_lateral.h,226 :: 		ti[2] = -15 * modFactor;
MOV	R0, R1
VLDR	#1, S1, [R0, #0]
VMOV.F32	S0, #-15
VMUL.F32	S0, S0, S1
MOVW	R0, #lo_addr(_ti+8)
MOVT	R0, #hi_addr(_ti+8)
VSTR	#1, S0, [R0, #0]
;parameter_lateral.h,227 :: 		ai[2] = 10 * 18;
MOVW	R0, #0
MOVT	R0, #17204
VMOV	S0, R0
MOVW	R0, #lo_addr(_ai+8)
MOVT	R0, #hi_addr(_ai+8)
VSTR	#1, S0, [R0, #0]
;parameter_lateral.h,228 :: 		bi[2] = 0.1 * modFactor;
MOV	R0, R1
VLDR	#1, S1, [R0, #0]
MOVW	R0, #52429
MOVT	R0, #15820
VMOV	S0, R0
VMUL.F32	S0, S0, S1
MOVW	R0, #lo_addr(_bi+8)
MOVT	R0, #hi_addr(_bi+8)
VSTR	#1, S0, [R0, #0]
;parameter_lateral.h,229 :: 		ti[3] = 0;
MOV	R0, #0
VMOV	S0, R0
MOVW	R0, #lo_addr(_ti+12)
MOVT	R0, #hi_addr(_ti+12)
VSTR	#1, S0, [R0, #0]
;parameter_lateral.h,230 :: 		ai[3] = -53.3 * 18;
MOVW	R0, #55705
MOVT	R0, #50287
VMOV	S0, R0
MOVW	R0, #lo_addr(_ai+12)
MOVT	R0, #hi_addr(_ai+12)
VSTR	#1, S0, [R0, #0]
;parameter_lateral.h,231 :: 		bi[3] = 0.1 * modFactor;
MOV	R0, R1
VLDR	#1, S1, [R0, #0]
MOVW	R0, #52429
MOVT	R0, #15820
VMOV	S0, R0
VMUL.F32	S0, S0, S1
MOVW	R0, #lo_addr(_bi+12)
MOVT	R0, #hi_addr(_bi+12)
VSTR	#1, S0, [R0, #0]
;parameter_lateral.h,232 :: 		ti[4] = 15 * modFactor;
MOV	R0, R1
VLDR	#1, S1, [R0, #0]
VMOV.F32	S0, #15
VMUL.F32	S0, S0, S1
MOVW	R0, #lo_addr(_ti+16)
MOVT	R0, #hi_addr(_ti+16)
VSTR	#1, S0, [R0, #0]
;parameter_lateral.h,233 :: 		ai[4] = -1 * 18;
VMOV.F32	S0, #-18
MOVW	R0, #lo_addr(_ai+16)
MOVT	R0, #hi_addr(_ai+16)
VSTR	#1, S0, [R0, #0]
;parameter_lateral.h,234 :: 		bi[4] = 0.2 * modFactor;
MOV	R0, R1
VLDR	#1, S1, [R0, #0]
MOVW	R0, #52429
MOVT	R0, #15948
VMOV	S0, R0
VMUL.F32	S0, S0, S1
MOVW	R0, #lo_addr(_bi+16)
MOVT	R0, #hi_addr(_bi+16)
VSTR	#1, S0, [R0, #0]
;parameter_lateral.h,235 :: 		ti[5] = 97 * sqrt(modFactor);
MOV	R0, R1
VLDR	#1, S0, [R0, #0]
BL	_sqrt+0
MOVW	R0, #0
MOVT	R0, #17090
VMOV	S1, R0
VMUL.F32	S0, S1, S0
MOVW	R0, #lo_addr(_ti+20)
MOVT	R0, #hi_addr(_ti+20)
VSTR	#1, S0, [R0, #0]
;parameter_lateral.h,236 :: 		ai[5] = 0.7 * ((modFactor * modFactor)*sqrt(modFactor)) * 18;
MOVW	R1, #lo_addr(_modFactor+0)
MOVT	R1, #hi_addr(_modFactor+0)
VLDR	#1, S1, [R1, #0]
MOV	R0, R1
VLDR	#1, S0, [R0, #0]
VMUL.F32	S0, S0, S1
VSTR	#1, S0, [SP, #4]
MOV	R0, R1
VLDR	#1, S0, [R0, #0]
BL	_sqrt+0
VLDR	#1, S1, [SP, #4]
VMUL.F32	S1, S1, S0
MOVW	R0, #13107
MOVT	R0, #16179
VMOV	S0, R0
VMUL.F32	S1, S0, S1
VMOV.F32	S0, #18
VMUL.F32	S0, S1, S0
MOVW	R0, #lo_addr(_ai+20)
MOVT	R0, #hi_addr(_ai+20)
VSTR	#1, S0, [R0, #0]
;parameter_lateral.h,237 :: 		bi[5] = 0.4 / modFactor;
MOVW	R1, #lo_addr(_modFactor+0)
MOVT	R1, #hi_addr(_modFactor+0)
VLDR	#1, S1, [R1, #0]
MOVW	R0, #52429
MOVT	R0, #16076
VMOV	S0, R0
VDIV.F32	S0, S0, S1
MOVW	R0, #lo_addr(_bi+20)
MOVT	R0, #hi_addr(_bi+20)
VSTR	#1, S0, [R0, #0]
;parameter_lateral.h,238 :: 		ti[6] = 100 * sqrt(modFactor);
MOV	R0, R1
VLDR	#1, S0, [R0, #0]
BL	_sqrt+0
MOVW	R0, #0
MOVT	R0, #17096
VMOV	S1, R0
VMUL.F32	S0, S1, S0
MOVW	R0, #lo_addr(_ti+24)
MOVT	R0, #hi_addr(_ti+24)
VSTR	#1, S0, [R0, #0]
;parameter_lateral.h,239 :: 		ai[6] = 1.04 *((modFactor * modFactor)*sqrt(modFactor)) * 18;
MOVW	R1, #lo_addr(_modFactor+0)
MOVT	R1, #hi_addr(_modFactor+0)
VLDR	#1, S1, [R1, #0]
MOV	R0, R1
VLDR	#1, S0, [R0, #0]
VMUL.F32	S0, S0, S1
VSTR	#1, S0, [SP, #4]
MOV	R0, R1
VLDR	#1, S0, [R0, #0]
BL	_sqrt+0
VLDR	#1, S1, [SP, #4]
VMUL.F32	S1, S1, S0
MOVW	R0, #7864
MOVT	R0, #16261
VMOV	S0, R0
VMUL.F32	S1, S0, S1
VMOV.F32	S0, #18
VMUL.F32	S0, S1, S0
MOVW	R0, #lo_addr(_ai+24)
MOVT	R0, #hi_addr(_ai+24)
VSTR	#1, S0, [R0, #0]
;parameter_lateral.h,240 :: 		bi[6] = 0.2 * modFactor;
MOVW	R0, #lo_addr(_modFactor+0)
MOVT	R0, #hi_addr(_modFactor+0)
VLDR	#1, S1, [R0, #0]
MOVW	R0, #52429
MOVT	R0, #15948
VMOV	S0, R0
VMUL.F32	S0, S0, S1
MOVW	R0, #lo_addr(_bi+24)
MOVT	R0, #hi_addr(_bi+24)
VSTR	#1, S0, [R0, #0]
;parameter_lateral.h,243 :: 		for (i = 1; i <= 6; i++)
; i start address is: 12 (R3)
MOVS	R3, #1
SXTH	R3, R3
; i end address is: 12 (R3)
L_lateralV2150:
; i start address is: 12 (R3)
CMP	R3, #6
IT	GT
BGT	L_lateralV2151
;parameter_lateral.h,245 :: 		ti[i] = ti[i] * (pi / 180.0); // konversi ke radian
LSLS	R1, R3, #2
MOVW	R0, #lo_addr(_ti+0)
MOVT	R0, #hi_addr(_ti+0)
ADDS	R2, R0, R1
VLDR	#1, S1, [R2, #0]
MOVW	R0, #64053
MOVT	R0, #15502
VMOV	S0, R0
VMUL.F32	S0, S1, S0
VSTR	#1, S0, [R2, #0]
;parameter_lateral.h,243 :: 		for (i = 1; i <= 6; i++)
ADDS	R3, R3, #1
SXTH	R3, R3
;parameter_lateral.h,246 :: 		}
; i end address is: 12 (R3)
IT	AL
BAL	L_lateralV2150
L_lateralV2151:
;parameter_lateral.h,247 :: 		}
L_end_lateralV2:
LDR	LR, [SP, #0]
ADD	SP, SP, #8
BX	LR
; end of _lateralV2
_lateralV3:
;parameter_lateral.h,249 :: 		void lateralV3()
SUB	SP, SP, #8
STR	LR, [SP, #0]
;parameter_lateral.h,252 :: 		modFactor = sqrt((float)hmean / 60.0);
MOVW	R0, #lo_addr(_hmean+0)
MOVT	R0, #hi_addr(_hmean+0)
VLDR	#1, S1, [R0, #0]
MOVW	R0, #0
MOVT	R0, #17008
VMOV	S0, R0
VDIV.F32	S0, S1, S0
BL	_sqrt+0
MOVW	R0, #lo_addr(_modFactor+0)
MOVT	R0, #hi_addr(_modFactor+0)
VSTR	#1, S0, [R0, #0]
;parameter_lateral.h,254 :: 		ti[1] = -60 * sqrt(modFactor);
VMOV.F32	S0, S0
BL	_sqrt+0
MOVW	R0, #0
MOVT	R0, #49776
VMOV	S1, R0
VMUL.F32	S0, S1, S0
MOVW	R0, #lo_addr(_ti+4)
MOVT	R0, #hi_addr(_ti+4)
VSTR	#1, S0, [R0, #0]
;parameter_lateral.h,255 :: 		ai[1] = 0.8 * 18;
MOVW	R0, #26215
MOVT	R0, #16742
VMOV	S0, R0
MOVW	R0, #lo_addr(_ai+4)
MOVT	R0, #hi_addr(_ai+4)
VSTR	#1, S0, [R0, #0]
;parameter_lateral.h,256 :: 		bi[1] = 0.2 * modFactor;
MOVW	R1, #lo_addr(_modFactor+0)
MOVT	R1, #hi_addr(_modFactor+0)
VLDR	#1, S1, [R1, #0]
MOVW	R0, #52429
MOVT	R0, #15948
VMOV	S0, R0
VMUL.F32	S0, S0, S1
MOVW	R0, #lo_addr(_bi+4)
MOVT	R0, #hi_addr(_bi+4)
VSTR	#1, S0, [R0, #0]
;parameter_lateral.h,257 :: 		ti[2] = -15 * modFactor;
MOV	R0, R1
VLDR	#1, S1, [R0, #0]
VMOV.F32	S0, #-15
VMUL.F32	S0, S0, S1
MOVW	R0, #lo_addr(_ti+8)
MOVT	R0, #hi_addr(_ti+8)
VSTR	#1, S0, [R0, #0]
;parameter_lateral.h,258 :: 		ai[2] = 15 * 18;
MOVW	R0, #0
MOVT	R0, #17287
VMOV	S0, R0
MOVW	R0, #lo_addr(_ai+8)
MOVT	R0, #hi_addr(_ai+8)
VSTR	#1, S0, [R0, #0]
;parameter_lateral.h,259 :: 		bi[2] = 0.1 * modFactor;
MOV	R0, R1
VLDR	#1, S1, [R0, #0]
MOVW	R0, #52429
MOVT	R0, #15820
VMOV	S0, R0
VMUL.F32	S0, S0, S1
MOVW	R0, #lo_addr(_bi+8)
MOVT	R0, #hi_addr(_bi+8)
VSTR	#1, S0, [R0, #0]
;parameter_lateral.h,260 :: 		ti[3] = 0;
MOV	R0, #0
VMOV	S0, R0
MOVW	R0, #lo_addr(_ti+12)
MOVT	R0, #hi_addr(_ti+12)
VSTR	#1, S0, [R0, #0]
;parameter_lateral.h,261 :: 		ai[3] = -31 * 18;
MOVW	R0, #32768
MOVT	R0, #50187
VMOV	S0, R0
MOVW	R0, #lo_addr(_ai+12)
MOVT	R0, #hi_addr(_ai+12)
VSTR	#1, S0, [R0, #0]
;parameter_lateral.h,262 :: 		bi[3] = 0.1 * modFactor;
MOV	R0, R1
VLDR	#1, S1, [R0, #0]
MOVW	R0, #52429
MOVT	R0, #15820
VMOV	S0, R0
VMUL.F32	S0, S0, S1
MOVW	R0, #lo_addr(_bi+12)
MOVT	R0, #hi_addr(_bi+12)
VSTR	#1, S0, [R0, #0]
;parameter_lateral.h,263 :: 		ti[4] = 15 * modFactor;
MOV	R0, R1
VLDR	#1, S1, [R0, #0]
VMOV.F32	S0, #15
VMUL.F32	S0, S0, S1
MOVW	R0, #lo_addr(_ti+16)
MOVT	R0, #hi_addr(_ti+16)
VSTR	#1, S0, [R0, #0]
;parameter_lateral.h,264 :: 		ai[4] = -1 * 18;
VMOV.F32	S0, #-18
MOVW	R0, #lo_addr(_ai+16)
MOVT	R0, #hi_addr(_ai+16)
VSTR	#1, S0, [R0, #0]
;parameter_lateral.h,265 :: 		bi[4] = 0.2 * modFactor;
MOV	R0, R1
VLDR	#1, S1, [R0, #0]
MOVW	R0, #52429
MOVT	R0, #15948
VMOV	S0, R0
VMUL.F32	S0, S0, S1
MOVW	R0, #lo_addr(_bi+16)
MOVT	R0, #hi_addr(_bi+16)
VSTR	#1, S0, [R0, #0]
;parameter_lateral.h,266 :: 		ti[5] = 97 * sqrt(modFactor);
MOV	R0, R1
VLDR	#1, S0, [R0, #0]
BL	_sqrt+0
MOVW	R0, #0
MOVT	R0, #17090
VMOV	S1, R0
VMUL.F32	S0, S1, S0
MOVW	R0, #lo_addr(_ti+20)
MOVT	R0, #hi_addr(_ti+20)
VSTR	#1, S0, [R0, #0]
;parameter_lateral.h,267 :: 		ai[5] = 0.9 * ((modFactor * modFactor)*sqrt(modFactor)) * 18;
MOVW	R1, #lo_addr(_modFactor+0)
MOVT	R1, #hi_addr(_modFactor+0)
VLDR	#1, S1, [R1, #0]
MOV	R0, R1
VLDR	#1, S0, [R0, #0]
VMUL.F32	S0, S0, S1
VSTR	#1, S0, [SP, #4]
MOV	R0, R1
VLDR	#1, S0, [R0, #0]
BL	_sqrt+0
VLDR	#1, S1, [SP, #4]
VMUL.F32	S1, S1, S0
MOVW	R0, #26214
MOVT	R0, #16230
VMOV	S0, R0
VMUL.F32	S1, S0, S1
VMOV.F32	S0, #18
VMUL.F32	S0, S1, S0
MOVW	R0, #lo_addr(_ai+20)
MOVT	R0, #hi_addr(_ai+20)
VSTR	#1, S0, [R0, #0]
;parameter_lateral.h,268 :: 		bi[5] = 0.4 / modFactor;
MOVW	R1, #lo_addr(_modFactor+0)
MOVT	R1, #hi_addr(_modFactor+0)
VLDR	#1, S1, [R1, #0]
MOVW	R0, #52429
MOVT	R0, #16076
VMOV	S0, R0
VDIV.F32	S0, S0, S1
MOVW	R0, #lo_addr(_bi+20)
MOVT	R0, #hi_addr(_bi+20)
VSTR	#1, S0, [R0, #0]
;parameter_lateral.h,269 :: 		ti[6] = 100 * sqrt(modFactor);
MOV	R0, R1
VLDR	#1, S0, [R0, #0]
BL	_sqrt+0
MOVW	R0, #0
MOVT	R0, #17096
VMOV	S1, R0
VMUL.F32	S0, S1, S0
MOVW	R0, #lo_addr(_ti+24)
MOVT	R0, #hi_addr(_ti+24)
VSTR	#1, S0, [R0, #0]
;parameter_lateral.h,270 :: 		ai[6] = 1.5 *((modFactor * modFactor)*sqrt(modFactor)) * 18;
MOVW	R1, #lo_addr(_modFactor+0)
MOVT	R1, #hi_addr(_modFactor+0)
VLDR	#1, S1, [R1, #0]
MOV	R0, R1
VLDR	#1, S0, [R0, #0]
VMUL.F32	S0, S0, S1
VSTR	#1, S0, [SP, #4]
MOV	R0, R1
VLDR	#1, S0, [R0, #0]
BL	_sqrt+0
VLDR	#1, S1, [SP, #4]
VMUL.F32	S1, S1, S0
VMOV.F32	S0, #1.5
VMUL.F32	S1, S0, S1
VMOV.F32	S0, #18
VMUL.F32	S0, S1, S0
MOVW	R0, #lo_addr(_ai+24)
MOVT	R0, #hi_addr(_ai+24)
VSTR	#1, S0, [R0, #0]
;parameter_lateral.h,271 :: 		bi[6] = 0.2 * modFactor;
MOVW	R0, #lo_addr(_modFactor+0)
MOVT	R0, #hi_addr(_modFactor+0)
VLDR	#1, S1, [R0, #0]
MOVW	R0, #52429
MOVT	R0, #15948
VMOV	S0, R0
VMUL.F32	S0, S0, S1
MOVW	R0, #lo_addr(_bi+24)
MOVT	R0, #hi_addr(_bi+24)
VSTR	#1, S0, [R0, #0]
;parameter_lateral.h,274 :: 		for (i = 1; i <= 6; i++)
; i start address is: 12 (R3)
MOVS	R3, #1
SXTH	R3, R3
; i end address is: 12 (R3)
L_lateralV3153:
; i start address is: 12 (R3)
CMP	R3, #6
IT	GT
BGT	L_lateralV3154
;parameter_lateral.h,276 :: 		ti[i] = ti[i] * (pi / 180.0); // konversi ke radian
LSLS	R1, R3, #2
MOVW	R0, #lo_addr(_ti+0)
MOVT	R0, #hi_addr(_ti+0)
ADDS	R2, R0, R1
VLDR	#1, S1, [R2, #0]
MOVW	R0, #64053
MOVT	R0, #15502
VMOV	S0, R0
VMUL.F32	S0, S1, S0
VSTR	#1, S0, [R2, #0]
;parameter_lateral.h,274 :: 		for (i = 1; i <= 6; i++)
ADDS	R3, R3, #1
SXTH	R3, R3
;parameter_lateral.h,277 :: 		}
; i end address is: 12 (R3)
IT	AL
BAL	L_lateralV3153
L_lateralV3154:
;parameter_lateral.h,278 :: 		}
L_end_lateralV3:
LDR	LR, [SP, #0]
ADD	SP, SP, #8
BX	LR
; end of _lateralV3
_lateralV4:
;parameter_lateral.h,280 :: 		void lateralV4()
SUB	SP, SP, #8
STR	LR, [SP, #0]
;parameter_lateral.h,283 :: 		modFactor = sqrt((float)hmean / 60.0);
MOVW	R0, #lo_addr(_hmean+0)
MOVT	R0, #hi_addr(_hmean+0)
VLDR	#1, S1, [R0, #0]
MOVW	R0, #0
MOVT	R0, #17008
VMOV	S0, R0
VDIV.F32	S0, S1, S0
BL	_sqrt+0
MOVW	R0, #lo_addr(_modFactor+0)
MOVT	R0, #hi_addr(_modFactor+0)
VSTR	#1, S0, [R0, #0]
;parameter_lateral.h,285 :: 		ti[1] = -60 * sqrt(modFactor);
VMOV.F32	S0, S0
BL	_sqrt+0
MOVW	R0, #0
MOVT	R0, #49776
VMOV	S1, R0
VMUL.F32	S0, S1, S0
MOVW	R0, #lo_addr(_ti+4)
MOVT	R0, #hi_addr(_ti+4)
VSTR	#1, S0, [R0, #0]
;parameter_lateral.h,286 :: 		ai[1] = 0.8 * 18;
MOVW	R0, #26215
MOVT	R0, #16742
VMOV	S0, R0
MOVW	R0, #lo_addr(_ai+4)
MOVT	R0, #hi_addr(_ai+4)
VSTR	#1, S0, [R0, #0]
;parameter_lateral.h,287 :: 		bi[1] = 0.2 * modFactor;
MOVW	R1, #lo_addr(_modFactor+0)
MOVT	R1, #hi_addr(_modFactor+0)
VLDR	#1, S1, [R1, #0]
MOVW	R0, #52429
MOVT	R0, #15948
VMOV	S0, R0
VMUL.F32	S0, S0, S1
MOVW	R0, #lo_addr(_bi+4)
MOVT	R0, #hi_addr(_bi+4)
VSTR	#1, S0, [R0, #0]
;parameter_lateral.h,288 :: 		ti[2] = -15 * modFactor;
MOV	R0, R1
VLDR	#1, S1, [R0, #0]
VMOV.F32	S0, #-15
VMUL.F32	S0, S0, S1
MOVW	R0, #lo_addr(_ti+8)
MOVT	R0, #hi_addr(_ti+8)
VSTR	#1, S0, [R0, #0]
;parameter_lateral.h,289 :: 		ai[2] = 0.5 * 18;
VMOV.F32	S0, #9
MOVW	R0, #lo_addr(_ai+8)
MOVT	R0, #hi_addr(_ai+8)
VSTR	#1, S0, [R0, #0]
;parameter_lateral.h,290 :: 		bi[2] = 0.1 * modFactor;
MOV	R0, R1
VLDR	#1, S1, [R0, #0]
MOVW	R0, #52429
MOVT	R0, #15820
VMOV	S0, R0
VMUL.F32	S0, S0, S1
MOVW	R0, #lo_addr(_bi+8)
MOVT	R0, #hi_addr(_bi+8)
VSTR	#1, S0, [R0, #0]
;parameter_lateral.h,291 :: 		ti[3] = 0;
MOV	R0, #0
VMOV	S0, R0
MOVW	R0, #lo_addr(_ti+12)
MOVT	R0, #hi_addr(_ti+12)
VSTR	#1, S0, [R0, #0]
;parameter_lateral.h,292 :: 		ai[3] = 45 * 18;
MOVW	R0, #32768
MOVT	R0, #17482
VMOV	S0, R0
MOVW	R0, #lo_addr(_ai+12)
MOVT	R0, #hi_addr(_ai+12)
VSTR	#1, S0, [R0, #0]
;parameter_lateral.h,293 :: 		bi[3] = 0.1 * modFactor;
MOV	R0, R1
VLDR	#1, S1, [R0, #0]
MOVW	R0, #52429
MOVT	R0, #15820
VMOV	S0, R0
VMUL.F32	S0, S0, S1
MOVW	R0, #lo_addr(_bi+12)
MOVT	R0, #hi_addr(_bi+12)
VSTR	#1, S0, [R0, #0]
;parameter_lateral.h,294 :: 		ti[4] = 15 * modFactor;
MOV	R0, R1
VLDR	#1, S1, [R0, #0]
VMOV.F32	S0, #15
VMUL.F32	S0, S0, S1
MOVW	R0, #lo_addr(_ti+16)
MOVT	R0, #hi_addr(_ti+16)
VSTR	#1, S0, [R0, #0]
;parameter_lateral.h,295 :: 		ai[4] = -17 * 18;
MOVW	R0, #0
MOVT	R0, #50073
VMOV	S0, R0
MOVW	R0, #lo_addr(_ai+16)
MOVT	R0, #hi_addr(_ai+16)
VSTR	#1, S0, [R0, #0]
;parameter_lateral.h,296 :: 		bi[4] = 0.1 * modFactor;
MOV	R0, R1
VLDR	#1, S1, [R0, #0]
MOVW	R0, #52429
MOVT	R0, #15820
VMOV	S0, R0
VMUL.F32	S0, S0, S1
MOVW	R0, #lo_addr(_bi+16)
MOVT	R0, #hi_addr(_bi+16)
VSTR	#1, S0, [R0, #0]
;parameter_lateral.h,297 :: 		ti[5] = 97 * sqrt(modFactor);
MOV	R0, R1
VLDR	#1, S0, [R0, #0]
BL	_sqrt+0
MOVW	R0, #0
MOVT	R0, #17090
VMOV	S1, R0
VMUL.F32	S0, S1, S0
MOVW	R0, #lo_addr(_ti+20)
MOVT	R0, #hi_addr(_ti+20)
VSTR	#1, S0, [R0, #0]
;parameter_lateral.h,298 :: 		ai[5] = 1 * ((modFactor * modFactor)*sqrt(modFactor)) * 18;
MOVW	R1, #lo_addr(_modFactor+0)
MOVT	R1, #hi_addr(_modFactor+0)
VLDR	#1, S1, [R1, #0]
MOV	R0, R1
VLDR	#1, S0, [R0, #0]
VMUL.F32	S0, S0, S1
VSTR	#1, S0, [SP, #4]
MOV	R0, R1
VLDR	#1, S0, [R0, #0]
BL	_sqrt+0
VLDR	#1, S1, [SP, #4]
VMUL.F32	S1, S1, S0
VMOV.F32	S0, #18
VMUL.F32	S0, S1, S0
MOVW	R0, #lo_addr(_ai+20)
MOVT	R0, #hi_addr(_ai+20)
VSTR	#1, S0, [R0, #0]
;parameter_lateral.h,299 :: 		bi[5] = 0.4 / modFactor;
MOVW	R1, #lo_addr(_modFactor+0)
MOVT	R1, #hi_addr(_modFactor+0)
VLDR	#1, S1, [R1, #0]
MOVW	R0, #52429
MOVT	R0, #16076
VMOV	S0, R0
VDIV.F32	S0, S0, S1
MOVW	R0, #lo_addr(_bi+20)
MOVT	R0, #hi_addr(_bi+20)
VSTR	#1, S0, [R0, #0]
;parameter_lateral.h,300 :: 		ti[6] = 100 * sqrt(modFactor);
MOV	R0, R1
VLDR	#1, S0, [R0, #0]
BL	_sqrt+0
MOVW	R0, #0
MOVT	R0, #17096
VMOV	S1, R0
VMUL.F32	S0, S1, S0
MOVW	R0, #lo_addr(_ti+24)
MOVT	R0, #hi_addr(_ti+24)
VSTR	#1, S0, [R0, #0]
;parameter_lateral.h,301 :: 		ai[6] = 2 *((modFactor * modFactor)*sqrt(modFactor)) * 18;
MOVW	R1, #lo_addr(_modFactor+0)
MOVT	R1, #hi_addr(_modFactor+0)
VLDR	#1, S1, [R1, #0]
MOV	R0, R1
VLDR	#1, S0, [R0, #0]
VMUL.F32	S0, S0, S1
VSTR	#1, S0, [SP, #4]
MOV	R0, R1
VLDR	#1, S0, [R0, #0]
BL	_sqrt+0
VLDR	#1, S1, [SP, #4]
VMUL.F32	S1, S1, S0
VMOV.F32	S0, #2
VMUL.F32	S1, S0, S1
VMOV.F32	S0, #18
VMUL.F32	S0, S1, S0
MOVW	R0, #lo_addr(_ai+24)
MOVT	R0, #hi_addr(_ai+24)
VSTR	#1, S0, [R0, #0]
;parameter_lateral.h,302 :: 		bi[6] = 0.2 * modFactor;
MOVW	R0, #lo_addr(_modFactor+0)
MOVT	R0, #hi_addr(_modFactor+0)
VLDR	#1, S1, [R0, #0]
MOVW	R0, #52429
MOVT	R0, #15948
VMOV	S0, R0
VMUL.F32	S0, S0, S1
MOVW	R0, #lo_addr(_bi+24)
MOVT	R0, #hi_addr(_bi+24)
VSTR	#1, S0, [R0, #0]
;parameter_lateral.h,305 :: 		for (i = 1; i <= 6; i++)
; i start address is: 12 (R3)
MOVS	R3, #1
SXTH	R3, R3
; i end address is: 12 (R3)
L_lateralV4156:
; i start address is: 12 (R3)
CMP	R3, #6
IT	GT
BGT	L_lateralV4157
;parameter_lateral.h,307 :: 		ti[i] = ti[i] * (pi / 180.0); // konversi ke radian
LSLS	R1, R3, #2
MOVW	R0, #lo_addr(_ti+0)
MOVT	R0, #hi_addr(_ti+0)
ADDS	R2, R0, R1
VLDR	#1, S1, [R2, #0]
MOVW	R0, #64053
MOVT	R0, #15502
VMOV	S0, R0
VMUL.F32	S0, S1, S0
VSTR	#1, S0, [R2, #0]
;parameter_lateral.h,305 :: 		for (i = 1; i <= 6; i++)
ADDS	R3, R3, #1
SXTH	R3, R3
;parameter_lateral.h,308 :: 		}
; i end address is: 12 (R3)
IT	AL
BAL	L_lateralV4156
L_lateralV4157:
;parameter_lateral.h,309 :: 		}
L_end_lateralV4:
LDR	LR, [SP, #0]
ADD	SP, SP, #8
BX	LR
; end of _lateralV4
_lateralV5:
;parameter_lateral.h,312 :: 		void lateralV5()
SUB	SP, SP, #8
STR	LR, [SP, #0]
;parameter_lateral.h,315 :: 		modFactor = sqrt((float)hmean / 60.0);
MOVW	R0, #lo_addr(_hmean+0)
MOVT	R0, #hi_addr(_hmean+0)
VLDR	#1, S1, [R0, #0]
MOVW	R0, #0
MOVT	R0, #17008
VMOV	S0, R0
VDIV.F32	S0, S1, S0
BL	_sqrt+0
MOVW	R0, #lo_addr(_modFactor+0)
MOVT	R0, #hi_addr(_modFactor+0)
VSTR	#1, S0, [R0, #0]
;parameter_lateral.h,317 :: 		ti[1] = -60 * sqrt(modFactor);
VMOV.F32	S0, S0
BL	_sqrt+0
MOVW	R0, #0
MOVT	R0, #49776
VMOV	S1, R0
VMUL.F32	S0, S1, S0
MOVW	R0, #lo_addr(_ti+4)
MOVT	R0, #hi_addr(_ti+4)
VSTR	#1, S0, [R0, #0]
;parameter_lateral.h,318 :: 		ai[1] = 0.8 * 18;
MOVW	R0, #26215
MOVT	R0, #16742
VMOV	S0, R0
MOVW	R0, #lo_addr(_ai+4)
MOVT	R0, #hi_addr(_ai+4)
VSTR	#1, S0, [R0, #0]
;parameter_lateral.h,319 :: 		bi[1] = 0.2 * modFactor;
MOVW	R1, #lo_addr(_modFactor+0)
MOVT	R1, #hi_addr(_modFactor+0)
VLDR	#1, S1, [R1, #0]
MOVW	R0, #52429
MOVT	R0, #15948
VMOV	S0, R0
VMUL.F32	S0, S0, S1
MOVW	R0, #lo_addr(_bi+4)
MOVT	R0, #hi_addr(_bi+4)
VSTR	#1, S0, [R0, #0]
;parameter_lateral.h,320 :: 		ti[2] = -15 * modFactor;
MOV	R0, R1
VLDR	#1, S1, [R0, #0]
VMOV.F32	S0, #-15
VMUL.F32	S0, S0, S1
MOVW	R0, #lo_addr(_ti+8)
MOVT	R0, #hi_addr(_ti+8)
VSTR	#1, S0, [R0, #0]
;parameter_lateral.h,321 :: 		ai[2] = -5 * 18;
MOVW	R0, #0
MOVT	R0, #49844
VMOV	S0, R0
MOVW	R0, #lo_addr(_ai+8)
MOVT	R0, #hi_addr(_ai+8)
VSTR	#1, S0, [R0, #0]
;parameter_lateral.h,322 :: 		bi[2] = 0.1 * modFactor;
MOV	R0, R1
VLDR	#1, S1, [R0, #0]
MOVW	R0, #52429
MOVT	R0, #15820
VMOV	S0, R0
VMUL.F32	S0, S0, S1
MOVW	R0, #lo_addr(_bi+8)
MOVT	R0, #hi_addr(_bi+8)
VSTR	#1, S0, [R0, #0]
;parameter_lateral.h,323 :: 		ti[3] = 0;
MOV	R0, #0
VMOV	S0, R0
MOVW	R0, #lo_addr(_ti+12)
MOVT	R0, #hi_addr(_ti+12)
VSTR	#1, S0, [R0, #0]
;parameter_lateral.h,324 :: 		ai[3] = 48.75 * 18;
MOVW	R0, #24576
MOVT	R0, #17499
VMOV	S0, R0
MOVW	R0, #lo_addr(_ai+12)
MOVT	R0, #hi_addr(_ai+12)
VSTR	#1, S0, [R0, #0]
;parameter_lateral.h,325 :: 		bi[3] = 0.1 * modFactor;
MOV	R0, R1
VLDR	#1, S1, [R0, #0]
MOVW	R0, #52429
MOVT	R0, #15820
VMOV	S0, R0
VMUL.F32	S0, S0, S1
MOVW	R0, #lo_addr(_bi+12)
MOVT	R0, #hi_addr(_bi+12)
VSTR	#1, S0, [R0, #0]
;parameter_lateral.h,326 :: 		ti[4] = 15 * modFactor;
MOV	R0, R1
VLDR	#1, S1, [R0, #0]
VMOV.F32	S0, #15
VMUL.F32	S0, S0, S1
MOVW	R0, #lo_addr(_ti+16)
MOVT	R0, #hi_addr(_ti+16)
VSTR	#1, S0, [R0, #0]
;parameter_lateral.h,327 :: 		ai[4] = -7.5 * 18;
MOVW	R0, #0
MOVT	R0, #49927
VMOV	S0, R0
MOVW	R0, #lo_addr(_ai+16)
MOVT	R0, #hi_addr(_ai+16)
VSTR	#1, S0, [R0, #0]
;parameter_lateral.h,328 :: 		bi[4] = 0.12 * modFactor;
MOV	R0, R1
VLDR	#1, S1, [R0, #0]
MOVW	R0, #49807
MOVT	R0, #15861
VMOV	S0, R0
VMUL.F32	S0, S0, S1
MOVW	R0, #lo_addr(_bi+16)
MOVT	R0, #hi_addr(_bi+16)
VSTR	#1, S0, [R0, #0]
;parameter_lateral.h,329 :: 		ti[5] = 87 * sqrt(modFactor);
MOV	R0, R1
VLDR	#1, S0, [R0, #0]
BL	_sqrt+0
MOVW	R0, #0
MOVT	R0, #17070
VMOV	S1, R0
VMUL.F32	S0, S1, S0
MOVW	R0, #lo_addr(_ti+20)
MOVT	R0, #hi_addr(_ti+20)
VSTR	#1, S0, [R0, #0]
;parameter_lateral.h,330 :: 		ai[5] = 1.34 * ((modFactor * modFactor)*sqrt(modFactor)) * 18;
MOVW	R1, #lo_addr(_modFactor+0)
MOVT	R1, #hi_addr(_modFactor+0)
VLDR	#1, S1, [R1, #0]
MOV	R0, R1
VLDR	#1, S0, [R0, #0]
VMUL.F32	S0, S0, S1
VSTR	#1, S0, [SP, #4]
MOV	R0, R1
VLDR	#1, S0, [R0, #0]
BL	_sqrt+0
VLDR	#1, S1, [SP, #4]
VMUL.F32	S1, S1, S0
MOVW	R0, #34079
MOVT	R0, #16299
VMOV	S0, R0
VMUL.F32	S1, S0, S1
VMOV.F32	S0, #18
VMUL.F32	S0, S1, S0
MOVW	R0, #lo_addr(_ai+20)
MOVT	R0, #hi_addr(_ai+20)
VSTR	#1, S0, [R0, #0]
;parameter_lateral.h,331 :: 		bi[5] = 0.45 / modFactor;
MOVW	R1, #lo_addr(_modFactor+0)
MOVT	R1, #hi_addr(_modFactor+0)
VLDR	#1, S1, [R1, #0]
MOVW	R0, #26214
MOVT	R0, #16102
VMOV	S0, R0
VDIV.F32	S0, S0, S1
MOVW	R0, #lo_addr(_bi+20)
MOVT	R0, #hi_addr(_bi+20)
VSTR	#1, S0, [R0, #0]
;parameter_lateral.h,332 :: 		ti[6] = 90 * sqrt(modFactor);
MOV	R0, R1
VLDR	#1, S0, [R0, #0]
BL	_sqrt+0
MOVW	R0, #0
MOVT	R0, #17076
VMOV	S1, R0
VMUL.F32	S0, S1, S0
MOVW	R0, #lo_addr(_ti+24)
MOVT	R0, #hi_addr(_ti+24)
VSTR	#1, S0, [R0, #0]
;parameter_lateral.h,333 :: 		ai[6] = 2 *((modFactor * modFactor)*sqrt(modFactor)) * 18;
MOVW	R1, #lo_addr(_modFactor+0)
MOVT	R1, #hi_addr(_modFactor+0)
VLDR	#1, S1, [R1, #0]
MOV	R0, R1
VLDR	#1, S0, [R0, #0]
VMUL.F32	S0, S0, S1
VSTR	#1, S0, [SP, #4]
MOV	R0, R1
VLDR	#1, S0, [R0, #0]
BL	_sqrt+0
VLDR	#1, S1, [SP, #4]
VMUL.F32	S1, S1, S0
VMOV.F32	S0, #2
VMUL.F32	S1, S0, S1
VMOV.F32	S0, #18
VMUL.F32	S0, S1, S0
MOVW	R0, #lo_addr(_ai+24)
MOVT	R0, #hi_addr(_ai+24)
VSTR	#1, S0, [R0, #0]
;parameter_lateral.h,334 :: 		bi[6] = 0.25 * modFactor;
MOVW	R0, #lo_addr(_modFactor+0)
MOVT	R0, #hi_addr(_modFactor+0)
VLDR	#1, S1, [R0, #0]
VMOV.F32	S0, #0.25
VMUL.F32	S0, S0, S1
MOVW	R0, #lo_addr(_bi+24)
MOVT	R0, #hi_addr(_bi+24)
VSTR	#1, S0, [R0, #0]
;parameter_lateral.h,337 :: 		for (i = 1; i <= 6; i++)
; i start address is: 12 (R3)
MOVS	R3, #1
SXTH	R3, R3
; i end address is: 12 (R3)
L_lateralV5159:
; i start address is: 12 (R3)
CMP	R3, #6
IT	GT
BGT	L_lateralV5160
;parameter_lateral.h,339 :: 		ti[i] = ti[i] * (pi / 180.0); // konversi ke radian
LSLS	R1, R3, #2
MOVW	R0, #lo_addr(_ti+0)
MOVT	R0, #hi_addr(_ti+0)
ADDS	R2, R0, R1
VLDR	#1, S1, [R2, #0]
MOVW	R0, #64053
MOVT	R0, #15502
VMOV	S0, R0
VMUL.F32	S0, S1, S0
VSTR	#1, S0, [R2, #0]
;parameter_lateral.h,337 :: 		for (i = 1; i <= 6; i++)
ADDS	R3, R3, #1
SXTH	R3, R3
;parameter_lateral.h,340 :: 		}
; i end address is: 12 (R3)
IT	AL
BAL	L_lateralV5159
L_lateralV5160:
;parameter_lateral.h,341 :: 		}
L_end_lateralV5:
LDR	LR, [SP, #0]
ADD	SP, SP, #8
BX	LR
; end of _lateralV5
_lateralV6:
;parameter_lateral.h,343 :: 		void lateralV6()
SUB	SP, SP, #8
STR	LR, [SP, #0]
;parameter_lateral.h,346 :: 		modFactor = sqrt((float)hmean / 60.0);
MOVW	R0, #lo_addr(_hmean+0)
MOVT	R0, #hi_addr(_hmean+0)
VLDR	#1, S1, [R0, #0]
MOVW	R0, #0
MOVT	R0, #17008
VMOV	S0, R0
VDIV.F32	S0, S1, S0
BL	_sqrt+0
MOVW	R0, #lo_addr(_modFactor+0)
MOVT	R0, #hi_addr(_modFactor+0)
VSTR	#1, S0, [R0, #0]
;parameter_lateral.h,348 :: 		ti[1] = -60 * sqrt(modFactor);
VMOV.F32	S0, S0
BL	_sqrt+0
MOVW	R0, #0
MOVT	R0, #49776
VMOV	S1, R0
VMUL.F32	S0, S1, S0
MOVW	R0, #lo_addr(_ti+4)
MOVT	R0, #hi_addr(_ti+4)
VSTR	#1, S0, [R0, #0]
;parameter_lateral.h,349 :: 		ai[1] = 0.8 * 18;
MOVW	R0, #26215
MOVT	R0, #16742
VMOV	S0, R0
MOVW	R0, #lo_addr(_ai+4)
MOVT	R0, #hi_addr(_ai+4)
VSTR	#1, S0, [R0, #0]
;parameter_lateral.h,350 :: 		bi[1] = 0.2 * modFactor;
MOVW	R1, #lo_addr(_modFactor+0)
MOVT	R1, #hi_addr(_modFactor+0)
VLDR	#1, S1, [R1, #0]
MOVW	R0, #52429
MOVT	R0, #15948
VMOV	S0, R0
VMUL.F32	S0, S0, S1
MOVW	R0, #lo_addr(_bi+4)
MOVT	R0, #hi_addr(_bi+4)
VSTR	#1, S0, [R0, #0]
;parameter_lateral.h,351 :: 		ti[2] = -15 * modFactor;
MOV	R0, R1
VLDR	#1, S1, [R0, #0]
VMOV.F32	S0, #-15
VMUL.F32	S0, S0, S1
MOVW	R0, #lo_addr(_ti+8)
MOVT	R0, #hi_addr(_ti+8)
VSTR	#1, S0, [R0, #0]
;parameter_lateral.h,352 :: 		ai[2] = -5 * 18;
MOVW	R0, #0
MOVT	R0, #49844
VMOV	S0, R0
MOVW	R0, #lo_addr(_ai+8)
MOVT	R0, #hi_addr(_ai+8)
VSTR	#1, S0, [R0, #0]
;parameter_lateral.h,353 :: 		bi[2] = 0.1 * modFactor;
MOV	R0, R1
VLDR	#1, S1, [R0, #0]
MOVW	R0, #52429
MOVT	R0, #15820
VMOV	S0, R0
VMUL.F32	S0, S0, S1
MOVW	R0, #lo_addr(_bi+8)
MOVT	R0, #hi_addr(_bi+8)
VSTR	#1, S0, [R0, #0]
;parameter_lateral.h,354 :: 		ti[3] = 0;
MOV	R0, #0
VMOV	S0, R0
MOVW	R0, #lo_addr(_ti+12)
MOVT	R0, #hi_addr(_ti+12)
VSTR	#1, S0, [R0, #0]
;parameter_lateral.h,355 :: 		ai[3] = 45 * 18;
MOVW	R0, #32768
MOVT	R0, #17482
VMOV	S0, R0
MOVW	R0, #lo_addr(_ai+12)
MOVT	R0, #hi_addr(_ai+12)
VSTR	#1, S0, [R0, #0]
;parameter_lateral.h,356 :: 		bi[3] = 0.1 * modFactor;
MOV	R0, R1
VLDR	#1, S1, [R0, #0]
MOVW	R0, #52429
MOVT	R0, #15820
VMOV	S0, R0
VMUL.F32	S0, S0, S1
MOVW	R0, #lo_addr(_bi+12)
MOVT	R0, #hi_addr(_bi+12)
VSTR	#1, S0, [R0, #0]
;parameter_lateral.h,357 :: 		ti[4] = 15 * modFactor;
MOV	R0, R1
VLDR	#1, S1, [R0, #0]
VMOV.F32	S0, #15
VMUL.F32	S0, S0, S1
MOVW	R0, #lo_addr(_ti+16)
MOVT	R0, #hi_addr(_ti+16)
VSTR	#1, S0, [R0, #0]
;parameter_lateral.h,358 :: 		ai[4] = 1 * 18;
VMOV.F32	S0, #18
MOVW	R0, #lo_addr(_ai+16)
MOVT	R0, #hi_addr(_ai+16)
VSTR	#1, S0, [R0, #0]
;parameter_lateral.h,359 :: 		bi[4] = 0.2 * modFactor;
MOV	R0, R1
VLDR	#1, S1, [R0, #0]
MOVW	R0, #52429
MOVT	R0, #15948
VMOV	S0, R0
VMUL.F32	S0, S0, S1
MOVW	R0, #lo_addr(_bi+16)
MOVT	R0, #hi_addr(_bi+16)
VSTR	#1, S0, [R0, #0]
;parameter_lateral.h,360 :: 		ti[5] = 77 * sqrt(modFactor);
MOV	R0, R1
VLDR	#1, S0, [R0, #0]
BL	_sqrt+0
MOVW	R0, #0
MOVT	R0, #17050
VMOV	S1, R0
VMUL.F32	S0, S1, S0
MOVW	R0, #lo_addr(_ti+20)
MOVT	R0, #hi_addr(_ti+20)
VSTR	#1, S0, [R0, #0]
;parameter_lateral.h,361 :: 		ai[5] = 1.8 * ((modFactor * modFactor)*sqrt(modFactor)) * 18;
MOVW	R1, #lo_addr(_modFactor+0)
MOVT	R1, #hi_addr(_modFactor+0)
VLDR	#1, S1, [R1, #0]
MOV	R0, R1
VLDR	#1, S0, [R0, #0]
VMUL.F32	S0, S0, S1
VSTR	#1, S0, [SP, #4]
MOV	R0, R1
VLDR	#1, S0, [R0, #0]
BL	_sqrt+0
VLDR	#1, S1, [SP, #4]
VMUL.F32	S1, S1, S0
MOVW	R0, #26214
MOVT	R0, #16358
VMOV	S0, R0
VMUL.F32	S1, S0, S1
VMOV.F32	S0, #18
VMUL.F32	S0, S1, S0
MOVW	R0, #lo_addr(_ai+20)
MOVT	R0, #hi_addr(_ai+20)
VSTR	#1, S0, [R0, #0]
;parameter_lateral.h,362 :: 		bi[5] = 0.4 / modFactor;
MOVW	R1, #lo_addr(_modFactor+0)
MOVT	R1, #hi_addr(_modFactor+0)
VLDR	#1, S1, [R1, #0]
MOVW	R0, #52429
MOVT	R0, #16076
VMOV	S0, R0
VDIV.F32	S0, S0, S1
MOVW	R0, #lo_addr(_bi+20)
MOVT	R0, #hi_addr(_bi+20)
VSTR	#1, S0, [R0, #0]
;parameter_lateral.h,363 :: 		ti[6] = 80 * sqrt(modFactor);
MOV	R0, R1
VLDR	#1, S0, [R0, #0]
BL	_sqrt+0
MOVW	R0, #0
MOVT	R0, #17056
VMOV	S1, R0
VMUL.F32	S0, S1, S0
MOVW	R0, #lo_addr(_ti+24)
MOVT	R0, #hi_addr(_ti+24)
VSTR	#1, S0, [R0, #0]
;parameter_lateral.h,364 :: 		ai[6] = 2 *((modFactor * modFactor)*sqrt(modFactor)) * 18;
MOVW	R1, #lo_addr(_modFactor+0)
MOVT	R1, #hi_addr(_modFactor+0)
VLDR	#1, S1, [R1, #0]
MOV	R0, R1
VLDR	#1, S0, [R0, #0]
VMUL.F32	S0, S0, S1
VSTR	#1, S0, [SP, #4]
MOV	R0, R1
VLDR	#1, S0, [R0, #0]
BL	_sqrt+0
VLDR	#1, S1, [SP, #4]
VMUL.F32	S1, S1, S0
VMOV.F32	S0, #2
VMUL.F32	S1, S0, S1
VMOV.F32	S0, #18
VMUL.F32	S0, S1, S0
MOVW	R0, #lo_addr(_ai+24)
MOVT	R0, #hi_addr(_ai+24)
VSTR	#1, S0, [R0, #0]
;parameter_lateral.h,365 :: 		bi[6] = 0.2 * modFactor;
MOVW	R0, #lo_addr(_modFactor+0)
MOVT	R0, #hi_addr(_modFactor+0)
VLDR	#1, S1, [R0, #0]
MOVW	R0, #52429
MOVT	R0, #15948
VMOV	S0, R0
VMUL.F32	S0, S0, S1
MOVW	R0, #lo_addr(_bi+24)
MOVT	R0, #hi_addr(_bi+24)
VSTR	#1, S0, [R0, #0]
;parameter_lateral.h,368 :: 		for (i = 1; i <= 6; i++)
; i start address is: 12 (R3)
MOVS	R3, #1
SXTH	R3, R3
; i end address is: 12 (R3)
L_lateralV6162:
; i start address is: 12 (R3)
CMP	R3, #6
IT	GT
BGT	L_lateralV6163
;parameter_lateral.h,370 :: 		ti[i] = ti[i] * (pi / 180.0); // konversi ke radian
LSLS	R1, R3, #2
MOVW	R0, #lo_addr(_ti+0)
MOVT	R0, #hi_addr(_ti+0)
ADDS	R2, R0, R1
VLDR	#1, S1, [R2, #0]
MOVW	R0, #64053
MOVT	R0, #15502
VMOV	S0, R0
VMUL.F32	S0, S1, S0
VSTR	#1, S0, [R2, #0]
;parameter_lateral.h,368 :: 		for (i = 1; i <= 6; i++)
ADDS	R3, R3, #1
SXTH	R3, R3
;parameter_lateral.h,371 :: 		}
; i end address is: 12 (R3)
IT	AL
BAL	L_lateralV6162
L_lateralV6163:
;parameter_lateral.h,372 :: 		}
L_end_lateralV6:
LDR	LR, [SP, #0]
ADD	SP, SP, #8
BX	LR
; end of _lateralV6
_septal1:
;parameter_septal.h,1 :: 		void septal1()
SUB	SP, SP, #8
STR	LR, [SP, #0]
;parameter_septal.h,4 :: 		modFactor = sqrt((float)hmean / 60.0);
MOVW	R0, #lo_addr(_hmean+0)
MOVT	R0, #hi_addr(_hmean+0)
VLDR	#1, S1, [R0, #0]
MOVW	R0, #0
MOVT	R0, #17008
VMOV	S0, R0
VDIV.F32	S0, S1, S0
BL	_sqrt+0
MOVW	R0, #lo_addr(_modFactor+0)
MOVT	R0, #hi_addr(_modFactor+0)
VSTR	#1, S0, [R0, #0]
;parameter_septal.h,6 :: 		ti[1] = -60 * sqrt(modFactor);
VMOV.F32	S0, S0
BL	_sqrt+0
MOVW	R0, #0
MOVT	R0, #49776
VMOV	S1, R0
VMUL.F32	S0, S1, S0
MOVW	R0, #lo_addr(_ti+4)
MOVT	R0, #hi_addr(_ti+4)
VSTR	#1, S0, [R0, #0]
;parameter_septal.h,7 :: 		ai[1] = 0.8 * 18;
MOVW	R0, #26215
MOVT	R0, #16742
VMOV	S0, R0
MOVW	R0, #lo_addr(_ai+4)
MOVT	R0, #hi_addr(_ai+4)
VSTR	#1, S0, [R0, #0]
;parameter_septal.h,8 :: 		bi[1] = 0.2 * modFactor;
MOVW	R1, #lo_addr(_modFactor+0)
MOVT	R1, #hi_addr(_modFactor+0)
VLDR	#1, S1, [R1, #0]
MOVW	R0, #52429
MOVT	R0, #15948
VMOV	S0, R0
VMUL.F32	S0, S0, S1
MOVW	R0, #lo_addr(_bi+4)
MOVT	R0, #hi_addr(_bi+4)
VSTR	#1, S0, [R0, #0]
;parameter_septal.h,9 :: 		ti[2] = -15 * modFactor;
MOV	R0, R1
VLDR	#1, S1, [R0, #0]
VMOV.F32	S0, #-15
VMUL.F32	S0, S0, S1
MOVW	R0, #lo_addr(_ti+8)
MOVT	R0, #hi_addr(_ti+8)
VSTR	#1, S0, [R0, #0]
;parameter_septal.h,10 :: 		ai[2] = 0.5 * 18;
VMOV.F32	S0, #9
MOVW	R0, #lo_addr(_ai+8)
MOVT	R0, #hi_addr(_ai+8)
VSTR	#1, S0, [R0, #0]
;parameter_septal.h,11 :: 		bi[2] = 0.1 * modFactor;
MOV	R0, R1
VLDR	#1, S1, [R0, #0]
MOVW	R0, #52429
MOVT	R0, #15820
VMOV	S0, R0
VMUL.F32	S0, S0, S1
MOVW	R0, #lo_addr(_bi+8)
MOVT	R0, #hi_addr(_bi+8)
VSTR	#1, S0, [R0, #0]
;parameter_septal.h,12 :: 		ti[3] = 0;
MOV	R0, #0
VMOV	S0, R0
MOVW	R0, #lo_addr(_ti+12)
MOVT	R0, #hi_addr(_ti+12)
VSTR	#1, S0, [R0, #0]
;parameter_septal.h,13 :: 		ai[3] = 30 * 18;
MOVW	R0, #0
MOVT	R0, #17415
VMOV	S0, R0
MOVW	R0, #lo_addr(_ai+12)
MOVT	R0, #hi_addr(_ai+12)
VSTR	#1, S0, [R0, #0]
;parameter_septal.h,14 :: 		bi[3] = 0.1 * modFactor;
MOV	R0, R1
VLDR	#1, S1, [R0, #0]
MOVW	R0, #52429
MOVT	R0, #15820
VMOV	S0, R0
VMUL.F32	S0, S0, S1
MOVW	R0, #lo_addr(_bi+12)
MOVT	R0, #hi_addr(_bi+12)
VSTR	#1, S0, [R0, #0]
;parameter_septal.h,15 :: 		ti[4] = 15 * modFactor;
MOV	R0, R1
VLDR	#1, S1, [R0, #0]
VMOV.F32	S0, #15
VMUL.F32	S0, S0, S1
MOVW	R0, #lo_addr(_ti+16)
MOVT	R0, #hi_addr(_ti+16)
VSTR	#1, S0, [R0, #0]
;parameter_septal.h,16 :: 		ai[4] = -7.5 * 18;
MOVW	R0, #0
MOVT	R0, #49927
VMOV	S0, R0
MOVW	R0, #lo_addr(_ai+16)
MOVT	R0, #hi_addr(_ai+16)
VSTR	#1, S0, [R0, #0]
;parameter_septal.h,17 :: 		bi[4] = 0.1 * modFactor;
MOV	R0, R1
VLDR	#1, S1, [R0, #0]
MOVW	R0, #52429
MOVT	R0, #15820
VMOV	S0, R0
VMUL.F32	S0, S0, S1
MOVW	R0, #lo_addr(_bi+16)
MOVT	R0, #hi_addr(_bi+16)
VSTR	#1, S0, [R0, #0]
;parameter_septal.h,18 :: 		ti[5] = 97 * sqrt(modFactor);
MOV	R0, R1
VLDR	#1, S0, [R0, #0]
BL	_sqrt+0
MOVW	R0, #0
MOVT	R0, #17090
VMOV	S1, R0
VMUL.F32	S0, S1, S0
MOVW	R0, #lo_addr(_ti+20)
MOVT	R0, #hi_addr(_ti+20)
VSTR	#1, S0, [R0, #0]
;parameter_septal.h,19 :: 		ai[5] = 0.5 * ((modFactor * modFactor)*sqrt(modFactor)) * 18;
MOVW	R1, #lo_addr(_modFactor+0)
MOVT	R1, #hi_addr(_modFactor+0)
VLDR	#1, S1, [R1, #0]
MOV	R0, R1
VLDR	#1, S0, [R0, #0]
VMUL.F32	S0, S0, S1
VSTR	#1, S0, [SP, #4]
MOV	R0, R1
VLDR	#1, S0, [R0, #0]
BL	_sqrt+0
VLDR	#1, S1, [SP, #4]
VMUL.F32	S1, S1, S0
VMOV.F32	S0, #0.5
VMUL.F32	S1, S0, S1
VMOV.F32	S0, #18
VMUL.F32	S0, S1, S0
MOVW	R0, #lo_addr(_ai+20)
MOVT	R0, #hi_addr(_ai+20)
VSTR	#1, S0, [R0, #0]
;parameter_septal.h,20 :: 		bi[5] = 0.4 / modFactor;
MOVW	R1, #lo_addr(_modFactor+0)
MOVT	R1, #hi_addr(_modFactor+0)
VLDR	#1, S1, [R1, #0]
MOVW	R0, #52429
MOVT	R0, #16076
VMOV	S0, R0
VDIV.F32	S0, S0, S1
MOVW	R0, #lo_addr(_bi+20)
MOVT	R0, #hi_addr(_bi+20)
VSTR	#1, S0, [R0, #0]
;parameter_septal.h,21 :: 		ti[6] = 100 * sqrt(modFactor);
MOV	R0, R1
VLDR	#1, S0, [R0, #0]
BL	_sqrt+0
MOVW	R0, #0
MOVT	R0, #17096
VMOV	S1, R0
VMUL.F32	S0, S1, S0
MOVW	R0, #lo_addr(_ti+24)
MOVT	R0, #hi_addr(_ti+24)
VSTR	#1, S0, [R0, #0]
;parameter_septal.h,22 :: 		ai[6] = 0.75 *((modFactor * modFactor)*sqrt(modFactor)) * 18;
MOVW	R1, #lo_addr(_modFactor+0)
MOVT	R1, #hi_addr(_modFactor+0)
VLDR	#1, S1, [R1, #0]
MOV	R0, R1
VLDR	#1, S0, [R0, #0]
VMUL.F32	S0, S0, S1
VSTR	#1, S0, [SP, #4]
MOV	R0, R1
VLDR	#1, S0, [R0, #0]
BL	_sqrt+0
VLDR	#1, S1, [SP, #4]
VMUL.F32	S1, S1, S0
VMOV.F32	S0, #0.75
VMUL.F32	S1, S0, S1
VMOV.F32	S0, #18
VMUL.F32	S0, S1, S0
MOVW	R0, #lo_addr(_ai+24)
MOVT	R0, #hi_addr(_ai+24)
VSTR	#1, S0, [R0, #0]
;parameter_septal.h,23 :: 		bi[6] = 0.2 * modFactor;
MOVW	R0, #lo_addr(_modFactor+0)
MOVT	R0, #hi_addr(_modFactor+0)
VLDR	#1, S1, [R0, #0]
MOVW	R0, #52429
MOVT	R0, #15948
VMOV	S0, R0
VMUL.F32	S0, S0, S1
MOVW	R0, #lo_addr(_bi+24)
MOVT	R0, #hi_addr(_bi+24)
VSTR	#1, S0, [R0, #0]
;parameter_septal.h,26 :: 		for (i = 1; i <= 6; i++)
; i start address is: 12 (R3)
MOVS	R3, #1
SXTH	R3, R3
; i end address is: 12 (R3)
L_septal1165:
; i start address is: 12 (R3)
CMP	R3, #6
IT	GT
BGT	L_septal1166
;parameter_septal.h,28 :: 		ti[i] = ti[i] * (pi / 180.0); // konversi ke radian
LSLS	R1, R3, #2
MOVW	R0, #lo_addr(_ti+0)
MOVT	R0, #hi_addr(_ti+0)
ADDS	R2, R0, R1
VLDR	#1, S1, [R2, #0]
MOVW	R0, #64053
MOVT	R0, #15502
VMOV	S0, R0
VMUL.F32	S0, S1, S0
VSTR	#1, S0, [R2, #0]
;parameter_septal.h,26 :: 		for (i = 1; i <= 6; i++)
ADDS	R3, R3, #1
SXTH	R3, R3
;parameter_septal.h,29 :: 		}
; i end address is: 12 (R3)
IT	AL
BAL	L_septal1165
L_septal1166:
;parameter_septal.h,30 :: 		}
L_end_septal1:
LDR	LR, [SP, #0]
ADD	SP, SP, #8
BX	LR
; end of _septal1
_septal2:
;parameter_septal.h,32 :: 		void septal2()
SUB	SP, SP, #8
STR	LR, [SP, #0]
;parameter_septal.h,35 :: 		modFactor = sqrt((float)hmean / 60.0);
MOVW	R0, #lo_addr(_hmean+0)
MOVT	R0, #hi_addr(_hmean+0)
VLDR	#1, S1, [R0, #0]
MOVW	R0, #0
MOVT	R0, #17008
VMOV	S0, R0
VDIV.F32	S0, S1, S0
BL	_sqrt+0
MOVW	R0, #lo_addr(_modFactor+0)
MOVT	R0, #hi_addr(_modFactor+0)
VSTR	#1, S0, [R0, #0]
;parameter_septal.h,37 :: 		ti[1] = -60 * sqrt(modFactor);
VMOV.F32	S0, S0
BL	_sqrt+0
MOVW	R0, #0
MOVT	R0, #49776
VMOV	S1, R0
VMUL.F32	S0, S1, S0
MOVW	R0, #lo_addr(_ti+4)
MOVT	R0, #hi_addr(_ti+4)
VSTR	#1, S0, [R0, #0]
;parameter_septal.h,38 :: 		ai[1] = 1.2 * 18;
MOVW	R0, #52429
MOVT	R0, #16812
VMOV	S0, R0
MOVW	R0, #lo_addr(_ai+4)
MOVT	R0, #hi_addr(_ai+4)
VSTR	#1, S0, [R0, #0]
;parameter_septal.h,39 :: 		bi[1] = 0.2 * modFactor;
MOVW	R1, #lo_addr(_modFactor+0)
MOVT	R1, #hi_addr(_modFactor+0)
VLDR	#1, S1, [R1, #0]
MOVW	R0, #52429
MOVT	R0, #15948
VMOV	S0, R0
VMUL.F32	S0, S0, S1
MOVW	R0, #lo_addr(_bi+4)
MOVT	R0, #hi_addr(_bi+4)
VSTR	#1, S0, [R0, #0]
;parameter_septal.h,40 :: 		ti[2] = -15 * modFactor;
MOV	R0, R1
VLDR	#1, S1, [R0, #0]
VMOV.F32	S0, #-15
VMUL.F32	S0, S0, S1
MOVW	R0, #lo_addr(_ti+8)
MOVT	R0, #hi_addr(_ti+8)
VSTR	#1, S0, [R0, #0]
;parameter_septal.h,41 :: 		ai[2] = 0.5 * 18;
VMOV.F32	S0, #9
MOVW	R0, #lo_addr(_ai+8)
MOVT	R0, #hi_addr(_ai+8)
VSTR	#1, S0, [R0, #0]
;parameter_septal.h,42 :: 		bi[2] = 0.1 * modFactor;
MOV	R0, R1
VLDR	#1, S1, [R0, #0]
MOVW	R0, #52429
MOVT	R0, #15820
VMOV	S0, R0
VMUL.F32	S0, S0, S1
MOVW	R0, #lo_addr(_bi+8)
MOVT	R0, #hi_addr(_bi+8)
VSTR	#1, S0, [R0, #0]
;parameter_septal.h,43 :: 		ti[3] = 0;
MOV	R0, #0
VMOV	S0, R0
MOVW	R0, #lo_addr(_ti+12)
MOVT	R0, #hi_addr(_ti+12)
VSTR	#1, S0, [R0, #0]
;parameter_septal.h,44 :: 		ai[3] = 52.5 * 18;
MOVW	R0, #16384
MOVT	R0, #17516
VMOV	S0, R0
MOVW	R0, #lo_addr(_ai+12)
MOVT	R0, #hi_addr(_ai+12)
VSTR	#1, S0, [R0, #0]
;parameter_septal.h,45 :: 		bi[3] = 0.1 * modFactor;
MOV	R0, R1
VLDR	#1, S1, [R0, #0]
MOVW	R0, #52429
MOVT	R0, #15820
VMOV	S0, R0
VMUL.F32	S0, S0, S1
MOVW	R0, #lo_addr(_bi+12)
MOVT	R0, #hi_addr(_bi+12)
VSTR	#1, S0, [R0, #0]
;parameter_septal.h,46 :: 		ti[4] = 15 * modFactor;
MOV	R0, R1
VLDR	#1, S1, [R0, #0]
VMOV.F32	S0, #15
VMUL.F32	S0, S0, S1
MOVW	R0, #lo_addr(_ti+16)
MOVT	R0, #hi_addr(_ti+16)
VSTR	#1, S0, [R0, #0]
;parameter_septal.h,47 :: 		ai[4] = 0.5 * 18;
VMOV.F32	S0, #9
MOVW	R0, #lo_addr(_ai+16)
MOVT	R0, #hi_addr(_ai+16)
VSTR	#1, S0, [R0, #0]
;parameter_septal.h,48 :: 		bi[4] = 0.1 * modFactor;
MOV	R0, R1
VLDR	#1, S1, [R0, #0]
MOVW	R0, #52429
MOVT	R0, #15820
VMOV	S0, R0
VMUL.F32	S0, S0, S1
MOVW	R0, #lo_addr(_bi+16)
MOVT	R0, #hi_addr(_bi+16)
VSTR	#1, S0, [R0, #0]
;parameter_septal.h,49 :: 		ti[5] = 97 * sqrt(modFactor);
MOV	R0, R1
VLDR	#1, S0, [R0, #0]
BL	_sqrt+0
MOVW	R0, #0
MOVT	R0, #17090
VMOV	S1, R0
VMUL.F32	S0, S1, S0
MOVW	R0, #lo_addr(_ti+20)
MOVT	R0, #hi_addr(_ti+20)
VSTR	#1, S0, [R0, #0]
;parameter_septal.h,50 :: 		ai[5] = 0.67 * ((modFactor * modFactor)*sqrt(modFactor)) * 18;
MOVW	R1, #lo_addr(_modFactor+0)
MOVT	R1, #hi_addr(_modFactor+0)
VLDR	#1, S1, [R1, #0]
MOV	R0, R1
VLDR	#1, S0, [R0, #0]
VMUL.F32	S0, S0, S1
VSTR	#1, S0, [SP, #4]
MOV	R0, R1
VLDR	#1, S0, [R0, #0]
BL	_sqrt+0
VLDR	#1, S1, [SP, #4]
VMUL.F32	S1, S1, S0
MOVW	R0, #34079
MOVT	R0, #16171
VMOV	S0, R0
VMUL.F32	S1, S0, S1
VMOV.F32	S0, #18
VMUL.F32	S0, S1, S0
MOVW	R0, #lo_addr(_ai+20)
MOVT	R0, #hi_addr(_ai+20)
VSTR	#1, S0, [R0, #0]
;parameter_septal.h,51 :: 		bi[5] = 0.4 / modFactor;
MOVW	R1, #lo_addr(_modFactor+0)
MOVT	R1, #hi_addr(_modFactor+0)
VLDR	#1, S1, [R1, #0]
MOVW	R0, #52429
MOVT	R0, #16076
VMOV	S0, R0
VDIV.F32	S0, S0, S1
MOVW	R0, #lo_addr(_bi+20)
MOVT	R0, #hi_addr(_bi+20)
VSTR	#1, S0, [R0, #0]
;parameter_septal.h,52 :: 		ti[6] = 100 * sqrt(modFactor);
MOV	R0, R1
VLDR	#1, S0, [R0, #0]
BL	_sqrt+0
MOVW	R0, #0
MOVT	R0, #17096
VMOV	S1, R0
VMUL.F32	S0, S1, S0
MOVW	R0, #lo_addr(_ti+24)
MOVT	R0, #hi_addr(_ti+24)
VSTR	#1, S0, [R0, #0]
;parameter_septal.h,53 :: 		ai[6] = 1 *((modFactor * modFactor)*sqrt(modFactor)) * 18;
MOVW	R1, #lo_addr(_modFactor+0)
MOVT	R1, #hi_addr(_modFactor+0)
VLDR	#1, S1, [R1, #0]
MOV	R0, R1
VLDR	#1, S0, [R0, #0]
VMUL.F32	S0, S0, S1
VSTR	#1, S0, [SP, #4]
MOV	R0, R1
VLDR	#1, S0, [R0, #0]
BL	_sqrt+0
VLDR	#1, S1, [SP, #4]
VMUL.F32	S1, S1, S0
VMOV.F32	S0, #18
VMUL.F32	S0, S1, S0
MOVW	R0, #lo_addr(_ai+24)
MOVT	R0, #hi_addr(_ai+24)
VSTR	#1, S0, [R0, #0]
;parameter_septal.h,54 :: 		bi[6] = 0.2 * modFactor;
MOVW	R0, #lo_addr(_modFactor+0)
MOVT	R0, #hi_addr(_modFactor+0)
VLDR	#1, S1, [R0, #0]
MOVW	R0, #52429
MOVT	R0, #15948
VMOV	S0, R0
VMUL.F32	S0, S0, S1
MOVW	R0, #lo_addr(_bi+24)
MOVT	R0, #hi_addr(_bi+24)
VSTR	#1, S0, [R0, #0]
;parameter_septal.h,57 :: 		for (i = 1; i <= 6; i++)
; i start address is: 12 (R3)
MOVS	R3, #1
SXTH	R3, R3
; i end address is: 12 (R3)
L_septal2168:
; i start address is: 12 (R3)
CMP	R3, #6
IT	GT
BGT	L_septal2169
;parameter_septal.h,59 :: 		ti[i] = ti[i] * (pi / 180.0); // konversi ke radian
LSLS	R1, R3, #2
MOVW	R0, #lo_addr(_ti+0)
MOVT	R0, #hi_addr(_ti+0)
ADDS	R2, R0, R1
VLDR	#1, S1, [R2, #0]
MOVW	R0, #64053
MOVT	R0, #15502
VMOV	S0, R0
VMUL.F32	S0, S1, S0
VSTR	#1, S0, [R2, #0]
;parameter_septal.h,57 :: 		for (i = 1; i <= 6; i++)
ADDS	R3, R3, #1
SXTH	R3, R3
;parameter_septal.h,60 :: 		}
; i end address is: 12 (R3)
IT	AL
BAL	L_septal2168
L_septal2169:
;parameter_septal.h,61 :: 		}
L_end_septal2:
LDR	LR, [SP, #0]
ADD	SP, SP, #8
BX	LR
; end of _septal2
_septal3:
;parameter_septal.h,63 :: 		void septal3()
SUB	SP, SP, #8
STR	LR, [SP, #0]
;parameter_septal.h,66 :: 		modFactor = sqrt((float)hmean / 60.0);
MOVW	R0, #lo_addr(_hmean+0)
MOVT	R0, #hi_addr(_hmean+0)
VLDR	#1, S1, [R0, #0]
MOVW	R0, #0
MOVT	R0, #17008
VMOV	S0, R0
VDIV.F32	S0, S1, S0
BL	_sqrt+0
MOVW	R0, #lo_addr(_modFactor+0)
MOVT	R0, #hi_addr(_modFactor+0)
VSTR	#1, S0, [R0, #0]
;parameter_septal.h,68 :: 		ti[1] = -60 * sqrt(modFactor);
VMOV.F32	S0, S0
BL	_sqrt+0
MOVW	R0, #0
MOVT	R0, #49776
VMOV	S1, R0
VMUL.F32	S0, S1, S0
MOVW	R0, #lo_addr(_ti+4)
MOVT	R0, #hi_addr(_ti+4)
VSTR	#1, S0, [R0, #0]
;parameter_septal.h,69 :: 		ai[1] = 0.8 * 18;
MOVW	R0, #26215
MOVT	R0, #16742
VMOV	S0, R0
MOVW	R0, #lo_addr(_ai+4)
MOVT	R0, #hi_addr(_ai+4)
VSTR	#1, S0, [R0, #0]
;parameter_septal.h,70 :: 		bi[1] = 0.2 * modFactor;
MOVW	R1, #lo_addr(_modFactor+0)
MOVT	R1, #hi_addr(_modFactor+0)
VLDR	#1, S1, [R1, #0]
MOVW	R0, #52429
MOVT	R0, #15948
VMOV	S0, R0
VMUL.F32	S0, S0, S1
MOVW	R0, #lo_addr(_bi+4)
MOVT	R0, #hi_addr(_bi+4)
VSTR	#1, S0, [R0, #0]
;parameter_septal.h,71 :: 		ti[2] = -15 * modFactor;
MOV	R0, R1
VLDR	#1, S1, [R0, #0]
VMOV.F32	S0, #-15
VMUL.F32	S0, S0, S1
MOVW	R0, #lo_addr(_ti+8)
MOVT	R0, #hi_addr(_ti+8)
VSTR	#1, S0, [R0, #0]
;parameter_septal.h,72 :: 		ai[2] = 0.5 * 18;
VMOV.F32	S0, #9
MOVW	R0, #lo_addr(_ai+8)
MOVT	R0, #hi_addr(_ai+8)
VSTR	#1, S0, [R0, #0]
;parameter_septal.h,73 :: 		bi[2] = 0.1 * modFactor;
MOV	R0, R1
VLDR	#1, S1, [R0, #0]
MOVW	R0, #52429
MOVT	R0, #15820
VMOV	S0, R0
VMUL.F32	S0, S0, S1
MOVW	R0, #lo_addr(_bi+8)
MOVT	R0, #hi_addr(_bi+8)
VSTR	#1, S0, [R0, #0]
;parameter_septal.h,74 :: 		ti[3] = 0;
MOV	R0, #0
VMOV	S0, R0
MOVW	R0, #lo_addr(_ti+12)
MOVT	R0, #hi_addr(_ti+12)
VSTR	#1, S0, [R0, #0]
;parameter_septal.h,75 :: 		ai[3] = 33.75 * 18;
MOVW	R0, #57344
MOVT	R0, #17431
VMOV	S0, R0
MOVW	R0, #lo_addr(_ai+12)
MOVT	R0, #hi_addr(_ai+12)
VSTR	#1, S0, [R0, #0]
;parameter_septal.h,76 :: 		bi[3] = 0.1 * modFactor;
MOV	R0, R1
VLDR	#1, S1, [R0, #0]
MOVW	R0, #52429
MOVT	R0, #15820
VMOV	S0, R0
VMUL.F32	S0, S0, S1
MOVW	R0, #lo_addr(_bi+12)
MOVT	R0, #hi_addr(_bi+12)
VSTR	#1, S0, [R0, #0]
;parameter_septal.h,77 :: 		ti[4] = 15 * modFactor;
MOV	R0, R1
VLDR	#1, S1, [R0, #0]
VMOV.F32	S0, #15
VMUL.F32	S0, S0, S1
MOVW	R0, #lo_addr(_ti+16)
MOVT	R0, #hi_addr(_ti+16)
VSTR	#1, S0, [R0, #0]
;parameter_septal.h,78 :: 		ai[4] = 0.5 * 18;
VMOV.F32	S0, #9
MOVW	R0, #lo_addr(_ai+16)
MOVT	R0, #hi_addr(_ai+16)
VSTR	#1, S0, [R0, #0]
;parameter_septal.h,79 :: 		bi[4] = 0.1 * modFactor;
MOV	R0, R1
VLDR	#1, S1, [R0, #0]
MOVW	R0, #52429
MOVT	R0, #15820
VMOV	S0, R0
VMUL.F32	S0, S0, S1
MOVW	R0, #lo_addr(_bi+16)
MOVT	R0, #hi_addr(_bi+16)
VSTR	#1, S0, [R0, #0]
;parameter_septal.h,80 :: 		ti[5] = 97 * sqrt(modFactor);
MOV	R0, R1
VLDR	#1, S0, [R0, #0]
BL	_sqrt+0
MOVW	R0, #0
MOVT	R0, #17090
VMOV	S1, R0
VMUL.F32	S0, S1, S0
MOVW	R0, #lo_addr(_ti+20)
MOVT	R0, #hi_addr(_ti+20)
VSTR	#1, S0, [R0, #0]
;parameter_septal.h,81 :: 		ai[5] = 0.3 * ((modFactor * modFactor)*sqrt(modFactor)) * 18;
MOVW	R1, #lo_addr(_modFactor+0)
MOVT	R1, #hi_addr(_modFactor+0)
VLDR	#1, S1, [R1, #0]
MOV	R0, R1
VLDR	#1, S0, [R0, #0]
VMUL.F32	S0, S0, S1
VSTR	#1, S0, [SP, #4]
MOV	R0, R1
VLDR	#1, S0, [R0, #0]
BL	_sqrt+0
VLDR	#1, S1, [SP, #4]
VMUL.F32	S1, S1, S0
MOVW	R0, #39322
MOVT	R0, #16025
VMOV	S0, R0
VMUL.F32	S1, S0, S1
VMOV.F32	S0, #18
VMUL.F32	S0, S1, S0
MOVW	R0, #lo_addr(_ai+20)
MOVT	R0, #hi_addr(_ai+20)
VSTR	#1, S0, [R0, #0]
;parameter_septal.h,82 :: 		bi[5] = 0.4 / modFactor;
MOVW	R1, #lo_addr(_modFactor+0)
MOVT	R1, #hi_addr(_modFactor+0)
VLDR	#1, S1, [R1, #0]
MOVW	R0, #52429
MOVT	R0, #16076
VMOV	S0, R0
VDIV.F32	S0, S0, S1
MOVW	R0, #lo_addr(_bi+20)
MOVT	R0, #hi_addr(_bi+20)
VSTR	#1, S0, [R0, #0]
;parameter_septal.h,83 :: 		ti[6] = 100 * sqrt(modFactor);
MOV	R0, R1
VLDR	#1, S0, [R0, #0]
BL	_sqrt+0
MOVW	R0, #0
MOVT	R0, #17096
VMOV	S1, R0
VMUL.F32	S0, S1, S0
MOVW	R0, #lo_addr(_ti+24)
MOVT	R0, #hi_addr(_ti+24)
VSTR	#1, S0, [R0, #0]
;parameter_septal.h,84 :: 		ai[6] = 0.5 *((modFactor * modFactor)*sqrt(modFactor)) * 18;
MOVW	R1, #lo_addr(_modFactor+0)
MOVT	R1, #hi_addr(_modFactor+0)
VLDR	#1, S1, [R1, #0]
MOV	R0, R1
VLDR	#1, S0, [R0, #0]
VMUL.F32	S0, S0, S1
VSTR	#1, S0, [SP, #4]
MOV	R0, R1
VLDR	#1, S0, [R0, #0]
BL	_sqrt+0
VLDR	#1, S1, [SP, #4]
VMUL.F32	S1, S1, S0
VMOV.F32	S0, #0.5
VMUL.F32	S1, S0, S1
VMOV.F32	S0, #18
VMUL.F32	S0, S1, S0
MOVW	R0, #lo_addr(_ai+24)
MOVT	R0, #hi_addr(_ai+24)
VSTR	#1, S0, [R0, #0]
;parameter_septal.h,85 :: 		bi[6] = 0.2 * modFactor;
MOVW	R0, #lo_addr(_modFactor+0)
MOVT	R0, #hi_addr(_modFactor+0)
VLDR	#1, S1, [R0, #0]
MOVW	R0, #52429
MOVT	R0, #15948
VMOV	S0, R0
VMUL.F32	S0, S0, S1
MOVW	R0, #lo_addr(_bi+24)
MOVT	R0, #hi_addr(_bi+24)
VSTR	#1, S0, [R0, #0]
;parameter_septal.h,88 :: 		for (i = 1; i <= 6; i++)
; i start address is: 12 (R3)
MOVS	R3, #1
SXTH	R3, R3
; i end address is: 12 (R3)
L_septal3171:
; i start address is: 12 (R3)
CMP	R3, #6
IT	GT
BGT	L_septal3172
;parameter_septal.h,90 :: 		ti[i] = ti[i] * (pi / 180.0); // konversi ke radian
LSLS	R1, R3, #2
MOVW	R0, #lo_addr(_ti+0)
MOVT	R0, #hi_addr(_ti+0)
ADDS	R2, R0, R1
VLDR	#1, S1, [R2, #0]
MOVW	R0, #64053
MOVT	R0, #15502
VMOV	S0, R0
VMUL.F32	S0, S1, S0
VSTR	#1, S0, [R2, #0]
;parameter_septal.h,88 :: 		for (i = 1; i <= 6; i++)
ADDS	R3, R3, #1
SXTH	R3, R3
;parameter_septal.h,91 :: 		}
; i end address is: 12 (R3)
IT	AL
BAL	L_septal3171
L_septal3172:
;parameter_septal.h,92 :: 		}
L_end_septal3:
LDR	LR, [SP, #0]
ADD	SP, SP, #8
BX	LR
; end of _septal3
_septalaVR:
;parameter_septal.h,94 :: 		void septalaVR()
SUB	SP, SP, #8
STR	LR, [SP, #0]
;parameter_septal.h,97 :: 		modFactor = sqrt((float)hmean / 60.0);
MOVW	R0, #lo_addr(_hmean+0)
MOVT	R0, #hi_addr(_hmean+0)
VLDR	#1, S1, [R0, #0]
MOVW	R0, #0
MOVT	R0, #17008
VMOV	S0, R0
VDIV.F32	S0, S1, S0
BL	_sqrt+0
MOVW	R0, #lo_addr(_modFactor+0)
MOVT	R0, #hi_addr(_modFactor+0)
VSTR	#1, S0, [R0, #0]
;parameter_septal.h,99 :: 		ti[1] = -60 * sqrt(modFactor);
VMOV.F32	S0, S0
BL	_sqrt+0
MOVW	R0, #0
MOVT	R0, #49776
VMOV	S1, R0
VMUL.F32	S0, S1, S0
MOVW	R0, #lo_addr(_ti+4)
MOVT	R0, #hi_addr(_ti+4)
VSTR	#1, S0, [R0, #0]
;parameter_septal.h,100 :: 		ai[1] = -0.8 * 18;
MOVW	R0, #26215
MOVT	R0, #49510
VMOV	S0, R0
MOVW	R0, #lo_addr(_ai+4)
MOVT	R0, #hi_addr(_ai+4)
VSTR	#1, S0, [R0, #0]
;parameter_septal.h,101 :: 		bi[1] = 0.2 * modFactor;
MOVW	R1, #lo_addr(_modFactor+0)
MOVT	R1, #hi_addr(_modFactor+0)
VLDR	#1, S1, [R1, #0]
MOVW	R0, #52429
MOVT	R0, #15948
VMOV	S0, R0
VMUL.F32	S0, S0, S1
MOVW	R0, #lo_addr(_bi+4)
MOVT	R0, #hi_addr(_bi+4)
VSTR	#1, S0, [R0, #0]
;parameter_septal.h,102 :: 		ti[2] = -15 * modFactor;
MOV	R0, R1
VLDR	#1, S1, [R0, #0]
VMOV.F32	S0, #-15
VMUL.F32	S0, S0, S1
MOVW	R0, #lo_addr(_ti+8)
MOVT	R0, #hi_addr(_ti+8)
VSTR	#1, S0, [R0, #0]
;parameter_septal.h,103 :: 		ai[2] = 0.5 * 18;
VMOV.F32	S0, #9
MOVW	R0, #lo_addr(_ai+8)
MOVT	R0, #hi_addr(_ai+8)
VSTR	#1, S0, [R0, #0]
;parameter_septal.h,104 :: 		bi[2] = 0.1 * modFactor;
MOV	R0, R1
VLDR	#1, S1, [R0, #0]
MOVW	R0, #52429
MOVT	R0, #15820
VMOV	S0, R0
VMUL.F32	S0, S0, S1
MOVW	R0, #lo_addr(_bi+8)
MOVT	R0, #hi_addr(_bi+8)
VSTR	#1, S0, [R0, #0]
;parameter_septal.h,105 :: 		ti[3] = 0;
MOV	R0, #0
VMOV	S0, R0
MOVW	R0, #lo_addr(_ti+12)
MOVT	R0, #hi_addr(_ti+12)
VSTR	#1, S0, [R0, #0]
;parameter_septal.h,106 :: 		ai[3] = -30 * 18;
MOVW	R0, #0
MOVT	R0, #50183
VMOV	S0, R0
MOVW	R0, #lo_addr(_ai+12)
MOVT	R0, #hi_addr(_ai+12)
VSTR	#1, S0, [R0, #0]
;parameter_septal.h,107 :: 		bi[3] = 0.1 * modFactor;
MOV	R0, R1
VLDR	#1, S1, [R0, #0]
MOVW	R0, #52429
MOVT	R0, #15820
VMOV	S0, R0
VMUL.F32	S0, S0, S1
MOVW	R0, #lo_addr(_bi+12)
MOVT	R0, #hi_addr(_bi+12)
VSTR	#1, S0, [R0, #0]
;parameter_septal.h,108 :: 		ti[4] = 15 * modFactor;
MOV	R0, R1
VLDR	#1, S1, [R0, #0]
VMOV.F32	S0, #15
VMUL.F32	S0, S0, S1
MOVW	R0, #lo_addr(_ti+16)
MOVT	R0, #hi_addr(_ti+16)
VSTR	#1, S0, [R0, #0]
;parameter_septal.h,109 :: 		ai[4] = 0.5 * 18;
VMOV.F32	S0, #9
MOVW	R0, #lo_addr(_ai+16)
MOVT	R0, #hi_addr(_ai+16)
VSTR	#1, S0, [R0, #0]
;parameter_septal.h,110 :: 		bi[4] = 0.1 * modFactor;
MOV	R0, R1
VLDR	#1, S1, [R0, #0]
MOVW	R0, #52429
MOVT	R0, #15820
VMOV	S0, R0
VMUL.F32	S0, S0, S1
MOVW	R0, #lo_addr(_bi+16)
MOVT	R0, #hi_addr(_bi+16)
VSTR	#1, S0, [R0, #0]
;parameter_septal.h,111 :: 		ti[5] = 97 * sqrt(modFactor);
MOV	R0, R1
VLDR	#1, S0, [R0, #0]
BL	_sqrt+0
MOVW	R0, #0
MOVT	R0, #17090
VMOV	S1, R0
VMUL.F32	S0, S1, S0
MOVW	R0, #lo_addr(_ti+20)
MOVT	R0, #hi_addr(_ti+20)
VSTR	#1, S0, [R0, #0]
;parameter_septal.h,112 :: 		ai[5] = -0.5 * ((modFactor * modFactor)*sqrt(modFactor)) * 18;
MOVW	R1, #lo_addr(_modFactor+0)
MOVT	R1, #hi_addr(_modFactor+0)
VLDR	#1, S1, [R1, #0]
MOV	R0, R1
VLDR	#1, S0, [R0, #0]
VMUL.F32	S0, S0, S1
VSTR	#1, S0, [SP, #4]
MOV	R0, R1
VLDR	#1, S0, [R0, #0]
BL	_sqrt+0
VLDR	#1, S1, [SP, #4]
VMUL.F32	S1, S1, S0
VMOV.F32	S0, #-0.5
VMUL.F32	S1, S0, S1
VMOV.F32	S0, #18
VMUL.F32	S0, S1, S0
MOVW	R0, #lo_addr(_ai+20)
MOVT	R0, #hi_addr(_ai+20)
VSTR	#1, S0, [R0, #0]
;parameter_septal.h,113 :: 		bi[5] = 0.4 / modFactor;
MOVW	R1, #lo_addr(_modFactor+0)
MOVT	R1, #hi_addr(_modFactor+0)
VLDR	#1, S1, [R1, #0]
MOVW	R0, #52429
MOVT	R0, #16076
VMOV	S0, R0
VDIV.F32	S0, S0, S1
MOVW	R0, #lo_addr(_bi+20)
MOVT	R0, #hi_addr(_bi+20)
VSTR	#1, S0, [R0, #0]
;parameter_septal.h,114 :: 		ti[6] = 100 * sqrt(modFactor);
MOV	R0, R1
VLDR	#1, S0, [R0, #0]
BL	_sqrt+0
MOVW	R0, #0
MOVT	R0, #17096
VMOV	S1, R0
VMUL.F32	S0, S1, S0
MOVW	R0, #lo_addr(_ti+24)
MOVT	R0, #hi_addr(_ti+24)
VSTR	#1, S0, [R0, #0]
;parameter_septal.h,115 :: 		ai[6] = -0.75 *((modFactor * modFactor)*sqrt(modFactor)) * 18;
MOVW	R1, #lo_addr(_modFactor+0)
MOVT	R1, #hi_addr(_modFactor+0)
VLDR	#1, S1, [R1, #0]
MOV	R0, R1
VLDR	#1, S0, [R0, #0]
VMUL.F32	S0, S0, S1
VSTR	#1, S0, [SP, #4]
MOV	R0, R1
VLDR	#1, S0, [R0, #0]
BL	_sqrt+0
VLDR	#1, S1, [SP, #4]
VMUL.F32	S1, S1, S0
VMOV.F32	S0, #-0.75
VMUL.F32	S1, S0, S1
VMOV.F32	S0, #18
VMUL.F32	S0, S1, S0
MOVW	R0, #lo_addr(_ai+24)
MOVT	R0, #hi_addr(_ai+24)
VSTR	#1, S0, [R0, #0]
;parameter_septal.h,116 :: 		bi[6] = 0.2 * modFactor;
MOVW	R0, #lo_addr(_modFactor+0)
MOVT	R0, #hi_addr(_modFactor+0)
VLDR	#1, S1, [R0, #0]
MOVW	R0, #52429
MOVT	R0, #15948
VMOV	S0, R0
VMUL.F32	S0, S0, S1
MOVW	R0, #lo_addr(_bi+24)
MOVT	R0, #hi_addr(_bi+24)
VSTR	#1, S0, [R0, #0]
;parameter_septal.h,119 :: 		for (i = 1; i <= 6; i++)
; i start address is: 12 (R3)
MOVS	R3, #1
SXTH	R3, R3
; i end address is: 12 (R3)
L_septalaVR174:
; i start address is: 12 (R3)
CMP	R3, #6
IT	GT
BGT	L_septalaVR175
;parameter_septal.h,121 :: 		ti[i] = ti[i] * (pi / 180.0); // konversi ke radian
LSLS	R1, R3, #2
MOVW	R0, #lo_addr(_ti+0)
MOVT	R0, #hi_addr(_ti+0)
ADDS	R2, R0, R1
VLDR	#1, S1, [R2, #0]
MOVW	R0, #64053
MOVT	R0, #15502
VMOV	S0, R0
VMUL.F32	S0, S1, S0
VSTR	#1, S0, [R2, #0]
;parameter_septal.h,119 :: 		for (i = 1; i <= 6; i++)
ADDS	R3, R3, #1
SXTH	R3, R3
;parameter_septal.h,122 :: 		}
; i end address is: 12 (R3)
IT	AL
BAL	L_septalaVR174
L_septalaVR175:
;parameter_septal.h,123 :: 		}
L_end_septalaVR:
LDR	LR, [SP, #0]
ADD	SP, SP, #8
BX	LR
; end of _septalaVR
_septalaVL:
;parameter_septal.h,125 :: 		void septalaVL()
SUB	SP, SP, #8
STR	LR, [SP, #0]
;parameter_septal.h,128 :: 		modFactor = sqrt((float)hmean / 60.0);
MOVW	R0, #lo_addr(_hmean+0)
MOVT	R0, #hi_addr(_hmean+0)
VLDR	#1, S1, [R0, #0]
MOVW	R0, #0
MOVT	R0, #17008
VMOV	S0, R0
VDIV.F32	S0, S1, S0
BL	_sqrt+0
MOVW	R0, #lo_addr(_modFactor+0)
MOVT	R0, #hi_addr(_modFactor+0)
VSTR	#1, S0, [R0, #0]
;parameter_septal.h,130 :: 		ti[1] = -60 * sqrt(modFactor);
VMOV.F32	S0, S0
BL	_sqrt+0
MOVW	R0, #0
MOVT	R0, #49776
VMOV	S1, R0
VMUL.F32	S0, S1, S0
MOVW	R0, #lo_addr(_ti+4)
MOVT	R0, #hi_addr(_ti+4)
VSTR	#1, S0, [R0, #0]
;parameter_septal.h,131 :: 		ai[1] = -0.2 * 18;
MOVW	R0, #26215
MOVT	R0, #49254
VMOV	S0, R0
MOVW	R0, #lo_addr(_ai+4)
MOVT	R0, #hi_addr(_ai+4)
VSTR	#1, S0, [R0, #0]
;parameter_septal.h,132 :: 		bi[1] = 0.2 * modFactor;
MOVW	R1, #lo_addr(_modFactor+0)
MOVT	R1, #hi_addr(_modFactor+0)
VLDR	#1, S1, [R1, #0]
MOVW	R0, #52429
MOVT	R0, #15948
VMOV	S0, R0
VMUL.F32	S0, S0, S1
MOVW	R0, #lo_addr(_bi+4)
MOVT	R0, #hi_addr(_bi+4)
VSTR	#1, S0, [R0, #0]
;parameter_septal.h,133 :: 		ti[2] = -15 * modFactor;
MOV	R0, R1
VLDR	#1, S1, [R0, #0]
VMOV.F32	S0, #-15
VMUL.F32	S0, S0, S1
MOVW	R0, #lo_addr(_ti+8)
MOVT	R0, #hi_addr(_ti+8)
VSTR	#1, S0, [R0, #0]
;parameter_septal.h,134 :: 		ai[2] = 7 * 18;
MOVW	R0, #0
MOVT	R0, #17148
VMOV	S0, R0
MOVW	R0, #lo_addr(_ai+8)
MOVT	R0, #hi_addr(_ai+8)
VSTR	#1, S0, [R0, #0]
;parameter_septal.h,135 :: 		bi[2] = 0.1 * modFactor;
MOV	R0, R1
VLDR	#1, S1, [R0, #0]
MOVW	R0, #52429
MOVT	R0, #15820
VMOV	S0, R0
VMUL.F32	S0, S0, S1
MOVW	R0, #lo_addr(_bi+8)
MOVT	R0, #hi_addr(_bi+8)
VSTR	#1, S0, [R0, #0]
;parameter_septal.h,136 :: 		ti[3] = 0;
MOV	R0, #0
VMOV	S0, R0
MOVW	R0, #lo_addr(_ti+12)
MOVT	R0, #hi_addr(_ti+12)
VSTR	#1, S0, [R0, #0]
;parameter_septal.h,137 :: 		ai[3] = -15 * 18;
MOVW	R0, #0
MOVT	R0, #50055
VMOV	S0, R0
MOVW	R0, #lo_addr(_ai+12)
MOVT	R0, #hi_addr(_ai+12)
VSTR	#1, S0, [R0, #0]
;parameter_septal.h,138 :: 		bi[3] = 0.1 * modFactor;
MOV	R0, R1
VLDR	#1, S1, [R0, #0]
MOVW	R0, #52429
MOVT	R0, #15820
VMOV	S0, R0
VMUL.F32	S0, S0, S1
MOVW	R0, #lo_addr(_bi+12)
MOVT	R0, #hi_addr(_bi+12)
VSTR	#1, S0, [R0, #0]
;parameter_septal.h,139 :: 		ti[4] = 15 * modFactor;
MOV	R0, R1
VLDR	#1, S1, [R0, #0]
VMOV.F32	S0, #15
VMUL.F32	S0, S0, S1
MOVW	R0, #lo_addr(_ti+16)
MOVT	R0, #hi_addr(_ti+16)
VSTR	#1, S0, [R0, #0]
;parameter_septal.h,140 :: 		ai[4] = -0.5 * 18;
VMOV.F32	S0, #-9
MOVW	R0, #lo_addr(_ai+16)
MOVT	R0, #hi_addr(_ai+16)
VSTR	#1, S0, [R0, #0]
;parameter_septal.h,141 :: 		bi[4] = 0.1 * modFactor;
MOV	R0, R1
VLDR	#1, S1, [R0, #0]
MOVW	R0, #52429
MOVT	R0, #15820
VMOV	S0, R0
VMUL.F32	S0, S0, S1
MOVW	R0, #lo_addr(_bi+16)
MOVT	R0, #hi_addr(_bi+16)
VSTR	#1, S0, [R0, #0]
;parameter_septal.h,142 :: 		ti[5] = 97 * sqrt(modFactor);
MOV	R0, R1
VLDR	#1, S0, [R0, #0]
BL	_sqrt+0
MOVW	R0, #0
MOVT	R0, #17090
VMOV	S1, R0
VMUL.F32	S0, S1, S0
MOVW	R0, #lo_addr(_ti+20)
MOVT	R0, #hi_addr(_ti+20)
VSTR	#1, S0, [R0, #0]
;parameter_septal.h,143 :: 		ai[5] = 0.17 * ((modFactor * modFactor)*sqrt(modFactor)) * 18;
MOVW	R1, #lo_addr(_modFactor+0)
MOVT	R1, #hi_addr(_modFactor+0)
VLDR	#1, S1, [R1, #0]
MOV	R0, R1
VLDR	#1, S0, [R0, #0]
VMUL.F32	S0, S0, S1
VSTR	#1, S0, [SP, #4]
MOV	R0, R1
VLDR	#1, S0, [R0, #0]
BL	_sqrt+0
VLDR	#1, S1, [SP, #4]
VMUL.F32	S1, S1, S0
MOVW	R0, #5243
MOVT	R0, #15918
VMOV	S0, R0
VMUL.F32	S1, S0, S1
VMOV.F32	S0, #18
VMUL.F32	S0, S1, S0
MOVW	R0, #lo_addr(_ai+20)
MOVT	R0, #hi_addr(_ai+20)
VSTR	#1, S0, [R0, #0]
;parameter_septal.h,144 :: 		bi[5] = 0.4 / modFactor;
MOVW	R1, #lo_addr(_modFactor+0)
MOVT	R1, #hi_addr(_modFactor+0)
VLDR	#1, S1, [R1, #0]
MOVW	R0, #52429
MOVT	R0, #16076
VMOV	S0, R0
VDIV.F32	S0, S0, S1
MOVW	R0, #lo_addr(_bi+20)
MOVT	R0, #hi_addr(_bi+20)
VSTR	#1, S0, [R0, #0]
;parameter_septal.h,145 :: 		ti[6] = 100 * sqrt(modFactor);
MOV	R0, R1
VLDR	#1, S0, [R0, #0]
BL	_sqrt+0
MOVW	R0, #0
MOVT	R0, #17096
VMOV	S1, R0
VMUL.F32	S0, S1, S0
MOVW	R0, #lo_addr(_ti+24)
MOVT	R0, #hi_addr(_ti+24)
VSTR	#1, S0, [R0, #0]
;parameter_septal.h,146 :: 		ai[6] = 0.25 *((modFactor * modFactor)*sqrt(modFactor)) * 18;
MOVW	R1, #lo_addr(_modFactor+0)
MOVT	R1, #hi_addr(_modFactor+0)
VLDR	#1, S1, [R1, #0]
MOV	R0, R1
VLDR	#1, S0, [R0, #0]
VMUL.F32	S0, S0, S1
VSTR	#1, S0, [SP, #4]
MOV	R0, R1
VLDR	#1, S0, [R0, #0]
BL	_sqrt+0
VLDR	#1, S1, [SP, #4]
VMUL.F32	S1, S1, S0
VMOV.F32	S0, #0.25
VMUL.F32	S1, S0, S1
VMOV.F32	S0, #18
VMUL.F32	S0, S1, S0
MOVW	R0, #lo_addr(_ai+24)
MOVT	R0, #hi_addr(_ai+24)
VSTR	#1, S0, [R0, #0]
;parameter_septal.h,147 :: 		bi[6] = 0.2 * modFactor;
MOVW	R0, #lo_addr(_modFactor+0)
MOVT	R0, #hi_addr(_modFactor+0)
VLDR	#1, S1, [R0, #0]
MOVW	R0, #52429
MOVT	R0, #15948
VMOV	S0, R0
VMUL.F32	S0, S0, S1
MOVW	R0, #lo_addr(_bi+24)
MOVT	R0, #hi_addr(_bi+24)
VSTR	#1, S0, [R0, #0]
;parameter_septal.h,150 :: 		for (i = 1; i <= 6; i++)
; i start address is: 12 (R3)
MOVS	R3, #1
SXTH	R3, R3
; i end address is: 12 (R3)
L_septalaVL177:
; i start address is: 12 (R3)
CMP	R3, #6
IT	GT
BGT	L_septalaVL178
;parameter_septal.h,152 :: 		ti[i] = ti[i] * (pi / 180.0); // konversi ke radian
LSLS	R1, R3, #2
MOVW	R0, #lo_addr(_ti+0)
MOVT	R0, #hi_addr(_ti+0)
ADDS	R2, R0, R1
VLDR	#1, S1, [R2, #0]
MOVW	R0, #64053
MOVT	R0, #15502
VMOV	S0, R0
VMUL.F32	S0, S1, S0
VSTR	#1, S0, [R2, #0]
;parameter_septal.h,150 :: 		for (i = 1; i <= 6; i++)
ADDS	R3, R3, #1
SXTH	R3, R3
;parameter_septal.h,153 :: 		}
; i end address is: 12 (R3)
IT	AL
BAL	L_septalaVL177
L_septalaVL178:
;parameter_septal.h,154 :: 		}
L_end_septalaVL:
LDR	LR, [SP, #0]
ADD	SP, SP, #8
BX	LR
; end of _septalaVL
_septalaVF:
;parameter_septal.h,156 :: 		void septalaVF()
SUB	SP, SP, #8
STR	LR, [SP, #0]
;parameter_septal.h,159 :: 		modFactor = sqrt((float)hmean / 60.0);
MOVW	R0, #lo_addr(_hmean+0)
MOVT	R0, #hi_addr(_hmean+0)
VLDR	#1, S1, [R0, #0]
MOVW	R0, #0
MOVT	R0, #17008
VMOV	S0, R0
VDIV.F32	S0, S1, S0
BL	_sqrt+0
MOVW	R0, #lo_addr(_modFactor+0)
MOVT	R0, #hi_addr(_modFactor+0)
VSTR	#1, S0, [R0, #0]
;parameter_septal.h,161 :: 		ti[1] = -60 * sqrt(modFactor);
VMOV.F32	S0, S0
BL	_sqrt+0
MOVW	R0, #0
MOVT	R0, #49776
VMOV	S1, R0
VMUL.F32	S0, S1, S0
MOVW	R0, #lo_addr(_ti+4)
MOVT	R0, #hi_addr(_ti+4)
VSTR	#1, S0, [R0, #0]
;parameter_septal.h,162 :: 		ai[1] = 1 * 18;
VMOV.F32	S0, #18
MOVW	R0, #lo_addr(_ai+4)
MOVT	R0, #hi_addr(_ai+4)
VSTR	#1, S0, [R0, #0]
;parameter_septal.h,163 :: 		bi[1] = 0.2 * modFactor;
MOVW	R1, #lo_addr(_modFactor+0)
MOVT	R1, #hi_addr(_modFactor+0)
VLDR	#1, S1, [R1, #0]
MOVW	R0, #52429
MOVT	R0, #15948
VMOV	S0, R0
VMUL.F32	S0, S0, S1
MOVW	R0, #lo_addr(_bi+4)
MOVT	R0, #hi_addr(_bi+4)
VSTR	#1, S0, [R0, #0]
;parameter_septal.h,164 :: 		ti[2] = -15 * modFactor;
MOV	R0, R1
VLDR	#1, S1, [R0, #0]
VMOV.F32	S0, #-15
VMUL.F32	S0, S0, S1
MOVW	R0, #lo_addr(_ti+8)
MOVT	R0, #hi_addr(_ti+8)
VSTR	#1, S0, [R0, #0]
;parameter_septal.h,165 :: 		ai[2] = 0.5 * 18;
VMOV.F32	S0, #9
MOVW	R0, #lo_addr(_ai+8)
MOVT	R0, #hi_addr(_ai+8)
VSTR	#1, S0, [R0, #0]
;parameter_septal.h,166 :: 		bi[2] = 0.1 * modFactor;
MOV	R0, R1
VLDR	#1, S1, [R0, #0]
MOVW	R0, #52429
MOVT	R0, #15820
VMOV	S0, R0
VMUL.F32	S0, S0, S1
MOVW	R0, #lo_addr(_bi+8)
MOVT	R0, #hi_addr(_bi+8)
VSTR	#1, S0, [R0, #0]
;parameter_septal.h,167 :: 		ti[3] = 0;
MOV	R0, #0
VMOV	S0, R0
MOVW	R0, #lo_addr(_ti+12)
MOVT	R0, #hi_addr(_ti+12)
VSTR	#1, S0, [R0, #0]
;parameter_septal.h,168 :: 		ai[3] = 40 * 18;
MOVW	R0, #0
MOVT	R0, #17460
VMOV	S0, R0
MOVW	R0, #lo_addr(_ai+12)
MOVT	R0, #hi_addr(_ai+12)
VSTR	#1, S0, [R0, #0]
;parameter_septal.h,169 :: 		bi[3] = 0.1 * modFactor;
MOV	R0, R1
VLDR	#1, S1, [R0, #0]
MOVW	R0, #52429
MOVT	R0, #15820
VMOV	S0, R0
VMUL.F32	S0, S0, S1
MOVW	R0, #lo_addr(_bi+12)
MOVT	R0, #hi_addr(_bi+12)
VSTR	#1, S0, [R0, #0]
;parameter_septal.h,170 :: 		ti[4] = 15 * modFactor;
MOV	R0, R1
VLDR	#1, S1, [R0, #0]
VMOV.F32	S0, #15
VMUL.F32	S0, S0, S1
MOVW	R0, #lo_addr(_ti+16)
MOVT	R0, #hi_addr(_ti+16)
VSTR	#1, S0, [R0, #0]
;parameter_septal.h,171 :: 		ai[4] = 0.5 * 18;
VMOV.F32	S0, #9
MOVW	R0, #lo_addr(_ai+16)
MOVT	R0, #hi_addr(_ai+16)
VSTR	#1, S0, [R0, #0]
;parameter_septal.h,172 :: 		bi[4] = 0.1 * modFactor;
MOV	R0, R1
VLDR	#1, S1, [R0, #0]
MOVW	R0, #52429
MOVT	R0, #15820
VMOV	S0, R0
VMUL.F32	S0, S0, S1
MOVW	R0, #lo_addr(_bi+16)
MOVT	R0, #hi_addr(_bi+16)
VSTR	#1, S0, [R0, #0]
;parameter_septal.h,173 :: 		ti[5] = 97 * sqrt(modFactor);
MOV	R0, R1
VLDR	#1, S0, [R0, #0]
BL	_sqrt+0
MOVW	R0, #0
MOVT	R0, #17090
VMOV	S1, R0
VMUL.F32	S0, S1, S0
MOVW	R0, #lo_addr(_ti+20)
MOVT	R0, #hi_addr(_ti+20)
VSTR	#1, S0, [R0, #0]
;parameter_septal.h,174 :: 		ai[5] = 0.4 * ((modFactor * modFactor)*sqrt(modFactor)) * 18;
MOVW	R1, #lo_addr(_modFactor+0)
MOVT	R1, #hi_addr(_modFactor+0)
VLDR	#1, S1, [R1, #0]
MOV	R0, R1
VLDR	#1, S0, [R0, #0]
VMUL.F32	S0, S0, S1
VSTR	#1, S0, [SP, #4]
MOV	R0, R1
VLDR	#1, S0, [R0, #0]
BL	_sqrt+0
VLDR	#1, S1, [SP, #4]
VMUL.F32	S1, S1, S0
MOVW	R0, #52429
MOVT	R0, #16076
VMOV	S0, R0
VMUL.F32	S1, S0, S1
VMOV.F32	S0, #18
VMUL.F32	S0, S1, S0
MOVW	R0, #lo_addr(_ai+20)
MOVT	R0, #hi_addr(_ai+20)
VSTR	#1, S0, [R0, #0]
;parameter_septal.h,175 :: 		bi[5] = 0.4 / modFactor;
MOVW	R1, #lo_addr(_modFactor+0)
MOVT	R1, #hi_addr(_modFactor+0)
VLDR	#1, S1, [R1, #0]
MOVW	R0, #52429
MOVT	R0, #16076
VMOV	S0, R0
VDIV.F32	S0, S0, S1
MOVW	R0, #lo_addr(_bi+20)
MOVT	R0, #hi_addr(_bi+20)
VSTR	#1, S0, [R0, #0]
;parameter_septal.h,176 :: 		ti[6] = 100 * sqrt(modFactor);
MOV	R0, R1
VLDR	#1, S0, [R0, #0]
BL	_sqrt+0
MOVW	R0, #0
MOVT	R0, #17096
VMOV	S1, R0
VMUL.F32	S0, S1, S0
MOVW	R0, #lo_addr(_ti+24)
MOVT	R0, #hi_addr(_ti+24)
VSTR	#1, S0, [R0, #0]
;parameter_septal.h,177 :: 		ai[6] = 0.6 *((modFactor * modFactor)*sqrt(modFactor)) * 18;
MOVW	R1, #lo_addr(_modFactor+0)
MOVT	R1, #hi_addr(_modFactor+0)
VLDR	#1, S1, [R1, #0]
MOV	R0, R1
VLDR	#1, S0, [R0, #0]
VMUL.F32	S0, S0, S1
VSTR	#1, S0, [SP, #4]
MOV	R0, R1
VLDR	#1, S0, [R0, #0]
BL	_sqrt+0
VLDR	#1, S1, [SP, #4]
VMUL.F32	S1, S1, S0
MOVW	R0, #39322
MOVT	R0, #16153
VMOV	S0, R0
VMUL.F32	S1, S0, S1
VMOV.F32	S0, #18
VMUL.F32	S0, S1, S0
MOVW	R0, #lo_addr(_ai+24)
MOVT	R0, #hi_addr(_ai+24)
VSTR	#1, S0, [R0, #0]
;parameter_septal.h,178 :: 		bi[6] = 0.2 * modFactor;
MOVW	R0, #lo_addr(_modFactor+0)
MOVT	R0, #hi_addr(_modFactor+0)
VLDR	#1, S1, [R0, #0]
MOVW	R0, #52429
MOVT	R0, #15948
VMOV	S0, R0
VMUL.F32	S0, S0, S1
MOVW	R0, #lo_addr(_bi+24)
MOVT	R0, #hi_addr(_bi+24)
VSTR	#1, S0, [R0, #0]
;parameter_septal.h,181 :: 		for (i = 1; i <= 6; i++)
; i start address is: 12 (R3)
MOVS	R3, #1
SXTH	R3, R3
; i end address is: 12 (R3)
L_septalaVF180:
; i start address is: 12 (R3)
CMP	R3, #6
IT	GT
BGT	L_septalaVF181
;parameter_septal.h,183 :: 		ti[i] = ti[i] * (pi / 180.0); // konversi ke radian
LSLS	R1, R3, #2
MOVW	R0, #lo_addr(_ti+0)
MOVT	R0, #hi_addr(_ti+0)
ADDS	R2, R0, R1
VLDR	#1, S1, [R2, #0]
MOVW	R0, #64053
MOVT	R0, #15502
VMOV	S0, R0
VMUL.F32	S0, S1, S0
VSTR	#1, S0, [R2, #0]
;parameter_septal.h,181 :: 		for (i = 1; i <= 6; i++)
ADDS	R3, R3, #1
SXTH	R3, R3
;parameter_septal.h,184 :: 		}
; i end address is: 12 (R3)
IT	AL
BAL	L_septalaVF180
L_septalaVF181:
;parameter_septal.h,185 :: 		}
L_end_septalaVF:
LDR	LR, [SP, #0]
ADD	SP, SP, #8
BX	LR
; end of _septalaVF
_septalV1:
;parameter_septal.h,187 :: 		void septalV1()
SUB	SP, SP, #8
STR	LR, [SP, #0]
;parameter_septal.h,190 :: 		modFactor = sqrt((float)hmean / 60.0);
MOVW	R0, #lo_addr(_hmean+0)
MOVT	R0, #hi_addr(_hmean+0)
VLDR	#1, S1, [R0, #0]
MOVW	R0, #0
MOVT	R0, #17008
VMOV	S0, R0
VDIV.F32	S0, S1, S0
BL	_sqrt+0
MOVW	R0, #lo_addr(_modFactor+0)
MOVT	R0, #hi_addr(_modFactor+0)
VSTR	#1, S0, [R0, #0]
;parameter_septal.h,192 :: 		ti[1] = -60 * sqrt(modFactor);
VMOV.F32	S0, S0
BL	_sqrt+0
MOVW	R0, #0
MOVT	R0, #49776
VMOV	S1, R0
VMUL.F32	S0, S1, S0
MOVW	R0, #lo_addr(_ti+4)
MOVT	R0, #hi_addr(_ti+4)
VSTR	#1, S0, [R0, #0]
;parameter_septal.h,193 :: 		ai[1] = 0.8 * 18;
MOVW	R0, #26215
MOVT	R0, #16742
VMOV	S0, R0
MOVW	R0, #lo_addr(_ai+4)
MOVT	R0, #hi_addr(_ai+4)
VSTR	#1, S0, [R0, #0]
;parameter_septal.h,194 :: 		bi[1] = 0.2 * modFactor;
MOVW	R1, #lo_addr(_modFactor+0)
MOVT	R1, #hi_addr(_modFactor+0)
VLDR	#1, S1, [R1, #0]
MOVW	R0, #52429
MOVT	R0, #15948
VMOV	S0, R0
VMUL.F32	S0, S0, S1
MOVW	R0, #lo_addr(_bi+4)
MOVT	R0, #hi_addr(_bi+4)
VSTR	#1, S0, [R0, #0]
;parameter_septal.h,195 :: 		ti[2] = -15 * modFactor;
MOV	R0, R1
VLDR	#1, S1, [R0, #0]
VMOV.F32	S0, #-15
VMUL.F32	S0, S0, S1
MOVW	R0, #lo_addr(_ti+8)
MOVT	R0, #hi_addr(_ti+8)
VSTR	#1, S0, [R0, #0]
;parameter_septal.h,196 :: 		ai[2] = -1 * 18;
VMOV.F32	S0, #-18
MOVW	R0, #lo_addr(_ai+8)
MOVT	R0, #hi_addr(_ai+8)
VSTR	#1, S0, [R0, #0]
;parameter_septal.h,197 :: 		bi[2] = 0.1 * modFactor;
MOV	R0, R1
VLDR	#1, S1, [R0, #0]
MOVW	R0, #52429
MOVT	R0, #15820
VMOV	S0, R0
VMUL.F32	S0, S0, S1
MOVW	R0, #lo_addr(_bi+8)
MOVT	R0, #hi_addr(_bi+8)
VSTR	#1, S0, [R0, #0]
;parameter_septal.h,198 :: 		ti[3] = 0;
MOV	R0, #0
VMOV	S0, R0
MOVW	R0, #lo_addr(_ti+12)
MOVT	R0, #hi_addr(_ti+12)
VSTR	#1, S0, [R0, #0]
;parameter_septal.h,199 :: 		ai[3] = -37.5 * 18;
MOVW	R0, #49152
MOVT	R0, #50216
VMOV	S0, R0
MOVW	R0, #lo_addr(_ai+12)
MOVT	R0, #hi_addr(_ai+12)
VSTR	#1, S0, [R0, #0]
;parameter_septal.h,200 :: 		bi[3] = 0.1 * modFactor;
MOV	R0, R1
VLDR	#1, S1, [R0, #0]
MOVW	R0, #52429
MOVT	R0, #15820
VMOV	S0, R0
VMUL.F32	S0, S0, S1
MOVW	R0, #lo_addr(_bi+12)
MOVT	R0, #hi_addr(_bi+12)
VSTR	#1, S0, [R0, #0]
;parameter_septal.h,201 :: 		ti[4] = 15 * modFactor;
MOV	R0, R1
VLDR	#1, S1, [R0, #0]
VMOV.F32	S0, #15
VMUL.F32	S0, S0, S1
MOVW	R0, #lo_addr(_ti+16)
MOVT	R0, #hi_addr(_ti+16)
VSTR	#1, S0, [R0, #0]
;parameter_septal.h,202 :: 		ai[4] = 1 * 18;
VMOV.F32	S0, #18
MOVW	R0, #lo_addr(_ai+16)
MOVT	R0, #hi_addr(_ai+16)
VSTR	#1, S0, [R0, #0]
;parameter_septal.h,203 :: 		bi[4] = 0.3 * modFactor;
MOV	R0, R1
VLDR	#1, S1, [R0, #0]
MOVW	R0, #39322
MOVT	R0, #16025
VMOV	S0, R0
VMUL.F32	S0, S0, S1
MOVW	R0, #lo_addr(_bi+16)
MOVT	R0, #hi_addr(_bi+16)
VSTR	#1, S0, [R0, #0]
;parameter_septal.h,204 :: 		ti[5] = 67 * sqrt(modFactor);
MOV	R0, R1
VLDR	#1, S0, [R0, #0]
BL	_sqrt+0
MOVW	R0, #0
MOVT	R0, #17030
VMOV	S1, R0
VMUL.F32	S0, S1, S0
MOVW	R0, #lo_addr(_ti+20)
MOVT	R0, #hi_addr(_ti+20)
VSTR	#1, S0, [R0, #0]
;parameter_septal.h,205 :: 		ai[5] = 1.02 * ((modFactor * modFactor)*sqrt(modFactor)) * 18;
MOVW	R1, #lo_addr(_modFactor+0)
MOVT	R1, #hi_addr(_modFactor+0)
VLDR	#1, S1, [R1, #0]
MOV	R0, R1
VLDR	#1, S0, [R0, #0]
VMUL.F32	S0, S0, S1
VSTR	#1, S0, [SP, #4]
MOV	R0, R1
VLDR	#1, S0, [R0, #0]
BL	_sqrt+0
VLDR	#1, S1, [SP, #4]
VMUL.F32	S1, S1, S0
MOVW	R0, #36700
MOVT	R0, #16258
VMOV	S0, R0
VMUL.F32	S1, S0, S1
VMOV.F32	S0, #18
VMUL.F32	S0, S1, S0
MOVW	R0, #lo_addr(_ai+20)
MOVT	R0, #hi_addr(_ai+20)
VSTR	#1, S0, [R0, #0]
;parameter_septal.h,206 :: 		bi[5] = 0.4 / modFactor;
MOVW	R1, #lo_addr(_modFactor+0)
MOVT	R1, #hi_addr(_modFactor+0)
VLDR	#1, S1, [R1, #0]
MOVW	R0, #52429
MOVT	R0, #16076
VMOV	S0, R0
VDIV.F32	S0, S0, S1
MOVW	R0, #lo_addr(_bi+20)
MOVT	R0, #hi_addr(_bi+20)
VSTR	#1, S0, [R0, #0]
;parameter_septal.h,207 :: 		ti[6] = 70 * sqrt(modFactor);
MOV	R0, R1
VLDR	#1, S0, [R0, #0]
BL	_sqrt+0
MOVW	R0, #0
MOVT	R0, #17036
VMOV	S1, R0
VMUL.F32	S0, S1, S0
MOVW	R0, #lo_addr(_ti+24)
MOVT	R0, #hi_addr(_ti+24)
VSTR	#1, S0, [R0, #0]
;parameter_septal.h,208 :: 		ai[6] = 1.5 *((modFactor * modFactor)*sqrt(modFactor)) * 18;
MOVW	R1, #lo_addr(_modFactor+0)
MOVT	R1, #hi_addr(_modFactor+0)
VLDR	#1, S1, [R1, #0]
MOV	R0, R1
VLDR	#1, S0, [R0, #0]
VMUL.F32	S0, S0, S1
VSTR	#1, S0, [SP, #4]
MOV	R0, R1
VLDR	#1, S0, [R0, #0]
BL	_sqrt+0
VLDR	#1, S1, [SP, #4]
VMUL.F32	S1, S1, S0
VMOV.F32	S0, #1.5
VMUL.F32	S1, S0, S1
VMOV.F32	S0, #18
VMUL.F32	S0, S1, S0
MOVW	R0, #lo_addr(_ai+24)
MOVT	R0, #hi_addr(_ai+24)
VSTR	#1, S0, [R0, #0]
;parameter_septal.h,209 :: 		bi[6] = 0.2 * modFactor;
MOVW	R0, #lo_addr(_modFactor+0)
MOVT	R0, #hi_addr(_modFactor+0)
VLDR	#1, S1, [R0, #0]
MOVW	R0, #52429
MOVT	R0, #15948
VMOV	S0, R0
VMUL.F32	S0, S0, S1
MOVW	R0, #lo_addr(_bi+24)
MOVT	R0, #hi_addr(_bi+24)
VSTR	#1, S0, [R0, #0]
;parameter_septal.h,212 :: 		for (i = 1; i <= 6; i++)
; i start address is: 12 (R3)
MOVS	R3, #1
SXTH	R3, R3
; i end address is: 12 (R3)
L_septalV1183:
; i start address is: 12 (R3)
CMP	R3, #6
IT	GT
BGT	L_septalV1184
;parameter_septal.h,214 :: 		ti[i] = ti[i] * (pi / 180.0); // konversi ke radian
LSLS	R1, R3, #2
MOVW	R0, #lo_addr(_ti+0)
MOVT	R0, #hi_addr(_ti+0)
ADDS	R2, R0, R1
VLDR	#1, S1, [R2, #0]
MOVW	R0, #64053
MOVT	R0, #15502
VMOV	S0, R0
VMUL.F32	S0, S1, S0
VSTR	#1, S0, [R2, #0]
;parameter_septal.h,212 :: 		for (i = 1; i <= 6; i++)
ADDS	R3, R3, #1
SXTH	R3, R3
;parameter_septal.h,215 :: 		}
; i end address is: 12 (R3)
IT	AL
BAL	L_septalV1183
L_septalV1184:
;parameter_septal.h,216 :: 		}
L_end_septalV1:
LDR	LR, [SP, #0]
ADD	SP, SP, #8
BX	LR
; end of _septalV1
_septalV2:
;parameter_septal.h,218 :: 		void septalV2()
SUB	SP, SP, #8
STR	LR, [SP, #0]
;parameter_septal.h,221 :: 		modFactor = sqrt((float)hmean / 60.0);
MOVW	R0, #lo_addr(_hmean+0)
MOVT	R0, #hi_addr(_hmean+0)
VLDR	#1, S1, [R0, #0]
MOVW	R0, #0
MOVT	R0, #17008
VMOV	S0, R0
VDIV.F32	S0, S1, S0
BL	_sqrt+0
MOVW	R0, #lo_addr(_modFactor+0)
MOVT	R0, #hi_addr(_modFactor+0)
VSTR	#1, S0, [R0, #0]
;parameter_septal.h,223 :: 		ti[1] = -60 * sqrt(modFactor);
VMOV.F32	S0, S0
BL	_sqrt+0
MOVW	R0, #0
MOVT	R0, #49776
VMOV	S1, R0
VMUL.F32	S0, S1, S0
MOVW	R0, #lo_addr(_ti+4)
MOVT	R0, #hi_addr(_ti+4)
VSTR	#1, S0, [R0, #0]
;parameter_septal.h,224 :: 		ai[1] = 0.8 * 18;
MOVW	R0, #26215
MOVT	R0, #16742
VMOV	S0, R0
MOVW	R0, #lo_addr(_ai+4)
MOVT	R0, #hi_addr(_ai+4)
VSTR	#1, S0, [R0, #0]
;parameter_septal.h,225 :: 		bi[1] = 0.2 * modFactor;
MOVW	R1, #lo_addr(_modFactor+0)
MOVT	R1, #hi_addr(_modFactor+0)
VLDR	#1, S1, [R1, #0]
MOVW	R0, #52429
MOVT	R0, #15948
VMOV	S0, R0
VMUL.F32	S0, S0, S1
MOVW	R0, #lo_addr(_bi+4)
MOVT	R0, #hi_addr(_bi+4)
VSTR	#1, S0, [R0, #0]
;parameter_septal.h,226 :: 		ti[2] = -15 * modFactor;
MOV	R0, R1
VLDR	#1, S1, [R0, #0]
VMOV.F32	S0, #-15
VMUL.F32	S0, S0, S1
MOVW	R0, #lo_addr(_ti+8)
MOVT	R0, #hi_addr(_ti+8)
VSTR	#1, S0, [R0, #0]
;parameter_septal.h,227 :: 		ai[2] = 0.5 * 18;
VMOV.F32	S0, #9
MOVW	R0, #lo_addr(_ai+8)
MOVT	R0, #hi_addr(_ai+8)
VSTR	#1, S0, [R0, #0]
;parameter_septal.h,228 :: 		bi[2] = 0.1 * modFactor;
MOV	R0, R1
VLDR	#1, S1, [R0, #0]
MOVW	R0, #52429
MOVT	R0, #15820
VMOV	S0, R0
VMUL.F32	S0, S0, S1
MOVW	R0, #lo_addr(_bi+8)
MOVT	R0, #hi_addr(_bi+8)
VSTR	#1, S0, [R0, #0]
;parameter_septal.h,229 :: 		ti[3] = 0;
MOV	R0, #0
VMOV	S0, R0
MOVW	R0, #lo_addr(_ti+12)
MOVT	R0, #hi_addr(_ti+12)
VSTR	#1, S0, [R0, #0]
;parameter_septal.h,230 :: 		ai[3] = -49.7 * 18;
MOVW	R0, #42599
MOVT	R0, #50271
VMOV	S0, R0
MOVW	R0, #lo_addr(_ai+12)
MOVT	R0, #hi_addr(_ai+12)
VSTR	#1, S0, [R0, #0]
;parameter_septal.h,231 :: 		bi[3] = 0.1 * modFactor;
MOV	R0, R1
VLDR	#1, S1, [R0, #0]
MOVW	R0, #52429
MOVT	R0, #15820
VMOV	S0, R0
VMUL.F32	S0, S0, S1
MOVW	R0, #lo_addr(_bi+12)
MOVT	R0, #hi_addr(_bi+12)
VSTR	#1, S0, [R0, #0]
;parameter_septal.h,232 :: 		ti[4] = 15 * modFactor;
MOV	R0, R1
VLDR	#1, S1, [R0, #0]
VMOV.F32	S0, #15
VMUL.F32	S0, S0, S1
MOVW	R0, #lo_addr(_ti+16)
MOVT	R0, #hi_addr(_ti+16)
VSTR	#1, S0, [R0, #0]
;parameter_septal.h,233 :: 		ai[4] = 1 * 18;
VMOV.F32	S0, #18
MOVW	R0, #lo_addr(_ai+16)
MOVT	R0, #hi_addr(_ai+16)
VSTR	#1, S0, [R0, #0]
;parameter_septal.h,234 :: 		bi[4] = 0.2 * modFactor;
MOV	R0, R1
VLDR	#1, S1, [R0, #0]
MOVW	R0, #52429
MOVT	R0, #15948
VMOV	S0, R0
VMUL.F32	S0, S0, S1
MOVW	R0, #lo_addr(_bi+16)
MOVT	R0, #hi_addr(_bi+16)
VSTR	#1, S0, [R0, #0]
;parameter_septal.h,235 :: 		ti[5] = 67 * sqrt(modFactor);
MOV	R0, R1
VLDR	#1, S0, [R0, #0]
BL	_sqrt+0
MOVW	R0, #0
MOVT	R0, #17030
VMOV	S1, R0
VMUL.F32	S0, S1, S0
MOVW	R0, #lo_addr(_ti+20)
MOVT	R0, #hi_addr(_ti+20)
VSTR	#1, S0, [R0, #0]
;parameter_septal.h,236 :: 		ai[5] = 1.5 * ((modFactor * modFactor)*sqrt(modFactor)) * 18;
MOVW	R1, #lo_addr(_modFactor+0)
MOVT	R1, #hi_addr(_modFactor+0)
VLDR	#1, S1, [R1, #0]
MOV	R0, R1
VLDR	#1, S0, [R0, #0]
VMUL.F32	S0, S0, S1
VSTR	#1, S0, [SP, #4]
MOV	R0, R1
VLDR	#1, S0, [R0, #0]
BL	_sqrt+0
VLDR	#1, S1, [SP, #4]
VMUL.F32	S1, S1, S0
VMOV.F32	S0, #1.5
VMUL.F32	S1, S0, S1
VMOV.F32	S0, #18
VMUL.F32	S0, S1, S0
MOVW	R0, #lo_addr(_ai+20)
MOVT	R0, #hi_addr(_ai+20)
VSTR	#1, S0, [R0, #0]
;parameter_septal.h,237 :: 		bi[5] = 0.4 / modFactor;
MOVW	R1, #lo_addr(_modFactor+0)
MOVT	R1, #hi_addr(_modFactor+0)
VLDR	#1, S1, [R1, #0]
MOVW	R0, #52429
MOVT	R0, #16076
VMOV	S0, R0
VDIV.F32	S0, S0, S1
MOVW	R0, #lo_addr(_bi+20)
MOVT	R0, #hi_addr(_bi+20)
VSTR	#1, S0, [R0, #0]
;parameter_septal.h,238 :: 		ti[6] = 70 * sqrt(modFactor);
MOV	R0, R1
VLDR	#1, S0, [R0, #0]
BL	_sqrt+0
MOVW	R0, #0
MOVT	R0, #17036
VMOV	S1, R0
VMUL.F32	S0, S1, S0
MOVW	R0, #lo_addr(_ti+24)
MOVT	R0, #hi_addr(_ti+24)
VSTR	#1, S0, [R0, #0]
;parameter_septal.h,239 :: 		ai[6] = 1.85 *((modFactor * modFactor)*sqrt(modFactor)) * 18;
MOVW	R1, #lo_addr(_modFactor+0)
MOVT	R1, #hi_addr(_modFactor+0)
VLDR	#1, S1, [R1, #0]
MOV	R0, R1
VLDR	#1, S0, [R0, #0]
VMUL.F32	S0, S0, S1
VSTR	#1, S0, [SP, #4]
MOV	R0, R1
VLDR	#1, S0, [R0, #0]
BL	_sqrt+0
VLDR	#1, S1, [SP, #4]
VMUL.F32	S1, S1, S0
MOVW	R0, #52429
MOVT	R0, #16364
VMOV	S0, R0
VMUL.F32	S1, S0, S1
VMOV.F32	S0, #18
VMUL.F32	S0, S1, S0
MOVW	R0, #lo_addr(_ai+24)
MOVT	R0, #hi_addr(_ai+24)
VSTR	#1, S0, [R0, #0]
;parameter_septal.h,240 :: 		bi[6] = 0.2 * modFactor;
MOVW	R0, #lo_addr(_modFactor+0)
MOVT	R0, #hi_addr(_modFactor+0)
VLDR	#1, S1, [R0, #0]
MOVW	R0, #52429
MOVT	R0, #15948
VMOV	S0, R0
VMUL.F32	S0, S0, S1
MOVW	R0, #lo_addr(_bi+24)
MOVT	R0, #hi_addr(_bi+24)
VSTR	#1, S0, [R0, #0]
;parameter_septal.h,243 :: 		for (i = 1; i <= 6; i++)
; i start address is: 12 (R3)
MOVS	R3, #1
SXTH	R3, R3
; i end address is: 12 (R3)
L_septalV2186:
; i start address is: 12 (R3)
CMP	R3, #6
IT	GT
BGT	L_septalV2187
;parameter_septal.h,245 :: 		ti[i] = ti[i] * (pi / 180.0); // konversi ke radian
LSLS	R1, R3, #2
MOVW	R0, #lo_addr(_ti+0)
MOVT	R0, #hi_addr(_ti+0)
ADDS	R2, R0, R1
VLDR	#1, S1, [R2, #0]
MOVW	R0, #64053
MOVT	R0, #15502
VMOV	S0, R0
VMUL.F32	S0, S1, S0
VSTR	#1, S0, [R2, #0]
;parameter_septal.h,243 :: 		for (i = 1; i <= 6; i++)
ADDS	R3, R3, #1
SXTH	R3, R3
;parameter_septal.h,246 :: 		}
; i end address is: 12 (R3)
IT	AL
BAL	L_septalV2186
L_septalV2187:
;parameter_septal.h,247 :: 		}
L_end_septalV2:
LDR	LR, [SP, #0]
ADD	SP, SP, #8
BX	LR
; end of _septalV2
_septalV3:
;parameter_septal.h,249 :: 		void septalV3()
SUB	SP, SP, #8
STR	LR, [SP, #0]
;parameter_septal.h,252 :: 		modFactor = sqrt((float)hmean / 60.0);
MOVW	R0, #lo_addr(_hmean+0)
MOVT	R0, #hi_addr(_hmean+0)
VLDR	#1, S1, [R0, #0]
MOVW	R0, #0
MOVT	R0, #17008
VMOV	S0, R0
VDIV.F32	S0, S1, S0
BL	_sqrt+0
MOVW	R0, #lo_addr(_modFactor+0)
MOVT	R0, #hi_addr(_modFactor+0)
VSTR	#1, S0, [R0, #0]
;parameter_septal.h,254 :: 		ti[1] = -60 * sqrt(modFactor);
VMOV.F32	S0, S0
BL	_sqrt+0
MOVW	R0, #0
MOVT	R0, #49776
VMOV	S1, R0
VMUL.F32	S0, S1, S0
MOVW	R0, #lo_addr(_ti+4)
MOVT	R0, #hi_addr(_ti+4)
VSTR	#1, S0, [R0, #0]
;parameter_septal.h,255 :: 		ai[1] = 0.8 * 18;
MOVW	R0, #26215
MOVT	R0, #16742
VMOV	S0, R0
MOVW	R0, #lo_addr(_ai+4)
MOVT	R0, #hi_addr(_ai+4)
VSTR	#1, S0, [R0, #0]
;parameter_septal.h,256 :: 		bi[1] = 0.2 * modFactor;
MOVW	R1, #lo_addr(_modFactor+0)
MOVT	R1, #hi_addr(_modFactor+0)
VLDR	#1, S1, [R1, #0]
MOVW	R0, #52429
MOVT	R0, #15948
VMOV	S0, R0
VMUL.F32	S0, S0, S1
MOVW	R0, #lo_addr(_bi+4)
MOVT	R0, #hi_addr(_bi+4)
VSTR	#1, S0, [R0, #0]
;parameter_septal.h,257 :: 		ti[2] = -15 * modFactor;
MOV	R0, R1
VLDR	#1, S1, [R0, #0]
VMOV.F32	S0, #-15
VMUL.F32	S0, S0, S1
MOVW	R0, #lo_addr(_ti+8)
MOVT	R0, #hi_addr(_ti+8)
VSTR	#1, S0, [R0, #0]
;parameter_septal.h,258 :: 		ai[2] = 18 * 18;
MOVW	R0, #0
MOVT	R0, #17314
VMOV	S0, R0
MOVW	R0, #lo_addr(_ai+8)
MOVT	R0, #hi_addr(_ai+8)
VSTR	#1, S0, [R0, #0]
;parameter_septal.h,259 :: 		bi[2] = 0.1 * modFactor;
MOV	R0, R1
VLDR	#1, S1, [R0, #0]
MOVW	R0, #52429
MOVT	R0, #15820
VMOV	S0, R0
VMUL.F32	S0, S0, S1
MOVW	R0, #lo_addr(_bi+8)
MOVT	R0, #hi_addr(_bi+8)
VSTR	#1, S0, [R0, #0]
;parameter_septal.h,260 :: 		ti[3] = 0;
MOV	R0, #0
VMOV	S0, R0
MOVW	R0, #lo_addr(_ti+12)
MOVT	R0, #hi_addr(_ti+12)
VSTR	#1, S0, [R0, #0]
;parameter_septal.h,261 :: 		ai[3] = -33.75 * 18;
MOVW	R0, #57344
MOVT	R0, #50199
VMOV	S0, R0
MOVW	R0, #lo_addr(_ai+12)
MOVT	R0, #hi_addr(_ai+12)
VSTR	#1, S0, [R0, #0]
;parameter_septal.h,262 :: 		bi[3] = 0.1 * modFactor;
MOV	R0, R1
VLDR	#1, S1, [R0, #0]
MOVW	R0, #52429
MOVT	R0, #15820
VMOV	S0, R0
VMUL.F32	S0, S0, S1
MOVW	R0, #lo_addr(_bi+12)
MOVT	R0, #hi_addr(_bi+12)
VSTR	#1, S0, [R0, #0]
;parameter_septal.h,263 :: 		ti[4] = 15 * modFactor;
MOV	R0, R1
VLDR	#1, S1, [R0, #0]
VMOV.F32	S0, #15
VMUL.F32	S0, S0, S1
MOVW	R0, #lo_addr(_ti+16)
MOVT	R0, #hi_addr(_ti+16)
VSTR	#1, S0, [R0, #0]
;parameter_septal.h,264 :: 		ai[4] = -1 * 18;
VMOV.F32	S0, #-18
MOVW	R0, #lo_addr(_ai+16)
MOVT	R0, #hi_addr(_ai+16)
VSTR	#1, S0, [R0, #0]
;parameter_septal.h,265 :: 		bi[4] = 0.1 * modFactor;
MOV	R0, R1
VLDR	#1, S1, [R0, #0]
MOVW	R0, #52429
MOVT	R0, #15820
VMOV	S0, R0
VMUL.F32	S0, S0, S1
MOVW	R0, #lo_addr(_bi+16)
MOVT	R0, #hi_addr(_bi+16)
VSTR	#1, S0, [R0, #0]
;parameter_septal.h,266 :: 		ti[5] = 97 * sqrt(modFactor);
MOV	R0, R1
VLDR	#1, S0, [R0, #0]
BL	_sqrt+0
MOVW	R0, #0
MOVT	R0, #17090
VMOV	S1, R0
VMUL.F32	S0, S1, S0
MOVW	R0, #lo_addr(_ti+20)
MOVT	R0, #hi_addr(_ti+20)
VSTR	#1, S0, [R0, #0]
;parameter_septal.h,267 :: 		ai[5] = 1 * ((modFactor * modFactor)*sqrt(modFactor)) * 18;
MOVW	R1, #lo_addr(_modFactor+0)
MOVT	R1, #hi_addr(_modFactor+0)
VLDR	#1, S1, [R1, #0]
MOV	R0, R1
VLDR	#1, S0, [R0, #0]
VMUL.F32	S0, S0, S1
VSTR	#1, S0, [SP, #4]
MOV	R0, R1
VLDR	#1, S0, [R0, #0]
BL	_sqrt+0
VLDR	#1, S1, [SP, #4]
VMUL.F32	S1, S1, S0
VMOV.F32	S0, #18
VMUL.F32	S0, S1, S0
MOVW	R0, #lo_addr(_ai+20)
MOVT	R0, #hi_addr(_ai+20)
VSTR	#1, S0, [R0, #0]
;parameter_septal.h,268 :: 		bi[5] = 0.4 / modFactor;
MOVW	R1, #lo_addr(_modFactor+0)
MOVT	R1, #hi_addr(_modFactor+0)
VLDR	#1, S1, [R1, #0]
MOVW	R0, #52429
MOVT	R0, #16076
VMOV	S0, R0
VDIV.F32	S0, S0, S1
MOVW	R0, #lo_addr(_bi+20)
MOVT	R0, #hi_addr(_bi+20)
VSTR	#1, S0, [R0, #0]
;parameter_septal.h,269 :: 		ti[6] = 100 * sqrt(modFactor);
MOV	R0, R1
VLDR	#1, S0, [R0, #0]
BL	_sqrt+0
MOVW	R0, #0
MOVT	R0, #17096
VMOV	S1, R0
VMUL.F32	S0, S1, S0
MOVW	R0, #lo_addr(_ti+24)
MOVT	R0, #hi_addr(_ti+24)
VSTR	#1, S0, [R0, #0]
;parameter_septal.h,270 :: 		ai[6] = 2 *((modFactor * modFactor)*sqrt(modFactor)) * 18;
MOVW	R1, #lo_addr(_modFactor+0)
MOVT	R1, #hi_addr(_modFactor+0)
VLDR	#1, S1, [R1, #0]
MOV	R0, R1
VLDR	#1, S0, [R0, #0]
VMUL.F32	S0, S0, S1
VSTR	#1, S0, [SP, #4]
MOV	R0, R1
VLDR	#1, S0, [R0, #0]
BL	_sqrt+0
VLDR	#1, S1, [SP, #4]
VMUL.F32	S1, S1, S0
VMOV.F32	S0, #2
VMUL.F32	S1, S0, S1
VMOV.F32	S0, #18
VMUL.F32	S0, S1, S0
MOVW	R0, #lo_addr(_ai+24)
MOVT	R0, #hi_addr(_ai+24)
VSTR	#1, S0, [R0, #0]
;parameter_septal.h,271 :: 		bi[6] = 0.2 * modFactor;
MOVW	R0, #lo_addr(_modFactor+0)
MOVT	R0, #hi_addr(_modFactor+0)
VLDR	#1, S1, [R0, #0]
MOVW	R0, #52429
MOVT	R0, #15948
VMOV	S0, R0
VMUL.F32	S0, S0, S1
MOVW	R0, #lo_addr(_bi+24)
MOVT	R0, #hi_addr(_bi+24)
VSTR	#1, S0, [R0, #0]
;parameter_septal.h,274 :: 		for (i = 1; i <= 6; i++)
; i start address is: 12 (R3)
MOVS	R3, #1
SXTH	R3, R3
; i end address is: 12 (R3)
L_septalV3189:
; i start address is: 12 (R3)
CMP	R3, #6
IT	GT
BGT	L_septalV3190
;parameter_septal.h,276 :: 		ti[i] = ti[i] * (pi / 180.0); // konversi ke radian
LSLS	R1, R3, #2
MOVW	R0, #lo_addr(_ti+0)
MOVT	R0, #hi_addr(_ti+0)
ADDS	R2, R0, R1
VLDR	#1, S1, [R2, #0]
MOVW	R0, #64053
MOVT	R0, #15502
VMOV	S0, R0
VMUL.F32	S0, S1, S0
VSTR	#1, S0, [R2, #0]
;parameter_septal.h,274 :: 		for (i = 1; i <= 6; i++)
ADDS	R3, R3, #1
SXTH	R3, R3
;parameter_septal.h,277 :: 		}
; i end address is: 12 (R3)
IT	AL
BAL	L_septalV3189
L_septalV3190:
;parameter_septal.h,278 :: 		}
L_end_septalV3:
LDR	LR, [SP, #0]
ADD	SP, SP, #8
BX	LR
; end of _septalV3
_septalV4:
;parameter_septal.h,280 :: 		void septalV4()
SUB	SP, SP, #8
STR	LR, [SP, #0]
;parameter_septal.h,283 :: 		modFactor = sqrt((float)hmean / 60.0);
MOVW	R0, #lo_addr(_hmean+0)
MOVT	R0, #hi_addr(_hmean+0)
VLDR	#1, S1, [R0, #0]
MOVW	R0, #0
MOVT	R0, #17008
VMOV	S0, R0
VDIV.F32	S0, S1, S0
BL	_sqrt+0
MOVW	R0, #lo_addr(_modFactor+0)
MOVT	R0, #hi_addr(_modFactor+0)
VSTR	#1, S0, [R0, #0]
;parameter_septal.h,285 :: 		ti[1] = -60 * sqrt(modFactor);
VMOV.F32	S0, S0
BL	_sqrt+0
MOVW	R0, #0
MOVT	R0, #49776
VMOV	S1, R0
VMUL.F32	S0, S1, S0
MOVW	R0, #lo_addr(_ti+4)
MOVT	R0, #hi_addr(_ti+4)
VSTR	#1, S0, [R0, #0]
;parameter_septal.h,286 :: 		ai[1] = 0.8 * 18;
MOVW	R0, #26215
MOVT	R0, #16742
VMOV	S0, R0
MOVW	R0, #lo_addr(_ai+4)
MOVT	R0, #hi_addr(_ai+4)
VSTR	#1, S0, [R0, #0]
;parameter_septal.h,287 :: 		bi[1] = 0.2 * modFactor;
MOVW	R1, #lo_addr(_modFactor+0)
MOVT	R1, #hi_addr(_modFactor+0)
VLDR	#1, S1, [R1, #0]
MOVW	R0, #52429
MOVT	R0, #15948
VMOV	S0, R0
VMUL.F32	S0, S0, S1
MOVW	R0, #lo_addr(_bi+4)
MOVT	R0, #hi_addr(_bi+4)
VSTR	#1, S0, [R0, #0]
;parameter_septal.h,288 :: 		ti[2] = -15 * modFactor;
MOV	R0, R1
VLDR	#1, S1, [R0, #0]
VMOV.F32	S0, #-15
VMUL.F32	S0, S0, S1
MOVW	R0, #lo_addr(_ti+8)
MOVT	R0, #hi_addr(_ti+8)
VSTR	#1, S0, [R0, #0]
;parameter_septal.h,289 :: 		ai[2] = 0.5 * 18;
VMOV.F32	S0, #9
MOVW	R0, #lo_addr(_ai+8)
MOVT	R0, #hi_addr(_ai+8)
VSTR	#1, S0, [R0, #0]
;parameter_septal.h,290 :: 		bi[2] = 0.1 * modFactor;
MOV	R0, R1
VLDR	#1, S1, [R0, #0]
MOVW	R0, #52429
MOVT	R0, #15820
VMOV	S0, R0
VMUL.F32	S0, S0, S1
MOVW	R0, #lo_addr(_bi+8)
MOVT	R0, #hi_addr(_bi+8)
VSTR	#1, S0, [R0, #0]
;parameter_septal.h,291 :: 		ti[3] = 0;
MOV	R0, #0
VMOV	S0, R0
MOVW	R0, #lo_addr(_ti+12)
MOVT	R0, #hi_addr(_ti+12)
VSTR	#1, S0, [R0, #0]
;parameter_septal.h,292 :: 		ai[3] = 45 * 18;
MOVW	R0, #32768
MOVT	R0, #17482
VMOV	S0, R0
MOVW	R0, #lo_addr(_ai+12)
MOVT	R0, #hi_addr(_ai+12)
VSTR	#1, S0, [R0, #0]
;parameter_septal.h,293 :: 		bi[3] = 0.1 * modFactor;
MOV	R0, R1
VLDR	#1, S1, [R0, #0]
MOVW	R0, #52429
MOVT	R0, #15820
VMOV	S0, R0
VMUL.F32	S0, S0, S1
MOVW	R0, #lo_addr(_bi+12)
MOVT	R0, #hi_addr(_bi+12)
VSTR	#1, S0, [R0, #0]
;parameter_septal.h,294 :: 		ti[4] = 15 * modFactor;
MOV	R0, R1
VLDR	#1, S1, [R0, #0]
VMOV.F32	S0, #15
VMUL.F32	S0, S0, S1
MOVW	R0, #lo_addr(_ti+16)
MOVT	R0, #hi_addr(_ti+16)
VSTR	#1, S0, [R0, #0]
;parameter_septal.h,295 :: 		ai[4] = -15 * 18;
MOVW	R0, #0
MOVT	R0, #50055
VMOV	S0, R0
MOVW	R0, #lo_addr(_ai+16)
MOVT	R0, #hi_addr(_ai+16)
VSTR	#1, S0, [R0, #0]
;parameter_septal.h,296 :: 		bi[4] = 0.1 * modFactor;
MOV	R0, R1
VLDR	#1, S1, [R0, #0]
MOVW	R0, #52429
MOVT	R0, #15820
VMOV	S0, R0
VMUL.F32	S0, S0, S1
MOVW	R0, #lo_addr(_bi+16)
MOVT	R0, #hi_addr(_bi+16)
VSTR	#1, S0, [R0, #0]
;parameter_septal.h,297 :: 		ti[5] = 97 * sqrt(modFactor);
MOV	R0, R1
VLDR	#1, S0, [R0, #0]
BL	_sqrt+0
MOVW	R0, #0
MOVT	R0, #17090
VMOV	S1, R0
VMUL.F32	S0, S1, S0
MOVW	R0, #lo_addr(_ti+20)
MOVT	R0, #hi_addr(_ti+20)
VSTR	#1, S0, [R0, #0]
;parameter_septal.h,298 :: 		ai[5] = 1 * ((modFactor * modFactor)*sqrt(modFactor)) * 18;
MOVW	R1, #lo_addr(_modFactor+0)
MOVT	R1, #hi_addr(_modFactor+0)
VLDR	#1, S1, [R1, #0]
MOV	R0, R1
VLDR	#1, S0, [R0, #0]
VMUL.F32	S0, S0, S1
VSTR	#1, S0, [SP, #4]
MOV	R0, R1
VLDR	#1, S0, [R0, #0]
BL	_sqrt+0
VLDR	#1, S1, [SP, #4]
VMUL.F32	S1, S1, S0
VMOV.F32	S0, #18
VMUL.F32	S0, S1, S0
MOVW	R0, #lo_addr(_ai+20)
MOVT	R0, #hi_addr(_ai+20)
VSTR	#1, S0, [R0, #0]
;parameter_septal.h,299 :: 		bi[5] = 0.4 / modFactor;
MOVW	R1, #lo_addr(_modFactor+0)
MOVT	R1, #hi_addr(_modFactor+0)
VLDR	#1, S1, [R1, #0]
MOVW	R0, #52429
MOVT	R0, #16076
VMOV	S0, R0
VDIV.F32	S0, S0, S1
MOVW	R0, #lo_addr(_bi+20)
MOVT	R0, #hi_addr(_bi+20)
VSTR	#1, S0, [R0, #0]
;parameter_septal.h,300 :: 		ti[6] = 100 * sqrt(modFactor);
MOV	R0, R1
VLDR	#1, S0, [R0, #0]
BL	_sqrt+0
MOVW	R0, #0
MOVT	R0, #17096
VMOV	S1, R0
VMUL.F32	S0, S1, S0
MOVW	R0, #lo_addr(_ti+24)
MOVT	R0, #hi_addr(_ti+24)
VSTR	#1, S0, [R0, #0]
;parameter_septal.h,301 :: 		ai[6] = 2 *((modFactor * modFactor)*sqrt(modFactor)) * 18;
MOVW	R1, #lo_addr(_modFactor+0)
MOVT	R1, #hi_addr(_modFactor+0)
VLDR	#1, S1, [R1, #0]
MOV	R0, R1
VLDR	#1, S0, [R0, #0]
VMUL.F32	S0, S0, S1
VSTR	#1, S0, [SP, #4]
MOV	R0, R1
VLDR	#1, S0, [R0, #0]
BL	_sqrt+0
VLDR	#1, S1, [SP, #4]
VMUL.F32	S1, S1, S0
VMOV.F32	S0, #2
VMUL.F32	S1, S0, S1
VMOV.F32	S0, #18
VMUL.F32	S0, S1, S0
MOVW	R0, #lo_addr(_ai+24)
MOVT	R0, #hi_addr(_ai+24)
VSTR	#1, S0, [R0, #0]
;parameter_septal.h,302 :: 		bi[6] = 0.2 * modFactor;
MOVW	R0, #lo_addr(_modFactor+0)
MOVT	R0, #hi_addr(_modFactor+0)
VLDR	#1, S1, [R0, #0]
MOVW	R0, #52429
MOVT	R0, #15948
VMOV	S0, R0
VMUL.F32	S0, S0, S1
MOVW	R0, #lo_addr(_bi+24)
MOVT	R0, #hi_addr(_bi+24)
VSTR	#1, S0, [R0, #0]
;parameter_septal.h,305 :: 		for (i = 1; i <= 6; i++)
; i start address is: 12 (R3)
MOVS	R3, #1
SXTH	R3, R3
; i end address is: 12 (R3)
L_septalV4192:
; i start address is: 12 (R3)
CMP	R3, #6
IT	GT
BGT	L_septalV4193
;parameter_septal.h,307 :: 		ti[i] = ti[i] * (pi / 180.0); // konversi ke radian
LSLS	R1, R3, #2
MOVW	R0, #lo_addr(_ti+0)
MOVT	R0, #hi_addr(_ti+0)
ADDS	R2, R0, R1
VLDR	#1, S1, [R2, #0]
MOVW	R0, #64053
MOVT	R0, #15502
VMOV	S0, R0
VMUL.F32	S0, S1, S0
VSTR	#1, S0, [R2, #0]
;parameter_septal.h,305 :: 		for (i = 1; i <= 6; i++)
ADDS	R3, R3, #1
SXTH	R3, R3
;parameter_septal.h,308 :: 		}
; i end address is: 12 (R3)
IT	AL
BAL	L_septalV4192
L_septalV4193:
;parameter_septal.h,309 :: 		}
L_end_septalV4:
LDR	LR, [SP, #0]
ADD	SP, SP, #8
BX	LR
; end of _septalV4
_septalV5:
;parameter_septal.h,311 :: 		void septalV5()
SUB	SP, SP, #8
STR	LR, [SP, #0]
;parameter_septal.h,314 :: 		modFactor = sqrt((float)hmean / 60.0);
MOVW	R0, #lo_addr(_hmean+0)
MOVT	R0, #hi_addr(_hmean+0)
VLDR	#1, S1, [R0, #0]
MOVW	R0, #0
MOVT	R0, #17008
VMOV	S0, R0
VDIV.F32	S0, S1, S0
BL	_sqrt+0
MOVW	R0, #lo_addr(_modFactor+0)
MOVT	R0, #hi_addr(_modFactor+0)
VSTR	#1, S0, [R0, #0]
;parameter_septal.h,316 :: 		ti[1] = -60 * sqrt(modFactor);
VMOV.F32	S0, S0
BL	_sqrt+0
MOVW	R0, #0
MOVT	R0, #49776
VMOV	S1, R0
VMUL.F32	S0, S1, S0
MOVW	R0, #lo_addr(_ti+4)
MOVT	R0, #hi_addr(_ti+4)
VSTR	#1, S0, [R0, #0]
;parameter_septal.h,317 :: 		ai[1] = 0.8 * 18;
MOVW	R0, #26215
MOVT	R0, #16742
VMOV	S0, R0
MOVW	R0, #lo_addr(_ai+4)
MOVT	R0, #hi_addr(_ai+4)
VSTR	#1, S0, [R0, #0]
;parameter_septal.h,318 :: 		bi[1] = 0.2 * modFactor;
MOVW	R1, #lo_addr(_modFactor+0)
MOVT	R1, #hi_addr(_modFactor+0)
VLDR	#1, S1, [R1, #0]
MOVW	R0, #52429
MOVT	R0, #15948
VMOV	S0, R0
VMUL.F32	S0, S0, S1
MOVW	R0, #lo_addr(_bi+4)
MOVT	R0, #hi_addr(_bi+4)
VSTR	#1, S0, [R0, #0]
;parameter_septal.h,319 :: 		ti[2] = -15 * modFactor;
MOV	R0, R1
VLDR	#1, S1, [R0, #0]
VMOV.F32	S0, #-15
VMUL.F32	S0, S0, S1
MOVW	R0, #lo_addr(_ti+8)
MOVT	R0, #hi_addr(_ti+8)
VSTR	#1, S0, [R0, #0]
;parameter_septal.h,320 :: 		ai[2] = 0.5 * 18;
VMOV.F32	S0, #9
MOVW	R0, #lo_addr(_ai+8)
MOVT	R0, #hi_addr(_ai+8)
VSTR	#1, S0, [R0, #0]
;parameter_septal.h,321 :: 		bi[2] = 0.1 * modFactor;
MOV	R0, R1
VLDR	#1, S1, [R0, #0]
MOVW	R0, #52429
MOVT	R0, #15820
VMOV	S0, R0
VMUL.F32	S0, S0, S1
MOVW	R0, #lo_addr(_bi+8)
MOVT	R0, #hi_addr(_bi+8)
VSTR	#1, S0, [R0, #0]
;parameter_septal.h,322 :: 		ti[3] = 0;
MOV	R0, #0
VMOV	S0, R0
MOVW	R0, #lo_addr(_ti+12)
MOVT	R0, #hi_addr(_ti+12)
VSTR	#1, S0, [R0, #0]
;parameter_septal.h,323 :: 		ai[3] = 48.75 * 18;
MOVW	R0, #24576
MOVT	R0, #17499
VMOV	S0, R0
MOVW	R0, #lo_addr(_ai+12)
MOVT	R0, #hi_addr(_ai+12)
VSTR	#1, S0, [R0, #0]
;parameter_septal.h,324 :: 		bi[3] = 0.1 * modFactor;
MOV	R0, R1
VLDR	#1, S1, [R0, #0]
MOVW	R0, #52429
MOVT	R0, #15820
VMOV	S0, R0
VMUL.F32	S0, S0, S1
MOVW	R0, #lo_addr(_bi+12)
MOVT	R0, #hi_addr(_bi+12)
VSTR	#1, S0, [R0, #0]
;parameter_septal.h,325 :: 		ti[4] = 15 * modFactor;
MOV	R0, R1
VLDR	#1, S1, [R0, #0]
VMOV.F32	S0, #15
VMUL.F32	S0, S0, S1
MOVW	R0, #lo_addr(_ti+16)
MOVT	R0, #hi_addr(_ti+16)
VSTR	#1, S0, [R0, #0]
;parameter_septal.h,326 :: 		ai[4] = -5 * 18;
MOVW	R0, #0
MOVT	R0, #49844
VMOV	S0, R0
MOVW	R0, #lo_addr(_ai+16)
MOVT	R0, #hi_addr(_ai+16)
VSTR	#1, S0, [R0, #0]
;parameter_septal.h,327 :: 		bi[4] = 0.1 * modFactor;
MOV	R0, R1
VLDR	#1, S1, [R0, #0]
MOVW	R0, #52429
MOVT	R0, #15820
VMOV	S0, R0
VMUL.F32	S0, S0, S1
MOVW	R0, #lo_addr(_bi+16)
MOVT	R0, #hi_addr(_bi+16)
VSTR	#1, S0, [R0, #0]
;parameter_septal.h,328 :: 		ti[5] = 97 * sqrt(modFactor);
MOV	R0, R1
VLDR	#1, S0, [R0, #0]
BL	_sqrt+0
MOVW	R0, #0
MOVT	R0, #17090
VMOV	S1, R0
VMUL.F32	S0, S1, S0
MOVW	R0, #lo_addr(_ti+20)
MOVT	R0, #hi_addr(_ti+20)
VSTR	#1, S0, [R0, #0]
;parameter_septal.h,329 :: 		ai[5] = 1 * ((modFactor * modFactor)*sqrt(modFactor)) * 18;
MOVW	R1, #lo_addr(_modFactor+0)
MOVT	R1, #hi_addr(_modFactor+0)
VLDR	#1, S1, [R1, #0]
MOV	R0, R1
VLDR	#1, S0, [R0, #0]
VMUL.F32	S0, S0, S1
VSTR	#1, S0, [SP, #4]
MOV	R0, R1
VLDR	#1, S0, [R0, #0]
BL	_sqrt+0
VLDR	#1, S1, [SP, #4]
VMUL.F32	S1, S1, S0
VMOV.F32	S0, #18
VMUL.F32	S0, S1, S0
MOVW	R0, #lo_addr(_ai+20)
MOVT	R0, #hi_addr(_ai+20)
VSTR	#1, S0, [R0, #0]
;parameter_septal.h,330 :: 		bi[5] = 0.4 / modFactor;
MOVW	R1, #lo_addr(_modFactor+0)
MOVT	R1, #hi_addr(_modFactor+0)
VLDR	#1, S1, [R1, #0]
MOVW	R0, #52429
MOVT	R0, #16076
VMOV	S0, R0
VDIV.F32	S0, S0, S1
MOVW	R0, #lo_addr(_bi+20)
MOVT	R0, #hi_addr(_bi+20)
VSTR	#1, S0, [R0, #0]
;parameter_septal.h,331 :: 		ti[6] = 100 * sqrt(modFactor);
MOV	R0, R1
VLDR	#1, S0, [R0, #0]
BL	_sqrt+0
MOVW	R0, #0
MOVT	R0, #17096
VMOV	S1, R0
VMUL.F32	S0, S1, S0
MOVW	R0, #lo_addr(_ti+24)
MOVT	R0, #hi_addr(_ti+24)
VSTR	#1, S0, [R0, #0]
;parameter_septal.h,332 :: 		ai[6] = 1.5 *((modFactor * modFactor)*sqrt(modFactor)) * 18;
MOVW	R1, #lo_addr(_modFactor+0)
MOVT	R1, #hi_addr(_modFactor+0)
VLDR	#1, S1, [R1, #0]
MOV	R0, R1
VLDR	#1, S0, [R0, #0]
VMUL.F32	S0, S0, S1
VSTR	#1, S0, [SP, #4]
MOV	R0, R1
VLDR	#1, S0, [R0, #0]
BL	_sqrt+0
VLDR	#1, S1, [SP, #4]
VMUL.F32	S1, S1, S0
VMOV.F32	S0, #1.5
VMUL.F32	S1, S0, S1
VMOV.F32	S0, #18
VMUL.F32	S0, S1, S0
MOVW	R0, #lo_addr(_ai+24)
MOVT	R0, #hi_addr(_ai+24)
VSTR	#1, S0, [R0, #0]
;parameter_septal.h,333 :: 		bi[6] = 0.2 * modFactor;
MOVW	R0, #lo_addr(_modFactor+0)
MOVT	R0, #hi_addr(_modFactor+0)
VLDR	#1, S1, [R0, #0]
MOVW	R0, #52429
MOVT	R0, #15948
VMOV	S0, R0
VMUL.F32	S0, S0, S1
MOVW	R0, #lo_addr(_bi+24)
MOVT	R0, #hi_addr(_bi+24)
VSTR	#1, S0, [R0, #0]
;parameter_septal.h,336 :: 		for (i = 1; i <= 6; i++)
; i start address is: 12 (R3)
MOVS	R3, #1
SXTH	R3, R3
; i end address is: 12 (R3)
L_septalV5195:
; i start address is: 12 (R3)
CMP	R3, #6
IT	GT
BGT	L_septalV5196
;parameter_septal.h,338 :: 		ti[i] = ti[i] * (pi / 180.0); // konversi ke radian
LSLS	R1, R3, #2
MOVW	R0, #lo_addr(_ti+0)
MOVT	R0, #hi_addr(_ti+0)
ADDS	R2, R0, R1
VLDR	#1, S1, [R2, #0]
MOVW	R0, #64053
MOVT	R0, #15502
VMOV	S0, R0
VMUL.F32	S0, S1, S0
VSTR	#1, S0, [R2, #0]
;parameter_septal.h,336 :: 		for (i = 1; i <= 6; i++)
ADDS	R3, R3, #1
SXTH	R3, R3
;parameter_septal.h,339 :: 		}
; i end address is: 12 (R3)
IT	AL
BAL	L_septalV5195
L_septalV5196:
;parameter_septal.h,340 :: 		}
L_end_septalV5:
LDR	LR, [SP, #0]
ADD	SP, SP, #8
BX	LR
; end of _septalV5
_septalV6:
;parameter_septal.h,342 :: 		void septalV6()
SUB	SP, SP, #8
STR	LR, [SP, #0]
;parameter_septal.h,345 :: 		modFactor = sqrt((float)hmean / 60.0);
MOVW	R0, #lo_addr(_hmean+0)
MOVT	R0, #hi_addr(_hmean+0)
VLDR	#1, S1, [R0, #0]
MOVW	R0, #0
MOVT	R0, #17008
VMOV	S0, R0
VDIV.F32	S0, S1, S0
BL	_sqrt+0
MOVW	R0, #lo_addr(_modFactor+0)
MOVT	R0, #hi_addr(_modFactor+0)
VSTR	#1, S0, [R0, #0]
;parameter_septal.h,347 :: 		ti[1] = -60 * sqrt(modFactor);
VMOV.F32	S0, S0
BL	_sqrt+0
MOVW	R0, #0
MOVT	R0, #49776
VMOV	S1, R0
VMUL.F32	S0, S1, S0
MOVW	R0, #lo_addr(_ti+4)
MOVT	R0, #hi_addr(_ti+4)
VSTR	#1, S0, [R0, #0]
;parameter_septal.h,348 :: 		ai[1] = 0.8 * 18;
MOVW	R0, #26215
MOVT	R0, #16742
VMOV	S0, R0
MOVW	R0, #lo_addr(_ai+4)
MOVT	R0, #hi_addr(_ai+4)
VSTR	#1, S0, [R0, #0]
;parameter_septal.h,349 :: 		bi[1] = 0.2 * modFactor;
MOVW	R1, #lo_addr(_modFactor+0)
MOVT	R1, #hi_addr(_modFactor+0)
VLDR	#1, S1, [R1, #0]
MOVW	R0, #52429
MOVT	R0, #15948
VMOV	S0, R0
VMUL.F32	S0, S0, S1
MOVW	R0, #lo_addr(_bi+4)
MOVT	R0, #hi_addr(_bi+4)
VSTR	#1, S0, [R0, #0]
;parameter_septal.h,350 :: 		ti[2] = -15 * modFactor;
MOV	R0, R1
VLDR	#1, S1, [R0, #0]
VMOV.F32	S0, #-15
VMUL.F32	S0, S0, S1
MOVW	R0, #lo_addr(_ti+8)
MOVT	R0, #hi_addr(_ti+8)
VSTR	#1, S0, [R0, #0]
;parameter_septal.h,351 :: 		ai[2] = 0.5 * 18;
VMOV.F32	S0, #9
MOVW	R0, #lo_addr(_ai+8)
MOVT	R0, #hi_addr(_ai+8)
VSTR	#1, S0, [R0, #0]
;parameter_septal.h,352 :: 		bi[2] = 0.1 * modFactor;
MOV	R0, R1
VLDR	#1, S1, [R0, #0]
MOVW	R0, #52429
MOVT	R0, #15820
VMOV	S0, R0
VMUL.F32	S0, S0, S1
MOVW	R0, #lo_addr(_bi+8)
MOVT	R0, #hi_addr(_bi+8)
VSTR	#1, S0, [R0, #0]
;parameter_septal.h,353 :: 		ti[3] = 0;
MOV	R0, #0
VMOV	S0, R0
MOVW	R0, #lo_addr(_ti+12)
MOVT	R0, #hi_addr(_ti+12)
VSTR	#1, S0, [R0, #0]
;parameter_septal.h,354 :: 		ai[3] = 45 * 18;
MOVW	R0, #32768
MOVT	R0, #17482
VMOV	S0, R0
MOVW	R0, #lo_addr(_ai+12)
MOVT	R0, #hi_addr(_ai+12)
VSTR	#1, S0, [R0, #0]
;parameter_septal.h,355 :: 		bi[3] = 0.1 * modFactor;
MOV	R0, R1
VLDR	#1, S1, [R0, #0]
MOVW	R0, #52429
MOVT	R0, #15820
VMOV	S0, R0
VMUL.F32	S0, S0, S1
MOVW	R0, #lo_addr(_bi+12)
MOVT	R0, #hi_addr(_bi+12)
VSTR	#1, S0, [R0, #0]
;parameter_septal.h,356 :: 		ti[4] = 15 * modFactor;
MOV	R0, R1
VLDR	#1, S1, [R0, #0]
VMOV.F32	S0, #15
VMUL.F32	S0, S0, S1
MOVW	R0, #lo_addr(_ti+16)
MOVT	R0, #hi_addr(_ti+16)
VSTR	#1, S0, [R0, #0]
;parameter_septal.h,357 :: 		ai[4] = 0.5 * 18;
VMOV.F32	S0, #9
MOVW	R0, #lo_addr(_ai+16)
MOVT	R0, #hi_addr(_ai+16)
VSTR	#1, S0, [R0, #0]
;parameter_septal.h,358 :: 		bi[4] = 0.1 * modFactor;
MOV	R0, R1
VLDR	#1, S1, [R0, #0]
MOVW	R0, #52429
MOVT	R0, #15820
VMOV	S0, R0
VMUL.F32	S0, S0, S1
MOVW	R0, #lo_addr(_bi+16)
MOVT	R0, #hi_addr(_bi+16)
VSTR	#1, S0, [R0, #0]
;parameter_septal.h,359 :: 		ti[5] = 97 * sqrt(modFactor);
MOV	R0, R1
VLDR	#1, S0, [R0, #0]
BL	_sqrt+0
MOVW	R0, #0
MOVT	R0, #17090
VMOV	S1, R0
VMUL.F32	S0, S1, S0
MOVW	R0, #lo_addr(_ti+20)
MOVT	R0, #hi_addr(_ti+20)
VSTR	#1, S0, [R0, #0]
;parameter_septal.h,360 :: 		ai[5] = 0.8 * ((modFactor * modFactor)*sqrt(modFactor)) * 18;
MOVW	R1, #lo_addr(_modFactor+0)
MOVT	R1, #hi_addr(_modFactor+0)
VLDR	#1, S1, [R1, #0]
MOV	R0, R1
VLDR	#1, S0, [R0, #0]
VMUL.F32	S0, S0, S1
VSTR	#1, S0, [SP, #4]
MOV	R0, R1
VLDR	#1, S0, [R0, #0]
BL	_sqrt+0
VLDR	#1, S1, [SP, #4]
VMUL.F32	S1, S1, S0
MOVW	R0, #52429
MOVT	R0, #16204
VMOV	S0, R0
VMUL.F32	S1, S0, S1
VMOV.F32	S0, #18
VMUL.F32	S0, S1, S0
MOVW	R0, #lo_addr(_ai+20)
MOVT	R0, #hi_addr(_ai+20)
VSTR	#1, S0, [R0, #0]
;parameter_septal.h,361 :: 		bi[5] = 0.4 / modFactor;
MOVW	R1, #lo_addr(_modFactor+0)
MOVT	R1, #hi_addr(_modFactor+0)
VLDR	#1, S1, [R1, #0]
MOVW	R0, #52429
MOVT	R0, #16076
VMOV	S0, R0
VDIV.F32	S0, S0, S1
MOVW	R0, #lo_addr(_bi+20)
MOVT	R0, #hi_addr(_bi+20)
VSTR	#1, S0, [R0, #0]
;parameter_septal.h,362 :: 		ti[6] = 100 * sqrt(modFactor);
MOV	R0, R1
VLDR	#1, S0, [R0, #0]
BL	_sqrt+0
MOVW	R0, #0
MOVT	R0, #17096
VMOV	S1, R0
VMUL.F32	S0, S1, S0
MOVW	R0, #lo_addr(_ti+24)
MOVT	R0, #hi_addr(_ti+24)
VSTR	#1, S0, [R0, #0]
;parameter_septal.h,363 :: 		ai[6] = 0.9 *((modFactor * modFactor)*sqrt(modFactor)) * 18;
MOVW	R1, #lo_addr(_modFactor+0)
MOVT	R1, #hi_addr(_modFactor+0)
VLDR	#1, S1, [R1, #0]
MOV	R0, R1
VLDR	#1, S0, [R0, #0]
VMUL.F32	S0, S0, S1
VSTR	#1, S0, [SP, #4]
MOV	R0, R1
VLDR	#1, S0, [R0, #0]
BL	_sqrt+0
VLDR	#1, S1, [SP, #4]
VMUL.F32	S1, S1, S0
MOVW	R0, #26214
MOVT	R0, #16230
VMOV	S0, R0
VMUL.F32	S1, S0, S1
VMOV.F32	S0, #18
VMUL.F32	S0, S1, S0
MOVW	R0, #lo_addr(_ai+24)
MOVT	R0, #hi_addr(_ai+24)
VSTR	#1, S0, [R0, #0]
;parameter_septal.h,364 :: 		bi[6] = 0.2 * modFactor;
MOVW	R0, #lo_addr(_modFactor+0)
MOVT	R0, #hi_addr(_modFactor+0)
VLDR	#1, S1, [R0, #0]
MOVW	R0, #52429
MOVT	R0, #15948
VMOV	S0, R0
VMUL.F32	S0, S0, S1
MOVW	R0, #lo_addr(_bi+24)
MOVT	R0, #hi_addr(_bi+24)
VSTR	#1, S0, [R0, #0]
;parameter_septal.h,367 :: 		for (i = 1; i <= 6; i++)
; i start address is: 12 (R3)
MOVS	R3, #1
SXTH	R3, R3
; i end address is: 12 (R3)
L_septalV6198:
; i start address is: 12 (R3)
CMP	R3, #6
IT	GT
BGT	L_septalV6199
;parameter_septal.h,369 :: 		ti[i] = ti[i] * (pi / 180.0); // konversi ke radian
LSLS	R1, R3, #2
MOVW	R0, #lo_addr(_ti+0)
MOVT	R0, #hi_addr(_ti+0)
ADDS	R2, R0, R1
VLDR	#1, S1, [R2, #0]
MOVW	R0, #64053
MOVT	R0, #15502
VMOV	S0, R0
VMUL.F32	S0, S1, S0
VSTR	#1, S0, [R2, #0]
;parameter_septal.h,367 :: 		for (i = 1; i <= 6; i++)
ADDS	R3, R3, #1
SXTH	R3, R3
;parameter_septal.h,370 :: 		}
; i end address is: 12 (R3)
IT	AL
BAL	L_septalV6198
L_septalV6199:
;parameter_septal.h,371 :: 		}
L_end_septalV6:
LDR	LR, [SP, #0]
ADD	SP, SP, #8
BX	LR
; end of _septalV6
_posterior1:
;parameter_posterior.h,1 :: 		void posterior1()
SUB	SP, SP, #8
STR	LR, [SP, #0]
;parameter_posterior.h,4 :: 		modFactor = sqrt((float)hmean / 60.0);
MOVW	R0, #lo_addr(_hmean+0)
MOVT	R0, #hi_addr(_hmean+0)
VLDR	#1, S1, [R0, #0]
MOVW	R0, #0
MOVT	R0, #17008
VMOV	S0, R0
VDIV.F32	S0, S1, S0
BL	_sqrt+0
MOVW	R0, #lo_addr(_modFactor+0)
MOVT	R0, #hi_addr(_modFactor+0)
VSTR	#1, S0, [R0, #0]
;parameter_posterior.h,6 :: 		ti[1] = -60 * sqrt(modFactor);
VMOV.F32	S0, S0
BL	_sqrt+0
MOVW	R0, #0
MOVT	R0, #49776
VMOV	S1, R0
VMUL.F32	S0, S1, S0
MOVW	R0, #lo_addr(_ti+4)
MOVT	R0, #hi_addr(_ti+4)
VSTR	#1, S0, [R0, #0]
;parameter_posterior.h,7 :: 		ai[1] = 0.8 * 18;
MOVW	R0, #26215
MOVT	R0, #16742
VMOV	S0, R0
MOVW	R0, #lo_addr(_ai+4)
MOVT	R0, #hi_addr(_ai+4)
VSTR	#1, S0, [R0, #0]
;parameter_posterior.h,8 :: 		bi[1] = 0.2 * modFactor;
MOVW	R1, #lo_addr(_modFactor+0)
MOVT	R1, #hi_addr(_modFactor+0)
VLDR	#1, S1, [R1, #0]
MOVW	R0, #52429
MOVT	R0, #15948
VMOV	S0, R0
VMUL.F32	S0, S0, S1
MOVW	R0, #lo_addr(_bi+4)
MOVT	R0, #hi_addr(_bi+4)
VSTR	#1, S0, [R0, #0]
;parameter_posterior.h,9 :: 		ti[2] = -15 * modFactor;
MOV	R0, R1
VLDR	#1, S1, [R0, #0]
VMOV.F32	S0, #-15
VMUL.F32	S0, S0, S1
MOVW	R0, #lo_addr(_ti+8)
MOVT	R0, #hi_addr(_ti+8)
VSTR	#1, S0, [R0, #0]
;parameter_posterior.h,10 :: 		ai[2] = -5 * 18;
MOVW	R0, #0
MOVT	R0, #49844
VMOV	S0, R0
MOVW	R0, #lo_addr(_ai+8)
MOVT	R0, #hi_addr(_ai+8)
VSTR	#1, S0, [R0, #0]
;parameter_posterior.h,11 :: 		bi[2] = 0.1 * modFactor;
MOV	R0, R1
VLDR	#1, S1, [R0, #0]
MOVW	R0, #52429
MOVT	R0, #15820
VMOV	S0, R0
VMUL.F32	S0, S0, S1
MOVW	R0, #lo_addr(_bi+8)
MOVT	R0, #hi_addr(_bi+8)
VSTR	#1, S0, [R0, #0]
;parameter_posterior.h,12 :: 		ti[3] = 0;
MOV	R0, #0
VMOV	S0, R0
MOVW	R0, #lo_addr(_ti+12)
MOVT	R0, #hi_addr(_ti+12)
VSTR	#1, S0, [R0, #0]
;parameter_posterior.h,13 :: 		ai[3] = 33 * 18;
MOVW	R0, #32768
MOVT	R0, #17428
VMOV	S0, R0
MOVW	R0, #lo_addr(_ai+12)
MOVT	R0, #hi_addr(_ai+12)
VSTR	#1, S0, [R0, #0]
;parameter_posterior.h,14 :: 		bi[3] = 0.1 * modFactor;
MOV	R0, R1
VLDR	#1, S1, [R0, #0]
MOVW	R0, #52429
MOVT	R0, #15820
VMOV	S0, R0
VMUL.F32	S0, S0, S1
MOVW	R0, #lo_addr(_bi+12)
MOVT	R0, #hi_addr(_bi+12)
VSTR	#1, S0, [R0, #0]
;parameter_posterior.h,15 :: 		ti[4] = 15 * modFactor;
MOV	R0, R1
VLDR	#1, S1, [R0, #0]
VMOV.F32	S0, #15
VMUL.F32	S0, S0, S1
MOVW	R0, #lo_addr(_ti+16)
MOVT	R0, #hi_addr(_ti+16)
VSTR	#1, S0, [R0, #0]
;parameter_posterior.h,16 :: 		ai[4] = 0.5 * 18;
VMOV.F32	S0, #9
MOVW	R0, #lo_addr(_ai+16)
MOVT	R0, #hi_addr(_ai+16)
VSTR	#1, S0, [R0, #0]
;parameter_posterior.h,17 :: 		bi[4] = 0.1 * modFactor;
MOV	R0, R1
VLDR	#1, S1, [R0, #0]
MOVW	R0, #52429
MOVT	R0, #15820
VMOV	S0, R0
VMUL.F32	S0, S0, S1
MOVW	R0, #lo_addr(_bi+16)
MOVT	R0, #hi_addr(_bi+16)
VSTR	#1, S0, [R0, #0]
;parameter_posterior.h,18 :: 		ti[5] = 97 * sqrt(modFactor);
MOV	R0, R1
VLDR	#1, S0, [R0, #0]
BL	_sqrt+0
MOVW	R0, #0
MOVT	R0, #17090
VMOV	S1, R0
VMUL.F32	S0, S1, S0
MOVW	R0, #lo_addr(_ti+20)
MOVT	R0, #hi_addr(_ti+20)
VSTR	#1, S0, [R0, #0]
;parameter_posterior.h,19 :: 		ai[5] = 0.4 * ((modFactor * modFactor)*sqrt(modFactor)) * 18;
MOVW	R1, #lo_addr(_modFactor+0)
MOVT	R1, #hi_addr(_modFactor+0)
VLDR	#1, S1, [R1, #0]
MOV	R0, R1
VLDR	#1, S0, [R0, #0]
VMUL.F32	S0, S0, S1
VSTR	#1, S0, [SP, #4]
MOV	R0, R1
VLDR	#1, S0, [R0, #0]
BL	_sqrt+0
VLDR	#1, S1, [SP, #4]
VMUL.F32	S1, S1, S0
MOVW	R0, #52429
MOVT	R0, #16076
VMOV	S0, R0
VMUL.F32	S1, S0, S1
VMOV.F32	S0, #18
VMUL.F32	S0, S1, S0
MOVW	R0, #lo_addr(_ai+20)
MOVT	R0, #hi_addr(_ai+20)
VSTR	#1, S0, [R0, #0]
;parameter_posterior.h,20 :: 		bi[5] = 0.4 / modFactor;
MOVW	R1, #lo_addr(_modFactor+0)
MOVT	R1, #hi_addr(_modFactor+0)
VLDR	#1, S1, [R1, #0]
MOVW	R0, #52429
MOVT	R0, #16076
VMOV	S0, R0
VDIV.F32	S0, S0, S1
MOVW	R0, #lo_addr(_bi+20)
MOVT	R0, #hi_addr(_bi+20)
VSTR	#1, S0, [R0, #0]
;parameter_posterior.h,21 :: 		ti[6] = 100 * sqrt(modFactor);
MOV	R0, R1
VLDR	#1, S0, [R0, #0]
BL	_sqrt+0
MOVW	R0, #0
MOVT	R0, #17096
VMOV	S1, R0
VMUL.F32	S0, S1, S0
MOVW	R0, #lo_addr(_ti+24)
MOVT	R0, #hi_addr(_ti+24)
VSTR	#1, S0, [R0, #0]
;parameter_posterior.h,22 :: 		ai[6] = 0.6 *((modFactor * modFactor)*sqrt(modFactor)) * 18;
MOVW	R1, #lo_addr(_modFactor+0)
MOVT	R1, #hi_addr(_modFactor+0)
VLDR	#1, S1, [R1, #0]
MOV	R0, R1
VLDR	#1, S0, [R0, #0]
VMUL.F32	S0, S0, S1
VSTR	#1, S0, [SP, #4]
MOV	R0, R1
VLDR	#1, S0, [R0, #0]
BL	_sqrt+0
VLDR	#1, S1, [SP, #4]
VMUL.F32	S1, S1, S0
MOVW	R0, #39322
MOVT	R0, #16153
VMOV	S0, R0
VMUL.F32	S1, S0, S1
VMOV.F32	S0, #18
VMUL.F32	S0, S1, S0
MOVW	R0, #lo_addr(_ai+24)
MOVT	R0, #hi_addr(_ai+24)
VSTR	#1, S0, [R0, #0]
;parameter_posterior.h,23 :: 		bi[6] = 0.2 * modFactor;
MOVW	R0, #lo_addr(_modFactor+0)
MOVT	R0, #hi_addr(_modFactor+0)
VLDR	#1, S1, [R0, #0]
MOVW	R0, #52429
MOVT	R0, #15948
VMOV	S0, R0
VMUL.F32	S0, S0, S1
MOVW	R0, #lo_addr(_bi+24)
MOVT	R0, #hi_addr(_bi+24)
VSTR	#1, S0, [R0, #0]
;parameter_posterior.h,26 :: 		for (i = 1; i <= 6; i++)
; i start address is: 12 (R3)
MOVS	R3, #1
SXTH	R3, R3
; i end address is: 12 (R3)
L_posterior1201:
; i start address is: 12 (R3)
CMP	R3, #6
IT	GT
BGT	L_posterior1202
;parameter_posterior.h,28 :: 		ti[i] = ti[i] * (pi / 180.0); // konversi ke radian
LSLS	R1, R3, #2
MOVW	R0, #lo_addr(_ti+0)
MOVT	R0, #hi_addr(_ti+0)
ADDS	R2, R0, R1
VLDR	#1, S1, [R2, #0]
MOVW	R0, #64053
MOVT	R0, #15502
VMOV	S0, R0
VMUL.F32	S0, S1, S0
VSTR	#1, S0, [R2, #0]
;parameter_posterior.h,26 :: 		for (i = 1; i <= 6; i++)
ADDS	R3, R3, #1
SXTH	R3, R3
;parameter_posterior.h,29 :: 		}
; i end address is: 12 (R3)
IT	AL
BAL	L_posterior1201
L_posterior1202:
;parameter_posterior.h,30 :: 		}
L_end_posterior1:
LDR	LR, [SP, #0]
ADD	SP, SP, #8
BX	LR
; end of _posterior1
_posterior2:
;parameter_posterior.h,32 :: 		void posterior2()
SUB	SP, SP, #8
STR	LR, [SP, #0]
;parameter_posterior.h,35 :: 		modFactor = sqrt((float)hmean / 60.0);
MOVW	R0, #lo_addr(_hmean+0)
MOVT	R0, #hi_addr(_hmean+0)
VLDR	#1, S1, [R0, #0]
MOVW	R0, #0
MOVT	R0, #17008
VMOV	S0, R0
VDIV.F32	S0, S1, S0
BL	_sqrt+0
MOVW	R0, #lo_addr(_modFactor+0)
MOVT	R0, #hi_addr(_modFactor+0)
VSTR	#1, S0, [R0, #0]
;parameter_posterior.h,37 :: 		ti[1] = -60 * sqrt(modFactor);
VMOV.F32	S0, S0
BL	_sqrt+0
MOVW	R0, #0
MOVT	R0, #49776
VMOV	S1, R0
VMUL.F32	S0, S1, S0
MOVW	R0, #lo_addr(_ti+4)
MOVT	R0, #hi_addr(_ti+4)
VSTR	#1, S0, [R0, #0]
;parameter_posterior.h,38 :: 		ai[1] = 0.8 * 18;
MOVW	R0, #26215
MOVT	R0, #16742
VMOV	S0, R0
MOVW	R0, #lo_addr(_ai+4)
MOVT	R0, #hi_addr(_ai+4)
VSTR	#1, S0, [R0, #0]
;parameter_posterior.h,39 :: 		bi[1] = 0.2 * modFactor;
MOVW	R1, #lo_addr(_modFactor+0)
MOVT	R1, #hi_addr(_modFactor+0)
VLDR	#1, S1, [R1, #0]
MOVW	R0, #52429
MOVT	R0, #15948
VMOV	S0, R0
VMUL.F32	S0, S0, S1
MOVW	R0, #lo_addr(_bi+4)
MOVT	R0, #hi_addr(_bi+4)
VSTR	#1, S0, [R0, #0]
;parameter_posterior.h,40 :: 		ti[2] = -15 * modFactor;
MOV	R0, R1
VLDR	#1, S1, [R0, #0]
VMOV.F32	S0, #-15
VMUL.F32	S0, S0, S1
MOVW	R0, #lo_addr(_ti+8)
MOVT	R0, #hi_addr(_ti+8)
VSTR	#1, S0, [R0, #0]
;parameter_posterior.h,41 :: 		ai[2] = 7 * 18;
MOVW	R0, #0
MOVT	R0, #17148
VMOV	S0, R0
MOVW	R0, #lo_addr(_ai+8)
MOVT	R0, #hi_addr(_ai+8)
VSTR	#1, S0, [R0, #0]
;parameter_posterior.h,42 :: 		bi[2] = 0.1 * modFactor;
MOV	R0, R1
VLDR	#1, S1, [R0, #0]
MOVW	R0, #52429
MOVT	R0, #15820
VMOV	S0, R0
VMUL.F32	S0, S0, S1
MOVW	R0, #lo_addr(_bi+8)
MOVT	R0, #hi_addr(_bi+8)
VSTR	#1, S0, [R0, #0]
;parameter_posterior.h,43 :: 		ti[3] = 0;
MOV	R0, #0
VMOV	S0, R0
MOVW	R0, #lo_addr(_ti+12)
MOVT	R0, #hi_addr(_ti+12)
VSTR	#1, S0, [R0, #0]
;parameter_posterior.h,44 :: 		ai[3] = -13.8 * 18;
MOVW	R0, #26215
MOVT	R0, #50040
VMOV	S0, R0
MOVW	R0, #lo_addr(_ai+12)
MOVT	R0, #hi_addr(_ai+12)
VSTR	#1, S0, [R0, #0]
;parameter_posterior.h,45 :: 		bi[3] = 0.1 * modFactor;
MOV	R0, R1
VLDR	#1, S1, [R0, #0]
MOVW	R0, #52429
MOVT	R0, #15820
VMOV	S0, R0
VMUL.F32	S0, S0, S1
MOVW	R0, #lo_addr(_bi+12)
MOVT	R0, #hi_addr(_bi+12)
VSTR	#1, S0, [R0, #0]
;parameter_posterior.h,46 :: 		ti[4] = 15 * modFactor;
MOV	R0, R1
VLDR	#1, S1, [R0, #0]
VMOV.F32	S0, #15
VMUL.F32	S0, S0, S1
MOVW	R0, #lo_addr(_ti+16)
MOVT	R0, #hi_addr(_ti+16)
VSTR	#1, S0, [R0, #0]
;parameter_posterior.h,47 :: 		ai[4] = -0.5 * 18;
VMOV.F32	S0, #-9
MOVW	R0, #lo_addr(_ai+16)
MOVT	R0, #hi_addr(_ai+16)
VSTR	#1, S0, [R0, #0]
;parameter_posterior.h,48 :: 		bi[4] = 0.1 * modFactor;
MOV	R0, R1
VLDR	#1, S1, [R0, #0]
MOVW	R0, #52429
MOVT	R0, #15820
VMOV	S0, R0
VMUL.F32	S0, S0, S1
MOVW	R0, #lo_addr(_bi+16)
MOVT	R0, #hi_addr(_bi+16)
VSTR	#1, S0, [R0, #0]
;parameter_posterior.h,49 :: 		ti[5] = 97 * sqrt(modFactor);
MOV	R0, R1
VLDR	#1, S0, [R0, #0]
BL	_sqrt+0
MOVW	R0, #0
MOVT	R0, #17090
VMOV	S1, R0
VMUL.F32	S0, S1, S0
MOVW	R0, #lo_addr(_ti+20)
MOVT	R0, #hi_addr(_ti+20)
VSTR	#1, S0, [R0, #0]
;parameter_posterior.h,50 :: 		ai[5] = 0.17 * ((modFactor * modFactor)*sqrt(modFactor)) * 18;
MOVW	R1, #lo_addr(_modFactor+0)
MOVT	R1, #hi_addr(_modFactor+0)
VLDR	#1, S1, [R1, #0]
MOV	R0, R1
VLDR	#1, S0, [R0, #0]
VMUL.F32	S0, S0, S1
VSTR	#1, S0, [SP, #4]
MOV	R0, R1
VLDR	#1, S0, [R0, #0]
BL	_sqrt+0
VLDR	#1, S1, [SP, #4]
VMUL.F32	S1, S1, S0
MOVW	R0, #5243
MOVT	R0, #15918
VMOV	S0, R0
VMUL.F32	S1, S0, S1
VMOV.F32	S0, #18
VMUL.F32	S0, S1, S0
MOVW	R0, #lo_addr(_ai+20)
MOVT	R0, #hi_addr(_ai+20)
VSTR	#1, S0, [R0, #0]
;parameter_posterior.h,51 :: 		bi[5] = 0.4 / modFactor;
MOVW	R1, #lo_addr(_modFactor+0)
MOVT	R1, #hi_addr(_modFactor+0)
VLDR	#1, S1, [R1, #0]
MOVW	R0, #52429
MOVT	R0, #16076
VMOV	S0, R0
VDIV.F32	S0, S0, S1
MOVW	R0, #lo_addr(_bi+20)
MOVT	R0, #hi_addr(_bi+20)
VSTR	#1, S0, [R0, #0]
;parameter_posterior.h,52 :: 		ti[6] = 100 * sqrt(modFactor);
MOV	R0, R1
VLDR	#1, S0, [R0, #0]
BL	_sqrt+0
MOVW	R0, #0
MOVT	R0, #17096
VMOV	S1, R0
VMUL.F32	S0, S1, S0
MOVW	R0, #lo_addr(_ti+24)
MOVT	R0, #hi_addr(_ti+24)
VSTR	#1, S0, [R0, #0]
;parameter_posterior.h,53 :: 		ai[6] = 0.25 *((modFactor * modFactor)*sqrt(modFactor)) * 18;
MOVW	R1, #lo_addr(_modFactor+0)
MOVT	R1, #hi_addr(_modFactor+0)
VLDR	#1, S1, [R1, #0]
MOV	R0, R1
VLDR	#1, S0, [R0, #0]
VMUL.F32	S0, S0, S1
VSTR	#1, S0, [SP, #4]
MOV	R0, R1
VLDR	#1, S0, [R0, #0]
BL	_sqrt+0
VLDR	#1, S1, [SP, #4]
VMUL.F32	S1, S1, S0
VMOV.F32	S0, #0.25
VMUL.F32	S1, S0, S1
VMOV.F32	S0, #18
VMUL.F32	S0, S1, S0
MOVW	R0, #lo_addr(_ai+24)
MOVT	R0, #hi_addr(_ai+24)
VSTR	#1, S0, [R0, #0]
;parameter_posterior.h,54 :: 		bi[6] = 0.2 * modFactor;
MOVW	R0, #lo_addr(_modFactor+0)
MOVT	R0, #hi_addr(_modFactor+0)
VLDR	#1, S1, [R0, #0]
MOVW	R0, #52429
MOVT	R0, #15948
VMOV	S0, R0
VMUL.F32	S0, S0, S1
MOVW	R0, #lo_addr(_bi+24)
MOVT	R0, #hi_addr(_bi+24)
VSTR	#1, S0, [R0, #0]
;parameter_posterior.h,57 :: 		for (i = 1; i <= 6; i++)
; i start address is: 12 (R3)
MOVS	R3, #1
SXTH	R3, R3
; i end address is: 12 (R3)
L_posterior2204:
; i start address is: 12 (R3)
CMP	R3, #6
IT	GT
BGT	L_posterior2205
;parameter_posterior.h,59 :: 		ti[i] = ti[i] * (pi / 180.0); // konversi ke radian
LSLS	R1, R3, #2
MOVW	R0, #lo_addr(_ti+0)
MOVT	R0, #hi_addr(_ti+0)
ADDS	R2, R0, R1
VLDR	#1, S1, [R2, #0]
MOVW	R0, #64053
MOVT	R0, #15502
VMOV	S0, R0
VMUL.F32	S0, S1, S0
VSTR	#1, S0, [R2, #0]
;parameter_posterior.h,57 :: 		for (i = 1; i <= 6; i++)
ADDS	R3, R3, #1
SXTH	R3, R3
;parameter_posterior.h,60 :: 		}
; i end address is: 12 (R3)
IT	AL
BAL	L_posterior2204
L_posterior2205:
;parameter_posterior.h,61 :: 		}
L_end_posterior2:
LDR	LR, [SP, #0]
ADD	SP, SP, #8
BX	LR
; end of _posterior2
_posterior3:
;parameter_posterior.h,63 :: 		void posterior3()
SUB	SP, SP, #8
STR	LR, [SP, #0]
;parameter_posterior.h,66 :: 		modFactor = sqrt((float)hmean / 60.0);
MOVW	R0, #lo_addr(_hmean+0)
MOVT	R0, #hi_addr(_hmean+0)
VLDR	#1, S1, [R0, #0]
MOVW	R0, #0
MOVT	R0, #17008
VMOV	S0, R0
VDIV.F32	S0, S1, S0
BL	_sqrt+0
MOVW	R0, #lo_addr(_modFactor+0)
MOVT	R0, #hi_addr(_modFactor+0)
VSTR	#1, S0, [R0, #0]
;parameter_posterior.h,68 :: 		ti[1] = -60 * sqrt(modFactor);
VMOV.F32	S0, S0
BL	_sqrt+0
MOVW	R0, #0
MOVT	R0, #49776
VMOV	S1, R0
VMUL.F32	S0, S1, S0
MOVW	R0, #lo_addr(_ti+4)
MOVT	R0, #hi_addr(_ti+4)
VSTR	#1, S0, [R0, #0]
;parameter_posterior.h,69 :: 		ai[1] = 1.2 * 18;
MOVW	R0, #52429
MOVT	R0, #16812
VMOV	S0, R0
MOVW	R0, #lo_addr(_ai+4)
MOVT	R0, #hi_addr(_ai+4)
VSTR	#1, S0, [R0, #0]
;parameter_posterior.h,70 :: 		bi[1] = 0.2 * modFactor;
MOVW	R1, #lo_addr(_modFactor+0)
MOVT	R1, #hi_addr(_modFactor+0)
VLDR	#1, S1, [R1, #0]
MOVW	R0, #52429
MOVT	R0, #15948
VMOV	S0, R0
VMUL.F32	S0, S0, S1
MOVW	R0, #lo_addr(_bi+4)
MOVT	R0, #hi_addr(_bi+4)
VSTR	#1, S0, [R0, #0]
;parameter_posterior.h,71 :: 		ti[2] = -15 * modFactor;
MOV	R0, R1
VLDR	#1, S1, [R0, #0]
VMOV.F32	S0, #-15
VMUL.F32	S0, S0, S1
MOVW	R0, #lo_addr(_ti+8)
MOVT	R0, #hi_addr(_ti+8)
VSTR	#1, S0, [R0, #0]
;parameter_posterior.h,72 :: 		ai[2] = 5 * 18;
MOVW	R0, #0
MOVT	R0, #17076
VMOV	S0, R0
MOVW	R0, #lo_addr(_ai+8)
MOVT	R0, #hi_addr(_ai+8)
VSTR	#1, S0, [R0, #0]
;parameter_posterior.h,73 :: 		bi[2] = 0.1 * modFactor;
MOV	R0, R1
VLDR	#1, S1, [R0, #0]
MOVW	R0, #52429
MOVT	R0, #15820
VMOV	S0, R0
VMUL.F32	S0, S0, S1
MOVW	R0, #lo_addr(_bi+8)
MOVT	R0, #hi_addr(_bi+8)
VSTR	#1, S0, [R0, #0]
;parameter_posterior.h,74 :: 		ti[3] = 0;
MOV	R0, #0
VMOV	S0, R0
MOVW	R0, #lo_addr(_ti+12)
MOVT	R0, #hi_addr(_ti+12)
VSTR	#1, S0, [R0, #0]
;parameter_posterior.h,75 :: 		ai[3] = -30 * 18;
MOVW	R0, #0
MOVT	R0, #50183
VMOV	S0, R0
MOVW	R0, #lo_addr(_ai+12)
MOVT	R0, #hi_addr(_ai+12)
VSTR	#1, S0, [R0, #0]
;parameter_posterior.h,76 :: 		bi[3] = 0.1 * modFactor;
MOV	R0, R1
VLDR	#1, S1, [R0, #0]
MOVW	R0, #52429
MOVT	R0, #15820
VMOV	S0, R0
VMUL.F32	S0, S0, S1
MOVW	R0, #lo_addr(_bi+12)
MOVT	R0, #hi_addr(_bi+12)
VSTR	#1, S0, [R0, #0]
;parameter_posterior.h,77 :: 		ti[4] = 15 * modFactor;
MOV	R0, R1
VLDR	#1, S1, [R0, #0]
VMOV.F32	S0, #15
VMUL.F32	S0, S0, S1
MOVW	R0, #lo_addr(_ti+16)
MOVT	R0, #hi_addr(_ti+16)
VSTR	#1, S0, [R0, #0]
;parameter_posterior.h,78 :: 		ai[4] = -0.5 * 18;
VMOV.F32	S0, #-9
MOVW	R0, #lo_addr(_ai+16)
MOVT	R0, #hi_addr(_ai+16)
VSTR	#1, S0, [R0, #0]
;parameter_posterior.h,79 :: 		bi[4] = 0.1 * modFactor;
MOV	R0, R1
VLDR	#1, S1, [R0, #0]
MOVW	R0, #52429
MOVT	R0, #15820
VMOV	S0, R0
VMUL.F32	S0, S0, S1
MOVW	R0, #lo_addr(_bi+16)
MOVT	R0, #hi_addr(_bi+16)
VSTR	#1, S0, [R0, #0]
;parameter_posterior.h,80 :: 		ti[5] = 97 * sqrt(modFactor);
MOV	R0, R1
VLDR	#1, S0, [R0, #0]
BL	_sqrt+0
MOVW	R0, #0
MOVT	R0, #17090
VMOV	S1, R0
VMUL.F32	S0, S1, S0
MOVW	R0, #lo_addr(_ti+20)
MOVT	R0, #hi_addr(_ti+20)
VSTR	#1, S0, [R0, #0]
;parameter_posterior.h,81 :: 		ai[5] = 0.23 * ((modFactor * modFactor)*sqrt(modFactor)) * 18;
MOVW	R1, #lo_addr(_modFactor+0)
MOVT	R1, #hi_addr(_modFactor+0)
VLDR	#1, S1, [R1, #0]
MOV	R0, R1
VLDR	#1, S0, [R0, #0]
VMUL.F32	S0, S0, S1
VSTR	#1, S0, [SP, #4]
MOV	R0, R1
VLDR	#1, S0, [R0, #0]
BL	_sqrt+0
VLDR	#1, S1, [SP, #4]
VMUL.F32	S1, S1, S0
MOVW	R0, #34079
MOVT	R0, #15979
VMOV	S0, R0
VMUL.F32	S1, S0, S1
VMOV.F32	S0, #18
VMUL.F32	S0, S1, S0
MOVW	R0, #lo_addr(_ai+20)
MOVT	R0, #hi_addr(_ai+20)
VSTR	#1, S0, [R0, #0]
;parameter_posterior.h,82 :: 		bi[5] = 0.4 / modFactor;
MOVW	R1, #lo_addr(_modFactor+0)
MOVT	R1, #hi_addr(_modFactor+0)
VLDR	#1, S1, [R1, #0]
MOVW	R0, #52429
MOVT	R0, #16076
VMOV	S0, R0
VDIV.F32	S0, S0, S1
MOVW	R0, #lo_addr(_bi+20)
MOVT	R0, #hi_addr(_bi+20)
VSTR	#1, S0, [R0, #0]
;parameter_posterior.h,83 :: 		ti[6] = 100 * sqrt(modFactor);
MOV	R0, R1
VLDR	#1, S0, [R0, #0]
BL	_sqrt+0
MOVW	R0, #0
MOVT	R0, #17096
VMOV	S1, R0
VMUL.F32	S0, S1, S0
MOVW	R0, #lo_addr(_ti+24)
MOVT	R0, #hi_addr(_ti+24)
VSTR	#1, S0, [R0, #0]
;parameter_posterior.h,84 :: 		ai[6] = 0.36 *((modFactor * modFactor)*sqrt(modFactor)) * 18;
MOVW	R1, #lo_addr(_modFactor+0)
MOVT	R1, #hi_addr(_modFactor+0)
VLDR	#1, S1, [R1, #0]
MOV	R0, R1
VLDR	#1, S0, [R0, #0]
VMUL.F32	S0, S0, S1
VSTR	#1, S0, [SP, #4]
MOV	R0, R1
VLDR	#1, S0, [R0, #0]
BL	_sqrt+0
VLDR	#1, S1, [SP, #4]
VMUL.F32	S1, S1, S0
MOVW	R0, #20972
MOVT	R0, #16056
VMOV	S0, R0
VMUL.F32	S1, S0, S1
VMOV.F32	S0, #18
VMUL.F32	S0, S1, S0
MOVW	R0, #lo_addr(_ai+24)
MOVT	R0, #hi_addr(_ai+24)
VSTR	#1, S0, [R0, #0]
;parameter_posterior.h,85 :: 		bi[6] = 0.2 * modFactor;
MOVW	R0, #lo_addr(_modFactor+0)
MOVT	R0, #hi_addr(_modFactor+0)
VLDR	#1, S1, [R0, #0]
MOVW	R0, #52429
MOVT	R0, #15948
VMOV	S0, R0
VMUL.F32	S0, S0, S1
MOVW	R0, #lo_addr(_bi+24)
MOVT	R0, #hi_addr(_bi+24)
VSTR	#1, S0, [R0, #0]
;parameter_posterior.h,88 :: 		for (i = 1; i <= 6; i++)
; i start address is: 12 (R3)
MOVS	R3, #1
SXTH	R3, R3
; i end address is: 12 (R3)
L_posterior3207:
; i start address is: 12 (R3)
CMP	R3, #6
IT	GT
BGT	L_posterior3208
;parameter_posterior.h,90 :: 		ti[i] = ti[i] * (pi / 180.0); // konversi ke radian
LSLS	R1, R3, #2
MOVW	R0, #lo_addr(_ti+0)
MOVT	R0, #hi_addr(_ti+0)
ADDS	R2, R0, R1
VLDR	#1, S1, [R2, #0]
MOVW	R0, #64053
MOVT	R0, #15502
VMOV	S0, R0
VMUL.F32	S0, S1, S0
VSTR	#1, S0, [R2, #0]
;parameter_posterior.h,88 :: 		for (i = 1; i <= 6; i++)
ADDS	R3, R3, #1
SXTH	R3, R3
;parameter_posterior.h,91 :: 		}
; i end address is: 12 (R3)
IT	AL
BAL	L_posterior3207
L_posterior3208:
;parameter_posterior.h,92 :: 		}
L_end_posterior3:
LDR	LR, [SP, #0]
ADD	SP, SP, #8
BX	LR
; end of _posterior3
_posterioraVR:
;parameter_posterior.h,94 :: 		void posterioraVR()
SUB	SP, SP, #8
STR	LR, [SP, #0]
;parameter_posterior.h,97 :: 		modFactor = sqrt((float)hmean / 60.0);
MOVW	R0, #lo_addr(_hmean+0)
MOVT	R0, #hi_addr(_hmean+0)
VLDR	#1, S1, [R0, #0]
MOVW	R0, #0
MOVT	R0, #17008
VMOV	S0, R0
VDIV.F32	S0, S1, S0
BL	_sqrt+0
MOVW	R0, #lo_addr(_modFactor+0)
MOVT	R0, #hi_addr(_modFactor+0)
VSTR	#1, S0, [R0, #0]
;parameter_posterior.h,99 :: 		ti[1] = -60 * sqrt(modFactor);
VMOV.F32	S0, S0
BL	_sqrt+0
MOVW	R0, #0
MOVT	R0, #49776
VMOV	S1, R0
VMUL.F32	S0, S1, S0
MOVW	R0, #lo_addr(_ti+4)
MOVT	R0, #hi_addr(_ti+4)
VSTR	#1, S0, [R0, #0]
;parameter_posterior.h,100 :: 		ai[1] = -0.8 * 18;
MOVW	R0, #26215
MOVT	R0, #49510
VMOV	S0, R0
MOVW	R0, #lo_addr(_ai+4)
MOVT	R0, #hi_addr(_ai+4)
VSTR	#1, S0, [R0, #0]
;parameter_posterior.h,101 :: 		bi[1] = 0.2 * modFactor;
MOVW	R1, #lo_addr(_modFactor+0)
MOVT	R1, #hi_addr(_modFactor+0)
VLDR	#1, S1, [R1, #0]
MOVW	R0, #52429
MOVT	R0, #15948
VMOV	S0, R0
VMUL.F32	S0, S0, S1
MOVW	R0, #lo_addr(_bi+4)
MOVT	R0, #hi_addr(_bi+4)
VSTR	#1, S0, [R0, #0]
;parameter_posterior.h,102 :: 		ti[2] = -15 * modFactor;
MOV	R0, R1
VLDR	#1, S1, [R0, #0]
VMOV.F32	S0, #-15
VMUL.F32	S0, S0, S1
MOVW	R0, #lo_addr(_ti+8)
MOVT	R0, #hi_addr(_ti+8)
VSTR	#1, S0, [R0, #0]
;parameter_posterior.h,103 :: 		ai[2] = 10 * 18;
MOVW	R0, #0
MOVT	R0, #17204
VMOV	S0, R0
MOVW	R0, #lo_addr(_ai+8)
MOVT	R0, #hi_addr(_ai+8)
VSTR	#1, S0, [R0, #0]
;parameter_posterior.h,104 :: 		bi[2] = 0.1 * modFactor;
MOV	R0, R1
VLDR	#1, S1, [R0, #0]
MOVW	R0, #52429
MOVT	R0, #15820
VMOV	S0, R0
VMUL.F32	S0, S0, S1
MOVW	R0, #lo_addr(_bi+8)
MOVT	R0, #hi_addr(_bi+8)
VSTR	#1, S0, [R0, #0]
;parameter_posterior.h,105 :: 		ti[3] = 0;
MOV	R0, #0
VMOV	S0, R0
MOVW	R0, #lo_addr(_ti+12)
MOVT	R0, #hi_addr(_ti+12)
VSTR	#1, S0, [R0, #0]
;parameter_posterior.h,106 :: 		ai[3] = -26.3 * 18;
MOVW	R0, #45875
MOVT	R0, #50156
VMOV	S0, R0
MOVW	R0, #lo_addr(_ai+12)
MOVT	R0, #hi_addr(_ai+12)
VSTR	#1, S0, [R0, #0]
;parameter_posterior.h,107 :: 		bi[3] = 0.1 * modFactor;
MOV	R0, R1
VLDR	#1, S1, [R0, #0]
MOVW	R0, #52429
MOVT	R0, #15820
VMOV	S0, R0
VMUL.F32	S0, S0, S1
MOVW	R0, #lo_addr(_bi+12)
MOVT	R0, #hi_addr(_bi+12)
VSTR	#1, S0, [R0, #0]
;parameter_posterior.h,108 :: 		ti[4] = 15 * modFactor;
MOV	R0, R1
VLDR	#1, S1, [R0, #0]
VMOV.F32	S0, #15
VMUL.F32	S0, S0, S1
MOVW	R0, #lo_addr(_ti+16)
MOVT	R0, #hi_addr(_ti+16)
VSTR	#1, S0, [R0, #0]
;parameter_posterior.h,109 :: 		ai[4] = -0.5 * 18;
VMOV.F32	S0, #-9
MOVW	R0, #lo_addr(_ai+16)
MOVT	R0, #hi_addr(_ai+16)
VSTR	#1, S0, [R0, #0]
;parameter_posterior.h,110 :: 		bi[4] = 0.1 * modFactor;
MOV	R0, R1
VLDR	#1, S1, [R0, #0]
MOVW	R0, #52429
MOVT	R0, #15820
VMOV	S0, R0
VMUL.F32	S0, S0, S1
MOVW	R0, #lo_addr(_bi+16)
MOVT	R0, #hi_addr(_bi+16)
VSTR	#1, S0, [R0, #0]
;parameter_posterior.h,111 :: 		ti[5] = 97 * sqrt(modFactor);
MOV	R0, R1
VLDR	#1, S0, [R0, #0]
BL	_sqrt+0
MOVW	R0, #0
MOVT	R0, #17090
VMOV	S1, R0
VMUL.F32	S0, S1, S0
MOVW	R0, #lo_addr(_ti+20)
MOVT	R0, #hi_addr(_ti+20)
VSTR	#1, S0, [R0, #0]
;parameter_posterior.h,112 :: 		ai[5] = -0.17 * ((modFactor * modFactor)*sqrt(modFactor)) * 18;
MOVW	R1, #lo_addr(_modFactor+0)
MOVT	R1, #hi_addr(_modFactor+0)
VLDR	#1, S1, [R1, #0]
MOV	R0, R1
VLDR	#1, S0, [R0, #0]
VMUL.F32	S0, S0, S1
VSTR	#1, S0, [SP, #4]
MOV	R0, R1
VLDR	#1, S0, [R0, #0]
BL	_sqrt+0
VLDR	#1, S1, [SP, #4]
VMUL.F32	S1, S1, S0
MOVW	R0, #5243
MOVT	R0, #48686
VMOV	S0, R0
VMUL.F32	S1, S0, S1
VMOV.F32	S0, #18
VMUL.F32	S0, S1, S0
MOVW	R0, #lo_addr(_ai+20)
MOVT	R0, #hi_addr(_ai+20)
VSTR	#1, S0, [R0, #0]
;parameter_posterior.h,113 :: 		bi[5] = 0.4 / modFactor;
MOVW	R1, #lo_addr(_modFactor+0)
MOVT	R1, #hi_addr(_modFactor+0)
VLDR	#1, S1, [R1, #0]
MOVW	R0, #52429
MOVT	R0, #16076
VMOV	S0, R0
VDIV.F32	S0, S0, S1
MOVW	R0, #lo_addr(_bi+20)
MOVT	R0, #hi_addr(_bi+20)
VSTR	#1, S0, [R0, #0]
;parameter_posterior.h,114 :: 		ti[6] = 100 * sqrt(modFactor);
MOV	R0, R1
VLDR	#1, S0, [R0, #0]
BL	_sqrt+0
MOVW	R0, #0
MOVT	R0, #17096
VMOV	S1, R0
VMUL.F32	S0, S1, S0
MOVW	R0, #lo_addr(_ti+24)
MOVT	R0, #hi_addr(_ti+24)
VSTR	#1, S0, [R0, #0]
;parameter_posterior.h,115 :: 		ai[6] = -0.25 *((modFactor * modFactor)*sqrt(modFactor)) * 18;
MOVW	R1, #lo_addr(_modFactor+0)
MOVT	R1, #hi_addr(_modFactor+0)
VLDR	#1, S1, [R1, #0]
MOV	R0, R1
VLDR	#1, S0, [R0, #0]
VMUL.F32	S0, S0, S1
VSTR	#1, S0, [SP, #4]
MOV	R0, R1
VLDR	#1, S0, [R0, #0]
BL	_sqrt+0
VLDR	#1, S1, [SP, #4]
VMUL.F32	S1, S1, S0
VMOV.F32	S0, #-0.25
VMUL.F32	S1, S0, S1
VMOV.F32	S0, #18
VMUL.F32	S0, S1, S0
MOVW	R0, #lo_addr(_ai+24)
MOVT	R0, #hi_addr(_ai+24)
VSTR	#1, S0, [R0, #0]
;parameter_posterior.h,116 :: 		bi[6] = 0.2 * modFactor;
MOVW	R0, #lo_addr(_modFactor+0)
MOVT	R0, #hi_addr(_modFactor+0)
VLDR	#1, S1, [R0, #0]
MOVW	R0, #52429
MOVT	R0, #15948
VMOV	S0, R0
VMUL.F32	S0, S0, S1
MOVW	R0, #lo_addr(_bi+24)
MOVT	R0, #hi_addr(_bi+24)
VSTR	#1, S0, [R0, #0]
;parameter_posterior.h,119 :: 		for (i = 1; i <= 6; i++)
; i start address is: 12 (R3)
MOVS	R3, #1
SXTH	R3, R3
; i end address is: 12 (R3)
L_posterioraVR210:
; i start address is: 12 (R3)
CMP	R3, #6
IT	GT
BGT	L_posterioraVR211
;parameter_posterior.h,121 :: 		ti[i] = ti[i] * (pi / 180.0); // konversi ke radian
LSLS	R1, R3, #2
MOVW	R0, #lo_addr(_ti+0)
MOVT	R0, #hi_addr(_ti+0)
ADDS	R2, R0, R1
VLDR	#1, S1, [R2, #0]
MOVW	R0, #64053
MOVT	R0, #15502
VMOV	S0, R0
VMUL.F32	S0, S1, S0
VSTR	#1, S0, [R2, #0]
;parameter_posterior.h,119 :: 		for (i = 1; i <= 6; i++)
ADDS	R3, R3, #1
SXTH	R3, R3
;parameter_posterior.h,122 :: 		}
; i end address is: 12 (R3)
IT	AL
BAL	L_posterioraVR210
L_posterioraVR211:
;parameter_posterior.h,123 :: 		}
L_end_posterioraVR:
LDR	LR, [SP, #0]
ADD	SP, SP, #8
BX	LR
; end of _posterioraVR
_posterioraVL:
;parameter_posterior.h,125 :: 		void posterioraVL()
SUB	SP, SP, #8
STR	LR, [SP, #0]
;parameter_posterior.h,128 :: 		modFactor = sqrt((float)hmean / 60.0);
MOVW	R0, #lo_addr(_hmean+0)
MOVT	R0, #hi_addr(_hmean+0)
VLDR	#1, S1, [R0, #0]
MOVW	R0, #0
MOVT	R0, #17008
VMOV	S0, R0
VDIV.F32	S0, S1, S0
BL	_sqrt+0
MOVW	R0, #lo_addr(_modFactor+0)
MOVT	R0, #hi_addr(_modFactor+0)
VSTR	#1, S0, [R0, #0]
;parameter_posterior.h,130 :: 		ti[1] = -60 * sqrt(modFactor);
VMOV.F32	S0, S0
BL	_sqrt+0
MOVW	R0, #0
MOVT	R0, #49776
VMOV	S1, R0
VMUL.F32	S0, S1, S0
MOVW	R0, #lo_addr(_ti+4)
MOVT	R0, #hi_addr(_ti+4)
VSTR	#1, S0, [R0, #0]
;parameter_posterior.h,131 :: 		ai[1] = 0.8 * 18;
MOVW	R0, #26215
MOVT	R0, #16742
VMOV	S0, R0
MOVW	R0, #lo_addr(_ai+4)
MOVT	R0, #hi_addr(_ai+4)
VSTR	#1, S0, [R0, #0]
;parameter_posterior.h,132 :: 		bi[1] = 0.2 * modFactor;
MOVW	R1, #lo_addr(_modFactor+0)
MOVT	R1, #hi_addr(_modFactor+0)
VLDR	#1, S1, [R1, #0]
MOVW	R0, #52429
MOVT	R0, #15948
VMOV	S0, R0
VMUL.F32	S0, S0, S1
MOVW	R0, #lo_addr(_bi+4)
MOVT	R0, #hi_addr(_bi+4)
VSTR	#1, S0, [R0, #0]
;parameter_posterior.h,133 :: 		ti[2] = -15 * modFactor;
MOV	R0, R1
VLDR	#1, S1, [R0, #0]
VMOV.F32	S0, #-15
VMUL.F32	S0, S0, S1
MOVW	R0, #lo_addr(_ti+8)
MOVT	R0, #hi_addr(_ti+8)
VSTR	#1, S0, [R0, #0]
;parameter_posterior.h,134 :: 		ai[2] = -7 * 18;
MOVW	R0, #0
MOVT	R0, #49916
VMOV	S0, R0
MOVW	R0, #lo_addr(_ai+8)
MOVT	R0, #hi_addr(_ai+8)
VSTR	#1, S0, [R0, #0]
;parameter_posterior.h,135 :: 		bi[2] = 0.1 * modFactor;
MOV	R0, R1
VLDR	#1, S1, [R0, #0]
MOVW	R0, #52429
MOVT	R0, #15820
VMOV	S0, R0
VMUL.F32	S0, S0, S1
MOVW	R0, #lo_addr(_bi+8)
MOVT	R0, #hi_addr(_bi+8)
VSTR	#1, S0, [R0, #0]
;parameter_posterior.h,136 :: 		ti[3] = 0;
MOV	R0, #0
VMOV	S0, R0
MOVW	R0, #lo_addr(_ti+12)
MOVT	R0, #hi_addr(_ti+12)
VSTR	#1, S0, [R0, #0]
;parameter_posterior.h,137 :: 		ai[3] = 30 * 18;
MOVW	R0, #0
MOVT	R0, #17415
VMOV	S0, R0
MOVW	R0, #lo_addr(_ai+12)
MOVT	R0, #hi_addr(_ai+12)
VSTR	#1, S0, [R0, #0]
;parameter_posterior.h,138 :: 		bi[3] = 0.1 * modFactor;
MOV	R0, R1
VLDR	#1, S1, [R0, #0]
MOVW	R0, #52429
MOVT	R0, #15820
VMOV	S0, R0
VMUL.F32	S0, S0, S1
MOVW	R0, #lo_addr(_bi+12)
MOVT	R0, #hi_addr(_bi+12)
VSTR	#1, S0, [R0, #0]
;parameter_posterior.h,139 :: 		ti[4] = 15 * modFactor;
MOV	R0, R1
VLDR	#1, S1, [R0, #0]
VMOV.F32	S0, #15
VMUL.F32	S0, S0, S1
MOVW	R0, #lo_addr(_ti+16)
MOVT	R0, #hi_addr(_ti+16)
VSTR	#1, S0, [R0, #0]
;parameter_posterior.h,140 :: 		ai[4] = 0.5 * 18;
VMOV.F32	S0, #9
MOVW	R0, #lo_addr(_ai+16)
MOVT	R0, #hi_addr(_ai+16)
VSTR	#1, S0, [R0, #0]
;parameter_posterior.h,141 :: 		bi[4] = 0.1 * modFactor;
MOV	R0, R1
VLDR	#1, S1, [R0, #0]
MOVW	R0, #52429
MOVT	R0, #15820
VMOV	S0, R0
VMUL.F32	S0, S0, S1
MOVW	R0, #lo_addr(_bi+16)
MOVT	R0, #hi_addr(_bi+16)
VSTR	#1, S0, [R0, #0]
;parameter_posterior.h,142 :: 		ti[5] = 97 * sqrt(modFactor);
MOV	R0, R1
VLDR	#1, S0, [R0, #0]
BL	_sqrt+0
MOVW	R0, #0
MOVT	R0, #17090
VMOV	S1, R0
VMUL.F32	S0, S1, S0
MOVW	R0, #lo_addr(_ti+20)
MOVT	R0, #hi_addr(_ti+20)
VSTR	#1, S0, [R0, #0]
;parameter_posterior.h,143 :: 		ai[5] = -0.17 * ((modFactor * modFactor)*sqrt(modFactor)) * 18;
MOVW	R1, #lo_addr(_modFactor+0)
MOVT	R1, #hi_addr(_modFactor+0)
VLDR	#1, S1, [R1, #0]
MOV	R0, R1
VLDR	#1, S0, [R0, #0]
VMUL.F32	S0, S0, S1
VSTR	#1, S0, [SP, #4]
MOV	R0, R1
VLDR	#1, S0, [R0, #0]
BL	_sqrt+0
VLDR	#1, S1, [SP, #4]
VMUL.F32	S1, S1, S0
MOVW	R0, #5243
MOVT	R0, #48686
VMOV	S0, R0
VMUL.F32	S1, S0, S1
VMOV.F32	S0, #18
VMUL.F32	S0, S1, S0
MOVW	R0, #lo_addr(_ai+20)
MOVT	R0, #hi_addr(_ai+20)
VSTR	#1, S0, [R0, #0]
;parameter_posterior.h,144 :: 		bi[5] = 0.4 / modFactor;
MOVW	R1, #lo_addr(_modFactor+0)
MOVT	R1, #hi_addr(_modFactor+0)
VLDR	#1, S1, [R1, #0]
MOVW	R0, #52429
MOVT	R0, #16076
VMOV	S0, R0
VDIV.F32	S0, S0, S1
MOVW	R0, #lo_addr(_bi+20)
MOVT	R0, #hi_addr(_bi+20)
VSTR	#1, S0, [R0, #0]
;parameter_posterior.h,145 :: 		ti[6] = 100 * sqrt(modFactor);
MOV	R0, R1
VLDR	#1, S0, [R0, #0]
BL	_sqrt+0
MOVW	R0, #0
MOVT	R0, #17096
VMOV	S1, R0
VMUL.F32	S0, S1, S0
MOVW	R0, #lo_addr(_ti+24)
MOVT	R0, #hi_addr(_ti+24)
VSTR	#1, S0, [R0, #0]
;parameter_posterior.h,146 :: 		ai[6] = -0.25 *((modFactor * modFactor)*sqrt(modFactor)) * 18;
MOVW	R1, #lo_addr(_modFactor+0)
MOVT	R1, #hi_addr(_modFactor+0)
VLDR	#1, S1, [R1, #0]
MOV	R0, R1
VLDR	#1, S0, [R0, #0]
VMUL.F32	S0, S0, S1
VSTR	#1, S0, [SP, #4]
MOV	R0, R1
VLDR	#1, S0, [R0, #0]
BL	_sqrt+0
VLDR	#1, S1, [SP, #4]
VMUL.F32	S1, S1, S0
VMOV.F32	S0, #-0.25
VMUL.F32	S1, S0, S1
VMOV.F32	S0, #18
VMUL.F32	S0, S1, S0
MOVW	R0, #lo_addr(_ai+24)
MOVT	R0, #hi_addr(_ai+24)
VSTR	#1, S0, [R0, #0]
;parameter_posterior.h,147 :: 		bi[6] = 0.2 * modFactor;
MOVW	R0, #lo_addr(_modFactor+0)
MOVT	R0, #hi_addr(_modFactor+0)
VLDR	#1, S1, [R0, #0]
MOVW	R0, #52429
MOVT	R0, #15948
VMOV	S0, R0
VMUL.F32	S0, S0, S1
MOVW	R0, #lo_addr(_bi+24)
MOVT	R0, #hi_addr(_bi+24)
VSTR	#1, S0, [R0, #0]
;parameter_posterior.h,150 :: 		for (i = 1; i <= 6; i++)
; i start address is: 12 (R3)
MOVS	R3, #1
SXTH	R3, R3
; i end address is: 12 (R3)
L_posterioraVL213:
; i start address is: 12 (R3)
CMP	R3, #6
IT	GT
BGT	L_posterioraVL214
;parameter_posterior.h,152 :: 		ti[i] = ti[i] * (pi / 180.0); // konversi ke radian
LSLS	R1, R3, #2
MOVW	R0, #lo_addr(_ti+0)
MOVT	R0, #hi_addr(_ti+0)
ADDS	R2, R0, R1
VLDR	#1, S1, [R2, #0]
MOVW	R0, #64053
MOVT	R0, #15502
VMOV	S0, R0
VMUL.F32	S0, S1, S0
VSTR	#1, S0, [R2, #0]
;parameter_posterior.h,150 :: 		for (i = 1; i <= 6; i++)
ADDS	R3, R3, #1
SXTH	R3, R3
;parameter_posterior.h,153 :: 		}
; i end address is: 12 (R3)
IT	AL
BAL	L_posterioraVL213
L_posterioraVL214:
;parameter_posterior.h,154 :: 		}
L_end_posterioraVL:
LDR	LR, [SP, #0]
ADD	SP, SP, #8
BX	LR
; end of _posterioraVL
_posterioraVF:
;parameter_posterior.h,156 :: 		void posterioraVF()
SUB	SP, SP, #8
STR	LR, [SP, #0]
;parameter_posterior.h,159 :: 		modFactor = sqrt((float)hmean / 60.0);
MOVW	R0, #lo_addr(_hmean+0)
MOVT	R0, #hi_addr(_hmean+0)
VLDR	#1, S1, [R0, #0]
MOVW	R0, #0
MOVT	R0, #17008
VMOV	S0, R0
VDIV.F32	S0, S1, S0
BL	_sqrt+0
MOVW	R0, #lo_addr(_modFactor+0)
MOVT	R0, #hi_addr(_modFactor+0)
VSTR	#1, S0, [R0, #0]
;parameter_posterior.h,161 :: 		ti[1] = -60 * sqrt(modFactor);
VMOV.F32	S0, S0
BL	_sqrt+0
MOVW	R0, #0
MOVT	R0, #49776
VMOV	S1, R0
VMUL.F32	S0, S1, S0
MOVW	R0, #lo_addr(_ti+4)
MOVT	R0, #hi_addr(_ti+4)
VSTR	#1, S0, [R0, #0]
;parameter_posterior.h,162 :: 		ai[1] = 0.8 * 18;
MOVW	R0, #26215
MOVT	R0, #16742
VMOV	S0, R0
MOVW	R0, #lo_addr(_ai+4)
MOVT	R0, #hi_addr(_ai+4)
VSTR	#1, S0, [R0, #0]
;parameter_posterior.h,163 :: 		bi[1] = 0.2 * modFactor;
MOVW	R1, #lo_addr(_modFactor+0)
MOVT	R1, #hi_addr(_modFactor+0)
VLDR	#1, S1, [R1, #0]
MOVW	R0, #52429
MOVT	R0, #15948
VMOV	S0, R0
VMUL.F32	S0, S0, S1
MOVW	R0, #lo_addr(_bi+4)
MOVT	R0, #hi_addr(_bi+4)
VSTR	#1, S0, [R0, #0]
;parameter_posterior.h,164 :: 		ti[2] = -15 * modFactor;
MOV	R0, R1
VLDR	#1, S1, [R0, #0]
VMOV.F32	S0, #-15
VMUL.F32	S0, S0, S1
MOVW	R0, #lo_addr(_ti+8)
MOVT	R0, #hi_addr(_ti+8)
VSTR	#1, S0, [R0, #0]
;parameter_posterior.h,165 :: 		ai[2] = 4 * 18;
MOVW	R0, #0
MOVT	R0, #17040
VMOV	S0, R0
MOVW	R0, #lo_addr(_ai+8)
MOVT	R0, #hi_addr(_ai+8)
VSTR	#1, S0, [R0, #0]
;parameter_posterior.h,166 :: 		bi[2] = 0.1 * modFactor;
MOV	R0, R1
VLDR	#1, S1, [R0, #0]
MOVW	R0, #52429
MOVT	R0, #15820
VMOV	S0, R0
VMUL.F32	S0, S0, S1
MOVW	R0, #lo_addr(_bi+8)
MOVT	R0, #hi_addr(_bi+8)
VSTR	#1, S0, [R0, #0]
;parameter_posterior.h,167 :: 		ti[3] = 0;
MOV	R0, #0
VMOV	S0, R0
MOVW	R0, #lo_addr(_ti+12)
MOVT	R0, #hi_addr(_ti+12)
VSTR	#1, S0, [R0, #0]
;parameter_posterior.h,168 :: 		ai[3] = -22.5 * 18;
MOVW	R0, #32768
MOVT	R0, #50122
VMOV	S0, R0
MOVW	R0, #lo_addr(_ai+12)
MOVT	R0, #hi_addr(_ai+12)
VSTR	#1, S0, [R0, #0]
;parameter_posterior.h,169 :: 		bi[3] = 0.1 * modFactor;
MOV	R0, R1
VLDR	#1, S1, [R0, #0]
MOVW	R0, #52429
MOVT	R0, #15820
VMOV	S0, R0
VMUL.F32	S0, S0, S1
MOVW	R0, #lo_addr(_bi+12)
MOVT	R0, #hi_addr(_bi+12)
VSTR	#1, S0, [R0, #0]
;parameter_posterior.h,170 :: 		ti[4] = 15 * modFactor;
MOV	R0, R1
VLDR	#1, S1, [R0, #0]
VMOV.F32	S0, #15
VMUL.F32	S0, S0, S1
MOVW	R0, #lo_addr(_ti+16)
MOVT	R0, #hi_addr(_ti+16)
VSTR	#1, S0, [R0, #0]
;parameter_posterior.h,171 :: 		ai[4] = -0.5 * 18;
VMOV.F32	S0, #-9
MOVW	R0, #lo_addr(_ai+16)
MOVT	R0, #hi_addr(_ai+16)
VSTR	#1, S0, [R0, #0]
;parameter_posterior.h,172 :: 		bi[4] = 0.1 * modFactor;
MOV	R0, R1
VLDR	#1, S1, [R0, #0]
MOVW	R0, #52429
MOVT	R0, #15820
VMOV	S0, R0
VMUL.F32	S0, S0, S1
MOVW	R0, #lo_addr(_bi+16)
MOVT	R0, #hi_addr(_bi+16)
VSTR	#1, S0, [R0, #0]
;parameter_posterior.h,173 :: 		ti[5] = 97 * sqrt(modFactor);
MOV	R0, R1
VLDR	#1, S0, [R0, #0]
BL	_sqrt+0
MOVW	R0, #0
MOVT	R0, #17090
VMOV	S1, R0
VMUL.F32	S0, S1, S0
MOVW	R0, #lo_addr(_ti+20)
MOVT	R0, #hi_addr(_ti+20)
VSTR	#1, S0, [R0, #0]
;parameter_posterior.h,174 :: 		ai[5] = 0.15 * ((modFactor * modFactor)*sqrt(modFactor)) * 18;
MOVW	R1, #lo_addr(_modFactor+0)
MOVT	R1, #hi_addr(_modFactor+0)
VLDR	#1, S1, [R1, #0]
MOV	R0, R1
VLDR	#1, S0, [R0, #0]
VMUL.F32	S0, S0, S1
VSTR	#1, S0, [SP, #4]
MOV	R0, R1
VLDR	#1, S0, [R0, #0]
BL	_sqrt+0
VLDR	#1, S1, [SP, #4]
VMUL.F32	S1, S1, S0
MOVW	R0, #39322
MOVT	R0, #15897
VMOV	S0, R0
VMUL.F32	S1, S0, S1
VMOV.F32	S0, #18
VMUL.F32	S0, S1, S0
MOVW	R0, #lo_addr(_ai+20)
MOVT	R0, #hi_addr(_ai+20)
VSTR	#1, S0, [R0, #0]
;parameter_posterior.h,175 :: 		bi[5] = 0.4 / modFactor;
MOVW	R1, #lo_addr(_modFactor+0)
MOVT	R1, #hi_addr(_modFactor+0)
VLDR	#1, S1, [R1, #0]
MOVW	R0, #52429
MOVT	R0, #16076
VMOV	S0, R0
VDIV.F32	S0, S0, S1
MOVW	R0, #lo_addr(_bi+20)
MOVT	R0, #hi_addr(_bi+20)
VSTR	#1, S0, [R0, #0]
;parameter_posterior.h,176 :: 		ti[6] = 100 * sqrt(modFactor);
MOV	R0, R1
VLDR	#1, S0, [R0, #0]
BL	_sqrt+0
MOVW	R0, #0
MOVT	R0, #17096
VMOV	S1, R0
VMUL.F32	S0, S1, S0
MOVW	R0, #lo_addr(_ti+24)
MOVT	R0, #hi_addr(_ti+24)
VSTR	#1, S0, [R0, #0]
;parameter_posterior.h,177 :: 		ai[6] = 0.25 *((modFactor * modFactor)*sqrt(modFactor)) * 18;
MOVW	R1, #lo_addr(_modFactor+0)
MOVT	R1, #hi_addr(_modFactor+0)
VLDR	#1, S1, [R1, #0]
MOV	R0, R1
VLDR	#1, S0, [R0, #0]
VMUL.F32	S0, S0, S1
VSTR	#1, S0, [SP, #4]
MOV	R0, R1
VLDR	#1, S0, [R0, #0]
BL	_sqrt+0
VLDR	#1, S1, [SP, #4]
VMUL.F32	S1, S1, S0
VMOV.F32	S0, #0.25
VMUL.F32	S1, S0, S1
VMOV.F32	S0, #18
VMUL.F32	S0, S1, S0
MOVW	R0, #lo_addr(_ai+24)
MOVT	R0, #hi_addr(_ai+24)
VSTR	#1, S0, [R0, #0]
;parameter_posterior.h,178 :: 		bi[6] = 0.2 * modFactor;
MOVW	R0, #lo_addr(_modFactor+0)
MOVT	R0, #hi_addr(_modFactor+0)
VLDR	#1, S1, [R0, #0]
MOVW	R0, #52429
MOVT	R0, #15948
VMOV	S0, R0
VMUL.F32	S0, S0, S1
MOVW	R0, #lo_addr(_bi+24)
MOVT	R0, #hi_addr(_bi+24)
VSTR	#1, S0, [R0, #0]
;parameter_posterior.h,181 :: 		for (i = 1; i <= 6; i++)
; i start address is: 12 (R3)
MOVS	R3, #1
SXTH	R3, R3
; i end address is: 12 (R3)
L_posterioraVF216:
; i start address is: 12 (R3)
CMP	R3, #6
IT	GT
BGT	L_posterioraVF217
;parameter_posterior.h,183 :: 		ti[i] = ti[i] * (pi / 180.0); // konversi ke radian
LSLS	R1, R3, #2
MOVW	R0, #lo_addr(_ti+0)
MOVT	R0, #hi_addr(_ti+0)
ADDS	R2, R0, R1
VLDR	#1, S1, [R2, #0]
MOVW	R0, #64053
MOVT	R0, #15502
VMOV	S0, R0
VMUL.F32	S0, S1, S0
VSTR	#1, S0, [R2, #0]
;parameter_posterior.h,181 :: 		for (i = 1; i <= 6; i++)
ADDS	R3, R3, #1
SXTH	R3, R3
;parameter_posterior.h,184 :: 		}
; i end address is: 12 (R3)
IT	AL
BAL	L_posterioraVF216
L_posterioraVF217:
;parameter_posterior.h,185 :: 		}
L_end_posterioraVF:
LDR	LR, [SP, #0]
ADD	SP, SP, #8
BX	LR
; end of _posterioraVF
_posteriorV1:
;parameter_posterior.h,187 :: 		void posteriorV1()
SUB	SP, SP, #8
STR	LR, [SP, #0]
;parameter_posterior.h,190 :: 		modFactor = sqrt((float)hmean / 60.0);
MOVW	R0, #lo_addr(_hmean+0)
MOVT	R0, #hi_addr(_hmean+0)
VLDR	#1, S1, [R0, #0]
MOVW	R0, #0
MOVT	R0, #17008
VMOV	S0, R0
VDIV.F32	S0, S1, S0
BL	_sqrt+0
MOVW	R0, #lo_addr(_modFactor+0)
MOVT	R0, #hi_addr(_modFactor+0)
VSTR	#1, S0, [R0, #0]
;parameter_posterior.h,192 :: 		ti[1] = -60 * sqrt(modFactor);
VMOV.F32	S0, S0
BL	_sqrt+0
MOVW	R0, #0
MOVT	R0, #49776
VMOV	S1, R0
VMUL.F32	S0, S1, S0
MOVW	R0, #lo_addr(_ti+4)
MOVT	R0, #hi_addr(_ti+4)
VSTR	#1, S0, [R0, #0]
;parameter_posterior.h,193 :: 		ai[1] = 0.8 * 18;
MOVW	R0, #26215
MOVT	R0, #16742
VMOV	S0, R0
MOVW	R0, #lo_addr(_ai+4)
MOVT	R0, #hi_addr(_ai+4)
VSTR	#1, S0, [R0, #0]
;parameter_posterior.h,194 :: 		bi[1] = 0.2 * modFactor;
MOVW	R1, #lo_addr(_modFactor+0)
MOVT	R1, #hi_addr(_modFactor+0)
VLDR	#1, S1, [R1, #0]
MOVW	R0, #52429
MOVT	R0, #15948
VMOV	S0, R0
VMUL.F32	S0, S0, S1
MOVW	R0, #lo_addr(_bi+4)
MOVT	R0, #hi_addr(_bi+4)
VSTR	#1, S0, [R0, #0]
;parameter_posterior.h,195 :: 		ti[2] = -15 * modFactor;
MOV	R0, R1
VLDR	#1, S1, [R0, #0]
VMOV.F32	S0, #-15
VMUL.F32	S0, S0, S1
MOVW	R0, #lo_addr(_ti+8)
MOVT	R0, #hi_addr(_ti+8)
VSTR	#1, S0, [R0, #0]
;parameter_posterior.h,196 :: 		ai[2] = 0.5 * 18;
VMOV.F32	S0, #9
MOVW	R0, #lo_addr(_ai+8)
MOVT	R0, #hi_addr(_ai+8)
VSTR	#1, S0, [R0, #0]
;parameter_posterior.h,197 :: 		bi[2] = 0.1 * modFactor;
MOV	R0, R1
VLDR	#1, S1, [R0, #0]
MOVW	R0, #52429
MOVT	R0, #15820
VMOV	S0, R0
VMUL.F32	S0, S0, S1
MOVW	R0, #lo_addr(_bi+8)
MOVT	R0, #hi_addr(_bi+8)
VSTR	#1, S0, [R0, #0]
;parameter_posterior.h,198 :: 		ti[3] = 0;
MOV	R0, #0
VMOV	S0, R0
MOVW	R0, #lo_addr(_ti+12)
MOVT	R0, #hi_addr(_ti+12)
VSTR	#1, S0, [R0, #0]
;parameter_posterior.h,199 :: 		ai[3] = 45 * 18;
MOVW	R0, #32768
MOVT	R0, #17482
VMOV	S0, R0
MOVW	R0, #lo_addr(_ai+12)
MOVT	R0, #hi_addr(_ai+12)
VSTR	#1, S0, [R0, #0]
;parameter_posterior.h,200 :: 		bi[3] = 0.1 * modFactor;
MOV	R0, R1
VLDR	#1, S1, [R0, #0]
MOVW	R0, #52429
MOVT	R0, #15820
VMOV	S0, R0
VMUL.F32	S0, S0, S1
MOVW	R0, #lo_addr(_bi+12)
MOVT	R0, #hi_addr(_bi+12)
VSTR	#1, S0, [R0, #0]
;parameter_posterior.h,201 :: 		ti[4] = 15 * modFactor;
MOV	R0, R1
VLDR	#1, S1, [R0, #0]
VMOV.F32	S0, #15
VMUL.F32	S0, S0, S1
MOVW	R0, #lo_addr(_ti+16)
MOVT	R0, #hi_addr(_ti+16)
VSTR	#1, S0, [R0, #0]
;parameter_posterior.h,202 :: 		ai[4] = -15 * 18;
MOVW	R0, #0
MOVT	R0, #50055
VMOV	S0, R0
MOVW	R0, #lo_addr(_ai+16)
MOVT	R0, #hi_addr(_ai+16)
VSTR	#1, S0, [R0, #0]
;parameter_posterior.h,203 :: 		bi[4] = 0.1 * modFactor;
MOV	R0, R1
VLDR	#1, S1, [R0, #0]
MOVW	R0, #52429
MOVT	R0, #15820
VMOV	S0, R0
VMUL.F32	S0, S0, S1
MOVW	R0, #lo_addr(_bi+16)
MOVT	R0, #hi_addr(_bi+16)
VSTR	#1, S0, [R0, #0]
;parameter_posterior.h,204 :: 		ti[5] = 97 * sqrt(modFactor);
MOV	R0, R1
VLDR	#1, S0, [R0, #0]
BL	_sqrt+0
MOVW	R0, #0
MOVT	R0, #17090
VMOV	S1, R0
VMUL.F32	S0, S1, S0
MOVW	R0, #lo_addr(_ti+20)
MOVT	R0, #hi_addr(_ti+20)
VSTR	#1, S0, [R0, #0]
;parameter_posterior.h,205 :: 		ai[5] = 0.68 * ((modFactor * modFactor)*sqrt(modFactor)) * 18;
MOVW	R1, #lo_addr(_modFactor+0)
MOVT	R1, #hi_addr(_modFactor+0)
VLDR	#1, S1, [R1, #0]
MOV	R0, R1
VLDR	#1, S0, [R0, #0]
VMUL.F32	S0, S0, S1
VSTR	#1, S0, [SP, #4]
MOV	R0, R1
VLDR	#1, S0, [R0, #0]
BL	_sqrt+0
VLDR	#1, S1, [SP, #4]
VMUL.F32	S1, S1, S0
MOVW	R0, #5243
MOVT	R0, #16174
VMOV	S0, R0
VMUL.F32	S1, S0, S1
VMOV.F32	S0, #18
VMUL.F32	S0, S1, S0
MOVW	R0, #lo_addr(_ai+20)
MOVT	R0, #hi_addr(_ai+20)
VSTR	#1, S0, [R0, #0]
;parameter_posterior.h,206 :: 		bi[5] = 0.4 / modFactor;
MOVW	R1, #lo_addr(_modFactor+0)
MOVT	R1, #hi_addr(_modFactor+0)
VLDR	#1, S1, [R1, #0]
MOVW	R0, #52429
MOVT	R0, #16076
VMOV	S0, R0
VDIV.F32	S0, S0, S1
MOVW	R0, #lo_addr(_bi+20)
MOVT	R0, #hi_addr(_bi+20)
VSTR	#1, S0, [R0, #0]
;parameter_posterior.h,207 :: 		ti[6] = 100 * sqrt(modFactor);
MOV	R0, R1
VLDR	#1, S0, [R0, #0]
BL	_sqrt+0
MOVW	R0, #0
MOVT	R0, #17096
VMOV	S1, R0
VMUL.F32	S0, S1, S0
MOVW	R0, #lo_addr(_ti+24)
MOVT	R0, #hi_addr(_ti+24)
VSTR	#1, S0, [R0, #0]
;parameter_posterior.h,208 :: 		ai[6] = 1 *((modFactor * modFactor)*sqrt(modFactor)) * 18;
MOVW	R1, #lo_addr(_modFactor+0)
MOVT	R1, #hi_addr(_modFactor+0)
VLDR	#1, S1, [R1, #0]
MOV	R0, R1
VLDR	#1, S0, [R0, #0]
VMUL.F32	S0, S0, S1
VSTR	#1, S0, [SP, #4]
MOV	R0, R1
VLDR	#1, S0, [R0, #0]
BL	_sqrt+0
VLDR	#1, S1, [SP, #4]
VMUL.F32	S1, S1, S0
VMOV.F32	S0, #18
VMUL.F32	S0, S1, S0
MOVW	R0, #lo_addr(_ai+24)
MOVT	R0, #hi_addr(_ai+24)
VSTR	#1, S0, [R0, #0]
;parameter_posterior.h,209 :: 		bi[6] = 0.2 * modFactor;
MOVW	R0, #lo_addr(_modFactor+0)
MOVT	R0, #hi_addr(_modFactor+0)
VLDR	#1, S1, [R0, #0]
MOVW	R0, #52429
MOVT	R0, #15948
VMOV	S0, R0
VMUL.F32	S0, S0, S1
MOVW	R0, #lo_addr(_bi+24)
MOVT	R0, #hi_addr(_bi+24)
VSTR	#1, S0, [R0, #0]
;parameter_posterior.h,212 :: 		for (i = 1; i <= 6; i++)
; i start address is: 12 (R3)
MOVS	R3, #1
SXTH	R3, R3
; i end address is: 12 (R3)
L_posteriorV1219:
; i start address is: 12 (R3)
CMP	R3, #6
IT	GT
BGT	L_posteriorV1220
;parameter_posterior.h,214 :: 		ti[i] = ti[i] * (pi / 180.0); // konversi ke radian
LSLS	R1, R3, #2
MOVW	R0, #lo_addr(_ti+0)
MOVT	R0, #hi_addr(_ti+0)
ADDS	R2, R0, R1
VLDR	#1, S1, [R2, #0]
MOVW	R0, #64053
MOVT	R0, #15502
VMOV	S0, R0
VMUL.F32	S0, S1, S0
VSTR	#1, S0, [R2, #0]
;parameter_posterior.h,212 :: 		for (i = 1; i <= 6; i++)
ADDS	R3, R3, #1
SXTH	R3, R3
;parameter_posterior.h,215 :: 		}
; i end address is: 12 (R3)
IT	AL
BAL	L_posteriorV1219
L_posteriorV1220:
;parameter_posterior.h,216 :: 		}
L_end_posteriorV1:
LDR	LR, [SP, #0]
ADD	SP, SP, #8
BX	LR
; end of _posteriorV1
_posteriorV2:
;parameter_posterior.h,218 :: 		void posteriorV2()
SUB	SP, SP, #8
STR	LR, [SP, #0]
;parameter_posterior.h,221 :: 		modFactor = sqrt((float)hmean / 60.0);
MOVW	R0, #lo_addr(_hmean+0)
MOVT	R0, #hi_addr(_hmean+0)
VLDR	#1, S1, [R0, #0]
MOVW	R0, #0
MOVT	R0, #17008
VMOV	S0, R0
VDIV.F32	S0, S1, S0
BL	_sqrt+0
MOVW	R0, #lo_addr(_modFactor+0)
MOVT	R0, #hi_addr(_modFactor+0)
VSTR	#1, S0, [R0, #0]
;parameter_posterior.h,223 :: 		ti[1] = -60 * sqrt(modFactor);
VMOV.F32	S0, S0
BL	_sqrt+0
MOVW	R0, #0
MOVT	R0, #49776
VMOV	S1, R0
VMUL.F32	S0, S1, S0
MOVW	R0, #lo_addr(_ti+4)
MOVT	R0, #hi_addr(_ti+4)
VSTR	#1, S0, [R0, #0]
;parameter_posterior.h,224 :: 		ai[1] = 0.8 * 18;
MOVW	R0, #26215
MOVT	R0, #16742
VMOV	S0, R0
MOVW	R0, #lo_addr(_ai+4)
MOVT	R0, #hi_addr(_ai+4)
VSTR	#1, S0, [R0, #0]
;parameter_posterior.h,225 :: 		bi[1] = 0.2 * modFactor;
MOVW	R1, #lo_addr(_modFactor+0)
MOVT	R1, #hi_addr(_modFactor+0)
VLDR	#1, S1, [R1, #0]
MOVW	R0, #52429
MOVT	R0, #15948
VMOV	S0, R0
VMUL.F32	S0, S0, S1
MOVW	R0, #lo_addr(_bi+4)
MOVT	R0, #hi_addr(_bi+4)
VSTR	#1, S0, [R0, #0]
;parameter_posterior.h,226 :: 		ti[2] = -15 * modFactor;
MOV	R0, R1
VLDR	#1, S1, [R0, #0]
VMOV.F32	S0, #-15
VMUL.F32	S0, S0, S1
MOVW	R0, #lo_addr(_ti+8)
MOVT	R0, #hi_addr(_ti+8)
VSTR	#1, S0, [R0, #0]
;parameter_posterior.h,227 :: 		ai[2] = 0.5 * 18;
VMOV.F32	S0, #9
MOVW	R0, #lo_addr(_ai+8)
MOVT	R0, #hi_addr(_ai+8)
VSTR	#1, S0, [R0, #0]
;parameter_posterior.h,228 :: 		bi[2] = 0.1 * modFactor;
MOV	R0, R1
VLDR	#1, S1, [R0, #0]
MOVW	R0, #52429
MOVT	R0, #15820
VMOV	S0, R0
VMUL.F32	S0, S0, S1
MOVW	R0, #lo_addr(_bi+8)
MOVT	R0, #hi_addr(_bi+8)
VSTR	#1, S0, [R0, #0]
;parameter_posterior.h,229 :: 		ti[3] = 0;
MOV	R0, #0
VMOV	S0, R0
MOVW	R0, #lo_addr(_ti+12)
MOVT	R0, #hi_addr(_ti+12)
VSTR	#1, S0, [R0, #0]
;parameter_posterior.h,230 :: 		ai[3] = 35 * 18;
MOVW	R0, #32768
MOVT	R0, #17437
VMOV	S0, R0
MOVW	R0, #lo_addr(_ai+12)
MOVT	R0, #hi_addr(_ai+12)
VSTR	#1, S0, [R0, #0]
;parameter_posterior.h,231 :: 		bi[3] = 0.1 * modFactor;
MOV	R0, R1
VLDR	#1, S1, [R0, #0]
MOVW	R0, #52429
MOVT	R0, #15820
VMOV	S0, R0
VMUL.F32	S0, S0, S1
MOVW	R0, #lo_addr(_bi+12)
MOVT	R0, #hi_addr(_bi+12)
VSTR	#1, S0, [R0, #0]
;parameter_posterior.h,232 :: 		ti[4] = 15 * modFactor;
MOV	R0, R1
VLDR	#1, S1, [R0, #0]
VMOV.F32	S0, #15
VMUL.F32	S0, S0, S1
MOVW	R0, #lo_addr(_ti+16)
MOVT	R0, #hi_addr(_ti+16)
VSTR	#1, S0, [R0, #0]
;parameter_posterior.h,233 :: 		ai[4] = -17* 18;
MOVW	R0, #0
MOVT	R0, #50073
VMOV	S0, R0
MOVW	R0, #lo_addr(_ai+16)
MOVT	R0, #hi_addr(_ai+16)
VSTR	#1, S0, [R0, #0]
;parameter_posterior.h,234 :: 		bi[4] = 0.1 * modFactor;
MOV	R0, R1
VLDR	#1, S1, [R0, #0]
MOVW	R0, #52429
MOVT	R0, #15820
VMOV	S0, R0
VMUL.F32	S0, S0, S1
MOVW	R0, #lo_addr(_bi+16)
MOVT	R0, #hi_addr(_bi+16)
VSTR	#1, S0, [R0, #0]
;parameter_posterior.h,235 :: 		ti[5] = 97 * sqrt(modFactor);
MOV	R0, R1
VLDR	#1, S0, [R0, #0]
BL	_sqrt+0
MOVW	R0, #0
MOVT	R0, #17090
VMOV	S1, R0
VMUL.F32	S0, S1, S0
MOVW	R0, #lo_addr(_ti+20)
MOVT	R0, #hi_addr(_ti+20)
VSTR	#1, S0, [R0, #0]
;parameter_posterior.h,236 :: 		ai[5] = 0.7 * ((modFactor * modFactor)*sqrt(modFactor)) * 18;
MOVW	R1, #lo_addr(_modFactor+0)
MOVT	R1, #hi_addr(_modFactor+0)
VLDR	#1, S1, [R1, #0]
MOV	R0, R1
VLDR	#1, S0, [R0, #0]
VMUL.F32	S0, S0, S1
VSTR	#1, S0, [SP, #4]
MOV	R0, R1
VLDR	#1, S0, [R0, #0]
BL	_sqrt+0
VLDR	#1, S1, [SP, #4]
VMUL.F32	S1, S1, S0
MOVW	R0, #13107
MOVT	R0, #16179
VMOV	S0, R0
VMUL.F32	S1, S0, S1
VMOV.F32	S0, #18
VMUL.F32	S0, S1, S0
MOVW	R0, #lo_addr(_ai+20)
MOVT	R0, #hi_addr(_ai+20)
VSTR	#1, S0, [R0, #0]
;parameter_posterior.h,237 :: 		bi[5] = 0.4 / modFactor;
MOVW	R1, #lo_addr(_modFactor+0)
MOVT	R1, #hi_addr(_modFactor+0)
VLDR	#1, S1, [R1, #0]
MOVW	R0, #52429
MOVT	R0, #16076
VMOV	S0, R0
VDIV.F32	S0, S0, S1
MOVW	R0, #lo_addr(_bi+20)
MOVT	R0, #hi_addr(_bi+20)
VSTR	#1, S0, [R0, #0]
;parameter_posterior.h,238 :: 		ti[6] = 100 * sqrt(modFactor);
MOV	R0, R1
VLDR	#1, S0, [R0, #0]
BL	_sqrt+0
MOVW	R0, #0
MOVT	R0, #17096
VMOV	S1, R0
VMUL.F32	S0, S1, S0
MOVW	R0, #lo_addr(_ti+24)
MOVT	R0, #hi_addr(_ti+24)
VSTR	#1, S0, [R0, #0]
;parameter_posterior.h,239 :: 		ai[6] = 1.04 *((modFactor * modFactor)*sqrt(modFactor)) * 18;
MOVW	R1, #lo_addr(_modFactor+0)
MOVT	R1, #hi_addr(_modFactor+0)
VLDR	#1, S1, [R1, #0]
MOV	R0, R1
VLDR	#1, S0, [R0, #0]
VMUL.F32	S0, S0, S1
VSTR	#1, S0, [SP, #4]
MOV	R0, R1
VLDR	#1, S0, [R0, #0]
BL	_sqrt+0
VLDR	#1, S1, [SP, #4]
VMUL.F32	S1, S1, S0
MOVW	R0, #7864
MOVT	R0, #16261
VMOV	S0, R0
VMUL.F32	S1, S0, S1
VMOV.F32	S0, #18
VMUL.F32	S0, S1, S0
MOVW	R0, #lo_addr(_ai+24)
MOVT	R0, #hi_addr(_ai+24)
VSTR	#1, S0, [R0, #0]
;parameter_posterior.h,240 :: 		bi[6] = 0.2 * modFactor;
MOVW	R0, #lo_addr(_modFactor+0)
MOVT	R0, #hi_addr(_modFactor+0)
VLDR	#1, S1, [R0, #0]
MOVW	R0, #52429
MOVT	R0, #15948
VMOV	S0, R0
VMUL.F32	S0, S0, S1
MOVW	R0, #lo_addr(_bi+24)
MOVT	R0, #hi_addr(_bi+24)
VSTR	#1, S0, [R0, #0]
;parameter_posterior.h,243 :: 		for (i = 1; i <= 6; i++)
; i start address is: 12 (R3)
MOVS	R3, #1
SXTH	R3, R3
; i end address is: 12 (R3)
L_posteriorV2222:
; i start address is: 12 (R3)
CMP	R3, #6
IT	GT
BGT	L_posteriorV2223
;parameter_posterior.h,245 :: 		ti[i] = ti[i] * (pi / 180.0); // konversi ke radian
LSLS	R1, R3, #2
MOVW	R0, #lo_addr(_ti+0)
MOVT	R0, #hi_addr(_ti+0)
ADDS	R2, R0, R1
VLDR	#1, S1, [R2, #0]
MOVW	R0, #64053
MOVT	R0, #15502
VMOV	S0, R0
VMUL.F32	S0, S1, S0
VSTR	#1, S0, [R2, #0]
;parameter_posterior.h,243 :: 		for (i = 1; i <= 6; i++)
ADDS	R3, R3, #1
SXTH	R3, R3
;parameter_posterior.h,246 :: 		}
; i end address is: 12 (R3)
IT	AL
BAL	L_posteriorV2222
L_posteriorV2223:
;parameter_posterior.h,247 :: 		}
L_end_posteriorV2:
LDR	LR, [SP, #0]
ADD	SP, SP, #8
BX	LR
; end of _posteriorV2
_posteriorV3:
;parameter_posterior.h,249 :: 		void posteriorV3()
SUB	SP, SP, #8
STR	LR, [SP, #0]
;parameter_posterior.h,252 :: 		modFactor = sqrt((float)hmean / 60.0);
MOVW	R0, #lo_addr(_hmean+0)
MOVT	R0, #hi_addr(_hmean+0)
VLDR	#1, S1, [R0, #0]
MOVW	R0, #0
MOVT	R0, #17008
VMOV	S0, R0
VDIV.F32	S0, S1, S0
BL	_sqrt+0
MOVW	R0, #lo_addr(_modFactor+0)
MOVT	R0, #hi_addr(_modFactor+0)
VSTR	#1, S0, [R0, #0]
;parameter_posterior.h,254 :: 		ti[1] = -60 * sqrt(modFactor);
VMOV.F32	S0, S0
BL	_sqrt+0
MOVW	R0, #0
MOVT	R0, #49776
VMOV	S1, R0
VMUL.F32	S0, S1, S0
MOVW	R0, #lo_addr(_ti+4)
MOVT	R0, #hi_addr(_ti+4)
VSTR	#1, S0, [R0, #0]
;parameter_posterior.h,255 :: 		ai[1] = 0.8 * 18;
MOVW	R0, #26215
MOVT	R0, #16742
VMOV	S0, R0
MOVW	R0, #lo_addr(_ai+4)
MOVT	R0, #hi_addr(_ai+4)
VSTR	#1, S0, [R0, #0]
;parameter_posterior.h,256 :: 		bi[1] = 0.2 * modFactor;
MOVW	R1, #lo_addr(_modFactor+0)
MOVT	R1, #hi_addr(_modFactor+0)
VLDR	#1, S1, [R1, #0]
MOVW	R0, #52429
MOVT	R0, #15948
VMOV	S0, R0
VMUL.F32	S0, S0, S1
MOVW	R0, #lo_addr(_bi+4)
MOVT	R0, #hi_addr(_bi+4)
VSTR	#1, S0, [R0, #0]
;parameter_posterior.h,257 :: 		ti[2] = -15 * modFactor;
MOV	R0, R1
VLDR	#1, S1, [R0, #0]
VMOV.F32	S0, #-15
VMUL.F32	S0, S0, S1
MOVW	R0, #lo_addr(_ti+8)
MOVT	R0, #hi_addr(_ti+8)
VSTR	#1, S0, [R0, #0]
;parameter_posterior.h,258 :: 		ai[2] = 0.5 * 18;
VMOV.F32	S0, #9
MOVW	R0, #lo_addr(_ai+8)
MOVT	R0, #hi_addr(_ai+8)
VSTR	#1, S0, [R0, #0]
;parameter_posterior.h,259 :: 		bi[2] = 0.1 * modFactor;
MOV	R0, R1
VLDR	#1, S1, [R0, #0]
MOVW	R0, #52429
MOVT	R0, #15820
VMOV	S0, R0
VMUL.F32	S0, S0, S1
MOVW	R0, #lo_addr(_bi+8)
MOVT	R0, #hi_addr(_bi+8)
VSTR	#1, S0, [R0, #0]
;parameter_posterior.h,260 :: 		ti[3] = 0;
MOV	R0, #0
VMOV	S0, R0
MOVW	R0, #lo_addr(_ti+12)
MOVT	R0, #hi_addr(_ti+12)
VSTR	#1, S0, [R0, #0]
;parameter_posterior.h,261 :: 		ai[3] = 30 * 18;
MOVW	R0, #0
MOVT	R0, #17415
VMOV	S0, R0
MOVW	R0, #lo_addr(_ai+12)
MOVT	R0, #hi_addr(_ai+12)
VSTR	#1, S0, [R0, #0]
;parameter_posterior.h,262 :: 		bi[3] = 0.1 * modFactor;
MOV	R0, R1
VLDR	#1, S1, [R0, #0]
MOVW	R0, #52429
MOVT	R0, #15820
VMOV	S0, R0
VMUL.F32	S0, S0, S1
MOVW	R0, #lo_addr(_bi+12)
MOVT	R0, #hi_addr(_bi+12)
VSTR	#1, S0, [R0, #0]
;parameter_posterior.h,263 :: 		ti[4] = 15 * modFactor;
MOV	R0, R1
VLDR	#1, S1, [R0, #0]
VMOV.F32	S0, #15
VMUL.F32	S0, S0, S1
MOVW	R0, #lo_addr(_ti+16)
MOVT	R0, #hi_addr(_ti+16)
VSTR	#1, S0, [R0, #0]
;parameter_posterior.h,264 :: 		ai[4] = -17 * 18;
MOVW	R0, #0
MOVT	R0, #50073
VMOV	S0, R0
MOVW	R0, #lo_addr(_ai+16)
MOVT	R0, #hi_addr(_ai+16)
VSTR	#1, S0, [R0, #0]
;parameter_posterior.h,265 :: 		bi[4] = 0.1 * modFactor;
MOV	R0, R1
VLDR	#1, S1, [R0, #0]
MOVW	R0, #52429
MOVT	R0, #15820
VMOV	S0, R0
VMUL.F32	S0, S0, S1
MOVW	R0, #lo_addr(_bi+16)
MOVT	R0, #hi_addr(_bi+16)
VSTR	#1, S0, [R0, #0]
;parameter_posterior.h,266 :: 		ti[5] = 97 * sqrt(modFactor);
MOV	R0, R1
VLDR	#1, S0, [R0, #0]
BL	_sqrt+0
MOVW	R0, #0
MOVT	R0, #17090
VMOV	S1, R0
VMUL.F32	S0, S1, S0
MOVW	R0, #lo_addr(_ti+20)
MOVT	R0, #hi_addr(_ti+20)
VSTR	#1, S0, [R0, #0]
;parameter_posterior.h,267 :: 		ai[5] = 0.7 * ((modFactor * modFactor)*sqrt(modFactor)) * 18;
MOVW	R1, #lo_addr(_modFactor+0)
MOVT	R1, #hi_addr(_modFactor+0)
VLDR	#1, S1, [R1, #0]
MOV	R0, R1
VLDR	#1, S0, [R0, #0]
VMUL.F32	S0, S0, S1
VSTR	#1, S0, [SP, #4]
MOV	R0, R1
VLDR	#1, S0, [R0, #0]
BL	_sqrt+0
VLDR	#1, S1, [SP, #4]
VMUL.F32	S1, S1, S0
MOVW	R0, #13107
MOVT	R0, #16179
VMOV	S0, R0
VMUL.F32	S1, S0, S1
VMOV.F32	S0, #18
VMUL.F32	S0, S1, S0
MOVW	R0, #lo_addr(_ai+20)
MOVT	R0, #hi_addr(_ai+20)
VSTR	#1, S0, [R0, #0]
;parameter_posterior.h,268 :: 		bi[5] = 0.4 / modFactor;
MOVW	R1, #lo_addr(_modFactor+0)
MOVT	R1, #hi_addr(_modFactor+0)
VLDR	#1, S1, [R1, #0]
MOVW	R0, #52429
MOVT	R0, #16076
VMOV	S0, R0
VDIV.F32	S0, S0, S1
MOVW	R0, #lo_addr(_bi+20)
MOVT	R0, #hi_addr(_bi+20)
VSTR	#1, S0, [R0, #0]
;parameter_posterior.h,269 :: 		ti[6] = 100 * sqrt(modFactor);
MOV	R0, R1
VLDR	#1, S0, [R0, #0]
BL	_sqrt+0
MOVW	R0, #0
MOVT	R0, #17096
VMOV	S1, R0
VMUL.F32	S0, S1, S0
MOVW	R0, #lo_addr(_ti+24)
MOVT	R0, #hi_addr(_ti+24)
VSTR	#1, S0, [R0, #0]
;parameter_posterior.h,270 :: 		ai[6] = 0.83 *((modFactor * modFactor)*sqrt(modFactor)) * 18;
MOVW	R1, #lo_addr(_modFactor+0)
MOVT	R1, #hi_addr(_modFactor+0)
VLDR	#1, S1, [R1, #0]
MOV	R0, R1
VLDR	#1, S0, [R0, #0]
VMUL.F32	S0, S0, S1
VSTR	#1, S0, [SP, #4]
MOV	R0, R1
VLDR	#1, S0, [R0, #0]
BL	_sqrt+0
VLDR	#1, S1, [SP, #4]
VMUL.F32	S1, S1, S0
MOVW	R0, #31457
MOVT	R0, #16212
VMOV	S0, R0
VMUL.F32	S1, S0, S1
VMOV.F32	S0, #18
VMUL.F32	S0, S1, S0
MOVW	R0, #lo_addr(_ai+24)
MOVT	R0, #hi_addr(_ai+24)
VSTR	#1, S0, [R0, #0]
;parameter_posterior.h,271 :: 		bi[6] = 0.2 * modFactor;
MOVW	R0, #lo_addr(_modFactor+0)
MOVT	R0, #hi_addr(_modFactor+0)
VLDR	#1, S1, [R0, #0]
MOVW	R0, #52429
MOVT	R0, #15948
VMOV	S0, R0
VMUL.F32	S0, S0, S1
MOVW	R0, #lo_addr(_bi+24)
MOVT	R0, #hi_addr(_bi+24)
VSTR	#1, S0, [R0, #0]
;parameter_posterior.h,274 :: 		for (i = 1; i <= 6; i++)
; i start address is: 12 (R3)
MOVS	R3, #1
SXTH	R3, R3
; i end address is: 12 (R3)
L_posteriorV3225:
; i start address is: 12 (R3)
CMP	R3, #6
IT	GT
BGT	L_posteriorV3226
;parameter_posterior.h,276 :: 		ti[i] = ti[i] * (pi / 180.0); // konversi ke radian
LSLS	R1, R3, #2
MOVW	R0, #lo_addr(_ti+0)
MOVT	R0, #hi_addr(_ti+0)
ADDS	R2, R0, R1
VLDR	#1, S1, [R2, #0]
MOVW	R0, #64053
MOVT	R0, #15502
VMOV	S0, R0
VMUL.F32	S0, S1, S0
VSTR	#1, S0, [R2, #0]
;parameter_posterior.h,274 :: 		for (i = 1; i <= 6; i++)
ADDS	R3, R3, #1
SXTH	R3, R3
;parameter_posterior.h,277 :: 		}
; i end address is: 12 (R3)
IT	AL
BAL	L_posteriorV3225
L_posteriorV3226:
;parameter_posterior.h,278 :: 		}
L_end_posteriorV3:
LDR	LR, [SP, #0]
ADD	SP, SP, #8
BX	LR
; end of _posteriorV3
_posteriorV4:
;parameter_posterior.h,280 :: 		void posteriorV4()
SUB	SP, SP, #8
STR	LR, [SP, #0]
;parameter_posterior.h,283 :: 		modFactor = sqrt((float)hmean / 60.0);
MOVW	R0, #lo_addr(_hmean+0)
MOVT	R0, #hi_addr(_hmean+0)
VLDR	#1, S1, [R0, #0]
MOVW	R0, #0
MOVT	R0, #17008
VMOV	S0, R0
VDIV.F32	S0, S1, S0
BL	_sqrt+0
MOVW	R0, #lo_addr(_modFactor+0)
MOVT	R0, #hi_addr(_modFactor+0)
VSTR	#1, S0, [R0, #0]
;parameter_posterior.h,285 :: 		ti[1] = -60 * sqrt(modFactor);
VMOV.F32	S0, S0
BL	_sqrt+0
MOVW	R0, #0
MOVT	R0, #49776
VMOV	S1, R0
VMUL.F32	S0, S1, S0
MOVW	R0, #lo_addr(_ti+4)
MOVT	R0, #hi_addr(_ti+4)
VSTR	#1, S0, [R0, #0]
;parameter_posterior.h,286 :: 		ai[1] = 0.8 * 18;
MOVW	R0, #26215
MOVT	R0, #16742
VMOV	S0, R0
MOVW	R0, #lo_addr(_ai+4)
MOVT	R0, #hi_addr(_ai+4)
VSTR	#1, S0, [R0, #0]
;parameter_posterior.h,287 :: 		bi[1] = 0.2 * modFactor;
MOVW	R1, #lo_addr(_modFactor+0)
MOVT	R1, #hi_addr(_modFactor+0)
VLDR	#1, S1, [R1, #0]
MOVW	R0, #52429
MOVT	R0, #15948
VMOV	S0, R0
VMUL.F32	S0, S0, S1
MOVW	R0, #lo_addr(_bi+4)
MOVT	R0, #hi_addr(_bi+4)
VSTR	#1, S0, [R0, #0]
;parameter_posterior.h,288 :: 		ti[2] = -15 * modFactor;
MOV	R0, R1
VLDR	#1, S1, [R0, #0]
VMOV.F32	S0, #-15
VMUL.F32	S0, S0, S1
MOVW	R0, #lo_addr(_ti+8)
MOVT	R0, #hi_addr(_ti+8)
VSTR	#1, S0, [R0, #0]
;parameter_posterior.h,289 :: 		ai[2] = 0.5 * 18;
VMOV.F32	S0, #9
MOVW	R0, #lo_addr(_ai+8)
MOVT	R0, #hi_addr(_ai+8)
VSTR	#1, S0, [R0, #0]
;parameter_posterior.h,290 :: 		bi[2] = 0.1 * modFactor;
MOV	R0, R1
VLDR	#1, S1, [R0, #0]
MOVW	R0, #52429
MOVT	R0, #15820
VMOV	S0, R0
VMUL.F32	S0, S0, S1
MOVW	R0, #lo_addr(_bi+8)
MOVT	R0, #hi_addr(_bi+8)
VSTR	#1, S0, [R0, #0]
;parameter_posterior.h,291 :: 		ti[3] = 0;
MOV	R0, #0
VMOV	S0, R0
MOVW	R0, #lo_addr(_ti+12)
MOVT	R0, #hi_addr(_ti+12)
VSTR	#1, S0, [R0, #0]
;parameter_posterior.h,292 :: 		ai[3] = 56.25 * 18;
MOVW	R0, #8192
MOVT	R0, #17533
VMOV	S0, R0
MOVW	R0, #lo_addr(_ai+12)
MOVT	R0, #hi_addr(_ai+12)
VSTR	#1, S0, [R0, #0]
;parameter_posterior.h,293 :: 		bi[3] = 0.1 * modFactor;
MOV	R0, R1
VLDR	#1, S1, [R0, #0]
MOVW	R0, #52429
MOVT	R0, #15820
VMOV	S0, R0
VMUL.F32	S0, S0, S1
MOVW	R0, #lo_addr(_bi+12)
MOVT	R0, #hi_addr(_bi+12)
VSTR	#1, S0, [R0, #0]
;parameter_posterior.h,294 :: 		ti[4] = 15 * modFactor;
MOV	R0, R1
VLDR	#1, S1, [R0, #0]
VMOV.F32	S0, #15
VMUL.F32	S0, S0, S1
MOVW	R0, #lo_addr(_ti+16)
MOVT	R0, #hi_addr(_ti+16)
VSTR	#1, S0, [R0, #0]
;parameter_posterior.h,295 :: 		ai[4] = 0.5 * 18;
VMOV.F32	S0, #9
MOVW	R0, #lo_addr(_ai+16)
MOVT	R0, #hi_addr(_ai+16)
VSTR	#1, S0, [R0, #0]
;parameter_posterior.h,296 :: 		bi[4] = 0.1 * modFactor;
MOV	R0, R1
VLDR	#1, S1, [R0, #0]
MOVW	R0, #52429
MOVT	R0, #15820
VMOV	S0, R0
VMUL.F32	S0, S0, S1
MOVW	R0, #lo_addr(_bi+16)
MOVT	R0, #hi_addr(_bi+16)
VSTR	#1, S0, [R0, #0]
;parameter_posterior.h,297 :: 		ti[5] = 97 * sqrt(modFactor);
MOV	R0, R1
VLDR	#1, S0, [R0, #0]
BL	_sqrt+0
MOVW	R0, #0
MOVT	R0, #17090
VMOV	S1, R0
VMUL.F32	S0, S1, S0
MOVW	R0, #lo_addr(_ti+20)
MOVT	R0, #hi_addr(_ti+20)
VSTR	#1, S0, [R0, #0]
;parameter_posterior.h,298 :: 		ai[5] = 0.4 * ((modFactor * modFactor)*sqrt(modFactor)) * 18;
MOVW	R1, #lo_addr(_modFactor+0)
MOVT	R1, #hi_addr(_modFactor+0)
VLDR	#1, S1, [R1, #0]
MOV	R0, R1
VLDR	#1, S0, [R0, #0]
VMUL.F32	S0, S0, S1
VSTR	#1, S0, [SP, #4]
MOV	R0, R1
VLDR	#1, S0, [R0, #0]
BL	_sqrt+0
VLDR	#1, S1, [SP, #4]
VMUL.F32	S1, S1, S0
MOVW	R0, #52429
MOVT	R0, #16076
VMOV	S0, R0
VMUL.F32	S1, S0, S1
VMOV.F32	S0, #18
VMUL.F32	S0, S1, S0
MOVW	R0, #lo_addr(_ai+20)
MOVT	R0, #hi_addr(_ai+20)
VSTR	#1, S0, [R0, #0]
;parameter_posterior.h,299 :: 		bi[5] = 0.4 / modFactor;
MOVW	R1, #lo_addr(_modFactor+0)
MOVT	R1, #hi_addr(_modFactor+0)
VLDR	#1, S1, [R1, #0]
MOVW	R0, #52429
MOVT	R0, #16076
VMOV	S0, R0
VDIV.F32	S0, S0, S1
MOVW	R0, #lo_addr(_bi+20)
MOVT	R0, #hi_addr(_bi+20)
VSTR	#1, S0, [R0, #0]
;parameter_posterior.h,300 :: 		ti[6] = 100 * sqrt(modFactor);
MOV	R0, R1
VLDR	#1, S0, [R0, #0]
BL	_sqrt+0
MOVW	R0, #0
MOVT	R0, #17096
VMOV	S1, R0
VMUL.F32	S0, S1, S0
MOVW	R0, #lo_addr(_ti+24)
MOVT	R0, #hi_addr(_ti+24)
VSTR	#1, S0, [R0, #0]
;parameter_posterior.h,301 :: 		ai[6] = 0.5 *((modFactor * modFactor)*sqrt(modFactor)) * 18;
MOVW	R1, #lo_addr(_modFactor+0)
MOVT	R1, #hi_addr(_modFactor+0)
VLDR	#1, S1, [R1, #0]
MOV	R0, R1
VLDR	#1, S0, [R0, #0]
VMUL.F32	S0, S0, S1
VSTR	#1, S0, [SP, #4]
MOV	R0, R1
VLDR	#1, S0, [R0, #0]
BL	_sqrt+0
VLDR	#1, S1, [SP, #4]
VMUL.F32	S1, S1, S0
VMOV.F32	S0, #0.5
VMUL.F32	S1, S0, S1
VMOV.F32	S0, #18
VMUL.F32	S0, S1, S0
MOVW	R0, #lo_addr(_ai+24)
MOVT	R0, #hi_addr(_ai+24)
VSTR	#1, S0, [R0, #0]
;parameter_posterior.h,302 :: 		bi[6] = 0.2 * modFactor;
MOVW	R0, #lo_addr(_modFactor+0)
MOVT	R0, #hi_addr(_modFactor+0)
VLDR	#1, S1, [R0, #0]
MOVW	R0, #52429
MOVT	R0, #15948
VMOV	S0, R0
VMUL.F32	S0, S0, S1
MOVW	R0, #lo_addr(_bi+24)
MOVT	R0, #hi_addr(_bi+24)
VSTR	#1, S0, [R0, #0]
;parameter_posterior.h,305 :: 		for (i = 1; i <= 6; i++)
; i start address is: 12 (R3)
MOVS	R3, #1
SXTH	R3, R3
; i end address is: 12 (R3)
L_posteriorV4228:
; i start address is: 12 (R3)
CMP	R3, #6
IT	GT
BGT	L_posteriorV4229
;parameter_posterior.h,307 :: 		ti[i] = ti[i] * (pi / 180.0); // konversi ke radian
LSLS	R1, R3, #2
MOVW	R0, #lo_addr(_ti+0)
MOVT	R0, #hi_addr(_ti+0)
ADDS	R2, R0, R1
VLDR	#1, S1, [R2, #0]
MOVW	R0, #64053
MOVT	R0, #15502
VMOV	S0, R0
VMUL.F32	S0, S1, S0
VSTR	#1, S0, [R2, #0]
;parameter_posterior.h,305 :: 		for (i = 1; i <= 6; i++)
ADDS	R3, R3, #1
SXTH	R3, R3
;parameter_posterior.h,308 :: 		}
; i end address is: 12 (R3)
IT	AL
BAL	L_posteriorV4228
L_posteriorV4229:
;parameter_posterior.h,309 :: 		}
L_end_posteriorV4:
LDR	LR, [SP, #0]
ADD	SP, SP, #8
BX	LR
; end of _posteriorV4
_posteriorV5:
;parameter_posterior.h,311 :: 		void posteriorV5()
SUB	SP, SP, #8
STR	LR, [SP, #0]
;parameter_posterior.h,314 :: 		modFactor = sqrt((float)hmean / 60.0);
MOVW	R0, #lo_addr(_hmean+0)
MOVT	R0, #hi_addr(_hmean+0)
VLDR	#1, S1, [R0, #0]
MOVW	R0, #0
MOVT	R0, #17008
VMOV	S0, R0
VDIV.F32	S0, S1, S0
BL	_sqrt+0
MOVW	R0, #lo_addr(_modFactor+0)
MOVT	R0, #hi_addr(_modFactor+0)
VSTR	#1, S0, [R0, #0]
;parameter_posterior.h,316 :: 		ti[1] = -60 * sqrt(modFactor);
VMOV.F32	S0, S0
BL	_sqrt+0
MOVW	R0, #0
MOVT	R0, #49776
VMOV	S1, R0
VMUL.F32	S0, S1, S0
MOVW	R0, #lo_addr(_ti+4)
MOVT	R0, #hi_addr(_ti+4)
VSTR	#1, S0, [R0, #0]
;parameter_posterior.h,317 :: 		ai[1] = 0.8 * 18;
MOVW	R0, #26215
MOVT	R0, #16742
VMOV	S0, R0
MOVW	R0, #lo_addr(_ai+4)
MOVT	R0, #hi_addr(_ai+4)
VSTR	#1, S0, [R0, #0]
;parameter_posterior.h,318 :: 		bi[1] = 0.2 * modFactor;
MOVW	R1, #lo_addr(_modFactor+0)
MOVT	R1, #hi_addr(_modFactor+0)
VLDR	#1, S1, [R1, #0]
MOVW	R0, #52429
MOVT	R0, #15948
VMOV	S0, R0
VMUL.F32	S0, S0, S1
MOVW	R0, #lo_addr(_bi+4)
MOVT	R0, #hi_addr(_bi+4)
VSTR	#1, S0, [R0, #0]
;parameter_posterior.h,319 :: 		ti[2] = -15 * modFactor;
MOV	R0, R1
VLDR	#1, S1, [R0, #0]
VMOV.F32	S0, #-15
VMUL.F32	S0, S0, S1
MOVW	R0, #lo_addr(_ti+8)
MOVT	R0, #hi_addr(_ti+8)
VSTR	#1, S0, [R0, #0]
;parameter_posterior.h,320 :: 		ai[2] = -10 * 18;
MOVW	R0, #0
MOVT	R0, #49972
VMOV	S0, R0
MOVW	R0, #lo_addr(_ai+8)
MOVT	R0, #hi_addr(_ai+8)
VSTR	#1, S0, [R0, #0]
;parameter_posterior.h,321 :: 		bi[2] = 0.1 * modFactor;
MOV	R0, R1
VLDR	#1, S1, [R0, #0]
MOVW	R0, #52429
MOVT	R0, #15820
VMOV	S0, R0
VMUL.F32	S0, S0, S1
MOVW	R0, #lo_addr(_bi+8)
MOVT	R0, #hi_addr(_bi+8)
VSTR	#1, S0, [R0, #0]
;parameter_posterior.h,322 :: 		ti[3] = 0;
MOV	R0, #0
VMOV	S0, R0
MOVW	R0, #lo_addr(_ti+12)
MOVT	R0, #hi_addr(_ti+12)
VSTR	#1, S0, [R0, #0]
;parameter_posterior.h,323 :: 		ai[3] = 56.25 * 18;
MOVW	R0, #8192
MOVT	R0, #17533
VMOV	S0, R0
MOVW	R0, #lo_addr(_ai+12)
MOVT	R0, #hi_addr(_ai+12)
VSTR	#1, S0, [R0, #0]
;parameter_posterior.h,324 :: 		bi[3] = 0.1 * modFactor;
MOV	R0, R1
VLDR	#1, S1, [R0, #0]
MOVW	R0, #52429
MOVT	R0, #15820
VMOV	S0, R0
VMUL.F32	S0, S0, S1
MOVW	R0, #lo_addr(_bi+12)
MOVT	R0, #hi_addr(_bi+12)
VSTR	#1, S0, [R0, #0]
;parameter_posterior.h,325 :: 		ti[4] = 15 * modFactor;
MOV	R0, R1
VLDR	#1, S1, [R0, #0]
VMOV.F32	S0, #15
VMUL.F32	S0, S0, S1
MOVW	R0, #lo_addr(_ti+16)
MOVT	R0, #hi_addr(_ti+16)
VSTR	#1, S0, [R0, #0]
;parameter_posterior.h,326 :: 		ai[4] = 0.5 * 18;
VMOV.F32	S0, #9
MOVW	R0, #lo_addr(_ai+16)
MOVT	R0, #hi_addr(_ai+16)
VSTR	#1, S0, [R0, #0]
;parameter_posterior.h,327 :: 		bi[4] = 0.1 * modFactor;
MOV	R0, R1
VLDR	#1, S1, [R0, #0]
MOVW	R0, #52429
MOVT	R0, #15820
VMOV	S0, R0
VMUL.F32	S0, S0, S1
MOVW	R0, #lo_addr(_bi+16)
MOVT	R0, #hi_addr(_bi+16)
VSTR	#1, S0, [R0, #0]
;parameter_posterior.h,328 :: 		ti[5] = 97 * sqrt(modFactor);
MOV	R0, R1
VLDR	#1, S0, [R0, #0]
BL	_sqrt+0
MOVW	R0, #0
MOVT	R0, #17090
VMOV	S1, R0
VMUL.F32	S0, S1, S0
MOVW	R0, #lo_addr(_ti+20)
MOVT	R0, #hi_addr(_ti+20)
VSTR	#1, S0, [R0, #0]
;parameter_posterior.h,329 :: 		ai[5] = 0.17 * ((modFactor * modFactor)*sqrt(modFactor)) * 18;
MOVW	R1, #lo_addr(_modFactor+0)
MOVT	R1, #hi_addr(_modFactor+0)
VLDR	#1, S1, [R1, #0]
MOV	R0, R1
VLDR	#1, S0, [R0, #0]
VMUL.F32	S0, S0, S1
VSTR	#1, S0, [SP, #4]
MOV	R0, R1
VLDR	#1, S0, [R0, #0]
BL	_sqrt+0
VLDR	#1, S1, [SP, #4]
VMUL.F32	S1, S1, S0
MOVW	R0, #5243
MOVT	R0, #15918
VMOV	S0, R0
VMUL.F32	S1, S0, S1
VMOV.F32	S0, #18
VMUL.F32	S0, S1, S0
MOVW	R0, #lo_addr(_ai+20)
MOVT	R0, #hi_addr(_ai+20)
VSTR	#1, S0, [R0, #0]
;parameter_posterior.h,330 :: 		bi[5] = 0.4 / modFactor;
MOVW	R1, #lo_addr(_modFactor+0)
MOVT	R1, #hi_addr(_modFactor+0)
VLDR	#1, S1, [R1, #0]
MOVW	R0, #52429
MOVT	R0, #16076
VMOV	S0, R0
VDIV.F32	S0, S0, S1
MOVW	R0, #lo_addr(_bi+20)
MOVT	R0, #hi_addr(_bi+20)
VSTR	#1, S0, [R0, #0]
;parameter_posterior.h,331 :: 		ti[6] = 100 * sqrt(modFactor);
MOV	R0, R1
VLDR	#1, S0, [R0, #0]
BL	_sqrt+0
MOVW	R0, #0
MOVT	R0, #17096
VMOV	S1, R0
VMUL.F32	S0, S1, S0
MOVW	R0, #lo_addr(_ti+24)
MOVT	R0, #hi_addr(_ti+24)
VSTR	#1, S0, [R0, #0]
;parameter_posterior.h,332 :: 		ai[6] = 0.25 *((modFactor * modFactor)*sqrt(modFactor)) * 18;
MOVW	R1, #lo_addr(_modFactor+0)
MOVT	R1, #hi_addr(_modFactor+0)
VLDR	#1, S1, [R1, #0]
MOV	R0, R1
VLDR	#1, S0, [R0, #0]
VMUL.F32	S0, S0, S1
VSTR	#1, S0, [SP, #4]
MOV	R0, R1
VLDR	#1, S0, [R0, #0]
BL	_sqrt+0
VLDR	#1, S1, [SP, #4]
VMUL.F32	S1, S1, S0
VMOV.F32	S0, #0.25
VMUL.F32	S1, S0, S1
VMOV.F32	S0, #18
VMUL.F32	S0, S1, S0
MOVW	R0, #lo_addr(_ai+24)
MOVT	R0, #hi_addr(_ai+24)
VSTR	#1, S0, [R0, #0]
;parameter_posterior.h,333 :: 		bi[6] = 0.2 * modFactor;
MOVW	R0, #lo_addr(_modFactor+0)
MOVT	R0, #hi_addr(_modFactor+0)
VLDR	#1, S1, [R0, #0]
MOVW	R0, #52429
MOVT	R0, #15948
VMOV	S0, R0
VMUL.F32	S0, S0, S1
MOVW	R0, #lo_addr(_bi+24)
MOVT	R0, #hi_addr(_bi+24)
VSTR	#1, S0, [R0, #0]
;parameter_posterior.h,336 :: 		for (i = 1; i <= 6; i++)
; i start address is: 12 (R3)
MOVS	R3, #1
SXTH	R3, R3
; i end address is: 12 (R3)
L_posteriorV5231:
; i start address is: 12 (R3)
CMP	R3, #6
IT	GT
BGT	L_posteriorV5232
;parameter_posterior.h,338 :: 		ti[i] = ti[i] * (pi / 180.0); // konversi ke radian
LSLS	R1, R3, #2
MOVW	R0, #lo_addr(_ti+0)
MOVT	R0, #hi_addr(_ti+0)
ADDS	R2, R0, R1
VLDR	#1, S1, [R2, #0]
MOVW	R0, #64053
MOVT	R0, #15502
VMOV	S0, R0
VMUL.F32	S0, S1, S0
VSTR	#1, S0, [R2, #0]
;parameter_posterior.h,336 :: 		for (i = 1; i <= 6; i++)
ADDS	R3, R3, #1
SXTH	R3, R3
;parameter_posterior.h,339 :: 		}
; i end address is: 12 (R3)
IT	AL
BAL	L_posteriorV5231
L_posteriorV5232:
;parameter_posterior.h,340 :: 		}
L_end_posteriorV5:
LDR	LR, [SP, #0]
ADD	SP, SP, #8
BX	LR
; end of _posteriorV5
_posteriorV6:
;parameter_posterior.h,342 :: 		void posteriorV6()
SUB	SP, SP, #8
STR	LR, [SP, #0]
;parameter_posterior.h,345 :: 		modFactor = sqrt((float)hmean / 60.0);
MOVW	R0, #lo_addr(_hmean+0)
MOVT	R0, #hi_addr(_hmean+0)
VLDR	#1, S1, [R0, #0]
MOVW	R0, #0
MOVT	R0, #17008
VMOV	S0, R0
VDIV.F32	S0, S1, S0
BL	_sqrt+0
MOVW	R0, #lo_addr(_modFactor+0)
MOVT	R0, #hi_addr(_modFactor+0)
VSTR	#1, S0, [R0, #0]
;parameter_posterior.h,347 :: 		ti[1] = -60 * sqrt(modFactor);
VMOV.F32	S0, S0
BL	_sqrt+0
MOVW	R0, #0
MOVT	R0, #49776
VMOV	S1, R0
VMUL.F32	S0, S1, S0
MOVW	R0, #lo_addr(_ti+4)
MOVT	R0, #hi_addr(_ti+4)
VSTR	#1, S0, [R0, #0]
;parameter_posterior.h,348 :: 		ai[1] = 0.8 * 18;
MOVW	R0, #26215
MOVT	R0, #16742
VMOV	S0, R0
MOVW	R0, #lo_addr(_ai+4)
MOVT	R0, #hi_addr(_ai+4)
VSTR	#1, S0, [R0, #0]
;parameter_posterior.h,349 :: 		bi[1] = 0.2 * modFactor;
MOVW	R1, #lo_addr(_modFactor+0)
MOVT	R1, #hi_addr(_modFactor+0)
VLDR	#1, S1, [R1, #0]
MOVW	R0, #52429
MOVT	R0, #15948
VMOV	S0, R0
VMUL.F32	S0, S0, S1
MOVW	R0, #lo_addr(_bi+4)
MOVT	R0, #hi_addr(_bi+4)
VSTR	#1, S0, [R0, #0]
;parameter_posterior.h,350 :: 		ti[2] = -15 * modFactor;
MOV	R0, R1
VLDR	#1, S1, [R0, #0]
VMOV.F32	S0, #-15
VMUL.F32	S0, S0, S1
MOVW	R0, #lo_addr(_ti+8)
MOVT	R0, #hi_addr(_ti+8)
VSTR	#1, S0, [R0, #0]
;parameter_posterior.h,351 :: 		ai[2] = -10 * 18;
MOVW	R0, #0
MOVT	R0, #49972
VMOV	S0, R0
MOVW	R0, #lo_addr(_ai+8)
MOVT	R0, #hi_addr(_ai+8)
VSTR	#1, S0, [R0, #0]
;parameter_posterior.h,352 :: 		bi[2] = 0.1 * modFactor;
MOV	R0, R1
VLDR	#1, S1, [R0, #0]
MOVW	R0, #52429
MOVT	R0, #15820
VMOV	S0, R0
VMUL.F32	S0, S0, S1
MOVW	R0, #lo_addr(_bi+8)
MOVT	R0, #hi_addr(_bi+8)
VSTR	#1, S0, [R0, #0]
;parameter_posterior.h,353 :: 		ti[3] = 0;
MOV	R0, #0
VMOV	S0, R0
MOVW	R0, #lo_addr(_ti+12)
MOVT	R0, #hi_addr(_ti+12)
VSTR	#1, S0, [R0, #0]
;parameter_posterior.h,354 :: 		ai[3] = 37.5 * 18;
MOVW	R0, #49152
MOVT	R0, #17448
VMOV	S0, R0
MOVW	R0, #lo_addr(_ai+12)
MOVT	R0, #hi_addr(_ai+12)
VSTR	#1, S0, [R0, #0]
;parameter_posterior.h,355 :: 		bi[3] = 0.1 * modFactor;
MOV	R0, R1
VLDR	#1, S1, [R0, #0]
MOVW	R0, #52429
MOVT	R0, #15820
VMOV	S0, R0
VMUL.F32	S0, S0, S1
MOVW	R0, #lo_addr(_bi+12)
MOVT	R0, #hi_addr(_bi+12)
VSTR	#1, S0, [R0, #0]
;parameter_posterior.h,356 :: 		ti[4] = 15 * modFactor;
MOV	R0, R1
VLDR	#1, S1, [R0, #0]
VMOV.F32	S0, #15
VMUL.F32	S0, S0, S1
MOVW	R0, #lo_addr(_ti+16)
MOVT	R0, #hi_addr(_ti+16)
VSTR	#1, S0, [R0, #0]
;parameter_posterior.h,357 :: 		ai[4] = 0.5 * 18;
VMOV.F32	S0, #9
MOVW	R0, #lo_addr(_ai+16)
MOVT	R0, #hi_addr(_ai+16)
VSTR	#1, S0, [R0, #0]
;parameter_posterior.h,358 :: 		bi[4] = 0.1 * modFactor;
MOV	R0, R1
VLDR	#1, S1, [R0, #0]
MOVW	R0, #52429
MOVT	R0, #15820
VMOV	S0, R0
VMUL.F32	S0, S0, S1
MOVW	R0, #lo_addr(_bi+16)
MOVT	R0, #hi_addr(_bi+16)
VSTR	#1, S0, [R0, #0]
;parameter_posterior.h,359 :: 		ti[5] = 97 * sqrt(modFactor);
MOV	R0, R1
VLDR	#1, S0, [R0, #0]
BL	_sqrt+0
MOVW	R0, #0
MOVT	R0, #17090
VMOV	S1, R0
VMUL.F32	S0, S1, S0
MOVW	R0, #lo_addr(_ti+20)
MOVT	R0, #hi_addr(_ti+20)
VSTR	#1, S0, [R0, #0]
;parameter_posterior.h,360 :: 		ai[5] = -0.17 * ((modFactor * modFactor)*sqrt(modFactor)) * 18;
MOVW	R1, #lo_addr(_modFactor+0)
MOVT	R1, #hi_addr(_modFactor+0)
VLDR	#1, S1, [R1, #0]
MOV	R0, R1
VLDR	#1, S0, [R0, #0]
VMUL.F32	S0, S0, S1
VSTR	#1, S0, [SP, #4]
MOV	R0, R1
VLDR	#1, S0, [R0, #0]
BL	_sqrt+0
VLDR	#1, S1, [SP, #4]
VMUL.F32	S1, S1, S0
MOVW	R0, #5243
MOVT	R0, #48686
VMOV	S0, R0
VMUL.F32	S1, S0, S1
VMOV.F32	S0, #18
VMUL.F32	S0, S1, S0
MOVW	R0, #lo_addr(_ai+20)
MOVT	R0, #hi_addr(_ai+20)
VSTR	#1, S0, [R0, #0]
;parameter_posterior.h,361 :: 		bi[5] = 0.4 / modFactor;
MOVW	R1, #lo_addr(_modFactor+0)
MOVT	R1, #hi_addr(_modFactor+0)
VLDR	#1, S1, [R1, #0]
MOVW	R0, #52429
MOVT	R0, #16076
VMOV	S0, R0
VDIV.F32	S0, S0, S1
MOVW	R0, #lo_addr(_bi+20)
MOVT	R0, #hi_addr(_bi+20)
VSTR	#1, S0, [R0, #0]
;parameter_posterior.h,362 :: 		ti[6] = 100 * sqrt(modFactor);
MOV	R0, R1
VLDR	#1, S0, [R0, #0]
BL	_sqrt+0
MOVW	R0, #0
MOVT	R0, #17096
VMOV	S1, R0
VMUL.F32	S0, S1, S0
MOVW	R0, #lo_addr(_ti+24)
MOVT	R0, #hi_addr(_ti+24)
VSTR	#1, S0, [R0, #0]
;parameter_posterior.h,363 :: 		ai[6] = -0.25 *((modFactor * modFactor)*sqrt(modFactor)) * 18;
MOVW	R1, #lo_addr(_modFactor+0)
MOVT	R1, #hi_addr(_modFactor+0)
VLDR	#1, S1, [R1, #0]
MOV	R0, R1
VLDR	#1, S0, [R0, #0]
VMUL.F32	S0, S0, S1
VSTR	#1, S0, [SP, #4]
MOV	R0, R1
VLDR	#1, S0, [R0, #0]
BL	_sqrt+0
VLDR	#1, S1, [SP, #4]
VMUL.F32	S1, S1, S0
VMOV.F32	S0, #-0.25
VMUL.F32	S1, S0, S1
VMOV.F32	S0, #18
VMUL.F32	S0, S1, S0
MOVW	R0, #lo_addr(_ai+24)
MOVT	R0, #hi_addr(_ai+24)
VSTR	#1, S0, [R0, #0]
;parameter_posterior.h,364 :: 		bi[6] = 0.2 * modFactor;
MOVW	R0, #lo_addr(_modFactor+0)
MOVT	R0, #hi_addr(_modFactor+0)
VLDR	#1, S1, [R0, #0]
MOVW	R0, #52429
MOVT	R0, #15948
VMOV	S0, R0
VMUL.F32	S0, S0, S1
MOVW	R0, #lo_addr(_bi+24)
MOVT	R0, #hi_addr(_bi+24)
VSTR	#1, S0, [R0, #0]
;parameter_posterior.h,367 :: 		for (i = 1; i <= 6; i++)
; i start address is: 12 (R3)
MOVS	R3, #1
SXTH	R3, R3
; i end address is: 12 (R3)
L_posteriorV6234:
; i start address is: 12 (R3)
CMP	R3, #6
IT	GT
BGT	L_posteriorV6235
;parameter_posterior.h,369 :: 		ti[i] = ti[i] * (pi / 180.0); // konversi ke radian
LSLS	R1, R3, #2
MOVW	R0, #lo_addr(_ti+0)
MOVT	R0, #hi_addr(_ti+0)
ADDS	R2, R0, R1
VLDR	#1, S1, [R2, #0]
MOVW	R0, #64053
MOVT	R0, #15502
VMOV	S0, R0
VMUL.F32	S0, S1, S0
VSTR	#1, S0, [R2, #0]
;parameter_posterior.h,367 :: 		for (i = 1; i <= 6; i++)
ADDS	R3, R3, #1
SXTH	R3, R3
;parameter_posterior.h,370 :: 		}
; i end address is: 12 (R3)
IT	AL
BAL	L_posteriorV6234
L_posteriorV6235:
;parameter_posterior.h,371 :: 		}
L_end_posteriorV6:
LDR	LR, [SP, #0]
ADD	SP, SP, #8
BX	LR
; end of _posteriorV6
_omega:
;rungekutta.h,2 :: 		float omega(float input)
SUB	SP, SP, #4
STR	LR, [SP, #0]
; input start address is: 0 (R0)
VMOV.F32	S2, S0
; input end address is: 0 (R0)
; input start address is: 8 (R2)
;rungekutta.h,5 :: 		i = (int)(floor(input / (float)(2.0 * fsecg)));
MOVW	R1, #lo_addr(_fsecg+0)
MOVT	R1, #hi_addr(_fsecg+0)
LDRSH	R1, [R1, #0]
VMOV	S1, R1
VCVT.F32	#1, S1, S1
VMOV.F32	S0, #2
VMUL.F32	S0, S0, S1
VDIV.F32	S0, S2, S0
; input end address is: 8 (R2)
BL	_floor+0
VCVT	#1, .F32, S0, S0
VMOV	R1, S0
SXTH	R1, R1
;rungekutta.h,6 :: 		return 2 * 3.141592653 / scale_sig[i];
LSLS	R2, R1, #2
MOVW	R1, #lo_addr(_scale_sig+0)
MOVT	R1, #hi_addr(_scale_sig+0)
ADDS	R1, R1, R2
VLDR	#1, S1, [R1, #0]
MOVW	R1, #4059
MOVT	R1, #16585
VMOV	S0, R1
VDIV.F32	S0, S0, S1
;rungekutta.h,7 :: 		}
L_end_omega:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _omega
_arctan2:
;rungekutta.h,8 :: 		float arctan2(float y, float x)
SUB	SP, SP, #8
STR	LR, [SP, #0]
; x start address is: 4 (R1)
; y start address is: 0 (R0)
VMOV.F32	S6, S0
VMOV.F32	S7, S1
; x end address is: 4 (R1)
; y end address is: 0 (R0)
; y start address is: 24 (R6)
; x start address is: 28 (R7)
;rungekutta.h,10 :: 		return 2 * (atan(y / (sqrt(pow(x, 2) + pow(y, 2)) + x)));
VMOV.F32	S1, #2
VMOV.F32	S0, S7
BL	_pow+0
VSTR	#1, S0, [SP, #4]
VMOV.F32	S1, #2
VMOV.F32	S0, S6
BL	_pow+0
VLDR	#1, S1, [SP, #4]
VADD.F32	S0, S1, S0
BL	_sqrt+0
VADD.F32	S0, S0, S7
; x end address is: 28 (R7)
VDIV.F32	S0, S6, S0
; y end address is: 24 (R6)
BL	_atan+0
VMOV.F32	S1, #2
VMUL.F32	S0, S1, S0
;rungekutta.h,11 :: 		}
L_end_arctan2:
LDR	LR, [SP, #0]
ADD	SP, SP, #8
BX	LR
; end of _arctan2
_modul:
;rungekutta.h,12 :: 		float modul(float input1, float input2)
SUB	SP, SP, #4
STR	LR, [SP, #0]
; input2 start address is: 4 (R1)
; input1 start address is: 0 (R0)
VMOV.F32	S2, S0
VMOV.F32	S3, S1
; input2 end address is: 4 (R1)
; input1 end address is: 0 (R0)
; input1 start address is: 8 (R2)
; input2 start address is: 12 (R3)
;rungekutta.h,14 :: 		float result = 0;
; result start address is: 16 (R4)
MOV	R2, #0
VMOV	S4, R2
;rungekutta.h,15 :: 		if (fabs(input1) < input2)
VMOV.F32	S0, S2
BL	_fabs+0
VCMPE.F32	S0, S3
VMRS	#60, FPSCR
IT	GE
BGE	L_modul237
;rungekutta.h,17 :: 		if (input1 < 0)
VCMPE.F32	S2, #0
VMRS	#60, FPSCR
IT	GE
BGE	L_modul238
; result end address is: 16 (R4)
;rungekutta.h,19 :: 		result = input1 + input2;
VADD.F32	S0, S2, S3
; input2 end address is: 12 (R3)
; input1 end address is: 8 (R2)
; result start address is: 0 (R0)
;rungekutta.h,20 :: 		}
; result end address is: 0 (R0)
IT	AL
BAL	L_modul239
L_modul238:
;rungekutta.h,21 :: 		else if (input1 == 0)
; input1 start address is: 8 (R2)
; result start address is: 16 (R4)
VCMPE.F32	S2, #0
VMRS	#60, FPSCR
IT	NE
BNE	L_modul240
; result end address is: 16 (R4)
; input1 end address is: 8 (R2)
;rungekutta.h,23 :: 		result = 0;
MOV	R2, #0
; result start address is: 0 (R0)
VMOV	S0, R2
;rungekutta.h,24 :: 		}
; result end address is: 0 (R0)
IT	AL
BAL	L_modul241
L_modul240:
;rungekutta.h,25 :: 		else if (input1 > 0)
; input1 start address is: 8 (R2)
; result start address is: 16 (R4)
VCMPE.F32	S2, #0
VMRS	#60, FPSCR
IT	LE
BLE	L__modul288
; result end address is: 16 (R4)
;rungekutta.h,27 :: 		result = input1;
; result start address is: 0 (R0)
VMOV.F32	S0, S2
; input1 end address is: 8 (R2)
; result end address is: 0 (R0)
;rungekutta.h,28 :: 		}
IT	AL
BAL	L_modul242
L__modul288:
;rungekutta.h,25 :: 		else if (input1 > 0)
VMOV.F32	S0, S4
;rungekutta.h,28 :: 		}
L_modul242:
; result start address is: 0 (R0)
; result end address is: 0 (R0)
L_modul241:
; result start address is: 0 (R0)
; result end address is: 0 (R0)
L_modul239:
;rungekutta.h,29 :: 		}
; result start address is: 0 (R0)
; result end address is: 0 (R0)
IT	AL
BAL	L_modul243
L_modul237:
;rungekutta.h,30 :: 		else if (input1 > 0)
; input1 start address is: 8 (R2)
; result start address is: 16 (R4)
; input2 start address is: 12 (R3)
VCMPE.F32	S2, #0
VMRS	#60, FPSCR
IT	LE
BLE	L_modul244
; input2 end address is: 12 (R3)
; result end address is: 16 (R4)
; input1 end address is: 8 (R2)
VMOV.F32	S1, S3
;rungekutta.h,32 :: 		while (input1 > input2)
L_modul245:
; input2 start address is: 4 (R1)
; input1 start address is: 8 (R2)
VCMPE.F32	S2, S1
VMRS	#60, FPSCR
IT	LE
BLE	L_modul246
;rungekutta.h,34 :: 		input1 = input1 - input2;
VSUB.F32	S2, S2, S1
;rungekutta.h,35 :: 		}
; input2 end address is: 4 (R1)
IT	AL
BAL	L_modul245
L_modul246:
;rungekutta.h,36 :: 		result = input1;
; result start address is: 0 (R0)
VMOV.F32	S0, S2
; input1 end address is: 8 (R2)
;rungekutta.h,37 :: 		}
; result end address is: 0 (R0)
IT	AL
BAL	L_modul247
L_modul244:
;rungekutta.h,38 :: 		else if (input1 < 0)
; input1 start address is: 8 (R2)
; result start address is: 16 (R4)
; input2 start address is: 12 (R3)
VCMPE.F32	S2, #0
VMRS	#60, FPSCR
IT	GE
BGE	L__modul289
; input2 end address is: 12 (R3)
; result end address is: 16 (R4)
; input1 end address is: 8 (R2)
VMOV.F32	S1, S3
;rungekutta.h,40 :: 		while (input1 < 0)
L_modul249:
; input2 start address is: 4 (R1)
; input2 start address is: 4 (R1)
; input2 end address is: 4 (R1)
; input1 start address is: 8 (R2)
VCMPE.F32	S2, #0
VMRS	#60, FPSCR
IT	GE
BGE	L_modul250
; input2 end address is: 4 (R1)
;rungekutta.h,42 :: 		input1 = input1 + input2;
; input2 start address is: 4 (R1)
VADD.F32	S2, S2, S1
;rungekutta.h,43 :: 		}
; input2 end address is: 4 (R1)
IT	AL
BAL	L_modul249
L_modul250:
;rungekutta.h,44 :: 		result = input1;
; result start address is: 0 (R0)
VMOV.F32	S0, S2
; input1 end address is: 8 (R2)
; result end address is: 0 (R0)
;rungekutta.h,45 :: 		}
IT	AL
BAL	L_modul248
L__modul289:
;rungekutta.h,38 :: 		else if (input1 < 0)
VMOV.F32	S0, S4
;rungekutta.h,45 :: 		}
L_modul248:
; result start address is: 0 (R0)
; result end address is: 0 (R0)
L_modul247:
; result start address is: 0 (R0)
; result end address is: 0 (R0)
L_modul243:
;rungekutta.h,46 :: 		return result;
; result start address is: 0 (R0)
; result end address is: 0 (R0)
;rungekutta.h,47 :: 		}
L_end_modul:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _modul
_Xdynamical:
;rungekutta.h,49 :: 		float Xdynamical(float t0, float x0, float y0)
SUB	SP, SP, #8
STR	LR, [SP, #0]
; y0 start address is: 8 (R2)
; x0 start address is: 4 (R1)
; t0 start address is: 0 (R0)
VMOV.F32	S4, S0
VMOV.F32	S5, S1
VMOV.F32	S6, S2
; y0 end address is: 8 (R2)
; x0 end address is: 4 (R1)
; t0 end address is: 0 (R0)
; t0 start address is: 16 (R4)
; x0 start address is: 20 (R5)
; y0 start address is: 24 (R6)
;rungekutta.h,51 :: 		float alfa = 1 - sqrt(x0*x0) + (y0*y0);
VMUL.F32	S0, S5, S5
BL	_sqrt+0
VMOV.F32	S1, #1
VSUB.F32	S1, S1, S0
VMUL.F32	S0, S6, S6
VADD.F32	S0, S1, S0
;rungekutta.h,52 :: 		return (alfa * x0) - (omega(t0) * y0);
VMUL.F32	S0, S0, S5
; x0 end address is: 20 (R5)
VSTR	#1, S0, [SP, #4]
VMOV.F32	S0, S4
; t0 end address is: 16 (R4)
BL	_omega+0
VMUL.F32	S1, S0, S6
; y0 end address is: 24 (R6)
VLDR	#1, S0, [SP, #4]
VSUB.F32	S0, S0, S1
;rungekutta.h,53 :: 		}
L_end_Xdynamical:
LDR	LR, [SP, #0]
ADD	SP, SP, #8
BX	LR
; end of _Xdynamical
_Ydynamical:
;rungekutta.h,54 :: 		float Ydynamical(float t0, float x0, float y0)
SUB	SP, SP, #8
STR	LR, [SP, #0]
; y0 start address is: 8 (R2)
; x0 start address is: 4 (R1)
; t0 start address is: 0 (R0)
VMOV.F32	S4, S0
VMOV.F32	S5, S1
VMOV.F32	S6, S2
; y0 end address is: 8 (R2)
; x0 end address is: 4 (R1)
; t0 end address is: 0 (R0)
; t0 start address is: 16 (R4)
; x0 start address is: 20 (R5)
; y0 start address is: 24 (R6)
;rungekutta.h,56 :: 		float alfa = 1 - sqrt(x0*x0) + (y0*y0);
VMUL.F32	S0, S5, S5
BL	_sqrt+0
VMOV.F32	S1, #1
VSUB.F32	S1, S1, S0
VMUL.F32	S0, S6, S6
VADD.F32	S0, S1, S0
;rungekutta.h,57 :: 		return (alfa * y0) + (omega(t0) * x0);
VMUL.F32	S0, S0, S6
; y0 end address is: 24 (R6)
VSTR	#1, S0, [SP, #4]
VMOV.F32	S0, S4
; t0 end address is: 16 (R4)
BL	_omega+0
VMUL.F32	S1, S0, S5
; x0 end address is: 20 (R5)
VLDR	#1, S0, [SP, #4]
VADD.F32	S0, S0, S1
;rungekutta.h,58 :: 		}
L_end_Ydynamical:
LDR	LR, [SP, #0]
ADD	SP, SP, #8
BX	LR
; end of _Ydynamical
_Zdynamical:
;rungekutta.h,59 :: 		float Zdynamical(float t0, float x0, float y0, float z0)
SUB	SP, SP, #12
STR	LR, [SP, #0]
; z0 start address is: 12 (R3)
; y0 start address is: 8 (R2)
; x0 start address is: 4 (R1)
; t0 start address is: 0 (R0)
VMOV.F32	S6, S2
VMOV.F32	S2, S0
VMOV.F32	S5, S1
VMOV.F32	S8, S3
; z0 end address is: 12 (R3)
; y0 end address is: 8 (R2)
; x0 end address is: 4 (R1)
; t0 end address is: 0 (R0)
; t0 start address is: 8 (R2)
; x0 start address is: 20 (R5)
; y0 start address is: 24 (R6)
; z0 start address is: 32 (R8)
;rungekutta.h,60 :: 		{   float sum = 0.0;
; sum start address is: 36 (R9)
MOV	R4, #0
VMOV	S9, R4
;rungekutta.h,63 :: 		float z_0 = 0.1 * sin(6.283185306 * t0 * 0.25);
MOVW	R4, #4059
MOVT	R4, #16585
VMOV	S0, R4
VMUL.F32	S1, S0, S2
; t0 end address is: 8 (R2)
VMOV.F32	S0, #0.25
VMUL.F32	S0, S1, S0
BL	_sin+0
MOVW	R4, #52429
MOVT	R4, #15820
VMOV	S1, R4
VMUL.F32	S0, S1, S0
; z_0 start address is: 40 (R10)
VMOV.F32	S10, S0
;rungekutta.h,64 :: 		float teta = arctan2(y0, x0);
VMOV.F32	S1, S5
; x0 end address is: 20 (R5)
VMOV.F32	S0, S6
; y0 end address is: 24 (R6)
BL	_arctan2+0
; teta start address is: 20 (R5)
VMOV.F32	S5, S0
;rungekutta.h,68 :: 		for (i = 0; i <= 6; i++)
; i start address is: 24 (R6)
MOVS	R6, #0
SXTH	R6, R6
; z0 end address is: 32 (R8)
; sum end address is: 36 (R9)
; z_0 end address is: 40 (R10)
; i end address is: 24 (R6)
VMOV.F32	S7, S8
VMOV.F32	S8, S9
VMOV.F32	S6, S10
L_Zdynamical251:
; i start address is: 24 (R6)
; teta start address is: 20 (R5)
; teta end address is: 20 (R5)
; z_0 start address is: 24 (R6)
; sum start address is: 32 (R8)
; z0 start address is: 28 (R7)
CMP	R6, #6
IT	GT
BGT	L_Zdynamical252
; teta end address is: 20 (R5)
;rungekutta.h,70 :: 		delta = modul(teta - ti[i], 6.283185306) - 3.141592653;
; teta start address is: 20 (R5)
LSLS	R5, R6, #2
MOVW	R4, #lo_addr(_ti+0)
MOVT	R4, #hi_addr(_ti+0)
ADDS	R4, R4, R5
VLDR	#1, S0, [R4, #0]
VSUB.F32	S0, S5, S0
MOVW	R4, #4059
MOVT	R4, #16585
VMOV	S1, R4
BL	_modul+0
MOVW	R4, #4059
MOVT	R4, #16457
VMOV	S1, R4
VSUB.F32	S3, S0, S1
;rungekutta.h,71 :: 		sq_delta = delta * delta;
VMUL.F32	S2, S3, S3
;rungekutta.h,72 :: 		sq_b = bi[i] * bi[i];
LSLS	R5, R6, #2
MOVW	R4, #lo_addr(_bi+0)
MOVT	R4, #hi_addr(_bi+0)
ADDS	R4, R4, R5
VLDR	#1, S0, [R4, #0]
VMUL.F32	S1, S0, S0
;rungekutta.h,73 :: 		sum += (-ai[i] * delta * exp((-0.5 * sq_delta) / (float)(sq_b)));
MOVW	R4, #lo_addr(_ai+0)
MOVT	R4, #hi_addr(_ai+0)
ADDS	R4, R4, R5
VLDR	#1, S0, [R4, #0]
VNEG.F32	S0, S0
VMUL.F32	S0, S0, S3
VSTR	#1, S0, [SP, #8]
VMOV.F32	S0, #-0.5
VMUL.F32	S0, S0, S2
VDIV.F32	S0, S0, S1
BL	_exp+0
VLDR	#1, S1, [SP, #8]
VMUL.F32	S0, S1, S0
VADD.F32	S8, S8, S0
;rungekutta.h,68 :: 		for (i = 0; i <= 6; i++)
ADDS	R6, R6, #1
SXTH	R6, R6
;rungekutta.h,74 :: 		}
STRH	R6, [SP, #4]
; teta end address is: 20 (R5)
; i end address is: 24 (R6)
LDRSH	R6, [SP, #4]
IT	AL
BAL	L_Zdynamical251
L_Zdynamical252:
;rungekutta.h,76 :: 		sum1 = sum - (z0-z_0);
VSUB.F32	S0, S7, S6
; z_0 end address is: 24 (R6)
; z0 end address is: 28 (R7)
VSUB.F32	S0, S8, S0
; sum end address is: 32 (R8)
;rungekutta.h,77 :: 		return sum1;
;rungekutta.h,78 :: 		}
L_end_Zdynamical:
LDR	LR, [SP, #0]
ADD	SP, SP, #12
BX	LR
; end of _Zdynamical
_rungekutta:
;rungekutta.h,80 :: 		void rungekutta()
SUB	SP, SP, #8
STR	LR, [SP, #0]
;rungekutta.h,82 :: 		int i = 0;
;rungekutta.h,83 :: 		float h = 1.0 / (float)(2.0 * fsecg) ;
MOVW	R0, #lo_addr(_fsecg+0)
MOVT	R0, #hi_addr(_fsecg+0)
LDRSH	R0, [R0, #0]
VMOV	S1, R0
VCVT.F32	#1, S1, S1
VMOV.F32	S0, #2
VMUL.F32	S1, S0, S1
VMOV.F32	S0, #1
VDIV.F32	S11, S0, S1
; h start address is: 44 (R11)
;rungekutta.h,85 :: 		x[0] = 0.1;
MOVW	R0, #52429
MOVT	R0, #15820
VMOV	S0, R0
MOVW	R0, #lo_addr(_x+0)
MOVT	R0, #hi_addr(_x+0)
VSTR	#1, S0, [R0, #0]
;rungekutta.h,86 :: 		y[0] = 0.0;
MOV	R0, #0
VMOV	S0, R0
MOVW	R0, #lo_addr(_y+0)
MOVT	R0, #hi_addr(_y+0)
VSTR	#1, S0, [R0, #0]
;rungekutta.h,87 :: 		z[0] = 0.0;
MOV	R0, #0
VMOV	S0, R0
MOVW	R0, #lo_addr(_z+0)
MOVT	R0, #hi_addr(_z+0)
VSTR	#1, S0, [R0, #0]
;rungekutta.h,89 :: 		for(i = 0; i<(jumlah*2*fsecg) ;i++)
; i start address is: 28 (R7)
MOVS	R7, #0
SXTH	R7, R7
; i end address is: 28 (R7)
L_rungekutta254:
; i start address is: 28 (R7)
; h start address is: 44 (R11)
; h end address is: 44 (R11)
MOVW	R0, #lo_addr(_jumlah+0)
MOVT	R0, #hi_addr(_jumlah+0)
LDRSH	R0, [R0, #0]
LSLS	R1, R0, #1
SXTH	R1, R1
MOVW	R0, #lo_addr(_fsecg+0)
MOVT	R0, #hi_addr(_fsecg+0)
LDRSH	R0, [R0, #0]
MULS	R0, R1, R0
SXTH	R0, R0
CMP	R7, R0
IT	GE
BGE	L_rungekutta255
; h end address is: 44 (R11)
;rungekutta.h,91 :: 		float num = (float)i / (float)(512.0);
; h start address is: 44 (R11)
VMOV	S1, R7
VCVT.F32	#1, S1, S1
MOV	R0, #1140850688
VMOV	S0, R0
VDIV.F32	S2, S1, S0
; num start address is: 48 (R12)
VMOV.F32	S12, S2
;rungekutta.h,92 :: 		k1[1][1] = Xdynamical(num, x[i], y[i]);
LSLS	R1, R7, #2
MOVW	R0, #lo_addr(_y+0)
MOVT	R0, #hi_addr(_y+0)
ADDS	R0, R0, R1
VLDR	#1, S0, [R0, #0]
VMOV.F32	S1, S0
MOVW	R0, #lo_addr(_x+0)
MOVT	R0, #hi_addr(_x+0)
ADDS	R0, R0, R1
VLDR	#1, S0, [R0, #0]
VSTR	#1, S0, [SP, #4]
VMOV.F32	S0, S2
VMOV.F32	S2, S1
VLDR	#1, S1, [SP, #4]
BL	_Xdynamical+0
MOVW	R0, #lo_addr(_k1+24)
MOVT	R0, #hi_addr(_k1+24)
VSTR	#1, S0, [R0, #0]
;rungekutta.h,93 :: 		k1[1][2] = Ydynamical(num, x[i], y[i]);
LSLS	R1, R7, #2
MOVW	R0, #lo_addr(_y+0)
MOVT	R0, #hi_addr(_y+0)
ADDS	R0, R0, R1
VLDR	#1, S0, [R0, #0]
VMOV.F32	S1, S0
MOVW	R0, #lo_addr(_x+0)
MOVT	R0, #hi_addr(_x+0)
ADDS	R0, R0, R1
VLDR	#1, S0, [R0, #0]
VMOV.F32	S2, S1
VMOV.F32	S1, S0
VMOV.F32	S0, S12
BL	_Ydynamical+0
MOVW	R0, #lo_addr(_k1+28)
MOVT	R0, #hi_addr(_k1+28)
VSTR	#1, S0, [R0, #0]
;rungekutta.h,94 :: 		k1[1][3] = Zdynamical(num, x[i], y[i], z[i]);
LSLS	R1, R7, #2
MOVW	R0, #lo_addr(_z+0)
MOVT	R0, #hi_addr(_z+0)
ADDS	R0, R0, R1
VLDR	#1, S0, [R0, #0]
VMOV.F32	S2, S0
MOVW	R0, #lo_addr(_y+0)
MOVT	R0, #hi_addr(_y+0)
ADDS	R0, R0, R1
VLDR	#1, S0, [R0, #0]
VMOV.F32	S1, S0
MOVW	R0, #lo_addr(_x+0)
MOVT	R0, #hi_addr(_x+0)
ADDS	R0, R0, R1
VLDR	#1, S0, [R0, #0]
VMOV.F32	S3, S2
VMOV.F32	S2, S1
VMOV.F32	S1, S0
VMOV.F32	S0, S12
BL	_Zdynamical+0
MOVW	R0, #lo_addr(_k1+32)
MOVT	R0, #hi_addr(_k1+32)
VSTR	#1, S0, [R0, #0]
;rungekutta.h,96 :: 		k1[2][1] = Xdynamical(num, x[i] + (0.5 * h), (y[i] + 0.5 * k1[1][2] * h));
LSLS	R1, R7, #2
MOVW	R0, #lo_addr(_y+0)
MOVT	R0, #hi_addr(_y+0)
ADDS	R0, R0, R1
VLDR	#1, S2, [R0, #0]
MOVW	R0, #lo_addr(_k1+28)
MOVT	R0, #hi_addr(_k1+28)
VLDR	#1, S1, [R0, #0]
VMOV.F32	S0, #0.5
VMUL.F32	S0, S0, S1
VMUL.F32	S0, S0, S11
VADD.F32	S2, S2, S0
MOVW	R0, #lo_addr(_x+0)
MOVT	R0, #hi_addr(_x+0)
ADDS	R0, R0, R1
VLDR	#1, S1, [R0, #0]
VMOV.F32	S0, #0.5
VMUL.F32	S0, S0, S11
VADD.F32	S0, S1, S0
VMOV.F32	S1, S0
VMOV.F32	S0, S12
BL	_Xdynamical+0
MOVW	R0, #lo_addr(_k1+44)
MOVT	R0, #hi_addr(_k1+44)
VSTR	#1, S0, [R0, #0]
;rungekutta.h,97 :: 		k1[2][2] = Ydynamical(num, x[i] + (0.5 * h), (y[i] + 0.5 * k1[1][2] * h));
LSLS	R1, R7, #2
MOVW	R0, #lo_addr(_y+0)
MOVT	R0, #hi_addr(_y+0)
ADDS	R0, R0, R1
VLDR	#1, S2, [R0, #0]
MOVW	R0, #lo_addr(_k1+28)
MOVT	R0, #hi_addr(_k1+28)
VLDR	#1, S1, [R0, #0]
VMOV.F32	S0, #0.5
VMUL.F32	S0, S0, S1
VMUL.F32	S0, S0, S11
VADD.F32	S2, S2, S0
MOVW	R0, #lo_addr(_x+0)
MOVT	R0, #hi_addr(_x+0)
ADDS	R0, R0, R1
VLDR	#1, S1, [R0, #0]
VMOV.F32	S0, #0.5
VMUL.F32	S0, S0, S11
VADD.F32	S0, S1, S0
VMOV.F32	S1, S0
VMOV.F32	S0, S12
BL	_Ydynamical+0
MOVW	R0, #lo_addr(_k1+48)
MOVT	R0, #hi_addr(_k1+48)
VSTR	#1, S0, [R0, #0]
;rungekutta.h,98 :: 		k1[2][3] = Zdynamical(num, x[i] + (0.5 * h), (y[i] + 0.5 * k1[1][2] * h), (z[i] + (0.5 * k1[1][3] * h)));
LSLS	R1, R7, #2
MOVW	R0, #lo_addr(_z+0)
MOVT	R0, #hi_addr(_z+0)
ADDS	R0, R0, R1
VLDR	#1, S2, [R0, #0]
MOVW	R0, #lo_addr(_k1+32)
MOVT	R0, #hi_addr(_k1+32)
VLDR	#1, S1, [R0, #0]
VMOV.F32	S0, #0.5
VMUL.F32	S0, S0, S1
VMUL.F32	S0, S0, S11
VADD.F32	S3, S2, S0
MOVW	R0, #lo_addr(_y+0)
MOVT	R0, #hi_addr(_y+0)
ADDS	R0, R0, R1
VLDR	#1, S2, [R0, #0]
MOVW	R0, #lo_addr(_k1+28)
MOVT	R0, #hi_addr(_k1+28)
VLDR	#1, S1, [R0, #0]
VMOV.F32	S0, #0.5
VMUL.F32	S0, S0, S1
VMUL.F32	S0, S0, S11
VADD.F32	S2, S2, S0
MOVW	R0, #lo_addr(_x+0)
MOVT	R0, #hi_addr(_x+0)
ADDS	R0, R0, R1
VLDR	#1, S1, [R0, #0]
VMOV.F32	S0, #0.5
VMUL.F32	S0, S0, S11
VADD.F32	S0, S1, S0
VMOV.F32	S1, S0
VMOV.F32	S0, S12
BL	_Zdynamical+0
MOVW	R0, #lo_addr(_k1+52)
MOVT	R0, #hi_addr(_k1+52)
VSTR	#1, S0, [R0, #0]
;rungekutta.h,100 :: 		k1[3][1] = Xdynamical(num, x[i] + (0.5 * h), (y[i] + 0.5 * k1[2][2] * h));
LSLS	R1, R7, #2
MOVW	R0, #lo_addr(_y+0)
MOVT	R0, #hi_addr(_y+0)
ADDS	R0, R0, R1
VLDR	#1, S2, [R0, #0]
MOVW	R0, #lo_addr(_k1+48)
MOVT	R0, #hi_addr(_k1+48)
VLDR	#1, S1, [R0, #0]
VMOV.F32	S0, #0.5
VMUL.F32	S0, S0, S1
VMUL.F32	S0, S0, S11
VADD.F32	S2, S2, S0
MOVW	R0, #lo_addr(_x+0)
MOVT	R0, #hi_addr(_x+0)
ADDS	R0, R0, R1
VLDR	#1, S1, [R0, #0]
VMOV.F32	S0, #0.5
VMUL.F32	S0, S0, S11
VADD.F32	S0, S1, S0
VMOV.F32	S1, S0
VMOV.F32	S0, S12
BL	_Xdynamical+0
MOVW	R0, #lo_addr(_k1+64)
MOVT	R0, #hi_addr(_k1+64)
VSTR	#1, S0, [R0, #0]
;rungekutta.h,101 :: 		k1[3][2] = Ydynamical(num, x[i] + (0.5 * h), (y[i] + 0.5 * k1[2][2] * h));
LSLS	R1, R7, #2
MOVW	R0, #lo_addr(_y+0)
MOVT	R0, #hi_addr(_y+0)
ADDS	R0, R0, R1
VLDR	#1, S2, [R0, #0]
MOVW	R0, #lo_addr(_k1+48)
MOVT	R0, #hi_addr(_k1+48)
VLDR	#1, S1, [R0, #0]
VMOV.F32	S0, #0.5
VMUL.F32	S0, S0, S1
VMUL.F32	S0, S0, S11
VADD.F32	S2, S2, S0
MOVW	R0, #lo_addr(_x+0)
MOVT	R0, #hi_addr(_x+0)
ADDS	R0, R0, R1
VLDR	#1, S1, [R0, #0]
VMOV.F32	S0, #0.5
VMUL.F32	S0, S0, S11
VADD.F32	S0, S1, S0
VMOV.F32	S1, S0
VMOV.F32	S0, S12
BL	_Ydynamical+0
MOVW	R0, #lo_addr(_k1+68)
MOVT	R0, #hi_addr(_k1+68)
VSTR	#1, S0, [R0, #0]
;rungekutta.h,102 :: 		k1[3][3] = Zdynamical(num, x[i] + (0.5 * h), (y[i] + 0.5 * k1[2][2] * h), (z[i] + (0.5 * k1[2][3] * h)));
LSLS	R1, R7, #2
MOVW	R0, #lo_addr(_z+0)
MOVT	R0, #hi_addr(_z+0)
ADDS	R0, R0, R1
VLDR	#1, S2, [R0, #0]
MOVW	R0, #lo_addr(_k1+52)
MOVT	R0, #hi_addr(_k1+52)
VLDR	#1, S1, [R0, #0]
VMOV.F32	S0, #0.5
VMUL.F32	S0, S0, S1
VMUL.F32	S0, S0, S11
VADD.F32	S3, S2, S0
MOVW	R0, #lo_addr(_y+0)
MOVT	R0, #hi_addr(_y+0)
ADDS	R0, R0, R1
VLDR	#1, S2, [R0, #0]
MOVW	R0, #lo_addr(_k1+48)
MOVT	R0, #hi_addr(_k1+48)
VLDR	#1, S1, [R0, #0]
VMOV.F32	S0, #0.5
VMUL.F32	S0, S0, S1
VMUL.F32	S0, S0, S11
VADD.F32	S2, S2, S0
MOVW	R0, #lo_addr(_x+0)
MOVT	R0, #hi_addr(_x+0)
ADDS	R0, R0, R1
VLDR	#1, S1, [R0, #0]
VMOV.F32	S0, #0.5
VMUL.F32	S0, S0, S11
VADD.F32	S0, S1, S0
VMOV.F32	S1, S0
VMOV.F32	S0, S12
BL	_Zdynamical+0
MOVW	R0, #lo_addr(_k1+72)
MOVT	R0, #hi_addr(_k1+72)
VSTR	#1, S0, [R0, #0]
;rungekutta.h,104 :: 		k1[4][1] = Xdynamical(num, (x[i] + h), (y[i] + k1[3][2] * h));
LSLS	R1, R7, #2
MOVW	R0, #lo_addr(_y+0)
MOVT	R0, #hi_addr(_y+0)
ADDS	R0, R0, R1
VLDR	#1, S1, [R0, #0]
MOVW	R0, #lo_addr(_k1+68)
MOVT	R0, #hi_addr(_k1+68)
VLDR	#1, S0, [R0, #0]
VMUL.F32	S0, S0, S11
VADD.F32	S1, S1, S0
MOVW	R0, #lo_addr(_x+0)
MOVT	R0, #hi_addr(_x+0)
ADDS	R0, R0, R1
VLDR	#1, S0, [R0, #0]
VADD.F32	S0, S0, S11
VMOV.F32	S2, S1
VMOV.F32	S1, S0
VMOV.F32	S0, S12
BL	_Xdynamical+0
MOVW	R0, #lo_addr(_k1+84)
MOVT	R0, #hi_addr(_k1+84)
VSTR	#1, S0, [R0, #0]
;rungekutta.h,105 :: 		k1[4][2] = Ydynamical(num, (x[i] + h), (y[i] + k1[3][2] * h));
LSLS	R1, R7, #2
MOVW	R0, #lo_addr(_y+0)
MOVT	R0, #hi_addr(_y+0)
ADDS	R0, R0, R1
VLDR	#1, S1, [R0, #0]
MOVW	R0, #lo_addr(_k1+68)
MOVT	R0, #hi_addr(_k1+68)
VLDR	#1, S0, [R0, #0]
VMUL.F32	S0, S0, S11
VADD.F32	S1, S1, S0
MOVW	R0, #lo_addr(_x+0)
MOVT	R0, #hi_addr(_x+0)
ADDS	R0, R0, R1
VLDR	#1, S0, [R0, #0]
VADD.F32	S0, S0, S11
VMOV.F32	S2, S1
VMOV.F32	S1, S0
VMOV.F32	S0, S12
BL	_Ydynamical+0
MOVW	R0, #lo_addr(_k1+88)
MOVT	R0, #hi_addr(_k1+88)
VSTR	#1, S0, [R0, #0]
;rungekutta.h,106 :: 		k1[4][3] = Zdynamical(num, (x[i] + h), (y[i] + k1[3][2] * h), (z[i] + (k1[3][3] * h)));
LSLS	R1, R7, #2
MOVW	R0, #lo_addr(_z+0)
MOVT	R0, #hi_addr(_z+0)
ADDS	R0, R0, R1
VLDR	#1, S1, [R0, #0]
MOVW	R0, #lo_addr(_k1+72)
MOVT	R0, #hi_addr(_k1+72)
VLDR	#1, S0, [R0, #0]
VMUL.F32	S0, S0, S11
VADD.F32	S2, S1, S0
MOVW	R0, #lo_addr(_y+0)
MOVT	R0, #hi_addr(_y+0)
ADDS	R0, R0, R1
VLDR	#1, S1, [R0, #0]
MOVW	R0, #lo_addr(_k1+68)
MOVT	R0, #hi_addr(_k1+68)
VLDR	#1, S0, [R0, #0]
VMUL.F32	S0, S0, S11
VADD.F32	S1, S1, S0
MOVW	R0, #lo_addr(_x+0)
MOVT	R0, #hi_addr(_x+0)
ADDS	R0, R0, R1
VLDR	#1, S0, [R0, #0]
VADD.F32	S0, S0, S11
VMOV.F32	S3, S2
VMOV.F32	S2, S1
VMOV.F32	S1, S0
VMOV.F32	S0, S12
; num end address is: 48 (R12)
BL	_Zdynamical+0
MOVW	R3, #lo_addr(_k1+92)
MOVT	R3, #hi_addr(_k1+92)
VSTR	#1, S0, [R3, #0]
;rungekutta.h,108 :: 		x[i + 1] = x[i] + ((h / 6) * (k1[1][1] + (2 * k1[2][1]) + (2 * k1[3][1]) + k1[4][1]));
ADDS	R0, R7, #1
SXTH	R0, R0
LSLS	R1, R0, #2
MOVW	R0, #lo_addr(_x+0)
MOVT	R0, #hi_addr(_x+0)
ADDS	R2, R0, R1
LSLS	R1, R7, #2
MOVW	R0, #lo_addr(_x+0)
MOVT	R0, #hi_addr(_x+0)
ADDS	R0, R0, R1
VLDR	#1, S4, [R0, #0]
VMOV.F32	S0, #6
VDIV.F32	S3, S11, S0
MOVW	R0, #lo_addr(_k1+44)
MOVT	R0, #hi_addr(_k1+44)
VLDR	#1, S1, [R0, #0]
VMOV.F32	S0, #2
VMUL.F32	S1, S0, S1
MOVW	R0, #lo_addr(_k1+24)
MOVT	R0, #hi_addr(_k1+24)
VLDR	#1, S0, [R0, #0]
VADD.F32	S2, S0, S1
MOVW	R0, #lo_addr(_k1+64)
MOVT	R0, #hi_addr(_k1+64)
VLDR	#1, S1, [R0, #0]
VMOV.F32	S0, #2
VMUL.F32	S0, S0, S1
VADD.F32	S1, S2, S0
MOVW	R0, #lo_addr(_k1+84)
MOVT	R0, #hi_addr(_k1+84)
VLDR	#1, S0, [R0, #0]
VADD.F32	S0, S1, S0
VMUL.F32	S0, S3, S0
VADD.F32	S0, S4, S0
VSTR	#1, S0, [R2, #0]
;rungekutta.h,109 :: 		y[i + 1] = y[i] + ((h / 6) * (k1[1][2] + (2 * k1[2][2]) + (2 * k1[3][2]) + k1[4][2]));
ADDS	R0, R7, #1
SXTH	R0, R0
LSLS	R1, R0, #2
MOVW	R0, #lo_addr(_y+0)
MOVT	R0, #hi_addr(_y+0)
ADDS	R2, R0, R1
LSLS	R1, R7, #2
MOVW	R0, #lo_addr(_y+0)
MOVT	R0, #hi_addr(_y+0)
ADDS	R0, R0, R1
VLDR	#1, S4, [R0, #0]
VMOV.F32	S0, #6
VDIV.F32	S3, S11, S0
MOVW	R0, #lo_addr(_k1+48)
MOVT	R0, #hi_addr(_k1+48)
VLDR	#1, S1, [R0, #0]
VMOV.F32	S0, #2
VMUL.F32	S1, S0, S1
MOVW	R0, #lo_addr(_k1+28)
MOVT	R0, #hi_addr(_k1+28)
VLDR	#1, S0, [R0, #0]
VADD.F32	S2, S0, S1
MOVW	R0, #lo_addr(_k1+68)
MOVT	R0, #hi_addr(_k1+68)
VLDR	#1, S1, [R0, #0]
VMOV.F32	S0, #2
VMUL.F32	S0, S0, S1
VADD.F32	S1, S2, S0
MOVW	R0, #lo_addr(_k1+88)
MOVT	R0, #hi_addr(_k1+88)
VLDR	#1, S0, [R0, #0]
VADD.F32	S0, S1, S0
VMUL.F32	S0, S3, S0
VADD.F32	S0, S4, S0
VSTR	#1, S0, [R2, #0]
;rungekutta.h,110 :: 		z[i + 1] = z[i] + ((h / 6) * (k1[1][3] + (2 * k1[2][3]) + (2 * k1[3][3]) + k1[4][3]));
ADDS	R0, R7, #1
SXTH	R0, R0
LSLS	R1, R0, #2
MOVW	R0, #lo_addr(_z+0)
MOVT	R0, #hi_addr(_z+0)
ADDS	R2, R0, R1
LSLS	R1, R7, #2
MOVW	R0, #lo_addr(_z+0)
MOVT	R0, #hi_addr(_z+0)
ADDS	R0, R0, R1
VLDR	#1, S4, [R0, #0]
VMOV.F32	S0, #6
VDIV.F32	S3, S11, S0
MOVW	R0, #lo_addr(_k1+52)
MOVT	R0, #hi_addr(_k1+52)
VLDR	#1, S1, [R0, #0]
VMOV.F32	S0, #2
VMUL.F32	S1, S0, S1
MOVW	R0, #lo_addr(_k1+32)
MOVT	R0, #hi_addr(_k1+32)
VLDR	#1, S0, [R0, #0]
VADD.F32	S2, S0, S1
MOVW	R0, #lo_addr(_k1+72)
MOVT	R0, #hi_addr(_k1+72)
VLDR	#1, S1, [R0, #0]
VMOV.F32	S0, #2
VMUL.F32	S0, S0, S1
VADD.F32	S1, S2, S0
MOV	R0, R3
VLDR	#1, S0, [R0, #0]
VADD.F32	S0, S1, S0
VMUL.F32	S0, S3, S0
VADD.F32	S0, S4, S0
VSTR	#1, S0, [R2, #0]
;rungekutta.h,89 :: 		for(i = 0; i<(jumlah*2*fsecg) ;i++)
ADDS	R7, R7, #1
SXTH	R7, R7
;rungekutta.h,112 :: 		}
; h end address is: 44 (R11)
; i end address is: 28 (R7)
IT	AL
BAL	L_rungekutta254
L_rungekutta255:
;rungekutta.h,114 :: 		}
L_end_rungekutta:
LDR	LR, [SP, #0]
ADD	SP, SP, #8
BX	LR
; end of _rungekutta
_InitTimer7:
;ECGsynthetic_events_code.c,18 :: 		void InitTimer7(){
SUB	SP, SP, #4
STR	LR, [SP, #0]
;ECGsynthetic_events_code.c,19 :: 		RCC_APB1ENR.TIM7EN = 1;
MOVS	R1, #1
SXTB	R1, R1
MOVW	R0, #lo_addr(RCC_APB1ENR+0)
MOVT	R0, #hi_addr(RCC_APB1ENR+0)
_SX	[R0, ByteOffset(RCC_APB1ENR+0)]
;ECGsynthetic_events_code.c,20 :: 		TIM7_CR1.CEN = 0;
MOVS	R1, #0
SXTB	R1, R1
MOVW	R0, #lo_addr(TIM7_CR1+0)
MOVT	R0, #hi_addr(TIM7_CR1+0)
_SX	[R0, ByteOffset(TIM7_CR1+0)]
;ECGsynthetic_events_code.c,21 :: 		TIM7_PSC = 13;
MOVS	R1, #13
MOVW	R0, #lo_addr(TIM7_PSC+0)
MOVT	R0, #hi_addr(TIM7_PSC+0)
STR	R1, [R0, #0]
;ECGsynthetic_events_code.c,22 :: 		TIM7_ARR = 46874;
MOVW	R1, #46874
MOVW	R0, #lo_addr(TIM7_ARR+0)
MOVT	R0, #hi_addr(TIM7_ARR+0)
STR	R1, [R0, #0]
;ECGsynthetic_events_code.c,23 :: 		NVIC_IntEnable(IVT_INT_TIM7);
MOVW	R0, #71
BL	_NVIC_IntEnable+0
;ECGsynthetic_events_code.c,24 :: 		TIM7_DIER.UIE = 1;
MOVS	R1, #1
SXTB	R1, R1
MOVW	R0, #lo_addr(TIM7_DIER+0)
MOVT	R0, #hi_addr(TIM7_DIER+0)
_SX	[R0, ByteOffset(TIM7_DIER+0)]
;ECGsynthetic_events_code.c,25 :: 		TIM7_CR1.CEN = 1;
MOVW	R0, #lo_addr(TIM7_CR1+0)
MOVT	R0, #hi_addr(TIM7_CR1+0)
_SX	[R0, ByteOffset(TIM7_CR1+0)]
;ECGsynthetic_events_code.c,27 :: 		}
L_end_InitTimer7:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _InitTimer7
_systemInit:
;ECGsynthetic_events_code.c,29 :: 		void systemInit()
SUB	SP, SP, #4
STR	LR, [SP, #0]
;ECGsynthetic_events_code.c,31 :: 		mikrobus_gpioInit( _MIKROBUS1, _MIKROBUS_CS_PIN, _GPIO_OUTPUT );
MOVS	R2, #0
MOVS	R1, #2
MOVS	R0, #0
BL	_mikrobus_gpioInit+0
;ECGsynthetic_events_code.c,32 :: 		mikrobus_spiInit( _MIKROBUS1, &_DAC_SPI_CFG[0] );
MOVW	R0, #lo_addr(__DAC_SPI_CFG+0)
MOVT	R0, #hi_addr(__DAC_SPI_CFG+0)
MOV	R1, R0
MOVS	R0, #0
BL	_mikrobus_spiInit+0
;ECGsynthetic_events_code.c,33 :: 		Delay_100ms();
BL	_Delay_100ms+0
;ECGsynthetic_events_code.c,34 :: 		mikrobus_uartInit(_MIKROBUS2, &_USB_UART_UART_CFG[0] );
MOVW	R0, #lo_addr(__USB_UART_UART_CFG+0)
MOVT	R0, #hi_addr(__USB_UART_UART_CFG+0)
MOV	R1, R0
MOVS	R0, #1
BL	_mikrobus_uartInit+0
;ECGsynthetic_events_code.c,35 :: 		mikrobus_logInit( _MIKROBUS2, 115200 );
MOV	R1, #115200
MOVS	R0, #1
BL	_mikrobus_logInit+0
;ECGsynthetic_events_code.c,36 :: 		Delay_ms( 100 );
MOVW	R7, #29438
MOVT	R7, #85
NOP
NOP
L_systemInit257:
SUBS	R7, R7, #1
BNE	L_systemInit257
NOP
NOP
NOP
;ECGsynthetic_events_code.c,37 :: 		}
L_end_systemInit:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _systemInit
_applicationInit:
;ECGsynthetic_events_code.c,39 :: 		void applicationInit()
SUB	SP, SP, #4
STR	LR, [SP, #0]
;ECGsynthetic_events_code.c,41 :: 		dac_spiDriverInit( (T_DAC_P)&_MIKROBUS1_GPIO, (T_DAC_P)&_MIKROBUS1_SPI );
MOVW	R1, #lo_addr(__MIKROBUS1_SPI+0)
MOVT	R1, #hi_addr(__MIKROBUS1_SPI+0)
MOVW	R0, #lo_addr(__MIKROBUS1_GPIO+0)
MOVT	R0, #hi_addr(__MIKROBUS1_GPIO+0)
BL	_dac_spiDriverInit+0
;ECGsynthetic_events_code.c,42 :: 		Delay_100ms();
BL	_Delay_100ms+0
;ECGsynthetic_events_code.c,43 :: 		usb_uart_uartDriverInit( (T_USB_UART_P)&_MIKROBUS2_GPIO, (T_USB_UART_P)&_MIKROBUS2_UART );
MOVW	R1, #lo_addr(__MIKROBUS2_UART+0)
MOVT	R1, #hi_addr(__MIKROBUS2_UART+0)
MOVW	R0, #lo_addr(__MIKROBUS2_GPIO+0)
MOVT	R0, #hi_addr(__MIKROBUS2_GPIO+0)
BL	_usb_uart_uartDriverInit+0
;ECGsynthetic_events_code.c,44 :: 		mikrobus_logWrite( "Initialized", _LOG_LINE );
MOVW	R0, #lo_addr(?lstr1_ECGsynthetic_events_code+0)
MOVT	R0, #hi_addr(?lstr1_ECGsynthetic_events_code+0)
MOVS	R1, #2
BL	_mikrobus_logWrite+0
;ECGsynthetic_events_code.c,45 :: 		Delay_ms( 100 );
MOVW	R7, #29438
MOVT	R7, #85
NOP
NOP
L_applicationInit259:
SUBS	R7, R7, #1
BNE	L_applicationInit259
NOP
NOP
NOP
;ECGsynthetic_events_code.c,46 :: 		InitTimer7();
BL	_InitTimer7+0
;ECGsynthetic_events_code.c,48 :: 		}
L_end_applicationInit:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _applicationInit
_bingkai:
;ECGsynthetic_events_code.c,50 :: 		void bingkai(int X1, int Y1, int X2, int Y2)
; Y2 start address is: 12 (R3)
; X2 start address is: 8 (R2)
; Y1 start address is: 4 (R1)
; X1 start address is: 0 (R0)
SUB	SP, SP, #4
STR	LR, [SP, #0]
SXTH	R7, R0
SXTH	R8, R1
SXTH	R9, R2
SXTH	R10, R3
; Y2 end address is: 12 (R3)
; X2 end address is: 8 (R2)
; Y1 end address is: 4 (R1)
; X1 end address is: 0 (R0)
; X1 start address is: 28 (R7)
; Y1 start address is: 32 (R8)
; X2 start address is: 36 (R9)
; Y2 start address is: 40 (R10)
;ECGsynthetic_events_code.c,52 :: 		TFT_Set_Pen(CL_RED, 3);
MOVS	R1, #3
MOVW	R0, #63488
BL	_TFT_Set_Pen+0
;ECGsynthetic_events_code.c,53 :: 		TFT_Set_Brush(1,CL_BLACK,0,LEFT_TO_RIGHT,CL_WHITE,CL_WHITE);
MOVW	R5, #65535
MOVW	R4, #65535
MOVS	R3, #1
MOVS	R2, #0
MOVW	R1, #0
MOVS	R0, #1
PUSH	(R5)
PUSH	(R4)
BL	_TFT_Set_Brush+0
ADD	SP, SP, #8
;ECGsynthetic_events_code.c,54 :: 		TFT_Rectangle(X1,Y1,X2,Y2);
SXTH	R3, R10
; Y2 end address is: 40 (R10)
SXTH	R2, R9
; X2 end address is: 36 (R9)
SXTH	R1, R8
; Y1 end address is: 32 (R8)
SXTH	R0, R7
; X1 end address is: 28 (R7)
BL	_TFT_Rectangle+0
;ECGsynthetic_events_code.c,56 :: 		}
L_end_bingkai:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _bingkai
_ButtonRound3OnClick:
;ECGsynthetic_events_code.c,62 :: 		void ButtonRound3OnClick() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;ECGsynthetic_events_code.c,63 :: 		buttonFlag = !buttonFlag;
MOVW	R1, #lo_addr(_buttonFlag+0)
MOVT	R1, #hi_addr(_buttonFlag+0)
LDR	R0, [R1, #0]
EOR	R0, R0, #1
STR	R0, [R1, #0]
;ECGsynthetic_events_code.c,65 :: 		if(!buttonFlag){
LDR	R0, [R1, #0]
CMP	R0, #0
IT	NE
BNE	L_ButtonRound3OnClick261
;ECGsynthetic_events_code.c,66 :: 		ButtonRound3.Caption = "RUN";
MOVW	R1, #lo_addr(?lstr2_ECGsynthetic_events_code+0)
MOVT	R1, #hi_addr(?lstr2_ECGsynthetic_events_code+0)
MOVW	R0, #lo_addr(_ButtonRound3+24)
MOVT	R0, #hi_addr(_ButtonRound3+24)
STR	R1, [R0, #0]
;ECGsynthetic_events_code.c,67 :: 		ButtonRound3.Color = CL_LIME;
MOVW	R1, #2016
MOVW	R0, #lo_addr(_ButtonRound3+46)
MOVT	R0, #hi_addr(_ButtonRound3+46)
STRH	R1, [R0, #0]
;ECGsynthetic_events_code.c,69 :: 		}
IT	AL
BAL	L_ButtonRound3OnClick262
L_ButtonRound3OnClick261:
;ECGsynthetic_events_code.c,71 :: 		ButtonRound3.Caption = "STOP";
MOVW	R1, #lo_addr(?lstr3_ECGsynthetic_events_code+0)
MOVT	R1, #hi_addr(?lstr3_ECGsynthetic_events_code+0)
MOVW	R0, #lo_addr(_ButtonRound3+24)
MOVT	R0, #hi_addr(_ButtonRound3+24)
STR	R1, [R0, #0]
;ECGsynthetic_events_code.c,72 :: 		ButtonRound3.Color = CL_RED;
MOVW	R1, #63488
MOVW	R0, #lo_addr(_ButtonRound3+46)
MOVT	R0, #hi_addr(_ButtonRound3+46)
STRH	R1, [R0, #0]
;ECGsynthetic_events_code.c,73 :: 		}
L_ButtonRound3OnClick262:
;ECGsynthetic_events_code.c,74 :: 		DrawRoundButton(&ButtonRound3);
MOVW	R0, #lo_addr(_ButtonRound3+0)
MOVT	R0, #hi_addr(_ButtonRound3+0)
BL	_DrawRoundButton+0
;ECGsynthetic_events_code.c,75 :: 		}
L_end_ButtonRound3OnClick:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _ButtonRound3OnClick
_ButtonRound5OnClick:
;ECGsynthetic_events_code.c,77 :: 		void ButtonRound5OnClick() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;ECGsynthetic_events_code.c,78 :: 		buttonFlag = !buttonFlag;
MOVW	R1, #lo_addr(_buttonFlag+0)
MOVT	R1, #hi_addr(_buttonFlag+0)
LDR	R0, [R1, #0]
EOR	R0, R0, #1
STR	R0, [R1, #0]
;ECGsynthetic_events_code.c,80 :: 		if(!buttonFlag){
LDR	R0, [R1, #0]
CMP	R0, #0
IT	NE
BNE	L_ButtonRound5OnClick263
;ECGsynthetic_events_code.c,81 :: 		ButtonRound5.Caption = "RUN";
MOVW	R1, #lo_addr(?lstr4_ECGsynthetic_events_code+0)
MOVT	R1, #hi_addr(?lstr4_ECGsynthetic_events_code+0)
MOVW	R0, #lo_addr(_ButtonRound5+24)
MOVT	R0, #hi_addr(_ButtonRound5+24)
STR	R1, [R0, #0]
;ECGsynthetic_events_code.c,82 :: 		ButtonRound5.Color = CL_LIME;
MOVW	R1, #2016
MOVW	R0, #lo_addr(_ButtonRound5+46)
MOVT	R0, #hi_addr(_ButtonRound5+46)
STRH	R1, [R0, #0]
;ECGsynthetic_events_code.c,84 :: 		}
IT	AL
BAL	L_ButtonRound5OnClick264
L_ButtonRound5OnClick263:
;ECGsynthetic_events_code.c,86 :: 		ButtonRound5.Caption = "STOP";
MOVW	R1, #lo_addr(?lstr5_ECGsynthetic_events_code+0)
MOVT	R1, #hi_addr(?lstr5_ECGsynthetic_events_code+0)
MOVW	R0, #lo_addr(_ButtonRound5+24)
MOVT	R0, #hi_addr(_ButtonRound5+24)
STR	R1, [R0, #0]
;ECGsynthetic_events_code.c,87 :: 		ButtonRound5.Color = CL_RED;
MOVW	R1, #63488
MOVW	R0, #lo_addr(_ButtonRound5+46)
MOVT	R0, #hi_addr(_ButtonRound5+46)
STRH	R1, [R0, #0]
;ECGsynthetic_events_code.c,88 :: 		}
L_ButtonRound5OnClick264:
;ECGsynthetic_events_code.c,89 :: 		DrawRoundButton(&ButtonRound5);
MOVW	R0, #lo_addr(_ButtonRound5+0)
MOVT	R0, #hi_addr(_ButtonRound5+0)
BL	_DrawRoundButton+0
;ECGsynthetic_events_code.c,90 :: 		}
L_end_ButtonRound5OnClick:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _ButtonRound5OnClick
_ButtonRound7OnClick:
;ECGsynthetic_events_code.c,92 :: 		void ButtonRound7OnClick() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;ECGsynthetic_events_code.c,93 :: 		buttonFlag = !buttonFlag;
MOVW	R1, #lo_addr(_buttonFlag+0)
MOVT	R1, #hi_addr(_buttonFlag+0)
LDR	R0, [R1, #0]
EOR	R0, R0, #1
STR	R0, [R1, #0]
;ECGsynthetic_events_code.c,95 :: 		if(!buttonFlag){
LDR	R0, [R1, #0]
CMP	R0, #0
IT	NE
BNE	L_ButtonRound7OnClick265
;ECGsynthetic_events_code.c,96 :: 		ButtonRound7.Caption = "RUN";
MOVW	R1, #lo_addr(?lstr6_ECGsynthetic_events_code+0)
MOVT	R1, #hi_addr(?lstr6_ECGsynthetic_events_code+0)
MOVW	R0, #lo_addr(_ButtonRound7+24)
MOVT	R0, #hi_addr(_ButtonRound7+24)
STR	R1, [R0, #0]
;ECGsynthetic_events_code.c,97 :: 		ButtonRound7.Color = CL_LIME;
MOVW	R1, #2016
MOVW	R0, #lo_addr(_ButtonRound7+46)
MOVT	R0, #hi_addr(_ButtonRound7+46)
STRH	R1, [R0, #0]
;ECGsynthetic_events_code.c,99 :: 		}
IT	AL
BAL	L_ButtonRound7OnClick266
L_ButtonRound7OnClick265:
;ECGsynthetic_events_code.c,101 :: 		ButtonRound7.Caption = "STOP";
MOVW	R1, #lo_addr(?lstr7_ECGsynthetic_events_code+0)
MOVT	R1, #hi_addr(?lstr7_ECGsynthetic_events_code+0)
MOVW	R0, #lo_addr(_ButtonRound7+24)
MOVT	R0, #hi_addr(_ButtonRound7+24)
STR	R1, [R0, #0]
;ECGsynthetic_events_code.c,102 :: 		ButtonRound7.Color = CL_RED;
MOVW	R1, #63488
MOVW	R0, #lo_addr(_ButtonRound7+46)
MOVT	R0, #hi_addr(_ButtonRound7+46)
STRH	R1, [R0, #0]
;ECGsynthetic_events_code.c,103 :: 		}
L_ButtonRound7OnClick266:
;ECGsynthetic_events_code.c,104 :: 		DrawRoundButton(&ButtonRound7);
MOVW	R0, #lo_addr(_ButtonRound7+0)
MOVT	R0, #hi_addr(_ButtonRound7+0)
BL	_DrawRoundButton+0
;ECGsynthetic_events_code.c,105 :: 		}
L_end_ButtonRound7OnClick:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _ButtonRound7OnClick
_ButtonRound9OnClick:
;ECGsynthetic_events_code.c,107 :: 		void ButtonRound9OnClick() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;ECGsynthetic_events_code.c,108 :: 		buttonFlag = !buttonFlag;
MOVW	R1, #lo_addr(_buttonFlag+0)
MOVT	R1, #hi_addr(_buttonFlag+0)
LDR	R0, [R1, #0]
EOR	R0, R0, #1
STR	R0, [R1, #0]
;ECGsynthetic_events_code.c,110 :: 		if(!buttonFlag){
LDR	R0, [R1, #0]
CMP	R0, #0
IT	NE
BNE	L_ButtonRound9OnClick267
;ECGsynthetic_events_code.c,111 :: 		ButtonRound9.Caption = "RUN";
MOVW	R1, #lo_addr(?lstr8_ECGsynthetic_events_code+0)
MOVT	R1, #hi_addr(?lstr8_ECGsynthetic_events_code+0)
MOVW	R0, #lo_addr(_ButtonRound9+24)
MOVT	R0, #hi_addr(_ButtonRound9+24)
STR	R1, [R0, #0]
;ECGsynthetic_events_code.c,112 :: 		ButtonRound9.Color = CL_LIME;
MOVW	R1, #2016
MOVW	R0, #lo_addr(_ButtonRound9+46)
MOVT	R0, #hi_addr(_ButtonRound9+46)
STRH	R1, [R0, #0]
;ECGsynthetic_events_code.c,114 :: 		}
IT	AL
BAL	L_ButtonRound9OnClick268
L_ButtonRound9OnClick267:
;ECGsynthetic_events_code.c,116 :: 		ButtonRound9.Caption = "STOP";
MOVW	R1, #lo_addr(?lstr9_ECGsynthetic_events_code+0)
MOVT	R1, #hi_addr(?lstr9_ECGsynthetic_events_code+0)
MOVW	R0, #lo_addr(_ButtonRound9+24)
MOVT	R0, #hi_addr(_ButtonRound9+24)
STR	R1, [R0, #0]
;ECGsynthetic_events_code.c,117 :: 		ButtonRound9.Color = CL_RED;
MOVW	R1, #63488
MOVW	R0, #lo_addr(_ButtonRound9+46)
MOVT	R0, #hi_addr(_ButtonRound9+46)
STRH	R1, [R0, #0]
;ECGsynthetic_events_code.c,118 :: 		}
L_ButtonRound9OnClick268:
;ECGsynthetic_events_code.c,119 :: 		DrawRoundButton(&ButtonRound9);
MOVW	R0, #lo_addr(_ButtonRound9+0)
MOVT	R0, #hi_addr(_ButtonRound9+0)
BL	_DrawRoundButton+0
;ECGsynthetic_events_code.c,120 :: 		}
L_end_ButtonRound9OnClick:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _ButtonRound9OnClick
_ButtonRound11OnClick:
;ECGsynthetic_events_code.c,123 :: 		void ButtonRound11OnClick() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;ECGsynthetic_events_code.c,124 :: 		buttonFlag = !buttonFlag;
MOVW	R1, #lo_addr(_buttonFlag+0)
MOVT	R1, #hi_addr(_buttonFlag+0)
LDR	R0, [R1, #0]
EOR	R0, R0, #1
STR	R0, [R1, #0]
;ECGsynthetic_events_code.c,126 :: 		if(!buttonFlag){
LDR	R0, [R1, #0]
CMP	R0, #0
IT	NE
BNE	L_ButtonRound11OnClick269
;ECGsynthetic_events_code.c,127 :: 		ButtonRound11.Caption = "RUN";
MOVW	R1, #lo_addr(?lstr10_ECGsynthetic_events_code+0)
MOVT	R1, #hi_addr(?lstr10_ECGsynthetic_events_code+0)
MOVW	R0, #lo_addr(_ButtonRound11+24)
MOVT	R0, #hi_addr(_ButtonRound11+24)
STR	R1, [R0, #0]
;ECGsynthetic_events_code.c,128 :: 		ButtonRound11.Color = CL_LIME;
MOVW	R1, #2016
MOVW	R0, #lo_addr(_ButtonRound11+46)
MOVT	R0, #hi_addr(_ButtonRound11+46)
STRH	R1, [R0, #0]
;ECGsynthetic_events_code.c,130 :: 		}
IT	AL
BAL	L_ButtonRound11OnClick270
L_ButtonRound11OnClick269:
;ECGsynthetic_events_code.c,132 :: 		ButtonRound11.Caption = "STOP";
MOVW	R1, #lo_addr(?lstr11_ECGsynthetic_events_code+0)
MOVT	R1, #hi_addr(?lstr11_ECGsynthetic_events_code+0)
MOVW	R0, #lo_addr(_ButtonRound11+24)
MOVT	R0, #hi_addr(_ButtonRound11+24)
STR	R1, [R0, #0]
;ECGsynthetic_events_code.c,133 :: 		ButtonRound11.Color = CL_RED;
MOVW	R1, #63488
MOVW	R0, #lo_addr(_ButtonRound11+46)
MOVT	R0, #hi_addr(_ButtonRound11+46)
STRH	R1, [R0, #0]
;ECGsynthetic_events_code.c,134 :: 		}
L_ButtonRound11OnClick270:
;ECGsynthetic_events_code.c,135 :: 		DrawRoundButton(&ButtonRound11);
MOVW	R0, #lo_addr(_ButtonRound11+0)
MOVT	R0, #hi_addr(_ButtonRound11+0)
BL	_DrawRoundButton+0
;ECGsynthetic_events_code.c,136 :: 		}
L_end_ButtonRound11OnClick:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _ButtonRound11OnClick
_ButtonRound13OnClick:
;ECGsynthetic_events_code.c,138 :: 		void ButtonRound13OnClick() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;ECGsynthetic_events_code.c,139 :: 		buttonFlag = !buttonFlag;
MOVW	R1, #lo_addr(_buttonFlag+0)
MOVT	R1, #hi_addr(_buttonFlag+0)
LDR	R0, [R1, #0]
EOR	R0, R0, #1
STR	R0, [R1, #0]
;ECGsynthetic_events_code.c,141 :: 		if(!buttonFlag){
LDR	R0, [R1, #0]
CMP	R0, #0
IT	NE
BNE	L_ButtonRound13OnClick271
;ECGsynthetic_events_code.c,142 :: 		ButtonRound13.Caption = "RUN";
MOVW	R1, #lo_addr(?lstr12_ECGsynthetic_events_code+0)
MOVT	R1, #hi_addr(?lstr12_ECGsynthetic_events_code+0)
MOVW	R0, #lo_addr(_ButtonRound13+24)
MOVT	R0, #hi_addr(_ButtonRound13+24)
STR	R1, [R0, #0]
;ECGsynthetic_events_code.c,143 :: 		ButtonRound13.Color = CL_LIME;
MOVW	R1, #2016
MOVW	R0, #lo_addr(_ButtonRound13+46)
MOVT	R0, #hi_addr(_ButtonRound13+46)
STRH	R1, [R0, #0]
;ECGsynthetic_events_code.c,145 :: 		}
IT	AL
BAL	L_ButtonRound13OnClick272
L_ButtonRound13OnClick271:
;ECGsynthetic_events_code.c,147 :: 		ButtonRound13.Caption = "STOP";
MOVW	R1, #lo_addr(?lstr13_ECGsynthetic_events_code+0)
MOVT	R1, #hi_addr(?lstr13_ECGsynthetic_events_code+0)
MOVW	R0, #lo_addr(_ButtonRound13+24)
MOVT	R0, #hi_addr(_ButtonRound13+24)
STR	R1, [R0, #0]
;ECGsynthetic_events_code.c,148 :: 		ButtonRound13.Color = CL_RED;
MOVW	R1, #63488
MOVW	R0, #lo_addr(_ButtonRound13+46)
MOVT	R0, #hi_addr(_ButtonRound13+46)
STRH	R1, [R0, #0]
;ECGsynthetic_events_code.c,149 :: 		}
L_ButtonRound13OnClick272:
;ECGsynthetic_events_code.c,150 :: 		DrawRoundButton(&ButtonRound13);
MOVW	R0, #lo_addr(_ButtonRound13+0)
MOVT	R0, #hi_addr(_ButtonRound13+0)
BL	_DrawRoundButton+0
;ECGsynthetic_events_code.c,151 :: 		}
L_end_ButtonRound13OnClick:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _ButtonRound13OnClick
_ClearRect:
;ECGsynthetic_events_code.c,153 :: 		void ClearRect(int x1, int y1, int x2, int y2)
; y2 start address is: 12 (R3)
; x2 start address is: 8 (R2)
; y1 start address is: 4 (R1)
; x1 start address is: 0 (R0)
SUB	SP, SP, #4
STR	LR, [SP, #0]
SXTH	R7, R0
SXTH	R8, R1
SXTH	R9, R2
SXTH	R10, R3
; y2 end address is: 12 (R3)
; x2 end address is: 8 (R2)
; y1 end address is: 4 (R1)
; x1 end address is: 0 (R0)
; x1 start address is: 28 (R7)
; y1 start address is: 32 (R8)
; x2 start address is: 36 (R9)
; y2 start address is: 40 (R10)
;ECGsynthetic_events_code.c,155 :: 		TFT_Set_Pen(CL_BLACK, 1);
MOVS	R1, #1
MOVW	R0, #0
BL	_TFT_Set_Pen+0
;ECGsynthetic_events_code.c,156 :: 		TFT_Set_Brush(1, CL_BLACK, 0, TOP_TO_BOTTOM, CL_BLACK, CL_BLACK);
MOVW	R5, #0
MOVW	R4, #0
MOVS	R3, #0
MOVS	R2, #0
MOVW	R1, #0
MOVS	R0, #1
PUSH	(R5)
PUSH	(R4)
BL	_TFT_Set_Brush+0
ADD	SP, SP, #8
;ECGsynthetic_events_code.c,157 :: 		TFT_Rectangle(x1,y1,x2,y2);
SXTH	R3, R10
; y2 end address is: 40 (R10)
SXTH	R2, R9
; x2 end address is: 36 (R9)
SXTH	R1, R8
; y1 end address is: 32 (R8)
SXTH	R0, R7
; x1 end address is: 28 (R7)
BL	_TFT_Rectangle+0
;ECGsynthetic_events_code.c,158 :: 		}
L_end_ClearRect:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _ClearRect
_ButtonRound36OnClick:
;ECGsynthetic_events_code.c,160 :: 		void ButtonRound36OnClick()
SUB	SP, SP, #4
STR	LR, [SP, #0]
;ECGsynthetic_events_code.c,162 :: 		hmean+=10;
MOVW	R0, #lo_addr(_hmean+0)
MOVT	R0, #hi_addr(_hmean+0)
VLDR	#1, S1, [R0, #0]
VMOV.F32	S0, #10
VADD.F32	S0, S1, S0
VSTR	#1, S0, [R0, #0]
;ECGsynthetic_events_code.c,163 :: 		IntToStr(hmean,Label19_Caption);
VCVT	#1, .F32, S0, S0
VMOV	R0, S0
SXTH	R0, R0
MOVW	R1, #lo_addr(_Label19_Caption+0)
MOVT	R1, #hi_addr(_Label19_Caption+0)
BL	_IntToStr+0
;ECGsynthetic_events_code.c,164 :: 		ClearRect(559,380,673,433);
MOVW	R3, #433
SXTH	R3, R3
MOVW	R2, #673
SXTH	R2, R2
MOVW	R1, #380
SXTH	R1, R1
MOVW	R0, #559
SXTH	R0, R0
BL	_ClearRect+0
;ECGsynthetic_events_code.c,165 :: 		TFT_Set_Font(Tahoma19x23_Regular,CL_WHITE,FO_HORIZONTAL);
MOVW	R0, #lo_addr(_Tahoma19x23_Regular+0)
MOVT	R0, #hi_addr(_Tahoma19x23_Regular+0)
MOVS	R2, #0
MOVW	R1, #65535
BL	_TFT_Set_Font+0
;ECGsynthetic_events_code.c,166 :: 		TFT_Write_Text(Label19_Caption,590,395);
MOVW	R2, #395
MOVW	R1, #590
MOVW	R0, #lo_addr(_Label19_Caption+0)
MOVT	R0, #hi_addr(_Label19_Caption+0)
BL	_TFT_Write_Text+0
;ECGsynthetic_events_code.c,167 :: 		DrawRoundButton(&ButtonRound36);
MOVW	R0, #lo_addr(_ButtonRound36+0)
MOVT	R0, #hi_addr(_ButtonRound36+0)
BL	_DrawRoundButton+0
;ECGsynthetic_events_code.c,168 :: 		ButtonRound36.Caption = ">";
MOVW	R1, #lo_addr(?lstr14_ECGsynthetic_events_code+0)
MOVT	R1, #hi_addr(?lstr14_ECGsynthetic_events_code+0)
MOVW	R0, #lo_addr(_ButtonRound36+24)
MOVT	R0, #hi_addr(_ButtonRound36+24)
STR	R1, [R0, #0]
;ECGsynthetic_events_code.c,169 :: 		}
L_end_ButtonRound36OnClick:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _ButtonRound36OnClick
_ButtonRound37OnClick:
;ECGsynthetic_events_code.c,170 :: 		void ButtonRound37OnClick() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;ECGsynthetic_events_code.c,171 :: 		hmean-=10;
MOVW	R0, #lo_addr(_hmean+0)
MOVT	R0, #hi_addr(_hmean+0)
VLDR	#1, S1, [R0, #0]
VMOV.F32	S0, #10
VSUB.F32	S0, S1, S0
VSTR	#1, S0, [R0, #0]
;ECGsynthetic_events_code.c,172 :: 		IntToStr(hmean,Label19_Caption);
VCVT	#1, .F32, S0, S0
VMOV	R0, S0
SXTH	R0, R0
MOVW	R1, #lo_addr(_Label19_Caption+0)
MOVT	R1, #hi_addr(_Label19_Caption+0)
BL	_IntToStr+0
;ECGsynthetic_events_code.c,173 :: 		ClearRect(559,380,673,433);
MOVW	R3, #433
SXTH	R3, R3
MOVW	R2, #673
SXTH	R2, R2
MOVW	R1, #380
SXTH	R1, R1
MOVW	R0, #559
SXTH	R0, R0
BL	_ClearRect+0
;ECGsynthetic_events_code.c,174 :: 		TFT_Set_Font(Tahoma19x23_Regular,CL_WHITE,FO_HORIZONTAL);
MOVW	R0, #lo_addr(_Tahoma19x23_Regular+0)
MOVT	R0, #hi_addr(_Tahoma19x23_Regular+0)
MOVS	R2, #0
MOVW	R1, #65535
BL	_TFT_Set_Font+0
;ECGsynthetic_events_code.c,175 :: 		TFT_Write_Text(Label19_Caption,590,395);
MOVW	R2, #395
MOVW	R1, #590
MOVW	R0, #lo_addr(_Label19_Caption+0)
MOVT	R0, #hi_addr(_Label19_Caption+0)
BL	_TFT_Write_Text+0
;ECGsynthetic_events_code.c,176 :: 		DrawRoundButton(&ButtonRound37);
MOVW	R0, #lo_addr(_ButtonRound37+0)
MOVT	R0, #hi_addr(_ButtonRound37+0)
BL	_DrawRoundButton+0
;ECGsynthetic_events_code.c,177 :: 		ButtonRound37.Caption = "<";
MOVW	R1, #lo_addr(?lstr15_ECGsynthetic_events_code+0)
MOVT	R1, #hi_addr(?lstr15_ECGsynthetic_events_code+0)
MOVW	R0, #lo_addr(_ButtonRound37+24)
MOVT	R0, #hi_addr(_ButtonRound37+24)
STR	R1, [R0, #0]
;ECGsynthetic_events_code.c,178 :: 		}
L_end_ButtonRound37OnClick:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _ButtonRound37OnClick
_ButtonRound1OnClick:
;ECGsynthetic_events_code.c,179 :: 		void ButtonRound1OnClick() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;ECGsynthetic_events_code.c,180 :: 		DrawScreen(&Screen2);
MOVW	R0, #lo_addr(_Screen2+0)
MOVT	R0, #hi_addr(_Screen2+0)
BL	_DrawScreen+0
;ECGsynthetic_events_code.c,181 :: 		}
L_end_ButtonRound1OnClick:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _ButtonRound1OnClick
_findMin:
;ECGsynthetic_events_code.c,183 :: 		float findMin(float array[], int sizearray)
; sizearray start address is: 4 (R1)
; array start address is: 0 (R0)
SUB	SP, SP, #4
STRH	R1, [SP, #0]
MOV	R1, R0
LDRSH	R0, [SP, #0]
; sizearray end address is: 4 (R1)
; array end address is: 0 (R0)
; array start address is: 4 (R1)
; sizearray start address is: 0 (R0)
;ECGsynthetic_events_code.c,185 :: 		float min = array[0];
VLDR	#1, S1, [R1, #0]
; min start address is: 4 (R1)
;ECGsynthetic_events_code.c,187 :: 		for (i = 0; i < sizearray; i++) {
MOVS	R3, #0
SXTH	R3, R3
MOVW	R2, #lo_addr(_i+0)
MOVT	R2, #hi_addr(_i+0)
STRH	R3, [R2, #0]
; sizearray end address is: 0 (R0)
; min end address is: 4 (R1)
VSTR	#1, S1, [SP, #0]
VLDR	#1, S1, [SP, #0]
L_findMin273:
; min start address is: 4 (R1)
; sizearray start address is: 0 (R0)
; array start address is: 4 (R1)
; array end address is: 4 (R1)
MOVW	R2, #lo_addr(_i+0)
MOVT	R2, #hi_addr(_i+0)
LDRSH	R2, [R2, #0]
CMP	R2, R0
IT	GE
BGE	L_findMin274
; array end address is: 4 (R1)
;ECGsynthetic_events_code.c,188 :: 		if (array[i] < min) {
; array start address is: 4 (R1)
MOVW	R2, #lo_addr(_i+0)
MOVT	R2, #hi_addr(_i+0)
LDRSH	R2, [R2, #0]
LSLS	R2, R2, #2
ADDS	R2, R1, R2
VLDR	#1, S0, [R2, #0]
VCMPE.F32	S0, S1
VMRS	#60, FPSCR
IT	GE
BGE	L__findMin290
; min end address is: 4 (R1)
;ECGsynthetic_events_code.c,189 :: 		min = array[i];
MOVW	R2, #lo_addr(_i+0)
MOVT	R2, #hi_addr(_i+0)
LDRSH	R2, [R2, #0]
LSLS	R2, R2, #2
ADDS	R2, R1, R2
VLDR	#1, S1, [R2, #0]
; min start address is: 4 (R1)
; min end address is: 4 (R1)
;ECGsynthetic_events_code.c,190 :: 		}
IT	AL
BAL	L_findMin276
L__findMin290:
;ECGsynthetic_events_code.c,188 :: 		if (array[i] < min) {
;ECGsynthetic_events_code.c,190 :: 		}
L_findMin276:
;ECGsynthetic_events_code.c,187 :: 		for (i = 0; i < sizearray; i++) {
; min start address is: 4 (R1)
MOVW	R3, #lo_addr(_i+0)
MOVT	R3, #hi_addr(_i+0)
LDRSH	R2, [R3, #0]
ADDS	R2, R2, #1
STRH	R2, [R3, #0]
;ECGsynthetic_events_code.c,191 :: 		}
VSTR	#1, S1, [SP, #0]
; sizearray end address is: 0 (R0)
; array end address is: 4 (R1)
VLDR	#1, S1, [SP, #0]
IT	AL
BAL	L_findMin273
L_findMin274:
;ECGsynthetic_events_code.c,192 :: 		return min;
VMOV.F32	S0, S1
; min end address is: 4 (R1)
;ECGsynthetic_events_code.c,193 :: 		}
L_end_findMin:
ADD	SP, SP, #4
BX	LR
; end of _findMin
_findMax:
;ECGsynthetic_events_code.c,195 :: 		float findMax(float array[], int sizearray)
; sizearray start address is: 4 (R1)
; array start address is: 0 (R0)
SUB	SP, SP, #4
STRH	R1, [SP, #0]
MOV	R1, R0
LDRSH	R0, [SP, #0]
; sizearray end address is: 4 (R1)
; array end address is: 0 (R0)
; array start address is: 4 (R1)
; sizearray start address is: 0 (R0)
;ECGsynthetic_events_code.c,197 :: 		float max = array[0];
VLDR	#1, S1, [R1, #0]
; max start address is: 4 (R1)
;ECGsynthetic_events_code.c,199 :: 		for (i = 0; i < sizearray; i++) {
MOVS	R3, #0
SXTH	R3, R3
MOVW	R2, #lo_addr(_i+0)
MOVT	R2, #hi_addr(_i+0)
STRH	R3, [R2, #0]
; sizearray end address is: 0 (R0)
; max end address is: 4 (R1)
VSTR	#1, S1, [SP, #0]
VLDR	#1, S1, [SP, #0]
L_findMax277:
; max start address is: 4 (R1)
; sizearray start address is: 0 (R0)
; array start address is: 4 (R1)
; array end address is: 4 (R1)
MOVW	R2, #lo_addr(_i+0)
MOVT	R2, #hi_addr(_i+0)
LDRSH	R2, [R2, #0]
CMP	R2, R0
IT	GE
BGE	L_findMax278
; array end address is: 4 (R1)
;ECGsynthetic_events_code.c,200 :: 		if (array[i] > max) {
; array start address is: 4 (R1)
MOVW	R2, #lo_addr(_i+0)
MOVT	R2, #hi_addr(_i+0)
LDRSH	R2, [R2, #0]
LSLS	R2, R2, #2
ADDS	R2, R1, R2
VLDR	#1, S0, [R2, #0]
VCMPE.F32	S0, S1
VMRS	#60, FPSCR
IT	LE
BLE	L__findMax291
; max end address is: 4 (R1)
;ECGsynthetic_events_code.c,201 :: 		max = array[i];
MOVW	R2, #lo_addr(_i+0)
MOVT	R2, #hi_addr(_i+0)
LDRSH	R2, [R2, #0]
LSLS	R2, R2, #2
ADDS	R2, R1, R2
VLDR	#1, S1, [R2, #0]
; max start address is: 4 (R1)
; max end address is: 4 (R1)
;ECGsynthetic_events_code.c,202 :: 		}
IT	AL
BAL	L_findMax280
L__findMax291:
;ECGsynthetic_events_code.c,200 :: 		if (array[i] > max) {
;ECGsynthetic_events_code.c,202 :: 		}
L_findMax280:
;ECGsynthetic_events_code.c,199 :: 		for (i = 0; i < sizearray; i++) {
; max start address is: 4 (R1)
MOVW	R3, #lo_addr(_i+0)
MOVT	R3, #hi_addr(_i+0)
LDRSH	R2, [R3, #0]
ADDS	R2, R2, #1
STRH	R2, [R3, #0]
;ECGsynthetic_events_code.c,203 :: 		}
VSTR	#1, S1, [SP, #0]
; sizearray end address is: 0 (R0)
; array end address is: 4 (R1)
VLDR	#1, S1, [SP, #0]
IT	AL
BAL	L_findMax277
L_findMax278:
;ECGsynthetic_events_code.c,204 :: 		return max;
VMOV.F32	S0, S1
; max end address is: 4 (R1)
;ECGsynthetic_events_code.c,205 :: 		}
L_end_findMax:
ADD	SP, SP, #4
BX	LR
; end of _findMax
_sinyal:
;ECGsynthetic_events_code.c,207 :: 		void sinyal(){
SUB	SP, SP, #4
STR	LR, [SP, #0]
;ECGsynthetic_events_code.c,214 :: 		if(i%513==0){
MOVW	R0, #lo_addr(_i+0)
MOVT	R0, #hi_addr(_i+0)
LDRSH	R2, [R0, #0]
MOVW	R1, #513
SXTH	R1, R1
SDIV	R0, R2, R1
MLS	R0, R1, R0, R2
SXTH	R0, R0
CMP	R0, #0
IT	NE
BNE	L_sinyal281
;ECGsynthetic_events_code.c,215 :: 		i=0;
MOVS	R1, #0
SXTH	R1, R1
MOVW	R0, #lo_addr(_i+0)
MOVT	R0, #hi_addr(_i+0)
STRH	R1, [R0, #0]
;ECGsynthetic_events_code.c,217 :: 		DrawImage(&Image3);
MOVW	R0, #lo_addr(_Image3+0)
MOVT	R0, #hi_addr(_Image3+0)
BL	_DrawImage+0
;ECGsynthetic_events_code.c,218 :: 		}
L_sinyal281:
;ECGsynthetic_events_code.c,225 :: 		TFT_Set_Pen(CL_RED,3);
MOVS	R1, #3
MOVW	R0, #63488
BL	_TFT_Set_Pen+0
;ECGsynthetic_events_code.c,226 :: 		TFT_Line(227+((i%513)-1),250-(100*z[i-1]),(227+(i%513)),250-100*z[i]);
MOVW	R5, #lo_addr(_i+0)
MOVT	R5, #hi_addr(_i+0)
LDRSH	R0, [R5, #0]
LSLS	R1, R0, #2
MOVW	R0, #lo_addr(_z+0)
MOVT	R0, #hi_addr(_z+0)
ADDS	R0, R0, R1
VLDR	#1, S1, [R0, #0]
MOVW	R0, #0
MOVT	R0, #17096
VMOV	S0, R0
VMUL.F32	S1, S0, S1
MOVW	R0, #0
MOVT	R0, #17274
VMOV	S0, R0
VSUB.F32	S0, S0, S1
VCVT	#1, .F32, S0, S0
VMOV	R4, S0
SXTH	R4, R4
MOV	R0, R5
LDRSH	R1, [R0, #0]
MOVW	R0, #513
SXTH	R0, R0
SDIV	R3, R1, R0
MLS	R3, R0, R3, R1
SXTH	R3, R3
ADDW	R2, R3, #227
MOV	R0, R5
LDRSH	R0, [R0, #0]
SUBS	R0, R0, #1
SXTH	R0, R0
LSLS	R1, R0, #2
MOVW	R0, #lo_addr(_z+0)
MOVT	R0, #hi_addr(_z+0)
ADDS	R0, R0, R1
VLDR	#1, S1, [R0, #0]
MOVW	R0, #0
MOVT	R0, #17096
VMOV	S0, R0
VMUL.F32	S1, S0, S1
MOVW	R0, #0
MOVT	R0, #17274
VMOV	S0, R0
VSUB.F32	S0, S0, S1
VCVT	#1, .F32, S0, S0
VMOV	R1, S0
SXTH	R1, R1
SUBS	R0, R3, #1
SXTH	R0, R0
ADDS	R0, #227
SXTH	R3, R4
BL	_TFT_Line+0
;ECGsynthetic_events_code.c,231 :: 		FloatToStr(z[i],text);
MOVW	R0, #lo_addr(_i+0)
MOVT	R0, #hi_addr(_i+0)
LDRSH	R0, [R0, #0]
LSLS	R1, R0, #2
MOVW	R0, #lo_addr(_z+0)
MOVT	R0, #hi_addr(_z+0)
ADDS	R0, R0, R1
VLDR	#1, S0, [R0, #0]
MOVW	R0, #lo_addr(_text+0)
MOVT	R0, #hi_addr(_text+0)
BL	_FloatToStr+0
;ECGsynthetic_events_code.c,232 :: 		mikrobus_logWrite(text, _LOG_LINE);
MOVS	R1, #2
MOVW	R0, #lo_addr(_text+0)
MOVT	R0, #hi_addr(_text+0)
BL	_mikrobus_logWrite+0
;ECGsynthetic_events_code.c,235 :: 		dac_value[i]= (int)(output[i]*(scale));
MOVW	R3, #lo_addr(_i+0)
MOVT	R3, #hi_addr(_i+0)
LDRSH	R0, [R3, #0]
LSLS	R1, R0, #1
MOVW	R0, #lo_addr(_dac_value+0)
MOVT	R0, #hi_addr(_dac_value+0)
ADDS	R2, R0, R1
MOV	R0, R3
LDRSH	R0, [R0, #0]
LSLS	R1, R0, #2
MOVW	R0, #lo_addr(_output+0)
MOVT	R0, #hi_addr(_output+0)
ADDS	R0, R0, R1
VLDR	#1, S1, [R0, #0]
MOVW	R0, #lo_addr(_scale+0)
MOVT	R0, #hi_addr(_scale+0)
LDRSH	R0, [R0, #0]
VMOV	S0, R0
VCVT.F32	#1, S0, S0
VMUL.F32	S0, S1, S0
VCVT	#1, .F32, S0, S0
VMOV	R0, S0
SXTH	R0, R0
STRH	R0, [R2, #0]
;ECGsynthetic_events_code.c,236 :: 		dac_setOutVoltage( dac_value[i] );
MOV	R0, R3
LDRSH	R0, [R0, #0]
LSLS	R1, R0, #1
MOVW	R0, #lo_addr(_dac_value+0)
MOVT	R0, #hi_addr(_dac_value+0)
ADDS	R0, R0, R1
LDRSH	R0, [R0, #0]
UXTH	R0, R0
BL	_dac_setOutVoltage+0
;ECGsynthetic_events_code.c,237 :: 		Delay_ms(1);
MOVW	R7, #55998
MOVT	R7, #0
NOP
NOP
L_sinyal282:
SUBS	R7, R7, #1
BNE	L_sinyal282
NOP
NOP
NOP
;ECGsynthetic_events_code.c,239 :: 		i++;
MOVW	R1, #lo_addr(_i+0)
MOVT	R1, #hi_addr(_i+0)
LDRSH	R0, [R1, #0]
ADDS	R0, R0, #1
STRH	R0, [R1, #0]
;ECGsynthetic_events_code.c,241 :: 		}
L_end_sinyal:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _sinyal
_applicationTaskDAC:
;ECGsynthetic_events_code.c,243 :: 		void applicationTaskDAC(){
SUB	SP, SP, #4
STR	LR, [SP, #0]
;ECGsynthetic_events_code.c,245 :: 		step1();
BL	_step1+0
;ECGsynthetic_events_code.c,246 :: 		rungekutta();
BL	_rungekutta+0
;ECGsynthetic_events_code.c,248 :: 		minValue = findMin(z, 513);
MOVW	R1, #513
SXTH	R1, R1
MOVW	R0, #lo_addr(_z+0)
MOVT	R0, #hi_addr(_z+0)
BL	_findMin+0
MOVW	R0, #lo_addr(_minValue+0)
MOVT	R0, #hi_addr(_minValue+0)
VSTR	#1, S0, [R0, #0]
;ECGsynthetic_events_code.c,250 :: 		for (i = 0; i < 513 ; i ++)
MOVS	R1, #0
SXTH	R1, R1
MOVW	R0, #lo_addr(_i+0)
MOVT	R0, #hi_addr(_i+0)
STRH	R1, [R0, #0]
L_applicationTaskDAC284:
MOVW	R0, #lo_addr(_i+0)
MOVT	R0, #hi_addr(_i+0)
LDRSH	R1, [R0, #0]
MOVW	R0, #513
CMP	R1, R0
IT	GE
BGE	L_applicationTaskDAC285
;ECGsynthetic_events_code.c,252 :: 		output[i] = (z[i]-(minValue));
MOVW	R3, #lo_addr(_i+0)
MOVT	R3, #hi_addr(_i+0)
LDRSH	R0, [R3, #0]
LSLS	R1, R0, #2
MOVW	R0, #lo_addr(_output+0)
MOVT	R0, #hi_addr(_output+0)
ADDS	R2, R0, R1
MOVW	R0, #lo_addr(_z+0)
MOVT	R0, #hi_addr(_z+0)
ADDS	R0, R0, R1
VLDR	#1, S1, [R0, #0]
MOVW	R0, #lo_addr(_minValue+0)
MOVT	R0, #hi_addr(_minValue+0)
VLDR	#1, S0, [R0, #0]
VSUB.F32	S0, S1, S0
VSTR	#1, S0, [R2, #0]
;ECGsynthetic_events_code.c,250 :: 		for (i = 0; i < 513 ; i ++)
MOV	R0, R3
LDRSH	R0, [R0, #0]
ADDS	R0, R0, #1
STRH	R0, [R3, #0]
;ECGsynthetic_events_code.c,253 :: 		}
IT	AL
BAL	L_applicationTaskDAC284
L_applicationTaskDAC285:
;ECGsynthetic_events_code.c,255 :: 		maxValue = findMax(output, 513);
MOVW	R1, #513
SXTH	R1, R1
MOVW	R0, #lo_addr(_output+0)
MOVT	R0, #hi_addr(_output+0)
BL	_findMax+0
MOVW	R0, #lo_addr(_maxValue+0)
MOVT	R0, #hi_addr(_maxValue+0)
VSTR	#1, S0, [R0, #0]
;ECGsynthetic_events_code.c,256 :: 		scale = (int)(4095/maxValue);
MOVW	R0, #61440
MOVT	R0, #17791
VMOV	S1, R0
VDIV.F32	S0, S1, S0
VCVT	#1, .F32, S0, S0
VMOV	R1, S0
SXTH	R1, R1
MOVW	R0, #lo_addr(_scale+0)
MOVT	R0, #hi_addr(_scale+0)
STRH	R1, [R0, #0]
;ECGsynthetic_events_code.c,258 :: 		}
L_end_applicationTaskDAC:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _applicationTaskDAC
_Timer7_interrupt:
;ECGsynthetic_events_code.c,260 :: 		void Timer7_interrupt() iv IVT_INT_TIM7 {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;ECGsynthetic_events_code.c,261 :: 		TIM7_SR.UIF = 0;
MOVS	R1, #0
SXTB	R1, R1
MOVW	R0, #lo_addr(TIM7_SR+0)
MOVT	R0, #hi_addr(TIM7_SR+0)
_SX	[R0, ByteOffset(TIM7_SR+0)]
;ECGsynthetic_events_code.c,263 :: 		Check_TP();
BL	_Check_TP+0
;ECGsynthetic_events_code.c,265 :: 		if(buttonFlag){
MOVW	R1, #lo_addr(_buttonFlag+0)
MOVT	R1, #hi_addr(_buttonFlag+0)
LDR	R0, [R1, #0]
CMP	R0, #0
IT	EQ
BEQ	L_Timer7_interrupt287
;ECGsynthetic_events_code.c,266 :: 		sinyal();
BL	_sinyal+0
;ECGsynthetic_events_code.c,267 :: 		}
L_Timer7_interrupt287:
;ECGsynthetic_events_code.c,269 :: 		}
L_end_Timer7_interrupt:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Timer7_interrupt
_ButtonRound4OnClick:
;ECGsynthetic_events_code.c,271 :: 		void ButtonRound4OnClick() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;ECGsynthetic_events_code.c,272 :: 		i = 0;
MOVS	R1, #0
SXTH	R1, R1
MOVW	R0, #lo_addr(_i+0)
MOVT	R0, #hi_addr(_i+0)
STRH	R1, [R0, #0]
;ECGsynthetic_events_code.c,273 :: 		DrawScreen(&Screen1);
MOVW	R0, #lo_addr(_Screen1+0)
MOVT	R0, #hi_addr(_Screen1+0)
BL	_DrawScreen+0
;ECGsynthetic_events_code.c,274 :: 		RadioButton3.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton3+20)
MOVT	R0, #hi_addr(_RadioButton3+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,275 :: 		RadioButton4.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton4+20)
MOVT	R0, #hi_addr(_RadioButton4+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,276 :: 		RadioButton5.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton5+20)
MOVT	R0, #hi_addr(_RadioButton5+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,277 :: 		RadioButton6.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton6+20)
MOVT	R0, #hi_addr(_RadioButton6+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,278 :: 		RadioButton7.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton7+20)
MOVT	R0, #hi_addr(_RadioButton7+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,279 :: 		RadioButton8.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton8+20)
MOVT	R0, #hi_addr(_RadioButton8+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,280 :: 		RadioButton9.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton9+20)
MOVT	R0, #hi_addr(_RadioButton9+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,281 :: 		RadioButton10.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton10+20)
MOVT	R0, #hi_addr(_RadioButton10+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,282 :: 		RadioButton11.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton11+20)
MOVT	R0, #hi_addr(_RadioButton11+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,283 :: 		RadioButton12.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton12+20)
MOVT	R0, #hi_addr(_RadioButton12+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,284 :: 		RadioButton13.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton13+20)
MOVT	R0, #hi_addr(_RadioButton13+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,285 :: 		RadioButton14.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton14+20)
MOVT	R0, #hi_addr(_RadioButton14+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,286 :: 		}
L_end_ButtonRound4OnClick:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _ButtonRound4OnClick
_RadioButton3OnPress:
;ECGsynthetic_events_code.c,290 :: 		void RadioButton3OnPress() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;ECGsynthetic_events_code.c,291 :: 		normal1();
BL	_normal1+0
;ECGsynthetic_events_code.c,292 :: 		applicationTaskDAC();
BL	_applicationTaskDAC+0
;ECGsynthetic_events_code.c,293 :: 		RadioButton4.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton4+20)
MOVT	R0, #hi_addr(_RadioButton4+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,294 :: 		RadioButton5.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton5+20)
MOVT	R0, #hi_addr(_RadioButton5+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,295 :: 		RadioButton6.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton6+20)
MOVT	R0, #hi_addr(_RadioButton6+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,296 :: 		RadioButton7.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton7+20)
MOVT	R0, #hi_addr(_RadioButton7+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,297 :: 		RadioButton8.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton8+20)
MOVT	R0, #hi_addr(_RadioButton8+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,298 :: 		RadioButton9.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton9+20)
MOVT	R0, #hi_addr(_RadioButton9+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,299 :: 		RadioButton10.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton10+20)
MOVT	R0, #hi_addr(_RadioButton10+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,300 :: 		RadioButton11.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton11+20)
MOVT	R0, #hi_addr(_RadioButton11+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,301 :: 		RadioButton12.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton12+20)
MOVT	R0, #hi_addr(_RadioButton12+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,302 :: 		RadioButton13.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton13+20)
MOVT	R0, #hi_addr(_RadioButton13+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,303 :: 		RadioButton14.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton14+20)
MOVT	R0, #hi_addr(_RadioButton14+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,304 :: 		DrawRadioButton(&RadioButton4);
MOVW	R0, #lo_addr(_RadioButton4+0)
MOVT	R0, #hi_addr(_RadioButton4+0)
BL	_DrawRadioButton+0
;ECGsynthetic_events_code.c,305 :: 		DrawRadioButton(&RadioButton5);
MOVW	R0, #lo_addr(_RadioButton5+0)
MOVT	R0, #hi_addr(_RadioButton5+0)
BL	_DrawRadioButton+0
;ECGsynthetic_events_code.c,306 :: 		DrawRadioButton(&RadioButton6);
MOVW	R0, #lo_addr(_RadioButton6+0)
MOVT	R0, #hi_addr(_RadioButton6+0)
BL	_DrawRadioButton+0
;ECGsynthetic_events_code.c,307 :: 		DrawRadioButton(&RadioButton7);
MOVW	R0, #lo_addr(_RadioButton7+0)
MOVT	R0, #hi_addr(_RadioButton7+0)
BL	_DrawRadioButton+0
;ECGsynthetic_events_code.c,308 :: 		DrawRadioButton(&RadioButton8);
MOVW	R0, #lo_addr(_RadioButton8+0)
MOVT	R0, #hi_addr(_RadioButton8+0)
BL	_DrawRadioButton+0
;ECGsynthetic_events_code.c,309 :: 		DrawRadioButton(&RadioButton9);
MOVW	R0, #lo_addr(_RadioButton9+0)
MOVT	R0, #hi_addr(_RadioButton9+0)
BL	_DrawRadioButton+0
;ECGsynthetic_events_code.c,310 :: 		DrawRadioButton(&RadioButton10);
MOVW	R0, #lo_addr(_RadioButton10+0)
MOVT	R0, #hi_addr(_RadioButton10+0)
BL	_DrawRadioButton+0
;ECGsynthetic_events_code.c,311 :: 		DrawRadioButton(&RadioButton11);
MOVW	R0, #lo_addr(_RadioButton11+0)
MOVT	R0, #hi_addr(_RadioButton11+0)
BL	_DrawRadioButton+0
;ECGsynthetic_events_code.c,312 :: 		DrawRadioButton(&RadioButton12);
MOVW	R0, #lo_addr(_RadioButton12+0)
MOVT	R0, #hi_addr(_RadioButton12+0)
BL	_DrawRadioButton+0
;ECGsynthetic_events_code.c,313 :: 		DrawRadioButton(&RadioButton13);
MOVW	R0, #lo_addr(_RadioButton13+0)
MOVT	R0, #hi_addr(_RadioButton13+0)
BL	_DrawRadioButton+0
;ECGsynthetic_events_code.c,314 :: 		DrawRadioButton(&RadioButton14);
MOVW	R0, #lo_addr(_RadioButton14+0)
MOVT	R0, #hi_addr(_RadioButton14+0)
BL	_DrawRadioButton+0
;ECGsynthetic_events_code.c,315 :: 		}
L_end_RadioButton3OnPress:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _RadioButton3OnPress
_RadioButton4OnPress:
;ECGsynthetic_events_code.c,317 :: 		void RadioButton4OnPress() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;ECGsynthetic_events_code.c,318 :: 		normal2();
BL	_normal2+0
;ECGsynthetic_events_code.c,319 :: 		applicationTaskDAC();
BL	_applicationTaskDAC+0
;ECGsynthetic_events_code.c,320 :: 		RadioButton3.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton3+20)
MOVT	R0, #hi_addr(_RadioButton3+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,321 :: 		RadioButton5.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton5+20)
MOVT	R0, #hi_addr(_RadioButton5+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,322 :: 		RadioButton6.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton6+20)
MOVT	R0, #hi_addr(_RadioButton6+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,323 :: 		RadioButton7.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton7+20)
MOVT	R0, #hi_addr(_RadioButton7+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,324 :: 		RadioButton8.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton8+20)
MOVT	R0, #hi_addr(_RadioButton8+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,325 :: 		RadioButton9.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton9+20)
MOVT	R0, #hi_addr(_RadioButton9+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,326 :: 		RadioButton10.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton10+20)
MOVT	R0, #hi_addr(_RadioButton10+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,327 :: 		RadioButton11.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton11+20)
MOVT	R0, #hi_addr(_RadioButton11+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,328 :: 		RadioButton12.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton12+20)
MOVT	R0, #hi_addr(_RadioButton12+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,329 :: 		RadioButton13.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton13+20)
MOVT	R0, #hi_addr(_RadioButton13+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,330 :: 		RadioButton14.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton14+20)
MOVT	R0, #hi_addr(_RadioButton14+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,331 :: 		DrawRadioButton(&RadioButton3);
MOVW	R0, #lo_addr(_RadioButton3+0)
MOVT	R0, #hi_addr(_RadioButton3+0)
BL	_DrawRadioButton+0
;ECGsynthetic_events_code.c,332 :: 		DrawRadioButton(&RadioButton5);
MOVW	R0, #lo_addr(_RadioButton5+0)
MOVT	R0, #hi_addr(_RadioButton5+0)
BL	_DrawRadioButton+0
;ECGsynthetic_events_code.c,333 :: 		DrawRadioButton(&RadioButton6);
MOVW	R0, #lo_addr(_RadioButton6+0)
MOVT	R0, #hi_addr(_RadioButton6+0)
BL	_DrawRadioButton+0
;ECGsynthetic_events_code.c,334 :: 		DrawRadioButton(&RadioButton7);
MOVW	R0, #lo_addr(_RadioButton7+0)
MOVT	R0, #hi_addr(_RadioButton7+0)
BL	_DrawRadioButton+0
;ECGsynthetic_events_code.c,335 :: 		DrawRadioButton(&RadioButton8);
MOVW	R0, #lo_addr(_RadioButton8+0)
MOVT	R0, #hi_addr(_RadioButton8+0)
BL	_DrawRadioButton+0
;ECGsynthetic_events_code.c,336 :: 		DrawRadioButton(&RadioButton9);
MOVW	R0, #lo_addr(_RadioButton9+0)
MOVT	R0, #hi_addr(_RadioButton9+0)
BL	_DrawRadioButton+0
;ECGsynthetic_events_code.c,337 :: 		DrawRadioButton(&RadioButton10);
MOVW	R0, #lo_addr(_RadioButton10+0)
MOVT	R0, #hi_addr(_RadioButton10+0)
BL	_DrawRadioButton+0
;ECGsynthetic_events_code.c,338 :: 		DrawRadioButton(&RadioButton11);
MOVW	R0, #lo_addr(_RadioButton11+0)
MOVT	R0, #hi_addr(_RadioButton11+0)
BL	_DrawRadioButton+0
;ECGsynthetic_events_code.c,339 :: 		DrawRadioButton(&RadioButton12);
MOVW	R0, #lo_addr(_RadioButton12+0)
MOVT	R0, #hi_addr(_RadioButton12+0)
BL	_DrawRadioButton+0
;ECGsynthetic_events_code.c,340 :: 		DrawRadioButton(&RadioButton13);
MOVW	R0, #lo_addr(_RadioButton13+0)
MOVT	R0, #hi_addr(_RadioButton13+0)
BL	_DrawRadioButton+0
;ECGsynthetic_events_code.c,341 :: 		DrawRadioButton(&RadioButton14);
MOVW	R0, #lo_addr(_RadioButton14+0)
MOVT	R0, #hi_addr(_RadioButton14+0)
BL	_DrawRadioButton+0
;ECGsynthetic_events_code.c,342 :: 		}
L_end_RadioButton4OnPress:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _RadioButton4OnPress
_RadioButton5OnPress:
;ECGsynthetic_events_code.c,344 :: 		void RadioButton5OnPress() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;ECGsynthetic_events_code.c,345 :: 		normal3();
BL	_normal3+0
;ECGsynthetic_events_code.c,346 :: 		applicationTaskDAC();
BL	_applicationTaskDAC+0
;ECGsynthetic_events_code.c,347 :: 		RadioButton4.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton4+20)
MOVT	R0, #hi_addr(_RadioButton4+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,348 :: 		RadioButton3.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton3+20)
MOVT	R0, #hi_addr(_RadioButton3+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,349 :: 		RadioButton6.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton6+20)
MOVT	R0, #hi_addr(_RadioButton6+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,350 :: 		RadioButton7.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton7+20)
MOVT	R0, #hi_addr(_RadioButton7+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,351 :: 		RadioButton8.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton8+20)
MOVT	R0, #hi_addr(_RadioButton8+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,352 :: 		RadioButton9.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton9+20)
MOVT	R0, #hi_addr(_RadioButton9+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,353 :: 		RadioButton10.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton10+20)
MOVT	R0, #hi_addr(_RadioButton10+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,354 :: 		RadioButton11.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton11+20)
MOVT	R0, #hi_addr(_RadioButton11+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,355 :: 		RadioButton12.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton12+20)
MOVT	R0, #hi_addr(_RadioButton12+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,356 :: 		RadioButton13.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton13+20)
MOVT	R0, #hi_addr(_RadioButton13+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,357 :: 		RadioButton14.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton14+20)
MOVT	R0, #hi_addr(_RadioButton14+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,358 :: 		DrawRadioButton(&RadioButton4);
MOVW	R0, #lo_addr(_RadioButton4+0)
MOVT	R0, #hi_addr(_RadioButton4+0)
BL	_DrawRadioButton+0
;ECGsynthetic_events_code.c,359 :: 		DrawRadioButton(&RadioButton3);
MOVW	R0, #lo_addr(_RadioButton3+0)
MOVT	R0, #hi_addr(_RadioButton3+0)
BL	_DrawRadioButton+0
;ECGsynthetic_events_code.c,360 :: 		DrawRadioButton(&RadioButton6);
MOVW	R0, #lo_addr(_RadioButton6+0)
MOVT	R0, #hi_addr(_RadioButton6+0)
BL	_DrawRadioButton+0
;ECGsynthetic_events_code.c,361 :: 		DrawRadioButton(&RadioButton7);
MOVW	R0, #lo_addr(_RadioButton7+0)
MOVT	R0, #hi_addr(_RadioButton7+0)
BL	_DrawRadioButton+0
;ECGsynthetic_events_code.c,362 :: 		DrawRadioButton(&RadioButton8);
MOVW	R0, #lo_addr(_RadioButton8+0)
MOVT	R0, #hi_addr(_RadioButton8+0)
BL	_DrawRadioButton+0
;ECGsynthetic_events_code.c,363 :: 		DrawRadioButton(&RadioButton9);
MOVW	R0, #lo_addr(_RadioButton9+0)
MOVT	R0, #hi_addr(_RadioButton9+0)
BL	_DrawRadioButton+0
;ECGsynthetic_events_code.c,364 :: 		DrawRadioButton(&RadioButton10);
MOVW	R0, #lo_addr(_RadioButton10+0)
MOVT	R0, #hi_addr(_RadioButton10+0)
BL	_DrawRadioButton+0
;ECGsynthetic_events_code.c,365 :: 		DrawRadioButton(&RadioButton11);
MOVW	R0, #lo_addr(_RadioButton11+0)
MOVT	R0, #hi_addr(_RadioButton11+0)
BL	_DrawRadioButton+0
;ECGsynthetic_events_code.c,366 :: 		DrawRadioButton(&RadioButton12);
MOVW	R0, #lo_addr(_RadioButton12+0)
MOVT	R0, #hi_addr(_RadioButton12+0)
BL	_DrawRadioButton+0
;ECGsynthetic_events_code.c,367 :: 		DrawRadioButton(&RadioButton13);
MOVW	R0, #lo_addr(_RadioButton13+0)
MOVT	R0, #hi_addr(_RadioButton13+0)
BL	_DrawRadioButton+0
;ECGsynthetic_events_code.c,368 :: 		DrawRadioButton(&RadioButton14);
MOVW	R0, #lo_addr(_RadioButton14+0)
MOVT	R0, #hi_addr(_RadioButton14+0)
BL	_DrawRadioButton+0
;ECGsynthetic_events_code.c,370 :: 		}
L_end_RadioButton5OnPress:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _RadioButton5OnPress
_RadioButton6OnPress:
;ECGsynthetic_events_code.c,372 :: 		void RadioButton6OnPress() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;ECGsynthetic_events_code.c,373 :: 		normalavr();
BL	_normalaVR+0
;ECGsynthetic_events_code.c,374 :: 		applicationTaskDAC();
BL	_applicationTaskDAC+0
;ECGsynthetic_events_code.c,375 :: 		RadioButton4.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton4+20)
MOVT	R0, #hi_addr(_RadioButton4+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,376 :: 		RadioButton5.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton5+20)
MOVT	R0, #hi_addr(_RadioButton5+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,377 :: 		RadioButton3.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton3+20)
MOVT	R0, #hi_addr(_RadioButton3+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,378 :: 		RadioButton7.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton7+20)
MOVT	R0, #hi_addr(_RadioButton7+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,379 :: 		RadioButton8.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton8+20)
MOVT	R0, #hi_addr(_RadioButton8+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,380 :: 		RadioButton9.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton9+20)
MOVT	R0, #hi_addr(_RadioButton9+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,381 :: 		RadioButton10.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton10+20)
MOVT	R0, #hi_addr(_RadioButton10+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,382 :: 		RadioButton11.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton11+20)
MOVT	R0, #hi_addr(_RadioButton11+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,383 :: 		RadioButton12.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton12+20)
MOVT	R0, #hi_addr(_RadioButton12+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,384 :: 		RadioButton13.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton13+20)
MOVT	R0, #hi_addr(_RadioButton13+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,385 :: 		RadioButton14.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton14+20)
MOVT	R0, #hi_addr(_RadioButton14+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,386 :: 		DrawRadioButton(&RadioButton4);
MOVW	R0, #lo_addr(_RadioButton4+0)
MOVT	R0, #hi_addr(_RadioButton4+0)
BL	_DrawRadioButton+0
;ECGsynthetic_events_code.c,387 :: 		DrawRadioButton(&RadioButton5);
MOVW	R0, #lo_addr(_RadioButton5+0)
MOVT	R0, #hi_addr(_RadioButton5+0)
BL	_DrawRadioButton+0
;ECGsynthetic_events_code.c,388 :: 		DrawRadioButton(&RadioButton3);
MOVW	R0, #lo_addr(_RadioButton3+0)
MOVT	R0, #hi_addr(_RadioButton3+0)
BL	_DrawRadioButton+0
;ECGsynthetic_events_code.c,389 :: 		DrawRadioButton(&RadioButton7);
MOVW	R0, #lo_addr(_RadioButton7+0)
MOVT	R0, #hi_addr(_RadioButton7+0)
BL	_DrawRadioButton+0
;ECGsynthetic_events_code.c,390 :: 		DrawRadioButton(&RadioButton8);
MOVW	R0, #lo_addr(_RadioButton8+0)
MOVT	R0, #hi_addr(_RadioButton8+0)
BL	_DrawRadioButton+0
;ECGsynthetic_events_code.c,391 :: 		DrawRadioButton(&RadioButton9);
MOVW	R0, #lo_addr(_RadioButton9+0)
MOVT	R0, #hi_addr(_RadioButton9+0)
BL	_DrawRadioButton+0
;ECGsynthetic_events_code.c,392 :: 		DrawRadioButton(&RadioButton10);
MOVW	R0, #lo_addr(_RadioButton10+0)
MOVT	R0, #hi_addr(_RadioButton10+0)
BL	_DrawRadioButton+0
;ECGsynthetic_events_code.c,393 :: 		DrawRadioButton(&RadioButton11);
MOVW	R0, #lo_addr(_RadioButton11+0)
MOVT	R0, #hi_addr(_RadioButton11+0)
BL	_DrawRadioButton+0
;ECGsynthetic_events_code.c,394 :: 		DrawRadioButton(&RadioButton12);
MOVW	R0, #lo_addr(_RadioButton12+0)
MOVT	R0, #hi_addr(_RadioButton12+0)
BL	_DrawRadioButton+0
;ECGsynthetic_events_code.c,395 :: 		DrawRadioButton(&RadioButton13);
MOVW	R0, #lo_addr(_RadioButton13+0)
MOVT	R0, #hi_addr(_RadioButton13+0)
BL	_DrawRadioButton+0
;ECGsynthetic_events_code.c,396 :: 		DrawRadioButton(&RadioButton14);
MOVW	R0, #lo_addr(_RadioButton14+0)
MOVT	R0, #hi_addr(_RadioButton14+0)
BL	_DrawRadioButton+0
;ECGsynthetic_events_code.c,398 :: 		}
L_end_RadioButton6OnPress:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _RadioButton6OnPress
_RadioButton7OnPress:
;ECGsynthetic_events_code.c,400 :: 		void RadioButton7OnPress() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;ECGsynthetic_events_code.c,401 :: 		normalavl();
BL	_normalaVL+0
;ECGsynthetic_events_code.c,402 :: 		applicationTaskDAC();
BL	_applicationTaskDAC+0
;ECGsynthetic_events_code.c,403 :: 		RadioButton4.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton4+20)
MOVT	R0, #hi_addr(_RadioButton4+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,404 :: 		RadioButton5.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton5+20)
MOVT	R0, #hi_addr(_RadioButton5+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,405 :: 		RadioButton6.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton6+20)
MOVT	R0, #hi_addr(_RadioButton6+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,406 :: 		RadioButton3.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton3+20)
MOVT	R0, #hi_addr(_RadioButton3+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,407 :: 		RadioButton8.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton8+20)
MOVT	R0, #hi_addr(_RadioButton8+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,408 :: 		RadioButton9.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton9+20)
MOVT	R0, #hi_addr(_RadioButton9+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,409 :: 		RadioButton10.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton10+20)
MOVT	R0, #hi_addr(_RadioButton10+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,410 :: 		RadioButton11.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton11+20)
MOVT	R0, #hi_addr(_RadioButton11+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,411 :: 		RadioButton12.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton12+20)
MOVT	R0, #hi_addr(_RadioButton12+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,412 :: 		RadioButton13.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton13+20)
MOVT	R0, #hi_addr(_RadioButton13+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,413 :: 		RadioButton14.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton14+20)
MOVT	R0, #hi_addr(_RadioButton14+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,414 :: 		DrawRadioButton(&RadioButton4);
MOVW	R0, #lo_addr(_RadioButton4+0)
MOVT	R0, #hi_addr(_RadioButton4+0)
BL	_DrawRadioButton+0
;ECGsynthetic_events_code.c,415 :: 		DrawRadioButton(&RadioButton5);
MOVW	R0, #lo_addr(_RadioButton5+0)
MOVT	R0, #hi_addr(_RadioButton5+0)
BL	_DrawRadioButton+0
;ECGsynthetic_events_code.c,416 :: 		DrawRadioButton(&RadioButton6);
MOVW	R0, #lo_addr(_RadioButton6+0)
MOVT	R0, #hi_addr(_RadioButton6+0)
BL	_DrawRadioButton+0
;ECGsynthetic_events_code.c,417 :: 		DrawRadioButton(&RadioButton3);
MOVW	R0, #lo_addr(_RadioButton3+0)
MOVT	R0, #hi_addr(_RadioButton3+0)
BL	_DrawRadioButton+0
;ECGsynthetic_events_code.c,418 :: 		DrawRadioButton(&RadioButton8);
MOVW	R0, #lo_addr(_RadioButton8+0)
MOVT	R0, #hi_addr(_RadioButton8+0)
BL	_DrawRadioButton+0
;ECGsynthetic_events_code.c,419 :: 		DrawRadioButton(&RadioButton9);
MOVW	R0, #lo_addr(_RadioButton9+0)
MOVT	R0, #hi_addr(_RadioButton9+0)
BL	_DrawRadioButton+0
;ECGsynthetic_events_code.c,420 :: 		DrawRadioButton(&RadioButton10);
MOVW	R0, #lo_addr(_RadioButton10+0)
MOVT	R0, #hi_addr(_RadioButton10+0)
BL	_DrawRadioButton+0
;ECGsynthetic_events_code.c,421 :: 		DrawRadioButton(&RadioButton11);
MOVW	R0, #lo_addr(_RadioButton11+0)
MOVT	R0, #hi_addr(_RadioButton11+0)
BL	_DrawRadioButton+0
;ECGsynthetic_events_code.c,422 :: 		DrawRadioButton(&RadioButton12);
MOVW	R0, #lo_addr(_RadioButton12+0)
MOVT	R0, #hi_addr(_RadioButton12+0)
BL	_DrawRadioButton+0
;ECGsynthetic_events_code.c,423 :: 		DrawRadioButton(&RadioButton13);
MOVW	R0, #lo_addr(_RadioButton13+0)
MOVT	R0, #hi_addr(_RadioButton13+0)
BL	_DrawRadioButton+0
;ECGsynthetic_events_code.c,424 :: 		DrawRadioButton(&RadioButton14);
MOVW	R0, #lo_addr(_RadioButton14+0)
MOVT	R0, #hi_addr(_RadioButton14+0)
BL	_DrawRadioButton+0
;ECGsynthetic_events_code.c,425 :: 		}
L_end_RadioButton7OnPress:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _RadioButton7OnPress
_RadioButton8OnPress:
;ECGsynthetic_events_code.c,427 :: 		void RadioButton8OnPress() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;ECGsynthetic_events_code.c,428 :: 		normalavf();
BL	_normalaVF+0
;ECGsynthetic_events_code.c,429 :: 		applicationTaskDAC();
BL	_applicationTaskDAC+0
;ECGsynthetic_events_code.c,430 :: 		RadioButton4.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton4+20)
MOVT	R0, #hi_addr(_RadioButton4+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,431 :: 		RadioButton5.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton5+20)
MOVT	R0, #hi_addr(_RadioButton5+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,432 :: 		RadioButton6.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton6+20)
MOVT	R0, #hi_addr(_RadioButton6+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,433 :: 		RadioButton7.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton7+20)
MOVT	R0, #hi_addr(_RadioButton7+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,434 :: 		RadioButton3.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton3+20)
MOVT	R0, #hi_addr(_RadioButton3+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,435 :: 		RadioButton9.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton9+20)
MOVT	R0, #hi_addr(_RadioButton9+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,436 :: 		RadioButton10.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton10+20)
MOVT	R0, #hi_addr(_RadioButton10+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,437 :: 		RadioButton11.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton11+20)
MOVT	R0, #hi_addr(_RadioButton11+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,438 :: 		RadioButton12.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton12+20)
MOVT	R0, #hi_addr(_RadioButton12+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,439 :: 		RadioButton13.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton13+20)
MOVT	R0, #hi_addr(_RadioButton13+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,440 :: 		RadioButton14.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton14+20)
MOVT	R0, #hi_addr(_RadioButton14+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,441 :: 		DrawRadioButton(&RadioButton4);
MOVW	R0, #lo_addr(_RadioButton4+0)
MOVT	R0, #hi_addr(_RadioButton4+0)
BL	_DrawRadioButton+0
;ECGsynthetic_events_code.c,442 :: 		DrawRadioButton(&RadioButton5);
MOVW	R0, #lo_addr(_RadioButton5+0)
MOVT	R0, #hi_addr(_RadioButton5+0)
BL	_DrawRadioButton+0
;ECGsynthetic_events_code.c,443 :: 		DrawRadioButton(&RadioButton6);
MOVW	R0, #lo_addr(_RadioButton6+0)
MOVT	R0, #hi_addr(_RadioButton6+0)
BL	_DrawRadioButton+0
;ECGsynthetic_events_code.c,444 :: 		DrawRadioButton(&RadioButton7);
MOVW	R0, #lo_addr(_RadioButton7+0)
MOVT	R0, #hi_addr(_RadioButton7+0)
BL	_DrawRadioButton+0
;ECGsynthetic_events_code.c,445 :: 		DrawRadioButton(&RadioButton3);
MOVW	R0, #lo_addr(_RadioButton3+0)
MOVT	R0, #hi_addr(_RadioButton3+0)
BL	_DrawRadioButton+0
;ECGsynthetic_events_code.c,446 :: 		DrawRadioButton(&RadioButton9);
MOVW	R0, #lo_addr(_RadioButton9+0)
MOVT	R0, #hi_addr(_RadioButton9+0)
BL	_DrawRadioButton+0
;ECGsynthetic_events_code.c,447 :: 		DrawRadioButton(&RadioButton10);
MOVW	R0, #lo_addr(_RadioButton10+0)
MOVT	R0, #hi_addr(_RadioButton10+0)
BL	_DrawRadioButton+0
;ECGsynthetic_events_code.c,448 :: 		DrawRadioButton(&RadioButton11);
MOVW	R0, #lo_addr(_RadioButton11+0)
MOVT	R0, #hi_addr(_RadioButton11+0)
BL	_DrawRadioButton+0
;ECGsynthetic_events_code.c,449 :: 		DrawRadioButton(&RadioButton12);
MOVW	R0, #lo_addr(_RadioButton12+0)
MOVT	R0, #hi_addr(_RadioButton12+0)
BL	_DrawRadioButton+0
;ECGsynthetic_events_code.c,450 :: 		DrawRadioButton(&RadioButton13);
MOVW	R0, #lo_addr(_RadioButton13+0)
MOVT	R0, #hi_addr(_RadioButton13+0)
BL	_DrawRadioButton+0
;ECGsynthetic_events_code.c,451 :: 		DrawRadioButton(&RadioButton14);
MOVW	R0, #lo_addr(_RadioButton14+0)
MOVT	R0, #hi_addr(_RadioButton14+0)
BL	_DrawRadioButton+0
;ECGsynthetic_events_code.c,452 :: 		}
L_end_RadioButton8OnPress:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _RadioButton8OnPress
_RadioButton9OnPress:
;ECGsynthetic_events_code.c,454 :: 		void RadioButton9OnPress() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;ECGsynthetic_events_code.c,455 :: 		normalv1();
BL	_normalV1+0
;ECGsynthetic_events_code.c,456 :: 		applicationTaskDAC();
BL	_applicationTaskDAC+0
;ECGsynthetic_events_code.c,457 :: 		RadioButton4.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton4+20)
MOVT	R0, #hi_addr(_RadioButton4+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,458 :: 		RadioButton5.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton5+20)
MOVT	R0, #hi_addr(_RadioButton5+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,459 :: 		RadioButton6.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton6+20)
MOVT	R0, #hi_addr(_RadioButton6+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,460 :: 		RadioButton7.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton7+20)
MOVT	R0, #hi_addr(_RadioButton7+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,461 :: 		RadioButton8.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton8+20)
MOVT	R0, #hi_addr(_RadioButton8+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,462 :: 		RadioButton3.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton3+20)
MOVT	R0, #hi_addr(_RadioButton3+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,463 :: 		RadioButton10.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton10+20)
MOVT	R0, #hi_addr(_RadioButton10+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,464 :: 		RadioButton11.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton11+20)
MOVT	R0, #hi_addr(_RadioButton11+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,465 :: 		RadioButton12.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton12+20)
MOVT	R0, #hi_addr(_RadioButton12+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,466 :: 		RadioButton13.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton13+20)
MOVT	R0, #hi_addr(_RadioButton13+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,467 :: 		RadioButton14.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton14+20)
MOVT	R0, #hi_addr(_RadioButton14+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,468 :: 		DrawRadioButton(&RadioButton4);
MOVW	R0, #lo_addr(_RadioButton4+0)
MOVT	R0, #hi_addr(_RadioButton4+0)
BL	_DrawRadioButton+0
;ECGsynthetic_events_code.c,469 :: 		DrawRadioButton(&RadioButton5);
MOVW	R0, #lo_addr(_RadioButton5+0)
MOVT	R0, #hi_addr(_RadioButton5+0)
BL	_DrawRadioButton+0
;ECGsynthetic_events_code.c,470 :: 		DrawRadioButton(&RadioButton6);
MOVW	R0, #lo_addr(_RadioButton6+0)
MOVT	R0, #hi_addr(_RadioButton6+0)
BL	_DrawRadioButton+0
;ECGsynthetic_events_code.c,471 :: 		DrawRadioButton(&RadioButton7);
MOVW	R0, #lo_addr(_RadioButton7+0)
MOVT	R0, #hi_addr(_RadioButton7+0)
BL	_DrawRadioButton+0
;ECGsynthetic_events_code.c,472 :: 		DrawRadioButton(&RadioButton8);
MOVW	R0, #lo_addr(_RadioButton8+0)
MOVT	R0, #hi_addr(_RadioButton8+0)
BL	_DrawRadioButton+0
;ECGsynthetic_events_code.c,473 :: 		DrawRadioButton(&RadioButton3);
MOVW	R0, #lo_addr(_RadioButton3+0)
MOVT	R0, #hi_addr(_RadioButton3+0)
BL	_DrawRadioButton+0
;ECGsynthetic_events_code.c,474 :: 		DrawRadioButton(&RadioButton10);
MOVW	R0, #lo_addr(_RadioButton10+0)
MOVT	R0, #hi_addr(_RadioButton10+0)
BL	_DrawRadioButton+0
;ECGsynthetic_events_code.c,475 :: 		DrawRadioButton(&RadioButton11);
MOVW	R0, #lo_addr(_RadioButton11+0)
MOVT	R0, #hi_addr(_RadioButton11+0)
BL	_DrawRadioButton+0
;ECGsynthetic_events_code.c,476 :: 		DrawRadioButton(&RadioButton12);
MOVW	R0, #lo_addr(_RadioButton12+0)
MOVT	R0, #hi_addr(_RadioButton12+0)
BL	_DrawRadioButton+0
;ECGsynthetic_events_code.c,477 :: 		DrawRadioButton(&RadioButton13);
MOVW	R0, #lo_addr(_RadioButton13+0)
MOVT	R0, #hi_addr(_RadioButton13+0)
BL	_DrawRadioButton+0
;ECGsynthetic_events_code.c,478 :: 		DrawRadioButton(&RadioButton14);
MOVW	R0, #lo_addr(_RadioButton14+0)
MOVT	R0, #hi_addr(_RadioButton14+0)
BL	_DrawRadioButton+0
;ECGsynthetic_events_code.c,479 :: 		}
L_end_RadioButton9OnPress:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _RadioButton9OnPress
_RadioButton10OnPress:
;ECGsynthetic_events_code.c,481 :: 		void RadioButton10OnPress() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;ECGsynthetic_events_code.c,482 :: 		normalv2();
BL	_normalV2+0
;ECGsynthetic_events_code.c,483 :: 		applicationTaskDAC();
BL	_applicationTaskDAC+0
;ECGsynthetic_events_code.c,484 :: 		RadioButton4.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton4+20)
MOVT	R0, #hi_addr(_RadioButton4+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,485 :: 		RadioButton5.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton5+20)
MOVT	R0, #hi_addr(_RadioButton5+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,486 :: 		RadioButton6.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton6+20)
MOVT	R0, #hi_addr(_RadioButton6+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,487 :: 		RadioButton7.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton7+20)
MOVT	R0, #hi_addr(_RadioButton7+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,488 :: 		RadioButton8.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton8+20)
MOVT	R0, #hi_addr(_RadioButton8+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,489 :: 		RadioButton9.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton9+20)
MOVT	R0, #hi_addr(_RadioButton9+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,490 :: 		RadioButton3.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton3+20)
MOVT	R0, #hi_addr(_RadioButton3+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,491 :: 		RadioButton11.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton11+20)
MOVT	R0, #hi_addr(_RadioButton11+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,492 :: 		RadioButton12.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton12+20)
MOVT	R0, #hi_addr(_RadioButton12+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,493 :: 		RadioButton13.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton13+20)
MOVT	R0, #hi_addr(_RadioButton13+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,494 :: 		RadioButton14.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton14+20)
MOVT	R0, #hi_addr(_RadioButton14+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,495 :: 		DrawRadioButton(&RadioButton4);
MOVW	R0, #lo_addr(_RadioButton4+0)
MOVT	R0, #hi_addr(_RadioButton4+0)
BL	_DrawRadioButton+0
;ECGsynthetic_events_code.c,496 :: 		DrawRadioButton(&RadioButton5);
MOVW	R0, #lo_addr(_RadioButton5+0)
MOVT	R0, #hi_addr(_RadioButton5+0)
BL	_DrawRadioButton+0
;ECGsynthetic_events_code.c,497 :: 		DrawRadioButton(&RadioButton6);
MOVW	R0, #lo_addr(_RadioButton6+0)
MOVT	R0, #hi_addr(_RadioButton6+0)
BL	_DrawRadioButton+0
;ECGsynthetic_events_code.c,498 :: 		DrawRadioButton(&RadioButton7);
MOVW	R0, #lo_addr(_RadioButton7+0)
MOVT	R0, #hi_addr(_RadioButton7+0)
BL	_DrawRadioButton+0
;ECGsynthetic_events_code.c,499 :: 		DrawRadioButton(&RadioButton8);
MOVW	R0, #lo_addr(_RadioButton8+0)
MOVT	R0, #hi_addr(_RadioButton8+0)
BL	_DrawRadioButton+0
;ECGsynthetic_events_code.c,500 :: 		DrawRadioButton(&RadioButton9);
MOVW	R0, #lo_addr(_RadioButton9+0)
MOVT	R0, #hi_addr(_RadioButton9+0)
BL	_DrawRadioButton+0
;ECGsynthetic_events_code.c,501 :: 		DrawRadioButton(&RadioButton3);
MOVW	R0, #lo_addr(_RadioButton3+0)
MOVT	R0, #hi_addr(_RadioButton3+0)
BL	_DrawRadioButton+0
;ECGsynthetic_events_code.c,502 :: 		DrawRadioButton(&RadioButton11);
MOVW	R0, #lo_addr(_RadioButton11+0)
MOVT	R0, #hi_addr(_RadioButton11+0)
BL	_DrawRadioButton+0
;ECGsynthetic_events_code.c,503 :: 		DrawRadioButton(&RadioButton12);
MOVW	R0, #lo_addr(_RadioButton12+0)
MOVT	R0, #hi_addr(_RadioButton12+0)
BL	_DrawRadioButton+0
;ECGsynthetic_events_code.c,504 :: 		DrawRadioButton(&RadioButton13);
MOVW	R0, #lo_addr(_RadioButton13+0)
MOVT	R0, #hi_addr(_RadioButton13+0)
BL	_DrawRadioButton+0
;ECGsynthetic_events_code.c,505 :: 		DrawRadioButton(&RadioButton14);
MOVW	R0, #lo_addr(_RadioButton14+0)
MOVT	R0, #hi_addr(_RadioButton14+0)
BL	_DrawRadioButton+0
;ECGsynthetic_events_code.c,506 :: 		}
L_end_RadioButton10OnPress:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _RadioButton10OnPress
_RadioButton11OnPress:
;ECGsynthetic_events_code.c,508 :: 		void RadioButton11OnPress() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;ECGsynthetic_events_code.c,509 :: 		normalv3();
BL	_normalV3+0
;ECGsynthetic_events_code.c,510 :: 		applicationTaskDAC();
BL	_applicationTaskDAC+0
;ECGsynthetic_events_code.c,511 :: 		RadioButton4.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton4+20)
MOVT	R0, #hi_addr(_RadioButton4+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,512 :: 		RadioButton5.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton5+20)
MOVT	R0, #hi_addr(_RadioButton5+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,513 :: 		RadioButton6.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton6+20)
MOVT	R0, #hi_addr(_RadioButton6+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,514 :: 		RadioButton7.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton7+20)
MOVT	R0, #hi_addr(_RadioButton7+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,515 :: 		RadioButton8.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton8+20)
MOVT	R0, #hi_addr(_RadioButton8+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,516 :: 		RadioButton9.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton9+20)
MOVT	R0, #hi_addr(_RadioButton9+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,517 :: 		RadioButton10.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton10+20)
MOVT	R0, #hi_addr(_RadioButton10+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,518 :: 		RadioButton3.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton3+20)
MOVT	R0, #hi_addr(_RadioButton3+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,519 :: 		RadioButton12.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton12+20)
MOVT	R0, #hi_addr(_RadioButton12+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,520 :: 		RadioButton13.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton13+20)
MOVT	R0, #hi_addr(_RadioButton13+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,521 :: 		RadioButton14.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton14+20)
MOVT	R0, #hi_addr(_RadioButton14+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,522 :: 		DrawRadioButton(&RadioButton4);
MOVW	R0, #lo_addr(_RadioButton4+0)
MOVT	R0, #hi_addr(_RadioButton4+0)
BL	_DrawRadioButton+0
;ECGsynthetic_events_code.c,523 :: 		DrawRadioButton(&RadioButton5);
MOVW	R0, #lo_addr(_RadioButton5+0)
MOVT	R0, #hi_addr(_RadioButton5+0)
BL	_DrawRadioButton+0
;ECGsynthetic_events_code.c,524 :: 		DrawRadioButton(&RadioButton6);
MOVW	R0, #lo_addr(_RadioButton6+0)
MOVT	R0, #hi_addr(_RadioButton6+0)
BL	_DrawRadioButton+0
;ECGsynthetic_events_code.c,525 :: 		DrawRadioButton(&RadioButton7);
MOVW	R0, #lo_addr(_RadioButton7+0)
MOVT	R0, #hi_addr(_RadioButton7+0)
BL	_DrawRadioButton+0
;ECGsynthetic_events_code.c,526 :: 		DrawRadioButton(&RadioButton8);
MOVW	R0, #lo_addr(_RadioButton8+0)
MOVT	R0, #hi_addr(_RadioButton8+0)
BL	_DrawRadioButton+0
;ECGsynthetic_events_code.c,527 :: 		DrawRadioButton(&RadioButton9);
MOVW	R0, #lo_addr(_RadioButton9+0)
MOVT	R0, #hi_addr(_RadioButton9+0)
BL	_DrawRadioButton+0
;ECGsynthetic_events_code.c,528 :: 		DrawRadioButton(&RadioButton10);
MOVW	R0, #lo_addr(_RadioButton10+0)
MOVT	R0, #hi_addr(_RadioButton10+0)
BL	_DrawRadioButton+0
;ECGsynthetic_events_code.c,529 :: 		DrawRadioButton(&RadioButton3);
MOVW	R0, #lo_addr(_RadioButton3+0)
MOVT	R0, #hi_addr(_RadioButton3+0)
BL	_DrawRadioButton+0
;ECGsynthetic_events_code.c,530 :: 		DrawRadioButton(&RadioButton12);
MOVW	R0, #lo_addr(_RadioButton12+0)
MOVT	R0, #hi_addr(_RadioButton12+0)
BL	_DrawRadioButton+0
;ECGsynthetic_events_code.c,531 :: 		DrawRadioButton(&RadioButton13);
MOVW	R0, #lo_addr(_RadioButton13+0)
MOVT	R0, #hi_addr(_RadioButton13+0)
BL	_DrawRadioButton+0
;ECGsynthetic_events_code.c,532 :: 		DrawRadioButton(&RadioButton14);
MOVW	R0, #lo_addr(_RadioButton14+0)
MOVT	R0, #hi_addr(_RadioButton14+0)
BL	_DrawRadioButton+0
;ECGsynthetic_events_code.c,533 :: 		}
L_end_RadioButton11OnPress:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _RadioButton11OnPress
_RadioButton12OnPress:
;ECGsynthetic_events_code.c,535 :: 		void RadioButton12OnPress() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;ECGsynthetic_events_code.c,536 :: 		normalv4();
BL	_normalV4+0
;ECGsynthetic_events_code.c,537 :: 		applicationTaskDAC();
BL	_applicationTaskDAC+0
;ECGsynthetic_events_code.c,538 :: 		RadioButton4.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton4+20)
MOVT	R0, #hi_addr(_RadioButton4+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,539 :: 		RadioButton5.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton5+20)
MOVT	R0, #hi_addr(_RadioButton5+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,540 :: 		RadioButton6.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton6+20)
MOVT	R0, #hi_addr(_RadioButton6+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,541 :: 		RadioButton7.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton7+20)
MOVT	R0, #hi_addr(_RadioButton7+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,542 :: 		RadioButton8.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton8+20)
MOVT	R0, #hi_addr(_RadioButton8+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,543 :: 		RadioButton9.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton9+20)
MOVT	R0, #hi_addr(_RadioButton9+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,544 :: 		RadioButton10.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton10+20)
MOVT	R0, #hi_addr(_RadioButton10+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,545 :: 		RadioButton11.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton11+20)
MOVT	R0, #hi_addr(_RadioButton11+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,546 :: 		RadioButton3.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton3+20)
MOVT	R0, #hi_addr(_RadioButton3+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,547 :: 		RadioButton13.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton13+20)
MOVT	R0, #hi_addr(_RadioButton13+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,548 :: 		RadioButton14.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton14+20)
MOVT	R0, #hi_addr(_RadioButton14+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,549 :: 		DrawRadioButton(&RadioButton4);
MOVW	R0, #lo_addr(_RadioButton4+0)
MOVT	R0, #hi_addr(_RadioButton4+0)
BL	_DrawRadioButton+0
;ECGsynthetic_events_code.c,550 :: 		DrawRadioButton(&RadioButton5);
MOVW	R0, #lo_addr(_RadioButton5+0)
MOVT	R0, #hi_addr(_RadioButton5+0)
BL	_DrawRadioButton+0
;ECGsynthetic_events_code.c,551 :: 		DrawRadioButton(&RadioButton6);
MOVW	R0, #lo_addr(_RadioButton6+0)
MOVT	R0, #hi_addr(_RadioButton6+0)
BL	_DrawRadioButton+0
;ECGsynthetic_events_code.c,552 :: 		DrawRadioButton(&RadioButton7);
MOVW	R0, #lo_addr(_RadioButton7+0)
MOVT	R0, #hi_addr(_RadioButton7+0)
BL	_DrawRadioButton+0
;ECGsynthetic_events_code.c,553 :: 		DrawRadioButton(&RadioButton8);
MOVW	R0, #lo_addr(_RadioButton8+0)
MOVT	R0, #hi_addr(_RadioButton8+0)
BL	_DrawRadioButton+0
;ECGsynthetic_events_code.c,554 :: 		DrawRadioButton(&RadioButton9);
MOVW	R0, #lo_addr(_RadioButton9+0)
MOVT	R0, #hi_addr(_RadioButton9+0)
BL	_DrawRadioButton+0
;ECGsynthetic_events_code.c,555 :: 		DrawRadioButton(&RadioButton10);
MOVW	R0, #lo_addr(_RadioButton10+0)
MOVT	R0, #hi_addr(_RadioButton10+0)
BL	_DrawRadioButton+0
;ECGsynthetic_events_code.c,556 :: 		DrawRadioButton(&RadioButton11);
MOVW	R0, #lo_addr(_RadioButton11+0)
MOVT	R0, #hi_addr(_RadioButton11+0)
BL	_DrawRadioButton+0
;ECGsynthetic_events_code.c,557 :: 		DrawRadioButton(&RadioButton3);
MOVW	R0, #lo_addr(_RadioButton3+0)
MOVT	R0, #hi_addr(_RadioButton3+0)
BL	_DrawRadioButton+0
;ECGsynthetic_events_code.c,558 :: 		DrawRadioButton(&RadioButton13);
MOVW	R0, #lo_addr(_RadioButton13+0)
MOVT	R0, #hi_addr(_RadioButton13+0)
BL	_DrawRadioButton+0
;ECGsynthetic_events_code.c,559 :: 		DrawRadioButton(&RadioButton14);
MOVW	R0, #lo_addr(_RadioButton14+0)
MOVT	R0, #hi_addr(_RadioButton14+0)
BL	_DrawRadioButton+0
;ECGsynthetic_events_code.c,560 :: 		}
L_end_RadioButton12OnPress:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _RadioButton12OnPress
_RadioButton13OnPress:
;ECGsynthetic_events_code.c,562 :: 		void RadioButton13OnPress() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;ECGsynthetic_events_code.c,563 :: 		normalv5();
BL	_normalV5+0
;ECGsynthetic_events_code.c,564 :: 		applicationTaskDAC();
BL	_applicationTaskDAC+0
;ECGsynthetic_events_code.c,565 :: 		RadioButton4.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton4+20)
MOVT	R0, #hi_addr(_RadioButton4+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,566 :: 		RadioButton5.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton5+20)
MOVT	R0, #hi_addr(_RadioButton5+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,567 :: 		RadioButton6.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton6+20)
MOVT	R0, #hi_addr(_RadioButton6+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,568 :: 		RadioButton7.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton7+20)
MOVT	R0, #hi_addr(_RadioButton7+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,569 :: 		RadioButton8.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton8+20)
MOVT	R0, #hi_addr(_RadioButton8+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,570 :: 		RadioButton9.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton9+20)
MOVT	R0, #hi_addr(_RadioButton9+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,571 :: 		RadioButton10.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton10+20)
MOVT	R0, #hi_addr(_RadioButton10+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,572 :: 		RadioButton11.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton11+20)
MOVT	R0, #hi_addr(_RadioButton11+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,573 :: 		RadioButton12.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton12+20)
MOVT	R0, #hi_addr(_RadioButton12+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,574 :: 		RadioButton3.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton3+20)
MOVT	R0, #hi_addr(_RadioButton3+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,575 :: 		RadioButton14.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton14+20)
MOVT	R0, #hi_addr(_RadioButton14+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,576 :: 		DrawRadioButton(&RadioButton4);
MOVW	R0, #lo_addr(_RadioButton4+0)
MOVT	R0, #hi_addr(_RadioButton4+0)
BL	_DrawRadioButton+0
;ECGsynthetic_events_code.c,577 :: 		DrawRadioButton(&RadioButton5);
MOVW	R0, #lo_addr(_RadioButton5+0)
MOVT	R0, #hi_addr(_RadioButton5+0)
BL	_DrawRadioButton+0
;ECGsynthetic_events_code.c,578 :: 		DrawRadioButton(&RadioButton6);
MOVW	R0, #lo_addr(_RadioButton6+0)
MOVT	R0, #hi_addr(_RadioButton6+0)
BL	_DrawRadioButton+0
;ECGsynthetic_events_code.c,579 :: 		DrawRadioButton(&RadioButton7);
MOVW	R0, #lo_addr(_RadioButton7+0)
MOVT	R0, #hi_addr(_RadioButton7+0)
BL	_DrawRadioButton+0
;ECGsynthetic_events_code.c,580 :: 		DrawRadioButton(&RadioButton8);
MOVW	R0, #lo_addr(_RadioButton8+0)
MOVT	R0, #hi_addr(_RadioButton8+0)
BL	_DrawRadioButton+0
;ECGsynthetic_events_code.c,581 :: 		DrawRadioButton(&RadioButton9);
MOVW	R0, #lo_addr(_RadioButton9+0)
MOVT	R0, #hi_addr(_RadioButton9+0)
BL	_DrawRadioButton+0
;ECGsynthetic_events_code.c,582 :: 		DrawRadioButton(&RadioButton10);
MOVW	R0, #lo_addr(_RadioButton10+0)
MOVT	R0, #hi_addr(_RadioButton10+0)
BL	_DrawRadioButton+0
;ECGsynthetic_events_code.c,583 :: 		DrawRadioButton(&RadioButton11);
MOVW	R0, #lo_addr(_RadioButton11+0)
MOVT	R0, #hi_addr(_RadioButton11+0)
BL	_DrawRadioButton+0
;ECGsynthetic_events_code.c,584 :: 		DrawRadioButton(&RadioButton12);
MOVW	R0, #lo_addr(_RadioButton12+0)
MOVT	R0, #hi_addr(_RadioButton12+0)
BL	_DrawRadioButton+0
;ECGsynthetic_events_code.c,585 :: 		DrawRadioButton(&RadioButton3);
MOVW	R0, #lo_addr(_RadioButton3+0)
MOVT	R0, #hi_addr(_RadioButton3+0)
BL	_DrawRadioButton+0
;ECGsynthetic_events_code.c,586 :: 		DrawRadioButton(&RadioButton14);
MOVW	R0, #lo_addr(_RadioButton14+0)
MOVT	R0, #hi_addr(_RadioButton14+0)
BL	_DrawRadioButton+0
;ECGsynthetic_events_code.c,588 :: 		}
L_end_RadioButton13OnPress:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _RadioButton13OnPress
_RadioButton14OnPress:
;ECGsynthetic_events_code.c,590 :: 		void RadioButton14OnPress() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;ECGsynthetic_events_code.c,591 :: 		normalv6();
BL	_normalV6+0
;ECGsynthetic_events_code.c,592 :: 		applicationTaskDAC();
BL	_applicationTaskDAC+0
;ECGsynthetic_events_code.c,593 :: 		RadioButton4.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton4+20)
MOVT	R0, #hi_addr(_RadioButton4+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,594 :: 		RadioButton5.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton5+20)
MOVT	R0, #hi_addr(_RadioButton5+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,595 :: 		RadioButton6.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton6+20)
MOVT	R0, #hi_addr(_RadioButton6+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,596 :: 		RadioButton7.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton7+20)
MOVT	R0, #hi_addr(_RadioButton7+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,597 :: 		RadioButton8.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton8+20)
MOVT	R0, #hi_addr(_RadioButton8+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,598 :: 		RadioButton9.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton9+20)
MOVT	R0, #hi_addr(_RadioButton9+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,599 :: 		RadioButton10.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton10+20)
MOVT	R0, #hi_addr(_RadioButton10+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,600 :: 		RadioButton11.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton11+20)
MOVT	R0, #hi_addr(_RadioButton11+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,601 :: 		RadioButton12.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton12+20)
MOVT	R0, #hi_addr(_RadioButton12+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,602 :: 		RadioButton13.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton13+20)
MOVT	R0, #hi_addr(_RadioButton13+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,603 :: 		RadioButton3.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton3+20)
MOVT	R0, #hi_addr(_RadioButton3+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,604 :: 		DrawRadioButton(&RadioButton4);
MOVW	R0, #lo_addr(_RadioButton4+0)
MOVT	R0, #hi_addr(_RadioButton4+0)
BL	_DrawRadioButton+0
;ECGsynthetic_events_code.c,605 :: 		DrawRadioButton(&RadioButton5);
MOVW	R0, #lo_addr(_RadioButton5+0)
MOVT	R0, #hi_addr(_RadioButton5+0)
BL	_DrawRadioButton+0
;ECGsynthetic_events_code.c,606 :: 		DrawRadioButton(&RadioButton6);
MOVW	R0, #lo_addr(_RadioButton6+0)
MOVT	R0, #hi_addr(_RadioButton6+0)
BL	_DrawRadioButton+0
;ECGsynthetic_events_code.c,607 :: 		DrawRadioButton(&RadioButton7);
MOVW	R0, #lo_addr(_RadioButton7+0)
MOVT	R0, #hi_addr(_RadioButton7+0)
BL	_DrawRadioButton+0
;ECGsynthetic_events_code.c,608 :: 		DrawRadioButton(&RadioButton8);
MOVW	R0, #lo_addr(_RadioButton8+0)
MOVT	R0, #hi_addr(_RadioButton8+0)
BL	_DrawRadioButton+0
;ECGsynthetic_events_code.c,609 :: 		DrawRadioButton(&RadioButton9);
MOVW	R0, #lo_addr(_RadioButton9+0)
MOVT	R0, #hi_addr(_RadioButton9+0)
BL	_DrawRadioButton+0
;ECGsynthetic_events_code.c,610 :: 		DrawRadioButton(&RadioButton10);
MOVW	R0, #lo_addr(_RadioButton10+0)
MOVT	R0, #hi_addr(_RadioButton10+0)
BL	_DrawRadioButton+0
;ECGsynthetic_events_code.c,611 :: 		DrawRadioButton(&RadioButton11);
MOVW	R0, #lo_addr(_RadioButton11+0)
MOVT	R0, #hi_addr(_RadioButton11+0)
BL	_DrawRadioButton+0
;ECGsynthetic_events_code.c,612 :: 		DrawRadioButton(&RadioButton12);
MOVW	R0, #lo_addr(_RadioButton12+0)
MOVT	R0, #hi_addr(_RadioButton12+0)
BL	_DrawRadioButton+0
;ECGsynthetic_events_code.c,613 :: 		DrawRadioButton(&RadioButton13);
MOVW	R0, #lo_addr(_RadioButton13+0)
MOVT	R0, #hi_addr(_RadioButton13+0)
BL	_DrawRadioButton+0
;ECGsynthetic_events_code.c,614 :: 		DrawRadioButton(&RadioButton3);
MOVW	R0, #lo_addr(_RadioButton3+0)
MOVT	R0, #hi_addr(_RadioButton3+0)
BL	_DrawRadioButton+0
;ECGsynthetic_events_code.c,615 :: 		}
L_end_RadioButton14OnPress:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _RadioButton14OnPress
_RadioButton1OnPress:
;ECGsynthetic_events_code.c,619 :: 		void RadioButton1OnPress() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;ECGsynthetic_events_code.c,620 :: 		anterior1();
BL	_anterior1+0
;ECGsynthetic_events_code.c,621 :: 		applicationTaskDAC();
BL	_applicationTaskDAC+0
;ECGsynthetic_events_code.c,622 :: 		RadioButton2.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton2+20)
MOVT	R0, #hi_addr(_RadioButton2+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,623 :: 		RadioButton15.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton15+20)
MOVT	R0, #hi_addr(_RadioButton15+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,624 :: 		RadioButton16.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton16+20)
MOVT	R0, #hi_addr(_RadioButton16+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,625 :: 		RadioButton17.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton17+20)
MOVT	R0, #hi_addr(_RadioButton17+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,626 :: 		RadioButton18.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton18+20)
MOVT	R0, #hi_addr(_RadioButton18+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,627 :: 		RadioButton19.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton19+20)
MOVT	R0, #hi_addr(_RadioButton19+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,628 :: 		RadioButton20.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton20+20)
MOVT	R0, #hi_addr(_RadioButton20+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,629 :: 		RadioButton21.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton21+20)
MOVT	R0, #hi_addr(_RadioButton21+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,630 :: 		RadioButton22.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton22+20)
MOVT	R0, #hi_addr(_RadioButton22+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,631 :: 		RadioButton23.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton23+20)
MOVT	R0, #hi_addr(_RadioButton23+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,632 :: 		RadioButton24.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton24+20)
MOVT	R0, #hi_addr(_RadioButton24+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,633 :: 		DrawRadioButton(&RadioButton2);
MOVW	R0, #lo_addr(_RadioButton2+0)
MOVT	R0, #hi_addr(_RadioButton2+0)
BL	_DrawRadioButton+0
;ECGsynthetic_events_code.c,634 :: 		DrawRadioButton(&RadioButton15);
MOVW	R0, #lo_addr(_RadioButton15+0)
MOVT	R0, #hi_addr(_RadioButton15+0)
BL	_DrawRadioButton+0
;ECGsynthetic_events_code.c,635 :: 		DrawRadioButton(&RadioButton16);
MOVW	R0, #lo_addr(_RadioButton16+0)
MOVT	R0, #hi_addr(_RadioButton16+0)
BL	_DrawRadioButton+0
;ECGsynthetic_events_code.c,636 :: 		DrawRadioButton(&RadioButton17);
MOVW	R0, #lo_addr(_RadioButton17+0)
MOVT	R0, #hi_addr(_RadioButton17+0)
BL	_DrawRadioButton+0
;ECGsynthetic_events_code.c,637 :: 		DrawRadioButton(&RadioButton18);
MOVW	R0, #lo_addr(_RadioButton18+0)
MOVT	R0, #hi_addr(_RadioButton18+0)
BL	_DrawRadioButton+0
;ECGsynthetic_events_code.c,638 :: 		DrawRadioButton(&RadioButton19);
MOVW	R0, #lo_addr(_RadioButton19+0)
MOVT	R0, #hi_addr(_RadioButton19+0)
BL	_DrawRadioButton+0
;ECGsynthetic_events_code.c,639 :: 		DrawRadioButton(&RadioButton20);
MOVW	R0, #lo_addr(_RadioButton20+0)
MOVT	R0, #hi_addr(_RadioButton20+0)
BL	_DrawRadioButton+0
;ECGsynthetic_events_code.c,640 :: 		DrawRadioButton(&RadioButton21);
MOVW	R0, #lo_addr(_RadioButton21+0)
MOVT	R0, #hi_addr(_RadioButton21+0)
BL	_DrawRadioButton+0
;ECGsynthetic_events_code.c,641 :: 		DrawRadioButton(&RadioButton22);
MOVW	R0, #lo_addr(_RadioButton22+0)
MOVT	R0, #hi_addr(_RadioButton22+0)
BL	_DrawRadioButton+0
;ECGsynthetic_events_code.c,642 :: 		DrawRadioButton(&RadioButton23);
MOVW	R0, #lo_addr(_RadioButton23+0)
MOVT	R0, #hi_addr(_RadioButton23+0)
BL	_DrawRadioButton+0
;ECGsynthetic_events_code.c,643 :: 		DrawRadioButton(&RadioButton24);
MOVW	R0, #lo_addr(_RadioButton24+0)
MOVT	R0, #hi_addr(_RadioButton24+0)
BL	_DrawRadioButton+0
;ECGsynthetic_events_code.c,645 :: 		}
L_end_RadioButton1OnPress:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _RadioButton1OnPress
_RadioButton2OnPress:
;ECGsynthetic_events_code.c,647 :: 		void RadioButton2OnPress() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;ECGsynthetic_events_code.c,648 :: 		anterior2();
BL	_anterior2+0
;ECGsynthetic_events_code.c,649 :: 		applicationTaskDAC();
BL	_applicationTaskDAC+0
;ECGsynthetic_events_code.c,650 :: 		RadioButton1.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton1+20)
MOVT	R0, #hi_addr(_RadioButton1+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,651 :: 		RadioButton15.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton15+20)
MOVT	R0, #hi_addr(_RadioButton15+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,652 :: 		RadioButton16.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton16+20)
MOVT	R0, #hi_addr(_RadioButton16+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,653 :: 		RadioButton17.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton17+20)
MOVT	R0, #hi_addr(_RadioButton17+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,654 :: 		RadioButton18.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton18+20)
MOVT	R0, #hi_addr(_RadioButton18+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,655 :: 		RadioButton19.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton19+20)
MOVT	R0, #hi_addr(_RadioButton19+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,656 :: 		RadioButton20.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton20+20)
MOVT	R0, #hi_addr(_RadioButton20+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,657 :: 		RadioButton21.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton21+20)
MOVT	R0, #hi_addr(_RadioButton21+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,658 :: 		RadioButton22.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton22+20)
MOVT	R0, #hi_addr(_RadioButton22+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,659 :: 		RadioButton23.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton23+20)
MOVT	R0, #hi_addr(_RadioButton23+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,660 :: 		RadioButton24.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton24+20)
MOVT	R0, #hi_addr(_RadioButton24+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,661 :: 		DrawRadioButton(&RadioButton1);
MOVW	R0, #lo_addr(_RadioButton1+0)
MOVT	R0, #hi_addr(_RadioButton1+0)
BL	_DrawRadioButton+0
;ECGsynthetic_events_code.c,662 :: 		DrawRadioButton(&RadioButton15);
MOVW	R0, #lo_addr(_RadioButton15+0)
MOVT	R0, #hi_addr(_RadioButton15+0)
BL	_DrawRadioButton+0
;ECGsynthetic_events_code.c,663 :: 		DrawRadioButton(&RadioButton16);
MOVW	R0, #lo_addr(_RadioButton16+0)
MOVT	R0, #hi_addr(_RadioButton16+0)
BL	_DrawRadioButton+0
;ECGsynthetic_events_code.c,664 :: 		DrawRadioButton(&RadioButton17);
MOVW	R0, #lo_addr(_RadioButton17+0)
MOVT	R0, #hi_addr(_RadioButton17+0)
BL	_DrawRadioButton+0
;ECGsynthetic_events_code.c,665 :: 		DrawRadioButton(&RadioButton18);
MOVW	R0, #lo_addr(_RadioButton18+0)
MOVT	R0, #hi_addr(_RadioButton18+0)
BL	_DrawRadioButton+0
;ECGsynthetic_events_code.c,666 :: 		DrawRadioButton(&RadioButton19);
MOVW	R0, #lo_addr(_RadioButton19+0)
MOVT	R0, #hi_addr(_RadioButton19+0)
BL	_DrawRadioButton+0
;ECGsynthetic_events_code.c,667 :: 		DrawRadioButton(&RadioButton20);
MOVW	R0, #lo_addr(_RadioButton20+0)
MOVT	R0, #hi_addr(_RadioButton20+0)
BL	_DrawRadioButton+0
;ECGsynthetic_events_code.c,668 :: 		DrawRadioButton(&RadioButton21);
MOVW	R0, #lo_addr(_RadioButton21+0)
MOVT	R0, #hi_addr(_RadioButton21+0)
BL	_DrawRadioButton+0
;ECGsynthetic_events_code.c,669 :: 		DrawRadioButton(&RadioButton22);
MOVW	R0, #lo_addr(_RadioButton22+0)
MOVT	R0, #hi_addr(_RadioButton22+0)
BL	_DrawRadioButton+0
;ECGsynthetic_events_code.c,670 :: 		DrawRadioButton(&RadioButton23);
MOVW	R0, #lo_addr(_RadioButton23+0)
MOVT	R0, #hi_addr(_RadioButton23+0)
BL	_DrawRadioButton+0
;ECGsynthetic_events_code.c,671 :: 		DrawRadioButton(&RadioButton24);
MOVW	R0, #lo_addr(_RadioButton24+0)
MOVT	R0, #hi_addr(_RadioButton24+0)
BL	_DrawRadioButton+0
;ECGsynthetic_events_code.c,673 :: 		}
L_end_RadioButton2OnPress:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _RadioButton2OnPress
_RadioButton15OnPress:
;ECGsynthetic_events_code.c,675 :: 		void RadioButton15OnPress() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;ECGsynthetic_events_code.c,676 :: 		anterior3();
BL	_anterior3+0
;ECGsynthetic_events_code.c,677 :: 		applicationTaskDAC();
BL	_applicationTaskDAC+0
;ECGsynthetic_events_code.c,678 :: 		RadioButton2.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton2+20)
MOVT	R0, #hi_addr(_RadioButton2+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,679 :: 		RadioButton1.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton1+20)
MOVT	R0, #hi_addr(_RadioButton1+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,680 :: 		RadioButton16.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton16+20)
MOVT	R0, #hi_addr(_RadioButton16+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,681 :: 		RadioButton17.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton17+20)
MOVT	R0, #hi_addr(_RadioButton17+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,682 :: 		RadioButton18.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton18+20)
MOVT	R0, #hi_addr(_RadioButton18+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,683 :: 		RadioButton19.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton19+20)
MOVT	R0, #hi_addr(_RadioButton19+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,684 :: 		RadioButton20.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton20+20)
MOVT	R0, #hi_addr(_RadioButton20+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,685 :: 		RadioButton21.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton21+20)
MOVT	R0, #hi_addr(_RadioButton21+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,686 :: 		RadioButton22.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton22+20)
MOVT	R0, #hi_addr(_RadioButton22+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,687 :: 		RadioButton23.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton23+20)
MOVT	R0, #hi_addr(_RadioButton23+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,688 :: 		RadioButton24.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton24+20)
MOVT	R0, #hi_addr(_RadioButton24+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,689 :: 		DrawRadioButton(&RadioButton2);
MOVW	R0, #lo_addr(_RadioButton2+0)
MOVT	R0, #hi_addr(_RadioButton2+0)
BL	_DrawRadioButton+0
;ECGsynthetic_events_code.c,690 :: 		DrawRadioButton(&RadioButton1);
MOVW	R0, #lo_addr(_RadioButton1+0)
MOVT	R0, #hi_addr(_RadioButton1+0)
BL	_DrawRadioButton+0
;ECGsynthetic_events_code.c,691 :: 		DrawRadioButton(&RadioButton16);
MOVW	R0, #lo_addr(_RadioButton16+0)
MOVT	R0, #hi_addr(_RadioButton16+0)
BL	_DrawRadioButton+0
;ECGsynthetic_events_code.c,692 :: 		DrawRadioButton(&RadioButton17);
MOVW	R0, #lo_addr(_RadioButton17+0)
MOVT	R0, #hi_addr(_RadioButton17+0)
BL	_DrawRadioButton+0
;ECGsynthetic_events_code.c,693 :: 		DrawRadioButton(&RadioButton18);
MOVW	R0, #lo_addr(_RadioButton18+0)
MOVT	R0, #hi_addr(_RadioButton18+0)
BL	_DrawRadioButton+0
;ECGsynthetic_events_code.c,694 :: 		DrawRadioButton(&RadioButton19);
MOVW	R0, #lo_addr(_RadioButton19+0)
MOVT	R0, #hi_addr(_RadioButton19+0)
BL	_DrawRadioButton+0
;ECGsynthetic_events_code.c,695 :: 		DrawRadioButton(&RadioButton20);
MOVW	R0, #lo_addr(_RadioButton20+0)
MOVT	R0, #hi_addr(_RadioButton20+0)
BL	_DrawRadioButton+0
;ECGsynthetic_events_code.c,696 :: 		DrawRadioButton(&RadioButton21);
MOVW	R0, #lo_addr(_RadioButton21+0)
MOVT	R0, #hi_addr(_RadioButton21+0)
BL	_DrawRadioButton+0
;ECGsynthetic_events_code.c,697 :: 		DrawRadioButton(&RadioButton22);
MOVW	R0, #lo_addr(_RadioButton22+0)
MOVT	R0, #hi_addr(_RadioButton22+0)
BL	_DrawRadioButton+0
;ECGsynthetic_events_code.c,698 :: 		DrawRadioButton(&RadioButton23);
MOVW	R0, #lo_addr(_RadioButton23+0)
MOVT	R0, #hi_addr(_RadioButton23+0)
BL	_DrawRadioButton+0
;ECGsynthetic_events_code.c,699 :: 		DrawRadioButton(&RadioButton24);
MOVW	R0, #lo_addr(_RadioButton24+0)
MOVT	R0, #hi_addr(_RadioButton24+0)
BL	_DrawRadioButton+0
;ECGsynthetic_events_code.c,701 :: 		}
L_end_RadioButton15OnPress:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _RadioButton15OnPress
_RadioButton16OnPress:
;ECGsynthetic_events_code.c,703 :: 		void RadioButton16OnPress() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;ECGsynthetic_events_code.c,704 :: 		anterioravr();
BL	_anterioraVR+0
;ECGsynthetic_events_code.c,705 :: 		applicationTaskDAC();
BL	_applicationTaskDAC+0
;ECGsynthetic_events_code.c,706 :: 		RadioButton2.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton2+20)
MOVT	R0, #hi_addr(_RadioButton2+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,707 :: 		RadioButton15.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton15+20)
MOVT	R0, #hi_addr(_RadioButton15+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,708 :: 		RadioButton1.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton1+20)
MOVT	R0, #hi_addr(_RadioButton1+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,709 :: 		RadioButton17.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton17+20)
MOVT	R0, #hi_addr(_RadioButton17+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,710 :: 		RadioButton18.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton18+20)
MOVT	R0, #hi_addr(_RadioButton18+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,711 :: 		RadioButton19.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton19+20)
MOVT	R0, #hi_addr(_RadioButton19+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,712 :: 		RadioButton20.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton20+20)
MOVT	R0, #hi_addr(_RadioButton20+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,713 :: 		RadioButton21.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton21+20)
MOVT	R0, #hi_addr(_RadioButton21+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,714 :: 		RadioButton22.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton22+20)
MOVT	R0, #hi_addr(_RadioButton22+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,715 :: 		RadioButton23.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton23+20)
MOVT	R0, #hi_addr(_RadioButton23+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,716 :: 		RadioButton24.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton24+20)
MOVT	R0, #hi_addr(_RadioButton24+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,717 :: 		DrawRadioButton(&RadioButton2);
MOVW	R0, #lo_addr(_RadioButton2+0)
MOVT	R0, #hi_addr(_RadioButton2+0)
BL	_DrawRadioButton+0
;ECGsynthetic_events_code.c,718 :: 		DrawRadioButton(&RadioButton15);
MOVW	R0, #lo_addr(_RadioButton15+0)
MOVT	R0, #hi_addr(_RadioButton15+0)
BL	_DrawRadioButton+0
;ECGsynthetic_events_code.c,719 :: 		DrawRadioButton(&RadioButton1);
MOVW	R0, #lo_addr(_RadioButton1+0)
MOVT	R0, #hi_addr(_RadioButton1+0)
BL	_DrawRadioButton+0
;ECGsynthetic_events_code.c,720 :: 		DrawRadioButton(&RadioButton17);
MOVW	R0, #lo_addr(_RadioButton17+0)
MOVT	R0, #hi_addr(_RadioButton17+0)
BL	_DrawRadioButton+0
;ECGsynthetic_events_code.c,721 :: 		DrawRadioButton(&RadioButton18);
MOVW	R0, #lo_addr(_RadioButton18+0)
MOVT	R0, #hi_addr(_RadioButton18+0)
BL	_DrawRadioButton+0
;ECGsynthetic_events_code.c,722 :: 		DrawRadioButton(&RadioButton19);
MOVW	R0, #lo_addr(_RadioButton19+0)
MOVT	R0, #hi_addr(_RadioButton19+0)
BL	_DrawRadioButton+0
;ECGsynthetic_events_code.c,723 :: 		DrawRadioButton(&RadioButton20);
MOVW	R0, #lo_addr(_RadioButton20+0)
MOVT	R0, #hi_addr(_RadioButton20+0)
BL	_DrawRadioButton+0
;ECGsynthetic_events_code.c,724 :: 		DrawRadioButton(&RadioButton21);
MOVW	R0, #lo_addr(_RadioButton21+0)
MOVT	R0, #hi_addr(_RadioButton21+0)
BL	_DrawRadioButton+0
;ECGsynthetic_events_code.c,725 :: 		DrawRadioButton(&RadioButton22);
MOVW	R0, #lo_addr(_RadioButton22+0)
MOVT	R0, #hi_addr(_RadioButton22+0)
BL	_DrawRadioButton+0
;ECGsynthetic_events_code.c,726 :: 		DrawRadioButton(&RadioButton23);
MOVW	R0, #lo_addr(_RadioButton23+0)
MOVT	R0, #hi_addr(_RadioButton23+0)
BL	_DrawRadioButton+0
;ECGsynthetic_events_code.c,727 :: 		DrawRadioButton(&RadioButton24);
MOVW	R0, #lo_addr(_RadioButton24+0)
MOVT	R0, #hi_addr(_RadioButton24+0)
BL	_DrawRadioButton+0
;ECGsynthetic_events_code.c,728 :: 		}
L_end_RadioButton16OnPress:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _RadioButton16OnPress
_RadioButton17OnPress:
;ECGsynthetic_events_code.c,730 :: 		void RadioButton17OnPress() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;ECGsynthetic_events_code.c,731 :: 		anterioravl();
BL	_anterioraVL+0
;ECGsynthetic_events_code.c,732 :: 		applicationTaskDAC();
BL	_applicationTaskDAC+0
;ECGsynthetic_events_code.c,733 :: 		RadioButton2.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton2+20)
MOVT	R0, #hi_addr(_RadioButton2+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,734 :: 		RadioButton15.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton15+20)
MOVT	R0, #hi_addr(_RadioButton15+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,735 :: 		RadioButton16.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton16+20)
MOVT	R0, #hi_addr(_RadioButton16+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,736 :: 		RadioButton1.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton1+20)
MOVT	R0, #hi_addr(_RadioButton1+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,737 :: 		RadioButton18.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton18+20)
MOVT	R0, #hi_addr(_RadioButton18+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,738 :: 		RadioButton19.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton19+20)
MOVT	R0, #hi_addr(_RadioButton19+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,739 :: 		RadioButton20.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton20+20)
MOVT	R0, #hi_addr(_RadioButton20+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,740 :: 		RadioButton21.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton21+20)
MOVT	R0, #hi_addr(_RadioButton21+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,741 :: 		RadioButton22.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton22+20)
MOVT	R0, #hi_addr(_RadioButton22+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,742 :: 		RadioButton23.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton23+20)
MOVT	R0, #hi_addr(_RadioButton23+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,743 :: 		RadioButton24.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton24+20)
MOVT	R0, #hi_addr(_RadioButton24+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,744 :: 		DrawRadioButton(&RadioButton2);
MOVW	R0, #lo_addr(_RadioButton2+0)
MOVT	R0, #hi_addr(_RadioButton2+0)
BL	_DrawRadioButton+0
;ECGsynthetic_events_code.c,745 :: 		DrawRadioButton(&RadioButton15);
MOVW	R0, #lo_addr(_RadioButton15+0)
MOVT	R0, #hi_addr(_RadioButton15+0)
BL	_DrawRadioButton+0
;ECGsynthetic_events_code.c,746 :: 		DrawRadioButton(&RadioButton16);
MOVW	R0, #lo_addr(_RadioButton16+0)
MOVT	R0, #hi_addr(_RadioButton16+0)
BL	_DrawRadioButton+0
;ECGsynthetic_events_code.c,747 :: 		DrawRadioButton(&RadioButton1);
MOVW	R0, #lo_addr(_RadioButton1+0)
MOVT	R0, #hi_addr(_RadioButton1+0)
BL	_DrawRadioButton+0
;ECGsynthetic_events_code.c,748 :: 		DrawRadioButton(&RadioButton18);
MOVW	R0, #lo_addr(_RadioButton18+0)
MOVT	R0, #hi_addr(_RadioButton18+0)
BL	_DrawRadioButton+0
;ECGsynthetic_events_code.c,749 :: 		DrawRadioButton(&RadioButton19);
MOVW	R0, #lo_addr(_RadioButton19+0)
MOVT	R0, #hi_addr(_RadioButton19+0)
BL	_DrawRadioButton+0
;ECGsynthetic_events_code.c,750 :: 		DrawRadioButton(&RadioButton20);
MOVW	R0, #lo_addr(_RadioButton20+0)
MOVT	R0, #hi_addr(_RadioButton20+0)
BL	_DrawRadioButton+0
;ECGsynthetic_events_code.c,751 :: 		DrawRadioButton(&RadioButton21);
MOVW	R0, #lo_addr(_RadioButton21+0)
MOVT	R0, #hi_addr(_RadioButton21+0)
BL	_DrawRadioButton+0
;ECGsynthetic_events_code.c,752 :: 		DrawRadioButton(&RadioButton22);
MOVW	R0, #lo_addr(_RadioButton22+0)
MOVT	R0, #hi_addr(_RadioButton22+0)
BL	_DrawRadioButton+0
;ECGsynthetic_events_code.c,753 :: 		DrawRadioButton(&RadioButton23);
MOVW	R0, #lo_addr(_RadioButton23+0)
MOVT	R0, #hi_addr(_RadioButton23+0)
BL	_DrawRadioButton+0
;ECGsynthetic_events_code.c,754 :: 		DrawRadioButton(&RadioButton24);
MOVW	R0, #lo_addr(_RadioButton24+0)
MOVT	R0, #hi_addr(_RadioButton24+0)
BL	_DrawRadioButton+0
;ECGsynthetic_events_code.c,755 :: 		}
L_end_RadioButton17OnPress:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _RadioButton17OnPress
_RadioButton18OnPress:
;ECGsynthetic_events_code.c,757 :: 		void RadioButton18OnPress() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;ECGsynthetic_events_code.c,758 :: 		anterioravf();
BL	_anterioraVF+0
;ECGsynthetic_events_code.c,759 :: 		applicationTaskDAC();
BL	_applicationTaskDAC+0
;ECGsynthetic_events_code.c,760 :: 		RadioButton2.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton2+20)
MOVT	R0, #hi_addr(_RadioButton2+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,761 :: 		RadioButton15.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton15+20)
MOVT	R0, #hi_addr(_RadioButton15+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,762 :: 		RadioButton16.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton16+20)
MOVT	R0, #hi_addr(_RadioButton16+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,763 :: 		RadioButton17.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton17+20)
MOVT	R0, #hi_addr(_RadioButton17+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,764 :: 		RadioButton1.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton1+20)
MOVT	R0, #hi_addr(_RadioButton1+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,765 :: 		RadioButton19.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton19+20)
MOVT	R0, #hi_addr(_RadioButton19+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,766 :: 		RadioButton20.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton20+20)
MOVT	R0, #hi_addr(_RadioButton20+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,767 :: 		RadioButton21.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton21+20)
MOVT	R0, #hi_addr(_RadioButton21+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,768 :: 		RadioButton22.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton22+20)
MOVT	R0, #hi_addr(_RadioButton22+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,769 :: 		RadioButton23.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton23+20)
MOVT	R0, #hi_addr(_RadioButton23+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,770 :: 		RadioButton24.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton24+20)
MOVT	R0, #hi_addr(_RadioButton24+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,771 :: 		DrawRadioButton(&RadioButton2);
MOVW	R0, #lo_addr(_RadioButton2+0)
MOVT	R0, #hi_addr(_RadioButton2+0)
BL	_DrawRadioButton+0
;ECGsynthetic_events_code.c,772 :: 		DrawRadioButton(&RadioButton15);
MOVW	R0, #lo_addr(_RadioButton15+0)
MOVT	R0, #hi_addr(_RadioButton15+0)
BL	_DrawRadioButton+0
;ECGsynthetic_events_code.c,773 :: 		DrawRadioButton(&RadioButton16);
MOVW	R0, #lo_addr(_RadioButton16+0)
MOVT	R0, #hi_addr(_RadioButton16+0)
BL	_DrawRadioButton+0
;ECGsynthetic_events_code.c,774 :: 		DrawRadioButton(&RadioButton17);
MOVW	R0, #lo_addr(_RadioButton17+0)
MOVT	R0, #hi_addr(_RadioButton17+0)
BL	_DrawRadioButton+0
;ECGsynthetic_events_code.c,775 :: 		DrawRadioButton(&RadioButton1);
MOVW	R0, #lo_addr(_RadioButton1+0)
MOVT	R0, #hi_addr(_RadioButton1+0)
BL	_DrawRadioButton+0
;ECGsynthetic_events_code.c,776 :: 		DrawRadioButton(&RadioButton19);
MOVW	R0, #lo_addr(_RadioButton19+0)
MOVT	R0, #hi_addr(_RadioButton19+0)
BL	_DrawRadioButton+0
;ECGsynthetic_events_code.c,777 :: 		DrawRadioButton(&RadioButton20);
MOVW	R0, #lo_addr(_RadioButton20+0)
MOVT	R0, #hi_addr(_RadioButton20+0)
BL	_DrawRadioButton+0
;ECGsynthetic_events_code.c,778 :: 		DrawRadioButton(&RadioButton21);
MOVW	R0, #lo_addr(_RadioButton21+0)
MOVT	R0, #hi_addr(_RadioButton21+0)
BL	_DrawRadioButton+0
;ECGsynthetic_events_code.c,779 :: 		DrawRadioButton(&RadioButton22);
MOVW	R0, #lo_addr(_RadioButton22+0)
MOVT	R0, #hi_addr(_RadioButton22+0)
BL	_DrawRadioButton+0
;ECGsynthetic_events_code.c,780 :: 		DrawRadioButton(&RadioButton23);
MOVW	R0, #lo_addr(_RadioButton23+0)
MOVT	R0, #hi_addr(_RadioButton23+0)
BL	_DrawRadioButton+0
;ECGsynthetic_events_code.c,781 :: 		DrawRadioButton(&RadioButton24);
MOVW	R0, #lo_addr(_RadioButton24+0)
MOVT	R0, #hi_addr(_RadioButton24+0)
BL	_DrawRadioButton+0
;ECGsynthetic_events_code.c,782 :: 		}
L_end_RadioButton18OnPress:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _RadioButton18OnPress
_RadioButton19OnPress:
;ECGsynthetic_events_code.c,784 :: 		void RadioButton19OnPress() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;ECGsynthetic_events_code.c,785 :: 		anteriorv1();
BL	_anteriorV1+0
;ECGsynthetic_events_code.c,786 :: 		applicationTaskDAC();
BL	_applicationTaskDAC+0
;ECGsynthetic_events_code.c,787 :: 		RadioButton2.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton2+20)
MOVT	R0, #hi_addr(_RadioButton2+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,788 :: 		RadioButton15.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton15+20)
MOVT	R0, #hi_addr(_RadioButton15+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,789 :: 		RadioButton16.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton16+20)
MOVT	R0, #hi_addr(_RadioButton16+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,790 :: 		RadioButton17.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton17+20)
MOVT	R0, #hi_addr(_RadioButton17+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,791 :: 		RadioButton18.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton18+20)
MOVT	R0, #hi_addr(_RadioButton18+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,792 :: 		RadioButton1.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton1+20)
MOVT	R0, #hi_addr(_RadioButton1+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,793 :: 		RadioButton20.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton20+20)
MOVT	R0, #hi_addr(_RadioButton20+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,794 :: 		RadioButton21.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton21+20)
MOVT	R0, #hi_addr(_RadioButton21+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,795 :: 		RadioButton22.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton22+20)
MOVT	R0, #hi_addr(_RadioButton22+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,796 :: 		RadioButton23.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton23+20)
MOVT	R0, #hi_addr(_RadioButton23+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,797 :: 		RadioButton24.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton24+20)
MOVT	R0, #hi_addr(_RadioButton24+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,798 :: 		DrawRadioButton(&RadioButton2);
MOVW	R0, #lo_addr(_RadioButton2+0)
MOVT	R0, #hi_addr(_RadioButton2+0)
BL	_DrawRadioButton+0
;ECGsynthetic_events_code.c,799 :: 		DrawRadioButton(&RadioButton15);
MOVW	R0, #lo_addr(_RadioButton15+0)
MOVT	R0, #hi_addr(_RadioButton15+0)
BL	_DrawRadioButton+0
;ECGsynthetic_events_code.c,800 :: 		DrawRadioButton(&RadioButton16);
MOVW	R0, #lo_addr(_RadioButton16+0)
MOVT	R0, #hi_addr(_RadioButton16+0)
BL	_DrawRadioButton+0
;ECGsynthetic_events_code.c,801 :: 		DrawRadioButton(&RadioButton17);
MOVW	R0, #lo_addr(_RadioButton17+0)
MOVT	R0, #hi_addr(_RadioButton17+0)
BL	_DrawRadioButton+0
;ECGsynthetic_events_code.c,802 :: 		DrawRadioButton(&RadioButton18);
MOVW	R0, #lo_addr(_RadioButton18+0)
MOVT	R0, #hi_addr(_RadioButton18+0)
BL	_DrawRadioButton+0
;ECGsynthetic_events_code.c,803 :: 		DrawRadioButton(&RadioButton1);
MOVW	R0, #lo_addr(_RadioButton1+0)
MOVT	R0, #hi_addr(_RadioButton1+0)
BL	_DrawRadioButton+0
;ECGsynthetic_events_code.c,804 :: 		DrawRadioButton(&RadioButton20);
MOVW	R0, #lo_addr(_RadioButton20+0)
MOVT	R0, #hi_addr(_RadioButton20+0)
BL	_DrawRadioButton+0
;ECGsynthetic_events_code.c,805 :: 		DrawRadioButton(&RadioButton21);
MOVW	R0, #lo_addr(_RadioButton21+0)
MOVT	R0, #hi_addr(_RadioButton21+0)
BL	_DrawRadioButton+0
;ECGsynthetic_events_code.c,806 :: 		DrawRadioButton(&RadioButton22);
MOVW	R0, #lo_addr(_RadioButton22+0)
MOVT	R0, #hi_addr(_RadioButton22+0)
BL	_DrawRadioButton+0
;ECGsynthetic_events_code.c,807 :: 		DrawRadioButton(&RadioButton23);
MOVW	R0, #lo_addr(_RadioButton23+0)
MOVT	R0, #hi_addr(_RadioButton23+0)
BL	_DrawRadioButton+0
;ECGsynthetic_events_code.c,808 :: 		DrawRadioButton(&RadioButton24);
MOVW	R0, #lo_addr(_RadioButton24+0)
MOVT	R0, #hi_addr(_RadioButton24+0)
BL	_DrawRadioButton+0
;ECGsynthetic_events_code.c,809 :: 		}
L_end_RadioButton19OnPress:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _RadioButton19OnPress
_RadioButton20OnPress:
;ECGsynthetic_events_code.c,811 :: 		void RadioButton20OnPress() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;ECGsynthetic_events_code.c,812 :: 		anteriorv2();
BL	_anteriorV2+0
;ECGsynthetic_events_code.c,813 :: 		applicationTaskDAC();
BL	_applicationTaskDAC+0
;ECGsynthetic_events_code.c,814 :: 		RadioButton2.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton2+20)
MOVT	R0, #hi_addr(_RadioButton2+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,815 :: 		RadioButton15.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton15+20)
MOVT	R0, #hi_addr(_RadioButton15+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,816 :: 		RadioButton16.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton16+20)
MOVT	R0, #hi_addr(_RadioButton16+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,817 :: 		RadioButton17.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton17+20)
MOVT	R0, #hi_addr(_RadioButton17+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,818 :: 		RadioButton18.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton18+20)
MOVT	R0, #hi_addr(_RadioButton18+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,819 :: 		RadioButton19.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton19+20)
MOVT	R0, #hi_addr(_RadioButton19+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,820 :: 		RadioButton1.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton1+20)
MOVT	R0, #hi_addr(_RadioButton1+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,821 :: 		RadioButton21.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton21+20)
MOVT	R0, #hi_addr(_RadioButton21+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,822 :: 		RadioButton22.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton22+20)
MOVT	R0, #hi_addr(_RadioButton22+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,823 :: 		RadioButton23.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton23+20)
MOVT	R0, #hi_addr(_RadioButton23+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,824 :: 		RadioButton24.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton24+20)
MOVT	R0, #hi_addr(_RadioButton24+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,825 :: 		DrawRadioButton(&RadioButton2);
MOVW	R0, #lo_addr(_RadioButton2+0)
MOVT	R0, #hi_addr(_RadioButton2+0)
BL	_DrawRadioButton+0
;ECGsynthetic_events_code.c,826 :: 		DrawRadioButton(&RadioButton15);
MOVW	R0, #lo_addr(_RadioButton15+0)
MOVT	R0, #hi_addr(_RadioButton15+0)
BL	_DrawRadioButton+0
;ECGsynthetic_events_code.c,827 :: 		DrawRadioButton(&RadioButton16);
MOVW	R0, #lo_addr(_RadioButton16+0)
MOVT	R0, #hi_addr(_RadioButton16+0)
BL	_DrawRadioButton+0
;ECGsynthetic_events_code.c,828 :: 		DrawRadioButton(&RadioButton17);
MOVW	R0, #lo_addr(_RadioButton17+0)
MOVT	R0, #hi_addr(_RadioButton17+0)
BL	_DrawRadioButton+0
;ECGsynthetic_events_code.c,829 :: 		DrawRadioButton(&RadioButton18);
MOVW	R0, #lo_addr(_RadioButton18+0)
MOVT	R0, #hi_addr(_RadioButton18+0)
BL	_DrawRadioButton+0
;ECGsynthetic_events_code.c,830 :: 		DrawRadioButton(&RadioButton19);
MOVW	R0, #lo_addr(_RadioButton19+0)
MOVT	R0, #hi_addr(_RadioButton19+0)
BL	_DrawRadioButton+0
;ECGsynthetic_events_code.c,831 :: 		DrawRadioButton(&RadioButton1);
MOVW	R0, #lo_addr(_RadioButton1+0)
MOVT	R0, #hi_addr(_RadioButton1+0)
BL	_DrawRadioButton+0
;ECGsynthetic_events_code.c,832 :: 		DrawRadioButton(&RadioButton21);
MOVW	R0, #lo_addr(_RadioButton21+0)
MOVT	R0, #hi_addr(_RadioButton21+0)
BL	_DrawRadioButton+0
;ECGsynthetic_events_code.c,833 :: 		DrawRadioButton(&RadioButton22);
MOVW	R0, #lo_addr(_RadioButton22+0)
MOVT	R0, #hi_addr(_RadioButton22+0)
BL	_DrawRadioButton+0
;ECGsynthetic_events_code.c,834 :: 		DrawRadioButton(&RadioButton23);
MOVW	R0, #lo_addr(_RadioButton23+0)
MOVT	R0, #hi_addr(_RadioButton23+0)
BL	_DrawRadioButton+0
;ECGsynthetic_events_code.c,835 :: 		DrawRadioButton(&RadioButton24);
MOVW	R0, #lo_addr(_RadioButton24+0)
MOVT	R0, #hi_addr(_RadioButton24+0)
BL	_DrawRadioButton+0
;ECGsynthetic_events_code.c,836 :: 		}
L_end_RadioButton20OnPress:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _RadioButton20OnPress
_RadioButton21OnPress:
;ECGsynthetic_events_code.c,838 :: 		void RadioButton21OnPress() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;ECGsynthetic_events_code.c,839 :: 		anteriorv3();
BL	_anteriorV3+0
;ECGsynthetic_events_code.c,840 :: 		applicationTaskDAC();
BL	_applicationTaskDAC+0
;ECGsynthetic_events_code.c,841 :: 		RadioButton2.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton2+20)
MOVT	R0, #hi_addr(_RadioButton2+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,842 :: 		RadioButton15.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton15+20)
MOVT	R0, #hi_addr(_RadioButton15+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,843 :: 		RadioButton16.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton16+20)
MOVT	R0, #hi_addr(_RadioButton16+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,844 :: 		RadioButton17.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton17+20)
MOVT	R0, #hi_addr(_RadioButton17+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,845 :: 		RadioButton18.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton18+20)
MOVT	R0, #hi_addr(_RadioButton18+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,846 :: 		RadioButton19.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton19+20)
MOVT	R0, #hi_addr(_RadioButton19+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,847 :: 		RadioButton20.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton20+20)
MOVT	R0, #hi_addr(_RadioButton20+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,848 :: 		RadioButton1.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton1+20)
MOVT	R0, #hi_addr(_RadioButton1+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,849 :: 		RadioButton22.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton22+20)
MOVT	R0, #hi_addr(_RadioButton22+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,850 :: 		RadioButton23.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton23+20)
MOVT	R0, #hi_addr(_RadioButton23+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,851 :: 		RadioButton24.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton24+20)
MOVT	R0, #hi_addr(_RadioButton24+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,852 :: 		DrawRadioButton(&RadioButton2);
MOVW	R0, #lo_addr(_RadioButton2+0)
MOVT	R0, #hi_addr(_RadioButton2+0)
BL	_DrawRadioButton+0
;ECGsynthetic_events_code.c,853 :: 		DrawRadioButton(&RadioButton15);
MOVW	R0, #lo_addr(_RadioButton15+0)
MOVT	R0, #hi_addr(_RadioButton15+0)
BL	_DrawRadioButton+0
;ECGsynthetic_events_code.c,854 :: 		DrawRadioButton(&RadioButton16);
MOVW	R0, #lo_addr(_RadioButton16+0)
MOVT	R0, #hi_addr(_RadioButton16+0)
BL	_DrawRadioButton+0
;ECGsynthetic_events_code.c,855 :: 		DrawRadioButton(&RadioButton17);
MOVW	R0, #lo_addr(_RadioButton17+0)
MOVT	R0, #hi_addr(_RadioButton17+0)
BL	_DrawRadioButton+0
;ECGsynthetic_events_code.c,856 :: 		DrawRadioButton(&RadioButton18);
MOVW	R0, #lo_addr(_RadioButton18+0)
MOVT	R0, #hi_addr(_RadioButton18+0)
BL	_DrawRadioButton+0
;ECGsynthetic_events_code.c,857 :: 		DrawRadioButton(&RadioButton19);
MOVW	R0, #lo_addr(_RadioButton19+0)
MOVT	R0, #hi_addr(_RadioButton19+0)
BL	_DrawRadioButton+0
;ECGsynthetic_events_code.c,858 :: 		DrawRadioButton(&RadioButton20);
MOVW	R0, #lo_addr(_RadioButton20+0)
MOVT	R0, #hi_addr(_RadioButton20+0)
BL	_DrawRadioButton+0
;ECGsynthetic_events_code.c,859 :: 		DrawRadioButton(&RadioButton1);
MOVW	R0, #lo_addr(_RadioButton1+0)
MOVT	R0, #hi_addr(_RadioButton1+0)
BL	_DrawRadioButton+0
;ECGsynthetic_events_code.c,860 :: 		DrawRadioButton(&RadioButton22);
MOVW	R0, #lo_addr(_RadioButton22+0)
MOVT	R0, #hi_addr(_RadioButton22+0)
BL	_DrawRadioButton+0
;ECGsynthetic_events_code.c,861 :: 		DrawRadioButton(&RadioButton23);
MOVW	R0, #lo_addr(_RadioButton23+0)
MOVT	R0, #hi_addr(_RadioButton23+0)
BL	_DrawRadioButton+0
;ECGsynthetic_events_code.c,862 :: 		DrawRadioButton(&RadioButton24);
MOVW	R0, #lo_addr(_RadioButton24+0)
MOVT	R0, #hi_addr(_RadioButton24+0)
BL	_DrawRadioButton+0
;ECGsynthetic_events_code.c,863 :: 		}
L_end_RadioButton21OnPress:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _RadioButton21OnPress
_RadioButton22OnPress:
;ECGsynthetic_events_code.c,865 :: 		void RadioButton22OnPress() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;ECGsynthetic_events_code.c,866 :: 		anteriorv4();
BL	_anteriorV4+0
;ECGsynthetic_events_code.c,867 :: 		applicationTaskDAC();
BL	_applicationTaskDAC+0
;ECGsynthetic_events_code.c,868 :: 		RadioButton2.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton2+20)
MOVT	R0, #hi_addr(_RadioButton2+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,869 :: 		RadioButton15.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton15+20)
MOVT	R0, #hi_addr(_RadioButton15+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,870 :: 		RadioButton16.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton16+20)
MOVT	R0, #hi_addr(_RadioButton16+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,871 :: 		RadioButton17.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton17+20)
MOVT	R0, #hi_addr(_RadioButton17+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,872 :: 		RadioButton18.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton18+20)
MOVT	R0, #hi_addr(_RadioButton18+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,873 :: 		RadioButton19.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton19+20)
MOVT	R0, #hi_addr(_RadioButton19+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,874 :: 		RadioButton20.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton20+20)
MOVT	R0, #hi_addr(_RadioButton20+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,875 :: 		RadioButton21.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton21+20)
MOVT	R0, #hi_addr(_RadioButton21+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,876 :: 		RadioButton1.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton1+20)
MOVT	R0, #hi_addr(_RadioButton1+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,877 :: 		RadioButton23.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton23+20)
MOVT	R0, #hi_addr(_RadioButton23+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,878 :: 		RadioButton24.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton24+20)
MOVT	R0, #hi_addr(_RadioButton24+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,879 :: 		DrawRadioButton(&RadioButton2);
MOVW	R0, #lo_addr(_RadioButton2+0)
MOVT	R0, #hi_addr(_RadioButton2+0)
BL	_DrawRadioButton+0
;ECGsynthetic_events_code.c,880 :: 		DrawRadioButton(&RadioButton15);
MOVW	R0, #lo_addr(_RadioButton15+0)
MOVT	R0, #hi_addr(_RadioButton15+0)
BL	_DrawRadioButton+0
;ECGsynthetic_events_code.c,881 :: 		DrawRadioButton(&RadioButton16);
MOVW	R0, #lo_addr(_RadioButton16+0)
MOVT	R0, #hi_addr(_RadioButton16+0)
BL	_DrawRadioButton+0
;ECGsynthetic_events_code.c,882 :: 		DrawRadioButton(&RadioButton17);
MOVW	R0, #lo_addr(_RadioButton17+0)
MOVT	R0, #hi_addr(_RadioButton17+0)
BL	_DrawRadioButton+0
;ECGsynthetic_events_code.c,883 :: 		DrawRadioButton(&RadioButton18);
MOVW	R0, #lo_addr(_RadioButton18+0)
MOVT	R0, #hi_addr(_RadioButton18+0)
BL	_DrawRadioButton+0
;ECGsynthetic_events_code.c,884 :: 		DrawRadioButton(&RadioButton19);
MOVW	R0, #lo_addr(_RadioButton19+0)
MOVT	R0, #hi_addr(_RadioButton19+0)
BL	_DrawRadioButton+0
;ECGsynthetic_events_code.c,885 :: 		DrawRadioButton(&RadioButton20);
MOVW	R0, #lo_addr(_RadioButton20+0)
MOVT	R0, #hi_addr(_RadioButton20+0)
BL	_DrawRadioButton+0
;ECGsynthetic_events_code.c,886 :: 		DrawRadioButton(&RadioButton21);
MOVW	R0, #lo_addr(_RadioButton21+0)
MOVT	R0, #hi_addr(_RadioButton21+0)
BL	_DrawRadioButton+0
;ECGsynthetic_events_code.c,887 :: 		DrawRadioButton(&RadioButton1);
MOVW	R0, #lo_addr(_RadioButton1+0)
MOVT	R0, #hi_addr(_RadioButton1+0)
BL	_DrawRadioButton+0
;ECGsynthetic_events_code.c,888 :: 		DrawRadioButton(&RadioButton23);
MOVW	R0, #lo_addr(_RadioButton23+0)
MOVT	R0, #hi_addr(_RadioButton23+0)
BL	_DrawRadioButton+0
;ECGsynthetic_events_code.c,889 :: 		DrawRadioButton(&RadioButton24);
MOVW	R0, #lo_addr(_RadioButton24+0)
MOVT	R0, #hi_addr(_RadioButton24+0)
BL	_DrawRadioButton+0
;ECGsynthetic_events_code.c,890 :: 		}
L_end_RadioButton22OnPress:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _RadioButton22OnPress
_RadioButton23OnPress:
;ECGsynthetic_events_code.c,892 :: 		void RadioButton23OnPress() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;ECGsynthetic_events_code.c,893 :: 		anteriorv5();
BL	_anteriorV5+0
;ECGsynthetic_events_code.c,894 :: 		applicationTaskDAC();
BL	_applicationTaskDAC+0
;ECGsynthetic_events_code.c,895 :: 		RadioButton2.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton2+20)
MOVT	R0, #hi_addr(_RadioButton2+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,896 :: 		RadioButton15.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton15+20)
MOVT	R0, #hi_addr(_RadioButton15+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,897 :: 		RadioButton16.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton16+20)
MOVT	R0, #hi_addr(_RadioButton16+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,898 :: 		RadioButton17.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton17+20)
MOVT	R0, #hi_addr(_RadioButton17+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,899 :: 		RadioButton18.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton18+20)
MOVT	R0, #hi_addr(_RadioButton18+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,900 :: 		RadioButton19.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton19+20)
MOVT	R0, #hi_addr(_RadioButton19+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,901 :: 		RadioButton20.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton20+20)
MOVT	R0, #hi_addr(_RadioButton20+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,902 :: 		RadioButton21.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton21+20)
MOVT	R0, #hi_addr(_RadioButton21+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,903 :: 		RadioButton22.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton22+20)
MOVT	R0, #hi_addr(_RadioButton22+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,904 :: 		RadioButton1.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton1+20)
MOVT	R0, #hi_addr(_RadioButton1+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,905 :: 		RadioButton24.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton24+20)
MOVT	R0, #hi_addr(_RadioButton24+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,906 :: 		DrawRadioButton(&RadioButton2);
MOVW	R0, #lo_addr(_RadioButton2+0)
MOVT	R0, #hi_addr(_RadioButton2+0)
BL	_DrawRadioButton+0
;ECGsynthetic_events_code.c,907 :: 		DrawRadioButton(&RadioButton15);
MOVW	R0, #lo_addr(_RadioButton15+0)
MOVT	R0, #hi_addr(_RadioButton15+0)
BL	_DrawRadioButton+0
;ECGsynthetic_events_code.c,908 :: 		DrawRadioButton(&RadioButton16);
MOVW	R0, #lo_addr(_RadioButton16+0)
MOVT	R0, #hi_addr(_RadioButton16+0)
BL	_DrawRadioButton+0
;ECGsynthetic_events_code.c,909 :: 		DrawRadioButton(&RadioButton17);
MOVW	R0, #lo_addr(_RadioButton17+0)
MOVT	R0, #hi_addr(_RadioButton17+0)
BL	_DrawRadioButton+0
;ECGsynthetic_events_code.c,910 :: 		DrawRadioButton(&RadioButton18);
MOVW	R0, #lo_addr(_RadioButton18+0)
MOVT	R0, #hi_addr(_RadioButton18+0)
BL	_DrawRadioButton+0
;ECGsynthetic_events_code.c,911 :: 		DrawRadioButton(&RadioButton19);
MOVW	R0, #lo_addr(_RadioButton19+0)
MOVT	R0, #hi_addr(_RadioButton19+0)
BL	_DrawRadioButton+0
;ECGsynthetic_events_code.c,912 :: 		DrawRadioButton(&RadioButton20);
MOVW	R0, #lo_addr(_RadioButton20+0)
MOVT	R0, #hi_addr(_RadioButton20+0)
BL	_DrawRadioButton+0
;ECGsynthetic_events_code.c,913 :: 		DrawRadioButton(&RadioButton21);
MOVW	R0, #lo_addr(_RadioButton21+0)
MOVT	R0, #hi_addr(_RadioButton21+0)
BL	_DrawRadioButton+0
;ECGsynthetic_events_code.c,914 :: 		DrawRadioButton(&RadioButton22);
MOVW	R0, #lo_addr(_RadioButton22+0)
MOVT	R0, #hi_addr(_RadioButton22+0)
BL	_DrawRadioButton+0
;ECGsynthetic_events_code.c,915 :: 		DrawRadioButton(&RadioButton1);
MOVW	R0, #lo_addr(_RadioButton1+0)
MOVT	R0, #hi_addr(_RadioButton1+0)
BL	_DrawRadioButton+0
;ECGsynthetic_events_code.c,916 :: 		DrawRadioButton(&RadioButton24);
MOVW	R0, #lo_addr(_RadioButton24+0)
MOVT	R0, #hi_addr(_RadioButton24+0)
BL	_DrawRadioButton+0
;ECGsynthetic_events_code.c,918 :: 		}
L_end_RadioButton23OnPress:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _RadioButton23OnPress
_RadioButton24OnPress:
;ECGsynthetic_events_code.c,920 :: 		void RadioButton24OnPress() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;ECGsynthetic_events_code.c,921 :: 		anteriorv6();
BL	_anteriorV6+0
;ECGsynthetic_events_code.c,922 :: 		applicationTaskDAC();
BL	_applicationTaskDAC+0
;ECGsynthetic_events_code.c,923 :: 		RadioButton2.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton2+20)
MOVT	R0, #hi_addr(_RadioButton2+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,924 :: 		RadioButton15.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton15+20)
MOVT	R0, #hi_addr(_RadioButton15+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,925 :: 		RadioButton16.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton16+20)
MOVT	R0, #hi_addr(_RadioButton16+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,926 :: 		RadioButton17.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton17+20)
MOVT	R0, #hi_addr(_RadioButton17+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,927 :: 		RadioButton18.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton18+20)
MOVT	R0, #hi_addr(_RadioButton18+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,928 :: 		RadioButton19.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton19+20)
MOVT	R0, #hi_addr(_RadioButton19+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,929 :: 		RadioButton20.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton20+20)
MOVT	R0, #hi_addr(_RadioButton20+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,930 :: 		RadioButton21.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton21+20)
MOVT	R0, #hi_addr(_RadioButton21+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,931 :: 		RadioButton22.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton22+20)
MOVT	R0, #hi_addr(_RadioButton22+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,932 :: 		RadioButton23.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton23+20)
MOVT	R0, #hi_addr(_RadioButton23+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,933 :: 		RadioButton1.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton1+20)
MOVT	R0, #hi_addr(_RadioButton1+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,934 :: 		DrawRadioButton(&RadioButton2);
MOVW	R0, #lo_addr(_RadioButton2+0)
MOVT	R0, #hi_addr(_RadioButton2+0)
BL	_DrawRadioButton+0
;ECGsynthetic_events_code.c,935 :: 		DrawRadioButton(&RadioButton15);
MOVW	R0, #lo_addr(_RadioButton15+0)
MOVT	R0, #hi_addr(_RadioButton15+0)
BL	_DrawRadioButton+0
;ECGsynthetic_events_code.c,936 :: 		DrawRadioButton(&RadioButton16);
MOVW	R0, #lo_addr(_RadioButton16+0)
MOVT	R0, #hi_addr(_RadioButton16+0)
BL	_DrawRadioButton+0
;ECGsynthetic_events_code.c,937 :: 		DrawRadioButton(&RadioButton17);
MOVW	R0, #lo_addr(_RadioButton17+0)
MOVT	R0, #hi_addr(_RadioButton17+0)
BL	_DrawRadioButton+0
;ECGsynthetic_events_code.c,938 :: 		DrawRadioButton(&RadioButton18);
MOVW	R0, #lo_addr(_RadioButton18+0)
MOVT	R0, #hi_addr(_RadioButton18+0)
BL	_DrawRadioButton+0
;ECGsynthetic_events_code.c,939 :: 		DrawRadioButton(&RadioButton19);
MOVW	R0, #lo_addr(_RadioButton19+0)
MOVT	R0, #hi_addr(_RadioButton19+0)
BL	_DrawRadioButton+0
;ECGsynthetic_events_code.c,940 :: 		DrawRadioButton(&RadioButton20);
MOVW	R0, #lo_addr(_RadioButton20+0)
MOVT	R0, #hi_addr(_RadioButton20+0)
BL	_DrawRadioButton+0
;ECGsynthetic_events_code.c,941 :: 		DrawRadioButton(&RadioButton21);
MOVW	R0, #lo_addr(_RadioButton21+0)
MOVT	R0, #hi_addr(_RadioButton21+0)
BL	_DrawRadioButton+0
;ECGsynthetic_events_code.c,942 :: 		DrawRadioButton(&RadioButton22);
MOVW	R0, #lo_addr(_RadioButton22+0)
MOVT	R0, #hi_addr(_RadioButton22+0)
BL	_DrawRadioButton+0
;ECGsynthetic_events_code.c,943 :: 		DrawRadioButton(&RadioButton23);
MOVW	R0, #lo_addr(_RadioButton23+0)
MOVT	R0, #hi_addr(_RadioButton23+0)
BL	_DrawRadioButton+0
;ECGsynthetic_events_code.c,944 :: 		DrawRadioButton(&RadioButton1);
MOVW	R0, #lo_addr(_RadioButton1+0)
MOVT	R0, #hi_addr(_RadioButton1+0)
BL	_DrawRadioButton+0
;ECGsynthetic_events_code.c,946 :: 		}
L_end_RadioButton24OnPress:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _RadioButton24OnPress
_RadioButton25OnPress:
;ECGsynthetic_events_code.c,949 :: 		void RadioButton25OnPress() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;ECGsynthetic_events_code.c,950 :: 		inferior1();
BL	_inferior1+0
;ECGsynthetic_events_code.c,951 :: 		applicationTaskDAC();
BL	_applicationTaskDAC+0
;ECGsynthetic_events_code.c,952 :: 		RadioButton26.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton26+20)
MOVT	R0, #hi_addr(_RadioButton26+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,953 :: 		RadioButton27.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton27+20)
MOVT	R0, #hi_addr(_RadioButton27+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,954 :: 		RadioButton28.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton28+20)
MOVT	R0, #hi_addr(_RadioButton28+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,955 :: 		RadioButton29.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton29+20)
MOVT	R0, #hi_addr(_RadioButton29+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,956 :: 		RadioButton30.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton30+20)
MOVT	R0, #hi_addr(_RadioButton30+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,957 :: 		RadioButton31.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton31+20)
MOVT	R0, #hi_addr(_RadioButton31+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,958 :: 		RadioButton32.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton32+20)
MOVT	R0, #hi_addr(_RadioButton32+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,959 :: 		RadioButton33.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton33+20)
MOVT	R0, #hi_addr(_RadioButton33+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,960 :: 		RadioButton34.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton34+20)
MOVT	R0, #hi_addr(_RadioButton34+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,961 :: 		RadioButton35.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton35+20)
MOVT	R0, #hi_addr(_RadioButton35+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,962 :: 		RadioButton36.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton36+20)
MOVT	R0, #hi_addr(_RadioButton36+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,963 :: 		DrawRadioButton(&RadioButton26);
MOVW	R0, #lo_addr(_RadioButton26+0)
MOVT	R0, #hi_addr(_RadioButton26+0)
BL	_DrawRadioButton+0
;ECGsynthetic_events_code.c,964 :: 		DrawRadioButton(&RadioButton27);
MOVW	R0, #lo_addr(_RadioButton27+0)
MOVT	R0, #hi_addr(_RadioButton27+0)
BL	_DrawRadioButton+0
;ECGsynthetic_events_code.c,965 :: 		DrawRadioButton(&RadioButton28);
MOVW	R0, #lo_addr(_RadioButton28+0)
MOVT	R0, #hi_addr(_RadioButton28+0)
BL	_DrawRadioButton+0
;ECGsynthetic_events_code.c,966 :: 		DrawRadioButton(&RadioButton29);
MOVW	R0, #lo_addr(_RadioButton29+0)
MOVT	R0, #hi_addr(_RadioButton29+0)
BL	_DrawRadioButton+0
;ECGsynthetic_events_code.c,967 :: 		DrawRadioButton(&RadioButton30);
MOVW	R0, #lo_addr(_RadioButton30+0)
MOVT	R0, #hi_addr(_RadioButton30+0)
BL	_DrawRadioButton+0
;ECGsynthetic_events_code.c,968 :: 		DrawRadioButton(&RadioButton31);
MOVW	R0, #lo_addr(_RadioButton31+0)
MOVT	R0, #hi_addr(_RadioButton31+0)
BL	_DrawRadioButton+0
;ECGsynthetic_events_code.c,969 :: 		DrawRadioButton(&RadioButton32);
MOVW	R0, #lo_addr(_RadioButton32+0)
MOVT	R0, #hi_addr(_RadioButton32+0)
BL	_DrawRadioButton+0
;ECGsynthetic_events_code.c,970 :: 		DrawRadioButton(&RadioButton33);
MOVW	R0, #lo_addr(_RadioButton33+0)
MOVT	R0, #hi_addr(_RadioButton33+0)
BL	_DrawRadioButton+0
;ECGsynthetic_events_code.c,971 :: 		DrawRadioButton(&RadioButton34);
MOVW	R0, #lo_addr(_RadioButton34+0)
MOVT	R0, #hi_addr(_RadioButton34+0)
BL	_DrawRadioButton+0
;ECGsynthetic_events_code.c,972 :: 		DrawRadioButton(&RadioButton35);
MOVW	R0, #lo_addr(_RadioButton35+0)
MOVT	R0, #hi_addr(_RadioButton35+0)
BL	_DrawRadioButton+0
;ECGsynthetic_events_code.c,973 :: 		DrawRadioButton(&RadioButton36);
MOVW	R0, #lo_addr(_RadioButton36+0)
MOVT	R0, #hi_addr(_RadioButton36+0)
BL	_DrawRadioButton+0
;ECGsynthetic_events_code.c,975 :: 		}
L_end_RadioButton25OnPress:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _RadioButton25OnPress
_RadioButton26OnPress:
;ECGsynthetic_events_code.c,977 :: 		void RadioButton26OnPress() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;ECGsynthetic_events_code.c,978 :: 		inferior2();
BL	_inferior2+0
;ECGsynthetic_events_code.c,979 :: 		applicationTaskDAC();
BL	_applicationTaskDAC+0
;ECGsynthetic_events_code.c,980 :: 		RadioButton25.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton25+20)
MOVT	R0, #hi_addr(_RadioButton25+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,981 :: 		RadioButton27.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton27+20)
MOVT	R0, #hi_addr(_RadioButton27+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,982 :: 		RadioButton28.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton28+20)
MOVT	R0, #hi_addr(_RadioButton28+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,983 :: 		RadioButton29.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton29+20)
MOVT	R0, #hi_addr(_RadioButton29+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,984 :: 		RadioButton30.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton30+20)
MOVT	R0, #hi_addr(_RadioButton30+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,985 :: 		RadioButton31.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton31+20)
MOVT	R0, #hi_addr(_RadioButton31+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,986 :: 		RadioButton32.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton32+20)
MOVT	R0, #hi_addr(_RadioButton32+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,987 :: 		RadioButton33.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton33+20)
MOVT	R0, #hi_addr(_RadioButton33+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,988 :: 		RadioButton34.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton34+20)
MOVT	R0, #hi_addr(_RadioButton34+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,989 :: 		RadioButton35.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton35+20)
MOVT	R0, #hi_addr(_RadioButton35+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,990 :: 		RadioButton36.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton36+20)
MOVT	R0, #hi_addr(_RadioButton36+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,991 :: 		DrawRadioButton(&RadioButton25);
MOVW	R0, #lo_addr(_RadioButton25+0)
MOVT	R0, #hi_addr(_RadioButton25+0)
BL	_DrawRadioButton+0
;ECGsynthetic_events_code.c,992 :: 		DrawRadioButton(&RadioButton27);
MOVW	R0, #lo_addr(_RadioButton27+0)
MOVT	R0, #hi_addr(_RadioButton27+0)
BL	_DrawRadioButton+0
;ECGsynthetic_events_code.c,993 :: 		DrawRadioButton(&RadioButton28);
MOVW	R0, #lo_addr(_RadioButton28+0)
MOVT	R0, #hi_addr(_RadioButton28+0)
BL	_DrawRadioButton+0
;ECGsynthetic_events_code.c,994 :: 		DrawRadioButton(&RadioButton29);
MOVW	R0, #lo_addr(_RadioButton29+0)
MOVT	R0, #hi_addr(_RadioButton29+0)
BL	_DrawRadioButton+0
;ECGsynthetic_events_code.c,995 :: 		DrawRadioButton(&RadioButton30);
MOVW	R0, #lo_addr(_RadioButton30+0)
MOVT	R0, #hi_addr(_RadioButton30+0)
BL	_DrawRadioButton+0
;ECGsynthetic_events_code.c,996 :: 		DrawRadioButton(&RadioButton31);
MOVW	R0, #lo_addr(_RadioButton31+0)
MOVT	R0, #hi_addr(_RadioButton31+0)
BL	_DrawRadioButton+0
;ECGsynthetic_events_code.c,997 :: 		DrawRadioButton(&RadioButton32);
MOVW	R0, #lo_addr(_RadioButton32+0)
MOVT	R0, #hi_addr(_RadioButton32+0)
BL	_DrawRadioButton+0
;ECGsynthetic_events_code.c,998 :: 		DrawRadioButton(&RadioButton33);
MOVW	R0, #lo_addr(_RadioButton33+0)
MOVT	R0, #hi_addr(_RadioButton33+0)
BL	_DrawRadioButton+0
;ECGsynthetic_events_code.c,999 :: 		DrawRadioButton(&RadioButton34);
MOVW	R0, #lo_addr(_RadioButton34+0)
MOVT	R0, #hi_addr(_RadioButton34+0)
BL	_DrawRadioButton+0
;ECGsynthetic_events_code.c,1000 :: 		DrawRadioButton(&RadioButton35);
MOVW	R0, #lo_addr(_RadioButton35+0)
MOVT	R0, #hi_addr(_RadioButton35+0)
BL	_DrawRadioButton+0
;ECGsynthetic_events_code.c,1001 :: 		DrawRadioButton(&RadioButton36);
MOVW	R0, #lo_addr(_RadioButton36+0)
MOVT	R0, #hi_addr(_RadioButton36+0)
BL	_DrawRadioButton+0
;ECGsynthetic_events_code.c,1003 :: 		}
L_end_RadioButton26OnPress:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _RadioButton26OnPress
_RadioButton27OnPress:
;ECGsynthetic_events_code.c,1005 :: 		void RadioButton27OnPress() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;ECGsynthetic_events_code.c,1006 :: 		inferior3();
BL	_inferior3+0
;ECGsynthetic_events_code.c,1007 :: 		applicationTaskDAC();
BL	_applicationTaskDAC+0
;ECGsynthetic_events_code.c,1008 :: 		RadioButton26.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton26+20)
MOVT	R0, #hi_addr(_RadioButton26+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,1009 :: 		RadioButton25.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton25+20)
MOVT	R0, #hi_addr(_RadioButton25+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,1010 :: 		RadioButton28.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton28+20)
MOVT	R0, #hi_addr(_RadioButton28+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,1011 :: 		RadioButton29.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton29+20)
MOVT	R0, #hi_addr(_RadioButton29+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,1012 :: 		RadioButton30.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton30+20)
MOVT	R0, #hi_addr(_RadioButton30+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,1013 :: 		RadioButton31.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton31+20)
MOVT	R0, #hi_addr(_RadioButton31+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,1014 :: 		RadioButton32.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton32+20)
MOVT	R0, #hi_addr(_RadioButton32+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,1015 :: 		RadioButton33.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton33+20)
MOVT	R0, #hi_addr(_RadioButton33+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,1016 :: 		RadioButton34.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton34+20)
MOVT	R0, #hi_addr(_RadioButton34+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,1017 :: 		RadioButton35.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton35+20)
MOVT	R0, #hi_addr(_RadioButton35+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,1018 :: 		RadioButton36.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton36+20)
MOVT	R0, #hi_addr(_RadioButton36+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,1019 :: 		DrawRadioButton(&RadioButton26);
MOVW	R0, #lo_addr(_RadioButton26+0)
MOVT	R0, #hi_addr(_RadioButton26+0)
BL	_DrawRadioButton+0
;ECGsynthetic_events_code.c,1020 :: 		DrawRadioButton(&RadioButton25);
MOVW	R0, #lo_addr(_RadioButton25+0)
MOVT	R0, #hi_addr(_RadioButton25+0)
BL	_DrawRadioButton+0
;ECGsynthetic_events_code.c,1021 :: 		DrawRadioButton(&RadioButton28);
MOVW	R0, #lo_addr(_RadioButton28+0)
MOVT	R0, #hi_addr(_RadioButton28+0)
BL	_DrawRadioButton+0
;ECGsynthetic_events_code.c,1022 :: 		DrawRadioButton(&RadioButton29);
MOVW	R0, #lo_addr(_RadioButton29+0)
MOVT	R0, #hi_addr(_RadioButton29+0)
BL	_DrawRadioButton+0
;ECGsynthetic_events_code.c,1023 :: 		DrawRadioButton(&RadioButton30);
MOVW	R0, #lo_addr(_RadioButton30+0)
MOVT	R0, #hi_addr(_RadioButton30+0)
BL	_DrawRadioButton+0
;ECGsynthetic_events_code.c,1024 :: 		DrawRadioButton(&RadioButton31);
MOVW	R0, #lo_addr(_RadioButton31+0)
MOVT	R0, #hi_addr(_RadioButton31+0)
BL	_DrawRadioButton+0
;ECGsynthetic_events_code.c,1025 :: 		DrawRadioButton(&RadioButton32);
MOVW	R0, #lo_addr(_RadioButton32+0)
MOVT	R0, #hi_addr(_RadioButton32+0)
BL	_DrawRadioButton+0
;ECGsynthetic_events_code.c,1026 :: 		DrawRadioButton(&RadioButton33);
MOVW	R0, #lo_addr(_RadioButton33+0)
MOVT	R0, #hi_addr(_RadioButton33+0)
BL	_DrawRadioButton+0
;ECGsynthetic_events_code.c,1027 :: 		DrawRadioButton(&RadioButton34);
MOVW	R0, #lo_addr(_RadioButton34+0)
MOVT	R0, #hi_addr(_RadioButton34+0)
BL	_DrawRadioButton+0
;ECGsynthetic_events_code.c,1028 :: 		DrawRadioButton(&RadioButton35);
MOVW	R0, #lo_addr(_RadioButton35+0)
MOVT	R0, #hi_addr(_RadioButton35+0)
BL	_DrawRadioButton+0
;ECGsynthetic_events_code.c,1029 :: 		DrawRadioButton(&RadioButton36);
MOVW	R0, #lo_addr(_RadioButton36+0)
MOVT	R0, #hi_addr(_RadioButton36+0)
BL	_DrawRadioButton+0
;ECGsynthetic_events_code.c,1031 :: 		}
L_end_RadioButton27OnPress:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _RadioButton27OnPress
_RadioButton28OnPress:
;ECGsynthetic_events_code.c,1033 :: 		void RadioButton28OnPress() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;ECGsynthetic_events_code.c,1034 :: 		inferioravr();
BL	_inferioraVR+0
;ECGsynthetic_events_code.c,1035 :: 		applicationTaskDAC();
BL	_applicationTaskDAC+0
;ECGsynthetic_events_code.c,1036 :: 		RadioButton26.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton26+20)
MOVT	R0, #hi_addr(_RadioButton26+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,1037 :: 		RadioButton27.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton27+20)
MOVT	R0, #hi_addr(_RadioButton27+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,1038 :: 		RadioButton25.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton25+20)
MOVT	R0, #hi_addr(_RadioButton25+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,1039 :: 		RadioButton29.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton29+20)
MOVT	R0, #hi_addr(_RadioButton29+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,1040 :: 		RadioButton30.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton30+20)
MOVT	R0, #hi_addr(_RadioButton30+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,1041 :: 		RadioButton31.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton31+20)
MOVT	R0, #hi_addr(_RadioButton31+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,1042 :: 		RadioButton32.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton32+20)
MOVT	R0, #hi_addr(_RadioButton32+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,1043 :: 		RadioButton33.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton33+20)
MOVT	R0, #hi_addr(_RadioButton33+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,1044 :: 		RadioButton34.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton34+20)
MOVT	R0, #hi_addr(_RadioButton34+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,1045 :: 		RadioButton35.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton35+20)
MOVT	R0, #hi_addr(_RadioButton35+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,1046 :: 		RadioButton36.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton36+20)
MOVT	R0, #hi_addr(_RadioButton36+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,1047 :: 		DrawRadioButton(&RadioButton26);
MOVW	R0, #lo_addr(_RadioButton26+0)
MOVT	R0, #hi_addr(_RadioButton26+0)
BL	_DrawRadioButton+0
;ECGsynthetic_events_code.c,1048 :: 		DrawRadioButton(&RadioButton27);
MOVW	R0, #lo_addr(_RadioButton27+0)
MOVT	R0, #hi_addr(_RadioButton27+0)
BL	_DrawRadioButton+0
;ECGsynthetic_events_code.c,1049 :: 		DrawRadioButton(&RadioButton25);
MOVW	R0, #lo_addr(_RadioButton25+0)
MOVT	R0, #hi_addr(_RadioButton25+0)
BL	_DrawRadioButton+0
;ECGsynthetic_events_code.c,1050 :: 		DrawRadioButton(&RadioButton29);
MOVW	R0, #lo_addr(_RadioButton29+0)
MOVT	R0, #hi_addr(_RadioButton29+0)
BL	_DrawRadioButton+0
;ECGsynthetic_events_code.c,1051 :: 		DrawRadioButton(&RadioButton30);
MOVW	R0, #lo_addr(_RadioButton30+0)
MOVT	R0, #hi_addr(_RadioButton30+0)
BL	_DrawRadioButton+0
;ECGsynthetic_events_code.c,1052 :: 		DrawRadioButton(&RadioButton31);
MOVW	R0, #lo_addr(_RadioButton31+0)
MOVT	R0, #hi_addr(_RadioButton31+0)
BL	_DrawRadioButton+0
;ECGsynthetic_events_code.c,1053 :: 		DrawRadioButton(&RadioButton32);
MOVW	R0, #lo_addr(_RadioButton32+0)
MOVT	R0, #hi_addr(_RadioButton32+0)
BL	_DrawRadioButton+0
;ECGsynthetic_events_code.c,1054 :: 		DrawRadioButton(&RadioButton33);
MOVW	R0, #lo_addr(_RadioButton33+0)
MOVT	R0, #hi_addr(_RadioButton33+0)
BL	_DrawRadioButton+0
;ECGsynthetic_events_code.c,1055 :: 		DrawRadioButton(&RadioButton34);
MOVW	R0, #lo_addr(_RadioButton34+0)
MOVT	R0, #hi_addr(_RadioButton34+0)
BL	_DrawRadioButton+0
;ECGsynthetic_events_code.c,1056 :: 		DrawRadioButton(&RadioButton35);
MOVW	R0, #lo_addr(_RadioButton35+0)
MOVT	R0, #hi_addr(_RadioButton35+0)
BL	_DrawRadioButton+0
;ECGsynthetic_events_code.c,1057 :: 		DrawRadioButton(&RadioButton36);
MOVW	R0, #lo_addr(_RadioButton36+0)
MOVT	R0, #hi_addr(_RadioButton36+0)
BL	_DrawRadioButton+0
;ECGsynthetic_events_code.c,1059 :: 		}
L_end_RadioButton28OnPress:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _RadioButton28OnPress
_RadioButton29OnPress:
;ECGsynthetic_events_code.c,1061 :: 		void RadioButton29OnPress() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;ECGsynthetic_events_code.c,1062 :: 		inferioravl();
BL	_inferioraVL+0
;ECGsynthetic_events_code.c,1063 :: 		applicationTaskDAC();
BL	_applicationTaskDAC+0
;ECGsynthetic_events_code.c,1064 :: 		RadioButton26.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton26+20)
MOVT	R0, #hi_addr(_RadioButton26+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,1065 :: 		RadioButton27.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton27+20)
MOVT	R0, #hi_addr(_RadioButton27+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,1066 :: 		RadioButton28.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton28+20)
MOVT	R0, #hi_addr(_RadioButton28+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,1067 :: 		RadioButton25.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton25+20)
MOVT	R0, #hi_addr(_RadioButton25+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,1068 :: 		RadioButton30.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton30+20)
MOVT	R0, #hi_addr(_RadioButton30+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,1069 :: 		RadioButton31.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton31+20)
MOVT	R0, #hi_addr(_RadioButton31+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,1070 :: 		RadioButton32.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton32+20)
MOVT	R0, #hi_addr(_RadioButton32+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,1071 :: 		RadioButton33.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton33+20)
MOVT	R0, #hi_addr(_RadioButton33+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,1072 :: 		RadioButton34.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton34+20)
MOVT	R0, #hi_addr(_RadioButton34+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,1073 :: 		RadioButton35.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton35+20)
MOVT	R0, #hi_addr(_RadioButton35+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,1074 :: 		RadioButton36.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton36+20)
MOVT	R0, #hi_addr(_RadioButton36+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,1075 :: 		DrawRadioButton(&RadioButton26);
MOVW	R0, #lo_addr(_RadioButton26+0)
MOVT	R0, #hi_addr(_RadioButton26+0)
BL	_DrawRadioButton+0
;ECGsynthetic_events_code.c,1076 :: 		DrawRadioButton(&RadioButton27);
MOVW	R0, #lo_addr(_RadioButton27+0)
MOVT	R0, #hi_addr(_RadioButton27+0)
BL	_DrawRadioButton+0
;ECGsynthetic_events_code.c,1077 :: 		DrawRadioButton(&RadioButton28);
MOVW	R0, #lo_addr(_RadioButton28+0)
MOVT	R0, #hi_addr(_RadioButton28+0)
BL	_DrawRadioButton+0
;ECGsynthetic_events_code.c,1078 :: 		DrawRadioButton(&RadioButton25);
MOVW	R0, #lo_addr(_RadioButton25+0)
MOVT	R0, #hi_addr(_RadioButton25+0)
BL	_DrawRadioButton+0
;ECGsynthetic_events_code.c,1079 :: 		DrawRadioButton(&RadioButton30);
MOVW	R0, #lo_addr(_RadioButton30+0)
MOVT	R0, #hi_addr(_RadioButton30+0)
BL	_DrawRadioButton+0
;ECGsynthetic_events_code.c,1080 :: 		DrawRadioButton(&RadioButton31);
MOVW	R0, #lo_addr(_RadioButton31+0)
MOVT	R0, #hi_addr(_RadioButton31+0)
BL	_DrawRadioButton+0
;ECGsynthetic_events_code.c,1081 :: 		DrawRadioButton(&RadioButton32);
MOVW	R0, #lo_addr(_RadioButton32+0)
MOVT	R0, #hi_addr(_RadioButton32+0)
BL	_DrawRadioButton+0
;ECGsynthetic_events_code.c,1082 :: 		DrawRadioButton(&RadioButton33);
MOVW	R0, #lo_addr(_RadioButton33+0)
MOVT	R0, #hi_addr(_RadioButton33+0)
BL	_DrawRadioButton+0
;ECGsynthetic_events_code.c,1083 :: 		DrawRadioButton(&RadioButton34);
MOVW	R0, #lo_addr(_RadioButton34+0)
MOVT	R0, #hi_addr(_RadioButton34+0)
BL	_DrawRadioButton+0
;ECGsynthetic_events_code.c,1084 :: 		DrawRadioButton(&RadioButton35);
MOVW	R0, #lo_addr(_RadioButton35+0)
MOVT	R0, #hi_addr(_RadioButton35+0)
BL	_DrawRadioButton+0
;ECGsynthetic_events_code.c,1085 :: 		DrawRadioButton(&RadioButton36);
MOVW	R0, #lo_addr(_RadioButton36+0)
MOVT	R0, #hi_addr(_RadioButton36+0)
BL	_DrawRadioButton+0
;ECGsynthetic_events_code.c,1087 :: 		}
L_end_RadioButton29OnPress:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _RadioButton29OnPress
_RadioButton30OnPress:
;ECGsynthetic_events_code.c,1089 :: 		void RadioButton30OnPress() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;ECGsynthetic_events_code.c,1090 :: 		inferioravf();
BL	_inferioraVF+0
;ECGsynthetic_events_code.c,1091 :: 		applicationTaskDAC();
BL	_applicationTaskDAC+0
;ECGsynthetic_events_code.c,1092 :: 		RadioButton26.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton26+20)
MOVT	R0, #hi_addr(_RadioButton26+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,1093 :: 		RadioButton27.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton27+20)
MOVT	R0, #hi_addr(_RadioButton27+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,1094 :: 		RadioButton28.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton28+20)
MOVT	R0, #hi_addr(_RadioButton28+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,1095 :: 		RadioButton29.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton29+20)
MOVT	R0, #hi_addr(_RadioButton29+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,1096 :: 		RadioButton25.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton25+20)
MOVT	R0, #hi_addr(_RadioButton25+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,1097 :: 		RadioButton31.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton31+20)
MOVT	R0, #hi_addr(_RadioButton31+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,1098 :: 		RadioButton32.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton32+20)
MOVT	R0, #hi_addr(_RadioButton32+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,1099 :: 		RadioButton33.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton33+20)
MOVT	R0, #hi_addr(_RadioButton33+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,1100 :: 		RadioButton34.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton34+20)
MOVT	R0, #hi_addr(_RadioButton34+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,1101 :: 		RadioButton35.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton35+20)
MOVT	R0, #hi_addr(_RadioButton35+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,1102 :: 		RadioButton36.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton36+20)
MOVT	R0, #hi_addr(_RadioButton36+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,1103 :: 		DrawRadioButton(&RadioButton26);
MOVW	R0, #lo_addr(_RadioButton26+0)
MOVT	R0, #hi_addr(_RadioButton26+0)
BL	_DrawRadioButton+0
;ECGsynthetic_events_code.c,1104 :: 		DrawRadioButton(&RadioButton27);
MOVW	R0, #lo_addr(_RadioButton27+0)
MOVT	R0, #hi_addr(_RadioButton27+0)
BL	_DrawRadioButton+0
;ECGsynthetic_events_code.c,1105 :: 		DrawRadioButton(&RadioButton28);
MOVW	R0, #lo_addr(_RadioButton28+0)
MOVT	R0, #hi_addr(_RadioButton28+0)
BL	_DrawRadioButton+0
;ECGsynthetic_events_code.c,1106 :: 		DrawRadioButton(&RadioButton29);
MOVW	R0, #lo_addr(_RadioButton29+0)
MOVT	R0, #hi_addr(_RadioButton29+0)
BL	_DrawRadioButton+0
;ECGsynthetic_events_code.c,1107 :: 		DrawRadioButton(&RadioButton25);
MOVW	R0, #lo_addr(_RadioButton25+0)
MOVT	R0, #hi_addr(_RadioButton25+0)
BL	_DrawRadioButton+0
;ECGsynthetic_events_code.c,1108 :: 		DrawRadioButton(&RadioButton31);
MOVW	R0, #lo_addr(_RadioButton31+0)
MOVT	R0, #hi_addr(_RadioButton31+0)
BL	_DrawRadioButton+0
;ECGsynthetic_events_code.c,1109 :: 		DrawRadioButton(&RadioButton32);
MOVW	R0, #lo_addr(_RadioButton32+0)
MOVT	R0, #hi_addr(_RadioButton32+0)
BL	_DrawRadioButton+0
;ECGsynthetic_events_code.c,1110 :: 		DrawRadioButton(&RadioButton33);
MOVW	R0, #lo_addr(_RadioButton33+0)
MOVT	R0, #hi_addr(_RadioButton33+0)
BL	_DrawRadioButton+0
;ECGsynthetic_events_code.c,1111 :: 		DrawRadioButton(&RadioButton34);
MOVW	R0, #lo_addr(_RadioButton34+0)
MOVT	R0, #hi_addr(_RadioButton34+0)
BL	_DrawRadioButton+0
;ECGsynthetic_events_code.c,1112 :: 		DrawRadioButton(&RadioButton35);
MOVW	R0, #lo_addr(_RadioButton35+0)
MOVT	R0, #hi_addr(_RadioButton35+0)
BL	_DrawRadioButton+0
;ECGsynthetic_events_code.c,1113 :: 		DrawRadioButton(&RadioButton36);
MOVW	R0, #lo_addr(_RadioButton36+0)
MOVT	R0, #hi_addr(_RadioButton36+0)
BL	_DrawRadioButton+0
;ECGsynthetic_events_code.c,1114 :: 		}
L_end_RadioButton30OnPress:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _RadioButton30OnPress
_RadioButton31OnPress:
;ECGsynthetic_events_code.c,1116 :: 		void RadioButton31OnPress() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;ECGsynthetic_events_code.c,1117 :: 		inferiorv1();
BL	_inferiorV1+0
;ECGsynthetic_events_code.c,1118 :: 		applicationTaskDAC();
BL	_applicationTaskDAC+0
;ECGsynthetic_events_code.c,1119 :: 		RadioButton26.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton26+20)
MOVT	R0, #hi_addr(_RadioButton26+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,1120 :: 		RadioButton27.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton27+20)
MOVT	R0, #hi_addr(_RadioButton27+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,1121 :: 		RadioButton28.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton28+20)
MOVT	R0, #hi_addr(_RadioButton28+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,1122 :: 		RadioButton29.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton29+20)
MOVT	R0, #hi_addr(_RadioButton29+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,1123 :: 		RadioButton30.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton30+20)
MOVT	R0, #hi_addr(_RadioButton30+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,1124 :: 		RadioButton25.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton25+20)
MOVT	R0, #hi_addr(_RadioButton25+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,1125 :: 		RadioButton32.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton32+20)
MOVT	R0, #hi_addr(_RadioButton32+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,1126 :: 		RadioButton33.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton33+20)
MOVT	R0, #hi_addr(_RadioButton33+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,1127 :: 		RadioButton34.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton34+20)
MOVT	R0, #hi_addr(_RadioButton34+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,1128 :: 		RadioButton35.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton35+20)
MOVT	R0, #hi_addr(_RadioButton35+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,1129 :: 		RadioButton36.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton36+20)
MOVT	R0, #hi_addr(_RadioButton36+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,1130 :: 		DrawRadioButton(&RadioButton26);
MOVW	R0, #lo_addr(_RadioButton26+0)
MOVT	R0, #hi_addr(_RadioButton26+0)
BL	_DrawRadioButton+0
;ECGsynthetic_events_code.c,1131 :: 		DrawRadioButton(&RadioButton27);
MOVW	R0, #lo_addr(_RadioButton27+0)
MOVT	R0, #hi_addr(_RadioButton27+0)
BL	_DrawRadioButton+0
;ECGsynthetic_events_code.c,1132 :: 		DrawRadioButton(&RadioButton28);
MOVW	R0, #lo_addr(_RadioButton28+0)
MOVT	R0, #hi_addr(_RadioButton28+0)
BL	_DrawRadioButton+0
;ECGsynthetic_events_code.c,1133 :: 		DrawRadioButton(&RadioButton29);
MOVW	R0, #lo_addr(_RadioButton29+0)
MOVT	R0, #hi_addr(_RadioButton29+0)
BL	_DrawRadioButton+0
;ECGsynthetic_events_code.c,1134 :: 		DrawRadioButton(&RadioButton30);
MOVW	R0, #lo_addr(_RadioButton30+0)
MOVT	R0, #hi_addr(_RadioButton30+0)
BL	_DrawRadioButton+0
;ECGsynthetic_events_code.c,1135 :: 		DrawRadioButton(&RadioButton25);
MOVW	R0, #lo_addr(_RadioButton25+0)
MOVT	R0, #hi_addr(_RadioButton25+0)
BL	_DrawRadioButton+0
;ECGsynthetic_events_code.c,1136 :: 		DrawRadioButton(&RadioButton32);
MOVW	R0, #lo_addr(_RadioButton32+0)
MOVT	R0, #hi_addr(_RadioButton32+0)
BL	_DrawRadioButton+0
;ECGsynthetic_events_code.c,1137 :: 		DrawRadioButton(&RadioButton33);
MOVW	R0, #lo_addr(_RadioButton33+0)
MOVT	R0, #hi_addr(_RadioButton33+0)
BL	_DrawRadioButton+0
;ECGsynthetic_events_code.c,1138 :: 		DrawRadioButton(&RadioButton34);
MOVW	R0, #lo_addr(_RadioButton34+0)
MOVT	R0, #hi_addr(_RadioButton34+0)
BL	_DrawRadioButton+0
;ECGsynthetic_events_code.c,1139 :: 		DrawRadioButton(&RadioButton35);
MOVW	R0, #lo_addr(_RadioButton35+0)
MOVT	R0, #hi_addr(_RadioButton35+0)
BL	_DrawRadioButton+0
;ECGsynthetic_events_code.c,1140 :: 		DrawRadioButton(&RadioButton36);
MOVW	R0, #lo_addr(_RadioButton36+0)
MOVT	R0, #hi_addr(_RadioButton36+0)
BL	_DrawRadioButton+0
;ECGsynthetic_events_code.c,1142 :: 		}
L_end_RadioButton31OnPress:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _RadioButton31OnPress
_RadioButton32OnPress:
;ECGsynthetic_events_code.c,1144 :: 		void RadioButton32OnPress() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;ECGsynthetic_events_code.c,1145 :: 		inferiorv2();
BL	_inferiorV2+0
;ECGsynthetic_events_code.c,1146 :: 		applicationTaskDAC();
BL	_applicationTaskDAC+0
;ECGsynthetic_events_code.c,1147 :: 		RadioButton26.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton26+20)
MOVT	R0, #hi_addr(_RadioButton26+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,1148 :: 		RadioButton27.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton27+20)
MOVT	R0, #hi_addr(_RadioButton27+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,1149 :: 		RadioButton28.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton28+20)
MOVT	R0, #hi_addr(_RadioButton28+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,1150 :: 		RadioButton29.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton29+20)
MOVT	R0, #hi_addr(_RadioButton29+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,1151 :: 		RadioButton30.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton30+20)
MOVT	R0, #hi_addr(_RadioButton30+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,1152 :: 		RadioButton31.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton31+20)
MOVT	R0, #hi_addr(_RadioButton31+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,1153 :: 		RadioButton25.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton25+20)
MOVT	R0, #hi_addr(_RadioButton25+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,1154 :: 		RadioButton33.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton33+20)
MOVT	R0, #hi_addr(_RadioButton33+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,1155 :: 		RadioButton34.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton34+20)
MOVT	R0, #hi_addr(_RadioButton34+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,1156 :: 		RadioButton35.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton35+20)
MOVT	R0, #hi_addr(_RadioButton35+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,1157 :: 		RadioButton36.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton36+20)
MOVT	R0, #hi_addr(_RadioButton36+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,1158 :: 		DrawRadioButton(&RadioButton26);
MOVW	R0, #lo_addr(_RadioButton26+0)
MOVT	R0, #hi_addr(_RadioButton26+0)
BL	_DrawRadioButton+0
;ECGsynthetic_events_code.c,1159 :: 		DrawRadioButton(&RadioButton27);
MOVW	R0, #lo_addr(_RadioButton27+0)
MOVT	R0, #hi_addr(_RadioButton27+0)
BL	_DrawRadioButton+0
;ECGsynthetic_events_code.c,1160 :: 		DrawRadioButton(&RadioButton28);
MOVW	R0, #lo_addr(_RadioButton28+0)
MOVT	R0, #hi_addr(_RadioButton28+0)
BL	_DrawRadioButton+0
;ECGsynthetic_events_code.c,1161 :: 		DrawRadioButton(&RadioButton29);
MOVW	R0, #lo_addr(_RadioButton29+0)
MOVT	R0, #hi_addr(_RadioButton29+0)
BL	_DrawRadioButton+0
;ECGsynthetic_events_code.c,1162 :: 		DrawRadioButton(&RadioButton30);
MOVW	R0, #lo_addr(_RadioButton30+0)
MOVT	R0, #hi_addr(_RadioButton30+0)
BL	_DrawRadioButton+0
;ECGsynthetic_events_code.c,1163 :: 		DrawRadioButton(&RadioButton31);
MOVW	R0, #lo_addr(_RadioButton31+0)
MOVT	R0, #hi_addr(_RadioButton31+0)
BL	_DrawRadioButton+0
;ECGsynthetic_events_code.c,1164 :: 		DrawRadioButton(&RadioButton25);
MOVW	R0, #lo_addr(_RadioButton25+0)
MOVT	R0, #hi_addr(_RadioButton25+0)
BL	_DrawRadioButton+0
;ECGsynthetic_events_code.c,1165 :: 		DrawRadioButton(&RadioButton33);
MOVW	R0, #lo_addr(_RadioButton33+0)
MOVT	R0, #hi_addr(_RadioButton33+0)
BL	_DrawRadioButton+0
;ECGsynthetic_events_code.c,1166 :: 		DrawRadioButton(&RadioButton34);
MOVW	R0, #lo_addr(_RadioButton34+0)
MOVT	R0, #hi_addr(_RadioButton34+0)
BL	_DrawRadioButton+0
;ECGsynthetic_events_code.c,1167 :: 		DrawRadioButton(&RadioButton35);
MOVW	R0, #lo_addr(_RadioButton35+0)
MOVT	R0, #hi_addr(_RadioButton35+0)
BL	_DrawRadioButton+0
;ECGsynthetic_events_code.c,1168 :: 		DrawRadioButton(&RadioButton36);
MOVW	R0, #lo_addr(_RadioButton36+0)
MOVT	R0, #hi_addr(_RadioButton36+0)
BL	_DrawRadioButton+0
;ECGsynthetic_events_code.c,1170 :: 		}
L_end_RadioButton32OnPress:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _RadioButton32OnPress
_RadioButton33OnPress:
;ECGsynthetic_events_code.c,1172 :: 		void RadioButton33OnPress() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;ECGsynthetic_events_code.c,1173 :: 		inferiorv3();
BL	_inferiorV3+0
;ECGsynthetic_events_code.c,1174 :: 		applicationTaskDAC();
BL	_applicationTaskDAC+0
;ECGsynthetic_events_code.c,1175 :: 		RadioButton26.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton26+20)
MOVT	R0, #hi_addr(_RadioButton26+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,1176 :: 		RadioButton27.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton27+20)
MOVT	R0, #hi_addr(_RadioButton27+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,1177 :: 		RadioButton28.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton28+20)
MOVT	R0, #hi_addr(_RadioButton28+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,1178 :: 		RadioButton29.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton29+20)
MOVT	R0, #hi_addr(_RadioButton29+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,1179 :: 		RadioButton30.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton30+20)
MOVT	R0, #hi_addr(_RadioButton30+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,1180 :: 		RadioButton31.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton31+20)
MOVT	R0, #hi_addr(_RadioButton31+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,1181 :: 		RadioButton32.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton32+20)
MOVT	R0, #hi_addr(_RadioButton32+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,1182 :: 		RadioButton25.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton25+20)
MOVT	R0, #hi_addr(_RadioButton25+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,1183 :: 		RadioButton34.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton34+20)
MOVT	R0, #hi_addr(_RadioButton34+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,1184 :: 		RadioButton35.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton35+20)
MOVT	R0, #hi_addr(_RadioButton35+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,1185 :: 		RadioButton36.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton36+20)
MOVT	R0, #hi_addr(_RadioButton36+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,1186 :: 		DrawRadioButton(&RadioButton26);
MOVW	R0, #lo_addr(_RadioButton26+0)
MOVT	R0, #hi_addr(_RadioButton26+0)
BL	_DrawRadioButton+0
;ECGsynthetic_events_code.c,1187 :: 		DrawRadioButton(&RadioButton27);
MOVW	R0, #lo_addr(_RadioButton27+0)
MOVT	R0, #hi_addr(_RadioButton27+0)
BL	_DrawRadioButton+0
;ECGsynthetic_events_code.c,1188 :: 		DrawRadioButton(&RadioButton28);
MOVW	R0, #lo_addr(_RadioButton28+0)
MOVT	R0, #hi_addr(_RadioButton28+0)
BL	_DrawRadioButton+0
;ECGsynthetic_events_code.c,1189 :: 		DrawRadioButton(&RadioButton29);
MOVW	R0, #lo_addr(_RadioButton29+0)
MOVT	R0, #hi_addr(_RadioButton29+0)
BL	_DrawRadioButton+0
;ECGsynthetic_events_code.c,1190 :: 		DrawRadioButton(&RadioButton30);
MOVW	R0, #lo_addr(_RadioButton30+0)
MOVT	R0, #hi_addr(_RadioButton30+0)
BL	_DrawRadioButton+0
;ECGsynthetic_events_code.c,1191 :: 		DrawRadioButton(&RadioButton31);
MOVW	R0, #lo_addr(_RadioButton31+0)
MOVT	R0, #hi_addr(_RadioButton31+0)
BL	_DrawRadioButton+0
;ECGsynthetic_events_code.c,1192 :: 		DrawRadioButton(&RadioButton32);
MOVW	R0, #lo_addr(_RadioButton32+0)
MOVT	R0, #hi_addr(_RadioButton32+0)
BL	_DrawRadioButton+0
;ECGsynthetic_events_code.c,1193 :: 		DrawRadioButton(&RadioButton25);
MOVW	R0, #lo_addr(_RadioButton25+0)
MOVT	R0, #hi_addr(_RadioButton25+0)
BL	_DrawRadioButton+0
;ECGsynthetic_events_code.c,1194 :: 		DrawRadioButton(&RadioButton34);
MOVW	R0, #lo_addr(_RadioButton34+0)
MOVT	R0, #hi_addr(_RadioButton34+0)
BL	_DrawRadioButton+0
;ECGsynthetic_events_code.c,1195 :: 		DrawRadioButton(&RadioButton35);
MOVW	R0, #lo_addr(_RadioButton35+0)
MOVT	R0, #hi_addr(_RadioButton35+0)
BL	_DrawRadioButton+0
;ECGsynthetic_events_code.c,1196 :: 		DrawRadioButton(&RadioButton36);
MOVW	R0, #lo_addr(_RadioButton36+0)
MOVT	R0, #hi_addr(_RadioButton36+0)
BL	_DrawRadioButton+0
;ECGsynthetic_events_code.c,1197 :: 		}
L_end_RadioButton33OnPress:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _RadioButton33OnPress
_RadioButton34OnPress:
;ECGsynthetic_events_code.c,1199 :: 		void RadioButton34OnPress() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;ECGsynthetic_events_code.c,1200 :: 		inferiorv4();
BL	_inferiorV4+0
;ECGsynthetic_events_code.c,1201 :: 		applicationTaskDAC();
BL	_applicationTaskDAC+0
;ECGsynthetic_events_code.c,1202 :: 		RadioButton26.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton26+20)
MOVT	R0, #hi_addr(_RadioButton26+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,1203 :: 		RadioButton27.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton27+20)
MOVT	R0, #hi_addr(_RadioButton27+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,1204 :: 		RadioButton28.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton28+20)
MOVT	R0, #hi_addr(_RadioButton28+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,1205 :: 		RadioButton29.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton29+20)
MOVT	R0, #hi_addr(_RadioButton29+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,1206 :: 		RadioButton30.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton30+20)
MOVT	R0, #hi_addr(_RadioButton30+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,1207 :: 		RadioButton31.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton31+20)
MOVT	R0, #hi_addr(_RadioButton31+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,1208 :: 		RadioButton32.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton32+20)
MOVT	R0, #hi_addr(_RadioButton32+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,1209 :: 		RadioButton33.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton33+20)
MOVT	R0, #hi_addr(_RadioButton33+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,1210 :: 		RadioButton25.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton25+20)
MOVT	R0, #hi_addr(_RadioButton25+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,1211 :: 		RadioButton35.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton35+20)
MOVT	R0, #hi_addr(_RadioButton35+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,1212 :: 		RadioButton36.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton36+20)
MOVT	R0, #hi_addr(_RadioButton36+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,1213 :: 		DrawRadioButton(&RadioButton26);
MOVW	R0, #lo_addr(_RadioButton26+0)
MOVT	R0, #hi_addr(_RadioButton26+0)
BL	_DrawRadioButton+0
;ECGsynthetic_events_code.c,1214 :: 		DrawRadioButton(&RadioButton27);
MOVW	R0, #lo_addr(_RadioButton27+0)
MOVT	R0, #hi_addr(_RadioButton27+0)
BL	_DrawRadioButton+0
;ECGsynthetic_events_code.c,1215 :: 		DrawRadioButton(&RadioButton28);
MOVW	R0, #lo_addr(_RadioButton28+0)
MOVT	R0, #hi_addr(_RadioButton28+0)
BL	_DrawRadioButton+0
;ECGsynthetic_events_code.c,1216 :: 		DrawRadioButton(&RadioButton29);
MOVW	R0, #lo_addr(_RadioButton29+0)
MOVT	R0, #hi_addr(_RadioButton29+0)
BL	_DrawRadioButton+0
;ECGsynthetic_events_code.c,1217 :: 		DrawRadioButton(&RadioButton30);
MOVW	R0, #lo_addr(_RadioButton30+0)
MOVT	R0, #hi_addr(_RadioButton30+0)
BL	_DrawRadioButton+0
;ECGsynthetic_events_code.c,1218 :: 		DrawRadioButton(&RadioButton31);
MOVW	R0, #lo_addr(_RadioButton31+0)
MOVT	R0, #hi_addr(_RadioButton31+0)
BL	_DrawRadioButton+0
;ECGsynthetic_events_code.c,1219 :: 		DrawRadioButton(&RadioButton32);
MOVW	R0, #lo_addr(_RadioButton32+0)
MOVT	R0, #hi_addr(_RadioButton32+0)
BL	_DrawRadioButton+0
;ECGsynthetic_events_code.c,1220 :: 		DrawRadioButton(&RadioButton33);
MOVW	R0, #lo_addr(_RadioButton33+0)
MOVT	R0, #hi_addr(_RadioButton33+0)
BL	_DrawRadioButton+0
;ECGsynthetic_events_code.c,1221 :: 		DrawRadioButton(&RadioButton25);
MOVW	R0, #lo_addr(_RadioButton25+0)
MOVT	R0, #hi_addr(_RadioButton25+0)
BL	_DrawRadioButton+0
;ECGsynthetic_events_code.c,1222 :: 		DrawRadioButton(&RadioButton35);
MOVW	R0, #lo_addr(_RadioButton35+0)
MOVT	R0, #hi_addr(_RadioButton35+0)
BL	_DrawRadioButton+0
;ECGsynthetic_events_code.c,1223 :: 		DrawRadioButton(&RadioButton36);
MOVW	R0, #lo_addr(_RadioButton36+0)
MOVT	R0, #hi_addr(_RadioButton36+0)
BL	_DrawRadioButton+0
;ECGsynthetic_events_code.c,1224 :: 		}
L_end_RadioButton34OnPress:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _RadioButton34OnPress
_RadioButton35OnPress:
;ECGsynthetic_events_code.c,1226 :: 		void RadioButton35OnPress() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;ECGsynthetic_events_code.c,1227 :: 		inferiorv5();
BL	_inferiorV5+0
;ECGsynthetic_events_code.c,1228 :: 		applicationTaskDAC();
BL	_applicationTaskDAC+0
;ECGsynthetic_events_code.c,1229 :: 		RadioButton26.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton26+20)
MOVT	R0, #hi_addr(_RadioButton26+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,1230 :: 		RadioButton27.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton27+20)
MOVT	R0, #hi_addr(_RadioButton27+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,1231 :: 		RadioButton28.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton28+20)
MOVT	R0, #hi_addr(_RadioButton28+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,1232 :: 		RadioButton29.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton29+20)
MOVT	R0, #hi_addr(_RadioButton29+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,1233 :: 		RadioButton30.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton30+20)
MOVT	R0, #hi_addr(_RadioButton30+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,1234 :: 		RadioButton31.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton31+20)
MOVT	R0, #hi_addr(_RadioButton31+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,1235 :: 		RadioButton32.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton32+20)
MOVT	R0, #hi_addr(_RadioButton32+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,1236 :: 		RadioButton33.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton33+20)
MOVT	R0, #hi_addr(_RadioButton33+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,1237 :: 		RadioButton34.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton34+20)
MOVT	R0, #hi_addr(_RadioButton34+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,1238 :: 		RadioButton25.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton25+20)
MOVT	R0, #hi_addr(_RadioButton25+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,1239 :: 		RadioButton36.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton36+20)
MOVT	R0, #hi_addr(_RadioButton36+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,1240 :: 		DrawRadioButton(&RadioButton26);
MOVW	R0, #lo_addr(_RadioButton26+0)
MOVT	R0, #hi_addr(_RadioButton26+0)
BL	_DrawRadioButton+0
;ECGsynthetic_events_code.c,1241 :: 		DrawRadioButton(&RadioButton27);
MOVW	R0, #lo_addr(_RadioButton27+0)
MOVT	R0, #hi_addr(_RadioButton27+0)
BL	_DrawRadioButton+0
;ECGsynthetic_events_code.c,1242 :: 		DrawRadioButton(&RadioButton28);
MOVW	R0, #lo_addr(_RadioButton28+0)
MOVT	R0, #hi_addr(_RadioButton28+0)
BL	_DrawRadioButton+0
;ECGsynthetic_events_code.c,1243 :: 		DrawRadioButton(&RadioButton29);
MOVW	R0, #lo_addr(_RadioButton29+0)
MOVT	R0, #hi_addr(_RadioButton29+0)
BL	_DrawRadioButton+0
;ECGsynthetic_events_code.c,1244 :: 		DrawRadioButton(&RadioButton30);
MOVW	R0, #lo_addr(_RadioButton30+0)
MOVT	R0, #hi_addr(_RadioButton30+0)
BL	_DrawRadioButton+0
;ECGsynthetic_events_code.c,1245 :: 		DrawRadioButton(&RadioButton31);
MOVW	R0, #lo_addr(_RadioButton31+0)
MOVT	R0, #hi_addr(_RadioButton31+0)
BL	_DrawRadioButton+0
;ECGsynthetic_events_code.c,1246 :: 		DrawRadioButton(&RadioButton32);
MOVW	R0, #lo_addr(_RadioButton32+0)
MOVT	R0, #hi_addr(_RadioButton32+0)
BL	_DrawRadioButton+0
;ECGsynthetic_events_code.c,1247 :: 		DrawRadioButton(&RadioButton33);
MOVW	R0, #lo_addr(_RadioButton33+0)
MOVT	R0, #hi_addr(_RadioButton33+0)
BL	_DrawRadioButton+0
;ECGsynthetic_events_code.c,1248 :: 		DrawRadioButton(&RadioButton34);
MOVW	R0, #lo_addr(_RadioButton34+0)
MOVT	R0, #hi_addr(_RadioButton34+0)
BL	_DrawRadioButton+0
;ECGsynthetic_events_code.c,1249 :: 		DrawRadioButton(&RadioButton25);
MOVW	R0, #lo_addr(_RadioButton25+0)
MOVT	R0, #hi_addr(_RadioButton25+0)
BL	_DrawRadioButton+0
;ECGsynthetic_events_code.c,1250 :: 		DrawRadioButton(&RadioButton36);
MOVW	R0, #lo_addr(_RadioButton36+0)
MOVT	R0, #hi_addr(_RadioButton36+0)
BL	_DrawRadioButton+0
;ECGsynthetic_events_code.c,1251 :: 		}
L_end_RadioButton35OnPress:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _RadioButton35OnPress
_RadioButton36OnPress:
;ECGsynthetic_events_code.c,1253 :: 		void RadioButton36OnPress() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;ECGsynthetic_events_code.c,1254 :: 		inferiorv6();
BL	_inferiorV6+0
;ECGsynthetic_events_code.c,1255 :: 		applicationTaskDAC();
BL	_applicationTaskDAC+0
;ECGsynthetic_events_code.c,1256 :: 		RadioButton26.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton26+20)
MOVT	R0, #hi_addr(_RadioButton26+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,1257 :: 		RadioButton27.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton27+20)
MOVT	R0, #hi_addr(_RadioButton27+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,1258 :: 		RadioButton28.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton28+20)
MOVT	R0, #hi_addr(_RadioButton28+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,1259 :: 		RadioButton29.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton29+20)
MOVT	R0, #hi_addr(_RadioButton29+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,1260 :: 		RadioButton30.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton30+20)
MOVT	R0, #hi_addr(_RadioButton30+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,1261 :: 		RadioButton31.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton31+20)
MOVT	R0, #hi_addr(_RadioButton31+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,1262 :: 		RadioButton32.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton32+20)
MOVT	R0, #hi_addr(_RadioButton32+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,1263 :: 		RadioButton33.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton33+20)
MOVT	R0, #hi_addr(_RadioButton33+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,1264 :: 		RadioButton34.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton34+20)
MOVT	R0, #hi_addr(_RadioButton34+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,1265 :: 		RadioButton35.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton35+20)
MOVT	R0, #hi_addr(_RadioButton35+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,1266 :: 		RadioButton25.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton25+20)
MOVT	R0, #hi_addr(_RadioButton25+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,1267 :: 		DrawRadioButton(&RadioButton26);
MOVW	R0, #lo_addr(_RadioButton26+0)
MOVT	R0, #hi_addr(_RadioButton26+0)
BL	_DrawRadioButton+0
;ECGsynthetic_events_code.c,1268 :: 		DrawRadioButton(&RadioButton27);
MOVW	R0, #lo_addr(_RadioButton27+0)
MOVT	R0, #hi_addr(_RadioButton27+0)
BL	_DrawRadioButton+0
;ECGsynthetic_events_code.c,1269 :: 		DrawRadioButton(&RadioButton28);
MOVW	R0, #lo_addr(_RadioButton28+0)
MOVT	R0, #hi_addr(_RadioButton28+0)
BL	_DrawRadioButton+0
;ECGsynthetic_events_code.c,1270 :: 		DrawRadioButton(&RadioButton29);
MOVW	R0, #lo_addr(_RadioButton29+0)
MOVT	R0, #hi_addr(_RadioButton29+0)
BL	_DrawRadioButton+0
;ECGsynthetic_events_code.c,1271 :: 		DrawRadioButton(&RadioButton30);
MOVW	R0, #lo_addr(_RadioButton30+0)
MOVT	R0, #hi_addr(_RadioButton30+0)
BL	_DrawRadioButton+0
;ECGsynthetic_events_code.c,1272 :: 		DrawRadioButton(&RadioButton31);
MOVW	R0, #lo_addr(_RadioButton31+0)
MOVT	R0, #hi_addr(_RadioButton31+0)
BL	_DrawRadioButton+0
;ECGsynthetic_events_code.c,1273 :: 		DrawRadioButton(&RadioButton32);
MOVW	R0, #lo_addr(_RadioButton32+0)
MOVT	R0, #hi_addr(_RadioButton32+0)
BL	_DrawRadioButton+0
;ECGsynthetic_events_code.c,1274 :: 		DrawRadioButton(&RadioButton33);
MOVW	R0, #lo_addr(_RadioButton33+0)
MOVT	R0, #hi_addr(_RadioButton33+0)
BL	_DrawRadioButton+0
;ECGsynthetic_events_code.c,1275 :: 		DrawRadioButton(&RadioButton34);
MOVW	R0, #lo_addr(_RadioButton34+0)
MOVT	R0, #hi_addr(_RadioButton34+0)
BL	_DrawRadioButton+0
;ECGsynthetic_events_code.c,1276 :: 		DrawRadioButton(&RadioButton35);
MOVW	R0, #lo_addr(_RadioButton35+0)
MOVT	R0, #hi_addr(_RadioButton35+0)
BL	_DrawRadioButton+0
;ECGsynthetic_events_code.c,1277 :: 		DrawRadioButton(&RadioButton25);
MOVW	R0, #lo_addr(_RadioButton25+0)
MOVT	R0, #hi_addr(_RadioButton25+0)
BL	_DrawRadioButton+0
;ECGsynthetic_events_code.c,1278 :: 		}
L_end_RadioButton36OnPress:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _RadioButton36OnPress
_RadioButton37OnPress:
;ECGsynthetic_events_code.c,1282 :: 		void RadioButton37OnPress() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;ECGsynthetic_events_code.c,1283 :: 		septal1();
BL	_septal1+0
;ECGsynthetic_events_code.c,1284 :: 		applicationTaskDAC();
BL	_applicationTaskDAC+0
;ECGsynthetic_events_code.c,1285 :: 		RadioButton38.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton38+20)
MOVT	R0, #hi_addr(_RadioButton38+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,1286 :: 		RadioButton39.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton39+20)
MOVT	R0, #hi_addr(_RadioButton39+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,1287 :: 		RadioButton40.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton40+20)
MOVT	R0, #hi_addr(_RadioButton40+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,1288 :: 		RadioButton41.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton41+20)
MOVT	R0, #hi_addr(_RadioButton41+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,1289 :: 		RadioButton42.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton42+20)
MOVT	R0, #hi_addr(_RadioButton42+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,1290 :: 		RadioButton43.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton43+20)
MOVT	R0, #hi_addr(_RadioButton43+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,1291 :: 		RadioButton44.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton44+20)
MOVT	R0, #hi_addr(_RadioButton44+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,1292 :: 		RadioButton45.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton45+20)
MOVT	R0, #hi_addr(_RadioButton45+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,1293 :: 		RadioButton46.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton46+20)
MOVT	R0, #hi_addr(_RadioButton46+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,1294 :: 		RadioButton47.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton47+20)
MOVT	R0, #hi_addr(_RadioButton47+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,1295 :: 		RadioButton48.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton48+20)
MOVT	R0, #hi_addr(_RadioButton48+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,1296 :: 		DrawRadioButton(&RadioButton38);
MOVW	R0, #lo_addr(_RadioButton38+0)
MOVT	R0, #hi_addr(_RadioButton38+0)
BL	_DrawRadioButton+0
;ECGsynthetic_events_code.c,1297 :: 		DrawRadioButton(&RadioButton39);
MOVW	R0, #lo_addr(_RadioButton39+0)
MOVT	R0, #hi_addr(_RadioButton39+0)
BL	_DrawRadioButton+0
;ECGsynthetic_events_code.c,1298 :: 		DrawRadioButton(&RadioButton40);
MOVW	R0, #lo_addr(_RadioButton40+0)
MOVT	R0, #hi_addr(_RadioButton40+0)
BL	_DrawRadioButton+0
;ECGsynthetic_events_code.c,1299 :: 		DrawRadioButton(&RadioButton41);
MOVW	R0, #lo_addr(_RadioButton41+0)
MOVT	R0, #hi_addr(_RadioButton41+0)
BL	_DrawRadioButton+0
;ECGsynthetic_events_code.c,1300 :: 		DrawRadioButton(&RadioButton42);
MOVW	R0, #lo_addr(_RadioButton42+0)
MOVT	R0, #hi_addr(_RadioButton42+0)
BL	_DrawRadioButton+0
;ECGsynthetic_events_code.c,1301 :: 		DrawRadioButton(&RadioButton43);
MOVW	R0, #lo_addr(_RadioButton43+0)
MOVT	R0, #hi_addr(_RadioButton43+0)
BL	_DrawRadioButton+0
;ECGsynthetic_events_code.c,1302 :: 		DrawRadioButton(&RadioButton44);
MOVW	R0, #lo_addr(_RadioButton44+0)
MOVT	R0, #hi_addr(_RadioButton44+0)
BL	_DrawRadioButton+0
;ECGsynthetic_events_code.c,1303 :: 		DrawRadioButton(&RadioButton45);
MOVW	R0, #lo_addr(_RadioButton45+0)
MOVT	R0, #hi_addr(_RadioButton45+0)
BL	_DrawRadioButton+0
;ECGsynthetic_events_code.c,1304 :: 		DrawRadioButton(&RadioButton46);
MOVW	R0, #lo_addr(_RadioButton46+0)
MOVT	R0, #hi_addr(_RadioButton46+0)
BL	_DrawRadioButton+0
;ECGsynthetic_events_code.c,1305 :: 		DrawRadioButton(&RadioButton47);
MOVW	R0, #lo_addr(_RadioButton47+0)
MOVT	R0, #hi_addr(_RadioButton47+0)
BL	_DrawRadioButton+0
;ECGsynthetic_events_code.c,1306 :: 		DrawRadioButton(&RadioButton48);
MOVW	R0, #lo_addr(_RadioButton48+0)
MOVT	R0, #hi_addr(_RadioButton48+0)
BL	_DrawRadioButton+0
;ECGsynthetic_events_code.c,1307 :: 		}
L_end_RadioButton37OnPress:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _RadioButton37OnPress
_RadioButton38OnPress:
;ECGsynthetic_events_code.c,1309 :: 		void RadioButton38OnPress() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;ECGsynthetic_events_code.c,1310 :: 		septal2();
BL	_septal2+0
;ECGsynthetic_events_code.c,1311 :: 		applicationTaskDAC();
BL	_applicationTaskDAC+0
;ECGsynthetic_events_code.c,1312 :: 		RadioButton37.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton37+20)
MOVT	R0, #hi_addr(_RadioButton37+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,1313 :: 		RadioButton39.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton39+20)
MOVT	R0, #hi_addr(_RadioButton39+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,1314 :: 		RadioButton40.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton40+20)
MOVT	R0, #hi_addr(_RadioButton40+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,1315 :: 		RadioButton41.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton41+20)
MOVT	R0, #hi_addr(_RadioButton41+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,1316 :: 		RadioButton42.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton42+20)
MOVT	R0, #hi_addr(_RadioButton42+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,1317 :: 		RadioButton43.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton43+20)
MOVT	R0, #hi_addr(_RadioButton43+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,1318 :: 		RadioButton44.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton44+20)
MOVT	R0, #hi_addr(_RadioButton44+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,1319 :: 		RadioButton45.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton45+20)
MOVT	R0, #hi_addr(_RadioButton45+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,1320 :: 		RadioButton46.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton46+20)
MOVT	R0, #hi_addr(_RadioButton46+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,1321 :: 		RadioButton47.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton47+20)
MOVT	R0, #hi_addr(_RadioButton47+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,1322 :: 		RadioButton48.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton48+20)
MOVT	R0, #hi_addr(_RadioButton48+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,1323 :: 		DrawRadioButton(&RadioButton37);
MOVW	R0, #lo_addr(_RadioButton37+0)
MOVT	R0, #hi_addr(_RadioButton37+0)
BL	_DrawRadioButton+0
;ECGsynthetic_events_code.c,1324 :: 		DrawRadioButton(&RadioButton39);
MOVW	R0, #lo_addr(_RadioButton39+0)
MOVT	R0, #hi_addr(_RadioButton39+0)
BL	_DrawRadioButton+0
;ECGsynthetic_events_code.c,1325 :: 		DrawRadioButton(&RadioButton40);
MOVW	R0, #lo_addr(_RadioButton40+0)
MOVT	R0, #hi_addr(_RadioButton40+0)
BL	_DrawRadioButton+0
;ECGsynthetic_events_code.c,1326 :: 		DrawRadioButton(&RadioButton41);
MOVW	R0, #lo_addr(_RadioButton41+0)
MOVT	R0, #hi_addr(_RadioButton41+0)
BL	_DrawRadioButton+0
;ECGsynthetic_events_code.c,1327 :: 		DrawRadioButton(&RadioButton42);
MOVW	R0, #lo_addr(_RadioButton42+0)
MOVT	R0, #hi_addr(_RadioButton42+0)
BL	_DrawRadioButton+0
;ECGsynthetic_events_code.c,1328 :: 		DrawRadioButton(&RadioButton43);
MOVW	R0, #lo_addr(_RadioButton43+0)
MOVT	R0, #hi_addr(_RadioButton43+0)
BL	_DrawRadioButton+0
;ECGsynthetic_events_code.c,1329 :: 		DrawRadioButton(&RadioButton44);
MOVW	R0, #lo_addr(_RadioButton44+0)
MOVT	R0, #hi_addr(_RadioButton44+0)
BL	_DrawRadioButton+0
;ECGsynthetic_events_code.c,1330 :: 		DrawRadioButton(&RadioButton45);
MOVW	R0, #lo_addr(_RadioButton45+0)
MOVT	R0, #hi_addr(_RadioButton45+0)
BL	_DrawRadioButton+0
;ECGsynthetic_events_code.c,1331 :: 		DrawRadioButton(&RadioButton46);
MOVW	R0, #lo_addr(_RadioButton46+0)
MOVT	R0, #hi_addr(_RadioButton46+0)
BL	_DrawRadioButton+0
;ECGsynthetic_events_code.c,1332 :: 		DrawRadioButton(&RadioButton47);
MOVW	R0, #lo_addr(_RadioButton47+0)
MOVT	R0, #hi_addr(_RadioButton47+0)
BL	_DrawRadioButton+0
;ECGsynthetic_events_code.c,1333 :: 		DrawRadioButton(&RadioButton48);
MOVW	R0, #lo_addr(_RadioButton48+0)
MOVT	R0, #hi_addr(_RadioButton48+0)
BL	_DrawRadioButton+0
;ECGsynthetic_events_code.c,1335 :: 		}
L_end_RadioButton38OnPress:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _RadioButton38OnPress
_RadioButton39OnPress:
;ECGsynthetic_events_code.c,1337 :: 		void RadioButton39OnPress() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;ECGsynthetic_events_code.c,1338 :: 		septal3();
BL	_septal3+0
;ECGsynthetic_events_code.c,1339 :: 		applicationTaskDAC();
BL	_applicationTaskDAC+0
;ECGsynthetic_events_code.c,1340 :: 		RadioButton38.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton38+20)
MOVT	R0, #hi_addr(_RadioButton38+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,1341 :: 		RadioButton37.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton37+20)
MOVT	R0, #hi_addr(_RadioButton37+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,1342 :: 		RadioButton40.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton40+20)
MOVT	R0, #hi_addr(_RadioButton40+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,1343 :: 		RadioButton41.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton41+20)
MOVT	R0, #hi_addr(_RadioButton41+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,1344 :: 		RadioButton42.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton42+20)
MOVT	R0, #hi_addr(_RadioButton42+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,1345 :: 		RadioButton43.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton43+20)
MOVT	R0, #hi_addr(_RadioButton43+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,1346 :: 		RadioButton44.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton44+20)
MOVT	R0, #hi_addr(_RadioButton44+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,1347 :: 		RadioButton45.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton45+20)
MOVT	R0, #hi_addr(_RadioButton45+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,1348 :: 		RadioButton46.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton46+20)
MOVT	R0, #hi_addr(_RadioButton46+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,1349 :: 		RadioButton47.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton47+20)
MOVT	R0, #hi_addr(_RadioButton47+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,1350 :: 		RadioButton48.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton48+20)
MOVT	R0, #hi_addr(_RadioButton48+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,1351 :: 		DrawRadioButton(&RadioButton38);
MOVW	R0, #lo_addr(_RadioButton38+0)
MOVT	R0, #hi_addr(_RadioButton38+0)
BL	_DrawRadioButton+0
;ECGsynthetic_events_code.c,1352 :: 		DrawRadioButton(&RadioButton37);
MOVW	R0, #lo_addr(_RadioButton37+0)
MOVT	R0, #hi_addr(_RadioButton37+0)
BL	_DrawRadioButton+0
;ECGsynthetic_events_code.c,1353 :: 		DrawRadioButton(&RadioButton40);
MOVW	R0, #lo_addr(_RadioButton40+0)
MOVT	R0, #hi_addr(_RadioButton40+0)
BL	_DrawRadioButton+0
;ECGsynthetic_events_code.c,1354 :: 		DrawRadioButton(&RadioButton41);
MOVW	R0, #lo_addr(_RadioButton41+0)
MOVT	R0, #hi_addr(_RadioButton41+0)
BL	_DrawRadioButton+0
;ECGsynthetic_events_code.c,1355 :: 		DrawRadioButton(&RadioButton42);
MOVW	R0, #lo_addr(_RadioButton42+0)
MOVT	R0, #hi_addr(_RadioButton42+0)
BL	_DrawRadioButton+0
;ECGsynthetic_events_code.c,1356 :: 		DrawRadioButton(&RadioButton43);
MOVW	R0, #lo_addr(_RadioButton43+0)
MOVT	R0, #hi_addr(_RadioButton43+0)
BL	_DrawRadioButton+0
;ECGsynthetic_events_code.c,1357 :: 		DrawRadioButton(&RadioButton44);
MOVW	R0, #lo_addr(_RadioButton44+0)
MOVT	R0, #hi_addr(_RadioButton44+0)
BL	_DrawRadioButton+0
;ECGsynthetic_events_code.c,1358 :: 		DrawRadioButton(&RadioButton45);
MOVW	R0, #lo_addr(_RadioButton45+0)
MOVT	R0, #hi_addr(_RadioButton45+0)
BL	_DrawRadioButton+0
;ECGsynthetic_events_code.c,1359 :: 		DrawRadioButton(&RadioButton46);
MOVW	R0, #lo_addr(_RadioButton46+0)
MOVT	R0, #hi_addr(_RadioButton46+0)
BL	_DrawRadioButton+0
;ECGsynthetic_events_code.c,1360 :: 		DrawRadioButton(&RadioButton47);
MOVW	R0, #lo_addr(_RadioButton47+0)
MOVT	R0, #hi_addr(_RadioButton47+0)
BL	_DrawRadioButton+0
;ECGsynthetic_events_code.c,1361 :: 		DrawRadioButton(&RadioButton48);
MOVW	R0, #lo_addr(_RadioButton48+0)
MOVT	R0, #hi_addr(_RadioButton48+0)
BL	_DrawRadioButton+0
;ECGsynthetic_events_code.c,1362 :: 		}
L_end_RadioButton39OnPress:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _RadioButton39OnPress
_RadioButton40OnPress:
;ECGsynthetic_events_code.c,1364 :: 		void RadioButton40OnPress() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;ECGsynthetic_events_code.c,1365 :: 		septalavr();
BL	_septalaVR+0
;ECGsynthetic_events_code.c,1366 :: 		applicationTaskDAC();
BL	_applicationTaskDAC+0
;ECGsynthetic_events_code.c,1367 :: 		RadioButton38.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton38+20)
MOVT	R0, #hi_addr(_RadioButton38+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,1368 :: 		RadioButton39.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton39+20)
MOVT	R0, #hi_addr(_RadioButton39+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,1369 :: 		RadioButton37.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton37+20)
MOVT	R0, #hi_addr(_RadioButton37+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,1370 :: 		RadioButton41.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton41+20)
MOVT	R0, #hi_addr(_RadioButton41+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,1371 :: 		RadioButton42.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton42+20)
MOVT	R0, #hi_addr(_RadioButton42+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,1372 :: 		RadioButton43.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton43+20)
MOVT	R0, #hi_addr(_RadioButton43+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,1373 :: 		RadioButton44.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton44+20)
MOVT	R0, #hi_addr(_RadioButton44+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,1374 :: 		RadioButton45.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton45+20)
MOVT	R0, #hi_addr(_RadioButton45+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,1375 :: 		RadioButton46.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton46+20)
MOVT	R0, #hi_addr(_RadioButton46+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,1376 :: 		RadioButton47.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton47+20)
MOVT	R0, #hi_addr(_RadioButton47+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,1377 :: 		RadioButton48.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton48+20)
MOVT	R0, #hi_addr(_RadioButton48+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,1378 :: 		DrawRadioButton(&RadioButton38);
MOVW	R0, #lo_addr(_RadioButton38+0)
MOVT	R0, #hi_addr(_RadioButton38+0)
BL	_DrawRadioButton+0
;ECGsynthetic_events_code.c,1379 :: 		DrawRadioButton(&RadioButton39);
MOVW	R0, #lo_addr(_RadioButton39+0)
MOVT	R0, #hi_addr(_RadioButton39+0)
BL	_DrawRadioButton+0
;ECGsynthetic_events_code.c,1380 :: 		DrawRadioButton(&RadioButton37);
MOVW	R0, #lo_addr(_RadioButton37+0)
MOVT	R0, #hi_addr(_RadioButton37+0)
BL	_DrawRadioButton+0
;ECGsynthetic_events_code.c,1381 :: 		DrawRadioButton(&RadioButton41);
MOVW	R0, #lo_addr(_RadioButton41+0)
MOVT	R0, #hi_addr(_RadioButton41+0)
BL	_DrawRadioButton+0
;ECGsynthetic_events_code.c,1382 :: 		DrawRadioButton(&RadioButton42);
MOVW	R0, #lo_addr(_RadioButton42+0)
MOVT	R0, #hi_addr(_RadioButton42+0)
BL	_DrawRadioButton+0
;ECGsynthetic_events_code.c,1383 :: 		DrawRadioButton(&RadioButton43);
MOVW	R0, #lo_addr(_RadioButton43+0)
MOVT	R0, #hi_addr(_RadioButton43+0)
BL	_DrawRadioButton+0
;ECGsynthetic_events_code.c,1384 :: 		DrawRadioButton(&RadioButton44);
MOVW	R0, #lo_addr(_RadioButton44+0)
MOVT	R0, #hi_addr(_RadioButton44+0)
BL	_DrawRadioButton+0
;ECGsynthetic_events_code.c,1385 :: 		DrawRadioButton(&RadioButton45);
MOVW	R0, #lo_addr(_RadioButton45+0)
MOVT	R0, #hi_addr(_RadioButton45+0)
BL	_DrawRadioButton+0
;ECGsynthetic_events_code.c,1386 :: 		DrawRadioButton(&RadioButton46);
MOVW	R0, #lo_addr(_RadioButton46+0)
MOVT	R0, #hi_addr(_RadioButton46+0)
BL	_DrawRadioButton+0
;ECGsynthetic_events_code.c,1387 :: 		DrawRadioButton(&RadioButton47);
MOVW	R0, #lo_addr(_RadioButton47+0)
MOVT	R0, #hi_addr(_RadioButton47+0)
BL	_DrawRadioButton+0
;ECGsynthetic_events_code.c,1388 :: 		DrawRadioButton(&RadioButton48);
MOVW	R0, #lo_addr(_RadioButton48+0)
MOVT	R0, #hi_addr(_RadioButton48+0)
BL	_DrawRadioButton+0
;ECGsynthetic_events_code.c,1389 :: 		}
L_end_RadioButton40OnPress:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _RadioButton40OnPress
_RadioButton41OnPress:
;ECGsynthetic_events_code.c,1391 :: 		void RadioButton41OnPress() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;ECGsynthetic_events_code.c,1392 :: 		septalavl();
BL	_septalaVL+0
;ECGsynthetic_events_code.c,1393 :: 		applicationTaskDAC();
BL	_applicationTaskDAC+0
;ECGsynthetic_events_code.c,1394 :: 		RadioButton38.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton38+20)
MOVT	R0, #hi_addr(_RadioButton38+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,1395 :: 		RadioButton39.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton39+20)
MOVT	R0, #hi_addr(_RadioButton39+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,1396 :: 		RadioButton40.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton40+20)
MOVT	R0, #hi_addr(_RadioButton40+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,1397 :: 		RadioButton37.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton37+20)
MOVT	R0, #hi_addr(_RadioButton37+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,1398 :: 		RadioButton42.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton42+20)
MOVT	R0, #hi_addr(_RadioButton42+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,1399 :: 		RadioButton43.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton43+20)
MOVT	R0, #hi_addr(_RadioButton43+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,1400 :: 		RadioButton44.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton44+20)
MOVT	R0, #hi_addr(_RadioButton44+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,1401 :: 		RadioButton45.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton45+20)
MOVT	R0, #hi_addr(_RadioButton45+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,1402 :: 		RadioButton46.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton46+20)
MOVT	R0, #hi_addr(_RadioButton46+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,1403 :: 		RadioButton47.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton47+20)
MOVT	R0, #hi_addr(_RadioButton47+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,1404 :: 		RadioButton48.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton48+20)
MOVT	R0, #hi_addr(_RadioButton48+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,1405 :: 		DrawRadioButton(&RadioButton38);
MOVW	R0, #lo_addr(_RadioButton38+0)
MOVT	R0, #hi_addr(_RadioButton38+0)
BL	_DrawRadioButton+0
;ECGsynthetic_events_code.c,1406 :: 		DrawRadioButton(&RadioButton39);
MOVW	R0, #lo_addr(_RadioButton39+0)
MOVT	R0, #hi_addr(_RadioButton39+0)
BL	_DrawRadioButton+0
;ECGsynthetic_events_code.c,1407 :: 		DrawRadioButton(&RadioButton40);
MOVW	R0, #lo_addr(_RadioButton40+0)
MOVT	R0, #hi_addr(_RadioButton40+0)
BL	_DrawRadioButton+0
;ECGsynthetic_events_code.c,1408 :: 		DrawRadioButton(&RadioButton37);
MOVW	R0, #lo_addr(_RadioButton37+0)
MOVT	R0, #hi_addr(_RadioButton37+0)
BL	_DrawRadioButton+0
;ECGsynthetic_events_code.c,1409 :: 		DrawRadioButton(&RadioButton42);
MOVW	R0, #lo_addr(_RadioButton42+0)
MOVT	R0, #hi_addr(_RadioButton42+0)
BL	_DrawRadioButton+0
;ECGsynthetic_events_code.c,1410 :: 		DrawRadioButton(&RadioButton43);
MOVW	R0, #lo_addr(_RadioButton43+0)
MOVT	R0, #hi_addr(_RadioButton43+0)
BL	_DrawRadioButton+0
;ECGsynthetic_events_code.c,1411 :: 		DrawRadioButton(&RadioButton44);
MOVW	R0, #lo_addr(_RadioButton44+0)
MOVT	R0, #hi_addr(_RadioButton44+0)
BL	_DrawRadioButton+0
;ECGsynthetic_events_code.c,1412 :: 		DrawRadioButton(&RadioButton45);
MOVW	R0, #lo_addr(_RadioButton45+0)
MOVT	R0, #hi_addr(_RadioButton45+0)
BL	_DrawRadioButton+0
;ECGsynthetic_events_code.c,1413 :: 		DrawRadioButton(&RadioButton46);
MOVW	R0, #lo_addr(_RadioButton46+0)
MOVT	R0, #hi_addr(_RadioButton46+0)
BL	_DrawRadioButton+0
;ECGsynthetic_events_code.c,1414 :: 		DrawRadioButton(&RadioButton47);
MOVW	R0, #lo_addr(_RadioButton47+0)
MOVT	R0, #hi_addr(_RadioButton47+0)
BL	_DrawRadioButton+0
;ECGsynthetic_events_code.c,1415 :: 		DrawRadioButton(&RadioButton48);
MOVW	R0, #lo_addr(_RadioButton48+0)
MOVT	R0, #hi_addr(_RadioButton48+0)
BL	_DrawRadioButton+0
;ECGsynthetic_events_code.c,1416 :: 		}
L_end_RadioButton41OnPress:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _RadioButton41OnPress
_RadioButton42OnPress:
;ECGsynthetic_events_code.c,1418 :: 		void RadioButton42OnPress() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;ECGsynthetic_events_code.c,1419 :: 		septalavf();
BL	_septalaVF+0
;ECGsynthetic_events_code.c,1420 :: 		applicationTaskDAC();
BL	_applicationTaskDAC+0
;ECGsynthetic_events_code.c,1421 :: 		RadioButton38.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton38+20)
MOVT	R0, #hi_addr(_RadioButton38+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,1422 :: 		RadioButton39.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton39+20)
MOVT	R0, #hi_addr(_RadioButton39+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,1423 :: 		RadioButton40.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton40+20)
MOVT	R0, #hi_addr(_RadioButton40+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,1424 :: 		RadioButton41.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton41+20)
MOVT	R0, #hi_addr(_RadioButton41+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,1425 :: 		RadioButton37.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton37+20)
MOVT	R0, #hi_addr(_RadioButton37+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,1426 :: 		RadioButton43.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton43+20)
MOVT	R0, #hi_addr(_RadioButton43+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,1427 :: 		RadioButton44.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton44+20)
MOVT	R0, #hi_addr(_RadioButton44+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,1428 :: 		RadioButton45.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton45+20)
MOVT	R0, #hi_addr(_RadioButton45+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,1429 :: 		RadioButton46.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton46+20)
MOVT	R0, #hi_addr(_RadioButton46+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,1430 :: 		RadioButton47.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton47+20)
MOVT	R0, #hi_addr(_RadioButton47+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,1431 :: 		RadioButton48.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton48+20)
MOVT	R0, #hi_addr(_RadioButton48+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,1432 :: 		DrawRadioButton(&RadioButton38);
MOVW	R0, #lo_addr(_RadioButton38+0)
MOVT	R0, #hi_addr(_RadioButton38+0)
BL	_DrawRadioButton+0
;ECGsynthetic_events_code.c,1433 :: 		DrawRadioButton(&RadioButton39);
MOVW	R0, #lo_addr(_RadioButton39+0)
MOVT	R0, #hi_addr(_RadioButton39+0)
BL	_DrawRadioButton+0
;ECGsynthetic_events_code.c,1434 :: 		DrawRadioButton(&RadioButton40);
MOVW	R0, #lo_addr(_RadioButton40+0)
MOVT	R0, #hi_addr(_RadioButton40+0)
BL	_DrawRadioButton+0
;ECGsynthetic_events_code.c,1435 :: 		DrawRadioButton(&RadioButton41);
MOVW	R0, #lo_addr(_RadioButton41+0)
MOVT	R0, #hi_addr(_RadioButton41+0)
BL	_DrawRadioButton+0
;ECGsynthetic_events_code.c,1436 :: 		DrawRadioButton(&RadioButton37);
MOVW	R0, #lo_addr(_RadioButton37+0)
MOVT	R0, #hi_addr(_RadioButton37+0)
BL	_DrawRadioButton+0
;ECGsynthetic_events_code.c,1437 :: 		DrawRadioButton(&RadioButton43);
MOVW	R0, #lo_addr(_RadioButton43+0)
MOVT	R0, #hi_addr(_RadioButton43+0)
BL	_DrawRadioButton+0
;ECGsynthetic_events_code.c,1438 :: 		DrawRadioButton(&RadioButton44);
MOVW	R0, #lo_addr(_RadioButton44+0)
MOVT	R0, #hi_addr(_RadioButton44+0)
BL	_DrawRadioButton+0
;ECGsynthetic_events_code.c,1439 :: 		DrawRadioButton(&RadioButton45);
MOVW	R0, #lo_addr(_RadioButton45+0)
MOVT	R0, #hi_addr(_RadioButton45+0)
BL	_DrawRadioButton+0
;ECGsynthetic_events_code.c,1440 :: 		DrawRadioButton(&RadioButton46);
MOVW	R0, #lo_addr(_RadioButton46+0)
MOVT	R0, #hi_addr(_RadioButton46+0)
BL	_DrawRadioButton+0
;ECGsynthetic_events_code.c,1441 :: 		DrawRadioButton(&RadioButton47);
MOVW	R0, #lo_addr(_RadioButton47+0)
MOVT	R0, #hi_addr(_RadioButton47+0)
BL	_DrawRadioButton+0
;ECGsynthetic_events_code.c,1442 :: 		DrawRadioButton(&RadioButton48);
MOVW	R0, #lo_addr(_RadioButton48+0)
MOVT	R0, #hi_addr(_RadioButton48+0)
BL	_DrawRadioButton+0
;ECGsynthetic_events_code.c,1443 :: 		}
L_end_RadioButton42OnPress:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _RadioButton42OnPress
_RadioButton43OnPress:
;ECGsynthetic_events_code.c,1445 :: 		void RadioButton43OnPress() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;ECGsynthetic_events_code.c,1446 :: 		septalv1();
BL	_septalV1+0
;ECGsynthetic_events_code.c,1447 :: 		applicationTaskDAC();
BL	_applicationTaskDAC+0
;ECGsynthetic_events_code.c,1448 :: 		RadioButton38.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton38+20)
MOVT	R0, #hi_addr(_RadioButton38+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,1449 :: 		RadioButton39.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton39+20)
MOVT	R0, #hi_addr(_RadioButton39+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,1450 :: 		RadioButton40.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton40+20)
MOVT	R0, #hi_addr(_RadioButton40+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,1451 :: 		RadioButton41.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton41+20)
MOVT	R0, #hi_addr(_RadioButton41+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,1452 :: 		RadioButton42.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton42+20)
MOVT	R0, #hi_addr(_RadioButton42+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,1453 :: 		RadioButton37.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton37+20)
MOVT	R0, #hi_addr(_RadioButton37+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,1454 :: 		RadioButton44.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton44+20)
MOVT	R0, #hi_addr(_RadioButton44+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,1455 :: 		RadioButton45.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton45+20)
MOVT	R0, #hi_addr(_RadioButton45+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,1456 :: 		RadioButton46.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton46+20)
MOVT	R0, #hi_addr(_RadioButton46+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,1457 :: 		RadioButton47.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton47+20)
MOVT	R0, #hi_addr(_RadioButton47+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,1458 :: 		RadioButton48.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton48+20)
MOVT	R0, #hi_addr(_RadioButton48+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,1459 :: 		DrawRadioButton(&RadioButton38);
MOVW	R0, #lo_addr(_RadioButton38+0)
MOVT	R0, #hi_addr(_RadioButton38+0)
BL	_DrawRadioButton+0
;ECGsynthetic_events_code.c,1460 :: 		DrawRadioButton(&RadioButton39);
MOVW	R0, #lo_addr(_RadioButton39+0)
MOVT	R0, #hi_addr(_RadioButton39+0)
BL	_DrawRadioButton+0
;ECGsynthetic_events_code.c,1461 :: 		DrawRadioButton(&RadioButton40);
MOVW	R0, #lo_addr(_RadioButton40+0)
MOVT	R0, #hi_addr(_RadioButton40+0)
BL	_DrawRadioButton+0
;ECGsynthetic_events_code.c,1462 :: 		DrawRadioButton(&RadioButton41);
MOVW	R0, #lo_addr(_RadioButton41+0)
MOVT	R0, #hi_addr(_RadioButton41+0)
BL	_DrawRadioButton+0
;ECGsynthetic_events_code.c,1463 :: 		DrawRadioButton(&RadioButton42);
MOVW	R0, #lo_addr(_RadioButton42+0)
MOVT	R0, #hi_addr(_RadioButton42+0)
BL	_DrawRadioButton+0
;ECGsynthetic_events_code.c,1464 :: 		DrawRadioButton(&RadioButton37);
MOVW	R0, #lo_addr(_RadioButton37+0)
MOVT	R0, #hi_addr(_RadioButton37+0)
BL	_DrawRadioButton+0
;ECGsynthetic_events_code.c,1465 :: 		DrawRadioButton(&RadioButton44);
MOVW	R0, #lo_addr(_RadioButton44+0)
MOVT	R0, #hi_addr(_RadioButton44+0)
BL	_DrawRadioButton+0
;ECGsynthetic_events_code.c,1466 :: 		DrawRadioButton(&RadioButton45);
MOVW	R0, #lo_addr(_RadioButton45+0)
MOVT	R0, #hi_addr(_RadioButton45+0)
BL	_DrawRadioButton+0
;ECGsynthetic_events_code.c,1467 :: 		DrawRadioButton(&RadioButton46);
MOVW	R0, #lo_addr(_RadioButton46+0)
MOVT	R0, #hi_addr(_RadioButton46+0)
BL	_DrawRadioButton+0
;ECGsynthetic_events_code.c,1468 :: 		DrawRadioButton(&RadioButton47);
MOVW	R0, #lo_addr(_RadioButton47+0)
MOVT	R0, #hi_addr(_RadioButton47+0)
BL	_DrawRadioButton+0
;ECGsynthetic_events_code.c,1469 :: 		DrawRadioButton(&RadioButton48);
MOVW	R0, #lo_addr(_RadioButton48+0)
MOVT	R0, #hi_addr(_RadioButton48+0)
BL	_DrawRadioButton+0
;ECGsynthetic_events_code.c,1470 :: 		}
L_end_RadioButton43OnPress:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _RadioButton43OnPress
_RadioButton44OnPress:
;ECGsynthetic_events_code.c,1472 :: 		void RadioButton44OnPress() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;ECGsynthetic_events_code.c,1473 :: 		septalv2();
BL	_septalV2+0
;ECGsynthetic_events_code.c,1474 :: 		applicationTaskDAC();
BL	_applicationTaskDAC+0
;ECGsynthetic_events_code.c,1475 :: 		RadioButton38.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton38+20)
MOVT	R0, #hi_addr(_RadioButton38+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,1476 :: 		RadioButton39.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton39+20)
MOVT	R0, #hi_addr(_RadioButton39+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,1477 :: 		RadioButton40.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton40+20)
MOVT	R0, #hi_addr(_RadioButton40+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,1478 :: 		RadioButton41.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton41+20)
MOVT	R0, #hi_addr(_RadioButton41+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,1479 :: 		RadioButton42.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton42+20)
MOVT	R0, #hi_addr(_RadioButton42+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,1480 :: 		RadioButton43.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton43+20)
MOVT	R0, #hi_addr(_RadioButton43+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,1481 :: 		RadioButton37.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton37+20)
MOVT	R0, #hi_addr(_RadioButton37+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,1482 :: 		RadioButton45.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton45+20)
MOVT	R0, #hi_addr(_RadioButton45+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,1483 :: 		RadioButton46.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton46+20)
MOVT	R0, #hi_addr(_RadioButton46+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,1484 :: 		RadioButton47.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton47+20)
MOVT	R0, #hi_addr(_RadioButton47+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,1485 :: 		RadioButton48.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton48+20)
MOVT	R0, #hi_addr(_RadioButton48+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,1486 :: 		DrawRadioButton(&RadioButton38);
MOVW	R0, #lo_addr(_RadioButton38+0)
MOVT	R0, #hi_addr(_RadioButton38+0)
BL	_DrawRadioButton+0
;ECGsynthetic_events_code.c,1487 :: 		DrawRadioButton(&RadioButton39);
MOVW	R0, #lo_addr(_RadioButton39+0)
MOVT	R0, #hi_addr(_RadioButton39+0)
BL	_DrawRadioButton+0
;ECGsynthetic_events_code.c,1488 :: 		DrawRadioButton(&RadioButton40);
MOVW	R0, #lo_addr(_RadioButton40+0)
MOVT	R0, #hi_addr(_RadioButton40+0)
BL	_DrawRadioButton+0
;ECGsynthetic_events_code.c,1489 :: 		DrawRadioButton(&RadioButton41);
MOVW	R0, #lo_addr(_RadioButton41+0)
MOVT	R0, #hi_addr(_RadioButton41+0)
BL	_DrawRadioButton+0
;ECGsynthetic_events_code.c,1490 :: 		DrawRadioButton(&RadioButton42);
MOVW	R0, #lo_addr(_RadioButton42+0)
MOVT	R0, #hi_addr(_RadioButton42+0)
BL	_DrawRadioButton+0
;ECGsynthetic_events_code.c,1491 :: 		DrawRadioButton(&RadioButton43);
MOVW	R0, #lo_addr(_RadioButton43+0)
MOVT	R0, #hi_addr(_RadioButton43+0)
BL	_DrawRadioButton+0
;ECGsynthetic_events_code.c,1492 :: 		DrawRadioButton(&RadioButton37);
MOVW	R0, #lo_addr(_RadioButton37+0)
MOVT	R0, #hi_addr(_RadioButton37+0)
BL	_DrawRadioButton+0
;ECGsynthetic_events_code.c,1493 :: 		DrawRadioButton(&RadioButton45);
MOVW	R0, #lo_addr(_RadioButton45+0)
MOVT	R0, #hi_addr(_RadioButton45+0)
BL	_DrawRadioButton+0
;ECGsynthetic_events_code.c,1494 :: 		DrawRadioButton(&RadioButton46);
MOVW	R0, #lo_addr(_RadioButton46+0)
MOVT	R0, #hi_addr(_RadioButton46+0)
BL	_DrawRadioButton+0
;ECGsynthetic_events_code.c,1495 :: 		DrawRadioButton(&RadioButton47);
MOVW	R0, #lo_addr(_RadioButton47+0)
MOVT	R0, #hi_addr(_RadioButton47+0)
BL	_DrawRadioButton+0
;ECGsynthetic_events_code.c,1496 :: 		DrawRadioButton(&RadioButton48);
MOVW	R0, #lo_addr(_RadioButton48+0)
MOVT	R0, #hi_addr(_RadioButton48+0)
BL	_DrawRadioButton+0
;ECGsynthetic_events_code.c,1497 :: 		}
L_end_RadioButton44OnPress:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _RadioButton44OnPress
_RadioButton45OnPress:
;ECGsynthetic_events_code.c,1499 :: 		void RadioButton45OnPress() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;ECGsynthetic_events_code.c,1500 :: 		septalv3();
BL	_septalV3+0
;ECGsynthetic_events_code.c,1501 :: 		applicationTaskDAC();
BL	_applicationTaskDAC+0
;ECGsynthetic_events_code.c,1502 :: 		RadioButton38.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton38+20)
MOVT	R0, #hi_addr(_RadioButton38+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,1503 :: 		RadioButton39.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton39+20)
MOVT	R0, #hi_addr(_RadioButton39+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,1504 :: 		RadioButton40.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton40+20)
MOVT	R0, #hi_addr(_RadioButton40+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,1505 :: 		RadioButton41.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton41+20)
MOVT	R0, #hi_addr(_RadioButton41+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,1506 :: 		RadioButton42.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton42+20)
MOVT	R0, #hi_addr(_RadioButton42+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,1507 :: 		RadioButton43.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton43+20)
MOVT	R0, #hi_addr(_RadioButton43+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,1508 :: 		RadioButton44.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton44+20)
MOVT	R0, #hi_addr(_RadioButton44+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,1509 :: 		RadioButton37.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton37+20)
MOVT	R0, #hi_addr(_RadioButton37+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,1510 :: 		RadioButton46.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton46+20)
MOVT	R0, #hi_addr(_RadioButton46+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,1511 :: 		RadioButton47.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton47+20)
MOVT	R0, #hi_addr(_RadioButton47+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,1512 :: 		RadioButton48.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton48+20)
MOVT	R0, #hi_addr(_RadioButton48+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,1513 :: 		DrawRadioButton(&RadioButton38);
MOVW	R0, #lo_addr(_RadioButton38+0)
MOVT	R0, #hi_addr(_RadioButton38+0)
BL	_DrawRadioButton+0
;ECGsynthetic_events_code.c,1514 :: 		DrawRadioButton(&RadioButton39);
MOVW	R0, #lo_addr(_RadioButton39+0)
MOVT	R0, #hi_addr(_RadioButton39+0)
BL	_DrawRadioButton+0
;ECGsynthetic_events_code.c,1515 :: 		DrawRadioButton(&RadioButton40);
MOVW	R0, #lo_addr(_RadioButton40+0)
MOVT	R0, #hi_addr(_RadioButton40+0)
BL	_DrawRadioButton+0
;ECGsynthetic_events_code.c,1516 :: 		DrawRadioButton(&RadioButton41);
MOVW	R0, #lo_addr(_RadioButton41+0)
MOVT	R0, #hi_addr(_RadioButton41+0)
BL	_DrawRadioButton+0
;ECGsynthetic_events_code.c,1517 :: 		DrawRadioButton(&RadioButton42);
MOVW	R0, #lo_addr(_RadioButton42+0)
MOVT	R0, #hi_addr(_RadioButton42+0)
BL	_DrawRadioButton+0
;ECGsynthetic_events_code.c,1518 :: 		DrawRadioButton(&RadioButton43);
MOVW	R0, #lo_addr(_RadioButton43+0)
MOVT	R0, #hi_addr(_RadioButton43+0)
BL	_DrawRadioButton+0
;ECGsynthetic_events_code.c,1519 :: 		DrawRadioButton(&RadioButton44);
MOVW	R0, #lo_addr(_RadioButton44+0)
MOVT	R0, #hi_addr(_RadioButton44+0)
BL	_DrawRadioButton+0
;ECGsynthetic_events_code.c,1520 :: 		DrawRadioButton(&RadioButton37);
MOVW	R0, #lo_addr(_RadioButton37+0)
MOVT	R0, #hi_addr(_RadioButton37+0)
BL	_DrawRadioButton+0
;ECGsynthetic_events_code.c,1521 :: 		DrawRadioButton(&RadioButton46);
MOVW	R0, #lo_addr(_RadioButton46+0)
MOVT	R0, #hi_addr(_RadioButton46+0)
BL	_DrawRadioButton+0
;ECGsynthetic_events_code.c,1522 :: 		DrawRadioButton(&RadioButton47);
MOVW	R0, #lo_addr(_RadioButton47+0)
MOVT	R0, #hi_addr(_RadioButton47+0)
BL	_DrawRadioButton+0
;ECGsynthetic_events_code.c,1523 :: 		DrawRadioButton(&RadioButton48);
MOVW	R0, #lo_addr(_RadioButton48+0)
MOVT	R0, #hi_addr(_RadioButton48+0)
BL	_DrawRadioButton+0
;ECGsynthetic_events_code.c,1524 :: 		}
L_end_RadioButton45OnPress:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _RadioButton45OnPress
_RadioButton46OnPress:
;ECGsynthetic_events_code.c,1526 :: 		void RadioButton46OnPress() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;ECGsynthetic_events_code.c,1527 :: 		septalv4();
BL	_septalV4+0
;ECGsynthetic_events_code.c,1528 :: 		applicationTaskDAC();
BL	_applicationTaskDAC+0
;ECGsynthetic_events_code.c,1529 :: 		RadioButton38.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton38+20)
MOVT	R0, #hi_addr(_RadioButton38+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,1530 :: 		RadioButton39.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton39+20)
MOVT	R0, #hi_addr(_RadioButton39+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,1531 :: 		RadioButton40.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton40+20)
MOVT	R0, #hi_addr(_RadioButton40+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,1532 :: 		RadioButton41.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton41+20)
MOVT	R0, #hi_addr(_RadioButton41+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,1533 :: 		RadioButton42.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton42+20)
MOVT	R0, #hi_addr(_RadioButton42+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,1534 :: 		RadioButton43.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton43+20)
MOVT	R0, #hi_addr(_RadioButton43+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,1535 :: 		RadioButton44.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton44+20)
MOVT	R0, #hi_addr(_RadioButton44+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,1536 :: 		RadioButton45.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton45+20)
MOVT	R0, #hi_addr(_RadioButton45+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,1537 :: 		RadioButton37.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton37+20)
MOVT	R0, #hi_addr(_RadioButton37+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,1538 :: 		RadioButton47.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton47+20)
MOVT	R0, #hi_addr(_RadioButton47+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,1539 :: 		RadioButton48.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton48+20)
MOVT	R0, #hi_addr(_RadioButton48+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,1540 :: 		DrawRadioButton(&RadioButton38);
MOVW	R0, #lo_addr(_RadioButton38+0)
MOVT	R0, #hi_addr(_RadioButton38+0)
BL	_DrawRadioButton+0
;ECGsynthetic_events_code.c,1541 :: 		DrawRadioButton(&RadioButton39);
MOVW	R0, #lo_addr(_RadioButton39+0)
MOVT	R0, #hi_addr(_RadioButton39+0)
BL	_DrawRadioButton+0
;ECGsynthetic_events_code.c,1542 :: 		DrawRadioButton(&RadioButton40);
MOVW	R0, #lo_addr(_RadioButton40+0)
MOVT	R0, #hi_addr(_RadioButton40+0)
BL	_DrawRadioButton+0
;ECGsynthetic_events_code.c,1543 :: 		DrawRadioButton(&RadioButton41);
MOVW	R0, #lo_addr(_RadioButton41+0)
MOVT	R0, #hi_addr(_RadioButton41+0)
BL	_DrawRadioButton+0
;ECGsynthetic_events_code.c,1544 :: 		DrawRadioButton(&RadioButton42);
MOVW	R0, #lo_addr(_RadioButton42+0)
MOVT	R0, #hi_addr(_RadioButton42+0)
BL	_DrawRadioButton+0
;ECGsynthetic_events_code.c,1545 :: 		DrawRadioButton(&RadioButton43);
MOVW	R0, #lo_addr(_RadioButton43+0)
MOVT	R0, #hi_addr(_RadioButton43+0)
BL	_DrawRadioButton+0
;ECGsynthetic_events_code.c,1546 :: 		DrawRadioButton(&RadioButton44);
MOVW	R0, #lo_addr(_RadioButton44+0)
MOVT	R0, #hi_addr(_RadioButton44+0)
BL	_DrawRadioButton+0
;ECGsynthetic_events_code.c,1547 :: 		DrawRadioButton(&RadioButton45);
MOVW	R0, #lo_addr(_RadioButton45+0)
MOVT	R0, #hi_addr(_RadioButton45+0)
BL	_DrawRadioButton+0
;ECGsynthetic_events_code.c,1548 :: 		DrawRadioButton(&RadioButton37);
MOVW	R0, #lo_addr(_RadioButton37+0)
MOVT	R0, #hi_addr(_RadioButton37+0)
BL	_DrawRadioButton+0
;ECGsynthetic_events_code.c,1549 :: 		DrawRadioButton(&RadioButton47);
MOVW	R0, #lo_addr(_RadioButton47+0)
MOVT	R0, #hi_addr(_RadioButton47+0)
BL	_DrawRadioButton+0
;ECGsynthetic_events_code.c,1550 :: 		DrawRadioButton(&RadioButton48);
MOVW	R0, #lo_addr(_RadioButton48+0)
MOVT	R0, #hi_addr(_RadioButton48+0)
BL	_DrawRadioButton+0
;ECGsynthetic_events_code.c,1551 :: 		}
L_end_RadioButton46OnPress:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _RadioButton46OnPress
_RadioButton47OnPress:
;ECGsynthetic_events_code.c,1553 :: 		void RadioButton47OnPress() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;ECGsynthetic_events_code.c,1554 :: 		septalv5();
BL	_septalV5+0
;ECGsynthetic_events_code.c,1555 :: 		applicationTaskDAC();
BL	_applicationTaskDAC+0
;ECGsynthetic_events_code.c,1556 :: 		RadioButton38.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton38+20)
MOVT	R0, #hi_addr(_RadioButton38+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,1557 :: 		RadioButton39.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton39+20)
MOVT	R0, #hi_addr(_RadioButton39+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,1558 :: 		RadioButton40.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton40+20)
MOVT	R0, #hi_addr(_RadioButton40+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,1559 :: 		RadioButton41.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton41+20)
MOVT	R0, #hi_addr(_RadioButton41+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,1560 :: 		RadioButton42.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton42+20)
MOVT	R0, #hi_addr(_RadioButton42+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,1561 :: 		RadioButton43.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton43+20)
MOVT	R0, #hi_addr(_RadioButton43+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,1562 :: 		RadioButton44.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton44+20)
MOVT	R0, #hi_addr(_RadioButton44+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,1563 :: 		RadioButton45.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton45+20)
MOVT	R0, #hi_addr(_RadioButton45+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,1564 :: 		RadioButton46.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton46+20)
MOVT	R0, #hi_addr(_RadioButton46+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,1565 :: 		RadioButton37.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton37+20)
MOVT	R0, #hi_addr(_RadioButton37+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,1566 :: 		RadioButton48.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton48+20)
MOVT	R0, #hi_addr(_RadioButton48+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,1567 :: 		DrawRadioButton(&RadioButton38);
MOVW	R0, #lo_addr(_RadioButton38+0)
MOVT	R0, #hi_addr(_RadioButton38+0)
BL	_DrawRadioButton+0
;ECGsynthetic_events_code.c,1568 :: 		DrawRadioButton(&RadioButton39);
MOVW	R0, #lo_addr(_RadioButton39+0)
MOVT	R0, #hi_addr(_RadioButton39+0)
BL	_DrawRadioButton+0
;ECGsynthetic_events_code.c,1569 :: 		DrawRadioButton(&RadioButton40);
MOVW	R0, #lo_addr(_RadioButton40+0)
MOVT	R0, #hi_addr(_RadioButton40+0)
BL	_DrawRadioButton+0
;ECGsynthetic_events_code.c,1570 :: 		DrawRadioButton(&RadioButton41);
MOVW	R0, #lo_addr(_RadioButton41+0)
MOVT	R0, #hi_addr(_RadioButton41+0)
BL	_DrawRadioButton+0
;ECGsynthetic_events_code.c,1571 :: 		DrawRadioButton(&RadioButton42);
MOVW	R0, #lo_addr(_RadioButton42+0)
MOVT	R0, #hi_addr(_RadioButton42+0)
BL	_DrawRadioButton+0
;ECGsynthetic_events_code.c,1572 :: 		DrawRadioButton(&RadioButton43);
MOVW	R0, #lo_addr(_RadioButton43+0)
MOVT	R0, #hi_addr(_RadioButton43+0)
BL	_DrawRadioButton+0
;ECGsynthetic_events_code.c,1573 :: 		DrawRadioButton(&RadioButton44);
MOVW	R0, #lo_addr(_RadioButton44+0)
MOVT	R0, #hi_addr(_RadioButton44+0)
BL	_DrawRadioButton+0
;ECGsynthetic_events_code.c,1574 :: 		DrawRadioButton(&RadioButton45);
MOVW	R0, #lo_addr(_RadioButton45+0)
MOVT	R0, #hi_addr(_RadioButton45+0)
BL	_DrawRadioButton+0
;ECGsynthetic_events_code.c,1575 :: 		DrawRadioButton(&RadioButton46);
MOVW	R0, #lo_addr(_RadioButton46+0)
MOVT	R0, #hi_addr(_RadioButton46+0)
BL	_DrawRadioButton+0
;ECGsynthetic_events_code.c,1576 :: 		DrawRadioButton(&RadioButton37);
MOVW	R0, #lo_addr(_RadioButton37+0)
MOVT	R0, #hi_addr(_RadioButton37+0)
BL	_DrawRadioButton+0
;ECGsynthetic_events_code.c,1577 :: 		DrawRadioButton(&RadioButton48);
MOVW	R0, #lo_addr(_RadioButton48+0)
MOVT	R0, #hi_addr(_RadioButton48+0)
BL	_DrawRadioButton+0
;ECGsynthetic_events_code.c,1578 :: 		}
L_end_RadioButton47OnPress:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _RadioButton47OnPress
_RadioButton48OnPress:
;ECGsynthetic_events_code.c,1580 :: 		void RadioButton48OnPress() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;ECGsynthetic_events_code.c,1581 :: 		septalv6();
BL	_septalV6+0
;ECGsynthetic_events_code.c,1582 :: 		applicationTaskDAC();
BL	_applicationTaskDAC+0
;ECGsynthetic_events_code.c,1583 :: 		RadioButton38.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton38+20)
MOVT	R0, #hi_addr(_RadioButton38+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,1584 :: 		RadioButton39.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton39+20)
MOVT	R0, #hi_addr(_RadioButton39+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,1585 :: 		RadioButton40.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton40+20)
MOVT	R0, #hi_addr(_RadioButton40+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,1586 :: 		RadioButton41.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton41+20)
MOVT	R0, #hi_addr(_RadioButton41+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,1587 :: 		RadioButton42.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton42+20)
MOVT	R0, #hi_addr(_RadioButton42+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,1588 :: 		RadioButton43.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton43+20)
MOVT	R0, #hi_addr(_RadioButton43+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,1589 :: 		RadioButton44.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton44+20)
MOVT	R0, #hi_addr(_RadioButton44+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,1590 :: 		RadioButton45.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton45+20)
MOVT	R0, #hi_addr(_RadioButton45+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,1591 :: 		RadioButton46.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton46+20)
MOVT	R0, #hi_addr(_RadioButton46+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,1592 :: 		RadioButton47.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton47+20)
MOVT	R0, #hi_addr(_RadioButton47+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,1593 :: 		RadioButton37.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton37+20)
MOVT	R0, #hi_addr(_RadioButton37+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,1594 :: 		DrawRadioButton(&RadioButton38);
MOVW	R0, #lo_addr(_RadioButton38+0)
MOVT	R0, #hi_addr(_RadioButton38+0)
BL	_DrawRadioButton+0
;ECGsynthetic_events_code.c,1595 :: 		DrawRadioButton(&RadioButton39);
MOVW	R0, #lo_addr(_RadioButton39+0)
MOVT	R0, #hi_addr(_RadioButton39+0)
BL	_DrawRadioButton+0
;ECGsynthetic_events_code.c,1596 :: 		DrawRadioButton(&RadioButton40);
MOVW	R0, #lo_addr(_RadioButton40+0)
MOVT	R0, #hi_addr(_RadioButton40+0)
BL	_DrawRadioButton+0
;ECGsynthetic_events_code.c,1597 :: 		DrawRadioButton(&RadioButton41);
MOVW	R0, #lo_addr(_RadioButton41+0)
MOVT	R0, #hi_addr(_RadioButton41+0)
BL	_DrawRadioButton+0
;ECGsynthetic_events_code.c,1598 :: 		DrawRadioButton(&RadioButton42);
MOVW	R0, #lo_addr(_RadioButton42+0)
MOVT	R0, #hi_addr(_RadioButton42+0)
BL	_DrawRadioButton+0
;ECGsynthetic_events_code.c,1599 :: 		DrawRadioButton(&RadioButton43);
MOVW	R0, #lo_addr(_RadioButton43+0)
MOVT	R0, #hi_addr(_RadioButton43+0)
BL	_DrawRadioButton+0
;ECGsynthetic_events_code.c,1600 :: 		DrawRadioButton(&RadioButton44);
MOVW	R0, #lo_addr(_RadioButton44+0)
MOVT	R0, #hi_addr(_RadioButton44+0)
BL	_DrawRadioButton+0
;ECGsynthetic_events_code.c,1601 :: 		DrawRadioButton(&RadioButton45);
MOVW	R0, #lo_addr(_RadioButton45+0)
MOVT	R0, #hi_addr(_RadioButton45+0)
BL	_DrawRadioButton+0
;ECGsynthetic_events_code.c,1602 :: 		DrawRadioButton(&RadioButton46);
MOVW	R0, #lo_addr(_RadioButton46+0)
MOVT	R0, #hi_addr(_RadioButton46+0)
BL	_DrawRadioButton+0
;ECGsynthetic_events_code.c,1603 :: 		DrawRadioButton(&RadioButton47);
MOVW	R0, #lo_addr(_RadioButton47+0)
MOVT	R0, #hi_addr(_RadioButton47+0)
BL	_DrawRadioButton+0
;ECGsynthetic_events_code.c,1604 :: 		DrawRadioButton(&RadioButton37);
MOVW	R0, #lo_addr(_RadioButton37+0)
MOVT	R0, #hi_addr(_RadioButton37+0)
BL	_DrawRadioButton+0
;ECGsynthetic_events_code.c,1605 :: 		}
L_end_RadioButton48OnPress:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _RadioButton48OnPress
_RadioButton49OnPress:
;ECGsynthetic_events_code.c,1608 :: 		void RadioButton49OnPress() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;ECGsynthetic_events_code.c,1609 :: 		lateral1();
BL	_lateral1+0
;ECGsynthetic_events_code.c,1610 :: 		applicationTaskDAC();
BL	_applicationTaskDAC+0
;ECGsynthetic_events_code.c,1611 :: 		RadioButton50.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton50+20)
MOVT	R0, #hi_addr(_RadioButton50+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,1612 :: 		RadioButton51.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton51+20)
MOVT	R0, #hi_addr(_RadioButton51+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,1613 :: 		RadioButton52.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton52+20)
MOVT	R0, #hi_addr(_RadioButton52+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,1614 :: 		RadioButton53.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton53+20)
MOVT	R0, #hi_addr(_RadioButton53+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,1615 :: 		RadioButton54.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton54+20)
MOVT	R0, #hi_addr(_RadioButton54+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,1616 :: 		RadioButton55.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton55+20)
MOVT	R0, #hi_addr(_RadioButton55+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,1617 :: 		RadioButton56.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton56+20)
MOVT	R0, #hi_addr(_RadioButton56+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,1618 :: 		RadioButton57.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton57+20)
MOVT	R0, #hi_addr(_RadioButton57+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,1619 :: 		RadioButton58.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton58+20)
MOVT	R0, #hi_addr(_RadioButton58+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,1620 :: 		RadioButton59.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton59+20)
MOVT	R0, #hi_addr(_RadioButton59+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,1621 :: 		RadioButton60.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton60+20)
MOVT	R0, #hi_addr(_RadioButton60+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,1622 :: 		DrawRadioButton(&RadioButton50);
MOVW	R0, #lo_addr(_RadioButton50+0)
MOVT	R0, #hi_addr(_RadioButton50+0)
BL	_DrawRadioButton+0
;ECGsynthetic_events_code.c,1623 :: 		DrawRadioButton(&RadioButton51);
MOVW	R0, #lo_addr(_RadioButton51+0)
MOVT	R0, #hi_addr(_RadioButton51+0)
BL	_DrawRadioButton+0
;ECGsynthetic_events_code.c,1624 :: 		DrawRadioButton(&RadioButton52);
MOVW	R0, #lo_addr(_RadioButton52+0)
MOVT	R0, #hi_addr(_RadioButton52+0)
BL	_DrawRadioButton+0
;ECGsynthetic_events_code.c,1625 :: 		DrawRadioButton(&RadioButton53);
MOVW	R0, #lo_addr(_RadioButton53+0)
MOVT	R0, #hi_addr(_RadioButton53+0)
BL	_DrawRadioButton+0
;ECGsynthetic_events_code.c,1626 :: 		DrawRadioButton(&RadioButton54);
MOVW	R0, #lo_addr(_RadioButton54+0)
MOVT	R0, #hi_addr(_RadioButton54+0)
BL	_DrawRadioButton+0
;ECGsynthetic_events_code.c,1627 :: 		DrawRadioButton(&RadioButton55);
MOVW	R0, #lo_addr(_RadioButton55+0)
MOVT	R0, #hi_addr(_RadioButton55+0)
BL	_DrawRadioButton+0
;ECGsynthetic_events_code.c,1628 :: 		DrawRadioButton(&RadioButton56);
MOVW	R0, #lo_addr(_RadioButton56+0)
MOVT	R0, #hi_addr(_RadioButton56+0)
BL	_DrawRadioButton+0
;ECGsynthetic_events_code.c,1629 :: 		DrawRadioButton(&RadioButton57);
MOVW	R0, #lo_addr(_RadioButton57+0)
MOVT	R0, #hi_addr(_RadioButton57+0)
BL	_DrawRadioButton+0
;ECGsynthetic_events_code.c,1630 :: 		DrawRadioButton(&RadioButton58);
MOVW	R0, #lo_addr(_RadioButton58+0)
MOVT	R0, #hi_addr(_RadioButton58+0)
BL	_DrawRadioButton+0
;ECGsynthetic_events_code.c,1631 :: 		DrawRadioButton(&RadioButton59);
MOVW	R0, #lo_addr(_RadioButton59+0)
MOVT	R0, #hi_addr(_RadioButton59+0)
BL	_DrawRadioButton+0
;ECGsynthetic_events_code.c,1632 :: 		DrawRadioButton(&RadioButton60);
MOVW	R0, #lo_addr(_RadioButton60+0)
MOVT	R0, #hi_addr(_RadioButton60+0)
BL	_DrawRadioButton+0
;ECGsynthetic_events_code.c,1633 :: 		}
L_end_RadioButton49OnPress:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _RadioButton49OnPress
_RadioButton50OnPress:
;ECGsynthetic_events_code.c,1635 :: 		void RadioButton50OnPress() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;ECGsynthetic_events_code.c,1636 :: 		lateral2();
BL	_lateral2+0
;ECGsynthetic_events_code.c,1637 :: 		applicationTaskDAC();
BL	_applicationTaskDAC+0
;ECGsynthetic_events_code.c,1638 :: 		RadioButton49.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton49+20)
MOVT	R0, #hi_addr(_RadioButton49+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,1639 :: 		RadioButton51.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton51+20)
MOVT	R0, #hi_addr(_RadioButton51+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,1640 :: 		RadioButton52.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton52+20)
MOVT	R0, #hi_addr(_RadioButton52+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,1641 :: 		RadioButton53.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton53+20)
MOVT	R0, #hi_addr(_RadioButton53+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,1642 :: 		RadioButton54.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton54+20)
MOVT	R0, #hi_addr(_RadioButton54+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,1643 :: 		RadioButton55.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton55+20)
MOVT	R0, #hi_addr(_RadioButton55+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,1644 :: 		RadioButton56.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton56+20)
MOVT	R0, #hi_addr(_RadioButton56+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,1645 :: 		RadioButton57.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton57+20)
MOVT	R0, #hi_addr(_RadioButton57+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,1646 :: 		RadioButton58.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton58+20)
MOVT	R0, #hi_addr(_RadioButton58+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,1647 :: 		RadioButton59.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton59+20)
MOVT	R0, #hi_addr(_RadioButton59+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,1648 :: 		RadioButton60.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton60+20)
MOVT	R0, #hi_addr(_RadioButton60+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,1649 :: 		DrawRadioButton(&RadioButton49);
MOVW	R0, #lo_addr(_RadioButton49+0)
MOVT	R0, #hi_addr(_RadioButton49+0)
BL	_DrawRadioButton+0
;ECGsynthetic_events_code.c,1650 :: 		DrawRadioButton(&RadioButton51);
MOVW	R0, #lo_addr(_RadioButton51+0)
MOVT	R0, #hi_addr(_RadioButton51+0)
BL	_DrawRadioButton+0
;ECGsynthetic_events_code.c,1651 :: 		DrawRadioButton(&RadioButton52);
MOVW	R0, #lo_addr(_RadioButton52+0)
MOVT	R0, #hi_addr(_RadioButton52+0)
BL	_DrawRadioButton+0
;ECGsynthetic_events_code.c,1652 :: 		DrawRadioButton(&RadioButton53);
MOVW	R0, #lo_addr(_RadioButton53+0)
MOVT	R0, #hi_addr(_RadioButton53+0)
BL	_DrawRadioButton+0
;ECGsynthetic_events_code.c,1653 :: 		DrawRadioButton(&RadioButton54);
MOVW	R0, #lo_addr(_RadioButton54+0)
MOVT	R0, #hi_addr(_RadioButton54+0)
BL	_DrawRadioButton+0
;ECGsynthetic_events_code.c,1654 :: 		DrawRadioButton(&RadioButton55);
MOVW	R0, #lo_addr(_RadioButton55+0)
MOVT	R0, #hi_addr(_RadioButton55+0)
BL	_DrawRadioButton+0
;ECGsynthetic_events_code.c,1655 :: 		DrawRadioButton(&RadioButton56);
MOVW	R0, #lo_addr(_RadioButton56+0)
MOVT	R0, #hi_addr(_RadioButton56+0)
BL	_DrawRadioButton+0
;ECGsynthetic_events_code.c,1656 :: 		DrawRadioButton(&RadioButton57);
MOVW	R0, #lo_addr(_RadioButton57+0)
MOVT	R0, #hi_addr(_RadioButton57+0)
BL	_DrawRadioButton+0
;ECGsynthetic_events_code.c,1657 :: 		DrawRadioButton(&RadioButton58);
MOVW	R0, #lo_addr(_RadioButton58+0)
MOVT	R0, #hi_addr(_RadioButton58+0)
BL	_DrawRadioButton+0
;ECGsynthetic_events_code.c,1658 :: 		DrawRadioButton(&RadioButton59);
MOVW	R0, #lo_addr(_RadioButton59+0)
MOVT	R0, #hi_addr(_RadioButton59+0)
BL	_DrawRadioButton+0
;ECGsynthetic_events_code.c,1659 :: 		DrawRadioButton(&RadioButton60);
MOVW	R0, #lo_addr(_RadioButton60+0)
MOVT	R0, #hi_addr(_RadioButton60+0)
BL	_DrawRadioButton+0
;ECGsynthetic_events_code.c,1660 :: 		}
L_end_RadioButton50OnPress:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _RadioButton50OnPress
_RadioButton51OnPress:
;ECGsynthetic_events_code.c,1661 :: 		void RadioButton51OnPress() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;ECGsynthetic_events_code.c,1662 :: 		lateral3();
BL	_lateral3+0
;ECGsynthetic_events_code.c,1663 :: 		applicationTaskDAC();
BL	_applicationTaskDAC+0
;ECGsynthetic_events_code.c,1664 :: 		RadioButton50.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton50+20)
MOVT	R0, #hi_addr(_RadioButton50+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,1665 :: 		RadioButton49.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton49+20)
MOVT	R0, #hi_addr(_RadioButton49+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,1666 :: 		RadioButton52.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton52+20)
MOVT	R0, #hi_addr(_RadioButton52+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,1667 :: 		RadioButton53.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton53+20)
MOVT	R0, #hi_addr(_RadioButton53+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,1668 :: 		RadioButton54.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton54+20)
MOVT	R0, #hi_addr(_RadioButton54+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,1669 :: 		RadioButton55.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton55+20)
MOVT	R0, #hi_addr(_RadioButton55+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,1670 :: 		RadioButton56.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton56+20)
MOVT	R0, #hi_addr(_RadioButton56+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,1671 :: 		RadioButton57.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton57+20)
MOVT	R0, #hi_addr(_RadioButton57+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,1672 :: 		RadioButton58.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton58+20)
MOVT	R0, #hi_addr(_RadioButton58+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,1673 :: 		RadioButton59.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton59+20)
MOVT	R0, #hi_addr(_RadioButton59+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,1674 :: 		RadioButton60.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton60+20)
MOVT	R0, #hi_addr(_RadioButton60+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,1675 :: 		DrawRadioButton(&RadioButton50);
MOVW	R0, #lo_addr(_RadioButton50+0)
MOVT	R0, #hi_addr(_RadioButton50+0)
BL	_DrawRadioButton+0
;ECGsynthetic_events_code.c,1676 :: 		DrawRadioButton(&RadioButton49);
MOVW	R0, #lo_addr(_RadioButton49+0)
MOVT	R0, #hi_addr(_RadioButton49+0)
BL	_DrawRadioButton+0
;ECGsynthetic_events_code.c,1677 :: 		DrawRadioButton(&RadioButton52);
MOVW	R0, #lo_addr(_RadioButton52+0)
MOVT	R0, #hi_addr(_RadioButton52+0)
BL	_DrawRadioButton+0
;ECGsynthetic_events_code.c,1678 :: 		DrawRadioButton(&RadioButton53);
MOVW	R0, #lo_addr(_RadioButton53+0)
MOVT	R0, #hi_addr(_RadioButton53+0)
BL	_DrawRadioButton+0
;ECGsynthetic_events_code.c,1679 :: 		DrawRadioButton(&RadioButton54);
MOVW	R0, #lo_addr(_RadioButton54+0)
MOVT	R0, #hi_addr(_RadioButton54+0)
BL	_DrawRadioButton+0
;ECGsynthetic_events_code.c,1680 :: 		DrawRadioButton(&RadioButton55);
MOVW	R0, #lo_addr(_RadioButton55+0)
MOVT	R0, #hi_addr(_RadioButton55+0)
BL	_DrawRadioButton+0
;ECGsynthetic_events_code.c,1681 :: 		DrawRadioButton(&RadioButton56);
MOVW	R0, #lo_addr(_RadioButton56+0)
MOVT	R0, #hi_addr(_RadioButton56+0)
BL	_DrawRadioButton+0
;ECGsynthetic_events_code.c,1682 :: 		DrawRadioButton(&RadioButton57);
MOVW	R0, #lo_addr(_RadioButton57+0)
MOVT	R0, #hi_addr(_RadioButton57+0)
BL	_DrawRadioButton+0
;ECGsynthetic_events_code.c,1683 :: 		DrawRadioButton(&RadioButton58);
MOVW	R0, #lo_addr(_RadioButton58+0)
MOVT	R0, #hi_addr(_RadioButton58+0)
BL	_DrawRadioButton+0
;ECGsynthetic_events_code.c,1684 :: 		DrawRadioButton(&RadioButton59);
MOVW	R0, #lo_addr(_RadioButton59+0)
MOVT	R0, #hi_addr(_RadioButton59+0)
BL	_DrawRadioButton+0
;ECGsynthetic_events_code.c,1685 :: 		DrawRadioButton(&RadioButton60);
MOVW	R0, #lo_addr(_RadioButton60+0)
MOVT	R0, #hi_addr(_RadioButton60+0)
BL	_DrawRadioButton+0
;ECGsynthetic_events_code.c,1686 :: 		}
L_end_RadioButton51OnPress:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _RadioButton51OnPress
_RadioButton52OnPress:
;ECGsynthetic_events_code.c,1688 :: 		void RadioButton52OnPress() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;ECGsynthetic_events_code.c,1689 :: 		lateralavr();
BL	_lateralaVR+0
;ECGsynthetic_events_code.c,1690 :: 		applicationTaskDAC();
BL	_applicationTaskDAC+0
;ECGsynthetic_events_code.c,1691 :: 		RadioButton50.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton50+20)
MOVT	R0, #hi_addr(_RadioButton50+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,1692 :: 		RadioButton51.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton51+20)
MOVT	R0, #hi_addr(_RadioButton51+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,1693 :: 		RadioButton49.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton49+20)
MOVT	R0, #hi_addr(_RadioButton49+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,1694 :: 		RadioButton53.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton53+20)
MOVT	R0, #hi_addr(_RadioButton53+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,1695 :: 		RadioButton54.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton54+20)
MOVT	R0, #hi_addr(_RadioButton54+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,1696 :: 		RadioButton55.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton55+20)
MOVT	R0, #hi_addr(_RadioButton55+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,1697 :: 		RadioButton56.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton56+20)
MOVT	R0, #hi_addr(_RadioButton56+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,1698 :: 		RadioButton57.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton57+20)
MOVT	R0, #hi_addr(_RadioButton57+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,1699 :: 		RadioButton58.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton58+20)
MOVT	R0, #hi_addr(_RadioButton58+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,1700 :: 		RadioButton59.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton59+20)
MOVT	R0, #hi_addr(_RadioButton59+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,1701 :: 		RadioButton60.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton60+20)
MOVT	R0, #hi_addr(_RadioButton60+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,1702 :: 		DrawRadioButton(&RadioButton50);
MOVW	R0, #lo_addr(_RadioButton50+0)
MOVT	R0, #hi_addr(_RadioButton50+0)
BL	_DrawRadioButton+0
;ECGsynthetic_events_code.c,1703 :: 		DrawRadioButton(&RadioButton51);
MOVW	R0, #lo_addr(_RadioButton51+0)
MOVT	R0, #hi_addr(_RadioButton51+0)
BL	_DrawRadioButton+0
;ECGsynthetic_events_code.c,1704 :: 		DrawRadioButton(&RadioButton49);
MOVW	R0, #lo_addr(_RadioButton49+0)
MOVT	R0, #hi_addr(_RadioButton49+0)
BL	_DrawRadioButton+0
;ECGsynthetic_events_code.c,1705 :: 		DrawRadioButton(&RadioButton53);
MOVW	R0, #lo_addr(_RadioButton53+0)
MOVT	R0, #hi_addr(_RadioButton53+0)
BL	_DrawRadioButton+0
;ECGsynthetic_events_code.c,1706 :: 		DrawRadioButton(&RadioButton54);
MOVW	R0, #lo_addr(_RadioButton54+0)
MOVT	R0, #hi_addr(_RadioButton54+0)
BL	_DrawRadioButton+0
;ECGsynthetic_events_code.c,1707 :: 		DrawRadioButton(&RadioButton55);
MOVW	R0, #lo_addr(_RadioButton55+0)
MOVT	R0, #hi_addr(_RadioButton55+0)
BL	_DrawRadioButton+0
;ECGsynthetic_events_code.c,1708 :: 		DrawRadioButton(&RadioButton56);
MOVW	R0, #lo_addr(_RadioButton56+0)
MOVT	R0, #hi_addr(_RadioButton56+0)
BL	_DrawRadioButton+0
;ECGsynthetic_events_code.c,1709 :: 		DrawRadioButton(&RadioButton57);
MOVW	R0, #lo_addr(_RadioButton57+0)
MOVT	R0, #hi_addr(_RadioButton57+0)
BL	_DrawRadioButton+0
;ECGsynthetic_events_code.c,1710 :: 		DrawRadioButton(&RadioButton58);
MOVW	R0, #lo_addr(_RadioButton58+0)
MOVT	R0, #hi_addr(_RadioButton58+0)
BL	_DrawRadioButton+0
;ECGsynthetic_events_code.c,1711 :: 		DrawRadioButton(&RadioButton59);
MOVW	R0, #lo_addr(_RadioButton59+0)
MOVT	R0, #hi_addr(_RadioButton59+0)
BL	_DrawRadioButton+0
;ECGsynthetic_events_code.c,1712 :: 		DrawRadioButton(&RadioButton60);
MOVW	R0, #lo_addr(_RadioButton60+0)
MOVT	R0, #hi_addr(_RadioButton60+0)
BL	_DrawRadioButton+0
;ECGsynthetic_events_code.c,1713 :: 		}
L_end_RadioButton52OnPress:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _RadioButton52OnPress
_RadioButton53OnPress:
;ECGsynthetic_events_code.c,1715 :: 		void RadioButton53OnPress() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;ECGsynthetic_events_code.c,1716 :: 		lateralavl();
BL	_lateralaVL+0
;ECGsynthetic_events_code.c,1717 :: 		applicationTaskDAC();
BL	_applicationTaskDAC+0
;ECGsynthetic_events_code.c,1718 :: 		RadioButton50.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton50+20)
MOVT	R0, #hi_addr(_RadioButton50+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,1719 :: 		RadioButton51.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton51+20)
MOVT	R0, #hi_addr(_RadioButton51+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,1720 :: 		RadioButton52.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton52+20)
MOVT	R0, #hi_addr(_RadioButton52+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,1721 :: 		RadioButton49.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton49+20)
MOVT	R0, #hi_addr(_RadioButton49+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,1722 :: 		RadioButton54.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton54+20)
MOVT	R0, #hi_addr(_RadioButton54+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,1723 :: 		RadioButton55.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton55+20)
MOVT	R0, #hi_addr(_RadioButton55+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,1724 :: 		RadioButton56.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton56+20)
MOVT	R0, #hi_addr(_RadioButton56+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,1725 :: 		RadioButton57.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton57+20)
MOVT	R0, #hi_addr(_RadioButton57+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,1726 :: 		RadioButton58.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton58+20)
MOVT	R0, #hi_addr(_RadioButton58+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,1727 :: 		RadioButton59.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton59+20)
MOVT	R0, #hi_addr(_RadioButton59+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,1728 :: 		RadioButton60.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton60+20)
MOVT	R0, #hi_addr(_RadioButton60+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,1729 :: 		DrawRadioButton(&RadioButton50);
MOVW	R0, #lo_addr(_RadioButton50+0)
MOVT	R0, #hi_addr(_RadioButton50+0)
BL	_DrawRadioButton+0
;ECGsynthetic_events_code.c,1730 :: 		DrawRadioButton(&RadioButton51);
MOVW	R0, #lo_addr(_RadioButton51+0)
MOVT	R0, #hi_addr(_RadioButton51+0)
BL	_DrawRadioButton+0
;ECGsynthetic_events_code.c,1731 :: 		DrawRadioButton(&RadioButton52);
MOVW	R0, #lo_addr(_RadioButton52+0)
MOVT	R0, #hi_addr(_RadioButton52+0)
BL	_DrawRadioButton+0
;ECGsynthetic_events_code.c,1732 :: 		DrawRadioButton(&RadioButton49);
MOVW	R0, #lo_addr(_RadioButton49+0)
MOVT	R0, #hi_addr(_RadioButton49+0)
BL	_DrawRadioButton+0
;ECGsynthetic_events_code.c,1733 :: 		DrawRadioButton(&RadioButton54);
MOVW	R0, #lo_addr(_RadioButton54+0)
MOVT	R0, #hi_addr(_RadioButton54+0)
BL	_DrawRadioButton+0
;ECGsynthetic_events_code.c,1734 :: 		DrawRadioButton(&RadioButton55);
MOVW	R0, #lo_addr(_RadioButton55+0)
MOVT	R0, #hi_addr(_RadioButton55+0)
BL	_DrawRadioButton+0
;ECGsynthetic_events_code.c,1735 :: 		DrawRadioButton(&RadioButton56);
MOVW	R0, #lo_addr(_RadioButton56+0)
MOVT	R0, #hi_addr(_RadioButton56+0)
BL	_DrawRadioButton+0
;ECGsynthetic_events_code.c,1736 :: 		DrawRadioButton(&RadioButton57);
MOVW	R0, #lo_addr(_RadioButton57+0)
MOVT	R0, #hi_addr(_RadioButton57+0)
BL	_DrawRadioButton+0
;ECGsynthetic_events_code.c,1737 :: 		DrawRadioButton(&RadioButton58);
MOVW	R0, #lo_addr(_RadioButton58+0)
MOVT	R0, #hi_addr(_RadioButton58+0)
BL	_DrawRadioButton+0
;ECGsynthetic_events_code.c,1738 :: 		DrawRadioButton(&RadioButton59);
MOVW	R0, #lo_addr(_RadioButton59+0)
MOVT	R0, #hi_addr(_RadioButton59+0)
BL	_DrawRadioButton+0
;ECGsynthetic_events_code.c,1739 :: 		DrawRadioButton(&RadioButton60);
MOVW	R0, #lo_addr(_RadioButton60+0)
MOVT	R0, #hi_addr(_RadioButton60+0)
BL	_DrawRadioButton+0
;ECGsynthetic_events_code.c,1740 :: 		}
L_end_RadioButton53OnPress:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _RadioButton53OnPress
_RadioButton54OnPress:
;ECGsynthetic_events_code.c,1742 :: 		void RadioButton54OnPress() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;ECGsynthetic_events_code.c,1743 :: 		lateralavf();
BL	_lateralaVF+0
;ECGsynthetic_events_code.c,1744 :: 		applicationTaskDAC();
BL	_applicationTaskDAC+0
;ECGsynthetic_events_code.c,1745 :: 		RadioButton50.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton50+20)
MOVT	R0, #hi_addr(_RadioButton50+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,1746 :: 		RadioButton51.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton51+20)
MOVT	R0, #hi_addr(_RadioButton51+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,1747 :: 		RadioButton52.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton52+20)
MOVT	R0, #hi_addr(_RadioButton52+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,1748 :: 		RadioButton53.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton53+20)
MOVT	R0, #hi_addr(_RadioButton53+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,1749 :: 		RadioButton49.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton49+20)
MOVT	R0, #hi_addr(_RadioButton49+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,1750 :: 		RadioButton55.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton55+20)
MOVT	R0, #hi_addr(_RadioButton55+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,1751 :: 		RadioButton56.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton56+20)
MOVT	R0, #hi_addr(_RadioButton56+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,1752 :: 		RadioButton57.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton57+20)
MOVT	R0, #hi_addr(_RadioButton57+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,1753 :: 		RadioButton58.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton58+20)
MOVT	R0, #hi_addr(_RadioButton58+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,1754 :: 		RadioButton59.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton59+20)
MOVT	R0, #hi_addr(_RadioButton59+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,1755 :: 		RadioButton60.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton60+20)
MOVT	R0, #hi_addr(_RadioButton60+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,1756 :: 		DrawRadioButton(&RadioButton50);
MOVW	R0, #lo_addr(_RadioButton50+0)
MOVT	R0, #hi_addr(_RadioButton50+0)
BL	_DrawRadioButton+0
;ECGsynthetic_events_code.c,1757 :: 		DrawRadioButton(&RadioButton51);
MOVW	R0, #lo_addr(_RadioButton51+0)
MOVT	R0, #hi_addr(_RadioButton51+0)
BL	_DrawRadioButton+0
;ECGsynthetic_events_code.c,1758 :: 		DrawRadioButton(&RadioButton52);
MOVW	R0, #lo_addr(_RadioButton52+0)
MOVT	R0, #hi_addr(_RadioButton52+0)
BL	_DrawRadioButton+0
;ECGsynthetic_events_code.c,1759 :: 		DrawRadioButton(&RadioButton53);
MOVW	R0, #lo_addr(_RadioButton53+0)
MOVT	R0, #hi_addr(_RadioButton53+0)
BL	_DrawRadioButton+0
;ECGsynthetic_events_code.c,1760 :: 		DrawRadioButton(&RadioButton49);
MOVW	R0, #lo_addr(_RadioButton49+0)
MOVT	R0, #hi_addr(_RadioButton49+0)
BL	_DrawRadioButton+0
;ECGsynthetic_events_code.c,1761 :: 		DrawRadioButton(&RadioButton55);
MOVW	R0, #lo_addr(_RadioButton55+0)
MOVT	R0, #hi_addr(_RadioButton55+0)
BL	_DrawRadioButton+0
;ECGsynthetic_events_code.c,1762 :: 		DrawRadioButton(&RadioButton56);
MOVW	R0, #lo_addr(_RadioButton56+0)
MOVT	R0, #hi_addr(_RadioButton56+0)
BL	_DrawRadioButton+0
;ECGsynthetic_events_code.c,1763 :: 		DrawRadioButton(&RadioButton57);
MOVW	R0, #lo_addr(_RadioButton57+0)
MOVT	R0, #hi_addr(_RadioButton57+0)
BL	_DrawRadioButton+0
;ECGsynthetic_events_code.c,1764 :: 		DrawRadioButton(&RadioButton58);
MOVW	R0, #lo_addr(_RadioButton58+0)
MOVT	R0, #hi_addr(_RadioButton58+0)
BL	_DrawRadioButton+0
;ECGsynthetic_events_code.c,1765 :: 		DrawRadioButton(&RadioButton59);
MOVW	R0, #lo_addr(_RadioButton59+0)
MOVT	R0, #hi_addr(_RadioButton59+0)
BL	_DrawRadioButton+0
;ECGsynthetic_events_code.c,1766 :: 		DrawRadioButton(&RadioButton60);
MOVW	R0, #lo_addr(_RadioButton60+0)
MOVT	R0, #hi_addr(_RadioButton60+0)
BL	_DrawRadioButton+0
;ECGsynthetic_events_code.c,1767 :: 		}
L_end_RadioButton54OnPress:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _RadioButton54OnPress
_RadioButton55OnPress:
;ECGsynthetic_events_code.c,1769 :: 		void RadioButton55OnPress() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;ECGsynthetic_events_code.c,1770 :: 		lateralv1();
BL	_lateralV1+0
;ECGsynthetic_events_code.c,1771 :: 		applicationTaskDAC();
BL	_applicationTaskDAC+0
;ECGsynthetic_events_code.c,1772 :: 		RadioButton50.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton50+20)
MOVT	R0, #hi_addr(_RadioButton50+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,1773 :: 		RadioButton51.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton51+20)
MOVT	R0, #hi_addr(_RadioButton51+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,1774 :: 		RadioButton52.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton52+20)
MOVT	R0, #hi_addr(_RadioButton52+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,1775 :: 		RadioButton53.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton53+20)
MOVT	R0, #hi_addr(_RadioButton53+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,1776 :: 		RadioButton54.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton54+20)
MOVT	R0, #hi_addr(_RadioButton54+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,1777 :: 		RadioButton49.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton49+20)
MOVT	R0, #hi_addr(_RadioButton49+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,1778 :: 		RadioButton56.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton56+20)
MOVT	R0, #hi_addr(_RadioButton56+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,1779 :: 		RadioButton57.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton57+20)
MOVT	R0, #hi_addr(_RadioButton57+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,1780 :: 		RadioButton58.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton58+20)
MOVT	R0, #hi_addr(_RadioButton58+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,1781 :: 		RadioButton59.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton59+20)
MOVT	R0, #hi_addr(_RadioButton59+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,1782 :: 		RadioButton60.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton60+20)
MOVT	R0, #hi_addr(_RadioButton60+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,1783 :: 		DrawRadioButton(&RadioButton50);
MOVW	R0, #lo_addr(_RadioButton50+0)
MOVT	R0, #hi_addr(_RadioButton50+0)
BL	_DrawRadioButton+0
;ECGsynthetic_events_code.c,1784 :: 		DrawRadioButton(&RadioButton51);
MOVW	R0, #lo_addr(_RadioButton51+0)
MOVT	R0, #hi_addr(_RadioButton51+0)
BL	_DrawRadioButton+0
;ECGsynthetic_events_code.c,1785 :: 		DrawRadioButton(&RadioButton52);
MOVW	R0, #lo_addr(_RadioButton52+0)
MOVT	R0, #hi_addr(_RadioButton52+0)
BL	_DrawRadioButton+0
;ECGsynthetic_events_code.c,1786 :: 		DrawRadioButton(&RadioButton53);
MOVW	R0, #lo_addr(_RadioButton53+0)
MOVT	R0, #hi_addr(_RadioButton53+0)
BL	_DrawRadioButton+0
;ECGsynthetic_events_code.c,1787 :: 		DrawRadioButton(&RadioButton54);
MOVW	R0, #lo_addr(_RadioButton54+0)
MOVT	R0, #hi_addr(_RadioButton54+0)
BL	_DrawRadioButton+0
;ECGsynthetic_events_code.c,1788 :: 		DrawRadioButton(&RadioButton49);
MOVW	R0, #lo_addr(_RadioButton49+0)
MOVT	R0, #hi_addr(_RadioButton49+0)
BL	_DrawRadioButton+0
;ECGsynthetic_events_code.c,1789 :: 		DrawRadioButton(&RadioButton56);
MOVW	R0, #lo_addr(_RadioButton56+0)
MOVT	R0, #hi_addr(_RadioButton56+0)
BL	_DrawRadioButton+0
;ECGsynthetic_events_code.c,1790 :: 		DrawRadioButton(&RadioButton57);
MOVW	R0, #lo_addr(_RadioButton57+0)
MOVT	R0, #hi_addr(_RadioButton57+0)
BL	_DrawRadioButton+0
;ECGsynthetic_events_code.c,1791 :: 		DrawRadioButton(&RadioButton58);
MOVW	R0, #lo_addr(_RadioButton58+0)
MOVT	R0, #hi_addr(_RadioButton58+0)
BL	_DrawRadioButton+0
;ECGsynthetic_events_code.c,1792 :: 		DrawRadioButton(&RadioButton59);
MOVW	R0, #lo_addr(_RadioButton59+0)
MOVT	R0, #hi_addr(_RadioButton59+0)
BL	_DrawRadioButton+0
;ECGsynthetic_events_code.c,1793 :: 		DrawRadioButton(&RadioButton60);
MOVW	R0, #lo_addr(_RadioButton60+0)
MOVT	R0, #hi_addr(_RadioButton60+0)
BL	_DrawRadioButton+0
;ECGsynthetic_events_code.c,1794 :: 		}
L_end_RadioButton55OnPress:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _RadioButton55OnPress
_RadioButton56OnPress:
;ECGsynthetic_events_code.c,1796 :: 		void RadioButton56OnPress() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;ECGsynthetic_events_code.c,1797 :: 		lateralv2();
BL	_lateralV2+0
;ECGsynthetic_events_code.c,1798 :: 		applicationTaskDAC();
BL	_applicationTaskDAC+0
;ECGsynthetic_events_code.c,1799 :: 		RadioButton50.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton50+20)
MOVT	R0, #hi_addr(_RadioButton50+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,1800 :: 		RadioButton51.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton51+20)
MOVT	R0, #hi_addr(_RadioButton51+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,1801 :: 		RadioButton52.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton52+20)
MOVT	R0, #hi_addr(_RadioButton52+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,1802 :: 		RadioButton53.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton53+20)
MOVT	R0, #hi_addr(_RadioButton53+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,1803 :: 		RadioButton54.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton54+20)
MOVT	R0, #hi_addr(_RadioButton54+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,1804 :: 		RadioButton55.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton55+20)
MOVT	R0, #hi_addr(_RadioButton55+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,1805 :: 		RadioButton49.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton49+20)
MOVT	R0, #hi_addr(_RadioButton49+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,1806 :: 		RadioButton57.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton57+20)
MOVT	R0, #hi_addr(_RadioButton57+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,1807 :: 		RadioButton58.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton58+20)
MOVT	R0, #hi_addr(_RadioButton58+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,1808 :: 		RadioButton59.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton59+20)
MOVT	R0, #hi_addr(_RadioButton59+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,1809 :: 		RadioButton60.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton60+20)
MOVT	R0, #hi_addr(_RadioButton60+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,1810 :: 		DrawRadioButton(&RadioButton50);
MOVW	R0, #lo_addr(_RadioButton50+0)
MOVT	R0, #hi_addr(_RadioButton50+0)
BL	_DrawRadioButton+0
;ECGsynthetic_events_code.c,1811 :: 		DrawRadioButton(&RadioButton51);
MOVW	R0, #lo_addr(_RadioButton51+0)
MOVT	R0, #hi_addr(_RadioButton51+0)
BL	_DrawRadioButton+0
;ECGsynthetic_events_code.c,1812 :: 		DrawRadioButton(&RadioButton52);
MOVW	R0, #lo_addr(_RadioButton52+0)
MOVT	R0, #hi_addr(_RadioButton52+0)
BL	_DrawRadioButton+0
;ECGsynthetic_events_code.c,1813 :: 		DrawRadioButton(&RadioButton53);
MOVW	R0, #lo_addr(_RadioButton53+0)
MOVT	R0, #hi_addr(_RadioButton53+0)
BL	_DrawRadioButton+0
;ECGsynthetic_events_code.c,1814 :: 		DrawRadioButton(&RadioButton54);
MOVW	R0, #lo_addr(_RadioButton54+0)
MOVT	R0, #hi_addr(_RadioButton54+0)
BL	_DrawRadioButton+0
;ECGsynthetic_events_code.c,1815 :: 		DrawRadioButton(&RadioButton55);
MOVW	R0, #lo_addr(_RadioButton55+0)
MOVT	R0, #hi_addr(_RadioButton55+0)
BL	_DrawRadioButton+0
;ECGsynthetic_events_code.c,1816 :: 		DrawRadioButton(&RadioButton49);
MOVW	R0, #lo_addr(_RadioButton49+0)
MOVT	R0, #hi_addr(_RadioButton49+0)
BL	_DrawRadioButton+0
;ECGsynthetic_events_code.c,1817 :: 		DrawRadioButton(&RadioButton57);
MOVW	R0, #lo_addr(_RadioButton57+0)
MOVT	R0, #hi_addr(_RadioButton57+0)
BL	_DrawRadioButton+0
;ECGsynthetic_events_code.c,1818 :: 		DrawRadioButton(&RadioButton58);
MOVW	R0, #lo_addr(_RadioButton58+0)
MOVT	R0, #hi_addr(_RadioButton58+0)
BL	_DrawRadioButton+0
;ECGsynthetic_events_code.c,1819 :: 		DrawRadioButton(&RadioButton59);
MOVW	R0, #lo_addr(_RadioButton59+0)
MOVT	R0, #hi_addr(_RadioButton59+0)
BL	_DrawRadioButton+0
;ECGsynthetic_events_code.c,1820 :: 		DrawRadioButton(&RadioButton60);
MOVW	R0, #lo_addr(_RadioButton60+0)
MOVT	R0, #hi_addr(_RadioButton60+0)
BL	_DrawRadioButton+0
;ECGsynthetic_events_code.c,1821 :: 		}
L_end_RadioButton56OnPress:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _RadioButton56OnPress
_RadioButton57OnPress:
;ECGsynthetic_events_code.c,1823 :: 		void RadioButton57OnPress() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;ECGsynthetic_events_code.c,1824 :: 		lateralv3();
BL	_lateralV3+0
;ECGsynthetic_events_code.c,1825 :: 		applicationTaskDAC();
BL	_applicationTaskDAC+0
;ECGsynthetic_events_code.c,1826 :: 		RadioButton50.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton50+20)
MOVT	R0, #hi_addr(_RadioButton50+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,1827 :: 		RadioButton51.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton51+20)
MOVT	R0, #hi_addr(_RadioButton51+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,1828 :: 		RadioButton52.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton52+20)
MOVT	R0, #hi_addr(_RadioButton52+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,1829 :: 		RadioButton53.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton53+20)
MOVT	R0, #hi_addr(_RadioButton53+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,1830 :: 		RadioButton54.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton54+20)
MOVT	R0, #hi_addr(_RadioButton54+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,1831 :: 		RadioButton55.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton55+20)
MOVT	R0, #hi_addr(_RadioButton55+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,1832 :: 		RadioButton56.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton56+20)
MOVT	R0, #hi_addr(_RadioButton56+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,1833 :: 		RadioButton49.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton49+20)
MOVT	R0, #hi_addr(_RadioButton49+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,1834 :: 		RadioButton58.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton58+20)
MOVT	R0, #hi_addr(_RadioButton58+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,1835 :: 		RadioButton59.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton59+20)
MOVT	R0, #hi_addr(_RadioButton59+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,1836 :: 		RadioButton60.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton60+20)
MOVT	R0, #hi_addr(_RadioButton60+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,1837 :: 		DrawRadioButton(&RadioButton50);
MOVW	R0, #lo_addr(_RadioButton50+0)
MOVT	R0, #hi_addr(_RadioButton50+0)
BL	_DrawRadioButton+0
;ECGsynthetic_events_code.c,1838 :: 		DrawRadioButton(&RadioButton51);
MOVW	R0, #lo_addr(_RadioButton51+0)
MOVT	R0, #hi_addr(_RadioButton51+0)
BL	_DrawRadioButton+0
;ECGsynthetic_events_code.c,1839 :: 		DrawRadioButton(&RadioButton52);
MOVW	R0, #lo_addr(_RadioButton52+0)
MOVT	R0, #hi_addr(_RadioButton52+0)
BL	_DrawRadioButton+0
;ECGsynthetic_events_code.c,1840 :: 		DrawRadioButton(&RadioButton53);
MOVW	R0, #lo_addr(_RadioButton53+0)
MOVT	R0, #hi_addr(_RadioButton53+0)
BL	_DrawRadioButton+0
;ECGsynthetic_events_code.c,1841 :: 		DrawRadioButton(&RadioButton54);
MOVW	R0, #lo_addr(_RadioButton54+0)
MOVT	R0, #hi_addr(_RadioButton54+0)
BL	_DrawRadioButton+0
;ECGsynthetic_events_code.c,1842 :: 		DrawRadioButton(&RadioButton55);
MOVW	R0, #lo_addr(_RadioButton55+0)
MOVT	R0, #hi_addr(_RadioButton55+0)
BL	_DrawRadioButton+0
;ECGsynthetic_events_code.c,1843 :: 		DrawRadioButton(&RadioButton56);
MOVW	R0, #lo_addr(_RadioButton56+0)
MOVT	R0, #hi_addr(_RadioButton56+0)
BL	_DrawRadioButton+0
;ECGsynthetic_events_code.c,1844 :: 		DrawRadioButton(&RadioButton49);
MOVW	R0, #lo_addr(_RadioButton49+0)
MOVT	R0, #hi_addr(_RadioButton49+0)
BL	_DrawRadioButton+0
;ECGsynthetic_events_code.c,1845 :: 		DrawRadioButton(&RadioButton58);
MOVW	R0, #lo_addr(_RadioButton58+0)
MOVT	R0, #hi_addr(_RadioButton58+0)
BL	_DrawRadioButton+0
;ECGsynthetic_events_code.c,1846 :: 		DrawRadioButton(&RadioButton59);
MOVW	R0, #lo_addr(_RadioButton59+0)
MOVT	R0, #hi_addr(_RadioButton59+0)
BL	_DrawRadioButton+0
;ECGsynthetic_events_code.c,1847 :: 		DrawRadioButton(&RadioButton60);
MOVW	R0, #lo_addr(_RadioButton60+0)
MOVT	R0, #hi_addr(_RadioButton60+0)
BL	_DrawRadioButton+0
;ECGsynthetic_events_code.c,1848 :: 		}
L_end_RadioButton57OnPress:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _RadioButton57OnPress
_RadioButton58OnPress:
;ECGsynthetic_events_code.c,1850 :: 		void RadioButton58OnPress() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;ECGsynthetic_events_code.c,1851 :: 		lateralv4();
BL	_lateralV4+0
;ECGsynthetic_events_code.c,1852 :: 		applicationTaskDAC();
BL	_applicationTaskDAC+0
;ECGsynthetic_events_code.c,1853 :: 		RadioButton50.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton50+20)
MOVT	R0, #hi_addr(_RadioButton50+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,1854 :: 		RadioButton51.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton51+20)
MOVT	R0, #hi_addr(_RadioButton51+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,1855 :: 		RadioButton52.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton52+20)
MOVT	R0, #hi_addr(_RadioButton52+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,1856 :: 		RadioButton53.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton53+20)
MOVT	R0, #hi_addr(_RadioButton53+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,1857 :: 		RadioButton54.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton54+20)
MOVT	R0, #hi_addr(_RadioButton54+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,1858 :: 		RadioButton55.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton55+20)
MOVT	R0, #hi_addr(_RadioButton55+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,1859 :: 		RadioButton56.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton56+20)
MOVT	R0, #hi_addr(_RadioButton56+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,1860 :: 		RadioButton57.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton57+20)
MOVT	R0, #hi_addr(_RadioButton57+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,1861 :: 		RadioButton49.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton49+20)
MOVT	R0, #hi_addr(_RadioButton49+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,1862 :: 		RadioButton59.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton59+20)
MOVT	R0, #hi_addr(_RadioButton59+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,1863 :: 		RadioButton60.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton60+20)
MOVT	R0, #hi_addr(_RadioButton60+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,1864 :: 		DrawRadioButton(&RadioButton50);
MOVW	R0, #lo_addr(_RadioButton50+0)
MOVT	R0, #hi_addr(_RadioButton50+0)
BL	_DrawRadioButton+0
;ECGsynthetic_events_code.c,1865 :: 		DrawRadioButton(&RadioButton51);
MOVW	R0, #lo_addr(_RadioButton51+0)
MOVT	R0, #hi_addr(_RadioButton51+0)
BL	_DrawRadioButton+0
;ECGsynthetic_events_code.c,1866 :: 		DrawRadioButton(&RadioButton52);
MOVW	R0, #lo_addr(_RadioButton52+0)
MOVT	R0, #hi_addr(_RadioButton52+0)
BL	_DrawRadioButton+0
;ECGsynthetic_events_code.c,1867 :: 		DrawRadioButton(&RadioButton53);
MOVW	R0, #lo_addr(_RadioButton53+0)
MOVT	R0, #hi_addr(_RadioButton53+0)
BL	_DrawRadioButton+0
;ECGsynthetic_events_code.c,1868 :: 		DrawRadioButton(&RadioButton54);
MOVW	R0, #lo_addr(_RadioButton54+0)
MOVT	R0, #hi_addr(_RadioButton54+0)
BL	_DrawRadioButton+0
;ECGsynthetic_events_code.c,1869 :: 		DrawRadioButton(&RadioButton55);
MOVW	R0, #lo_addr(_RadioButton55+0)
MOVT	R0, #hi_addr(_RadioButton55+0)
BL	_DrawRadioButton+0
;ECGsynthetic_events_code.c,1870 :: 		DrawRadioButton(&RadioButton56);
MOVW	R0, #lo_addr(_RadioButton56+0)
MOVT	R0, #hi_addr(_RadioButton56+0)
BL	_DrawRadioButton+0
;ECGsynthetic_events_code.c,1871 :: 		DrawRadioButton(&RadioButton57);
MOVW	R0, #lo_addr(_RadioButton57+0)
MOVT	R0, #hi_addr(_RadioButton57+0)
BL	_DrawRadioButton+0
;ECGsynthetic_events_code.c,1872 :: 		DrawRadioButton(&RadioButton49);
MOVW	R0, #lo_addr(_RadioButton49+0)
MOVT	R0, #hi_addr(_RadioButton49+0)
BL	_DrawRadioButton+0
;ECGsynthetic_events_code.c,1873 :: 		DrawRadioButton(&RadioButton59);
MOVW	R0, #lo_addr(_RadioButton59+0)
MOVT	R0, #hi_addr(_RadioButton59+0)
BL	_DrawRadioButton+0
;ECGsynthetic_events_code.c,1874 :: 		DrawRadioButton(&RadioButton60);
MOVW	R0, #lo_addr(_RadioButton60+0)
MOVT	R0, #hi_addr(_RadioButton60+0)
BL	_DrawRadioButton+0
;ECGsynthetic_events_code.c,1875 :: 		}
L_end_RadioButton58OnPress:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _RadioButton58OnPress
_RadioButton59OnPress:
;ECGsynthetic_events_code.c,1877 :: 		void RadioButton59OnPress() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;ECGsynthetic_events_code.c,1878 :: 		lateralv5();
BL	_lateralV5+0
;ECGsynthetic_events_code.c,1879 :: 		applicationTaskDAC();
BL	_applicationTaskDAC+0
;ECGsynthetic_events_code.c,1880 :: 		RadioButton50.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton50+20)
MOVT	R0, #hi_addr(_RadioButton50+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,1881 :: 		RadioButton51.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton51+20)
MOVT	R0, #hi_addr(_RadioButton51+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,1882 :: 		RadioButton52.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton52+20)
MOVT	R0, #hi_addr(_RadioButton52+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,1883 :: 		RadioButton53.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton53+20)
MOVT	R0, #hi_addr(_RadioButton53+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,1884 :: 		RadioButton54.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton54+20)
MOVT	R0, #hi_addr(_RadioButton54+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,1885 :: 		RadioButton55.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton55+20)
MOVT	R0, #hi_addr(_RadioButton55+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,1886 :: 		RadioButton56.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton56+20)
MOVT	R0, #hi_addr(_RadioButton56+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,1887 :: 		RadioButton57.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton57+20)
MOVT	R0, #hi_addr(_RadioButton57+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,1888 :: 		RadioButton58.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton58+20)
MOVT	R0, #hi_addr(_RadioButton58+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,1889 :: 		RadioButton49.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton49+20)
MOVT	R0, #hi_addr(_RadioButton49+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,1890 :: 		RadioButton60.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton60+20)
MOVT	R0, #hi_addr(_RadioButton60+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,1891 :: 		DrawRadioButton(&RadioButton50);
MOVW	R0, #lo_addr(_RadioButton50+0)
MOVT	R0, #hi_addr(_RadioButton50+0)
BL	_DrawRadioButton+0
;ECGsynthetic_events_code.c,1892 :: 		DrawRadioButton(&RadioButton51);
MOVW	R0, #lo_addr(_RadioButton51+0)
MOVT	R0, #hi_addr(_RadioButton51+0)
BL	_DrawRadioButton+0
;ECGsynthetic_events_code.c,1893 :: 		DrawRadioButton(&RadioButton52);
MOVW	R0, #lo_addr(_RadioButton52+0)
MOVT	R0, #hi_addr(_RadioButton52+0)
BL	_DrawRadioButton+0
;ECGsynthetic_events_code.c,1894 :: 		DrawRadioButton(&RadioButton53);
MOVW	R0, #lo_addr(_RadioButton53+0)
MOVT	R0, #hi_addr(_RadioButton53+0)
BL	_DrawRadioButton+0
;ECGsynthetic_events_code.c,1895 :: 		DrawRadioButton(&RadioButton54);
MOVW	R0, #lo_addr(_RadioButton54+0)
MOVT	R0, #hi_addr(_RadioButton54+0)
BL	_DrawRadioButton+0
;ECGsynthetic_events_code.c,1896 :: 		DrawRadioButton(&RadioButton55);
MOVW	R0, #lo_addr(_RadioButton55+0)
MOVT	R0, #hi_addr(_RadioButton55+0)
BL	_DrawRadioButton+0
;ECGsynthetic_events_code.c,1897 :: 		DrawRadioButton(&RadioButton56);
MOVW	R0, #lo_addr(_RadioButton56+0)
MOVT	R0, #hi_addr(_RadioButton56+0)
BL	_DrawRadioButton+0
;ECGsynthetic_events_code.c,1898 :: 		DrawRadioButton(&RadioButton57);
MOVW	R0, #lo_addr(_RadioButton57+0)
MOVT	R0, #hi_addr(_RadioButton57+0)
BL	_DrawRadioButton+0
;ECGsynthetic_events_code.c,1899 :: 		DrawRadioButton(&RadioButton58);
MOVW	R0, #lo_addr(_RadioButton58+0)
MOVT	R0, #hi_addr(_RadioButton58+0)
BL	_DrawRadioButton+0
;ECGsynthetic_events_code.c,1900 :: 		DrawRadioButton(&RadioButton49);
MOVW	R0, #lo_addr(_RadioButton49+0)
MOVT	R0, #hi_addr(_RadioButton49+0)
BL	_DrawRadioButton+0
;ECGsynthetic_events_code.c,1901 :: 		DrawRadioButton(&RadioButton60);
MOVW	R0, #lo_addr(_RadioButton60+0)
MOVT	R0, #hi_addr(_RadioButton60+0)
BL	_DrawRadioButton+0
;ECGsynthetic_events_code.c,1902 :: 		}
L_end_RadioButton59OnPress:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _RadioButton59OnPress
_RadioButton60OnPress:
;ECGsynthetic_events_code.c,1904 :: 		void RadioButton60OnPress() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;ECGsynthetic_events_code.c,1905 :: 		lateralv6();
BL	_lateralV6+0
;ECGsynthetic_events_code.c,1906 :: 		applicationTaskDAC();
BL	_applicationTaskDAC+0
;ECGsynthetic_events_code.c,1907 :: 		RadioButton50.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton50+20)
MOVT	R0, #hi_addr(_RadioButton50+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,1908 :: 		RadioButton51.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton51+20)
MOVT	R0, #hi_addr(_RadioButton51+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,1909 :: 		RadioButton52.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton52+20)
MOVT	R0, #hi_addr(_RadioButton52+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,1910 :: 		RadioButton53.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton53+20)
MOVT	R0, #hi_addr(_RadioButton53+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,1911 :: 		RadioButton54.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton54+20)
MOVT	R0, #hi_addr(_RadioButton54+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,1912 :: 		RadioButton55.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton55+20)
MOVT	R0, #hi_addr(_RadioButton55+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,1913 :: 		RadioButton56.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton56+20)
MOVT	R0, #hi_addr(_RadioButton56+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,1914 :: 		RadioButton57.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton57+20)
MOVT	R0, #hi_addr(_RadioButton57+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,1915 :: 		RadioButton58.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton58+20)
MOVT	R0, #hi_addr(_RadioButton58+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,1916 :: 		RadioButton59.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton59+20)
MOVT	R0, #hi_addr(_RadioButton59+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,1917 :: 		RadioButton49.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton49+20)
MOVT	R0, #hi_addr(_RadioButton49+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,1918 :: 		DrawRadioButton(&RadioButton50);
MOVW	R0, #lo_addr(_RadioButton50+0)
MOVT	R0, #hi_addr(_RadioButton50+0)
BL	_DrawRadioButton+0
;ECGsynthetic_events_code.c,1919 :: 		DrawRadioButton(&RadioButton51);
MOVW	R0, #lo_addr(_RadioButton51+0)
MOVT	R0, #hi_addr(_RadioButton51+0)
BL	_DrawRadioButton+0
;ECGsynthetic_events_code.c,1920 :: 		DrawRadioButton(&RadioButton52);
MOVW	R0, #lo_addr(_RadioButton52+0)
MOVT	R0, #hi_addr(_RadioButton52+0)
BL	_DrawRadioButton+0
;ECGsynthetic_events_code.c,1921 :: 		DrawRadioButton(&RadioButton53);
MOVW	R0, #lo_addr(_RadioButton53+0)
MOVT	R0, #hi_addr(_RadioButton53+0)
BL	_DrawRadioButton+0
;ECGsynthetic_events_code.c,1922 :: 		DrawRadioButton(&RadioButton54);
MOVW	R0, #lo_addr(_RadioButton54+0)
MOVT	R0, #hi_addr(_RadioButton54+0)
BL	_DrawRadioButton+0
;ECGsynthetic_events_code.c,1923 :: 		DrawRadioButton(&RadioButton55);
MOVW	R0, #lo_addr(_RadioButton55+0)
MOVT	R0, #hi_addr(_RadioButton55+0)
BL	_DrawRadioButton+0
;ECGsynthetic_events_code.c,1924 :: 		DrawRadioButton(&RadioButton56);
MOVW	R0, #lo_addr(_RadioButton56+0)
MOVT	R0, #hi_addr(_RadioButton56+0)
BL	_DrawRadioButton+0
;ECGsynthetic_events_code.c,1925 :: 		DrawRadioButton(&RadioButton57);
MOVW	R0, #lo_addr(_RadioButton57+0)
MOVT	R0, #hi_addr(_RadioButton57+0)
BL	_DrawRadioButton+0
;ECGsynthetic_events_code.c,1926 :: 		DrawRadioButton(&RadioButton58);
MOVW	R0, #lo_addr(_RadioButton58+0)
MOVT	R0, #hi_addr(_RadioButton58+0)
BL	_DrawRadioButton+0
;ECGsynthetic_events_code.c,1927 :: 		DrawRadioButton(&RadioButton59);
MOVW	R0, #lo_addr(_RadioButton59+0)
MOVT	R0, #hi_addr(_RadioButton59+0)
BL	_DrawRadioButton+0
;ECGsynthetic_events_code.c,1928 :: 		DrawRadioButton(&RadioButton49);
MOVW	R0, #lo_addr(_RadioButton49+0)
MOVT	R0, #hi_addr(_RadioButton49+0)
BL	_DrawRadioButton+0
;ECGsynthetic_events_code.c,1929 :: 		}
L_end_RadioButton60OnPress:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _RadioButton60OnPress
_RadioButton61OnPress:
;ECGsynthetic_events_code.c,1932 :: 		void RadioButton61OnPress() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;ECGsynthetic_events_code.c,1933 :: 		posterior1();
BL	_posterior1+0
;ECGsynthetic_events_code.c,1934 :: 		applicationTaskDAC();
BL	_applicationTaskDAC+0
;ECGsynthetic_events_code.c,1935 :: 		RadioButton62.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton62+20)
MOVT	R0, #hi_addr(_RadioButton62+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,1936 :: 		RadioButton63.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton63+20)
MOVT	R0, #hi_addr(_RadioButton63+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,1937 :: 		RadioButton64.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton64+20)
MOVT	R0, #hi_addr(_RadioButton64+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,1938 :: 		RadioButton65.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton65+20)
MOVT	R0, #hi_addr(_RadioButton65+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,1939 :: 		RadioButton66.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton66+20)
MOVT	R0, #hi_addr(_RadioButton66+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,1940 :: 		RadioButton67.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton67+20)
MOVT	R0, #hi_addr(_RadioButton67+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,1941 :: 		RadioButton68.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton68+20)
MOVT	R0, #hi_addr(_RadioButton68+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,1942 :: 		RadioButton69.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton69+20)
MOVT	R0, #hi_addr(_RadioButton69+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,1943 :: 		RadioButton70.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton70+20)
MOVT	R0, #hi_addr(_RadioButton70+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,1944 :: 		RadioButton71.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton71+20)
MOVT	R0, #hi_addr(_RadioButton71+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,1945 :: 		RadioButton72.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton72+20)
MOVT	R0, #hi_addr(_RadioButton72+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,1946 :: 		DrawRadioButton(&RadioButton62);
MOVW	R0, #lo_addr(_RadioButton62+0)
MOVT	R0, #hi_addr(_RadioButton62+0)
BL	_DrawRadioButton+0
;ECGsynthetic_events_code.c,1947 :: 		DrawRadioButton(&RadioButton63);
MOVW	R0, #lo_addr(_RadioButton63+0)
MOVT	R0, #hi_addr(_RadioButton63+0)
BL	_DrawRadioButton+0
;ECGsynthetic_events_code.c,1948 :: 		DrawRadioButton(&RadioButton64);
MOVW	R0, #lo_addr(_RadioButton64+0)
MOVT	R0, #hi_addr(_RadioButton64+0)
BL	_DrawRadioButton+0
;ECGsynthetic_events_code.c,1949 :: 		DrawRadioButton(&RadioButton65);
MOVW	R0, #lo_addr(_RadioButton65+0)
MOVT	R0, #hi_addr(_RadioButton65+0)
BL	_DrawRadioButton+0
;ECGsynthetic_events_code.c,1950 :: 		DrawRadioButton(&RadioButton66);
MOVW	R0, #lo_addr(_RadioButton66+0)
MOVT	R0, #hi_addr(_RadioButton66+0)
BL	_DrawRadioButton+0
;ECGsynthetic_events_code.c,1951 :: 		DrawRadioButton(&RadioButton67);
MOVW	R0, #lo_addr(_RadioButton67+0)
MOVT	R0, #hi_addr(_RadioButton67+0)
BL	_DrawRadioButton+0
;ECGsynthetic_events_code.c,1952 :: 		DrawRadioButton(&RadioButton68);
MOVW	R0, #lo_addr(_RadioButton68+0)
MOVT	R0, #hi_addr(_RadioButton68+0)
BL	_DrawRadioButton+0
;ECGsynthetic_events_code.c,1953 :: 		DrawRadioButton(&RadioButton69);
MOVW	R0, #lo_addr(_RadioButton69+0)
MOVT	R0, #hi_addr(_RadioButton69+0)
BL	_DrawRadioButton+0
;ECGsynthetic_events_code.c,1954 :: 		DrawRadioButton(&RadioButton70);
MOVW	R0, #lo_addr(_RadioButton70+0)
MOVT	R0, #hi_addr(_RadioButton70+0)
BL	_DrawRadioButton+0
;ECGsynthetic_events_code.c,1955 :: 		DrawRadioButton(&RadioButton71);
MOVW	R0, #lo_addr(_RadioButton71+0)
MOVT	R0, #hi_addr(_RadioButton71+0)
BL	_DrawRadioButton+0
;ECGsynthetic_events_code.c,1956 :: 		DrawRadioButton(&RadioButton72);
MOVW	R0, #lo_addr(_RadioButton72+0)
MOVT	R0, #hi_addr(_RadioButton72+0)
BL	_DrawRadioButton+0
;ECGsynthetic_events_code.c,1957 :: 		}
L_end_RadioButton61OnPress:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _RadioButton61OnPress
_RadioButton62OnPress:
;ECGsynthetic_events_code.c,1959 :: 		void RadioButton62OnPress() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;ECGsynthetic_events_code.c,1960 :: 		posterior2();
BL	_posterior2+0
;ECGsynthetic_events_code.c,1961 :: 		applicationTaskDAC();
BL	_applicationTaskDAC+0
;ECGsynthetic_events_code.c,1962 :: 		RadioButton61.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton61+20)
MOVT	R0, #hi_addr(_RadioButton61+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,1963 :: 		RadioButton63.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton63+20)
MOVT	R0, #hi_addr(_RadioButton63+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,1964 :: 		RadioButton64.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton64+20)
MOVT	R0, #hi_addr(_RadioButton64+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,1965 :: 		RadioButton65.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton65+20)
MOVT	R0, #hi_addr(_RadioButton65+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,1966 :: 		RadioButton66.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton66+20)
MOVT	R0, #hi_addr(_RadioButton66+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,1967 :: 		RadioButton67.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton67+20)
MOVT	R0, #hi_addr(_RadioButton67+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,1968 :: 		RadioButton68.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton68+20)
MOVT	R0, #hi_addr(_RadioButton68+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,1969 :: 		RadioButton69.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton69+20)
MOVT	R0, #hi_addr(_RadioButton69+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,1970 :: 		RadioButton70.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton70+20)
MOVT	R0, #hi_addr(_RadioButton70+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,1971 :: 		RadioButton71.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton71+20)
MOVT	R0, #hi_addr(_RadioButton71+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,1972 :: 		RadioButton72.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton72+20)
MOVT	R0, #hi_addr(_RadioButton72+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,1973 :: 		DrawRadioButton(&RadioButton61);
MOVW	R0, #lo_addr(_RadioButton61+0)
MOVT	R0, #hi_addr(_RadioButton61+0)
BL	_DrawRadioButton+0
;ECGsynthetic_events_code.c,1974 :: 		DrawRadioButton(&RadioButton63);
MOVW	R0, #lo_addr(_RadioButton63+0)
MOVT	R0, #hi_addr(_RadioButton63+0)
BL	_DrawRadioButton+0
;ECGsynthetic_events_code.c,1975 :: 		DrawRadioButton(&RadioButton64);
MOVW	R0, #lo_addr(_RadioButton64+0)
MOVT	R0, #hi_addr(_RadioButton64+0)
BL	_DrawRadioButton+0
;ECGsynthetic_events_code.c,1976 :: 		DrawRadioButton(&RadioButton65);
MOVW	R0, #lo_addr(_RadioButton65+0)
MOVT	R0, #hi_addr(_RadioButton65+0)
BL	_DrawRadioButton+0
;ECGsynthetic_events_code.c,1977 :: 		DrawRadioButton(&RadioButton66);
MOVW	R0, #lo_addr(_RadioButton66+0)
MOVT	R0, #hi_addr(_RadioButton66+0)
BL	_DrawRadioButton+0
;ECGsynthetic_events_code.c,1978 :: 		DrawRadioButton(&RadioButton67);
MOVW	R0, #lo_addr(_RadioButton67+0)
MOVT	R0, #hi_addr(_RadioButton67+0)
BL	_DrawRadioButton+0
;ECGsynthetic_events_code.c,1979 :: 		DrawRadioButton(&RadioButton68);
MOVW	R0, #lo_addr(_RadioButton68+0)
MOVT	R0, #hi_addr(_RadioButton68+0)
BL	_DrawRadioButton+0
;ECGsynthetic_events_code.c,1980 :: 		DrawRadioButton(&RadioButton69);
MOVW	R0, #lo_addr(_RadioButton69+0)
MOVT	R0, #hi_addr(_RadioButton69+0)
BL	_DrawRadioButton+0
;ECGsynthetic_events_code.c,1981 :: 		DrawRadioButton(&RadioButton70);
MOVW	R0, #lo_addr(_RadioButton70+0)
MOVT	R0, #hi_addr(_RadioButton70+0)
BL	_DrawRadioButton+0
;ECGsynthetic_events_code.c,1982 :: 		DrawRadioButton(&RadioButton71);
MOVW	R0, #lo_addr(_RadioButton71+0)
MOVT	R0, #hi_addr(_RadioButton71+0)
BL	_DrawRadioButton+0
;ECGsynthetic_events_code.c,1983 :: 		DrawRadioButton(&RadioButton72);
MOVW	R0, #lo_addr(_RadioButton72+0)
MOVT	R0, #hi_addr(_RadioButton72+0)
BL	_DrawRadioButton+0
;ECGsynthetic_events_code.c,1985 :: 		}
L_end_RadioButton62OnPress:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _RadioButton62OnPress
_RadioButton63OnPress:
;ECGsynthetic_events_code.c,1987 :: 		void RadioButton63OnPress() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;ECGsynthetic_events_code.c,1988 :: 		posterior3();
BL	_posterior3+0
;ECGsynthetic_events_code.c,1989 :: 		applicationTaskDAC();
BL	_applicationTaskDAC+0
;ECGsynthetic_events_code.c,1990 :: 		RadioButton62.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton62+20)
MOVT	R0, #hi_addr(_RadioButton62+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,1991 :: 		RadioButton61.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton61+20)
MOVT	R0, #hi_addr(_RadioButton61+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,1992 :: 		RadioButton64.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton64+20)
MOVT	R0, #hi_addr(_RadioButton64+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,1993 :: 		RadioButton65.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton65+20)
MOVT	R0, #hi_addr(_RadioButton65+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,1994 :: 		RadioButton66.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton66+20)
MOVT	R0, #hi_addr(_RadioButton66+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,1995 :: 		RadioButton67.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton67+20)
MOVT	R0, #hi_addr(_RadioButton67+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,1996 :: 		RadioButton68.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton68+20)
MOVT	R0, #hi_addr(_RadioButton68+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,1997 :: 		RadioButton69.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton69+20)
MOVT	R0, #hi_addr(_RadioButton69+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,1998 :: 		RadioButton70.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton70+20)
MOVT	R0, #hi_addr(_RadioButton70+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,1999 :: 		RadioButton71.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton71+20)
MOVT	R0, #hi_addr(_RadioButton71+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,2000 :: 		RadioButton72.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton72+20)
MOVT	R0, #hi_addr(_RadioButton72+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,2001 :: 		DrawRadioButton(&RadioButton62);
MOVW	R0, #lo_addr(_RadioButton62+0)
MOVT	R0, #hi_addr(_RadioButton62+0)
BL	_DrawRadioButton+0
;ECGsynthetic_events_code.c,2002 :: 		DrawRadioButton(&RadioButton61);
MOVW	R0, #lo_addr(_RadioButton61+0)
MOVT	R0, #hi_addr(_RadioButton61+0)
BL	_DrawRadioButton+0
;ECGsynthetic_events_code.c,2003 :: 		DrawRadioButton(&RadioButton64);
MOVW	R0, #lo_addr(_RadioButton64+0)
MOVT	R0, #hi_addr(_RadioButton64+0)
BL	_DrawRadioButton+0
;ECGsynthetic_events_code.c,2004 :: 		DrawRadioButton(&RadioButton65);
MOVW	R0, #lo_addr(_RadioButton65+0)
MOVT	R0, #hi_addr(_RadioButton65+0)
BL	_DrawRadioButton+0
;ECGsynthetic_events_code.c,2005 :: 		DrawRadioButton(&RadioButton66);
MOVW	R0, #lo_addr(_RadioButton66+0)
MOVT	R0, #hi_addr(_RadioButton66+0)
BL	_DrawRadioButton+0
;ECGsynthetic_events_code.c,2006 :: 		DrawRadioButton(&RadioButton67);
MOVW	R0, #lo_addr(_RadioButton67+0)
MOVT	R0, #hi_addr(_RadioButton67+0)
BL	_DrawRadioButton+0
;ECGsynthetic_events_code.c,2007 :: 		DrawRadioButton(&RadioButton68);
MOVW	R0, #lo_addr(_RadioButton68+0)
MOVT	R0, #hi_addr(_RadioButton68+0)
BL	_DrawRadioButton+0
;ECGsynthetic_events_code.c,2008 :: 		DrawRadioButton(&RadioButton69);
MOVW	R0, #lo_addr(_RadioButton69+0)
MOVT	R0, #hi_addr(_RadioButton69+0)
BL	_DrawRadioButton+0
;ECGsynthetic_events_code.c,2009 :: 		DrawRadioButton(&RadioButton70);
MOVW	R0, #lo_addr(_RadioButton70+0)
MOVT	R0, #hi_addr(_RadioButton70+0)
BL	_DrawRadioButton+0
;ECGsynthetic_events_code.c,2010 :: 		DrawRadioButton(&RadioButton71);
MOVW	R0, #lo_addr(_RadioButton71+0)
MOVT	R0, #hi_addr(_RadioButton71+0)
BL	_DrawRadioButton+0
;ECGsynthetic_events_code.c,2011 :: 		DrawRadioButton(&RadioButton72);
MOVW	R0, #lo_addr(_RadioButton72+0)
MOVT	R0, #hi_addr(_RadioButton72+0)
BL	_DrawRadioButton+0
;ECGsynthetic_events_code.c,2012 :: 		}
L_end_RadioButton63OnPress:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _RadioButton63OnPress
_RadioButton64OnPress:
;ECGsynthetic_events_code.c,2014 :: 		void RadioButton64OnPress() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;ECGsynthetic_events_code.c,2015 :: 		posterioravr();
BL	_posterioraVR+0
;ECGsynthetic_events_code.c,2016 :: 		applicationTaskDAC();
BL	_applicationTaskDAC+0
;ECGsynthetic_events_code.c,2017 :: 		RadioButton62.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton62+20)
MOVT	R0, #hi_addr(_RadioButton62+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,2018 :: 		RadioButton63.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton63+20)
MOVT	R0, #hi_addr(_RadioButton63+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,2019 :: 		RadioButton61.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton61+20)
MOVT	R0, #hi_addr(_RadioButton61+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,2020 :: 		RadioButton65.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton65+20)
MOVT	R0, #hi_addr(_RadioButton65+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,2021 :: 		RadioButton66.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton66+20)
MOVT	R0, #hi_addr(_RadioButton66+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,2022 :: 		RadioButton67.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton67+20)
MOVT	R0, #hi_addr(_RadioButton67+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,2023 :: 		RadioButton68.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton68+20)
MOVT	R0, #hi_addr(_RadioButton68+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,2024 :: 		RadioButton69.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton69+20)
MOVT	R0, #hi_addr(_RadioButton69+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,2025 :: 		RadioButton70.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton70+20)
MOVT	R0, #hi_addr(_RadioButton70+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,2026 :: 		RadioButton71.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton71+20)
MOVT	R0, #hi_addr(_RadioButton71+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,2027 :: 		RadioButton72.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton72+20)
MOVT	R0, #hi_addr(_RadioButton72+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,2028 :: 		DrawRadioButton(&RadioButton62);
MOVW	R0, #lo_addr(_RadioButton62+0)
MOVT	R0, #hi_addr(_RadioButton62+0)
BL	_DrawRadioButton+0
;ECGsynthetic_events_code.c,2029 :: 		DrawRadioButton(&RadioButton63);
MOVW	R0, #lo_addr(_RadioButton63+0)
MOVT	R0, #hi_addr(_RadioButton63+0)
BL	_DrawRadioButton+0
;ECGsynthetic_events_code.c,2030 :: 		DrawRadioButton(&RadioButton61);
MOVW	R0, #lo_addr(_RadioButton61+0)
MOVT	R0, #hi_addr(_RadioButton61+0)
BL	_DrawRadioButton+0
;ECGsynthetic_events_code.c,2031 :: 		DrawRadioButton(&RadioButton65);
MOVW	R0, #lo_addr(_RadioButton65+0)
MOVT	R0, #hi_addr(_RadioButton65+0)
BL	_DrawRadioButton+0
;ECGsynthetic_events_code.c,2032 :: 		DrawRadioButton(&RadioButton66);
MOVW	R0, #lo_addr(_RadioButton66+0)
MOVT	R0, #hi_addr(_RadioButton66+0)
BL	_DrawRadioButton+0
;ECGsynthetic_events_code.c,2033 :: 		DrawRadioButton(&RadioButton67);
MOVW	R0, #lo_addr(_RadioButton67+0)
MOVT	R0, #hi_addr(_RadioButton67+0)
BL	_DrawRadioButton+0
;ECGsynthetic_events_code.c,2034 :: 		DrawRadioButton(&RadioButton68);
MOVW	R0, #lo_addr(_RadioButton68+0)
MOVT	R0, #hi_addr(_RadioButton68+0)
BL	_DrawRadioButton+0
;ECGsynthetic_events_code.c,2035 :: 		DrawRadioButton(&RadioButton69);
MOVW	R0, #lo_addr(_RadioButton69+0)
MOVT	R0, #hi_addr(_RadioButton69+0)
BL	_DrawRadioButton+0
;ECGsynthetic_events_code.c,2036 :: 		DrawRadioButton(&RadioButton70);
MOVW	R0, #lo_addr(_RadioButton70+0)
MOVT	R0, #hi_addr(_RadioButton70+0)
BL	_DrawRadioButton+0
;ECGsynthetic_events_code.c,2037 :: 		DrawRadioButton(&RadioButton71);
MOVW	R0, #lo_addr(_RadioButton71+0)
MOVT	R0, #hi_addr(_RadioButton71+0)
BL	_DrawRadioButton+0
;ECGsynthetic_events_code.c,2038 :: 		DrawRadioButton(&RadioButton72);
MOVW	R0, #lo_addr(_RadioButton72+0)
MOVT	R0, #hi_addr(_RadioButton72+0)
BL	_DrawRadioButton+0
;ECGsynthetic_events_code.c,2039 :: 		}
L_end_RadioButton64OnPress:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _RadioButton64OnPress
_RadioButton65OnPress:
;ECGsynthetic_events_code.c,2041 :: 		void RadioButton65OnPress() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;ECGsynthetic_events_code.c,2042 :: 		posterioravl();
BL	_posterioraVL+0
;ECGsynthetic_events_code.c,2043 :: 		applicationTaskDAC();
BL	_applicationTaskDAC+0
;ECGsynthetic_events_code.c,2044 :: 		RadioButton62.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton62+20)
MOVT	R0, #hi_addr(_RadioButton62+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,2045 :: 		RadioButton63.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton63+20)
MOVT	R0, #hi_addr(_RadioButton63+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,2046 :: 		RadioButton64.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton64+20)
MOVT	R0, #hi_addr(_RadioButton64+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,2047 :: 		RadioButton61.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton61+20)
MOVT	R0, #hi_addr(_RadioButton61+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,2048 :: 		RadioButton66.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton66+20)
MOVT	R0, #hi_addr(_RadioButton66+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,2049 :: 		RadioButton67.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton67+20)
MOVT	R0, #hi_addr(_RadioButton67+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,2050 :: 		RadioButton68.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton68+20)
MOVT	R0, #hi_addr(_RadioButton68+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,2051 :: 		RadioButton69.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton69+20)
MOVT	R0, #hi_addr(_RadioButton69+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,2052 :: 		RadioButton70.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton70+20)
MOVT	R0, #hi_addr(_RadioButton70+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,2053 :: 		RadioButton71.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton71+20)
MOVT	R0, #hi_addr(_RadioButton71+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,2054 :: 		RadioButton72.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton72+20)
MOVT	R0, #hi_addr(_RadioButton72+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,2055 :: 		DrawRadioButton(&RadioButton62);
MOVW	R0, #lo_addr(_RadioButton62+0)
MOVT	R0, #hi_addr(_RadioButton62+0)
BL	_DrawRadioButton+0
;ECGsynthetic_events_code.c,2056 :: 		DrawRadioButton(&RadioButton63);
MOVW	R0, #lo_addr(_RadioButton63+0)
MOVT	R0, #hi_addr(_RadioButton63+0)
BL	_DrawRadioButton+0
;ECGsynthetic_events_code.c,2057 :: 		DrawRadioButton(&RadioButton64);
MOVW	R0, #lo_addr(_RadioButton64+0)
MOVT	R0, #hi_addr(_RadioButton64+0)
BL	_DrawRadioButton+0
;ECGsynthetic_events_code.c,2058 :: 		DrawRadioButton(&RadioButton61);
MOVW	R0, #lo_addr(_RadioButton61+0)
MOVT	R0, #hi_addr(_RadioButton61+0)
BL	_DrawRadioButton+0
;ECGsynthetic_events_code.c,2059 :: 		DrawRadioButton(&RadioButton66);
MOVW	R0, #lo_addr(_RadioButton66+0)
MOVT	R0, #hi_addr(_RadioButton66+0)
BL	_DrawRadioButton+0
;ECGsynthetic_events_code.c,2060 :: 		DrawRadioButton(&RadioButton67);
MOVW	R0, #lo_addr(_RadioButton67+0)
MOVT	R0, #hi_addr(_RadioButton67+0)
BL	_DrawRadioButton+0
;ECGsynthetic_events_code.c,2061 :: 		DrawRadioButton(&RadioButton68);
MOVW	R0, #lo_addr(_RadioButton68+0)
MOVT	R0, #hi_addr(_RadioButton68+0)
BL	_DrawRadioButton+0
;ECGsynthetic_events_code.c,2062 :: 		DrawRadioButton(&RadioButton69);
MOVW	R0, #lo_addr(_RadioButton69+0)
MOVT	R0, #hi_addr(_RadioButton69+0)
BL	_DrawRadioButton+0
;ECGsynthetic_events_code.c,2063 :: 		DrawRadioButton(&RadioButton70);
MOVW	R0, #lo_addr(_RadioButton70+0)
MOVT	R0, #hi_addr(_RadioButton70+0)
BL	_DrawRadioButton+0
;ECGsynthetic_events_code.c,2064 :: 		DrawRadioButton(&RadioButton71);
MOVW	R0, #lo_addr(_RadioButton71+0)
MOVT	R0, #hi_addr(_RadioButton71+0)
BL	_DrawRadioButton+0
;ECGsynthetic_events_code.c,2065 :: 		DrawRadioButton(&RadioButton72);
MOVW	R0, #lo_addr(_RadioButton72+0)
MOVT	R0, #hi_addr(_RadioButton72+0)
BL	_DrawRadioButton+0
;ECGsynthetic_events_code.c,2066 :: 		}
L_end_RadioButton65OnPress:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _RadioButton65OnPress
_RadioButton66OnPress:
;ECGsynthetic_events_code.c,2068 :: 		void RadioButton66OnPress() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;ECGsynthetic_events_code.c,2069 :: 		posterioravf();
BL	_posterioraVF+0
;ECGsynthetic_events_code.c,2070 :: 		applicationTaskDAC();
BL	_applicationTaskDAC+0
;ECGsynthetic_events_code.c,2071 :: 		RadioButton62.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton62+20)
MOVT	R0, #hi_addr(_RadioButton62+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,2072 :: 		RadioButton63.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton63+20)
MOVT	R0, #hi_addr(_RadioButton63+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,2073 :: 		RadioButton64.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton64+20)
MOVT	R0, #hi_addr(_RadioButton64+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,2074 :: 		RadioButton65.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton65+20)
MOVT	R0, #hi_addr(_RadioButton65+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,2075 :: 		RadioButton61.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton61+20)
MOVT	R0, #hi_addr(_RadioButton61+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,2076 :: 		RadioButton67.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton67+20)
MOVT	R0, #hi_addr(_RadioButton67+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,2077 :: 		RadioButton68.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton68+20)
MOVT	R0, #hi_addr(_RadioButton68+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,2078 :: 		RadioButton69.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton69+20)
MOVT	R0, #hi_addr(_RadioButton69+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,2079 :: 		RadioButton70.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton70+20)
MOVT	R0, #hi_addr(_RadioButton70+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,2080 :: 		RadioButton71.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton71+20)
MOVT	R0, #hi_addr(_RadioButton71+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,2081 :: 		RadioButton72.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton72+20)
MOVT	R0, #hi_addr(_RadioButton72+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,2082 :: 		DrawRadioButton(&RadioButton62);
MOVW	R0, #lo_addr(_RadioButton62+0)
MOVT	R0, #hi_addr(_RadioButton62+0)
BL	_DrawRadioButton+0
;ECGsynthetic_events_code.c,2083 :: 		DrawRadioButton(&RadioButton63);
MOVW	R0, #lo_addr(_RadioButton63+0)
MOVT	R0, #hi_addr(_RadioButton63+0)
BL	_DrawRadioButton+0
;ECGsynthetic_events_code.c,2084 :: 		DrawRadioButton(&RadioButton64);
MOVW	R0, #lo_addr(_RadioButton64+0)
MOVT	R0, #hi_addr(_RadioButton64+0)
BL	_DrawRadioButton+0
;ECGsynthetic_events_code.c,2085 :: 		DrawRadioButton(&RadioButton65);
MOVW	R0, #lo_addr(_RadioButton65+0)
MOVT	R0, #hi_addr(_RadioButton65+0)
BL	_DrawRadioButton+0
;ECGsynthetic_events_code.c,2086 :: 		DrawRadioButton(&RadioButton61);
MOVW	R0, #lo_addr(_RadioButton61+0)
MOVT	R0, #hi_addr(_RadioButton61+0)
BL	_DrawRadioButton+0
;ECGsynthetic_events_code.c,2087 :: 		DrawRadioButton(&RadioButton67);
MOVW	R0, #lo_addr(_RadioButton67+0)
MOVT	R0, #hi_addr(_RadioButton67+0)
BL	_DrawRadioButton+0
;ECGsynthetic_events_code.c,2088 :: 		DrawRadioButton(&RadioButton68);
MOVW	R0, #lo_addr(_RadioButton68+0)
MOVT	R0, #hi_addr(_RadioButton68+0)
BL	_DrawRadioButton+0
;ECGsynthetic_events_code.c,2089 :: 		DrawRadioButton(&RadioButton69);
MOVW	R0, #lo_addr(_RadioButton69+0)
MOVT	R0, #hi_addr(_RadioButton69+0)
BL	_DrawRadioButton+0
;ECGsynthetic_events_code.c,2090 :: 		DrawRadioButton(&RadioButton70);
MOVW	R0, #lo_addr(_RadioButton70+0)
MOVT	R0, #hi_addr(_RadioButton70+0)
BL	_DrawRadioButton+0
;ECGsynthetic_events_code.c,2091 :: 		DrawRadioButton(&RadioButton71);
MOVW	R0, #lo_addr(_RadioButton71+0)
MOVT	R0, #hi_addr(_RadioButton71+0)
BL	_DrawRadioButton+0
;ECGsynthetic_events_code.c,2092 :: 		DrawRadioButton(&RadioButton72);
MOVW	R0, #lo_addr(_RadioButton72+0)
MOVT	R0, #hi_addr(_RadioButton72+0)
BL	_DrawRadioButton+0
;ECGsynthetic_events_code.c,2093 :: 		}
L_end_RadioButton66OnPress:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _RadioButton66OnPress
_RadioButton67OnPress:
;ECGsynthetic_events_code.c,2095 :: 		void RadioButton67OnPress() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;ECGsynthetic_events_code.c,2096 :: 		posteriorv1();
BL	_posteriorV1+0
;ECGsynthetic_events_code.c,2097 :: 		applicationTaskDAC();
BL	_applicationTaskDAC+0
;ECGsynthetic_events_code.c,2098 :: 		RadioButton62.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton62+20)
MOVT	R0, #hi_addr(_RadioButton62+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,2099 :: 		RadioButton63.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton63+20)
MOVT	R0, #hi_addr(_RadioButton63+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,2100 :: 		RadioButton64.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton64+20)
MOVT	R0, #hi_addr(_RadioButton64+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,2101 :: 		RadioButton65.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton65+20)
MOVT	R0, #hi_addr(_RadioButton65+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,2102 :: 		RadioButton66.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton66+20)
MOVT	R0, #hi_addr(_RadioButton66+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,2103 :: 		RadioButton61.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton61+20)
MOVT	R0, #hi_addr(_RadioButton61+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,2104 :: 		RadioButton68.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton68+20)
MOVT	R0, #hi_addr(_RadioButton68+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,2105 :: 		RadioButton69.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton69+20)
MOVT	R0, #hi_addr(_RadioButton69+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,2106 :: 		RadioButton70.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton70+20)
MOVT	R0, #hi_addr(_RadioButton70+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,2107 :: 		RadioButton71.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton71+20)
MOVT	R0, #hi_addr(_RadioButton71+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,2108 :: 		RadioButton72.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton72+20)
MOVT	R0, #hi_addr(_RadioButton72+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,2109 :: 		DrawRadioButton(&RadioButton62);
MOVW	R0, #lo_addr(_RadioButton62+0)
MOVT	R0, #hi_addr(_RadioButton62+0)
BL	_DrawRadioButton+0
;ECGsynthetic_events_code.c,2110 :: 		DrawRadioButton(&RadioButton63);
MOVW	R0, #lo_addr(_RadioButton63+0)
MOVT	R0, #hi_addr(_RadioButton63+0)
BL	_DrawRadioButton+0
;ECGsynthetic_events_code.c,2111 :: 		DrawRadioButton(&RadioButton64);
MOVW	R0, #lo_addr(_RadioButton64+0)
MOVT	R0, #hi_addr(_RadioButton64+0)
BL	_DrawRadioButton+0
;ECGsynthetic_events_code.c,2112 :: 		DrawRadioButton(&RadioButton65);
MOVW	R0, #lo_addr(_RadioButton65+0)
MOVT	R0, #hi_addr(_RadioButton65+0)
BL	_DrawRadioButton+0
;ECGsynthetic_events_code.c,2113 :: 		DrawRadioButton(&RadioButton66);
MOVW	R0, #lo_addr(_RadioButton66+0)
MOVT	R0, #hi_addr(_RadioButton66+0)
BL	_DrawRadioButton+0
;ECGsynthetic_events_code.c,2114 :: 		DrawRadioButton(&RadioButton61);
MOVW	R0, #lo_addr(_RadioButton61+0)
MOVT	R0, #hi_addr(_RadioButton61+0)
BL	_DrawRadioButton+0
;ECGsynthetic_events_code.c,2115 :: 		DrawRadioButton(&RadioButton68);
MOVW	R0, #lo_addr(_RadioButton68+0)
MOVT	R0, #hi_addr(_RadioButton68+0)
BL	_DrawRadioButton+0
;ECGsynthetic_events_code.c,2116 :: 		DrawRadioButton(&RadioButton69);
MOVW	R0, #lo_addr(_RadioButton69+0)
MOVT	R0, #hi_addr(_RadioButton69+0)
BL	_DrawRadioButton+0
;ECGsynthetic_events_code.c,2117 :: 		DrawRadioButton(&RadioButton70);
MOVW	R0, #lo_addr(_RadioButton70+0)
MOVT	R0, #hi_addr(_RadioButton70+0)
BL	_DrawRadioButton+0
;ECGsynthetic_events_code.c,2118 :: 		DrawRadioButton(&RadioButton71);
MOVW	R0, #lo_addr(_RadioButton71+0)
MOVT	R0, #hi_addr(_RadioButton71+0)
BL	_DrawRadioButton+0
;ECGsynthetic_events_code.c,2119 :: 		DrawRadioButton(&RadioButton72);
MOVW	R0, #lo_addr(_RadioButton72+0)
MOVT	R0, #hi_addr(_RadioButton72+0)
BL	_DrawRadioButton+0
;ECGsynthetic_events_code.c,2120 :: 		}
L_end_RadioButton67OnPress:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _RadioButton67OnPress
_RadioButton68OnPress:
;ECGsynthetic_events_code.c,2122 :: 		void RadioButton68OnPress() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;ECGsynthetic_events_code.c,2123 :: 		posteriorv2();
BL	_posteriorV2+0
;ECGsynthetic_events_code.c,2124 :: 		applicationTaskDAC();
BL	_applicationTaskDAC+0
;ECGsynthetic_events_code.c,2125 :: 		RadioButton62.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton62+20)
MOVT	R0, #hi_addr(_RadioButton62+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,2126 :: 		RadioButton63.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton63+20)
MOVT	R0, #hi_addr(_RadioButton63+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,2127 :: 		RadioButton64.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton64+20)
MOVT	R0, #hi_addr(_RadioButton64+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,2128 :: 		RadioButton65.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton65+20)
MOVT	R0, #hi_addr(_RadioButton65+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,2129 :: 		RadioButton66.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton66+20)
MOVT	R0, #hi_addr(_RadioButton66+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,2130 :: 		RadioButton67.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton67+20)
MOVT	R0, #hi_addr(_RadioButton67+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,2131 :: 		RadioButton61.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton61+20)
MOVT	R0, #hi_addr(_RadioButton61+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,2132 :: 		RadioButton69.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton69+20)
MOVT	R0, #hi_addr(_RadioButton69+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,2133 :: 		RadioButton70.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton70+20)
MOVT	R0, #hi_addr(_RadioButton70+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,2134 :: 		RadioButton71.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton71+20)
MOVT	R0, #hi_addr(_RadioButton71+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,2135 :: 		RadioButton72.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton72+20)
MOVT	R0, #hi_addr(_RadioButton72+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,2136 :: 		DrawRadioButton(&RadioButton62);
MOVW	R0, #lo_addr(_RadioButton62+0)
MOVT	R0, #hi_addr(_RadioButton62+0)
BL	_DrawRadioButton+0
;ECGsynthetic_events_code.c,2137 :: 		DrawRadioButton(&RadioButton63);
MOVW	R0, #lo_addr(_RadioButton63+0)
MOVT	R0, #hi_addr(_RadioButton63+0)
BL	_DrawRadioButton+0
;ECGsynthetic_events_code.c,2138 :: 		DrawRadioButton(&RadioButton64);
MOVW	R0, #lo_addr(_RadioButton64+0)
MOVT	R0, #hi_addr(_RadioButton64+0)
BL	_DrawRadioButton+0
;ECGsynthetic_events_code.c,2139 :: 		DrawRadioButton(&RadioButton65);
MOVW	R0, #lo_addr(_RadioButton65+0)
MOVT	R0, #hi_addr(_RadioButton65+0)
BL	_DrawRadioButton+0
;ECGsynthetic_events_code.c,2140 :: 		DrawRadioButton(&RadioButton66);
MOVW	R0, #lo_addr(_RadioButton66+0)
MOVT	R0, #hi_addr(_RadioButton66+0)
BL	_DrawRadioButton+0
;ECGsynthetic_events_code.c,2141 :: 		DrawRadioButton(&RadioButton67);
MOVW	R0, #lo_addr(_RadioButton67+0)
MOVT	R0, #hi_addr(_RadioButton67+0)
BL	_DrawRadioButton+0
;ECGsynthetic_events_code.c,2142 :: 		DrawRadioButton(&RadioButton61);
MOVW	R0, #lo_addr(_RadioButton61+0)
MOVT	R0, #hi_addr(_RadioButton61+0)
BL	_DrawRadioButton+0
;ECGsynthetic_events_code.c,2143 :: 		DrawRadioButton(&RadioButton69);
MOVW	R0, #lo_addr(_RadioButton69+0)
MOVT	R0, #hi_addr(_RadioButton69+0)
BL	_DrawRadioButton+0
;ECGsynthetic_events_code.c,2144 :: 		DrawRadioButton(&RadioButton70);
MOVW	R0, #lo_addr(_RadioButton70+0)
MOVT	R0, #hi_addr(_RadioButton70+0)
BL	_DrawRadioButton+0
;ECGsynthetic_events_code.c,2145 :: 		DrawRadioButton(&RadioButton71);
MOVW	R0, #lo_addr(_RadioButton71+0)
MOVT	R0, #hi_addr(_RadioButton71+0)
BL	_DrawRadioButton+0
;ECGsynthetic_events_code.c,2146 :: 		DrawRadioButton(&RadioButton72);
MOVW	R0, #lo_addr(_RadioButton72+0)
MOVT	R0, #hi_addr(_RadioButton72+0)
BL	_DrawRadioButton+0
;ECGsynthetic_events_code.c,2147 :: 		}
L_end_RadioButton68OnPress:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _RadioButton68OnPress
_RadioButton69OnPress:
;ECGsynthetic_events_code.c,2149 :: 		void RadioButton69OnPress() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;ECGsynthetic_events_code.c,2150 :: 		posteriorv3();
BL	_posteriorV3+0
;ECGsynthetic_events_code.c,2151 :: 		applicationTaskDAC();
BL	_applicationTaskDAC+0
;ECGsynthetic_events_code.c,2152 :: 		RadioButton62.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton62+20)
MOVT	R0, #hi_addr(_RadioButton62+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,2153 :: 		RadioButton63.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton63+20)
MOVT	R0, #hi_addr(_RadioButton63+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,2154 :: 		RadioButton64.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton64+20)
MOVT	R0, #hi_addr(_RadioButton64+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,2155 :: 		RadioButton65.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton65+20)
MOVT	R0, #hi_addr(_RadioButton65+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,2156 :: 		RadioButton66.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton66+20)
MOVT	R0, #hi_addr(_RadioButton66+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,2157 :: 		RadioButton67.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton67+20)
MOVT	R0, #hi_addr(_RadioButton67+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,2158 :: 		RadioButton68.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton68+20)
MOVT	R0, #hi_addr(_RadioButton68+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,2159 :: 		RadioButton61.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton61+20)
MOVT	R0, #hi_addr(_RadioButton61+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,2160 :: 		RadioButton70.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton70+20)
MOVT	R0, #hi_addr(_RadioButton70+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,2161 :: 		RadioButton71.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton71+20)
MOVT	R0, #hi_addr(_RadioButton71+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,2162 :: 		RadioButton72.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton72+20)
MOVT	R0, #hi_addr(_RadioButton72+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,2163 :: 		DrawRadioButton(&RadioButton62);
MOVW	R0, #lo_addr(_RadioButton62+0)
MOVT	R0, #hi_addr(_RadioButton62+0)
BL	_DrawRadioButton+0
;ECGsynthetic_events_code.c,2164 :: 		DrawRadioButton(&RadioButton63);
MOVW	R0, #lo_addr(_RadioButton63+0)
MOVT	R0, #hi_addr(_RadioButton63+0)
BL	_DrawRadioButton+0
;ECGsynthetic_events_code.c,2165 :: 		DrawRadioButton(&RadioButton64);
MOVW	R0, #lo_addr(_RadioButton64+0)
MOVT	R0, #hi_addr(_RadioButton64+0)
BL	_DrawRadioButton+0
;ECGsynthetic_events_code.c,2166 :: 		DrawRadioButton(&RadioButton65);
MOVW	R0, #lo_addr(_RadioButton65+0)
MOVT	R0, #hi_addr(_RadioButton65+0)
BL	_DrawRadioButton+0
;ECGsynthetic_events_code.c,2167 :: 		DrawRadioButton(&RadioButton66);
MOVW	R0, #lo_addr(_RadioButton66+0)
MOVT	R0, #hi_addr(_RadioButton66+0)
BL	_DrawRadioButton+0
;ECGsynthetic_events_code.c,2168 :: 		DrawRadioButton(&RadioButton67);
MOVW	R0, #lo_addr(_RadioButton67+0)
MOVT	R0, #hi_addr(_RadioButton67+0)
BL	_DrawRadioButton+0
;ECGsynthetic_events_code.c,2169 :: 		DrawRadioButton(&RadioButton68);
MOVW	R0, #lo_addr(_RadioButton68+0)
MOVT	R0, #hi_addr(_RadioButton68+0)
BL	_DrawRadioButton+0
;ECGsynthetic_events_code.c,2170 :: 		DrawRadioButton(&RadioButton61);
MOVW	R0, #lo_addr(_RadioButton61+0)
MOVT	R0, #hi_addr(_RadioButton61+0)
BL	_DrawRadioButton+0
;ECGsynthetic_events_code.c,2171 :: 		DrawRadioButton(&RadioButton70);
MOVW	R0, #lo_addr(_RadioButton70+0)
MOVT	R0, #hi_addr(_RadioButton70+0)
BL	_DrawRadioButton+0
;ECGsynthetic_events_code.c,2172 :: 		DrawRadioButton(&RadioButton71);
MOVW	R0, #lo_addr(_RadioButton71+0)
MOVT	R0, #hi_addr(_RadioButton71+0)
BL	_DrawRadioButton+0
;ECGsynthetic_events_code.c,2173 :: 		DrawRadioButton(&RadioButton72);
MOVW	R0, #lo_addr(_RadioButton72+0)
MOVT	R0, #hi_addr(_RadioButton72+0)
BL	_DrawRadioButton+0
;ECGsynthetic_events_code.c,2174 :: 		}
L_end_RadioButton69OnPress:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _RadioButton69OnPress
_RadioButton70OnPress:
;ECGsynthetic_events_code.c,2176 :: 		void RadioButton70OnPress() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;ECGsynthetic_events_code.c,2177 :: 		posteriorv4();
BL	_posteriorV4+0
;ECGsynthetic_events_code.c,2178 :: 		applicationTaskDAC();
BL	_applicationTaskDAC+0
;ECGsynthetic_events_code.c,2179 :: 		RadioButton62.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton62+20)
MOVT	R0, #hi_addr(_RadioButton62+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,2180 :: 		RadioButton63.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton63+20)
MOVT	R0, #hi_addr(_RadioButton63+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,2181 :: 		RadioButton64.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton64+20)
MOVT	R0, #hi_addr(_RadioButton64+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,2182 :: 		RadioButton65.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton65+20)
MOVT	R0, #hi_addr(_RadioButton65+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,2183 :: 		RadioButton66.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton66+20)
MOVT	R0, #hi_addr(_RadioButton66+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,2184 :: 		RadioButton67.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton67+20)
MOVT	R0, #hi_addr(_RadioButton67+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,2185 :: 		RadioButton68.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton68+20)
MOVT	R0, #hi_addr(_RadioButton68+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,2186 :: 		RadioButton69.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton69+20)
MOVT	R0, #hi_addr(_RadioButton69+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,2187 :: 		RadioButton61.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton61+20)
MOVT	R0, #hi_addr(_RadioButton61+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,2188 :: 		RadioButton71.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton71+20)
MOVT	R0, #hi_addr(_RadioButton71+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,2189 :: 		RadioButton72.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton72+20)
MOVT	R0, #hi_addr(_RadioButton72+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,2190 :: 		DrawRadioButton(&RadioButton62);
MOVW	R0, #lo_addr(_RadioButton62+0)
MOVT	R0, #hi_addr(_RadioButton62+0)
BL	_DrawRadioButton+0
;ECGsynthetic_events_code.c,2191 :: 		DrawRadioButton(&RadioButton63);
MOVW	R0, #lo_addr(_RadioButton63+0)
MOVT	R0, #hi_addr(_RadioButton63+0)
BL	_DrawRadioButton+0
;ECGsynthetic_events_code.c,2192 :: 		DrawRadioButton(&RadioButton64);
MOVW	R0, #lo_addr(_RadioButton64+0)
MOVT	R0, #hi_addr(_RadioButton64+0)
BL	_DrawRadioButton+0
;ECGsynthetic_events_code.c,2193 :: 		DrawRadioButton(&RadioButton65);
MOVW	R0, #lo_addr(_RadioButton65+0)
MOVT	R0, #hi_addr(_RadioButton65+0)
BL	_DrawRadioButton+0
;ECGsynthetic_events_code.c,2194 :: 		DrawRadioButton(&RadioButton66);
MOVW	R0, #lo_addr(_RadioButton66+0)
MOVT	R0, #hi_addr(_RadioButton66+0)
BL	_DrawRadioButton+0
;ECGsynthetic_events_code.c,2195 :: 		DrawRadioButton(&RadioButton67);
MOVW	R0, #lo_addr(_RadioButton67+0)
MOVT	R0, #hi_addr(_RadioButton67+0)
BL	_DrawRadioButton+0
;ECGsynthetic_events_code.c,2196 :: 		DrawRadioButton(&RadioButton68);
MOVW	R0, #lo_addr(_RadioButton68+0)
MOVT	R0, #hi_addr(_RadioButton68+0)
BL	_DrawRadioButton+0
;ECGsynthetic_events_code.c,2197 :: 		DrawRadioButton(&RadioButton69);
MOVW	R0, #lo_addr(_RadioButton69+0)
MOVT	R0, #hi_addr(_RadioButton69+0)
BL	_DrawRadioButton+0
;ECGsynthetic_events_code.c,2198 :: 		DrawRadioButton(&RadioButton61);
MOVW	R0, #lo_addr(_RadioButton61+0)
MOVT	R0, #hi_addr(_RadioButton61+0)
BL	_DrawRadioButton+0
;ECGsynthetic_events_code.c,2199 :: 		DrawRadioButton(&RadioButton71);
MOVW	R0, #lo_addr(_RadioButton71+0)
MOVT	R0, #hi_addr(_RadioButton71+0)
BL	_DrawRadioButton+0
;ECGsynthetic_events_code.c,2200 :: 		DrawRadioButton(&RadioButton72);
MOVW	R0, #lo_addr(_RadioButton72+0)
MOVT	R0, #hi_addr(_RadioButton72+0)
BL	_DrawRadioButton+0
;ECGsynthetic_events_code.c,2201 :: 		}
L_end_RadioButton70OnPress:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _RadioButton70OnPress
_RadioButton71OnPress:
;ECGsynthetic_events_code.c,2203 :: 		void RadioButton71OnPress() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;ECGsynthetic_events_code.c,2204 :: 		posteriorv5();
BL	_posteriorV5+0
;ECGsynthetic_events_code.c,2205 :: 		applicationTaskDAC();
BL	_applicationTaskDAC+0
;ECGsynthetic_events_code.c,2206 :: 		RadioButton62.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton62+20)
MOVT	R0, #hi_addr(_RadioButton62+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,2207 :: 		RadioButton63.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton63+20)
MOVT	R0, #hi_addr(_RadioButton63+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,2208 :: 		RadioButton64.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton64+20)
MOVT	R0, #hi_addr(_RadioButton64+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,2209 :: 		RadioButton65.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton65+20)
MOVT	R0, #hi_addr(_RadioButton65+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,2210 :: 		RadioButton66.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton66+20)
MOVT	R0, #hi_addr(_RadioButton66+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,2211 :: 		RadioButton67.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton67+20)
MOVT	R0, #hi_addr(_RadioButton67+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,2212 :: 		RadioButton68.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton68+20)
MOVT	R0, #hi_addr(_RadioButton68+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,2213 :: 		RadioButton69.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton69+20)
MOVT	R0, #hi_addr(_RadioButton69+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,2214 :: 		RadioButton70.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton70+20)
MOVT	R0, #hi_addr(_RadioButton70+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,2215 :: 		RadioButton61.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton61+20)
MOVT	R0, #hi_addr(_RadioButton61+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,2216 :: 		RadioButton72.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton72+20)
MOVT	R0, #hi_addr(_RadioButton72+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,2217 :: 		DrawRadioButton(&RadioButton62);
MOVW	R0, #lo_addr(_RadioButton62+0)
MOVT	R0, #hi_addr(_RadioButton62+0)
BL	_DrawRadioButton+0
;ECGsynthetic_events_code.c,2218 :: 		DrawRadioButton(&RadioButton63);
MOVW	R0, #lo_addr(_RadioButton63+0)
MOVT	R0, #hi_addr(_RadioButton63+0)
BL	_DrawRadioButton+0
;ECGsynthetic_events_code.c,2219 :: 		DrawRadioButton(&RadioButton64);
MOVW	R0, #lo_addr(_RadioButton64+0)
MOVT	R0, #hi_addr(_RadioButton64+0)
BL	_DrawRadioButton+0
;ECGsynthetic_events_code.c,2220 :: 		DrawRadioButton(&RadioButton65);
MOVW	R0, #lo_addr(_RadioButton65+0)
MOVT	R0, #hi_addr(_RadioButton65+0)
BL	_DrawRadioButton+0
;ECGsynthetic_events_code.c,2221 :: 		DrawRadioButton(&RadioButton66);
MOVW	R0, #lo_addr(_RadioButton66+0)
MOVT	R0, #hi_addr(_RadioButton66+0)
BL	_DrawRadioButton+0
;ECGsynthetic_events_code.c,2222 :: 		DrawRadioButton(&RadioButton67);
MOVW	R0, #lo_addr(_RadioButton67+0)
MOVT	R0, #hi_addr(_RadioButton67+0)
BL	_DrawRadioButton+0
;ECGsynthetic_events_code.c,2223 :: 		DrawRadioButton(&RadioButton68);
MOVW	R0, #lo_addr(_RadioButton68+0)
MOVT	R0, #hi_addr(_RadioButton68+0)
BL	_DrawRadioButton+0
;ECGsynthetic_events_code.c,2224 :: 		DrawRadioButton(&RadioButton69);
MOVW	R0, #lo_addr(_RadioButton69+0)
MOVT	R0, #hi_addr(_RadioButton69+0)
BL	_DrawRadioButton+0
;ECGsynthetic_events_code.c,2225 :: 		DrawRadioButton(&RadioButton70);
MOVW	R0, #lo_addr(_RadioButton70+0)
MOVT	R0, #hi_addr(_RadioButton70+0)
BL	_DrawRadioButton+0
;ECGsynthetic_events_code.c,2226 :: 		DrawRadioButton(&RadioButton61);
MOVW	R0, #lo_addr(_RadioButton61+0)
MOVT	R0, #hi_addr(_RadioButton61+0)
BL	_DrawRadioButton+0
;ECGsynthetic_events_code.c,2227 :: 		DrawRadioButton(&RadioButton72);
MOVW	R0, #lo_addr(_RadioButton72+0)
MOVT	R0, #hi_addr(_RadioButton72+0)
BL	_DrawRadioButton+0
;ECGsynthetic_events_code.c,2228 :: 		}
L_end_RadioButton71OnPress:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _RadioButton71OnPress
_RadioButton72OnPress:
;ECGsynthetic_events_code.c,2230 :: 		void RadioButton72OnPress() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;ECGsynthetic_events_code.c,2231 :: 		posteriorv6();
BL	_posteriorV6+0
;ECGsynthetic_events_code.c,2232 :: 		applicationTaskDAC();
BL	_applicationTaskDAC+0
;ECGsynthetic_events_code.c,2233 :: 		RadioButton62.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton62+20)
MOVT	R0, #hi_addr(_RadioButton62+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,2234 :: 		RadioButton63.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton63+20)
MOVT	R0, #hi_addr(_RadioButton63+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,2235 :: 		RadioButton64.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton64+20)
MOVT	R0, #hi_addr(_RadioButton64+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,2236 :: 		RadioButton65.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton65+20)
MOVT	R0, #hi_addr(_RadioButton65+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,2237 :: 		RadioButton66.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton66+20)
MOVT	R0, #hi_addr(_RadioButton66+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,2238 :: 		RadioButton67.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton67+20)
MOVT	R0, #hi_addr(_RadioButton67+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,2239 :: 		RadioButton68.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton68+20)
MOVT	R0, #hi_addr(_RadioButton68+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,2240 :: 		RadioButton69.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton69+20)
MOVT	R0, #hi_addr(_RadioButton69+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,2241 :: 		RadioButton70.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton70+20)
MOVT	R0, #hi_addr(_RadioButton70+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,2242 :: 		RadioButton71.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton71+20)
MOVT	R0, #hi_addr(_RadioButton71+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,2243 :: 		RadioButton61.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton61+20)
MOVT	R0, #hi_addr(_RadioButton61+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,2244 :: 		DrawRadioButton(&RadioButton62);
MOVW	R0, #lo_addr(_RadioButton62+0)
MOVT	R0, #hi_addr(_RadioButton62+0)
BL	_DrawRadioButton+0
;ECGsynthetic_events_code.c,2245 :: 		DrawRadioButton(&RadioButton63);
MOVW	R0, #lo_addr(_RadioButton63+0)
MOVT	R0, #hi_addr(_RadioButton63+0)
BL	_DrawRadioButton+0
;ECGsynthetic_events_code.c,2246 :: 		DrawRadioButton(&RadioButton64);
MOVW	R0, #lo_addr(_RadioButton64+0)
MOVT	R0, #hi_addr(_RadioButton64+0)
BL	_DrawRadioButton+0
;ECGsynthetic_events_code.c,2247 :: 		DrawRadioButton(&RadioButton65);
MOVW	R0, #lo_addr(_RadioButton65+0)
MOVT	R0, #hi_addr(_RadioButton65+0)
BL	_DrawRadioButton+0
;ECGsynthetic_events_code.c,2248 :: 		DrawRadioButton(&RadioButton66);
MOVW	R0, #lo_addr(_RadioButton66+0)
MOVT	R0, #hi_addr(_RadioButton66+0)
BL	_DrawRadioButton+0
;ECGsynthetic_events_code.c,2249 :: 		DrawRadioButton(&RadioButton67);
MOVW	R0, #lo_addr(_RadioButton67+0)
MOVT	R0, #hi_addr(_RadioButton67+0)
BL	_DrawRadioButton+0
;ECGsynthetic_events_code.c,2250 :: 		DrawRadioButton(&RadioButton68);
MOVW	R0, #lo_addr(_RadioButton68+0)
MOVT	R0, #hi_addr(_RadioButton68+0)
BL	_DrawRadioButton+0
;ECGsynthetic_events_code.c,2251 :: 		DrawRadioButton(&RadioButton69);
MOVW	R0, #lo_addr(_RadioButton69+0)
MOVT	R0, #hi_addr(_RadioButton69+0)
BL	_DrawRadioButton+0
;ECGsynthetic_events_code.c,2252 :: 		DrawRadioButton(&RadioButton70);
MOVW	R0, #lo_addr(_RadioButton70+0)
MOVT	R0, #hi_addr(_RadioButton70+0)
BL	_DrawRadioButton+0
;ECGsynthetic_events_code.c,2253 :: 		DrawRadioButton(&RadioButton71);
MOVW	R0, #lo_addr(_RadioButton71+0)
MOVT	R0, #hi_addr(_RadioButton71+0)
BL	_DrawRadioButton+0
;ECGsynthetic_events_code.c,2254 :: 		DrawRadioButton(&RadioButton61);
MOVW	R0, #lo_addr(_RadioButton61+0)
MOVT	R0, #hi_addr(_RadioButton61+0)
BL	_DrawRadioButton+0
;ECGsynthetic_events_code.c,2256 :: 		}
L_end_RadioButton72OnPress:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _RadioButton72OnPress
_ButtonRound6OnClick:
;ECGsynthetic_events_code.c,2257 :: 		void ButtonRound6OnClick() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;ECGsynthetic_events_code.c,2258 :: 		i = 0;
MOVS	R1, #0
SXTH	R1, R1
MOVW	R0, #lo_addr(_i+0)
MOVT	R0, #hi_addr(_i+0)
STRH	R1, [R0, #0]
;ECGsynthetic_events_code.c,2259 :: 		DrawScreen(&Screen8);
MOVW	R0, #lo_addr(_Screen8+0)
MOVT	R0, #hi_addr(_Screen8+0)
BL	_DrawScreen+0
;ECGsynthetic_events_code.c,2260 :: 		RadioButton1.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton1+20)
MOVT	R0, #hi_addr(_RadioButton1+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,2261 :: 		RadioButton2.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton2+20)
MOVT	R0, #hi_addr(_RadioButton2+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,2262 :: 		RadioButton15.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton15+20)
MOVT	R0, #hi_addr(_RadioButton15+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,2263 :: 		RadioButton16.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton16+20)
MOVT	R0, #hi_addr(_RadioButton16+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,2264 :: 		RadioButton17.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton17+20)
MOVT	R0, #hi_addr(_RadioButton17+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,2265 :: 		RadioButton18.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton18+20)
MOVT	R0, #hi_addr(_RadioButton18+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,2266 :: 		RadioButton19.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton19+20)
MOVT	R0, #hi_addr(_RadioButton19+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,2267 :: 		RadioButton20.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton20+20)
MOVT	R0, #hi_addr(_RadioButton20+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,2268 :: 		RadioButton21.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton21+20)
MOVT	R0, #hi_addr(_RadioButton21+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,2269 :: 		RadioButton22.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton22+20)
MOVT	R0, #hi_addr(_RadioButton22+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,2270 :: 		RadioButton23.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton23+20)
MOVT	R0, #hi_addr(_RadioButton23+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,2271 :: 		RadioButton24.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton24+20)
MOVT	R0, #hi_addr(_RadioButton24+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,2273 :: 		}
L_end_ButtonRound6OnClick:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _ButtonRound6OnClick
_ButtonRound2OnClick:
;ECGsynthetic_events_code.c,2274 :: 		void ButtonRound2OnClick() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;ECGsynthetic_events_code.c,2275 :: 		DrawScreen(&Screen8);
MOVW	R0, #lo_addr(_Screen8+0)
MOVT	R0, #hi_addr(_Screen8+0)
BL	_DrawScreen+0
;ECGsynthetic_events_code.c,2276 :: 		}
L_end_ButtonRound2OnClick:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _ButtonRound2OnClick
_ButtonRound20OnClick:
;ECGsynthetic_events_code.c,2277 :: 		void ButtonRound20OnClick() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;ECGsynthetic_events_code.c,2278 :: 		DrawScreen(&Screen1);
MOVW	R0, #lo_addr(_Screen1+0)
MOVT	R0, #hi_addr(_Screen1+0)
BL	_DrawScreen+0
;ECGsynthetic_events_code.c,2279 :: 		}
L_end_ButtonRound20OnClick:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _ButtonRound20OnClick
_ButtonRound15OnClick:
;ECGsynthetic_events_code.c,2280 :: 		void ButtonRound15OnClick() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;ECGsynthetic_events_code.c,2281 :: 		DrawScreen(&Screen3);
MOVW	R0, #lo_addr(_Screen3+0)
MOVT	R0, #hi_addr(_Screen3+0)
BL	_DrawScreen+0
;ECGsynthetic_events_code.c,2282 :: 		}
L_end_ButtonRound15OnClick:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _ButtonRound15OnClick
_ButtonRound16OnClick:
;ECGsynthetic_events_code.c,2283 :: 		void ButtonRound16OnClick() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;ECGsynthetic_events_code.c,2284 :: 		DrawScreen(&Screen4);
MOVW	R0, #lo_addr(_Screen4+0)
MOVT	R0, #hi_addr(_Screen4+0)
BL	_DrawScreen+0
;ECGsynthetic_events_code.c,2285 :: 		}
L_end_ButtonRound16OnClick:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _ButtonRound16OnClick
_ButtonRound17OnClick:
;ECGsynthetic_events_code.c,2286 :: 		void ButtonRound17OnClick() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;ECGsynthetic_events_code.c,2287 :: 		DrawScreen(&Screen5);
MOVW	R0, #lo_addr(_Screen5+0)
MOVT	R0, #hi_addr(_Screen5+0)
BL	_DrawScreen+0
;ECGsynthetic_events_code.c,2288 :: 		}
L_end_ButtonRound17OnClick:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _ButtonRound17OnClick
_ButtonRound18OnClick:
;ECGsynthetic_events_code.c,2289 :: 		void ButtonRound18OnClick() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;ECGsynthetic_events_code.c,2290 :: 		DrawScreen(&Screen6);
MOVW	R0, #lo_addr(_Screen6+0)
MOVT	R0, #hi_addr(_Screen6+0)
BL	_DrawScreen+0
;ECGsynthetic_events_code.c,2291 :: 		}
L_end_ButtonRound18OnClick:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _ButtonRound18OnClick
_ButtonRound19OnClick:
;ECGsynthetic_events_code.c,2292 :: 		void ButtonRound19OnClick() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;ECGsynthetic_events_code.c,2293 :: 		DrawScreen(&Screen7);
MOVW	R0, #lo_addr(_Screen7+0)
MOVT	R0, #hi_addr(_Screen7+0)
BL	_DrawScreen+0
;ECGsynthetic_events_code.c,2294 :: 		}
L_end_ButtonRound19OnClick:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _ButtonRound19OnClick
_ButtonRound8OnClick:
;ECGsynthetic_events_code.c,2295 :: 		void ButtonRound8OnClick() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;ECGsynthetic_events_code.c,2296 :: 		i = 0;
MOVS	R1, #0
SXTH	R1, R1
MOVW	R0, #lo_addr(_i+0)
MOVT	R0, #hi_addr(_i+0)
STRH	R1, [R0, #0]
;ECGsynthetic_events_code.c,2297 :: 		DrawScreen(&Screen8);
MOVW	R0, #lo_addr(_Screen8+0)
MOVT	R0, #hi_addr(_Screen8+0)
BL	_DrawScreen+0
;ECGsynthetic_events_code.c,2298 :: 		RadioButton25.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton25+20)
MOVT	R0, #hi_addr(_RadioButton25+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,2299 :: 		RadioButton26.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton26+20)
MOVT	R0, #hi_addr(_RadioButton26+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,2300 :: 		RadioButton27.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton27+20)
MOVT	R0, #hi_addr(_RadioButton27+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,2301 :: 		RadioButton28.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton28+20)
MOVT	R0, #hi_addr(_RadioButton28+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,2302 :: 		RadioButton29.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton29+20)
MOVT	R0, #hi_addr(_RadioButton29+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,2303 :: 		RadioButton30.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton30+20)
MOVT	R0, #hi_addr(_RadioButton30+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,2304 :: 		RadioButton31.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton31+20)
MOVT	R0, #hi_addr(_RadioButton31+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,2305 :: 		RadioButton32.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton32+20)
MOVT	R0, #hi_addr(_RadioButton32+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,2306 :: 		RadioButton33.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton33+20)
MOVT	R0, #hi_addr(_RadioButton33+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,2307 :: 		RadioButton34.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton34+20)
MOVT	R0, #hi_addr(_RadioButton34+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,2308 :: 		RadioButton35.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton35+20)
MOVT	R0, #hi_addr(_RadioButton35+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,2309 :: 		RadioButton36.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton36+20)
MOVT	R0, #hi_addr(_RadioButton36+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,2310 :: 		}
L_end_ButtonRound8OnClick:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _ButtonRound8OnClick
_ButtonRound10OnClick:
;ECGsynthetic_events_code.c,2312 :: 		void ButtonRound10OnClick() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;ECGsynthetic_events_code.c,2313 :: 		i = 0;
MOVS	R1, #0
SXTH	R1, R1
MOVW	R0, #lo_addr(_i+0)
MOVT	R0, #hi_addr(_i+0)
STRH	R1, [R0, #0]
;ECGsynthetic_events_code.c,2314 :: 		DrawScreen(&Screen8);
MOVW	R0, #lo_addr(_Screen8+0)
MOVT	R0, #hi_addr(_Screen8+0)
BL	_DrawScreen+0
;ECGsynthetic_events_code.c,2315 :: 		RadioButton37.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton37+20)
MOVT	R0, #hi_addr(_RadioButton37+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,2316 :: 		RadioButton38.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton38+20)
MOVT	R0, #hi_addr(_RadioButton38+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,2317 :: 		RadioButton39.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton39+20)
MOVT	R0, #hi_addr(_RadioButton39+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,2318 :: 		RadioButton40.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton40+20)
MOVT	R0, #hi_addr(_RadioButton40+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,2319 :: 		RadioButton41.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton41+20)
MOVT	R0, #hi_addr(_RadioButton41+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,2320 :: 		RadioButton42.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton42+20)
MOVT	R0, #hi_addr(_RadioButton42+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,2321 :: 		RadioButton43.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton43+20)
MOVT	R0, #hi_addr(_RadioButton43+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,2322 :: 		RadioButton44.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton44+20)
MOVT	R0, #hi_addr(_RadioButton44+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,2323 :: 		RadioButton45.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton45+20)
MOVT	R0, #hi_addr(_RadioButton45+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,2324 :: 		RadioButton46.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton46+20)
MOVT	R0, #hi_addr(_RadioButton46+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,2325 :: 		RadioButton47.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton47+20)
MOVT	R0, #hi_addr(_RadioButton47+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,2326 :: 		RadioButton48.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton48+20)
MOVT	R0, #hi_addr(_RadioButton48+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,2327 :: 		}
L_end_ButtonRound10OnClick:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _ButtonRound10OnClick
_ButtonRound12OnClick:
;ECGsynthetic_events_code.c,2329 :: 		void ButtonRound12OnClick() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;ECGsynthetic_events_code.c,2330 :: 		i = 0;
MOVS	R1, #0
SXTH	R1, R1
MOVW	R0, #lo_addr(_i+0)
MOVT	R0, #hi_addr(_i+0)
STRH	R1, [R0, #0]
;ECGsynthetic_events_code.c,2331 :: 		DrawScreen(&Screen8);
MOVW	R0, #lo_addr(_Screen8+0)
MOVT	R0, #hi_addr(_Screen8+0)
BL	_DrawScreen+0
;ECGsynthetic_events_code.c,2332 :: 		RadioButton49.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton49+20)
MOVT	R0, #hi_addr(_RadioButton49+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,2333 :: 		RadioButton50.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton50+20)
MOVT	R0, #hi_addr(_RadioButton50+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,2334 :: 		RadioButton51.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton51+20)
MOVT	R0, #hi_addr(_RadioButton51+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,2335 :: 		RadioButton52.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton52+20)
MOVT	R0, #hi_addr(_RadioButton52+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,2336 :: 		RadioButton53.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton53+20)
MOVT	R0, #hi_addr(_RadioButton53+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,2337 :: 		RadioButton54.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton54+20)
MOVT	R0, #hi_addr(_RadioButton54+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,2338 :: 		RadioButton55.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton55+20)
MOVT	R0, #hi_addr(_RadioButton55+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,2339 :: 		RadioButton56.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton56+20)
MOVT	R0, #hi_addr(_RadioButton56+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,2340 :: 		RadioButton57.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton57+20)
MOVT	R0, #hi_addr(_RadioButton57+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,2341 :: 		RadioButton58.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton58+20)
MOVT	R0, #hi_addr(_RadioButton58+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,2342 :: 		RadioButton59.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton59+20)
MOVT	R0, #hi_addr(_RadioButton59+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,2343 :: 		RadioButton60.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton60+20)
MOVT	R0, #hi_addr(_RadioButton60+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,2344 :: 		}
L_end_ButtonRound12OnClick:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _ButtonRound12OnClick
_ButtonRound14OnClick:
;ECGsynthetic_events_code.c,2346 :: 		void ButtonRound14OnClick() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;ECGsynthetic_events_code.c,2347 :: 		i = 0;
MOVS	R1, #0
SXTH	R1, R1
MOVW	R0, #lo_addr(_i+0)
MOVT	R0, #hi_addr(_i+0)
STRH	R1, [R0, #0]
;ECGsynthetic_events_code.c,2348 :: 		DrawScreen(&Screen8);
MOVW	R0, #lo_addr(_Screen8+0)
MOVT	R0, #hi_addr(_Screen8+0)
BL	_DrawScreen+0
;ECGsynthetic_events_code.c,2349 :: 		RadioButton61.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton61+20)
MOVT	R0, #hi_addr(_RadioButton61+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,2350 :: 		RadioButton62.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton62+20)
MOVT	R0, #hi_addr(_RadioButton62+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,2351 :: 		RadioButton63.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton63+20)
MOVT	R0, #hi_addr(_RadioButton63+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,2352 :: 		RadioButton64.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton64+20)
MOVT	R0, #hi_addr(_RadioButton64+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,2353 :: 		RadioButton65.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton65+20)
MOVT	R0, #hi_addr(_RadioButton65+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,2354 :: 		RadioButton66.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton66+20)
MOVT	R0, #hi_addr(_RadioButton66+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,2355 :: 		RadioButton67.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton67+20)
MOVT	R0, #hi_addr(_RadioButton67+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,2356 :: 		RadioButton68.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton68+20)
MOVT	R0, #hi_addr(_RadioButton68+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,2357 :: 		RadioButton69.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton69+20)
MOVT	R0, #hi_addr(_RadioButton69+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,2358 :: 		RadioButton70.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton70+20)
MOVT	R0, #hi_addr(_RadioButton70+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,2359 :: 		RadioButton71.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton71+20)
MOVT	R0, #hi_addr(_RadioButton71+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,2360 :: 		RadioButton72.Checked = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton72+20)
MOVT	R0, #hi_addr(_RadioButton72+20)
STRB	R1, [R0, #0]
;ECGsynthetic_events_code.c,2361 :: 		}
L_end_ButtonRound14OnClick:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _ButtonRound14OnClick
