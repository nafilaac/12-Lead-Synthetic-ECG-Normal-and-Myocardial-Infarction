fusion_v8_STM32F407ZG__getAN_1:
;__fuv8_stm32f407zg_gpio.c,32 :: 		static uint8_t _getAN_1() { return GPIOA_IDR.B4; }
MOVW	R0, #lo_addr(GPIOA_IDR+0)
MOVT	R0, #hi_addr(GPIOA_IDR+0)
_LX	[R0, ByteOffset(GPIOA_IDR+0)]
L_end__getAN_1:
BX	LR
; end of fusion_v8_STM32F407ZG__getAN_1
fusion_v8_STM32F407ZG__getRST_1:
;__fuv8_stm32f407zg_gpio.c,33 :: 		static uint8_t _getRST_1() { return GPIOC_IDR.B2; }
MOVW	R0, #lo_addr(GPIOC_IDR+0)
MOVT	R0, #hi_addr(GPIOC_IDR+0)
_LX	[R0, ByteOffset(GPIOC_IDR+0)]
L_end__getRST_1:
BX	LR
; end of fusion_v8_STM32F407ZG__getRST_1
fusion_v8_STM32F407ZG__getCS_1:
;__fuv8_stm32f407zg_gpio.c,34 :: 		static uint8_t _getCS_1() { return GPIOB_IDR.B12; }
MOVW	R0, #lo_addr(GPIOB_IDR+0)
MOVT	R0, #hi_addr(GPIOB_IDR+0)
_LX	[R0, ByteOffset(GPIOB_IDR+0)]
L_end__getCS_1:
BX	LR
; end of fusion_v8_STM32F407ZG__getCS_1
fusion_v8_STM32F407ZG__getSCK_1:
;__fuv8_stm32f407zg_gpio.c,35 :: 		static uint8_t _getSCK_1() { return GPIOA_IDR.B5; }
MOVW	R0, #lo_addr(GPIOA_IDR+0)
MOVT	R0, #hi_addr(GPIOA_IDR+0)
_LX	[R0, ByteOffset(GPIOA_IDR+0)]
L_end__getSCK_1:
BX	LR
; end of fusion_v8_STM32F407ZG__getSCK_1
fusion_v8_STM32F407ZG__getMISO_1:
;__fuv8_stm32f407zg_gpio.c,36 :: 		static uint8_t _getMISO_1() { return GPIOA_IDR.B6; }
MOVW	R0, #lo_addr(GPIOA_IDR+0)
MOVT	R0, #hi_addr(GPIOA_IDR+0)
_LX	[R0, ByteOffset(GPIOA_IDR+0)]
L_end__getMISO_1:
BX	LR
; end of fusion_v8_STM32F407ZG__getMISO_1
fusion_v8_STM32F407ZG__getMOSI_1:
;__fuv8_stm32f407zg_gpio.c,37 :: 		static uint8_t _getMOSI_1() { return GPIOB_IDR.B5; }
MOVW	R0, #lo_addr(GPIOB_IDR+0)
MOVT	R0, #hi_addr(GPIOB_IDR+0)
_LX	[R0, ByteOffset(GPIOB_IDR+0)]
L_end__getMOSI_1:
BX	LR
; end of fusion_v8_STM32F407ZG__getMOSI_1
fusion_v8_STM32F407ZG__getPWM_1:
;__fuv8_stm32f407zg_gpio.c,38 :: 		static uint8_t _getPWM_1() { return GPIOD_IDR.B12; }
MOVW	R0, #lo_addr(GPIOD_IDR+0)
MOVT	R0, #hi_addr(GPIOD_IDR+0)
_LX	[R0, ByteOffset(GPIOD_IDR+0)]
L_end__getPWM_1:
BX	LR
; end of fusion_v8_STM32F407ZG__getPWM_1
fusion_v8_STM32F407ZG__getINT_1:
;__fuv8_stm32f407zg_gpio.c,39 :: 		static uint8_t _getINT_1() { return GPIOG_IDR.B0; }
MOVW	R0, #lo_addr(GPIOG_IDR+0)
MOVT	R0, #hi_addr(GPIOG_IDR+0)
_LX	[R0, ByteOffset(GPIOG_IDR+0)]
L_end__getINT_1:
BX	LR
; end of fusion_v8_STM32F407ZG__getINT_1
fusion_v8_STM32F407ZG__getRX_1:
;__fuv8_stm32f407zg_gpio.c,40 :: 		static uint8_t _getRX_1() { return GPIOA_IDR.B3; }
MOVW	R0, #lo_addr(GPIOA_IDR+0)
MOVT	R0, #hi_addr(GPIOA_IDR+0)
_LX	[R0, ByteOffset(GPIOA_IDR+0)]
L_end__getRX_1:
BX	LR
; end of fusion_v8_STM32F407ZG__getRX_1
fusion_v8_STM32F407ZG__getTX_1:
;__fuv8_stm32f407zg_gpio.c,41 :: 		static uint8_t _getTX_1() { return GPIOD_IDR.B5; }
MOVW	R0, #lo_addr(GPIOD_IDR+0)
MOVT	R0, #hi_addr(GPIOD_IDR+0)
_LX	[R0, ByteOffset(GPIOD_IDR+0)]
L_end__getTX_1:
BX	LR
; end of fusion_v8_STM32F407ZG__getTX_1
fusion_v8_STM32F407ZG__getSCL_1:
;__fuv8_stm32f407zg_gpio.c,42 :: 		static uint8_t _getSCL_1() { return GPIOF_IDR.B1; }
MOVW	R0, #lo_addr(GPIOF_IDR+0)
MOVT	R0, #hi_addr(GPIOF_IDR+0)
_LX	[R0, ByteOffset(GPIOF_IDR+0)]
L_end__getSCL_1:
BX	LR
; end of fusion_v8_STM32F407ZG__getSCL_1
fusion_v8_STM32F407ZG__getSDA_1:
;__fuv8_stm32f407zg_gpio.c,43 :: 		static uint8_t _getSDA_1() { return GPIOF_IDR.B0; }
MOVW	R0, #lo_addr(GPIOF_IDR+0)
MOVT	R0, #hi_addr(GPIOF_IDR+0)
_LX	[R0, ByteOffset(GPIOF_IDR+0)]
L_end__getSDA_1:
BX	LR
; end of fusion_v8_STM32F407ZG__getSDA_1
fusion_v8_STM32F407ZG__setAN_1:
;__fuv8_stm32f407zg_gpio.c,44 :: 		static void _setAN_1(uint8_t value) { GPIOA_ODR.B4 = value; }
; value start address is: 0 (R0)
; value end address is: 0 (R0)
; value start address is: 0 (R0)
MOVW	R1, #lo_addr(GPIOA_ODR+0)
MOVT	R1, #hi_addr(GPIOA_ODR+0)
_SX	[R1, ByteOffset(GPIOA_ODR+0)]
; value end address is: 0 (R0)
L_end__setAN_1:
BX	LR
; end of fusion_v8_STM32F407ZG__setAN_1
fusion_v8_STM32F407ZG__setRST_1:
;__fuv8_stm32f407zg_gpio.c,45 :: 		static void _setRST_1(uint8_t value) { GPIOC_ODR.B2 = value; }
; value start address is: 0 (R0)
; value end address is: 0 (R0)
; value start address is: 0 (R0)
MOVW	R1, #lo_addr(GPIOC_ODR+0)
MOVT	R1, #hi_addr(GPIOC_ODR+0)
_SX	[R1, ByteOffset(GPIOC_ODR+0)]
; value end address is: 0 (R0)
L_end__setRST_1:
BX	LR
; end of fusion_v8_STM32F407ZG__setRST_1
fusion_v8_STM32F407ZG__setCS_1:
;__fuv8_stm32f407zg_gpio.c,46 :: 		static void _setCS_1(uint8_t value) { GPIOB_ODR.B12 = value; }
; value start address is: 0 (R0)
; value end address is: 0 (R0)
; value start address is: 0 (R0)
MOVW	R1, #lo_addr(GPIOB_ODR+0)
MOVT	R1, #hi_addr(GPIOB_ODR+0)
_SX	[R1, ByteOffset(GPIOB_ODR+0)]
; value end address is: 0 (R0)
L_end__setCS_1:
BX	LR
; end of fusion_v8_STM32F407ZG__setCS_1
fusion_v8_STM32F407ZG__setSCK_1:
;__fuv8_stm32f407zg_gpio.c,47 :: 		static void _setSCK_1(uint8_t value) { GPIOA_ODR.B5 = value; }
; value start address is: 0 (R0)
; value end address is: 0 (R0)
; value start address is: 0 (R0)
MOVW	R1, #lo_addr(GPIOA_ODR+0)
MOVT	R1, #hi_addr(GPIOA_ODR+0)
_SX	[R1, ByteOffset(GPIOA_ODR+0)]
; value end address is: 0 (R0)
L_end__setSCK_1:
BX	LR
; end of fusion_v8_STM32F407ZG__setSCK_1
fusion_v8_STM32F407ZG__setMISO_1:
;__fuv8_stm32f407zg_gpio.c,48 :: 		static void _setMISO_1(uint8_t value) { GPIOA_ODR.B6 = value; }
; value start address is: 0 (R0)
; value end address is: 0 (R0)
; value start address is: 0 (R0)
MOVW	R1, #lo_addr(GPIOA_ODR+0)
MOVT	R1, #hi_addr(GPIOA_ODR+0)
_SX	[R1, ByteOffset(GPIOA_ODR+0)]
; value end address is: 0 (R0)
L_end__setMISO_1:
BX	LR
; end of fusion_v8_STM32F407ZG__setMISO_1
fusion_v8_STM32F407ZG__setMOSI_1:
;__fuv8_stm32f407zg_gpio.c,49 :: 		static void _setMOSI_1(uint8_t value) { GPIOB_ODR.B5 = value; }
; value start address is: 0 (R0)
; value end address is: 0 (R0)
; value start address is: 0 (R0)
MOVW	R1, #lo_addr(GPIOB_ODR+0)
MOVT	R1, #hi_addr(GPIOB_ODR+0)
_SX	[R1, ByteOffset(GPIOB_ODR+0)]
; value end address is: 0 (R0)
L_end__setMOSI_1:
BX	LR
; end of fusion_v8_STM32F407ZG__setMOSI_1
fusion_v8_STM32F407ZG__setPWM_1:
;__fuv8_stm32f407zg_gpio.c,50 :: 		static void _setPWM_1(uint8_t value) { GPIOD_ODR.B12 = value; }
; value start address is: 0 (R0)
; value end address is: 0 (R0)
; value start address is: 0 (R0)
MOVW	R1, #lo_addr(GPIOD_ODR+0)
MOVT	R1, #hi_addr(GPIOD_ODR+0)
_SX	[R1, ByteOffset(GPIOD_ODR+0)]
; value end address is: 0 (R0)
L_end__setPWM_1:
BX	LR
; end of fusion_v8_STM32F407ZG__setPWM_1
fusion_v8_STM32F407ZG__setINT_1:
;__fuv8_stm32f407zg_gpio.c,51 :: 		static void _setINT_1(uint8_t value) { GPIOG_ODR.B0 = value; }
; value start address is: 0 (R0)
; value end address is: 0 (R0)
; value start address is: 0 (R0)
MOVW	R1, #lo_addr(GPIOG_ODR+0)
MOVT	R1, #hi_addr(GPIOG_ODR+0)
_SX	[R1, ByteOffset(GPIOG_ODR+0)]
; value end address is: 0 (R0)
L_end__setINT_1:
BX	LR
; end of fusion_v8_STM32F407ZG__setINT_1
fusion_v8_STM32F407ZG__setRX_1:
;__fuv8_stm32f407zg_gpio.c,52 :: 		static void _setRX_1(uint8_t value) { GPIOA_ODR.B3 = value; }
; value start address is: 0 (R0)
; value end address is: 0 (R0)
; value start address is: 0 (R0)
MOVW	R1, #lo_addr(GPIOA_ODR+0)
MOVT	R1, #hi_addr(GPIOA_ODR+0)
_SX	[R1, ByteOffset(GPIOA_ODR+0)]
; value end address is: 0 (R0)
L_end__setRX_1:
BX	LR
; end of fusion_v8_STM32F407ZG__setRX_1
fusion_v8_STM32F407ZG__setTX_1:
;__fuv8_stm32f407zg_gpio.c,53 :: 		static void _setTX_1(uint8_t value) { GPIOD_ODR.B5 = value; }
; value start address is: 0 (R0)
; value end address is: 0 (R0)
; value start address is: 0 (R0)
MOVW	R1, #lo_addr(GPIOD_ODR+0)
MOVT	R1, #hi_addr(GPIOD_ODR+0)
_SX	[R1, ByteOffset(GPIOD_ODR+0)]
; value end address is: 0 (R0)
L_end__setTX_1:
BX	LR
; end of fusion_v8_STM32F407ZG__setTX_1
fusion_v8_STM32F407ZG__setSCL_1:
;__fuv8_stm32f407zg_gpio.c,54 :: 		static void _setSCL_1(uint8_t value) { GPIOF_ODR.B1 = value; }
; value start address is: 0 (R0)
; value end address is: 0 (R0)
; value start address is: 0 (R0)
MOVW	R1, #lo_addr(GPIOF_ODR+0)
MOVT	R1, #hi_addr(GPIOF_ODR+0)
_SX	[R1, ByteOffset(GPIOF_ODR+0)]
; value end address is: 0 (R0)
L_end__setSCL_1:
BX	LR
; end of fusion_v8_STM32F407ZG__setSCL_1
fusion_v8_STM32F407ZG__setSDA_1:
;__fuv8_stm32f407zg_gpio.c,55 :: 		static void _setSDA_1(uint8_t value) { GPIOF_ODR.B0 = value; }
; value start address is: 0 (R0)
; value end address is: 0 (R0)
; value start address is: 0 (R0)
MOVW	R1, #lo_addr(GPIOF_ODR+0)
MOVT	R1, #hi_addr(GPIOF_ODR+0)
_SX	[R1, ByteOffset(GPIOF_ODR+0)]
; value end address is: 0 (R0)
L_end__setSDA_1:
BX	LR
; end of fusion_v8_STM32F407ZG__setSDA_1
fusion_v8_STM32F407ZG__getAN_2:
;__fuv8_stm32f407zg_gpio.c,58 :: 		static uint8_t _getAN_2() { return GPIOB_IDR.B0; }
MOVW	R0, #lo_addr(GPIOB_IDR+0)
MOVT	R0, #hi_addr(GPIOB_IDR+0)
_LX	[R0, ByteOffset(GPIOB_IDR+0)]
L_end__getAN_2:
BX	LR
; end of fusion_v8_STM32F407ZG__getAN_2
fusion_v8_STM32F407ZG__getRST_2:
;__fuv8_stm32f407zg_gpio.c,59 :: 		static uint8_t _getRST_2() { return GPIOC_IDR.B3; }
MOVW	R0, #lo_addr(GPIOC_IDR+0)
MOVT	R0, #hi_addr(GPIOC_IDR+0)
_LX	[R0, ByteOffset(GPIOC_IDR+0)]
L_end__getRST_2:
BX	LR
; end of fusion_v8_STM32F407ZG__getRST_2
fusion_v8_STM32F407ZG__getCS_2:
;__fuv8_stm32f407zg_gpio.c,60 :: 		static uint8_t _getCS_2() { return GPIOA_IDR.B15; }
MOVW	R0, #lo_addr(GPIOA_IDR+0)
MOVT	R0, #hi_addr(GPIOA_IDR+0)
_LX	[R0, ByteOffset(GPIOA_IDR+0)]
L_end__getCS_2:
BX	LR
; end of fusion_v8_STM32F407ZG__getCS_2
fusion_v8_STM32F407ZG__getSCK_2:
;__fuv8_stm32f407zg_gpio.c,61 :: 		static uint8_t _getSCK_2() { return GPIOA_IDR.B5; }
MOVW	R0, #lo_addr(GPIOA_IDR+0)
MOVT	R0, #hi_addr(GPIOA_IDR+0)
_LX	[R0, ByteOffset(GPIOA_IDR+0)]
L_end__getSCK_2:
BX	LR
; end of fusion_v8_STM32F407ZG__getSCK_2
fusion_v8_STM32F407ZG__getMISO_2:
;__fuv8_stm32f407zg_gpio.c,62 :: 		static uint8_t _getMISO_2() { return GPIOA_IDR.B6; }
MOVW	R0, #lo_addr(GPIOA_IDR+0)
MOVT	R0, #hi_addr(GPIOA_IDR+0)
_LX	[R0, ByteOffset(GPIOA_IDR+0)]
L_end__getMISO_2:
BX	LR
; end of fusion_v8_STM32F407ZG__getMISO_2
fusion_v8_STM32F407ZG__getMOSI_2:
;__fuv8_stm32f407zg_gpio.c,63 :: 		static uint8_t _getMOSI_2() { return GPIOB_IDR.B5; }
MOVW	R0, #lo_addr(GPIOB_IDR+0)
MOVT	R0, #hi_addr(GPIOB_IDR+0)
_LX	[R0, ByteOffset(GPIOB_IDR+0)]
L_end__getMOSI_2:
BX	LR
; end of fusion_v8_STM32F407ZG__getMOSI_2
fusion_v8_STM32F407ZG__getPWM_2:
;__fuv8_stm32f407zg_gpio.c,64 :: 		static uint8_t _getPWM_2() { return GPIOD_IDR.B13; }
MOVW	R0, #lo_addr(GPIOD_IDR+0)
MOVT	R0, #hi_addr(GPIOD_IDR+0)
_LX	[R0, ByteOffset(GPIOD_IDR+0)]
L_end__getPWM_2:
BX	LR
; end of fusion_v8_STM32F407ZG__getPWM_2
fusion_v8_STM32F407ZG__getINT_2:
;__fuv8_stm32f407zg_gpio.c,65 :: 		static uint8_t _getINT_2() { return GPIOG_IDR.B1; }
MOVW	R0, #lo_addr(GPIOG_IDR+0)
MOVT	R0, #hi_addr(GPIOG_IDR+0)
_LX	[R0, ByteOffset(GPIOG_IDR+0)]
L_end__getINT_2:
BX	LR
; end of fusion_v8_STM32F407ZG__getINT_2
fusion_v8_STM32F407ZG__getRX_2:
;__fuv8_stm32f407zg_gpio.c,66 :: 		static uint8_t _getRX_2() { return GPIOA_IDR.B3; }
MOVW	R0, #lo_addr(GPIOA_IDR+0)
MOVT	R0, #hi_addr(GPIOA_IDR+0)
_LX	[R0, ByteOffset(GPIOA_IDR+0)]
L_end__getRX_2:
BX	LR
; end of fusion_v8_STM32F407ZG__getRX_2
fusion_v8_STM32F407ZG__getTX_2:
;__fuv8_stm32f407zg_gpio.c,67 :: 		static uint8_t _getTX_2() { return GPIOD_IDR.B5; }
MOVW	R0, #lo_addr(GPIOD_IDR+0)
MOVT	R0, #hi_addr(GPIOD_IDR+0)
_LX	[R0, ByteOffset(GPIOD_IDR+0)]
L_end__getTX_2:
BX	LR
; end of fusion_v8_STM32F407ZG__getTX_2
fusion_v8_STM32F407ZG__getSCL_2:
;__fuv8_stm32f407zg_gpio.c,68 :: 		static uint8_t _getSCL_2() { return GPIOF_IDR.B1; }
MOVW	R0, #lo_addr(GPIOF_IDR+0)
MOVT	R0, #hi_addr(GPIOF_IDR+0)
_LX	[R0, ByteOffset(GPIOF_IDR+0)]
L_end__getSCL_2:
BX	LR
; end of fusion_v8_STM32F407ZG__getSCL_2
fusion_v8_STM32F407ZG__getSDA_2:
;__fuv8_stm32f407zg_gpio.c,69 :: 		static uint8_t _getSDA_2() { return GPIOF_IDR.B0; }
MOVW	R0, #lo_addr(GPIOF_IDR+0)
MOVT	R0, #hi_addr(GPIOF_IDR+0)
_LX	[R0, ByteOffset(GPIOF_IDR+0)]
L_end__getSDA_2:
BX	LR
; end of fusion_v8_STM32F407ZG__getSDA_2
fusion_v8_STM32F407ZG__setAN_2:
;__fuv8_stm32f407zg_gpio.c,70 :: 		static void _setAN_2(uint8_t value) { GPIOB_ODR.B0 = value; }
; value start address is: 0 (R0)
; value end address is: 0 (R0)
; value start address is: 0 (R0)
MOVW	R1, #lo_addr(GPIOB_ODR+0)
MOVT	R1, #hi_addr(GPIOB_ODR+0)
_SX	[R1, ByteOffset(GPIOB_ODR+0)]
; value end address is: 0 (R0)
L_end__setAN_2:
BX	LR
; end of fusion_v8_STM32F407ZG__setAN_2
fusion_v8_STM32F407ZG__setRST_2:
;__fuv8_stm32f407zg_gpio.c,71 :: 		static void _setRST_2(uint8_t value) { GPIOC_ODR.B3 = value; }
; value start address is: 0 (R0)
; value end address is: 0 (R0)
; value start address is: 0 (R0)
MOVW	R1, #lo_addr(GPIOC_ODR+0)
MOVT	R1, #hi_addr(GPIOC_ODR+0)
_SX	[R1, ByteOffset(GPIOC_ODR+0)]
; value end address is: 0 (R0)
L_end__setRST_2:
BX	LR
; end of fusion_v8_STM32F407ZG__setRST_2
fusion_v8_STM32F407ZG__setCS_2:
;__fuv8_stm32f407zg_gpio.c,72 :: 		static void _setCS_2(uint8_t value) { GPIOA_ODR.B15 = value; }
; value start address is: 0 (R0)
; value end address is: 0 (R0)
; value start address is: 0 (R0)
MOVW	R1, #lo_addr(GPIOA_ODR+0)
MOVT	R1, #hi_addr(GPIOA_ODR+0)
_SX	[R1, ByteOffset(GPIOA_ODR+0)]
; value end address is: 0 (R0)
L_end__setCS_2:
BX	LR
; end of fusion_v8_STM32F407ZG__setCS_2
fusion_v8_STM32F407ZG__setSCK_2:
;__fuv8_stm32f407zg_gpio.c,73 :: 		static void _setSCK_2(uint8_t value) { GPIOA_ODR.B5 = value; }
; value start address is: 0 (R0)
; value end address is: 0 (R0)
; value start address is: 0 (R0)
MOVW	R1, #lo_addr(GPIOA_ODR+0)
MOVT	R1, #hi_addr(GPIOA_ODR+0)
_SX	[R1, ByteOffset(GPIOA_ODR+0)]
; value end address is: 0 (R0)
L_end__setSCK_2:
BX	LR
; end of fusion_v8_STM32F407ZG__setSCK_2
fusion_v8_STM32F407ZG__setMISO_2:
;__fuv8_stm32f407zg_gpio.c,74 :: 		static void _setMISO_2(uint8_t value) { GPIOA_ODR.B6 = value; }
; value start address is: 0 (R0)
; value end address is: 0 (R0)
; value start address is: 0 (R0)
MOVW	R1, #lo_addr(GPIOA_ODR+0)
MOVT	R1, #hi_addr(GPIOA_ODR+0)
_SX	[R1, ByteOffset(GPIOA_ODR+0)]
; value end address is: 0 (R0)
L_end__setMISO_2:
BX	LR
; end of fusion_v8_STM32F407ZG__setMISO_2
fusion_v8_STM32F407ZG__setMOSI_2:
;__fuv8_stm32f407zg_gpio.c,75 :: 		static void _setMOSI_2(uint8_t value) { GPIOB_ODR.B5 = value; }
; value start address is: 0 (R0)
; value end address is: 0 (R0)
; value start address is: 0 (R0)
MOVW	R1, #lo_addr(GPIOB_ODR+0)
MOVT	R1, #hi_addr(GPIOB_ODR+0)
_SX	[R1, ByteOffset(GPIOB_ODR+0)]
; value end address is: 0 (R0)
L_end__setMOSI_2:
BX	LR
; end of fusion_v8_STM32F407ZG__setMOSI_2
fusion_v8_STM32F407ZG__setPWM_2:
;__fuv8_stm32f407zg_gpio.c,76 :: 		static void _setPWM_2(uint8_t value) { GPIOD_ODR.B13 = value; }
; value start address is: 0 (R0)
; value end address is: 0 (R0)
; value start address is: 0 (R0)
MOVW	R1, #lo_addr(GPIOD_ODR+0)
MOVT	R1, #hi_addr(GPIOD_ODR+0)
_SX	[R1, ByteOffset(GPIOD_ODR+0)]
; value end address is: 0 (R0)
L_end__setPWM_2:
BX	LR
; end of fusion_v8_STM32F407ZG__setPWM_2
fusion_v8_STM32F407ZG__setINT_2:
;__fuv8_stm32f407zg_gpio.c,77 :: 		static void _setINT_2(uint8_t value) { GPIOG_ODR.B1 = value; }
; value start address is: 0 (R0)
; value end address is: 0 (R0)
; value start address is: 0 (R0)
MOVW	R1, #lo_addr(GPIOG_ODR+0)
MOVT	R1, #hi_addr(GPIOG_ODR+0)
_SX	[R1, ByteOffset(GPIOG_ODR+0)]
; value end address is: 0 (R0)
L_end__setINT_2:
BX	LR
; end of fusion_v8_STM32F407ZG__setINT_2
fusion_v8_STM32F407ZG__setRX_2:
;__fuv8_stm32f407zg_gpio.c,78 :: 		static void _setRX_2(uint8_t value) { GPIOA_ODR.B3 = value; }
; value start address is: 0 (R0)
; value end address is: 0 (R0)
; value start address is: 0 (R0)
MOVW	R1, #lo_addr(GPIOA_ODR+0)
MOVT	R1, #hi_addr(GPIOA_ODR+0)
_SX	[R1, ByteOffset(GPIOA_ODR+0)]
; value end address is: 0 (R0)
L_end__setRX_2:
BX	LR
; end of fusion_v8_STM32F407ZG__setRX_2
fusion_v8_STM32F407ZG__setTX_2:
;__fuv8_stm32f407zg_gpio.c,79 :: 		static void _setTX_2(uint8_t value) { GPIOD_ODR.B5 = value; }
; value start address is: 0 (R0)
; value end address is: 0 (R0)
; value start address is: 0 (R0)
MOVW	R1, #lo_addr(GPIOD_ODR+0)
MOVT	R1, #hi_addr(GPIOD_ODR+0)
_SX	[R1, ByteOffset(GPIOD_ODR+0)]
; value end address is: 0 (R0)
L_end__setTX_2:
BX	LR
; end of fusion_v8_STM32F407ZG__setTX_2
fusion_v8_STM32F407ZG__setSCL_2:
;__fuv8_stm32f407zg_gpio.c,80 :: 		static void _setSCL_2(uint8_t value) { GPIOF_ODR.B1 = value; }
; value start address is: 0 (R0)
; value end address is: 0 (R0)
; value start address is: 0 (R0)
MOVW	R1, #lo_addr(GPIOF_ODR+0)
MOVT	R1, #hi_addr(GPIOF_ODR+0)
_SX	[R1, ByteOffset(GPIOF_ODR+0)]
; value end address is: 0 (R0)
L_end__setSCL_2:
BX	LR
; end of fusion_v8_STM32F407ZG__setSCL_2
fusion_v8_STM32F407ZG__setSDA_2:
;__fuv8_stm32f407zg_gpio.c,81 :: 		static void _setSDA_2(uint8_t value) { GPIOF_ODR.B0 = value; }
; value start address is: 0 (R0)
; value end address is: 0 (R0)
; value start address is: 0 (R0)
MOVW	R1, #lo_addr(GPIOF_ODR+0)
MOVT	R1, #hi_addr(GPIOF_ODR+0)
_SX	[R1, ByteOffset(GPIOF_ODR+0)]
; value end address is: 0 (R0)
L_end__setSDA_2:
BX	LR
; end of fusion_v8_STM32F407ZG__setSDA_2
fusion_v8_STM32F407ZG__getAN_3:
;__fuv8_stm32f407zg_gpio.c,84 :: 		static uint8_t _getAN_3() { return GPIOB_IDR.B1; }
MOVW	R0, #lo_addr(GPIOB_IDR+0)
MOVT	R0, #hi_addr(GPIOB_IDR+0)
_LX	[R0, ByteOffset(GPIOB_IDR+0)]
L_end__getAN_3:
BX	LR
; end of fusion_v8_STM32F407ZG__getAN_3
fusion_v8_STM32F407ZG__getRST_3:
;__fuv8_stm32f407zg_gpio.c,85 :: 		static uint8_t _getRST_3() { return GPIOC_IDR.B13; }
MOVW	R0, #lo_addr(GPIOC_IDR+0)
MOVT	R0, #hi_addr(GPIOC_IDR+0)
_LX	[R0, ByteOffset(GPIOC_IDR+0)]
L_end__getRST_3:
BX	LR
; end of fusion_v8_STM32F407ZG__getRST_3
fusion_v8_STM32F407ZG__getCS_3:
;__fuv8_stm32f407zg_gpio.c,86 :: 		static uint8_t _getCS_3() { return GPIOB_IDR.B12; }
MOVW	R0, #lo_addr(GPIOB_IDR+0)
MOVT	R0, #hi_addr(GPIOB_IDR+0)
_LX	[R0, ByteOffset(GPIOB_IDR+0)]
L_end__getCS_3:
BX	LR
; end of fusion_v8_STM32F407ZG__getCS_3
fusion_v8_STM32F407ZG__getSCK_3:
;__fuv8_stm32f407zg_gpio.c,87 :: 		static uint8_t _getSCK_3() { return GPIOA_IDR.B5; }
MOVW	R0, #lo_addr(GPIOA_IDR+0)
MOVT	R0, #hi_addr(GPIOA_IDR+0)
_LX	[R0, ByteOffset(GPIOA_IDR+0)]
L_end__getSCK_3:
BX	LR
; end of fusion_v8_STM32F407ZG__getSCK_3
fusion_v8_STM32F407ZG__getMISO_3:
;__fuv8_stm32f407zg_gpio.c,88 :: 		static uint8_t _getMISO_3() { return GPIOA_IDR.B6; }
MOVW	R0, #lo_addr(GPIOA_IDR+0)
MOVT	R0, #hi_addr(GPIOA_IDR+0)
_LX	[R0, ByteOffset(GPIOA_IDR+0)]
L_end__getMISO_3:
BX	LR
; end of fusion_v8_STM32F407ZG__getMISO_3
fusion_v8_STM32F407ZG__getMOSI_3:
;__fuv8_stm32f407zg_gpio.c,89 :: 		static uint8_t _getMOSI_3() { return GPIOB_IDR.B5; }
MOVW	R0, #lo_addr(GPIOB_IDR+0)
MOVT	R0, #hi_addr(GPIOB_IDR+0)
_LX	[R0, ByteOffset(GPIOB_IDR+0)]
L_end__getMOSI_3:
BX	LR
; end of fusion_v8_STM32F407ZG__getMOSI_3
fusion_v8_STM32F407ZG__getPWM_3:
;__fuv8_stm32f407zg_gpio.c,90 :: 		static uint8_t _getPWM_3() { return GPIOB_IDR.B3; }
MOVW	R0, #lo_addr(GPIOB_IDR+0)
MOVT	R0, #hi_addr(GPIOB_IDR+0)
_LX	[R0, ByteOffset(GPIOB_IDR+0)]
L_end__getPWM_3:
BX	LR
; end of fusion_v8_STM32F407ZG__getPWM_3
fusion_v8_STM32F407ZG__getINT_3:
;__fuv8_stm32f407zg_gpio.c,91 :: 		static uint8_t _getINT_3() { return GPIOG_IDR.B2; }
MOVW	R0, #lo_addr(GPIOG_IDR+0)
MOVT	R0, #hi_addr(GPIOG_IDR+0)
_LX	[R0, ByteOffset(GPIOG_IDR+0)]
L_end__getINT_3:
BX	LR
; end of fusion_v8_STM32F407ZG__getINT_3
fusion_v8_STM32F407ZG__getRX_3:
;__fuv8_stm32f407zg_gpio.c,92 :: 		static uint8_t _getRX_3() { return GPIOC_IDR.B7; }
MOVW	R0, #lo_addr(GPIOC_IDR+0)
MOVT	R0, #hi_addr(GPIOC_IDR+0)
_LX	[R0, ByteOffset(GPIOC_IDR+0)]
L_end__getRX_3:
BX	LR
; end of fusion_v8_STM32F407ZG__getRX_3
fusion_v8_STM32F407ZG__getTX_3:
;__fuv8_stm32f407zg_gpio.c,93 :: 		static uint8_t _getTX_3() { return GPIOC_IDR.B6; }
MOVW	R0, #lo_addr(GPIOC_IDR+0)
MOVT	R0, #hi_addr(GPIOC_IDR+0)
_LX	[R0, ByteOffset(GPIOC_IDR+0)]
L_end__getTX_3:
BX	LR
; end of fusion_v8_STM32F407ZG__getTX_3
fusion_v8_STM32F407ZG__getSCL_3:
;__fuv8_stm32f407zg_gpio.c,94 :: 		static uint8_t _getSCL_3() { return GPIOF_IDR.B1; }
MOVW	R0, #lo_addr(GPIOF_IDR+0)
MOVT	R0, #hi_addr(GPIOF_IDR+0)
_LX	[R0, ByteOffset(GPIOF_IDR+0)]
L_end__getSCL_3:
BX	LR
; end of fusion_v8_STM32F407ZG__getSCL_3
fusion_v8_STM32F407ZG__getSDA_3:
;__fuv8_stm32f407zg_gpio.c,95 :: 		static uint8_t _getSDA_3() { return GPIOF_IDR.B0; }
MOVW	R0, #lo_addr(GPIOF_IDR+0)
MOVT	R0, #hi_addr(GPIOF_IDR+0)
_LX	[R0, ByteOffset(GPIOF_IDR+0)]
L_end__getSDA_3:
BX	LR
; end of fusion_v8_STM32F407ZG__getSDA_3
fusion_v8_STM32F407ZG__setAN_3:
;__fuv8_stm32f407zg_gpio.c,96 :: 		static void _setAN_3(uint8_t value) { GPIOB_ODR.B1 = value; }
; value start address is: 0 (R0)
; value end address is: 0 (R0)
; value start address is: 0 (R0)
MOVW	R1, #lo_addr(GPIOB_ODR+0)
MOVT	R1, #hi_addr(GPIOB_ODR+0)
_SX	[R1, ByteOffset(GPIOB_ODR+0)]
; value end address is: 0 (R0)
L_end__setAN_3:
BX	LR
; end of fusion_v8_STM32F407ZG__setAN_3
fusion_v8_STM32F407ZG__setRST_3:
;__fuv8_stm32f407zg_gpio.c,97 :: 		static void _setRST_3(uint8_t value) { GPIOC_ODR.B13 = value; }
; value start address is: 0 (R0)
; value end address is: 0 (R0)
; value start address is: 0 (R0)
MOVW	R1, #lo_addr(GPIOC_ODR+0)
MOVT	R1, #hi_addr(GPIOC_ODR+0)
_SX	[R1, ByteOffset(GPIOC_ODR+0)]
; value end address is: 0 (R0)
L_end__setRST_3:
BX	LR
; end of fusion_v8_STM32F407ZG__setRST_3
fusion_v8_STM32F407ZG__setCS_3:
;__fuv8_stm32f407zg_gpio.c,98 :: 		static void _setCS_3(uint8_t value) { GPIOB_ODR.B12 = value; }
; value start address is: 0 (R0)
; value end address is: 0 (R0)
; value start address is: 0 (R0)
MOVW	R1, #lo_addr(GPIOB_ODR+0)
MOVT	R1, #hi_addr(GPIOB_ODR+0)
_SX	[R1, ByteOffset(GPIOB_ODR+0)]
; value end address is: 0 (R0)
L_end__setCS_3:
BX	LR
; end of fusion_v8_STM32F407ZG__setCS_3
fusion_v8_STM32F407ZG__setSCK_3:
;__fuv8_stm32f407zg_gpio.c,99 :: 		static void _setSCK_3(uint8_t value) { GPIOA_ODR.B5 = value; }
; value start address is: 0 (R0)
; value end address is: 0 (R0)
; value start address is: 0 (R0)
MOVW	R1, #lo_addr(GPIOA_ODR+0)
MOVT	R1, #hi_addr(GPIOA_ODR+0)
_SX	[R1, ByteOffset(GPIOA_ODR+0)]
; value end address is: 0 (R0)
L_end__setSCK_3:
BX	LR
; end of fusion_v8_STM32F407ZG__setSCK_3
fusion_v8_STM32F407ZG__setMISO_3:
;__fuv8_stm32f407zg_gpio.c,100 :: 		static void _setMISO_3(uint8_t value) { GPIOA_ODR.B6 = value; }
; value start address is: 0 (R0)
; value end address is: 0 (R0)
; value start address is: 0 (R0)
MOVW	R1, #lo_addr(GPIOA_ODR+0)
MOVT	R1, #hi_addr(GPIOA_ODR+0)
_SX	[R1, ByteOffset(GPIOA_ODR+0)]
; value end address is: 0 (R0)
L_end__setMISO_3:
BX	LR
; end of fusion_v8_STM32F407ZG__setMISO_3
fusion_v8_STM32F407ZG__setMOSI_3:
;__fuv8_stm32f407zg_gpio.c,101 :: 		static void _setMOSI_3(uint8_t value) { GPIOB_ODR.B5 = value; }
; value start address is: 0 (R0)
; value end address is: 0 (R0)
; value start address is: 0 (R0)
MOVW	R1, #lo_addr(GPIOB_ODR+0)
MOVT	R1, #hi_addr(GPIOB_ODR+0)
_SX	[R1, ByteOffset(GPIOB_ODR+0)]
; value end address is: 0 (R0)
L_end__setMOSI_3:
BX	LR
; end of fusion_v8_STM32F407ZG__setMOSI_3
fusion_v8_STM32F407ZG__setPWM_3:
;__fuv8_stm32f407zg_gpio.c,102 :: 		static void _setPWM_3(uint8_t value) { GPIOB_ODR.B3 = value; }
; value start address is: 0 (R0)
; value end address is: 0 (R0)
; value start address is: 0 (R0)
MOVW	R1, #lo_addr(GPIOB_ODR+0)
MOVT	R1, #hi_addr(GPIOB_ODR+0)
_SX	[R1, ByteOffset(GPIOB_ODR+0)]
; value end address is: 0 (R0)
L_end__setPWM_3:
BX	LR
; end of fusion_v8_STM32F407ZG__setPWM_3
fusion_v8_STM32F407ZG__setINT_3:
;__fuv8_stm32f407zg_gpio.c,103 :: 		static void _setINT_3(uint8_t value) { GPIOG_ODR.B2 = value; }
; value start address is: 0 (R0)
; value end address is: 0 (R0)
; value start address is: 0 (R0)
MOVW	R1, #lo_addr(GPIOG_ODR+0)
MOVT	R1, #hi_addr(GPIOG_ODR+0)
_SX	[R1, ByteOffset(GPIOG_ODR+0)]
; value end address is: 0 (R0)
L_end__setINT_3:
BX	LR
; end of fusion_v8_STM32F407ZG__setINT_3
fusion_v8_STM32F407ZG__setRX_3:
;__fuv8_stm32f407zg_gpio.c,104 :: 		static void _setRX_3(uint8_t value) { GPIOC_ODR.B7 = value; }
; value start address is: 0 (R0)
; value end address is: 0 (R0)
; value start address is: 0 (R0)
MOVW	R1, #lo_addr(GPIOC_ODR+0)
MOVT	R1, #hi_addr(GPIOC_ODR+0)
_SX	[R1, ByteOffset(GPIOC_ODR+0)]
; value end address is: 0 (R0)
L_end__setRX_3:
BX	LR
; end of fusion_v8_STM32F407ZG__setRX_3
fusion_v8_STM32F407ZG__setTX_3:
;__fuv8_stm32f407zg_gpio.c,105 :: 		static void _setTX_3(uint8_t value) { GPIOC_ODR.B6 = value; }
; value start address is: 0 (R0)
; value end address is: 0 (R0)
; value start address is: 0 (R0)
MOVW	R1, #lo_addr(GPIOC_ODR+0)
MOVT	R1, #hi_addr(GPIOC_ODR+0)
_SX	[R1, ByteOffset(GPIOC_ODR+0)]
; value end address is: 0 (R0)
L_end__setTX_3:
BX	LR
; end of fusion_v8_STM32F407ZG__setTX_3
fusion_v8_STM32F407ZG__setSCL_3:
;__fuv8_stm32f407zg_gpio.c,106 :: 		static void _setSCL_3(uint8_t value) { GPIOF_ODR.B1 = value; }
; value start address is: 0 (R0)
; value end address is: 0 (R0)
; value start address is: 0 (R0)
MOVW	R1, #lo_addr(GPIOF_ODR+0)
MOVT	R1, #hi_addr(GPIOF_ODR+0)
_SX	[R1, ByteOffset(GPIOF_ODR+0)]
; value end address is: 0 (R0)
L_end__setSCL_3:
BX	LR
; end of fusion_v8_STM32F407ZG__setSCL_3
fusion_v8_STM32F407ZG__setSDA_3:
;__fuv8_stm32f407zg_gpio.c,107 :: 		static void _setSDA_3(uint8_t value) { GPIOF_ODR.B0 = value; }
; value start address is: 0 (R0)
; value end address is: 0 (R0)
; value start address is: 0 (R0)
MOVW	R1, #lo_addr(GPIOF_ODR+0)
MOVT	R1, #hi_addr(GPIOF_ODR+0)
_SX	[R1, ByteOffset(GPIOF_ODR+0)]
; value end address is: 0 (R0)
L_end__setSDA_3:
BX	LR
; end of fusion_v8_STM32F407ZG__setSDA_3
fusion_v8_STM32F407ZG__getAN_4:
;__fuv8_stm32f407zg_gpio.c,110 :: 		static uint8_t _getAN_4() { return GPIOC_IDR.B0; }
MOVW	R0, #lo_addr(GPIOC_IDR+0)
MOVT	R0, #hi_addr(GPIOC_IDR+0)
_LX	[R0, ByteOffset(GPIOC_IDR+0)]
L_end__getAN_4:
BX	LR
; end of fusion_v8_STM32F407ZG__getAN_4
fusion_v8_STM32F407ZG__getRST_4:
;__fuv8_stm32f407zg_gpio.c,111 :: 		static uint8_t _getRST_4() { return GPIOG_IDR.B4; }
MOVW	R0, #lo_addr(GPIOG_IDR+0)
MOVT	R0, #hi_addr(GPIOG_IDR+0)
_LX	[R0, ByteOffset(GPIOG_IDR+0)]
L_end__getRST_4:
BX	LR
; end of fusion_v8_STM32F407ZG__getRST_4
fusion_v8_STM32F407ZG__getCS_4:
;__fuv8_stm32f407zg_gpio.c,112 :: 		static uint8_t _getCS_4() { return GPIOB_IDR.B13; }
MOVW	R0, #lo_addr(GPIOB_IDR+0)
MOVT	R0, #hi_addr(GPIOB_IDR+0)
_LX	[R0, ByteOffset(GPIOB_IDR+0)]
L_end__getCS_4:
BX	LR
; end of fusion_v8_STM32F407ZG__getCS_4
fusion_v8_STM32F407ZG__getSCK_4:
;__fuv8_stm32f407zg_gpio.c,113 :: 		static uint8_t _getSCK_4() { return GPIOA_IDR.B5; }
MOVW	R0, #lo_addr(GPIOA_IDR+0)
MOVT	R0, #hi_addr(GPIOA_IDR+0)
_LX	[R0, ByteOffset(GPIOA_IDR+0)]
L_end__getSCK_4:
BX	LR
; end of fusion_v8_STM32F407ZG__getSCK_4
fusion_v8_STM32F407ZG__getMISO_4:
;__fuv8_stm32f407zg_gpio.c,114 :: 		static uint8_t _getMISO_4() { return GPIOA_IDR.B6; }
MOVW	R0, #lo_addr(GPIOA_IDR+0)
MOVT	R0, #hi_addr(GPIOA_IDR+0)
_LX	[R0, ByteOffset(GPIOA_IDR+0)]
L_end__getMISO_4:
BX	LR
; end of fusion_v8_STM32F407ZG__getMISO_4
fusion_v8_STM32F407ZG__getMOSI_4:
;__fuv8_stm32f407zg_gpio.c,115 :: 		static uint8_t _getMOSI_4() { return GPIOB_IDR.B5; }
MOVW	R0, #lo_addr(GPIOB_IDR+0)
MOVT	R0, #hi_addr(GPIOB_IDR+0)
_LX	[R0, ByteOffset(GPIOB_IDR+0)]
L_end__getMOSI_4:
BX	LR
; end of fusion_v8_STM32F407ZG__getMOSI_4
fusion_v8_STM32F407ZG__getPWM_4:
;__fuv8_stm32f407zg_gpio.c,116 :: 		static uint8_t _getPWM_4() { return GPIOB_IDR.B4; }
MOVW	R0, #lo_addr(GPIOB_IDR+0)
MOVT	R0, #hi_addr(GPIOB_IDR+0)
_LX	[R0, ByteOffset(GPIOB_IDR+0)]
L_end__getPWM_4:
BX	LR
; end of fusion_v8_STM32F407ZG__getPWM_4
fusion_v8_STM32F407ZG__getINT_4:
;__fuv8_stm32f407zg_gpio.c,117 :: 		static uint8_t _getINT_4() { return GPIOG_IDR.B3; }
MOVW	R0, #lo_addr(GPIOG_IDR+0)
MOVT	R0, #hi_addr(GPIOG_IDR+0)
_LX	[R0, ByteOffset(GPIOG_IDR+0)]
L_end__getINT_4:
BX	LR
; end of fusion_v8_STM32F407ZG__getINT_4
fusion_v8_STM32F407ZG__getRX_4:
;__fuv8_stm32f407zg_gpio.c,118 :: 		static uint8_t _getRX_4() { return GPIOC_IDR.B7; }
MOVW	R0, #lo_addr(GPIOC_IDR+0)
MOVT	R0, #hi_addr(GPIOC_IDR+0)
_LX	[R0, ByteOffset(GPIOC_IDR+0)]
L_end__getRX_4:
BX	LR
; end of fusion_v8_STM32F407ZG__getRX_4
fusion_v8_STM32F407ZG__getTX_4:
;__fuv8_stm32f407zg_gpio.c,119 :: 		static uint8_t _getTX_4() { return GPIOC_IDR.B6; }
MOVW	R0, #lo_addr(GPIOC_IDR+0)
MOVT	R0, #hi_addr(GPIOC_IDR+0)
_LX	[R0, ByteOffset(GPIOC_IDR+0)]
L_end__getTX_4:
BX	LR
; end of fusion_v8_STM32F407ZG__getTX_4
fusion_v8_STM32F407ZG__getSCL_4:
;__fuv8_stm32f407zg_gpio.c,120 :: 		static uint8_t _getSCL_4() { return GPIOF_IDR.B1; }
MOVW	R0, #lo_addr(GPIOF_IDR+0)
MOVT	R0, #hi_addr(GPIOF_IDR+0)
_LX	[R0, ByteOffset(GPIOF_IDR+0)]
L_end__getSCL_4:
BX	LR
; end of fusion_v8_STM32F407ZG__getSCL_4
fusion_v8_STM32F407ZG__getSDA_4:
;__fuv8_stm32f407zg_gpio.c,121 :: 		static uint8_t _getSDA_4() { return GPIOF_IDR.B0; }
MOVW	R0, #lo_addr(GPIOF_IDR+0)
MOVT	R0, #hi_addr(GPIOF_IDR+0)
_LX	[R0, ByteOffset(GPIOF_IDR+0)]
L_end__getSDA_4:
BX	LR
; end of fusion_v8_STM32F407ZG__getSDA_4
fusion_v8_STM32F407ZG__setAN_4:
;__fuv8_stm32f407zg_gpio.c,122 :: 		static void _setAN_4(uint8_t value) { GPIOC_ODR.B0 = value; }
; value start address is: 0 (R0)
; value end address is: 0 (R0)
; value start address is: 0 (R0)
MOVW	R1, #lo_addr(GPIOC_ODR+0)
MOVT	R1, #hi_addr(GPIOC_ODR+0)
_SX	[R1, ByteOffset(GPIOC_ODR+0)]
; value end address is: 0 (R0)
L_end__setAN_4:
BX	LR
; end of fusion_v8_STM32F407ZG__setAN_4
fusion_v8_STM32F407ZG__setRST_4:
;__fuv8_stm32f407zg_gpio.c,123 :: 		static void _setRST_4(uint8_t value) { GPIOG_ODR.B4 = value; }
; value start address is: 0 (R0)
; value end address is: 0 (R0)
; value start address is: 0 (R0)
MOVW	R1, #lo_addr(GPIOG_ODR+0)
MOVT	R1, #hi_addr(GPIOG_ODR+0)
_SX	[R1, ByteOffset(GPIOG_ODR+0)]
; value end address is: 0 (R0)
L_end__setRST_4:
BX	LR
; end of fusion_v8_STM32F407ZG__setRST_4
fusion_v8_STM32F407ZG__setCS_4:
;__fuv8_stm32f407zg_gpio.c,124 :: 		static void _setCS_4(uint8_t value) { GPIOB_ODR.B13 = value; }
; value start address is: 0 (R0)
; value end address is: 0 (R0)
; value start address is: 0 (R0)
MOVW	R1, #lo_addr(GPIOB_ODR+0)
MOVT	R1, #hi_addr(GPIOB_ODR+0)
_SX	[R1, ByteOffset(GPIOB_ODR+0)]
; value end address is: 0 (R0)
L_end__setCS_4:
BX	LR
; end of fusion_v8_STM32F407ZG__setCS_4
fusion_v8_STM32F407ZG__setSCK_4:
;__fuv8_stm32f407zg_gpio.c,125 :: 		static void _setSCK_4(uint8_t value) { GPIOA_ODR.B5 = value; }
; value start address is: 0 (R0)
; value end address is: 0 (R0)
; value start address is: 0 (R0)
MOVW	R1, #lo_addr(GPIOA_ODR+0)
MOVT	R1, #hi_addr(GPIOA_ODR+0)
_SX	[R1, ByteOffset(GPIOA_ODR+0)]
; value end address is: 0 (R0)
L_end__setSCK_4:
BX	LR
; end of fusion_v8_STM32F407ZG__setSCK_4
fusion_v8_STM32F407ZG__setMISO_4:
;__fuv8_stm32f407zg_gpio.c,126 :: 		static void _setMISO_4(uint8_t value) { GPIOA_ODR.B6 = value; }
; value start address is: 0 (R0)
; value end address is: 0 (R0)
; value start address is: 0 (R0)
MOVW	R1, #lo_addr(GPIOA_ODR+0)
MOVT	R1, #hi_addr(GPIOA_ODR+0)
_SX	[R1, ByteOffset(GPIOA_ODR+0)]
; value end address is: 0 (R0)
L_end__setMISO_4:
BX	LR
; end of fusion_v8_STM32F407ZG__setMISO_4
fusion_v8_STM32F407ZG__setMOSI_4:
;__fuv8_stm32f407zg_gpio.c,127 :: 		static void _setMOSI_4(uint8_t value) { GPIOB_ODR.B5 = value; }
; value start address is: 0 (R0)
; value end address is: 0 (R0)
; value start address is: 0 (R0)
MOVW	R1, #lo_addr(GPIOB_ODR+0)
MOVT	R1, #hi_addr(GPIOB_ODR+0)
_SX	[R1, ByteOffset(GPIOB_ODR+0)]
; value end address is: 0 (R0)
L_end__setMOSI_4:
BX	LR
; end of fusion_v8_STM32F407ZG__setMOSI_4
fusion_v8_STM32F407ZG__setPWM_4:
;__fuv8_stm32f407zg_gpio.c,128 :: 		static void _setPWM_4(uint8_t value) { GPIOB_ODR.B4 = value; }
; value start address is: 0 (R0)
; value end address is: 0 (R0)
; value start address is: 0 (R0)
MOVW	R1, #lo_addr(GPIOB_ODR+0)
MOVT	R1, #hi_addr(GPIOB_ODR+0)
_SX	[R1, ByteOffset(GPIOB_ODR+0)]
; value end address is: 0 (R0)
L_end__setPWM_4:
BX	LR
; end of fusion_v8_STM32F407ZG__setPWM_4
fusion_v8_STM32F407ZG__setINT_4:
;__fuv8_stm32f407zg_gpio.c,129 :: 		static void _setINT_4(uint8_t value) { GPIOG_ODR.B3 = value; }
; value start address is: 0 (R0)
; value end address is: 0 (R0)
; value start address is: 0 (R0)
MOVW	R1, #lo_addr(GPIOG_ODR+0)
MOVT	R1, #hi_addr(GPIOG_ODR+0)
_SX	[R1, ByteOffset(GPIOG_ODR+0)]
; value end address is: 0 (R0)
L_end__setINT_4:
BX	LR
; end of fusion_v8_STM32F407ZG__setINT_4
fusion_v8_STM32F407ZG__setRX_4:
;__fuv8_stm32f407zg_gpio.c,130 :: 		static void _setRX_4(uint8_t value) { GPIOC_ODR.B7 = value; }
; value start address is: 0 (R0)
; value end address is: 0 (R0)
; value start address is: 0 (R0)
MOVW	R1, #lo_addr(GPIOC_ODR+0)
MOVT	R1, #hi_addr(GPIOC_ODR+0)
_SX	[R1, ByteOffset(GPIOC_ODR+0)]
; value end address is: 0 (R0)
L_end__setRX_4:
BX	LR
; end of fusion_v8_STM32F407ZG__setRX_4
fusion_v8_STM32F407ZG__setTX_4:
;__fuv8_stm32f407zg_gpio.c,131 :: 		static void _setTX_4(uint8_t value) { GPIOC_ODR.B6 = value; }
; value start address is: 0 (R0)
; value end address is: 0 (R0)
; value start address is: 0 (R0)
MOVW	R1, #lo_addr(GPIOC_ODR+0)
MOVT	R1, #hi_addr(GPIOC_ODR+0)
_SX	[R1, ByteOffset(GPIOC_ODR+0)]
; value end address is: 0 (R0)
L_end__setTX_4:
BX	LR
; end of fusion_v8_STM32F407ZG__setTX_4
fusion_v8_STM32F407ZG__setSCL_4:
;__fuv8_stm32f407zg_gpio.c,132 :: 		static void _setSCL_4(uint8_t value) { GPIOF_ODR.B1 = value; }
; value start address is: 0 (R0)
; value end address is: 0 (R0)
; value start address is: 0 (R0)
MOVW	R1, #lo_addr(GPIOF_ODR+0)
MOVT	R1, #hi_addr(GPIOF_ODR+0)
_SX	[R1, ByteOffset(GPIOF_ODR+0)]
; value end address is: 0 (R0)
L_end__setSCL_4:
BX	LR
; end of fusion_v8_STM32F407ZG__setSCL_4
fusion_v8_STM32F407ZG__setSDA_4:
;__fuv8_stm32f407zg_gpio.c,133 :: 		static void _setSDA_4(uint8_t value) { GPIOF_ODR.B0 = value; }
; value start address is: 0 (R0)
; value end address is: 0 (R0)
; value start address is: 0 (R0)
MOVW	R1, #lo_addr(GPIOF_ODR+0)
MOVT	R1, #hi_addr(GPIOF_ODR+0)
_SX	[R1, ByteOffset(GPIOF_ODR+0)]
; value end address is: 0 (R0)
L_end__setSDA_4:
BX	LR
; end of fusion_v8_STM32F407ZG__setSDA_4
fusion_v8_STM32F407ZG__getAN_5:
;__fuv8_stm32f407zg_gpio.c,136 :: 		static uint8_t _getAN_5() { return GPIOB_IDR.B1; }
MOVW	R0, #lo_addr(GPIOB_IDR+0)
MOVT	R0, #hi_addr(GPIOB_IDR+0)
_LX	[R0, ByteOffset(GPIOB_IDR+0)]
L_end__getAN_5:
BX	LR
; end of fusion_v8_STM32F407ZG__getAN_5
fusion_v8_STM32F407ZG__getRST_5:
;__fuv8_stm32f407zg_gpio.c,137 :: 		static uint8_t _getRST_5() { return GPIOE_IDR.B15; }
MOVW	R0, #lo_addr(GPIOE_IDR+0)
MOVT	R0, #hi_addr(GPIOE_IDR+0)
_LX	[R0, ByteOffset(GPIOE_IDR+0)]
L_end__getRST_5:
BX	LR
; end of fusion_v8_STM32F407ZG__getRST_5
fusion_v8_STM32F407ZG__getCS_5:
;__fuv8_stm32f407zg_gpio.c,138 :: 		static uint8_t _getCS_5() { return GPIOD_IDR.B7; }
MOVW	R0, #lo_addr(GPIOD_IDR+0)
MOVT	R0, #hi_addr(GPIOD_IDR+0)
_LX	[R0, ByteOffset(GPIOD_IDR+0)]
L_end__getCS_5:
BX	LR
; end of fusion_v8_STM32F407ZG__getCS_5
fusion_v8_STM32F407ZG__getSCK_5:
;__fuv8_stm32f407zg_gpio.c,139 :: 		static uint8_t _getSCK_5() { return GPIOC_IDR.B10; }
MOVW	R0, #lo_addr(GPIOC_IDR+0)
MOVT	R0, #hi_addr(GPIOC_IDR+0)
_LX	[R0, ByteOffset(GPIOC_IDR+0)]
L_end__getSCK_5:
BX	LR
; end of fusion_v8_STM32F407ZG__getSCK_5
fusion_v8_STM32F407ZG__getMISO_5:
;__fuv8_stm32f407zg_gpio.c,140 :: 		static uint8_t _getMISO_5() { return GPIOC_IDR.B11; }
MOVW	R0, #lo_addr(GPIOC_IDR+0)
MOVT	R0, #hi_addr(GPIOC_IDR+0)
_LX	[R0, ByteOffset(GPIOC_IDR+0)]
L_end__getMISO_5:
BX	LR
; end of fusion_v8_STM32F407ZG__getMISO_5
fusion_v8_STM32F407ZG__getMOSI_5:
;__fuv8_stm32f407zg_gpio.c,141 :: 		static uint8_t _getMOSI_5() { return GPIOC_IDR.B12; }
MOVW	R0, #lo_addr(GPIOC_IDR+0)
MOVT	R0, #hi_addr(GPIOC_IDR+0)
_LX	[R0, ByteOffset(GPIOC_IDR+0)]
L_end__getMOSI_5:
BX	LR
; end of fusion_v8_STM32F407ZG__getMOSI_5
fusion_v8_STM32F407ZG__getPWM_5:
;__fuv8_stm32f407zg_gpio.c,142 :: 		static uint8_t _getPWM_5() { return GPIOB_IDR.B0; }
MOVW	R0, #lo_addr(GPIOB_IDR+0)
MOVT	R0, #hi_addr(GPIOB_IDR+0)
_LX	[R0, ByteOffset(GPIOB_IDR+0)]
L_end__getPWM_5:
BX	LR
; end of fusion_v8_STM32F407ZG__getPWM_5
fusion_v8_STM32F407ZG__getINT_5:
;__fuv8_stm32f407zg_gpio.c,143 :: 		static uint8_t _getINT_5() { return GPIOE_IDR.B10; }
MOVW	R0, #lo_addr(GPIOE_IDR+0)
MOVT	R0, #hi_addr(GPIOE_IDR+0)
_LX	[R0, ByteOffset(GPIOE_IDR+0)]
L_end__getINT_5:
BX	LR
; end of fusion_v8_STM32F407ZG__getINT_5
fusion_v8_STM32F407ZG__getRX_5:
;__fuv8_stm32f407zg_gpio.c,144 :: 		static uint8_t _getRX_5() { return GPIOC_IDR.B7; }
MOVW	R0, #lo_addr(GPIOC_IDR+0)
MOVT	R0, #hi_addr(GPIOC_IDR+0)
_LX	[R0, ByteOffset(GPIOC_IDR+0)]
L_end__getRX_5:
BX	LR
; end of fusion_v8_STM32F407ZG__getRX_5
fusion_v8_STM32F407ZG__getTX_5:
;__fuv8_stm32f407zg_gpio.c,145 :: 		static uint8_t _getTX_5() { return GPIOC_IDR.B6; }
MOVW	R0, #lo_addr(GPIOC_IDR+0)
MOVT	R0, #hi_addr(GPIOC_IDR+0)
_LX	[R0, ByteOffset(GPIOC_IDR+0)]
L_end__getTX_5:
BX	LR
; end of fusion_v8_STM32F407ZG__getTX_5
fusion_v8_STM32F407ZG__getSCL_5:
;__fuv8_stm32f407zg_gpio.c,146 :: 		static uint8_t _getSCL_5() { return GPIOF_IDR.B1; }
MOVW	R0, #lo_addr(GPIOF_IDR+0)
MOVT	R0, #hi_addr(GPIOF_IDR+0)
_LX	[R0, ByteOffset(GPIOF_IDR+0)]
L_end__getSCL_5:
BX	LR
; end of fusion_v8_STM32F407ZG__getSCL_5
fusion_v8_STM32F407ZG__getSDA_5:
;__fuv8_stm32f407zg_gpio.c,147 :: 		static uint8_t _getSDA_5() { return GPIOF_IDR.B0; }
MOVW	R0, #lo_addr(GPIOF_IDR+0)
MOVT	R0, #hi_addr(GPIOF_IDR+0)
_LX	[R0, ByteOffset(GPIOF_IDR+0)]
L_end__getSDA_5:
BX	LR
; end of fusion_v8_STM32F407ZG__getSDA_5
fusion_v8_STM32F407ZG__setAN_5:
;__fuv8_stm32f407zg_gpio.c,148 :: 		static void _setAN_5(uint8_t value) { GPIOB_ODR.B1 = value; }
; value start address is: 0 (R0)
; value end address is: 0 (R0)
; value start address is: 0 (R0)
MOVW	R1, #lo_addr(GPIOB_ODR+0)
MOVT	R1, #hi_addr(GPIOB_ODR+0)
_SX	[R1, ByteOffset(GPIOB_ODR+0)]
; value end address is: 0 (R0)
L_end__setAN_5:
BX	LR
; end of fusion_v8_STM32F407ZG__setAN_5
fusion_v8_STM32F407ZG__setRST_5:
;__fuv8_stm32f407zg_gpio.c,149 :: 		static void _setRST_5(uint8_t value) { GPIOE_ODR.B15 = value; }
; value start address is: 0 (R0)
; value end address is: 0 (R0)
; value start address is: 0 (R0)
MOVW	R1, #lo_addr(GPIOE_ODR+0)
MOVT	R1, #hi_addr(GPIOE_ODR+0)
_SX	[R1, ByteOffset(GPIOE_ODR+0)]
; value end address is: 0 (R0)
L_end__setRST_5:
BX	LR
; end of fusion_v8_STM32F407ZG__setRST_5
fusion_v8_STM32F407ZG__setCS_5:
;__fuv8_stm32f407zg_gpio.c,150 :: 		static void _setCS_5(uint8_t value) { GPIOD_ODR.B7 = value; }
; value start address is: 0 (R0)
; value end address is: 0 (R0)
; value start address is: 0 (R0)
MOVW	R1, #lo_addr(GPIOD_ODR+0)
MOVT	R1, #hi_addr(GPIOD_ODR+0)
_SX	[R1, ByteOffset(GPIOD_ODR+0)]
; value end address is: 0 (R0)
L_end__setCS_5:
BX	LR
; end of fusion_v8_STM32F407ZG__setCS_5
fusion_v8_STM32F407ZG__setSCK_5:
;__fuv8_stm32f407zg_gpio.c,151 :: 		static void _setSCK_5(uint8_t value) { GPIOC_ODR.B10 = value; }
; value start address is: 0 (R0)
; value end address is: 0 (R0)
; value start address is: 0 (R0)
MOVW	R1, #lo_addr(GPIOC_ODR+0)
MOVT	R1, #hi_addr(GPIOC_ODR+0)
_SX	[R1, ByteOffset(GPIOC_ODR+0)]
; value end address is: 0 (R0)
L_end__setSCK_5:
BX	LR
; end of fusion_v8_STM32F407ZG__setSCK_5
fusion_v8_STM32F407ZG__setMISO_5:
;__fuv8_stm32f407zg_gpio.c,152 :: 		static void _setMISO_5(uint8_t value) { GPIOC_ODR.B11 = value; }
; value start address is: 0 (R0)
; value end address is: 0 (R0)
; value start address is: 0 (R0)
MOVW	R1, #lo_addr(GPIOC_ODR+0)
MOVT	R1, #hi_addr(GPIOC_ODR+0)
_SX	[R1, ByteOffset(GPIOC_ODR+0)]
; value end address is: 0 (R0)
L_end__setMISO_5:
BX	LR
; end of fusion_v8_STM32F407ZG__setMISO_5
fusion_v8_STM32F407ZG__setMOSI_5:
;__fuv8_stm32f407zg_gpio.c,153 :: 		static void _setMOSI_5(uint8_t value) { GPIOC_ODR.B12 = value; }
; value start address is: 0 (R0)
; value end address is: 0 (R0)
; value start address is: 0 (R0)
MOVW	R1, #lo_addr(GPIOC_ODR+0)
MOVT	R1, #hi_addr(GPIOC_ODR+0)
_SX	[R1, ByteOffset(GPIOC_ODR+0)]
; value end address is: 0 (R0)
L_end__setMOSI_5:
BX	LR
; end of fusion_v8_STM32F407ZG__setMOSI_5
fusion_v8_STM32F407ZG__setPWM_5:
;__fuv8_stm32f407zg_gpio.c,154 :: 		static void _setPWM_5(uint8_t value) { GPIOB_ODR.B0 = value; }
; value start address is: 0 (R0)
; value end address is: 0 (R0)
; value start address is: 0 (R0)
MOVW	R1, #lo_addr(GPIOB_ODR+0)
MOVT	R1, #hi_addr(GPIOB_ODR+0)
_SX	[R1, ByteOffset(GPIOB_ODR+0)]
; value end address is: 0 (R0)
L_end__setPWM_5:
BX	LR
; end of fusion_v8_STM32F407ZG__setPWM_5
fusion_v8_STM32F407ZG__setINT_5:
;__fuv8_stm32f407zg_gpio.c,155 :: 		static void _setINT_5(uint8_t value) { GPIOE_ODR.B10 = value; }
; value start address is: 0 (R0)
; value end address is: 0 (R0)
; value start address is: 0 (R0)
MOVW	R1, #lo_addr(GPIOE_ODR+0)
MOVT	R1, #hi_addr(GPIOE_ODR+0)
_SX	[R1, ByteOffset(GPIOE_ODR+0)]
; value end address is: 0 (R0)
L_end__setINT_5:
BX	LR
; end of fusion_v8_STM32F407ZG__setINT_5
fusion_v8_STM32F407ZG__setRX_5:
;__fuv8_stm32f407zg_gpio.c,156 :: 		static void _setRX_5(uint8_t value) { GPIOC_ODR.B7 = value; }
; value start address is: 0 (R0)
; value end address is: 0 (R0)
; value start address is: 0 (R0)
MOVW	R1, #lo_addr(GPIOC_ODR+0)
MOVT	R1, #hi_addr(GPIOC_ODR+0)
_SX	[R1, ByteOffset(GPIOC_ODR+0)]
; value end address is: 0 (R0)
L_end__setRX_5:
BX	LR
; end of fusion_v8_STM32F407ZG__setRX_5
fusion_v8_STM32F407ZG__setTX_5:
;__fuv8_stm32f407zg_gpio.c,157 :: 		static void _setTX_5(uint8_t value) { GPIOC_ODR.B6 = value; }
; value start address is: 0 (R0)
; value end address is: 0 (R0)
; value start address is: 0 (R0)
MOVW	R1, #lo_addr(GPIOC_ODR+0)
MOVT	R1, #hi_addr(GPIOC_ODR+0)
_SX	[R1, ByteOffset(GPIOC_ODR+0)]
; value end address is: 0 (R0)
L_end__setTX_5:
BX	LR
; end of fusion_v8_STM32F407ZG__setTX_5
fusion_v8_STM32F407ZG__setSCL_5:
;__fuv8_stm32f407zg_gpio.c,158 :: 		static void _setSCL_5(uint8_t value) { GPIOF_ODR.B1 = value; }
; value start address is: 0 (R0)
; value end address is: 0 (R0)
; value start address is: 0 (R0)
MOVW	R1, #lo_addr(GPIOF_ODR+0)
MOVT	R1, #hi_addr(GPIOF_ODR+0)
_SX	[R1, ByteOffset(GPIOF_ODR+0)]
; value end address is: 0 (R0)
L_end__setSCL_5:
BX	LR
; end of fusion_v8_STM32F407ZG__setSCL_5
fusion_v8_STM32F407ZG__setSDA_5:
;__fuv8_stm32f407zg_gpio.c,159 :: 		static void _setSDA_5(uint8_t value) { GPIOF_ODR.B0 = value; }
; value start address is: 0 (R0)
; value end address is: 0 (R0)
; value start address is: 0 (R0)
MOVW	R1, #lo_addr(GPIOF_ODR+0)
MOVT	R1, #hi_addr(GPIOF_ODR+0)
_SX	[R1, ByteOffset(GPIOF_ODR+0)]
; value end address is: 0 (R0)
L_end__setSDA_5:
BX	LR
; end of fusion_v8_STM32F407ZG__setSDA_5
fusion_v8_STM32F407ZG__gpioInit_1:
;__fuv8_stm32f407zg_gpio.c,162 :: 		static T_mikrobus_ret _gpioInit_1(T_mikrobus_pin pin, T_gpio_dir dir)
; dir start address is: 4 (R1)
; pin start address is: 0 (R0)
SUB	SP, SP, #4
STR	LR, [SP, #0]
; dir end address is: 4 (R1)
; pin end address is: 0 (R0)
; pin start address is: 0 (R0)
; dir start address is: 4 (R1)
;__fuv8_stm32f407zg_gpio.c,164 :: 		switch (pin)
IT	AL
BAL	L_fusion_v8_STM32F407ZG__gpioInit_10
; pin end address is: 0 (R0)
;__fuv8_stm32f407zg_gpio.c,166 :: 		case _MIKROBUS_AN_PIN:
L_fusion_v8_STM32F407ZG__gpioInit_12:
;__fuv8_stm32f407zg_gpio.c,167 :: 		if (dir == _GPIO_INPUT)
CMP	R1, #1
IT	NE
BNE	L_fusion_v8_STM32F407ZG__gpioInit_13
; dir end address is: 4 (R1)
;__fuv8_stm32f407zg_gpio.c,168 :: 		GPIO_Digital_Input(&GPIOA_BASE, _GPIO_PINMASK_4);
MOVW	R1, #16
MOVW	R0, #lo_addr(GPIOA_BASE+0)
MOVT	R0, #hi_addr(GPIOA_BASE+0)
BL	_GPIO_Digital_Input+0
IT	AL
BAL	L_fusion_v8_STM32F407ZG__gpioInit_14
L_fusion_v8_STM32F407ZG__gpioInit_13:
;__fuv8_stm32f407zg_gpio.c,170 :: 		GPIO_Digital_Output(&GPIOA_BASE, _GPIO_PINMASK_4);
MOVW	R1, #16
MOVW	R0, #lo_addr(GPIOA_BASE+0)
MOVT	R0, #hi_addr(GPIOA_BASE+0)
BL	_GPIO_Digital_Output+0
L_fusion_v8_STM32F407ZG__gpioInit_14:
;__fuv8_stm32f407zg_gpio.c,171 :: 		break;
IT	AL
BAL	L_fusion_v8_STM32F407ZG__gpioInit_11
;__fuv8_stm32f407zg_gpio.c,172 :: 		case _MIKROBUS_RST_PIN:
L_fusion_v8_STM32F407ZG__gpioInit_15:
;__fuv8_stm32f407zg_gpio.c,173 :: 		if (dir == _GPIO_INPUT)
; dir start address is: 4 (R1)
CMP	R1, #1
IT	NE
BNE	L_fusion_v8_STM32F407ZG__gpioInit_16
; dir end address is: 4 (R1)
;__fuv8_stm32f407zg_gpio.c,174 :: 		GPIO_Digital_Input(&GPIOC_BASE, _GPIO_PINMASK_2);
MOVW	R1, #4
MOVW	R0, #lo_addr(GPIOC_BASE+0)
MOVT	R0, #hi_addr(GPIOC_BASE+0)
BL	_GPIO_Digital_Input+0
IT	AL
BAL	L_fusion_v8_STM32F407ZG__gpioInit_17
L_fusion_v8_STM32F407ZG__gpioInit_16:
;__fuv8_stm32f407zg_gpio.c,176 :: 		GPIO_Digital_Output(&GPIOC_BASE, _GPIO_PINMASK_2);
MOVW	R1, #4
MOVW	R0, #lo_addr(GPIOC_BASE+0)
MOVT	R0, #hi_addr(GPIOC_BASE+0)
BL	_GPIO_Digital_Output+0
L_fusion_v8_STM32F407ZG__gpioInit_17:
;__fuv8_stm32f407zg_gpio.c,177 :: 		break;
IT	AL
BAL	L_fusion_v8_STM32F407ZG__gpioInit_11
;__fuv8_stm32f407zg_gpio.c,178 :: 		case _MIKROBUS_CS_PIN:
L_fusion_v8_STM32F407ZG__gpioInit_18:
;__fuv8_stm32f407zg_gpio.c,179 :: 		if (dir == _GPIO_INPUT)
; dir start address is: 4 (R1)
CMP	R1, #1
IT	NE
BNE	L_fusion_v8_STM32F407ZG__gpioInit_19
; dir end address is: 4 (R1)
;__fuv8_stm32f407zg_gpio.c,180 :: 		GPIO_Digital_Input(&GPIOB_BASE, _GPIO_PINMASK_12);
MOVW	R1, #4096
MOVW	R0, #lo_addr(GPIOB_BASE+0)
MOVT	R0, #hi_addr(GPIOB_BASE+0)
BL	_GPIO_Digital_Input+0
IT	AL
BAL	L_fusion_v8_STM32F407ZG__gpioInit_110
L_fusion_v8_STM32F407ZG__gpioInit_19:
;__fuv8_stm32f407zg_gpio.c,182 :: 		GPIO_Digital_Output(&GPIOB_BASE, _GPIO_PINMASK_12);
MOVW	R1, #4096
MOVW	R0, #lo_addr(GPIOB_BASE+0)
MOVT	R0, #hi_addr(GPIOB_BASE+0)
BL	_GPIO_Digital_Output+0
L_fusion_v8_STM32F407ZG__gpioInit_110:
;__fuv8_stm32f407zg_gpio.c,183 :: 		break;
IT	AL
BAL	L_fusion_v8_STM32F407ZG__gpioInit_11
;__fuv8_stm32f407zg_gpio.c,184 :: 		case _MIKROBUS_SCK_PIN:
L_fusion_v8_STM32F407ZG__gpioInit_111:
;__fuv8_stm32f407zg_gpio.c,185 :: 		if (dir == _GPIO_INPUT)
; dir start address is: 4 (R1)
CMP	R1, #1
IT	NE
BNE	L_fusion_v8_STM32F407ZG__gpioInit_112
; dir end address is: 4 (R1)
;__fuv8_stm32f407zg_gpio.c,186 :: 		GPIO_Digital_Input(&GPIOA_BASE, _GPIO_PINMASK_5);
MOVW	R1, #32
MOVW	R0, #lo_addr(GPIOA_BASE+0)
MOVT	R0, #hi_addr(GPIOA_BASE+0)
BL	_GPIO_Digital_Input+0
IT	AL
BAL	L_fusion_v8_STM32F407ZG__gpioInit_113
L_fusion_v8_STM32F407ZG__gpioInit_112:
;__fuv8_stm32f407zg_gpio.c,188 :: 		GPIO_Digital_Output(&GPIOA_BASE, _GPIO_PINMASK_5);
MOVW	R1, #32
MOVW	R0, #lo_addr(GPIOA_BASE+0)
MOVT	R0, #hi_addr(GPIOA_BASE+0)
BL	_GPIO_Digital_Output+0
L_fusion_v8_STM32F407ZG__gpioInit_113:
;__fuv8_stm32f407zg_gpio.c,189 :: 		break;
IT	AL
BAL	L_fusion_v8_STM32F407ZG__gpioInit_11
;__fuv8_stm32f407zg_gpio.c,190 :: 		case _MIKROBUS_MISO_PIN:
L_fusion_v8_STM32F407ZG__gpioInit_114:
;__fuv8_stm32f407zg_gpio.c,191 :: 		if (dir == _GPIO_INPUT)
; dir start address is: 4 (R1)
CMP	R1, #1
IT	NE
BNE	L_fusion_v8_STM32F407ZG__gpioInit_115
; dir end address is: 4 (R1)
;__fuv8_stm32f407zg_gpio.c,192 :: 		GPIO_Digital_Input(&GPIOA_BASE, _GPIO_PINMASK_6);
MOVW	R1, #64
MOVW	R0, #lo_addr(GPIOA_BASE+0)
MOVT	R0, #hi_addr(GPIOA_BASE+0)
BL	_GPIO_Digital_Input+0
IT	AL
BAL	L_fusion_v8_STM32F407ZG__gpioInit_116
L_fusion_v8_STM32F407ZG__gpioInit_115:
;__fuv8_stm32f407zg_gpio.c,194 :: 		GPIO_Digital_Output(&GPIOA_BASE, _GPIO_PINMASK_6);
MOVW	R1, #64
MOVW	R0, #lo_addr(GPIOA_BASE+0)
MOVT	R0, #hi_addr(GPIOA_BASE+0)
BL	_GPIO_Digital_Output+0
L_fusion_v8_STM32F407ZG__gpioInit_116:
;__fuv8_stm32f407zg_gpio.c,195 :: 		break;
IT	AL
BAL	L_fusion_v8_STM32F407ZG__gpioInit_11
;__fuv8_stm32f407zg_gpio.c,196 :: 		case _MIKROBUS_MOSI_PIN:
L_fusion_v8_STM32F407ZG__gpioInit_117:
;__fuv8_stm32f407zg_gpio.c,197 :: 		if (dir == _GPIO_INPUT)
; dir start address is: 4 (R1)
CMP	R1, #1
IT	NE
BNE	L_fusion_v8_STM32F407ZG__gpioInit_118
; dir end address is: 4 (R1)
;__fuv8_stm32f407zg_gpio.c,198 :: 		GPIO_Digital_Input(&GPIOB_BASE, _GPIO_PINMASK_5);
MOVW	R1, #32
MOVW	R0, #lo_addr(GPIOB_BASE+0)
MOVT	R0, #hi_addr(GPIOB_BASE+0)
BL	_GPIO_Digital_Input+0
IT	AL
BAL	L_fusion_v8_STM32F407ZG__gpioInit_119
L_fusion_v8_STM32F407ZG__gpioInit_118:
;__fuv8_stm32f407zg_gpio.c,200 :: 		GPIO_Digital_Output(&GPIOB_BASE, _GPIO_PINMASK_5);
MOVW	R1, #32
MOVW	R0, #lo_addr(GPIOB_BASE+0)
MOVT	R0, #hi_addr(GPIOB_BASE+0)
BL	_GPIO_Digital_Output+0
L_fusion_v8_STM32F407ZG__gpioInit_119:
;__fuv8_stm32f407zg_gpio.c,201 :: 		break;
IT	AL
BAL	L_fusion_v8_STM32F407ZG__gpioInit_11
;__fuv8_stm32f407zg_gpio.c,202 :: 		case _MIKROBUS_PWM_PIN:
L_fusion_v8_STM32F407ZG__gpioInit_120:
;__fuv8_stm32f407zg_gpio.c,203 :: 		if (dir == _GPIO_INPUT)
; dir start address is: 4 (R1)
CMP	R1, #1
IT	NE
BNE	L_fusion_v8_STM32F407ZG__gpioInit_121
; dir end address is: 4 (R1)
;__fuv8_stm32f407zg_gpio.c,204 :: 		GPIO_Digital_Input(&GPIOD_BASE, _GPIO_PINMASK_12);
MOVW	R1, #4096
MOVW	R0, #lo_addr(GPIOD_BASE+0)
MOVT	R0, #hi_addr(GPIOD_BASE+0)
BL	_GPIO_Digital_Input+0
IT	AL
BAL	L_fusion_v8_STM32F407ZG__gpioInit_122
L_fusion_v8_STM32F407ZG__gpioInit_121:
;__fuv8_stm32f407zg_gpio.c,206 :: 		GPIO_Digital_Output(&GPIOD_BASE, _GPIO_PINMASK_12);
MOVW	R1, #4096
MOVW	R0, #lo_addr(GPIOD_BASE+0)
MOVT	R0, #hi_addr(GPIOD_BASE+0)
BL	_GPIO_Digital_Output+0
L_fusion_v8_STM32F407ZG__gpioInit_122:
;__fuv8_stm32f407zg_gpio.c,207 :: 		break;
IT	AL
BAL	L_fusion_v8_STM32F407ZG__gpioInit_11
;__fuv8_stm32f407zg_gpio.c,208 :: 		case _MIKROBUS_INT_PIN:
L_fusion_v8_STM32F407ZG__gpioInit_123:
;__fuv8_stm32f407zg_gpio.c,209 :: 		if (dir == _GPIO_INPUT)
; dir start address is: 4 (R1)
CMP	R1, #1
IT	NE
BNE	L_fusion_v8_STM32F407ZG__gpioInit_124
; dir end address is: 4 (R1)
;__fuv8_stm32f407zg_gpio.c,210 :: 		GPIO_Digital_Input(&GPIOG_BASE, _GPIO_PINMASK_0);
MOVW	R1, #1
MOVW	R0, #lo_addr(GPIOG_BASE+0)
MOVT	R0, #hi_addr(GPIOG_BASE+0)
BL	_GPIO_Digital_Input+0
IT	AL
BAL	L_fusion_v8_STM32F407ZG__gpioInit_125
L_fusion_v8_STM32F407ZG__gpioInit_124:
;__fuv8_stm32f407zg_gpio.c,212 :: 		GPIO_Digital_Output(&GPIOG_BASE, _GPIO_PINMASK_0);
MOVW	R1, #1
MOVW	R0, #lo_addr(GPIOG_BASE+0)
MOVT	R0, #hi_addr(GPIOG_BASE+0)
BL	_GPIO_Digital_Output+0
L_fusion_v8_STM32F407ZG__gpioInit_125:
;__fuv8_stm32f407zg_gpio.c,213 :: 		break;
IT	AL
BAL	L_fusion_v8_STM32F407ZG__gpioInit_11
;__fuv8_stm32f407zg_gpio.c,214 :: 		case _MIKROBUS_RX_PIN:
L_fusion_v8_STM32F407ZG__gpioInit_126:
;__fuv8_stm32f407zg_gpio.c,215 :: 		if (dir == _GPIO_INPUT)
; dir start address is: 4 (R1)
CMP	R1, #1
IT	NE
BNE	L_fusion_v8_STM32F407ZG__gpioInit_127
; dir end address is: 4 (R1)
;__fuv8_stm32f407zg_gpio.c,216 :: 		GPIO_Digital_Input(&GPIOA_BASE, _GPIO_PINMASK_3);
MOVW	R1, #8
MOVW	R0, #lo_addr(GPIOA_BASE+0)
MOVT	R0, #hi_addr(GPIOA_BASE+0)
BL	_GPIO_Digital_Input+0
IT	AL
BAL	L_fusion_v8_STM32F407ZG__gpioInit_128
L_fusion_v8_STM32F407ZG__gpioInit_127:
;__fuv8_stm32f407zg_gpio.c,218 :: 		GPIO_Digital_Output(&GPIOA_BASE, _GPIO_PINMASK_3);
MOVW	R1, #8
MOVW	R0, #lo_addr(GPIOA_BASE+0)
MOVT	R0, #hi_addr(GPIOA_BASE+0)
BL	_GPIO_Digital_Output+0
L_fusion_v8_STM32F407ZG__gpioInit_128:
;__fuv8_stm32f407zg_gpio.c,219 :: 		break;
IT	AL
BAL	L_fusion_v8_STM32F407ZG__gpioInit_11
;__fuv8_stm32f407zg_gpio.c,220 :: 		case _MIKROBUS_TX_PIN:
L_fusion_v8_STM32F407ZG__gpioInit_129:
;__fuv8_stm32f407zg_gpio.c,221 :: 		if (dir == _GPIO_INPUT)
; dir start address is: 4 (R1)
CMP	R1, #1
IT	NE
BNE	L_fusion_v8_STM32F407ZG__gpioInit_130
; dir end address is: 4 (R1)
;__fuv8_stm32f407zg_gpio.c,222 :: 		GPIO_Digital_Input(&GPIOD_BASE, _GPIO_PINMASK_5);
MOVW	R1, #32
MOVW	R0, #lo_addr(GPIOD_BASE+0)
MOVT	R0, #hi_addr(GPIOD_BASE+0)
BL	_GPIO_Digital_Input+0
IT	AL
BAL	L_fusion_v8_STM32F407ZG__gpioInit_131
L_fusion_v8_STM32F407ZG__gpioInit_130:
;__fuv8_stm32f407zg_gpio.c,224 :: 		GPIO_Digital_Output(&GPIOD_BASE, _GPIO_PINMASK_5);
MOVW	R1, #32
MOVW	R0, #lo_addr(GPIOD_BASE+0)
MOVT	R0, #hi_addr(GPIOD_BASE+0)
BL	_GPIO_Digital_Output+0
L_fusion_v8_STM32F407ZG__gpioInit_131:
;__fuv8_stm32f407zg_gpio.c,225 :: 		break;
IT	AL
BAL	L_fusion_v8_STM32F407ZG__gpioInit_11
;__fuv8_stm32f407zg_gpio.c,226 :: 		case _MIKROBUS_SCL_PIN:
L_fusion_v8_STM32F407ZG__gpioInit_132:
;__fuv8_stm32f407zg_gpio.c,227 :: 		if (dir == _GPIO_INPUT)
; dir start address is: 4 (R1)
CMP	R1, #1
IT	NE
BNE	L_fusion_v8_STM32F407ZG__gpioInit_133
; dir end address is: 4 (R1)
;__fuv8_stm32f407zg_gpio.c,228 :: 		GPIO_Digital_Input(&GPIOF_BASE, _GPIO_PINMASK_1);
MOVW	R1, #2
MOVW	R0, #lo_addr(GPIOF_BASE+0)
MOVT	R0, #hi_addr(GPIOF_BASE+0)
BL	_GPIO_Digital_Input+0
IT	AL
BAL	L_fusion_v8_STM32F407ZG__gpioInit_134
L_fusion_v8_STM32F407ZG__gpioInit_133:
;__fuv8_stm32f407zg_gpio.c,230 :: 		GPIO_Digital_Output(&GPIOF_BASE, _GPIO_PINMASK_1);
MOVW	R1, #2
MOVW	R0, #lo_addr(GPIOF_BASE+0)
MOVT	R0, #hi_addr(GPIOF_BASE+0)
BL	_GPIO_Digital_Output+0
L_fusion_v8_STM32F407ZG__gpioInit_134:
;__fuv8_stm32f407zg_gpio.c,231 :: 		break;
IT	AL
BAL	L_fusion_v8_STM32F407ZG__gpioInit_11
;__fuv8_stm32f407zg_gpio.c,232 :: 		case _MIKROBUS_SDA_PIN:
L_fusion_v8_STM32F407ZG__gpioInit_135:
;__fuv8_stm32f407zg_gpio.c,233 :: 		if (dir == _GPIO_INPUT)
; dir start address is: 4 (R1)
CMP	R1, #1
IT	NE
BNE	L_fusion_v8_STM32F407ZG__gpioInit_136
; dir end address is: 4 (R1)
;__fuv8_stm32f407zg_gpio.c,234 :: 		GPIO_Digital_Input(&GPIOF_BASE, _GPIO_PINMASK_0);
MOVW	R1, #1
MOVW	R0, #lo_addr(GPIOF_BASE+0)
MOVT	R0, #hi_addr(GPIOF_BASE+0)
BL	_GPIO_Digital_Input+0
IT	AL
BAL	L_fusion_v8_STM32F407ZG__gpioInit_137
L_fusion_v8_STM32F407ZG__gpioInit_136:
;__fuv8_stm32f407zg_gpio.c,236 :: 		GPIO_Digital_Output(&GPIOF_BASE, _GPIO_PINMASK_0);
MOVW	R1, #1
MOVW	R0, #lo_addr(GPIOF_BASE+0)
MOVT	R0, #hi_addr(GPIOF_BASE+0)
BL	_GPIO_Digital_Output+0
L_fusion_v8_STM32F407ZG__gpioInit_137:
;__fuv8_stm32f407zg_gpio.c,237 :: 		break;
IT	AL
BAL	L_fusion_v8_STM32F407ZG__gpioInit_11
;__fuv8_stm32f407zg_gpio.c,238 :: 		default:
L_fusion_v8_STM32F407ZG__gpioInit_138:
;__fuv8_stm32f407zg_gpio.c,239 :: 		return _MIKROBUS_ERR_PIN;
MOVS	R0, #1
IT	AL
BAL	L_end__gpioInit_1
;__fuv8_stm32f407zg_gpio.c,240 :: 		}
L_fusion_v8_STM32F407ZG__gpioInit_10:
; dir start address is: 4 (R1)
; pin start address is: 0 (R0)
CMP	R0, #0
IT	EQ
BEQ	L_fusion_v8_STM32F407ZG__gpioInit_12
CMP	R0, #1
IT	EQ
BEQ	L_fusion_v8_STM32F407ZG__gpioInit_15
CMP	R0, #2
IT	EQ
BEQ	L_fusion_v8_STM32F407ZG__gpioInit_18
CMP	R0, #3
IT	EQ
BEQ	L_fusion_v8_STM32F407ZG__gpioInit_111
CMP	R0, #4
IT	EQ
BEQ	L_fusion_v8_STM32F407ZG__gpioInit_114
CMP	R0, #5
IT	EQ
BEQ	L_fusion_v8_STM32F407ZG__gpioInit_117
CMP	R0, #6
IT	EQ
BEQ	L_fusion_v8_STM32F407ZG__gpioInit_120
CMP	R0, #7
IT	EQ
BEQ	L_fusion_v8_STM32F407ZG__gpioInit_123
CMP	R0, #8
IT	EQ
BEQ	L_fusion_v8_STM32F407ZG__gpioInit_126
CMP	R0, #9
IT	EQ
BEQ	L_fusion_v8_STM32F407ZG__gpioInit_129
CMP	R0, #10
IT	EQ
BEQ	L_fusion_v8_STM32F407ZG__gpioInit_132
CMP	R0, #11
IT	EQ
BEQ	L_fusion_v8_STM32F407ZG__gpioInit_135
; pin end address is: 0 (R0)
; dir end address is: 4 (R1)
IT	AL
BAL	L_fusion_v8_STM32F407ZG__gpioInit_138
L_fusion_v8_STM32F407ZG__gpioInit_11:
;__fuv8_stm32f407zg_gpio.c,241 :: 		return _MIKROBUS_OK;
MOVS	R0, __MIKROBUS_OK
;__fuv8_stm32f407zg_gpio.c,242 :: 		}
L_end__gpioInit_1:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of fusion_v8_STM32F407ZG__gpioInit_1
fusion_v8_STM32F407ZG__gpioInit_2:
;__fuv8_stm32f407zg_gpio.c,245 :: 		static T_mikrobus_ret _gpioInit_2(T_mikrobus_pin pin, T_gpio_dir dir)
; dir start address is: 4 (R1)
; pin start address is: 0 (R0)
SUB	SP, SP, #4
STR	LR, [SP, #0]
; dir end address is: 4 (R1)
; pin end address is: 0 (R0)
; pin start address is: 0 (R0)
; dir start address is: 4 (R1)
;__fuv8_stm32f407zg_gpio.c,247 :: 		switch (pin)
IT	AL
BAL	L_fusion_v8_STM32F407ZG__gpioInit_239
; pin end address is: 0 (R0)
;__fuv8_stm32f407zg_gpio.c,249 :: 		case _MIKROBUS_AN_PIN:
L_fusion_v8_STM32F407ZG__gpioInit_241:
;__fuv8_stm32f407zg_gpio.c,250 :: 		if (dir == _GPIO_INPUT)
CMP	R1, #1
IT	NE
BNE	L_fusion_v8_STM32F407ZG__gpioInit_242
; dir end address is: 4 (R1)
;__fuv8_stm32f407zg_gpio.c,251 :: 		GPIO_Digital_Input(&GPIOB_BASE, _GPIO_PINMASK_0);
MOVW	R1, #1
MOVW	R0, #lo_addr(GPIOB_BASE+0)
MOVT	R0, #hi_addr(GPIOB_BASE+0)
BL	_GPIO_Digital_Input+0
IT	AL
BAL	L_fusion_v8_STM32F407ZG__gpioInit_243
L_fusion_v8_STM32F407ZG__gpioInit_242:
;__fuv8_stm32f407zg_gpio.c,253 :: 		GPIO_Digital_Output(&GPIOB_BASE, _GPIO_PINMASK_0);
MOVW	R1, #1
MOVW	R0, #lo_addr(GPIOB_BASE+0)
MOVT	R0, #hi_addr(GPIOB_BASE+0)
BL	_GPIO_Digital_Output+0
L_fusion_v8_STM32F407ZG__gpioInit_243:
;__fuv8_stm32f407zg_gpio.c,254 :: 		break;
IT	AL
BAL	L_fusion_v8_STM32F407ZG__gpioInit_240
;__fuv8_stm32f407zg_gpio.c,255 :: 		case _MIKROBUS_RST_PIN:
L_fusion_v8_STM32F407ZG__gpioInit_244:
;__fuv8_stm32f407zg_gpio.c,256 :: 		if (dir == _GPIO_INPUT)
; dir start address is: 4 (R1)
CMP	R1, #1
IT	NE
BNE	L_fusion_v8_STM32F407ZG__gpioInit_245
; dir end address is: 4 (R1)
;__fuv8_stm32f407zg_gpio.c,257 :: 		GPIO_Digital_Input(&GPIOC_BASE, _GPIO_PINMASK_3);
MOVW	R1, #8
MOVW	R0, #lo_addr(GPIOC_BASE+0)
MOVT	R0, #hi_addr(GPIOC_BASE+0)
BL	_GPIO_Digital_Input+0
IT	AL
BAL	L_fusion_v8_STM32F407ZG__gpioInit_246
L_fusion_v8_STM32F407ZG__gpioInit_245:
;__fuv8_stm32f407zg_gpio.c,259 :: 		GPIO_Digital_Output(&GPIOC_BASE, _GPIO_PINMASK_3);
MOVW	R1, #8
MOVW	R0, #lo_addr(GPIOC_BASE+0)
MOVT	R0, #hi_addr(GPIOC_BASE+0)
BL	_GPIO_Digital_Output+0
L_fusion_v8_STM32F407ZG__gpioInit_246:
;__fuv8_stm32f407zg_gpio.c,260 :: 		break;
IT	AL
BAL	L_fusion_v8_STM32F407ZG__gpioInit_240
;__fuv8_stm32f407zg_gpio.c,261 :: 		case _MIKROBUS_CS_PIN:
L_fusion_v8_STM32F407ZG__gpioInit_247:
;__fuv8_stm32f407zg_gpio.c,262 :: 		if (dir == _GPIO_INPUT)
; dir start address is: 4 (R1)
CMP	R1, #1
IT	NE
BNE	L_fusion_v8_STM32F407ZG__gpioInit_248
; dir end address is: 4 (R1)
;__fuv8_stm32f407zg_gpio.c,263 :: 		GPIO_Digital_Input(&GPIOA_BASE, _GPIO_PINMASK_15);
MOVW	R1, #32768
MOVW	R0, #lo_addr(GPIOA_BASE+0)
MOVT	R0, #hi_addr(GPIOA_BASE+0)
BL	_GPIO_Digital_Input+0
IT	AL
BAL	L_fusion_v8_STM32F407ZG__gpioInit_249
L_fusion_v8_STM32F407ZG__gpioInit_248:
;__fuv8_stm32f407zg_gpio.c,265 :: 		GPIO_Digital_Output(&GPIOA_BASE, _GPIO_PINMASK_15);
MOVW	R1, #32768
MOVW	R0, #lo_addr(GPIOA_BASE+0)
MOVT	R0, #hi_addr(GPIOA_BASE+0)
BL	_GPIO_Digital_Output+0
L_fusion_v8_STM32F407ZG__gpioInit_249:
;__fuv8_stm32f407zg_gpio.c,266 :: 		break;
IT	AL
BAL	L_fusion_v8_STM32F407ZG__gpioInit_240
;__fuv8_stm32f407zg_gpio.c,267 :: 		case _MIKROBUS_SCK_PIN:
L_fusion_v8_STM32F407ZG__gpioInit_250:
;__fuv8_stm32f407zg_gpio.c,268 :: 		if (dir == _GPIO_INPUT)
; dir start address is: 4 (R1)
CMP	R1, #1
IT	NE
BNE	L_fusion_v8_STM32F407ZG__gpioInit_251
; dir end address is: 4 (R1)
;__fuv8_stm32f407zg_gpio.c,269 :: 		GPIO_Digital_Input(&GPIOA_BASE, _GPIO_PINMASK_5);
MOVW	R1, #32
MOVW	R0, #lo_addr(GPIOA_BASE+0)
MOVT	R0, #hi_addr(GPIOA_BASE+0)
BL	_GPIO_Digital_Input+0
IT	AL
BAL	L_fusion_v8_STM32F407ZG__gpioInit_252
L_fusion_v8_STM32F407ZG__gpioInit_251:
;__fuv8_stm32f407zg_gpio.c,271 :: 		GPIO_Digital_Output(&GPIOA_BASE, _GPIO_PINMASK_5);
MOVW	R1, #32
MOVW	R0, #lo_addr(GPIOA_BASE+0)
MOVT	R0, #hi_addr(GPIOA_BASE+0)
BL	_GPIO_Digital_Output+0
L_fusion_v8_STM32F407ZG__gpioInit_252:
;__fuv8_stm32f407zg_gpio.c,272 :: 		break;
IT	AL
BAL	L_fusion_v8_STM32F407ZG__gpioInit_240
;__fuv8_stm32f407zg_gpio.c,273 :: 		case _MIKROBUS_MISO_PIN:
L_fusion_v8_STM32F407ZG__gpioInit_253:
;__fuv8_stm32f407zg_gpio.c,274 :: 		if (dir == _GPIO_INPUT)
; dir start address is: 4 (R1)
CMP	R1, #1
IT	NE
BNE	L_fusion_v8_STM32F407ZG__gpioInit_254
; dir end address is: 4 (R1)
;__fuv8_stm32f407zg_gpio.c,275 :: 		GPIO_Digital_Input(&GPIOA_BASE, _GPIO_PINMASK_6);
MOVW	R1, #64
MOVW	R0, #lo_addr(GPIOA_BASE+0)
MOVT	R0, #hi_addr(GPIOA_BASE+0)
BL	_GPIO_Digital_Input+0
IT	AL
BAL	L_fusion_v8_STM32F407ZG__gpioInit_255
L_fusion_v8_STM32F407ZG__gpioInit_254:
;__fuv8_stm32f407zg_gpio.c,277 :: 		GPIO_Digital_Output(&GPIOA_BASE, _GPIO_PINMASK_6);
MOVW	R1, #64
MOVW	R0, #lo_addr(GPIOA_BASE+0)
MOVT	R0, #hi_addr(GPIOA_BASE+0)
BL	_GPIO_Digital_Output+0
L_fusion_v8_STM32F407ZG__gpioInit_255:
;__fuv8_stm32f407zg_gpio.c,278 :: 		break;
IT	AL
BAL	L_fusion_v8_STM32F407ZG__gpioInit_240
;__fuv8_stm32f407zg_gpio.c,279 :: 		case _MIKROBUS_MOSI_PIN:
L_fusion_v8_STM32F407ZG__gpioInit_256:
;__fuv8_stm32f407zg_gpio.c,280 :: 		if (dir == _GPIO_INPUT)
; dir start address is: 4 (R1)
CMP	R1, #1
IT	NE
BNE	L_fusion_v8_STM32F407ZG__gpioInit_257
; dir end address is: 4 (R1)
;__fuv8_stm32f407zg_gpio.c,281 :: 		GPIO_Digital_Input(&GPIOB_BASE, _GPIO_PINMASK_5);
MOVW	R1, #32
MOVW	R0, #lo_addr(GPIOB_BASE+0)
MOVT	R0, #hi_addr(GPIOB_BASE+0)
BL	_GPIO_Digital_Input+0
IT	AL
BAL	L_fusion_v8_STM32F407ZG__gpioInit_258
L_fusion_v8_STM32F407ZG__gpioInit_257:
;__fuv8_stm32f407zg_gpio.c,283 :: 		GPIO_Digital_Output(&GPIOB_BASE, _GPIO_PINMASK_5);
MOVW	R1, #32
MOVW	R0, #lo_addr(GPIOB_BASE+0)
MOVT	R0, #hi_addr(GPIOB_BASE+0)
BL	_GPIO_Digital_Output+0
L_fusion_v8_STM32F407ZG__gpioInit_258:
;__fuv8_stm32f407zg_gpio.c,284 :: 		break;
IT	AL
BAL	L_fusion_v8_STM32F407ZG__gpioInit_240
;__fuv8_stm32f407zg_gpio.c,285 :: 		case _MIKROBUS_PWM_PIN:
L_fusion_v8_STM32F407ZG__gpioInit_259:
;__fuv8_stm32f407zg_gpio.c,286 :: 		if (dir == _GPIO_INPUT)
; dir start address is: 4 (R1)
CMP	R1, #1
IT	NE
BNE	L_fusion_v8_STM32F407ZG__gpioInit_260
; dir end address is: 4 (R1)
;__fuv8_stm32f407zg_gpio.c,287 :: 		GPIO_Digital_Input(&GPIOD_BASE, _GPIO_PINMASK_13);
MOVW	R1, #8192
MOVW	R0, #lo_addr(GPIOD_BASE+0)
MOVT	R0, #hi_addr(GPIOD_BASE+0)
BL	_GPIO_Digital_Input+0
IT	AL
BAL	L_fusion_v8_STM32F407ZG__gpioInit_261
L_fusion_v8_STM32F407ZG__gpioInit_260:
;__fuv8_stm32f407zg_gpio.c,289 :: 		GPIO_Digital_Output(&GPIOD_BASE, _GPIO_PINMASK_13);
MOVW	R1, #8192
MOVW	R0, #lo_addr(GPIOD_BASE+0)
MOVT	R0, #hi_addr(GPIOD_BASE+0)
BL	_GPIO_Digital_Output+0
L_fusion_v8_STM32F407ZG__gpioInit_261:
;__fuv8_stm32f407zg_gpio.c,290 :: 		break;
IT	AL
BAL	L_fusion_v8_STM32F407ZG__gpioInit_240
;__fuv8_stm32f407zg_gpio.c,291 :: 		case _MIKROBUS_INT_PIN:
L_fusion_v8_STM32F407ZG__gpioInit_262:
;__fuv8_stm32f407zg_gpio.c,292 :: 		if (dir == _GPIO_INPUT)
; dir start address is: 4 (R1)
CMP	R1, #1
IT	NE
BNE	L_fusion_v8_STM32F407ZG__gpioInit_263
; dir end address is: 4 (R1)
;__fuv8_stm32f407zg_gpio.c,293 :: 		GPIO_Digital_Input(&GPIOG_BASE, _GPIO_PINMASK_1);
MOVW	R1, #2
MOVW	R0, #lo_addr(GPIOG_BASE+0)
MOVT	R0, #hi_addr(GPIOG_BASE+0)
BL	_GPIO_Digital_Input+0
IT	AL
BAL	L_fusion_v8_STM32F407ZG__gpioInit_264
L_fusion_v8_STM32F407ZG__gpioInit_263:
;__fuv8_stm32f407zg_gpio.c,295 :: 		GPIO_Digital_Output(&GPIOG_BASE, _GPIO_PINMASK_1);
MOVW	R1, #2
MOVW	R0, #lo_addr(GPIOG_BASE+0)
MOVT	R0, #hi_addr(GPIOG_BASE+0)
BL	_GPIO_Digital_Output+0
L_fusion_v8_STM32F407ZG__gpioInit_264:
;__fuv8_stm32f407zg_gpio.c,296 :: 		break;
IT	AL
BAL	L_fusion_v8_STM32F407ZG__gpioInit_240
;__fuv8_stm32f407zg_gpio.c,297 :: 		case _MIKROBUS_RX_PIN:
L_fusion_v8_STM32F407ZG__gpioInit_265:
;__fuv8_stm32f407zg_gpio.c,298 :: 		if (dir == _GPIO_INPUT)
; dir start address is: 4 (R1)
CMP	R1, #1
IT	NE
BNE	L_fusion_v8_STM32F407ZG__gpioInit_266
; dir end address is: 4 (R1)
;__fuv8_stm32f407zg_gpio.c,299 :: 		GPIO_Digital_Input(&GPIOA_BASE, _GPIO_PINMASK_3);
MOVW	R1, #8
MOVW	R0, #lo_addr(GPIOA_BASE+0)
MOVT	R0, #hi_addr(GPIOA_BASE+0)
BL	_GPIO_Digital_Input+0
IT	AL
BAL	L_fusion_v8_STM32F407ZG__gpioInit_267
L_fusion_v8_STM32F407ZG__gpioInit_266:
;__fuv8_stm32f407zg_gpio.c,301 :: 		GPIO_Digital_Output(&GPIOA_BASE, _GPIO_PINMASK_3);
MOVW	R1, #8
MOVW	R0, #lo_addr(GPIOA_BASE+0)
MOVT	R0, #hi_addr(GPIOA_BASE+0)
BL	_GPIO_Digital_Output+0
L_fusion_v8_STM32F407ZG__gpioInit_267:
;__fuv8_stm32f407zg_gpio.c,302 :: 		break;
IT	AL
BAL	L_fusion_v8_STM32F407ZG__gpioInit_240
;__fuv8_stm32f407zg_gpio.c,303 :: 		case _MIKROBUS_TX_PIN:
L_fusion_v8_STM32F407ZG__gpioInit_268:
;__fuv8_stm32f407zg_gpio.c,304 :: 		if (dir == _GPIO_INPUT)
; dir start address is: 4 (R1)
CMP	R1, #1
IT	NE
BNE	L_fusion_v8_STM32F407ZG__gpioInit_269
; dir end address is: 4 (R1)
;__fuv8_stm32f407zg_gpio.c,305 :: 		GPIO_Digital_Input(&GPIOD_BASE, _GPIO_PINMASK_5);
MOVW	R1, #32
MOVW	R0, #lo_addr(GPIOD_BASE+0)
MOVT	R0, #hi_addr(GPIOD_BASE+0)
BL	_GPIO_Digital_Input+0
IT	AL
BAL	L_fusion_v8_STM32F407ZG__gpioInit_270
L_fusion_v8_STM32F407ZG__gpioInit_269:
;__fuv8_stm32f407zg_gpio.c,307 :: 		GPIO_Digital_Output(&GPIOD_BASE, _GPIO_PINMASK_5);
MOVW	R1, #32
MOVW	R0, #lo_addr(GPIOD_BASE+0)
MOVT	R0, #hi_addr(GPIOD_BASE+0)
BL	_GPIO_Digital_Output+0
L_fusion_v8_STM32F407ZG__gpioInit_270:
;__fuv8_stm32f407zg_gpio.c,308 :: 		break;
IT	AL
BAL	L_fusion_v8_STM32F407ZG__gpioInit_240
;__fuv8_stm32f407zg_gpio.c,309 :: 		case _MIKROBUS_SCL_PIN:
L_fusion_v8_STM32F407ZG__gpioInit_271:
;__fuv8_stm32f407zg_gpio.c,310 :: 		if (dir == _GPIO_INPUT)
; dir start address is: 4 (R1)
CMP	R1, #1
IT	NE
BNE	L_fusion_v8_STM32F407ZG__gpioInit_272
; dir end address is: 4 (R1)
;__fuv8_stm32f407zg_gpio.c,311 :: 		GPIO_Digital_Input(&GPIOF_BASE, _GPIO_PINMASK_1);
MOVW	R1, #2
MOVW	R0, #lo_addr(GPIOF_BASE+0)
MOVT	R0, #hi_addr(GPIOF_BASE+0)
BL	_GPIO_Digital_Input+0
IT	AL
BAL	L_fusion_v8_STM32F407ZG__gpioInit_273
L_fusion_v8_STM32F407ZG__gpioInit_272:
;__fuv8_stm32f407zg_gpio.c,313 :: 		GPIO_Digital_Output(&GPIOF_BASE, _GPIO_PINMASK_1);
MOVW	R1, #2
MOVW	R0, #lo_addr(GPIOF_BASE+0)
MOVT	R0, #hi_addr(GPIOF_BASE+0)
BL	_GPIO_Digital_Output+0
L_fusion_v8_STM32F407ZG__gpioInit_273:
;__fuv8_stm32f407zg_gpio.c,314 :: 		break;
IT	AL
BAL	L_fusion_v8_STM32F407ZG__gpioInit_240
;__fuv8_stm32f407zg_gpio.c,315 :: 		case _MIKROBUS_SDA_PIN:
L_fusion_v8_STM32F407ZG__gpioInit_274:
;__fuv8_stm32f407zg_gpio.c,316 :: 		if (dir == _GPIO_INPUT)
; dir start address is: 4 (R1)
CMP	R1, #1
IT	NE
BNE	L_fusion_v8_STM32F407ZG__gpioInit_275
; dir end address is: 4 (R1)
;__fuv8_stm32f407zg_gpio.c,317 :: 		GPIO_Digital_Input(&GPIOF_BASE, _GPIO_PINMASK_0);
MOVW	R1, #1
MOVW	R0, #lo_addr(GPIOF_BASE+0)
MOVT	R0, #hi_addr(GPIOF_BASE+0)
BL	_GPIO_Digital_Input+0
IT	AL
BAL	L_fusion_v8_STM32F407ZG__gpioInit_276
L_fusion_v8_STM32F407ZG__gpioInit_275:
;__fuv8_stm32f407zg_gpio.c,319 :: 		GPIO_Digital_Output(&GPIOF_BASE, _GPIO_PINMASK_0);
MOVW	R1, #1
MOVW	R0, #lo_addr(GPIOF_BASE+0)
MOVT	R0, #hi_addr(GPIOF_BASE+0)
BL	_GPIO_Digital_Output+0
L_fusion_v8_STM32F407ZG__gpioInit_276:
;__fuv8_stm32f407zg_gpio.c,320 :: 		break;
IT	AL
BAL	L_fusion_v8_STM32F407ZG__gpioInit_240
;__fuv8_stm32f407zg_gpio.c,321 :: 		default:
L_fusion_v8_STM32F407ZG__gpioInit_277:
;__fuv8_stm32f407zg_gpio.c,322 :: 		return _MIKROBUS_ERR_PIN;
MOVS	R0, #1
IT	AL
BAL	L_end__gpioInit_2
;__fuv8_stm32f407zg_gpio.c,323 :: 		}
L_fusion_v8_STM32F407ZG__gpioInit_239:
; dir start address is: 4 (R1)
; pin start address is: 0 (R0)
CMP	R0, #0
IT	EQ
BEQ	L_fusion_v8_STM32F407ZG__gpioInit_241
CMP	R0, #1
IT	EQ
BEQ	L_fusion_v8_STM32F407ZG__gpioInit_244
CMP	R0, #2
IT	EQ
BEQ	L_fusion_v8_STM32F407ZG__gpioInit_247
CMP	R0, #3
IT	EQ
BEQ	L_fusion_v8_STM32F407ZG__gpioInit_250
CMP	R0, #4
IT	EQ
BEQ	L_fusion_v8_STM32F407ZG__gpioInit_253
CMP	R0, #5
IT	EQ
BEQ	L_fusion_v8_STM32F407ZG__gpioInit_256
CMP	R0, #6
IT	EQ
BEQ	L_fusion_v8_STM32F407ZG__gpioInit_259
CMP	R0, #7
IT	EQ
BEQ	L_fusion_v8_STM32F407ZG__gpioInit_262
CMP	R0, #8
IT	EQ
BEQ	L_fusion_v8_STM32F407ZG__gpioInit_265
CMP	R0, #9
IT	EQ
BEQ	L_fusion_v8_STM32F407ZG__gpioInit_268
CMP	R0, #10
IT	EQ
BEQ	L_fusion_v8_STM32F407ZG__gpioInit_271
CMP	R0, #11
IT	EQ
BEQ	L_fusion_v8_STM32F407ZG__gpioInit_274
; pin end address is: 0 (R0)
; dir end address is: 4 (R1)
IT	AL
BAL	L_fusion_v8_STM32F407ZG__gpioInit_277
L_fusion_v8_STM32F407ZG__gpioInit_240:
;__fuv8_stm32f407zg_gpio.c,324 :: 		return _MIKROBUS_OK;
MOVS	R0, __MIKROBUS_OK
;__fuv8_stm32f407zg_gpio.c,325 :: 		}
L_end__gpioInit_2:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of fusion_v8_STM32F407ZG__gpioInit_2
fusion_v8_STM32F407ZG__gpioInit_3:
;__fuv8_stm32f407zg_gpio.c,328 :: 		static T_mikrobus_ret _gpioInit_3(T_mikrobus_pin pin, T_gpio_dir dir)
; dir start address is: 4 (R1)
; pin start address is: 0 (R0)
SUB	SP, SP, #4
STR	LR, [SP, #0]
; dir end address is: 4 (R1)
; pin end address is: 0 (R0)
; pin start address is: 0 (R0)
; dir start address is: 4 (R1)
;__fuv8_stm32f407zg_gpio.c,330 :: 		switch (pin)
IT	AL
BAL	L_fusion_v8_STM32F407ZG__gpioInit_378
; pin end address is: 0 (R0)
;__fuv8_stm32f407zg_gpio.c,332 :: 		case _MIKROBUS_AN_PIN:
L_fusion_v8_STM32F407ZG__gpioInit_380:
;__fuv8_stm32f407zg_gpio.c,333 :: 		if (dir == _GPIO_INPUT)
CMP	R1, #1
IT	NE
BNE	L_fusion_v8_STM32F407ZG__gpioInit_381
; dir end address is: 4 (R1)
;__fuv8_stm32f407zg_gpio.c,334 :: 		GPIO_Digital_Input(&GPIOB_BASE, _GPIO_PINMASK_1);
MOVW	R1, #2
MOVW	R0, #lo_addr(GPIOB_BASE+0)
MOVT	R0, #hi_addr(GPIOB_BASE+0)
BL	_GPIO_Digital_Input+0
IT	AL
BAL	L_fusion_v8_STM32F407ZG__gpioInit_382
L_fusion_v8_STM32F407ZG__gpioInit_381:
;__fuv8_stm32f407zg_gpio.c,336 :: 		GPIO_Digital_Output(&GPIOB_BASE, _GPIO_PINMASK_1);
MOVW	R1, #2
MOVW	R0, #lo_addr(GPIOB_BASE+0)
MOVT	R0, #hi_addr(GPIOB_BASE+0)
BL	_GPIO_Digital_Output+0
L_fusion_v8_STM32F407ZG__gpioInit_382:
;__fuv8_stm32f407zg_gpio.c,337 :: 		break;
IT	AL
BAL	L_fusion_v8_STM32F407ZG__gpioInit_379
;__fuv8_stm32f407zg_gpio.c,338 :: 		case _MIKROBUS_RST_PIN:
L_fusion_v8_STM32F407ZG__gpioInit_383:
;__fuv8_stm32f407zg_gpio.c,339 :: 		if (dir == _GPIO_INPUT)
; dir start address is: 4 (R1)
CMP	R1, #1
IT	NE
BNE	L_fusion_v8_STM32F407ZG__gpioInit_384
; dir end address is: 4 (R1)
;__fuv8_stm32f407zg_gpio.c,340 :: 		GPIO_Digital_Input(&GPIOC_BASE, _GPIO_PINMASK_13);
MOVW	R1, #8192
MOVW	R0, #lo_addr(GPIOC_BASE+0)
MOVT	R0, #hi_addr(GPIOC_BASE+0)
BL	_GPIO_Digital_Input+0
IT	AL
BAL	L_fusion_v8_STM32F407ZG__gpioInit_385
L_fusion_v8_STM32F407ZG__gpioInit_384:
;__fuv8_stm32f407zg_gpio.c,342 :: 		GPIO_Digital_Output(&GPIOC_BASE, _GPIO_PINMASK_13);
MOVW	R1, #8192
MOVW	R0, #lo_addr(GPIOC_BASE+0)
MOVT	R0, #hi_addr(GPIOC_BASE+0)
BL	_GPIO_Digital_Output+0
L_fusion_v8_STM32F407ZG__gpioInit_385:
;__fuv8_stm32f407zg_gpio.c,343 :: 		break;
IT	AL
BAL	L_fusion_v8_STM32F407ZG__gpioInit_379
;__fuv8_stm32f407zg_gpio.c,344 :: 		case _MIKROBUS_CS_PIN:
L_fusion_v8_STM32F407ZG__gpioInit_386:
;__fuv8_stm32f407zg_gpio.c,345 :: 		if (dir == _GPIO_INPUT)
; dir start address is: 4 (R1)
CMP	R1, #1
IT	NE
BNE	L_fusion_v8_STM32F407ZG__gpioInit_387
; dir end address is: 4 (R1)
;__fuv8_stm32f407zg_gpio.c,346 :: 		GPIO_Digital_Input(&GPIOB_BASE, _GPIO_PINMASK_12);
MOVW	R1, #4096
MOVW	R0, #lo_addr(GPIOB_BASE+0)
MOVT	R0, #hi_addr(GPIOB_BASE+0)
BL	_GPIO_Digital_Input+0
IT	AL
BAL	L_fusion_v8_STM32F407ZG__gpioInit_388
L_fusion_v8_STM32F407ZG__gpioInit_387:
;__fuv8_stm32f407zg_gpio.c,348 :: 		GPIO_Digital_Output(&GPIOB_BASE, _GPIO_PINMASK_12);
MOVW	R1, #4096
MOVW	R0, #lo_addr(GPIOB_BASE+0)
MOVT	R0, #hi_addr(GPIOB_BASE+0)
BL	_GPIO_Digital_Output+0
L_fusion_v8_STM32F407ZG__gpioInit_388:
;__fuv8_stm32f407zg_gpio.c,349 :: 		break;
IT	AL
BAL	L_fusion_v8_STM32F407ZG__gpioInit_379
;__fuv8_stm32f407zg_gpio.c,350 :: 		case _MIKROBUS_SCK_PIN:
L_fusion_v8_STM32F407ZG__gpioInit_389:
;__fuv8_stm32f407zg_gpio.c,351 :: 		if (dir == _GPIO_INPUT)
; dir start address is: 4 (R1)
CMP	R1, #1
IT	NE
BNE	L_fusion_v8_STM32F407ZG__gpioInit_390
; dir end address is: 4 (R1)
;__fuv8_stm32f407zg_gpio.c,352 :: 		GPIO_Digital_Input(&GPIOA_BASE, _GPIO_PINMASK_5);
MOVW	R1, #32
MOVW	R0, #lo_addr(GPIOA_BASE+0)
MOVT	R0, #hi_addr(GPIOA_BASE+0)
BL	_GPIO_Digital_Input+0
IT	AL
BAL	L_fusion_v8_STM32F407ZG__gpioInit_391
L_fusion_v8_STM32F407ZG__gpioInit_390:
;__fuv8_stm32f407zg_gpio.c,354 :: 		GPIO_Digital_Output(&GPIOA_BASE, _GPIO_PINMASK_5);
MOVW	R1, #32
MOVW	R0, #lo_addr(GPIOA_BASE+0)
MOVT	R0, #hi_addr(GPIOA_BASE+0)
BL	_GPIO_Digital_Output+0
L_fusion_v8_STM32F407ZG__gpioInit_391:
;__fuv8_stm32f407zg_gpio.c,355 :: 		break;
IT	AL
BAL	L_fusion_v8_STM32F407ZG__gpioInit_379
;__fuv8_stm32f407zg_gpio.c,356 :: 		case _MIKROBUS_MISO_PIN:
L_fusion_v8_STM32F407ZG__gpioInit_392:
;__fuv8_stm32f407zg_gpio.c,357 :: 		if (dir == _GPIO_INPUT)
; dir start address is: 4 (R1)
CMP	R1, #1
IT	NE
BNE	L_fusion_v8_STM32F407ZG__gpioInit_393
; dir end address is: 4 (R1)
;__fuv8_stm32f407zg_gpio.c,358 :: 		GPIO_Digital_Input(&GPIOA_BASE, _GPIO_PINMASK_6);
MOVW	R1, #64
MOVW	R0, #lo_addr(GPIOA_BASE+0)
MOVT	R0, #hi_addr(GPIOA_BASE+0)
BL	_GPIO_Digital_Input+0
IT	AL
BAL	L_fusion_v8_STM32F407ZG__gpioInit_394
L_fusion_v8_STM32F407ZG__gpioInit_393:
;__fuv8_stm32f407zg_gpio.c,360 :: 		GPIO_Digital_Output(&GPIOA_BASE, _GPIO_PINMASK_6);
MOVW	R1, #64
MOVW	R0, #lo_addr(GPIOA_BASE+0)
MOVT	R0, #hi_addr(GPIOA_BASE+0)
BL	_GPIO_Digital_Output+0
L_fusion_v8_STM32F407ZG__gpioInit_394:
;__fuv8_stm32f407zg_gpio.c,361 :: 		break;
IT	AL
BAL	L_fusion_v8_STM32F407ZG__gpioInit_379
;__fuv8_stm32f407zg_gpio.c,362 :: 		case _MIKROBUS_MOSI_PIN:
L_fusion_v8_STM32F407ZG__gpioInit_395:
;__fuv8_stm32f407zg_gpio.c,363 :: 		if (dir == _GPIO_INPUT)
; dir start address is: 4 (R1)
CMP	R1, #1
IT	NE
BNE	L_fusion_v8_STM32F407ZG__gpioInit_396
; dir end address is: 4 (R1)
;__fuv8_stm32f407zg_gpio.c,364 :: 		GPIO_Digital_Input(&GPIOB_BASE, _GPIO_PINMASK_5);
MOVW	R1, #32
MOVW	R0, #lo_addr(GPIOB_BASE+0)
MOVT	R0, #hi_addr(GPIOB_BASE+0)
BL	_GPIO_Digital_Input+0
IT	AL
BAL	L_fusion_v8_STM32F407ZG__gpioInit_397
L_fusion_v8_STM32F407ZG__gpioInit_396:
;__fuv8_stm32f407zg_gpio.c,366 :: 		GPIO_Digital_Output(&GPIOB_BASE, _GPIO_PINMASK_5);
MOVW	R1, #32
MOVW	R0, #lo_addr(GPIOB_BASE+0)
MOVT	R0, #hi_addr(GPIOB_BASE+0)
BL	_GPIO_Digital_Output+0
L_fusion_v8_STM32F407ZG__gpioInit_397:
;__fuv8_stm32f407zg_gpio.c,367 :: 		break;
IT	AL
BAL	L_fusion_v8_STM32F407ZG__gpioInit_379
;__fuv8_stm32f407zg_gpio.c,368 :: 		case _MIKROBUS_PWM_PIN:
L_fusion_v8_STM32F407ZG__gpioInit_398:
;__fuv8_stm32f407zg_gpio.c,369 :: 		if (dir == _GPIO_INPUT)
; dir start address is: 4 (R1)
CMP	R1, #1
IT	NE
BNE	L_fusion_v8_STM32F407ZG__gpioInit_399
; dir end address is: 4 (R1)
;__fuv8_stm32f407zg_gpio.c,370 :: 		GPIO_Digital_Input(&GPIOB_BASE, _GPIO_PINMASK_3);
MOVW	R1, #8
MOVW	R0, #lo_addr(GPIOB_BASE+0)
MOVT	R0, #hi_addr(GPIOB_BASE+0)
BL	_GPIO_Digital_Input+0
IT	AL
BAL	L_fusion_v8_STM32F407ZG__gpioInit_3100
L_fusion_v8_STM32F407ZG__gpioInit_399:
;__fuv8_stm32f407zg_gpio.c,372 :: 		GPIO_Digital_Output(&GPIOB_BASE, _GPIO_PINMASK_3);
MOVW	R1, #8
MOVW	R0, #lo_addr(GPIOB_BASE+0)
MOVT	R0, #hi_addr(GPIOB_BASE+0)
BL	_GPIO_Digital_Output+0
L_fusion_v8_STM32F407ZG__gpioInit_3100:
;__fuv8_stm32f407zg_gpio.c,373 :: 		break;
IT	AL
BAL	L_fusion_v8_STM32F407ZG__gpioInit_379
;__fuv8_stm32f407zg_gpio.c,374 :: 		case _MIKROBUS_INT_PIN:
L_fusion_v8_STM32F407ZG__gpioInit_3101:
;__fuv8_stm32f407zg_gpio.c,375 :: 		if (dir == _GPIO_INPUT)
; dir start address is: 4 (R1)
CMP	R1, #1
IT	NE
BNE	L_fusion_v8_STM32F407ZG__gpioInit_3102
; dir end address is: 4 (R1)
;__fuv8_stm32f407zg_gpio.c,376 :: 		GPIO_Digital_Input(&GPIOG_BASE, _GPIO_PINMASK_2);
MOVW	R1, #4
MOVW	R0, #lo_addr(GPIOG_BASE+0)
MOVT	R0, #hi_addr(GPIOG_BASE+0)
BL	_GPIO_Digital_Input+0
IT	AL
BAL	L_fusion_v8_STM32F407ZG__gpioInit_3103
L_fusion_v8_STM32F407ZG__gpioInit_3102:
;__fuv8_stm32f407zg_gpio.c,378 :: 		GPIO_Digital_Output(&GPIOG_BASE, _GPIO_PINMASK_2);
MOVW	R1, #4
MOVW	R0, #lo_addr(GPIOG_BASE+0)
MOVT	R0, #hi_addr(GPIOG_BASE+0)
BL	_GPIO_Digital_Output+0
L_fusion_v8_STM32F407ZG__gpioInit_3103:
;__fuv8_stm32f407zg_gpio.c,379 :: 		break;
IT	AL
BAL	L_fusion_v8_STM32F407ZG__gpioInit_379
;__fuv8_stm32f407zg_gpio.c,380 :: 		case _MIKROBUS_RX_PIN:
L_fusion_v8_STM32F407ZG__gpioInit_3104:
;__fuv8_stm32f407zg_gpio.c,381 :: 		if (dir == _GPIO_INPUT)
; dir start address is: 4 (R1)
CMP	R1, #1
IT	NE
BNE	L_fusion_v8_STM32F407ZG__gpioInit_3105
; dir end address is: 4 (R1)
;__fuv8_stm32f407zg_gpio.c,382 :: 		GPIO_Digital_Input(&GPIOC_BASE, _GPIO_PINMASK_7);
MOVW	R1, #128
MOVW	R0, #lo_addr(GPIOC_BASE+0)
MOVT	R0, #hi_addr(GPIOC_BASE+0)
BL	_GPIO_Digital_Input+0
IT	AL
BAL	L_fusion_v8_STM32F407ZG__gpioInit_3106
L_fusion_v8_STM32F407ZG__gpioInit_3105:
;__fuv8_stm32f407zg_gpio.c,384 :: 		GPIO_Digital_Output(&GPIOC_BASE, _GPIO_PINMASK_7);
MOVW	R1, #128
MOVW	R0, #lo_addr(GPIOC_BASE+0)
MOVT	R0, #hi_addr(GPIOC_BASE+0)
BL	_GPIO_Digital_Output+0
L_fusion_v8_STM32F407ZG__gpioInit_3106:
;__fuv8_stm32f407zg_gpio.c,385 :: 		break;
IT	AL
BAL	L_fusion_v8_STM32F407ZG__gpioInit_379
;__fuv8_stm32f407zg_gpio.c,386 :: 		case _MIKROBUS_TX_PIN:
L_fusion_v8_STM32F407ZG__gpioInit_3107:
;__fuv8_stm32f407zg_gpio.c,387 :: 		if (dir == _GPIO_INPUT)
; dir start address is: 4 (R1)
CMP	R1, #1
IT	NE
BNE	L_fusion_v8_STM32F407ZG__gpioInit_3108
; dir end address is: 4 (R1)
;__fuv8_stm32f407zg_gpio.c,388 :: 		GPIO_Digital_Input(&GPIOC_BASE, _GPIO_PINMASK_6);
MOVW	R1, #64
MOVW	R0, #lo_addr(GPIOC_BASE+0)
MOVT	R0, #hi_addr(GPIOC_BASE+0)
BL	_GPIO_Digital_Input+0
IT	AL
BAL	L_fusion_v8_STM32F407ZG__gpioInit_3109
L_fusion_v8_STM32F407ZG__gpioInit_3108:
;__fuv8_stm32f407zg_gpio.c,390 :: 		GPIO_Digital_Output(&GPIOC_BASE, _GPIO_PINMASK_6);
MOVW	R1, #64
MOVW	R0, #lo_addr(GPIOC_BASE+0)
MOVT	R0, #hi_addr(GPIOC_BASE+0)
BL	_GPIO_Digital_Output+0
L_fusion_v8_STM32F407ZG__gpioInit_3109:
;__fuv8_stm32f407zg_gpio.c,391 :: 		break;
IT	AL
BAL	L_fusion_v8_STM32F407ZG__gpioInit_379
;__fuv8_stm32f407zg_gpio.c,392 :: 		case _MIKROBUS_SCL_PIN:
L_fusion_v8_STM32F407ZG__gpioInit_3110:
;__fuv8_stm32f407zg_gpio.c,393 :: 		if (dir == _GPIO_INPUT)
; dir start address is: 4 (R1)
CMP	R1, #1
IT	NE
BNE	L_fusion_v8_STM32F407ZG__gpioInit_3111
; dir end address is: 4 (R1)
;__fuv8_stm32f407zg_gpio.c,394 :: 		GPIO_Digital_Input(&GPIOF_BASE, _GPIO_PINMASK_1);
MOVW	R1, #2
MOVW	R0, #lo_addr(GPIOF_BASE+0)
MOVT	R0, #hi_addr(GPIOF_BASE+0)
BL	_GPIO_Digital_Input+0
IT	AL
BAL	L_fusion_v8_STM32F407ZG__gpioInit_3112
L_fusion_v8_STM32F407ZG__gpioInit_3111:
;__fuv8_stm32f407zg_gpio.c,396 :: 		GPIO_Digital_Output(&GPIOF_BASE, _GPIO_PINMASK_1);
MOVW	R1, #2
MOVW	R0, #lo_addr(GPIOF_BASE+0)
MOVT	R0, #hi_addr(GPIOF_BASE+0)
BL	_GPIO_Digital_Output+0
L_fusion_v8_STM32F407ZG__gpioInit_3112:
;__fuv8_stm32f407zg_gpio.c,397 :: 		break;
IT	AL
BAL	L_fusion_v8_STM32F407ZG__gpioInit_379
;__fuv8_stm32f407zg_gpio.c,398 :: 		case _MIKROBUS_SDA_PIN:
L_fusion_v8_STM32F407ZG__gpioInit_3113:
;__fuv8_stm32f407zg_gpio.c,399 :: 		if (dir == _GPIO_INPUT)
; dir start address is: 4 (R1)
CMP	R1, #1
IT	NE
BNE	L_fusion_v8_STM32F407ZG__gpioInit_3114
; dir end address is: 4 (R1)
;__fuv8_stm32f407zg_gpio.c,400 :: 		GPIO_Digital_Input(&GPIOF_BASE, _GPIO_PINMASK_0);
MOVW	R1, #1
MOVW	R0, #lo_addr(GPIOF_BASE+0)
MOVT	R0, #hi_addr(GPIOF_BASE+0)
BL	_GPIO_Digital_Input+0
IT	AL
BAL	L_fusion_v8_STM32F407ZG__gpioInit_3115
L_fusion_v8_STM32F407ZG__gpioInit_3114:
;__fuv8_stm32f407zg_gpio.c,402 :: 		GPIO_Digital_Output(&GPIOF_BASE, _GPIO_PINMASK_0);
MOVW	R1, #1
MOVW	R0, #lo_addr(GPIOF_BASE+0)
MOVT	R0, #hi_addr(GPIOF_BASE+0)
BL	_GPIO_Digital_Output+0
L_fusion_v8_STM32F407ZG__gpioInit_3115:
;__fuv8_stm32f407zg_gpio.c,403 :: 		break;
IT	AL
BAL	L_fusion_v8_STM32F407ZG__gpioInit_379
;__fuv8_stm32f407zg_gpio.c,404 :: 		default:
L_fusion_v8_STM32F407ZG__gpioInit_3116:
;__fuv8_stm32f407zg_gpio.c,405 :: 		return _MIKROBUS_ERR_PIN;
MOVS	R0, #1
IT	AL
BAL	L_end__gpioInit_3
;__fuv8_stm32f407zg_gpio.c,406 :: 		}
L_fusion_v8_STM32F407ZG__gpioInit_378:
; dir start address is: 4 (R1)
; pin start address is: 0 (R0)
CMP	R0, #0
IT	EQ
BEQ	L_fusion_v8_STM32F407ZG__gpioInit_380
CMP	R0, #1
IT	EQ
BEQ	L_fusion_v8_STM32F407ZG__gpioInit_383
CMP	R0, #2
IT	EQ
BEQ	L_fusion_v8_STM32F407ZG__gpioInit_386
CMP	R0, #3
IT	EQ
BEQ	L_fusion_v8_STM32F407ZG__gpioInit_389
CMP	R0, #4
IT	EQ
BEQ	L_fusion_v8_STM32F407ZG__gpioInit_392
CMP	R0, #5
IT	EQ
BEQ	L_fusion_v8_STM32F407ZG__gpioInit_395
CMP	R0, #6
IT	EQ
BEQ	L_fusion_v8_STM32F407ZG__gpioInit_398
CMP	R0, #7
IT	EQ
BEQ	L_fusion_v8_STM32F407ZG__gpioInit_3101
CMP	R0, #8
IT	EQ
BEQ	L_fusion_v8_STM32F407ZG__gpioInit_3104
CMP	R0, #9
IT	EQ
BEQ	L_fusion_v8_STM32F407ZG__gpioInit_3107
CMP	R0, #10
IT	EQ
BEQ	L_fusion_v8_STM32F407ZG__gpioInit_3110
CMP	R0, #11
IT	EQ
BEQ	L_fusion_v8_STM32F407ZG__gpioInit_3113
; pin end address is: 0 (R0)
; dir end address is: 4 (R1)
IT	AL
BAL	L_fusion_v8_STM32F407ZG__gpioInit_3116
L_fusion_v8_STM32F407ZG__gpioInit_379:
;__fuv8_stm32f407zg_gpio.c,407 :: 		return _MIKROBUS_OK;
MOVS	R0, __MIKROBUS_OK
;__fuv8_stm32f407zg_gpio.c,408 :: 		}
L_end__gpioInit_3:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of fusion_v8_STM32F407ZG__gpioInit_3
fusion_v8_STM32F407ZG__gpioInit_4:
;__fuv8_stm32f407zg_gpio.c,411 :: 		static T_mikrobus_ret _gpioInit_4(T_mikrobus_pin pin, T_gpio_dir dir)
; dir start address is: 4 (R1)
; pin start address is: 0 (R0)
SUB	SP, SP, #4
STR	LR, [SP, #0]
; dir end address is: 4 (R1)
; pin end address is: 0 (R0)
; pin start address is: 0 (R0)
; dir start address is: 4 (R1)
;__fuv8_stm32f407zg_gpio.c,413 :: 		switch (pin)
IT	AL
BAL	L_fusion_v8_STM32F407ZG__gpioInit_4117
; pin end address is: 0 (R0)
;__fuv8_stm32f407zg_gpio.c,415 :: 		case _MIKROBUS_AN_PIN:
L_fusion_v8_STM32F407ZG__gpioInit_4119:
;__fuv8_stm32f407zg_gpio.c,416 :: 		if (dir == _GPIO_INPUT)
CMP	R1, #1
IT	NE
BNE	L_fusion_v8_STM32F407ZG__gpioInit_4120
; dir end address is: 4 (R1)
;__fuv8_stm32f407zg_gpio.c,417 :: 		GPIO_Digital_Input(&GPIOC_BASE, _GPIO_PINMASK_0);
MOVW	R1, #1
MOVW	R0, #lo_addr(GPIOC_BASE+0)
MOVT	R0, #hi_addr(GPIOC_BASE+0)
BL	_GPIO_Digital_Input+0
IT	AL
BAL	L_fusion_v8_STM32F407ZG__gpioInit_4121
L_fusion_v8_STM32F407ZG__gpioInit_4120:
;__fuv8_stm32f407zg_gpio.c,419 :: 		GPIO_Digital_Output(&GPIOC_BASE, _GPIO_PINMASK_0);
MOVW	R1, #1
MOVW	R0, #lo_addr(GPIOC_BASE+0)
MOVT	R0, #hi_addr(GPIOC_BASE+0)
BL	_GPIO_Digital_Output+0
L_fusion_v8_STM32F407ZG__gpioInit_4121:
;__fuv8_stm32f407zg_gpio.c,420 :: 		break;
IT	AL
BAL	L_fusion_v8_STM32F407ZG__gpioInit_4118
;__fuv8_stm32f407zg_gpio.c,421 :: 		case _MIKROBUS_RST_PIN:
L_fusion_v8_STM32F407ZG__gpioInit_4122:
;__fuv8_stm32f407zg_gpio.c,422 :: 		if (dir == _GPIO_INPUT)
; dir start address is: 4 (R1)
CMP	R1, #1
IT	NE
BNE	L_fusion_v8_STM32F407ZG__gpioInit_4123
; dir end address is: 4 (R1)
;__fuv8_stm32f407zg_gpio.c,423 :: 		GPIO_Digital_Input(&GPIOG_BASE, _GPIO_PINMASK_4);
MOVW	R1, #16
MOVW	R0, #lo_addr(GPIOG_BASE+0)
MOVT	R0, #hi_addr(GPIOG_BASE+0)
BL	_GPIO_Digital_Input+0
IT	AL
BAL	L_fusion_v8_STM32F407ZG__gpioInit_4124
L_fusion_v8_STM32F407ZG__gpioInit_4123:
;__fuv8_stm32f407zg_gpio.c,425 :: 		GPIO_Digital_Output(&GPIOG_BASE, _GPIO_PINMASK_4);
MOVW	R1, #16
MOVW	R0, #lo_addr(GPIOG_BASE+0)
MOVT	R0, #hi_addr(GPIOG_BASE+0)
BL	_GPIO_Digital_Output+0
L_fusion_v8_STM32F407ZG__gpioInit_4124:
;__fuv8_stm32f407zg_gpio.c,426 :: 		break;
IT	AL
BAL	L_fusion_v8_STM32F407ZG__gpioInit_4118
;__fuv8_stm32f407zg_gpio.c,427 :: 		case _MIKROBUS_CS_PIN:
L_fusion_v8_STM32F407ZG__gpioInit_4125:
;__fuv8_stm32f407zg_gpio.c,428 :: 		if (dir == _GPIO_INPUT)
; dir start address is: 4 (R1)
CMP	R1, #1
IT	NE
BNE	L_fusion_v8_STM32F407ZG__gpioInit_4126
; dir end address is: 4 (R1)
;__fuv8_stm32f407zg_gpio.c,429 :: 		GPIO_Digital_Input(&GPIOB_BASE, _GPIO_PINMASK_13);
MOVW	R1, #8192
MOVW	R0, #lo_addr(GPIOB_BASE+0)
MOVT	R0, #hi_addr(GPIOB_BASE+0)
BL	_GPIO_Digital_Input+0
IT	AL
BAL	L_fusion_v8_STM32F407ZG__gpioInit_4127
L_fusion_v8_STM32F407ZG__gpioInit_4126:
;__fuv8_stm32f407zg_gpio.c,431 :: 		GPIO_Digital_Output(&GPIOB_BASE, _GPIO_PINMASK_13);
MOVW	R1, #8192
MOVW	R0, #lo_addr(GPIOB_BASE+0)
MOVT	R0, #hi_addr(GPIOB_BASE+0)
BL	_GPIO_Digital_Output+0
L_fusion_v8_STM32F407ZG__gpioInit_4127:
;__fuv8_stm32f407zg_gpio.c,432 :: 		break;
IT	AL
BAL	L_fusion_v8_STM32F407ZG__gpioInit_4118
;__fuv8_stm32f407zg_gpio.c,433 :: 		case _MIKROBUS_SCK_PIN:
L_fusion_v8_STM32F407ZG__gpioInit_4128:
;__fuv8_stm32f407zg_gpio.c,434 :: 		if (dir == _GPIO_INPUT)
; dir start address is: 4 (R1)
CMP	R1, #1
IT	NE
BNE	L_fusion_v8_STM32F407ZG__gpioInit_4129
; dir end address is: 4 (R1)
;__fuv8_stm32f407zg_gpio.c,435 :: 		GPIO_Digital_Input(&GPIOA_BASE, _GPIO_PINMASK_5);
MOVW	R1, #32
MOVW	R0, #lo_addr(GPIOA_BASE+0)
MOVT	R0, #hi_addr(GPIOA_BASE+0)
BL	_GPIO_Digital_Input+0
IT	AL
BAL	L_fusion_v8_STM32F407ZG__gpioInit_4130
L_fusion_v8_STM32F407ZG__gpioInit_4129:
;__fuv8_stm32f407zg_gpio.c,437 :: 		GPIO_Digital_Output(&GPIOA_BASE, _GPIO_PINMASK_5);
MOVW	R1, #32
MOVW	R0, #lo_addr(GPIOA_BASE+0)
MOVT	R0, #hi_addr(GPIOA_BASE+0)
BL	_GPIO_Digital_Output+0
L_fusion_v8_STM32F407ZG__gpioInit_4130:
;__fuv8_stm32f407zg_gpio.c,438 :: 		break;
IT	AL
BAL	L_fusion_v8_STM32F407ZG__gpioInit_4118
;__fuv8_stm32f407zg_gpio.c,439 :: 		case _MIKROBUS_MISO_PIN:
L_fusion_v8_STM32F407ZG__gpioInit_4131:
;__fuv8_stm32f407zg_gpio.c,440 :: 		if (dir == _GPIO_INPUT)
; dir start address is: 4 (R1)
CMP	R1, #1
IT	NE
BNE	L_fusion_v8_STM32F407ZG__gpioInit_4132
; dir end address is: 4 (R1)
;__fuv8_stm32f407zg_gpio.c,441 :: 		GPIO_Digital_Input(&GPIOA_BASE, _GPIO_PINMASK_6);
MOVW	R1, #64
MOVW	R0, #lo_addr(GPIOA_BASE+0)
MOVT	R0, #hi_addr(GPIOA_BASE+0)
BL	_GPIO_Digital_Input+0
IT	AL
BAL	L_fusion_v8_STM32F407ZG__gpioInit_4133
L_fusion_v8_STM32F407ZG__gpioInit_4132:
;__fuv8_stm32f407zg_gpio.c,443 :: 		GPIO_Digital_Output(&GPIOA_BASE, _GPIO_PINMASK_6);
MOVW	R1, #64
MOVW	R0, #lo_addr(GPIOA_BASE+0)
MOVT	R0, #hi_addr(GPIOA_BASE+0)
BL	_GPIO_Digital_Output+0
L_fusion_v8_STM32F407ZG__gpioInit_4133:
;__fuv8_stm32f407zg_gpio.c,444 :: 		break;
IT	AL
BAL	L_fusion_v8_STM32F407ZG__gpioInit_4118
;__fuv8_stm32f407zg_gpio.c,445 :: 		case _MIKROBUS_MOSI_PIN:
L_fusion_v8_STM32F407ZG__gpioInit_4134:
;__fuv8_stm32f407zg_gpio.c,446 :: 		if (dir == _GPIO_INPUT)
; dir start address is: 4 (R1)
CMP	R1, #1
IT	NE
BNE	L_fusion_v8_STM32F407ZG__gpioInit_4135
; dir end address is: 4 (R1)
;__fuv8_stm32f407zg_gpio.c,447 :: 		GPIO_Digital_Input(&GPIOB_BASE, _GPIO_PINMASK_5);
MOVW	R1, #32
MOVW	R0, #lo_addr(GPIOB_BASE+0)
MOVT	R0, #hi_addr(GPIOB_BASE+0)
BL	_GPIO_Digital_Input+0
IT	AL
BAL	L_fusion_v8_STM32F407ZG__gpioInit_4136
L_fusion_v8_STM32F407ZG__gpioInit_4135:
;__fuv8_stm32f407zg_gpio.c,449 :: 		GPIO_Digital_Output(&GPIOB_BASE, _GPIO_PINMASK_5);
MOVW	R1, #32
MOVW	R0, #lo_addr(GPIOB_BASE+0)
MOVT	R0, #hi_addr(GPIOB_BASE+0)
BL	_GPIO_Digital_Output+0
L_fusion_v8_STM32F407ZG__gpioInit_4136:
;__fuv8_stm32f407zg_gpio.c,450 :: 		break;
IT	AL
BAL	L_fusion_v8_STM32F407ZG__gpioInit_4118
;__fuv8_stm32f407zg_gpio.c,451 :: 		case _MIKROBUS_PWM_PIN:
L_fusion_v8_STM32F407ZG__gpioInit_4137:
;__fuv8_stm32f407zg_gpio.c,452 :: 		if (dir == _GPIO_INPUT)
; dir start address is: 4 (R1)
CMP	R1, #1
IT	NE
BNE	L_fusion_v8_STM32F407ZG__gpioInit_4138
; dir end address is: 4 (R1)
;__fuv8_stm32f407zg_gpio.c,453 :: 		GPIO_Digital_Input(&GPIOB_BASE, _GPIO_PINMASK_4);
MOVW	R1, #16
MOVW	R0, #lo_addr(GPIOB_BASE+0)
MOVT	R0, #hi_addr(GPIOB_BASE+0)
BL	_GPIO_Digital_Input+0
IT	AL
BAL	L_fusion_v8_STM32F407ZG__gpioInit_4139
L_fusion_v8_STM32F407ZG__gpioInit_4138:
;__fuv8_stm32f407zg_gpio.c,455 :: 		GPIO_Digital_Output(&GPIOB_BASE, _GPIO_PINMASK_4);
MOVW	R1, #16
MOVW	R0, #lo_addr(GPIOB_BASE+0)
MOVT	R0, #hi_addr(GPIOB_BASE+0)
BL	_GPIO_Digital_Output+0
L_fusion_v8_STM32F407ZG__gpioInit_4139:
;__fuv8_stm32f407zg_gpio.c,456 :: 		break;
IT	AL
BAL	L_fusion_v8_STM32F407ZG__gpioInit_4118
;__fuv8_stm32f407zg_gpio.c,457 :: 		case _MIKROBUS_INT_PIN:
L_fusion_v8_STM32F407ZG__gpioInit_4140:
;__fuv8_stm32f407zg_gpio.c,458 :: 		if (dir == _GPIO_INPUT)
; dir start address is: 4 (R1)
CMP	R1, #1
IT	NE
BNE	L_fusion_v8_STM32F407ZG__gpioInit_4141
; dir end address is: 4 (R1)
;__fuv8_stm32f407zg_gpio.c,459 :: 		GPIO_Digital_Input(&GPIOG_BASE, _GPIO_PINMASK_3);
MOVW	R1, #8
MOVW	R0, #lo_addr(GPIOG_BASE+0)
MOVT	R0, #hi_addr(GPIOG_BASE+0)
BL	_GPIO_Digital_Input+0
IT	AL
BAL	L_fusion_v8_STM32F407ZG__gpioInit_4142
L_fusion_v8_STM32F407ZG__gpioInit_4141:
;__fuv8_stm32f407zg_gpio.c,461 :: 		GPIO_Digital_Output(&GPIOG_BASE, _GPIO_PINMASK_3);
MOVW	R1, #8
MOVW	R0, #lo_addr(GPIOG_BASE+0)
MOVT	R0, #hi_addr(GPIOG_BASE+0)
BL	_GPIO_Digital_Output+0
L_fusion_v8_STM32F407ZG__gpioInit_4142:
;__fuv8_stm32f407zg_gpio.c,462 :: 		break;
IT	AL
BAL	L_fusion_v8_STM32F407ZG__gpioInit_4118
;__fuv8_stm32f407zg_gpio.c,463 :: 		case _MIKROBUS_RX_PIN:
L_fusion_v8_STM32F407ZG__gpioInit_4143:
;__fuv8_stm32f407zg_gpio.c,464 :: 		if (dir == _GPIO_INPUT)
; dir start address is: 4 (R1)
CMP	R1, #1
IT	NE
BNE	L_fusion_v8_STM32F407ZG__gpioInit_4144
; dir end address is: 4 (R1)
;__fuv8_stm32f407zg_gpio.c,465 :: 		GPIO_Digital_Input(&GPIOC_BASE, _GPIO_PINMASK_7);
MOVW	R1, #128
MOVW	R0, #lo_addr(GPIOC_BASE+0)
MOVT	R0, #hi_addr(GPIOC_BASE+0)
BL	_GPIO_Digital_Input+0
IT	AL
BAL	L_fusion_v8_STM32F407ZG__gpioInit_4145
L_fusion_v8_STM32F407ZG__gpioInit_4144:
;__fuv8_stm32f407zg_gpio.c,467 :: 		GPIO_Digital_Output(&GPIOC_BASE, _GPIO_PINMASK_7);
MOVW	R1, #128
MOVW	R0, #lo_addr(GPIOC_BASE+0)
MOVT	R0, #hi_addr(GPIOC_BASE+0)
BL	_GPIO_Digital_Output+0
L_fusion_v8_STM32F407ZG__gpioInit_4145:
;__fuv8_stm32f407zg_gpio.c,468 :: 		break;
IT	AL
BAL	L_fusion_v8_STM32F407ZG__gpioInit_4118
;__fuv8_stm32f407zg_gpio.c,469 :: 		case _MIKROBUS_TX_PIN:
L_fusion_v8_STM32F407ZG__gpioInit_4146:
;__fuv8_stm32f407zg_gpio.c,470 :: 		if (dir == _GPIO_INPUT)
; dir start address is: 4 (R1)
CMP	R1, #1
IT	NE
BNE	L_fusion_v8_STM32F407ZG__gpioInit_4147
; dir end address is: 4 (R1)
;__fuv8_stm32f407zg_gpio.c,471 :: 		GPIO_Digital_Input(&GPIOC_BASE, _GPIO_PINMASK_6);
MOVW	R1, #64
MOVW	R0, #lo_addr(GPIOC_BASE+0)
MOVT	R0, #hi_addr(GPIOC_BASE+0)
BL	_GPIO_Digital_Input+0
IT	AL
BAL	L_fusion_v8_STM32F407ZG__gpioInit_4148
L_fusion_v8_STM32F407ZG__gpioInit_4147:
;__fuv8_stm32f407zg_gpio.c,473 :: 		GPIO_Digital_Output(&GPIOC_BASE, _GPIO_PINMASK_6);
MOVW	R1, #64
MOVW	R0, #lo_addr(GPIOC_BASE+0)
MOVT	R0, #hi_addr(GPIOC_BASE+0)
BL	_GPIO_Digital_Output+0
L_fusion_v8_STM32F407ZG__gpioInit_4148:
;__fuv8_stm32f407zg_gpio.c,474 :: 		break;
IT	AL
BAL	L_fusion_v8_STM32F407ZG__gpioInit_4118
;__fuv8_stm32f407zg_gpio.c,475 :: 		case _MIKROBUS_SCL_PIN:
L_fusion_v8_STM32F407ZG__gpioInit_4149:
;__fuv8_stm32f407zg_gpio.c,476 :: 		if (dir == _GPIO_INPUT)
; dir start address is: 4 (R1)
CMP	R1, #1
IT	NE
BNE	L_fusion_v8_STM32F407ZG__gpioInit_4150
; dir end address is: 4 (R1)
;__fuv8_stm32f407zg_gpio.c,477 :: 		GPIO_Digital_Input(&GPIOF_BASE, _GPIO_PINMASK_1);
MOVW	R1, #2
MOVW	R0, #lo_addr(GPIOF_BASE+0)
MOVT	R0, #hi_addr(GPIOF_BASE+0)
BL	_GPIO_Digital_Input+0
IT	AL
BAL	L_fusion_v8_STM32F407ZG__gpioInit_4151
L_fusion_v8_STM32F407ZG__gpioInit_4150:
;__fuv8_stm32f407zg_gpio.c,479 :: 		GPIO_Digital_Output(&GPIOF_BASE, _GPIO_PINMASK_1);
MOVW	R1, #2
MOVW	R0, #lo_addr(GPIOF_BASE+0)
MOVT	R0, #hi_addr(GPIOF_BASE+0)
BL	_GPIO_Digital_Output+0
L_fusion_v8_STM32F407ZG__gpioInit_4151:
;__fuv8_stm32f407zg_gpio.c,480 :: 		break;
IT	AL
BAL	L_fusion_v8_STM32F407ZG__gpioInit_4118
;__fuv8_stm32f407zg_gpio.c,481 :: 		case _MIKROBUS_SDA_PIN:
L_fusion_v8_STM32F407ZG__gpioInit_4152:
;__fuv8_stm32f407zg_gpio.c,482 :: 		if (dir == _GPIO_INPUT)
; dir start address is: 4 (R1)
CMP	R1, #1
IT	NE
BNE	L_fusion_v8_STM32F407ZG__gpioInit_4153
; dir end address is: 4 (R1)
;__fuv8_stm32f407zg_gpio.c,483 :: 		GPIO_Digital_Input(&GPIOF_BASE, _GPIO_PINMASK_0);
MOVW	R1, #1
MOVW	R0, #lo_addr(GPIOF_BASE+0)
MOVT	R0, #hi_addr(GPIOF_BASE+0)
BL	_GPIO_Digital_Input+0
IT	AL
BAL	L_fusion_v8_STM32F407ZG__gpioInit_4154
L_fusion_v8_STM32F407ZG__gpioInit_4153:
;__fuv8_stm32f407zg_gpio.c,485 :: 		GPIO_Digital_Output(&GPIOF_BASE, _GPIO_PINMASK_0);
MOVW	R1, #1
MOVW	R0, #lo_addr(GPIOF_BASE+0)
MOVT	R0, #hi_addr(GPIOF_BASE+0)
BL	_GPIO_Digital_Output+0
L_fusion_v8_STM32F407ZG__gpioInit_4154:
;__fuv8_stm32f407zg_gpio.c,486 :: 		break;
IT	AL
BAL	L_fusion_v8_STM32F407ZG__gpioInit_4118
;__fuv8_stm32f407zg_gpio.c,487 :: 		default:
L_fusion_v8_STM32F407ZG__gpioInit_4155:
;__fuv8_stm32f407zg_gpio.c,488 :: 		return _MIKROBUS_ERR_PIN;
MOVS	R0, #1
IT	AL
BAL	L_end__gpioInit_4
;__fuv8_stm32f407zg_gpio.c,489 :: 		}
L_fusion_v8_STM32F407ZG__gpioInit_4117:
; dir start address is: 4 (R1)
; pin start address is: 0 (R0)
CMP	R0, #0
IT	EQ
BEQ	L_fusion_v8_STM32F407ZG__gpioInit_4119
CMP	R0, #1
IT	EQ
BEQ	L_fusion_v8_STM32F407ZG__gpioInit_4122
CMP	R0, #2
IT	EQ
BEQ	L_fusion_v8_STM32F407ZG__gpioInit_4125
CMP	R0, #3
IT	EQ
BEQ	L_fusion_v8_STM32F407ZG__gpioInit_4128
CMP	R0, #4
IT	EQ
BEQ	L_fusion_v8_STM32F407ZG__gpioInit_4131
CMP	R0, #5
IT	EQ
BEQ	L_fusion_v8_STM32F407ZG__gpioInit_4134
CMP	R0, #6
IT	EQ
BEQ	L_fusion_v8_STM32F407ZG__gpioInit_4137
CMP	R0, #7
IT	EQ
BEQ	L_fusion_v8_STM32F407ZG__gpioInit_4140
CMP	R0, #8
IT	EQ
BEQ	L_fusion_v8_STM32F407ZG__gpioInit_4143
CMP	R0, #9
IT	EQ
BEQ	L_fusion_v8_STM32F407ZG__gpioInit_4146
CMP	R0, #10
IT	EQ
BEQ	L_fusion_v8_STM32F407ZG__gpioInit_4149
CMP	R0, #11
IT	EQ
BEQ	L_fusion_v8_STM32F407ZG__gpioInit_4152
; pin end address is: 0 (R0)
; dir end address is: 4 (R1)
IT	AL
BAL	L_fusion_v8_STM32F407ZG__gpioInit_4155
L_fusion_v8_STM32F407ZG__gpioInit_4118:
;__fuv8_stm32f407zg_gpio.c,490 :: 		return _MIKROBUS_OK;
MOVS	R0, __MIKROBUS_OK
;__fuv8_stm32f407zg_gpio.c,491 :: 		}
L_end__gpioInit_4:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of fusion_v8_STM32F407ZG__gpioInit_4
fusion_v8_STM32F407ZG__gpioInit_5:
;__fuv8_stm32f407zg_gpio.c,494 :: 		static T_mikrobus_ret _gpioInit_5(T_mikrobus_pin pin, T_gpio_dir dir)
; dir start address is: 4 (R1)
; pin start address is: 0 (R0)
SUB	SP, SP, #4
STR	LR, [SP, #0]
; dir end address is: 4 (R1)
; pin end address is: 0 (R0)
; pin start address is: 0 (R0)
; dir start address is: 4 (R1)
;__fuv8_stm32f407zg_gpio.c,496 :: 		switch (pin)
IT	AL
BAL	L_fusion_v8_STM32F407ZG__gpioInit_5156
; pin end address is: 0 (R0)
;__fuv8_stm32f407zg_gpio.c,498 :: 		case _MIKROBUS_AN_PIN:
L_fusion_v8_STM32F407ZG__gpioInit_5158:
;__fuv8_stm32f407zg_gpio.c,499 :: 		if (dir == _GPIO_INPUT)
CMP	R1, #1
IT	NE
BNE	L_fusion_v8_STM32F407ZG__gpioInit_5159
; dir end address is: 4 (R1)
;__fuv8_stm32f407zg_gpio.c,500 :: 		GPIO_Digital_Input(&GPIOB_BASE, _GPIO_PINMASK_1);
MOVW	R1, #2
MOVW	R0, #lo_addr(GPIOB_BASE+0)
MOVT	R0, #hi_addr(GPIOB_BASE+0)
BL	_GPIO_Digital_Input+0
IT	AL
BAL	L_fusion_v8_STM32F407ZG__gpioInit_5160
L_fusion_v8_STM32F407ZG__gpioInit_5159:
;__fuv8_stm32f407zg_gpio.c,502 :: 		GPIO_Digital_Output(&GPIOB_BASE, _GPIO_PINMASK_1);
MOVW	R1, #2
MOVW	R0, #lo_addr(GPIOB_BASE+0)
MOVT	R0, #hi_addr(GPIOB_BASE+0)
BL	_GPIO_Digital_Output+0
L_fusion_v8_STM32F407ZG__gpioInit_5160:
;__fuv8_stm32f407zg_gpio.c,503 :: 		break;
IT	AL
BAL	L_fusion_v8_STM32F407ZG__gpioInit_5157
;__fuv8_stm32f407zg_gpio.c,504 :: 		case _MIKROBUS_RST_PIN:
L_fusion_v8_STM32F407ZG__gpioInit_5161:
;__fuv8_stm32f407zg_gpio.c,505 :: 		if (dir == _GPIO_INPUT)
; dir start address is: 4 (R1)
CMP	R1, #1
IT	NE
BNE	L_fusion_v8_STM32F407ZG__gpioInit_5162
; dir end address is: 4 (R1)
;__fuv8_stm32f407zg_gpio.c,506 :: 		GPIO_Digital_Input(&GPIOE_BASE, _GPIO_PINMASK_15);
MOVW	R1, #32768
MOVW	R0, #lo_addr(GPIOE_BASE+0)
MOVT	R0, #hi_addr(GPIOE_BASE+0)
BL	_GPIO_Digital_Input+0
IT	AL
BAL	L_fusion_v8_STM32F407ZG__gpioInit_5163
L_fusion_v8_STM32F407ZG__gpioInit_5162:
;__fuv8_stm32f407zg_gpio.c,508 :: 		GPIO_Digital_Output(&GPIOE_BASE, _GPIO_PINMASK_15);
MOVW	R1, #32768
MOVW	R0, #lo_addr(GPIOE_BASE+0)
MOVT	R0, #hi_addr(GPIOE_BASE+0)
BL	_GPIO_Digital_Output+0
L_fusion_v8_STM32F407ZG__gpioInit_5163:
;__fuv8_stm32f407zg_gpio.c,509 :: 		break;
IT	AL
BAL	L_fusion_v8_STM32F407ZG__gpioInit_5157
;__fuv8_stm32f407zg_gpio.c,510 :: 		case _MIKROBUS_CS_PIN:
L_fusion_v8_STM32F407ZG__gpioInit_5164:
;__fuv8_stm32f407zg_gpio.c,511 :: 		if (dir == _GPIO_INPUT)
; dir start address is: 4 (R1)
CMP	R1, #1
IT	NE
BNE	L_fusion_v8_STM32F407ZG__gpioInit_5165
; dir end address is: 4 (R1)
;__fuv8_stm32f407zg_gpio.c,512 :: 		GPIO_Digital_Input(&GPIOD_BASE, _GPIO_PINMASK_7);
MOVW	R1, #128
MOVW	R0, #lo_addr(GPIOD_BASE+0)
MOVT	R0, #hi_addr(GPIOD_BASE+0)
BL	_GPIO_Digital_Input+0
IT	AL
BAL	L_fusion_v8_STM32F407ZG__gpioInit_5166
L_fusion_v8_STM32F407ZG__gpioInit_5165:
;__fuv8_stm32f407zg_gpio.c,514 :: 		GPIO_Digital_Output(&GPIOD_BASE, _GPIO_PINMASK_7);
MOVW	R1, #128
MOVW	R0, #lo_addr(GPIOD_BASE+0)
MOVT	R0, #hi_addr(GPIOD_BASE+0)
BL	_GPIO_Digital_Output+0
L_fusion_v8_STM32F407ZG__gpioInit_5166:
;__fuv8_stm32f407zg_gpio.c,515 :: 		break;
IT	AL
BAL	L_fusion_v8_STM32F407ZG__gpioInit_5157
;__fuv8_stm32f407zg_gpio.c,516 :: 		case _MIKROBUS_SCK_PIN:
L_fusion_v8_STM32F407ZG__gpioInit_5167:
;__fuv8_stm32f407zg_gpio.c,517 :: 		if (dir == _GPIO_INPUT)
; dir start address is: 4 (R1)
CMP	R1, #1
IT	NE
BNE	L_fusion_v8_STM32F407ZG__gpioInit_5168
; dir end address is: 4 (R1)
;__fuv8_stm32f407zg_gpio.c,518 :: 		GPIO_Digital_Input(&GPIOC_BASE, _GPIO_PINMASK_10);
MOVW	R1, #1024
MOVW	R0, #lo_addr(GPIOC_BASE+0)
MOVT	R0, #hi_addr(GPIOC_BASE+0)
BL	_GPIO_Digital_Input+0
IT	AL
BAL	L_fusion_v8_STM32F407ZG__gpioInit_5169
L_fusion_v8_STM32F407ZG__gpioInit_5168:
;__fuv8_stm32f407zg_gpio.c,520 :: 		GPIO_Digital_Output(&GPIOC_BASE, _GPIO_PINMASK_10);
MOVW	R1, #1024
MOVW	R0, #lo_addr(GPIOC_BASE+0)
MOVT	R0, #hi_addr(GPIOC_BASE+0)
BL	_GPIO_Digital_Output+0
L_fusion_v8_STM32F407ZG__gpioInit_5169:
;__fuv8_stm32f407zg_gpio.c,521 :: 		break;
IT	AL
BAL	L_fusion_v8_STM32F407ZG__gpioInit_5157
;__fuv8_stm32f407zg_gpio.c,522 :: 		case _MIKROBUS_MISO_PIN:
L_fusion_v8_STM32F407ZG__gpioInit_5170:
;__fuv8_stm32f407zg_gpio.c,523 :: 		if (dir == _GPIO_INPUT)
; dir start address is: 4 (R1)
CMP	R1, #1
IT	NE
BNE	L_fusion_v8_STM32F407ZG__gpioInit_5171
; dir end address is: 4 (R1)
;__fuv8_stm32f407zg_gpio.c,524 :: 		GPIO_Digital_Input(&GPIOC_BASE, _GPIO_PINMASK_11);
MOVW	R1, #2048
MOVW	R0, #lo_addr(GPIOC_BASE+0)
MOVT	R0, #hi_addr(GPIOC_BASE+0)
BL	_GPIO_Digital_Input+0
IT	AL
BAL	L_fusion_v8_STM32F407ZG__gpioInit_5172
L_fusion_v8_STM32F407ZG__gpioInit_5171:
;__fuv8_stm32f407zg_gpio.c,526 :: 		GPIO_Digital_Output(&GPIOC_BASE, _GPIO_PINMASK_11);
MOVW	R1, #2048
MOVW	R0, #lo_addr(GPIOC_BASE+0)
MOVT	R0, #hi_addr(GPIOC_BASE+0)
BL	_GPIO_Digital_Output+0
L_fusion_v8_STM32F407ZG__gpioInit_5172:
;__fuv8_stm32f407zg_gpio.c,527 :: 		break;
IT	AL
BAL	L_fusion_v8_STM32F407ZG__gpioInit_5157
;__fuv8_stm32f407zg_gpio.c,528 :: 		case _MIKROBUS_MOSI_PIN:
L_fusion_v8_STM32F407ZG__gpioInit_5173:
;__fuv8_stm32f407zg_gpio.c,529 :: 		if (dir == _GPIO_INPUT)
; dir start address is: 4 (R1)
CMP	R1, #1
IT	NE
BNE	L_fusion_v8_STM32F407ZG__gpioInit_5174
; dir end address is: 4 (R1)
;__fuv8_stm32f407zg_gpio.c,530 :: 		GPIO_Digital_Input(&GPIOC_BASE, _GPIO_PINMASK_12);
MOVW	R1, #4096
MOVW	R0, #lo_addr(GPIOC_BASE+0)
MOVT	R0, #hi_addr(GPIOC_BASE+0)
BL	_GPIO_Digital_Input+0
IT	AL
BAL	L_fusion_v8_STM32F407ZG__gpioInit_5175
L_fusion_v8_STM32F407ZG__gpioInit_5174:
;__fuv8_stm32f407zg_gpio.c,532 :: 		GPIO_Digital_Output(&GPIOC_BASE, _GPIO_PINMASK_12);
MOVW	R1, #4096
MOVW	R0, #lo_addr(GPIOC_BASE+0)
MOVT	R0, #hi_addr(GPIOC_BASE+0)
BL	_GPIO_Digital_Output+0
L_fusion_v8_STM32F407ZG__gpioInit_5175:
;__fuv8_stm32f407zg_gpio.c,533 :: 		break;
IT	AL
BAL	L_fusion_v8_STM32F407ZG__gpioInit_5157
;__fuv8_stm32f407zg_gpio.c,534 :: 		case _MIKROBUS_PWM_PIN:
L_fusion_v8_STM32F407ZG__gpioInit_5176:
;__fuv8_stm32f407zg_gpio.c,535 :: 		if (dir == _GPIO_INPUT)
; dir start address is: 4 (R1)
CMP	R1, #1
IT	NE
BNE	L_fusion_v8_STM32F407ZG__gpioInit_5177
; dir end address is: 4 (R1)
;__fuv8_stm32f407zg_gpio.c,536 :: 		GPIO_Digital_Input(&GPIOB_BASE, _GPIO_PINMASK_0);
MOVW	R1, #1
MOVW	R0, #lo_addr(GPIOB_BASE+0)
MOVT	R0, #hi_addr(GPIOB_BASE+0)
BL	_GPIO_Digital_Input+0
IT	AL
BAL	L_fusion_v8_STM32F407ZG__gpioInit_5178
L_fusion_v8_STM32F407ZG__gpioInit_5177:
;__fuv8_stm32f407zg_gpio.c,538 :: 		GPIO_Digital_Output(&GPIOB_BASE, _GPIO_PINMASK_0);
MOVW	R1, #1
MOVW	R0, #lo_addr(GPIOB_BASE+0)
MOVT	R0, #hi_addr(GPIOB_BASE+0)
BL	_GPIO_Digital_Output+0
L_fusion_v8_STM32F407ZG__gpioInit_5178:
;__fuv8_stm32f407zg_gpio.c,539 :: 		break;
IT	AL
BAL	L_fusion_v8_STM32F407ZG__gpioInit_5157
;__fuv8_stm32f407zg_gpio.c,540 :: 		case _MIKROBUS_INT_PIN:
L_fusion_v8_STM32F407ZG__gpioInit_5179:
;__fuv8_stm32f407zg_gpio.c,541 :: 		if (dir == _GPIO_INPUT)
; dir start address is: 4 (R1)
CMP	R1, #1
IT	NE
BNE	L_fusion_v8_STM32F407ZG__gpioInit_5180
; dir end address is: 4 (R1)
;__fuv8_stm32f407zg_gpio.c,542 :: 		GPIO_Digital_Input(&GPIOE_BASE, _GPIO_PINMASK_10);
MOVW	R1, #1024
MOVW	R0, #lo_addr(GPIOE_BASE+0)
MOVT	R0, #hi_addr(GPIOE_BASE+0)
BL	_GPIO_Digital_Input+0
IT	AL
BAL	L_fusion_v8_STM32F407ZG__gpioInit_5181
L_fusion_v8_STM32F407ZG__gpioInit_5180:
;__fuv8_stm32f407zg_gpio.c,544 :: 		GPIO_Digital_Output(&GPIOE_BASE, _GPIO_PINMASK_10);
MOVW	R1, #1024
MOVW	R0, #lo_addr(GPIOE_BASE+0)
MOVT	R0, #hi_addr(GPIOE_BASE+0)
BL	_GPIO_Digital_Output+0
L_fusion_v8_STM32F407ZG__gpioInit_5181:
;__fuv8_stm32f407zg_gpio.c,545 :: 		break;
IT	AL
BAL	L_fusion_v8_STM32F407ZG__gpioInit_5157
;__fuv8_stm32f407zg_gpio.c,546 :: 		case _MIKROBUS_RX_PIN:
L_fusion_v8_STM32F407ZG__gpioInit_5182:
;__fuv8_stm32f407zg_gpio.c,547 :: 		if (dir == _GPIO_INPUT)
; dir start address is: 4 (R1)
CMP	R1, #1
IT	NE
BNE	L_fusion_v8_STM32F407ZG__gpioInit_5183
; dir end address is: 4 (R1)
;__fuv8_stm32f407zg_gpio.c,548 :: 		GPIO_Digital_Input(&GPIOC_BASE, _GPIO_PINMASK_7);
MOVW	R1, #128
MOVW	R0, #lo_addr(GPIOC_BASE+0)
MOVT	R0, #hi_addr(GPIOC_BASE+0)
BL	_GPIO_Digital_Input+0
IT	AL
BAL	L_fusion_v8_STM32F407ZG__gpioInit_5184
L_fusion_v8_STM32F407ZG__gpioInit_5183:
;__fuv8_stm32f407zg_gpio.c,550 :: 		GPIO_Digital_Output(&GPIOC_BASE, _GPIO_PINMASK_7);
MOVW	R1, #128
MOVW	R0, #lo_addr(GPIOC_BASE+0)
MOVT	R0, #hi_addr(GPIOC_BASE+0)
BL	_GPIO_Digital_Output+0
L_fusion_v8_STM32F407ZG__gpioInit_5184:
;__fuv8_stm32f407zg_gpio.c,551 :: 		break;
IT	AL
BAL	L_fusion_v8_STM32F407ZG__gpioInit_5157
;__fuv8_stm32f407zg_gpio.c,552 :: 		case _MIKROBUS_TX_PIN:
L_fusion_v8_STM32F407ZG__gpioInit_5185:
;__fuv8_stm32f407zg_gpio.c,553 :: 		if (dir == _GPIO_INPUT)
; dir start address is: 4 (R1)
CMP	R1, #1
IT	NE
BNE	L_fusion_v8_STM32F407ZG__gpioInit_5186
; dir end address is: 4 (R1)
;__fuv8_stm32f407zg_gpio.c,554 :: 		GPIO_Digital_Input(&GPIOC_BASE, _GPIO_PINMASK_6);
MOVW	R1, #64
MOVW	R0, #lo_addr(GPIOC_BASE+0)
MOVT	R0, #hi_addr(GPIOC_BASE+0)
BL	_GPIO_Digital_Input+0
IT	AL
BAL	L_fusion_v8_STM32F407ZG__gpioInit_5187
L_fusion_v8_STM32F407ZG__gpioInit_5186:
;__fuv8_stm32f407zg_gpio.c,556 :: 		GPIO_Digital_Output(&GPIOC_BASE, _GPIO_PINMASK_6);
MOVW	R1, #64
MOVW	R0, #lo_addr(GPIOC_BASE+0)
MOVT	R0, #hi_addr(GPIOC_BASE+0)
BL	_GPIO_Digital_Output+0
L_fusion_v8_STM32F407ZG__gpioInit_5187:
;__fuv8_stm32f407zg_gpio.c,557 :: 		break;
IT	AL
BAL	L_fusion_v8_STM32F407ZG__gpioInit_5157
;__fuv8_stm32f407zg_gpio.c,558 :: 		case _MIKROBUS_SCL_PIN:
L_fusion_v8_STM32F407ZG__gpioInit_5188:
;__fuv8_stm32f407zg_gpio.c,559 :: 		if (dir == _GPIO_INPUT)
; dir start address is: 4 (R1)
CMP	R1, #1
IT	NE
BNE	L_fusion_v8_STM32F407ZG__gpioInit_5189
; dir end address is: 4 (R1)
;__fuv8_stm32f407zg_gpio.c,560 :: 		GPIO_Digital_Input(&GPIOF_BASE, _GPIO_PINMASK_1);
MOVW	R1, #2
MOVW	R0, #lo_addr(GPIOF_BASE+0)
MOVT	R0, #hi_addr(GPIOF_BASE+0)
BL	_GPIO_Digital_Input+0
IT	AL
BAL	L_fusion_v8_STM32F407ZG__gpioInit_5190
L_fusion_v8_STM32F407ZG__gpioInit_5189:
;__fuv8_stm32f407zg_gpio.c,562 :: 		GPIO_Digital_Output(&GPIOF_BASE, _GPIO_PINMASK_1);
MOVW	R1, #2
MOVW	R0, #lo_addr(GPIOF_BASE+0)
MOVT	R0, #hi_addr(GPIOF_BASE+0)
BL	_GPIO_Digital_Output+0
L_fusion_v8_STM32F407ZG__gpioInit_5190:
;__fuv8_stm32f407zg_gpio.c,563 :: 		break;
IT	AL
BAL	L_fusion_v8_STM32F407ZG__gpioInit_5157
;__fuv8_stm32f407zg_gpio.c,564 :: 		case _MIKROBUS_SDA_PIN:
L_fusion_v8_STM32F407ZG__gpioInit_5191:
;__fuv8_stm32f407zg_gpio.c,565 :: 		if (dir == _GPIO_INPUT)
; dir start address is: 4 (R1)
CMP	R1, #1
IT	NE
BNE	L_fusion_v8_STM32F407ZG__gpioInit_5192
; dir end address is: 4 (R1)
;__fuv8_stm32f407zg_gpio.c,566 :: 		GPIO_Digital_Input(&GPIOF_BASE, _GPIO_PINMASK_0);
MOVW	R1, #1
MOVW	R0, #lo_addr(GPIOF_BASE+0)
MOVT	R0, #hi_addr(GPIOF_BASE+0)
BL	_GPIO_Digital_Input+0
IT	AL
BAL	L_fusion_v8_STM32F407ZG__gpioInit_5193
L_fusion_v8_STM32F407ZG__gpioInit_5192:
;__fuv8_stm32f407zg_gpio.c,568 :: 		GPIO_Digital_Output(&GPIOF_BASE, _GPIO_PINMASK_0);
MOVW	R1, #1
MOVW	R0, #lo_addr(GPIOF_BASE+0)
MOVT	R0, #hi_addr(GPIOF_BASE+0)
BL	_GPIO_Digital_Output+0
L_fusion_v8_STM32F407ZG__gpioInit_5193:
;__fuv8_stm32f407zg_gpio.c,569 :: 		break;
IT	AL
BAL	L_fusion_v8_STM32F407ZG__gpioInit_5157
;__fuv8_stm32f407zg_gpio.c,570 :: 		default:
L_fusion_v8_STM32F407ZG__gpioInit_5194:
;__fuv8_stm32f407zg_gpio.c,571 :: 		return _MIKROBUS_ERR_PIN;
MOVS	R0, #1
IT	AL
BAL	L_end__gpioInit_5
;__fuv8_stm32f407zg_gpio.c,572 :: 		}
L_fusion_v8_STM32F407ZG__gpioInit_5156:
; dir start address is: 4 (R1)
; pin start address is: 0 (R0)
CMP	R0, #0
IT	EQ
BEQ	L_fusion_v8_STM32F407ZG__gpioInit_5158
CMP	R0, #1
IT	EQ
BEQ	L_fusion_v8_STM32F407ZG__gpioInit_5161
CMP	R0, #2
IT	EQ
BEQ	L_fusion_v8_STM32F407ZG__gpioInit_5164
CMP	R0, #3
IT	EQ
BEQ	L_fusion_v8_STM32F407ZG__gpioInit_5167
CMP	R0, #4
IT	EQ
BEQ	L_fusion_v8_STM32F407ZG__gpioInit_5170
CMP	R0, #5
IT	EQ
BEQ	L_fusion_v8_STM32F407ZG__gpioInit_5173
CMP	R0, #6
IT	EQ
BEQ	L_fusion_v8_STM32F407ZG__gpioInit_5176
CMP	R0, #7
IT	EQ
BEQ	L_fusion_v8_STM32F407ZG__gpioInit_5179
CMP	R0, #8
IT	EQ
BEQ	L_fusion_v8_STM32F407ZG__gpioInit_5182
CMP	R0, #9
IT	EQ
BEQ	L_fusion_v8_STM32F407ZG__gpioInit_5185
CMP	R0, #10
IT	EQ
BEQ	L_fusion_v8_STM32F407ZG__gpioInit_5188
CMP	R0, #11
IT	EQ
BEQ	L_fusion_v8_STM32F407ZG__gpioInit_5191
; pin end address is: 0 (R0)
; dir end address is: 4 (R1)
IT	AL
BAL	L_fusion_v8_STM32F407ZG__gpioInit_5194
L_fusion_v8_STM32F407ZG__gpioInit_5157:
;__fuv8_stm32f407zg_gpio.c,573 :: 		return _MIKROBUS_OK;
MOVS	R0, __MIKROBUS_OK
;__fuv8_stm32f407zg_gpio.c,574 :: 		}
L_end__gpioInit_5:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of fusion_v8_STM32F407ZG__gpioInit_5
fusion_v8_STM32F407ZG__i2cInit_1:
;__fuv8_stm32f407zg_i2c.c,50 :: 		static T_mikrobus_ret _i2cInit_1(const uint32_t* cfg)
; cfg start address is: 0 (R0)
SUB	SP, SP, #4
STR	LR, [SP, #0]
; cfg end address is: 0 (R0)
; cfg start address is: 0 (R0)
;__fuv8_stm32f407zg_i2c.c,52 :: 		I2C1_Init_Advanced( cfg[0], &_GPIO_MODULE_I2C1_PB89);
LDR	R1, [R0, #0]
; cfg end address is: 0 (R0)
MOV	R0, R1
MOVW	R1, #lo_addr(__GPIO_MODULE_I2C1_PB89+0)
MOVT	R1, #hi_addr(__GPIO_MODULE_I2C1_PB89+0)
BL	_I2C1_Init_Advanced+0
;__fuv8_stm32f407zg_i2c.c,53 :: 		return _MIKROBUS_OK;
MOVS	R0, __MIKROBUS_OK
;__fuv8_stm32f407zg_i2c.c,54 :: 		}
L_end__i2cInit_1:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of fusion_v8_STM32F407ZG__i2cInit_1
fusion_v8_STM32F407ZG__i2cInit_2:
;__fuv8_stm32f407zg_i2c.c,56 :: 		static T_mikrobus_ret _i2cInit_2(const uint32_t* cfg)
; cfg start address is: 0 (R0)
SUB	SP, SP, #4
STR	LR, [SP, #0]
; cfg end address is: 0 (R0)
; cfg start address is: 0 (R0)
;__fuv8_stm32f407zg_i2c.c,58 :: 		I2C1_Init_Advanced( cfg[0], &_GPIO_MODULE_I2C1_PB89);
LDR	R1, [R0, #0]
; cfg end address is: 0 (R0)
MOV	R0, R1
MOVW	R1, #lo_addr(__GPIO_MODULE_I2C1_PB89+0)
MOVT	R1, #hi_addr(__GPIO_MODULE_I2C1_PB89+0)
BL	_I2C1_Init_Advanced+0
;__fuv8_stm32f407zg_i2c.c,59 :: 		return _MIKROBUS_OK;
MOVS	R0, __MIKROBUS_OK
;__fuv8_stm32f407zg_i2c.c,60 :: 		}
L_end__i2cInit_2:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of fusion_v8_STM32F407ZG__i2cInit_2
fusion_v8_STM32F407ZG__i2cInit_3:
;__fuv8_stm32f407zg_i2c.c,62 :: 		static T_mikrobus_ret _i2cInit_3(const uint32_t* cfg)
; cfg start address is: 0 (R0)
SUB	SP, SP, #4
STR	LR, [SP, #0]
; cfg end address is: 0 (R0)
; cfg start address is: 0 (R0)
;__fuv8_stm32f407zg_i2c.c,64 :: 		I2C1_Init_Advanced( cfg[0], &_GPIO_MODULE_I2C1_PB89);
LDR	R1, [R0, #0]
; cfg end address is: 0 (R0)
MOV	R0, R1
MOVW	R1, #lo_addr(__GPIO_MODULE_I2C1_PB89+0)
MOVT	R1, #hi_addr(__GPIO_MODULE_I2C1_PB89+0)
BL	_I2C1_Init_Advanced+0
;__fuv8_stm32f407zg_i2c.c,65 :: 		return _MIKROBUS_OK;
MOVS	R0, __MIKROBUS_OK
;__fuv8_stm32f407zg_i2c.c,66 :: 		}
L_end__i2cInit_3:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of fusion_v8_STM32F407ZG__i2cInit_3
fusion_v8_STM32F407ZG__i2cInit_4:
;__fuv8_stm32f407zg_i2c.c,68 :: 		static T_mikrobus_ret _i2cInit_4(const uint32_t* cfg)
; cfg start address is: 0 (R0)
SUB	SP, SP, #4
STR	LR, [SP, #0]
; cfg end address is: 0 (R0)
; cfg start address is: 0 (R0)
;__fuv8_stm32f407zg_i2c.c,70 :: 		I2C2_Init_Advanced( cfg[0], &_GPIO_MODULE_I2C2_PF01);
LDR	R1, [R0, #0]
; cfg end address is: 0 (R0)
MOV	R0, R1
MOVW	R1, #lo_addr(__GPIO_MODULE_I2C2_PF01+0)
MOVT	R1, #hi_addr(__GPIO_MODULE_I2C2_PF01+0)
BL	_I2C2_Init_Advanced+0
;__fuv8_stm32f407zg_i2c.c,71 :: 		return _MIKROBUS_OK;
MOVS	R0, __MIKROBUS_OK
;__fuv8_stm32f407zg_i2c.c,72 :: 		}
L_end__i2cInit_4:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of fusion_v8_STM32F407ZG__i2cInit_4
fusion_v8_STM32F407ZG__i2cInit_5:
;__fuv8_stm32f407zg_i2c.c,74 :: 		static T_mikrobus_ret _i2cInit_5(const uint32_t* cfg)
; cfg start address is: 0 (R0)
SUB	SP, SP, #4
STR	LR, [SP, #0]
; cfg end address is: 0 (R0)
; cfg start address is: 0 (R0)
;__fuv8_stm32f407zg_i2c.c,76 :: 		I2C2_Init_Advanced( cfg[0], &_GPIO_MODULE_I2C2_PF01);
LDR	R1, [R0, #0]
; cfg end address is: 0 (R0)
MOV	R0, R1
MOVW	R1, #lo_addr(__GPIO_MODULE_I2C2_PF01+0)
MOVT	R1, #hi_addr(__GPIO_MODULE_I2C2_PF01+0)
BL	_I2C2_Init_Advanced+0
;__fuv8_stm32f407zg_i2c.c,77 :: 		return _MIKROBUS_OK;
MOVS	R0, __MIKROBUS_OK
;__fuv8_stm32f407zg_i2c.c,78 :: 		}
L_end__i2cInit_5:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of fusion_v8_STM32F407ZG__i2cInit_5
fusion_v8_STM32F407ZG__uartInit_1:
;__fuv8_stm32f407zg_uart.c,51 :: 		static T_mikrobus_ret _uartInit_1(const uint32_t* cfg)
; cfg start address is: 0 (R0)
SUB	SP, SP, #4
STR	LR, [SP, #0]
; cfg end address is: 0 (R0)
; cfg start address is: 0 (R0)
;__fuv8_stm32f407zg_uart.c,53 :: 		UART1_Init_Advanced( (unsigned long) cfg[0], (unsigned int) cfg[1], (unsigned int) cfg[2], (unsigned int)cfg[3], &_GPIO_MODULE_USART1_PB67);
MOVW	R5, #lo_addr(__GPIO_MODULE_USART1_PB67+0)
MOVT	R5, #hi_addr(__GPIO_MODULE_USART1_PB67+0)
ADDW	R1, R0, #12
LDR	R4, [R1, #0]
ADDW	R1, R0, #8
LDR	R3, [R1, #0]
ADDS	R1, R0, #4
LDR	R2, [R1, #0]
LDR	R1, [R0, #0]
; cfg end address is: 0 (R0)
MOV	R0, R1
UXTH	R1, R2
UXTH	R2, R3
UXTH	R3, R4
PUSH	(R5)
BL	_UART1_Init_Advanced+0
ADD	SP, SP, #4
;__fuv8_stm32f407zg_uart.c,54 :: 		return _MIKROBUS_OK;
MOVS	R0, __MIKROBUS_OK
;__fuv8_stm32f407zg_uart.c,55 :: 		}
L_end__uartInit_1:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of fusion_v8_STM32F407ZG__uartInit_1
fusion_v8_STM32F407ZG__uartInit_2:
;__fuv8_stm32f407zg_uart.c,57 :: 		static T_mikrobus_ret _uartInit_2(const uint32_t* cfg)
; cfg start address is: 0 (R0)
SUB	SP, SP, #4
STR	LR, [SP, #0]
; cfg end address is: 0 (R0)
; cfg start address is: 0 (R0)
;__fuv8_stm32f407zg_uart.c,59 :: 		UART2_Init_Advanced( (unsigned long) cfg[0], (unsigned int) cfg[1], (unsigned int) cfg[2], (unsigned int)cfg[3], &_GPIO_MODULE_USART2_PD56);
MOVW	R5, #lo_addr(__GPIO_MODULE_USART2_PD56+0)
MOVT	R5, #hi_addr(__GPIO_MODULE_USART2_PD56+0)
ADDW	R1, R0, #12
LDR	R4, [R1, #0]
ADDW	R1, R0, #8
LDR	R3, [R1, #0]
ADDS	R1, R0, #4
LDR	R2, [R1, #0]
LDR	R1, [R0, #0]
; cfg end address is: 0 (R0)
MOV	R0, R1
UXTH	R1, R2
UXTH	R2, R3
UXTH	R3, R4
PUSH	(R5)
BL	_UART2_Init_Advanced+0
ADD	SP, SP, #4
;__fuv8_stm32f407zg_uart.c,60 :: 		return _MIKROBUS_OK;
MOVS	R0, __MIKROBUS_OK
;__fuv8_stm32f407zg_uart.c,61 :: 		}
L_end__uartInit_2:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of fusion_v8_STM32F407ZG__uartInit_2
fusion_v8_STM32F407ZG__uartInit_3:
;__fuv8_stm32f407zg_uart.c,63 :: 		static T_mikrobus_ret _uartInit_3(const uint32_t* cfg)
; cfg start address is: 0 (R0)
SUB	SP, SP, #4
STR	LR, [SP, #0]
; cfg end address is: 0 (R0)
; cfg start address is: 0 (R0)
;__fuv8_stm32f407zg_uart.c,65 :: 		UART3_Init_Advanced( (unsigned long) cfg[0], (unsigned int) cfg[1], (unsigned int) cfg[2], (unsigned int)cfg[3], &_GPIO_MODULE_USART3_PD89);
MOVW	R5, #lo_addr(__GPIO_MODULE_USART3_PD89+0)
MOVT	R5, #hi_addr(__GPIO_MODULE_USART3_PD89+0)
ADDW	R1, R0, #12
LDR	R4, [R1, #0]
ADDW	R1, R0, #8
LDR	R3, [R1, #0]
ADDS	R1, R0, #4
LDR	R2, [R1, #0]
LDR	R1, [R0, #0]
; cfg end address is: 0 (R0)
MOV	R0, R1
UXTH	R1, R2
UXTH	R2, R3
UXTH	R3, R4
PUSH	(R5)
BL	_UART3_Init_Advanced+0
ADD	SP, SP, #4
;__fuv8_stm32f407zg_uart.c,66 :: 		return _MIKROBUS_OK;
MOVS	R0, __MIKROBUS_OK
;__fuv8_stm32f407zg_uart.c,67 :: 		}
L_end__uartInit_3:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of fusion_v8_STM32F407ZG__uartInit_3
fusion_v8_STM32F407ZG__uartInit_4:
;__fuv8_stm32f407zg_uart.c,69 :: 		static T_mikrobus_ret _uartInit_4(const uint32_t* cfg)
; cfg start address is: 0 (R0)
SUB	SP, SP, #4
STR	LR, [SP, #0]
; cfg end address is: 0 (R0)
; cfg start address is: 0 (R0)
;__fuv8_stm32f407zg_uart.c,71 :: 		UART6_Init_Advanced( (unsigned long) cfg[0], (unsigned int) cfg[1], (unsigned int) cfg[2], (unsigned int)cfg[3], &_GPIO_MODULE_USART6_PC67);
MOVW	R5, #lo_addr(__GPIO_MODULE_USART6_PC67+0)
MOVT	R5, #hi_addr(__GPIO_MODULE_USART6_PC67+0)
ADDW	R1, R0, #12
LDR	R4, [R1, #0]
ADDW	R1, R0, #8
LDR	R3, [R1, #0]
ADDS	R1, R0, #4
LDR	R2, [R1, #0]
LDR	R1, [R0, #0]
; cfg end address is: 0 (R0)
MOV	R0, R1
UXTH	R1, R2
UXTH	R2, R3
UXTH	R3, R4
PUSH	(R5)
BL	_UART6_Init_Advanced+0
ADD	SP, SP, #4
;__fuv8_stm32f407zg_uart.c,72 :: 		return _MIKROBUS_OK;
MOVS	R0, __MIKROBUS_OK
;__fuv8_stm32f407zg_uart.c,73 :: 		}
L_end__uartInit_4:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of fusion_v8_STM32F407ZG__uartInit_4
fusion_v8_STM32F407ZG__uartInit_5:
;__fuv8_stm32f407zg_uart.c,75 :: 		static T_mikrobus_ret _uartInit_5(const uint32_t* cfg)
; cfg start address is: 0 (R0)
SUB	SP, SP, #4
STR	LR, [SP, #0]
; cfg end address is: 0 (R0)
; cfg start address is: 0 (R0)
;__fuv8_stm32f407zg_uart.c,77 :: 		UART6_Init_Advanced( (unsigned long) cfg[0], (unsigned int) cfg[1], (unsigned int) cfg[2], (unsigned int)cfg[3], &_GPIO_MODULE_USART6_PC67);
MOVW	R5, #lo_addr(__GPIO_MODULE_USART6_PC67+0)
MOVT	R5, #hi_addr(__GPIO_MODULE_USART6_PC67+0)
ADDW	R1, R0, #12
LDR	R4, [R1, #0]
ADDW	R1, R0, #8
LDR	R3, [R1, #0]
ADDS	R1, R0, #4
LDR	R2, [R1, #0]
LDR	R1, [R0, #0]
; cfg end address is: 0 (R0)
MOV	R0, R1
UXTH	R1, R2
UXTH	R2, R3
UXTH	R3, R4
PUSH	(R5)
BL	_UART6_Init_Advanced+0
ADD	SP, SP, #4
;__fuv8_stm32f407zg_uart.c,78 :: 		return _MIKROBUS_OK;
MOVS	R0, __MIKROBUS_OK
;__fuv8_stm32f407zg_uart.c,79 :: 		}
L_end__uartInit_5:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of fusion_v8_STM32F407ZG__uartInit_5
fusion_v8_STM32F407ZG__log_write:
;__fuv8_stm32f407zg_log.c,17 :: 		static T_mikrobus_ret _log_write(uint8_t *data_)
; data_ start address is: 0 (R0)
SUB	SP, SP, #4
STR	LR, [SP, #0]
; data_ end address is: 0 (R0)
; data_ start address is: 0 (R0)
;__fuv8_stm32f407zg_log.c,19 :: 		logger( *data_ );
LDRB	R1, [R0, #0]
; data_ end address is: 0 (R0)
UXTB	R4, R1
UXTH	R0, R4
MOVW	R4, #lo_addr(_logger+0)
MOVT	R4, #hi_addr(_logger+0)
LDR	R4, [R4, #0]
BLX	R4
;__fuv8_stm32f407zg_log.c,20 :: 		return 0;
MOVS	R0, #0
;__fuv8_stm32f407zg_log.c,21 :: 		}
L_end__log_write:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of fusion_v8_STM32F407ZG__log_write
fusion_v8_STM32F407ZG__log_init1:
;__fuv8_stm32f407zg_log.c,23 :: 		static T_mikrobus_ret _log_init1(uint32_t baud)
; baud start address is: 0 (R0)
SUB	SP, SP, #4
STR	LR, [SP, #0]
; baud end address is: 0 (R0)
; baud start address is: 0 (R0)
;__fuv8_stm32f407zg_log.c,25 :: 		UART1_Init_Advanced(baud, _UART_8_BIT_DATA, _UART_NOPARITY, _UART_ONE_STOPBIT, &_GPIO_MODULE_USART1_PB67);
MOVW	R1, #lo_addr(__GPIO_MODULE_USART1_PB67+0)
MOVT	R1, #hi_addr(__GPIO_MODULE_USART1_PB67+0)
PUSH	(R1)
MOVW	R3, #0
MOVW	R2, #0
MOVW	R1, #0
; baud end address is: 0 (R0)
BL	_UART1_Init_Advanced+0
ADD	SP, SP, #4
;__fuv8_stm32f407zg_log.c,26 :: 		logger = UART1_Write;
MOVW	R2, #lo_addr(_UART1_Write+0)
MOVT	R2, #hi_addr(_UART1_Write+0)
MOVW	R1, #lo_addr(_logger+0)
MOVT	R1, #hi_addr(_logger+0)
STR	R2, [R1, #0]
;__fuv8_stm32f407zg_log.c,27 :: 		return 0;
MOVS	R0, #0
;__fuv8_stm32f407zg_log.c,28 :: 		}
L_end__log_init1:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of fusion_v8_STM32F407ZG__log_init1
fusion_v8_STM32F407ZG__log_init2:
;__fuv8_stm32f407zg_log.c,30 :: 		static T_mikrobus_ret _log_init2(uint32_t baud)
; baud start address is: 0 (R0)
SUB	SP, SP, #4
STR	LR, [SP, #0]
; baud end address is: 0 (R0)
; baud start address is: 0 (R0)
;__fuv8_stm32f407zg_log.c,32 :: 		UART2_Init_Advanced(baud, _UART_8_BIT_DATA, _UART_NOPARITY, _UART_ONE_STOPBIT, &_GPIO_MODULE_USART2_PD56);
MOVW	R1, #lo_addr(__GPIO_MODULE_USART2_PD56+0)
MOVT	R1, #hi_addr(__GPIO_MODULE_USART2_PD56+0)
PUSH	(R1)
MOVW	R3, #0
MOVW	R2, #0
MOVW	R1, #0
; baud end address is: 0 (R0)
BL	_UART2_Init_Advanced+0
ADD	SP, SP, #4
;__fuv8_stm32f407zg_log.c,33 :: 		logger = UART2_Write;
MOVW	R2, #lo_addr(_UART2_Write+0)
MOVT	R2, #hi_addr(_UART2_Write+0)
MOVW	R1, #lo_addr(_logger+0)
MOVT	R1, #hi_addr(_logger+0)
STR	R2, [R1, #0]
;__fuv8_stm32f407zg_log.c,34 :: 		return 0;
MOVS	R0, #0
;__fuv8_stm32f407zg_log.c,35 :: 		}
L_end__log_init2:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of fusion_v8_STM32F407ZG__log_init2
fusion_v8_STM32F407ZG__log_init3:
;__fuv8_stm32f407zg_log.c,37 :: 		static T_mikrobus_ret _log_init3(uint32_t baud)
; baud start address is: 0 (R0)
SUB	SP, SP, #4
STR	LR, [SP, #0]
; baud end address is: 0 (R0)
; baud start address is: 0 (R0)
;__fuv8_stm32f407zg_log.c,39 :: 		UART3_Init_Advanced(baud, _UART_8_BIT_DATA, _UART_NOPARITY, _UART_ONE_STOPBIT, &_GPIO_MODULE_USART3_PD89);
MOVW	R1, #lo_addr(__GPIO_MODULE_USART3_PD89+0)
MOVT	R1, #hi_addr(__GPIO_MODULE_USART3_PD89+0)
PUSH	(R1)
MOVW	R3, #0
MOVW	R2, #0
MOVW	R1, #0
; baud end address is: 0 (R0)
BL	_UART3_Init_Advanced+0
ADD	SP, SP, #4
;__fuv8_stm32f407zg_log.c,40 :: 		logger = UART3_Write;
MOVW	R2, #lo_addr(_UART3_Write+0)
MOVT	R2, #hi_addr(_UART3_Write+0)
MOVW	R1, #lo_addr(_logger+0)
MOVT	R1, #hi_addr(_logger+0)
STR	R2, [R1, #0]
;__fuv8_stm32f407zg_log.c,41 :: 		return 0;
MOVS	R0, #0
;__fuv8_stm32f407zg_log.c,42 :: 		}
L_end__log_init3:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of fusion_v8_STM32F407ZG__log_init3
fusion_v8_STM32F407ZG__log_init4:
;__fuv8_stm32f407zg_log.c,44 :: 		static T_mikrobus_ret _log_init4(uint32_t baud)
; baud start address is: 0 (R0)
SUB	SP, SP, #4
STR	LR, [SP, #0]
; baud end address is: 0 (R0)
; baud start address is: 0 (R0)
;__fuv8_stm32f407zg_log.c,46 :: 		UART6_Init_Advanced(baud, _UART_8_BIT_DATA, _UART_NOPARITY, _UART_ONE_STOPBIT, &_GPIO_MODULE_USART6_PC67);
MOVW	R1, #lo_addr(__GPIO_MODULE_USART6_PC67+0)
MOVT	R1, #hi_addr(__GPIO_MODULE_USART6_PC67+0)
PUSH	(R1)
MOVW	R3, #0
MOVW	R2, #0
MOVW	R1, #0
; baud end address is: 0 (R0)
BL	_UART6_Init_Advanced+0
ADD	SP, SP, #4
;__fuv8_stm32f407zg_log.c,47 :: 		logger = UART6_Write;
MOVW	R2, #lo_addr(_UART6_Write+0)
MOVT	R2, #hi_addr(_UART6_Write+0)
MOVW	R1, #lo_addr(_logger+0)
MOVT	R1, #hi_addr(_logger+0)
STR	R2, [R1, #0]
;__fuv8_stm32f407zg_log.c,48 :: 		return 0;
MOVS	R0, #0
;__fuv8_stm32f407zg_log.c,49 :: 		}
L_end__log_init4:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of fusion_v8_STM32F407ZG__log_init4
fusion_v8_STM32F407ZG__log_init5:
;__fuv8_stm32f407zg_log.c,51 :: 		static T_mikrobus_ret _log_init5(uint32_t baud)
; baud start address is: 0 (R0)
SUB	SP, SP, #4
STR	LR, [SP, #0]
; baud end address is: 0 (R0)
; baud start address is: 0 (R0)
;__fuv8_stm32f407zg_log.c,53 :: 		UART6_Init_Advanced(baud, _UART_8_BIT_DATA, _UART_NOPARITY, _UART_ONE_STOPBIT, &_GPIO_MODULE_USART6_PC67);
MOVW	R1, #lo_addr(__GPIO_MODULE_USART6_PC67+0)
MOVT	R1, #hi_addr(__GPIO_MODULE_USART6_PC67+0)
PUSH	(R1)
MOVW	R3, #0
MOVW	R2, #0
MOVW	R1, #0
; baud end address is: 0 (R0)
BL	_UART6_Init_Advanced+0
ADD	SP, SP, #4
;__fuv8_stm32f407zg_log.c,54 :: 		logger = UART6_Write;
MOVW	R2, #lo_addr(_UART6_Write+0)
MOVT	R2, #hi_addr(_UART6_Write+0)
MOVW	R1, #lo_addr(_logger+0)
MOVT	R1, #hi_addr(_logger+0)
STR	R2, [R1, #0]
;__fuv8_stm32f407zg_log.c,55 :: 		return 0;
MOVS	R0, #0
;__fuv8_stm32f407zg_log.c,56 :: 		}
L_end__log_init5:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of fusion_v8_STM32F407ZG__log_init5
fusion_v8_STM32F407ZG__log_initUart:
;__fuv8_stm32f407zg_log.c,58 :: 		static T_mikrobus_ret _log_initUart(uint32_t baud)
; baud start address is: 0 (R0)
SUB	SP, SP, #4
STR	LR, [SP, #0]
; baud end address is: 0 (R0)
; baud start address is: 0 (R0)
;__fuv8_stm32f407zg_log.c,60 :: 		UART6_Init_Advanced(baud, _UART_8_BIT_DATA, _UART_NOPARITY, _UART_ONE_STOPBIT, &_GPIO_MODULE_USART6_PC67);
MOVW	R1, #lo_addr(__GPIO_MODULE_USART6_PC67+0)
MOVT	R1, #hi_addr(__GPIO_MODULE_USART6_PC67+0)
PUSH	(R1)
MOVW	R3, #0
MOVW	R2, #0
MOVW	R1, #0
; baud end address is: 0 (R0)
BL	_UART6_Init_Advanced+0
ADD	SP, SP, #4
;__fuv8_stm32f407zg_log.c,61 :: 		logger = UART6_Write;
MOVW	R2, #lo_addr(_UART6_Write+0)
MOVT	R2, #hi_addr(_UART6_Write+0)
MOVW	R1, #lo_addr(_logger+0)
MOVT	R1, #hi_addr(_logger+0)
STR	R2, [R1, #0]
;__fuv8_stm32f407zg_log.c,62 :: 		return 0;
MOVS	R0, #0
;__fuv8_stm32f407zg_log.c,63 :: 		}
L_end__log_initUart:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of fusion_v8_STM32F407ZG__log_initUart
_mikrobus_gpioInit:
;fusion_v8_STM32F407ZG.c,162 :: 		T_mikrobus_ret mikrobus_gpioInit(T_mikrobus_soc bus, T_mikrobus_pin pin, T_gpio_dir direction)
; direction start address is: 8 (R2)
; pin start address is: 4 (R1)
; bus start address is: 0 (R0)
SUB	SP, SP, #4
STR	LR, [SP, #0]
UXTB	R11, R1
UXTB	R12, R2
; direction end address is: 8 (R2)
; pin end address is: 4 (R1)
; bus end address is: 0 (R0)
; bus start address is: 0 (R0)
; pin start address is: 44 (R11)
; direction start address is: 48 (R12)
;fusion_v8_STM32F407ZG.c,164 :: 		switch( bus )
IT	AL
BAL	L_mikrobus_gpioInit195
; bus end address is: 0 (R0)
;fusion_v8_STM32F407ZG.c,167 :: 		case _MIKROBUS1 : return _gpioInit_1(pin, direction);
L_mikrobus_gpioInit197:
UXTB	R1, R12
; direction end address is: 48 (R12)
UXTB	R0, R11
; pin end address is: 44 (R11)
BL	fusion_v8_STM32F407ZG__gpioInit_1+0
IT	AL
BAL	L_end_mikrobus_gpioInit
;fusion_v8_STM32F407ZG.c,170 :: 		case _MIKROBUS2 : return _gpioInit_2(pin, direction);
L_mikrobus_gpioInit198:
; direction start address is: 48 (R12)
; pin start address is: 44 (R11)
UXTB	R1, R12
; direction end address is: 48 (R12)
UXTB	R0, R11
; pin end address is: 44 (R11)
BL	fusion_v8_STM32F407ZG__gpioInit_2+0
IT	AL
BAL	L_end_mikrobus_gpioInit
;fusion_v8_STM32F407ZG.c,173 :: 		case _MIKROBUS3 : return _gpioInit_3(pin, direction);
L_mikrobus_gpioInit199:
; direction start address is: 48 (R12)
; pin start address is: 44 (R11)
UXTB	R1, R12
; direction end address is: 48 (R12)
UXTB	R0, R11
; pin end address is: 44 (R11)
BL	fusion_v8_STM32F407ZG__gpioInit_3+0
IT	AL
BAL	L_end_mikrobus_gpioInit
;fusion_v8_STM32F407ZG.c,176 :: 		case _MIKROBUS4 : return _gpioInit_4(pin, direction);
L_mikrobus_gpioInit200:
; direction start address is: 48 (R12)
; pin start address is: 44 (R11)
UXTB	R1, R12
; direction end address is: 48 (R12)
UXTB	R0, R11
; pin end address is: 44 (R11)
BL	fusion_v8_STM32F407ZG__gpioInit_4+0
IT	AL
BAL	L_end_mikrobus_gpioInit
;fusion_v8_STM32F407ZG.c,179 :: 		case _MIKROBUS5 : return _gpioInit_5(pin, direction);
L_mikrobus_gpioInit201:
; direction start address is: 48 (R12)
; pin start address is: 44 (R11)
UXTB	R1, R12
; direction end address is: 48 (R12)
UXTB	R0, R11
; pin end address is: 44 (R11)
BL	fusion_v8_STM32F407ZG__gpioInit_5+0
IT	AL
BAL	L_end_mikrobus_gpioInit
;fusion_v8_STM32F407ZG.c,184 :: 		default : return _MIKROBUS_ERR_BUS;
L_mikrobus_gpioInit202:
MOVS	R0, #1
IT	AL
BAL	L_end_mikrobus_gpioInit
;fusion_v8_STM32F407ZG.c,185 :: 		}
L_mikrobus_gpioInit195:
; direction start address is: 48 (R12)
; pin start address is: 44 (R11)
; bus start address is: 0 (R0)
CMP	R0, #0
IT	EQ
BEQ	L_mikrobus_gpioInit197
CMP	R0, #1
IT	EQ
BEQ	L_mikrobus_gpioInit198
CMP	R0, #2
IT	EQ
BEQ	L_mikrobus_gpioInit199
CMP	R0, #3
IT	EQ
BEQ	L_mikrobus_gpioInit200
CMP	R0, #4
IT	EQ
BEQ	L_mikrobus_gpioInit201
; bus end address is: 0 (R0)
; pin end address is: 44 (R11)
; direction end address is: 48 (R12)
IT	AL
BAL	L_mikrobus_gpioInit202
;fusion_v8_STM32F407ZG.c,187 :: 		}
L_end_mikrobus_gpioInit:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _mikrobus_gpioInit
_mikrobus_i2cInit:
;fusion_v8_STM32F407ZG.c,222 :: 		T_mikrobus_ret mikrobus_i2cInit(T_mikrobus_soc bus, const uint32_t *cfg)
; cfg start address is: 4 (R1)
; bus start address is: 0 (R0)
SUB	SP, SP, #4
STR	LR, [SP, #0]
; cfg end address is: 4 (R1)
; bus end address is: 0 (R0)
; bus start address is: 0 (R0)
; cfg start address is: 4 (R1)
;fusion_v8_STM32F407ZG.c,224 :: 		switch( bus )
IT	AL
BAL	L_mikrobus_i2cInit203
; bus end address is: 0 (R0)
;fusion_v8_STM32F407ZG.c,227 :: 		case _MIKROBUS1 : return _i2cInit_1( cfg );
L_mikrobus_i2cInit205:
MOV	R0, R1
; cfg end address is: 4 (R1)
BL	fusion_v8_STM32F407ZG__i2cInit_1+0
IT	AL
BAL	L_end_mikrobus_i2cInit
;fusion_v8_STM32F407ZG.c,230 :: 		case _MIKROBUS2 : return _i2cInit_2( cfg );
L_mikrobus_i2cInit206:
; cfg start address is: 4 (R1)
MOV	R0, R1
; cfg end address is: 4 (R1)
BL	fusion_v8_STM32F407ZG__i2cInit_2+0
IT	AL
BAL	L_end_mikrobus_i2cInit
;fusion_v8_STM32F407ZG.c,233 :: 		case _MIKROBUS3 : return _i2cInit_3( cfg );
L_mikrobus_i2cInit207:
; cfg start address is: 4 (R1)
MOV	R0, R1
; cfg end address is: 4 (R1)
BL	fusion_v8_STM32F407ZG__i2cInit_3+0
IT	AL
BAL	L_end_mikrobus_i2cInit
;fusion_v8_STM32F407ZG.c,236 :: 		case _MIKROBUS4 : return _i2cInit_4( cfg );
L_mikrobus_i2cInit208:
; cfg start address is: 4 (R1)
MOV	R0, R1
; cfg end address is: 4 (R1)
BL	fusion_v8_STM32F407ZG__i2cInit_4+0
IT	AL
BAL	L_end_mikrobus_i2cInit
;fusion_v8_STM32F407ZG.c,239 :: 		case _MIKROBUS5 : return _i2cInit_5( cfg );
L_mikrobus_i2cInit209:
; cfg start address is: 4 (R1)
MOV	R0, R1
; cfg end address is: 4 (R1)
BL	fusion_v8_STM32F407ZG__i2cInit_5+0
IT	AL
BAL	L_end_mikrobus_i2cInit
;fusion_v8_STM32F407ZG.c,244 :: 		default : return _MIKROBUS_ERR_BUS;
L_mikrobus_i2cInit210:
MOVS	R0, #1
IT	AL
BAL	L_end_mikrobus_i2cInit
;fusion_v8_STM32F407ZG.c,245 :: 		}
L_mikrobus_i2cInit203:
; cfg start address is: 4 (R1)
; bus start address is: 0 (R0)
CMP	R0, #0
IT	EQ
BEQ	L_mikrobus_i2cInit205
CMP	R0, #1
IT	EQ
BEQ	L_mikrobus_i2cInit206
CMP	R0, #2
IT	EQ
BEQ	L_mikrobus_i2cInit207
CMP	R0, #3
IT	EQ
BEQ	L_mikrobus_i2cInit208
CMP	R0, #4
IT	EQ
BEQ	L_mikrobus_i2cInit209
; bus end address is: 0 (R0)
; cfg end address is: 4 (R1)
IT	AL
BAL	L_mikrobus_i2cInit210
;fusion_v8_STM32F407ZG.c,248 :: 		}
L_end_mikrobus_i2cInit:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _mikrobus_i2cInit
_mikrobus_uartInit:
;fusion_v8_STM32F407ZG.c,253 :: 		T_mikrobus_ret mikrobus_uartInit(T_mikrobus_soc bus, const uint32_t *cfg)
; cfg start address is: 4 (R1)
; bus start address is: 0 (R0)
SUB	SP, SP, #4
STR	LR, [SP, #0]
; cfg end address is: 4 (R1)
; bus end address is: 0 (R0)
; bus start address is: 0 (R0)
; cfg start address is: 4 (R1)
;fusion_v8_STM32F407ZG.c,255 :: 		switch( bus )
IT	AL
BAL	L_mikrobus_uartInit211
; bus end address is: 0 (R0)
;fusion_v8_STM32F407ZG.c,258 :: 		case _MIKROBUS1 : return _uartInit_1( cfg );
L_mikrobus_uartInit213:
MOV	R0, R1
; cfg end address is: 4 (R1)
BL	fusion_v8_STM32F407ZG__uartInit_1+0
IT	AL
BAL	L_end_mikrobus_uartInit
;fusion_v8_STM32F407ZG.c,261 :: 		case _MIKROBUS2 : return _uartInit_2( cfg );
L_mikrobus_uartInit214:
; cfg start address is: 4 (R1)
MOV	R0, R1
; cfg end address is: 4 (R1)
BL	fusion_v8_STM32F407ZG__uartInit_2+0
IT	AL
BAL	L_end_mikrobus_uartInit
;fusion_v8_STM32F407ZG.c,264 :: 		case _MIKROBUS3 : return _uartInit_3( cfg );
L_mikrobus_uartInit215:
; cfg start address is: 4 (R1)
MOV	R0, R1
; cfg end address is: 4 (R1)
BL	fusion_v8_STM32F407ZG__uartInit_3+0
IT	AL
BAL	L_end_mikrobus_uartInit
;fusion_v8_STM32F407ZG.c,267 :: 		case _MIKROBUS4 : return _uartInit_4( cfg );
L_mikrobus_uartInit216:
; cfg start address is: 4 (R1)
MOV	R0, R1
; cfg end address is: 4 (R1)
BL	fusion_v8_STM32F407ZG__uartInit_4+0
IT	AL
BAL	L_end_mikrobus_uartInit
;fusion_v8_STM32F407ZG.c,270 :: 		case _MIKROBUS5 : return _uartInit_5( cfg );
L_mikrobus_uartInit217:
; cfg start address is: 4 (R1)
MOV	R0, R1
; cfg end address is: 4 (R1)
BL	fusion_v8_STM32F407ZG__uartInit_5+0
IT	AL
BAL	L_end_mikrobus_uartInit
;fusion_v8_STM32F407ZG.c,275 :: 		default : return _MIKROBUS_ERR_BUS;
L_mikrobus_uartInit218:
MOVS	R0, #1
IT	AL
BAL	L_end_mikrobus_uartInit
;fusion_v8_STM32F407ZG.c,276 :: 		}
L_mikrobus_uartInit211:
; cfg start address is: 4 (R1)
; bus start address is: 0 (R0)
CMP	R0, #0
IT	EQ
BEQ	L_mikrobus_uartInit213
CMP	R0, #1
IT	EQ
BEQ	L_mikrobus_uartInit214
CMP	R0, #2
IT	EQ
BEQ	L_mikrobus_uartInit215
CMP	R0, #3
IT	EQ
BEQ	L_mikrobus_uartInit216
CMP	R0, #4
IT	EQ
BEQ	L_mikrobus_uartInit217
; bus end address is: 0 (R0)
; cfg end address is: 4 (R1)
IT	AL
BAL	L_mikrobus_uartInit218
;fusion_v8_STM32F407ZG.c,278 :: 		}
L_end_mikrobus_uartInit:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _mikrobus_uartInit
_mikrobus_logInit:
;fusion_v8_STM32F407ZG.c,283 :: 		T_mikrobus_ret mikrobus_logInit(T_log_bus port, const uint32_t baud)
; baud start address is: 4 (R1)
; port start address is: 0 (R0)
SUB	SP, SP, #4
STR	LR, [SP, #0]
; baud end address is: 4 (R1)
; port end address is: 0 (R0)
; port start address is: 0 (R0)
; baud start address is: 4 (R1)
;fusion_v8_STM32F407ZG.c,285 :: 		switch( port )
IT	AL
BAL	L_mikrobus_logInit219
; port end address is: 0 (R0)
;fusion_v8_STM32F407ZG.c,288 :: 		case _MIKROBUS1 : return _log_init1( baud );
L_mikrobus_logInit221:
MOV	R0, R1
; baud end address is: 4 (R1)
BL	fusion_v8_STM32F407ZG__log_init1+0
IT	AL
BAL	L_end_mikrobus_logInit
;fusion_v8_STM32F407ZG.c,291 :: 		case _MIKROBUS2: return _log_init2( baud );
L_mikrobus_logInit222:
; baud start address is: 4 (R1)
MOV	R0, R1
; baud end address is: 4 (R1)
BL	fusion_v8_STM32F407ZG__log_init2+0
IT	AL
BAL	L_end_mikrobus_logInit
;fusion_v8_STM32F407ZG.c,294 :: 		case _MIKROBUS3: return _log_init3( baud );
L_mikrobus_logInit223:
; baud start address is: 4 (R1)
MOV	R0, R1
; baud end address is: 4 (R1)
BL	fusion_v8_STM32F407ZG__log_init3+0
IT	AL
BAL	L_end_mikrobus_logInit
;fusion_v8_STM32F407ZG.c,297 :: 		case _MIKROBUS4: return _log_init4( baud );
L_mikrobus_logInit224:
; baud start address is: 4 (R1)
MOV	R0, R1
; baud end address is: 4 (R1)
BL	fusion_v8_STM32F407ZG__log_init4+0
IT	AL
BAL	L_end_mikrobus_logInit
;fusion_v8_STM32F407ZG.c,300 :: 		case _MIKROBUS5: return _log_init5( baud );
L_mikrobus_logInit225:
; baud start address is: 4 (R1)
MOV	R0, R1
; baud end address is: 4 (R1)
BL	fusion_v8_STM32F407ZG__log_init5+0
IT	AL
BAL	L_end_mikrobus_logInit
;fusion_v8_STM32F407ZG.c,306 :: 		case _LOG_USBUART : return _log_initUart( baud );
L_mikrobus_logInit226:
; baud start address is: 4 (R1)
MOV	R0, R1
; baud end address is: 4 (R1)
BL	fusion_v8_STM32F407ZG__log_initUart+0
IT	AL
BAL	L_end_mikrobus_logInit
;fusion_v8_STM32F407ZG.c,314 :: 		default : return _MIKROBUS_ERR_BUS;
L_mikrobus_logInit227:
MOVS	R0, #1
IT	AL
BAL	L_end_mikrobus_logInit
;fusion_v8_STM32F407ZG.c,315 :: 		}
L_mikrobus_logInit219:
; baud start address is: 4 (R1)
; port start address is: 0 (R0)
CMP	R0, #0
IT	EQ
BEQ	L_mikrobus_logInit221
CMP	R0, #1
IT	EQ
BEQ	L_mikrobus_logInit222
CMP	R0, #2
IT	EQ
BEQ	L_mikrobus_logInit223
CMP	R0, #3
IT	EQ
BEQ	L_mikrobus_logInit224
CMP	R0, #4
IT	EQ
BEQ	L_mikrobus_logInit225
CMP	R0, #16
IT	EQ
BEQ	L_mikrobus_logInit226
; port end address is: 0 (R0)
; baud end address is: 4 (R1)
IT	AL
BAL	L_mikrobus_logInit227
;fusion_v8_STM32F407ZG.c,317 :: 		}
L_end_mikrobus_logInit:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _mikrobus_logInit
_mikrobus_logWrite:
;fusion_v8_STM32F407ZG.c,319 :: 		T_mikrobus_ret mikrobus_logWrite(uint8_t* data_, T_log_format format)
; format start address is: 4 (R1)
; data_ start address is: 0 (R0)
SUB	SP, SP, #12
STR	LR, [SP, #0]
MOV	R2, R0
; format end address is: 4 (R1)
; data_ end address is: 0 (R0)
; data_ start address is: 8 (R2)
; format start address is: 4 (R1)
;fusion_v8_STM32F407ZG.c,321 :: 		uint8_t *ptr = data_;
; ptr start address is: 0 (R0)
MOV	R0, R2
; data_ end address is: 8 (R2)
;fusion_v8_STM32F407ZG.c,322 :: 		uint8_t row = 13;
MOVS	R2, #13
STRB	R2, [SP, #8]
MOVS	R2, #10
STRB	R2, [SP, #9]
;fusion_v8_STM32F407ZG.c,323 :: 		uint8_t line = 10;
;fusion_v8_STM32F407ZG.c,324 :: 		switch( format )
IT	AL
BAL	L_mikrobus_logWrite228
; format end address is: 4 (R1)
;fusion_v8_STM32F407ZG.c,326 :: 		case _LOG_BYTE :
L_mikrobus_logWrite230:
;fusion_v8_STM32F407ZG.c,327 :: 		_log_write( ptr );
; ptr end address is: 0 (R0)
BL	fusion_v8_STM32F407ZG__log_write+0
;fusion_v8_STM32F407ZG.c,328 :: 		break;
IT	AL
BAL	L_mikrobus_logWrite229
;fusion_v8_STM32F407ZG.c,329 :: 		case _LOG_TEXT :
L_mikrobus_logWrite231:
;fusion_v8_STM32F407ZG.c,330 :: 		while( *ptr )
; ptr start address is: 0 (R0)
L_mikrobus_logWrite232:
; ptr end address is: 0 (R0)
; ptr start address is: 0 (R0)
LDRB	R2, [R0, #0]
CMP	R2, #0
IT	EQ
BEQ	L_mikrobus_logWrite233
;fusion_v8_STM32F407ZG.c,332 :: 		_log_write( ptr );
STR	R0, [SP, #4]
BL	fusion_v8_STM32F407ZG__log_write+0
LDR	R0, [SP, #4]
;fusion_v8_STM32F407ZG.c,333 :: 		ptr++;
ADDS	R0, R0, #1
;fusion_v8_STM32F407ZG.c,334 :: 		}
; ptr end address is: 0 (R0)
IT	AL
BAL	L_mikrobus_logWrite232
L_mikrobus_logWrite233:
;fusion_v8_STM32F407ZG.c,335 :: 		break;
IT	AL
BAL	L_mikrobus_logWrite229
;fusion_v8_STM32F407ZG.c,336 :: 		case _LOG_LINE :
L_mikrobus_logWrite234:
;fusion_v8_STM32F407ZG.c,337 :: 		while( *ptr )
; ptr start address is: 0 (R0)
L_mikrobus_logWrite235:
; ptr end address is: 0 (R0)
; ptr start address is: 0 (R0)
LDRB	R2, [R0, #0]
CMP	R2, #0
IT	EQ
BEQ	L_mikrobus_logWrite236
;fusion_v8_STM32F407ZG.c,339 :: 		_log_write( ptr );
STR	R0, [SP, #4]
BL	fusion_v8_STM32F407ZG__log_write+0
LDR	R0, [SP, #4]
;fusion_v8_STM32F407ZG.c,340 :: 		ptr++;
ADDS	R0, R0, #1
;fusion_v8_STM32F407ZG.c,341 :: 		}
; ptr end address is: 0 (R0)
IT	AL
BAL	L_mikrobus_logWrite235
L_mikrobus_logWrite236:
;fusion_v8_STM32F407ZG.c,342 :: 		_log_write( &row );
ADD	R2, SP, #8
MOV	R0, R2
BL	fusion_v8_STM32F407ZG__log_write+0
;fusion_v8_STM32F407ZG.c,343 :: 		_log_write( &line );
ADD	R2, SP, #9
MOV	R0, R2
BL	fusion_v8_STM32F407ZG__log_write+0
;fusion_v8_STM32F407ZG.c,344 :: 		break;
IT	AL
BAL	L_mikrobus_logWrite229
;fusion_v8_STM32F407ZG.c,345 :: 		default :
L_mikrobus_logWrite237:
;fusion_v8_STM32F407ZG.c,346 :: 		return _MIKROBUS_ERR_LOG;
MOVS	R0, #6
IT	AL
BAL	L_end_mikrobus_logWrite
;fusion_v8_STM32F407ZG.c,347 :: 		}
L_mikrobus_logWrite228:
; ptr start address is: 0 (R0)
; format start address is: 4 (R1)
CMP	R1, #0
IT	EQ
BEQ	L_mikrobus_logWrite230
CMP	R1, #1
IT	EQ
BEQ	L_mikrobus_logWrite231
CMP	R1, #2
IT	EQ
BEQ	L_mikrobus_logWrite234
; format end address is: 4 (R1)
; ptr end address is: 0 (R0)
IT	AL
BAL	L_mikrobus_logWrite237
L_mikrobus_logWrite229:
;fusion_v8_STM32F407ZG.c,348 :: 		return 0;
MOVS	R0, #0
;fusion_v8_STM32F407ZG.c,349 :: 		}
L_end_mikrobus_logWrite:
LDR	LR, [SP, #0]
ADD	SP, SP, #12
BX	LR
; end of _mikrobus_logWrite
