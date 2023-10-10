_Write_to_Data_Lines:
;ECGsynthetic_driver.c,49 :: 		void Write_to_Data_Lines(unsigned char _hi, unsigned char _lo) {
; _lo start address is: 4 (R1)
; _hi start address is: 0 (R0)
; _lo end address is: 4 (R1)
; _hi end address is: 0 (R0)
; _hi start address is: 0 (R0)
; _lo start address is: 4 (R1)
;ECGsynthetic_driver.c,50 :: 		GPIOE_ODR = (unsigned int) (_lo | (_hi << 8));
LSLS	R2, R0, #8
UXTH	R2, R2
; _hi end address is: 0 (R0)
ORR	R3, R1, R2, LSL #0
UXTH	R3, R3
; _lo end address is: 4 (R1)
MOVW	R2, #lo_addr(GPIOE_ODR+0)
MOVT	R2, #hi_addr(GPIOE_ODR+0)
STR	R3, [R2, #0]
;ECGsynthetic_driver.c,51 :: 		}
L_end_Write_to_Data_Lines:
BX	LR
; end of _Write_to_Data_Lines
_Set_Index:
;ECGsynthetic_driver.c,53 :: 		void Set_Index(unsigned short index) {
; index start address is: 0 (R0)
SUB	SP, SP, #4
STR	LR, [SP, #0]
; index end address is: 0 (R0)
; index start address is: 0 (R0)
;ECGsynthetic_driver.c,54 :: 		TFT_RS = 0;
MOVS	R2, #0
SXTB	R2, R2
MOVW	R1, #lo_addr(GPIOF_ODR+0)
MOVT	R1, #hi_addr(GPIOF_ODR+0)
_SX	[R1, ByteOffset(GPIOF_ODR+0)]
;ECGsynthetic_driver.c,55 :: 		Write_to_Data_Lines(0, index);
UXTB	R1, R0
; index end address is: 0 (R0)
MOVS	R0, #0
BL	_Write_to_Data_Lines+0
;ECGsynthetic_driver.c,56 :: 		TFT_WR = 0;
MOVS	R2, #0
SXTB	R2, R2
MOVW	R1, #lo_addr(GPIOF_ODR+0)
MOVT	R1, #hi_addr(GPIOF_ODR+0)
_SX	[R1, ByteOffset(GPIOF_ODR+0)]
;ECGsynthetic_driver.c,57 :: 		asm nop;
NOP
;ECGsynthetic_driver.c,58 :: 		TFT_WR = 1;
MOVS	R2, #1
SXTB	R2, R2
MOVW	R1, #lo_addr(GPIOF_ODR+0)
MOVT	R1, #hi_addr(GPIOF_ODR+0)
_SX	[R1, ByteOffset(GPIOF_ODR+0)]
;ECGsynthetic_driver.c,59 :: 		}
L_end_Set_Index:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Set_Index
_Write_Command:
;ECGsynthetic_driver.c,61 :: 		void Write_Command(unsigned short cmd) {
; cmd start address is: 0 (R0)
SUB	SP, SP, #4
STR	LR, [SP, #0]
; cmd end address is: 0 (R0)
; cmd start address is: 0 (R0)
;ECGsynthetic_driver.c,62 :: 		TFT_RS = 1;
MOVS	R2, #1
SXTB	R2, R2
MOVW	R1, #lo_addr(GPIOF_ODR+0)
MOVT	R1, #hi_addr(GPIOF_ODR+0)
_SX	[R1, ByteOffset(GPIOF_ODR+0)]
;ECGsynthetic_driver.c,63 :: 		Write_to_Data_Lines(0, cmd);
UXTB	R1, R0
; cmd end address is: 0 (R0)
MOVS	R0, #0
BL	_Write_to_Data_Lines+0
;ECGsynthetic_driver.c,64 :: 		TFT_WR = 0;
MOVS	R2, #0
SXTB	R2, R2
MOVW	R1, #lo_addr(GPIOF_ODR+0)
MOVT	R1, #hi_addr(GPIOF_ODR+0)
_SX	[R1, ByteOffset(GPIOF_ODR+0)]
;ECGsynthetic_driver.c,65 :: 		asm nop;
NOP
;ECGsynthetic_driver.c,66 :: 		TFT_WR = 1;
MOVS	R2, #1
SXTB	R2, R2
MOVW	R1, #lo_addr(GPIOF_ODR+0)
MOVT	R1, #hi_addr(GPIOF_ODR+0)
_SX	[R1, ByteOffset(GPIOF_ODR+0)]
;ECGsynthetic_driver.c,67 :: 		}
L_end_Write_Command:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Write_Command
_Write_Data:
;ECGsynthetic_driver.c,69 :: 		void Write_Data(unsigned int _data) {
SUB	SP, SP, #8
STR	LR, [SP, #0]
STRH	R0, [SP, #4]
;ECGsynthetic_driver.c,70 :: 		TFT_RS = 1;
MOVS	R2, #1
SXTB	R2, R2
MOVW	R1, #lo_addr(GPIOF_ODR+0)
MOVT	R1, #hi_addr(GPIOF_ODR+0)
_SX	[R1, ByteOffset(GPIOF_ODR+0)]
;ECGsynthetic_driver.c,71 :: 		Write_to_Data_Lines(Hi(_data), Lo(_data));
ADD	R3, SP, #4
LDRB	R1, [R3, #0]
UXTB	R2, R1
ADDS	R1, R3, #1
LDRB	R1, [R1, #0]
UXTB	R0, R1
UXTB	R1, R2
BL	_Write_to_Data_Lines+0
;ECGsynthetic_driver.c,72 :: 		TFT_WR = 0;
MOVS	R2, #0
SXTB	R2, R2
MOVW	R1, #lo_addr(GPIOF_ODR+0)
MOVT	R1, #hi_addr(GPIOF_ODR+0)
_SX	[R1, ByteOffset(GPIOF_ODR+0)]
;ECGsynthetic_driver.c,73 :: 		asm nop;
NOP
;ECGsynthetic_driver.c,74 :: 		TFT_WR = 1;
MOVS	R2, #1
SXTB	R2, R2
MOVW	R1, #lo_addr(GPIOF_ODR+0)
MOVT	R1, #hi_addr(GPIOF_ODR+0)
_SX	[R1, ByteOffset(GPIOF_ODR+0)]
;ECGsynthetic_driver.c,75 :: 		}
L_end_Write_Data:
LDR	LR, [SP, #0]
ADD	SP, SP, #8
BX	LR
; end of _Write_Data
ECGsynthetic_driver_InitializeTouchPanel:
;ECGsynthetic_driver.c,77 :: 		static void InitializeTouchPanel() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;ECGsynthetic_driver.c,78 :: 		TFT_Set_Active(Set_Index, Write_Command, Write_Data);
MOVW	R2, #lo_addr(_Write_Data+0)
MOVT	R2, #hi_addr(_Write_Data+0)
MOVW	R1, #lo_addr(_Write_Command+0)
MOVT	R1, #hi_addr(_Write_Command+0)
MOVW	R0, #lo_addr(_Set_Index+0)
MOVT	R0, #hi_addr(_Set_Index+0)
BL	_TFT_Set_Active+0
;ECGsynthetic_driver.c,79 :: 		TFT_Init_SSD1963_Board_50(800, 480);
MOVW	R1, #480
MOVW	R0, #800
BL	_TFT_Init_SSD1963_Board_50+0
;ECGsynthetic_driver.c,81 :: 		TFT_Set_DBC_SSD1963(255);
MOVS	R0, #255
BL	_TFT_Set_DBC_SSD1963+0
;ECGsynthetic_driver.c,83 :: 		PenDown = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_PenDown+0)
MOVT	R0, #hi_addr(_PenDown+0)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,84 :: 		PressedObject = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_PressedObject+0)
MOVT	R0, #hi_addr(_PressedObject+0)
STR	R1, [R0, #0]
;ECGsynthetic_driver.c,85 :: 		PressedObjectType = -1;
MOVW	R1, #65535
SXTH	R1, R1
MOVW	R0, #lo_addr(_PressedObjectType+0)
MOVT	R0, #hi_addr(_PressedObjectType+0)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,86 :: 		}
L_end_InitializeTouchPanel:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of ECGsynthetic_driver_InitializeTouchPanel
ECGsynthetic_driver_InitializeObjects:
;ECGsynthetic_driver.c,716 :: 		static void InitializeObjects() {
;ECGsynthetic_driver.c,717 :: 		Screen1.Color                     = 0xFFFF;
MOVW	R1, #65535
MOVW	R0, #lo_addr(_Screen1+0)
MOVT	R0, #hi_addr(_Screen1+0)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,718 :: 		Screen1.Width                     = 800;
MOVW	R1, #800
MOVW	R0, #lo_addr(_Screen1+2)
MOVT	R0, #hi_addr(_Screen1+2)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,719 :: 		Screen1.Height                    = 480;
MOVW	R1, #480
MOVW	R0, #lo_addr(_Screen1+4)
MOVT	R0, #hi_addr(_Screen1+4)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,720 :: 		Screen1.Buttons_RoundCount        = 4;
MOVS	R1, #4
MOVW	R0, #lo_addr(_Screen1+8)
MOVT	R0, #hi_addr(_Screen1+8)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,721 :: 		Screen1.Buttons_Round             = Screen1_Buttons_Round;
MOVW	R1, #lo_addr(_Screen1_Buttons_Round+0)
MOVT	R1, #hi_addr(_Screen1_Buttons_Round+0)
MOVW	R0, #lo_addr(_Screen1+12)
MOVT	R0, #hi_addr(_Screen1+12)
STR	R1, [R0, #0]
;ECGsynthetic_driver.c,722 :: 		Screen1.LabelsCount               = 15;
MOVS	R1, #15
MOVW	R0, #lo_addr(_Screen1+16)
MOVT	R0, #hi_addr(_Screen1+16)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,723 :: 		Screen1.Labels                    = Screen1_Labels;
MOVW	R1, #lo_addr(_Screen1_Labels+0)
MOVT	R1, #hi_addr(_Screen1_Labels+0)
MOVW	R0, #lo_addr(_Screen1+20)
MOVT	R0, #hi_addr(_Screen1+20)
STR	R1, [R0, #0]
;ECGsynthetic_driver.c,724 :: 		Screen1.ImagesCount               = 2;
MOVS	R1, #2
MOVW	R0, #lo_addr(_Screen1+24)
MOVT	R0, #hi_addr(_Screen1+24)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,725 :: 		Screen1.Images                    = Screen1_Images;
MOVW	R1, #lo_addr(_Screen1_Images+0)
MOVT	R1, #hi_addr(_Screen1_Images+0)
MOVW	R0, #lo_addr(_Screen1+28)
MOVT	R0, #hi_addr(_Screen1+28)
STR	R1, [R0, #0]
;ECGsynthetic_driver.c,726 :: 		Screen1.BoxesCount                = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Screen1+32)
MOVT	R0, #hi_addr(_Screen1+32)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,727 :: 		Screen1.Boxes                     = Screen1_Boxes;
MOVW	R1, #lo_addr(_Screen1_Boxes+0)
MOVT	R1, #hi_addr(_Screen1_Boxes+0)
MOVW	R0, #lo_addr(_Screen1+36)
MOVT	R0, #hi_addr(_Screen1+36)
STR	R1, [R0, #0]
;ECGsynthetic_driver.c,728 :: 		Screen1.Boxes_RoundCount          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Screen1+40)
MOVT	R0, #hi_addr(_Screen1+40)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,729 :: 		Screen1.Boxes_Round               = Screen1_Boxes_Round;
MOVW	R1, #lo_addr(_Screen1_Boxes_Round+0)
MOVT	R1, #hi_addr(_Screen1_Boxes_Round+0)
MOVW	R0, #lo_addr(_Screen1+44)
MOVT	R0, #hi_addr(_Screen1+44)
STR	R1, [R0, #0]
;ECGsynthetic_driver.c,730 :: 		Screen1.RadioButtonsCount         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Screen1+48)
MOVT	R0, #hi_addr(_Screen1+48)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,731 :: 		Screen1.ObjectsCount              = 23;
MOVS	R1, #23
MOVW	R0, #lo_addr(_Screen1+6)
MOVT	R0, #hi_addr(_Screen1+6)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,732 :: 		Screen1.OnSwipeUpPtr    = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Screen1+64)
MOVT	R0, #hi_addr(_Screen1+64)
STR	R1, [R0, #0]
;ECGsynthetic_driver.c,733 :: 		Screen1.OnSwipeDownPtr  = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Screen1+68)
MOVT	R0, #hi_addr(_Screen1+68)
STR	R1, [R0, #0]
;ECGsynthetic_driver.c,734 :: 		Screen1.OnSwipeLeftPtr  = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Screen1+56)
MOVT	R0, #hi_addr(_Screen1+56)
STR	R1, [R0, #0]
;ECGsynthetic_driver.c,735 :: 		Screen1.OnSwipeRightPtr = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Screen1+60)
MOVT	R0, #hi_addr(_Screen1+60)
STR	R1, [R0, #0]
;ECGsynthetic_driver.c,736 :: 		Screen1.OnZoomInPtr     = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Screen1+72)
MOVT	R0, #hi_addr(_Screen1+72)
STR	R1, [R0, #0]
;ECGsynthetic_driver.c,737 :: 		Screen1.OnZoomOutPtr    = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Screen1+76)
MOVT	R0, #hi_addr(_Screen1+76)
STR	R1, [R0, #0]
;ECGsynthetic_driver.c,739 :: 		Screen2.Color                     = 0xFFFF;
MOVW	R1, #65535
MOVW	R0, #lo_addr(_Screen2+0)
MOVT	R0, #hi_addr(_Screen2+0)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,740 :: 		Screen2.Width                     = 800;
MOVW	R1, #800
MOVW	R0, #lo_addr(_Screen2+2)
MOVT	R0, #hi_addr(_Screen2+2)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,741 :: 		Screen2.Height                    = 480;
MOVW	R1, #480
MOVW	R0, #lo_addr(_Screen2+4)
MOVT	R0, #hi_addr(_Screen2+4)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,742 :: 		Screen2.Buttons_RoundCount        = 2;
MOVS	R1, #2
MOVW	R0, #lo_addr(_Screen2+8)
MOVT	R0, #hi_addr(_Screen2+8)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,743 :: 		Screen2.Buttons_Round             = Screen2_Buttons_Round;
MOVW	R1, #lo_addr(_Screen2_Buttons_Round+0)
MOVT	R1, #hi_addr(_Screen2_Buttons_Round+0)
MOVW	R0, #lo_addr(_Screen2+12)
MOVT	R0, #hi_addr(_Screen2+12)
STR	R1, [R0, #0]
;ECGsynthetic_driver.c,744 :: 		Screen2.LabelsCount               = 2;
MOVS	R1, #2
MOVW	R0, #lo_addr(_Screen2+16)
MOVT	R0, #hi_addr(_Screen2+16)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,745 :: 		Screen2.Labels                    = Screen2_Labels;
MOVW	R1, #lo_addr(_Screen2_Labels+0)
MOVT	R1, #hi_addr(_Screen2_Labels+0)
MOVW	R0, #lo_addr(_Screen2+20)
MOVT	R0, #hi_addr(_Screen2+20)
STR	R1, [R0, #0]
;ECGsynthetic_driver.c,746 :: 		Screen2.ImagesCount               = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Screen2+24)
MOVT	R0, #hi_addr(_Screen2+24)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,747 :: 		Screen2.Images                    = Screen2_Images;
MOVW	R1, #lo_addr(_Screen2_Images+0)
MOVT	R1, #hi_addr(_Screen2_Images+0)
MOVW	R0, #lo_addr(_Screen2+28)
MOVT	R0, #hi_addr(_Screen2+28)
STR	R1, [R0, #0]
;ECGsynthetic_driver.c,748 :: 		Screen2.BoxesCount                = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Screen2+32)
MOVT	R0, #hi_addr(_Screen2+32)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,749 :: 		Screen2.Boxes_RoundCount          = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Screen2+40)
MOVT	R0, #hi_addr(_Screen2+40)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,750 :: 		Screen2.RadioButtonsCount         = 12;
MOVS	R1, #12
MOVW	R0, #lo_addr(_Screen2+48)
MOVT	R0, #hi_addr(_Screen2+48)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,751 :: 		Screen2.RadioButtons              = Screen2_RadioButtons;
MOVW	R1, #lo_addr(_Screen2_RadioButtons+0)
MOVT	R1, #hi_addr(_Screen2_RadioButtons+0)
MOVW	R0, #lo_addr(_Screen2+52)
MOVT	R0, #hi_addr(_Screen2+52)
STR	R1, [R0, #0]
;ECGsynthetic_driver.c,752 :: 		Screen2.ObjectsCount              = 17;
MOVS	R1, #17
MOVW	R0, #lo_addr(_Screen2+6)
MOVT	R0, #hi_addr(_Screen2+6)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,753 :: 		Screen2.OnSwipeUpPtr    = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Screen2+64)
MOVT	R0, #hi_addr(_Screen2+64)
STR	R1, [R0, #0]
;ECGsynthetic_driver.c,754 :: 		Screen2.OnSwipeDownPtr  = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Screen2+68)
MOVT	R0, #hi_addr(_Screen2+68)
STR	R1, [R0, #0]
;ECGsynthetic_driver.c,755 :: 		Screen2.OnSwipeLeftPtr  = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Screen2+56)
MOVT	R0, #hi_addr(_Screen2+56)
STR	R1, [R0, #0]
;ECGsynthetic_driver.c,756 :: 		Screen2.OnSwipeRightPtr = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Screen2+60)
MOVT	R0, #hi_addr(_Screen2+60)
STR	R1, [R0, #0]
;ECGsynthetic_driver.c,757 :: 		Screen2.OnZoomInPtr     = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Screen2+72)
MOVT	R0, #hi_addr(_Screen2+72)
STR	R1, [R0, #0]
;ECGsynthetic_driver.c,758 :: 		Screen2.OnZoomOutPtr    = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Screen2+76)
MOVT	R0, #hi_addr(_Screen2+76)
STR	R1, [R0, #0]
;ECGsynthetic_driver.c,760 :: 		Screen3.Color                     = 0xFFFF;
MOVW	R1, #65535
MOVW	R0, #lo_addr(_Screen3+0)
MOVT	R0, #hi_addr(_Screen3+0)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,761 :: 		Screen3.Width                     = 800;
MOVW	R1, #800
MOVW	R0, #lo_addr(_Screen3+2)
MOVT	R0, #hi_addr(_Screen3+2)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,762 :: 		Screen3.Height                    = 480;
MOVW	R1, #480
MOVW	R0, #lo_addr(_Screen3+4)
MOVT	R0, #hi_addr(_Screen3+4)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,763 :: 		Screen3.Buttons_RoundCount        = 2;
MOVS	R1, #2
MOVW	R0, #lo_addr(_Screen3+8)
MOVT	R0, #hi_addr(_Screen3+8)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,764 :: 		Screen3.Buttons_Round             = Screen3_Buttons_Round;
MOVW	R1, #lo_addr(_Screen3_Buttons_Round+0)
MOVT	R1, #hi_addr(_Screen3_Buttons_Round+0)
MOVW	R0, #lo_addr(_Screen3+12)
MOVT	R0, #hi_addr(_Screen3+12)
STR	R1, [R0, #0]
;ECGsynthetic_driver.c,765 :: 		Screen3.LabelsCount               = 2;
MOVS	R1, #2
MOVW	R0, #lo_addr(_Screen3+16)
MOVT	R0, #hi_addr(_Screen3+16)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,766 :: 		Screen3.Labels                    = Screen3_Labels;
MOVW	R1, #lo_addr(_Screen3_Labels+0)
MOVT	R1, #hi_addr(_Screen3_Labels+0)
MOVW	R0, #lo_addr(_Screen3+20)
MOVT	R0, #hi_addr(_Screen3+20)
STR	R1, [R0, #0]
;ECGsynthetic_driver.c,767 :: 		Screen3.ImagesCount               = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Screen3+24)
MOVT	R0, #hi_addr(_Screen3+24)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,768 :: 		Screen3.Images                    = Screen3_Images;
MOVW	R1, #lo_addr(_Screen3_Images+0)
MOVT	R1, #hi_addr(_Screen3_Images+0)
MOVW	R0, #lo_addr(_Screen3+28)
MOVT	R0, #hi_addr(_Screen3+28)
STR	R1, [R0, #0]
;ECGsynthetic_driver.c,769 :: 		Screen3.BoxesCount                = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Screen3+32)
MOVT	R0, #hi_addr(_Screen3+32)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,770 :: 		Screen3.Boxes_RoundCount          = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Screen3+40)
MOVT	R0, #hi_addr(_Screen3+40)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,771 :: 		Screen3.RadioButtonsCount         = 12;
MOVS	R1, #12
MOVW	R0, #lo_addr(_Screen3+48)
MOVT	R0, #hi_addr(_Screen3+48)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,772 :: 		Screen3.RadioButtons              = Screen3_RadioButtons;
MOVW	R1, #lo_addr(_Screen3_RadioButtons+0)
MOVT	R1, #hi_addr(_Screen3_RadioButtons+0)
MOVW	R0, #lo_addr(_Screen3+52)
MOVT	R0, #hi_addr(_Screen3+52)
STR	R1, [R0, #0]
;ECGsynthetic_driver.c,773 :: 		Screen3.ObjectsCount              = 17;
MOVS	R1, #17
MOVW	R0, #lo_addr(_Screen3+6)
MOVT	R0, #hi_addr(_Screen3+6)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,774 :: 		Screen3.OnSwipeUpPtr    = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Screen3+64)
MOVT	R0, #hi_addr(_Screen3+64)
STR	R1, [R0, #0]
;ECGsynthetic_driver.c,775 :: 		Screen3.OnSwipeDownPtr  = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Screen3+68)
MOVT	R0, #hi_addr(_Screen3+68)
STR	R1, [R0, #0]
;ECGsynthetic_driver.c,776 :: 		Screen3.OnSwipeLeftPtr  = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Screen3+56)
MOVT	R0, #hi_addr(_Screen3+56)
STR	R1, [R0, #0]
;ECGsynthetic_driver.c,777 :: 		Screen3.OnSwipeRightPtr = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Screen3+60)
MOVT	R0, #hi_addr(_Screen3+60)
STR	R1, [R0, #0]
;ECGsynthetic_driver.c,778 :: 		Screen3.OnZoomInPtr     = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Screen3+72)
MOVT	R0, #hi_addr(_Screen3+72)
STR	R1, [R0, #0]
;ECGsynthetic_driver.c,779 :: 		Screen3.OnZoomOutPtr    = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Screen3+76)
MOVT	R0, #hi_addr(_Screen3+76)
STR	R1, [R0, #0]
;ECGsynthetic_driver.c,781 :: 		Screen4.Color                     = 0xFFFF;
MOVW	R1, #65535
MOVW	R0, #lo_addr(_Screen4+0)
MOVT	R0, #hi_addr(_Screen4+0)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,782 :: 		Screen4.Width                     = 800;
MOVW	R1, #800
MOVW	R0, #lo_addr(_Screen4+2)
MOVT	R0, #hi_addr(_Screen4+2)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,783 :: 		Screen4.Height                    = 480;
MOVW	R1, #480
MOVW	R0, #lo_addr(_Screen4+4)
MOVT	R0, #hi_addr(_Screen4+4)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,784 :: 		Screen4.Buttons_RoundCount        = 2;
MOVS	R1, #2
MOVW	R0, #lo_addr(_Screen4+8)
MOVT	R0, #hi_addr(_Screen4+8)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,785 :: 		Screen4.Buttons_Round             = Screen4_Buttons_Round;
MOVW	R1, #lo_addr(_Screen4_Buttons_Round+0)
MOVT	R1, #hi_addr(_Screen4_Buttons_Round+0)
MOVW	R0, #lo_addr(_Screen4+12)
MOVT	R0, #hi_addr(_Screen4+12)
STR	R1, [R0, #0]
;ECGsynthetic_driver.c,786 :: 		Screen4.LabelsCount               = 2;
MOVS	R1, #2
MOVW	R0, #lo_addr(_Screen4+16)
MOVT	R0, #hi_addr(_Screen4+16)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,787 :: 		Screen4.Labels                    = Screen4_Labels;
MOVW	R1, #lo_addr(_Screen4_Labels+0)
MOVT	R1, #hi_addr(_Screen4_Labels+0)
MOVW	R0, #lo_addr(_Screen4+20)
MOVT	R0, #hi_addr(_Screen4+20)
STR	R1, [R0, #0]
;ECGsynthetic_driver.c,788 :: 		Screen4.ImagesCount               = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Screen4+24)
MOVT	R0, #hi_addr(_Screen4+24)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,789 :: 		Screen4.Images                    = Screen4_Images;
MOVW	R1, #lo_addr(_Screen4_Images+0)
MOVT	R1, #hi_addr(_Screen4_Images+0)
MOVW	R0, #lo_addr(_Screen4+28)
MOVT	R0, #hi_addr(_Screen4+28)
STR	R1, [R0, #0]
;ECGsynthetic_driver.c,790 :: 		Screen4.BoxesCount                = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Screen4+32)
MOVT	R0, #hi_addr(_Screen4+32)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,791 :: 		Screen4.Boxes_RoundCount          = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Screen4+40)
MOVT	R0, #hi_addr(_Screen4+40)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,792 :: 		Screen4.RadioButtonsCount         = 12;
MOVS	R1, #12
MOVW	R0, #lo_addr(_Screen4+48)
MOVT	R0, #hi_addr(_Screen4+48)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,793 :: 		Screen4.RadioButtons              = Screen4_RadioButtons;
MOVW	R1, #lo_addr(_Screen4_RadioButtons+0)
MOVT	R1, #hi_addr(_Screen4_RadioButtons+0)
MOVW	R0, #lo_addr(_Screen4+52)
MOVT	R0, #hi_addr(_Screen4+52)
STR	R1, [R0, #0]
;ECGsynthetic_driver.c,794 :: 		Screen4.ObjectsCount              = 17;
MOVS	R1, #17
MOVW	R0, #lo_addr(_Screen4+6)
MOVT	R0, #hi_addr(_Screen4+6)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,795 :: 		Screen4.OnSwipeUpPtr    = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Screen4+64)
MOVT	R0, #hi_addr(_Screen4+64)
STR	R1, [R0, #0]
;ECGsynthetic_driver.c,796 :: 		Screen4.OnSwipeDownPtr  = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Screen4+68)
MOVT	R0, #hi_addr(_Screen4+68)
STR	R1, [R0, #0]
;ECGsynthetic_driver.c,797 :: 		Screen4.OnSwipeLeftPtr  = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Screen4+56)
MOVT	R0, #hi_addr(_Screen4+56)
STR	R1, [R0, #0]
;ECGsynthetic_driver.c,798 :: 		Screen4.OnSwipeRightPtr = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Screen4+60)
MOVT	R0, #hi_addr(_Screen4+60)
STR	R1, [R0, #0]
;ECGsynthetic_driver.c,799 :: 		Screen4.OnZoomInPtr     = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Screen4+72)
MOVT	R0, #hi_addr(_Screen4+72)
STR	R1, [R0, #0]
;ECGsynthetic_driver.c,800 :: 		Screen4.OnZoomOutPtr    = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Screen4+76)
MOVT	R0, #hi_addr(_Screen4+76)
STR	R1, [R0, #0]
;ECGsynthetic_driver.c,802 :: 		Screen5.Color                     = 0xFFFF;
MOVW	R1, #65535
MOVW	R0, #lo_addr(_Screen5+0)
MOVT	R0, #hi_addr(_Screen5+0)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,803 :: 		Screen5.Width                     = 800;
MOVW	R1, #800
MOVW	R0, #lo_addr(_Screen5+2)
MOVT	R0, #hi_addr(_Screen5+2)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,804 :: 		Screen5.Height                    = 480;
MOVW	R1, #480
MOVW	R0, #lo_addr(_Screen5+4)
MOVT	R0, #hi_addr(_Screen5+4)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,805 :: 		Screen5.Buttons_RoundCount        = 2;
MOVS	R1, #2
MOVW	R0, #lo_addr(_Screen5+8)
MOVT	R0, #hi_addr(_Screen5+8)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,806 :: 		Screen5.Buttons_Round             = Screen5_Buttons_Round;
MOVW	R1, #lo_addr(_Screen5_Buttons_Round+0)
MOVT	R1, #hi_addr(_Screen5_Buttons_Round+0)
MOVW	R0, #lo_addr(_Screen5+12)
MOVT	R0, #hi_addr(_Screen5+12)
STR	R1, [R0, #0]
;ECGsynthetic_driver.c,807 :: 		Screen5.LabelsCount               = 2;
MOVS	R1, #2
MOVW	R0, #lo_addr(_Screen5+16)
MOVT	R0, #hi_addr(_Screen5+16)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,808 :: 		Screen5.Labels                    = Screen5_Labels;
MOVW	R1, #lo_addr(_Screen5_Labels+0)
MOVT	R1, #hi_addr(_Screen5_Labels+0)
MOVW	R0, #lo_addr(_Screen5+20)
MOVT	R0, #hi_addr(_Screen5+20)
STR	R1, [R0, #0]
;ECGsynthetic_driver.c,809 :: 		Screen5.ImagesCount               = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Screen5+24)
MOVT	R0, #hi_addr(_Screen5+24)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,810 :: 		Screen5.Images                    = Screen5_Images;
MOVW	R1, #lo_addr(_Screen5_Images+0)
MOVT	R1, #hi_addr(_Screen5_Images+0)
MOVW	R0, #lo_addr(_Screen5+28)
MOVT	R0, #hi_addr(_Screen5+28)
STR	R1, [R0, #0]
;ECGsynthetic_driver.c,811 :: 		Screen5.BoxesCount                = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Screen5+32)
MOVT	R0, #hi_addr(_Screen5+32)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,812 :: 		Screen5.Boxes_RoundCount          = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Screen5+40)
MOVT	R0, #hi_addr(_Screen5+40)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,813 :: 		Screen5.RadioButtonsCount         = 12;
MOVS	R1, #12
MOVW	R0, #lo_addr(_Screen5+48)
MOVT	R0, #hi_addr(_Screen5+48)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,814 :: 		Screen5.RadioButtons              = Screen5_RadioButtons;
MOVW	R1, #lo_addr(_Screen5_RadioButtons+0)
MOVT	R1, #hi_addr(_Screen5_RadioButtons+0)
MOVW	R0, #lo_addr(_Screen5+52)
MOVT	R0, #hi_addr(_Screen5+52)
STR	R1, [R0, #0]
;ECGsynthetic_driver.c,815 :: 		Screen5.ObjectsCount              = 17;
MOVS	R1, #17
MOVW	R0, #lo_addr(_Screen5+6)
MOVT	R0, #hi_addr(_Screen5+6)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,816 :: 		Screen5.OnSwipeUpPtr    = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Screen5+64)
MOVT	R0, #hi_addr(_Screen5+64)
STR	R1, [R0, #0]
;ECGsynthetic_driver.c,817 :: 		Screen5.OnSwipeDownPtr  = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Screen5+68)
MOVT	R0, #hi_addr(_Screen5+68)
STR	R1, [R0, #0]
;ECGsynthetic_driver.c,818 :: 		Screen5.OnSwipeLeftPtr  = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Screen5+56)
MOVT	R0, #hi_addr(_Screen5+56)
STR	R1, [R0, #0]
;ECGsynthetic_driver.c,819 :: 		Screen5.OnSwipeRightPtr = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Screen5+60)
MOVT	R0, #hi_addr(_Screen5+60)
STR	R1, [R0, #0]
;ECGsynthetic_driver.c,820 :: 		Screen5.OnZoomInPtr     = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Screen5+72)
MOVT	R0, #hi_addr(_Screen5+72)
STR	R1, [R0, #0]
;ECGsynthetic_driver.c,821 :: 		Screen5.OnZoomOutPtr    = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Screen5+76)
MOVT	R0, #hi_addr(_Screen5+76)
STR	R1, [R0, #0]
;ECGsynthetic_driver.c,823 :: 		Screen6.Color                     = 0xFFFF;
MOVW	R1, #65535
MOVW	R0, #lo_addr(_Screen6+0)
MOVT	R0, #hi_addr(_Screen6+0)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,824 :: 		Screen6.Width                     = 800;
MOVW	R1, #800
MOVW	R0, #lo_addr(_Screen6+2)
MOVT	R0, #hi_addr(_Screen6+2)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,825 :: 		Screen6.Height                    = 480;
MOVW	R1, #480
MOVW	R0, #lo_addr(_Screen6+4)
MOVT	R0, #hi_addr(_Screen6+4)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,826 :: 		Screen6.Buttons_RoundCount        = 2;
MOVS	R1, #2
MOVW	R0, #lo_addr(_Screen6+8)
MOVT	R0, #hi_addr(_Screen6+8)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,827 :: 		Screen6.Buttons_Round             = Screen6_Buttons_Round;
MOVW	R1, #lo_addr(_Screen6_Buttons_Round+0)
MOVT	R1, #hi_addr(_Screen6_Buttons_Round+0)
MOVW	R0, #lo_addr(_Screen6+12)
MOVT	R0, #hi_addr(_Screen6+12)
STR	R1, [R0, #0]
;ECGsynthetic_driver.c,828 :: 		Screen6.LabelsCount               = 2;
MOVS	R1, #2
MOVW	R0, #lo_addr(_Screen6+16)
MOVT	R0, #hi_addr(_Screen6+16)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,829 :: 		Screen6.Labels                    = Screen6_Labels;
MOVW	R1, #lo_addr(_Screen6_Labels+0)
MOVT	R1, #hi_addr(_Screen6_Labels+0)
MOVW	R0, #lo_addr(_Screen6+20)
MOVT	R0, #hi_addr(_Screen6+20)
STR	R1, [R0, #0]
;ECGsynthetic_driver.c,830 :: 		Screen6.ImagesCount               = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Screen6+24)
MOVT	R0, #hi_addr(_Screen6+24)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,831 :: 		Screen6.Images                    = Screen6_Images;
MOVW	R1, #lo_addr(_Screen6_Images+0)
MOVT	R1, #hi_addr(_Screen6_Images+0)
MOVW	R0, #lo_addr(_Screen6+28)
MOVT	R0, #hi_addr(_Screen6+28)
STR	R1, [R0, #0]
;ECGsynthetic_driver.c,832 :: 		Screen6.BoxesCount                = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Screen6+32)
MOVT	R0, #hi_addr(_Screen6+32)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,833 :: 		Screen6.Boxes_RoundCount          = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Screen6+40)
MOVT	R0, #hi_addr(_Screen6+40)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,834 :: 		Screen6.RadioButtonsCount         = 12;
MOVS	R1, #12
MOVW	R0, #lo_addr(_Screen6+48)
MOVT	R0, #hi_addr(_Screen6+48)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,835 :: 		Screen6.RadioButtons              = Screen6_RadioButtons;
MOVW	R1, #lo_addr(_Screen6_RadioButtons+0)
MOVT	R1, #hi_addr(_Screen6_RadioButtons+0)
MOVW	R0, #lo_addr(_Screen6+52)
MOVT	R0, #hi_addr(_Screen6+52)
STR	R1, [R0, #0]
;ECGsynthetic_driver.c,836 :: 		Screen6.ObjectsCount              = 17;
MOVS	R1, #17
MOVW	R0, #lo_addr(_Screen6+6)
MOVT	R0, #hi_addr(_Screen6+6)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,837 :: 		Screen6.OnSwipeUpPtr    = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Screen6+64)
MOVT	R0, #hi_addr(_Screen6+64)
STR	R1, [R0, #0]
;ECGsynthetic_driver.c,838 :: 		Screen6.OnSwipeDownPtr  = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Screen6+68)
MOVT	R0, #hi_addr(_Screen6+68)
STR	R1, [R0, #0]
;ECGsynthetic_driver.c,839 :: 		Screen6.OnSwipeLeftPtr  = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Screen6+56)
MOVT	R0, #hi_addr(_Screen6+56)
STR	R1, [R0, #0]
;ECGsynthetic_driver.c,840 :: 		Screen6.OnSwipeRightPtr = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Screen6+60)
MOVT	R0, #hi_addr(_Screen6+60)
STR	R1, [R0, #0]
;ECGsynthetic_driver.c,841 :: 		Screen6.OnZoomInPtr     = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Screen6+72)
MOVT	R0, #hi_addr(_Screen6+72)
STR	R1, [R0, #0]
;ECGsynthetic_driver.c,842 :: 		Screen6.OnZoomOutPtr    = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Screen6+76)
MOVT	R0, #hi_addr(_Screen6+76)
STR	R1, [R0, #0]
;ECGsynthetic_driver.c,844 :: 		Screen7.Color                     = 0xFFFF;
MOVW	R1, #65535
MOVW	R0, #lo_addr(_Screen7+0)
MOVT	R0, #hi_addr(_Screen7+0)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,845 :: 		Screen7.Width                     = 800;
MOVW	R1, #800
MOVW	R0, #lo_addr(_Screen7+2)
MOVT	R0, #hi_addr(_Screen7+2)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,846 :: 		Screen7.Height                    = 480;
MOVW	R1, #480
MOVW	R0, #lo_addr(_Screen7+4)
MOVT	R0, #hi_addr(_Screen7+4)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,847 :: 		Screen7.Buttons_RoundCount        = 2;
MOVS	R1, #2
MOVW	R0, #lo_addr(_Screen7+8)
MOVT	R0, #hi_addr(_Screen7+8)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,848 :: 		Screen7.Buttons_Round             = Screen7_Buttons_Round;
MOVW	R1, #lo_addr(_Screen7_Buttons_Round+0)
MOVT	R1, #hi_addr(_Screen7_Buttons_Round+0)
MOVW	R0, #lo_addr(_Screen7+12)
MOVT	R0, #hi_addr(_Screen7+12)
STR	R1, [R0, #0]
;ECGsynthetic_driver.c,849 :: 		Screen7.LabelsCount               = 2;
MOVS	R1, #2
MOVW	R0, #lo_addr(_Screen7+16)
MOVT	R0, #hi_addr(_Screen7+16)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,850 :: 		Screen7.Labels                    = Screen7_Labels;
MOVW	R1, #lo_addr(_Screen7_Labels+0)
MOVT	R1, #hi_addr(_Screen7_Labels+0)
MOVW	R0, #lo_addr(_Screen7+20)
MOVT	R0, #hi_addr(_Screen7+20)
STR	R1, [R0, #0]
;ECGsynthetic_driver.c,851 :: 		Screen7.ImagesCount               = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Screen7+24)
MOVT	R0, #hi_addr(_Screen7+24)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,852 :: 		Screen7.Images                    = Screen7_Images;
MOVW	R1, #lo_addr(_Screen7_Images+0)
MOVT	R1, #hi_addr(_Screen7_Images+0)
MOVW	R0, #lo_addr(_Screen7+28)
MOVT	R0, #hi_addr(_Screen7+28)
STR	R1, [R0, #0]
;ECGsynthetic_driver.c,853 :: 		Screen7.BoxesCount                = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Screen7+32)
MOVT	R0, #hi_addr(_Screen7+32)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,854 :: 		Screen7.Boxes_RoundCount          = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Screen7+40)
MOVT	R0, #hi_addr(_Screen7+40)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,855 :: 		Screen7.RadioButtonsCount         = 12;
MOVS	R1, #12
MOVW	R0, #lo_addr(_Screen7+48)
MOVT	R0, #hi_addr(_Screen7+48)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,856 :: 		Screen7.RadioButtons              = Screen7_RadioButtons;
MOVW	R1, #lo_addr(_Screen7_RadioButtons+0)
MOVT	R1, #hi_addr(_Screen7_RadioButtons+0)
MOVW	R0, #lo_addr(_Screen7+52)
MOVT	R0, #hi_addr(_Screen7+52)
STR	R1, [R0, #0]
;ECGsynthetic_driver.c,857 :: 		Screen7.ObjectsCount              = 17;
MOVS	R1, #17
MOVW	R0, #lo_addr(_Screen7+6)
MOVT	R0, #hi_addr(_Screen7+6)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,858 :: 		Screen7.OnSwipeUpPtr    = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Screen7+64)
MOVT	R0, #hi_addr(_Screen7+64)
STR	R1, [R0, #0]
;ECGsynthetic_driver.c,859 :: 		Screen7.OnSwipeDownPtr  = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Screen7+68)
MOVT	R0, #hi_addr(_Screen7+68)
STR	R1, [R0, #0]
;ECGsynthetic_driver.c,860 :: 		Screen7.OnSwipeLeftPtr  = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Screen7+56)
MOVT	R0, #hi_addr(_Screen7+56)
STR	R1, [R0, #0]
;ECGsynthetic_driver.c,861 :: 		Screen7.OnSwipeRightPtr = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Screen7+60)
MOVT	R0, #hi_addr(_Screen7+60)
STR	R1, [R0, #0]
;ECGsynthetic_driver.c,862 :: 		Screen7.OnZoomInPtr     = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Screen7+72)
MOVT	R0, #hi_addr(_Screen7+72)
STR	R1, [R0, #0]
;ECGsynthetic_driver.c,863 :: 		Screen7.OnZoomOutPtr    = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Screen7+76)
MOVT	R0, #hi_addr(_Screen7+76)
STR	R1, [R0, #0]
;ECGsynthetic_driver.c,865 :: 		Screen8.Color                     = 0xFFFF;
MOVW	R1, #65535
MOVW	R0, #lo_addr(_Screen8+0)
MOVT	R0, #hi_addr(_Screen8+0)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,866 :: 		Screen8.Width                     = 800;
MOVW	R1, #800
MOVW	R0, #lo_addr(_Screen8+2)
MOVT	R0, #hi_addr(_Screen8+2)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,867 :: 		Screen8.Height                    = 480;
MOVW	R1, #480
MOVW	R0, #lo_addr(_Screen8+4)
MOVT	R0, #hi_addr(_Screen8+4)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,868 :: 		Screen8.Buttons_RoundCount        = 6;
MOVS	R1, #6
MOVW	R0, #lo_addr(_Screen8+8)
MOVT	R0, #hi_addr(_Screen8+8)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,869 :: 		Screen8.Buttons_Round             = Screen8_Buttons_Round;
MOVW	R1, #lo_addr(_Screen8_Buttons_Round+0)
MOVT	R1, #hi_addr(_Screen8_Buttons_Round+0)
MOVW	R0, #lo_addr(_Screen8+12)
MOVT	R0, #hi_addr(_Screen8+12)
STR	R1, [R0, #0]
;ECGsynthetic_driver.c,870 :: 		Screen8.LabelsCount               = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Screen8+16)
MOVT	R0, #hi_addr(_Screen8+16)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,871 :: 		Screen8.Labels                    = Screen8_Labels;
MOVW	R1, #lo_addr(_Screen8_Labels+0)
MOVT	R1, #hi_addr(_Screen8_Labels+0)
MOVW	R0, #lo_addr(_Screen8+20)
MOVT	R0, #hi_addr(_Screen8+20)
STR	R1, [R0, #0]
;ECGsynthetic_driver.c,872 :: 		Screen8.ImagesCount               = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Screen8+24)
MOVT	R0, #hi_addr(_Screen8+24)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,873 :: 		Screen8.BoxesCount                = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Screen8+32)
MOVT	R0, #hi_addr(_Screen8+32)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,874 :: 		Screen8.Boxes                     = Screen8_Boxes;
MOVW	R1, #lo_addr(_Screen8_Boxes+0)
MOVT	R1, #hi_addr(_Screen8_Boxes+0)
MOVW	R0, #lo_addr(_Screen8+36)
MOVT	R0, #hi_addr(_Screen8+36)
STR	R1, [R0, #0]
;ECGsynthetic_driver.c,875 :: 		Screen8.Boxes_RoundCount          = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Screen8+40)
MOVT	R0, #hi_addr(_Screen8+40)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,876 :: 		Screen8.RadioButtonsCount         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Screen8+48)
MOVT	R0, #hi_addr(_Screen8+48)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,877 :: 		Screen8.ObjectsCount              = 8;
MOVS	R1, #8
MOVW	R0, #lo_addr(_Screen8+6)
MOVT	R0, #hi_addr(_Screen8+6)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,878 :: 		Screen8.OnSwipeUpPtr    = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Screen8+64)
MOVT	R0, #hi_addr(_Screen8+64)
STR	R1, [R0, #0]
;ECGsynthetic_driver.c,879 :: 		Screen8.OnSwipeDownPtr  = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Screen8+68)
MOVT	R0, #hi_addr(_Screen8+68)
STR	R1, [R0, #0]
;ECGsynthetic_driver.c,880 :: 		Screen8.OnSwipeLeftPtr  = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Screen8+56)
MOVT	R0, #hi_addr(_Screen8+56)
STR	R1, [R0, #0]
;ECGsynthetic_driver.c,881 :: 		Screen8.OnSwipeRightPtr = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Screen8+60)
MOVT	R0, #hi_addr(_Screen8+60)
STR	R1, [R0, #0]
;ECGsynthetic_driver.c,882 :: 		Screen8.OnZoomInPtr     = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Screen8+72)
MOVT	R0, #hi_addr(_Screen8+72)
STR	R1, [R0, #0]
;ECGsynthetic_driver.c,883 :: 		Screen8.OnZoomOutPtr    = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Screen8+76)
MOVT	R0, #hi_addr(_Screen8+76)
STR	R1, [R0, #0]
;ECGsynthetic_driver.c,886 :: 		Box3.OwnerScreen     = &Screen1;
MOVW	R1, #lo_addr(_Screen1+0)
MOVT	R1, #hi_addr(_Screen1+0)
MOVW	R0, #lo_addr(_Box3+0)
MOVT	R0, #hi_addr(_Box3+0)
STR	R1, [R0, #0]
;ECGsynthetic_driver.c,887 :: 		Box3.Order           = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Box3+4)
MOVT	R0, #hi_addr(_Box3+4)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,888 :: 		Box3.Left            = 33;
MOVS	R1, #33
MOVW	R0, #lo_addr(_Box3+6)
MOVT	R0, #hi_addr(_Box3+6)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,889 :: 		Box3.Top             = 35;
MOVS	R1, #35
MOVW	R0, #lo_addr(_Box3+8)
MOVT	R0, #hi_addr(_Box3+8)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,890 :: 		Box3.Width           = 447;
MOVW	R1, #447
MOVW	R0, #lo_addr(_Box3+10)
MOVT	R0, #hi_addr(_Box3+10)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,891 :: 		Box3.Height          = 407;
MOVW	R1, #407
MOVW	R0, #lo_addr(_Box3+12)
MOVT	R0, #hi_addr(_Box3+12)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,892 :: 		Box3.Pen_Width       = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Box3+14)
MOVT	R0, #hi_addr(_Box3+14)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,893 :: 		Box3.Pen_Color       = 0x0000;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Box3+16)
MOVT	R0, #hi_addr(_Box3+16)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,894 :: 		Box3.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Box3+18)
MOVT	R0, #hi_addr(_Box3+18)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,895 :: 		Box3.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Box3+19)
MOVT	R0, #hi_addr(_Box3+19)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,896 :: 		Box3.Transparent     = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Box3+20)
MOVT	R0, #hi_addr(_Box3+20)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,897 :: 		Box3.Gradient        = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Box3+21)
MOVT	R0, #hi_addr(_Box3+21)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,898 :: 		Box3.Gradient_Orientation = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Box3+22)
MOVT	R0, #hi_addr(_Box3+22)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,899 :: 		Box3.Gradient_Start_Color = 0xFFFF;
MOVW	R1, #65535
MOVW	R0, #lo_addr(_Box3+24)
MOVT	R0, #hi_addr(_Box3+24)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,900 :: 		Box3.Gradient_End_Color = 0xC618;
MOVW	R1, #50712
MOVW	R0, #lo_addr(_Box3+26)
MOVT	R0, #hi_addr(_Box3+26)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,901 :: 		Box3.Color           = 0x000C;
MOVS	R1, #12
MOVW	R0, #lo_addr(_Box3+28)
MOVT	R0, #hi_addr(_Box3+28)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,902 :: 		Box3.PressColEnabled = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Box3+30)
MOVT	R0, #hi_addr(_Box3+30)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,903 :: 		Box3.Press_Color     = 0xE71C;
MOVW	R1, #59164
MOVW	R0, #lo_addr(_Box3+32)
MOVT	R0, #hi_addr(_Box3+32)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,905 :: 		Label1.OwnerScreen     = &Screen1;
MOVW	R1, #lo_addr(_Screen1+0)
MOVT	R1, #hi_addr(_Screen1+0)
MOVW	R0, #lo_addr(_Label1+0)
MOVT	R0, #hi_addr(_Label1+0)
STR	R1, [R0, #0]
;ECGsynthetic_driver.c,906 :: 		Label1.Order           = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Label1+4)
MOVT	R0, #hi_addr(_Label1+4)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,907 :: 		Label1.Left            = 528;
MOVW	R1, #528
MOVW	R0, #lo_addr(_Label1+6)
MOVT	R0, #hi_addr(_Label1+6)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,908 :: 		Label1.Top             = 168;
MOVS	R1, #168
MOVW	R0, #lo_addr(_Label1+8)
MOVT	R0, #hi_addr(_Label1+8)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,909 :: 		Label1.Width           = 184;
MOVS	R1, #184
MOVW	R0, #lo_addr(_Label1+10)
MOVT	R0, #hi_addr(_Label1+10)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,910 :: 		Label1.Height          = 21;
MOVS	R1, #21
MOVW	R0, #lo_addr(_Label1+12)
MOVT	R0, #hi_addr(_Label1+12)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,911 :: 		Label1.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Label1+27)
MOVT	R0, #hi_addr(_Label1+27)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,912 :: 		Label1.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Label1+28)
MOVT	R0, #hi_addr(_Label1+28)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,913 :: 		Label1.Caption         = Label1_Caption;
MOVW	R1, #lo_addr(_Label1_Caption+0)
MOVT	R1, #hi_addr(_Label1_Caption+0)
MOVW	R0, #lo_addr(_Label1+16)
MOVT	R0, #hi_addr(_Label1+16)
STR	R1, [R0, #0]
;ECGsynthetic_driver.c,914 :: 		Label1.FontName        = Tahoma19x19_Bold;
MOVW	R4, #lo_addr(_Tahoma19x19_Bold+0)
MOVT	R4, #hi_addr(_Tahoma19x19_Bold+0)
MOVW	R0, #lo_addr(_Label1+20)
MOVT	R0, #hi_addr(_Label1+20)
STR	R4, [R0, #0]
;ECGsynthetic_driver.c,915 :: 		Label1.Font_Color      = 0x0000;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label1+24)
MOVT	R0, #hi_addr(_Label1+24)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,916 :: 		Label1.VerticalText    = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label1+26)
MOVT	R0, #hi_addr(_Label1+26)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,918 :: 		ButtonRound1.OwnerScreen     = &Screen1;
MOVW	R1, #lo_addr(_Screen1+0)
MOVT	R1, #hi_addr(_Screen1+0)
MOVW	R0, #lo_addr(_ButtonRound1+0)
MOVT	R0, #hi_addr(_ButtonRound1+0)
STR	R1, [R0, #0]
;ECGsynthetic_driver.c,919 :: 		ButtonRound1.Order           = 2;
MOVS	R1, #2
MOVW	R0, #lo_addr(_ButtonRound1+4)
MOVT	R0, #hi_addr(_ButtonRound1+4)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,920 :: 		ButtonRound1.Left            = 559;
MOVW	R1, #559
MOVW	R0, #lo_addr(_ButtonRound1+6)
MOVT	R0, #hi_addr(_ButtonRound1+6)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,921 :: 		ButtonRound1.Top             = 200;
MOVS	R1, #200
MOVW	R0, #lo_addr(_ButtonRound1+8)
MOVT	R0, #hi_addr(_ButtonRound1+8)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,922 :: 		ButtonRound1.Width           = 114;
MOVS	R1, #114
MOVW	R0, #lo_addr(_ButtonRound1+10)
MOVT	R0, #hi_addr(_ButtonRound1+10)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,923 :: 		ButtonRound1.Height          = 53;
MOVS	R1, #53
MOVW	R0, #lo_addr(_ButtonRound1+12)
MOVT	R0, #hi_addr(_ButtonRound1+12)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,924 :: 		ButtonRound1.Pen_Width       = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_ButtonRound1+14)
MOVT	R0, #hi_addr(_ButtonRound1+14)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,925 :: 		ButtonRound1.Pen_Color       = 0x0000;
MOVS	R1, #0
MOVW	R0, #lo_addr(_ButtonRound1+16)
MOVT	R0, #hi_addr(_ButtonRound1+16)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,926 :: 		ButtonRound1.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_ButtonRound1+18)
MOVT	R0, #hi_addr(_ButtonRound1+18)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,927 :: 		ButtonRound1.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_ButtonRound1+19)
MOVT	R0, #hi_addr(_ButtonRound1+19)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,928 :: 		ButtonRound1.Transparent     = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_ButtonRound1+20)
MOVT	R0, #hi_addr(_ButtonRound1+20)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,929 :: 		ButtonRound1.Caption         = ButtonRound1_Caption;
MOVW	R1, #lo_addr(_ButtonRound1_Caption+0)
MOVT	R1, #hi_addr(_ButtonRound1_Caption+0)
MOVW	R0, #lo_addr(_ButtonRound1+24)
MOVT	R0, #hi_addr(_ButtonRound1+24)
STR	R1, [R0, #0]
;ECGsynthetic_driver.c,930 :: 		ButtonRound1.TextAlign       = _taCenter;
MOVS	R1, #1
MOVW	R0, #lo_addr(_ButtonRound1+28)
MOVT	R0, #hi_addr(_ButtonRound1+28)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,931 :: 		ButtonRound1.TextAlignVertical= _tavMiddle;
MOVS	R1, #1
MOVW	R0, #lo_addr(_ButtonRound1+29)
MOVT	R0, #hi_addr(_ButtonRound1+29)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,932 :: 		ButtonRound1.FontName        = Tahoma19x23_Regular;
MOVW	R3, #lo_addr(_Tahoma19x23_Regular+0)
MOVT	R3, #hi_addr(_Tahoma19x23_Regular+0)
MOVW	R0, #lo_addr(_ButtonRound1+32)
MOVT	R0, #hi_addr(_ButtonRound1+32)
STR	R3, [R0, #0]
;ECGsynthetic_driver.c,933 :: 		ButtonRound1.PressColEnabled = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_ButtonRound1+49)
MOVT	R0, #hi_addr(_ButtonRound1+49)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,934 :: 		ButtonRound1.Font_Color      = 0xFFFF;
MOVW	R1, #65535
MOVW	R0, #lo_addr(_ButtonRound1+36)
MOVT	R0, #hi_addr(_ButtonRound1+36)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,935 :: 		ButtonRound1.VerticalText    = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_ButtonRound1+38)
MOVT	R0, #hi_addr(_ButtonRound1+38)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,936 :: 		ButtonRound1.Gradient        = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_ButtonRound1+39)
MOVT	R0, #hi_addr(_ButtonRound1+39)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,937 :: 		ButtonRound1.Gradient_Orientation = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_ButtonRound1+40)
MOVT	R0, #hi_addr(_ButtonRound1+40)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,938 :: 		ButtonRound1.Gradient_Start_Color = 0xFFFF;
MOVW	R1, #65535
MOVW	R0, #lo_addr(_ButtonRound1+42)
MOVT	R0, #hi_addr(_ButtonRound1+42)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,939 :: 		ButtonRound1.Gradient_End_Color = 0xC618;
MOVW	R1, #50712
MOVW	R0, #lo_addr(_ButtonRound1+44)
MOVT	R0, #hi_addr(_ButtonRound1+44)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,940 :: 		ButtonRound1.Color           = 0x3013;
MOVW	R1, #12307
MOVW	R0, #lo_addr(_ButtonRound1+46)
MOVT	R0, #hi_addr(_ButtonRound1+46)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,941 :: 		ButtonRound1.Press_Color     = 0xE71C;
MOVW	R1, #59164
MOVW	R0, #lo_addr(_ButtonRound1+50)
MOVT	R0, #hi_addr(_ButtonRound1+50)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,942 :: 		ButtonRound1.Corner_Radius   = 3;
MOVS	R1, #3
MOVW	R0, #lo_addr(_ButtonRound1+48)
MOVT	R0, #hi_addr(_ButtonRound1+48)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,943 :: 		ButtonRound1.OnClickPtr      = ButtonRound1OnClick;
MOVW	R1, #lo_addr(_ButtonRound1OnClick+0)
MOVT	R1, #hi_addr(_ButtonRound1OnClick+0)
MOVW	R0, #lo_addr(_ButtonRound1+60)
MOVT	R0, #hi_addr(_ButtonRound1+60)
STR	R1, [R0, #0]
;ECGsynthetic_driver.c,945 :: 		ButtonRound2.OwnerScreen     = &Screen1;
MOVW	R1, #lo_addr(_Screen1+0)
MOVT	R1, #hi_addr(_Screen1+0)
MOVW	R0, #lo_addr(_ButtonRound2+0)
MOVT	R0, #hi_addr(_ButtonRound2+0)
STR	R1, [R0, #0]
;ECGsynthetic_driver.c,946 :: 		ButtonRound2.Order           = 3;
MOVS	R1, #3
MOVW	R0, #lo_addr(_ButtonRound2+4)
MOVT	R0, #hi_addr(_ButtonRound2+4)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,947 :: 		ButtonRound2.Left            = 558;
MOVW	R1, #558
MOVW	R0, #lo_addr(_ButtonRound2+6)
MOVT	R0, #hi_addr(_ButtonRound2+6)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,948 :: 		ButtonRound2.Top             = 267;
MOVW	R1, #267
MOVW	R0, #lo_addr(_ButtonRound2+8)
MOVT	R0, #hi_addr(_ButtonRound2+8)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,949 :: 		ButtonRound2.Width           = 114;
MOVS	R1, #114
MOVW	R0, #lo_addr(_ButtonRound2+10)
MOVT	R0, #hi_addr(_ButtonRound2+10)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,950 :: 		ButtonRound2.Height          = 53;
MOVS	R1, #53
MOVW	R0, #lo_addr(_ButtonRound2+12)
MOVT	R0, #hi_addr(_ButtonRound2+12)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,951 :: 		ButtonRound2.Pen_Width       = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_ButtonRound2+14)
MOVT	R0, #hi_addr(_ButtonRound2+14)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,952 :: 		ButtonRound2.Pen_Color       = 0x3013;
MOVW	R1, #12307
MOVW	R0, #lo_addr(_ButtonRound2+16)
MOVT	R0, #hi_addr(_ButtonRound2+16)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,953 :: 		ButtonRound2.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_ButtonRound2+18)
MOVT	R0, #hi_addr(_ButtonRound2+18)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,954 :: 		ButtonRound2.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_ButtonRound2+19)
MOVT	R0, #hi_addr(_ButtonRound2+19)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,955 :: 		ButtonRound2.Transparent     = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_ButtonRound2+20)
MOVT	R0, #hi_addr(_ButtonRound2+20)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,956 :: 		ButtonRound2.Caption         = ButtonRound2_Caption;
MOVW	R1, #lo_addr(_ButtonRound2_Caption+0)
MOVT	R1, #hi_addr(_ButtonRound2_Caption+0)
MOVW	R0, #lo_addr(_ButtonRound2+24)
MOVT	R0, #hi_addr(_ButtonRound2+24)
STR	R1, [R0, #0]
;ECGsynthetic_driver.c,957 :: 		ButtonRound2.TextAlign       = _taCenter;
MOVS	R1, #1
MOVW	R0, #lo_addr(_ButtonRound2+28)
MOVT	R0, #hi_addr(_ButtonRound2+28)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,958 :: 		ButtonRound2.TextAlignVertical= _tavMiddle;
MOVS	R1, #1
MOVW	R0, #lo_addr(_ButtonRound2+29)
MOVT	R0, #hi_addr(_ButtonRound2+29)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,959 :: 		ButtonRound2.FontName        = Tahoma19x23_Regular;
MOVW	R0, #lo_addr(_ButtonRound2+32)
MOVT	R0, #hi_addr(_ButtonRound2+32)
STR	R3, [R0, #0]
;ECGsynthetic_driver.c,960 :: 		ButtonRound2.PressColEnabled = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_ButtonRound2+49)
MOVT	R0, #hi_addr(_ButtonRound2+49)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,961 :: 		ButtonRound2.Font_Color      = 0xFFFF;
MOVW	R1, #65535
MOVW	R0, #lo_addr(_ButtonRound2+36)
MOVT	R0, #hi_addr(_ButtonRound2+36)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,962 :: 		ButtonRound2.VerticalText    = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_ButtonRound2+38)
MOVT	R0, #hi_addr(_ButtonRound2+38)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,963 :: 		ButtonRound2.Gradient        = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_ButtonRound2+39)
MOVT	R0, #hi_addr(_ButtonRound2+39)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,964 :: 		ButtonRound2.Gradient_Orientation = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_ButtonRound2+40)
MOVT	R0, #hi_addr(_ButtonRound2+40)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,965 :: 		ButtonRound2.Gradient_Start_Color = 0xFFFF;
MOVW	R1, #65535
MOVW	R0, #lo_addr(_ButtonRound2+42)
MOVT	R0, #hi_addr(_ButtonRound2+42)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,966 :: 		ButtonRound2.Gradient_End_Color = 0xC618;
MOVW	R1, #50712
MOVW	R0, #lo_addr(_ButtonRound2+44)
MOVT	R0, #hi_addr(_ButtonRound2+44)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,967 :: 		ButtonRound2.Color           = 0x3013;
MOVW	R1, #12307
MOVW	R0, #lo_addr(_ButtonRound2+46)
MOVT	R0, #hi_addr(_ButtonRound2+46)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,968 :: 		ButtonRound2.Press_Color     = 0xE71C;
MOVW	R1, #59164
MOVW	R0, #lo_addr(_ButtonRound2+50)
MOVT	R0, #hi_addr(_ButtonRound2+50)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,969 :: 		ButtonRound2.Corner_Radius   = 3;
MOVS	R1, #3
MOVW	R0, #lo_addr(_ButtonRound2+48)
MOVT	R0, #hi_addr(_ButtonRound2+48)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,970 :: 		ButtonRound2.OnClickPtr      = ButtonRound2OnClick;
MOVW	R1, #lo_addr(_ButtonRound2OnClick+0)
MOVT	R1, #hi_addr(_ButtonRound2OnClick+0)
MOVW	R0, #lo_addr(_ButtonRound2+60)
MOVT	R0, #hi_addr(_ButtonRound2+60)
STR	R1, [R0, #0]
;ECGsynthetic_driver.c,972 :: 		Label2.OwnerScreen     = &Screen1;
MOVW	R1, #lo_addr(_Screen1+0)
MOVT	R1, #hi_addr(_Screen1+0)
MOVW	R0, #lo_addr(_Label2+0)
MOVT	R0, #hi_addr(_Label2+0)
STR	R1, [R0, #0]
;ECGsynthetic_driver.c,973 :: 		Label2.Order           = 4;
MOVS	R1, #4
MOVW	R0, #lo_addr(_Label2+4)
MOVT	R0, #hi_addr(_Label2+4)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,974 :: 		Label2.Left            = 42;
MOVS	R1, #42
MOVW	R0, #lo_addr(_Label2+6)
MOVT	R0, #hi_addr(_Label2+6)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,975 :: 		Label2.Top             = 148;
MOVS	R1, #148
MOVW	R0, #lo_addr(_Label2+8)
MOVT	R0, #hi_addr(_Label2+8)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,976 :: 		Label2.Width           = 149;
MOVS	R1, #149
MOVW	R0, #lo_addr(_Label2+10)
MOVT	R0, #hi_addr(_Label2+10)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,977 :: 		Label2.Height          = 20;
MOVS	R1, #20
MOVW	R0, #lo_addr(_Label2+12)
MOVT	R0, #hi_addr(_Label2+12)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,978 :: 		Label2.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Label2+27)
MOVT	R0, #hi_addr(_Label2+27)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,979 :: 		Label2.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Label2+28)
MOVT	R0, #hi_addr(_Label2+28)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,980 :: 		Label2.Caption         = Label2_Caption;
MOVW	R1, #lo_addr(_Label2_Caption+0)
MOVT	R1, #hi_addr(_Label2_Caption+0)
MOVW	R0, #lo_addr(_Label2+16)
MOVT	R0, #hi_addr(_Label2+16)
STR	R1, [R0, #0]
;ECGsynthetic_driver.c,981 :: 		Label2.FontName        = Tahoma15x18_Regular;
MOVW	R2, #lo_addr(_Tahoma15x18_Regular+0)
MOVT	R2, #hi_addr(_Tahoma15x18_Regular+0)
MOVW	R0, #lo_addr(_Label2+20)
MOVT	R0, #hi_addr(_Label2+20)
STR	R2, [R0, #0]
;ECGsynthetic_driver.c,982 :: 		Label2.Font_Color      = 0xFFFF;
MOVW	R1, #65535
MOVW	R0, #lo_addr(_Label2+24)
MOVT	R0, #hi_addr(_Label2+24)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,983 :: 		Label2.VerticalText    = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label2+26)
MOVT	R0, #hi_addr(_Label2+26)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,985 :: 		Label3.OwnerScreen     = &Screen1;
MOVW	R1, #lo_addr(_Screen1+0)
MOVT	R1, #hi_addr(_Screen1+0)
MOVW	R0, #lo_addr(_Label3+0)
MOVT	R0, #hi_addr(_Label3+0)
STR	R1, [R0, #0]
;ECGsynthetic_driver.c,986 :: 		Label3.Order           = 5;
MOVS	R1, #5
MOVW	R0, #lo_addr(_Label3+4)
MOVT	R0, #hi_addr(_Label3+4)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,987 :: 		Label3.Left            = 42;
MOVS	R1, #42
MOVW	R0, #lo_addr(_Label3+6)
MOVT	R0, #hi_addr(_Label3+6)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,988 :: 		Label3.Top             = 168;
MOVS	R1, #168
MOVW	R0, #lo_addr(_Label3+8)
MOVT	R0, #hi_addr(_Label3+8)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,989 :: 		Label3.Width           = 123;
MOVS	R1, #123
MOVW	R0, #lo_addr(_Label3+10)
MOVT	R0, #hi_addr(_Label3+10)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,990 :: 		Label3.Height          = 20;
MOVS	R1, #20
MOVW	R0, #lo_addr(_Label3+12)
MOVT	R0, #hi_addr(_Label3+12)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,991 :: 		Label3.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Label3+27)
MOVT	R0, #hi_addr(_Label3+27)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,992 :: 		Label3.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Label3+28)
MOVT	R0, #hi_addr(_Label3+28)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,993 :: 		Label3.Caption         = Label3_Caption;
MOVW	R1, #lo_addr(_Label3_Caption+0)
MOVT	R1, #hi_addr(_Label3_Caption+0)
MOVW	R0, #lo_addr(_Label3+16)
MOVT	R0, #hi_addr(_Label3+16)
STR	R1, [R0, #0]
;ECGsynthetic_driver.c,994 :: 		Label3.FontName        = Tahoma15x18_Regular;
MOVW	R0, #lo_addr(_Label3+20)
MOVT	R0, #hi_addr(_Label3+20)
STR	R2, [R0, #0]
;ECGsynthetic_driver.c,995 :: 		Label3.Font_Color      = 0xFFFF;
MOVW	R1, #65535
MOVW	R0, #lo_addr(_Label3+24)
MOVT	R0, #hi_addr(_Label3+24)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,996 :: 		Label3.VerticalText    = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label3+26)
MOVT	R0, #hi_addr(_Label3+26)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,998 :: 		Label4.OwnerScreen     = &Screen1;
MOVW	R1, #lo_addr(_Screen1+0)
MOVT	R1, #hi_addr(_Screen1+0)
MOVW	R0, #lo_addr(_Label4+0)
MOVT	R0, #hi_addr(_Label4+0)
STR	R1, [R0, #0]
;ECGsynthetic_driver.c,999 :: 		Label4.Order           = 6;
MOVS	R1, #6
MOVW	R0, #lo_addr(_Label4+4)
MOVT	R0, #hi_addr(_Label4+4)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,1000 :: 		Label4.Left            = 42;
MOVS	R1, #42
MOVW	R0, #lo_addr(_Label4+6)
MOVT	R0, #hi_addr(_Label4+6)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,1001 :: 		Label4.Top             = 214;
MOVS	R1, #214
MOVW	R0, #lo_addr(_Label4+8)
MOVT	R0, #hi_addr(_Label4+8)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,1002 :: 		Label4.Width           = 344;
MOVW	R1, #344
MOVW	R0, #lo_addr(_Label4+10)
MOVT	R0, #hi_addr(_Label4+10)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,1003 :: 		Label4.Height          = 20;
MOVS	R1, #20
MOVW	R0, #lo_addr(_Label4+12)
MOVT	R0, #hi_addr(_Label4+12)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,1004 :: 		Label4.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Label4+27)
MOVT	R0, #hi_addr(_Label4+27)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,1005 :: 		Label4.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Label4+28)
MOVT	R0, #hi_addr(_Label4+28)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,1006 :: 		Label4.Caption         = Label4_Caption;
MOVW	R1, #lo_addr(_Label4_Caption+0)
MOVT	R1, #hi_addr(_Label4_Caption+0)
MOVW	R0, #lo_addr(_Label4+16)
MOVT	R0, #hi_addr(_Label4+16)
STR	R1, [R0, #0]
;ECGsynthetic_driver.c,1007 :: 		Label4.FontName        = Tahoma15x18_Regular;
MOVW	R0, #lo_addr(_Label4+20)
MOVT	R0, #hi_addr(_Label4+20)
STR	R2, [R0, #0]
;ECGsynthetic_driver.c,1008 :: 		Label4.Font_Color      = 0xFFFF;
MOVW	R1, #65535
MOVW	R0, #lo_addr(_Label4+24)
MOVT	R0, #hi_addr(_Label4+24)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,1009 :: 		Label4.VerticalText    = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label4+26)
MOVT	R0, #hi_addr(_Label4+26)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,1011 :: 		Label5.OwnerScreen     = &Screen1;
MOVW	R1, #lo_addr(_Screen1+0)
MOVT	R1, #hi_addr(_Screen1+0)
MOVW	R0, #lo_addr(_Label5+0)
MOVT	R0, #hi_addr(_Label5+0)
STR	R1, [R0, #0]
;ECGsynthetic_driver.c,1012 :: 		Label5.Order           = 7;
MOVS	R1, #7
MOVW	R0, #lo_addr(_Label5+4)
MOVT	R0, #hi_addr(_Label5+4)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,1013 :: 		Label5.Left            = 42;
MOVS	R1, #42
MOVW	R0, #lo_addr(_Label5+6)
MOVT	R0, #hi_addr(_Label5+6)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,1014 :: 		Label5.Top             = 236;
MOVS	R1, #236
MOVW	R0, #lo_addr(_Label5+8)
MOVT	R0, #hi_addr(_Label5+8)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,1015 :: 		Label5.Width           = 357;
MOVW	R1, #357
MOVW	R0, #lo_addr(_Label5+10)
MOVT	R0, #hi_addr(_Label5+10)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,1016 :: 		Label5.Height          = 20;
MOVS	R1, #20
MOVW	R0, #lo_addr(_Label5+12)
MOVT	R0, #hi_addr(_Label5+12)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,1017 :: 		Label5.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Label5+27)
MOVT	R0, #hi_addr(_Label5+27)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,1018 :: 		Label5.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Label5+28)
MOVT	R0, #hi_addr(_Label5+28)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,1019 :: 		Label5.Caption         = Label5_Caption;
MOVW	R1, #lo_addr(_Label5_Caption+0)
MOVT	R1, #hi_addr(_Label5_Caption+0)
MOVW	R0, #lo_addr(_Label5+16)
MOVT	R0, #hi_addr(_Label5+16)
STR	R1, [R0, #0]
;ECGsynthetic_driver.c,1020 :: 		Label5.FontName        = Tahoma15x18_Regular;
MOVW	R0, #lo_addr(_Label5+20)
MOVT	R0, #hi_addr(_Label5+20)
STR	R2, [R0, #0]
;ECGsynthetic_driver.c,1021 :: 		Label5.Font_Color      = 0xFFFF;
MOVW	R1, #65535
MOVW	R0, #lo_addr(_Label5+24)
MOVT	R0, #hi_addr(_Label5+24)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,1022 :: 		Label5.VerticalText    = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label5+26)
MOVT	R0, #hi_addr(_Label5+26)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,1024 :: 		Label6.OwnerScreen     = &Screen1;
MOVW	R1, #lo_addr(_Screen1+0)
MOVT	R1, #hi_addr(_Screen1+0)
MOVW	R0, #lo_addr(_Label6+0)
MOVT	R0, #hi_addr(_Label6+0)
STR	R1, [R0, #0]
;ECGsynthetic_driver.c,1025 :: 		Label6.Order           = 8;
MOVS	R1, #8
MOVW	R0, #lo_addr(_Label6+4)
MOVT	R0, #hi_addr(_Label6+4)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,1026 :: 		Label6.Left            = 42;
MOVS	R1, #42
MOVW	R0, #lo_addr(_Label6+6)
MOVT	R0, #hi_addr(_Label6+6)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,1027 :: 		Label6.Top             = 286;
MOVW	R1, #286
MOVW	R0, #lo_addr(_Label6+8)
MOVT	R0, #hi_addr(_Label6+8)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,1028 :: 		Label6.Width           = 246;
MOVS	R1, #246
MOVW	R0, #lo_addr(_Label6+10)
MOVT	R0, #hi_addr(_Label6+10)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,1029 :: 		Label6.Height          = 20;
MOVS	R1, #20
MOVW	R0, #lo_addr(_Label6+12)
MOVT	R0, #hi_addr(_Label6+12)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,1030 :: 		Label6.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Label6+27)
MOVT	R0, #hi_addr(_Label6+27)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,1031 :: 		Label6.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Label6+28)
MOVT	R0, #hi_addr(_Label6+28)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,1032 :: 		Label6.Caption         = Label6_Caption;
MOVW	R1, #lo_addr(_Label6_Caption+0)
MOVT	R1, #hi_addr(_Label6_Caption+0)
MOVW	R0, #lo_addr(_Label6+16)
MOVT	R0, #hi_addr(_Label6+16)
STR	R1, [R0, #0]
;ECGsynthetic_driver.c,1033 :: 		Label6.FontName        = Tahoma15x18_Regular;
MOVW	R0, #lo_addr(_Label6+20)
MOVT	R0, #hi_addr(_Label6+20)
STR	R2, [R0, #0]
;ECGsynthetic_driver.c,1034 :: 		Label6.Font_Color      = 0xFFFF;
MOVW	R1, #65535
MOVW	R0, #lo_addr(_Label6+24)
MOVT	R0, #hi_addr(_Label6+24)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,1035 :: 		Label6.VerticalText    = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label6+26)
MOVT	R0, #hi_addr(_Label6+26)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,1037 :: 		Label7.OwnerScreen     = &Screen1;
MOVW	R1, #lo_addr(_Screen1+0)
MOVT	R1, #hi_addr(_Screen1+0)
MOVW	R0, #lo_addr(_Label7+0)
MOVT	R0, #hi_addr(_Label7+0)
STR	R1, [R0, #0]
;ECGsynthetic_driver.c,1038 :: 		Label7.Order           = 9;
MOVS	R1, #9
MOVW	R0, #lo_addr(_Label7+4)
MOVT	R0, #hi_addr(_Label7+4)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,1039 :: 		Label7.Left            = 42;
MOVS	R1, #42
MOVW	R0, #lo_addr(_Label7+6)
MOVT	R0, #hi_addr(_Label7+6)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,1040 :: 		Label7.Top             = 338;
MOVW	R1, #338
MOVW	R0, #lo_addr(_Label7+8)
MOVT	R0, #hi_addr(_Label7+8)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,1041 :: 		Label7.Width           = 119;
MOVS	R1, #119
MOVW	R0, #lo_addr(_Label7+10)
MOVT	R0, #hi_addr(_Label7+10)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,1042 :: 		Label7.Height          = 20;
MOVS	R1, #20
MOVW	R0, #lo_addr(_Label7+12)
MOVT	R0, #hi_addr(_Label7+12)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,1043 :: 		Label7.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Label7+27)
MOVT	R0, #hi_addr(_Label7+27)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,1044 :: 		Label7.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Label7+28)
MOVT	R0, #hi_addr(_Label7+28)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,1045 :: 		Label7.Caption         = Label7_Caption;
MOVW	R1, #lo_addr(_Label7_Caption+0)
MOVT	R1, #hi_addr(_Label7_Caption+0)
MOVW	R0, #lo_addr(_Label7+16)
MOVT	R0, #hi_addr(_Label7+16)
STR	R1, [R0, #0]
;ECGsynthetic_driver.c,1046 :: 		Label7.FontName        = Tahoma15x18_Regular;
MOVW	R0, #lo_addr(_Label7+20)
MOVT	R0, #hi_addr(_Label7+20)
STR	R2, [R0, #0]
;ECGsynthetic_driver.c,1047 :: 		Label7.Font_Color      = 0xFFFF;
MOVW	R1, #65535
MOVW	R0, #lo_addr(_Label7+24)
MOVT	R0, #hi_addr(_Label7+24)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,1048 :: 		Label7.VerticalText    = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label7+26)
MOVT	R0, #hi_addr(_Label7+26)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,1050 :: 		Label8.OwnerScreen     = &Screen1;
MOVW	R1, #lo_addr(_Screen1+0)
MOVT	R1, #hi_addr(_Screen1+0)
MOVW	R0, #lo_addr(_Label8+0)
MOVT	R0, #hi_addr(_Label8+0)
STR	R1, [R0, #0]
;ECGsynthetic_driver.c,1051 :: 		Label8.Order           = 10;
MOVS	R1, #10
MOVW	R0, #lo_addr(_Label8+4)
MOVT	R0, #hi_addr(_Label8+4)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,1052 :: 		Label8.Left            = 42;
MOVS	R1, #42
MOVW	R0, #lo_addr(_Label8+6)
MOVT	R0, #hi_addr(_Label8+6)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,1053 :: 		Label8.Top             = 358;
MOVW	R1, #358
MOVW	R0, #lo_addr(_Label8+8)
MOVT	R0, #hi_addr(_Label8+8)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,1054 :: 		Label8.Width           = 205;
MOVS	R1, #205
MOVW	R0, #lo_addr(_Label8+10)
MOVT	R0, #hi_addr(_Label8+10)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,1055 :: 		Label8.Height          = 20;
MOVS	R1, #20
MOVW	R0, #lo_addr(_Label8+12)
MOVT	R0, #hi_addr(_Label8+12)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,1056 :: 		Label8.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Label8+27)
MOVT	R0, #hi_addr(_Label8+27)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,1057 :: 		Label8.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Label8+28)
MOVT	R0, #hi_addr(_Label8+28)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,1058 :: 		Label8.Caption         = Label8_Caption;
MOVW	R1, #lo_addr(_Label8_Caption+0)
MOVT	R1, #hi_addr(_Label8_Caption+0)
MOVW	R0, #lo_addr(_Label8+16)
MOVT	R0, #hi_addr(_Label8+16)
STR	R1, [R0, #0]
;ECGsynthetic_driver.c,1059 :: 		Label8.FontName        = Tahoma15x18_Regular;
MOVW	R0, #lo_addr(_Label8+20)
MOVT	R0, #hi_addr(_Label8+20)
STR	R2, [R0, #0]
;ECGsynthetic_driver.c,1060 :: 		Label8.Font_Color      = 0xFFFF;
MOVW	R1, #65535
MOVW	R0, #lo_addr(_Label8+24)
MOVT	R0, #hi_addr(_Label8+24)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,1061 :: 		Label8.VerticalText    = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label8+26)
MOVT	R0, #hi_addr(_Label8+26)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,1063 :: 		Label9.OwnerScreen     = &Screen1;
MOVW	R1, #lo_addr(_Screen1+0)
MOVT	R1, #hi_addr(_Screen1+0)
MOVW	R0, #lo_addr(_Label9+0)
MOVT	R0, #hi_addr(_Label9+0)
STR	R1, [R0, #0]
;ECGsynthetic_driver.c,1064 :: 		Label9.Order           = 11;
MOVS	R1, #11
MOVW	R0, #lo_addr(_Label9+4)
MOVT	R0, #hi_addr(_Label9+4)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,1065 :: 		Label9.Left            = 42;
MOVS	R1, #42
MOVW	R0, #lo_addr(_Label9+6)
MOVT	R0, #hi_addr(_Label9+6)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,1066 :: 		Label9.Top             = 380;
MOVW	R1, #380
MOVW	R0, #lo_addr(_Label9+8)
MOVT	R0, #hi_addr(_Label9+8)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,1067 :: 		Label9.Width           = 349;
MOVW	R1, #349
MOVW	R0, #lo_addr(_Label9+10)
MOVT	R0, #hi_addr(_Label9+10)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,1068 :: 		Label9.Height          = 20;
MOVS	R1, #20
MOVW	R0, #lo_addr(_Label9+12)
MOVT	R0, #hi_addr(_Label9+12)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,1069 :: 		Label9.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Label9+27)
MOVT	R0, #hi_addr(_Label9+27)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,1070 :: 		Label9.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Label9+28)
MOVT	R0, #hi_addr(_Label9+28)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,1071 :: 		Label9.Caption         = Label9_Caption;
MOVW	R1, #lo_addr(_Label9_Caption+0)
MOVT	R1, #hi_addr(_Label9_Caption+0)
MOVW	R0, #lo_addr(_Label9+16)
MOVT	R0, #hi_addr(_Label9+16)
STR	R1, [R0, #0]
;ECGsynthetic_driver.c,1072 :: 		Label9.FontName        = Tahoma15x18_Regular;
MOVW	R0, #lo_addr(_Label9+20)
MOVT	R0, #hi_addr(_Label9+20)
STR	R2, [R0, #0]
;ECGsynthetic_driver.c,1073 :: 		Label9.Font_Color      = 0xFFFF;
MOVW	R1, #65535
MOVW	R0, #lo_addr(_Label9+24)
MOVT	R0, #hi_addr(_Label9+24)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,1074 :: 		Label9.VerticalText    = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label9+26)
MOVT	R0, #hi_addr(_Label9+26)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,1076 :: 		Label10.OwnerScreen     = &Screen1;
MOVW	R1, #lo_addr(_Screen1+0)
MOVT	R1, #hi_addr(_Screen1+0)
MOVW	R0, #lo_addr(_Label10+0)
MOVT	R0, #hi_addr(_Label10+0)
STR	R1, [R0, #0]
;ECGsynthetic_driver.c,1077 :: 		Label10.Order           = 12;
MOVS	R1, #12
MOVW	R0, #lo_addr(_Label10+4)
MOVT	R0, #hi_addr(_Label10+4)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,1078 :: 		Label10.Left            = 42;
MOVS	R1, #42
MOVW	R0, #lo_addr(_Label10+6)
MOVT	R0, #hi_addr(_Label10+6)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,1079 :: 		Label10.Top             = 402;
MOVW	R1, #402
MOVW	R0, #lo_addr(_Label10+8)
MOVT	R0, #hi_addr(_Label10+8)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,1080 :: 		Label10.Width           = 259;
MOVW	R1, #259
MOVW	R0, #lo_addr(_Label10+10)
MOVT	R0, #hi_addr(_Label10+10)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,1081 :: 		Label10.Height          = 20;
MOVS	R1, #20
MOVW	R0, #lo_addr(_Label10+12)
MOVT	R0, #hi_addr(_Label10+12)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,1082 :: 		Label10.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Label10+27)
MOVT	R0, #hi_addr(_Label10+27)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,1083 :: 		Label10.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Label10+28)
MOVT	R0, #hi_addr(_Label10+28)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,1084 :: 		Label10.Caption         = Label10_Caption;
MOVW	R1, #lo_addr(_Label10_Caption+0)
MOVT	R1, #hi_addr(_Label10_Caption+0)
MOVW	R0, #lo_addr(_Label10+16)
MOVT	R0, #hi_addr(_Label10+16)
STR	R1, [R0, #0]
;ECGsynthetic_driver.c,1085 :: 		Label10.FontName        = Tahoma15x18_Regular;
MOVW	R0, #lo_addr(_Label10+20)
MOVT	R0, #hi_addr(_Label10+20)
STR	R2, [R0, #0]
;ECGsynthetic_driver.c,1086 :: 		Label10.Font_Color      = 0xFFFF;
MOVW	R1, #65535
MOVW	R0, #lo_addr(_Label10+24)
MOVT	R0, #hi_addr(_Label10+24)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,1087 :: 		Label10.VerticalText    = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label10+26)
MOVT	R0, #hi_addr(_Label10+26)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,1089 :: 		Label11.OwnerScreen     = &Screen1;
MOVW	R1, #lo_addr(_Screen1+0)
MOVT	R1, #hi_addr(_Screen1+0)
MOVW	R0, #lo_addr(_Label11+0)
MOVT	R0, #hi_addr(_Label11+0)
STR	R1, [R0, #0]
;ECGsynthetic_driver.c,1090 :: 		Label11.Order           = 13;
MOVS	R1, #13
MOVW	R0, #lo_addr(_Label11+4)
MOVT	R0, #hi_addr(_Label11+4)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,1091 :: 		Label11.Left            = 42;
MOVS	R1, #42
MOVW	R0, #lo_addr(_Label11+6)
MOVT	R0, #hi_addr(_Label11+6)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,1092 :: 		Label11.Top             = 51;
MOVS	R1, #51
MOVW	R0, #lo_addr(_Label11+8)
MOVT	R0, #hi_addr(_Label11+8)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,1093 :: 		Label11.Width           = 370;
MOVW	R1, #370
MOVW	R0, #lo_addr(_Label11+10)
MOVT	R0, #hi_addr(_Label11+10)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,1094 :: 		Label11.Height          = 21;
MOVS	R1, #21
MOVW	R0, #lo_addr(_Label11+12)
MOVT	R0, #hi_addr(_Label11+12)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,1095 :: 		Label11.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Label11+27)
MOVT	R0, #hi_addr(_Label11+27)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,1096 :: 		Label11.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Label11+28)
MOVT	R0, #hi_addr(_Label11+28)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,1097 :: 		Label11.Caption         = Label11_Caption;
MOVW	R1, #lo_addr(_Label11_Caption+0)
MOVT	R1, #hi_addr(_Label11_Caption+0)
MOVW	R0, #lo_addr(_Label11+16)
MOVT	R0, #hi_addr(_Label11+16)
STR	R1, [R0, #0]
;ECGsynthetic_driver.c,1098 :: 		Label11.FontName        = Tahoma19x19_Bold;
MOVW	R0, #lo_addr(_Label11+20)
MOVT	R0, #hi_addr(_Label11+20)
STR	R4, [R0, #0]
;ECGsynthetic_driver.c,1099 :: 		Label11.Font_Color      = 0xFFFF;
MOVW	R1, #65535
MOVW	R0, #lo_addr(_Label11+24)
MOVT	R0, #hi_addr(_Label11+24)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,1100 :: 		Label11.VerticalText    = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label11+26)
MOVT	R0, #hi_addr(_Label11+26)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,1102 :: 		Image1.OwnerScreen     = &Screen1;
MOVW	R1, #lo_addr(_Screen1+0)
MOVT	R1, #hi_addr(_Screen1+0)
MOVW	R0, #lo_addr(_Image1+0)
MOVT	R0, #hi_addr(_Image1+0)
STR	R1, [R0, #0]
;ECGsynthetic_driver.c,1103 :: 		Image1.Order           = 14;
MOVS	R1, #14
MOVW	R0, #lo_addr(_Image1+4)
MOVT	R0, #hi_addr(_Image1+4)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,1104 :: 		Image1.Left            = 516;
MOVW	R1, #516
MOVW	R0, #lo_addr(_Image1+6)
MOVT	R0, #hi_addr(_Image1+6)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,1105 :: 		Image1.Top             = 39;
MOVS	R1, #39
MOVW	R0, #lo_addr(_Image1+8)
MOVT	R0, #hi_addr(_Image1+8)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,1106 :: 		Image1.Width           = 100;
MOVS	R1, #100
MOVW	R0, #lo_addr(_Image1+10)
MOVT	R0, #hi_addr(_Image1+10)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,1107 :: 		Image1.Height          = 100;
MOVS	R1, #100
MOVW	R0, #lo_addr(_Image1+12)
MOVT	R0, #hi_addr(_Image1+12)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,1108 :: 		Image1.Picture_Type    = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image1+22)
MOVT	R0, #hi_addr(_Image1+22)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,1109 :: 		Image1.Picture_Ratio   = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image1+23)
MOVT	R0, #hi_addr(_Image1+23)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,1110 :: 		Image1.Picture_Name    = ITS1_jpg;
MOVW	R1, #lo_addr(_ITS1_jpg+0)
MOVT	R1, #hi_addr(_ITS1_jpg+0)
MOVW	R0, #lo_addr(_Image1+16)
MOVT	R0, #hi_addr(_Image1+16)
STR	R1, [R0, #0]
;ECGsynthetic_driver.c,1111 :: 		Image1.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image1+20)
MOVT	R0, #hi_addr(_Image1+20)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,1112 :: 		Image1.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image1+21)
MOVT	R0, #hi_addr(_Image1+21)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,1114 :: 		Label12.OwnerScreen     = &Screen1;
MOVW	R1, #lo_addr(_Screen1+0)
MOVT	R1, #hi_addr(_Screen1+0)
MOVW	R0, #lo_addr(_Label12+0)
MOVT	R0, #hi_addr(_Label12+0)
STR	R1, [R0, #0]
;ECGsynthetic_driver.c,1115 :: 		Label12.Order           = 15;
MOVS	R1, #15
MOVW	R0, #lo_addr(_Label12+4)
MOVT	R0, #hi_addr(_Label12+4)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,1116 :: 		Label12.Left            = 42;
MOVS	R1, #42
MOVW	R0, #lo_addr(_Label12+6)
MOVT	R0, #hi_addr(_Label12+6)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,1117 :: 		Label12.Top             = 71;
MOVS	R1, #71
MOVW	R0, #lo_addr(_Label12+8)
MOVT	R0, #hi_addr(_Label12+8)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,1118 :: 		Label12.Width           = 436;
MOVW	R1, #436
MOVW	R0, #lo_addr(_Label12+10)
MOVT	R0, #hi_addr(_Label12+10)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,1119 :: 		Label12.Height          = 21;
MOVS	R1, #21
MOVW	R0, #lo_addr(_Label12+12)
MOVT	R0, #hi_addr(_Label12+12)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,1120 :: 		Label12.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Label12+27)
MOVT	R0, #hi_addr(_Label12+27)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,1121 :: 		Label12.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Label12+28)
MOVT	R0, #hi_addr(_Label12+28)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,1122 :: 		Label12.Caption         = Label12_Caption;
MOVW	R1, #lo_addr(_Label12_Caption+0)
MOVT	R1, #hi_addr(_Label12_Caption+0)
MOVW	R0, #lo_addr(_Label12+16)
MOVT	R0, #hi_addr(_Label12+16)
STR	R1, [R0, #0]
;ECGsynthetic_driver.c,1123 :: 		Label12.FontName        = Tahoma19x19_Bold;
MOVW	R0, #lo_addr(_Label12+20)
MOVT	R0, #hi_addr(_Label12+20)
STR	R4, [R0, #0]
;ECGsynthetic_driver.c,1124 :: 		Label12.Font_Color      = 0xFFFF;
MOVW	R1, #65535
MOVW	R0, #lo_addr(_Label12+24)
MOVT	R0, #hi_addr(_Label12+24)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,1125 :: 		Label12.VerticalText    = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label12+26)
MOVT	R0, #hi_addr(_Label12+26)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,1127 :: 		Label13.OwnerScreen     = &Screen1;
MOVW	R1, #lo_addr(_Screen1+0)
MOVT	R1, #hi_addr(_Screen1+0)
MOVW	R0, #lo_addr(_Label13+0)
MOVT	R0, #hi_addr(_Label13+0)
STR	R1, [R0, #0]
;ECGsynthetic_driver.c,1128 :: 		Label13.Order           = 16;
MOVS	R1, #16
MOVW	R0, #lo_addr(_Label13+4)
MOVT	R0, #hi_addr(_Label13+4)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,1129 :: 		Label13.Left            = 42;
MOVS	R1, #42
MOVW	R0, #lo_addr(_Label13+6)
MOVT	R0, #hi_addr(_Label13+6)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,1130 :: 		Label13.Top             = 91;
MOVS	R1, #91
MOVW	R0, #lo_addr(_Label13+8)
MOVT	R0, #hi_addr(_Label13+8)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,1131 :: 		Label13.Width           = 191;
MOVS	R1, #191
MOVW	R0, #lo_addr(_Label13+10)
MOVT	R0, #hi_addr(_Label13+10)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,1132 :: 		Label13.Height          = 21;
MOVS	R1, #21
MOVW	R0, #lo_addr(_Label13+12)
MOVT	R0, #hi_addr(_Label13+12)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,1133 :: 		Label13.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Label13+27)
MOVT	R0, #hi_addr(_Label13+27)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,1134 :: 		Label13.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Label13+28)
MOVT	R0, #hi_addr(_Label13+28)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,1135 :: 		Label13.Caption         = Label13_Caption;
MOVW	R1, #lo_addr(_Label13_Caption+0)
MOVT	R1, #hi_addr(_Label13_Caption+0)
MOVW	R0, #lo_addr(_Label13+16)
MOVT	R0, #hi_addr(_Label13+16)
STR	R1, [R0, #0]
;ECGsynthetic_driver.c,1136 :: 		Label13.FontName        = Tahoma19x19_Bold;
MOVW	R0, #lo_addr(_Label13+20)
MOVT	R0, #hi_addr(_Label13+20)
STR	R4, [R0, #0]
;ECGsynthetic_driver.c,1137 :: 		Label13.Font_Color      = 0xFFFF;
MOVW	R1, #65535
MOVW	R0, #lo_addr(_Label13+24)
MOVT	R0, #hi_addr(_Label13+24)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,1138 :: 		Label13.VerticalText    = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label13+26)
MOVT	R0, #hi_addr(_Label13+26)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,1140 :: 		Image2.OwnerScreen     = &Screen1;
MOVW	R1, #lo_addr(_Screen1+0)
MOVT	R1, #hi_addr(_Screen1+0)
MOVW	R0, #lo_addr(_Image2+0)
MOVT	R0, #hi_addr(_Image2+0)
STR	R1, [R0, #0]
;ECGsynthetic_driver.c,1141 :: 		Image2.Order           = 17;
MOVS	R1, #17
MOVW	R0, #lo_addr(_Image2+4)
MOVT	R0, #hi_addr(_Image2+4)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,1142 :: 		Image2.Left            = 636;
MOVW	R1, #636
MOVW	R0, #lo_addr(_Image2+6)
MOVT	R0, #hi_addr(_Image2+6)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,1143 :: 		Image2.Top             = 43;
MOVS	R1, #43
MOVW	R0, #lo_addr(_Image2+8)
MOVT	R0, #hi_addr(_Image2+8)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,1144 :: 		Image2.Width           = 100;
MOVS	R1, #100
MOVW	R0, #lo_addr(_Image2+10)
MOVT	R0, #hi_addr(_Image2+10)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,1145 :: 		Image2.Height          = 100;
MOVS	R1, #100
MOVW	R0, #lo_addr(_Image2+12)
MOVT	R0, #hi_addr(_Image2+12)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,1146 :: 		Image2.Picture_Type    = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image2+22)
MOVT	R0, #hi_addr(_Image2+22)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,1147 :: 		Image2.Picture_Ratio   = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image2+23)
MOVT	R0, #hi_addr(_Image2+23)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,1148 :: 		Image2.Picture_Name    = bme_jpg;
MOVW	R1, #lo_addr(_bme_jpg+0)
MOVT	R1, #hi_addr(_bme_jpg+0)
MOVW	R0, #lo_addr(_Image2+16)
MOVT	R0, #hi_addr(_Image2+16)
STR	R1, [R0, #0]
;ECGsynthetic_driver.c,1149 :: 		Image2.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image2+20)
MOVT	R0, #hi_addr(_Image2+20)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,1150 :: 		Image2.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image2+21)
MOVT	R0, #hi_addr(_Image2+21)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,1152 :: 		Label14.OwnerScreen     = &Screen1;
MOVW	R1, #lo_addr(_Screen1+0)
MOVT	R1, #hi_addr(_Screen1+0)
MOVW	R0, #lo_addr(_Label14+0)
MOVT	R0, #hi_addr(_Label14+0)
STR	R1, [R0, #0]
;ECGsynthetic_driver.c,1153 :: 		Label14.Order           = 18;
MOVS	R1, #18
MOVW	R0, #lo_addr(_Label14+4)
MOVT	R0, #hi_addr(_Label14+4)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,1154 :: 		Label14.Left            = 528;
MOVW	R1, #528
MOVW	R0, #lo_addr(_Label14+6)
MOVT	R0, #hi_addr(_Label14+6)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,1155 :: 		Label14.Top             = 344;
MOVW	R1, #344
MOVW	R0, #lo_addr(_Label14+8)
MOVT	R0, #hi_addr(_Label14+8)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,1156 :: 		Label14.Width           = 152;
MOVS	R1, #152
MOVW	R0, #lo_addr(_Label14+10)
MOVT	R0, #hi_addr(_Label14+10)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,1157 :: 		Label14.Height          = 20;
MOVS	R1, #20
MOVW	R0, #lo_addr(_Label14+12)
MOVT	R0, #hi_addr(_Label14+12)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,1158 :: 		Label14.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Label14+27)
MOVT	R0, #hi_addr(_Label14+27)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,1159 :: 		Label14.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Label14+28)
MOVT	R0, #hi_addr(_Label14+28)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,1160 :: 		Label14.Caption         = Label14_Caption;
MOVW	R1, #lo_addr(_Label14_Caption+0)
MOVT	R1, #hi_addr(_Label14_Caption+0)
MOVW	R0, #lo_addr(_Label14+16)
MOVT	R0, #hi_addr(_Label14+16)
STR	R1, [R0, #0]
;ECGsynthetic_driver.c,1161 :: 		Label14.FontName        = Tahoma18x18_Bold;
MOVW	R1, #lo_addr(_Tahoma18x18_Bold+0)
MOVT	R1, #hi_addr(_Tahoma18x18_Bold+0)
MOVW	R0, #lo_addr(_Label14+20)
MOVT	R0, #hi_addr(_Label14+20)
STR	R1, [R0, #0]
;ECGsynthetic_driver.c,1162 :: 		Label14.Font_Color      = 0x0000;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label14+24)
MOVT	R0, #hi_addr(_Label14+24)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,1163 :: 		Label14.VerticalText    = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label14+26)
MOVT	R0, #hi_addr(_Label14+26)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,1165 :: 		BoxRound1.OwnerScreen     = &Screen1;
MOVW	R1, #lo_addr(_Screen1+0)
MOVT	R1, #hi_addr(_Screen1+0)
MOVW	R0, #lo_addr(_BoxRound1+0)
MOVT	R0, #hi_addr(_BoxRound1+0)
STR	R1, [R0, #0]
;ECGsynthetic_driver.c,1166 :: 		BoxRound1.Order           = 19;
MOVS	R1, #19
MOVW	R0, #lo_addr(_BoxRound1+4)
MOVT	R0, #hi_addr(_BoxRound1+4)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,1167 :: 		BoxRound1.Left            = 559;
MOVW	R1, #559
MOVW	R0, #lo_addr(_BoxRound1+6)
MOVT	R0, #hi_addr(_BoxRound1+6)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,1168 :: 		BoxRound1.Top             = 380;
MOVW	R1, #380
MOVW	R0, #lo_addr(_BoxRound1+8)
MOVT	R0, #hi_addr(_BoxRound1+8)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,1169 :: 		BoxRound1.Width           = 114;
MOVS	R1, #114
MOVW	R0, #lo_addr(_BoxRound1+10)
MOVT	R0, #hi_addr(_BoxRound1+10)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,1170 :: 		BoxRound1.Height          = 53;
MOVS	R1, #53
MOVW	R0, #lo_addr(_BoxRound1+12)
MOVT	R0, #hi_addr(_BoxRound1+12)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,1171 :: 		BoxRound1.Pen_Width       = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_BoxRound1+14)
MOVT	R0, #hi_addr(_BoxRound1+14)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,1172 :: 		BoxRound1.Pen_Color       = 0x0000;
MOVS	R1, #0
MOVW	R0, #lo_addr(_BoxRound1+16)
MOVT	R0, #hi_addr(_BoxRound1+16)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,1173 :: 		BoxRound1.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_BoxRound1+18)
MOVT	R0, #hi_addr(_BoxRound1+18)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,1174 :: 		BoxRound1.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_BoxRound1+19)
MOVT	R0, #hi_addr(_BoxRound1+19)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,1175 :: 		BoxRound1.Transparent     = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_BoxRound1+20)
MOVT	R0, #hi_addr(_BoxRound1+20)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,1176 :: 		BoxRound1.Gradient        = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_BoxRound1+21)
MOVT	R0, #hi_addr(_BoxRound1+21)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,1177 :: 		BoxRound1.Gradient_Orientation = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_BoxRound1+22)
MOVT	R0, #hi_addr(_BoxRound1+22)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,1178 :: 		BoxRound1.Gradient_Start_Color = 0xFFFF;
MOVW	R1, #65535
MOVW	R0, #lo_addr(_BoxRound1+24)
MOVT	R0, #hi_addr(_BoxRound1+24)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,1179 :: 		BoxRound1.Gradient_End_Color = 0xC618;
MOVW	R1, #50712
MOVW	R0, #lo_addr(_BoxRound1+26)
MOVT	R0, #hi_addr(_BoxRound1+26)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,1180 :: 		BoxRound1.Color           = 0x0000;
MOVS	R1, #0
MOVW	R0, #lo_addr(_BoxRound1+28)
MOVT	R0, #hi_addr(_BoxRound1+28)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,1181 :: 		BoxRound1.PressColEnabled = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_BoxRound1+31)
MOVT	R0, #hi_addr(_BoxRound1+31)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,1182 :: 		BoxRound1.Press_Color     = 0xE71C;
MOVW	R1, #59164
MOVW	R0, #lo_addr(_BoxRound1+32)
MOVT	R0, #hi_addr(_BoxRound1+32)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,1183 :: 		BoxRound1.Corner_Radius   = 3;
MOVS	R1, #3
MOVW	R0, #lo_addr(_BoxRound1+30)
MOVT	R0, #hi_addr(_BoxRound1+30)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,1185 :: 		Label19.OwnerScreen     = &Screen1;
MOVW	R1, #lo_addr(_Screen1+0)
MOVT	R1, #hi_addr(_Screen1+0)
MOVW	R0, #lo_addr(_Label19+0)
MOVT	R0, #hi_addr(_Label19+0)
STR	R1, [R0, #0]
;ECGsynthetic_driver.c,1186 :: 		Label19.Order           = 20;
MOVS	R1, #20
MOVW	R0, #lo_addr(_Label19+4)
MOVT	R0, #hi_addr(_Label19+4)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,1187 :: 		Label19.Left            = 603;
MOVW	R1, #603
MOVW	R0, #lo_addr(_Label19+6)
MOVT	R0, #hi_addr(_Label19+6)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,1188 :: 		Label19.Top             = 395;
MOVW	R1, #395
MOVW	R0, #lo_addr(_Label19+8)
MOVT	R0, #hi_addr(_Label19+8)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,1189 :: 		Label19.Width           = 28;
MOVS	R1, #28
MOVW	R0, #lo_addr(_Label19+10)
MOVT	R0, #hi_addr(_Label19+10)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,1190 :: 		Label19.Height          = 25;
MOVS	R1, #25
MOVW	R0, #lo_addr(_Label19+12)
MOVT	R0, #hi_addr(_Label19+12)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,1191 :: 		Label19.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Label19+27)
MOVT	R0, #hi_addr(_Label19+27)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,1192 :: 		Label19.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Label19+28)
MOVT	R0, #hi_addr(_Label19+28)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,1193 :: 		Label19.Caption         = Label19_Caption;
MOVW	R1, #lo_addr(_Label19_Caption+0)
MOVT	R1, #hi_addr(_Label19_Caption+0)
MOVW	R0, #lo_addr(_Label19+16)
MOVT	R0, #hi_addr(_Label19+16)
STR	R1, [R0, #0]
;ECGsynthetic_driver.c,1194 :: 		Label19.FontName        = Tahoma19x23_Regular;
MOVW	R0, #lo_addr(_Label19+20)
MOVT	R0, #hi_addr(_Label19+20)
STR	R3, [R0, #0]
;ECGsynthetic_driver.c,1195 :: 		Label19.Font_Color      = 0xFFFF;
MOVW	R1, #65535
MOVW	R0, #lo_addr(_Label19+24)
MOVT	R0, #hi_addr(_Label19+24)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,1196 :: 		Label19.VerticalText    = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label19+26)
MOVT	R0, #hi_addr(_Label19+26)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,1198 :: 		ButtonRound36.OwnerScreen     = &Screen1;
MOVW	R1, #lo_addr(_Screen1+0)
MOVT	R1, #hi_addr(_Screen1+0)
MOVW	R0, #lo_addr(_ButtonRound36+0)
MOVT	R0, #hi_addr(_ButtonRound36+0)
STR	R1, [R0, #0]
;ECGsynthetic_driver.c,1199 :: 		ButtonRound36.Order           = 21;
MOVS	R1, #21
MOVW	R0, #lo_addr(_ButtonRound36+4)
MOVT	R0, #hi_addr(_ButtonRound36+4)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,1200 :: 		ButtonRound36.Left            = 683;
MOVW	R1, #683
MOVW	R0, #lo_addr(_ButtonRound36+6)
MOVT	R0, #hi_addr(_ButtonRound36+6)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,1201 :: 		ButtonRound36.Top             = 382;
MOVW	R1, #382
MOVW	R0, #lo_addr(_ButtonRound36+8)
MOVT	R0, #hi_addr(_ButtonRound36+8)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,1202 :: 		ButtonRound36.Width           = 41;
MOVS	R1, #41
MOVW	R0, #lo_addr(_ButtonRound36+10)
MOVT	R0, #hi_addr(_ButtonRound36+10)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,1203 :: 		ButtonRound36.Height          = 46;
MOVS	R1, #46
MOVW	R0, #lo_addr(_ButtonRound36+12)
MOVT	R0, #hi_addr(_ButtonRound36+12)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,1204 :: 		ButtonRound36.Pen_Width       = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_ButtonRound36+14)
MOVT	R0, #hi_addr(_ButtonRound36+14)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,1205 :: 		ButtonRound36.Pen_Color       = 0xFFFF;
MOVW	R1, #65535
MOVW	R0, #lo_addr(_ButtonRound36+16)
MOVT	R0, #hi_addr(_ButtonRound36+16)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,1206 :: 		ButtonRound36.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_ButtonRound36+18)
MOVT	R0, #hi_addr(_ButtonRound36+18)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,1207 :: 		ButtonRound36.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_ButtonRound36+19)
MOVT	R0, #hi_addr(_ButtonRound36+19)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,1208 :: 		ButtonRound36.Transparent     = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_ButtonRound36+20)
MOVT	R0, #hi_addr(_ButtonRound36+20)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,1209 :: 		ButtonRound36.Caption         = ButtonRound36_Caption;
MOVW	R1, #lo_addr(_ButtonRound36_Caption+0)
MOVT	R1, #hi_addr(_ButtonRound36_Caption+0)
MOVW	R0, #lo_addr(_ButtonRound36+24)
MOVT	R0, #hi_addr(_ButtonRound36+24)
STR	R1, [R0, #0]
;ECGsynthetic_driver.c,1210 :: 		ButtonRound36.TextAlign       = _taCenter;
MOVS	R1, #1
MOVW	R0, #lo_addr(_ButtonRound36+28)
MOVT	R0, #hi_addr(_ButtonRound36+28)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,1211 :: 		ButtonRound36.TextAlignVertical= _tavMiddle;
MOVS	R1, #1
MOVW	R0, #lo_addr(_ButtonRound36+29)
MOVT	R0, #hi_addr(_ButtonRound36+29)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,1212 :: 		ButtonRound36.FontName        = Tahoma32x33_Bold;
MOVW	R2, #lo_addr(_Tahoma32x33_Bold+0)
MOVT	R2, #hi_addr(_Tahoma32x33_Bold+0)
MOVW	R0, #lo_addr(_ButtonRound36+32)
MOVT	R0, #hi_addr(_ButtonRound36+32)
STR	R2, [R0, #0]
;ECGsynthetic_driver.c,1213 :: 		ButtonRound36.PressColEnabled = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_ButtonRound36+49)
MOVT	R0, #hi_addr(_ButtonRound36+49)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,1214 :: 		ButtonRound36.Font_Color      = 0x3013;
MOVW	R1, #12307
MOVW	R0, #lo_addr(_ButtonRound36+36)
MOVT	R0, #hi_addr(_ButtonRound36+36)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,1215 :: 		ButtonRound36.VerticalText    = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_ButtonRound36+38)
MOVT	R0, #hi_addr(_ButtonRound36+38)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,1216 :: 		ButtonRound36.Gradient        = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_ButtonRound36+39)
MOVT	R0, #hi_addr(_ButtonRound36+39)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,1217 :: 		ButtonRound36.Gradient_Orientation = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_ButtonRound36+40)
MOVT	R0, #hi_addr(_ButtonRound36+40)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,1218 :: 		ButtonRound36.Gradient_Start_Color = 0xFFFF;
MOVW	R1, #65535
MOVW	R0, #lo_addr(_ButtonRound36+42)
MOVT	R0, #hi_addr(_ButtonRound36+42)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,1219 :: 		ButtonRound36.Gradient_End_Color = 0xC618;
MOVW	R1, #50712
MOVW	R0, #lo_addr(_ButtonRound36+44)
MOVT	R0, #hi_addr(_ButtonRound36+44)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,1220 :: 		ButtonRound36.Color           = 0xFFFF;
MOVW	R1, #65535
MOVW	R0, #lo_addr(_ButtonRound36+46)
MOVT	R0, #hi_addr(_ButtonRound36+46)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,1221 :: 		ButtonRound36.Press_Color     = 0xE71C;
MOVW	R1, #59164
MOVW	R0, #lo_addr(_ButtonRound36+50)
MOVT	R0, #hi_addr(_ButtonRound36+50)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,1222 :: 		ButtonRound36.Corner_Radius   = 3;
MOVS	R1, #3
MOVW	R0, #lo_addr(_ButtonRound36+48)
MOVT	R0, #hi_addr(_ButtonRound36+48)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,1223 :: 		ButtonRound36.OnClickPtr      = ButtonRound36OnClick;
MOVW	R1, #lo_addr(_ButtonRound36OnClick+0)
MOVT	R1, #hi_addr(_ButtonRound36OnClick+0)
MOVW	R0, #lo_addr(_ButtonRound36+60)
MOVT	R0, #hi_addr(_ButtonRound36+60)
STR	R1, [R0, #0]
;ECGsynthetic_driver.c,1225 :: 		ButtonRound37.OwnerScreen     = &Screen1;
MOVW	R1, #lo_addr(_Screen1+0)
MOVT	R1, #hi_addr(_Screen1+0)
MOVW	R0, #lo_addr(_ButtonRound37+0)
MOVT	R0, #hi_addr(_ButtonRound37+0)
STR	R1, [R0, #0]
;ECGsynthetic_driver.c,1226 :: 		ButtonRound37.Order           = 22;
MOVS	R1, #22
MOVW	R0, #lo_addr(_ButtonRound37+4)
MOVT	R0, #hi_addr(_ButtonRound37+4)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,1227 :: 		ButtonRound37.Left            = 516;
MOVW	R1, #516
MOVW	R0, #lo_addr(_ButtonRound37+6)
MOVT	R0, #hi_addr(_ButtonRound37+6)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,1228 :: 		ButtonRound37.Top             = 382;
MOVW	R1, #382
MOVW	R0, #lo_addr(_ButtonRound37+8)
MOVT	R0, #hi_addr(_ButtonRound37+8)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,1229 :: 		ButtonRound37.Width           = 36;
MOVS	R1, #36
MOVW	R0, #lo_addr(_ButtonRound37+10)
MOVT	R0, #hi_addr(_ButtonRound37+10)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,1230 :: 		ButtonRound37.Height          = 43;
MOVS	R1, #43
MOVW	R0, #lo_addr(_ButtonRound37+12)
MOVT	R0, #hi_addr(_ButtonRound37+12)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,1231 :: 		ButtonRound37.Pen_Width       = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_ButtonRound37+14)
MOVT	R0, #hi_addr(_ButtonRound37+14)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,1232 :: 		ButtonRound37.Pen_Color       = 0xFFFF;
MOVW	R1, #65535
MOVW	R0, #lo_addr(_ButtonRound37+16)
MOVT	R0, #hi_addr(_ButtonRound37+16)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,1233 :: 		ButtonRound37.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_ButtonRound37+18)
MOVT	R0, #hi_addr(_ButtonRound37+18)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,1234 :: 		ButtonRound37.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_ButtonRound37+19)
MOVT	R0, #hi_addr(_ButtonRound37+19)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,1235 :: 		ButtonRound37.Transparent     = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_ButtonRound37+20)
MOVT	R0, #hi_addr(_ButtonRound37+20)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,1236 :: 		ButtonRound37.Caption         = ButtonRound37_Caption;
MOVW	R1, #lo_addr(_ButtonRound37_Caption+0)
MOVT	R1, #hi_addr(_ButtonRound37_Caption+0)
MOVW	R0, #lo_addr(_ButtonRound37+24)
MOVT	R0, #hi_addr(_ButtonRound37+24)
STR	R1, [R0, #0]
;ECGsynthetic_driver.c,1237 :: 		ButtonRound37.TextAlign       = _taCenter;
MOVS	R1, #1
MOVW	R0, #lo_addr(_ButtonRound37+28)
MOVT	R0, #hi_addr(_ButtonRound37+28)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,1238 :: 		ButtonRound37.TextAlignVertical= _tavMiddle;
MOVS	R1, #1
MOVW	R0, #lo_addr(_ButtonRound37+29)
MOVT	R0, #hi_addr(_ButtonRound37+29)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,1239 :: 		ButtonRound37.FontName        = Tahoma32x33_Bold;
MOVW	R0, #lo_addr(_ButtonRound37+32)
MOVT	R0, #hi_addr(_ButtonRound37+32)
STR	R2, [R0, #0]
;ECGsynthetic_driver.c,1240 :: 		ButtonRound37.PressColEnabled = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_ButtonRound37+49)
MOVT	R0, #hi_addr(_ButtonRound37+49)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,1241 :: 		ButtonRound37.Font_Color      = 0x3013;
MOVW	R1, #12307
MOVW	R0, #lo_addr(_ButtonRound37+36)
MOVT	R0, #hi_addr(_ButtonRound37+36)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,1242 :: 		ButtonRound37.VerticalText    = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_ButtonRound37+38)
MOVT	R0, #hi_addr(_ButtonRound37+38)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,1243 :: 		ButtonRound37.Gradient        = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_ButtonRound37+39)
MOVT	R0, #hi_addr(_ButtonRound37+39)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,1244 :: 		ButtonRound37.Gradient_Orientation = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_ButtonRound37+40)
MOVT	R0, #hi_addr(_ButtonRound37+40)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,1245 :: 		ButtonRound37.Gradient_Start_Color = 0xFFFF;
MOVW	R1, #65535
MOVW	R0, #lo_addr(_ButtonRound37+42)
MOVT	R0, #hi_addr(_ButtonRound37+42)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,1246 :: 		ButtonRound37.Gradient_End_Color = 0xC618;
MOVW	R1, #50712
MOVW	R0, #lo_addr(_ButtonRound37+44)
MOVT	R0, #hi_addr(_ButtonRound37+44)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,1247 :: 		ButtonRound37.Color           = 0xFFFF;
MOVW	R1, #65535
MOVW	R0, #lo_addr(_ButtonRound37+46)
MOVT	R0, #hi_addr(_ButtonRound37+46)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,1248 :: 		ButtonRound37.Press_Color     = 0xE71C;
MOVW	R1, #59164
MOVW	R0, #lo_addr(_ButtonRound37+50)
MOVT	R0, #hi_addr(_ButtonRound37+50)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,1249 :: 		ButtonRound37.Corner_Radius   = 3;
MOVS	R1, #3
MOVW	R0, #lo_addr(_ButtonRound37+48)
MOVT	R0, #hi_addr(_ButtonRound37+48)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,1250 :: 		ButtonRound37.OnClickPtr      = ButtonRound37OnClick;
MOVW	R1, #lo_addr(_ButtonRound37OnClick+0)
MOVT	R1, #hi_addr(_ButtonRound37OnClick+0)
MOVW	R0, #lo_addr(_ButtonRound37+60)
MOVT	R0, #hi_addr(_ButtonRound37+60)
STR	R1, [R0, #0]
;ECGsynthetic_driver.c,1252 :: 		RadioButton3.OwnerScreen     = &Screen2;
MOVW	R1, #lo_addr(_Screen2+0)
MOVT	R1, #hi_addr(_Screen2+0)
MOVW	R0, #lo_addr(_RadioButton3+0)
MOVT	R0, #hi_addr(_RadioButton3+0)
STR	R1, [R0, #0]
;ECGsynthetic_driver.c,1253 :: 		RadioButton3.Order           = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton3+4)
MOVT	R0, #hi_addr(_RadioButton3+4)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,1254 :: 		RadioButton3.Left            = 42;
MOVS	R1, #42
MOVW	R0, #lo_addr(_RadioButton3+6)
MOVT	R0, #hi_addr(_RadioButton3+6)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,1255 :: 		RadioButton3.Top             = 134;
MOVS	R1, #134
MOVW	R0, #lo_addr(_RadioButton3+8)
MOVT	R0, #hi_addr(_RadioButton3+8)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,1256 :: 		RadioButton3.Width           = 41;
MOVS	R1, #41
MOVW	R0, #lo_addr(_RadioButton3+10)
MOVT	R0, #hi_addr(_RadioButton3+10)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,1257 :: 		RadioButton3.Height          = 25;
MOVS	R1, #25
MOVW	R0, #lo_addr(_RadioButton3+12)
MOVT	R0, #hi_addr(_RadioButton3+12)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,1258 :: 		RadioButton3.Pen_Width       = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_RadioButton3+14)
MOVT	R0, #hi_addr(_RadioButton3+14)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,1259 :: 		RadioButton3.Pen_Color       = 0x0000;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton3+16)
MOVT	R0, #hi_addr(_RadioButton3+16)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,1260 :: 		RadioButton3.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_RadioButton3+18)
MOVT	R0, #hi_addr(_RadioButton3+18)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,1261 :: 		RadioButton3.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_RadioButton3+19)
MOVT	R0, #hi_addr(_RadioButton3+19)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,1262 :: 		RadioButton3.Checked         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton3+20)
MOVT	R0, #hi_addr(_RadioButton3+20)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,1263 :: 		RadioButton3.Transparent     = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_RadioButton3+21)
MOVT	R0, #hi_addr(_RadioButton3+21)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,1264 :: 		RadioButton3.Caption         = RadioButton3_Caption;
MOVW	R1, #lo_addr(_RadioButton3_Caption+0)
MOVT	R1, #hi_addr(_RadioButton3_Caption+0)
MOVW	R0, #lo_addr(_RadioButton3+24)
MOVT	R0, #hi_addr(_RadioButton3+24)
STR	R1, [R0, #0]
;ECGsynthetic_driver.c,1265 :: 		RadioButton3.TextAlign       = _taLeft;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton3+28)
MOVT	R0, #hi_addr(_RadioButton3+28)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,1266 :: 		RadioButton3.FontName        = DejaVu_Serif16x19_Regular;
MOVW	R5, #lo_addr(_DejaVu_Serif16x19_Regular+0)
MOVT	R5, #hi_addr(_DejaVu_Serif16x19_Regular+0)
MOVW	R0, #lo_addr(_RadioButton3+32)
MOVT	R0, #hi_addr(_RadioButton3+32)
STR	R5, [R0, #0]
;ECGsynthetic_driver.c,1267 :: 		RadioButton3.PressColEnabled = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_RadioButton3+48)
MOVT	R0, #hi_addr(_RadioButton3+48)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,1268 :: 		RadioButton3.Font_Color      = 0x0000;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton3+36)
MOVT	R0, #hi_addr(_RadioButton3+36)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,1269 :: 		RadioButton3.Gradient        = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton3+38)
MOVT	R0, #hi_addr(_RadioButton3+38)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,1270 :: 		RadioButton3.Gradient_Orientation = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton3+39)
MOVT	R0, #hi_addr(_RadioButton3+39)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,1271 :: 		RadioButton3.Gradient_Start_Color = 0xFFFF;
MOVW	R1, #65535
MOVW	R0, #lo_addr(_RadioButton3+40)
MOVT	R0, #hi_addr(_RadioButton3+40)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,1272 :: 		RadioButton3.Gradient_End_Color = 0xC618;
MOVW	R1, #50712
MOVW	R0, #lo_addr(_RadioButton3+42)
MOVT	R0, #hi_addr(_RadioButton3+42)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,1273 :: 		RadioButton3.Color           = 0xFFFF;
MOVW	R1, #65535
MOVW	R0, #lo_addr(_RadioButton3+44)
MOVT	R0, #hi_addr(_RadioButton3+44)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,1274 :: 		RadioButton3.Press_Color     = 0xC618;
MOVW	R1, #50712
MOVW	R0, #lo_addr(_RadioButton3+50)
MOVT	R0, #hi_addr(_RadioButton3+50)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,1275 :: 		RadioButton3.Background_Color = 0x0000;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton3+46)
MOVT	R0, #hi_addr(_RadioButton3+46)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,1276 :: 		RadioButton3.OnPressPtr      = RadioButton3OnPress;
MOVW	R1, #lo_addr(_RadioButton3OnPress+0)
MOVT	R1, #hi_addr(_RadioButton3OnPress+0)
MOVW	R0, #lo_addr(_RadioButton3+64)
MOVT	R0, #hi_addr(_RadioButton3+64)
STR	R1, [R0, #0]
;ECGsynthetic_driver.c,1278 :: 		RadioButton4.OwnerScreen     = &Screen2;
MOVW	R1, #lo_addr(_Screen2+0)
MOVT	R1, #hi_addr(_Screen2+0)
MOVW	R0, #lo_addr(_RadioButton4+0)
MOVT	R0, #hi_addr(_RadioButton4+0)
STR	R1, [R0, #0]
;ECGsynthetic_driver.c,1279 :: 		RadioButton4.Order           = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_RadioButton4+4)
MOVT	R0, #hi_addr(_RadioButton4+4)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,1280 :: 		RadioButton4.Left            = 42;
MOVS	R1, #42
MOVW	R0, #lo_addr(_RadioButton4+6)
MOVT	R0, #hi_addr(_RadioButton4+6)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,1281 :: 		RadioButton4.Top             = 174;
MOVS	R1, #174
MOVW	R0, #lo_addr(_RadioButton4+8)
MOVT	R0, #hi_addr(_RadioButton4+8)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,1282 :: 		RadioButton4.Width           = 47;
MOVS	R1, #47
MOVW	R0, #lo_addr(_RadioButton4+10)
MOVT	R0, #hi_addr(_RadioButton4+10)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,1283 :: 		RadioButton4.Height          = 25;
MOVS	R1, #25
MOVW	R0, #lo_addr(_RadioButton4+12)
MOVT	R0, #hi_addr(_RadioButton4+12)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,1284 :: 		RadioButton4.Pen_Width       = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_RadioButton4+14)
MOVT	R0, #hi_addr(_RadioButton4+14)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,1285 :: 		RadioButton4.Pen_Color       = 0x0000;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton4+16)
MOVT	R0, #hi_addr(_RadioButton4+16)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,1286 :: 		RadioButton4.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_RadioButton4+18)
MOVT	R0, #hi_addr(_RadioButton4+18)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,1287 :: 		RadioButton4.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_RadioButton4+19)
MOVT	R0, #hi_addr(_RadioButton4+19)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,1288 :: 		RadioButton4.Checked         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton4+20)
MOVT	R0, #hi_addr(_RadioButton4+20)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,1289 :: 		RadioButton4.Transparent     = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_RadioButton4+21)
MOVT	R0, #hi_addr(_RadioButton4+21)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,1290 :: 		RadioButton4.Caption         = RadioButton4_Caption;
MOVW	R1, #lo_addr(_RadioButton4_Caption+0)
MOVT	R1, #hi_addr(_RadioButton4_Caption+0)
MOVW	R0, #lo_addr(_RadioButton4+24)
MOVT	R0, #hi_addr(_RadioButton4+24)
STR	R1, [R0, #0]
;ECGsynthetic_driver.c,1291 :: 		RadioButton4.TextAlign       = _taLeft;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton4+28)
MOVT	R0, #hi_addr(_RadioButton4+28)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,1292 :: 		RadioButton4.FontName        = DejaVu_Serif16x19_Regular;
MOVW	R0, #lo_addr(_RadioButton4+32)
MOVT	R0, #hi_addr(_RadioButton4+32)
STR	R5, [R0, #0]
;ECGsynthetic_driver.c,1293 :: 		RadioButton4.PressColEnabled = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_RadioButton4+48)
MOVT	R0, #hi_addr(_RadioButton4+48)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,1294 :: 		RadioButton4.Font_Color      = 0x0000;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton4+36)
MOVT	R0, #hi_addr(_RadioButton4+36)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,1295 :: 		RadioButton4.Gradient        = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton4+38)
MOVT	R0, #hi_addr(_RadioButton4+38)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,1296 :: 		RadioButton4.Gradient_Orientation = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton4+39)
MOVT	R0, #hi_addr(_RadioButton4+39)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,1297 :: 		RadioButton4.Gradient_Start_Color = 0xFFFF;
MOVW	R1, #65535
MOVW	R0, #lo_addr(_RadioButton4+40)
MOVT	R0, #hi_addr(_RadioButton4+40)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,1298 :: 		RadioButton4.Gradient_End_Color = 0xC618;
MOVW	R1, #50712
MOVW	R0, #lo_addr(_RadioButton4+42)
MOVT	R0, #hi_addr(_RadioButton4+42)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,1299 :: 		RadioButton4.Color           = 0xFFFF;
MOVW	R1, #65535
MOVW	R0, #lo_addr(_RadioButton4+44)
MOVT	R0, #hi_addr(_RadioButton4+44)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,1300 :: 		RadioButton4.Press_Color     = 0xE71C;
MOVW	R1, #59164
MOVW	R0, #lo_addr(_RadioButton4+50)
MOVT	R0, #hi_addr(_RadioButton4+50)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,1301 :: 		RadioButton4.Background_Color = 0x0000;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton4+46)
MOVT	R0, #hi_addr(_RadioButton4+46)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,1302 :: 		RadioButton4.OnPressPtr      = RadioButton4OnPress;
MOVW	R1, #lo_addr(_RadioButton4OnPress+0)
MOVT	R1, #hi_addr(_RadioButton4OnPress+0)
MOVW	R0, #lo_addr(_RadioButton4+64)
MOVT	R0, #hi_addr(_RadioButton4+64)
STR	R1, [R0, #0]
;ECGsynthetic_driver.c,1304 :: 		RadioButton5.OwnerScreen     = &Screen2;
MOVW	R1, #lo_addr(_Screen2+0)
MOVT	R1, #hi_addr(_Screen2+0)
MOVW	R0, #lo_addr(_RadioButton5+0)
MOVT	R0, #hi_addr(_RadioButton5+0)
STR	R1, [R0, #0]
;ECGsynthetic_driver.c,1305 :: 		RadioButton5.Order           = 2;
MOVS	R1, #2
MOVW	R0, #lo_addr(_RadioButton5+4)
MOVT	R0, #hi_addr(_RadioButton5+4)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,1306 :: 		RadioButton5.Left            = 42;
MOVS	R1, #42
MOVW	R0, #lo_addr(_RadioButton5+6)
MOVT	R0, #hi_addr(_RadioButton5+6)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,1307 :: 		RadioButton5.Top             = 214;
MOVS	R1, #214
MOVW	R0, #lo_addr(_RadioButton5+8)
MOVT	R0, #hi_addr(_RadioButton5+8)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,1308 :: 		RadioButton5.Width           = 54;
MOVS	R1, #54
MOVW	R0, #lo_addr(_RadioButton5+10)
MOVT	R0, #hi_addr(_RadioButton5+10)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,1309 :: 		RadioButton5.Height          = 25;
MOVS	R1, #25
MOVW	R0, #lo_addr(_RadioButton5+12)
MOVT	R0, #hi_addr(_RadioButton5+12)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,1310 :: 		RadioButton5.Pen_Width       = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_RadioButton5+14)
MOVT	R0, #hi_addr(_RadioButton5+14)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,1311 :: 		RadioButton5.Pen_Color       = 0x0000;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton5+16)
MOVT	R0, #hi_addr(_RadioButton5+16)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,1312 :: 		RadioButton5.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_RadioButton5+18)
MOVT	R0, #hi_addr(_RadioButton5+18)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,1313 :: 		RadioButton5.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_RadioButton5+19)
MOVT	R0, #hi_addr(_RadioButton5+19)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,1314 :: 		RadioButton5.Checked         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton5+20)
MOVT	R0, #hi_addr(_RadioButton5+20)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,1315 :: 		RadioButton5.Transparent     = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_RadioButton5+21)
MOVT	R0, #hi_addr(_RadioButton5+21)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,1316 :: 		RadioButton5.Caption         = RadioButton5_Caption;
MOVW	R1, #lo_addr(_RadioButton5_Caption+0)
MOVT	R1, #hi_addr(_RadioButton5_Caption+0)
MOVW	R0, #lo_addr(_RadioButton5+24)
MOVT	R0, #hi_addr(_RadioButton5+24)
STR	R1, [R0, #0]
;ECGsynthetic_driver.c,1317 :: 		RadioButton5.TextAlign       = _taLeft;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton5+28)
MOVT	R0, #hi_addr(_RadioButton5+28)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,1318 :: 		RadioButton5.FontName        = DejaVu_Serif16x19_Regular;
MOVW	R0, #lo_addr(_RadioButton5+32)
MOVT	R0, #hi_addr(_RadioButton5+32)
STR	R5, [R0, #0]
;ECGsynthetic_driver.c,1319 :: 		RadioButton5.PressColEnabled = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_RadioButton5+48)
MOVT	R0, #hi_addr(_RadioButton5+48)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,1320 :: 		RadioButton5.Font_Color      = 0x0000;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton5+36)
MOVT	R0, #hi_addr(_RadioButton5+36)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,1321 :: 		RadioButton5.Gradient        = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton5+38)
MOVT	R0, #hi_addr(_RadioButton5+38)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,1322 :: 		RadioButton5.Gradient_Orientation = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton5+39)
MOVT	R0, #hi_addr(_RadioButton5+39)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,1323 :: 		RadioButton5.Gradient_Start_Color = 0xFFFF;
MOVW	R1, #65535
MOVW	R0, #lo_addr(_RadioButton5+40)
MOVT	R0, #hi_addr(_RadioButton5+40)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,1324 :: 		RadioButton5.Gradient_End_Color = 0xC618;
MOVW	R1, #50712
MOVW	R0, #lo_addr(_RadioButton5+42)
MOVT	R0, #hi_addr(_RadioButton5+42)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,1325 :: 		RadioButton5.Color           = 0xFFFF;
MOVW	R1, #65535
MOVW	R0, #lo_addr(_RadioButton5+44)
MOVT	R0, #hi_addr(_RadioButton5+44)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,1326 :: 		RadioButton5.Press_Color     = 0xE71C;
MOVW	R1, #59164
MOVW	R0, #lo_addr(_RadioButton5+50)
MOVT	R0, #hi_addr(_RadioButton5+50)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,1327 :: 		RadioButton5.Background_Color = 0x0000;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton5+46)
MOVT	R0, #hi_addr(_RadioButton5+46)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,1328 :: 		RadioButton5.OnPressPtr      = RadioButton5OnPress;
MOVW	R1, #lo_addr(_RadioButton5OnPress+0)
MOVT	R1, #hi_addr(_RadioButton5OnPress+0)
MOVW	R0, #lo_addr(_RadioButton5+64)
MOVT	R0, #hi_addr(_RadioButton5+64)
STR	R1, [R0, #0]
;ECGsynthetic_driver.c,1330 :: 		RadioButton6.OwnerScreen     = &Screen2;
MOVW	R1, #lo_addr(_Screen2+0)
MOVT	R1, #hi_addr(_Screen2+0)
MOVW	R0, #lo_addr(_RadioButton6+0)
MOVT	R0, #hi_addr(_RadioButton6+0)
STR	R1, [R0, #0]
;ECGsynthetic_driver.c,1331 :: 		RadioButton6.Order           = 3;
MOVS	R1, #3
MOVW	R0, #lo_addr(_RadioButton6+4)
MOVT	R0, #hi_addr(_RadioButton6+4)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,1332 :: 		RadioButton6.Left            = 42;
MOVS	R1, #42
MOVW	R0, #lo_addr(_RadioButton6+6)
MOVT	R0, #hi_addr(_RadioButton6+6)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,1333 :: 		RadioButton6.Top             = 254;
MOVS	R1, #254
MOVW	R0, #lo_addr(_RadioButton6+8)
MOVT	R0, #hi_addr(_RadioButton6+8)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,1334 :: 		RadioButton6.Width           = 68;
MOVS	R1, #68
MOVW	R0, #lo_addr(_RadioButton6+10)
MOVT	R0, #hi_addr(_RadioButton6+10)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,1335 :: 		RadioButton6.Height          = 25;
MOVS	R1, #25
MOVW	R0, #lo_addr(_RadioButton6+12)
MOVT	R0, #hi_addr(_RadioButton6+12)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,1336 :: 		RadioButton6.Pen_Width       = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_RadioButton6+14)
MOVT	R0, #hi_addr(_RadioButton6+14)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,1337 :: 		RadioButton6.Pen_Color       = 0x0000;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton6+16)
MOVT	R0, #hi_addr(_RadioButton6+16)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,1338 :: 		RadioButton6.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_RadioButton6+18)
MOVT	R0, #hi_addr(_RadioButton6+18)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,1339 :: 		RadioButton6.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_RadioButton6+19)
MOVT	R0, #hi_addr(_RadioButton6+19)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,1340 :: 		RadioButton6.Checked         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton6+20)
MOVT	R0, #hi_addr(_RadioButton6+20)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,1341 :: 		RadioButton6.Transparent     = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_RadioButton6+21)
MOVT	R0, #hi_addr(_RadioButton6+21)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,1342 :: 		RadioButton6.Caption         = RadioButton6_Caption;
MOVW	R1, #lo_addr(_RadioButton6_Caption+0)
MOVT	R1, #hi_addr(_RadioButton6_Caption+0)
MOVW	R0, #lo_addr(_RadioButton6+24)
MOVT	R0, #hi_addr(_RadioButton6+24)
STR	R1, [R0, #0]
;ECGsynthetic_driver.c,1343 :: 		RadioButton6.TextAlign       = _taLeft;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton6+28)
MOVT	R0, #hi_addr(_RadioButton6+28)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,1344 :: 		RadioButton6.FontName        = DejaVu_Serif16x19_Regular;
MOVW	R0, #lo_addr(_RadioButton6+32)
MOVT	R0, #hi_addr(_RadioButton6+32)
STR	R5, [R0, #0]
;ECGsynthetic_driver.c,1345 :: 		RadioButton6.PressColEnabled = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_RadioButton6+48)
MOVT	R0, #hi_addr(_RadioButton6+48)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,1346 :: 		RadioButton6.Font_Color      = 0x0000;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton6+36)
MOVT	R0, #hi_addr(_RadioButton6+36)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,1347 :: 		RadioButton6.Gradient        = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton6+38)
MOVT	R0, #hi_addr(_RadioButton6+38)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,1348 :: 		RadioButton6.Gradient_Orientation = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton6+39)
MOVT	R0, #hi_addr(_RadioButton6+39)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,1349 :: 		RadioButton6.Gradient_Start_Color = 0xFFFF;
MOVW	R1, #65535
MOVW	R0, #lo_addr(_RadioButton6+40)
MOVT	R0, #hi_addr(_RadioButton6+40)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,1350 :: 		RadioButton6.Gradient_End_Color = 0xC618;
MOVW	R1, #50712
MOVW	R0, #lo_addr(_RadioButton6+42)
MOVT	R0, #hi_addr(_RadioButton6+42)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,1351 :: 		RadioButton6.Color           = 0xFFFF;
MOVW	R1, #65535
MOVW	R0, #lo_addr(_RadioButton6+44)
MOVT	R0, #hi_addr(_RadioButton6+44)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,1352 :: 		RadioButton6.Press_Color     = 0xE71C;
MOVW	R1, #59164
MOVW	R0, #lo_addr(_RadioButton6+50)
MOVT	R0, #hi_addr(_RadioButton6+50)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,1353 :: 		RadioButton6.Background_Color = 0x0000;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton6+46)
MOVT	R0, #hi_addr(_RadioButton6+46)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,1354 :: 		RadioButton6.OnPressPtr      = RadioButton6OnPress;
MOVW	R1, #lo_addr(_RadioButton6OnPress+0)
MOVT	R1, #hi_addr(_RadioButton6OnPress+0)
MOVW	R0, #lo_addr(_RadioButton6+64)
MOVT	R0, #hi_addr(_RadioButton6+64)
STR	R1, [R0, #0]
;ECGsynthetic_driver.c,1356 :: 		RadioButton7.OwnerScreen     = &Screen2;
MOVW	R1, #lo_addr(_Screen2+0)
MOVT	R1, #hi_addr(_Screen2+0)
MOVW	R0, #lo_addr(_RadioButton7+0)
MOVT	R0, #hi_addr(_RadioButton7+0)
STR	R1, [R0, #0]
;ECGsynthetic_driver.c,1357 :: 		RadioButton7.Order           = 4;
MOVS	R1, #4
MOVW	R0, #lo_addr(_RadioButton7+4)
MOVT	R0, #hi_addr(_RadioButton7+4)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,1358 :: 		RadioButton7.Left            = 42;
MOVS	R1, #42
MOVW	R0, #lo_addr(_RadioButton7+6)
MOVT	R0, #hi_addr(_RadioButton7+6)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,1359 :: 		RadioButton7.Top             = 294;
MOVW	R1, #294
MOVW	R0, #lo_addr(_RadioButton7+8)
MOVT	R0, #hi_addr(_RadioButton7+8)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,1360 :: 		RadioButton7.Width           = 67;
MOVS	R1, #67
MOVW	R0, #lo_addr(_RadioButton7+10)
MOVT	R0, #hi_addr(_RadioButton7+10)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,1361 :: 		RadioButton7.Height          = 25;
MOVS	R1, #25
MOVW	R0, #lo_addr(_RadioButton7+12)
MOVT	R0, #hi_addr(_RadioButton7+12)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,1362 :: 		RadioButton7.Pen_Width       = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_RadioButton7+14)
MOVT	R0, #hi_addr(_RadioButton7+14)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,1363 :: 		RadioButton7.Pen_Color       = 0x0000;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton7+16)
MOVT	R0, #hi_addr(_RadioButton7+16)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,1364 :: 		RadioButton7.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_RadioButton7+18)
MOVT	R0, #hi_addr(_RadioButton7+18)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,1365 :: 		RadioButton7.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_RadioButton7+19)
MOVT	R0, #hi_addr(_RadioButton7+19)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,1366 :: 		RadioButton7.Checked         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton7+20)
MOVT	R0, #hi_addr(_RadioButton7+20)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,1367 :: 		RadioButton7.Transparent     = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_RadioButton7+21)
MOVT	R0, #hi_addr(_RadioButton7+21)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,1368 :: 		RadioButton7.Caption         = RadioButton7_Caption;
MOVW	R1, #lo_addr(_RadioButton7_Caption+0)
MOVT	R1, #hi_addr(_RadioButton7_Caption+0)
MOVW	R0, #lo_addr(_RadioButton7+24)
MOVT	R0, #hi_addr(_RadioButton7+24)
STR	R1, [R0, #0]
;ECGsynthetic_driver.c,1369 :: 		RadioButton7.TextAlign       = _taLeft;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton7+28)
MOVT	R0, #hi_addr(_RadioButton7+28)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,1370 :: 		RadioButton7.FontName        = DejaVu_Serif16x19_Regular;
MOVW	R0, #lo_addr(_RadioButton7+32)
MOVT	R0, #hi_addr(_RadioButton7+32)
STR	R5, [R0, #0]
;ECGsynthetic_driver.c,1371 :: 		RadioButton7.PressColEnabled = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_RadioButton7+48)
MOVT	R0, #hi_addr(_RadioButton7+48)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,1372 :: 		RadioButton7.Font_Color      = 0x0000;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton7+36)
MOVT	R0, #hi_addr(_RadioButton7+36)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,1373 :: 		RadioButton7.Gradient        = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton7+38)
MOVT	R0, #hi_addr(_RadioButton7+38)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,1374 :: 		RadioButton7.Gradient_Orientation = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton7+39)
MOVT	R0, #hi_addr(_RadioButton7+39)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,1375 :: 		RadioButton7.Gradient_Start_Color = 0xFFFF;
MOVW	R1, #65535
MOVW	R0, #lo_addr(_RadioButton7+40)
MOVT	R0, #hi_addr(_RadioButton7+40)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,1376 :: 		RadioButton7.Gradient_End_Color = 0xC618;
MOVW	R1, #50712
MOVW	R0, #lo_addr(_RadioButton7+42)
MOVT	R0, #hi_addr(_RadioButton7+42)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,1377 :: 		RadioButton7.Color           = 0xFFFF;
MOVW	R1, #65535
MOVW	R0, #lo_addr(_RadioButton7+44)
MOVT	R0, #hi_addr(_RadioButton7+44)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,1378 :: 		RadioButton7.Press_Color     = 0xE71C;
MOVW	R1, #59164
MOVW	R0, #lo_addr(_RadioButton7+50)
MOVT	R0, #hi_addr(_RadioButton7+50)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,1379 :: 		RadioButton7.Background_Color = 0x0000;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton7+46)
MOVT	R0, #hi_addr(_RadioButton7+46)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,1380 :: 		RadioButton7.OnPressPtr      = RadioButton7OnPress;
MOVW	R1, #lo_addr(_RadioButton7OnPress+0)
MOVT	R1, #hi_addr(_RadioButton7OnPress+0)
MOVW	R0, #lo_addr(_RadioButton7+64)
MOVT	R0, #hi_addr(_RadioButton7+64)
STR	R1, [R0, #0]
;ECGsynthetic_driver.c,1382 :: 		RadioButton8.OwnerScreen     = &Screen2;
MOVW	R1, #lo_addr(_Screen2+0)
MOVT	R1, #hi_addr(_Screen2+0)
MOVW	R0, #lo_addr(_RadioButton8+0)
MOVT	R0, #hi_addr(_RadioButton8+0)
STR	R1, [R0, #0]
;ECGsynthetic_driver.c,1383 :: 		RadioButton8.Order           = 5;
MOVS	R1, #5
MOVW	R0, #lo_addr(_RadioButton8+4)
MOVT	R0, #hi_addr(_RadioButton8+4)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,1384 :: 		RadioButton8.Left            = 42;
MOVS	R1, #42
MOVW	R0, #lo_addr(_RadioButton8+6)
MOVT	R0, #hi_addr(_RadioButton8+6)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,1385 :: 		RadioButton8.Top             = 335;
MOVW	R1, #335
MOVW	R0, #lo_addr(_RadioButton8+8)
MOVT	R0, #hi_addr(_RadioButton8+8)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,1386 :: 		RadioButton8.Width           = 67;
MOVS	R1, #67
MOVW	R0, #lo_addr(_RadioButton8+10)
MOVT	R0, #hi_addr(_RadioButton8+10)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,1387 :: 		RadioButton8.Height          = 25;
MOVS	R1, #25
MOVW	R0, #lo_addr(_RadioButton8+12)
MOVT	R0, #hi_addr(_RadioButton8+12)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,1388 :: 		RadioButton8.Pen_Width       = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_RadioButton8+14)
MOVT	R0, #hi_addr(_RadioButton8+14)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,1389 :: 		RadioButton8.Pen_Color       = 0x0000;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton8+16)
MOVT	R0, #hi_addr(_RadioButton8+16)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,1390 :: 		RadioButton8.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_RadioButton8+18)
MOVT	R0, #hi_addr(_RadioButton8+18)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,1391 :: 		RadioButton8.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_RadioButton8+19)
MOVT	R0, #hi_addr(_RadioButton8+19)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,1392 :: 		RadioButton8.Checked         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton8+20)
MOVT	R0, #hi_addr(_RadioButton8+20)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,1393 :: 		RadioButton8.Transparent     = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_RadioButton8+21)
MOVT	R0, #hi_addr(_RadioButton8+21)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,1394 :: 		RadioButton8.Caption         = RadioButton8_Caption;
MOVW	R1, #lo_addr(_RadioButton8_Caption+0)
MOVT	R1, #hi_addr(_RadioButton8_Caption+0)
MOVW	R0, #lo_addr(_RadioButton8+24)
MOVT	R0, #hi_addr(_RadioButton8+24)
STR	R1, [R0, #0]
;ECGsynthetic_driver.c,1395 :: 		RadioButton8.TextAlign       = _taLeft;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton8+28)
MOVT	R0, #hi_addr(_RadioButton8+28)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,1396 :: 		RadioButton8.FontName        = DejaVu_Serif16x19_Regular;
MOVW	R0, #lo_addr(_RadioButton8+32)
MOVT	R0, #hi_addr(_RadioButton8+32)
STR	R5, [R0, #0]
;ECGsynthetic_driver.c,1397 :: 		RadioButton8.PressColEnabled = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_RadioButton8+48)
MOVT	R0, #hi_addr(_RadioButton8+48)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,1398 :: 		RadioButton8.Font_Color      = 0x0000;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton8+36)
MOVT	R0, #hi_addr(_RadioButton8+36)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,1399 :: 		RadioButton8.Gradient        = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton8+38)
MOVT	R0, #hi_addr(_RadioButton8+38)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,1400 :: 		RadioButton8.Gradient_Orientation = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton8+39)
MOVT	R0, #hi_addr(_RadioButton8+39)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,1401 :: 		RadioButton8.Gradient_Start_Color = 0xFFFF;
MOVW	R1, #65535
MOVW	R0, #lo_addr(_RadioButton8+40)
MOVT	R0, #hi_addr(_RadioButton8+40)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,1402 :: 		RadioButton8.Gradient_End_Color = 0xC618;
MOVW	R1, #50712
MOVW	R0, #lo_addr(_RadioButton8+42)
MOVT	R0, #hi_addr(_RadioButton8+42)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,1403 :: 		RadioButton8.Color           = 0xFFFF;
MOVW	R1, #65535
MOVW	R0, #lo_addr(_RadioButton8+44)
MOVT	R0, #hi_addr(_RadioButton8+44)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,1404 :: 		RadioButton8.Press_Color     = 0xE71C;
MOVW	R1, #59164
MOVW	R0, #lo_addr(_RadioButton8+50)
MOVT	R0, #hi_addr(_RadioButton8+50)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,1405 :: 		RadioButton8.Background_Color = 0x0000;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton8+46)
MOVT	R0, #hi_addr(_RadioButton8+46)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,1406 :: 		RadioButton8.OnPressPtr      = RadioButton8OnPress;
MOVW	R1, #lo_addr(_RadioButton8OnPress+0)
MOVT	R1, #hi_addr(_RadioButton8OnPress+0)
MOVW	R0, #lo_addr(_RadioButton8+64)
MOVT	R0, #hi_addr(_RadioButton8+64)
STR	R1, [R0, #0]
;ECGsynthetic_driver.c,1408 :: 		RadioButton9.OwnerScreen     = &Screen2;
MOVW	R1, #lo_addr(_Screen2+0)
MOVT	R1, #hi_addr(_Screen2+0)
MOVW	R0, #lo_addr(_RadioButton9+0)
MOVT	R0, #hi_addr(_RadioButton9+0)
STR	R1, [R0, #0]
;ECGsynthetic_driver.c,1409 :: 		RadioButton9.Order           = 6;
MOVS	R1, #6
MOVW	R0, #lo_addr(_RadioButton9+4)
MOVT	R0, #hi_addr(_RadioButton9+4)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,1410 :: 		RadioButton9.Left            = 139;
MOVS	R1, #139
MOVW	R0, #lo_addr(_RadioButton9+6)
MOVT	R0, #hi_addr(_RadioButton9+6)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,1411 :: 		RadioButton9.Top             = 134;
MOVS	R1, #134
MOVW	R0, #lo_addr(_RadioButton9+8)
MOVT	R0, #hi_addr(_RadioButton9+8)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,1412 :: 		RadioButton9.Width           = 57;
MOVS	R1, #57
MOVW	R0, #lo_addr(_RadioButton9+10)
MOVT	R0, #hi_addr(_RadioButton9+10)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,1413 :: 		RadioButton9.Height          = 25;
MOVS	R1, #25
MOVW	R0, #lo_addr(_RadioButton9+12)
MOVT	R0, #hi_addr(_RadioButton9+12)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,1414 :: 		RadioButton9.Pen_Width       = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_RadioButton9+14)
MOVT	R0, #hi_addr(_RadioButton9+14)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,1415 :: 		RadioButton9.Pen_Color       = 0x0000;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton9+16)
MOVT	R0, #hi_addr(_RadioButton9+16)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,1416 :: 		RadioButton9.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_RadioButton9+18)
MOVT	R0, #hi_addr(_RadioButton9+18)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,1417 :: 		RadioButton9.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_RadioButton9+19)
MOVT	R0, #hi_addr(_RadioButton9+19)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,1418 :: 		RadioButton9.Checked         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton9+20)
MOVT	R0, #hi_addr(_RadioButton9+20)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,1419 :: 		RadioButton9.Transparent     = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_RadioButton9+21)
MOVT	R0, #hi_addr(_RadioButton9+21)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,1420 :: 		RadioButton9.Caption         = RadioButton9_Caption;
MOVW	R1, #lo_addr(_RadioButton9_Caption+0)
MOVT	R1, #hi_addr(_RadioButton9_Caption+0)
MOVW	R0, #lo_addr(_RadioButton9+24)
MOVT	R0, #hi_addr(_RadioButton9+24)
STR	R1, [R0, #0]
;ECGsynthetic_driver.c,1421 :: 		RadioButton9.TextAlign       = _taLeft;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton9+28)
MOVT	R0, #hi_addr(_RadioButton9+28)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,1422 :: 		RadioButton9.FontName        = DejaVu_Serif16x19_Regular;
MOVW	R0, #lo_addr(_RadioButton9+32)
MOVT	R0, #hi_addr(_RadioButton9+32)
STR	R5, [R0, #0]
;ECGsynthetic_driver.c,1423 :: 		RadioButton9.PressColEnabled = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_RadioButton9+48)
MOVT	R0, #hi_addr(_RadioButton9+48)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,1424 :: 		RadioButton9.Font_Color      = 0x0000;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton9+36)
MOVT	R0, #hi_addr(_RadioButton9+36)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,1425 :: 		RadioButton9.Gradient        = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton9+38)
MOVT	R0, #hi_addr(_RadioButton9+38)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,1426 :: 		RadioButton9.Gradient_Orientation = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton9+39)
MOVT	R0, #hi_addr(_RadioButton9+39)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,1427 :: 		RadioButton9.Gradient_Start_Color = 0xFFFF;
MOVW	R1, #65535
MOVW	R0, #lo_addr(_RadioButton9+40)
MOVT	R0, #hi_addr(_RadioButton9+40)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,1428 :: 		RadioButton9.Gradient_End_Color = 0xC618;
MOVW	R1, #50712
MOVW	R0, #lo_addr(_RadioButton9+42)
MOVT	R0, #hi_addr(_RadioButton9+42)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,1429 :: 		RadioButton9.Color           = 0xFFFF;
MOVW	R1, #65535
MOVW	R0, #lo_addr(_RadioButton9+44)
MOVT	R0, #hi_addr(_RadioButton9+44)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,1430 :: 		RadioButton9.Press_Color     = 0xE71C;
MOVW	R1, #59164
MOVW	R0, #lo_addr(_RadioButton9+50)
MOVT	R0, #hi_addr(_RadioButton9+50)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,1431 :: 		RadioButton9.Background_Color = 0x0000;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton9+46)
MOVT	R0, #hi_addr(_RadioButton9+46)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,1432 :: 		RadioButton9.OnPressPtr      = RadioButton9OnPress;
MOVW	R1, #lo_addr(_RadioButton9OnPress+0)
MOVT	R1, #hi_addr(_RadioButton9OnPress+0)
MOVW	R0, #lo_addr(_RadioButton9+64)
MOVT	R0, #hi_addr(_RadioButton9+64)
STR	R1, [R0, #0]
;ECGsynthetic_driver.c,1434 :: 		RadioButton10.OwnerScreen     = &Screen2;
MOVW	R1, #lo_addr(_Screen2+0)
MOVT	R1, #hi_addr(_Screen2+0)
MOVW	R0, #lo_addr(_RadioButton10+0)
MOVT	R0, #hi_addr(_RadioButton10+0)
STR	R1, [R0, #0]
;ECGsynthetic_driver.c,1435 :: 		RadioButton10.Order           = 7;
MOVS	R1, #7
MOVW	R0, #lo_addr(_RadioButton10+4)
MOVT	R0, #hi_addr(_RadioButton10+4)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,1436 :: 		RadioButton10.Left            = 139;
MOVS	R1, #139
MOVW	R0, #lo_addr(_RadioButton10+6)
MOVT	R0, #hi_addr(_RadioButton10+6)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,1437 :: 		RadioButton10.Top             = 174;
MOVS	R1, #174
MOVW	R0, #lo_addr(_RadioButton10+8)
MOVT	R0, #hi_addr(_RadioButton10+8)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,1438 :: 		RadioButton10.Width           = 57;
MOVS	R1, #57
MOVW	R0, #lo_addr(_RadioButton10+10)
MOVT	R0, #hi_addr(_RadioButton10+10)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,1439 :: 		RadioButton10.Height          = 25;
MOVS	R1, #25
MOVW	R0, #lo_addr(_RadioButton10+12)
MOVT	R0, #hi_addr(_RadioButton10+12)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,1440 :: 		RadioButton10.Pen_Width       = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_RadioButton10+14)
MOVT	R0, #hi_addr(_RadioButton10+14)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,1441 :: 		RadioButton10.Pen_Color       = 0x0000;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton10+16)
MOVT	R0, #hi_addr(_RadioButton10+16)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,1442 :: 		RadioButton10.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_RadioButton10+18)
MOVT	R0, #hi_addr(_RadioButton10+18)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,1443 :: 		RadioButton10.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_RadioButton10+19)
MOVT	R0, #hi_addr(_RadioButton10+19)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,1444 :: 		RadioButton10.Checked         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton10+20)
MOVT	R0, #hi_addr(_RadioButton10+20)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,1445 :: 		RadioButton10.Transparent     = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_RadioButton10+21)
MOVT	R0, #hi_addr(_RadioButton10+21)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,1446 :: 		RadioButton10.Caption         = RadioButton10_Caption;
MOVW	R1, #lo_addr(_RadioButton10_Caption+0)
MOVT	R1, #hi_addr(_RadioButton10_Caption+0)
MOVW	R0, #lo_addr(_RadioButton10+24)
MOVT	R0, #hi_addr(_RadioButton10+24)
STR	R1, [R0, #0]
;ECGsynthetic_driver.c,1447 :: 		RadioButton10.TextAlign       = _taLeft;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton10+28)
MOVT	R0, #hi_addr(_RadioButton10+28)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,1448 :: 		RadioButton10.FontName        = DejaVu_Serif16x19_Regular;
MOVW	R0, #lo_addr(_RadioButton10+32)
MOVT	R0, #hi_addr(_RadioButton10+32)
STR	R5, [R0, #0]
;ECGsynthetic_driver.c,1449 :: 		RadioButton10.PressColEnabled = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_RadioButton10+48)
MOVT	R0, #hi_addr(_RadioButton10+48)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,1450 :: 		RadioButton10.Font_Color      = 0x0000;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton10+36)
MOVT	R0, #hi_addr(_RadioButton10+36)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,1451 :: 		RadioButton10.Gradient        = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton10+38)
MOVT	R0, #hi_addr(_RadioButton10+38)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,1452 :: 		RadioButton10.Gradient_Orientation = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton10+39)
MOVT	R0, #hi_addr(_RadioButton10+39)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,1453 :: 		RadioButton10.Gradient_Start_Color = 0xFFFF;
MOVW	R1, #65535
MOVW	R0, #lo_addr(_RadioButton10+40)
MOVT	R0, #hi_addr(_RadioButton10+40)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,1454 :: 		RadioButton10.Gradient_End_Color = 0xC618;
MOVW	R1, #50712
MOVW	R0, #lo_addr(_RadioButton10+42)
MOVT	R0, #hi_addr(_RadioButton10+42)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,1455 :: 		RadioButton10.Color           = 0xFFFF;
MOVW	R1, #65535
MOVW	R0, #lo_addr(_RadioButton10+44)
MOVT	R0, #hi_addr(_RadioButton10+44)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,1456 :: 		RadioButton10.Press_Color     = 0xE71C;
MOVW	R1, #59164
MOVW	R0, #lo_addr(_RadioButton10+50)
MOVT	R0, #hi_addr(_RadioButton10+50)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,1457 :: 		RadioButton10.Background_Color = 0x0000;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton10+46)
MOVT	R0, #hi_addr(_RadioButton10+46)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,1458 :: 		RadioButton10.OnPressPtr      = RadioButton10OnPress;
MOVW	R1, #lo_addr(_RadioButton10OnPress+0)
MOVT	R1, #hi_addr(_RadioButton10OnPress+0)
MOVW	R0, #lo_addr(_RadioButton10+64)
MOVT	R0, #hi_addr(_RadioButton10+64)
STR	R1, [R0, #0]
;ECGsynthetic_driver.c,1460 :: 		RadioButton11.OwnerScreen     = &Screen2;
MOVW	R1, #lo_addr(_Screen2+0)
MOVT	R1, #hi_addr(_Screen2+0)
MOVW	R0, #lo_addr(_RadioButton11+0)
MOVT	R0, #hi_addr(_RadioButton11+0)
STR	R1, [R0, #0]
;ECGsynthetic_driver.c,1461 :: 		RadioButton11.Order           = 8;
MOVS	R1, #8
MOVW	R0, #lo_addr(_RadioButton11+4)
MOVT	R0, #hi_addr(_RadioButton11+4)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,1462 :: 		RadioButton11.Left            = 139;
MOVS	R1, #139
MOVW	R0, #lo_addr(_RadioButton11+6)
MOVT	R0, #hi_addr(_RadioButton11+6)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,1463 :: 		RadioButton11.Top             = 214;
MOVS	R1, #214
MOVW	R0, #lo_addr(_RadioButton11+8)
MOVT	R0, #hi_addr(_RadioButton11+8)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,1464 :: 		RadioButton11.Width           = 57;
MOVS	R1, #57
MOVW	R0, #lo_addr(_RadioButton11+10)
MOVT	R0, #hi_addr(_RadioButton11+10)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,1465 :: 		RadioButton11.Height          = 25;
MOVS	R1, #25
MOVW	R0, #lo_addr(_RadioButton11+12)
MOVT	R0, #hi_addr(_RadioButton11+12)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,1466 :: 		RadioButton11.Pen_Width       = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_RadioButton11+14)
MOVT	R0, #hi_addr(_RadioButton11+14)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,1467 :: 		RadioButton11.Pen_Color       = 0x0000;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton11+16)
MOVT	R0, #hi_addr(_RadioButton11+16)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,1468 :: 		RadioButton11.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_RadioButton11+18)
MOVT	R0, #hi_addr(_RadioButton11+18)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,1469 :: 		RadioButton11.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_RadioButton11+19)
MOVT	R0, #hi_addr(_RadioButton11+19)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,1470 :: 		RadioButton11.Checked         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton11+20)
MOVT	R0, #hi_addr(_RadioButton11+20)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,1471 :: 		RadioButton11.Transparent     = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_RadioButton11+21)
MOVT	R0, #hi_addr(_RadioButton11+21)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,1472 :: 		RadioButton11.Caption         = RadioButton11_Caption;
MOVW	R1, #lo_addr(_RadioButton11_Caption+0)
MOVT	R1, #hi_addr(_RadioButton11_Caption+0)
MOVW	R0, #lo_addr(_RadioButton11+24)
MOVT	R0, #hi_addr(_RadioButton11+24)
STR	R1, [R0, #0]
;ECGsynthetic_driver.c,1473 :: 		RadioButton11.TextAlign       = _taLeft;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton11+28)
MOVT	R0, #hi_addr(_RadioButton11+28)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,1474 :: 		RadioButton11.FontName        = DejaVu_Serif16x19_Regular;
MOVW	R0, #lo_addr(_RadioButton11+32)
MOVT	R0, #hi_addr(_RadioButton11+32)
STR	R5, [R0, #0]
;ECGsynthetic_driver.c,1475 :: 		RadioButton11.PressColEnabled = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_RadioButton11+48)
MOVT	R0, #hi_addr(_RadioButton11+48)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,1476 :: 		RadioButton11.Font_Color      = 0x0000;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton11+36)
MOVT	R0, #hi_addr(_RadioButton11+36)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,1477 :: 		RadioButton11.Gradient        = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton11+38)
MOVT	R0, #hi_addr(_RadioButton11+38)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,1478 :: 		RadioButton11.Gradient_Orientation = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton11+39)
MOVT	R0, #hi_addr(_RadioButton11+39)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,1479 :: 		RadioButton11.Gradient_Start_Color = 0xFFFF;
MOVW	R1, #65535
MOVW	R0, #lo_addr(_RadioButton11+40)
MOVT	R0, #hi_addr(_RadioButton11+40)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,1480 :: 		RadioButton11.Gradient_End_Color = 0xC618;
MOVW	R1, #50712
MOVW	R0, #lo_addr(_RadioButton11+42)
MOVT	R0, #hi_addr(_RadioButton11+42)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,1481 :: 		RadioButton11.Color           = 0xFFFF;
MOVW	R1, #65535
MOVW	R0, #lo_addr(_RadioButton11+44)
MOVT	R0, #hi_addr(_RadioButton11+44)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,1482 :: 		RadioButton11.Press_Color     = 0xE71C;
MOVW	R1, #59164
MOVW	R0, #lo_addr(_RadioButton11+50)
MOVT	R0, #hi_addr(_RadioButton11+50)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,1483 :: 		RadioButton11.Background_Color = 0x0000;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton11+46)
MOVT	R0, #hi_addr(_RadioButton11+46)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,1484 :: 		RadioButton11.OnPressPtr      = RadioButton11OnPress;
MOVW	R1, #lo_addr(_RadioButton11OnPress+0)
MOVT	R1, #hi_addr(_RadioButton11OnPress+0)
MOVW	R0, #lo_addr(_RadioButton11+64)
MOVT	R0, #hi_addr(_RadioButton11+64)
STR	R1, [R0, #0]
;ECGsynthetic_driver.c,1486 :: 		RadioButton12.OwnerScreen     = &Screen2;
MOVW	R1, #lo_addr(_Screen2+0)
MOVT	R1, #hi_addr(_Screen2+0)
MOVW	R0, #lo_addr(_RadioButton12+0)
MOVT	R0, #hi_addr(_RadioButton12+0)
STR	R1, [R0, #0]
;ECGsynthetic_driver.c,1487 :: 		RadioButton12.Order           = 9;
MOVS	R1, #9
MOVW	R0, #lo_addr(_RadioButton12+4)
MOVT	R0, #hi_addr(_RadioButton12+4)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,1488 :: 		RadioButton12.Left            = 139;
MOVS	R1, #139
MOVW	R0, #lo_addr(_RadioButton12+6)
MOVT	R0, #hi_addr(_RadioButton12+6)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,1489 :: 		RadioButton12.Top             = 254;
MOVS	R1, #254
MOVW	R0, #lo_addr(_RadioButton12+8)
MOVT	R0, #hi_addr(_RadioButton12+8)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,1490 :: 		RadioButton12.Width           = 57;
MOVS	R1, #57
MOVW	R0, #lo_addr(_RadioButton12+10)
MOVT	R0, #hi_addr(_RadioButton12+10)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,1491 :: 		RadioButton12.Height          = 25;
MOVS	R1, #25
MOVW	R0, #lo_addr(_RadioButton12+12)
MOVT	R0, #hi_addr(_RadioButton12+12)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,1492 :: 		RadioButton12.Pen_Width       = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_RadioButton12+14)
MOVT	R0, #hi_addr(_RadioButton12+14)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,1493 :: 		RadioButton12.Pen_Color       = 0x0000;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton12+16)
MOVT	R0, #hi_addr(_RadioButton12+16)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,1494 :: 		RadioButton12.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_RadioButton12+18)
MOVT	R0, #hi_addr(_RadioButton12+18)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,1495 :: 		RadioButton12.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_RadioButton12+19)
MOVT	R0, #hi_addr(_RadioButton12+19)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,1496 :: 		RadioButton12.Checked         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton12+20)
MOVT	R0, #hi_addr(_RadioButton12+20)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,1497 :: 		RadioButton12.Transparent     = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_RadioButton12+21)
MOVT	R0, #hi_addr(_RadioButton12+21)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,1498 :: 		RadioButton12.Caption         = RadioButton12_Caption;
MOVW	R1, #lo_addr(_RadioButton12_Caption+0)
MOVT	R1, #hi_addr(_RadioButton12_Caption+0)
MOVW	R0, #lo_addr(_RadioButton12+24)
MOVT	R0, #hi_addr(_RadioButton12+24)
STR	R1, [R0, #0]
;ECGsynthetic_driver.c,1499 :: 		RadioButton12.TextAlign       = _taLeft;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton12+28)
MOVT	R0, #hi_addr(_RadioButton12+28)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,1500 :: 		RadioButton12.FontName        = DejaVu_Serif16x19_Regular;
MOVW	R0, #lo_addr(_RadioButton12+32)
MOVT	R0, #hi_addr(_RadioButton12+32)
STR	R5, [R0, #0]
;ECGsynthetic_driver.c,1501 :: 		RadioButton12.PressColEnabled = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_RadioButton12+48)
MOVT	R0, #hi_addr(_RadioButton12+48)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,1502 :: 		RadioButton12.Font_Color      = 0x0000;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton12+36)
MOVT	R0, #hi_addr(_RadioButton12+36)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,1503 :: 		RadioButton12.Gradient        = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton12+38)
MOVT	R0, #hi_addr(_RadioButton12+38)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,1504 :: 		RadioButton12.Gradient_Orientation = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton12+39)
MOVT	R0, #hi_addr(_RadioButton12+39)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,1505 :: 		RadioButton12.Gradient_Start_Color = 0xFFFF;
MOVW	R1, #65535
MOVW	R0, #lo_addr(_RadioButton12+40)
MOVT	R0, #hi_addr(_RadioButton12+40)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,1506 :: 		RadioButton12.Gradient_End_Color = 0xC618;
MOVW	R1, #50712
MOVW	R0, #lo_addr(_RadioButton12+42)
MOVT	R0, #hi_addr(_RadioButton12+42)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,1507 :: 		RadioButton12.Color           = 0xFFFF;
MOVW	R1, #65535
MOVW	R0, #lo_addr(_RadioButton12+44)
MOVT	R0, #hi_addr(_RadioButton12+44)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,1508 :: 		RadioButton12.Press_Color     = 0xE71C;
MOVW	R1, #59164
MOVW	R0, #lo_addr(_RadioButton12+50)
MOVT	R0, #hi_addr(_RadioButton12+50)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,1509 :: 		RadioButton12.Background_Color = 0x0000;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton12+46)
MOVT	R0, #hi_addr(_RadioButton12+46)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,1510 :: 		RadioButton12.OnPressPtr      = RadioButton12OnPress;
MOVW	R1, #lo_addr(_RadioButton12OnPress+0)
MOVT	R1, #hi_addr(_RadioButton12OnPress+0)
MOVW	R0, #lo_addr(_RadioButton12+64)
MOVT	R0, #hi_addr(_RadioButton12+64)
STR	R1, [R0, #0]
;ECGsynthetic_driver.c,1512 :: 		RadioButton13.OwnerScreen     = &Screen2;
MOVW	R1, #lo_addr(_Screen2+0)
MOVT	R1, #hi_addr(_Screen2+0)
MOVW	R0, #lo_addr(_RadioButton13+0)
MOVT	R0, #hi_addr(_RadioButton13+0)
STR	R1, [R0, #0]
;ECGsynthetic_driver.c,1513 :: 		RadioButton13.Order           = 10;
MOVS	R1, #10
MOVW	R0, #lo_addr(_RadioButton13+4)
MOVT	R0, #hi_addr(_RadioButton13+4)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,1514 :: 		RadioButton13.Left            = 139;
MOVS	R1, #139
MOVW	R0, #lo_addr(_RadioButton13+6)
MOVT	R0, #hi_addr(_RadioButton13+6)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,1515 :: 		RadioButton13.Top             = 292;
MOVW	R1, #292
MOVW	R0, #lo_addr(_RadioButton13+8)
MOVT	R0, #hi_addr(_RadioButton13+8)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,1516 :: 		RadioButton13.Width           = 57;
MOVS	R1, #57
MOVW	R0, #lo_addr(_RadioButton13+10)
MOVT	R0, #hi_addr(_RadioButton13+10)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,1517 :: 		RadioButton13.Height          = 25;
MOVS	R1, #25
MOVW	R0, #lo_addr(_RadioButton13+12)
MOVT	R0, #hi_addr(_RadioButton13+12)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,1518 :: 		RadioButton13.Pen_Width       = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_RadioButton13+14)
MOVT	R0, #hi_addr(_RadioButton13+14)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,1519 :: 		RadioButton13.Pen_Color       = 0x0000;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton13+16)
MOVT	R0, #hi_addr(_RadioButton13+16)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,1520 :: 		RadioButton13.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_RadioButton13+18)
MOVT	R0, #hi_addr(_RadioButton13+18)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,1521 :: 		RadioButton13.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_RadioButton13+19)
MOVT	R0, #hi_addr(_RadioButton13+19)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,1522 :: 		RadioButton13.Checked         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton13+20)
MOVT	R0, #hi_addr(_RadioButton13+20)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,1523 :: 		RadioButton13.Transparent     = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_RadioButton13+21)
MOVT	R0, #hi_addr(_RadioButton13+21)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,1524 :: 		RadioButton13.Caption         = RadioButton13_Caption;
MOVW	R1, #lo_addr(_RadioButton13_Caption+0)
MOVT	R1, #hi_addr(_RadioButton13_Caption+0)
MOVW	R0, #lo_addr(_RadioButton13+24)
MOVT	R0, #hi_addr(_RadioButton13+24)
STR	R1, [R0, #0]
;ECGsynthetic_driver.c,1525 :: 		RadioButton13.TextAlign       = _taLeft;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton13+28)
MOVT	R0, #hi_addr(_RadioButton13+28)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,1526 :: 		RadioButton13.FontName        = DejaVu_Serif16x19_Regular;
MOVW	R0, #lo_addr(_RadioButton13+32)
MOVT	R0, #hi_addr(_RadioButton13+32)
STR	R5, [R0, #0]
;ECGsynthetic_driver.c,1527 :: 		RadioButton13.PressColEnabled = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_RadioButton13+48)
MOVT	R0, #hi_addr(_RadioButton13+48)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,1528 :: 		RadioButton13.Font_Color      = 0x0000;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton13+36)
MOVT	R0, #hi_addr(_RadioButton13+36)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,1529 :: 		RadioButton13.Gradient        = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton13+38)
MOVT	R0, #hi_addr(_RadioButton13+38)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,1530 :: 		RadioButton13.Gradient_Orientation = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton13+39)
MOVT	R0, #hi_addr(_RadioButton13+39)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,1531 :: 		RadioButton13.Gradient_Start_Color = 0xFFFF;
MOVW	R1, #65535
MOVW	R0, #lo_addr(_RadioButton13+40)
MOVT	R0, #hi_addr(_RadioButton13+40)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,1532 :: 		RadioButton13.Gradient_End_Color = 0xC618;
MOVW	R1, #50712
MOVW	R0, #lo_addr(_RadioButton13+42)
MOVT	R0, #hi_addr(_RadioButton13+42)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,1533 :: 		RadioButton13.Color           = 0xFFFF;
MOVW	R1, #65535
MOVW	R0, #lo_addr(_RadioButton13+44)
MOVT	R0, #hi_addr(_RadioButton13+44)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,1534 :: 		RadioButton13.Press_Color     = 0xE71C;
MOVW	R1, #59164
MOVW	R0, #lo_addr(_RadioButton13+50)
MOVT	R0, #hi_addr(_RadioButton13+50)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,1535 :: 		RadioButton13.Background_Color = 0x0000;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton13+46)
MOVT	R0, #hi_addr(_RadioButton13+46)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,1536 :: 		RadioButton13.OnPressPtr      = RadioButton13OnPress;
MOVW	R1, #lo_addr(_RadioButton13OnPress+0)
MOVT	R1, #hi_addr(_RadioButton13OnPress+0)
MOVW	R0, #lo_addr(_RadioButton13+64)
MOVT	R0, #hi_addr(_RadioButton13+64)
STR	R1, [R0, #0]
;ECGsynthetic_driver.c,1538 :: 		RadioButton14.OwnerScreen     = &Screen2;
MOVW	R1, #lo_addr(_Screen2+0)
MOVT	R1, #hi_addr(_Screen2+0)
MOVW	R0, #lo_addr(_RadioButton14+0)
MOVT	R0, #hi_addr(_RadioButton14+0)
STR	R1, [R0, #0]
;ECGsynthetic_driver.c,1539 :: 		RadioButton14.Order           = 11;
MOVS	R1, #11
MOVW	R0, #lo_addr(_RadioButton14+4)
MOVT	R0, #hi_addr(_RadioButton14+4)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,1540 :: 		RadioButton14.Left            = 140;
MOVS	R1, #140
MOVW	R0, #lo_addr(_RadioButton14+6)
MOVT	R0, #hi_addr(_RadioButton14+6)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,1541 :: 		RadioButton14.Top             = 335;
MOVW	R1, #335
MOVW	R0, #lo_addr(_RadioButton14+8)
MOVT	R0, #hi_addr(_RadioButton14+8)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,1542 :: 		RadioButton14.Width           = 57;
MOVS	R1, #57
MOVW	R0, #lo_addr(_RadioButton14+10)
MOVT	R0, #hi_addr(_RadioButton14+10)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,1543 :: 		RadioButton14.Height          = 25;
MOVS	R1, #25
MOVW	R0, #lo_addr(_RadioButton14+12)
MOVT	R0, #hi_addr(_RadioButton14+12)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,1544 :: 		RadioButton14.Pen_Width       = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_RadioButton14+14)
MOVT	R0, #hi_addr(_RadioButton14+14)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,1545 :: 		RadioButton14.Pen_Color       = 0x0000;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton14+16)
MOVT	R0, #hi_addr(_RadioButton14+16)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,1546 :: 		RadioButton14.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_RadioButton14+18)
MOVT	R0, #hi_addr(_RadioButton14+18)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,1547 :: 		RadioButton14.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_RadioButton14+19)
MOVT	R0, #hi_addr(_RadioButton14+19)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,1548 :: 		RadioButton14.Checked         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton14+20)
MOVT	R0, #hi_addr(_RadioButton14+20)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,1549 :: 		RadioButton14.Transparent     = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_RadioButton14+21)
MOVT	R0, #hi_addr(_RadioButton14+21)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,1550 :: 		RadioButton14.Caption         = RadioButton14_Caption;
MOVW	R1, #lo_addr(_RadioButton14_Caption+0)
MOVT	R1, #hi_addr(_RadioButton14_Caption+0)
MOVW	R0, #lo_addr(_RadioButton14+24)
MOVT	R0, #hi_addr(_RadioButton14+24)
STR	R1, [R0, #0]
;ECGsynthetic_driver.c,1551 :: 		RadioButton14.TextAlign       = _taLeft;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton14+28)
MOVT	R0, #hi_addr(_RadioButton14+28)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,1552 :: 		RadioButton14.FontName        = DejaVu_Serif16x19_Regular;
MOVW	R0, #lo_addr(_RadioButton14+32)
MOVT	R0, #hi_addr(_RadioButton14+32)
STR	R5, [R0, #0]
;ECGsynthetic_driver.c,1553 :: 		RadioButton14.PressColEnabled = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_RadioButton14+48)
MOVT	R0, #hi_addr(_RadioButton14+48)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,1554 :: 		RadioButton14.Font_Color      = 0x0000;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton14+36)
MOVT	R0, #hi_addr(_RadioButton14+36)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,1555 :: 		RadioButton14.Gradient        = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton14+38)
MOVT	R0, #hi_addr(_RadioButton14+38)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,1556 :: 		RadioButton14.Gradient_Orientation = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton14+39)
MOVT	R0, #hi_addr(_RadioButton14+39)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,1557 :: 		RadioButton14.Gradient_Start_Color = 0xFFFF;
MOVW	R1, #65535
MOVW	R0, #lo_addr(_RadioButton14+40)
MOVT	R0, #hi_addr(_RadioButton14+40)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,1558 :: 		RadioButton14.Gradient_End_Color = 0xC618;
MOVW	R1, #50712
MOVW	R0, #lo_addr(_RadioButton14+42)
MOVT	R0, #hi_addr(_RadioButton14+42)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,1559 :: 		RadioButton14.Color           = 0xFFFF;
MOVW	R1, #65535
MOVW	R0, #lo_addr(_RadioButton14+44)
MOVT	R0, #hi_addr(_RadioButton14+44)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,1560 :: 		RadioButton14.Press_Color     = 0xE71C;
MOVW	R1, #59164
MOVW	R0, #lo_addr(_RadioButton14+50)
MOVT	R0, #hi_addr(_RadioButton14+50)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,1561 :: 		RadioButton14.Background_Color = 0x0000;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton14+46)
MOVT	R0, #hi_addr(_RadioButton14+46)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,1562 :: 		RadioButton14.OnPressPtr      = RadioButton14OnPress;
MOVW	R1, #lo_addr(_RadioButton14OnPress+0)
MOVT	R1, #hi_addr(_RadioButton14OnPress+0)
MOVW	R0, #lo_addr(_RadioButton14+64)
MOVT	R0, #hi_addr(_RadioButton14+64)
STR	R1, [R0, #0]
;ECGsynthetic_driver.c,1564 :: 		Label15.OwnerScreen     = &Screen2;
MOVW	R1, #lo_addr(_Screen2+0)
MOVT	R1, #hi_addr(_Screen2+0)
MOVW	R0, #lo_addr(_Label15+0)
MOVT	R0, #hi_addr(_Label15+0)
STR	R1, [R0, #0]
;ECGsynthetic_driver.c,1565 :: 		Label15.Order           = 12;
MOVS	R1, #12
MOVW	R0, #lo_addr(_Label15+4)
MOVT	R0, #hi_addr(_Label15+4)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,1566 :: 		Label15.Left            = 376;
MOVW	R1, #376
MOVW	R0, #lo_addr(_Label15+6)
MOVT	R0, #hi_addr(_Label15+6)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,1567 :: 		Label15.Top             = 38;
MOVS	R1, #38
MOVW	R0, #lo_addr(_Label15+8)
MOVT	R0, #hi_addr(_Label15+8)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,1568 :: 		Label15.Width           = 201;
MOVS	R1, #201
MOVW	R0, #lo_addr(_Label15+10)
MOVT	R0, #hi_addr(_Label15+10)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,1569 :: 		Label15.Height          = 26;
MOVS	R1, #26
MOVW	R0, #lo_addr(_Label15+12)
MOVT	R0, #hi_addr(_Label15+12)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,1570 :: 		Label15.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Label15+27)
MOVT	R0, #hi_addr(_Label15+27)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,1571 :: 		Label15.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Label15+28)
MOVT	R0, #hi_addr(_Label15+28)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,1572 :: 		Label15.Caption         = Label15_Caption;
MOVW	R1, #lo_addr(_Label15_Caption+0)
MOVT	R1, #hi_addr(_Label15_Caption+0)
MOVW	R0, #lo_addr(_Label15+16)
MOVT	R0, #hi_addr(_Label15+16)
STR	R1, [R0, #0]
;ECGsynthetic_driver.c,1573 :: 		Label15.FontName        = DejaVu_Serif22x24_Bold;
MOVW	R4, #lo_addr(_DejaVu_Serif22x24_Bold+0)
MOVT	R4, #hi_addr(_DejaVu_Serif22x24_Bold+0)
MOVW	R0, #lo_addr(_Label15+20)
MOVT	R0, #hi_addr(_Label15+20)
STR	R4, [R0, #0]
;ECGsynthetic_driver.c,1574 :: 		Label15.Font_Color      = 0x0000;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label15+24)
MOVT	R0, #hi_addr(_Label15+24)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,1575 :: 		Label15.VerticalText    = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label15+26)
MOVT	R0, #hi_addr(_Label15+26)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,1577 :: 		ButtonRound3.OwnerScreen     = &Screen2;
MOVW	R1, #lo_addr(_Screen2+0)
MOVT	R1, #hi_addr(_Screen2+0)
MOVW	R0, #lo_addr(_ButtonRound3+0)
MOVT	R0, #hi_addr(_ButtonRound3+0)
STR	R1, [R0, #0]
;ECGsynthetic_driver.c,1578 :: 		ButtonRound3.Order           = 13;
MOVS	R1, #13
MOVW	R0, #lo_addr(_ButtonRound3+4)
MOVT	R0, #hi_addr(_ButtonRound3+4)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,1579 :: 		ButtonRound3.Left            = 631;
MOVW	R1, #631
MOVW	R0, #lo_addr(_ButtonRound3+6)
MOVT	R0, #hi_addr(_ButtonRound3+6)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,1580 :: 		ButtonRound3.Top             = 402;
MOVW	R1, #402
MOVW	R0, #lo_addr(_ButtonRound3+8)
MOVT	R0, #hi_addr(_ButtonRound3+8)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,1581 :: 		ButtonRound3.Width           = 109;
MOVS	R1, #109
MOVW	R0, #lo_addr(_ButtonRound3+10)
MOVT	R0, #hi_addr(_ButtonRound3+10)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,1582 :: 		ButtonRound3.Height          = 53;
MOVS	R1, #53
MOVW	R0, #lo_addr(_ButtonRound3+12)
MOVT	R0, #hi_addr(_ButtonRound3+12)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,1583 :: 		ButtonRound3.Pen_Width       = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_ButtonRound3+14)
MOVT	R0, #hi_addr(_ButtonRound3+14)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,1584 :: 		ButtonRound3.Pen_Color       = 0x07E0;
MOVW	R1, #2016
MOVW	R0, #lo_addr(_ButtonRound3+16)
MOVT	R0, #hi_addr(_ButtonRound3+16)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,1585 :: 		ButtonRound3.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_ButtonRound3+18)
MOVT	R0, #hi_addr(_ButtonRound3+18)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,1586 :: 		ButtonRound3.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_ButtonRound3+19)
MOVT	R0, #hi_addr(_ButtonRound3+19)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,1587 :: 		ButtonRound3.Transparent     = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_ButtonRound3+20)
MOVT	R0, #hi_addr(_ButtonRound3+20)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,1588 :: 		ButtonRound3.Caption         = ButtonRound3_Caption;
MOVW	R1, #lo_addr(_ButtonRound3_Caption+0)
MOVT	R1, #hi_addr(_ButtonRound3_Caption+0)
MOVW	R0, #lo_addr(_ButtonRound3+24)
MOVT	R0, #hi_addr(_ButtonRound3+24)
STR	R1, [R0, #0]
;ECGsynthetic_driver.c,1589 :: 		ButtonRound3.TextAlign       = _taCenter;
MOVS	R1, #1
MOVW	R0, #lo_addr(_ButtonRound3+28)
MOVT	R0, #hi_addr(_ButtonRound3+28)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,1590 :: 		ButtonRound3.TextAlignVertical= _tavMiddle;
MOVS	R1, #1
MOVW	R0, #lo_addr(_ButtonRound3+29)
MOVT	R0, #hi_addr(_ButtonRound3+29)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,1591 :: 		ButtonRound3.FontName        = Tahoma25x25_Bold;
MOVW	R3, #lo_addr(_Tahoma25x25_Bold+0)
MOVT	R3, #hi_addr(_Tahoma25x25_Bold+0)
MOVW	R0, #lo_addr(_ButtonRound3+32)
MOVT	R0, #hi_addr(_ButtonRound3+32)
STR	R3, [R0, #0]
;ECGsynthetic_driver.c,1592 :: 		ButtonRound3.PressColEnabled = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_ButtonRound3+49)
MOVT	R0, #hi_addr(_ButtonRound3+49)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,1593 :: 		ButtonRound3.Font_Color      = 0xFFFF;
MOVW	R1, #65535
MOVW	R0, #lo_addr(_ButtonRound3+36)
MOVT	R0, #hi_addr(_ButtonRound3+36)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,1594 :: 		ButtonRound3.VerticalText    = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_ButtonRound3+38)
MOVT	R0, #hi_addr(_ButtonRound3+38)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,1595 :: 		ButtonRound3.Gradient        = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_ButtonRound3+39)
MOVT	R0, #hi_addr(_ButtonRound3+39)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,1596 :: 		ButtonRound3.Gradient_Orientation = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_ButtonRound3+40)
MOVT	R0, #hi_addr(_ButtonRound3+40)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,1597 :: 		ButtonRound3.Gradient_Start_Color = 0xFFFF;
MOVW	R1, #65535
MOVW	R0, #lo_addr(_ButtonRound3+42)
MOVT	R0, #hi_addr(_ButtonRound3+42)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,1598 :: 		ButtonRound3.Gradient_End_Color = 0xC618;
MOVW	R1, #50712
MOVW	R0, #lo_addr(_ButtonRound3+44)
MOVT	R0, #hi_addr(_ButtonRound3+44)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,1599 :: 		ButtonRound3.Color           = 0x07E0;
MOVW	R1, #2016
MOVW	R0, #lo_addr(_ButtonRound3+46)
MOVT	R0, #hi_addr(_ButtonRound3+46)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,1600 :: 		ButtonRound3.Press_Color     = 0xE71C;
MOVW	R1, #59164
MOVW	R0, #lo_addr(_ButtonRound3+50)
MOVT	R0, #hi_addr(_ButtonRound3+50)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,1601 :: 		ButtonRound3.Corner_Radius   = 3;
MOVS	R1, #3
MOVW	R0, #lo_addr(_ButtonRound3+48)
MOVT	R0, #hi_addr(_ButtonRound3+48)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,1602 :: 		ButtonRound3.OnClickPtr      = ButtonRound3OnClick;
MOVW	R1, #lo_addr(_ButtonRound3OnClick+0)
MOVT	R1, #hi_addr(_ButtonRound3OnClick+0)
MOVW	R0, #lo_addr(_ButtonRound3+60)
MOVT	R0, #hi_addr(_ButtonRound3+60)
STR	R1, [R0, #0]
;ECGsynthetic_driver.c,1604 :: 		Label16.OwnerScreen     = &Screen2;
MOVW	R1, #lo_addr(_Screen2+0)
MOVT	R1, #hi_addr(_Screen2+0)
MOVW	R0, #lo_addr(_Label16+0)
MOVT	R0, #hi_addr(_Label16+0)
STR	R1, [R0, #0]
;ECGsynthetic_driver.c,1605 :: 		Label16.Order           = 14;
MOVS	R1, #14
MOVW	R0, #lo_addr(_Label16+4)
MOVT	R0, #hi_addr(_Label16+4)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,1606 :: 		Label16.Left            = 43;
MOVS	R1, #43
MOVW	R0, #lo_addr(_Label16+6)
MOVT	R0, #hi_addr(_Label16+6)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,1607 :: 		Label16.Top             = 81;
MOVS	R1, #81
MOVW	R0, #lo_addr(_Label16+8)
MOVT	R0, #hi_addr(_Label16+8)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,1608 :: 		Label16.Width           = 100;
MOVS	R1, #100
MOVW	R0, #lo_addr(_Label16+10)
MOVT	R0, #hi_addr(_Label16+10)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,1609 :: 		Label16.Height          = 21;
MOVS	R1, #21
MOVW	R0, #lo_addr(_Label16+12)
MOVT	R0, #hi_addr(_Label16+12)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,1610 :: 		Label16.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Label16+27)
MOVT	R0, #hi_addr(_Label16+27)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,1611 :: 		Label16.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Label16+28)
MOVT	R0, #hi_addr(_Label16+28)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,1612 :: 		Label16.Caption         = Label16_Caption;
MOVW	R1, #lo_addr(_Label16_Caption+0)
MOVT	R1, #hi_addr(_Label16_Caption+0)
MOVW	R0, #lo_addr(_Label16+16)
MOVT	R0, #hi_addr(_Label16+16)
STR	R1, [R0, #0]
;ECGsynthetic_driver.c,1613 :: 		Label16.FontName        = DejaVu_Serif16x19_Regular;
MOVW	R0, #lo_addr(_Label16+20)
MOVT	R0, #hi_addr(_Label16+20)
STR	R5, [R0, #0]
;ECGsynthetic_driver.c,1614 :: 		Label16.Font_Color      = 0x0000;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label16+24)
MOVT	R0, #hi_addr(_Label16+24)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,1615 :: 		Label16.VerticalText    = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label16+26)
MOVT	R0, #hi_addr(_Label16+26)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,1617 :: 		ButtonRound4.OwnerScreen     = &Screen2;
MOVW	R1, #lo_addr(_Screen2+0)
MOVT	R1, #hi_addr(_Screen2+0)
MOVW	R0, #lo_addr(_ButtonRound4+0)
MOVT	R0, #hi_addr(_ButtonRound4+0)
STR	R1, [R0, #0]
;ECGsynthetic_driver.c,1618 :: 		ButtonRound4.Order           = 15;
MOVS	R1, #15
MOVW	R0, #lo_addr(_ButtonRound4+4)
MOVT	R0, #hi_addr(_ButtonRound4+4)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,1619 :: 		ButtonRound4.Left            = 227;
MOVS	R1, #227
MOVW	R0, #lo_addr(_ButtonRound4+6)
MOVT	R0, #hi_addr(_ButtonRound4+6)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,1620 :: 		ButtonRound4.Top             = 402;
MOVW	R1, #402
MOVW	R0, #lo_addr(_ButtonRound4+8)
MOVT	R0, #hi_addr(_ButtonRound4+8)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,1621 :: 		ButtonRound4.Width           = 109;
MOVS	R1, #109
MOVW	R0, #lo_addr(_ButtonRound4+10)
MOVT	R0, #hi_addr(_ButtonRound4+10)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,1622 :: 		ButtonRound4.Height          = 53;
MOVS	R1, #53
MOVW	R0, #lo_addr(_ButtonRound4+12)
MOVT	R0, #hi_addr(_ButtonRound4+12)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,1623 :: 		ButtonRound4.Pen_Width       = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_ButtonRound4+14)
MOVT	R0, #hi_addr(_ButtonRound4+14)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,1624 :: 		ButtonRound4.Pen_Color       = 0xEB2F;
MOVW	R1, #60207
MOVW	R0, #lo_addr(_ButtonRound4+16)
MOVT	R0, #hi_addr(_ButtonRound4+16)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,1625 :: 		ButtonRound4.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_ButtonRound4+18)
MOVT	R0, #hi_addr(_ButtonRound4+18)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,1626 :: 		ButtonRound4.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_ButtonRound4+19)
MOVT	R0, #hi_addr(_ButtonRound4+19)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,1627 :: 		ButtonRound4.Transparent     = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_ButtonRound4+20)
MOVT	R0, #hi_addr(_ButtonRound4+20)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,1628 :: 		ButtonRound4.Caption         = ButtonRound4_Caption;
MOVW	R1, #lo_addr(_ButtonRound4_Caption+0)
MOVT	R1, #hi_addr(_ButtonRound4_Caption+0)
MOVW	R0, #lo_addr(_ButtonRound4+24)
MOVT	R0, #hi_addr(_ButtonRound4+24)
STR	R1, [R0, #0]
;ECGsynthetic_driver.c,1629 :: 		ButtonRound4.TextAlign       = _taCenter;
MOVS	R1, #1
MOVW	R0, #lo_addr(_ButtonRound4+28)
MOVT	R0, #hi_addr(_ButtonRound4+28)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,1630 :: 		ButtonRound4.TextAlignVertical= _tavMiddle;
MOVS	R1, #1
MOVW	R0, #lo_addr(_ButtonRound4+29)
MOVT	R0, #hi_addr(_ButtonRound4+29)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,1631 :: 		ButtonRound4.FontName        = Tahoma25x25_Bold;
MOVW	R0, #lo_addr(_ButtonRound4+32)
MOVT	R0, #hi_addr(_ButtonRound4+32)
STR	R3, [R0, #0]
;ECGsynthetic_driver.c,1632 :: 		ButtonRound4.PressColEnabled = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_ButtonRound4+49)
MOVT	R0, #hi_addr(_ButtonRound4+49)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,1633 :: 		ButtonRound4.Font_Color      = 0xFFFF;
MOVW	R1, #65535
MOVW	R0, #lo_addr(_ButtonRound4+36)
MOVT	R0, #hi_addr(_ButtonRound4+36)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,1634 :: 		ButtonRound4.VerticalText    = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_ButtonRound4+38)
MOVT	R0, #hi_addr(_ButtonRound4+38)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,1635 :: 		ButtonRound4.Gradient        = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_ButtonRound4+39)
MOVT	R0, #hi_addr(_ButtonRound4+39)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,1636 :: 		ButtonRound4.Gradient_Orientation = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_ButtonRound4+40)
MOVT	R0, #hi_addr(_ButtonRound4+40)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,1637 :: 		ButtonRound4.Gradient_Start_Color = 0xFFFF;
MOVW	R1, #65535
MOVW	R0, #lo_addr(_ButtonRound4+42)
MOVT	R0, #hi_addr(_ButtonRound4+42)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,1638 :: 		ButtonRound4.Gradient_End_Color = 0xC618;
MOVW	R1, #50712
MOVW	R0, #lo_addr(_ButtonRound4+44)
MOVT	R0, #hi_addr(_ButtonRound4+44)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,1639 :: 		ButtonRound4.Color           = 0xEB2F;
MOVW	R1, #60207
MOVW	R0, #lo_addr(_ButtonRound4+46)
MOVT	R0, #hi_addr(_ButtonRound4+46)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,1640 :: 		ButtonRound4.Press_Color     = 0xE71C;
MOVW	R1, #59164
MOVW	R0, #lo_addr(_ButtonRound4+50)
MOVT	R0, #hi_addr(_ButtonRound4+50)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,1641 :: 		ButtonRound4.Corner_Radius   = 3;
MOVS	R1, #3
MOVW	R0, #lo_addr(_ButtonRound4+48)
MOVT	R0, #hi_addr(_ButtonRound4+48)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,1642 :: 		ButtonRound4.OnClickPtr      = ButtonRound4OnClick;
MOVW	R1, #lo_addr(_ButtonRound4OnClick+0)
MOVT	R1, #hi_addr(_ButtonRound4OnClick+0)
MOVW	R0, #lo_addr(_ButtonRound4+60)
MOVT	R0, #hi_addr(_ButtonRound4+60)
STR	R1, [R0, #0]
;ECGsynthetic_driver.c,1644 :: 		Image3.OwnerScreen     = &Screen2;
MOVW	R1, #lo_addr(_Screen2+0)
MOVT	R1, #hi_addr(_Screen2+0)
MOVW	R0, #lo_addr(_Image3+0)
MOVT	R0, #hi_addr(_Image3+0)
STR	R1, [R0, #0]
;ECGsynthetic_driver.c,1645 :: 		Image3.Order           = 16;
MOVS	R1, #16
MOVW	R0, #lo_addr(_Image3+4)
MOVT	R0, #hi_addr(_Image3+4)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,1646 :: 		Image3.Left            = 225;
MOVS	R1, #225
MOVW	R0, #lo_addr(_Image3+6)
MOVT	R0, #hi_addr(_Image3+6)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,1647 :: 		Image3.Top             = 85;
MOVS	R1, #85
MOVW	R0, #lo_addr(_Image3+8)
MOVT	R0, #hi_addr(_Image3+8)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,1648 :: 		Image3.Width           = 517;
MOVW	R1, #517
MOVW	R0, #lo_addr(_Image3+10)
MOVT	R0, #hi_addr(_Image3+10)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,1649 :: 		Image3.Height          = 298;
MOVW	R1, #298
MOVW	R0, #lo_addr(_Image3+12)
MOVT	R0, #hi_addr(_Image3+12)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,1650 :: 		Image3.Picture_Type    = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image3+22)
MOVT	R0, #hi_addr(_Image3+22)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,1651 :: 		Image3.Picture_Ratio   = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image3+23)
MOVT	R0, #hi_addr(_Image3+23)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,1652 :: 		Image3.Picture_Name    = GridLine1_jpg;
MOVW	R2, #lo_addr(_GridLine1_jpg+0)
MOVT	R2, #hi_addr(_GridLine1_jpg+0)
MOVW	R0, #lo_addr(_Image3+16)
MOVT	R0, #hi_addr(_Image3+16)
STR	R2, [R0, #0]
;ECGsynthetic_driver.c,1653 :: 		Image3.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image3+20)
MOVT	R0, #hi_addr(_Image3+20)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,1654 :: 		Image3.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image3+21)
MOVT	R0, #hi_addr(_Image3+21)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,1656 :: 		RadioButton1.OwnerScreen     = &Screen3;
MOVW	R1, #lo_addr(_Screen3+0)
MOVT	R1, #hi_addr(_Screen3+0)
MOVW	R0, #lo_addr(_RadioButton1+0)
MOVT	R0, #hi_addr(_RadioButton1+0)
STR	R1, [R0, #0]
;ECGsynthetic_driver.c,1657 :: 		RadioButton1.Order           = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton1+4)
MOVT	R0, #hi_addr(_RadioButton1+4)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,1658 :: 		RadioButton1.Left            = 42;
MOVS	R1, #42
MOVW	R0, #lo_addr(_RadioButton1+6)
MOVT	R0, #hi_addr(_RadioButton1+6)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,1659 :: 		RadioButton1.Top             = 134;
MOVS	R1, #134
MOVW	R0, #lo_addr(_RadioButton1+8)
MOVT	R0, #hi_addr(_RadioButton1+8)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,1660 :: 		RadioButton1.Width           = 41;
MOVS	R1, #41
MOVW	R0, #lo_addr(_RadioButton1+10)
MOVT	R0, #hi_addr(_RadioButton1+10)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,1661 :: 		RadioButton1.Height          = 25;
MOVS	R1, #25
MOVW	R0, #lo_addr(_RadioButton1+12)
MOVT	R0, #hi_addr(_RadioButton1+12)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,1662 :: 		RadioButton1.Pen_Width       = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_RadioButton1+14)
MOVT	R0, #hi_addr(_RadioButton1+14)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,1663 :: 		RadioButton1.Pen_Color       = 0x0000;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton1+16)
MOVT	R0, #hi_addr(_RadioButton1+16)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,1664 :: 		RadioButton1.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_RadioButton1+18)
MOVT	R0, #hi_addr(_RadioButton1+18)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,1665 :: 		RadioButton1.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_RadioButton1+19)
MOVT	R0, #hi_addr(_RadioButton1+19)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,1666 :: 		RadioButton1.Checked         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton1+20)
MOVT	R0, #hi_addr(_RadioButton1+20)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,1667 :: 		RadioButton1.Transparent     = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_RadioButton1+21)
MOVT	R0, #hi_addr(_RadioButton1+21)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,1668 :: 		RadioButton1.Caption         = RadioButton1_Caption;
MOVW	R1, #lo_addr(_RadioButton1_Caption+0)
MOVT	R1, #hi_addr(_RadioButton1_Caption+0)
MOVW	R0, #lo_addr(_RadioButton1+24)
MOVT	R0, #hi_addr(_RadioButton1+24)
STR	R1, [R0, #0]
;ECGsynthetic_driver.c,1669 :: 		RadioButton1.TextAlign       = _taLeft;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton1+28)
MOVT	R0, #hi_addr(_RadioButton1+28)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,1670 :: 		RadioButton1.FontName        = DejaVu_Serif16x19_Regular;
MOVW	R0, #lo_addr(_RadioButton1+32)
MOVT	R0, #hi_addr(_RadioButton1+32)
STR	R5, [R0, #0]
;ECGsynthetic_driver.c,1671 :: 		RadioButton1.PressColEnabled = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_RadioButton1+48)
MOVT	R0, #hi_addr(_RadioButton1+48)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,1672 :: 		RadioButton1.Font_Color      = 0x0000;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton1+36)
MOVT	R0, #hi_addr(_RadioButton1+36)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,1673 :: 		RadioButton1.Gradient        = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton1+38)
MOVT	R0, #hi_addr(_RadioButton1+38)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,1674 :: 		RadioButton1.Gradient_Orientation = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton1+39)
MOVT	R0, #hi_addr(_RadioButton1+39)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,1675 :: 		RadioButton1.Gradient_Start_Color = 0xFFFF;
MOVW	R1, #65535
MOVW	R0, #lo_addr(_RadioButton1+40)
MOVT	R0, #hi_addr(_RadioButton1+40)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,1676 :: 		RadioButton1.Gradient_End_Color = 0xC618;
MOVW	R1, #50712
MOVW	R0, #lo_addr(_RadioButton1+42)
MOVT	R0, #hi_addr(_RadioButton1+42)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,1677 :: 		RadioButton1.Color           = 0xFFFF;
MOVW	R1, #65535
MOVW	R0, #lo_addr(_RadioButton1+44)
MOVT	R0, #hi_addr(_RadioButton1+44)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,1678 :: 		RadioButton1.Press_Color     = 0xC618;
MOVW	R1, #50712
MOVW	R0, #lo_addr(_RadioButton1+50)
MOVT	R0, #hi_addr(_RadioButton1+50)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,1679 :: 		RadioButton1.Background_Color = 0x0000;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton1+46)
MOVT	R0, #hi_addr(_RadioButton1+46)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,1680 :: 		RadioButton1.OnPressPtr      = RadioButton1OnPress;
MOVW	R1, #lo_addr(_RadioButton1OnPress+0)
MOVT	R1, #hi_addr(_RadioButton1OnPress+0)
MOVW	R0, #lo_addr(_RadioButton1+64)
MOVT	R0, #hi_addr(_RadioButton1+64)
STR	R1, [R0, #0]
;ECGsynthetic_driver.c,1682 :: 		RadioButton2.OwnerScreen     = &Screen3;
MOVW	R1, #lo_addr(_Screen3+0)
MOVT	R1, #hi_addr(_Screen3+0)
MOVW	R0, #lo_addr(_RadioButton2+0)
MOVT	R0, #hi_addr(_RadioButton2+0)
STR	R1, [R0, #0]
;ECGsynthetic_driver.c,1683 :: 		RadioButton2.Order           = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_RadioButton2+4)
MOVT	R0, #hi_addr(_RadioButton2+4)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,1684 :: 		RadioButton2.Left            = 42;
MOVS	R1, #42
MOVW	R0, #lo_addr(_RadioButton2+6)
MOVT	R0, #hi_addr(_RadioButton2+6)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,1685 :: 		RadioButton2.Top             = 174;
MOVS	R1, #174
MOVW	R0, #lo_addr(_RadioButton2+8)
MOVT	R0, #hi_addr(_RadioButton2+8)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,1686 :: 		RadioButton2.Width           = 47;
MOVS	R1, #47
MOVW	R0, #lo_addr(_RadioButton2+10)
MOVT	R0, #hi_addr(_RadioButton2+10)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,1687 :: 		RadioButton2.Height          = 25;
MOVS	R1, #25
MOVW	R0, #lo_addr(_RadioButton2+12)
MOVT	R0, #hi_addr(_RadioButton2+12)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,1688 :: 		RadioButton2.Pen_Width       = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_RadioButton2+14)
MOVT	R0, #hi_addr(_RadioButton2+14)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,1689 :: 		RadioButton2.Pen_Color       = 0x0000;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton2+16)
MOVT	R0, #hi_addr(_RadioButton2+16)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,1690 :: 		RadioButton2.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_RadioButton2+18)
MOVT	R0, #hi_addr(_RadioButton2+18)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,1691 :: 		RadioButton2.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_RadioButton2+19)
MOVT	R0, #hi_addr(_RadioButton2+19)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,1692 :: 		RadioButton2.Checked         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton2+20)
MOVT	R0, #hi_addr(_RadioButton2+20)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,1693 :: 		RadioButton2.Transparent     = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_RadioButton2+21)
MOVT	R0, #hi_addr(_RadioButton2+21)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,1694 :: 		RadioButton2.Caption         = RadioButton2_Caption;
MOVW	R1, #lo_addr(_RadioButton2_Caption+0)
MOVT	R1, #hi_addr(_RadioButton2_Caption+0)
MOVW	R0, #lo_addr(_RadioButton2+24)
MOVT	R0, #hi_addr(_RadioButton2+24)
STR	R1, [R0, #0]
;ECGsynthetic_driver.c,1695 :: 		RadioButton2.TextAlign       = _taLeft;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton2+28)
MOVT	R0, #hi_addr(_RadioButton2+28)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,1696 :: 		RadioButton2.FontName        = DejaVu_Serif16x19_Regular;
MOVW	R0, #lo_addr(_RadioButton2+32)
MOVT	R0, #hi_addr(_RadioButton2+32)
STR	R5, [R0, #0]
;ECGsynthetic_driver.c,1697 :: 		RadioButton2.PressColEnabled = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_RadioButton2+48)
MOVT	R0, #hi_addr(_RadioButton2+48)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,1698 :: 		RadioButton2.Font_Color      = 0x0000;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton2+36)
MOVT	R0, #hi_addr(_RadioButton2+36)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,1699 :: 		RadioButton2.Gradient        = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton2+38)
MOVT	R0, #hi_addr(_RadioButton2+38)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,1700 :: 		RadioButton2.Gradient_Orientation = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton2+39)
MOVT	R0, #hi_addr(_RadioButton2+39)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,1701 :: 		RadioButton2.Gradient_Start_Color = 0xFFFF;
MOVW	R1, #65535
MOVW	R0, #lo_addr(_RadioButton2+40)
MOVT	R0, #hi_addr(_RadioButton2+40)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,1702 :: 		RadioButton2.Gradient_End_Color = 0xC618;
MOVW	R1, #50712
MOVW	R0, #lo_addr(_RadioButton2+42)
MOVT	R0, #hi_addr(_RadioButton2+42)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,1703 :: 		RadioButton2.Color           = 0xFFFF;
MOVW	R1, #65535
MOVW	R0, #lo_addr(_RadioButton2+44)
MOVT	R0, #hi_addr(_RadioButton2+44)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,1704 :: 		RadioButton2.Press_Color     = 0xE71C;
MOVW	R1, #59164
MOVW	R0, #lo_addr(_RadioButton2+50)
MOVT	R0, #hi_addr(_RadioButton2+50)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,1705 :: 		RadioButton2.Background_Color = 0x0000;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton2+46)
MOVT	R0, #hi_addr(_RadioButton2+46)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,1706 :: 		RadioButton2.OnPressPtr      = RadioButton2OnPress;
MOVW	R1, #lo_addr(_RadioButton2OnPress+0)
MOVT	R1, #hi_addr(_RadioButton2OnPress+0)
MOVW	R0, #lo_addr(_RadioButton2+64)
MOVT	R0, #hi_addr(_RadioButton2+64)
STR	R1, [R0, #0]
;ECGsynthetic_driver.c,1708 :: 		RadioButton15.OwnerScreen     = &Screen3;
MOVW	R1, #lo_addr(_Screen3+0)
MOVT	R1, #hi_addr(_Screen3+0)
MOVW	R0, #lo_addr(_RadioButton15+0)
MOVT	R0, #hi_addr(_RadioButton15+0)
STR	R1, [R0, #0]
;ECGsynthetic_driver.c,1709 :: 		RadioButton15.Order           = 2;
MOVS	R1, #2
MOVW	R0, #lo_addr(_RadioButton15+4)
MOVT	R0, #hi_addr(_RadioButton15+4)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,1710 :: 		RadioButton15.Left            = 42;
MOVS	R1, #42
MOVW	R0, #lo_addr(_RadioButton15+6)
MOVT	R0, #hi_addr(_RadioButton15+6)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,1711 :: 		RadioButton15.Top             = 214;
MOVS	R1, #214
MOVW	R0, #lo_addr(_RadioButton15+8)
MOVT	R0, #hi_addr(_RadioButton15+8)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,1712 :: 		RadioButton15.Width           = 54;
MOVS	R1, #54
MOVW	R0, #lo_addr(_RadioButton15+10)
MOVT	R0, #hi_addr(_RadioButton15+10)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,1713 :: 		RadioButton15.Height          = 25;
MOVS	R1, #25
MOVW	R0, #lo_addr(_RadioButton15+12)
MOVT	R0, #hi_addr(_RadioButton15+12)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,1714 :: 		RadioButton15.Pen_Width       = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_RadioButton15+14)
MOVT	R0, #hi_addr(_RadioButton15+14)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,1715 :: 		RadioButton15.Pen_Color       = 0x0000;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton15+16)
MOVT	R0, #hi_addr(_RadioButton15+16)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,1716 :: 		RadioButton15.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_RadioButton15+18)
MOVT	R0, #hi_addr(_RadioButton15+18)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,1717 :: 		RadioButton15.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_RadioButton15+19)
MOVT	R0, #hi_addr(_RadioButton15+19)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,1718 :: 		RadioButton15.Checked         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton15+20)
MOVT	R0, #hi_addr(_RadioButton15+20)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,1719 :: 		RadioButton15.Transparent     = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_RadioButton15+21)
MOVT	R0, #hi_addr(_RadioButton15+21)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,1720 :: 		RadioButton15.Caption         = RadioButton15_Caption;
MOVW	R1, #lo_addr(_RadioButton15_Caption+0)
MOVT	R1, #hi_addr(_RadioButton15_Caption+0)
MOVW	R0, #lo_addr(_RadioButton15+24)
MOVT	R0, #hi_addr(_RadioButton15+24)
STR	R1, [R0, #0]
;ECGsynthetic_driver.c,1721 :: 		RadioButton15.TextAlign       = _taLeft;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton15+28)
MOVT	R0, #hi_addr(_RadioButton15+28)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,1722 :: 		RadioButton15.FontName        = DejaVu_Serif16x19_Regular;
MOVW	R0, #lo_addr(_RadioButton15+32)
MOVT	R0, #hi_addr(_RadioButton15+32)
STR	R5, [R0, #0]
;ECGsynthetic_driver.c,1723 :: 		RadioButton15.PressColEnabled = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_RadioButton15+48)
MOVT	R0, #hi_addr(_RadioButton15+48)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,1724 :: 		RadioButton15.Font_Color      = 0x0000;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton15+36)
MOVT	R0, #hi_addr(_RadioButton15+36)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,1725 :: 		RadioButton15.Gradient        = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton15+38)
MOVT	R0, #hi_addr(_RadioButton15+38)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,1726 :: 		RadioButton15.Gradient_Orientation = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton15+39)
MOVT	R0, #hi_addr(_RadioButton15+39)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,1727 :: 		RadioButton15.Gradient_Start_Color = 0xFFFF;
MOVW	R1, #65535
MOVW	R0, #lo_addr(_RadioButton15+40)
MOVT	R0, #hi_addr(_RadioButton15+40)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,1728 :: 		RadioButton15.Gradient_End_Color = 0xC618;
MOVW	R1, #50712
MOVW	R0, #lo_addr(_RadioButton15+42)
MOVT	R0, #hi_addr(_RadioButton15+42)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,1729 :: 		RadioButton15.Color           = 0xFFFF;
MOVW	R1, #65535
MOVW	R0, #lo_addr(_RadioButton15+44)
MOVT	R0, #hi_addr(_RadioButton15+44)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,1730 :: 		RadioButton15.Press_Color     = 0xE71C;
MOVW	R1, #59164
MOVW	R0, #lo_addr(_RadioButton15+50)
MOVT	R0, #hi_addr(_RadioButton15+50)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,1731 :: 		RadioButton15.Background_Color = 0x0000;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton15+46)
MOVT	R0, #hi_addr(_RadioButton15+46)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,1732 :: 		RadioButton15.OnPressPtr      = RadioButton15OnPress;
MOVW	R1, #lo_addr(_RadioButton15OnPress+0)
MOVT	R1, #hi_addr(_RadioButton15OnPress+0)
MOVW	R0, #lo_addr(_RadioButton15+64)
MOVT	R0, #hi_addr(_RadioButton15+64)
STR	R1, [R0, #0]
;ECGsynthetic_driver.c,1734 :: 		RadioButton16.OwnerScreen     = &Screen3;
MOVW	R1, #lo_addr(_Screen3+0)
MOVT	R1, #hi_addr(_Screen3+0)
MOVW	R0, #lo_addr(_RadioButton16+0)
MOVT	R0, #hi_addr(_RadioButton16+0)
STR	R1, [R0, #0]
;ECGsynthetic_driver.c,1735 :: 		RadioButton16.Order           = 3;
MOVS	R1, #3
MOVW	R0, #lo_addr(_RadioButton16+4)
MOVT	R0, #hi_addr(_RadioButton16+4)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,1736 :: 		RadioButton16.Left            = 43;
MOVS	R1, #43
MOVW	R0, #lo_addr(_RadioButton16+6)
MOVT	R0, #hi_addr(_RadioButton16+6)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,1737 :: 		RadioButton16.Top             = 254;
MOVS	R1, #254
MOVW	R0, #lo_addr(_RadioButton16+8)
MOVT	R0, #hi_addr(_RadioButton16+8)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,1738 :: 		RadioButton16.Width           = 68;
MOVS	R1, #68
MOVW	R0, #lo_addr(_RadioButton16+10)
MOVT	R0, #hi_addr(_RadioButton16+10)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,1739 :: 		RadioButton16.Height          = 25;
MOVS	R1, #25
MOVW	R0, #lo_addr(_RadioButton16+12)
MOVT	R0, #hi_addr(_RadioButton16+12)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,1740 :: 		RadioButton16.Pen_Width       = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_RadioButton16+14)
MOVT	R0, #hi_addr(_RadioButton16+14)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,1741 :: 		RadioButton16.Pen_Color       = 0x0000;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton16+16)
MOVT	R0, #hi_addr(_RadioButton16+16)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,1742 :: 		RadioButton16.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_RadioButton16+18)
MOVT	R0, #hi_addr(_RadioButton16+18)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,1743 :: 		RadioButton16.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_RadioButton16+19)
MOVT	R0, #hi_addr(_RadioButton16+19)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,1744 :: 		RadioButton16.Checked         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton16+20)
MOVT	R0, #hi_addr(_RadioButton16+20)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,1745 :: 		RadioButton16.Transparent     = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_RadioButton16+21)
MOVT	R0, #hi_addr(_RadioButton16+21)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,1746 :: 		RadioButton16.Caption         = RadioButton16_Caption;
MOVW	R1, #lo_addr(_RadioButton16_Caption+0)
MOVT	R1, #hi_addr(_RadioButton16_Caption+0)
MOVW	R0, #lo_addr(_RadioButton16+24)
MOVT	R0, #hi_addr(_RadioButton16+24)
STR	R1, [R0, #0]
;ECGsynthetic_driver.c,1747 :: 		RadioButton16.TextAlign       = _taLeft;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton16+28)
MOVT	R0, #hi_addr(_RadioButton16+28)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,1748 :: 		RadioButton16.FontName        = DejaVu_Serif16x19_Regular;
MOVW	R0, #lo_addr(_RadioButton16+32)
MOVT	R0, #hi_addr(_RadioButton16+32)
STR	R5, [R0, #0]
;ECGsynthetic_driver.c,1749 :: 		RadioButton16.PressColEnabled = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_RadioButton16+48)
MOVT	R0, #hi_addr(_RadioButton16+48)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,1750 :: 		RadioButton16.Font_Color      = 0x0000;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton16+36)
MOVT	R0, #hi_addr(_RadioButton16+36)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,1751 :: 		RadioButton16.Gradient        = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton16+38)
MOVT	R0, #hi_addr(_RadioButton16+38)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,1752 :: 		RadioButton16.Gradient_Orientation = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton16+39)
MOVT	R0, #hi_addr(_RadioButton16+39)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,1753 :: 		RadioButton16.Gradient_Start_Color = 0xFFFF;
MOVW	R1, #65535
MOVW	R0, #lo_addr(_RadioButton16+40)
MOVT	R0, #hi_addr(_RadioButton16+40)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,1754 :: 		RadioButton16.Gradient_End_Color = 0xC618;
MOVW	R1, #50712
MOVW	R0, #lo_addr(_RadioButton16+42)
MOVT	R0, #hi_addr(_RadioButton16+42)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,1755 :: 		RadioButton16.Color           = 0xFFFF;
MOVW	R1, #65535
MOVW	R0, #lo_addr(_RadioButton16+44)
MOVT	R0, #hi_addr(_RadioButton16+44)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,1756 :: 		RadioButton16.Press_Color     = 0xE71C;
MOVW	R1, #59164
MOVW	R0, #lo_addr(_RadioButton16+50)
MOVT	R0, #hi_addr(_RadioButton16+50)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,1757 :: 		RadioButton16.Background_Color = 0x0000;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton16+46)
MOVT	R0, #hi_addr(_RadioButton16+46)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,1758 :: 		RadioButton16.OnPressPtr      = RadioButton16OnPress;
MOVW	R1, #lo_addr(_RadioButton16OnPress+0)
MOVT	R1, #hi_addr(_RadioButton16OnPress+0)
MOVW	R0, #lo_addr(_RadioButton16+64)
MOVT	R0, #hi_addr(_RadioButton16+64)
STR	R1, [R0, #0]
;ECGsynthetic_driver.c,1760 :: 		RadioButton17.OwnerScreen     = &Screen3;
MOVW	R1, #lo_addr(_Screen3+0)
MOVT	R1, #hi_addr(_Screen3+0)
MOVW	R0, #lo_addr(_RadioButton17+0)
MOVT	R0, #hi_addr(_RadioButton17+0)
STR	R1, [R0, #0]
;ECGsynthetic_driver.c,1761 :: 		RadioButton17.Order           = 4;
MOVS	R1, #4
MOVW	R0, #lo_addr(_RadioButton17+4)
MOVT	R0, #hi_addr(_RadioButton17+4)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,1762 :: 		RadioButton17.Left            = 42;
MOVS	R1, #42
MOVW	R0, #lo_addr(_RadioButton17+6)
MOVT	R0, #hi_addr(_RadioButton17+6)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,1763 :: 		RadioButton17.Top             = 294;
MOVW	R1, #294
MOVW	R0, #lo_addr(_RadioButton17+8)
MOVT	R0, #hi_addr(_RadioButton17+8)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,1764 :: 		RadioButton17.Width           = 67;
MOVS	R1, #67
MOVW	R0, #lo_addr(_RadioButton17+10)
MOVT	R0, #hi_addr(_RadioButton17+10)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,1765 :: 		RadioButton17.Height          = 25;
MOVS	R1, #25
MOVW	R0, #lo_addr(_RadioButton17+12)
MOVT	R0, #hi_addr(_RadioButton17+12)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,1766 :: 		RadioButton17.Pen_Width       = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_RadioButton17+14)
MOVT	R0, #hi_addr(_RadioButton17+14)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,1767 :: 		RadioButton17.Pen_Color       = 0x0000;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton17+16)
MOVT	R0, #hi_addr(_RadioButton17+16)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,1768 :: 		RadioButton17.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_RadioButton17+18)
MOVT	R0, #hi_addr(_RadioButton17+18)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,1769 :: 		RadioButton17.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_RadioButton17+19)
MOVT	R0, #hi_addr(_RadioButton17+19)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,1770 :: 		RadioButton17.Checked         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton17+20)
MOVT	R0, #hi_addr(_RadioButton17+20)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,1771 :: 		RadioButton17.Transparent     = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_RadioButton17+21)
MOVT	R0, #hi_addr(_RadioButton17+21)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,1772 :: 		RadioButton17.Caption         = RadioButton17_Caption;
MOVW	R1, #lo_addr(_RadioButton17_Caption+0)
MOVT	R1, #hi_addr(_RadioButton17_Caption+0)
MOVW	R0, #lo_addr(_RadioButton17+24)
MOVT	R0, #hi_addr(_RadioButton17+24)
STR	R1, [R0, #0]
;ECGsynthetic_driver.c,1773 :: 		RadioButton17.TextAlign       = _taLeft;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton17+28)
MOVT	R0, #hi_addr(_RadioButton17+28)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,1774 :: 		RadioButton17.FontName        = DejaVu_Serif16x19_Regular;
MOVW	R0, #lo_addr(_RadioButton17+32)
MOVT	R0, #hi_addr(_RadioButton17+32)
STR	R5, [R0, #0]
;ECGsynthetic_driver.c,1775 :: 		RadioButton17.PressColEnabled = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_RadioButton17+48)
MOVT	R0, #hi_addr(_RadioButton17+48)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,1776 :: 		RadioButton17.Font_Color      = 0x0000;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton17+36)
MOVT	R0, #hi_addr(_RadioButton17+36)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,1777 :: 		RadioButton17.Gradient        = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton17+38)
MOVT	R0, #hi_addr(_RadioButton17+38)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,1778 :: 		RadioButton17.Gradient_Orientation = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton17+39)
MOVT	R0, #hi_addr(_RadioButton17+39)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,1779 :: 		RadioButton17.Gradient_Start_Color = 0xFFFF;
MOVW	R1, #65535
MOVW	R0, #lo_addr(_RadioButton17+40)
MOVT	R0, #hi_addr(_RadioButton17+40)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,1780 :: 		RadioButton17.Gradient_End_Color = 0xC618;
MOVW	R1, #50712
MOVW	R0, #lo_addr(_RadioButton17+42)
MOVT	R0, #hi_addr(_RadioButton17+42)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,1781 :: 		RadioButton17.Color           = 0xFFFF;
MOVW	R1, #65535
MOVW	R0, #lo_addr(_RadioButton17+44)
MOVT	R0, #hi_addr(_RadioButton17+44)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,1782 :: 		RadioButton17.Press_Color     = 0xE71C;
MOVW	R1, #59164
MOVW	R0, #lo_addr(_RadioButton17+50)
MOVT	R0, #hi_addr(_RadioButton17+50)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,1783 :: 		RadioButton17.Background_Color = 0x0000;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton17+46)
MOVT	R0, #hi_addr(_RadioButton17+46)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,1784 :: 		RadioButton17.OnPressPtr      = RadioButton17OnPress;
MOVW	R1, #lo_addr(_RadioButton17OnPress+0)
MOVT	R1, #hi_addr(_RadioButton17OnPress+0)
MOVW	R0, #lo_addr(_RadioButton17+64)
MOVT	R0, #hi_addr(_RadioButton17+64)
STR	R1, [R0, #0]
;ECGsynthetic_driver.c,1786 :: 		RadioButton18.OwnerScreen     = &Screen3;
MOVW	R1, #lo_addr(_Screen3+0)
MOVT	R1, #hi_addr(_Screen3+0)
MOVW	R0, #lo_addr(_RadioButton18+0)
MOVT	R0, #hi_addr(_RadioButton18+0)
STR	R1, [R0, #0]
;ECGsynthetic_driver.c,1787 :: 		RadioButton18.Order           = 5;
MOVS	R1, #5
MOVW	R0, #lo_addr(_RadioButton18+4)
MOVT	R0, #hi_addr(_RadioButton18+4)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,1788 :: 		RadioButton18.Left            = 42;
MOVS	R1, #42
MOVW	R0, #lo_addr(_RadioButton18+6)
MOVT	R0, #hi_addr(_RadioButton18+6)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,1789 :: 		RadioButton18.Top             = 335;
MOVW	R1, #335
MOVW	R0, #lo_addr(_RadioButton18+8)
MOVT	R0, #hi_addr(_RadioButton18+8)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,1790 :: 		RadioButton18.Width           = 67;
MOVS	R1, #67
MOVW	R0, #lo_addr(_RadioButton18+10)
MOVT	R0, #hi_addr(_RadioButton18+10)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,1791 :: 		RadioButton18.Height          = 25;
MOVS	R1, #25
MOVW	R0, #lo_addr(_RadioButton18+12)
MOVT	R0, #hi_addr(_RadioButton18+12)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,1792 :: 		RadioButton18.Pen_Width       = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_RadioButton18+14)
MOVT	R0, #hi_addr(_RadioButton18+14)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,1793 :: 		RadioButton18.Pen_Color       = 0x0000;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton18+16)
MOVT	R0, #hi_addr(_RadioButton18+16)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,1794 :: 		RadioButton18.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_RadioButton18+18)
MOVT	R0, #hi_addr(_RadioButton18+18)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,1795 :: 		RadioButton18.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_RadioButton18+19)
MOVT	R0, #hi_addr(_RadioButton18+19)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,1796 :: 		RadioButton18.Checked         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton18+20)
MOVT	R0, #hi_addr(_RadioButton18+20)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,1797 :: 		RadioButton18.Transparent     = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_RadioButton18+21)
MOVT	R0, #hi_addr(_RadioButton18+21)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,1798 :: 		RadioButton18.Caption         = RadioButton18_Caption;
MOVW	R1, #lo_addr(_RadioButton18_Caption+0)
MOVT	R1, #hi_addr(_RadioButton18_Caption+0)
MOVW	R0, #lo_addr(_RadioButton18+24)
MOVT	R0, #hi_addr(_RadioButton18+24)
STR	R1, [R0, #0]
;ECGsynthetic_driver.c,1799 :: 		RadioButton18.TextAlign       = _taLeft;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton18+28)
MOVT	R0, #hi_addr(_RadioButton18+28)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,1800 :: 		RadioButton18.FontName        = DejaVu_Serif16x19_Regular;
MOVW	R0, #lo_addr(_RadioButton18+32)
MOVT	R0, #hi_addr(_RadioButton18+32)
STR	R5, [R0, #0]
;ECGsynthetic_driver.c,1801 :: 		RadioButton18.PressColEnabled = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_RadioButton18+48)
MOVT	R0, #hi_addr(_RadioButton18+48)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,1802 :: 		RadioButton18.Font_Color      = 0x0000;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton18+36)
MOVT	R0, #hi_addr(_RadioButton18+36)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,1803 :: 		RadioButton18.Gradient        = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton18+38)
MOVT	R0, #hi_addr(_RadioButton18+38)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,1804 :: 		RadioButton18.Gradient_Orientation = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton18+39)
MOVT	R0, #hi_addr(_RadioButton18+39)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,1805 :: 		RadioButton18.Gradient_Start_Color = 0xFFFF;
MOVW	R1, #65535
MOVW	R0, #lo_addr(_RadioButton18+40)
MOVT	R0, #hi_addr(_RadioButton18+40)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,1806 :: 		RadioButton18.Gradient_End_Color = 0xC618;
MOVW	R1, #50712
MOVW	R0, #lo_addr(_RadioButton18+42)
MOVT	R0, #hi_addr(_RadioButton18+42)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,1807 :: 		RadioButton18.Color           = 0xFFFF;
MOVW	R1, #65535
MOVW	R0, #lo_addr(_RadioButton18+44)
MOVT	R0, #hi_addr(_RadioButton18+44)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,1808 :: 		RadioButton18.Press_Color     = 0xE71C;
MOVW	R1, #59164
MOVW	R0, #lo_addr(_RadioButton18+50)
MOVT	R0, #hi_addr(_RadioButton18+50)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,1809 :: 		RadioButton18.Background_Color = 0x0000;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton18+46)
MOVT	R0, #hi_addr(_RadioButton18+46)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,1810 :: 		RadioButton18.OnPressPtr      = RadioButton18OnPress;
MOVW	R1, #lo_addr(_RadioButton18OnPress+0)
MOVT	R1, #hi_addr(_RadioButton18OnPress+0)
MOVW	R0, #lo_addr(_RadioButton18+64)
MOVT	R0, #hi_addr(_RadioButton18+64)
STR	R1, [R0, #0]
;ECGsynthetic_driver.c,1812 :: 		RadioButton19.OwnerScreen     = &Screen3;
MOVW	R1, #lo_addr(_Screen3+0)
MOVT	R1, #hi_addr(_Screen3+0)
MOVW	R0, #lo_addr(_RadioButton19+0)
MOVT	R0, #hi_addr(_RadioButton19+0)
STR	R1, [R0, #0]
;ECGsynthetic_driver.c,1813 :: 		RadioButton19.Order           = 6;
MOVS	R1, #6
MOVW	R0, #lo_addr(_RadioButton19+4)
MOVT	R0, #hi_addr(_RadioButton19+4)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,1814 :: 		RadioButton19.Left            = 139;
MOVS	R1, #139
MOVW	R0, #lo_addr(_RadioButton19+6)
MOVT	R0, #hi_addr(_RadioButton19+6)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,1815 :: 		RadioButton19.Top             = 134;
MOVS	R1, #134
MOVW	R0, #lo_addr(_RadioButton19+8)
MOVT	R0, #hi_addr(_RadioButton19+8)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,1816 :: 		RadioButton19.Width           = 57;
MOVS	R1, #57
MOVW	R0, #lo_addr(_RadioButton19+10)
MOVT	R0, #hi_addr(_RadioButton19+10)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,1817 :: 		RadioButton19.Height          = 25;
MOVS	R1, #25
MOVW	R0, #lo_addr(_RadioButton19+12)
MOVT	R0, #hi_addr(_RadioButton19+12)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,1818 :: 		RadioButton19.Pen_Width       = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_RadioButton19+14)
MOVT	R0, #hi_addr(_RadioButton19+14)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,1819 :: 		RadioButton19.Pen_Color       = 0x0000;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton19+16)
MOVT	R0, #hi_addr(_RadioButton19+16)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,1820 :: 		RadioButton19.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_RadioButton19+18)
MOVT	R0, #hi_addr(_RadioButton19+18)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,1821 :: 		RadioButton19.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_RadioButton19+19)
MOVT	R0, #hi_addr(_RadioButton19+19)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,1822 :: 		RadioButton19.Checked         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton19+20)
MOVT	R0, #hi_addr(_RadioButton19+20)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,1823 :: 		RadioButton19.Transparent     = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_RadioButton19+21)
MOVT	R0, #hi_addr(_RadioButton19+21)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,1824 :: 		RadioButton19.Caption         = RadioButton19_Caption;
MOVW	R1, #lo_addr(_RadioButton19_Caption+0)
MOVT	R1, #hi_addr(_RadioButton19_Caption+0)
MOVW	R0, #lo_addr(_RadioButton19+24)
MOVT	R0, #hi_addr(_RadioButton19+24)
STR	R1, [R0, #0]
;ECGsynthetic_driver.c,1825 :: 		RadioButton19.TextAlign       = _taLeft;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton19+28)
MOVT	R0, #hi_addr(_RadioButton19+28)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,1826 :: 		RadioButton19.FontName        = DejaVu_Serif16x19_Regular;
MOVW	R0, #lo_addr(_RadioButton19+32)
MOVT	R0, #hi_addr(_RadioButton19+32)
STR	R5, [R0, #0]
;ECGsynthetic_driver.c,1827 :: 		RadioButton19.PressColEnabled = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_RadioButton19+48)
MOVT	R0, #hi_addr(_RadioButton19+48)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,1828 :: 		RadioButton19.Font_Color      = 0x0000;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton19+36)
MOVT	R0, #hi_addr(_RadioButton19+36)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,1829 :: 		RadioButton19.Gradient        = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton19+38)
MOVT	R0, #hi_addr(_RadioButton19+38)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,1830 :: 		RadioButton19.Gradient_Orientation = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton19+39)
MOVT	R0, #hi_addr(_RadioButton19+39)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,1831 :: 		RadioButton19.Gradient_Start_Color = 0xFFFF;
MOVW	R1, #65535
MOVW	R0, #lo_addr(_RadioButton19+40)
MOVT	R0, #hi_addr(_RadioButton19+40)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,1832 :: 		RadioButton19.Gradient_End_Color = 0xC618;
MOVW	R1, #50712
MOVW	R0, #lo_addr(_RadioButton19+42)
MOVT	R0, #hi_addr(_RadioButton19+42)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,1833 :: 		RadioButton19.Color           = 0xFFFF;
MOVW	R1, #65535
MOVW	R0, #lo_addr(_RadioButton19+44)
MOVT	R0, #hi_addr(_RadioButton19+44)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,1834 :: 		RadioButton19.Press_Color     = 0xE71C;
MOVW	R1, #59164
MOVW	R0, #lo_addr(_RadioButton19+50)
MOVT	R0, #hi_addr(_RadioButton19+50)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,1835 :: 		RadioButton19.Background_Color = 0x0000;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton19+46)
MOVT	R0, #hi_addr(_RadioButton19+46)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,1836 :: 		RadioButton19.OnPressPtr      = RadioButton19OnPress;
MOVW	R1, #lo_addr(_RadioButton19OnPress+0)
MOVT	R1, #hi_addr(_RadioButton19OnPress+0)
MOVW	R0, #lo_addr(_RadioButton19+64)
MOVT	R0, #hi_addr(_RadioButton19+64)
STR	R1, [R0, #0]
;ECGsynthetic_driver.c,1838 :: 		RadioButton20.OwnerScreen     = &Screen3;
MOVW	R1, #lo_addr(_Screen3+0)
MOVT	R1, #hi_addr(_Screen3+0)
MOVW	R0, #lo_addr(_RadioButton20+0)
MOVT	R0, #hi_addr(_RadioButton20+0)
STR	R1, [R0, #0]
;ECGsynthetic_driver.c,1839 :: 		RadioButton20.Order           = 7;
MOVS	R1, #7
MOVW	R0, #lo_addr(_RadioButton20+4)
MOVT	R0, #hi_addr(_RadioButton20+4)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,1840 :: 		RadioButton20.Left            = 139;
MOVS	R1, #139
MOVW	R0, #lo_addr(_RadioButton20+6)
MOVT	R0, #hi_addr(_RadioButton20+6)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,1841 :: 		RadioButton20.Top             = 174;
MOVS	R1, #174
MOVW	R0, #lo_addr(_RadioButton20+8)
MOVT	R0, #hi_addr(_RadioButton20+8)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,1842 :: 		RadioButton20.Width           = 57;
MOVS	R1, #57
MOVW	R0, #lo_addr(_RadioButton20+10)
MOVT	R0, #hi_addr(_RadioButton20+10)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,1843 :: 		RadioButton20.Height          = 25;
MOVS	R1, #25
MOVW	R0, #lo_addr(_RadioButton20+12)
MOVT	R0, #hi_addr(_RadioButton20+12)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,1844 :: 		RadioButton20.Pen_Width       = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_RadioButton20+14)
MOVT	R0, #hi_addr(_RadioButton20+14)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,1845 :: 		RadioButton20.Pen_Color       = 0x0000;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton20+16)
MOVT	R0, #hi_addr(_RadioButton20+16)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,1846 :: 		RadioButton20.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_RadioButton20+18)
MOVT	R0, #hi_addr(_RadioButton20+18)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,1847 :: 		RadioButton20.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_RadioButton20+19)
MOVT	R0, #hi_addr(_RadioButton20+19)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,1848 :: 		RadioButton20.Checked         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton20+20)
MOVT	R0, #hi_addr(_RadioButton20+20)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,1849 :: 		RadioButton20.Transparent     = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_RadioButton20+21)
MOVT	R0, #hi_addr(_RadioButton20+21)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,1850 :: 		RadioButton20.Caption         = RadioButton20_Caption;
MOVW	R1, #lo_addr(_RadioButton20_Caption+0)
MOVT	R1, #hi_addr(_RadioButton20_Caption+0)
MOVW	R0, #lo_addr(_RadioButton20+24)
MOVT	R0, #hi_addr(_RadioButton20+24)
STR	R1, [R0, #0]
;ECGsynthetic_driver.c,1851 :: 		RadioButton20.TextAlign       = _taLeft;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton20+28)
MOVT	R0, #hi_addr(_RadioButton20+28)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,1852 :: 		RadioButton20.FontName        = DejaVu_Serif16x19_Regular;
MOVW	R0, #lo_addr(_RadioButton20+32)
MOVT	R0, #hi_addr(_RadioButton20+32)
STR	R5, [R0, #0]
;ECGsynthetic_driver.c,1853 :: 		RadioButton20.PressColEnabled = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_RadioButton20+48)
MOVT	R0, #hi_addr(_RadioButton20+48)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,1854 :: 		RadioButton20.Font_Color      = 0x0000;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton20+36)
MOVT	R0, #hi_addr(_RadioButton20+36)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,1855 :: 		RadioButton20.Gradient        = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton20+38)
MOVT	R0, #hi_addr(_RadioButton20+38)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,1856 :: 		RadioButton20.Gradient_Orientation = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton20+39)
MOVT	R0, #hi_addr(_RadioButton20+39)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,1857 :: 		RadioButton20.Gradient_Start_Color = 0xFFFF;
MOVW	R1, #65535
MOVW	R0, #lo_addr(_RadioButton20+40)
MOVT	R0, #hi_addr(_RadioButton20+40)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,1858 :: 		RadioButton20.Gradient_End_Color = 0xC618;
MOVW	R1, #50712
MOVW	R0, #lo_addr(_RadioButton20+42)
MOVT	R0, #hi_addr(_RadioButton20+42)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,1859 :: 		RadioButton20.Color           = 0xFFFF;
MOVW	R1, #65535
MOVW	R0, #lo_addr(_RadioButton20+44)
MOVT	R0, #hi_addr(_RadioButton20+44)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,1860 :: 		RadioButton20.Press_Color     = 0xE71C;
MOVW	R1, #59164
MOVW	R0, #lo_addr(_RadioButton20+50)
MOVT	R0, #hi_addr(_RadioButton20+50)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,1861 :: 		RadioButton20.Background_Color = 0x0000;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton20+46)
MOVT	R0, #hi_addr(_RadioButton20+46)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,1862 :: 		RadioButton20.OnPressPtr      = RadioButton20OnPress;
MOVW	R1, #lo_addr(_RadioButton20OnPress+0)
MOVT	R1, #hi_addr(_RadioButton20OnPress+0)
MOVW	R0, #lo_addr(_RadioButton20+64)
MOVT	R0, #hi_addr(_RadioButton20+64)
STR	R1, [R0, #0]
;ECGsynthetic_driver.c,1864 :: 		RadioButton21.OwnerScreen     = &Screen3;
MOVW	R1, #lo_addr(_Screen3+0)
MOVT	R1, #hi_addr(_Screen3+0)
MOVW	R0, #lo_addr(_RadioButton21+0)
MOVT	R0, #hi_addr(_RadioButton21+0)
STR	R1, [R0, #0]
;ECGsynthetic_driver.c,1865 :: 		RadioButton21.Order           = 8;
MOVS	R1, #8
MOVW	R0, #lo_addr(_RadioButton21+4)
MOVT	R0, #hi_addr(_RadioButton21+4)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,1866 :: 		RadioButton21.Left            = 139;
MOVS	R1, #139
MOVW	R0, #lo_addr(_RadioButton21+6)
MOVT	R0, #hi_addr(_RadioButton21+6)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,1867 :: 		RadioButton21.Top             = 214;
MOVS	R1, #214
MOVW	R0, #lo_addr(_RadioButton21+8)
MOVT	R0, #hi_addr(_RadioButton21+8)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,1868 :: 		RadioButton21.Width           = 57;
MOVS	R1, #57
MOVW	R0, #lo_addr(_RadioButton21+10)
MOVT	R0, #hi_addr(_RadioButton21+10)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,1869 :: 		RadioButton21.Height          = 25;
MOVS	R1, #25
MOVW	R0, #lo_addr(_RadioButton21+12)
MOVT	R0, #hi_addr(_RadioButton21+12)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,1870 :: 		RadioButton21.Pen_Width       = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_RadioButton21+14)
MOVT	R0, #hi_addr(_RadioButton21+14)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,1871 :: 		RadioButton21.Pen_Color       = 0x0000;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton21+16)
MOVT	R0, #hi_addr(_RadioButton21+16)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,1872 :: 		RadioButton21.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_RadioButton21+18)
MOVT	R0, #hi_addr(_RadioButton21+18)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,1873 :: 		RadioButton21.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_RadioButton21+19)
MOVT	R0, #hi_addr(_RadioButton21+19)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,1874 :: 		RadioButton21.Checked         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton21+20)
MOVT	R0, #hi_addr(_RadioButton21+20)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,1875 :: 		RadioButton21.Transparent     = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_RadioButton21+21)
MOVT	R0, #hi_addr(_RadioButton21+21)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,1876 :: 		RadioButton21.Caption         = RadioButton21_Caption;
MOVW	R1, #lo_addr(_RadioButton21_Caption+0)
MOVT	R1, #hi_addr(_RadioButton21_Caption+0)
MOVW	R0, #lo_addr(_RadioButton21+24)
MOVT	R0, #hi_addr(_RadioButton21+24)
STR	R1, [R0, #0]
;ECGsynthetic_driver.c,1877 :: 		RadioButton21.TextAlign       = _taLeft;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton21+28)
MOVT	R0, #hi_addr(_RadioButton21+28)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,1878 :: 		RadioButton21.FontName        = DejaVu_Serif16x19_Regular;
MOVW	R0, #lo_addr(_RadioButton21+32)
MOVT	R0, #hi_addr(_RadioButton21+32)
STR	R5, [R0, #0]
;ECGsynthetic_driver.c,1879 :: 		RadioButton21.PressColEnabled = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_RadioButton21+48)
MOVT	R0, #hi_addr(_RadioButton21+48)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,1880 :: 		RadioButton21.Font_Color      = 0x0000;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton21+36)
MOVT	R0, #hi_addr(_RadioButton21+36)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,1881 :: 		RadioButton21.Gradient        = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton21+38)
MOVT	R0, #hi_addr(_RadioButton21+38)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,1882 :: 		RadioButton21.Gradient_Orientation = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton21+39)
MOVT	R0, #hi_addr(_RadioButton21+39)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,1883 :: 		RadioButton21.Gradient_Start_Color = 0xFFFF;
MOVW	R1, #65535
MOVW	R0, #lo_addr(_RadioButton21+40)
MOVT	R0, #hi_addr(_RadioButton21+40)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,1884 :: 		RadioButton21.Gradient_End_Color = 0xC618;
MOVW	R1, #50712
MOVW	R0, #lo_addr(_RadioButton21+42)
MOVT	R0, #hi_addr(_RadioButton21+42)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,1885 :: 		RadioButton21.Color           = 0xFFFF;
MOVW	R1, #65535
MOVW	R0, #lo_addr(_RadioButton21+44)
MOVT	R0, #hi_addr(_RadioButton21+44)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,1886 :: 		RadioButton21.Press_Color     = 0xE71C;
MOVW	R1, #59164
MOVW	R0, #lo_addr(_RadioButton21+50)
MOVT	R0, #hi_addr(_RadioButton21+50)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,1887 :: 		RadioButton21.Background_Color = 0x0000;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton21+46)
MOVT	R0, #hi_addr(_RadioButton21+46)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,1888 :: 		RadioButton21.OnPressPtr      = RadioButton21OnPress;
MOVW	R1, #lo_addr(_RadioButton21OnPress+0)
MOVT	R1, #hi_addr(_RadioButton21OnPress+0)
MOVW	R0, #lo_addr(_RadioButton21+64)
MOVT	R0, #hi_addr(_RadioButton21+64)
STR	R1, [R0, #0]
;ECGsynthetic_driver.c,1890 :: 		RadioButton22.OwnerScreen     = &Screen3;
MOVW	R1, #lo_addr(_Screen3+0)
MOVT	R1, #hi_addr(_Screen3+0)
MOVW	R0, #lo_addr(_RadioButton22+0)
MOVT	R0, #hi_addr(_RadioButton22+0)
STR	R1, [R0, #0]
;ECGsynthetic_driver.c,1891 :: 		RadioButton22.Order           = 9;
MOVS	R1, #9
MOVW	R0, #lo_addr(_RadioButton22+4)
MOVT	R0, #hi_addr(_RadioButton22+4)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,1892 :: 		RadioButton22.Left            = 139;
MOVS	R1, #139
MOVW	R0, #lo_addr(_RadioButton22+6)
MOVT	R0, #hi_addr(_RadioButton22+6)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,1893 :: 		RadioButton22.Top             = 254;
MOVS	R1, #254
MOVW	R0, #lo_addr(_RadioButton22+8)
MOVT	R0, #hi_addr(_RadioButton22+8)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,1894 :: 		RadioButton22.Width           = 57;
MOVS	R1, #57
MOVW	R0, #lo_addr(_RadioButton22+10)
MOVT	R0, #hi_addr(_RadioButton22+10)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,1895 :: 		RadioButton22.Height          = 25;
MOVS	R1, #25
MOVW	R0, #lo_addr(_RadioButton22+12)
MOVT	R0, #hi_addr(_RadioButton22+12)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,1896 :: 		RadioButton22.Pen_Width       = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_RadioButton22+14)
MOVT	R0, #hi_addr(_RadioButton22+14)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,1897 :: 		RadioButton22.Pen_Color       = 0x0000;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton22+16)
MOVT	R0, #hi_addr(_RadioButton22+16)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,1898 :: 		RadioButton22.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_RadioButton22+18)
MOVT	R0, #hi_addr(_RadioButton22+18)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,1899 :: 		RadioButton22.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_RadioButton22+19)
MOVT	R0, #hi_addr(_RadioButton22+19)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,1900 :: 		RadioButton22.Checked         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton22+20)
MOVT	R0, #hi_addr(_RadioButton22+20)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,1901 :: 		RadioButton22.Transparent     = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_RadioButton22+21)
MOVT	R0, #hi_addr(_RadioButton22+21)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,1902 :: 		RadioButton22.Caption         = RadioButton22_Caption;
MOVW	R1, #lo_addr(_RadioButton22_Caption+0)
MOVT	R1, #hi_addr(_RadioButton22_Caption+0)
MOVW	R0, #lo_addr(_RadioButton22+24)
MOVT	R0, #hi_addr(_RadioButton22+24)
STR	R1, [R0, #0]
;ECGsynthetic_driver.c,1903 :: 		RadioButton22.TextAlign       = _taLeft;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton22+28)
MOVT	R0, #hi_addr(_RadioButton22+28)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,1904 :: 		RadioButton22.FontName        = DejaVu_Serif16x19_Regular;
MOVW	R0, #lo_addr(_RadioButton22+32)
MOVT	R0, #hi_addr(_RadioButton22+32)
STR	R5, [R0, #0]
;ECGsynthetic_driver.c,1905 :: 		RadioButton22.PressColEnabled = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_RadioButton22+48)
MOVT	R0, #hi_addr(_RadioButton22+48)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,1906 :: 		RadioButton22.Font_Color      = 0x0000;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton22+36)
MOVT	R0, #hi_addr(_RadioButton22+36)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,1907 :: 		RadioButton22.Gradient        = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton22+38)
MOVT	R0, #hi_addr(_RadioButton22+38)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,1908 :: 		RadioButton22.Gradient_Orientation = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton22+39)
MOVT	R0, #hi_addr(_RadioButton22+39)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,1909 :: 		RadioButton22.Gradient_Start_Color = 0xFFFF;
MOVW	R1, #65535
MOVW	R0, #lo_addr(_RadioButton22+40)
MOVT	R0, #hi_addr(_RadioButton22+40)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,1910 :: 		RadioButton22.Gradient_End_Color = 0xC618;
MOVW	R1, #50712
MOVW	R0, #lo_addr(_RadioButton22+42)
MOVT	R0, #hi_addr(_RadioButton22+42)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,1911 :: 		RadioButton22.Color           = 0xFFFF;
MOVW	R1, #65535
MOVW	R0, #lo_addr(_RadioButton22+44)
MOVT	R0, #hi_addr(_RadioButton22+44)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,1912 :: 		RadioButton22.Press_Color     = 0xE71C;
MOVW	R1, #59164
MOVW	R0, #lo_addr(_RadioButton22+50)
MOVT	R0, #hi_addr(_RadioButton22+50)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,1913 :: 		RadioButton22.Background_Color = 0x0000;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton22+46)
MOVT	R0, #hi_addr(_RadioButton22+46)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,1914 :: 		RadioButton22.OnPressPtr      = RadioButton22OnPress;
MOVW	R1, #lo_addr(_RadioButton22OnPress+0)
MOVT	R1, #hi_addr(_RadioButton22OnPress+0)
MOVW	R0, #lo_addr(_RadioButton22+64)
MOVT	R0, #hi_addr(_RadioButton22+64)
STR	R1, [R0, #0]
;ECGsynthetic_driver.c,1916 :: 		RadioButton23.OwnerScreen     = &Screen3;
MOVW	R1, #lo_addr(_Screen3+0)
MOVT	R1, #hi_addr(_Screen3+0)
MOVW	R0, #lo_addr(_RadioButton23+0)
MOVT	R0, #hi_addr(_RadioButton23+0)
STR	R1, [R0, #0]
;ECGsynthetic_driver.c,1917 :: 		RadioButton23.Order           = 10;
MOVS	R1, #10
MOVW	R0, #lo_addr(_RadioButton23+4)
MOVT	R0, #hi_addr(_RadioButton23+4)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,1918 :: 		RadioButton23.Left            = 139;
MOVS	R1, #139
MOVW	R0, #lo_addr(_RadioButton23+6)
MOVT	R0, #hi_addr(_RadioButton23+6)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,1919 :: 		RadioButton23.Top             = 292;
MOVW	R1, #292
MOVW	R0, #lo_addr(_RadioButton23+8)
MOVT	R0, #hi_addr(_RadioButton23+8)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,1920 :: 		RadioButton23.Width           = 57;
MOVS	R1, #57
MOVW	R0, #lo_addr(_RadioButton23+10)
MOVT	R0, #hi_addr(_RadioButton23+10)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,1921 :: 		RadioButton23.Height          = 25;
MOVS	R1, #25
MOVW	R0, #lo_addr(_RadioButton23+12)
MOVT	R0, #hi_addr(_RadioButton23+12)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,1922 :: 		RadioButton23.Pen_Width       = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_RadioButton23+14)
MOVT	R0, #hi_addr(_RadioButton23+14)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,1923 :: 		RadioButton23.Pen_Color       = 0x0000;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton23+16)
MOVT	R0, #hi_addr(_RadioButton23+16)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,1924 :: 		RadioButton23.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_RadioButton23+18)
MOVT	R0, #hi_addr(_RadioButton23+18)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,1925 :: 		RadioButton23.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_RadioButton23+19)
MOVT	R0, #hi_addr(_RadioButton23+19)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,1926 :: 		RadioButton23.Checked         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton23+20)
MOVT	R0, #hi_addr(_RadioButton23+20)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,1927 :: 		RadioButton23.Transparent     = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_RadioButton23+21)
MOVT	R0, #hi_addr(_RadioButton23+21)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,1928 :: 		RadioButton23.Caption         = RadioButton23_Caption;
MOVW	R1, #lo_addr(_RadioButton23_Caption+0)
MOVT	R1, #hi_addr(_RadioButton23_Caption+0)
MOVW	R0, #lo_addr(_RadioButton23+24)
MOVT	R0, #hi_addr(_RadioButton23+24)
STR	R1, [R0, #0]
;ECGsynthetic_driver.c,1929 :: 		RadioButton23.TextAlign       = _taLeft;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton23+28)
MOVT	R0, #hi_addr(_RadioButton23+28)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,1930 :: 		RadioButton23.FontName        = DejaVu_Serif16x19_Regular;
MOVW	R0, #lo_addr(_RadioButton23+32)
MOVT	R0, #hi_addr(_RadioButton23+32)
STR	R5, [R0, #0]
;ECGsynthetic_driver.c,1931 :: 		RadioButton23.PressColEnabled = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_RadioButton23+48)
MOVT	R0, #hi_addr(_RadioButton23+48)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,1932 :: 		RadioButton23.Font_Color      = 0x0000;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton23+36)
MOVT	R0, #hi_addr(_RadioButton23+36)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,1933 :: 		RadioButton23.Gradient        = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton23+38)
MOVT	R0, #hi_addr(_RadioButton23+38)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,1934 :: 		RadioButton23.Gradient_Orientation = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton23+39)
MOVT	R0, #hi_addr(_RadioButton23+39)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,1935 :: 		RadioButton23.Gradient_Start_Color = 0xFFFF;
MOVW	R1, #65535
MOVW	R0, #lo_addr(_RadioButton23+40)
MOVT	R0, #hi_addr(_RadioButton23+40)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,1936 :: 		RadioButton23.Gradient_End_Color = 0xC618;
MOVW	R1, #50712
MOVW	R0, #lo_addr(_RadioButton23+42)
MOVT	R0, #hi_addr(_RadioButton23+42)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,1937 :: 		RadioButton23.Color           = 0xFFFF;
MOVW	R1, #65535
MOVW	R0, #lo_addr(_RadioButton23+44)
MOVT	R0, #hi_addr(_RadioButton23+44)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,1938 :: 		RadioButton23.Press_Color     = 0xE71C;
MOVW	R1, #59164
MOVW	R0, #lo_addr(_RadioButton23+50)
MOVT	R0, #hi_addr(_RadioButton23+50)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,1939 :: 		RadioButton23.Background_Color = 0x0000;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton23+46)
MOVT	R0, #hi_addr(_RadioButton23+46)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,1940 :: 		RadioButton23.OnPressPtr      = RadioButton23OnPress;
MOVW	R1, #lo_addr(_RadioButton23OnPress+0)
MOVT	R1, #hi_addr(_RadioButton23OnPress+0)
MOVW	R0, #lo_addr(_RadioButton23+64)
MOVT	R0, #hi_addr(_RadioButton23+64)
STR	R1, [R0, #0]
;ECGsynthetic_driver.c,1942 :: 		RadioButton24.OwnerScreen     = &Screen3;
MOVW	R1, #lo_addr(_Screen3+0)
MOVT	R1, #hi_addr(_Screen3+0)
MOVW	R0, #lo_addr(_RadioButton24+0)
MOVT	R0, #hi_addr(_RadioButton24+0)
STR	R1, [R0, #0]
;ECGsynthetic_driver.c,1943 :: 		RadioButton24.Order           = 11;
MOVS	R1, #11
MOVW	R0, #lo_addr(_RadioButton24+4)
MOVT	R0, #hi_addr(_RadioButton24+4)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,1944 :: 		RadioButton24.Left            = 140;
MOVS	R1, #140
MOVW	R0, #lo_addr(_RadioButton24+6)
MOVT	R0, #hi_addr(_RadioButton24+6)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,1945 :: 		RadioButton24.Top             = 335;
MOVW	R1, #335
MOVW	R0, #lo_addr(_RadioButton24+8)
MOVT	R0, #hi_addr(_RadioButton24+8)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,1946 :: 		RadioButton24.Width           = 57;
MOVS	R1, #57
MOVW	R0, #lo_addr(_RadioButton24+10)
MOVT	R0, #hi_addr(_RadioButton24+10)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,1947 :: 		RadioButton24.Height          = 25;
MOVS	R1, #25
MOVW	R0, #lo_addr(_RadioButton24+12)
MOVT	R0, #hi_addr(_RadioButton24+12)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,1948 :: 		RadioButton24.Pen_Width       = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_RadioButton24+14)
MOVT	R0, #hi_addr(_RadioButton24+14)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,1949 :: 		RadioButton24.Pen_Color       = 0x0000;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton24+16)
MOVT	R0, #hi_addr(_RadioButton24+16)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,1950 :: 		RadioButton24.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_RadioButton24+18)
MOVT	R0, #hi_addr(_RadioButton24+18)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,1951 :: 		RadioButton24.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_RadioButton24+19)
MOVT	R0, #hi_addr(_RadioButton24+19)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,1952 :: 		RadioButton24.Checked         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton24+20)
MOVT	R0, #hi_addr(_RadioButton24+20)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,1953 :: 		RadioButton24.Transparent     = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_RadioButton24+21)
MOVT	R0, #hi_addr(_RadioButton24+21)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,1954 :: 		RadioButton24.Caption         = RadioButton24_Caption;
MOVW	R1, #lo_addr(_RadioButton24_Caption+0)
MOVT	R1, #hi_addr(_RadioButton24_Caption+0)
MOVW	R0, #lo_addr(_RadioButton24+24)
MOVT	R0, #hi_addr(_RadioButton24+24)
STR	R1, [R0, #0]
;ECGsynthetic_driver.c,1955 :: 		RadioButton24.TextAlign       = _taLeft;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton24+28)
MOVT	R0, #hi_addr(_RadioButton24+28)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,1956 :: 		RadioButton24.FontName        = DejaVu_Serif16x19_Regular;
MOVW	R0, #lo_addr(_RadioButton24+32)
MOVT	R0, #hi_addr(_RadioButton24+32)
STR	R5, [R0, #0]
;ECGsynthetic_driver.c,1957 :: 		RadioButton24.PressColEnabled = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_RadioButton24+48)
MOVT	R0, #hi_addr(_RadioButton24+48)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,1958 :: 		RadioButton24.Font_Color      = 0x0000;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton24+36)
MOVT	R0, #hi_addr(_RadioButton24+36)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,1959 :: 		RadioButton24.Gradient        = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton24+38)
MOVT	R0, #hi_addr(_RadioButton24+38)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,1960 :: 		RadioButton24.Gradient_Orientation = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton24+39)
MOVT	R0, #hi_addr(_RadioButton24+39)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,1961 :: 		RadioButton24.Gradient_Start_Color = 0xFFFF;
MOVW	R1, #65535
MOVW	R0, #lo_addr(_RadioButton24+40)
MOVT	R0, #hi_addr(_RadioButton24+40)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,1962 :: 		RadioButton24.Gradient_End_Color = 0xC618;
MOVW	R1, #50712
MOVW	R0, #lo_addr(_RadioButton24+42)
MOVT	R0, #hi_addr(_RadioButton24+42)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,1963 :: 		RadioButton24.Color           = 0xFFFF;
MOVW	R1, #65535
MOVW	R0, #lo_addr(_RadioButton24+44)
MOVT	R0, #hi_addr(_RadioButton24+44)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,1964 :: 		RadioButton24.Press_Color     = 0xE71C;
MOVW	R1, #59164
MOVW	R0, #lo_addr(_RadioButton24+50)
MOVT	R0, #hi_addr(_RadioButton24+50)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,1965 :: 		RadioButton24.Background_Color = 0x0000;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton24+46)
MOVT	R0, #hi_addr(_RadioButton24+46)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,1966 :: 		RadioButton24.OnPressPtr      = RadioButton24OnPress;
MOVW	R1, #lo_addr(_RadioButton24OnPress+0)
MOVT	R1, #hi_addr(_RadioButton24OnPress+0)
MOVW	R0, #lo_addr(_RadioButton24+64)
MOVT	R0, #hi_addr(_RadioButton24+64)
STR	R1, [R0, #0]
;ECGsynthetic_driver.c,1968 :: 		Label17.OwnerScreen     = &Screen3;
MOVW	R1, #lo_addr(_Screen3+0)
MOVT	R1, #hi_addr(_Screen3+0)
MOVW	R0, #lo_addr(_Label17+0)
MOVT	R0, #hi_addr(_Label17+0)
STR	R1, [R0, #0]
;ECGsynthetic_driver.c,1969 :: 		Label17.Order           = 12;
MOVS	R1, #12
MOVW	R0, #lo_addr(_Label17+4)
MOVT	R0, #hi_addr(_Label17+4)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,1970 :: 		Label17.Left            = 391;
MOVW	R1, #391
MOVW	R0, #lo_addr(_Label17+6)
MOVT	R0, #hi_addr(_Label17+6)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,1971 :: 		Label17.Top             = 37;
MOVS	R1, #37
MOVW	R0, #lo_addr(_Label17+8)
MOVT	R0, #hi_addr(_Label17+8)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,1972 :: 		Label17.Width           = 164;
MOVS	R1, #164
MOVW	R0, #lo_addr(_Label17+10)
MOVT	R0, #hi_addr(_Label17+10)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,1973 :: 		Label17.Height          = 26;
MOVS	R1, #26
MOVW	R0, #lo_addr(_Label17+12)
MOVT	R0, #hi_addr(_Label17+12)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,1974 :: 		Label17.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Label17+27)
MOVT	R0, #hi_addr(_Label17+27)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,1975 :: 		Label17.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Label17+28)
MOVT	R0, #hi_addr(_Label17+28)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,1976 :: 		Label17.Caption         = Label17_Caption;
MOVW	R1, #lo_addr(_Label17_Caption+0)
MOVT	R1, #hi_addr(_Label17_Caption+0)
MOVW	R0, #lo_addr(_Label17+16)
MOVT	R0, #hi_addr(_Label17+16)
STR	R1, [R0, #0]
;ECGsynthetic_driver.c,1977 :: 		Label17.FontName        = DejaVu_Serif22x24_Bold;
MOVW	R0, #lo_addr(_Label17+20)
MOVT	R0, #hi_addr(_Label17+20)
STR	R4, [R0, #0]
;ECGsynthetic_driver.c,1978 :: 		Label17.Font_Color      = 0x0000;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label17+24)
MOVT	R0, #hi_addr(_Label17+24)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,1979 :: 		Label17.VerticalText    = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label17+26)
MOVT	R0, #hi_addr(_Label17+26)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,1981 :: 		ButtonRound5.OwnerScreen     = &Screen3;
MOVW	R1, #lo_addr(_Screen3+0)
MOVT	R1, #hi_addr(_Screen3+0)
MOVW	R0, #lo_addr(_ButtonRound5+0)
MOVT	R0, #hi_addr(_ButtonRound5+0)
STR	R1, [R0, #0]
;ECGsynthetic_driver.c,1982 :: 		ButtonRound5.Order           = 13;
MOVS	R1, #13
MOVW	R0, #lo_addr(_ButtonRound5+4)
MOVT	R0, #hi_addr(_ButtonRound5+4)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,1983 :: 		ButtonRound5.Left            = 631;
MOVW	R1, #631
MOVW	R0, #lo_addr(_ButtonRound5+6)
MOVT	R0, #hi_addr(_ButtonRound5+6)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,1984 :: 		ButtonRound5.Top             = 402;
MOVW	R1, #402
MOVW	R0, #lo_addr(_ButtonRound5+8)
MOVT	R0, #hi_addr(_ButtonRound5+8)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,1985 :: 		ButtonRound5.Width           = 109;
MOVS	R1, #109
MOVW	R0, #lo_addr(_ButtonRound5+10)
MOVT	R0, #hi_addr(_ButtonRound5+10)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,1986 :: 		ButtonRound5.Height          = 53;
MOVS	R1, #53
MOVW	R0, #lo_addr(_ButtonRound5+12)
MOVT	R0, #hi_addr(_ButtonRound5+12)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,1987 :: 		ButtonRound5.Pen_Width       = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_ButtonRound5+14)
MOVT	R0, #hi_addr(_ButtonRound5+14)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,1988 :: 		ButtonRound5.Pen_Color       = 0x07E0;
MOVW	R1, #2016
MOVW	R0, #lo_addr(_ButtonRound5+16)
MOVT	R0, #hi_addr(_ButtonRound5+16)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,1989 :: 		ButtonRound5.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_ButtonRound5+18)
MOVT	R0, #hi_addr(_ButtonRound5+18)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,1990 :: 		ButtonRound5.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_ButtonRound5+19)
MOVT	R0, #hi_addr(_ButtonRound5+19)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,1991 :: 		ButtonRound5.Transparent     = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_ButtonRound5+20)
MOVT	R0, #hi_addr(_ButtonRound5+20)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,1992 :: 		ButtonRound5.Caption         = ButtonRound5_Caption;
MOVW	R1, #lo_addr(_ButtonRound5_Caption+0)
MOVT	R1, #hi_addr(_ButtonRound5_Caption+0)
MOVW	R0, #lo_addr(_ButtonRound5+24)
MOVT	R0, #hi_addr(_ButtonRound5+24)
STR	R1, [R0, #0]
;ECGsynthetic_driver.c,1993 :: 		ButtonRound5.TextAlign       = _taCenter;
MOVS	R1, #1
MOVW	R0, #lo_addr(_ButtonRound5+28)
MOVT	R0, #hi_addr(_ButtonRound5+28)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,1994 :: 		ButtonRound5.TextAlignVertical= _tavMiddle;
MOVS	R1, #1
MOVW	R0, #lo_addr(_ButtonRound5+29)
MOVT	R0, #hi_addr(_ButtonRound5+29)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,1995 :: 		ButtonRound5.FontName        = Tahoma25x25_Bold;
MOVW	R0, #lo_addr(_ButtonRound5+32)
MOVT	R0, #hi_addr(_ButtonRound5+32)
STR	R3, [R0, #0]
;ECGsynthetic_driver.c,1996 :: 		ButtonRound5.PressColEnabled = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_ButtonRound5+49)
MOVT	R0, #hi_addr(_ButtonRound5+49)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,1997 :: 		ButtonRound5.Font_Color      = 0xFFFF;
MOVW	R1, #65535
MOVW	R0, #lo_addr(_ButtonRound5+36)
MOVT	R0, #hi_addr(_ButtonRound5+36)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,1998 :: 		ButtonRound5.VerticalText    = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_ButtonRound5+38)
MOVT	R0, #hi_addr(_ButtonRound5+38)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,1999 :: 		ButtonRound5.Gradient        = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_ButtonRound5+39)
MOVT	R0, #hi_addr(_ButtonRound5+39)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,2000 :: 		ButtonRound5.Gradient_Orientation = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_ButtonRound5+40)
MOVT	R0, #hi_addr(_ButtonRound5+40)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,2001 :: 		ButtonRound5.Gradient_Start_Color = 0xFFFF;
MOVW	R1, #65535
MOVW	R0, #lo_addr(_ButtonRound5+42)
MOVT	R0, #hi_addr(_ButtonRound5+42)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,2002 :: 		ButtonRound5.Gradient_End_Color = 0xC618;
MOVW	R1, #50712
MOVW	R0, #lo_addr(_ButtonRound5+44)
MOVT	R0, #hi_addr(_ButtonRound5+44)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,2003 :: 		ButtonRound5.Color           = 0x07E0;
MOVW	R1, #2016
MOVW	R0, #lo_addr(_ButtonRound5+46)
MOVT	R0, #hi_addr(_ButtonRound5+46)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,2004 :: 		ButtonRound5.Press_Color     = 0xE71C;
MOVW	R1, #59164
MOVW	R0, #lo_addr(_ButtonRound5+50)
MOVT	R0, #hi_addr(_ButtonRound5+50)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,2005 :: 		ButtonRound5.Corner_Radius   = 3;
MOVS	R1, #3
MOVW	R0, #lo_addr(_ButtonRound5+48)
MOVT	R0, #hi_addr(_ButtonRound5+48)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,2006 :: 		ButtonRound5.OnClickPtr      = ButtonRound5OnClick;
MOVW	R1, #lo_addr(_ButtonRound5OnClick+0)
MOVT	R1, #hi_addr(_ButtonRound5OnClick+0)
MOVW	R0, #lo_addr(_ButtonRound5+60)
MOVT	R0, #hi_addr(_ButtonRound5+60)
STR	R1, [R0, #0]
;ECGsynthetic_driver.c,2008 :: 		Label18.OwnerScreen     = &Screen3;
MOVW	R1, #lo_addr(_Screen3+0)
MOVT	R1, #hi_addr(_Screen3+0)
MOVW	R0, #lo_addr(_Label18+0)
MOVT	R0, #hi_addr(_Label18+0)
STR	R1, [R0, #0]
;ECGsynthetic_driver.c,2009 :: 		Label18.Order           = 14;
MOVS	R1, #14
MOVW	R0, #lo_addr(_Label18+4)
MOVT	R0, #hi_addr(_Label18+4)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,2010 :: 		Label18.Left            = 43;
MOVS	R1, #43
MOVW	R0, #lo_addr(_Label18+6)
MOVT	R0, #hi_addr(_Label18+6)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,2011 :: 		Label18.Top             = 81;
MOVS	R1, #81
MOVW	R0, #lo_addr(_Label18+8)
MOVT	R0, #hi_addr(_Label18+8)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,2012 :: 		Label18.Width           = 100;
MOVS	R1, #100
MOVW	R0, #lo_addr(_Label18+10)
MOVT	R0, #hi_addr(_Label18+10)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,2013 :: 		Label18.Height          = 21;
MOVS	R1, #21
MOVW	R0, #lo_addr(_Label18+12)
MOVT	R0, #hi_addr(_Label18+12)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,2014 :: 		Label18.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Label18+27)
MOVT	R0, #hi_addr(_Label18+27)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,2015 :: 		Label18.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Label18+28)
MOVT	R0, #hi_addr(_Label18+28)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,2016 :: 		Label18.Caption         = Label18_Caption;
MOVW	R1, #lo_addr(_Label18_Caption+0)
MOVT	R1, #hi_addr(_Label18_Caption+0)
MOVW	R0, #lo_addr(_Label18+16)
MOVT	R0, #hi_addr(_Label18+16)
STR	R1, [R0, #0]
;ECGsynthetic_driver.c,2017 :: 		Label18.FontName        = DejaVu_Serif16x19_Regular;
MOVW	R0, #lo_addr(_Label18+20)
MOVT	R0, #hi_addr(_Label18+20)
STR	R5, [R0, #0]
;ECGsynthetic_driver.c,2018 :: 		Label18.Font_Color      = 0x0000;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label18+24)
MOVT	R0, #hi_addr(_Label18+24)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,2019 :: 		Label18.VerticalText    = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label18+26)
MOVT	R0, #hi_addr(_Label18+26)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,2021 :: 		ButtonRound6.OwnerScreen     = &Screen3;
MOVW	R1, #lo_addr(_Screen3+0)
MOVT	R1, #hi_addr(_Screen3+0)
MOVW	R0, #lo_addr(_ButtonRound6+0)
MOVT	R0, #hi_addr(_ButtonRound6+0)
STR	R1, [R0, #0]
;ECGsynthetic_driver.c,2022 :: 		ButtonRound6.Order           = 15;
MOVS	R1, #15
MOVW	R0, #lo_addr(_ButtonRound6+4)
MOVT	R0, #hi_addr(_ButtonRound6+4)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,2023 :: 		ButtonRound6.Left            = 227;
MOVS	R1, #227
MOVW	R0, #lo_addr(_ButtonRound6+6)
MOVT	R0, #hi_addr(_ButtonRound6+6)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,2024 :: 		ButtonRound6.Top             = 402;
MOVW	R1, #402
MOVW	R0, #lo_addr(_ButtonRound6+8)
MOVT	R0, #hi_addr(_ButtonRound6+8)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,2025 :: 		ButtonRound6.Width           = 109;
MOVS	R1, #109
MOVW	R0, #lo_addr(_ButtonRound6+10)
MOVT	R0, #hi_addr(_ButtonRound6+10)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,2026 :: 		ButtonRound6.Height          = 53;
MOVS	R1, #53
MOVW	R0, #lo_addr(_ButtonRound6+12)
MOVT	R0, #hi_addr(_ButtonRound6+12)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,2027 :: 		ButtonRound6.Pen_Width       = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_ButtonRound6+14)
MOVT	R0, #hi_addr(_ButtonRound6+14)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,2028 :: 		ButtonRound6.Pen_Color       = 0xEB2F;
MOVW	R1, #60207
MOVW	R0, #lo_addr(_ButtonRound6+16)
MOVT	R0, #hi_addr(_ButtonRound6+16)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,2029 :: 		ButtonRound6.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_ButtonRound6+18)
MOVT	R0, #hi_addr(_ButtonRound6+18)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,2030 :: 		ButtonRound6.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_ButtonRound6+19)
MOVT	R0, #hi_addr(_ButtonRound6+19)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,2031 :: 		ButtonRound6.Transparent     = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_ButtonRound6+20)
MOVT	R0, #hi_addr(_ButtonRound6+20)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,2032 :: 		ButtonRound6.Caption         = ButtonRound6_Caption;
MOVW	R1, #lo_addr(_ButtonRound6_Caption+0)
MOVT	R1, #hi_addr(_ButtonRound6_Caption+0)
MOVW	R0, #lo_addr(_ButtonRound6+24)
MOVT	R0, #hi_addr(_ButtonRound6+24)
STR	R1, [R0, #0]
;ECGsynthetic_driver.c,2033 :: 		ButtonRound6.TextAlign       = _taCenter;
MOVS	R1, #1
MOVW	R0, #lo_addr(_ButtonRound6+28)
MOVT	R0, #hi_addr(_ButtonRound6+28)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,2034 :: 		ButtonRound6.TextAlignVertical= _tavMiddle;
MOVS	R1, #1
MOVW	R0, #lo_addr(_ButtonRound6+29)
MOVT	R0, #hi_addr(_ButtonRound6+29)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,2035 :: 		ButtonRound6.FontName        = Tahoma25x25_Bold;
MOVW	R0, #lo_addr(_ButtonRound6+32)
MOVT	R0, #hi_addr(_ButtonRound6+32)
STR	R3, [R0, #0]
;ECGsynthetic_driver.c,2036 :: 		ButtonRound6.PressColEnabled = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_ButtonRound6+49)
MOVT	R0, #hi_addr(_ButtonRound6+49)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,2037 :: 		ButtonRound6.Font_Color      = 0xFFFF;
MOVW	R1, #65535
MOVW	R0, #lo_addr(_ButtonRound6+36)
MOVT	R0, #hi_addr(_ButtonRound6+36)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,2038 :: 		ButtonRound6.VerticalText    = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_ButtonRound6+38)
MOVT	R0, #hi_addr(_ButtonRound6+38)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,2039 :: 		ButtonRound6.Gradient        = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_ButtonRound6+39)
MOVT	R0, #hi_addr(_ButtonRound6+39)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,2040 :: 		ButtonRound6.Gradient_Orientation = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_ButtonRound6+40)
MOVT	R0, #hi_addr(_ButtonRound6+40)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,2041 :: 		ButtonRound6.Gradient_Start_Color = 0xFFFF;
MOVW	R1, #65535
MOVW	R0, #lo_addr(_ButtonRound6+42)
MOVT	R0, #hi_addr(_ButtonRound6+42)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,2042 :: 		ButtonRound6.Gradient_End_Color = 0xC618;
MOVW	R1, #50712
MOVW	R0, #lo_addr(_ButtonRound6+44)
MOVT	R0, #hi_addr(_ButtonRound6+44)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,2043 :: 		ButtonRound6.Color           = 0xEB2F;
MOVW	R1, #60207
MOVW	R0, #lo_addr(_ButtonRound6+46)
MOVT	R0, #hi_addr(_ButtonRound6+46)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,2044 :: 		ButtonRound6.Press_Color     = 0xE71C;
MOVW	R1, #59164
MOVW	R0, #lo_addr(_ButtonRound6+50)
MOVT	R0, #hi_addr(_ButtonRound6+50)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,2045 :: 		ButtonRound6.Corner_Radius   = 3;
MOVS	R1, #3
MOVW	R0, #lo_addr(_ButtonRound6+48)
MOVT	R0, #hi_addr(_ButtonRound6+48)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,2046 :: 		ButtonRound6.OnClickPtr      = ButtonRound6OnClick;
MOVW	R1, #lo_addr(_ButtonRound6OnClick+0)
MOVT	R1, #hi_addr(_ButtonRound6OnClick+0)
MOVW	R0, #lo_addr(_ButtonRound6+60)
MOVT	R0, #hi_addr(_ButtonRound6+60)
STR	R1, [R0, #0]
;ECGsynthetic_driver.c,2048 :: 		Image4.OwnerScreen     = &Screen3;
MOVW	R1, #lo_addr(_Screen3+0)
MOVT	R1, #hi_addr(_Screen3+0)
MOVW	R0, #lo_addr(_Image4+0)
MOVT	R0, #hi_addr(_Image4+0)
STR	R1, [R0, #0]
;ECGsynthetic_driver.c,2049 :: 		Image4.Order           = 16;
MOVS	R1, #16
MOVW	R0, #lo_addr(_Image4+4)
MOVT	R0, #hi_addr(_Image4+4)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,2050 :: 		Image4.Left            = 225;
MOVS	R1, #225
MOVW	R0, #lo_addr(_Image4+6)
MOVT	R0, #hi_addr(_Image4+6)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,2051 :: 		Image4.Top             = 84;
MOVS	R1, #84
MOVW	R0, #lo_addr(_Image4+8)
MOVT	R0, #hi_addr(_Image4+8)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,2052 :: 		Image4.Width           = 517;
MOVW	R1, #517
MOVW	R0, #lo_addr(_Image4+10)
MOVT	R0, #hi_addr(_Image4+10)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,2053 :: 		Image4.Height          = 298;
MOVW	R1, #298
MOVW	R0, #lo_addr(_Image4+12)
MOVT	R0, #hi_addr(_Image4+12)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,2054 :: 		Image4.Picture_Type    = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image4+22)
MOVT	R0, #hi_addr(_Image4+22)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,2055 :: 		Image4.Picture_Ratio   = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image4+23)
MOVT	R0, #hi_addr(_Image4+23)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,2056 :: 		Image4.Picture_Name    = GridLine1_jpg;
MOVW	R0, #lo_addr(_Image4+16)
MOVT	R0, #hi_addr(_Image4+16)
STR	R2, [R0, #0]
;ECGsynthetic_driver.c,2057 :: 		Image4.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image4+20)
MOVT	R0, #hi_addr(_Image4+20)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,2058 :: 		Image4.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image4+21)
MOVT	R0, #hi_addr(_Image4+21)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,2060 :: 		RadioButton25.OwnerScreen     = &Screen4;
MOVW	R1, #lo_addr(_Screen4+0)
MOVT	R1, #hi_addr(_Screen4+0)
MOVW	R0, #lo_addr(_RadioButton25+0)
MOVT	R0, #hi_addr(_RadioButton25+0)
STR	R1, [R0, #0]
;ECGsynthetic_driver.c,2061 :: 		RadioButton25.Order           = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton25+4)
MOVT	R0, #hi_addr(_RadioButton25+4)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,2062 :: 		RadioButton25.Left            = 42;
MOVS	R1, #42
MOVW	R0, #lo_addr(_RadioButton25+6)
MOVT	R0, #hi_addr(_RadioButton25+6)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,2063 :: 		RadioButton25.Top             = 134;
MOVS	R1, #134
MOVW	R0, #lo_addr(_RadioButton25+8)
MOVT	R0, #hi_addr(_RadioButton25+8)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,2064 :: 		RadioButton25.Width           = 41;
MOVS	R1, #41
MOVW	R0, #lo_addr(_RadioButton25+10)
MOVT	R0, #hi_addr(_RadioButton25+10)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,2065 :: 		RadioButton25.Height          = 25;
MOVS	R1, #25
MOVW	R0, #lo_addr(_RadioButton25+12)
MOVT	R0, #hi_addr(_RadioButton25+12)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,2066 :: 		RadioButton25.Pen_Width       = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_RadioButton25+14)
MOVT	R0, #hi_addr(_RadioButton25+14)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,2067 :: 		RadioButton25.Pen_Color       = 0x0000;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton25+16)
MOVT	R0, #hi_addr(_RadioButton25+16)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,2068 :: 		RadioButton25.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_RadioButton25+18)
MOVT	R0, #hi_addr(_RadioButton25+18)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,2069 :: 		RadioButton25.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_RadioButton25+19)
MOVT	R0, #hi_addr(_RadioButton25+19)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,2070 :: 		RadioButton25.Checked         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton25+20)
MOVT	R0, #hi_addr(_RadioButton25+20)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,2071 :: 		RadioButton25.Transparent     = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_RadioButton25+21)
MOVT	R0, #hi_addr(_RadioButton25+21)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,2072 :: 		RadioButton25.Caption         = RadioButton25_Caption;
MOVW	R1, #lo_addr(_RadioButton25_Caption+0)
MOVT	R1, #hi_addr(_RadioButton25_Caption+0)
MOVW	R0, #lo_addr(_RadioButton25+24)
MOVT	R0, #hi_addr(_RadioButton25+24)
STR	R1, [R0, #0]
;ECGsynthetic_driver.c,2073 :: 		RadioButton25.TextAlign       = _taLeft;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton25+28)
MOVT	R0, #hi_addr(_RadioButton25+28)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,2074 :: 		RadioButton25.FontName        = DejaVu_Serif16x19_Regular;
MOVW	R0, #lo_addr(_RadioButton25+32)
MOVT	R0, #hi_addr(_RadioButton25+32)
STR	R5, [R0, #0]
;ECGsynthetic_driver.c,2075 :: 		RadioButton25.PressColEnabled = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_RadioButton25+48)
MOVT	R0, #hi_addr(_RadioButton25+48)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,2076 :: 		RadioButton25.Font_Color      = 0x0000;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton25+36)
MOVT	R0, #hi_addr(_RadioButton25+36)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,2077 :: 		RadioButton25.Gradient        = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton25+38)
MOVT	R0, #hi_addr(_RadioButton25+38)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,2078 :: 		RadioButton25.Gradient_Orientation = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton25+39)
MOVT	R0, #hi_addr(_RadioButton25+39)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,2079 :: 		RadioButton25.Gradient_Start_Color = 0xFFFF;
MOVW	R1, #65535
MOVW	R0, #lo_addr(_RadioButton25+40)
MOVT	R0, #hi_addr(_RadioButton25+40)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,2080 :: 		RadioButton25.Gradient_End_Color = 0xC618;
MOVW	R1, #50712
MOVW	R0, #lo_addr(_RadioButton25+42)
MOVT	R0, #hi_addr(_RadioButton25+42)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,2081 :: 		RadioButton25.Color           = 0xFFFF;
MOVW	R1, #65535
MOVW	R0, #lo_addr(_RadioButton25+44)
MOVT	R0, #hi_addr(_RadioButton25+44)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,2082 :: 		RadioButton25.Press_Color     = 0xC618;
MOVW	R1, #50712
MOVW	R0, #lo_addr(_RadioButton25+50)
MOVT	R0, #hi_addr(_RadioButton25+50)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,2083 :: 		RadioButton25.Background_Color = 0x0000;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton25+46)
MOVT	R0, #hi_addr(_RadioButton25+46)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,2084 :: 		RadioButton25.OnPressPtr      = RadioButton25OnPress;
MOVW	R1, #lo_addr(_RadioButton25OnPress+0)
MOVT	R1, #hi_addr(_RadioButton25OnPress+0)
MOVW	R0, #lo_addr(_RadioButton25+64)
MOVT	R0, #hi_addr(_RadioButton25+64)
STR	R1, [R0, #0]
;ECGsynthetic_driver.c,2086 :: 		RadioButton26.OwnerScreen     = &Screen4;
MOVW	R1, #lo_addr(_Screen4+0)
MOVT	R1, #hi_addr(_Screen4+0)
MOVW	R0, #lo_addr(_RadioButton26+0)
MOVT	R0, #hi_addr(_RadioButton26+0)
STR	R1, [R0, #0]
;ECGsynthetic_driver.c,2087 :: 		RadioButton26.Order           = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_RadioButton26+4)
MOVT	R0, #hi_addr(_RadioButton26+4)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,2088 :: 		RadioButton26.Left            = 42;
MOVS	R1, #42
MOVW	R0, #lo_addr(_RadioButton26+6)
MOVT	R0, #hi_addr(_RadioButton26+6)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,2089 :: 		RadioButton26.Top             = 174;
MOVS	R1, #174
MOVW	R0, #lo_addr(_RadioButton26+8)
MOVT	R0, #hi_addr(_RadioButton26+8)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,2090 :: 		RadioButton26.Width           = 47;
MOVS	R1, #47
MOVW	R0, #lo_addr(_RadioButton26+10)
MOVT	R0, #hi_addr(_RadioButton26+10)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,2091 :: 		RadioButton26.Height          = 25;
MOVS	R1, #25
MOVW	R0, #lo_addr(_RadioButton26+12)
MOVT	R0, #hi_addr(_RadioButton26+12)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,2092 :: 		RadioButton26.Pen_Width       = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_RadioButton26+14)
MOVT	R0, #hi_addr(_RadioButton26+14)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,2093 :: 		RadioButton26.Pen_Color       = 0x0000;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton26+16)
MOVT	R0, #hi_addr(_RadioButton26+16)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,2094 :: 		RadioButton26.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_RadioButton26+18)
MOVT	R0, #hi_addr(_RadioButton26+18)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,2095 :: 		RadioButton26.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_RadioButton26+19)
MOVT	R0, #hi_addr(_RadioButton26+19)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,2096 :: 		RadioButton26.Checked         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton26+20)
MOVT	R0, #hi_addr(_RadioButton26+20)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,2097 :: 		RadioButton26.Transparent     = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_RadioButton26+21)
MOVT	R0, #hi_addr(_RadioButton26+21)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,2098 :: 		RadioButton26.Caption         = RadioButton26_Caption;
MOVW	R1, #lo_addr(_RadioButton26_Caption+0)
MOVT	R1, #hi_addr(_RadioButton26_Caption+0)
MOVW	R0, #lo_addr(_RadioButton26+24)
MOVT	R0, #hi_addr(_RadioButton26+24)
STR	R1, [R0, #0]
;ECGsynthetic_driver.c,2099 :: 		RadioButton26.TextAlign       = _taLeft;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton26+28)
MOVT	R0, #hi_addr(_RadioButton26+28)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,2100 :: 		RadioButton26.FontName        = DejaVu_Serif16x19_Regular;
MOVW	R0, #lo_addr(_RadioButton26+32)
MOVT	R0, #hi_addr(_RadioButton26+32)
STR	R5, [R0, #0]
;ECGsynthetic_driver.c,2101 :: 		RadioButton26.PressColEnabled = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_RadioButton26+48)
MOVT	R0, #hi_addr(_RadioButton26+48)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,2102 :: 		RadioButton26.Font_Color      = 0x0000;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton26+36)
MOVT	R0, #hi_addr(_RadioButton26+36)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,2103 :: 		RadioButton26.Gradient        = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton26+38)
MOVT	R0, #hi_addr(_RadioButton26+38)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,2104 :: 		RadioButton26.Gradient_Orientation = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton26+39)
MOVT	R0, #hi_addr(_RadioButton26+39)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,2105 :: 		RadioButton26.Gradient_Start_Color = 0xFFFF;
MOVW	R1, #65535
MOVW	R0, #lo_addr(_RadioButton26+40)
MOVT	R0, #hi_addr(_RadioButton26+40)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,2106 :: 		RadioButton26.Gradient_End_Color = 0xC618;
MOVW	R1, #50712
MOVW	R0, #lo_addr(_RadioButton26+42)
MOVT	R0, #hi_addr(_RadioButton26+42)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,2107 :: 		RadioButton26.Color           = 0xFFFF;
MOVW	R1, #65535
MOVW	R0, #lo_addr(_RadioButton26+44)
MOVT	R0, #hi_addr(_RadioButton26+44)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,2108 :: 		RadioButton26.Press_Color     = 0xE71C;
MOVW	R1, #59164
MOVW	R0, #lo_addr(_RadioButton26+50)
MOVT	R0, #hi_addr(_RadioButton26+50)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,2109 :: 		RadioButton26.Background_Color = 0x0000;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton26+46)
MOVT	R0, #hi_addr(_RadioButton26+46)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,2110 :: 		RadioButton26.OnPressPtr      = RadioButton26OnPress;
MOVW	R1, #lo_addr(_RadioButton26OnPress+0)
MOVT	R1, #hi_addr(_RadioButton26OnPress+0)
MOVW	R0, #lo_addr(_RadioButton26+64)
MOVT	R0, #hi_addr(_RadioButton26+64)
STR	R1, [R0, #0]
;ECGsynthetic_driver.c,2112 :: 		RadioButton27.OwnerScreen     = &Screen4;
MOVW	R1, #lo_addr(_Screen4+0)
MOVT	R1, #hi_addr(_Screen4+0)
MOVW	R0, #lo_addr(_RadioButton27+0)
MOVT	R0, #hi_addr(_RadioButton27+0)
STR	R1, [R0, #0]
;ECGsynthetic_driver.c,2113 :: 		RadioButton27.Order           = 2;
MOVS	R1, #2
MOVW	R0, #lo_addr(_RadioButton27+4)
MOVT	R0, #hi_addr(_RadioButton27+4)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,2114 :: 		RadioButton27.Left            = 42;
MOVS	R1, #42
MOVW	R0, #lo_addr(_RadioButton27+6)
MOVT	R0, #hi_addr(_RadioButton27+6)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,2115 :: 		RadioButton27.Top             = 214;
MOVS	R1, #214
MOVW	R0, #lo_addr(_RadioButton27+8)
MOVT	R0, #hi_addr(_RadioButton27+8)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,2116 :: 		RadioButton27.Width           = 54;
MOVS	R1, #54
MOVW	R0, #lo_addr(_RadioButton27+10)
MOVT	R0, #hi_addr(_RadioButton27+10)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,2117 :: 		RadioButton27.Height          = 25;
MOVS	R1, #25
MOVW	R0, #lo_addr(_RadioButton27+12)
MOVT	R0, #hi_addr(_RadioButton27+12)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,2118 :: 		RadioButton27.Pen_Width       = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_RadioButton27+14)
MOVT	R0, #hi_addr(_RadioButton27+14)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,2119 :: 		RadioButton27.Pen_Color       = 0x0000;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton27+16)
MOVT	R0, #hi_addr(_RadioButton27+16)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,2120 :: 		RadioButton27.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_RadioButton27+18)
MOVT	R0, #hi_addr(_RadioButton27+18)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,2121 :: 		RadioButton27.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_RadioButton27+19)
MOVT	R0, #hi_addr(_RadioButton27+19)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,2122 :: 		RadioButton27.Checked         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton27+20)
MOVT	R0, #hi_addr(_RadioButton27+20)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,2123 :: 		RadioButton27.Transparent     = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_RadioButton27+21)
MOVT	R0, #hi_addr(_RadioButton27+21)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,2124 :: 		RadioButton27.Caption         = RadioButton27_Caption;
MOVW	R1, #lo_addr(_RadioButton27_Caption+0)
MOVT	R1, #hi_addr(_RadioButton27_Caption+0)
MOVW	R0, #lo_addr(_RadioButton27+24)
MOVT	R0, #hi_addr(_RadioButton27+24)
STR	R1, [R0, #0]
;ECGsynthetic_driver.c,2125 :: 		RadioButton27.TextAlign       = _taLeft;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton27+28)
MOVT	R0, #hi_addr(_RadioButton27+28)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,2126 :: 		RadioButton27.FontName        = DejaVu_Serif16x19_Regular;
MOVW	R0, #lo_addr(_RadioButton27+32)
MOVT	R0, #hi_addr(_RadioButton27+32)
STR	R5, [R0, #0]
;ECGsynthetic_driver.c,2127 :: 		RadioButton27.PressColEnabled = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_RadioButton27+48)
MOVT	R0, #hi_addr(_RadioButton27+48)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,2128 :: 		RadioButton27.Font_Color      = 0x0000;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton27+36)
MOVT	R0, #hi_addr(_RadioButton27+36)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,2129 :: 		RadioButton27.Gradient        = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton27+38)
MOVT	R0, #hi_addr(_RadioButton27+38)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,2130 :: 		RadioButton27.Gradient_Orientation = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton27+39)
MOVT	R0, #hi_addr(_RadioButton27+39)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,2131 :: 		RadioButton27.Gradient_Start_Color = 0xFFFF;
MOVW	R1, #65535
MOVW	R0, #lo_addr(_RadioButton27+40)
MOVT	R0, #hi_addr(_RadioButton27+40)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,2132 :: 		RadioButton27.Gradient_End_Color = 0xC618;
MOVW	R1, #50712
MOVW	R0, #lo_addr(_RadioButton27+42)
MOVT	R0, #hi_addr(_RadioButton27+42)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,2133 :: 		RadioButton27.Color           = 0xFFFF;
MOVW	R1, #65535
MOVW	R0, #lo_addr(_RadioButton27+44)
MOVT	R0, #hi_addr(_RadioButton27+44)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,2134 :: 		RadioButton27.Press_Color     = 0xE71C;
MOVW	R1, #59164
MOVW	R0, #lo_addr(_RadioButton27+50)
MOVT	R0, #hi_addr(_RadioButton27+50)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,2135 :: 		RadioButton27.Background_Color = 0x0000;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton27+46)
MOVT	R0, #hi_addr(_RadioButton27+46)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,2136 :: 		RadioButton27.OnPressPtr      = RadioButton27OnPress;
MOVW	R1, #lo_addr(_RadioButton27OnPress+0)
MOVT	R1, #hi_addr(_RadioButton27OnPress+0)
MOVW	R0, #lo_addr(_RadioButton27+64)
MOVT	R0, #hi_addr(_RadioButton27+64)
STR	R1, [R0, #0]
;ECGsynthetic_driver.c,2138 :: 		RadioButton28.OwnerScreen     = &Screen4;
MOVW	R1, #lo_addr(_Screen4+0)
MOVT	R1, #hi_addr(_Screen4+0)
MOVW	R0, #lo_addr(_RadioButton28+0)
MOVT	R0, #hi_addr(_RadioButton28+0)
STR	R1, [R0, #0]
;ECGsynthetic_driver.c,2139 :: 		RadioButton28.Order           = 3;
MOVS	R1, #3
MOVW	R0, #lo_addr(_RadioButton28+4)
MOVT	R0, #hi_addr(_RadioButton28+4)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,2140 :: 		RadioButton28.Left            = 42;
MOVS	R1, #42
MOVW	R0, #lo_addr(_RadioButton28+6)
MOVT	R0, #hi_addr(_RadioButton28+6)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,2141 :: 		RadioButton28.Top             = 254;
MOVS	R1, #254
MOVW	R0, #lo_addr(_RadioButton28+8)
MOVT	R0, #hi_addr(_RadioButton28+8)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,2142 :: 		RadioButton28.Width           = 68;
MOVS	R1, #68
MOVW	R0, #lo_addr(_RadioButton28+10)
MOVT	R0, #hi_addr(_RadioButton28+10)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,2143 :: 		RadioButton28.Height          = 25;
MOVS	R1, #25
MOVW	R0, #lo_addr(_RadioButton28+12)
MOVT	R0, #hi_addr(_RadioButton28+12)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,2144 :: 		RadioButton28.Pen_Width       = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_RadioButton28+14)
MOVT	R0, #hi_addr(_RadioButton28+14)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,2145 :: 		RadioButton28.Pen_Color       = 0x0000;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton28+16)
MOVT	R0, #hi_addr(_RadioButton28+16)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,2146 :: 		RadioButton28.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_RadioButton28+18)
MOVT	R0, #hi_addr(_RadioButton28+18)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,2147 :: 		RadioButton28.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_RadioButton28+19)
MOVT	R0, #hi_addr(_RadioButton28+19)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,2148 :: 		RadioButton28.Checked         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton28+20)
MOVT	R0, #hi_addr(_RadioButton28+20)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,2149 :: 		RadioButton28.Transparent     = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_RadioButton28+21)
MOVT	R0, #hi_addr(_RadioButton28+21)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,2150 :: 		RadioButton28.Caption         = RadioButton28_Caption;
MOVW	R1, #lo_addr(_RadioButton28_Caption+0)
MOVT	R1, #hi_addr(_RadioButton28_Caption+0)
MOVW	R0, #lo_addr(_RadioButton28+24)
MOVT	R0, #hi_addr(_RadioButton28+24)
STR	R1, [R0, #0]
;ECGsynthetic_driver.c,2151 :: 		RadioButton28.TextAlign       = _taLeft;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton28+28)
MOVT	R0, #hi_addr(_RadioButton28+28)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,2152 :: 		RadioButton28.FontName        = DejaVu_Serif16x19_Regular;
MOVW	R0, #lo_addr(_RadioButton28+32)
MOVT	R0, #hi_addr(_RadioButton28+32)
STR	R5, [R0, #0]
;ECGsynthetic_driver.c,2153 :: 		RadioButton28.PressColEnabled = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_RadioButton28+48)
MOVT	R0, #hi_addr(_RadioButton28+48)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,2154 :: 		RadioButton28.Font_Color      = 0x0000;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton28+36)
MOVT	R0, #hi_addr(_RadioButton28+36)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,2155 :: 		RadioButton28.Gradient        = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton28+38)
MOVT	R0, #hi_addr(_RadioButton28+38)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,2156 :: 		RadioButton28.Gradient_Orientation = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton28+39)
MOVT	R0, #hi_addr(_RadioButton28+39)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,2157 :: 		RadioButton28.Gradient_Start_Color = 0xFFFF;
MOVW	R1, #65535
MOVW	R0, #lo_addr(_RadioButton28+40)
MOVT	R0, #hi_addr(_RadioButton28+40)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,2158 :: 		RadioButton28.Gradient_End_Color = 0xC618;
MOVW	R1, #50712
MOVW	R0, #lo_addr(_RadioButton28+42)
MOVT	R0, #hi_addr(_RadioButton28+42)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,2159 :: 		RadioButton28.Color           = 0xFFFF;
MOVW	R1, #65535
MOVW	R0, #lo_addr(_RadioButton28+44)
MOVT	R0, #hi_addr(_RadioButton28+44)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,2160 :: 		RadioButton28.Press_Color     = 0xE71C;
MOVW	R1, #59164
MOVW	R0, #lo_addr(_RadioButton28+50)
MOVT	R0, #hi_addr(_RadioButton28+50)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,2161 :: 		RadioButton28.Background_Color = 0x0000;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton28+46)
MOVT	R0, #hi_addr(_RadioButton28+46)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,2162 :: 		RadioButton28.OnPressPtr      = RadioButton28OnPress;
MOVW	R1, #lo_addr(_RadioButton28OnPress+0)
MOVT	R1, #hi_addr(_RadioButton28OnPress+0)
MOVW	R0, #lo_addr(_RadioButton28+64)
MOVT	R0, #hi_addr(_RadioButton28+64)
STR	R1, [R0, #0]
;ECGsynthetic_driver.c,2164 :: 		RadioButton29.OwnerScreen     = &Screen4;
MOVW	R1, #lo_addr(_Screen4+0)
MOVT	R1, #hi_addr(_Screen4+0)
MOVW	R0, #lo_addr(_RadioButton29+0)
MOVT	R0, #hi_addr(_RadioButton29+0)
STR	R1, [R0, #0]
;ECGsynthetic_driver.c,2165 :: 		RadioButton29.Order           = 4;
MOVS	R1, #4
MOVW	R0, #lo_addr(_RadioButton29+4)
MOVT	R0, #hi_addr(_RadioButton29+4)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,2166 :: 		RadioButton29.Left            = 42;
MOVS	R1, #42
MOVW	R0, #lo_addr(_RadioButton29+6)
MOVT	R0, #hi_addr(_RadioButton29+6)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,2167 :: 		RadioButton29.Top             = 294;
MOVW	R1, #294
MOVW	R0, #lo_addr(_RadioButton29+8)
MOVT	R0, #hi_addr(_RadioButton29+8)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,2168 :: 		RadioButton29.Width           = 67;
MOVS	R1, #67
MOVW	R0, #lo_addr(_RadioButton29+10)
MOVT	R0, #hi_addr(_RadioButton29+10)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,2169 :: 		RadioButton29.Height          = 25;
MOVS	R1, #25
MOVW	R0, #lo_addr(_RadioButton29+12)
MOVT	R0, #hi_addr(_RadioButton29+12)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,2170 :: 		RadioButton29.Pen_Width       = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_RadioButton29+14)
MOVT	R0, #hi_addr(_RadioButton29+14)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,2171 :: 		RadioButton29.Pen_Color       = 0x0000;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton29+16)
MOVT	R0, #hi_addr(_RadioButton29+16)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,2172 :: 		RadioButton29.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_RadioButton29+18)
MOVT	R0, #hi_addr(_RadioButton29+18)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,2173 :: 		RadioButton29.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_RadioButton29+19)
MOVT	R0, #hi_addr(_RadioButton29+19)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,2174 :: 		RadioButton29.Checked         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton29+20)
MOVT	R0, #hi_addr(_RadioButton29+20)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,2175 :: 		RadioButton29.Transparent     = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_RadioButton29+21)
MOVT	R0, #hi_addr(_RadioButton29+21)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,2176 :: 		RadioButton29.Caption         = RadioButton29_Caption;
MOVW	R1, #lo_addr(_RadioButton29_Caption+0)
MOVT	R1, #hi_addr(_RadioButton29_Caption+0)
MOVW	R0, #lo_addr(_RadioButton29+24)
MOVT	R0, #hi_addr(_RadioButton29+24)
STR	R1, [R0, #0]
;ECGsynthetic_driver.c,2177 :: 		RadioButton29.TextAlign       = _taLeft;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton29+28)
MOVT	R0, #hi_addr(_RadioButton29+28)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,2178 :: 		RadioButton29.FontName        = DejaVu_Serif16x19_Regular;
MOVW	R0, #lo_addr(_RadioButton29+32)
MOVT	R0, #hi_addr(_RadioButton29+32)
STR	R5, [R0, #0]
;ECGsynthetic_driver.c,2179 :: 		RadioButton29.PressColEnabled = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_RadioButton29+48)
MOVT	R0, #hi_addr(_RadioButton29+48)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,2180 :: 		RadioButton29.Font_Color      = 0x0000;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton29+36)
MOVT	R0, #hi_addr(_RadioButton29+36)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,2181 :: 		RadioButton29.Gradient        = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton29+38)
MOVT	R0, #hi_addr(_RadioButton29+38)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,2182 :: 		RadioButton29.Gradient_Orientation = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton29+39)
MOVT	R0, #hi_addr(_RadioButton29+39)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,2183 :: 		RadioButton29.Gradient_Start_Color = 0xFFFF;
MOVW	R1, #65535
MOVW	R0, #lo_addr(_RadioButton29+40)
MOVT	R0, #hi_addr(_RadioButton29+40)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,2184 :: 		RadioButton29.Gradient_End_Color = 0xC618;
MOVW	R1, #50712
MOVW	R0, #lo_addr(_RadioButton29+42)
MOVT	R0, #hi_addr(_RadioButton29+42)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,2185 :: 		RadioButton29.Color           = 0xFFFF;
MOVW	R1, #65535
MOVW	R0, #lo_addr(_RadioButton29+44)
MOVT	R0, #hi_addr(_RadioButton29+44)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,2186 :: 		RadioButton29.Press_Color     = 0xE71C;
MOVW	R1, #59164
MOVW	R0, #lo_addr(_RadioButton29+50)
MOVT	R0, #hi_addr(_RadioButton29+50)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,2187 :: 		RadioButton29.Background_Color = 0x0000;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton29+46)
MOVT	R0, #hi_addr(_RadioButton29+46)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,2188 :: 		RadioButton29.OnPressPtr      = RadioButton29OnPress;
MOVW	R1, #lo_addr(_RadioButton29OnPress+0)
MOVT	R1, #hi_addr(_RadioButton29OnPress+0)
MOVW	R0, #lo_addr(_RadioButton29+64)
MOVT	R0, #hi_addr(_RadioButton29+64)
STR	R1, [R0, #0]
;ECGsynthetic_driver.c,2190 :: 		RadioButton30.OwnerScreen     = &Screen4;
MOVW	R1, #lo_addr(_Screen4+0)
MOVT	R1, #hi_addr(_Screen4+0)
MOVW	R0, #lo_addr(_RadioButton30+0)
MOVT	R0, #hi_addr(_RadioButton30+0)
STR	R1, [R0, #0]
;ECGsynthetic_driver.c,2191 :: 		RadioButton30.Order           = 5;
MOVS	R1, #5
MOVW	R0, #lo_addr(_RadioButton30+4)
MOVT	R0, #hi_addr(_RadioButton30+4)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,2192 :: 		RadioButton30.Left            = 42;
MOVS	R1, #42
MOVW	R0, #lo_addr(_RadioButton30+6)
MOVT	R0, #hi_addr(_RadioButton30+6)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,2193 :: 		RadioButton30.Top             = 335;
MOVW	R1, #335
MOVW	R0, #lo_addr(_RadioButton30+8)
MOVT	R0, #hi_addr(_RadioButton30+8)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,2194 :: 		RadioButton30.Width           = 67;
MOVS	R1, #67
MOVW	R0, #lo_addr(_RadioButton30+10)
MOVT	R0, #hi_addr(_RadioButton30+10)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,2195 :: 		RadioButton30.Height          = 25;
MOVS	R1, #25
MOVW	R0, #lo_addr(_RadioButton30+12)
MOVT	R0, #hi_addr(_RadioButton30+12)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,2196 :: 		RadioButton30.Pen_Width       = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_RadioButton30+14)
MOVT	R0, #hi_addr(_RadioButton30+14)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,2197 :: 		RadioButton30.Pen_Color       = 0x0000;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton30+16)
MOVT	R0, #hi_addr(_RadioButton30+16)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,2198 :: 		RadioButton30.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_RadioButton30+18)
MOVT	R0, #hi_addr(_RadioButton30+18)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,2199 :: 		RadioButton30.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_RadioButton30+19)
MOVT	R0, #hi_addr(_RadioButton30+19)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,2200 :: 		RadioButton30.Checked         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton30+20)
MOVT	R0, #hi_addr(_RadioButton30+20)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,2201 :: 		RadioButton30.Transparent     = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_RadioButton30+21)
MOVT	R0, #hi_addr(_RadioButton30+21)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,2202 :: 		RadioButton30.Caption         = RadioButton30_Caption;
MOVW	R1, #lo_addr(_RadioButton30_Caption+0)
MOVT	R1, #hi_addr(_RadioButton30_Caption+0)
MOVW	R0, #lo_addr(_RadioButton30+24)
MOVT	R0, #hi_addr(_RadioButton30+24)
STR	R1, [R0, #0]
;ECGsynthetic_driver.c,2203 :: 		RadioButton30.TextAlign       = _taLeft;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton30+28)
MOVT	R0, #hi_addr(_RadioButton30+28)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,2204 :: 		RadioButton30.FontName        = DejaVu_Serif16x19_Regular;
MOVW	R0, #lo_addr(_RadioButton30+32)
MOVT	R0, #hi_addr(_RadioButton30+32)
STR	R5, [R0, #0]
;ECGsynthetic_driver.c,2205 :: 		RadioButton30.PressColEnabled = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_RadioButton30+48)
MOVT	R0, #hi_addr(_RadioButton30+48)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,2206 :: 		RadioButton30.Font_Color      = 0x0000;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton30+36)
MOVT	R0, #hi_addr(_RadioButton30+36)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,2207 :: 		RadioButton30.Gradient        = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton30+38)
MOVT	R0, #hi_addr(_RadioButton30+38)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,2208 :: 		RadioButton30.Gradient_Orientation = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton30+39)
MOVT	R0, #hi_addr(_RadioButton30+39)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,2209 :: 		RadioButton30.Gradient_Start_Color = 0xFFFF;
MOVW	R1, #65535
MOVW	R0, #lo_addr(_RadioButton30+40)
MOVT	R0, #hi_addr(_RadioButton30+40)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,2210 :: 		RadioButton30.Gradient_End_Color = 0xC618;
MOVW	R1, #50712
MOVW	R0, #lo_addr(_RadioButton30+42)
MOVT	R0, #hi_addr(_RadioButton30+42)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,2211 :: 		RadioButton30.Color           = 0xFFFF;
MOVW	R1, #65535
MOVW	R0, #lo_addr(_RadioButton30+44)
MOVT	R0, #hi_addr(_RadioButton30+44)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,2212 :: 		RadioButton30.Press_Color     = 0xE71C;
MOVW	R1, #59164
MOVW	R0, #lo_addr(_RadioButton30+50)
MOVT	R0, #hi_addr(_RadioButton30+50)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,2213 :: 		RadioButton30.Background_Color = 0x0000;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton30+46)
MOVT	R0, #hi_addr(_RadioButton30+46)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,2214 :: 		RadioButton30.OnPressPtr      = RadioButton30OnPress;
MOVW	R1, #lo_addr(_RadioButton30OnPress+0)
MOVT	R1, #hi_addr(_RadioButton30OnPress+0)
MOVW	R0, #lo_addr(_RadioButton30+64)
MOVT	R0, #hi_addr(_RadioButton30+64)
STR	R1, [R0, #0]
;ECGsynthetic_driver.c,2216 :: 		RadioButton31.OwnerScreen     = &Screen4;
MOVW	R1, #lo_addr(_Screen4+0)
MOVT	R1, #hi_addr(_Screen4+0)
MOVW	R0, #lo_addr(_RadioButton31+0)
MOVT	R0, #hi_addr(_RadioButton31+0)
STR	R1, [R0, #0]
;ECGsynthetic_driver.c,2217 :: 		RadioButton31.Order           = 6;
MOVS	R1, #6
MOVW	R0, #lo_addr(_RadioButton31+4)
MOVT	R0, #hi_addr(_RadioButton31+4)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,2218 :: 		RadioButton31.Left            = 139;
MOVS	R1, #139
MOVW	R0, #lo_addr(_RadioButton31+6)
MOVT	R0, #hi_addr(_RadioButton31+6)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,2219 :: 		RadioButton31.Top             = 134;
MOVS	R1, #134
MOVW	R0, #lo_addr(_RadioButton31+8)
MOVT	R0, #hi_addr(_RadioButton31+8)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,2220 :: 		RadioButton31.Width           = 57;
MOVS	R1, #57
MOVW	R0, #lo_addr(_RadioButton31+10)
MOVT	R0, #hi_addr(_RadioButton31+10)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,2221 :: 		RadioButton31.Height          = 25;
MOVS	R1, #25
MOVW	R0, #lo_addr(_RadioButton31+12)
MOVT	R0, #hi_addr(_RadioButton31+12)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,2222 :: 		RadioButton31.Pen_Width       = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_RadioButton31+14)
MOVT	R0, #hi_addr(_RadioButton31+14)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,2223 :: 		RadioButton31.Pen_Color       = 0x0000;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton31+16)
MOVT	R0, #hi_addr(_RadioButton31+16)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,2224 :: 		RadioButton31.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_RadioButton31+18)
MOVT	R0, #hi_addr(_RadioButton31+18)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,2225 :: 		RadioButton31.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_RadioButton31+19)
MOVT	R0, #hi_addr(_RadioButton31+19)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,2226 :: 		RadioButton31.Checked         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton31+20)
MOVT	R0, #hi_addr(_RadioButton31+20)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,2227 :: 		RadioButton31.Transparent     = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_RadioButton31+21)
MOVT	R0, #hi_addr(_RadioButton31+21)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,2228 :: 		RadioButton31.Caption         = RadioButton31_Caption;
MOVW	R1, #lo_addr(_RadioButton31_Caption+0)
MOVT	R1, #hi_addr(_RadioButton31_Caption+0)
MOVW	R0, #lo_addr(_RadioButton31+24)
MOVT	R0, #hi_addr(_RadioButton31+24)
STR	R1, [R0, #0]
;ECGsynthetic_driver.c,2229 :: 		RadioButton31.TextAlign       = _taLeft;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton31+28)
MOVT	R0, #hi_addr(_RadioButton31+28)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,2230 :: 		RadioButton31.FontName        = DejaVu_Serif16x19_Regular;
MOVW	R0, #lo_addr(_RadioButton31+32)
MOVT	R0, #hi_addr(_RadioButton31+32)
STR	R5, [R0, #0]
;ECGsynthetic_driver.c,2231 :: 		RadioButton31.PressColEnabled = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_RadioButton31+48)
MOVT	R0, #hi_addr(_RadioButton31+48)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,2232 :: 		RadioButton31.Font_Color      = 0x0000;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton31+36)
MOVT	R0, #hi_addr(_RadioButton31+36)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,2233 :: 		RadioButton31.Gradient        = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton31+38)
MOVT	R0, #hi_addr(_RadioButton31+38)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,2234 :: 		RadioButton31.Gradient_Orientation = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton31+39)
MOVT	R0, #hi_addr(_RadioButton31+39)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,2235 :: 		RadioButton31.Gradient_Start_Color = 0xFFFF;
MOVW	R1, #65535
MOVW	R0, #lo_addr(_RadioButton31+40)
MOVT	R0, #hi_addr(_RadioButton31+40)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,2236 :: 		RadioButton31.Gradient_End_Color = 0xC618;
MOVW	R1, #50712
MOVW	R0, #lo_addr(_RadioButton31+42)
MOVT	R0, #hi_addr(_RadioButton31+42)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,2237 :: 		RadioButton31.Color           = 0xFFFF;
MOVW	R1, #65535
MOVW	R0, #lo_addr(_RadioButton31+44)
MOVT	R0, #hi_addr(_RadioButton31+44)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,2238 :: 		RadioButton31.Press_Color     = 0xE71C;
MOVW	R1, #59164
MOVW	R0, #lo_addr(_RadioButton31+50)
MOVT	R0, #hi_addr(_RadioButton31+50)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,2239 :: 		RadioButton31.Background_Color = 0x0000;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton31+46)
MOVT	R0, #hi_addr(_RadioButton31+46)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,2240 :: 		RadioButton31.OnPressPtr      = RadioButton31OnPress;
MOVW	R1, #lo_addr(_RadioButton31OnPress+0)
MOVT	R1, #hi_addr(_RadioButton31OnPress+0)
MOVW	R0, #lo_addr(_RadioButton31+64)
MOVT	R0, #hi_addr(_RadioButton31+64)
STR	R1, [R0, #0]
;ECGsynthetic_driver.c,2242 :: 		RadioButton32.OwnerScreen     = &Screen4;
MOVW	R1, #lo_addr(_Screen4+0)
MOVT	R1, #hi_addr(_Screen4+0)
MOVW	R0, #lo_addr(_RadioButton32+0)
MOVT	R0, #hi_addr(_RadioButton32+0)
STR	R1, [R0, #0]
;ECGsynthetic_driver.c,2243 :: 		RadioButton32.Order           = 7;
MOVS	R1, #7
MOVW	R0, #lo_addr(_RadioButton32+4)
MOVT	R0, #hi_addr(_RadioButton32+4)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,2244 :: 		RadioButton32.Left            = 139;
MOVS	R1, #139
MOVW	R0, #lo_addr(_RadioButton32+6)
MOVT	R0, #hi_addr(_RadioButton32+6)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,2245 :: 		RadioButton32.Top             = 174;
MOVS	R1, #174
MOVW	R0, #lo_addr(_RadioButton32+8)
MOVT	R0, #hi_addr(_RadioButton32+8)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,2246 :: 		RadioButton32.Width           = 57;
MOVS	R1, #57
MOVW	R0, #lo_addr(_RadioButton32+10)
MOVT	R0, #hi_addr(_RadioButton32+10)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,2247 :: 		RadioButton32.Height          = 25;
MOVS	R1, #25
MOVW	R0, #lo_addr(_RadioButton32+12)
MOVT	R0, #hi_addr(_RadioButton32+12)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,2248 :: 		RadioButton32.Pen_Width       = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_RadioButton32+14)
MOVT	R0, #hi_addr(_RadioButton32+14)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,2249 :: 		RadioButton32.Pen_Color       = 0x0000;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton32+16)
MOVT	R0, #hi_addr(_RadioButton32+16)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,2250 :: 		RadioButton32.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_RadioButton32+18)
MOVT	R0, #hi_addr(_RadioButton32+18)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,2251 :: 		RadioButton32.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_RadioButton32+19)
MOVT	R0, #hi_addr(_RadioButton32+19)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,2252 :: 		RadioButton32.Checked         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton32+20)
MOVT	R0, #hi_addr(_RadioButton32+20)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,2253 :: 		RadioButton32.Transparent     = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_RadioButton32+21)
MOVT	R0, #hi_addr(_RadioButton32+21)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,2254 :: 		RadioButton32.Caption         = RadioButton32_Caption;
MOVW	R1, #lo_addr(_RadioButton32_Caption+0)
MOVT	R1, #hi_addr(_RadioButton32_Caption+0)
MOVW	R0, #lo_addr(_RadioButton32+24)
MOVT	R0, #hi_addr(_RadioButton32+24)
STR	R1, [R0, #0]
;ECGsynthetic_driver.c,2255 :: 		RadioButton32.TextAlign       = _taLeft;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton32+28)
MOVT	R0, #hi_addr(_RadioButton32+28)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,2256 :: 		RadioButton32.FontName        = DejaVu_Serif16x19_Regular;
MOVW	R0, #lo_addr(_RadioButton32+32)
MOVT	R0, #hi_addr(_RadioButton32+32)
STR	R5, [R0, #0]
;ECGsynthetic_driver.c,2257 :: 		RadioButton32.PressColEnabled = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_RadioButton32+48)
MOVT	R0, #hi_addr(_RadioButton32+48)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,2258 :: 		RadioButton32.Font_Color      = 0x0000;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton32+36)
MOVT	R0, #hi_addr(_RadioButton32+36)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,2259 :: 		RadioButton32.Gradient        = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton32+38)
MOVT	R0, #hi_addr(_RadioButton32+38)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,2260 :: 		RadioButton32.Gradient_Orientation = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton32+39)
MOVT	R0, #hi_addr(_RadioButton32+39)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,2261 :: 		RadioButton32.Gradient_Start_Color = 0xFFFF;
MOVW	R1, #65535
MOVW	R0, #lo_addr(_RadioButton32+40)
MOVT	R0, #hi_addr(_RadioButton32+40)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,2262 :: 		RadioButton32.Gradient_End_Color = 0xC618;
MOVW	R1, #50712
MOVW	R0, #lo_addr(_RadioButton32+42)
MOVT	R0, #hi_addr(_RadioButton32+42)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,2263 :: 		RadioButton32.Color           = 0xFFFF;
MOVW	R1, #65535
MOVW	R0, #lo_addr(_RadioButton32+44)
MOVT	R0, #hi_addr(_RadioButton32+44)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,2264 :: 		RadioButton32.Press_Color     = 0xE71C;
MOVW	R1, #59164
MOVW	R0, #lo_addr(_RadioButton32+50)
MOVT	R0, #hi_addr(_RadioButton32+50)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,2265 :: 		RadioButton32.Background_Color = 0x0000;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton32+46)
MOVT	R0, #hi_addr(_RadioButton32+46)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,2266 :: 		RadioButton32.OnPressPtr      = RadioButton32OnPress;
MOVW	R1, #lo_addr(_RadioButton32OnPress+0)
MOVT	R1, #hi_addr(_RadioButton32OnPress+0)
MOVW	R0, #lo_addr(_RadioButton32+64)
MOVT	R0, #hi_addr(_RadioButton32+64)
STR	R1, [R0, #0]
;ECGsynthetic_driver.c,2268 :: 		RadioButton33.OwnerScreen     = &Screen4;
MOVW	R1, #lo_addr(_Screen4+0)
MOVT	R1, #hi_addr(_Screen4+0)
MOVW	R0, #lo_addr(_RadioButton33+0)
MOVT	R0, #hi_addr(_RadioButton33+0)
STR	R1, [R0, #0]
;ECGsynthetic_driver.c,2269 :: 		RadioButton33.Order           = 8;
MOVS	R1, #8
MOVW	R0, #lo_addr(_RadioButton33+4)
MOVT	R0, #hi_addr(_RadioButton33+4)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,2270 :: 		RadioButton33.Left            = 139;
MOVS	R1, #139
MOVW	R0, #lo_addr(_RadioButton33+6)
MOVT	R0, #hi_addr(_RadioButton33+6)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,2271 :: 		RadioButton33.Top             = 214;
MOVS	R1, #214
MOVW	R0, #lo_addr(_RadioButton33+8)
MOVT	R0, #hi_addr(_RadioButton33+8)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,2272 :: 		RadioButton33.Width           = 57;
MOVS	R1, #57
MOVW	R0, #lo_addr(_RadioButton33+10)
MOVT	R0, #hi_addr(_RadioButton33+10)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,2273 :: 		RadioButton33.Height          = 25;
MOVS	R1, #25
MOVW	R0, #lo_addr(_RadioButton33+12)
MOVT	R0, #hi_addr(_RadioButton33+12)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,2274 :: 		RadioButton33.Pen_Width       = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_RadioButton33+14)
MOVT	R0, #hi_addr(_RadioButton33+14)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,2275 :: 		RadioButton33.Pen_Color       = 0x0000;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton33+16)
MOVT	R0, #hi_addr(_RadioButton33+16)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,2276 :: 		RadioButton33.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_RadioButton33+18)
MOVT	R0, #hi_addr(_RadioButton33+18)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,2277 :: 		RadioButton33.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_RadioButton33+19)
MOVT	R0, #hi_addr(_RadioButton33+19)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,2278 :: 		RadioButton33.Checked         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton33+20)
MOVT	R0, #hi_addr(_RadioButton33+20)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,2279 :: 		RadioButton33.Transparent     = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_RadioButton33+21)
MOVT	R0, #hi_addr(_RadioButton33+21)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,2280 :: 		RadioButton33.Caption         = RadioButton33_Caption;
MOVW	R1, #lo_addr(_RadioButton33_Caption+0)
MOVT	R1, #hi_addr(_RadioButton33_Caption+0)
MOVW	R0, #lo_addr(_RadioButton33+24)
MOVT	R0, #hi_addr(_RadioButton33+24)
STR	R1, [R0, #0]
;ECGsynthetic_driver.c,2281 :: 		RadioButton33.TextAlign       = _taLeft;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton33+28)
MOVT	R0, #hi_addr(_RadioButton33+28)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,2282 :: 		RadioButton33.FontName        = DejaVu_Serif16x19_Regular;
MOVW	R0, #lo_addr(_RadioButton33+32)
MOVT	R0, #hi_addr(_RadioButton33+32)
STR	R5, [R0, #0]
;ECGsynthetic_driver.c,2283 :: 		RadioButton33.PressColEnabled = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_RadioButton33+48)
MOVT	R0, #hi_addr(_RadioButton33+48)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,2284 :: 		RadioButton33.Font_Color      = 0x0000;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton33+36)
MOVT	R0, #hi_addr(_RadioButton33+36)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,2285 :: 		RadioButton33.Gradient        = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton33+38)
MOVT	R0, #hi_addr(_RadioButton33+38)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,2286 :: 		RadioButton33.Gradient_Orientation = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton33+39)
MOVT	R0, #hi_addr(_RadioButton33+39)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,2287 :: 		RadioButton33.Gradient_Start_Color = 0xFFFF;
MOVW	R1, #65535
MOVW	R0, #lo_addr(_RadioButton33+40)
MOVT	R0, #hi_addr(_RadioButton33+40)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,2288 :: 		RadioButton33.Gradient_End_Color = 0xC618;
MOVW	R1, #50712
MOVW	R0, #lo_addr(_RadioButton33+42)
MOVT	R0, #hi_addr(_RadioButton33+42)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,2289 :: 		RadioButton33.Color           = 0xFFFF;
MOVW	R1, #65535
MOVW	R0, #lo_addr(_RadioButton33+44)
MOVT	R0, #hi_addr(_RadioButton33+44)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,2290 :: 		RadioButton33.Press_Color     = 0xE71C;
MOVW	R1, #59164
MOVW	R0, #lo_addr(_RadioButton33+50)
MOVT	R0, #hi_addr(_RadioButton33+50)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,2291 :: 		RadioButton33.Background_Color = 0x0000;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton33+46)
MOVT	R0, #hi_addr(_RadioButton33+46)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,2292 :: 		RadioButton33.OnPressPtr      = RadioButton33OnPress;
MOVW	R1, #lo_addr(_RadioButton33OnPress+0)
MOVT	R1, #hi_addr(_RadioButton33OnPress+0)
MOVW	R0, #lo_addr(_RadioButton33+64)
MOVT	R0, #hi_addr(_RadioButton33+64)
STR	R1, [R0, #0]
;ECGsynthetic_driver.c,2294 :: 		RadioButton34.OwnerScreen     = &Screen4;
MOVW	R1, #lo_addr(_Screen4+0)
MOVT	R1, #hi_addr(_Screen4+0)
MOVW	R0, #lo_addr(_RadioButton34+0)
MOVT	R0, #hi_addr(_RadioButton34+0)
STR	R1, [R0, #0]
;ECGsynthetic_driver.c,2295 :: 		RadioButton34.Order           = 9;
MOVS	R1, #9
MOVW	R0, #lo_addr(_RadioButton34+4)
MOVT	R0, #hi_addr(_RadioButton34+4)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,2296 :: 		RadioButton34.Left            = 139;
MOVS	R1, #139
MOVW	R0, #lo_addr(_RadioButton34+6)
MOVT	R0, #hi_addr(_RadioButton34+6)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,2297 :: 		RadioButton34.Top             = 254;
MOVS	R1, #254
MOVW	R0, #lo_addr(_RadioButton34+8)
MOVT	R0, #hi_addr(_RadioButton34+8)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,2298 :: 		RadioButton34.Width           = 57;
MOVS	R1, #57
MOVW	R0, #lo_addr(_RadioButton34+10)
MOVT	R0, #hi_addr(_RadioButton34+10)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,2299 :: 		RadioButton34.Height          = 25;
MOVS	R1, #25
MOVW	R0, #lo_addr(_RadioButton34+12)
MOVT	R0, #hi_addr(_RadioButton34+12)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,2300 :: 		RadioButton34.Pen_Width       = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_RadioButton34+14)
MOVT	R0, #hi_addr(_RadioButton34+14)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,2301 :: 		RadioButton34.Pen_Color       = 0x0000;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton34+16)
MOVT	R0, #hi_addr(_RadioButton34+16)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,2302 :: 		RadioButton34.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_RadioButton34+18)
MOVT	R0, #hi_addr(_RadioButton34+18)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,2303 :: 		RadioButton34.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_RadioButton34+19)
MOVT	R0, #hi_addr(_RadioButton34+19)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,2304 :: 		RadioButton34.Checked         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton34+20)
MOVT	R0, #hi_addr(_RadioButton34+20)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,2305 :: 		RadioButton34.Transparent     = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_RadioButton34+21)
MOVT	R0, #hi_addr(_RadioButton34+21)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,2306 :: 		RadioButton34.Caption         = RadioButton34_Caption;
MOVW	R1, #lo_addr(_RadioButton34_Caption+0)
MOVT	R1, #hi_addr(_RadioButton34_Caption+0)
MOVW	R0, #lo_addr(_RadioButton34+24)
MOVT	R0, #hi_addr(_RadioButton34+24)
STR	R1, [R0, #0]
;ECGsynthetic_driver.c,2307 :: 		RadioButton34.TextAlign       = _taLeft;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton34+28)
MOVT	R0, #hi_addr(_RadioButton34+28)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,2308 :: 		RadioButton34.FontName        = DejaVu_Serif16x19_Regular;
MOVW	R0, #lo_addr(_RadioButton34+32)
MOVT	R0, #hi_addr(_RadioButton34+32)
STR	R5, [R0, #0]
;ECGsynthetic_driver.c,2309 :: 		RadioButton34.PressColEnabled = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_RadioButton34+48)
MOVT	R0, #hi_addr(_RadioButton34+48)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,2310 :: 		RadioButton34.Font_Color      = 0x0000;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton34+36)
MOVT	R0, #hi_addr(_RadioButton34+36)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,2311 :: 		RadioButton34.Gradient        = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton34+38)
MOVT	R0, #hi_addr(_RadioButton34+38)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,2312 :: 		RadioButton34.Gradient_Orientation = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton34+39)
MOVT	R0, #hi_addr(_RadioButton34+39)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,2313 :: 		RadioButton34.Gradient_Start_Color = 0xFFFF;
MOVW	R1, #65535
MOVW	R0, #lo_addr(_RadioButton34+40)
MOVT	R0, #hi_addr(_RadioButton34+40)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,2314 :: 		RadioButton34.Gradient_End_Color = 0xC618;
MOVW	R1, #50712
MOVW	R0, #lo_addr(_RadioButton34+42)
MOVT	R0, #hi_addr(_RadioButton34+42)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,2315 :: 		RadioButton34.Color           = 0xFFFF;
MOVW	R1, #65535
MOVW	R0, #lo_addr(_RadioButton34+44)
MOVT	R0, #hi_addr(_RadioButton34+44)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,2316 :: 		RadioButton34.Press_Color     = 0xE71C;
MOVW	R1, #59164
MOVW	R0, #lo_addr(_RadioButton34+50)
MOVT	R0, #hi_addr(_RadioButton34+50)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,2317 :: 		RadioButton34.Background_Color = 0x0000;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton34+46)
MOVT	R0, #hi_addr(_RadioButton34+46)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,2318 :: 		RadioButton34.OnPressPtr      = RadioButton34OnPress;
MOVW	R1, #lo_addr(_RadioButton34OnPress+0)
MOVT	R1, #hi_addr(_RadioButton34OnPress+0)
MOVW	R0, #lo_addr(_RadioButton34+64)
MOVT	R0, #hi_addr(_RadioButton34+64)
STR	R1, [R0, #0]
;ECGsynthetic_driver.c,2320 :: 		RadioButton35.OwnerScreen     = &Screen4;
MOVW	R1, #lo_addr(_Screen4+0)
MOVT	R1, #hi_addr(_Screen4+0)
MOVW	R0, #lo_addr(_RadioButton35+0)
MOVT	R0, #hi_addr(_RadioButton35+0)
STR	R1, [R0, #0]
;ECGsynthetic_driver.c,2321 :: 		RadioButton35.Order           = 10;
MOVS	R1, #10
MOVW	R0, #lo_addr(_RadioButton35+4)
MOVT	R0, #hi_addr(_RadioButton35+4)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,2322 :: 		RadioButton35.Left            = 139;
MOVS	R1, #139
MOVW	R0, #lo_addr(_RadioButton35+6)
MOVT	R0, #hi_addr(_RadioButton35+6)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,2323 :: 		RadioButton35.Top             = 292;
MOVW	R1, #292
MOVW	R0, #lo_addr(_RadioButton35+8)
MOVT	R0, #hi_addr(_RadioButton35+8)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,2324 :: 		RadioButton35.Width           = 57;
MOVS	R1, #57
MOVW	R0, #lo_addr(_RadioButton35+10)
MOVT	R0, #hi_addr(_RadioButton35+10)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,2325 :: 		RadioButton35.Height          = 25;
MOVS	R1, #25
MOVW	R0, #lo_addr(_RadioButton35+12)
MOVT	R0, #hi_addr(_RadioButton35+12)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,2326 :: 		RadioButton35.Pen_Width       = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_RadioButton35+14)
MOVT	R0, #hi_addr(_RadioButton35+14)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,2327 :: 		RadioButton35.Pen_Color       = 0x0000;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton35+16)
MOVT	R0, #hi_addr(_RadioButton35+16)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,2328 :: 		RadioButton35.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_RadioButton35+18)
MOVT	R0, #hi_addr(_RadioButton35+18)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,2329 :: 		RadioButton35.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_RadioButton35+19)
MOVT	R0, #hi_addr(_RadioButton35+19)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,2330 :: 		RadioButton35.Checked         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton35+20)
MOVT	R0, #hi_addr(_RadioButton35+20)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,2331 :: 		RadioButton35.Transparent     = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_RadioButton35+21)
MOVT	R0, #hi_addr(_RadioButton35+21)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,2332 :: 		RadioButton35.Caption         = RadioButton35_Caption;
MOVW	R1, #lo_addr(_RadioButton35_Caption+0)
MOVT	R1, #hi_addr(_RadioButton35_Caption+0)
MOVW	R0, #lo_addr(_RadioButton35+24)
MOVT	R0, #hi_addr(_RadioButton35+24)
STR	R1, [R0, #0]
;ECGsynthetic_driver.c,2333 :: 		RadioButton35.TextAlign       = _taLeft;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton35+28)
MOVT	R0, #hi_addr(_RadioButton35+28)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,2334 :: 		RadioButton35.FontName        = DejaVu_Serif16x19_Regular;
MOVW	R0, #lo_addr(_RadioButton35+32)
MOVT	R0, #hi_addr(_RadioButton35+32)
STR	R5, [R0, #0]
;ECGsynthetic_driver.c,2335 :: 		RadioButton35.PressColEnabled = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_RadioButton35+48)
MOVT	R0, #hi_addr(_RadioButton35+48)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,2336 :: 		RadioButton35.Font_Color      = 0x0000;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton35+36)
MOVT	R0, #hi_addr(_RadioButton35+36)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,2337 :: 		RadioButton35.Gradient        = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton35+38)
MOVT	R0, #hi_addr(_RadioButton35+38)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,2338 :: 		RadioButton35.Gradient_Orientation = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton35+39)
MOVT	R0, #hi_addr(_RadioButton35+39)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,2339 :: 		RadioButton35.Gradient_Start_Color = 0xFFFF;
MOVW	R1, #65535
MOVW	R0, #lo_addr(_RadioButton35+40)
MOVT	R0, #hi_addr(_RadioButton35+40)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,2340 :: 		RadioButton35.Gradient_End_Color = 0xC618;
MOVW	R1, #50712
MOVW	R0, #lo_addr(_RadioButton35+42)
MOVT	R0, #hi_addr(_RadioButton35+42)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,2341 :: 		RadioButton35.Color           = 0xFFFF;
MOVW	R1, #65535
MOVW	R0, #lo_addr(_RadioButton35+44)
MOVT	R0, #hi_addr(_RadioButton35+44)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,2342 :: 		RadioButton35.Press_Color     = 0xE71C;
MOVW	R1, #59164
MOVW	R0, #lo_addr(_RadioButton35+50)
MOVT	R0, #hi_addr(_RadioButton35+50)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,2343 :: 		RadioButton35.Background_Color = 0x0000;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton35+46)
MOVT	R0, #hi_addr(_RadioButton35+46)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,2344 :: 		RadioButton35.OnPressPtr      = RadioButton35OnPress;
MOVW	R1, #lo_addr(_RadioButton35OnPress+0)
MOVT	R1, #hi_addr(_RadioButton35OnPress+0)
MOVW	R0, #lo_addr(_RadioButton35+64)
MOVT	R0, #hi_addr(_RadioButton35+64)
STR	R1, [R0, #0]
;ECGsynthetic_driver.c,2346 :: 		RadioButton36.OwnerScreen     = &Screen4;
MOVW	R1, #lo_addr(_Screen4+0)
MOVT	R1, #hi_addr(_Screen4+0)
MOVW	R0, #lo_addr(_RadioButton36+0)
MOVT	R0, #hi_addr(_RadioButton36+0)
STR	R1, [R0, #0]
;ECGsynthetic_driver.c,2347 :: 		RadioButton36.Order           = 11;
MOVS	R1, #11
MOVW	R0, #lo_addr(_RadioButton36+4)
MOVT	R0, #hi_addr(_RadioButton36+4)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,2348 :: 		RadioButton36.Left            = 140;
MOVS	R1, #140
MOVW	R0, #lo_addr(_RadioButton36+6)
MOVT	R0, #hi_addr(_RadioButton36+6)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,2349 :: 		RadioButton36.Top             = 335;
MOVW	R1, #335
MOVW	R0, #lo_addr(_RadioButton36+8)
MOVT	R0, #hi_addr(_RadioButton36+8)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,2350 :: 		RadioButton36.Width           = 57;
MOVS	R1, #57
MOVW	R0, #lo_addr(_RadioButton36+10)
MOVT	R0, #hi_addr(_RadioButton36+10)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,2351 :: 		RadioButton36.Height          = 25;
MOVS	R1, #25
MOVW	R0, #lo_addr(_RadioButton36+12)
MOVT	R0, #hi_addr(_RadioButton36+12)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,2352 :: 		RadioButton36.Pen_Width       = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_RadioButton36+14)
MOVT	R0, #hi_addr(_RadioButton36+14)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,2353 :: 		RadioButton36.Pen_Color       = 0x0000;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton36+16)
MOVT	R0, #hi_addr(_RadioButton36+16)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,2354 :: 		RadioButton36.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_RadioButton36+18)
MOVT	R0, #hi_addr(_RadioButton36+18)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,2355 :: 		RadioButton36.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_RadioButton36+19)
MOVT	R0, #hi_addr(_RadioButton36+19)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,2356 :: 		RadioButton36.Checked         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton36+20)
MOVT	R0, #hi_addr(_RadioButton36+20)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,2357 :: 		RadioButton36.Transparent     = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_RadioButton36+21)
MOVT	R0, #hi_addr(_RadioButton36+21)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,2358 :: 		RadioButton36.Caption         = RadioButton36_Caption;
MOVW	R1, #lo_addr(_RadioButton36_Caption+0)
MOVT	R1, #hi_addr(_RadioButton36_Caption+0)
MOVW	R0, #lo_addr(_RadioButton36+24)
MOVT	R0, #hi_addr(_RadioButton36+24)
STR	R1, [R0, #0]
;ECGsynthetic_driver.c,2359 :: 		RadioButton36.TextAlign       = _taLeft;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton36+28)
MOVT	R0, #hi_addr(_RadioButton36+28)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,2360 :: 		RadioButton36.FontName        = DejaVu_Serif16x19_Regular;
MOVW	R0, #lo_addr(_RadioButton36+32)
MOVT	R0, #hi_addr(_RadioButton36+32)
STR	R5, [R0, #0]
;ECGsynthetic_driver.c,2361 :: 		RadioButton36.PressColEnabled = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_RadioButton36+48)
MOVT	R0, #hi_addr(_RadioButton36+48)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,2362 :: 		RadioButton36.Font_Color      = 0x0000;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton36+36)
MOVT	R0, #hi_addr(_RadioButton36+36)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,2363 :: 		RadioButton36.Gradient        = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton36+38)
MOVT	R0, #hi_addr(_RadioButton36+38)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,2364 :: 		RadioButton36.Gradient_Orientation = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton36+39)
MOVT	R0, #hi_addr(_RadioButton36+39)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,2365 :: 		RadioButton36.Gradient_Start_Color = 0xFFFF;
MOVW	R1, #65535
MOVW	R0, #lo_addr(_RadioButton36+40)
MOVT	R0, #hi_addr(_RadioButton36+40)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,2366 :: 		RadioButton36.Gradient_End_Color = 0xC618;
MOVW	R1, #50712
MOVW	R0, #lo_addr(_RadioButton36+42)
MOVT	R0, #hi_addr(_RadioButton36+42)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,2367 :: 		RadioButton36.Color           = 0xFFFF;
MOVW	R1, #65535
MOVW	R0, #lo_addr(_RadioButton36+44)
MOVT	R0, #hi_addr(_RadioButton36+44)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,2368 :: 		RadioButton36.Press_Color     = 0xE71C;
MOVW	R1, #59164
MOVW	R0, #lo_addr(_RadioButton36+50)
MOVT	R0, #hi_addr(_RadioButton36+50)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,2369 :: 		RadioButton36.Background_Color = 0x0000;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton36+46)
MOVT	R0, #hi_addr(_RadioButton36+46)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,2370 :: 		RadioButton36.OnPressPtr      = RadioButton36OnPress;
MOVW	R1, #lo_addr(_RadioButton36OnPress+0)
MOVT	R1, #hi_addr(_RadioButton36OnPress+0)
MOVW	R0, #lo_addr(_RadioButton36+64)
MOVT	R0, #hi_addr(_RadioButton36+64)
STR	R1, [R0, #0]
;ECGsynthetic_driver.c,2372 :: 		Label20.OwnerScreen     = &Screen4;
MOVW	R1, #lo_addr(_Screen4+0)
MOVT	R1, #hi_addr(_Screen4+0)
MOVW	R0, #lo_addr(_Label20+0)
MOVT	R0, #hi_addr(_Label20+0)
STR	R1, [R0, #0]
;ECGsynthetic_driver.c,2373 :: 		Label20.Order           = 12;
MOVS	R1, #12
MOVW	R0, #lo_addr(_Label20+4)
MOVT	R0, #hi_addr(_Label20+4)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,2374 :: 		Label20.Left            = 391;
MOVW	R1, #391
MOVW	R0, #lo_addr(_Label20+6)
MOVT	R0, #hi_addr(_Label20+6)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,2375 :: 		Label20.Top             = 37;
MOVS	R1, #37
MOVW	R0, #lo_addr(_Label20+8)
MOVT	R0, #hi_addr(_Label20+8)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,2376 :: 		Label20.Width           = 158;
MOVS	R1, #158
MOVW	R0, #lo_addr(_Label20+10)
MOVT	R0, #hi_addr(_Label20+10)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,2377 :: 		Label20.Height          = 26;
MOVS	R1, #26
MOVW	R0, #lo_addr(_Label20+12)
MOVT	R0, #hi_addr(_Label20+12)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,2378 :: 		Label20.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Label20+27)
MOVT	R0, #hi_addr(_Label20+27)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,2379 :: 		Label20.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Label20+28)
MOVT	R0, #hi_addr(_Label20+28)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,2380 :: 		Label20.Caption         = Label20_Caption;
MOVW	R1, #lo_addr(_Label20_Caption+0)
MOVT	R1, #hi_addr(_Label20_Caption+0)
MOVW	R0, #lo_addr(_Label20+16)
MOVT	R0, #hi_addr(_Label20+16)
STR	R1, [R0, #0]
;ECGsynthetic_driver.c,2381 :: 		Label20.FontName        = DejaVu_Serif22x24_Bold;
MOVW	R0, #lo_addr(_Label20+20)
MOVT	R0, #hi_addr(_Label20+20)
STR	R4, [R0, #0]
;ECGsynthetic_driver.c,2382 :: 		Label20.Font_Color      = 0x0000;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label20+24)
MOVT	R0, #hi_addr(_Label20+24)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,2383 :: 		Label20.VerticalText    = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label20+26)
MOVT	R0, #hi_addr(_Label20+26)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,2385 :: 		ButtonRound7.OwnerScreen     = &Screen4;
MOVW	R1, #lo_addr(_Screen4+0)
MOVT	R1, #hi_addr(_Screen4+0)
MOVW	R0, #lo_addr(_ButtonRound7+0)
MOVT	R0, #hi_addr(_ButtonRound7+0)
STR	R1, [R0, #0]
;ECGsynthetic_driver.c,2386 :: 		ButtonRound7.Order           = 13;
MOVS	R1, #13
MOVW	R0, #lo_addr(_ButtonRound7+4)
MOVT	R0, #hi_addr(_ButtonRound7+4)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,2387 :: 		ButtonRound7.Left            = 631;
MOVW	R1, #631
MOVW	R0, #lo_addr(_ButtonRound7+6)
MOVT	R0, #hi_addr(_ButtonRound7+6)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,2388 :: 		ButtonRound7.Top             = 402;
MOVW	R1, #402
MOVW	R0, #lo_addr(_ButtonRound7+8)
MOVT	R0, #hi_addr(_ButtonRound7+8)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,2389 :: 		ButtonRound7.Width           = 109;
MOVS	R1, #109
MOVW	R0, #lo_addr(_ButtonRound7+10)
MOVT	R0, #hi_addr(_ButtonRound7+10)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,2390 :: 		ButtonRound7.Height          = 53;
MOVS	R1, #53
MOVW	R0, #lo_addr(_ButtonRound7+12)
MOVT	R0, #hi_addr(_ButtonRound7+12)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,2391 :: 		ButtonRound7.Pen_Width       = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_ButtonRound7+14)
MOVT	R0, #hi_addr(_ButtonRound7+14)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,2392 :: 		ButtonRound7.Pen_Color       = 0x07E0;
MOVW	R1, #2016
MOVW	R0, #lo_addr(_ButtonRound7+16)
MOVT	R0, #hi_addr(_ButtonRound7+16)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,2393 :: 		ButtonRound7.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_ButtonRound7+18)
MOVT	R0, #hi_addr(_ButtonRound7+18)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,2394 :: 		ButtonRound7.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_ButtonRound7+19)
MOVT	R0, #hi_addr(_ButtonRound7+19)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,2395 :: 		ButtonRound7.Transparent     = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_ButtonRound7+20)
MOVT	R0, #hi_addr(_ButtonRound7+20)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,2396 :: 		ButtonRound7.Caption         = ButtonRound7_Caption;
MOVW	R1, #lo_addr(_ButtonRound7_Caption+0)
MOVT	R1, #hi_addr(_ButtonRound7_Caption+0)
MOVW	R0, #lo_addr(_ButtonRound7+24)
MOVT	R0, #hi_addr(_ButtonRound7+24)
STR	R1, [R0, #0]
;ECGsynthetic_driver.c,2397 :: 		ButtonRound7.TextAlign       = _taCenter;
MOVS	R1, #1
MOVW	R0, #lo_addr(_ButtonRound7+28)
MOVT	R0, #hi_addr(_ButtonRound7+28)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,2398 :: 		ButtonRound7.TextAlignVertical= _tavMiddle;
MOVS	R1, #1
MOVW	R0, #lo_addr(_ButtonRound7+29)
MOVT	R0, #hi_addr(_ButtonRound7+29)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,2399 :: 		ButtonRound7.FontName        = Tahoma25x25_Bold;
MOVW	R0, #lo_addr(_ButtonRound7+32)
MOVT	R0, #hi_addr(_ButtonRound7+32)
STR	R3, [R0, #0]
;ECGsynthetic_driver.c,2400 :: 		ButtonRound7.PressColEnabled = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_ButtonRound7+49)
MOVT	R0, #hi_addr(_ButtonRound7+49)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,2401 :: 		ButtonRound7.Font_Color      = 0xFFFF;
MOVW	R1, #65535
MOVW	R0, #lo_addr(_ButtonRound7+36)
MOVT	R0, #hi_addr(_ButtonRound7+36)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,2402 :: 		ButtonRound7.VerticalText    = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_ButtonRound7+38)
MOVT	R0, #hi_addr(_ButtonRound7+38)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,2403 :: 		ButtonRound7.Gradient        = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_ButtonRound7+39)
MOVT	R0, #hi_addr(_ButtonRound7+39)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,2404 :: 		ButtonRound7.Gradient_Orientation = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_ButtonRound7+40)
MOVT	R0, #hi_addr(_ButtonRound7+40)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,2405 :: 		ButtonRound7.Gradient_Start_Color = 0xFFFF;
MOVW	R1, #65535
MOVW	R0, #lo_addr(_ButtonRound7+42)
MOVT	R0, #hi_addr(_ButtonRound7+42)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,2406 :: 		ButtonRound7.Gradient_End_Color = 0xC618;
MOVW	R1, #50712
MOVW	R0, #lo_addr(_ButtonRound7+44)
MOVT	R0, #hi_addr(_ButtonRound7+44)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,2407 :: 		ButtonRound7.Color           = 0x07E0;
MOVW	R1, #2016
MOVW	R0, #lo_addr(_ButtonRound7+46)
MOVT	R0, #hi_addr(_ButtonRound7+46)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,2408 :: 		ButtonRound7.Press_Color     = 0xE71C;
MOVW	R1, #59164
MOVW	R0, #lo_addr(_ButtonRound7+50)
MOVT	R0, #hi_addr(_ButtonRound7+50)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,2409 :: 		ButtonRound7.Corner_Radius   = 3;
MOVS	R1, #3
MOVW	R0, #lo_addr(_ButtonRound7+48)
MOVT	R0, #hi_addr(_ButtonRound7+48)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,2410 :: 		ButtonRound7.OnClickPtr      = ButtonRound7OnClick;
MOVW	R1, #lo_addr(_ButtonRound7OnClick+0)
MOVT	R1, #hi_addr(_ButtonRound7OnClick+0)
MOVW	R0, #lo_addr(_ButtonRound7+60)
MOVT	R0, #hi_addr(_ButtonRound7+60)
STR	R1, [R0, #0]
;ECGsynthetic_driver.c,2412 :: 		Label21.OwnerScreen     = &Screen4;
MOVW	R1, #lo_addr(_Screen4+0)
MOVT	R1, #hi_addr(_Screen4+0)
MOVW	R0, #lo_addr(_Label21+0)
MOVT	R0, #hi_addr(_Label21+0)
STR	R1, [R0, #0]
;ECGsynthetic_driver.c,2413 :: 		Label21.Order           = 14;
MOVS	R1, #14
MOVW	R0, #lo_addr(_Label21+4)
MOVT	R0, #hi_addr(_Label21+4)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,2414 :: 		Label21.Left            = 43;
MOVS	R1, #43
MOVW	R0, #lo_addr(_Label21+6)
MOVT	R0, #hi_addr(_Label21+6)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,2415 :: 		Label21.Top             = 81;
MOVS	R1, #81
MOVW	R0, #lo_addr(_Label21+8)
MOVT	R0, #hi_addr(_Label21+8)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,2416 :: 		Label21.Width           = 100;
MOVS	R1, #100
MOVW	R0, #lo_addr(_Label21+10)
MOVT	R0, #hi_addr(_Label21+10)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,2417 :: 		Label21.Height          = 21;
MOVS	R1, #21
MOVW	R0, #lo_addr(_Label21+12)
MOVT	R0, #hi_addr(_Label21+12)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,2418 :: 		Label21.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Label21+27)
MOVT	R0, #hi_addr(_Label21+27)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,2419 :: 		Label21.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Label21+28)
MOVT	R0, #hi_addr(_Label21+28)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,2420 :: 		Label21.Caption         = Label21_Caption;
MOVW	R1, #lo_addr(_Label21_Caption+0)
MOVT	R1, #hi_addr(_Label21_Caption+0)
MOVW	R0, #lo_addr(_Label21+16)
MOVT	R0, #hi_addr(_Label21+16)
STR	R1, [R0, #0]
;ECGsynthetic_driver.c,2421 :: 		Label21.FontName        = DejaVu_Serif16x19_Regular;
MOVW	R0, #lo_addr(_Label21+20)
MOVT	R0, #hi_addr(_Label21+20)
STR	R5, [R0, #0]
;ECGsynthetic_driver.c,2422 :: 		Label21.Font_Color      = 0x0000;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label21+24)
MOVT	R0, #hi_addr(_Label21+24)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,2423 :: 		Label21.VerticalText    = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label21+26)
MOVT	R0, #hi_addr(_Label21+26)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,2425 :: 		ButtonRound8.OwnerScreen     = &Screen4;
MOVW	R1, #lo_addr(_Screen4+0)
MOVT	R1, #hi_addr(_Screen4+0)
MOVW	R0, #lo_addr(_ButtonRound8+0)
MOVT	R0, #hi_addr(_ButtonRound8+0)
STR	R1, [R0, #0]
;ECGsynthetic_driver.c,2426 :: 		ButtonRound8.Order           = 15;
MOVS	R1, #15
MOVW	R0, #lo_addr(_ButtonRound8+4)
MOVT	R0, #hi_addr(_ButtonRound8+4)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,2427 :: 		ButtonRound8.Left            = 227;
MOVS	R1, #227
MOVW	R0, #lo_addr(_ButtonRound8+6)
MOVT	R0, #hi_addr(_ButtonRound8+6)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,2428 :: 		ButtonRound8.Top             = 402;
MOVW	R1, #402
MOVW	R0, #lo_addr(_ButtonRound8+8)
MOVT	R0, #hi_addr(_ButtonRound8+8)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,2429 :: 		ButtonRound8.Width           = 109;
MOVS	R1, #109
MOVW	R0, #lo_addr(_ButtonRound8+10)
MOVT	R0, #hi_addr(_ButtonRound8+10)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,2430 :: 		ButtonRound8.Height          = 53;
MOVS	R1, #53
MOVW	R0, #lo_addr(_ButtonRound8+12)
MOVT	R0, #hi_addr(_ButtonRound8+12)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,2431 :: 		ButtonRound8.Pen_Width       = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_ButtonRound8+14)
MOVT	R0, #hi_addr(_ButtonRound8+14)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,2432 :: 		ButtonRound8.Pen_Color       = 0xEB2F;
MOVW	R1, #60207
MOVW	R0, #lo_addr(_ButtonRound8+16)
MOVT	R0, #hi_addr(_ButtonRound8+16)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,2433 :: 		ButtonRound8.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_ButtonRound8+18)
MOVT	R0, #hi_addr(_ButtonRound8+18)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,2434 :: 		ButtonRound8.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_ButtonRound8+19)
MOVT	R0, #hi_addr(_ButtonRound8+19)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,2435 :: 		ButtonRound8.Transparent     = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_ButtonRound8+20)
MOVT	R0, #hi_addr(_ButtonRound8+20)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,2436 :: 		ButtonRound8.Caption         = ButtonRound8_Caption;
MOVW	R1, #lo_addr(_ButtonRound8_Caption+0)
MOVT	R1, #hi_addr(_ButtonRound8_Caption+0)
MOVW	R0, #lo_addr(_ButtonRound8+24)
MOVT	R0, #hi_addr(_ButtonRound8+24)
STR	R1, [R0, #0]
;ECGsynthetic_driver.c,2437 :: 		ButtonRound8.TextAlign       = _taCenter;
MOVS	R1, #1
MOVW	R0, #lo_addr(_ButtonRound8+28)
MOVT	R0, #hi_addr(_ButtonRound8+28)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,2438 :: 		ButtonRound8.TextAlignVertical= _tavMiddle;
MOVS	R1, #1
MOVW	R0, #lo_addr(_ButtonRound8+29)
MOVT	R0, #hi_addr(_ButtonRound8+29)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,2439 :: 		ButtonRound8.FontName        = Tahoma25x25_Bold;
MOVW	R0, #lo_addr(_ButtonRound8+32)
MOVT	R0, #hi_addr(_ButtonRound8+32)
STR	R3, [R0, #0]
;ECGsynthetic_driver.c,2440 :: 		ButtonRound8.PressColEnabled = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_ButtonRound8+49)
MOVT	R0, #hi_addr(_ButtonRound8+49)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,2441 :: 		ButtonRound8.Font_Color      = 0xFFFF;
MOVW	R1, #65535
MOVW	R0, #lo_addr(_ButtonRound8+36)
MOVT	R0, #hi_addr(_ButtonRound8+36)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,2442 :: 		ButtonRound8.VerticalText    = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_ButtonRound8+38)
MOVT	R0, #hi_addr(_ButtonRound8+38)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,2443 :: 		ButtonRound8.Gradient        = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_ButtonRound8+39)
MOVT	R0, #hi_addr(_ButtonRound8+39)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,2444 :: 		ButtonRound8.Gradient_Orientation = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_ButtonRound8+40)
MOVT	R0, #hi_addr(_ButtonRound8+40)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,2445 :: 		ButtonRound8.Gradient_Start_Color = 0xFFFF;
MOVW	R1, #65535
MOVW	R0, #lo_addr(_ButtonRound8+42)
MOVT	R0, #hi_addr(_ButtonRound8+42)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,2446 :: 		ButtonRound8.Gradient_End_Color = 0xC618;
MOVW	R1, #50712
MOVW	R0, #lo_addr(_ButtonRound8+44)
MOVT	R0, #hi_addr(_ButtonRound8+44)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,2447 :: 		ButtonRound8.Color           = 0xEB2F;
MOVW	R1, #60207
MOVW	R0, #lo_addr(_ButtonRound8+46)
MOVT	R0, #hi_addr(_ButtonRound8+46)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,2448 :: 		ButtonRound8.Press_Color     = 0xE71C;
MOVW	R1, #59164
MOVW	R0, #lo_addr(_ButtonRound8+50)
MOVT	R0, #hi_addr(_ButtonRound8+50)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,2449 :: 		ButtonRound8.Corner_Radius   = 3;
MOVS	R1, #3
MOVW	R0, #lo_addr(_ButtonRound8+48)
MOVT	R0, #hi_addr(_ButtonRound8+48)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,2450 :: 		ButtonRound8.OnClickPtr      = ButtonRound8OnClick;
MOVW	R1, #lo_addr(_ButtonRound8OnClick+0)
MOVT	R1, #hi_addr(_ButtonRound8OnClick+0)
MOVW	R0, #lo_addr(_ButtonRound8+60)
MOVT	R0, #hi_addr(_ButtonRound8+60)
STR	R1, [R0, #0]
;ECGsynthetic_driver.c,2452 :: 		Image5.OwnerScreen     = &Screen4;
MOVW	R1, #lo_addr(_Screen4+0)
MOVT	R1, #hi_addr(_Screen4+0)
MOVW	R0, #lo_addr(_Image5+0)
MOVT	R0, #hi_addr(_Image5+0)
STR	R1, [R0, #0]
;ECGsynthetic_driver.c,2453 :: 		Image5.Order           = 16;
MOVS	R1, #16
MOVW	R0, #lo_addr(_Image5+4)
MOVT	R0, #hi_addr(_Image5+4)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,2454 :: 		Image5.Left            = 225;
MOVS	R1, #225
MOVW	R0, #lo_addr(_Image5+6)
MOVT	R0, #hi_addr(_Image5+6)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,2455 :: 		Image5.Top             = 85;
MOVS	R1, #85
MOVW	R0, #lo_addr(_Image5+8)
MOVT	R0, #hi_addr(_Image5+8)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,2456 :: 		Image5.Width           = 517;
MOVW	R1, #517
MOVW	R0, #lo_addr(_Image5+10)
MOVT	R0, #hi_addr(_Image5+10)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,2457 :: 		Image5.Height          = 298;
MOVW	R1, #298
MOVW	R0, #lo_addr(_Image5+12)
MOVT	R0, #hi_addr(_Image5+12)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,2458 :: 		Image5.Picture_Type    = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image5+22)
MOVT	R0, #hi_addr(_Image5+22)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,2459 :: 		Image5.Picture_Ratio   = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image5+23)
MOVT	R0, #hi_addr(_Image5+23)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,2460 :: 		Image5.Picture_Name    = GridLine1_jpg;
MOVW	R0, #lo_addr(_Image5+16)
MOVT	R0, #hi_addr(_Image5+16)
STR	R2, [R0, #0]
;ECGsynthetic_driver.c,2461 :: 		Image5.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image5+20)
MOVT	R0, #hi_addr(_Image5+20)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,2462 :: 		Image5.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image5+21)
MOVT	R0, #hi_addr(_Image5+21)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,2464 :: 		RadioButton37.OwnerScreen     = &Screen5;
MOVW	R1, #lo_addr(_Screen5+0)
MOVT	R1, #hi_addr(_Screen5+0)
MOVW	R0, #lo_addr(_RadioButton37+0)
MOVT	R0, #hi_addr(_RadioButton37+0)
STR	R1, [R0, #0]
;ECGsynthetic_driver.c,2465 :: 		RadioButton37.Order           = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton37+4)
MOVT	R0, #hi_addr(_RadioButton37+4)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,2466 :: 		RadioButton37.Left            = 42;
MOVS	R1, #42
MOVW	R0, #lo_addr(_RadioButton37+6)
MOVT	R0, #hi_addr(_RadioButton37+6)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,2467 :: 		RadioButton37.Top             = 134;
MOVS	R1, #134
MOVW	R0, #lo_addr(_RadioButton37+8)
MOVT	R0, #hi_addr(_RadioButton37+8)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,2468 :: 		RadioButton37.Width           = 41;
MOVS	R1, #41
MOVW	R0, #lo_addr(_RadioButton37+10)
MOVT	R0, #hi_addr(_RadioButton37+10)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,2469 :: 		RadioButton37.Height          = 25;
MOVS	R1, #25
MOVW	R0, #lo_addr(_RadioButton37+12)
MOVT	R0, #hi_addr(_RadioButton37+12)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,2470 :: 		RadioButton37.Pen_Width       = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_RadioButton37+14)
MOVT	R0, #hi_addr(_RadioButton37+14)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,2471 :: 		RadioButton37.Pen_Color       = 0x0000;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton37+16)
MOVT	R0, #hi_addr(_RadioButton37+16)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,2472 :: 		RadioButton37.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_RadioButton37+18)
MOVT	R0, #hi_addr(_RadioButton37+18)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,2473 :: 		RadioButton37.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_RadioButton37+19)
MOVT	R0, #hi_addr(_RadioButton37+19)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,2474 :: 		RadioButton37.Checked         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton37+20)
MOVT	R0, #hi_addr(_RadioButton37+20)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,2475 :: 		RadioButton37.Transparent     = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_RadioButton37+21)
MOVT	R0, #hi_addr(_RadioButton37+21)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,2476 :: 		RadioButton37.Caption         = RadioButton37_Caption;
MOVW	R1, #lo_addr(_RadioButton37_Caption+0)
MOVT	R1, #hi_addr(_RadioButton37_Caption+0)
MOVW	R0, #lo_addr(_RadioButton37+24)
MOVT	R0, #hi_addr(_RadioButton37+24)
STR	R1, [R0, #0]
;ECGsynthetic_driver.c,2477 :: 		RadioButton37.TextAlign       = _taLeft;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton37+28)
MOVT	R0, #hi_addr(_RadioButton37+28)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,2478 :: 		RadioButton37.FontName        = DejaVu_Serif16x19_Regular;
MOVW	R0, #lo_addr(_RadioButton37+32)
MOVT	R0, #hi_addr(_RadioButton37+32)
STR	R5, [R0, #0]
;ECGsynthetic_driver.c,2479 :: 		RadioButton37.PressColEnabled = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_RadioButton37+48)
MOVT	R0, #hi_addr(_RadioButton37+48)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,2480 :: 		RadioButton37.Font_Color      = 0x0000;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton37+36)
MOVT	R0, #hi_addr(_RadioButton37+36)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,2481 :: 		RadioButton37.Gradient        = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton37+38)
MOVT	R0, #hi_addr(_RadioButton37+38)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,2482 :: 		RadioButton37.Gradient_Orientation = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton37+39)
MOVT	R0, #hi_addr(_RadioButton37+39)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,2483 :: 		RadioButton37.Gradient_Start_Color = 0xFFFF;
MOVW	R1, #65535
MOVW	R0, #lo_addr(_RadioButton37+40)
MOVT	R0, #hi_addr(_RadioButton37+40)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,2484 :: 		RadioButton37.Gradient_End_Color = 0xC618;
MOVW	R1, #50712
MOVW	R0, #lo_addr(_RadioButton37+42)
MOVT	R0, #hi_addr(_RadioButton37+42)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,2485 :: 		RadioButton37.Color           = 0xFFFF;
MOVW	R1, #65535
MOVW	R0, #lo_addr(_RadioButton37+44)
MOVT	R0, #hi_addr(_RadioButton37+44)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,2486 :: 		RadioButton37.Press_Color     = 0xC618;
MOVW	R1, #50712
MOVW	R0, #lo_addr(_RadioButton37+50)
MOVT	R0, #hi_addr(_RadioButton37+50)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,2487 :: 		RadioButton37.Background_Color = 0x0000;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton37+46)
MOVT	R0, #hi_addr(_RadioButton37+46)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,2488 :: 		RadioButton37.OnPressPtr      = RadioButton37OnPress;
MOVW	R1, #lo_addr(_RadioButton37OnPress+0)
MOVT	R1, #hi_addr(_RadioButton37OnPress+0)
MOVW	R0, #lo_addr(_RadioButton37+64)
MOVT	R0, #hi_addr(_RadioButton37+64)
STR	R1, [R0, #0]
;ECGsynthetic_driver.c,2490 :: 		RadioButton38.OwnerScreen     = &Screen5;
MOVW	R1, #lo_addr(_Screen5+0)
MOVT	R1, #hi_addr(_Screen5+0)
MOVW	R0, #lo_addr(_RadioButton38+0)
MOVT	R0, #hi_addr(_RadioButton38+0)
STR	R1, [R0, #0]
;ECGsynthetic_driver.c,2491 :: 		RadioButton38.Order           = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_RadioButton38+4)
MOVT	R0, #hi_addr(_RadioButton38+4)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,2492 :: 		RadioButton38.Left            = 42;
MOVS	R1, #42
MOVW	R0, #lo_addr(_RadioButton38+6)
MOVT	R0, #hi_addr(_RadioButton38+6)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,2493 :: 		RadioButton38.Top             = 174;
MOVS	R1, #174
MOVW	R0, #lo_addr(_RadioButton38+8)
MOVT	R0, #hi_addr(_RadioButton38+8)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,2494 :: 		RadioButton38.Width           = 47;
MOVS	R1, #47
MOVW	R0, #lo_addr(_RadioButton38+10)
MOVT	R0, #hi_addr(_RadioButton38+10)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,2495 :: 		RadioButton38.Height          = 25;
MOVS	R1, #25
MOVW	R0, #lo_addr(_RadioButton38+12)
MOVT	R0, #hi_addr(_RadioButton38+12)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,2496 :: 		RadioButton38.Pen_Width       = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_RadioButton38+14)
MOVT	R0, #hi_addr(_RadioButton38+14)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,2497 :: 		RadioButton38.Pen_Color       = 0x0000;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton38+16)
MOVT	R0, #hi_addr(_RadioButton38+16)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,2498 :: 		RadioButton38.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_RadioButton38+18)
MOVT	R0, #hi_addr(_RadioButton38+18)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,2499 :: 		RadioButton38.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_RadioButton38+19)
MOVT	R0, #hi_addr(_RadioButton38+19)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,2500 :: 		RadioButton38.Checked         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton38+20)
MOVT	R0, #hi_addr(_RadioButton38+20)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,2501 :: 		RadioButton38.Transparent     = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_RadioButton38+21)
MOVT	R0, #hi_addr(_RadioButton38+21)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,2502 :: 		RadioButton38.Caption         = RadioButton38_Caption;
MOVW	R1, #lo_addr(_RadioButton38_Caption+0)
MOVT	R1, #hi_addr(_RadioButton38_Caption+0)
MOVW	R0, #lo_addr(_RadioButton38+24)
MOVT	R0, #hi_addr(_RadioButton38+24)
STR	R1, [R0, #0]
;ECGsynthetic_driver.c,2503 :: 		RadioButton38.TextAlign       = _taLeft;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton38+28)
MOVT	R0, #hi_addr(_RadioButton38+28)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,2504 :: 		RadioButton38.FontName        = DejaVu_Serif16x19_Regular;
MOVW	R0, #lo_addr(_RadioButton38+32)
MOVT	R0, #hi_addr(_RadioButton38+32)
STR	R5, [R0, #0]
;ECGsynthetic_driver.c,2505 :: 		RadioButton38.PressColEnabled = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_RadioButton38+48)
MOVT	R0, #hi_addr(_RadioButton38+48)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,2506 :: 		RadioButton38.Font_Color      = 0x0000;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton38+36)
MOVT	R0, #hi_addr(_RadioButton38+36)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,2507 :: 		RadioButton38.Gradient        = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton38+38)
MOVT	R0, #hi_addr(_RadioButton38+38)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,2508 :: 		RadioButton38.Gradient_Orientation = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton38+39)
MOVT	R0, #hi_addr(_RadioButton38+39)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,2509 :: 		RadioButton38.Gradient_Start_Color = 0xFFFF;
MOVW	R1, #65535
MOVW	R0, #lo_addr(_RadioButton38+40)
MOVT	R0, #hi_addr(_RadioButton38+40)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,2510 :: 		RadioButton38.Gradient_End_Color = 0xC618;
MOVW	R1, #50712
MOVW	R0, #lo_addr(_RadioButton38+42)
MOVT	R0, #hi_addr(_RadioButton38+42)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,2511 :: 		RadioButton38.Color           = 0xFFFF;
MOVW	R1, #65535
MOVW	R0, #lo_addr(_RadioButton38+44)
MOVT	R0, #hi_addr(_RadioButton38+44)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,2512 :: 		RadioButton38.Press_Color     = 0xE71C;
MOVW	R1, #59164
MOVW	R0, #lo_addr(_RadioButton38+50)
MOVT	R0, #hi_addr(_RadioButton38+50)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,2513 :: 		RadioButton38.Background_Color = 0x0000;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton38+46)
MOVT	R0, #hi_addr(_RadioButton38+46)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,2514 :: 		RadioButton38.OnPressPtr      = RadioButton38OnPress;
MOVW	R1, #lo_addr(_RadioButton38OnPress+0)
MOVT	R1, #hi_addr(_RadioButton38OnPress+0)
MOVW	R0, #lo_addr(_RadioButton38+64)
MOVT	R0, #hi_addr(_RadioButton38+64)
STR	R1, [R0, #0]
;ECGsynthetic_driver.c,2516 :: 		RadioButton39.OwnerScreen     = &Screen5;
MOVW	R1, #lo_addr(_Screen5+0)
MOVT	R1, #hi_addr(_Screen5+0)
MOVW	R0, #lo_addr(_RadioButton39+0)
MOVT	R0, #hi_addr(_RadioButton39+0)
STR	R1, [R0, #0]
;ECGsynthetic_driver.c,2517 :: 		RadioButton39.Order           = 2;
MOVS	R1, #2
MOVW	R0, #lo_addr(_RadioButton39+4)
MOVT	R0, #hi_addr(_RadioButton39+4)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,2518 :: 		RadioButton39.Left            = 42;
MOVS	R1, #42
MOVW	R0, #lo_addr(_RadioButton39+6)
MOVT	R0, #hi_addr(_RadioButton39+6)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,2519 :: 		RadioButton39.Top             = 214;
MOVS	R1, #214
MOVW	R0, #lo_addr(_RadioButton39+8)
MOVT	R0, #hi_addr(_RadioButton39+8)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,2520 :: 		RadioButton39.Width           = 54;
MOVS	R1, #54
MOVW	R0, #lo_addr(_RadioButton39+10)
MOVT	R0, #hi_addr(_RadioButton39+10)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,2521 :: 		RadioButton39.Height          = 25;
MOVS	R1, #25
MOVW	R0, #lo_addr(_RadioButton39+12)
MOVT	R0, #hi_addr(_RadioButton39+12)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,2522 :: 		RadioButton39.Pen_Width       = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_RadioButton39+14)
MOVT	R0, #hi_addr(_RadioButton39+14)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,2523 :: 		RadioButton39.Pen_Color       = 0x0000;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton39+16)
MOVT	R0, #hi_addr(_RadioButton39+16)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,2524 :: 		RadioButton39.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_RadioButton39+18)
MOVT	R0, #hi_addr(_RadioButton39+18)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,2525 :: 		RadioButton39.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_RadioButton39+19)
MOVT	R0, #hi_addr(_RadioButton39+19)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,2526 :: 		RadioButton39.Checked         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton39+20)
MOVT	R0, #hi_addr(_RadioButton39+20)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,2527 :: 		RadioButton39.Transparent     = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_RadioButton39+21)
MOVT	R0, #hi_addr(_RadioButton39+21)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,2528 :: 		RadioButton39.Caption         = RadioButton39_Caption;
MOVW	R1, #lo_addr(_RadioButton39_Caption+0)
MOVT	R1, #hi_addr(_RadioButton39_Caption+0)
MOVW	R0, #lo_addr(_RadioButton39+24)
MOVT	R0, #hi_addr(_RadioButton39+24)
STR	R1, [R0, #0]
;ECGsynthetic_driver.c,2529 :: 		RadioButton39.TextAlign       = _taLeft;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton39+28)
MOVT	R0, #hi_addr(_RadioButton39+28)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,2530 :: 		RadioButton39.FontName        = DejaVu_Serif16x19_Regular;
MOVW	R0, #lo_addr(_RadioButton39+32)
MOVT	R0, #hi_addr(_RadioButton39+32)
STR	R5, [R0, #0]
;ECGsynthetic_driver.c,2531 :: 		RadioButton39.PressColEnabled = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_RadioButton39+48)
MOVT	R0, #hi_addr(_RadioButton39+48)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,2532 :: 		RadioButton39.Font_Color      = 0x0000;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton39+36)
MOVT	R0, #hi_addr(_RadioButton39+36)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,2533 :: 		RadioButton39.Gradient        = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton39+38)
MOVT	R0, #hi_addr(_RadioButton39+38)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,2534 :: 		RadioButton39.Gradient_Orientation = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton39+39)
MOVT	R0, #hi_addr(_RadioButton39+39)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,2535 :: 		RadioButton39.Gradient_Start_Color = 0xFFFF;
MOVW	R1, #65535
MOVW	R0, #lo_addr(_RadioButton39+40)
MOVT	R0, #hi_addr(_RadioButton39+40)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,2536 :: 		RadioButton39.Gradient_End_Color = 0xC618;
MOVW	R1, #50712
MOVW	R0, #lo_addr(_RadioButton39+42)
MOVT	R0, #hi_addr(_RadioButton39+42)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,2537 :: 		RadioButton39.Color           = 0xFFFF;
MOVW	R1, #65535
MOVW	R0, #lo_addr(_RadioButton39+44)
MOVT	R0, #hi_addr(_RadioButton39+44)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,2538 :: 		RadioButton39.Press_Color     = 0xE71C;
MOVW	R1, #59164
MOVW	R0, #lo_addr(_RadioButton39+50)
MOVT	R0, #hi_addr(_RadioButton39+50)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,2539 :: 		RadioButton39.Background_Color = 0x0000;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton39+46)
MOVT	R0, #hi_addr(_RadioButton39+46)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,2540 :: 		RadioButton39.OnPressPtr      = RadioButton39OnPress;
MOVW	R1, #lo_addr(_RadioButton39OnPress+0)
MOVT	R1, #hi_addr(_RadioButton39OnPress+0)
MOVW	R0, #lo_addr(_RadioButton39+64)
MOVT	R0, #hi_addr(_RadioButton39+64)
STR	R1, [R0, #0]
;ECGsynthetic_driver.c,2542 :: 		RadioButton40.OwnerScreen     = &Screen5;
MOVW	R1, #lo_addr(_Screen5+0)
MOVT	R1, #hi_addr(_Screen5+0)
MOVW	R0, #lo_addr(_RadioButton40+0)
MOVT	R0, #hi_addr(_RadioButton40+0)
STR	R1, [R0, #0]
;ECGsynthetic_driver.c,2543 :: 		RadioButton40.Order           = 3;
MOVS	R1, #3
MOVW	R0, #lo_addr(_RadioButton40+4)
MOVT	R0, #hi_addr(_RadioButton40+4)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,2544 :: 		RadioButton40.Left            = 42;
MOVS	R1, #42
MOVW	R0, #lo_addr(_RadioButton40+6)
MOVT	R0, #hi_addr(_RadioButton40+6)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,2545 :: 		RadioButton40.Top             = 254;
MOVS	R1, #254
MOVW	R0, #lo_addr(_RadioButton40+8)
MOVT	R0, #hi_addr(_RadioButton40+8)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,2546 :: 		RadioButton40.Width           = 68;
MOVS	R1, #68
MOVW	R0, #lo_addr(_RadioButton40+10)
MOVT	R0, #hi_addr(_RadioButton40+10)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,2547 :: 		RadioButton40.Height          = 25;
MOVS	R1, #25
MOVW	R0, #lo_addr(_RadioButton40+12)
MOVT	R0, #hi_addr(_RadioButton40+12)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,2548 :: 		RadioButton40.Pen_Width       = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_RadioButton40+14)
MOVT	R0, #hi_addr(_RadioButton40+14)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,2549 :: 		RadioButton40.Pen_Color       = 0x0000;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton40+16)
MOVT	R0, #hi_addr(_RadioButton40+16)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,2550 :: 		RadioButton40.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_RadioButton40+18)
MOVT	R0, #hi_addr(_RadioButton40+18)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,2551 :: 		RadioButton40.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_RadioButton40+19)
MOVT	R0, #hi_addr(_RadioButton40+19)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,2552 :: 		RadioButton40.Checked         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton40+20)
MOVT	R0, #hi_addr(_RadioButton40+20)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,2553 :: 		RadioButton40.Transparent     = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_RadioButton40+21)
MOVT	R0, #hi_addr(_RadioButton40+21)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,2554 :: 		RadioButton40.Caption         = RadioButton40_Caption;
MOVW	R1, #lo_addr(_RadioButton40_Caption+0)
MOVT	R1, #hi_addr(_RadioButton40_Caption+0)
MOVW	R0, #lo_addr(_RadioButton40+24)
MOVT	R0, #hi_addr(_RadioButton40+24)
STR	R1, [R0, #0]
;ECGsynthetic_driver.c,2555 :: 		RadioButton40.TextAlign       = _taLeft;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton40+28)
MOVT	R0, #hi_addr(_RadioButton40+28)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,2556 :: 		RadioButton40.FontName        = DejaVu_Serif16x19_Regular;
MOVW	R0, #lo_addr(_RadioButton40+32)
MOVT	R0, #hi_addr(_RadioButton40+32)
STR	R5, [R0, #0]
;ECGsynthetic_driver.c,2557 :: 		RadioButton40.PressColEnabled = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_RadioButton40+48)
MOVT	R0, #hi_addr(_RadioButton40+48)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,2558 :: 		RadioButton40.Font_Color      = 0x0000;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton40+36)
MOVT	R0, #hi_addr(_RadioButton40+36)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,2559 :: 		RadioButton40.Gradient        = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton40+38)
MOVT	R0, #hi_addr(_RadioButton40+38)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,2560 :: 		RadioButton40.Gradient_Orientation = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton40+39)
MOVT	R0, #hi_addr(_RadioButton40+39)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,2561 :: 		RadioButton40.Gradient_Start_Color = 0xFFFF;
MOVW	R1, #65535
MOVW	R0, #lo_addr(_RadioButton40+40)
MOVT	R0, #hi_addr(_RadioButton40+40)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,2562 :: 		RadioButton40.Gradient_End_Color = 0xC618;
MOVW	R1, #50712
MOVW	R0, #lo_addr(_RadioButton40+42)
MOVT	R0, #hi_addr(_RadioButton40+42)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,2563 :: 		RadioButton40.Color           = 0xFFFF;
MOVW	R1, #65535
MOVW	R0, #lo_addr(_RadioButton40+44)
MOVT	R0, #hi_addr(_RadioButton40+44)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,2564 :: 		RadioButton40.Press_Color     = 0xE71C;
MOVW	R1, #59164
MOVW	R0, #lo_addr(_RadioButton40+50)
MOVT	R0, #hi_addr(_RadioButton40+50)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,2565 :: 		RadioButton40.Background_Color = 0x0000;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton40+46)
MOVT	R0, #hi_addr(_RadioButton40+46)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,2566 :: 		RadioButton40.OnPressPtr      = RadioButton40OnPress;
MOVW	R1, #lo_addr(_RadioButton40OnPress+0)
MOVT	R1, #hi_addr(_RadioButton40OnPress+0)
MOVW	R0, #lo_addr(_RadioButton40+64)
MOVT	R0, #hi_addr(_RadioButton40+64)
STR	R1, [R0, #0]
;ECGsynthetic_driver.c,2568 :: 		RadioButton41.OwnerScreen     = &Screen5;
MOVW	R1, #lo_addr(_Screen5+0)
MOVT	R1, #hi_addr(_Screen5+0)
MOVW	R0, #lo_addr(_RadioButton41+0)
MOVT	R0, #hi_addr(_RadioButton41+0)
STR	R1, [R0, #0]
;ECGsynthetic_driver.c,2569 :: 		RadioButton41.Order           = 4;
MOVS	R1, #4
MOVW	R0, #lo_addr(_RadioButton41+4)
MOVT	R0, #hi_addr(_RadioButton41+4)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,2570 :: 		RadioButton41.Left            = 42;
MOVS	R1, #42
MOVW	R0, #lo_addr(_RadioButton41+6)
MOVT	R0, #hi_addr(_RadioButton41+6)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,2571 :: 		RadioButton41.Top             = 294;
MOVW	R1, #294
MOVW	R0, #lo_addr(_RadioButton41+8)
MOVT	R0, #hi_addr(_RadioButton41+8)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,2572 :: 		RadioButton41.Width           = 67;
MOVS	R1, #67
MOVW	R0, #lo_addr(_RadioButton41+10)
MOVT	R0, #hi_addr(_RadioButton41+10)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,2573 :: 		RadioButton41.Height          = 25;
MOVS	R1, #25
MOVW	R0, #lo_addr(_RadioButton41+12)
MOVT	R0, #hi_addr(_RadioButton41+12)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,2574 :: 		RadioButton41.Pen_Width       = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_RadioButton41+14)
MOVT	R0, #hi_addr(_RadioButton41+14)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,2575 :: 		RadioButton41.Pen_Color       = 0x0000;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton41+16)
MOVT	R0, #hi_addr(_RadioButton41+16)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,2576 :: 		RadioButton41.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_RadioButton41+18)
MOVT	R0, #hi_addr(_RadioButton41+18)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,2577 :: 		RadioButton41.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_RadioButton41+19)
MOVT	R0, #hi_addr(_RadioButton41+19)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,2578 :: 		RadioButton41.Checked         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton41+20)
MOVT	R0, #hi_addr(_RadioButton41+20)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,2579 :: 		RadioButton41.Transparent     = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_RadioButton41+21)
MOVT	R0, #hi_addr(_RadioButton41+21)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,2580 :: 		RadioButton41.Caption         = RadioButton41_Caption;
MOVW	R1, #lo_addr(_RadioButton41_Caption+0)
MOVT	R1, #hi_addr(_RadioButton41_Caption+0)
MOVW	R0, #lo_addr(_RadioButton41+24)
MOVT	R0, #hi_addr(_RadioButton41+24)
STR	R1, [R0, #0]
;ECGsynthetic_driver.c,2581 :: 		RadioButton41.TextAlign       = _taLeft;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton41+28)
MOVT	R0, #hi_addr(_RadioButton41+28)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,2582 :: 		RadioButton41.FontName        = DejaVu_Serif16x19_Regular;
MOVW	R0, #lo_addr(_RadioButton41+32)
MOVT	R0, #hi_addr(_RadioButton41+32)
STR	R5, [R0, #0]
;ECGsynthetic_driver.c,2583 :: 		RadioButton41.PressColEnabled = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_RadioButton41+48)
MOVT	R0, #hi_addr(_RadioButton41+48)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,2584 :: 		RadioButton41.Font_Color      = 0x0000;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton41+36)
MOVT	R0, #hi_addr(_RadioButton41+36)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,2585 :: 		RadioButton41.Gradient        = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton41+38)
MOVT	R0, #hi_addr(_RadioButton41+38)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,2586 :: 		RadioButton41.Gradient_Orientation = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton41+39)
MOVT	R0, #hi_addr(_RadioButton41+39)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,2587 :: 		RadioButton41.Gradient_Start_Color = 0xFFFF;
MOVW	R1, #65535
MOVW	R0, #lo_addr(_RadioButton41+40)
MOVT	R0, #hi_addr(_RadioButton41+40)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,2588 :: 		RadioButton41.Gradient_End_Color = 0xC618;
MOVW	R1, #50712
MOVW	R0, #lo_addr(_RadioButton41+42)
MOVT	R0, #hi_addr(_RadioButton41+42)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,2589 :: 		RadioButton41.Color           = 0xFFFF;
MOVW	R1, #65535
MOVW	R0, #lo_addr(_RadioButton41+44)
MOVT	R0, #hi_addr(_RadioButton41+44)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,2590 :: 		RadioButton41.Press_Color     = 0xE71C;
MOVW	R1, #59164
MOVW	R0, #lo_addr(_RadioButton41+50)
MOVT	R0, #hi_addr(_RadioButton41+50)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,2591 :: 		RadioButton41.Background_Color = 0x0000;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton41+46)
MOVT	R0, #hi_addr(_RadioButton41+46)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,2592 :: 		RadioButton41.OnPressPtr      = RadioButton41OnPress;
MOVW	R1, #lo_addr(_RadioButton41OnPress+0)
MOVT	R1, #hi_addr(_RadioButton41OnPress+0)
MOVW	R0, #lo_addr(_RadioButton41+64)
MOVT	R0, #hi_addr(_RadioButton41+64)
STR	R1, [R0, #0]
;ECGsynthetic_driver.c,2594 :: 		RadioButton42.OwnerScreen     = &Screen5;
MOVW	R1, #lo_addr(_Screen5+0)
MOVT	R1, #hi_addr(_Screen5+0)
MOVW	R0, #lo_addr(_RadioButton42+0)
MOVT	R0, #hi_addr(_RadioButton42+0)
STR	R1, [R0, #0]
;ECGsynthetic_driver.c,2595 :: 		RadioButton42.Order           = 5;
MOVS	R1, #5
MOVW	R0, #lo_addr(_RadioButton42+4)
MOVT	R0, #hi_addr(_RadioButton42+4)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,2596 :: 		RadioButton42.Left            = 42;
MOVS	R1, #42
MOVW	R0, #lo_addr(_RadioButton42+6)
MOVT	R0, #hi_addr(_RadioButton42+6)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,2597 :: 		RadioButton42.Top             = 335;
MOVW	R1, #335
MOVW	R0, #lo_addr(_RadioButton42+8)
MOVT	R0, #hi_addr(_RadioButton42+8)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,2598 :: 		RadioButton42.Width           = 67;
MOVS	R1, #67
MOVW	R0, #lo_addr(_RadioButton42+10)
MOVT	R0, #hi_addr(_RadioButton42+10)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,2599 :: 		RadioButton42.Height          = 25;
MOVS	R1, #25
MOVW	R0, #lo_addr(_RadioButton42+12)
MOVT	R0, #hi_addr(_RadioButton42+12)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,2600 :: 		RadioButton42.Pen_Width       = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_RadioButton42+14)
MOVT	R0, #hi_addr(_RadioButton42+14)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,2601 :: 		RadioButton42.Pen_Color       = 0x0000;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton42+16)
MOVT	R0, #hi_addr(_RadioButton42+16)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,2602 :: 		RadioButton42.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_RadioButton42+18)
MOVT	R0, #hi_addr(_RadioButton42+18)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,2603 :: 		RadioButton42.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_RadioButton42+19)
MOVT	R0, #hi_addr(_RadioButton42+19)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,2604 :: 		RadioButton42.Checked         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton42+20)
MOVT	R0, #hi_addr(_RadioButton42+20)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,2605 :: 		RadioButton42.Transparent     = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_RadioButton42+21)
MOVT	R0, #hi_addr(_RadioButton42+21)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,2606 :: 		RadioButton42.Caption         = RadioButton42_Caption;
MOVW	R1, #lo_addr(_RadioButton42_Caption+0)
MOVT	R1, #hi_addr(_RadioButton42_Caption+0)
MOVW	R0, #lo_addr(_RadioButton42+24)
MOVT	R0, #hi_addr(_RadioButton42+24)
STR	R1, [R0, #0]
;ECGsynthetic_driver.c,2607 :: 		RadioButton42.TextAlign       = _taLeft;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton42+28)
MOVT	R0, #hi_addr(_RadioButton42+28)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,2608 :: 		RadioButton42.FontName        = DejaVu_Serif16x19_Regular;
MOVW	R0, #lo_addr(_RadioButton42+32)
MOVT	R0, #hi_addr(_RadioButton42+32)
STR	R5, [R0, #0]
;ECGsynthetic_driver.c,2609 :: 		RadioButton42.PressColEnabled = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_RadioButton42+48)
MOVT	R0, #hi_addr(_RadioButton42+48)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,2610 :: 		RadioButton42.Font_Color      = 0x0000;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton42+36)
MOVT	R0, #hi_addr(_RadioButton42+36)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,2611 :: 		RadioButton42.Gradient        = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton42+38)
MOVT	R0, #hi_addr(_RadioButton42+38)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,2612 :: 		RadioButton42.Gradient_Orientation = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton42+39)
MOVT	R0, #hi_addr(_RadioButton42+39)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,2613 :: 		RadioButton42.Gradient_Start_Color = 0xFFFF;
MOVW	R1, #65535
MOVW	R0, #lo_addr(_RadioButton42+40)
MOVT	R0, #hi_addr(_RadioButton42+40)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,2614 :: 		RadioButton42.Gradient_End_Color = 0xC618;
MOVW	R1, #50712
MOVW	R0, #lo_addr(_RadioButton42+42)
MOVT	R0, #hi_addr(_RadioButton42+42)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,2615 :: 		RadioButton42.Color           = 0xFFFF;
MOVW	R1, #65535
MOVW	R0, #lo_addr(_RadioButton42+44)
MOVT	R0, #hi_addr(_RadioButton42+44)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,2616 :: 		RadioButton42.Press_Color     = 0xE71C;
MOVW	R1, #59164
MOVW	R0, #lo_addr(_RadioButton42+50)
MOVT	R0, #hi_addr(_RadioButton42+50)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,2617 :: 		RadioButton42.Background_Color = 0x0000;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton42+46)
MOVT	R0, #hi_addr(_RadioButton42+46)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,2618 :: 		RadioButton42.OnPressPtr      = RadioButton42OnPress;
MOVW	R1, #lo_addr(_RadioButton42OnPress+0)
MOVT	R1, #hi_addr(_RadioButton42OnPress+0)
MOVW	R0, #lo_addr(_RadioButton42+64)
MOVT	R0, #hi_addr(_RadioButton42+64)
STR	R1, [R0, #0]
;ECGsynthetic_driver.c,2620 :: 		RadioButton43.OwnerScreen     = &Screen5;
MOVW	R1, #lo_addr(_Screen5+0)
MOVT	R1, #hi_addr(_Screen5+0)
MOVW	R0, #lo_addr(_RadioButton43+0)
MOVT	R0, #hi_addr(_RadioButton43+0)
STR	R1, [R0, #0]
;ECGsynthetic_driver.c,2621 :: 		RadioButton43.Order           = 6;
MOVS	R1, #6
MOVW	R0, #lo_addr(_RadioButton43+4)
MOVT	R0, #hi_addr(_RadioButton43+4)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,2622 :: 		RadioButton43.Left            = 139;
MOVS	R1, #139
MOVW	R0, #lo_addr(_RadioButton43+6)
MOVT	R0, #hi_addr(_RadioButton43+6)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,2623 :: 		RadioButton43.Top             = 134;
MOVS	R1, #134
MOVW	R0, #lo_addr(_RadioButton43+8)
MOVT	R0, #hi_addr(_RadioButton43+8)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,2624 :: 		RadioButton43.Width           = 57;
MOVS	R1, #57
MOVW	R0, #lo_addr(_RadioButton43+10)
MOVT	R0, #hi_addr(_RadioButton43+10)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,2625 :: 		RadioButton43.Height          = 25;
MOVS	R1, #25
MOVW	R0, #lo_addr(_RadioButton43+12)
MOVT	R0, #hi_addr(_RadioButton43+12)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,2626 :: 		RadioButton43.Pen_Width       = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_RadioButton43+14)
MOVT	R0, #hi_addr(_RadioButton43+14)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,2627 :: 		RadioButton43.Pen_Color       = 0x0000;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton43+16)
MOVT	R0, #hi_addr(_RadioButton43+16)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,2628 :: 		RadioButton43.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_RadioButton43+18)
MOVT	R0, #hi_addr(_RadioButton43+18)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,2629 :: 		RadioButton43.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_RadioButton43+19)
MOVT	R0, #hi_addr(_RadioButton43+19)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,2630 :: 		RadioButton43.Checked         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton43+20)
MOVT	R0, #hi_addr(_RadioButton43+20)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,2631 :: 		RadioButton43.Transparent     = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_RadioButton43+21)
MOVT	R0, #hi_addr(_RadioButton43+21)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,2632 :: 		RadioButton43.Caption         = RadioButton43_Caption;
MOVW	R1, #lo_addr(_RadioButton43_Caption+0)
MOVT	R1, #hi_addr(_RadioButton43_Caption+0)
MOVW	R0, #lo_addr(_RadioButton43+24)
MOVT	R0, #hi_addr(_RadioButton43+24)
STR	R1, [R0, #0]
;ECGsynthetic_driver.c,2633 :: 		RadioButton43.TextAlign       = _taLeft;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton43+28)
MOVT	R0, #hi_addr(_RadioButton43+28)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,2634 :: 		RadioButton43.FontName        = DejaVu_Serif16x19_Regular;
MOVW	R0, #lo_addr(_RadioButton43+32)
MOVT	R0, #hi_addr(_RadioButton43+32)
STR	R5, [R0, #0]
;ECGsynthetic_driver.c,2635 :: 		RadioButton43.PressColEnabled = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_RadioButton43+48)
MOVT	R0, #hi_addr(_RadioButton43+48)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,2636 :: 		RadioButton43.Font_Color      = 0x0000;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton43+36)
MOVT	R0, #hi_addr(_RadioButton43+36)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,2637 :: 		RadioButton43.Gradient        = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton43+38)
MOVT	R0, #hi_addr(_RadioButton43+38)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,2638 :: 		RadioButton43.Gradient_Orientation = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton43+39)
MOVT	R0, #hi_addr(_RadioButton43+39)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,2639 :: 		RadioButton43.Gradient_Start_Color = 0xFFFF;
MOVW	R1, #65535
MOVW	R0, #lo_addr(_RadioButton43+40)
MOVT	R0, #hi_addr(_RadioButton43+40)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,2640 :: 		RadioButton43.Gradient_End_Color = 0xC618;
MOVW	R1, #50712
MOVW	R0, #lo_addr(_RadioButton43+42)
MOVT	R0, #hi_addr(_RadioButton43+42)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,2641 :: 		RadioButton43.Color           = 0xFFFF;
MOVW	R1, #65535
MOVW	R0, #lo_addr(_RadioButton43+44)
MOVT	R0, #hi_addr(_RadioButton43+44)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,2642 :: 		RadioButton43.Press_Color     = 0xE71C;
MOVW	R1, #59164
MOVW	R0, #lo_addr(_RadioButton43+50)
MOVT	R0, #hi_addr(_RadioButton43+50)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,2643 :: 		RadioButton43.Background_Color = 0x0000;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton43+46)
MOVT	R0, #hi_addr(_RadioButton43+46)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,2644 :: 		RadioButton43.OnPressPtr      = RadioButton43OnPress;
MOVW	R1, #lo_addr(_RadioButton43OnPress+0)
MOVT	R1, #hi_addr(_RadioButton43OnPress+0)
MOVW	R0, #lo_addr(_RadioButton43+64)
MOVT	R0, #hi_addr(_RadioButton43+64)
STR	R1, [R0, #0]
;ECGsynthetic_driver.c,2646 :: 		RadioButton44.OwnerScreen     = &Screen5;
MOVW	R1, #lo_addr(_Screen5+0)
MOVT	R1, #hi_addr(_Screen5+0)
MOVW	R0, #lo_addr(_RadioButton44+0)
MOVT	R0, #hi_addr(_RadioButton44+0)
STR	R1, [R0, #0]
;ECGsynthetic_driver.c,2647 :: 		RadioButton44.Order           = 7;
MOVS	R1, #7
MOVW	R0, #lo_addr(_RadioButton44+4)
MOVT	R0, #hi_addr(_RadioButton44+4)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,2648 :: 		RadioButton44.Left            = 139;
MOVS	R1, #139
MOVW	R0, #lo_addr(_RadioButton44+6)
MOVT	R0, #hi_addr(_RadioButton44+6)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,2649 :: 		RadioButton44.Top             = 174;
MOVS	R1, #174
MOVW	R0, #lo_addr(_RadioButton44+8)
MOVT	R0, #hi_addr(_RadioButton44+8)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,2650 :: 		RadioButton44.Width           = 57;
MOVS	R1, #57
MOVW	R0, #lo_addr(_RadioButton44+10)
MOVT	R0, #hi_addr(_RadioButton44+10)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,2651 :: 		RadioButton44.Height          = 25;
MOVS	R1, #25
MOVW	R0, #lo_addr(_RadioButton44+12)
MOVT	R0, #hi_addr(_RadioButton44+12)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,2652 :: 		RadioButton44.Pen_Width       = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_RadioButton44+14)
MOVT	R0, #hi_addr(_RadioButton44+14)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,2653 :: 		RadioButton44.Pen_Color       = 0x0000;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton44+16)
MOVT	R0, #hi_addr(_RadioButton44+16)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,2654 :: 		RadioButton44.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_RadioButton44+18)
MOVT	R0, #hi_addr(_RadioButton44+18)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,2655 :: 		RadioButton44.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_RadioButton44+19)
MOVT	R0, #hi_addr(_RadioButton44+19)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,2656 :: 		RadioButton44.Checked         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton44+20)
MOVT	R0, #hi_addr(_RadioButton44+20)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,2657 :: 		RadioButton44.Transparent     = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_RadioButton44+21)
MOVT	R0, #hi_addr(_RadioButton44+21)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,2658 :: 		RadioButton44.Caption         = RadioButton44_Caption;
MOVW	R1, #lo_addr(_RadioButton44_Caption+0)
MOVT	R1, #hi_addr(_RadioButton44_Caption+0)
MOVW	R0, #lo_addr(_RadioButton44+24)
MOVT	R0, #hi_addr(_RadioButton44+24)
STR	R1, [R0, #0]
;ECGsynthetic_driver.c,2659 :: 		RadioButton44.TextAlign       = _taLeft;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton44+28)
MOVT	R0, #hi_addr(_RadioButton44+28)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,2660 :: 		RadioButton44.FontName        = DejaVu_Serif16x19_Regular;
MOVW	R0, #lo_addr(_RadioButton44+32)
MOVT	R0, #hi_addr(_RadioButton44+32)
STR	R5, [R0, #0]
;ECGsynthetic_driver.c,2661 :: 		RadioButton44.PressColEnabled = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_RadioButton44+48)
MOVT	R0, #hi_addr(_RadioButton44+48)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,2662 :: 		RadioButton44.Font_Color      = 0x0000;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton44+36)
MOVT	R0, #hi_addr(_RadioButton44+36)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,2663 :: 		RadioButton44.Gradient        = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton44+38)
MOVT	R0, #hi_addr(_RadioButton44+38)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,2664 :: 		RadioButton44.Gradient_Orientation = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton44+39)
MOVT	R0, #hi_addr(_RadioButton44+39)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,2665 :: 		RadioButton44.Gradient_Start_Color = 0xFFFF;
MOVW	R1, #65535
MOVW	R0, #lo_addr(_RadioButton44+40)
MOVT	R0, #hi_addr(_RadioButton44+40)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,2666 :: 		RadioButton44.Gradient_End_Color = 0xC618;
MOVW	R1, #50712
MOVW	R0, #lo_addr(_RadioButton44+42)
MOVT	R0, #hi_addr(_RadioButton44+42)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,2667 :: 		RadioButton44.Color           = 0xFFFF;
MOVW	R1, #65535
MOVW	R0, #lo_addr(_RadioButton44+44)
MOVT	R0, #hi_addr(_RadioButton44+44)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,2668 :: 		RadioButton44.Press_Color     = 0xE71C;
MOVW	R1, #59164
MOVW	R0, #lo_addr(_RadioButton44+50)
MOVT	R0, #hi_addr(_RadioButton44+50)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,2669 :: 		RadioButton44.Background_Color = 0x0000;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton44+46)
MOVT	R0, #hi_addr(_RadioButton44+46)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,2670 :: 		RadioButton44.OnPressPtr      = RadioButton44OnPress;
MOVW	R1, #lo_addr(_RadioButton44OnPress+0)
MOVT	R1, #hi_addr(_RadioButton44OnPress+0)
MOVW	R0, #lo_addr(_RadioButton44+64)
MOVT	R0, #hi_addr(_RadioButton44+64)
STR	R1, [R0, #0]
;ECGsynthetic_driver.c,2672 :: 		RadioButton45.OwnerScreen     = &Screen5;
MOVW	R1, #lo_addr(_Screen5+0)
MOVT	R1, #hi_addr(_Screen5+0)
MOVW	R0, #lo_addr(_RadioButton45+0)
MOVT	R0, #hi_addr(_RadioButton45+0)
STR	R1, [R0, #0]
;ECGsynthetic_driver.c,2673 :: 		RadioButton45.Order           = 8;
MOVS	R1, #8
MOVW	R0, #lo_addr(_RadioButton45+4)
MOVT	R0, #hi_addr(_RadioButton45+4)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,2674 :: 		RadioButton45.Left            = 139;
MOVS	R1, #139
MOVW	R0, #lo_addr(_RadioButton45+6)
MOVT	R0, #hi_addr(_RadioButton45+6)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,2675 :: 		RadioButton45.Top             = 214;
MOVS	R1, #214
MOVW	R0, #lo_addr(_RadioButton45+8)
MOVT	R0, #hi_addr(_RadioButton45+8)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,2676 :: 		RadioButton45.Width           = 57;
MOVS	R1, #57
MOVW	R0, #lo_addr(_RadioButton45+10)
MOVT	R0, #hi_addr(_RadioButton45+10)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,2677 :: 		RadioButton45.Height          = 25;
MOVS	R1, #25
MOVW	R0, #lo_addr(_RadioButton45+12)
MOVT	R0, #hi_addr(_RadioButton45+12)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,2678 :: 		RadioButton45.Pen_Width       = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_RadioButton45+14)
MOVT	R0, #hi_addr(_RadioButton45+14)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,2679 :: 		RadioButton45.Pen_Color       = 0x0000;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton45+16)
MOVT	R0, #hi_addr(_RadioButton45+16)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,2680 :: 		RadioButton45.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_RadioButton45+18)
MOVT	R0, #hi_addr(_RadioButton45+18)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,2681 :: 		RadioButton45.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_RadioButton45+19)
MOVT	R0, #hi_addr(_RadioButton45+19)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,2682 :: 		RadioButton45.Checked         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton45+20)
MOVT	R0, #hi_addr(_RadioButton45+20)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,2683 :: 		RadioButton45.Transparent     = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_RadioButton45+21)
MOVT	R0, #hi_addr(_RadioButton45+21)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,2684 :: 		RadioButton45.Caption         = RadioButton45_Caption;
MOVW	R1, #lo_addr(_RadioButton45_Caption+0)
MOVT	R1, #hi_addr(_RadioButton45_Caption+0)
MOVW	R0, #lo_addr(_RadioButton45+24)
MOVT	R0, #hi_addr(_RadioButton45+24)
STR	R1, [R0, #0]
;ECGsynthetic_driver.c,2685 :: 		RadioButton45.TextAlign       = _taLeft;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton45+28)
MOVT	R0, #hi_addr(_RadioButton45+28)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,2686 :: 		RadioButton45.FontName        = DejaVu_Serif16x19_Regular;
MOVW	R0, #lo_addr(_RadioButton45+32)
MOVT	R0, #hi_addr(_RadioButton45+32)
STR	R5, [R0, #0]
;ECGsynthetic_driver.c,2687 :: 		RadioButton45.PressColEnabled = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_RadioButton45+48)
MOVT	R0, #hi_addr(_RadioButton45+48)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,2688 :: 		RadioButton45.Font_Color      = 0x0000;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton45+36)
MOVT	R0, #hi_addr(_RadioButton45+36)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,2689 :: 		RadioButton45.Gradient        = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton45+38)
MOVT	R0, #hi_addr(_RadioButton45+38)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,2690 :: 		RadioButton45.Gradient_Orientation = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton45+39)
MOVT	R0, #hi_addr(_RadioButton45+39)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,2691 :: 		RadioButton45.Gradient_Start_Color = 0xFFFF;
MOVW	R1, #65535
MOVW	R0, #lo_addr(_RadioButton45+40)
MOVT	R0, #hi_addr(_RadioButton45+40)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,2692 :: 		RadioButton45.Gradient_End_Color = 0xC618;
MOVW	R1, #50712
MOVW	R0, #lo_addr(_RadioButton45+42)
MOVT	R0, #hi_addr(_RadioButton45+42)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,2693 :: 		RadioButton45.Color           = 0xFFFF;
MOVW	R1, #65535
MOVW	R0, #lo_addr(_RadioButton45+44)
MOVT	R0, #hi_addr(_RadioButton45+44)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,2694 :: 		RadioButton45.Press_Color     = 0xE71C;
MOVW	R1, #59164
MOVW	R0, #lo_addr(_RadioButton45+50)
MOVT	R0, #hi_addr(_RadioButton45+50)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,2695 :: 		RadioButton45.Background_Color = 0x0000;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton45+46)
MOVT	R0, #hi_addr(_RadioButton45+46)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,2696 :: 		RadioButton45.OnPressPtr      = RadioButton45OnPress;
MOVW	R1, #lo_addr(_RadioButton45OnPress+0)
MOVT	R1, #hi_addr(_RadioButton45OnPress+0)
MOVW	R0, #lo_addr(_RadioButton45+64)
MOVT	R0, #hi_addr(_RadioButton45+64)
STR	R1, [R0, #0]
;ECGsynthetic_driver.c,2698 :: 		RadioButton46.OwnerScreen     = &Screen5;
MOVW	R1, #lo_addr(_Screen5+0)
MOVT	R1, #hi_addr(_Screen5+0)
MOVW	R0, #lo_addr(_RadioButton46+0)
MOVT	R0, #hi_addr(_RadioButton46+0)
STR	R1, [R0, #0]
;ECGsynthetic_driver.c,2699 :: 		RadioButton46.Order           = 9;
MOVS	R1, #9
MOVW	R0, #lo_addr(_RadioButton46+4)
MOVT	R0, #hi_addr(_RadioButton46+4)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,2700 :: 		RadioButton46.Left            = 139;
MOVS	R1, #139
MOVW	R0, #lo_addr(_RadioButton46+6)
MOVT	R0, #hi_addr(_RadioButton46+6)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,2701 :: 		RadioButton46.Top             = 254;
MOVS	R1, #254
MOVW	R0, #lo_addr(_RadioButton46+8)
MOVT	R0, #hi_addr(_RadioButton46+8)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,2702 :: 		RadioButton46.Width           = 57;
MOVS	R1, #57
MOVW	R0, #lo_addr(_RadioButton46+10)
MOVT	R0, #hi_addr(_RadioButton46+10)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,2703 :: 		RadioButton46.Height          = 25;
MOVS	R1, #25
MOVW	R0, #lo_addr(_RadioButton46+12)
MOVT	R0, #hi_addr(_RadioButton46+12)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,2704 :: 		RadioButton46.Pen_Width       = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_RadioButton46+14)
MOVT	R0, #hi_addr(_RadioButton46+14)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,2705 :: 		RadioButton46.Pen_Color       = 0x0000;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton46+16)
MOVT	R0, #hi_addr(_RadioButton46+16)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,2706 :: 		RadioButton46.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_RadioButton46+18)
MOVT	R0, #hi_addr(_RadioButton46+18)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,2707 :: 		RadioButton46.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_RadioButton46+19)
MOVT	R0, #hi_addr(_RadioButton46+19)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,2708 :: 		RadioButton46.Checked         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton46+20)
MOVT	R0, #hi_addr(_RadioButton46+20)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,2709 :: 		RadioButton46.Transparent     = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_RadioButton46+21)
MOVT	R0, #hi_addr(_RadioButton46+21)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,2710 :: 		RadioButton46.Caption         = RadioButton46_Caption;
MOVW	R1, #lo_addr(_RadioButton46_Caption+0)
MOVT	R1, #hi_addr(_RadioButton46_Caption+0)
MOVW	R0, #lo_addr(_RadioButton46+24)
MOVT	R0, #hi_addr(_RadioButton46+24)
STR	R1, [R0, #0]
;ECGsynthetic_driver.c,2711 :: 		RadioButton46.TextAlign       = _taLeft;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton46+28)
MOVT	R0, #hi_addr(_RadioButton46+28)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,2712 :: 		RadioButton46.FontName        = DejaVu_Serif16x19_Regular;
MOVW	R0, #lo_addr(_RadioButton46+32)
MOVT	R0, #hi_addr(_RadioButton46+32)
STR	R5, [R0, #0]
;ECGsynthetic_driver.c,2713 :: 		RadioButton46.PressColEnabled = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_RadioButton46+48)
MOVT	R0, #hi_addr(_RadioButton46+48)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,2714 :: 		RadioButton46.Font_Color      = 0x0000;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton46+36)
MOVT	R0, #hi_addr(_RadioButton46+36)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,2715 :: 		RadioButton46.Gradient        = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton46+38)
MOVT	R0, #hi_addr(_RadioButton46+38)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,2716 :: 		RadioButton46.Gradient_Orientation = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton46+39)
MOVT	R0, #hi_addr(_RadioButton46+39)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,2717 :: 		RadioButton46.Gradient_Start_Color = 0xFFFF;
MOVW	R1, #65535
MOVW	R0, #lo_addr(_RadioButton46+40)
MOVT	R0, #hi_addr(_RadioButton46+40)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,2718 :: 		RadioButton46.Gradient_End_Color = 0xC618;
MOVW	R1, #50712
MOVW	R0, #lo_addr(_RadioButton46+42)
MOVT	R0, #hi_addr(_RadioButton46+42)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,2719 :: 		RadioButton46.Color           = 0xFFFF;
MOVW	R1, #65535
MOVW	R0, #lo_addr(_RadioButton46+44)
MOVT	R0, #hi_addr(_RadioButton46+44)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,2720 :: 		RadioButton46.Press_Color     = 0xE71C;
MOVW	R1, #59164
MOVW	R0, #lo_addr(_RadioButton46+50)
MOVT	R0, #hi_addr(_RadioButton46+50)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,2721 :: 		RadioButton46.Background_Color = 0x0000;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton46+46)
MOVT	R0, #hi_addr(_RadioButton46+46)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,2722 :: 		RadioButton46.OnPressPtr      = RadioButton46OnPress;
MOVW	R1, #lo_addr(_RadioButton46OnPress+0)
MOVT	R1, #hi_addr(_RadioButton46OnPress+0)
MOVW	R0, #lo_addr(_RadioButton46+64)
MOVT	R0, #hi_addr(_RadioButton46+64)
STR	R1, [R0, #0]
;ECGsynthetic_driver.c,2724 :: 		RadioButton47.OwnerScreen     = &Screen5;
MOVW	R1, #lo_addr(_Screen5+0)
MOVT	R1, #hi_addr(_Screen5+0)
MOVW	R0, #lo_addr(_RadioButton47+0)
MOVT	R0, #hi_addr(_RadioButton47+0)
STR	R1, [R0, #0]
;ECGsynthetic_driver.c,2725 :: 		RadioButton47.Order           = 10;
MOVS	R1, #10
MOVW	R0, #lo_addr(_RadioButton47+4)
MOVT	R0, #hi_addr(_RadioButton47+4)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,2726 :: 		RadioButton47.Left            = 140;
MOVS	R1, #140
MOVW	R0, #lo_addr(_RadioButton47+6)
MOVT	R0, #hi_addr(_RadioButton47+6)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,2727 :: 		RadioButton47.Top             = 294;
MOVW	R1, #294
MOVW	R0, #lo_addr(_RadioButton47+8)
MOVT	R0, #hi_addr(_RadioButton47+8)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,2728 :: 		RadioButton47.Width           = 57;
MOVS	R1, #57
MOVW	R0, #lo_addr(_RadioButton47+10)
MOVT	R0, #hi_addr(_RadioButton47+10)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,2729 :: 		RadioButton47.Height          = 25;
MOVS	R1, #25
MOVW	R0, #lo_addr(_RadioButton47+12)
MOVT	R0, #hi_addr(_RadioButton47+12)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,2730 :: 		RadioButton47.Pen_Width       = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_RadioButton47+14)
MOVT	R0, #hi_addr(_RadioButton47+14)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,2731 :: 		RadioButton47.Pen_Color       = 0x0000;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton47+16)
MOVT	R0, #hi_addr(_RadioButton47+16)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,2732 :: 		RadioButton47.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_RadioButton47+18)
MOVT	R0, #hi_addr(_RadioButton47+18)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,2733 :: 		RadioButton47.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_RadioButton47+19)
MOVT	R0, #hi_addr(_RadioButton47+19)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,2734 :: 		RadioButton47.Checked         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton47+20)
MOVT	R0, #hi_addr(_RadioButton47+20)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,2735 :: 		RadioButton47.Transparent     = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_RadioButton47+21)
MOVT	R0, #hi_addr(_RadioButton47+21)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,2736 :: 		RadioButton47.Caption         = RadioButton47_Caption;
MOVW	R1, #lo_addr(_RadioButton47_Caption+0)
MOVT	R1, #hi_addr(_RadioButton47_Caption+0)
MOVW	R0, #lo_addr(_RadioButton47+24)
MOVT	R0, #hi_addr(_RadioButton47+24)
STR	R1, [R0, #0]
;ECGsynthetic_driver.c,2737 :: 		RadioButton47.TextAlign       = _taLeft;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton47+28)
MOVT	R0, #hi_addr(_RadioButton47+28)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,2738 :: 		RadioButton47.FontName        = DejaVu_Serif16x19_Regular;
MOVW	R0, #lo_addr(_RadioButton47+32)
MOVT	R0, #hi_addr(_RadioButton47+32)
STR	R5, [R0, #0]
;ECGsynthetic_driver.c,2739 :: 		RadioButton47.PressColEnabled = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_RadioButton47+48)
MOVT	R0, #hi_addr(_RadioButton47+48)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,2740 :: 		RadioButton47.Font_Color      = 0x0000;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton47+36)
MOVT	R0, #hi_addr(_RadioButton47+36)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,2741 :: 		RadioButton47.Gradient        = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton47+38)
MOVT	R0, #hi_addr(_RadioButton47+38)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,2742 :: 		RadioButton47.Gradient_Orientation = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton47+39)
MOVT	R0, #hi_addr(_RadioButton47+39)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,2743 :: 		RadioButton47.Gradient_Start_Color = 0xFFFF;
MOVW	R1, #65535
MOVW	R0, #lo_addr(_RadioButton47+40)
MOVT	R0, #hi_addr(_RadioButton47+40)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,2744 :: 		RadioButton47.Gradient_End_Color = 0xC618;
MOVW	R1, #50712
MOVW	R0, #lo_addr(_RadioButton47+42)
MOVT	R0, #hi_addr(_RadioButton47+42)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,2745 :: 		RadioButton47.Color           = 0xFFFF;
MOVW	R1, #65535
MOVW	R0, #lo_addr(_RadioButton47+44)
MOVT	R0, #hi_addr(_RadioButton47+44)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,2746 :: 		RadioButton47.Press_Color     = 0xE71C;
MOVW	R1, #59164
MOVW	R0, #lo_addr(_RadioButton47+50)
MOVT	R0, #hi_addr(_RadioButton47+50)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,2747 :: 		RadioButton47.Background_Color = 0x0000;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton47+46)
MOVT	R0, #hi_addr(_RadioButton47+46)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,2748 :: 		RadioButton47.OnPressPtr      = RadioButton47OnPress;
MOVW	R1, #lo_addr(_RadioButton47OnPress+0)
MOVT	R1, #hi_addr(_RadioButton47OnPress+0)
MOVW	R0, #lo_addr(_RadioButton47+64)
MOVT	R0, #hi_addr(_RadioButton47+64)
STR	R1, [R0, #0]
;ECGsynthetic_driver.c,2750 :: 		RadioButton48.OwnerScreen     = &Screen5;
MOVW	R1, #lo_addr(_Screen5+0)
MOVT	R1, #hi_addr(_Screen5+0)
MOVW	R0, #lo_addr(_RadioButton48+0)
MOVT	R0, #hi_addr(_RadioButton48+0)
STR	R1, [R0, #0]
;ECGsynthetic_driver.c,2751 :: 		RadioButton48.Order           = 11;
MOVS	R1, #11
MOVW	R0, #lo_addr(_RadioButton48+4)
MOVT	R0, #hi_addr(_RadioButton48+4)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,2752 :: 		RadioButton48.Left            = 140;
MOVS	R1, #140
MOVW	R0, #lo_addr(_RadioButton48+6)
MOVT	R0, #hi_addr(_RadioButton48+6)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,2753 :: 		RadioButton48.Top             = 335;
MOVW	R1, #335
MOVW	R0, #lo_addr(_RadioButton48+8)
MOVT	R0, #hi_addr(_RadioButton48+8)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,2754 :: 		RadioButton48.Width           = 57;
MOVS	R1, #57
MOVW	R0, #lo_addr(_RadioButton48+10)
MOVT	R0, #hi_addr(_RadioButton48+10)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,2755 :: 		RadioButton48.Height          = 25;
MOVS	R1, #25
MOVW	R0, #lo_addr(_RadioButton48+12)
MOVT	R0, #hi_addr(_RadioButton48+12)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,2756 :: 		RadioButton48.Pen_Width       = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_RadioButton48+14)
MOVT	R0, #hi_addr(_RadioButton48+14)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,2757 :: 		RadioButton48.Pen_Color       = 0x0000;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton48+16)
MOVT	R0, #hi_addr(_RadioButton48+16)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,2758 :: 		RadioButton48.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_RadioButton48+18)
MOVT	R0, #hi_addr(_RadioButton48+18)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,2759 :: 		RadioButton48.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_RadioButton48+19)
MOVT	R0, #hi_addr(_RadioButton48+19)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,2760 :: 		RadioButton48.Checked         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton48+20)
MOVT	R0, #hi_addr(_RadioButton48+20)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,2761 :: 		RadioButton48.Transparent     = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_RadioButton48+21)
MOVT	R0, #hi_addr(_RadioButton48+21)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,2762 :: 		RadioButton48.Caption         = RadioButton48_Caption;
MOVW	R1, #lo_addr(_RadioButton48_Caption+0)
MOVT	R1, #hi_addr(_RadioButton48_Caption+0)
MOVW	R0, #lo_addr(_RadioButton48+24)
MOVT	R0, #hi_addr(_RadioButton48+24)
STR	R1, [R0, #0]
;ECGsynthetic_driver.c,2763 :: 		RadioButton48.TextAlign       = _taLeft;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton48+28)
MOVT	R0, #hi_addr(_RadioButton48+28)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,2764 :: 		RadioButton48.FontName        = DejaVu_Serif16x19_Regular;
MOVW	R0, #lo_addr(_RadioButton48+32)
MOVT	R0, #hi_addr(_RadioButton48+32)
STR	R5, [R0, #0]
;ECGsynthetic_driver.c,2765 :: 		RadioButton48.PressColEnabled = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_RadioButton48+48)
MOVT	R0, #hi_addr(_RadioButton48+48)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,2766 :: 		RadioButton48.Font_Color      = 0x0000;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton48+36)
MOVT	R0, #hi_addr(_RadioButton48+36)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,2767 :: 		RadioButton48.Gradient        = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton48+38)
MOVT	R0, #hi_addr(_RadioButton48+38)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,2768 :: 		RadioButton48.Gradient_Orientation = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton48+39)
MOVT	R0, #hi_addr(_RadioButton48+39)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,2769 :: 		RadioButton48.Gradient_Start_Color = 0xFFFF;
MOVW	R1, #65535
MOVW	R0, #lo_addr(_RadioButton48+40)
MOVT	R0, #hi_addr(_RadioButton48+40)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,2770 :: 		RadioButton48.Gradient_End_Color = 0xC618;
MOVW	R1, #50712
MOVW	R0, #lo_addr(_RadioButton48+42)
MOVT	R0, #hi_addr(_RadioButton48+42)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,2771 :: 		RadioButton48.Color           = 0xFFFF;
MOVW	R1, #65535
MOVW	R0, #lo_addr(_RadioButton48+44)
MOVT	R0, #hi_addr(_RadioButton48+44)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,2772 :: 		RadioButton48.Press_Color     = 0xE71C;
MOVW	R1, #59164
MOVW	R0, #lo_addr(_RadioButton48+50)
MOVT	R0, #hi_addr(_RadioButton48+50)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,2773 :: 		RadioButton48.Background_Color = 0x0000;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton48+46)
MOVT	R0, #hi_addr(_RadioButton48+46)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,2774 :: 		RadioButton48.OnPressPtr      = RadioButton48OnPress;
MOVW	R1, #lo_addr(_RadioButton48OnPress+0)
MOVT	R1, #hi_addr(_RadioButton48OnPress+0)
MOVW	R0, #lo_addr(_RadioButton48+64)
MOVT	R0, #hi_addr(_RadioButton48+64)
STR	R1, [R0, #0]
;ECGsynthetic_driver.c,2776 :: 		Label22.OwnerScreen     = &Screen5;
MOVW	R1, #lo_addr(_Screen5+0)
MOVT	R1, #hi_addr(_Screen5+0)
MOVW	R0, #lo_addr(_Label22+0)
MOVT	R0, #hi_addr(_Label22+0)
STR	R1, [R0, #0]
;ECGsynthetic_driver.c,2777 :: 		Label22.Order           = 12;
MOVS	R1, #12
MOVW	R0, #lo_addr(_Label22+4)
MOVT	R0, #hi_addr(_Label22+4)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,2778 :: 		Label22.Left            = 412;
MOVW	R1, #412
MOVW	R0, #lo_addr(_Label22+6)
MOVT	R0, #hi_addr(_Label22+6)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,2779 :: 		Label22.Top             = 38;
MOVS	R1, #38
MOVW	R0, #lo_addr(_Label22+8)
MOVT	R0, #hi_addr(_Label22+8)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,2780 :: 		Label22.Width           = 131;
MOVS	R1, #131
MOVW	R0, #lo_addr(_Label22+10)
MOVT	R0, #hi_addr(_Label22+10)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,2781 :: 		Label22.Height          = 26;
MOVS	R1, #26
MOVW	R0, #lo_addr(_Label22+12)
MOVT	R0, #hi_addr(_Label22+12)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,2782 :: 		Label22.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Label22+27)
MOVT	R0, #hi_addr(_Label22+27)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,2783 :: 		Label22.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Label22+28)
MOVT	R0, #hi_addr(_Label22+28)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,2784 :: 		Label22.Caption         = Label22_Caption;
MOVW	R1, #lo_addr(_Label22_Caption+0)
MOVT	R1, #hi_addr(_Label22_Caption+0)
MOVW	R0, #lo_addr(_Label22+16)
MOVT	R0, #hi_addr(_Label22+16)
STR	R1, [R0, #0]
;ECGsynthetic_driver.c,2785 :: 		Label22.FontName        = DejaVu_Serif22x24_Bold;
MOVW	R0, #lo_addr(_Label22+20)
MOVT	R0, #hi_addr(_Label22+20)
STR	R4, [R0, #0]
;ECGsynthetic_driver.c,2786 :: 		Label22.Font_Color      = 0x0000;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label22+24)
MOVT	R0, #hi_addr(_Label22+24)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,2787 :: 		Label22.VerticalText    = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label22+26)
MOVT	R0, #hi_addr(_Label22+26)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,2789 :: 		ButtonRound9.OwnerScreen     = &Screen5;
MOVW	R1, #lo_addr(_Screen5+0)
MOVT	R1, #hi_addr(_Screen5+0)
MOVW	R0, #lo_addr(_ButtonRound9+0)
MOVT	R0, #hi_addr(_ButtonRound9+0)
STR	R1, [R0, #0]
;ECGsynthetic_driver.c,2790 :: 		ButtonRound9.Order           = 13;
MOVS	R1, #13
MOVW	R0, #lo_addr(_ButtonRound9+4)
MOVT	R0, #hi_addr(_ButtonRound9+4)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,2791 :: 		ButtonRound9.Left            = 631;
MOVW	R1, #631
MOVW	R0, #lo_addr(_ButtonRound9+6)
MOVT	R0, #hi_addr(_ButtonRound9+6)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,2792 :: 		ButtonRound9.Top             = 402;
MOVW	R1, #402
MOVW	R0, #lo_addr(_ButtonRound9+8)
MOVT	R0, #hi_addr(_ButtonRound9+8)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,2793 :: 		ButtonRound9.Width           = 109;
MOVS	R1, #109
MOVW	R0, #lo_addr(_ButtonRound9+10)
MOVT	R0, #hi_addr(_ButtonRound9+10)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,2794 :: 		ButtonRound9.Height          = 53;
MOVS	R1, #53
MOVW	R0, #lo_addr(_ButtonRound9+12)
MOVT	R0, #hi_addr(_ButtonRound9+12)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,2795 :: 		ButtonRound9.Pen_Width       = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_ButtonRound9+14)
MOVT	R0, #hi_addr(_ButtonRound9+14)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,2796 :: 		ButtonRound9.Pen_Color       = 0x07E0;
MOVW	R1, #2016
MOVW	R0, #lo_addr(_ButtonRound9+16)
MOVT	R0, #hi_addr(_ButtonRound9+16)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,2797 :: 		ButtonRound9.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_ButtonRound9+18)
MOVT	R0, #hi_addr(_ButtonRound9+18)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,2798 :: 		ButtonRound9.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_ButtonRound9+19)
MOVT	R0, #hi_addr(_ButtonRound9+19)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,2799 :: 		ButtonRound9.Transparent     = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_ButtonRound9+20)
MOVT	R0, #hi_addr(_ButtonRound9+20)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,2800 :: 		ButtonRound9.Caption         = ButtonRound9_Caption;
MOVW	R1, #lo_addr(_ButtonRound9_Caption+0)
MOVT	R1, #hi_addr(_ButtonRound9_Caption+0)
MOVW	R0, #lo_addr(_ButtonRound9+24)
MOVT	R0, #hi_addr(_ButtonRound9+24)
STR	R1, [R0, #0]
;ECGsynthetic_driver.c,2801 :: 		ButtonRound9.TextAlign       = _taCenter;
MOVS	R1, #1
MOVW	R0, #lo_addr(_ButtonRound9+28)
MOVT	R0, #hi_addr(_ButtonRound9+28)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,2802 :: 		ButtonRound9.TextAlignVertical= _tavMiddle;
MOVS	R1, #1
MOVW	R0, #lo_addr(_ButtonRound9+29)
MOVT	R0, #hi_addr(_ButtonRound9+29)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,2803 :: 		ButtonRound9.FontName        = Tahoma25x25_Bold;
MOVW	R0, #lo_addr(_ButtonRound9+32)
MOVT	R0, #hi_addr(_ButtonRound9+32)
STR	R3, [R0, #0]
;ECGsynthetic_driver.c,2804 :: 		ButtonRound9.PressColEnabled = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_ButtonRound9+49)
MOVT	R0, #hi_addr(_ButtonRound9+49)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,2805 :: 		ButtonRound9.Font_Color      = 0xFFFF;
MOVW	R1, #65535
MOVW	R0, #lo_addr(_ButtonRound9+36)
MOVT	R0, #hi_addr(_ButtonRound9+36)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,2806 :: 		ButtonRound9.VerticalText    = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_ButtonRound9+38)
MOVT	R0, #hi_addr(_ButtonRound9+38)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,2807 :: 		ButtonRound9.Gradient        = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_ButtonRound9+39)
MOVT	R0, #hi_addr(_ButtonRound9+39)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,2808 :: 		ButtonRound9.Gradient_Orientation = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_ButtonRound9+40)
MOVT	R0, #hi_addr(_ButtonRound9+40)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,2809 :: 		ButtonRound9.Gradient_Start_Color = 0xFFFF;
MOVW	R1, #65535
MOVW	R0, #lo_addr(_ButtonRound9+42)
MOVT	R0, #hi_addr(_ButtonRound9+42)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,2810 :: 		ButtonRound9.Gradient_End_Color = 0xC618;
MOVW	R1, #50712
MOVW	R0, #lo_addr(_ButtonRound9+44)
MOVT	R0, #hi_addr(_ButtonRound9+44)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,2811 :: 		ButtonRound9.Color           = 0x07E0;
MOVW	R1, #2016
MOVW	R0, #lo_addr(_ButtonRound9+46)
MOVT	R0, #hi_addr(_ButtonRound9+46)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,2812 :: 		ButtonRound9.Press_Color     = 0xE71C;
MOVW	R1, #59164
MOVW	R0, #lo_addr(_ButtonRound9+50)
MOVT	R0, #hi_addr(_ButtonRound9+50)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,2813 :: 		ButtonRound9.Corner_Radius   = 3;
MOVS	R1, #3
MOVW	R0, #lo_addr(_ButtonRound9+48)
MOVT	R0, #hi_addr(_ButtonRound9+48)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,2814 :: 		ButtonRound9.OnClickPtr      = ButtonRound9OnClick;
MOVW	R1, #lo_addr(_ButtonRound9OnClick+0)
MOVT	R1, #hi_addr(_ButtonRound9OnClick+0)
MOVW	R0, #lo_addr(_ButtonRound9+60)
MOVT	R0, #hi_addr(_ButtonRound9+60)
STR	R1, [R0, #0]
;ECGsynthetic_driver.c,2816 :: 		Label23.OwnerScreen     = &Screen5;
MOVW	R1, #lo_addr(_Screen5+0)
MOVT	R1, #hi_addr(_Screen5+0)
MOVW	R0, #lo_addr(_Label23+0)
MOVT	R0, #hi_addr(_Label23+0)
STR	R1, [R0, #0]
;ECGsynthetic_driver.c,2817 :: 		Label23.Order           = 14;
MOVS	R1, #14
MOVW	R0, #lo_addr(_Label23+4)
MOVT	R0, #hi_addr(_Label23+4)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,2818 :: 		Label23.Left            = 43;
MOVS	R1, #43
MOVW	R0, #lo_addr(_Label23+6)
MOVT	R0, #hi_addr(_Label23+6)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,2819 :: 		Label23.Top             = 81;
MOVS	R1, #81
MOVW	R0, #lo_addr(_Label23+8)
MOVT	R0, #hi_addr(_Label23+8)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,2820 :: 		Label23.Width           = 100;
MOVS	R1, #100
MOVW	R0, #lo_addr(_Label23+10)
MOVT	R0, #hi_addr(_Label23+10)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,2821 :: 		Label23.Height          = 21;
MOVS	R1, #21
MOVW	R0, #lo_addr(_Label23+12)
MOVT	R0, #hi_addr(_Label23+12)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,2822 :: 		Label23.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Label23+27)
MOVT	R0, #hi_addr(_Label23+27)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,2823 :: 		Label23.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Label23+28)
MOVT	R0, #hi_addr(_Label23+28)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,2824 :: 		Label23.Caption         = Label23_Caption;
MOVW	R1, #lo_addr(_Label23_Caption+0)
MOVT	R1, #hi_addr(_Label23_Caption+0)
MOVW	R0, #lo_addr(_Label23+16)
MOVT	R0, #hi_addr(_Label23+16)
STR	R1, [R0, #0]
;ECGsynthetic_driver.c,2825 :: 		Label23.FontName        = DejaVu_Serif16x19_Regular;
MOVW	R0, #lo_addr(_Label23+20)
MOVT	R0, #hi_addr(_Label23+20)
STR	R5, [R0, #0]
;ECGsynthetic_driver.c,2826 :: 		Label23.Font_Color      = 0x0000;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label23+24)
MOVT	R0, #hi_addr(_Label23+24)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,2827 :: 		Label23.VerticalText    = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label23+26)
MOVT	R0, #hi_addr(_Label23+26)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,2829 :: 		ButtonRound10.OwnerScreen     = &Screen5;
MOVW	R1, #lo_addr(_Screen5+0)
MOVT	R1, #hi_addr(_Screen5+0)
MOVW	R0, #lo_addr(_ButtonRound10+0)
MOVT	R0, #hi_addr(_ButtonRound10+0)
STR	R1, [R0, #0]
;ECGsynthetic_driver.c,2830 :: 		ButtonRound10.Order           = 15;
MOVS	R1, #15
MOVW	R0, #lo_addr(_ButtonRound10+4)
MOVT	R0, #hi_addr(_ButtonRound10+4)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,2831 :: 		ButtonRound10.Left            = 226;
MOVS	R1, #226
MOVW	R0, #lo_addr(_ButtonRound10+6)
MOVT	R0, #hi_addr(_ButtonRound10+6)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,2832 :: 		ButtonRound10.Top             = 402;
MOVW	R1, #402
MOVW	R0, #lo_addr(_ButtonRound10+8)
MOVT	R0, #hi_addr(_ButtonRound10+8)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,2833 :: 		ButtonRound10.Width           = 109;
MOVS	R1, #109
MOVW	R0, #lo_addr(_ButtonRound10+10)
MOVT	R0, #hi_addr(_ButtonRound10+10)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,2834 :: 		ButtonRound10.Height          = 53;
MOVS	R1, #53
MOVW	R0, #lo_addr(_ButtonRound10+12)
MOVT	R0, #hi_addr(_ButtonRound10+12)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,2835 :: 		ButtonRound10.Pen_Width       = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_ButtonRound10+14)
MOVT	R0, #hi_addr(_ButtonRound10+14)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,2836 :: 		ButtonRound10.Pen_Color       = 0xEB2F;
MOVW	R1, #60207
MOVW	R0, #lo_addr(_ButtonRound10+16)
MOVT	R0, #hi_addr(_ButtonRound10+16)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,2837 :: 		ButtonRound10.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_ButtonRound10+18)
MOVT	R0, #hi_addr(_ButtonRound10+18)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,2838 :: 		ButtonRound10.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_ButtonRound10+19)
MOVT	R0, #hi_addr(_ButtonRound10+19)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,2839 :: 		ButtonRound10.Transparent     = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_ButtonRound10+20)
MOVT	R0, #hi_addr(_ButtonRound10+20)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,2840 :: 		ButtonRound10.Caption         = ButtonRound10_Caption;
MOVW	R1, #lo_addr(_ButtonRound10_Caption+0)
MOVT	R1, #hi_addr(_ButtonRound10_Caption+0)
MOVW	R0, #lo_addr(_ButtonRound10+24)
MOVT	R0, #hi_addr(_ButtonRound10+24)
STR	R1, [R0, #0]
;ECGsynthetic_driver.c,2841 :: 		ButtonRound10.TextAlign       = _taCenter;
MOVS	R1, #1
MOVW	R0, #lo_addr(_ButtonRound10+28)
MOVT	R0, #hi_addr(_ButtonRound10+28)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,2842 :: 		ButtonRound10.TextAlignVertical= _tavMiddle;
MOVS	R1, #1
MOVW	R0, #lo_addr(_ButtonRound10+29)
MOVT	R0, #hi_addr(_ButtonRound10+29)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,2843 :: 		ButtonRound10.FontName        = Tahoma25x25_Bold;
MOVW	R0, #lo_addr(_ButtonRound10+32)
MOVT	R0, #hi_addr(_ButtonRound10+32)
STR	R3, [R0, #0]
;ECGsynthetic_driver.c,2844 :: 		ButtonRound10.PressColEnabled = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_ButtonRound10+49)
MOVT	R0, #hi_addr(_ButtonRound10+49)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,2845 :: 		ButtonRound10.Font_Color      = 0xFFFF;
MOVW	R1, #65535
MOVW	R0, #lo_addr(_ButtonRound10+36)
MOVT	R0, #hi_addr(_ButtonRound10+36)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,2846 :: 		ButtonRound10.VerticalText    = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_ButtonRound10+38)
MOVT	R0, #hi_addr(_ButtonRound10+38)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,2847 :: 		ButtonRound10.Gradient        = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_ButtonRound10+39)
MOVT	R0, #hi_addr(_ButtonRound10+39)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,2848 :: 		ButtonRound10.Gradient_Orientation = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_ButtonRound10+40)
MOVT	R0, #hi_addr(_ButtonRound10+40)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,2849 :: 		ButtonRound10.Gradient_Start_Color = 0xFFFF;
MOVW	R1, #65535
MOVW	R0, #lo_addr(_ButtonRound10+42)
MOVT	R0, #hi_addr(_ButtonRound10+42)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,2850 :: 		ButtonRound10.Gradient_End_Color = 0xC618;
MOVW	R1, #50712
MOVW	R0, #lo_addr(_ButtonRound10+44)
MOVT	R0, #hi_addr(_ButtonRound10+44)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,2851 :: 		ButtonRound10.Color           = 0xEB2F;
MOVW	R1, #60207
MOVW	R0, #lo_addr(_ButtonRound10+46)
MOVT	R0, #hi_addr(_ButtonRound10+46)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,2852 :: 		ButtonRound10.Press_Color     = 0xE71C;
MOVW	R1, #59164
MOVW	R0, #lo_addr(_ButtonRound10+50)
MOVT	R0, #hi_addr(_ButtonRound10+50)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,2853 :: 		ButtonRound10.Corner_Radius   = 3;
MOVS	R1, #3
MOVW	R0, #lo_addr(_ButtonRound10+48)
MOVT	R0, #hi_addr(_ButtonRound10+48)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,2854 :: 		ButtonRound10.OnClickPtr      = ButtonRound10OnClick;
MOVW	R1, #lo_addr(_ButtonRound10OnClick+0)
MOVT	R1, #hi_addr(_ButtonRound10OnClick+0)
MOVW	R0, #lo_addr(_ButtonRound10+60)
MOVT	R0, #hi_addr(_ButtonRound10+60)
STR	R1, [R0, #0]
;ECGsynthetic_driver.c,2856 :: 		Image6.OwnerScreen     = &Screen5;
MOVW	R1, #lo_addr(_Screen5+0)
MOVT	R1, #hi_addr(_Screen5+0)
MOVW	R0, #lo_addr(_Image6+0)
MOVT	R0, #hi_addr(_Image6+0)
STR	R1, [R0, #0]
;ECGsynthetic_driver.c,2857 :: 		Image6.Order           = 16;
MOVS	R1, #16
MOVW	R0, #lo_addr(_Image6+4)
MOVT	R0, #hi_addr(_Image6+4)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,2858 :: 		Image6.Left            = 225;
MOVS	R1, #225
MOVW	R0, #lo_addr(_Image6+6)
MOVT	R0, #hi_addr(_Image6+6)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,2859 :: 		Image6.Top             = 85;
MOVS	R1, #85
MOVW	R0, #lo_addr(_Image6+8)
MOVT	R0, #hi_addr(_Image6+8)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,2860 :: 		Image6.Width           = 517;
MOVW	R1, #517
MOVW	R0, #lo_addr(_Image6+10)
MOVT	R0, #hi_addr(_Image6+10)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,2861 :: 		Image6.Height          = 298;
MOVW	R1, #298
MOVW	R0, #lo_addr(_Image6+12)
MOVT	R0, #hi_addr(_Image6+12)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,2862 :: 		Image6.Picture_Type    = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image6+22)
MOVT	R0, #hi_addr(_Image6+22)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,2863 :: 		Image6.Picture_Ratio   = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image6+23)
MOVT	R0, #hi_addr(_Image6+23)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,2864 :: 		Image6.Picture_Name    = GridLine1_jpg;
MOVW	R0, #lo_addr(_Image6+16)
MOVT	R0, #hi_addr(_Image6+16)
STR	R2, [R0, #0]
;ECGsynthetic_driver.c,2865 :: 		Image6.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image6+20)
MOVT	R0, #hi_addr(_Image6+20)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,2866 :: 		Image6.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image6+21)
MOVT	R0, #hi_addr(_Image6+21)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,2868 :: 		RadioButton49.OwnerScreen     = &Screen6;
MOVW	R1, #lo_addr(_Screen6+0)
MOVT	R1, #hi_addr(_Screen6+0)
MOVW	R0, #lo_addr(_RadioButton49+0)
MOVT	R0, #hi_addr(_RadioButton49+0)
STR	R1, [R0, #0]
;ECGsynthetic_driver.c,2869 :: 		RadioButton49.Order           = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton49+4)
MOVT	R0, #hi_addr(_RadioButton49+4)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,2870 :: 		RadioButton49.Left            = 42;
MOVS	R1, #42
MOVW	R0, #lo_addr(_RadioButton49+6)
MOVT	R0, #hi_addr(_RadioButton49+6)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,2871 :: 		RadioButton49.Top             = 134;
MOVS	R1, #134
MOVW	R0, #lo_addr(_RadioButton49+8)
MOVT	R0, #hi_addr(_RadioButton49+8)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,2872 :: 		RadioButton49.Width           = 41;
MOVS	R1, #41
MOVW	R0, #lo_addr(_RadioButton49+10)
MOVT	R0, #hi_addr(_RadioButton49+10)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,2873 :: 		RadioButton49.Height          = 25;
MOVS	R1, #25
MOVW	R0, #lo_addr(_RadioButton49+12)
MOVT	R0, #hi_addr(_RadioButton49+12)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,2874 :: 		RadioButton49.Pen_Width       = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_RadioButton49+14)
MOVT	R0, #hi_addr(_RadioButton49+14)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,2875 :: 		RadioButton49.Pen_Color       = 0x0000;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton49+16)
MOVT	R0, #hi_addr(_RadioButton49+16)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,2876 :: 		RadioButton49.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_RadioButton49+18)
MOVT	R0, #hi_addr(_RadioButton49+18)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,2877 :: 		RadioButton49.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_RadioButton49+19)
MOVT	R0, #hi_addr(_RadioButton49+19)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,2878 :: 		RadioButton49.Checked         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton49+20)
MOVT	R0, #hi_addr(_RadioButton49+20)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,2879 :: 		RadioButton49.Transparent     = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_RadioButton49+21)
MOVT	R0, #hi_addr(_RadioButton49+21)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,2880 :: 		RadioButton49.Caption         = RadioButton49_Caption;
MOVW	R1, #lo_addr(_RadioButton49_Caption+0)
MOVT	R1, #hi_addr(_RadioButton49_Caption+0)
MOVW	R0, #lo_addr(_RadioButton49+24)
MOVT	R0, #hi_addr(_RadioButton49+24)
STR	R1, [R0, #0]
;ECGsynthetic_driver.c,2881 :: 		RadioButton49.TextAlign       = _taLeft;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton49+28)
MOVT	R0, #hi_addr(_RadioButton49+28)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,2882 :: 		RadioButton49.FontName        = DejaVu_Serif16x19_Regular;
MOVW	R0, #lo_addr(_RadioButton49+32)
MOVT	R0, #hi_addr(_RadioButton49+32)
STR	R5, [R0, #0]
;ECGsynthetic_driver.c,2883 :: 		RadioButton49.PressColEnabled = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_RadioButton49+48)
MOVT	R0, #hi_addr(_RadioButton49+48)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,2884 :: 		RadioButton49.Font_Color      = 0x0000;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton49+36)
MOVT	R0, #hi_addr(_RadioButton49+36)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,2885 :: 		RadioButton49.Gradient        = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton49+38)
MOVT	R0, #hi_addr(_RadioButton49+38)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,2886 :: 		RadioButton49.Gradient_Orientation = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton49+39)
MOVT	R0, #hi_addr(_RadioButton49+39)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,2887 :: 		RadioButton49.Gradient_Start_Color = 0xFFFF;
MOVW	R1, #65535
MOVW	R0, #lo_addr(_RadioButton49+40)
MOVT	R0, #hi_addr(_RadioButton49+40)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,2888 :: 		RadioButton49.Gradient_End_Color = 0xC618;
MOVW	R1, #50712
MOVW	R0, #lo_addr(_RadioButton49+42)
MOVT	R0, #hi_addr(_RadioButton49+42)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,2889 :: 		RadioButton49.Color           = 0xFFFF;
MOVW	R1, #65535
MOVW	R0, #lo_addr(_RadioButton49+44)
MOVT	R0, #hi_addr(_RadioButton49+44)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,2890 :: 		RadioButton49.Press_Color     = 0xC618;
MOVW	R1, #50712
MOVW	R0, #lo_addr(_RadioButton49+50)
MOVT	R0, #hi_addr(_RadioButton49+50)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,2891 :: 		RadioButton49.Background_Color = 0x0000;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton49+46)
MOVT	R0, #hi_addr(_RadioButton49+46)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,2892 :: 		RadioButton49.OnPressPtr      = RadioButton49OnPress;
MOVW	R1, #lo_addr(_RadioButton49OnPress+0)
MOVT	R1, #hi_addr(_RadioButton49OnPress+0)
MOVW	R0, #lo_addr(_RadioButton49+64)
MOVT	R0, #hi_addr(_RadioButton49+64)
STR	R1, [R0, #0]
;ECGsynthetic_driver.c,2894 :: 		RadioButton50.OwnerScreen     = &Screen6;
MOVW	R1, #lo_addr(_Screen6+0)
MOVT	R1, #hi_addr(_Screen6+0)
MOVW	R0, #lo_addr(_RadioButton50+0)
MOVT	R0, #hi_addr(_RadioButton50+0)
STR	R1, [R0, #0]
;ECGsynthetic_driver.c,2895 :: 		RadioButton50.Order           = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_RadioButton50+4)
MOVT	R0, #hi_addr(_RadioButton50+4)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,2896 :: 		RadioButton50.Left            = 42;
MOVS	R1, #42
MOVW	R0, #lo_addr(_RadioButton50+6)
MOVT	R0, #hi_addr(_RadioButton50+6)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,2897 :: 		RadioButton50.Top             = 174;
MOVS	R1, #174
MOVW	R0, #lo_addr(_RadioButton50+8)
MOVT	R0, #hi_addr(_RadioButton50+8)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,2898 :: 		RadioButton50.Width           = 47;
MOVS	R1, #47
MOVW	R0, #lo_addr(_RadioButton50+10)
MOVT	R0, #hi_addr(_RadioButton50+10)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,2899 :: 		RadioButton50.Height          = 25;
MOVS	R1, #25
MOVW	R0, #lo_addr(_RadioButton50+12)
MOVT	R0, #hi_addr(_RadioButton50+12)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,2900 :: 		RadioButton50.Pen_Width       = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_RadioButton50+14)
MOVT	R0, #hi_addr(_RadioButton50+14)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,2901 :: 		RadioButton50.Pen_Color       = 0x0000;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton50+16)
MOVT	R0, #hi_addr(_RadioButton50+16)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,2902 :: 		RadioButton50.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_RadioButton50+18)
MOVT	R0, #hi_addr(_RadioButton50+18)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,2903 :: 		RadioButton50.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_RadioButton50+19)
MOVT	R0, #hi_addr(_RadioButton50+19)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,2904 :: 		RadioButton50.Checked         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton50+20)
MOVT	R0, #hi_addr(_RadioButton50+20)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,2905 :: 		RadioButton50.Transparent     = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_RadioButton50+21)
MOVT	R0, #hi_addr(_RadioButton50+21)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,2906 :: 		RadioButton50.Caption         = RadioButton50_Caption;
MOVW	R1, #lo_addr(_RadioButton50_Caption+0)
MOVT	R1, #hi_addr(_RadioButton50_Caption+0)
MOVW	R0, #lo_addr(_RadioButton50+24)
MOVT	R0, #hi_addr(_RadioButton50+24)
STR	R1, [R0, #0]
;ECGsynthetic_driver.c,2907 :: 		RadioButton50.TextAlign       = _taLeft;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton50+28)
MOVT	R0, #hi_addr(_RadioButton50+28)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,2908 :: 		RadioButton50.FontName        = DejaVu_Serif16x19_Regular;
MOVW	R0, #lo_addr(_RadioButton50+32)
MOVT	R0, #hi_addr(_RadioButton50+32)
STR	R5, [R0, #0]
;ECGsynthetic_driver.c,2909 :: 		RadioButton50.PressColEnabled = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_RadioButton50+48)
MOVT	R0, #hi_addr(_RadioButton50+48)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,2910 :: 		RadioButton50.Font_Color      = 0x0000;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton50+36)
MOVT	R0, #hi_addr(_RadioButton50+36)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,2911 :: 		RadioButton50.Gradient        = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton50+38)
MOVT	R0, #hi_addr(_RadioButton50+38)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,2912 :: 		RadioButton50.Gradient_Orientation = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton50+39)
MOVT	R0, #hi_addr(_RadioButton50+39)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,2913 :: 		RadioButton50.Gradient_Start_Color = 0xFFFF;
MOVW	R1, #65535
MOVW	R0, #lo_addr(_RadioButton50+40)
MOVT	R0, #hi_addr(_RadioButton50+40)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,2914 :: 		RadioButton50.Gradient_End_Color = 0xC618;
MOVW	R1, #50712
MOVW	R0, #lo_addr(_RadioButton50+42)
MOVT	R0, #hi_addr(_RadioButton50+42)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,2915 :: 		RadioButton50.Color           = 0xFFFF;
MOVW	R1, #65535
MOVW	R0, #lo_addr(_RadioButton50+44)
MOVT	R0, #hi_addr(_RadioButton50+44)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,2916 :: 		RadioButton50.Press_Color     = 0xE71C;
MOVW	R1, #59164
MOVW	R0, #lo_addr(_RadioButton50+50)
MOVT	R0, #hi_addr(_RadioButton50+50)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,2917 :: 		RadioButton50.Background_Color = 0x0000;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton50+46)
MOVT	R0, #hi_addr(_RadioButton50+46)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,2918 :: 		RadioButton50.OnPressPtr      = RadioButton50OnPress;
MOVW	R1, #lo_addr(_RadioButton50OnPress+0)
MOVT	R1, #hi_addr(_RadioButton50OnPress+0)
MOVW	R0, #lo_addr(_RadioButton50+64)
MOVT	R0, #hi_addr(_RadioButton50+64)
STR	R1, [R0, #0]
;ECGsynthetic_driver.c,2920 :: 		RadioButton51.OwnerScreen     = &Screen6;
MOVW	R1, #lo_addr(_Screen6+0)
MOVT	R1, #hi_addr(_Screen6+0)
MOVW	R0, #lo_addr(_RadioButton51+0)
MOVT	R0, #hi_addr(_RadioButton51+0)
STR	R1, [R0, #0]
;ECGsynthetic_driver.c,2921 :: 		RadioButton51.Order           = 2;
MOVS	R1, #2
MOVW	R0, #lo_addr(_RadioButton51+4)
MOVT	R0, #hi_addr(_RadioButton51+4)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,2922 :: 		RadioButton51.Left            = 42;
MOVS	R1, #42
MOVW	R0, #lo_addr(_RadioButton51+6)
MOVT	R0, #hi_addr(_RadioButton51+6)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,2923 :: 		RadioButton51.Top             = 214;
MOVS	R1, #214
MOVW	R0, #lo_addr(_RadioButton51+8)
MOVT	R0, #hi_addr(_RadioButton51+8)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,2924 :: 		RadioButton51.Width           = 54;
MOVS	R1, #54
MOVW	R0, #lo_addr(_RadioButton51+10)
MOVT	R0, #hi_addr(_RadioButton51+10)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,2925 :: 		RadioButton51.Height          = 25;
MOVS	R1, #25
MOVW	R0, #lo_addr(_RadioButton51+12)
MOVT	R0, #hi_addr(_RadioButton51+12)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,2926 :: 		RadioButton51.Pen_Width       = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_RadioButton51+14)
MOVT	R0, #hi_addr(_RadioButton51+14)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,2927 :: 		RadioButton51.Pen_Color       = 0x0000;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton51+16)
MOVT	R0, #hi_addr(_RadioButton51+16)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,2928 :: 		RadioButton51.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_RadioButton51+18)
MOVT	R0, #hi_addr(_RadioButton51+18)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,2929 :: 		RadioButton51.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_RadioButton51+19)
MOVT	R0, #hi_addr(_RadioButton51+19)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,2930 :: 		RadioButton51.Checked         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton51+20)
MOVT	R0, #hi_addr(_RadioButton51+20)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,2931 :: 		RadioButton51.Transparent     = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_RadioButton51+21)
MOVT	R0, #hi_addr(_RadioButton51+21)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,2932 :: 		RadioButton51.Caption         = RadioButton51_Caption;
MOVW	R1, #lo_addr(_RadioButton51_Caption+0)
MOVT	R1, #hi_addr(_RadioButton51_Caption+0)
MOVW	R0, #lo_addr(_RadioButton51+24)
MOVT	R0, #hi_addr(_RadioButton51+24)
STR	R1, [R0, #0]
;ECGsynthetic_driver.c,2933 :: 		RadioButton51.TextAlign       = _taLeft;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton51+28)
MOVT	R0, #hi_addr(_RadioButton51+28)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,2934 :: 		RadioButton51.FontName        = DejaVu_Serif16x19_Regular;
MOVW	R0, #lo_addr(_RadioButton51+32)
MOVT	R0, #hi_addr(_RadioButton51+32)
STR	R5, [R0, #0]
;ECGsynthetic_driver.c,2935 :: 		RadioButton51.PressColEnabled = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_RadioButton51+48)
MOVT	R0, #hi_addr(_RadioButton51+48)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,2936 :: 		RadioButton51.Font_Color      = 0x0000;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton51+36)
MOVT	R0, #hi_addr(_RadioButton51+36)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,2937 :: 		RadioButton51.Gradient        = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton51+38)
MOVT	R0, #hi_addr(_RadioButton51+38)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,2938 :: 		RadioButton51.Gradient_Orientation = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton51+39)
MOVT	R0, #hi_addr(_RadioButton51+39)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,2939 :: 		RadioButton51.Gradient_Start_Color = 0xFFFF;
MOVW	R1, #65535
MOVW	R0, #lo_addr(_RadioButton51+40)
MOVT	R0, #hi_addr(_RadioButton51+40)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,2940 :: 		RadioButton51.Gradient_End_Color = 0xC618;
MOVW	R1, #50712
MOVW	R0, #lo_addr(_RadioButton51+42)
MOVT	R0, #hi_addr(_RadioButton51+42)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,2941 :: 		RadioButton51.Color           = 0xFFFF;
MOVW	R1, #65535
MOVW	R0, #lo_addr(_RadioButton51+44)
MOVT	R0, #hi_addr(_RadioButton51+44)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,2942 :: 		RadioButton51.Press_Color     = 0xE71C;
MOVW	R1, #59164
MOVW	R0, #lo_addr(_RadioButton51+50)
MOVT	R0, #hi_addr(_RadioButton51+50)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,2943 :: 		RadioButton51.Background_Color = 0x0000;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton51+46)
MOVT	R0, #hi_addr(_RadioButton51+46)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,2944 :: 		RadioButton51.OnPressPtr      = RadioButton51OnPress;
MOVW	R1, #lo_addr(_RadioButton51OnPress+0)
MOVT	R1, #hi_addr(_RadioButton51OnPress+0)
MOVW	R0, #lo_addr(_RadioButton51+64)
MOVT	R0, #hi_addr(_RadioButton51+64)
STR	R1, [R0, #0]
;ECGsynthetic_driver.c,2946 :: 		RadioButton52.OwnerScreen     = &Screen6;
MOVW	R1, #lo_addr(_Screen6+0)
MOVT	R1, #hi_addr(_Screen6+0)
MOVW	R0, #lo_addr(_RadioButton52+0)
MOVT	R0, #hi_addr(_RadioButton52+0)
STR	R1, [R0, #0]
;ECGsynthetic_driver.c,2947 :: 		RadioButton52.Order           = 3;
MOVS	R1, #3
MOVW	R0, #lo_addr(_RadioButton52+4)
MOVT	R0, #hi_addr(_RadioButton52+4)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,2948 :: 		RadioButton52.Left            = 42;
MOVS	R1, #42
MOVW	R0, #lo_addr(_RadioButton52+6)
MOVT	R0, #hi_addr(_RadioButton52+6)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,2949 :: 		RadioButton52.Top             = 254;
MOVS	R1, #254
MOVW	R0, #lo_addr(_RadioButton52+8)
MOVT	R0, #hi_addr(_RadioButton52+8)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,2950 :: 		RadioButton52.Width           = 68;
MOVS	R1, #68
MOVW	R0, #lo_addr(_RadioButton52+10)
MOVT	R0, #hi_addr(_RadioButton52+10)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,2951 :: 		RadioButton52.Height          = 25;
MOVS	R1, #25
MOVW	R0, #lo_addr(_RadioButton52+12)
MOVT	R0, #hi_addr(_RadioButton52+12)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,2952 :: 		RadioButton52.Pen_Width       = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_RadioButton52+14)
MOVT	R0, #hi_addr(_RadioButton52+14)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,2953 :: 		RadioButton52.Pen_Color       = 0x0000;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton52+16)
MOVT	R0, #hi_addr(_RadioButton52+16)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,2954 :: 		RadioButton52.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_RadioButton52+18)
MOVT	R0, #hi_addr(_RadioButton52+18)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,2955 :: 		RadioButton52.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_RadioButton52+19)
MOVT	R0, #hi_addr(_RadioButton52+19)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,2956 :: 		RadioButton52.Checked         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton52+20)
MOVT	R0, #hi_addr(_RadioButton52+20)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,2957 :: 		RadioButton52.Transparent     = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_RadioButton52+21)
MOVT	R0, #hi_addr(_RadioButton52+21)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,2958 :: 		RadioButton52.Caption         = RadioButton52_Caption;
MOVW	R1, #lo_addr(_RadioButton52_Caption+0)
MOVT	R1, #hi_addr(_RadioButton52_Caption+0)
MOVW	R0, #lo_addr(_RadioButton52+24)
MOVT	R0, #hi_addr(_RadioButton52+24)
STR	R1, [R0, #0]
;ECGsynthetic_driver.c,2959 :: 		RadioButton52.TextAlign       = _taLeft;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton52+28)
MOVT	R0, #hi_addr(_RadioButton52+28)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,2960 :: 		RadioButton52.FontName        = DejaVu_Serif16x19_Regular;
MOVW	R0, #lo_addr(_RadioButton52+32)
MOVT	R0, #hi_addr(_RadioButton52+32)
STR	R5, [R0, #0]
;ECGsynthetic_driver.c,2961 :: 		RadioButton52.PressColEnabled = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_RadioButton52+48)
MOVT	R0, #hi_addr(_RadioButton52+48)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,2962 :: 		RadioButton52.Font_Color      = 0x0000;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton52+36)
MOVT	R0, #hi_addr(_RadioButton52+36)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,2963 :: 		RadioButton52.Gradient        = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton52+38)
MOVT	R0, #hi_addr(_RadioButton52+38)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,2964 :: 		RadioButton52.Gradient_Orientation = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton52+39)
MOVT	R0, #hi_addr(_RadioButton52+39)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,2965 :: 		RadioButton52.Gradient_Start_Color = 0xFFFF;
MOVW	R1, #65535
MOVW	R0, #lo_addr(_RadioButton52+40)
MOVT	R0, #hi_addr(_RadioButton52+40)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,2966 :: 		RadioButton52.Gradient_End_Color = 0xC618;
MOVW	R1, #50712
MOVW	R0, #lo_addr(_RadioButton52+42)
MOVT	R0, #hi_addr(_RadioButton52+42)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,2967 :: 		RadioButton52.Color           = 0xFFFF;
MOVW	R1, #65535
MOVW	R0, #lo_addr(_RadioButton52+44)
MOVT	R0, #hi_addr(_RadioButton52+44)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,2968 :: 		RadioButton52.Press_Color     = 0xE71C;
MOVW	R1, #59164
MOVW	R0, #lo_addr(_RadioButton52+50)
MOVT	R0, #hi_addr(_RadioButton52+50)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,2969 :: 		RadioButton52.Background_Color = 0x0000;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton52+46)
MOVT	R0, #hi_addr(_RadioButton52+46)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,2970 :: 		RadioButton52.OnPressPtr      = RadioButton52OnPress;
MOVW	R1, #lo_addr(_RadioButton52OnPress+0)
MOVT	R1, #hi_addr(_RadioButton52OnPress+0)
MOVW	R0, #lo_addr(_RadioButton52+64)
MOVT	R0, #hi_addr(_RadioButton52+64)
STR	R1, [R0, #0]
;ECGsynthetic_driver.c,2972 :: 		RadioButton53.OwnerScreen     = &Screen6;
MOVW	R1, #lo_addr(_Screen6+0)
MOVT	R1, #hi_addr(_Screen6+0)
MOVW	R0, #lo_addr(_RadioButton53+0)
MOVT	R0, #hi_addr(_RadioButton53+0)
STR	R1, [R0, #0]
;ECGsynthetic_driver.c,2973 :: 		RadioButton53.Order           = 4;
MOVS	R1, #4
MOVW	R0, #lo_addr(_RadioButton53+4)
MOVT	R0, #hi_addr(_RadioButton53+4)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,2974 :: 		RadioButton53.Left            = 42;
MOVS	R1, #42
MOVW	R0, #lo_addr(_RadioButton53+6)
MOVT	R0, #hi_addr(_RadioButton53+6)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,2975 :: 		RadioButton53.Top             = 294;
MOVW	R1, #294
MOVW	R0, #lo_addr(_RadioButton53+8)
MOVT	R0, #hi_addr(_RadioButton53+8)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,2976 :: 		RadioButton53.Width           = 67;
MOVS	R1, #67
MOVW	R0, #lo_addr(_RadioButton53+10)
MOVT	R0, #hi_addr(_RadioButton53+10)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,2977 :: 		RadioButton53.Height          = 25;
MOVS	R1, #25
MOVW	R0, #lo_addr(_RadioButton53+12)
MOVT	R0, #hi_addr(_RadioButton53+12)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,2978 :: 		RadioButton53.Pen_Width       = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_RadioButton53+14)
MOVT	R0, #hi_addr(_RadioButton53+14)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,2979 :: 		RadioButton53.Pen_Color       = 0x0000;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton53+16)
MOVT	R0, #hi_addr(_RadioButton53+16)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,2980 :: 		RadioButton53.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_RadioButton53+18)
MOVT	R0, #hi_addr(_RadioButton53+18)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,2981 :: 		RadioButton53.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_RadioButton53+19)
MOVT	R0, #hi_addr(_RadioButton53+19)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,2982 :: 		RadioButton53.Checked         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton53+20)
MOVT	R0, #hi_addr(_RadioButton53+20)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,2983 :: 		RadioButton53.Transparent     = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_RadioButton53+21)
MOVT	R0, #hi_addr(_RadioButton53+21)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,2984 :: 		RadioButton53.Caption         = RadioButton53_Caption;
MOVW	R1, #lo_addr(_RadioButton53_Caption+0)
MOVT	R1, #hi_addr(_RadioButton53_Caption+0)
MOVW	R0, #lo_addr(_RadioButton53+24)
MOVT	R0, #hi_addr(_RadioButton53+24)
STR	R1, [R0, #0]
;ECGsynthetic_driver.c,2985 :: 		RadioButton53.TextAlign       = _taLeft;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton53+28)
MOVT	R0, #hi_addr(_RadioButton53+28)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,2986 :: 		RadioButton53.FontName        = DejaVu_Serif16x19_Regular;
MOVW	R0, #lo_addr(_RadioButton53+32)
MOVT	R0, #hi_addr(_RadioButton53+32)
STR	R5, [R0, #0]
;ECGsynthetic_driver.c,2987 :: 		RadioButton53.PressColEnabled = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_RadioButton53+48)
MOVT	R0, #hi_addr(_RadioButton53+48)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,2988 :: 		RadioButton53.Font_Color      = 0x0000;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton53+36)
MOVT	R0, #hi_addr(_RadioButton53+36)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,2989 :: 		RadioButton53.Gradient        = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton53+38)
MOVT	R0, #hi_addr(_RadioButton53+38)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,2990 :: 		RadioButton53.Gradient_Orientation = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton53+39)
MOVT	R0, #hi_addr(_RadioButton53+39)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,2991 :: 		RadioButton53.Gradient_Start_Color = 0xFFFF;
MOVW	R1, #65535
MOVW	R0, #lo_addr(_RadioButton53+40)
MOVT	R0, #hi_addr(_RadioButton53+40)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,2992 :: 		RadioButton53.Gradient_End_Color = 0xC618;
MOVW	R1, #50712
MOVW	R0, #lo_addr(_RadioButton53+42)
MOVT	R0, #hi_addr(_RadioButton53+42)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,2993 :: 		RadioButton53.Color           = 0xFFFF;
MOVW	R1, #65535
MOVW	R0, #lo_addr(_RadioButton53+44)
MOVT	R0, #hi_addr(_RadioButton53+44)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,2994 :: 		RadioButton53.Press_Color     = 0xE71C;
MOVW	R1, #59164
MOVW	R0, #lo_addr(_RadioButton53+50)
MOVT	R0, #hi_addr(_RadioButton53+50)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,2995 :: 		RadioButton53.Background_Color = 0x0000;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton53+46)
MOVT	R0, #hi_addr(_RadioButton53+46)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,2996 :: 		RadioButton53.OnPressPtr      = RadioButton53OnPress;
MOVW	R1, #lo_addr(_RadioButton53OnPress+0)
MOVT	R1, #hi_addr(_RadioButton53OnPress+0)
MOVW	R0, #lo_addr(_RadioButton53+64)
MOVT	R0, #hi_addr(_RadioButton53+64)
STR	R1, [R0, #0]
;ECGsynthetic_driver.c,2998 :: 		RadioButton54.OwnerScreen     = &Screen6;
MOVW	R1, #lo_addr(_Screen6+0)
MOVT	R1, #hi_addr(_Screen6+0)
MOVW	R0, #lo_addr(_RadioButton54+0)
MOVT	R0, #hi_addr(_RadioButton54+0)
STR	R1, [R0, #0]
;ECGsynthetic_driver.c,2999 :: 		RadioButton54.Order           = 5;
MOVS	R1, #5
MOVW	R0, #lo_addr(_RadioButton54+4)
MOVT	R0, #hi_addr(_RadioButton54+4)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,3000 :: 		RadioButton54.Left            = 42;
MOVS	R1, #42
MOVW	R0, #lo_addr(_RadioButton54+6)
MOVT	R0, #hi_addr(_RadioButton54+6)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,3001 :: 		RadioButton54.Top             = 335;
MOVW	R1, #335
MOVW	R0, #lo_addr(_RadioButton54+8)
MOVT	R0, #hi_addr(_RadioButton54+8)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,3002 :: 		RadioButton54.Width           = 67;
MOVS	R1, #67
MOVW	R0, #lo_addr(_RadioButton54+10)
MOVT	R0, #hi_addr(_RadioButton54+10)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,3003 :: 		RadioButton54.Height          = 25;
MOVS	R1, #25
MOVW	R0, #lo_addr(_RadioButton54+12)
MOVT	R0, #hi_addr(_RadioButton54+12)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,3004 :: 		RadioButton54.Pen_Width       = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_RadioButton54+14)
MOVT	R0, #hi_addr(_RadioButton54+14)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,3005 :: 		RadioButton54.Pen_Color       = 0x0000;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton54+16)
MOVT	R0, #hi_addr(_RadioButton54+16)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,3006 :: 		RadioButton54.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_RadioButton54+18)
MOVT	R0, #hi_addr(_RadioButton54+18)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,3007 :: 		RadioButton54.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_RadioButton54+19)
MOVT	R0, #hi_addr(_RadioButton54+19)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,3008 :: 		RadioButton54.Checked         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton54+20)
MOVT	R0, #hi_addr(_RadioButton54+20)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,3009 :: 		RadioButton54.Transparent     = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_RadioButton54+21)
MOVT	R0, #hi_addr(_RadioButton54+21)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,3010 :: 		RadioButton54.Caption         = RadioButton54_Caption;
MOVW	R1, #lo_addr(_RadioButton54_Caption+0)
MOVT	R1, #hi_addr(_RadioButton54_Caption+0)
MOVW	R0, #lo_addr(_RadioButton54+24)
MOVT	R0, #hi_addr(_RadioButton54+24)
STR	R1, [R0, #0]
;ECGsynthetic_driver.c,3011 :: 		RadioButton54.TextAlign       = _taLeft;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton54+28)
MOVT	R0, #hi_addr(_RadioButton54+28)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,3012 :: 		RadioButton54.FontName        = DejaVu_Serif16x19_Regular;
MOVW	R0, #lo_addr(_RadioButton54+32)
MOVT	R0, #hi_addr(_RadioButton54+32)
STR	R5, [R0, #0]
;ECGsynthetic_driver.c,3013 :: 		RadioButton54.PressColEnabled = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_RadioButton54+48)
MOVT	R0, #hi_addr(_RadioButton54+48)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,3014 :: 		RadioButton54.Font_Color      = 0x0000;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton54+36)
MOVT	R0, #hi_addr(_RadioButton54+36)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,3015 :: 		RadioButton54.Gradient        = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton54+38)
MOVT	R0, #hi_addr(_RadioButton54+38)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,3016 :: 		RadioButton54.Gradient_Orientation = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton54+39)
MOVT	R0, #hi_addr(_RadioButton54+39)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,3017 :: 		RadioButton54.Gradient_Start_Color = 0xFFFF;
MOVW	R1, #65535
MOVW	R0, #lo_addr(_RadioButton54+40)
MOVT	R0, #hi_addr(_RadioButton54+40)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,3018 :: 		RadioButton54.Gradient_End_Color = 0xC618;
MOVW	R1, #50712
MOVW	R0, #lo_addr(_RadioButton54+42)
MOVT	R0, #hi_addr(_RadioButton54+42)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,3019 :: 		RadioButton54.Color           = 0xFFFF;
MOVW	R1, #65535
MOVW	R0, #lo_addr(_RadioButton54+44)
MOVT	R0, #hi_addr(_RadioButton54+44)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,3020 :: 		RadioButton54.Press_Color     = 0xE71C;
MOVW	R1, #59164
MOVW	R0, #lo_addr(_RadioButton54+50)
MOVT	R0, #hi_addr(_RadioButton54+50)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,3021 :: 		RadioButton54.Background_Color = 0x0000;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton54+46)
MOVT	R0, #hi_addr(_RadioButton54+46)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,3022 :: 		RadioButton54.OnPressPtr      = RadioButton54OnPress;
MOVW	R1, #lo_addr(_RadioButton54OnPress+0)
MOVT	R1, #hi_addr(_RadioButton54OnPress+0)
MOVW	R0, #lo_addr(_RadioButton54+64)
MOVT	R0, #hi_addr(_RadioButton54+64)
STR	R1, [R0, #0]
;ECGsynthetic_driver.c,3024 :: 		RadioButton55.OwnerScreen     = &Screen6;
MOVW	R1, #lo_addr(_Screen6+0)
MOVT	R1, #hi_addr(_Screen6+0)
MOVW	R0, #lo_addr(_RadioButton55+0)
MOVT	R0, #hi_addr(_RadioButton55+0)
STR	R1, [R0, #0]
;ECGsynthetic_driver.c,3025 :: 		RadioButton55.Order           = 6;
MOVS	R1, #6
MOVW	R0, #lo_addr(_RadioButton55+4)
MOVT	R0, #hi_addr(_RadioButton55+4)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,3026 :: 		RadioButton55.Left            = 139;
MOVS	R1, #139
MOVW	R0, #lo_addr(_RadioButton55+6)
MOVT	R0, #hi_addr(_RadioButton55+6)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,3027 :: 		RadioButton55.Top             = 133;
MOVS	R1, #133
MOVW	R0, #lo_addr(_RadioButton55+8)
MOVT	R0, #hi_addr(_RadioButton55+8)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,3028 :: 		RadioButton55.Width           = 57;
MOVS	R1, #57
MOVW	R0, #lo_addr(_RadioButton55+10)
MOVT	R0, #hi_addr(_RadioButton55+10)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,3029 :: 		RadioButton55.Height          = 25;
MOVS	R1, #25
MOVW	R0, #lo_addr(_RadioButton55+12)
MOVT	R0, #hi_addr(_RadioButton55+12)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,3030 :: 		RadioButton55.Pen_Width       = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_RadioButton55+14)
MOVT	R0, #hi_addr(_RadioButton55+14)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,3031 :: 		RadioButton55.Pen_Color       = 0x0000;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton55+16)
MOVT	R0, #hi_addr(_RadioButton55+16)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,3032 :: 		RadioButton55.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_RadioButton55+18)
MOVT	R0, #hi_addr(_RadioButton55+18)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,3033 :: 		RadioButton55.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_RadioButton55+19)
MOVT	R0, #hi_addr(_RadioButton55+19)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,3034 :: 		RadioButton55.Checked         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton55+20)
MOVT	R0, #hi_addr(_RadioButton55+20)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,3035 :: 		RadioButton55.Transparent     = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_RadioButton55+21)
MOVT	R0, #hi_addr(_RadioButton55+21)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,3036 :: 		RadioButton55.Caption         = RadioButton55_Caption;
MOVW	R1, #lo_addr(_RadioButton55_Caption+0)
MOVT	R1, #hi_addr(_RadioButton55_Caption+0)
MOVW	R0, #lo_addr(_RadioButton55+24)
MOVT	R0, #hi_addr(_RadioButton55+24)
STR	R1, [R0, #0]
;ECGsynthetic_driver.c,3037 :: 		RadioButton55.TextAlign       = _taLeft;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton55+28)
MOVT	R0, #hi_addr(_RadioButton55+28)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,3038 :: 		RadioButton55.FontName        = DejaVu_Serif16x19_Regular;
MOVW	R0, #lo_addr(_RadioButton55+32)
MOVT	R0, #hi_addr(_RadioButton55+32)
STR	R5, [R0, #0]
;ECGsynthetic_driver.c,3039 :: 		RadioButton55.PressColEnabled = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_RadioButton55+48)
MOVT	R0, #hi_addr(_RadioButton55+48)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,3040 :: 		RadioButton55.Font_Color      = 0x0000;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton55+36)
MOVT	R0, #hi_addr(_RadioButton55+36)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,3041 :: 		RadioButton55.Gradient        = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton55+38)
MOVT	R0, #hi_addr(_RadioButton55+38)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,3042 :: 		RadioButton55.Gradient_Orientation = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton55+39)
MOVT	R0, #hi_addr(_RadioButton55+39)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,3043 :: 		RadioButton55.Gradient_Start_Color = 0xFFFF;
MOVW	R1, #65535
MOVW	R0, #lo_addr(_RadioButton55+40)
MOVT	R0, #hi_addr(_RadioButton55+40)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,3044 :: 		RadioButton55.Gradient_End_Color = 0xC618;
MOVW	R1, #50712
MOVW	R0, #lo_addr(_RadioButton55+42)
MOVT	R0, #hi_addr(_RadioButton55+42)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,3045 :: 		RadioButton55.Color           = 0xFFFF;
MOVW	R1, #65535
MOVW	R0, #lo_addr(_RadioButton55+44)
MOVT	R0, #hi_addr(_RadioButton55+44)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,3046 :: 		RadioButton55.Press_Color     = 0xE71C;
MOVW	R1, #59164
MOVW	R0, #lo_addr(_RadioButton55+50)
MOVT	R0, #hi_addr(_RadioButton55+50)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,3047 :: 		RadioButton55.Background_Color = 0x0000;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton55+46)
MOVT	R0, #hi_addr(_RadioButton55+46)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,3048 :: 		RadioButton55.OnPressPtr      = RadioButton55OnPress;
MOVW	R1, #lo_addr(_RadioButton55OnPress+0)
MOVT	R1, #hi_addr(_RadioButton55OnPress+0)
MOVW	R0, #lo_addr(_RadioButton55+64)
MOVT	R0, #hi_addr(_RadioButton55+64)
STR	R1, [R0, #0]
;ECGsynthetic_driver.c,3050 :: 		RadioButton56.OwnerScreen     = &Screen6;
MOVW	R1, #lo_addr(_Screen6+0)
MOVT	R1, #hi_addr(_Screen6+0)
MOVW	R0, #lo_addr(_RadioButton56+0)
MOVT	R0, #hi_addr(_RadioButton56+0)
STR	R1, [R0, #0]
;ECGsynthetic_driver.c,3051 :: 		RadioButton56.Order           = 7;
MOVS	R1, #7
MOVW	R0, #lo_addr(_RadioButton56+4)
MOVT	R0, #hi_addr(_RadioButton56+4)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,3052 :: 		RadioButton56.Left            = 139;
MOVS	R1, #139
MOVW	R0, #lo_addr(_RadioButton56+6)
MOVT	R0, #hi_addr(_RadioButton56+6)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,3053 :: 		RadioButton56.Top             = 174;
MOVS	R1, #174
MOVW	R0, #lo_addr(_RadioButton56+8)
MOVT	R0, #hi_addr(_RadioButton56+8)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,3054 :: 		RadioButton56.Width           = 57;
MOVS	R1, #57
MOVW	R0, #lo_addr(_RadioButton56+10)
MOVT	R0, #hi_addr(_RadioButton56+10)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,3055 :: 		RadioButton56.Height          = 25;
MOVS	R1, #25
MOVW	R0, #lo_addr(_RadioButton56+12)
MOVT	R0, #hi_addr(_RadioButton56+12)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,3056 :: 		RadioButton56.Pen_Width       = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_RadioButton56+14)
MOVT	R0, #hi_addr(_RadioButton56+14)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,3057 :: 		RadioButton56.Pen_Color       = 0x0000;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton56+16)
MOVT	R0, #hi_addr(_RadioButton56+16)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,3058 :: 		RadioButton56.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_RadioButton56+18)
MOVT	R0, #hi_addr(_RadioButton56+18)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,3059 :: 		RadioButton56.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_RadioButton56+19)
MOVT	R0, #hi_addr(_RadioButton56+19)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,3060 :: 		RadioButton56.Checked         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton56+20)
MOVT	R0, #hi_addr(_RadioButton56+20)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,3061 :: 		RadioButton56.Transparent     = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_RadioButton56+21)
MOVT	R0, #hi_addr(_RadioButton56+21)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,3062 :: 		RadioButton56.Caption         = RadioButton56_Caption;
MOVW	R1, #lo_addr(_RadioButton56_Caption+0)
MOVT	R1, #hi_addr(_RadioButton56_Caption+0)
MOVW	R0, #lo_addr(_RadioButton56+24)
MOVT	R0, #hi_addr(_RadioButton56+24)
STR	R1, [R0, #0]
;ECGsynthetic_driver.c,3063 :: 		RadioButton56.TextAlign       = _taLeft;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton56+28)
MOVT	R0, #hi_addr(_RadioButton56+28)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,3064 :: 		RadioButton56.FontName        = DejaVu_Serif16x19_Regular;
MOVW	R0, #lo_addr(_RadioButton56+32)
MOVT	R0, #hi_addr(_RadioButton56+32)
STR	R5, [R0, #0]
;ECGsynthetic_driver.c,3065 :: 		RadioButton56.PressColEnabled = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_RadioButton56+48)
MOVT	R0, #hi_addr(_RadioButton56+48)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,3066 :: 		RadioButton56.Font_Color      = 0x0000;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton56+36)
MOVT	R0, #hi_addr(_RadioButton56+36)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,3067 :: 		RadioButton56.Gradient        = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton56+38)
MOVT	R0, #hi_addr(_RadioButton56+38)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,3068 :: 		RadioButton56.Gradient_Orientation = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton56+39)
MOVT	R0, #hi_addr(_RadioButton56+39)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,3069 :: 		RadioButton56.Gradient_Start_Color = 0xFFFF;
MOVW	R1, #65535
MOVW	R0, #lo_addr(_RadioButton56+40)
MOVT	R0, #hi_addr(_RadioButton56+40)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,3070 :: 		RadioButton56.Gradient_End_Color = 0xC618;
MOVW	R1, #50712
MOVW	R0, #lo_addr(_RadioButton56+42)
MOVT	R0, #hi_addr(_RadioButton56+42)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,3071 :: 		RadioButton56.Color           = 0xFFFF;
MOVW	R1, #65535
MOVW	R0, #lo_addr(_RadioButton56+44)
MOVT	R0, #hi_addr(_RadioButton56+44)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,3072 :: 		RadioButton56.Press_Color     = 0xE71C;
MOVW	R1, #59164
MOVW	R0, #lo_addr(_RadioButton56+50)
MOVT	R0, #hi_addr(_RadioButton56+50)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,3073 :: 		RadioButton56.Background_Color = 0x0000;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton56+46)
MOVT	R0, #hi_addr(_RadioButton56+46)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,3074 :: 		RadioButton56.OnPressPtr      = RadioButton56OnPress;
MOVW	R1, #lo_addr(_RadioButton56OnPress+0)
MOVT	R1, #hi_addr(_RadioButton56OnPress+0)
MOVW	R0, #lo_addr(_RadioButton56+64)
MOVT	R0, #hi_addr(_RadioButton56+64)
STR	R1, [R0, #0]
;ECGsynthetic_driver.c,3076 :: 		RadioButton57.OwnerScreen     = &Screen6;
MOVW	R1, #lo_addr(_Screen6+0)
MOVT	R1, #hi_addr(_Screen6+0)
MOVW	R0, #lo_addr(_RadioButton57+0)
MOVT	R0, #hi_addr(_RadioButton57+0)
STR	R1, [R0, #0]
;ECGsynthetic_driver.c,3077 :: 		RadioButton57.Order           = 8;
MOVS	R1, #8
MOVW	R0, #lo_addr(_RadioButton57+4)
MOVT	R0, #hi_addr(_RadioButton57+4)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,3078 :: 		RadioButton57.Left            = 139;
MOVS	R1, #139
MOVW	R0, #lo_addr(_RadioButton57+6)
MOVT	R0, #hi_addr(_RadioButton57+6)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,3079 :: 		RadioButton57.Top             = 214;
MOVS	R1, #214
MOVW	R0, #lo_addr(_RadioButton57+8)
MOVT	R0, #hi_addr(_RadioButton57+8)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,3080 :: 		RadioButton57.Width           = 57;
MOVS	R1, #57
MOVW	R0, #lo_addr(_RadioButton57+10)
MOVT	R0, #hi_addr(_RadioButton57+10)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,3081 :: 		RadioButton57.Height          = 25;
MOVS	R1, #25
MOVW	R0, #lo_addr(_RadioButton57+12)
MOVT	R0, #hi_addr(_RadioButton57+12)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,3082 :: 		RadioButton57.Pen_Width       = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_RadioButton57+14)
MOVT	R0, #hi_addr(_RadioButton57+14)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,3083 :: 		RadioButton57.Pen_Color       = 0x0000;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton57+16)
MOVT	R0, #hi_addr(_RadioButton57+16)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,3084 :: 		RadioButton57.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_RadioButton57+18)
MOVT	R0, #hi_addr(_RadioButton57+18)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,3085 :: 		RadioButton57.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_RadioButton57+19)
MOVT	R0, #hi_addr(_RadioButton57+19)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,3086 :: 		RadioButton57.Checked         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton57+20)
MOVT	R0, #hi_addr(_RadioButton57+20)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,3087 :: 		RadioButton57.Transparent     = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_RadioButton57+21)
MOVT	R0, #hi_addr(_RadioButton57+21)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,3088 :: 		RadioButton57.Caption         = RadioButton57_Caption;
MOVW	R1, #lo_addr(_RadioButton57_Caption+0)
MOVT	R1, #hi_addr(_RadioButton57_Caption+0)
MOVW	R0, #lo_addr(_RadioButton57+24)
MOVT	R0, #hi_addr(_RadioButton57+24)
STR	R1, [R0, #0]
;ECGsynthetic_driver.c,3089 :: 		RadioButton57.TextAlign       = _taLeft;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton57+28)
MOVT	R0, #hi_addr(_RadioButton57+28)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,3090 :: 		RadioButton57.FontName        = DejaVu_Serif16x19_Regular;
MOVW	R0, #lo_addr(_RadioButton57+32)
MOVT	R0, #hi_addr(_RadioButton57+32)
STR	R5, [R0, #0]
;ECGsynthetic_driver.c,3091 :: 		RadioButton57.PressColEnabled = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_RadioButton57+48)
MOVT	R0, #hi_addr(_RadioButton57+48)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,3092 :: 		RadioButton57.Font_Color      = 0x0000;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton57+36)
MOVT	R0, #hi_addr(_RadioButton57+36)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,3093 :: 		RadioButton57.Gradient        = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton57+38)
MOVT	R0, #hi_addr(_RadioButton57+38)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,3094 :: 		RadioButton57.Gradient_Orientation = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton57+39)
MOVT	R0, #hi_addr(_RadioButton57+39)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,3095 :: 		RadioButton57.Gradient_Start_Color = 0xFFFF;
MOVW	R1, #65535
MOVW	R0, #lo_addr(_RadioButton57+40)
MOVT	R0, #hi_addr(_RadioButton57+40)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,3096 :: 		RadioButton57.Gradient_End_Color = 0xC618;
MOVW	R1, #50712
MOVW	R0, #lo_addr(_RadioButton57+42)
MOVT	R0, #hi_addr(_RadioButton57+42)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,3097 :: 		RadioButton57.Color           = 0xFFFF;
MOVW	R1, #65535
MOVW	R0, #lo_addr(_RadioButton57+44)
MOVT	R0, #hi_addr(_RadioButton57+44)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,3098 :: 		RadioButton57.Press_Color     = 0xE71C;
MOVW	R1, #59164
MOVW	R0, #lo_addr(_RadioButton57+50)
MOVT	R0, #hi_addr(_RadioButton57+50)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,3099 :: 		RadioButton57.Background_Color = 0x0000;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton57+46)
MOVT	R0, #hi_addr(_RadioButton57+46)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,3100 :: 		RadioButton57.OnPressPtr      = RadioButton57OnPress;
MOVW	R1, #lo_addr(_RadioButton57OnPress+0)
MOVT	R1, #hi_addr(_RadioButton57OnPress+0)
MOVW	R0, #lo_addr(_RadioButton57+64)
MOVT	R0, #hi_addr(_RadioButton57+64)
STR	R1, [R0, #0]
;ECGsynthetic_driver.c,3102 :: 		RadioButton58.OwnerScreen     = &Screen6;
MOVW	R1, #lo_addr(_Screen6+0)
MOVT	R1, #hi_addr(_Screen6+0)
MOVW	R0, #lo_addr(_RadioButton58+0)
MOVT	R0, #hi_addr(_RadioButton58+0)
STR	R1, [R0, #0]
;ECGsynthetic_driver.c,3103 :: 		RadioButton58.Order           = 9;
MOVS	R1, #9
MOVW	R0, #lo_addr(_RadioButton58+4)
MOVT	R0, #hi_addr(_RadioButton58+4)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,3104 :: 		RadioButton58.Left            = 139;
MOVS	R1, #139
MOVW	R0, #lo_addr(_RadioButton58+6)
MOVT	R0, #hi_addr(_RadioButton58+6)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,3105 :: 		RadioButton58.Top             = 254;
MOVS	R1, #254
MOVW	R0, #lo_addr(_RadioButton58+8)
MOVT	R0, #hi_addr(_RadioButton58+8)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,3106 :: 		RadioButton58.Width           = 57;
MOVS	R1, #57
MOVW	R0, #lo_addr(_RadioButton58+10)
MOVT	R0, #hi_addr(_RadioButton58+10)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,3107 :: 		RadioButton58.Height          = 25;
MOVS	R1, #25
MOVW	R0, #lo_addr(_RadioButton58+12)
MOVT	R0, #hi_addr(_RadioButton58+12)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,3108 :: 		RadioButton58.Pen_Width       = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_RadioButton58+14)
MOVT	R0, #hi_addr(_RadioButton58+14)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,3109 :: 		RadioButton58.Pen_Color       = 0x0000;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton58+16)
MOVT	R0, #hi_addr(_RadioButton58+16)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,3110 :: 		RadioButton58.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_RadioButton58+18)
MOVT	R0, #hi_addr(_RadioButton58+18)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,3111 :: 		RadioButton58.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_RadioButton58+19)
MOVT	R0, #hi_addr(_RadioButton58+19)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,3112 :: 		RadioButton58.Checked         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton58+20)
MOVT	R0, #hi_addr(_RadioButton58+20)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,3113 :: 		RadioButton58.Transparent     = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_RadioButton58+21)
MOVT	R0, #hi_addr(_RadioButton58+21)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,3114 :: 		RadioButton58.Caption         = RadioButton58_Caption;
MOVW	R1, #lo_addr(_RadioButton58_Caption+0)
MOVT	R1, #hi_addr(_RadioButton58_Caption+0)
MOVW	R0, #lo_addr(_RadioButton58+24)
MOVT	R0, #hi_addr(_RadioButton58+24)
STR	R1, [R0, #0]
;ECGsynthetic_driver.c,3115 :: 		RadioButton58.TextAlign       = _taLeft;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton58+28)
MOVT	R0, #hi_addr(_RadioButton58+28)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,3116 :: 		RadioButton58.FontName        = DejaVu_Serif16x19_Regular;
MOVW	R0, #lo_addr(_RadioButton58+32)
MOVT	R0, #hi_addr(_RadioButton58+32)
STR	R5, [R0, #0]
;ECGsynthetic_driver.c,3117 :: 		RadioButton58.PressColEnabled = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_RadioButton58+48)
MOVT	R0, #hi_addr(_RadioButton58+48)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,3118 :: 		RadioButton58.Font_Color      = 0x0000;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton58+36)
MOVT	R0, #hi_addr(_RadioButton58+36)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,3119 :: 		RadioButton58.Gradient        = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton58+38)
MOVT	R0, #hi_addr(_RadioButton58+38)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,3120 :: 		RadioButton58.Gradient_Orientation = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton58+39)
MOVT	R0, #hi_addr(_RadioButton58+39)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,3121 :: 		RadioButton58.Gradient_Start_Color = 0xFFFF;
MOVW	R1, #65535
MOVW	R0, #lo_addr(_RadioButton58+40)
MOVT	R0, #hi_addr(_RadioButton58+40)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,3122 :: 		RadioButton58.Gradient_End_Color = 0xC618;
MOVW	R1, #50712
MOVW	R0, #lo_addr(_RadioButton58+42)
MOVT	R0, #hi_addr(_RadioButton58+42)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,3123 :: 		RadioButton58.Color           = 0xFFFF;
MOVW	R1, #65535
MOVW	R0, #lo_addr(_RadioButton58+44)
MOVT	R0, #hi_addr(_RadioButton58+44)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,3124 :: 		RadioButton58.Press_Color     = 0xE71C;
MOVW	R1, #59164
MOVW	R0, #lo_addr(_RadioButton58+50)
MOVT	R0, #hi_addr(_RadioButton58+50)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,3125 :: 		RadioButton58.Background_Color = 0x0000;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton58+46)
MOVT	R0, #hi_addr(_RadioButton58+46)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,3126 :: 		RadioButton58.OnPressPtr      = RadioButton58OnPress;
MOVW	R1, #lo_addr(_RadioButton58OnPress+0)
MOVT	R1, #hi_addr(_RadioButton58OnPress+0)
MOVW	R0, #lo_addr(_RadioButton58+64)
MOVT	R0, #hi_addr(_RadioButton58+64)
STR	R1, [R0, #0]
;ECGsynthetic_driver.c,3128 :: 		RadioButton59.OwnerScreen     = &Screen6;
MOVW	R1, #lo_addr(_Screen6+0)
MOVT	R1, #hi_addr(_Screen6+0)
MOVW	R0, #lo_addr(_RadioButton59+0)
MOVT	R0, #hi_addr(_RadioButton59+0)
STR	R1, [R0, #0]
;ECGsynthetic_driver.c,3129 :: 		RadioButton59.Order           = 10;
MOVS	R1, #10
MOVW	R0, #lo_addr(_RadioButton59+4)
MOVT	R0, #hi_addr(_RadioButton59+4)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,3130 :: 		RadioButton59.Left            = 140;
MOVS	R1, #140
MOVW	R0, #lo_addr(_RadioButton59+6)
MOVT	R0, #hi_addr(_RadioButton59+6)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,3131 :: 		RadioButton59.Top             = 294;
MOVW	R1, #294
MOVW	R0, #lo_addr(_RadioButton59+8)
MOVT	R0, #hi_addr(_RadioButton59+8)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,3132 :: 		RadioButton59.Width           = 57;
MOVS	R1, #57
MOVW	R0, #lo_addr(_RadioButton59+10)
MOVT	R0, #hi_addr(_RadioButton59+10)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,3133 :: 		RadioButton59.Height          = 25;
MOVS	R1, #25
MOVW	R0, #lo_addr(_RadioButton59+12)
MOVT	R0, #hi_addr(_RadioButton59+12)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,3134 :: 		RadioButton59.Pen_Width       = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_RadioButton59+14)
MOVT	R0, #hi_addr(_RadioButton59+14)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,3135 :: 		RadioButton59.Pen_Color       = 0x0000;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton59+16)
MOVT	R0, #hi_addr(_RadioButton59+16)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,3136 :: 		RadioButton59.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_RadioButton59+18)
MOVT	R0, #hi_addr(_RadioButton59+18)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,3137 :: 		RadioButton59.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_RadioButton59+19)
MOVT	R0, #hi_addr(_RadioButton59+19)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,3138 :: 		RadioButton59.Checked         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton59+20)
MOVT	R0, #hi_addr(_RadioButton59+20)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,3139 :: 		RadioButton59.Transparent     = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_RadioButton59+21)
MOVT	R0, #hi_addr(_RadioButton59+21)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,3140 :: 		RadioButton59.Caption         = RadioButton59_Caption;
MOVW	R1, #lo_addr(_RadioButton59_Caption+0)
MOVT	R1, #hi_addr(_RadioButton59_Caption+0)
MOVW	R0, #lo_addr(_RadioButton59+24)
MOVT	R0, #hi_addr(_RadioButton59+24)
STR	R1, [R0, #0]
;ECGsynthetic_driver.c,3141 :: 		RadioButton59.TextAlign       = _taLeft;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton59+28)
MOVT	R0, #hi_addr(_RadioButton59+28)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,3142 :: 		RadioButton59.FontName        = DejaVu_Serif16x19_Regular;
MOVW	R0, #lo_addr(_RadioButton59+32)
MOVT	R0, #hi_addr(_RadioButton59+32)
STR	R5, [R0, #0]
;ECGsynthetic_driver.c,3143 :: 		RadioButton59.PressColEnabled = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_RadioButton59+48)
MOVT	R0, #hi_addr(_RadioButton59+48)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,3144 :: 		RadioButton59.Font_Color      = 0x0000;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton59+36)
MOVT	R0, #hi_addr(_RadioButton59+36)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,3145 :: 		RadioButton59.Gradient        = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton59+38)
MOVT	R0, #hi_addr(_RadioButton59+38)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,3146 :: 		RadioButton59.Gradient_Orientation = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton59+39)
MOVT	R0, #hi_addr(_RadioButton59+39)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,3147 :: 		RadioButton59.Gradient_Start_Color = 0xFFFF;
MOVW	R1, #65535
MOVW	R0, #lo_addr(_RadioButton59+40)
MOVT	R0, #hi_addr(_RadioButton59+40)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,3148 :: 		RadioButton59.Gradient_End_Color = 0xC618;
MOVW	R1, #50712
MOVW	R0, #lo_addr(_RadioButton59+42)
MOVT	R0, #hi_addr(_RadioButton59+42)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,3149 :: 		RadioButton59.Color           = 0xFFFF;
MOVW	R1, #65535
MOVW	R0, #lo_addr(_RadioButton59+44)
MOVT	R0, #hi_addr(_RadioButton59+44)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,3150 :: 		RadioButton59.Press_Color     = 0xE71C;
MOVW	R1, #59164
MOVW	R0, #lo_addr(_RadioButton59+50)
MOVT	R0, #hi_addr(_RadioButton59+50)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,3151 :: 		RadioButton59.Background_Color = 0x0000;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton59+46)
MOVT	R0, #hi_addr(_RadioButton59+46)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,3152 :: 		RadioButton59.OnPressPtr      = RadioButton59OnPress;
MOVW	R1, #lo_addr(_RadioButton59OnPress+0)
MOVT	R1, #hi_addr(_RadioButton59OnPress+0)
MOVW	R0, #lo_addr(_RadioButton59+64)
MOVT	R0, #hi_addr(_RadioButton59+64)
STR	R1, [R0, #0]
;ECGsynthetic_driver.c,3154 :: 		RadioButton60.OwnerScreen     = &Screen6;
MOVW	R1, #lo_addr(_Screen6+0)
MOVT	R1, #hi_addr(_Screen6+0)
MOVW	R0, #lo_addr(_RadioButton60+0)
MOVT	R0, #hi_addr(_RadioButton60+0)
STR	R1, [R0, #0]
;ECGsynthetic_driver.c,3155 :: 		RadioButton60.Order           = 11;
MOVS	R1, #11
MOVW	R0, #lo_addr(_RadioButton60+4)
MOVT	R0, #hi_addr(_RadioButton60+4)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,3156 :: 		RadioButton60.Left            = 140;
MOVS	R1, #140
MOVW	R0, #lo_addr(_RadioButton60+6)
MOVT	R0, #hi_addr(_RadioButton60+6)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,3157 :: 		RadioButton60.Top             = 335;
MOVW	R1, #335
MOVW	R0, #lo_addr(_RadioButton60+8)
MOVT	R0, #hi_addr(_RadioButton60+8)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,3158 :: 		RadioButton60.Width           = 57;
MOVS	R1, #57
MOVW	R0, #lo_addr(_RadioButton60+10)
MOVT	R0, #hi_addr(_RadioButton60+10)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,3159 :: 		RadioButton60.Height          = 25;
MOVS	R1, #25
MOVW	R0, #lo_addr(_RadioButton60+12)
MOVT	R0, #hi_addr(_RadioButton60+12)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,3160 :: 		RadioButton60.Pen_Width       = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_RadioButton60+14)
MOVT	R0, #hi_addr(_RadioButton60+14)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,3161 :: 		RadioButton60.Pen_Color       = 0x0000;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton60+16)
MOVT	R0, #hi_addr(_RadioButton60+16)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,3162 :: 		RadioButton60.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_RadioButton60+18)
MOVT	R0, #hi_addr(_RadioButton60+18)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,3163 :: 		RadioButton60.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_RadioButton60+19)
MOVT	R0, #hi_addr(_RadioButton60+19)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,3164 :: 		RadioButton60.Checked         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton60+20)
MOVT	R0, #hi_addr(_RadioButton60+20)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,3165 :: 		RadioButton60.Transparent     = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_RadioButton60+21)
MOVT	R0, #hi_addr(_RadioButton60+21)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,3166 :: 		RadioButton60.Caption         = RadioButton60_Caption;
MOVW	R1, #lo_addr(_RadioButton60_Caption+0)
MOVT	R1, #hi_addr(_RadioButton60_Caption+0)
MOVW	R0, #lo_addr(_RadioButton60+24)
MOVT	R0, #hi_addr(_RadioButton60+24)
STR	R1, [R0, #0]
;ECGsynthetic_driver.c,3167 :: 		RadioButton60.TextAlign       = _taLeft;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton60+28)
MOVT	R0, #hi_addr(_RadioButton60+28)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,3168 :: 		RadioButton60.FontName        = DejaVu_Serif16x19_Regular;
MOVW	R0, #lo_addr(_RadioButton60+32)
MOVT	R0, #hi_addr(_RadioButton60+32)
STR	R5, [R0, #0]
;ECGsynthetic_driver.c,3169 :: 		RadioButton60.PressColEnabled = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_RadioButton60+48)
MOVT	R0, #hi_addr(_RadioButton60+48)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,3170 :: 		RadioButton60.Font_Color      = 0x0000;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton60+36)
MOVT	R0, #hi_addr(_RadioButton60+36)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,3171 :: 		RadioButton60.Gradient        = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton60+38)
MOVT	R0, #hi_addr(_RadioButton60+38)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,3172 :: 		RadioButton60.Gradient_Orientation = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton60+39)
MOVT	R0, #hi_addr(_RadioButton60+39)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,3173 :: 		RadioButton60.Gradient_Start_Color = 0xFFFF;
MOVW	R1, #65535
MOVW	R0, #lo_addr(_RadioButton60+40)
MOVT	R0, #hi_addr(_RadioButton60+40)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,3174 :: 		RadioButton60.Gradient_End_Color = 0xC618;
MOVW	R1, #50712
MOVW	R0, #lo_addr(_RadioButton60+42)
MOVT	R0, #hi_addr(_RadioButton60+42)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,3175 :: 		RadioButton60.Color           = 0xFFFF;
MOVW	R1, #65535
MOVW	R0, #lo_addr(_RadioButton60+44)
MOVT	R0, #hi_addr(_RadioButton60+44)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,3176 :: 		RadioButton60.Press_Color     = 0xE71C;
MOVW	R1, #59164
MOVW	R0, #lo_addr(_RadioButton60+50)
MOVT	R0, #hi_addr(_RadioButton60+50)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,3177 :: 		RadioButton60.Background_Color = 0x0000;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton60+46)
MOVT	R0, #hi_addr(_RadioButton60+46)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,3178 :: 		RadioButton60.OnPressPtr      = RadioButton60OnPress;
MOVW	R1, #lo_addr(_RadioButton60OnPress+0)
MOVT	R1, #hi_addr(_RadioButton60OnPress+0)
MOVW	R0, #lo_addr(_RadioButton60+64)
MOVT	R0, #hi_addr(_RadioButton60+64)
STR	R1, [R0, #0]
;ECGsynthetic_driver.c,3180 :: 		Label24.OwnerScreen     = &Screen6;
MOVW	R1, #lo_addr(_Screen6+0)
MOVT	R1, #hi_addr(_Screen6+0)
MOVW	R0, #lo_addr(_Label24+0)
MOVT	R0, #hi_addr(_Label24+0)
STR	R1, [R0, #0]
;ECGsynthetic_driver.c,3181 :: 		Label24.Order           = 12;
MOVS	R1, #12
MOVW	R0, #lo_addr(_Label24+4)
MOVT	R0, #hi_addr(_Label24+4)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,3182 :: 		Label24.Left            = 412;
MOVW	R1, #412
MOVW	R0, #lo_addr(_Label24+6)
MOVT	R0, #hi_addr(_Label24+6)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,3183 :: 		Label24.Top             = 38;
MOVS	R1, #38
MOVW	R0, #lo_addr(_Label24+8)
MOVT	R0, #hi_addr(_Label24+8)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,3184 :: 		Label24.Width           = 148;
MOVS	R1, #148
MOVW	R0, #lo_addr(_Label24+10)
MOVT	R0, #hi_addr(_Label24+10)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,3185 :: 		Label24.Height          = 26;
MOVS	R1, #26
MOVW	R0, #lo_addr(_Label24+12)
MOVT	R0, #hi_addr(_Label24+12)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,3186 :: 		Label24.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Label24+27)
MOVT	R0, #hi_addr(_Label24+27)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,3187 :: 		Label24.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Label24+28)
MOVT	R0, #hi_addr(_Label24+28)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,3188 :: 		Label24.Caption         = Label24_Caption;
MOVW	R1, #lo_addr(_Label24_Caption+0)
MOVT	R1, #hi_addr(_Label24_Caption+0)
MOVW	R0, #lo_addr(_Label24+16)
MOVT	R0, #hi_addr(_Label24+16)
STR	R1, [R0, #0]
;ECGsynthetic_driver.c,3189 :: 		Label24.FontName        = DejaVu_Serif22x24_Bold;
MOVW	R0, #lo_addr(_Label24+20)
MOVT	R0, #hi_addr(_Label24+20)
STR	R4, [R0, #0]
;ECGsynthetic_driver.c,3190 :: 		Label24.Font_Color      = 0x0000;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label24+24)
MOVT	R0, #hi_addr(_Label24+24)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,3191 :: 		Label24.VerticalText    = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label24+26)
MOVT	R0, #hi_addr(_Label24+26)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,3193 :: 		ButtonRound11.OwnerScreen     = &Screen6;
MOVW	R1, #lo_addr(_Screen6+0)
MOVT	R1, #hi_addr(_Screen6+0)
MOVW	R0, #lo_addr(_ButtonRound11+0)
MOVT	R0, #hi_addr(_ButtonRound11+0)
STR	R1, [R0, #0]
;ECGsynthetic_driver.c,3194 :: 		ButtonRound11.Order           = 13;
MOVS	R1, #13
MOVW	R0, #lo_addr(_ButtonRound11+4)
MOVT	R0, #hi_addr(_ButtonRound11+4)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,3195 :: 		ButtonRound11.Left            = 632;
MOVW	R1, #632
MOVW	R0, #lo_addr(_ButtonRound11+6)
MOVT	R0, #hi_addr(_ButtonRound11+6)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,3196 :: 		ButtonRound11.Top             = 402;
MOVW	R1, #402
MOVW	R0, #lo_addr(_ButtonRound11+8)
MOVT	R0, #hi_addr(_ButtonRound11+8)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,3197 :: 		ButtonRound11.Width           = 109;
MOVS	R1, #109
MOVW	R0, #lo_addr(_ButtonRound11+10)
MOVT	R0, #hi_addr(_ButtonRound11+10)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,3198 :: 		ButtonRound11.Height          = 53;
MOVS	R1, #53
MOVW	R0, #lo_addr(_ButtonRound11+12)
MOVT	R0, #hi_addr(_ButtonRound11+12)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,3199 :: 		ButtonRound11.Pen_Width       = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_ButtonRound11+14)
MOVT	R0, #hi_addr(_ButtonRound11+14)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,3200 :: 		ButtonRound11.Pen_Color       = 0x07E0;
MOVW	R1, #2016
MOVW	R0, #lo_addr(_ButtonRound11+16)
MOVT	R0, #hi_addr(_ButtonRound11+16)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,3201 :: 		ButtonRound11.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_ButtonRound11+18)
MOVT	R0, #hi_addr(_ButtonRound11+18)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,3202 :: 		ButtonRound11.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_ButtonRound11+19)
MOVT	R0, #hi_addr(_ButtonRound11+19)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,3203 :: 		ButtonRound11.Transparent     = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_ButtonRound11+20)
MOVT	R0, #hi_addr(_ButtonRound11+20)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,3204 :: 		ButtonRound11.Caption         = ButtonRound11_Caption;
MOVW	R1, #lo_addr(_ButtonRound11_Caption+0)
MOVT	R1, #hi_addr(_ButtonRound11_Caption+0)
MOVW	R0, #lo_addr(_ButtonRound11+24)
MOVT	R0, #hi_addr(_ButtonRound11+24)
STR	R1, [R0, #0]
;ECGsynthetic_driver.c,3205 :: 		ButtonRound11.TextAlign       = _taCenter;
MOVS	R1, #1
MOVW	R0, #lo_addr(_ButtonRound11+28)
MOVT	R0, #hi_addr(_ButtonRound11+28)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,3206 :: 		ButtonRound11.TextAlignVertical= _tavMiddle;
MOVS	R1, #1
MOVW	R0, #lo_addr(_ButtonRound11+29)
MOVT	R0, #hi_addr(_ButtonRound11+29)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,3207 :: 		ButtonRound11.FontName        = Tahoma25x25_Bold;
MOVW	R0, #lo_addr(_ButtonRound11+32)
MOVT	R0, #hi_addr(_ButtonRound11+32)
STR	R3, [R0, #0]
;ECGsynthetic_driver.c,3208 :: 		ButtonRound11.PressColEnabled = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_ButtonRound11+49)
MOVT	R0, #hi_addr(_ButtonRound11+49)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,3209 :: 		ButtonRound11.Font_Color      = 0xFFFF;
MOVW	R1, #65535
MOVW	R0, #lo_addr(_ButtonRound11+36)
MOVT	R0, #hi_addr(_ButtonRound11+36)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,3210 :: 		ButtonRound11.VerticalText    = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_ButtonRound11+38)
MOVT	R0, #hi_addr(_ButtonRound11+38)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,3211 :: 		ButtonRound11.Gradient        = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_ButtonRound11+39)
MOVT	R0, #hi_addr(_ButtonRound11+39)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,3212 :: 		ButtonRound11.Gradient_Orientation = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_ButtonRound11+40)
MOVT	R0, #hi_addr(_ButtonRound11+40)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,3213 :: 		ButtonRound11.Gradient_Start_Color = 0xFFFF;
MOVW	R1, #65535
MOVW	R0, #lo_addr(_ButtonRound11+42)
MOVT	R0, #hi_addr(_ButtonRound11+42)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,3214 :: 		ButtonRound11.Gradient_End_Color = 0xC618;
MOVW	R1, #50712
MOVW	R0, #lo_addr(_ButtonRound11+44)
MOVT	R0, #hi_addr(_ButtonRound11+44)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,3215 :: 		ButtonRound11.Color           = 0x07E0;
MOVW	R1, #2016
MOVW	R0, #lo_addr(_ButtonRound11+46)
MOVT	R0, #hi_addr(_ButtonRound11+46)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,3216 :: 		ButtonRound11.Press_Color     = 0xE71C;
MOVW	R1, #59164
MOVW	R0, #lo_addr(_ButtonRound11+50)
MOVT	R0, #hi_addr(_ButtonRound11+50)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,3217 :: 		ButtonRound11.Corner_Radius   = 3;
MOVS	R1, #3
MOVW	R0, #lo_addr(_ButtonRound11+48)
MOVT	R0, #hi_addr(_ButtonRound11+48)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,3218 :: 		ButtonRound11.OnClickPtr      = ButtonRound11OnClick;
MOVW	R1, #lo_addr(_ButtonRound11OnClick+0)
MOVT	R1, #hi_addr(_ButtonRound11OnClick+0)
MOVW	R0, #lo_addr(_ButtonRound11+60)
MOVT	R0, #hi_addr(_ButtonRound11+60)
STR	R1, [R0, #0]
;ECGsynthetic_driver.c,3220 :: 		Label25.OwnerScreen     = &Screen6;
MOVW	R1, #lo_addr(_Screen6+0)
MOVT	R1, #hi_addr(_Screen6+0)
MOVW	R0, #lo_addr(_Label25+0)
MOVT	R0, #hi_addr(_Label25+0)
STR	R1, [R0, #0]
;ECGsynthetic_driver.c,3221 :: 		Label25.Order           = 14;
MOVS	R1, #14
MOVW	R0, #lo_addr(_Label25+4)
MOVT	R0, #hi_addr(_Label25+4)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,3222 :: 		Label25.Left            = 43;
MOVS	R1, #43
MOVW	R0, #lo_addr(_Label25+6)
MOVT	R0, #hi_addr(_Label25+6)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,3223 :: 		Label25.Top             = 81;
MOVS	R1, #81
MOVW	R0, #lo_addr(_Label25+8)
MOVT	R0, #hi_addr(_Label25+8)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,3224 :: 		Label25.Width           = 100;
MOVS	R1, #100
MOVW	R0, #lo_addr(_Label25+10)
MOVT	R0, #hi_addr(_Label25+10)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,3225 :: 		Label25.Height          = 21;
MOVS	R1, #21
MOVW	R0, #lo_addr(_Label25+12)
MOVT	R0, #hi_addr(_Label25+12)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,3226 :: 		Label25.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Label25+27)
MOVT	R0, #hi_addr(_Label25+27)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,3227 :: 		Label25.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Label25+28)
MOVT	R0, #hi_addr(_Label25+28)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,3228 :: 		Label25.Caption         = Label25_Caption;
MOVW	R1, #lo_addr(_Label25_Caption+0)
MOVT	R1, #hi_addr(_Label25_Caption+0)
MOVW	R0, #lo_addr(_Label25+16)
MOVT	R0, #hi_addr(_Label25+16)
STR	R1, [R0, #0]
;ECGsynthetic_driver.c,3229 :: 		Label25.FontName        = DejaVu_Serif16x19_Regular;
MOVW	R0, #lo_addr(_Label25+20)
MOVT	R0, #hi_addr(_Label25+20)
STR	R5, [R0, #0]
;ECGsynthetic_driver.c,3230 :: 		Label25.Font_Color      = 0x0000;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label25+24)
MOVT	R0, #hi_addr(_Label25+24)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,3231 :: 		Label25.VerticalText    = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label25+26)
MOVT	R0, #hi_addr(_Label25+26)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,3233 :: 		ButtonRound12.OwnerScreen     = &Screen6;
MOVW	R1, #lo_addr(_Screen6+0)
MOVT	R1, #hi_addr(_Screen6+0)
MOVW	R0, #lo_addr(_ButtonRound12+0)
MOVT	R0, #hi_addr(_ButtonRound12+0)
STR	R1, [R0, #0]
;ECGsynthetic_driver.c,3234 :: 		ButtonRound12.Order           = 15;
MOVS	R1, #15
MOVW	R0, #lo_addr(_ButtonRound12+4)
MOVT	R0, #hi_addr(_ButtonRound12+4)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,3235 :: 		ButtonRound12.Left            = 227;
MOVS	R1, #227
MOVW	R0, #lo_addr(_ButtonRound12+6)
MOVT	R0, #hi_addr(_ButtonRound12+6)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,3236 :: 		ButtonRound12.Top             = 401;
MOVW	R1, #401
MOVW	R0, #lo_addr(_ButtonRound12+8)
MOVT	R0, #hi_addr(_ButtonRound12+8)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,3237 :: 		ButtonRound12.Width           = 109;
MOVS	R1, #109
MOVW	R0, #lo_addr(_ButtonRound12+10)
MOVT	R0, #hi_addr(_ButtonRound12+10)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,3238 :: 		ButtonRound12.Height          = 53;
MOVS	R1, #53
MOVW	R0, #lo_addr(_ButtonRound12+12)
MOVT	R0, #hi_addr(_ButtonRound12+12)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,3239 :: 		ButtonRound12.Pen_Width       = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_ButtonRound12+14)
MOVT	R0, #hi_addr(_ButtonRound12+14)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,3240 :: 		ButtonRound12.Pen_Color       = 0xEB2F;
MOVW	R1, #60207
MOVW	R0, #lo_addr(_ButtonRound12+16)
MOVT	R0, #hi_addr(_ButtonRound12+16)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,3241 :: 		ButtonRound12.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_ButtonRound12+18)
MOVT	R0, #hi_addr(_ButtonRound12+18)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,3242 :: 		ButtonRound12.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_ButtonRound12+19)
MOVT	R0, #hi_addr(_ButtonRound12+19)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,3243 :: 		ButtonRound12.Transparent     = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_ButtonRound12+20)
MOVT	R0, #hi_addr(_ButtonRound12+20)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,3244 :: 		ButtonRound12.Caption         = ButtonRound12_Caption;
MOVW	R1, #lo_addr(_ButtonRound12_Caption+0)
MOVT	R1, #hi_addr(_ButtonRound12_Caption+0)
MOVW	R0, #lo_addr(_ButtonRound12+24)
MOVT	R0, #hi_addr(_ButtonRound12+24)
STR	R1, [R0, #0]
;ECGsynthetic_driver.c,3245 :: 		ButtonRound12.TextAlign       = _taCenter;
MOVS	R1, #1
MOVW	R0, #lo_addr(_ButtonRound12+28)
MOVT	R0, #hi_addr(_ButtonRound12+28)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,3246 :: 		ButtonRound12.TextAlignVertical= _tavMiddle;
MOVS	R1, #1
MOVW	R0, #lo_addr(_ButtonRound12+29)
MOVT	R0, #hi_addr(_ButtonRound12+29)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,3247 :: 		ButtonRound12.FontName        = Tahoma25x25_Bold;
MOVW	R0, #lo_addr(_ButtonRound12+32)
MOVT	R0, #hi_addr(_ButtonRound12+32)
STR	R3, [R0, #0]
;ECGsynthetic_driver.c,3248 :: 		ButtonRound12.PressColEnabled = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_ButtonRound12+49)
MOVT	R0, #hi_addr(_ButtonRound12+49)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,3249 :: 		ButtonRound12.Font_Color      = 0xFFFF;
MOVW	R1, #65535
MOVW	R0, #lo_addr(_ButtonRound12+36)
MOVT	R0, #hi_addr(_ButtonRound12+36)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,3250 :: 		ButtonRound12.VerticalText    = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_ButtonRound12+38)
MOVT	R0, #hi_addr(_ButtonRound12+38)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,3251 :: 		ButtonRound12.Gradient        = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_ButtonRound12+39)
MOVT	R0, #hi_addr(_ButtonRound12+39)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,3252 :: 		ButtonRound12.Gradient_Orientation = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_ButtonRound12+40)
MOVT	R0, #hi_addr(_ButtonRound12+40)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,3253 :: 		ButtonRound12.Gradient_Start_Color = 0xFFFF;
MOVW	R1, #65535
MOVW	R0, #lo_addr(_ButtonRound12+42)
MOVT	R0, #hi_addr(_ButtonRound12+42)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,3254 :: 		ButtonRound12.Gradient_End_Color = 0xC618;
MOVW	R1, #50712
MOVW	R0, #lo_addr(_ButtonRound12+44)
MOVT	R0, #hi_addr(_ButtonRound12+44)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,3255 :: 		ButtonRound12.Color           = 0xEB2F;
MOVW	R1, #60207
MOVW	R0, #lo_addr(_ButtonRound12+46)
MOVT	R0, #hi_addr(_ButtonRound12+46)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,3256 :: 		ButtonRound12.Press_Color     = 0xE71C;
MOVW	R1, #59164
MOVW	R0, #lo_addr(_ButtonRound12+50)
MOVT	R0, #hi_addr(_ButtonRound12+50)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,3257 :: 		ButtonRound12.Corner_Radius   = 3;
MOVS	R1, #3
MOVW	R0, #lo_addr(_ButtonRound12+48)
MOVT	R0, #hi_addr(_ButtonRound12+48)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,3258 :: 		ButtonRound12.OnClickPtr      = ButtonRound12OnClick;
MOVW	R1, #lo_addr(_ButtonRound12OnClick+0)
MOVT	R1, #hi_addr(_ButtonRound12OnClick+0)
MOVW	R0, #lo_addr(_ButtonRound12+60)
MOVT	R0, #hi_addr(_ButtonRound12+60)
STR	R1, [R0, #0]
;ECGsynthetic_driver.c,3260 :: 		Image7.OwnerScreen     = &Screen6;
MOVW	R1, #lo_addr(_Screen6+0)
MOVT	R1, #hi_addr(_Screen6+0)
MOVW	R0, #lo_addr(_Image7+0)
MOVT	R0, #hi_addr(_Image7+0)
STR	R1, [R0, #0]
;ECGsynthetic_driver.c,3261 :: 		Image7.Order           = 16;
MOVS	R1, #16
MOVW	R0, #lo_addr(_Image7+4)
MOVT	R0, #hi_addr(_Image7+4)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,3262 :: 		Image7.Left            = 225;
MOVS	R1, #225
MOVW	R0, #lo_addr(_Image7+6)
MOVT	R0, #hi_addr(_Image7+6)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,3263 :: 		Image7.Top             = 85;
MOVS	R1, #85
MOVW	R0, #lo_addr(_Image7+8)
MOVT	R0, #hi_addr(_Image7+8)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,3264 :: 		Image7.Width           = 517;
MOVW	R1, #517
MOVW	R0, #lo_addr(_Image7+10)
MOVT	R0, #hi_addr(_Image7+10)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,3265 :: 		Image7.Height          = 298;
MOVW	R1, #298
MOVW	R0, #lo_addr(_Image7+12)
MOVT	R0, #hi_addr(_Image7+12)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,3266 :: 		Image7.Picture_Type    = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image7+22)
MOVT	R0, #hi_addr(_Image7+22)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,3267 :: 		Image7.Picture_Ratio   = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image7+23)
MOVT	R0, #hi_addr(_Image7+23)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,3268 :: 		Image7.Picture_Name    = GridLine1_jpg;
MOVW	R0, #lo_addr(_Image7+16)
MOVT	R0, #hi_addr(_Image7+16)
STR	R2, [R0, #0]
;ECGsynthetic_driver.c,3269 :: 		Image7.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image7+20)
MOVT	R0, #hi_addr(_Image7+20)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,3270 :: 		Image7.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image7+21)
MOVT	R0, #hi_addr(_Image7+21)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,3272 :: 		RadioButton61.OwnerScreen     = &Screen7;
MOVW	R1, #lo_addr(_Screen7+0)
MOVT	R1, #hi_addr(_Screen7+0)
MOVW	R0, #lo_addr(_RadioButton61+0)
MOVT	R0, #hi_addr(_RadioButton61+0)
STR	R1, [R0, #0]
;ECGsynthetic_driver.c,3273 :: 		RadioButton61.Order           = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton61+4)
MOVT	R0, #hi_addr(_RadioButton61+4)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,3274 :: 		RadioButton61.Left            = 42;
MOVS	R1, #42
MOVW	R0, #lo_addr(_RadioButton61+6)
MOVT	R0, #hi_addr(_RadioButton61+6)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,3275 :: 		RadioButton61.Top             = 134;
MOVS	R1, #134
MOVW	R0, #lo_addr(_RadioButton61+8)
MOVT	R0, #hi_addr(_RadioButton61+8)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,3276 :: 		RadioButton61.Width           = 41;
MOVS	R1, #41
MOVW	R0, #lo_addr(_RadioButton61+10)
MOVT	R0, #hi_addr(_RadioButton61+10)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,3277 :: 		RadioButton61.Height          = 25;
MOVS	R1, #25
MOVW	R0, #lo_addr(_RadioButton61+12)
MOVT	R0, #hi_addr(_RadioButton61+12)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,3278 :: 		RadioButton61.Pen_Width       = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_RadioButton61+14)
MOVT	R0, #hi_addr(_RadioButton61+14)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,3279 :: 		RadioButton61.Pen_Color       = 0x0000;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton61+16)
MOVT	R0, #hi_addr(_RadioButton61+16)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,3280 :: 		RadioButton61.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_RadioButton61+18)
MOVT	R0, #hi_addr(_RadioButton61+18)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,3281 :: 		RadioButton61.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_RadioButton61+19)
MOVT	R0, #hi_addr(_RadioButton61+19)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,3282 :: 		RadioButton61.Checked         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton61+20)
MOVT	R0, #hi_addr(_RadioButton61+20)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,3283 :: 		RadioButton61.Transparent     = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_RadioButton61+21)
MOVT	R0, #hi_addr(_RadioButton61+21)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,3284 :: 		RadioButton61.Caption         = RadioButton61_Caption;
MOVW	R1, #lo_addr(_RadioButton61_Caption+0)
MOVT	R1, #hi_addr(_RadioButton61_Caption+0)
MOVW	R0, #lo_addr(_RadioButton61+24)
MOVT	R0, #hi_addr(_RadioButton61+24)
STR	R1, [R0, #0]
;ECGsynthetic_driver.c,3285 :: 		RadioButton61.TextAlign       = _taLeft;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton61+28)
MOVT	R0, #hi_addr(_RadioButton61+28)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,3286 :: 		RadioButton61.FontName        = DejaVu_Serif16x19_Regular;
MOVW	R0, #lo_addr(_RadioButton61+32)
MOVT	R0, #hi_addr(_RadioButton61+32)
STR	R5, [R0, #0]
;ECGsynthetic_driver.c,3287 :: 		RadioButton61.PressColEnabled = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_RadioButton61+48)
MOVT	R0, #hi_addr(_RadioButton61+48)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,3288 :: 		RadioButton61.Font_Color      = 0x0000;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton61+36)
MOVT	R0, #hi_addr(_RadioButton61+36)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,3289 :: 		RadioButton61.Gradient        = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton61+38)
MOVT	R0, #hi_addr(_RadioButton61+38)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,3290 :: 		RadioButton61.Gradient_Orientation = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton61+39)
MOVT	R0, #hi_addr(_RadioButton61+39)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,3291 :: 		RadioButton61.Gradient_Start_Color = 0xFFFF;
MOVW	R1, #65535
MOVW	R0, #lo_addr(_RadioButton61+40)
MOVT	R0, #hi_addr(_RadioButton61+40)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,3292 :: 		RadioButton61.Gradient_End_Color = 0xC618;
MOVW	R1, #50712
MOVW	R0, #lo_addr(_RadioButton61+42)
MOVT	R0, #hi_addr(_RadioButton61+42)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,3293 :: 		RadioButton61.Color           = 0xFFFF;
MOVW	R1, #65535
MOVW	R0, #lo_addr(_RadioButton61+44)
MOVT	R0, #hi_addr(_RadioButton61+44)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,3294 :: 		RadioButton61.Press_Color     = 0xC618;
MOVW	R1, #50712
MOVW	R0, #lo_addr(_RadioButton61+50)
MOVT	R0, #hi_addr(_RadioButton61+50)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,3295 :: 		RadioButton61.Background_Color = 0x0000;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton61+46)
MOVT	R0, #hi_addr(_RadioButton61+46)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,3296 :: 		RadioButton61.OnPressPtr      = RadioButton61OnPress;
MOVW	R1, #lo_addr(_RadioButton61OnPress+0)
MOVT	R1, #hi_addr(_RadioButton61OnPress+0)
MOVW	R0, #lo_addr(_RadioButton61+64)
MOVT	R0, #hi_addr(_RadioButton61+64)
STR	R1, [R0, #0]
;ECGsynthetic_driver.c,3298 :: 		RadioButton62.OwnerScreen     = &Screen7;
MOVW	R1, #lo_addr(_Screen7+0)
MOVT	R1, #hi_addr(_Screen7+0)
MOVW	R0, #lo_addr(_RadioButton62+0)
MOVT	R0, #hi_addr(_RadioButton62+0)
STR	R1, [R0, #0]
;ECGsynthetic_driver.c,3299 :: 		RadioButton62.Order           = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_RadioButton62+4)
MOVT	R0, #hi_addr(_RadioButton62+4)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,3300 :: 		RadioButton62.Left            = 42;
MOVS	R1, #42
MOVW	R0, #lo_addr(_RadioButton62+6)
MOVT	R0, #hi_addr(_RadioButton62+6)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,3301 :: 		RadioButton62.Top             = 174;
MOVS	R1, #174
MOVW	R0, #lo_addr(_RadioButton62+8)
MOVT	R0, #hi_addr(_RadioButton62+8)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,3302 :: 		RadioButton62.Width           = 47;
MOVS	R1, #47
MOVW	R0, #lo_addr(_RadioButton62+10)
MOVT	R0, #hi_addr(_RadioButton62+10)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,3303 :: 		RadioButton62.Height          = 25;
MOVS	R1, #25
MOVW	R0, #lo_addr(_RadioButton62+12)
MOVT	R0, #hi_addr(_RadioButton62+12)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,3304 :: 		RadioButton62.Pen_Width       = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_RadioButton62+14)
MOVT	R0, #hi_addr(_RadioButton62+14)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,3305 :: 		RadioButton62.Pen_Color       = 0x0000;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton62+16)
MOVT	R0, #hi_addr(_RadioButton62+16)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,3306 :: 		RadioButton62.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_RadioButton62+18)
MOVT	R0, #hi_addr(_RadioButton62+18)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,3307 :: 		RadioButton62.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_RadioButton62+19)
MOVT	R0, #hi_addr(_RadioButton62+19)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,3308 :: 		RadioButton62.Checked         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton62+20)
MOVT	R0, #hi_addr(_RadioButton62+20)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,3309 :: 		RadioButton62.Transparent     = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_RadioButton62+21)
MOVT	R0, #hi_addr(_RadioButton62+21)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,3310 :: 		RadioButton62.Caption         = RadioButton62_Caption;
MOVW	R1, #lo_addr(_RadioButton62_Caption+0)
MOVT	R1, #hi_addr(_RadioButton62_Caption+0)
MOVW	R0, #lo_addr(_RadioButton62+24)
MOVT	R0, #hi_addr(_RadioButton62+24)
STR	R1, [R0, #0]
;ECGsynthetic_driver.c,3311 :: 		RadioButton62.TextAlign       = _taLeft;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton62+28)
MOVT	R0, #hi_addr(_RadioButton62+28)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,3312 :: 		RadioButton62.FontName        = DejaVu_Serif16x19_Regular;
MOVW	R0, #lo_addr(_RadioButton62+32)
MOVT	R0, #hi_addr(_RadioButton62+32)
STR	R5, [R0, #0]
;ECGsynthetic_driver.c,3313 :: 		RadioButton62.PressColEnabled = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_RadioButton62+48)
MOVT	R0, #hi_addr(_RadioButton62+48)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,3314 :: 		RadioButton62.Font_Color      = 0x0000;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton62+36)
MOVT	R0, #hi_addr(_RadioButton62+36)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,3315 :: 		RadioButton62.Gradient        = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton62+38)
MOVT	R0, #hi_addr(_RadioButton62+38)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,3316 :: 		RadioButton62.Gradient_Orientation = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton62+39)
MOVT	R0, #hi_addr(_RadioButton62+39)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,3317 :: 		RadioButton62.Gradient_Start_Color = 0xFFFF;
MOVW	R1, #65535
MOVW	R0, #lo_addr(_RadioButton62+40)
MOVT	R0, #hi_addr(_RadioButton62+40)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,3318 :: 		RadioButton62.Gradient_End_Color = 0xC618;
MOVW	R1, #50712
MOVW	R0, #lo_addr(_RadioButton62+42)
MOVT	R0, #hi_addr(_RadioButton62+42)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,3319 :: 		RadioButton62.Color           = 0xFFFF;
MOVW	R1, #65535
MOVW	R0, #lo_addr(_RadioButton62+44)
MOVT	R0, #hi_addr(_RadioButton62+44)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,3320 :: 		RadioButton62.Press_Color     = 0xE71C;
MOVW	R1, #59164
MOVW	R0, #lo_addr(_RadioButton62+50)
MOVT	R0, #hi_addr(_RadioButton62+50)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,3321 :: 		RadioButton62.Background_Color = 0x0000;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton62+46)
MOVT	R0, #hi_addr(_RadioButton62+46)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,3322 :: 		RadioButton62.OnPressPtr      = RadioButton62OnPress;
MOVW	R1, #lo_addr(_RadioButton62OnPress+0)
MOVT	R1, #hi_addr(_RadioButton62OnPress+0)
MOVW	R0, #lo_addr(_RadioButton62+64)
MOVT	R0, #hi_addr(_RadioButton62+64)
STR	R1, [R0, #0]
;ECGsynthetic_driver.c,3324 :: 		RadioButton63.OwnerScreen     = &Screen7;
MOVW	R1, #lo_addr(_Screen7+0)
MOVT	R1, #hi_addr(_Screen7+0)
MOVW	R0, #lo_addr(_RadioButton63+0)
MOVT	R0, #hi_addr(_RadioButton63+0)
STR	R1, [R0, #0]
;ECGsynthetic_driver.c,3325 :: 		RadioButton63.Order           = 2;
MOVS	R1, #2
MOVW	R0, #lo_addr(_RadioButton63+4)
MOVT	R0, #hi_addr(_RadioButton63+4)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,3326 :: 		RadioButton63.Left            = 42;
MOVS	R1, #42
MOVW	R0, #lo_addr(_RadioButton63+6)
MOVT	R0, #hi_addr(_RadioButton63+6)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,3327 :: 		RadioButton63.Top             = 214;
MOVS	R1, #214
MOVW	R0, #lo_addr(_RadioButton63+8)
MOVT	R0, #hi_addr(_RadioButton63+8)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,3328 :: 		RadioButton63.Width           = 54;
MOVS	R1, #54
MOVW	R0, #lo_addr(_RadioButton63+10)
MOVT	R0, #hi_addr(_RadioButton63+10)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,3329 :: 		RadioButton63.Height          = 25;
MOVS	R1, #25
MOVW	R0, #lo_addr(_RadioButton63+12)
MOVT	R0, #hi_addr(_RadioButton63+12)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,3330 :: 		RadioButton63.Pen_Width       = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_RadioButton63+14)
MOVT	R0, #hi_addr(_RadioButton63+14)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,3331 :: 		RadioButton63.Pen_Color       = 0x0000;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton63+16)
MOVT	R0, #hi_addr(_RadioButton63+16)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,3332 :: 		RadioButton63.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_RadioButton63+18)
MOVT	R0, #hi_addr(_RadioButton63+18)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,3333 :: 		RadioButton63.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_RadioButton63+19)
MOVT	R0, #hi_addr(_RadioButton63+19)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,3334 :: 		RadioButton63.Checked         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton63+20)
MOVT	R0, #hi_addr(_RadioButton63+20)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,3335 :: 		RadioButton63.Transparent     = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_RadioButton63+21)
MOVT	R0, #hi_addr(_RadioButton63+21)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,3336 :: 		RadioButton63.Caption         = RadioButton63_Caption;
MOVW	R1, #lo_addr(_RadioButton63_Caption+0)
MOVT	R1, #hi_addr(_RadioButton63_Caption+0)
MOVW	R0, #lo_addr(_RadioButton63+24)
MOVT	R0, #hi_addr(_RadioButton63+24)
STR	R1, [R0, #0]
;ECGsynthetic_driver.c,3337 :: 		RadioButton63.TextAlign       = _taLeft;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton63+28)
MOVT	R0, #hi_addr(_RadioButton63+28)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,3338 :: 		RadioButton63.FontName        = DejaVu_Serif16x19_Regular;
MOVW	R0, #lo_addr(_RadioButton63+32)
MOVT	R0, #hi_addr(_RadioButton63+32)
STR	R5, [R0, #0]
;ECGsynthetic_driver.c,3339 :: 		RadioButton63.PressColEnabled = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_RadioButton63+48)
MOVT	R0, #hi_addr(_RadioButton63+48)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,3340 :: 		RadioButton63.Font_Color      = 0x0000;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton63+36)
MOVT	R0, #hi_addr(_RadioButton63+36)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,3341 :: 		RadioButton63.Gradient        = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton63+38)
MOVT	R0, #hi_addr(_RadioButton63+38)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,3342 :: 		RadioButton63.Gradient_Orientation = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton63+39)
MOVT	R0, #hi_addr(_RadioButton63+39)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,3343 :: 		RadioButton63.Gradient_Start_Color = 0xFFFF;
MOVW	R1, #65535
MOVW	R0, #lo_addr(_RadioButton63+40)
MOVT	R0, #hi_addr(_RadioButton63+40)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,3344 :: 		RadioButton63.Gradient_End_Color = 0xC618;
MOVW	R1, #50712
MOVW	R0, #lo_addr(_RadioButton63+42)
MOVT	R0, #hi_addr(_RadioButton63+42)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,3345 :: 		RadioButton63.Color           = 0xFFFF;
MOVW	R1, #65535
MOVW	R0, #lo_addr(_RadioButton63+44)
MOVT	R0, #hi_addr(_RadioButton63+44)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,3346 :: 		RadioButton63.Press_Color     = 0xE71C;
MOVW	R1, #59164
MOVW	R0, #lo_addr(_RadioButton63+50)
MOVT	R0, #hi_addr(_RadioButton63+50)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,3347 :: 		RadioButton63.Background_Color = 0x0000;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton63+46)
MOVT	R0, #hi_addr(_RadioButton63+46)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,3348 :: 		RadioButton63.OnPressPtr      = RadioButton63OnPress;
MOVW	R1, #lo_addr(_RadioButton63OnPress+0)
MOVT	R1, #hi_addr(_RadioButton63OnPress+0)
MOVW	R0, #lo_addr(_RadioButton63+64)
MOVT	R0, #hi_addr(_RadioButton63+64)
STR	R1, [R0, #0]
;ECGsynthetic_driver.c,3350 :: 		RadioButton64.OwnerScreen     = &Screen7;
MOVW	R1, #lo_addr(_Screen7+0)
MOVT	R1, #hi_addr(_Screen7+0)
MOVW	R0, #lo_addr(_RadioButton64+0)
MOVT	R0, #hi_addr(_RadioButton64+0)
STR	R1, [R0, #0]
;ECGsynthetic_driver.c,3351 :: 		RadioButton64.Order           = 3;
MOVS	R1, #3
MOVW	R0, #lo_addr(_RadioButton64+4)
MOVT	R0, #hi_addr(_RadioButton64+4)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,3352 :: 		RadioButton64.Left            = 42;
MOVS	R1, #42
MOVW	R0, #lo_addr(_RadioButton64+6)
MOVT	R0, #hi_addr(_RadioButton64+6)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,3353 :: 		RadioButton64.Top             = 254;
MOVS	R1, #254
MOVW	R0, #lo_addr(_RadioButton64+8)
MOVT	R0, #hi_addr(_RadioButton64+8)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,3354 :: 		RadioButton64.Width           = 68;
MOVS	R1, #68
MOVW	R0, #lo_addr(_RadioButton64+10)
MOVT	R0, #hi_addr(_RadioButton64+10)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,3355 :: 		RadioButton64.Height          = 25;
MOVS	R1, #25
MOVW	R0, #lo_addr(_RadioButton64+12)
MOVT	R0, #hi_addr(_RadioButton64+12)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,3356 :: 		RadioButton64.Pen_Width       = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_RadioButton64+14)
MOVT	R0, #hi_addr(_RadioButton64+14)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,3357 :: 		RadioButton64.Pen_Color       = 0x0000;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton64+16)
MOVT	R0, #hi_addr(_RadioButton64+16)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,3358 :: 		RadioButton64.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_RadioButton64+18)
MOVT	R0, #hi_addr(_RadioButton64+18)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,3359 :: 		RadioButton64.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_RadioButton64+19)
MOVT	R0, #hi_addr(_RadioButton64+19)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,3360 :: 		RadioButton64.Checked         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton64+20)
MOVT	R0, #hi_addr(_RadioButton64+20)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,3361 :: 		RadioButton64.Transparent     = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_RadioButton64+21)
MOVT	R0, #hi_addr(_RadioButton64+21)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,3362 :: 		RadioButton64.Caption         = RadioButton64_Caption;
MOVW	R1, #lo_addr(_RadioButton64_Caption+0)
MOVT	R1, #hi_addr(_RadioButton64_Caption+0)
MOVW	R0, #lo_addr(_RadioButton64+24)
MOVT	R0, #hi_addr(_RadioButton64+24)
STR	R1, [R0, #0]
;ECGsynthetic_driver.c,3363 :: 		RadioButton64.TextAlign       = _taLeft;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton64+28)
MOVT	R0, #hi_addr(_RadioButton64+28)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,3364 :: 		RadioButton64.FontName        = DejaVu_Serif16x19_Regular;
MOVW	R0, #lo_addr(_RadioButton64+32)
MOVT	R0, #hi_addr(_RadioButton64+32)
STR	R5, [R0, #0]
;ECGsynthetic_driver.c,3365 :: 		RadioButton64.PressColEnabled = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_RadioButton64+48)
MOVT	R0, #hi_addr(_RadioButton64+48)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,3366 :: 		RadioButton64.Font_Color      = 0x0000;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton64+36)
MOVT	R0, #hi_addr(_RadioButton64+36)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,3367 :: 		RadioButton64.Gradient        = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton64+38)
MOVT	R0, #hi_addr(_RadioButton64+38)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,3368 :: 		RadioButton64.Gradient_Orientation = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton64+39)
MOVT	R0, #hi_addr(_RadioButton64+39)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,3369 :: 		RadioButton64.Gradient_Start_Color = 0xFFFF;
MOVW	R1, #65535
MOVW	R0, #lo_addr(_RadioButton64+40)
MOVT	R0, #hi_addr(_RadioButton64+40)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,3370 :: 		RadioButton64.Gradient_End_Color = 0xC618;
MOVW	R1, #50712
MOVW	R0, #lo_addr(_RadioButton64+42)
MOVT	R0, #hi_addr(_RadioButton64+42)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,3371 :: 		RadioButton64.Color           = 0xFFFF;
MOVW	R1, #65535
MOVW	R0, #lo_addr(_RadioButton64+44)
MOVT	R0, #hi_addr(_RadioButton64+44)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,3372 :: 		RadioButton64.Press_Color     = 0xE71C;
MOVW	R1, #59164
MOVW	R0, #lo_addr(_RadioButton64+50)
MOVT	R0, #hi_addr(_RadioButton64+50)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,3373 :: 		RadioButton64.Background_Color = 0x0000;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton64+46)
MOVT	R0, #hi_addr(_RadioButton64+46)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,3374 :: 		RadioButton64.OnPressPtr      = RadioButton64OnPress;
MOVW	R1, #lo_addr(_RadioButton64OnPress+0)
MOVT	R1, #hi_addr(_RadioButton64OnPress+0)
MOVW	R0, #lo_addr(_RadioButton64+64)
MOVT	R0, #hi_addr(_RadioButton64+64)
STR	R1, [R0, #0]
;ECGsynthetic_driver.c,3376 :: 		RadioButton65.OwnerScreen     = &Screen7;
MOVW	R1, #lo_addr(_Screen7+0)
MOVT	R1, #hi_addr(_Screen7+0)
MOVW	R0, #lo_addr(_RadioButton65+0)
MOVT	R0, #hi_addr(_RadioButton65+0)
STR	R1, [R0, #0]
;ECGsynthetic_driver.c,3377 :: 		RadioButton65.Order           = 4;
MOVS	R1, #4
MOVW	R0, #lo_addr(_RadioButton65+4)
MOVT	R0, #hi_addr(_RadioButton65+4)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,3378 :: 		RadioButton65.Left            = 42;
MOVS	R1, #42
MOVW	R0, #lo_addr(_RadioButton65+6)
MOVT	R0, #hi_addr(_RadioButton65+6)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,3379 :: 		RadioButton65.Top             = 294;
MOVW	R1, #294
MOVW	R0, #lo_addr(_RadioButton65+8)
MOVT	R0, #hi_addr(_RadioButton65+8)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,3380 :: 		RadioButton65.Width           = 67;
MOVS	R1, #67
MOVW	R0, #lo_addr(_RadioButton65+10)
MOVT	R0, #hi_addr(_RadioButton65+10)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,3381 :: 		RadioButton65.Height          = 25;
MOVS	R1, #25
MOVW	R0, #lo_addr(_RadioButton65+12)
MOVT	R0, #hi_addr(_RadioButton65+12)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,3382 :: 		RadioButton65.Pen_Width       = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_RadioButton65+14)
MOVT	R0, #hi_addr(_RadioButton65+14)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,3383 :: 		RadioButton65.Pen_Color       = 0x0000;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton65+16)
MOVT	R0, #hi_addr(_RadioButton65+16)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,3384 :: 		RadioButton65.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_RadioButton65+18)
MOVT	R0, #hi_addr(_RadioButton65+18)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,3385 :: 		RadioButton65.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_RadioButton65+19)
MOVT	R0, #hi_addr(_RadioButton65+19)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,3386 :: 		RadioButton65.Checked         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton65+20)
MOVT	R0, #hi_addr(_RadioButton65+20)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,3387 :: 		RadioButton65.Transparent     = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_RadioButton65+21)
MOVT	R0, #hi_addr(_RadioButton65+21)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,3388 :: 		RadioButton65.Caption         = RadioButton65_Caption;
MOVW	R1, #lo_addr(_RadioButton65_Caption+0)
MOVT	R1, #hi_addr(_RadioButton65_Caption+0)
MOVW	R0, #lo_addr(_RadioButton65+24)
MOVT	R0, #hi_addr(_RadioButton65+24)
STR	R1, [R0, #0]
;ECGsynthetic_driver.c,3389 :: 		RadioButton65.TextAlign       = _taLeft;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton65+28)
MOVT	R0, #hi_addr(_RadioButton65+28)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,3390 :: 		RadioButton65.FontName        = DejaVu_Serif16x19_Regular;
MOVW	R0, #lo_addr(_RadioButton65+32)
MOVT	R0, #hi_addr(_RadioButton65+32)
STR	R5, [R0, #0]
;ECGsynthetic_driver.c,3391 :: 		RadioButton65.PressColEnabled = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_RadioButton65+48)
MOVT	R0, #hi_addr(_RadioButton65+48)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,3392 :: 		RadioButton65.Font_Color      = 0x0000;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton65+36)
MOVT	R0, #hi_addr(_RadioButton65+36)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,3393 :: 		RadioButton65.Gradient        = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton65+38)
MOVT	R0, #hi_addr(_RadioButton65+38)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,3394 :: 		RadioButton65.Gradient_Orientation = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton65+39)
MOVT	R0, #hi_addr(_RadioButton65+39)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,3395 :: 		RadioButton65.Gradient_Start_Color = 0xFFFF;
MOVW	R1, #65535
MOVW	R0, #lo_addr(_RadioButton65+40)
MOVT	R0, #hi_addr(_RadioButton65+40)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,3396 :: 		RadioButton65.Gradient_End_Color = 0xC618;
MOVW	R1, #50712
MOVW	R0, #lo_addr(_RadioButton65+42)
MOVT	R0, #hi_addr(_RadioButton65+42)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,3397 :: 		RadioButton65.Color           = 0xFFFF;
MOVW	R1, #65535
MOVW	R0, #lo_addr(_RadioButton65+44)
MOVT	R0, #hi_addr(_RadioButton65+44)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,3398 :: 		RadioButton65.Press_Color     = 0xE71C;
MOVW	R1, #59164
MOVW	R0, #lo_addr(_RadioButton65+50)
MOVT	R0, #hi_addr(_RadioButton65+50)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,3399 :: 		RadioButton65.Background_Color = 0x0000;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton65+46)
MOVT	R0, #hi_addr(_RadioButton65+46)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,3400 :: 		RadioButton65.OnPressPtr      = RadioButton65OnPress;
MOVW	R1, #lo_addr(_RadioButton65OnPress+0)
MOVT	R1, #hi_addr(_RadioButton65OnPress+0)
MOVW	R0, #lo_addr(_RadioButton65+64)
MOVT	R0, #hi_addr(_RadioButton65+64)
STR	R1, [R0, #0]
;ECGsynthetic_driver.c,3402 :: 		RadioButton66.OwnerScreen     = &Screen7;
MOVW	R1, #lo_addr(_Screen7+0)
MOVT	R1, #hi_addr(_Screen7+0)
MOVW	R0, #lo_addr(_RadioButton66+0)
MOVT	R0, #hi_addr(_RadioButton66+0)
STR	R1, [R0, #0]
;ECGsynthetic_driver.c,3403 :: 		RadioButton66.Order           = 5;
MOVS	R1, #5
MOVW	R0, #lo_addr(_RadioButton66+4)
MOVT	R0, #hi_addr(_RadioButton66+4)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,3404 :: 		RadioButton66.Left            = 42;
MOVS	R1, #42
MOVW	R0, #lo_addr(_RadioButton66+6)
MOVT	R0, #hi_addr(_RadioButton66+6)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,3405 :: 		RadioButton66.Top             = 335;
MOVW	R1, #335
MOVW	R0, #lo_addr(_RadioButton66+8)
MOVT	R0, #hi_addr(_RadioButton66+8)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,3406 :: 		RadioButton66.Width           = 67;
MOVS	R1, #67
MOVW	R0, #lo_addr(_RadioButton66+10)
MOVT	R0, #hi_addr(_RadioButton66+10)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,3407 :: 		RadioButton66.Height          = 25;
MOVS	R1, #25
MOVW	R0, #lo_addr(_RadioButton66+12)
MOVT	R0, #hi_addr(_RadioButton66+12)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,3408 :: 		RadioButton66.Pen_Width       = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_RadioButton66+14)
MOVT	R0, #hi_addr(_RadioButton66+14)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,3409 :: 		RadioButton66.Pen_Color       = 0x0000;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton66+16)
MOVT	R0, #hi_addr(_RadioButton66+16)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,3410 :: 		RadioButton66.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_RadioButton66+18)
MOVT	R0, #hi_addr(_RadioButton66+18)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,3411 :: 		RadioButton66.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_RadioButton66+19)
MOVT	R0, #hi_addr(_RadioButton66+19)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,3412 :: 		RadioButton66.Checked         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton66+20)
MOVT	R0, #hi_addr(_RadioButton66+20)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,3413 :: 		RadioButton66.Transparent     = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_RadioButton66+21)
MOVT	R0, #hi_addr(_RadioButton66+21)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,3414 :: 		RadioButton66.Caption         = RadioButton66_Caption;
MOVW	R1, #lo_addr(_RadioButton66_Caption+0)
MOVT	R1, #hi_addr(_RadioButton66_Caption+0)
MOVW	R0, #lo_addr(_RadioButton66+24)
MOVT	R0, #hi_addr(_RadioButton66+24)
STR	R1, [R0, #0]
;ECGsynthetic_driver.c,3415 :: 		RadioButton66.TextAlign       = _taLeft;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton66+28)
MOVT	R0, #hi_addr(_RadioButton66+28)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,3416 :: 		RadioButton66.FontName        = DejaVu_Serif16x19_Regular;
MOVW	R0, #lo_addr(_RadioButton66+32)
MOVT	R0, #hi_addr(_RadioButton66+32)
STR	R5, [R0, #0]
;ECGsynthetic_driver.c,3417 :: 		RadioButton66.PressColEnabled = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_RadioButton66+48)
MOVT	R0, #hi_addr(_RadioButton66+48)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,3418 :: 		RadioButton66.Font_Color      = 0x0000;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton66+36)
MOVT	R0, #hi_addr(_RadioButton66+36)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,3419 :: 		RadioButton66.Gradient        = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton66+38)
MOVT	R0, #hi_addr(_RadioButton66+38)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,3420 :: 		RadioButton66.Gradient_Orientation = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton66+39)
MOVT	R0, #hi_addr(_RadioButton66+39)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,3421 :: 		RadioButton66.Gradient_Start_Color = 0xFFFF;
MOVW	R1, #65535
MOVW	R0, #lo_addr(_RadioButton66+40)
MOVT	R0, #hi_addr(_RadioButton66+40)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,3422 :: 		RadioButton66.Gradient_End_Color = 0xC618;
MOVW	R1, #50712
MOVW	R0, #lo_addr(_RadioButton66+42)
MOVT	R0, #hi_addr(_RadioButton66+42)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,3423 :: 		RadioButton66.Color           = 0xFFFF;
MOVW	R1, #65535
MOVW	R0, #lo_addr(_RadioButton66+44)
MOVT	R0, #hi_addr(_RadioButton66+44)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,3424 :: 		RadioButton66.Press_Color     = 0xE71C;
MOVW	R1, #59164
MOVW	R0, #lo_addr(_RadioButton66+50)
MOVT	R0, #hi_addr(_RadioButton66+50)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,3425 :: 		RadioButton66.Background_Color = 0x0000;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton66+46)
MOVT	R0, #hi_addr(_RadioButton66+46)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,3426 :: 		RadioButton66.OnPressPtr      = RadioButton66OnPress;
MOVW	R1, #lo_addr(_RadioButton66OnPress+0)
MOVT	R1, #hi_addr(_RadioButton66OnPress+0)
MOVW	R0, #lo_addr(_RadioButton66+64)
MOVT	R0, #hi_addr(_RadioButton66+64)
STR	R1, [R0, #0]
;ECGsynthetic_driver.c,3428 :: 		RadioButton67.OwnerScreen     = &Screen7;
MOVW	R1, #lo_addr(_Screen7+0)
MOVT	R1, #hi_addr(_Screen7+0)
MOVW	R0, #lo_addr(_RadioButton67+0)
MOVT	R0, #hi_addr(_RadioButton67+0)
STR	R1, [R0, #0]
;ECGsynthetic_driver.c,3429 :: 		RadioButton67.Order           = 6;
MOVS	R1, #6
MOVW	R0, #lo_addr(_RadioButton67+4)
MOVT	R0, #hi_addr(_RadioButton67+4)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,3430 :: 		RadioButton67.Left            = 139;
MOVS	R1, #139
MOVW	R0, #lo_addr(_RadioButton67+6)
MOVT	R0, #hi_addr(_RadioButton67+6)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,3431 :: 		RadioButton67.Top             = 133;
MOVS	R1, #133
MOVW	R0, #lo_addr(_RadioButton67+8)
MOVT	R0, #hi_addr(_RadioButton67+8)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,3432 :: 		RadioButton67.Width           = 57;
MOVS	R1, #57
MOVW	R0, #lo_addr(_RadioButton67+10)
MOVT	R0, #hi_addr(_RadioButton67+10)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,3433 :: 		RadioButton67.Height          = 25;
MOVS	R1, #25
MOVW	R0, #lo_addr(_RadioButton67+12)
MOVT	R0, #hi_addr(_RadioButton67+12)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,3434 :: 		RadioButton67.Pen_Width       = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_RadioButton67+14)
MOVT	R0, #hi_addr(_RadioButton67+14)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,3435 :: 		RadioButton67.Pen_Color       = 0x0000;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton67+16)
MOVT	R0, #hi_addr(_RadioButton67+16)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,3436 :: 		RadioButton67.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_RadioButton67+18)
MOVT	R0, #hi_addr(_RadioButton67+18)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,3437 :: 		RadioButton67.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_RadioButton67+19)
MOVT	R0, #hi_addr(_RadioButton67+19)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,3438 :: 		RadioButton67.Checked         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton67+20)
MOVT	R0, #hi_addr(_RadioButton67+20)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,3439 :: 		RadioButton67.Transparent     = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_RadioButton67+21)
MOVT	R0, #hi_addr(_RadioButton67+21)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,3440 :: 		RadioButton67.Caption         = RadioButton67_Caption;
MOVW	R1, #lo_addr(_RadioButton67_Caption+0)
MOVT	R1, #hi_addr(_RadioButton67_Caption+0)
MOVW	R0, #lo_addr(_RadioButton67+24)
MOVT	R0, #hi_addr(_RadioButton67+24)
STR	R1, [R0, #0]
;ECGsynthetic_driver.c,3441 :: 		RadioButton67.TextAlign       = _taLeft;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton67+28)
MOVT	R0, #hi_addr(_RadioButton67+28)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,3442 :: 		RadioButton67.FontName        = DejaVu_Serif16x19_Regular;
MOVW	R0, #lo_addr(_RadioButton67+32)
MOVT	R0, #hi_addr(_RadioButton67+32)
STR	R5, [R0, #0]
;ECGsynthetic_driver.c,3443 :: 		RadioButton67.PressColEnabled = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_RadioButton67+48)
MOVT	R0, #hi_addr(_RadioButton67+48)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,3444 :: 		RadioButton67.Font_Color      = 0x0000;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton67+36)
MOVT	R0, #hi_addr(_RadioButton67+36)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,3445 :: 		RadioButton67.Gradient        = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton67+38)
MOVT	R0, #hi_addr(_RadioButton67+38)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,3446 :: 		RadioButton67.Gradient_Orientation = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton67+39)
MOVT	R0, #hi_addr(_RadioButton67+39)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,3447 :: 		RadioButton67.Gradient_Start_Color = 0xFFFF;
MOVW	R1, #65535
MOVW	R0, #lo_addr(_RadioButton67+40)
MOVT	R0, #hi_addr(_RadioButton67+40)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,3448 :: 		RadioButton67.Gradient_End_Color = 0xC618;
MOVW	R1, #50712
MOVW	R0, #lo_addr(_RadioButton67+42)
MOVT	R0, #hi_addr(_RadioButton67+42)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,3449 :: 		RadioButton67.Color           = 0xFFFF;
MOVW	R1, #65535
MOVW	R0, #lo_addr(_RadioButton67+44)
MOVT	R0, #hi_addr(_RadioButton67+44)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,3450 :: 		RadioButton67.Press_Color     = 0xE71C;
MOVW	R1, #59164
MOVW	R0, #lo_addr(_RadioButton67+50)
MOVT	R0, #hi_addr(_RadioButton67+50)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,3451 :: 		RadioButton67.Background_Color = 0x0000;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton67+46)
MOVT	R0, #hi_addr(_RadioButton67+46)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,3452 :: 		RadioButton67.OnPressPtr      = RadioButton67OnPress;
MOVW	R1, #lo_addr(_RadioButton67OnPress+0)
MOVT	R1, #hi_addr(_RadioButton67OnPress+0)
MOVW	R0, #lo_addr(_RadioButton67+64)
MOVT	R0, #hi_addr(_RadioButton67+64)
STR	R1, [R0, #0]
;ECGsynthetic_driver.c,3454 :: 		RadioButton68.OwnerScreen     = &Screen7;
MOVW	R1, #lo_addr(_Screen7+0)
MOVT	R1, #hi_addr(_Screen7+0)
MOVW	R0, #lo_addr(_RadioButton68+0)
MOVT	R0, #hi_addr(_RadioButton68+0)
STR	R1, [R0, #0]
;ECGsynthetic_driver.c,3455 :: 		RadioButton68.Order           = 7;
MOVS	R1, #7
MOVW	R0, #lo_addr(_RadioButton68+4)
MOVT	R0, #hi_addr(_RadioButton68+4)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,3456 :: 		RadioButton68.Left            = 139;
MOVS	R1, #139
MOVW	R0, #lo_addr(_RadioButton68+6)
MOVT	R0, #hi_addr(_RadioButton68+6)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,3457 :: 		RadioButton68.Top             = 174;
MOVS	R1, #174
MOVW	R0, #lo_addr(_RadioButton68+8)
MOVT	R0, #hi_addr(_RadioButton68+8)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,3458 :: 		RadioButton68.Width           = 57;
MOVS	R1, #57
MOVW	R0, #lo_addr(_RadioButton68+10)
MOVT	R0, #hi_addr(_RadioButton68+10)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,3459 :: 		RadioButton68.Height          = 25;
MOVS	R1, #25
MOVW	R0, #lo_addr(_RadioButton68+12)
MOVT	R0, #hi_addr(_RadioButton68+12)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,3460 :: 		RadioButton68.Pen_Width       = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_RadioButton68+14)
MOVT	R0, #hi_addr(_RadioButton68+14)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,3461 :: 		RadioButton68.Pen_Color       = 0x0000;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton68+16)
MOVT	R0, #hi_addr(_RadioButton68+16)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,3462 :: 		RadioButton68.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_RadioButton68+18)
MOVT	R0, #hi_addr(_RadioButton68+18)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,3463 :: 		RadioButton68.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_RadioButton68+19)
MOVT	R0, #hi_addr(_RadioButton68+19)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,3464 :: 		RadioButton68.Checked         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton68+20)
MOVT	R0, #hi_addr(_RadioButton68+20)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,3465 :: 		RadioButton68.Transparent     = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_RadioButton68+21)
MOVT	R0, #hi_addr(_RadioButton68+21)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,3466 :: 		RadioButton68.Caption         = RadioButton68_Caption;
MOVW	R1, #lo_addr(_RadioButton68_Caption+0)
MOVT	R1, #hi_addr(_RadioButton68_Caption+0)
MOVW	R0, #lo_addr(_RadioButton68+24)
MOVT	R0, #hi_addr(_RadioButton68+24)
STR	R1, [R0, #0]
;ECGsynthetic_driver.c,3467 :: 		RadioButton68.TextAlign       = _taLeft;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton68+28)
MOVT	R0, #hi_addr(_RadioButton68+28)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,3468 :: 		RadioButton68.FontName        = DejaVu_Serif16x19_Regular;
MOVW	R0, #lo_addr(_RadioButton68+32)
MOVT	R0, #hi_addr(_RadioButton68+32)
STR	R5, [R0, #0]
;ECGsynthetic_driver.c,3469 :: 		RadioButton68.PressColEnabled = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_RadioButton68+48)
MOVT	R0, #hi_addr(_RadioButton68+48)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,3470 :: 		RadioButton68.Font_Color      = 0x0000;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton68+36)
MOVT	R0, #hi_addr(_RadioButton68+36)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,3471 :: 		RadioButton68.Gradient        = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton68+38)
MOVT	R0, #hi_addr(_RadioButton68+38)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,3472 :: 		RadioButton68.Gradient_Orientation = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton68+39)
MOVT	R0, #hi_addr(_RadioButton68+39)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,3473 :: 		RadioButton68.Gradient_Start_Color = 0xFFFF;
MOVW	R1, #65535
MOVW	R0, #lo_addr(_RadioButton68+40)
MOVT	R0, #hi_addr(_RadioButton68+40)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,3474 :: 		RadioButton68.Gradient_End_Color = 0xC618;
MOVW	R1, #50712
MOVW	R0, #lo_addr(_RadioButton68+42)
MOVT	R0, #hi_addr(_RadioButton68+42)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,3475 :: 		RadioButton68.Color           = 0xFFFF;
MOVW	R1, #65535
MOVW	R0, #lo_addr(_RadioButton68+44)
MOVT	R0, #hi_addr(_RadioButton68+44)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,3476 :: 		RadioButton68.Press_Color     = 0xE71C;
MOVW	R1, #59164
MOVW	R0, #lo_addr(_RadioButton68+50)
MOVT	R0, #hi_addr(_RadioButton68+50)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,3477 :: 		RadioButton68.Background_Color = 0x0000;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton68+46)
MOVT	R0, #hi_addr(_RadioButton68+46)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,3478 :: 		RadioButton68.OnPressPtr      = RadioButton68OnPress;
MOVW	R1, #lo_addr(_RadioButton68OnPress+0)
MOVT	R1, #hi_addr(_RadioButton68OnPress+0)
MOVW	R0, #lo_addr(_RadioButton68+64)
MOVT	R0, #hi_addr(_RadioButton68+64)
STR	R1, [R0, #0]
;ECGsynthetic_driver.c,3480 :: 		RadioButton69.OwnerScreen     = &Screen7;
MOVW	R1, #lo_addr(_Screen7+0)
MOVT	R1, #hi_addr(_Screen7+0)
MOVW	R0, #lo_addr(_RadioButton69+0)
MOVT	R0, #hi_addr(_RadioButton69+0)
STR	R1, [R0, #0]
;ECGsynthetic_driver.c,3481 :: 		RadioButton69.Order           = 8;
MOVS	R1, #8
MOVW	R0, #lo_addr(_RadioButton69+4)
MOVT	R0, #hi_addr(_RadioButton69+4)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,3482 :: 		RadioButton69.Left            = 139;
MOVS	R1, #139
MOVW	R0, #lo_addr(_RadioButton69+6)
MOVT	R0, #hi_addr(_RadioButton69+6)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,3483 :: 		RadioButton69.Top             = 214;
MOVS	R1, #214
MOVW	R0, #lo_addr(_RadioButton69+8)
MOVT	R0, #hi_addr(_RadioButton69+8)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,3484 :: 		RadioButton69.Width           = 57;
MOVS	R1, #57
MOVW	R0, #lo_addr(_RadioButton69+10)
MOVT	R0, #hi_addr(_RadioButton69+10)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,3485 :: 		RadioButton69.Height          = 25;
MOVS	R1, #25
MOVW	R0, #lo_addr(_RadioButton69+12)
MOVT	R0, #hi_addr(_RadioButton69+12)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,3486 :: 		RadioButton69.Pen_Width       = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_RadioButton69+14)
MOVT	R0, #hi_addr(_RadioButton69+14)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,3487 :: 		RadioButton69.Pen_Color       = 0x0000;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton69+16)
MOVT	R0, #hi_addr(_RadioButton69+16)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,3488 :: 		RadioButton69.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_RadioButton69+18)
MOVT	R0, #hi_addr(_RadioButton69+18)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,3489 :: 		RadioButton69.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_RadioButton69+19)
MOVT	R0, #hi_addr(_RadioButton69+19)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,3490 :: 		RadioButton69.Checked         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton69+20)
MOVT	R0, #hi_addr(_RadioButton69+20)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,3491 :: 		RadioButton69.Transparent     = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_RadioButton69+21)
MOVT	R0, #hi_addr(_RadioButton69+21)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,3492 :: 		RadioButton69.Caption         = RadioButton69_Caption;
MOVW	R1, #lo_addr(_RadioButton69_Caption+0)
MOVT	R1, #hi_addr(_RadioButton69_Caption+0)
MOVW	R0, #lo_addr(_RadioButton69+24)
MOVT	R0, #hi_addr(_RadioButton69+24)
STR	R1, [R0, #0]
;ECGsynthetic_driver.c,3493 :: 		RadioButton69.TextAlign       = _taLeft;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton69+28)
MOVT	R0, #hi_addr(_RadioButton69+28)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,3494 :: 		RadioButton69.FontName        = DejaVu_Serif16x19_Regular;
MOVW	R0, #lo_addr(_RadioButton69+32)
MOVT	R0, #hi_addr(_RadioButton69+32)
STR	R5, [R0, #0]
;ECGsynthetic_driver.c,3495 :: 		RadioButton69.PressColEnabled = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_RadioButton69+48)
MOVT	R0, #hi_addr(_RadioButton69+48)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,3496 :: 		RadioButton69.Font_Color      = 0x0000;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton69+36)
MOVT	R0, #hi_addr(_RadioButton69+36)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,3497 :: 		RadioButton69.Gradient        = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton69+38)
MOVT	R0, #hi_addr(_RadioButton69+38)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,3498 :: 		RadioButton69.Gradient_Orientation = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton69+39)
MOVT	R0, #hi_addr(_RadioButton69+39)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,3499 :: 		RadioButton69.Gradient_Start_Color = 0xFFFF;
MOVW	R1, #65535
MOVW	R0, #lo_addr(_RadioButton69+40)
MOVT	R0, #hi_addr(_RadioButton69+40)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,3500 :: 		RadioButton69.Gradient_End_Color = 0xC618;
MOVW	R1, #50712
MOVW	R0, #lo_addr(_RadioButton69+42)
MOVT	R0, #hi_addr(_RadioButton69+42)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,3501 :: 		RadioButton69.Color           = 0xFFFF;
MOVW	R1, #65535
MOVW	R0, #lo_addr(_RadioButton69+44)
MOVT	R0, #hi_addr(_RadioButton69+44)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,3502 :: 		RadioButton69.Press_Color     = 0xE71C;
MOVW	R1, #59164
MOVW	R0, #lo_addr(_RadioButton69+50)
MOVT	R0, #hi_addr(_RadioButton69+50)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,3503 :: 		RadioButton69.Background_Color = 0x0000;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton69+46)
MOVT	R0, #hi_addr(_RadioButton69+46)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,3504 :: 		RadioButton69.OnPressPtr      = RadioButton69OnPress;
MOVW	R1, #lo_addr(_RadioButton69OnPress+0)
MOVT	R1, #hi_addr(_RadioButton69OnPress+0)
MOVW	R0, #lo_addr(_RadioButton69+64)
MOVT	R0, #hi_addr(_RadioButton69+64)
STR	R1, [R0, #0]
;ECGsynthetic_driver.c,3506 :: 		RadioButton70.OwnerScreen     = &Screen7;
MOVW	R1, #lo_addr(_Screen7+0)
MOVT	R1, #hi_addr(_Screen7+0)
MOVW	R0, #lo_addr(_RadioButton70+0)
MOVT	R0, #hi_addr(_RadioButton70+0)
STR	R1, [R0, #0]
;ECGsynthetic_driver.c,3507 :: 		RadioButton70.Order           = 9;
MOVS	R1, #9
MOVW	R0, #lo_addr(_RadioButton70+4)
MOVT	R0, #hi_addr(_RadioButton70+4)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,3508 :: 		RadioButton70.Left            = 139;
MOVS	R1, #139
MOVW	R0, #lo_addr(_RadioButton70+6)
MOVT	R0, #hi_addr(_RadioButton70+6)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,3509 :: 		RadioButton70.Top             = 255;
MOVS	R1, #255
MOVW	R0, #lo_addr(_RadioButton70+8)
MOVT	R0, #hi_addr(_RadioButton70+8)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,3510 :: 		RadioButton70.Width           = 57;
MOVS	R1, #57
MOVW	R0, #lo_addr(_RadioButton70+10)
MOVT	R0, #hi_addr(_RadioButton70+10)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,3511 :: 		RadioButton70.Height          = 25;
MOVS	R1, #25
MOVW	R0, #lo_addr(_RadioButton70+12)
MOVT	R0, #hi_addr(_RadioButton70+12)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,3512 :: 		RadioButton70.Pen_Width       = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_RadioButton70+14)
MOVT	R0, #hi_addr(_RadioButton70+14)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,3513 :: 		RadioButton70.Pen_Color       = 0x0000;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton70+16)
MOVT	R0, #hi_addr(_RadioButton70+16)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,3514 :: 		RadioButton70.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_RadioButton70+18)
MOVT	R0, #hi_addr(_RadioButton70+18)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,3515 :: 		RadioButton70.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_RadioButton70+19)
MOVT	R0, #hi_addr(_RadioButton70+19)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,3516 :: 		RadioButton70.Checked         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton70+20)
MOVT	R0, #hi_addr(_RadioButton70+20)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,3517 :: 		RadioButton70.Transparent     = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_RadioButton70+21)
MOVT	R0, #hi_addr(_RadioButton70+21)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,3518 :: 		RadioButton70.Caption         = RadioButton70_Caption;
MOVW	R1, #lo_addr(_RadioButton70_Caption+0)
MOVT	R1, #hi_addr(_RadioButton70_Caption+0)
MOVW	R0, #lo_addr(_RadioButton70+24)
MOVT	R0, #hi_addr(_RadioButton70+24)
STR	R1, [R0, #0]
;ECGsynthetic_driver.c,3519 :: 		RadioButton70.TextAlign       = _taLeft;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton70+28)
MOVT	R0, #hi_addr(_RadioButton70+28)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,3520 :: 		RadioButton70.FontName        = DejaVu_Serif16x19_Regular;
MOVW	R0, #lo_addr(_RadioButton70+32)
MOVT	R0, #hi_addr(_RadioButton70+32)
STR	R5, [R0, #0]
;ECGsynthetic_driver.c,3521 :: 		RadioButton70.PressColEnabled = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_RadioButton70+48)
MOVT	R0, #hi_addr(_RadioButton70+48)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,3522 :: 		RadioButton70.Font_Color      = 0x0000;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton70+36)
MOVT	R0, #hi_addr(_RadioButton70+36)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,3523 :: 		RadioButton70.Gradient        = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton70+38)
MOVT	R0, #hi_addr(_RadioButton70+38)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,3524 :: 		RadioButton70.Gradient_Orientation = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton70+39)
MOVT	R0, #hi_addr(_RadioButton70+39)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,3525 :: 		RadioButton70.Gradient_Start_Color = 0xFFFF;
MOVW	R1, #65535
MOVW	R0, #lo_addr(_RadioButton70+40)
MOVT	R0, #hi_addr(_RadioButton70+40)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,3526 :: 		RadioButton70.Gradient_End_Color = 0xC618;
MOVW	R1, #50712
MOVW	R0, #lo_addr(_RadioButton70+42)
MOVT	R0, #hi_addr(_RadioButton70+42)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,3527 :: 		RadioButton70.Color           = 0xFFFF;
MOVW	R1, #65535
MOVW	R0, #lo_addr(_RadioButton70+44)
MOVT	R0, #hi_addr(_RadioButton70+44)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,3528 :: 		RadioButton70.Press_Color     = 0xE71C;
MOVW	R1, #59164
MOVW	R0, #lo_addr(_RadioButton70+50)
MOVT	R0, #hi_addr(_RadioButton70+50)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,3529 :: 		RadioButton70.Background_Color = 0x0000;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton70+46)
MOVT	R0, #hi_addr(_RadioButton70+46)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,3530 :: 		RadioButton70.OnPressPtr      = RadioButton70OnPress;
MOVW	R1, #lo_addr(_RadioButton70OnPress+0)
MOVT	R1, #hi_addr(_RadioButton70OnPress+0)
MOVW	R0, #lo_addr(_RadioButton70+64)
MOVT	R0, #hi_addr(_RadioButton70+64)
STR	R1, [R0, #0]
;ECGsynthetic_driver.c,3532 :: 		RadioButton71.OwnerScreen     = &Screen7;
MOVW	R1, #lo_addr(_Screen7+0)
MOVT	R1, #hi_addr(_Screen7+0)
MOVW	R0, #lo_addr(_RadioButton71+0)
MOVT	R0, #hi_addr(_RadioButton71+0)
STR	R1, [R0, #0]
;ECGsynthetic_driver.c,3533 :: 		RadioButton71.Order           = 10;
MOVS	R1, #10
MOVW	R0, #lo_addr(_RadioButton71+4)
MOVT	R0, #hi_addr(_RadioButton71+4)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,3534 :: 		RadioButton71.Left            = 139;
MOVS	R1, #139
MOVW	R0, #lo_addr(_RadioButton71+6)
MOVT	R0, #hi_addr(_RadioButton71+6)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,3535 :: 		RadioButton71.Top             = 294;
MOVW	R1, #294
MOVW	R0, #lo_addr(_RadioButton71+8)
MOVT	R0, #hi_addr(_RadioButton71+8)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,3536 :: 		RadioButton71.Width           = 57;
MOVS	R1, #57
MOVW	R0, #lo_addr(_RadioButton71+10)
MOVT	R0, #hi_addr(_RadioButton71+10)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,3537 :: 		RadioButton71.Height          = 25;
MOVS	R1, #25
MOVW	R0, #lo_addr(_RadioButton71+12)
MOVT	R0, #hi_addr(_RadioButton71+12)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,3538 :: 		RadioButton71.Pen_Width       = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_RadioButton71+14)
MOVT	R0, #hi_addr(_RadioButton71+14)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,3539 :: 		RadioButton71.Pen_Color       = 0x0000;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton71+16)
MOVT	R0, #hi_addr(_RadioButton71+16)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,3540 :: 		RadioButton71.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_RadioButton71+18)
MOVT	R0, #hi_addr(_RadioButton71+18)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,3541 :: 		RadioButton71.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_RadioButton71+19)
MOVT	R0, #hi_addr(_RadioButton71+19)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,3542 :: 		RadioButton71.Checked         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton71+20)
MOVT	R0, #hi_addr(_RadioButton71+20)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,3543 :: 		RadioButton71.Transparent     = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_RadioButton71+21)
MOVT	R0, #hi_addr(_RadioButton71+21)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,3544 :: 		RadioButton71.Caption         = RadioButton71_Caption;
MOVW	R1, #lo_addr(_RadioButton71_Caption+0)
MOVT	R1, #hi_addr(_RadioButton71_Caption+0)
MOVW	R0, #lo_addr(_RadioButton71+24)
MOVT	R0, #hi_addr(_RadioButton71+24)
STR	R1, [R0, #0]
;ECGsynthetic_driver.c,3545 :: 		RadioButton71.TextAlign       = _taLeft;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton71+28)
MOVT	R0, #hi_addr(_RadioButton71+28)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,3546 :: 		RadioButton71.FontName        = DejaVu_Serif16x19_Regular;
MOVW	R0, #lo_addr(_RadioButton71+32)
MOVT	R0, #hi_addr(_RadioButton71+32)
STR	R5, [R0, #0]
;ECGsynthetic_driver.c,3547 :: 		RadioButton71.PressColEnabled = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_RadioButton71+48)
MOVT	R0, #hi_addr(_RadioButton71+48)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,3548 :: 		RadioButton71.Font_Color      = 0x0000;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton71+36)
MOVT	R0, #hi_addr(_RadioButton71+36)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,3549 :: 		RadioButton71.Gradient        = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton71+38)
MOVT	R0, #hi_addr(_RadioButton71+38)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,3550 :: 		RadioButton71.Gradient_Orientation = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton71+39)
MOVT	R0, #hi_addr(_RadioButton71+39)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,3551 :: 		RadioButton71.Gradient_Start_Color = 0xFFFF;
MOVW	R1, #65535
MOVW	R0, #lo_addr(_RadioButton71+40)
MOVT	R0, #hi_addr(_RadioButton71+40)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,3552 :: 		RadioButton71.Gradient_End_Color = 0xC618;
MOVW	R1, #50712
MOVW	R0, #lo_addr(_RadioButton71+42)
MOVT	R0, #hi_addr(_RadioButton71+42)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,3553 :: 		RadioButton71.Color           = 0xFFFF;
MOVW	R1, #65535
MOVW	R0, #lo_addr(_RadioButton71+44)
MOVT	R0, #hi_addr(_RadioButton71+44)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,3554 :: 		RadioButton71.Press_Color     = 0xE71C;
MOVW	R1, #59164
MOVW	R0, #lo_addr(_RadioButton71+50)
MOVT	R0, #hi_addr(_RadioButton71+50)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,3555 :: 		RadioButton71.Background_Color = 0x0000;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton71+46)
MOVT	R0, #hi_addr(_RadioButton71+46)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,3556 :: 		RadioButton71.OnPressPtr      = RadioButton71OnPress;
MOVW	R1, #lo_addr(_RadioButton71OnPress+0)
MOVT	R1, #hi_addr(_RadioButton71OnPress+0)
MOVW	R0, #lo_addr(_RadioButton71+64)
MOVT	R0, #hi_addr(_RadioButton71+64)
STR	R1, [R0, #0]
;ECGsynthetic_driver.c,3558 :: 		RadioButton72.OwnerScreen     = &Screen7;
MOVW	R1, #lo_addr(_Screen7+0)
MOVT	R1, #hi_addr(_Screen7+0)
MOVW	R0, #lo_addr(_RadioButton72+0)
MOVT	R0, #hi_addr(_RadioButton72+0)
STR	R1, [R0, #0]
;ECGsynthetic_driver.c,3559 :: 		RadioButton72.Order           = 11;
MOVS	R1, #11
MOVW	R0, #lo_addr(_RadioButton72+4)
MOVT	R0, #hi_addr(_RadioButton72+4)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,3560 :: 		RadioButton72.Left            = 139;
MOVS	R1, #139
MOVW	R0, #lo_addr(_RadioButton72+6)
MOVT	R0, #hi_addr(_RadioButton72+6)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,3561 :: 		RadioButton72.Top             = 335;
MOVW	R1, #335
MOVW	R0, #lo_addr(_RadioButton72+8)
MOVT	R0, #hi_addr(_RadioButton72+8)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,3562 :: 		RadioButton72.Width           = 57;
MOVS	R1, #57
MOVW	R0, #lo_addr(_RadioButton72+10)
MOVT	R0, #hi_addr(_RadioButton72+10)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,3563 :: 		RadioButton72.Height          = 25;
MOVS	R1, #25
MOVW	R0, #lo_addr(_RadioButton72+12)
MOVT	R0, #hi_addr(_RadioButton72+12)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,3564 :: 		RadioButton72.Pen_Width       = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_RadioButton72+14)
MOVT	R0, #hi_addr(_RadioButton72+14)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,3565 :: 		RadioButton72.Pen_Color       = 0x0000;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton72+16)
MOVT	R0, #hi_addr(_RadioButton72+16)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,3566 :: 		RadioButton72.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_RadioButton72+18)
MOVT	R0, #hi_addr(_RadioButton72+18)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,3567 :: 		RadioButton72.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_RadioButton72+19)
MOVT	R0, #hi_addr(_RadioButton72+19)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,3568 :: 		RadioButton72.Checked         = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton72+20)
MOVT	R0, #hi_addr(_RadioButton72+20)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,3569 :: 		RadioButton72.Transparent     = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_RadioButton72+21)
MOVT	R0, #hi_addr(_RadioButton72+21)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,3570 :: 		RadioButton72.Caption         = RadioButton72_Caption;
MOVW	R1, #lo_addr(_RadioButton72_Caption+0)
MOVT	R1, #hi_addr(_RadioButton72_Caption+0)
MOVW	R0, #lo_addr(_RadioButton72+24)
MOVT	R0, #hi_addr(_RadioButton72+24)
STR	R1, [R0, #0]
;ECGsynthetic_driver.c,3571 :: 		RadioButton72.TextAlign       = _taLeft;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton72+28)
MOVT	R0, #hi_addr(_RadioButton72+28)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,3572 :: 		RadioButton72.FontName        = DejaVu_Serif16x19_Regular;
MOVW	R0, #lo_addr(_RadioButton72+32)
MOVT	R0, #hi_addr(_RadioButton72+32)
STR	R5, [R0, #0]
;ECGsynthetic_driver.c,3573 :: 		RadioButton72.PressColEnabled = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_RadioButton72+48)
MOVT	R0, #hi_addr(_RadioButton72+48)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,3574 :: 		RadioButton72.Font_Color      = 0x0000;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton72+36)
MOVT	R0, #hi_addr(_RadioButton72+36)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,3575 :: 		RadioButton72.Gradient        = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton72+38)
MOVT	R0, #hi_addr(_RadioButton72+38)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,3576 :: 		RadioButton72.Gradient_Orientation = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton72+39)
MOVT	R0, #hi_addr(_RadioButton72+39)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,3577 :: 		RadioButton72.Gradient_Start_Color = 0xFFFF;
MOVW	R1, #65535
MOVW	R0, #lo_addr(_RadioButton72+40)
MOVT	R0, #hi_addr(_RadioButton72+40)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,3578 :: 		RadioButton72.Gradient_End_Color = 0xC618;
MOVW	R1, #50712
MOVW	R0, #lo_addr(_RadioButton72+42)
MOVT	R0, #hi_addr(_RadioButton72+42)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,3579 :: 		RadioButton72.Color           = 0xFFFF;
MOVW	R1, #65535
MOVW	R0, #lo_addr(_RadioButton72+44)
MOVT	R0, #hi_addr(_RadioButton72+44)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,3580 :: 		RadioButton72.Press_Color     = 0xE71C;
MOVW	R1, #59164
MOVW	R0, #lo_addr(_RadioButton72+50)
MOVT	R0, #hi_addr(_RadioButton72+50)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,3581 :: 		RadioButton72.Background_Color = 0x0000;
MOVS	R1, #0
MOVW	R0, #lo_addr(_RadioButton72+46)
MOVT	R0, #hi_addr(_RadioButton72+46)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,3582 :: 		RadioButton72.OnPressPtr      = RadioButton72OnPress;
MOVW	R1, #lo_addr(_RadioButton72OnPress+0)
MOVT	R1, #hi_addr(_RadioButton72OnPress+0)
MOVW	R0, #lo_addr(_RadioButton72+64)
MOVT	R0, #hi_addr(_RadioButton72+64)
STR	R1, [R0, #0]
;ECGsynthetic_driver.c,3584 :: 		Label26.OwnerScreen     = &Screen7;
MOVW	R1, #lo_addr(_Screen7+0)
MOVT	R1, #hi_addr(_Screen7+0)
MOVW	R0, #lo_addr(_Label26+0)
MOVT	R0, #hi_addr(_Label26+0)
STR	R1, [R0, #0]
;ECGsynthetic_driver.c,3585 :: 		Label26.Order           = 12;
MOVS	R1, #12
MOVW	R0, #lo_addr(_Label26+4)
MOVT	R0, #hi_addr(_Label26+4)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,3586 :: 		Label26.Left            = 403;
MOVW	R1, #403
MOVW	R0, #lo_addr(_Label26+6)
MOVT	R0, #hi_addr(_Label26+6)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,3587 :: 		Label26.Top             = 38;
MOVS	R1, #38
MOVW	R0, #lo_addr(_Label26+8)
MOVT	R0, #hi_addr(_Label26+8)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,3588 :: 		Label26.Width           = 177;
MOVS	R1, #177
MOVW	R0, #lo_addr(_Label26+10)
MOVT	R0, #hi_addr(_Label26+10)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,3589 :: 		Label26.Height          = 26;
MOVS	R1, #26
MOVW	R0, #lo_addr(_Label26+12)
MOVT	R0, #hi_addr(_Label26+12)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,3590 :: 		Label26.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Label26+27)
MOVT	R0, #hi_addr(_Label26+27)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,3591 :: 		Label26.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Label26+28)
MOVT	R0, #hi_addr(_Label26+28)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,3592 :: 		Label26.Caption         = Label26_Caption;
MOVW	R1, #lo_addr(_Label26_Caption+0)
MOVT	R1, #hi_addr(_Label26_Caption+0)
MOVW	R0, #lo_addr(_Label26+16)
MOVT	R0, #hi_addr(_Label26+16)
STR	R1, [R0, #0]
;ECGsynthetic_driver.c,3593 :: 		Label26.FontName        = DejaVu_Serif22x24_Bold;
MOVW	R0, #lo_addr(_Label26+20)
MOVT	R0, #hi_addr(_Label26+20)
STR	R4, [R0, #0]
;ECGsynthetic_driver.c,3594 :: 		Label26.Font_Color      = 0x0000;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label26+24)
MOVT	R0, #hi_addr(_Label26+24)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,3595 :: 		Label26.VerticalText    = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label26+26)
MOVT	R0, #hi_addr(_Label26+26)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,3597 :: 		ButtonRound13.OwnerScreen     = &Screen7;
MOVW	R1, #lo_addr(_Screen7+0)
MOVT	R1, #hi_addr(_Screen7+0)
MOVW	R0, #lo_addr(_ButtonRound13+0)
MOVT	R0, #hi_addr(_ButtonRound13+0)
STR	R1, [R0, #0]
;ECGsynthetic_driver.c,3598 :: 		ButtonRound13.Order           = 13;
MOVS	R1, #13
MOVW	R0, #lo_addr(_ButtonRound13+4)
MOVT	R0, #hi_addr(_ButtonRound13+4)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,3599 :: 		ButtonRound13.Left            = 631;
MOVW	R1, #631
MOVW	R0, #lo_addr(_ButtonRound13+6)
MOVT	R0, #hi_addr(_ButtonRound13+6)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,3600 :: 		ButtonRound13.Top             = 402;
MOVW	R1, #402
MOVW	R0, #lo_addr(_ButtonRound13+8)
MOVT	R0, #hi_addr(_ButtonRound13+8)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,3601 :: 		ButtonRound13.Width           = 109;
MOVS	R1, #109
MOVW	R0, #lo_addr(_ButtonRound13+10)
MOVT	R0, #hi_addr(_ButtonRound13+10)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,3602 :: 		ButtonRound13.Height          = 53;
MOVS	R1, #53
MOVW	R0, #lo_addr(_ButtonRound13+12)
MOVT	R0, #hi_addr(_ButtonRound13+12)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,3603 :: 		ButtonRound13.Pen_Width       = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_ButtonRound13+14)
MOVT	R0, #hi_addr(_ButtonRound13+14)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,3604 :: 		ButtonRound13.Pen_Color       = 0x07E0;
MOVW	R1, #2016
MOVW	R0, #lo_addr(_ButtonRound13+16)
MOVT	R0, #hi_addr(_ButtonRound13+16)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,3605 :: 		ButtonRound13.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_ButtonRound13+18)
MOVT	R0, #hi_addr(_ButtonRound13+18)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,3606 :: 		ButtonRound13.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_ButtonRound13+19)
MOVT	R0, #hi_addr(_ButtonRound13+19)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,3607 :: 		ButtonRound13.Transparent     = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_ButtonRound13+20)
MOVT	R0, #hi_addr(_ButtonRound13+20)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,3608 :: 		ButtonRound13.Caption         = ButtonRound13_Caption;
MOVW	R1, #lo_addr(_ButtonRound13_Caption+0)
MOVT	R1, #hi_addr(_ButtonRound13_Caption+0)
MOVW	R0, #lo_addr(_ButtonRound13+24)
MOVT	R0, #hi_addr(_ButtonRound13+24)
STR	R1, [R0, #0]
;ECGsynthetic_driver.c,3609 :: 		ButtonRound13.TextAlign       = _taCenter;
MOVS	R1, #1
MOVW	R0, #lo_addr(_ButtonRound13+28)
MOVT	R0, #hi_addr(_ButtonRound13+28)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,3610 :: 		ButtonRound13.TextAlignVertical= _tavMiddle;
MOVS	R1, #1
MOVW	R0, #lo_addr(_ButtonRound13+29)
MOVT	R0, #hi_addr(_ButtonRound13+29)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,3611 :: 		ButtonRound13.FontName        = Tahoma25x25_Bold;
MOVW	R0, #lo_addr(_ButtonRound13+32)
MOVT	R0, #hi_addr(_ButtonRound13+32)
STR	R3, [R0, #0]
;ECGsynthetic_driver.c,3612 :: 		ButtonRound13.PressColEnabled = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_ButtonRound13+49)
MOVT	R0, #hi_addr(_ButtonRound13+49)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,3613 :: 		ButtonRound13.Font_Color      = 0xFFFF;
MOVW	R1, #65535
MOVW	R0, #lo_addr(_ButtonRound13+36)
MOVT	R0, #hi_addr(_ButtonRound13+36)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,3614 :: 		ButtonRound13.VerticalText    = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_ButtonRound13+38)
MOVT	R0, #hi_addr(_ButtonRound13+38)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,3615 :: 		ButtonRound13.Gradient        = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_ButtonRound13+39)
MOVT	R0, #hi_addr(_ButtonRound13+39)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,3616 :: 		ButtonRound13.Gradient_Orientation = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_ButtonRound13+40)
MOVT	R0, #hi_addr(_ButtonRound13+40)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,3617 :: 		ButtonRound13.Gradient_Start_Color = 0xFFFF;
MOVW	R1, #65535
MOVW	R0, #lo_addr(_ButtonRound13+42)
MOVT	R0, #hi_addr(_ButtonRound13+42)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,3618 :: 		ButtonRound13.Gradient_End_Color = 0xC618;
MOVW	R1, #50712
MOVW	R0, #lo_addr(_ButtonRound13+44)
MOVT	R0, #hi_addr(_ButtonRound13+44)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,3619 :: 		ButtonRound13.Color           = 0x07E0;
MOVW	R1, #2016
MOVW	R0, #lo_addr(_ButtonRound13+46)
MOVT	R0, #hi_addr(_ButtonRound13+46)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,3620 :: 		ButtonRound13.Press_Color     = 0xE71C;
MOVW	R1, #59164
MOVW	R0, #lo_addr(_ButtonRound13+50)
MOVT	R0, #hi_addr(_ButtonRound13+50)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,3621 :: 		ButtonRound13.Corner_Radius   = 3;
MOVS	R1, #3
MOVW	R0, #lo_addr(_ButtonRound13+48)
MOVT	R0, #hi_addr(_ButtonRound13+48)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,3622 :: 		ButtonRound13.OnClickPtr      = ButtonRound13OnClick;
MOVW	R1, #lo_addr(_ButtonRound13OnClick+0)
MOVT	R1, #hi_addr(_ButtonRound13OnClick+0)
MOVW	R0, #lo_addr(_ButtonRound13+60)
MOVT	R0, #hi_addr(_ButtonRound13+60)
STR	R1, [R0, #0]
;ECGsynthetic_driver.c,3624 :: 		Label27.OwnerScreen     = &Screen7;
MOVW	R1, #lo_addr(_Screen7+0)
MOVT	R1, #hi_addr(_Screen7+0)
MOVW	R0, #lo_addr(_Label27+0)
MOVT	R0, #hi_addr(_Label27+0)
STR	R1, [R0, #0]
;ECGsynthetic_driver.c,3625 :: 		Label27.Order           = 14;
MOVS	R1, #14
MOVW	R0, #lo_addr(_Label27+4)
MOVT	R0, #hi_addr(_Label27+4)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,3626 :: 		Label27.Left            = 43;
MOVS	R1, #43
MOVW	R0, #lo_addr(_Label27+6)
MOVT	R0, #hi_addr(_Label27+6)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,3627 :: 		Label27.Top             = 81;
MOVS	R1, #81
MOVW	R0, #lo_addr(_Label27+8)
MOVT	R0, #hi_addr(_Label27+8)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,3628 :: 		Label27.Width           = 100;
MOVS	R1, #100
MOVW	R0, #lo_addr(_Label27+10)
MOVT	R0, #hi_addr(_Label27+10)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,3629 :: 		Label27.Height          = 21;
MOVS	R1, #21
MOVW	R0, #lo_addr(_Label27+12)
MOVT	R0, #hi_addr(_Label27+12)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,3630 :: 		Label27.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Label27+27)
MOVT	R0, #hi_addr(_Label27+27)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,3631 :: 		Label27.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Label27+28)
MOVT	R0, #hi_addr(_Label27+28)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,3632 :: 		Label27.Caption         = Label27_Caption;
MOVW	R1, #lo_addr(_Label27_Caption+0)
MOVT	R1, #hi_addr(_Label27_Caption+0)
MOVW	R0, #lo_addr(_Label27+16)
MOVT	R0, #hi_addr(_Label27+16)
STR	R1, [R0, #0]
;ECGsynthetic_driver.c,3633 :: 		Label27.FontName        = DejaVu_Serif16x19_Regular;
MOVW	R0, #lo_addr(_Label27+20)
MOVT	R0, #hi_addr(_Label27+20)
STR	R5, [R0, #0]
;ECGsynthetic_driver.c,3634 :: 		Label27.Font_Color      = 0x0000;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label27+24)
MOVT	R0, #hi_addr(_Label27+24)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,3635 :: 		Label27.VerticalText    = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label27+26)
MOVT	R0, #hi_addr(_Label27+26)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,3637 :: 		ButtonRound14.OwnerScreen     = &Screen7;
MOVW	R1, #lo_addr(_Screen7+0)
MOVT	R1, #hi_addr(_Screen7+0)
MOVW	R0, #lo_addr(_ButtonRound14+0)
MOVT	R0, #hi_addr(_ButtonRound14+0)
STR	R1, [R0, #0]
;ECGsynthetic_driver.c,3638 :: 		ButtonRound14.Order           = 15;
MOVS	R1, #15
MOVW	R0, #lo_addr(_ButtonRound14+4)
MOVT	R0, #hi_addr(_ButtonRound14+4)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,3639 :: 		ButtonRound14.Left            = 227;
MOVS	R1, #227
MOVW	R0, #lo_addr(_ButtonRound14+6)
MOVT	R0, #hi_addr(_ButtonRound14+6)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,3640 :: 		ButtonRound14.Top             = 401;
MOVW	R1, #401
MOVW	R0, #lo_addr(_ButtonRound14+8)
MOVT	R0, #hi_addr(_ButtonRound14+8)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,3641 :: 		ButtonRound14.Width           = 109;
MOVS	R1, #109
MOVW	R0, #lo_addr(_ButtonRound14+10)
MOVT	R0, #hi_addr(_ButtonRound14+10)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,3642 :: 		ButtonRound14.Height          = 53;
MOVS	R1, #53
MOVW	R0, #lo_addr(_ButtonRound14+12)
MOVT	R0, #hi_addr(_ButtonRound14+12)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,3643 :: 		ButtonRound14.Pen_Width       = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_ButtonRound14+14)
MOVT	R0, #hi_addr(_ButtonRound14+14)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,3644 :: 		ButtonRound14.Pen_Color       = 0xEB2F;
MOVW	R1, #60207
MOVW	R0, #lo_addr(_ButtonRound14+16)
MOVT	R0, #hi_addr(_ButtonRound14+16)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,3645 :: 		ButtonRound14.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_ButtonRound14+18)
MOVT	R0, #hi_addr(_ButtonRound14+18)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,3646 :: 		ButtonRound14.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_ButtonRound14+19)
MOVT	R0, #hi_addr(_ButtonRound14+19)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,3647 :: 		ButtonRound14.Transparent     = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_ButtonRound14+20)
MOVT	R0, #hi_addr(_ButtonRound14+20)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,3648 :: 		ButtonRound14.Caption         = ButtonRound14_Caption;
MOVW	R1, #lo_addr(_ButtonRound14_Caption+0)
MOVT	R1, #hi_addr(_ButtonRound14_Caption+0)
MOVW	R0, #lo_addr(_ButtonRound14+24)
MOVT	R0, #hi_addr(_ButtonRound14+24)
STR	R1, [R0, #0]
;ECGsynthetic_driver.c,3649 :: 		ButtonRound14.TextAlign       = _taCenter;
MOVS	R1, #1
MOVW	R0, #lo_addr(_ButtonRound14+28)
MOVT	R0, #hi_addr(_ButtonRound14+28)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,3650 :: 		ButtonRound14.TextAlignVertical= _tavMiddle;
MOVS	R1, #1
MOVW	R0, #lo_addr(_ButtonRound14+29)
MOVT	R0, #hi_addr(_ButtonRound14+29)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,3651 :: 		ButtonRound14.FontName        = Tahoma25x25_Bold;
MOVW	R0, #lo_addr(_ButtonRound14+32)
MOVT	R0, #hi_addr(_ButtonRound14+32)
STR	R3, [R0, #0]
;ECGsynthetic_driver.c,3652 :: 		ButtonRound14.PressColEnabled = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_ButtonRound14+49)
MOVT	R0, #hi_addr(_ButtonRound14+49)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,3653 :: 		ButtonRound14.Font_Color      = 0xFFFF;
MOVW	R1, #65535
MOVW	R0, #lo_addr(_ButtonRound14+36)
MOVT	R0, #hi_addr(_ButtonRound14+36)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,3654 :: 		ButtonRound14.VerticalText    = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_ButtonRound14+38)
MOVT	R0, #hi_addr(_ButtonRound14+38)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,3655 :: 		ButtonRound14.Gradient        = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_ButtonRound14+39)
MOVT	R0, #hi_addr(_ButtonRound14+39)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,3656 :: 		ButtonRound14.Gradient_Orientation = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_ButtonRound14+40)
MOVT	R0, #hi_addr(_ButtonRound14+40)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,3657 :: 		ButtonRound14.Gradient_Start_Color = 0xFFFF;
MOVW	R1, #65535
MOVW	R0, #lo_addr(_ButtonRound14+42)
MOVT	R0, #hi_addr(_ButtonRound14+42)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,3658 :: 		ButtonRound14.Gradient_End_Color = 0xC618;
MOVW	R1, #50712
MOVW	R0, #lo_addr(_ButtonRound14+44)
MOVT	R0, #hi_addr(_ButtonRound14+44)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,3659 :: 		ButtonRound14.Color           = 0xEB2F;
MOVW	R1, #60207
MOVW	R0, #lo_addr(_ButtonRound14+46)
MOVT	R0, #hi_addr(_ButtonRound14+46)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,3660 :: 		ButtonRound14.Press_Color     = 0xE71C;
MOVW	R1, #59164
MOVW	R0, #lo_addr(_ButtonRound14+50)
MOVT	R0, #hi_addr(_ButtonRound14+50)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,3661 :: 		ButtonRound14.Corner_Radius   = 3;
MOVS	R1, #3
MOVW	R0, #lo_addr(_ButtonRound14+48)
MOVT	R0, #hi_addr(_ButtonRound14+48)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,3662 :: 		ButtonRound14.OnClickPtr      = ButtonRound14OnClick;
MOVW	R1, #lo_addr(_ButtonRound14OnClick+0)
MOVT	R1, #hi_addr(_ButtonRound14OnClick+0)
MOVW	R0, #lo_addr(_ButtonRound14+60)
MOVT	R0, #hi_addr(_ButtonRound14+60)
STR	R1, [R0, #0]
;ECGsynthetic_driver.c,3664 :: 		Image8.OwnerScreen     = &Screen7;
MOVW	R1, #lo_addr(_Screen7+0)
MOVT	R1, #hi_addr(_Screen7+0)
MOVW	R0, #lo_addr(_Image8+0)
MOVT	R0, #hi_addr(_Image8+0)
STR	R1, [R0, #0]
;ECGsynthetic_driver.c,3665 :: 		Image8.Order           = 16;
MOVS	R1, #16
MOVW	R0, #lo_addr(_Image8+4)
MOVT	R0, #hi_addr(_Image8+4)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,3666 :: 		Image8.Left            = 225;
MOVS	R1, #225
MOVW	R0, #lo_addr(_Image8+6)
MOVT	R0, #hi_addr(_Image8+6)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,3667 :: 		Image8.Top             = 85;
MOVS	R1, #85
MOVW	R0, #lo_addr(_Image8+8)
MOVT	R0, #hi_addr(_Image8+8)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,3668 :: 		Image8.Width           = 517;
MOVW	R1, #517
MOVW	R0, #lo_addr(_Image8+10)
MOVT	R0, #hi_addr(_Image8+10)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,3669 :: 		Image8.Height          = 298;
MOVW	R1, #298
MOVW	R0, #lo_addr(_Image8+12)
MOVT	R0, #hi_addr(_Image8+12)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,3670 :: 		Image8.Picture_Type    = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image8+22)
MOVT	R0, #hi_addr(_Image8+22)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,3671 :: 		Image8.Picture_Ratio   = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image8+23)
MOVT	R0, #hi_addr(_Image8+23)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,3672 :: 		Image8.Picture_Name    = GridLine1_jpg;
MOVW	R0, #lo_addr(_Image8+16)
MOVT	R0, #hi_addr(_Image8+16)
STR	R2, [R0, #0]
;ECGsynthetic_driver.c,3673 :: 		Image8.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image8+20)
MOVT	R0, #hi_addr(_Image8+20)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,3674 :: 		Image8.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image8+21)
MOVT	R0, #hi_addr(_Image8+21)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,3676 :: 		Label28.OwnerScreen     = &Screen8;
MOVW	R1, #lo_addr(_Screen8+0)
MOVT	R1, #hi_addr(_Screen8+0)
MOVW	R0, #lo_addr(_Label28+0)
MOVT	R0, #hi_addr(_Label28+0)
STR	R1, [R0, #0]
;ECGsynthetic_driver.c,3677 :: 		Label28.Order           = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label28+4)
MOVT	R0, #hi_addr(_Label28+4)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,3678 :: 		Label28.Left            = 256;
MOVW	R1, #256
MOVW	R0, #lo_addr(_Label28+6)
MOVT	R0, #hi_addr(_Label28+6)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,3679 :: 		Label28.Top             = 40;
MOVS	R1, #40
MOVW	R0, #lo_addr(_Label28+8)
MOVT	R0, #hi_addr(_Label28+8)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,3680 :: 		Label28.Width           = 283;
MOVW	R1, #283
MOVW	R0, #lo_addr(_Label28+10)
MOVT	R0, #hi_addr(_Label28+10)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,3681 :: 		Label28.Height          = 25;
MOVS	R1, #25
MOVW	R0, #lo_addr(_Label28+12)
MOVT	R0, #hi_addr(_Label28+12)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,3682 :: 		Label28.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Label28+27)
MOVT	R0, #hi_addr(_Label28+27)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,3683 :: 		Label28.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Label28+28)
MOVT	R0, #hi_addr(_Label28+28)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,3684 :: 		Label28.Caption         = Label28_Caption;
MOVW	R1, #lo_addr(_Label28_Caption+0)
MOVT	R1, #hi_addr(_Label28_Caption+0)
MOVW	R0, #lo_addr(_Label28+16)
MOVT	R0, #hi_addr(_Label28+16)
STR	R1, [R0, #0]
;ECGsynthetic_driver.c,3685 :: 		Label28.FontName        = Tahoma23x23_Bold;
MOVW	R2, #lo_addr(_Tahoma23x23_Bold+0)
MOVT	R2, #hi_addr(_Tahoma23x23_Bold+0)
MOVW	R0, #lo_addr(_Label28+20)
MOVT	R0, #hi_addr(_Label28+20)
STR	R2, [R0, #0]
;ECGsynthetic_driver.c,3686 :: 		Label28.Font_Color      = 0x0000;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label28+24)
MOVT	R0, #hi_addr(_Label28+24)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,3687 :: 		Label28.VerticalText    = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label28+26)
MOVT	R0, #hi_addr(_Label28+26)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,3689 :: 		Box1.OwnerScreen     = &Screen8;
MOVW	R1, #lo_addr(_Screen8+0)
MOVT	R1, #hi_addr(_Screen8+0)
MOVW	R0, #lo_addr(_Box1+0)
MOVT	R0, #hi_addr(_Box1+0)
STR	R1, [R0, #0]
;ECGsynthetic_driver.c,3690 :: 		Box1.Order           = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Box1+4)
MOVT	R0, #hi_addr(_Box1+4)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,3691 :: 		Box1.Left            = 63;
MOVS	R1, #63
MOVW	R0, #lo_addr(_Box1+6)
MOVT	R0, #hi_addr(_Box1+6)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,3692 :: 		Box1.Top             = 92;
MOVS	R1, #92
MOVW	R0, #lo_addr(_Box1+8)
MOVT	R0, #hi_addr(_Box1+8)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,3693 :: 		Box1.Width           = 681;
MOVW	R1, #681
MOVW	R0, #lo_addr(_Box1+10)
MOVT	R0, #hi_addr(_Box1+10)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,3694 :: 		Box1.Height          = 298;
MOVW	R1, #298
MOVW	R0, #lo_addr(_Box1+12)
MOVT	R0, #hi_addr(_Box1+12)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,3695 :: 		Box1.Pen_Width       = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Box1+14)
MOVT	R0, #hi_addr(_Box1+14)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,3696 :: 		Box1.Pen_Color       = 0x0000;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Box1+16)
MOVT	R0, #hi_addr(_Box1+16)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,3697 :: 		Box1.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Box1+18)
MOVT	R0, #hi_addr(_Box1+18)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,3698 :: 		Box1.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Box1+19)
MOVT	R0, #hi_addr(_Box1+19)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,3699 :: 		Box1.Transparent     = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Box1+20)
MOVT	R0, #hi_addr(_Box1+20)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,3700 :: 		Box1.Gradient        = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Box1+21)
MOVT	R0, #hi_addr(_Box1+21)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,3701 :: 		Box1.Gradient_Orientation = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Box1+22)
MOVT	R0, #hi_addr(_Box1+22)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,3702 :: 		Box1.Gradient_Start_Color = 0xFFFF;
MOVW	R1, #65535
MOVW	R0, #lo_addr(_Box1+24)
MOVT	R0, #hi_addr(_Box1+24)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,3703 :: 		Box1.Gradient_End_Color = 0xC618;
MOVW	R1, #50712
MOVW	R0, #lo_addr(_Box1+26)
MOVT	R0, #hi_addr(_Box1+26)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,3704 :: 		Box1.Color           = 0xFFFF;
MOVW	R1, #65535
MOVW	R0, #lo_addr(_Box1+28)
MOVT	R0, #hi_addr(_Box1+28)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,3705 :: 		Box1.PressColEnabled = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Box1+30)
MOVT	R0, #hi_addr(_Box1+30)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,3706 :: 		Box1.Press_Color     = 0xE71C;
MOVW	R1, #59164
MOVW	R0, #lo_addr(_Box1+32)
MOVT	R0, #hi_addr(_Box1+32)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,3708 :: 		ButtonRound15.OwnerScreen     = &Screen8;
MOVW	R1, #lo_addr(_Screen8+0)
MOVT	R1, #hi_addr(_Screen8+0)
MOVW	R0, #lo_addr(_ButtonRound15+0)
MOVT	R0, #hi_addr(_ButtonRound15+0)
STR	R1, [R0, #0]
;ECGsynthetic_driver.c,3709 :: 		ButtonRound15.Order           = 2;
MOVS	R1, #2
MOVW	R0, #lo_addr(_ButtonRound15+4)
MOVT	R0, #hi_addr(_ButtonRound15+4)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,3710 :: 		ButtonRound15.Left            = 116;
MOVS	R1, #116
MOVW	R0, #lo_addr(_ButtonRound15+6)
MOVT	R0, #hi_addr(_ButtonRound15+6)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,3711 :: 		ButtonRound15.Top             = 131;
MOVS	R1, #131
MOVW	R0, #lo_addr(_ButtonRound15+8)
MOVT	R0, #hi_addr(_ButtonRound15+8)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,3712 :: 		ButtonRound15.Width           = 159;
MOVS	R1, #159
MOVW	R0, #lo_addr(_ButtonRound15+10)
MOVT	R0, #hi_addr(_ButtonRound15+10)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,3713 :: 		ButtonRound15.Height          = 74;
MOVS	R1, #74
MOVW	R0, #lo_addr(_ButtonRound15+12)
MOVT	R0, #hi_addr(_ButtonRound15+12)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,3714 :: 		ButtonRound15.Pen_Width       = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_ButtonRound15+14)
MOVT	R0, #hi_addr(_ButtonRound15+14)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,3715 :: 		ButtonRound15.Pen_Color       = 0x0000;
MOVS	R1, #0
MOVW	R0, #lo_addr(_ButtonRound15+16)
MOVT	R0, #hi_addr(_ButtonRound15+16)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,3716 :: 		ButtonRound15.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_ButtonRound15+18)
MOVT	R0, #hi_addr(_ButtonRound15+18)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,3717 :: 		ButtonRound15.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_ButtonRound15+19)
MOVT	R0, #hi_addr(_ButtonRound15+19)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,3718 :: 		ButtonRound15.Transparent     = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_ButtonRound15+20)
MOVT	R0, #hi_addr(_ButtonRound15+20)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,3719 :: 		ButtonRound15.Caption         = ButtonRound15_Caption;
MOVW	R1, #lo_addr(_ButtonRound15_Caption+0)
MOVT	R1, #hi_addr(_ButtonRound15_Caption+0)
MOVW	R0, #lo_addr(_ButtonRound15+24)
MOVT	R0, #hi_addr(_ButtonRound15+24)
STR	R1, [R0, #0]
;ECGsynthetic_driver.c,3720 :: 		ButtonRound15.TextAlign       = _taCenter;
MOVS	R1, #1
MOVW	R0, #lo_addr(_ButtonRound15+28)
MOVT	R0, #hi_addr(_ButtonRound15+28)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,3721 :: 		ButtonRound15.TextAlignVertical= _tavMiddle;
MOVS	R1, #1
MOVW	R0, #lo_addr(_ButtonRound15+29)
MOVT	R0, #hi_addr(_ButtonRound15+29)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,3722 :: 		ButtonRound15.FontName        = Tahoma23x23_Bold;
MOVW	R0, #lo_addr(_ButtonRound15+32)
MOVT	R0, #hi_addr(_ButtonRound15+32)
STR	R2, [R0, #0]
;ECGsynthetic_driver.c,3723 :: 		ButtonRound15.PressColEnabled = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_ButtonRound15+49)
MOVT	R0, #hi_addr(_ButtonRound15+49)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,3724 :: 		ButtonRound15.Font_Color      = 0xFFFF;
MOVW	R1, #65535
MOVW	R0, #lo_addr(_ButtonRound15+36)
MOVT	R0, #hi_addr(_ButtonRound15+36)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,3725 :: 		ButtonRound15.VerticalText    = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_ButtonRound15+38)
MOVT	R0, #hi_addr(_ButtonRound15+38)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,3726 :: 		ButtonRound15.Gradient        = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_ButtonRound15+39)
MOVT	R0, #hi_addr(_ButtonRound15+39)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,3727 :: 		ButtonRound15.Gradient_Orientation = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_ButtonRound15+40)
MOVT	R0, #hi_addr(_ButtonRound15+40)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,3728 :: 		ButtonRound15.Gradient_Start_Color = 0xFFFF;
MOVW	R1, #65535
MOVW	R0, #lo_addr(_ButtonRound15+42)
MOVT	R0, #hi_addr(_ButtonRound15+42)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,3729 :: 		ButtonRound15.Gradient_End_Color = 0xC618;
MOVW	R1, #50712
MOVW	R0, #lo_addr(_ButtonRound15+44)
MOVT	R0, #hi_addr(_ButtonRound15+44)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,3730 :: 		ButtonRound15.Color           = 0x3013;
MOVW	R1, #12307
MOVW	R0, #lo_addr(_ButtonRound15+46)
MOVT	R0, #hi_addr(_ButtonRound15+46)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,3731 :: 		ButtonRound15.Press_Color     = 0xE71C;
MOVW	R1, #59164
MOVW	R0, #lo_addr(_ButtonRound15+50)
MOVT	R0, #hi_addr(_ButtonRound15+50)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,3732 :: 		ButtonRound15.Corner_Radius   = 3;
MOVS	R1, #3
MOVW	R0, #lo_addr(_ButtonRound15+48)
MOVT	R0, #hi_addr(_ButtonRound15+48)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,3733 :: 		ButtonRound15.OnClickPtr      = ButtonRound15OnClick;
MOVW	R1, #lo_addr(_ButtonRound15OnClick+0)
MOVT	R1, #hi_addr(_ButtonRound15OnClick+0)
MOVW	R0, #lo_addr(_ButtonRound15+60)
MOVT	R0, #hi_addr(_ButtonRound15+60)
STR	R1, [R0, #0]
;ECGsynthetic_driver.c,3735 :: 		ButtonRound16.OwnerScreen     = &Screen8;
MOVW	R1, #lo_addr(_Screen8+0)
MOVT	R1, #hi_addr(_Screen8+0)
MOVW	R0, #lo_addr(_ButtonRound16+0)
MOVT	R0, #hi_addr(_ButtonRound16+0)
STR	R1, [R0, #0]
;ECGsynthetic_driver.c,3736 :: 		ButtonRound16.Order           = 3;
MOVS	R1, #3
MOVW	R0, #lo_addr(_ButtonRound16+4)
MOVT	R0, #hi_addr(_ButtonRound16+4)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,3737 :: 		ButtonRound16.Left            = 325;
MOVW	R1, #325
MOVW	R0, #lo_addr(_ButtonRound16+6)
MOVT	R0, #hi_addr(_ButtonRound16+6)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,3738 :: 		ButtonRound16.Top             = 131;
MOVS	R1, #131
MOVW	R0, #lo_addr(_ButtonRound16+8)
MOVT	R0, #hi_addr(_ButtonRound16+8)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,3739 :: 		ButtonRound16.Width           = 159;
MOVS	R1, #159
MOVW	R0, #lo_addr(_ButtonRound16+10)
MOVT	R0, #hi_addr(_ButtonRound16+10)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,3740 :: 		ButtonRound16.Height          = 74;
MOVS	R1, #74
MOVW	R0, #lo_addr(_ButtonRound16+12)
MOVT	R0, #hi_addr(_ButtonRound16+12)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,3741 :: 		ButtonRound16.Pen_Width       = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_ButtonRound16+14)
MOVT	R0, #hi_addr(_ButtonRound16+14)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,3742 :: 		ButtonRound16.Pen_Color       = 0x0000;
MOVS	R1, #0
MOVW	R0, #lo_addr(_ButtonRound16+16)
MOVT	R0, #hi_addr(_ButtonRound16+16)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,3743 :: 		ButtonRound16.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_ButtonRound16+18)
MOVT	R0, #hi_addr(_ButtonRound16+18)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,3744 :: 		ButtonRound16.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_ButtonRound16+19)
MOVT	R0, #hi_addr(_ButtonRound16+19)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,3745 :: 		ButtonRound16.Transparent     = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_ButtonRound16+20)
MOVT	R0, #hi_addr(_ButtonRound16+20)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,3746 :: 		ButtonRound16.Caption         = ButtonRound16_Caption;
MOVW	R1, #lo_addr(_ButtonRound16_Caption+0)
MOVT	R1, #hi_addr(_ButtonRound16_Caption+0)
MOVW	R0, #lo_addr(_ButtonRound16+24)
MOVT	R0, #hi_addr(_ButtonRound16+24)
STR	R1, [R0, #0]
;ECGsynthetic_driver.c,3747 :: 		ButtonRound16.TextAlign       = _taCenter;
MOVS	R1, #1
MOVW	R0, #lo_addr(_ButtonRound16+28)
MOVT	R0, #hi_addr(_ButtonRound16+28)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,3748 :: 		ButtonRound16.TextAlignVertical= _tavMiddle;
MOVS	R1, #1
MOVW	R0, #lo_addr(_ButtonRound16+29)
MOVT	R0, #hi_addr(_ButtonRound16+29)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,3749 :: 		ButtonRound16.FontName        = Tahoma23x23_Bold;
MOVW	R0, #lo_addr(_ButtonRound16+32)
MOVT	R0, #hi_addr(_ButtonRound16+32)
STR	R2, [R0, #0]
;ECGsynthetic_driver.c,3750 :: 		ButtonRound16.PressColEnabled = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_ButtonRound16+49)
MOVT	R0, #hi_addr(_ButtonRound16+49)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,3751 :: 		ButtonRound16.Font_Color      = 0xFFFF;
MOVW	R1, #65535
MOVW	R0, #lo_addr(_ButtonRound16+36)
MOVT	R0, #hi_addr(_ButtonRound16+36)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,3752 :: 		ButtonRound16.VerticalText    = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_ButtonRound16+38)
MOVT	R0, #hi_addr(_ButtonRound16+38)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,3753 :: 		ButtonRound16.Gradient        = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_ButtonRound16+39)
MOVT	R0, #hi_addr(_ButtonRound16+39)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,3754 :: 		ButtonRound16.Gradient_Orientation = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_ButtonRound16+40)
MOVT	R0, #hi_addr(_ButtonRound16+40)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,3755 :: 		ButtonRound16.Gradient_Start_Color = 0xFFFF;
MOVW	R1, #65535
MOVW	R0, #lo_addr(_ButtonRound16+42)
MOVT	R0, #hi_addr(_ButtonRound16+42)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,3756 :: 		ButtonRound16.Gradient_End_Color = 0xC618;
MOVW	R1, #50712
MOVW	R0, #lo_addr(_ButtonRound16+44)
MOVT	R0, #hi_addr(_ButtonRound16+44)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,3757 :: 		ButtonRound16.Color           = 0x3013;
MOVW	R1, #12307
MOVW	R0, #lo_addr(_ButtonRound16+46)
MOVT	R0, #hi_addr(_ButtonRound16+46)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,3758 :: 		ButtonRound16.Press_Color     = 0xE71C;
MOVW	R1, #59164
MOVW	R0, #lo_addr(_ButtonRound16+50)
MOVT	R0, #hi_addr(_ButtonRound16+50)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,3759 :: 		ButtonRound16.Corner_Radius   = 3;
MOVS	R1, #3
MOVW	R0, #lo_addr(_ButtonRound16+48)
MOVT	R0, #hi_addr(_ButtonRound16+48)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,3760 :: 		ButtonRound16.OnClickPtr      = ButtonRound16OnClick;
MOVW	R1, #lo_addr(_ButtonRound16OnClick+0)
MOVT	R1, #hi_addr(_ButtonRound16OnClick+0)
MOVW	R0, #lo_addr(_ButtonRound16+60)
MOVT	R0, #hi_addr(_ButtonRound16+60)
STR	R1, [R0, #0]
;ECGsynthetic_driver.c,3762 :: 		ButtonRound17.OwnerScreen     = &Screen8;
MOVW	R1, #lo_addr(_Screen8+0)
MOVT	R1, #hi_addr(_Screen8+0)
MOVW	R0, #lo_addr(_ButtonRound17+0)
MOVT	R0, #hi_addr(_ButtonRound17+0)
STR	R1, [R0, #0]
;ECGsynthetic_driver.c,3763 :: 		ButtonRound17.Order           = 4;
MOVS	R1, #4
MOVW	R0, #lo_addr(_ButtonRound17+4)
MOVT	R0, #hi_addr(_ButtonRound17+4)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,3764 :: 		ButtonRound17.Left            = 525;
MOVW	R1, #525
MOVW	R0, #lo_addr(_ButtonRound17+6)
MOVT	R0, #hi_addr(_ButtonRound17+6)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,3765 :: 		ButtonRound17.Top             = 132;
MOVS	R1, #132
MOVW	R0, #lo_addr(_ButtonRound17+8)
MOVT	R0, #hi_addr(_ButtonRound17+8)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,3766 :: 		ButtonRound17.Width           = 159;
MOVS	R1, #159
MOVW	R0, #lo_addr(_ButtonRound17+10)
MOVT	R0, #hi_addr(_ButtonRound17+10)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,3767 :: 		ButtonRound17.Height          = 74;
MOVS	R1, #74
MOVW	R0, #lo_addr(_ButtonRound17+12)
MOVT	R0, #hi_addr(_ButtonRound17+12)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,3768 :: 		ButtonRound17.Pen_Width       = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_ButtonRound17+14)
MOVT	R0, #hi_addr(_ButtonRound17+14)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,3769 :: 		ButtonRound17.Pen_Color       = 0x0000;
MOVS	R1, #0
MOVW	R0, #lo_addr(_ButtonRound17+16)
MOVT	R0, #hi_addr(_ButtonRound17+16)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,3770 :: 		ButtonRound17.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_ButtonRound17+18)
MOVT	R0, #hi_addr(_ButtonRound17+18)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,3771 :: 		ButtonRound17.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_ButtonRound17+19)
MOVT	R0, #hi_addr(_ButtonRound17+19)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,3772 :: 		ButtonRound17.Transparent     = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_ButtonRound17+20)
MOVT	R0, #hi_addr(_ButtonRound17+20)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,3773 :: 		ButtonRound17.Caption         = ButtonRound17_Caption;
MOVW	R1, #lo_addr(_ButtonRound17_Caption+0)
MOVT	R1, #hi_addr(_ButtonRound17_Caption+0)
MOVW	R0, #lo_addr(_ButtonRound17+24)
MOVT	R0, #hi_addr(_ButtonRound17+24)
STR	R1, [R0, #0]
;ECGsynthetic_driver.c,3774 :: 		ButtonRound17.TextAlign       = _taCenter;
MOVS	R1, #1
MOVW	R0, #lo_addr(_ButtonRound17+28)
MOVT	R0, #hi_addr(_ButtonRound17+28)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,3775 :: 		ButtonRound17.TextAlignVertical= _tavMiddle;
MOVS	R1, #1
MOVW	R0, #lo_addr(_ButtonRound17+29)
MOVT	R0, #hi_addr(_ButtonRound17+29)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,3776 :: 		ButtonRound17.FontName        = Tahoma23x23_Bold;
MOVW	R0, #lo_addr(_ButtonRound17+32)
MOVT	R0, #hi_addr(_ButtonRound17+32)
STR	R2, [R0, #0]
;ECGsynthetic_driver.c,3777 :: 		ButtonRound17.PressColEnabled = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_ButtonRound17+49)
MOVT	R0, #hi_addr(_ButtonRound17+49)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,3778 :: 		ButtonRound17.Font_Color      = 0xFFFF;
MOVW	R1, #65535
MOVW	R0, #lo_addr(_ButtonRound17+36)
MOVT	R0, #hi_addr(_ButtonRound17+36)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,3779 :: 		ButtonRound17.VerticalText    = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_ButtonRound17+38)
MOVT	R0, #hi_addr(_ButtonRound17+38)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,3780 :: 		ButtonRound17.Gradient        = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_ButtonRound17+39)
MOVT	R0, #hi_addr(_ButtonRound17+39)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,3781 :: 		ButtonRound17.Gradient_Orientation = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_ButtonRound17+40)
MOVT	R0, #hi_addr(_ButtonRound17+40)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,3782 :: 		ButtonRound17.Gradient_Start_Color = 0xFFFF;
MOVW	R1, #65535
MOVW	R0, #lo_addr(_ButtonRound17+42)
MOVT	R0, #hi_addr(_ButtonRound17+42)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,3783 :: 		ButtonRound17.Gradient_End_Color = 0xC618;
MOVW	R1, #50712
MOVW	R0, #lo_addr(_ButtonRound17+44)
MOVT	R0, #hi_addr(_ButtonRound17+44)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,3784 :: 		ButtonRound17.Color           = 0x3013;
MOVW	R1, #12307
MOVW	R0, #lo_addr(_ButtonRound17+46)
MOVT	R0, #hi_addr(_ButtonRound17+46)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,3785 :: 		ButtonRound17.Press_Color     = 0xE71C;
MOVW	R1, #59164
MOVW	R0, #lo_addr(_ButtonRound17+50)
MOVT	R0, #hi_addr(_ButtonRound17+50)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,3786 :: 		ButtonRound17.Corner_Radius   = 3;
MOVS	R1, #3
MOVW	R0, #lo_addr(_ButtonRound17+48)
MOVT	R0, #hi_addr(_ButtonRound17+48)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,3787 :: 		ButtonRound17.OnClickPtr      = ButtonRound17OnClick;
MOVW	R1, #lo_addr(_ButtonRound17OnClick+0)
MOVT	R1, #hi_addr(_ButtonRound17OnClick+0)
MOVW	R0, #lo_addr(_ButtonRound17+60)
MOVT	R0, #hi_addr(_ButtonRound17+60)
STR	R1, [R0, #0]
;ECGsynthetic_driver.c,3789 :: 		ButtonRound18.OwnerScreen     = &Screen8;
MOVW	R1, #lo_addr(_Screen8+0)
MOVT	R1, #hi_addr(_Screen8+0)
MOVW	R0, #lo_addr(_ButtonRound18+0)
MOVT	R0, #hi_addr(_ButtonRound18+0)
STR	R1, [R0, #0]
;ECGsynthetic_driver.c,3790 :: 		ButtonRound18.Order           = 5;
MOVS	R1, #5
MOVW	R0, #lo_addr(_ButtonRound18+4)
MOVT	R0, #hi_addr(_ButtonRound18+4)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,3791 :: 		ButtonRound18.Left            = 222;
MOVS	R1, #222
MOVW	R0, #lo_addr(_ButtonRound18+6)
MOVT	R0, #hi_addr(_ButtonRound18+6)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,3792 :: 		ButtonRound18.Top             = 256;
MOVW	R1, #256
MOVW	R0, #lo_addr(_ButtonRound18+8)
MOVT	R0, #hi_addr(_ButtonRound18+8)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,3793 :: 		ButtonRound18.Width           = 159;
MOVS	R1, #159
MOVW	R0, #lo_addr(_ButtonRound18+10)
MOVT	R0, #hi_addr(_ButtonRound18+10)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,3794 :: 		ButtonRound18.Height          = 74;
MOVS	R1, #74
MOVW	R0, #lo_addr(_ButtonRound18+12)
MOVT	R0, #hi_addr(_ButtonRound18+12)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,3795 :: 		ButtonRound18.Pen_Width       = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_ButtonRound18+14)
MOVT	R0, #hi_addr(_ButtonRound18+14)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,3796 :: 		ButtonRound18.Pen_Color       = 0x0000;
MOVS	R1, #0
MOVW	R0, #lo_addr(_ButtonRound18+16)
MOVT	R0, #hi_addr(_ButtonRound18+16)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,3797 :: 		ButtonRound18.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_ButtonRound18+18)
MOVT	R0, #hi_addr(_ButtonRound18+18)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,3798 :: 		ButtonRound18.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_ButtonRound18+19)
MOVT	R0, #hi_addr(_ButtonRound18+19)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,3799 :: 		ButtonRound18.Transparent     = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_ButtonRound18+20)
MOVT	R0, #hi_addr(_ButtonRound18+20)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,3800 :: 		ButtonRound18.Caption         = ButtonRound18_Caption;
MOVW	R1, #lo_addr(_ButtonRound18_Caption+0)
MOVT	R1, #hi_addr(_ButtonRound18_Caption+0)
MOVW	R0, #lo_addr(_ButtonRound18+24)
MOVT	R0, #hi_addr(_ButtonRound18+24)
STR	R1, [R0, #0]
;ECGsynthetic_driver.c,3801 :: 		ButtonRound18.TextAlign       = _taCenter;
MOVS	R1, #1
MOVW	R0, #lo_addr(_ButtonRound18+28)
MOVT	R0, #hi_addr(_ButtonRound18+28)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,3802 :: 		ButtonRound18.TextAlignVertical= _tavMiddle;
MOVS	R1, #1
MOVW	R0, #lo_addr(_ButtonRound18+29)
MOVT	R0, #hi_addr(_ButtonRound18+29)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,3803 :: 		ButtonRound18.FontName        = Tahoma23x23_Bold;
MOVW	R0, #lo_addr(_ButtonRound18+32)
MOVT	R0, #hi_addr(_ButtonRound18+32)
STR	R2, [R0, #0]
;ECGsynthetic_driver.c,3804 :: 		ButtonRound18.PressColEnabled = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_ButtonRound18+49)
MOVT	R0, #hi_addr(_ButtonRound18+49)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,3805 :: 		ButtonRound18.Font_Color      = 0xFFFF;
MOVW	R1, #65535
MOVW	R0, #lo_addr(_ButtonRound18+36)
MOVT	R0, #hi_addr(_ButtonRound18+36)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,3806 :: 		ButtonRound18.VerticalText    = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_ButtonRound18+38)
MOVT	R0, #hi_addr(_ButtonRound18+38)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,3807 :: 		ButtonRound18.Gradient        = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_ButtonRound18+39)
MOVT	R0, #hi_addr(_ButtonRound18+39)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,3808 :: 		ButtonRound18.Gradient_Orientation = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_ButtonRound18+40)
MOVT	R0, #hi_addr(_ButtonRound18+40)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,3809 :: 		ButtonRound18.Gradient_Start_Color = 0xFFFF;
MOVW	R1, #65535
MOVW	R0, #lo_addr(_ButtonRound18+42)
MOVT	R0, #hi_addr(_ButtonRound18+42)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,3810 :: 		ButtonRound18.Gradient_End_Color = 0xC618;
MOVW	R1, #50712
MOVW	R0, #lo_addr(_ButtonRound18+44)
MOVT	R0, #hi_addr(_ButtonRound18+44)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,3811 :: 		ButtonRound18.Color           = 0x3013;
MOVW	R1, #12307
MOVW	R0, #lo_addr(_ButtonRound18+46)
MOVT	R0, #hi_addr(_ButtonRound18+46)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,3812 :: 		ButtonRound18.Press_Color     = 0xE71C;
MOVW	R1, #59164
MOVW	R0, #lo_addr(_ButtonRound18+50)
MOVT	R0, #hi_addr(_ButtonRound18+50)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,3813 :: 		ButtonRound18.Corner_Radius   = 3;
MOVS	R1, #3
MOVW	R0, #lo_addr(_ButtonRound18+48)
MOVT	R0, #hi_addr(_ButtonRound18+48)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,3814 :: 		ButtonRound18.OnClickPtr      = ButtonRound18OnClick;
MOVW	R1, #lo_addr(_ButtonRound18OnClick+0)
MOVT	R1, #hi_addr(_ButtonRound18OnClick+0)
MOVW	R0, #lo_addr(_ButtonRound18+60)
MOVT	R0, #hi_addr(_ButtonRound18+60)
STR	R1, [R0, #0]
;ECGsynthetic_driver.c,3816 :: 		ButtonRound19.OwnerScreen     = &Screen8;
MOVW	R1, #lo_addr(_Screen8+0)
MOVT	R1, #hi_addr(_Screen8+0)
MOVW	R0, #lo_addr(_ButtonRound19+0)
MOVT	R0, #hi_addr(_ButtonRound19+0)
STR	R1, [R0, #0]
;ECGsynthetic_driver.c,3817 :: 		ButtonRound19.Order           = 6;
MOVS	R1, #6
MOVW	R0, #lo_addr(_ButtonRound19+4)
MOVT	R0, #hi_addr(_ButtonRound19+4)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,3818 :: 		ButtonRound19.Left            = 445;
MOVW	R1, #445
MOVW	R0, #lo_addr(_ButtonRound19+6)
MOVT	R0, #hi_addr(_ButtonRound19+6)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,3819 :: 		ButtonRound19.Top             = 256;
MOVW	R1, #256
MOVW	R0, #lo_addr(_ButtonRound19+8)
MOVT	R0, #hi_addr(_ButtonRound19+8)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,3820 :: 		ButtonRound19.Width           = 159;
MOVS	R1, #159
MOVW	R0, #lo_addr(_ButtonRound19+10)
MOVT	R0, #hi_addr(_ButtonRound19+10)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,3821 :: 		ButtonRound19.Height          = 74;
MOVS	R1, #74
MOVW	R0, #lo_addr(_ButtonRound19+12)
MOVT	R0, #hi_addr(_ButtonRound19+12)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,3822 :: 		ButtonRound19.Pen_Width       = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_ButtonRound19+14)
MOVT	R0, #hi_addr(_ButtonRound19+14)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,3823 :: 		ButtonRound19.Pen_Color       = 0x0000;
MOVS	R1, #0
MOVW	R0, #lo_addr(_ButtonRound19+16)
MOVT	R0, #hi_addr(_ButtonRound19+16)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,3824 :: 		ButtonRound19.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_ButtonRound19+18)
MOVT	R0, #hi_addr(_ButtonRound19+18)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,3825 :: 		ButtonRound19.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_ButtonRound19+19)
MOVT	R0, #hi_addr(_ButtonRound19+19)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,3826 :: 		ButtonRound19.Transparent     = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_ButtonRound19+20)
MOVT	R0, #hi_addr(_ButtonRound19+20)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,3827 :: 		ButtonRound19.Caption         = ButtonRound19_Caption;
MOVW	R1, #lo_addr(_ButtonRound19_Caption+0)
MOVT	R1, #hi_addr(_ButtonRound19_Caption+0)
MOVW	R0, #lo_addr(_ButtonRound19+24)
MOVT	R0, #hi_addr(_ButtonRound19+24)
STR	R1, [R0, #0]
;ECGsynthetic_driver.c,3828 :: 		ButtonRound19.TextAlign       = _taCenter;
MOVS	R1, #1
MOVW	R0, #lo_addr(_ButtonRound19+28)
MOVT	R0, #hi_addr(_ButtonRound19+28)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,3829 :: 		ButtonRound19.TextAlignVertical= _tavMiddle;
MOVS	R1, #1
MOVW	R0, #lo_addr(_ButtonRound19+29)
MOVT	R0, #hi_addr(_ButtonRound19+29)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,3830 :: 		ButtonRound19.FontName        = Tahoma23x23_Bold;
MOVW	R0, #lo_addr(_ButtonRound19+32)
MOVT	R0, #hi_addr(_ButtonRound19+32)
STR	R2, [R0, #0]
;ECGsynthetic_driver.c,3831 :: 		ButtonRound19.PressColEnabled = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_ButtonRound19+49)
MOVT	R0, #hi_addr(_ButtonRound19+49)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,3832 :: 		ButtonRound19.Font_Color      = 0xFFFF;
MOVW	R1, #65535
MOVW	R0, #lo_addr(_ButtonRound19+36)
MOVT	R0, #hi_addr(_ButtonRound19+36)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,3833 :: 		ButtonRound19.VerticalText    = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_ButtonRound19+38)
MOVT	R0, #hi_addr(_ButtonRound19+38)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,3834 :: 		ButtonRound19.Gradient        = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_ButtonRound19+39)
MOVT	R0, #hi_addr(_ButtonRound19+39)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,3835 :: 		ButtonRound19.Gradient_Orientation = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_ButtonRound19+40)
MOVT	R0, #hi_addr(_ButtonRound19+40)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,3836 :: 		ButtonRound19.Gradient_Start_Color = 0xFFFF;
MOVW	R1, #65535
MOVW	R0, #lo_addr(_ButtonRound19+42)
MOVT	R0, #hi_addr(_ButtonRound19+42)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,3837 :: 		ButtonRound19.Gradient_End_Color = 0xC618;
MOVW	R1, #50712
MOVW	R0, #lo_addr(_ButtonRound19+44)
MOVT	R0, #hi_addr(_ButtonRound19+44)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,3838 :: 		ButtonRound19.Color           = 0x3013;
MOVW	R1, #12307
MOVW	R0, #lo_addr(_ButtonRound19+46)
MOVT	R0, #hi_addr(_ButtonRound19+46)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,3839 :: 		ButtonRound19.Press_Color     = 0xE71C;
MOVW	R1, #59164
MOVW	R0, #lo_addr(_ButtonRound19+50)
MOVT	R0, #hi_addr(_ButtonRound19+50)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,3840 :: 		ButtonRound19.Corner_Radius   = 3;
MOVS	R1, #3
MOVW	R0, #lo_addr(_ButtonRound19+48)
MOVT	R0, #hi_addr(_ButtonRound19+48)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,3841 :: 		ButtonRound19.OnClickPtr      = ButtonRound19OnClick;
MOVW	R1, #lo_addr(_ButtonRound19OnClick+0)
MOVT	R1, #hi_addr(_ButtonRound19OnClick+0)
MOVW	R0, #lo_addr(_ButtonRound19+60)
MOVT	R0, #hi_addr(_ButtonRound19+60)
STR	R1, [R0, #0]
;ECGsynthetic_driver.c,3843 :: 		ButtonRound20.OwnerScreen     = &Screen8;
MOVW	R1, #lo_addr(_Screen8+0)
MOVT	R1, #hi_addr(_Screen8+0)
MOVW	R0, #lo_addr(_ButtonRound20+0)
MOVT	R0, #hi_addr(_ButtonRound20+0)
STR	R1, [R0, #0]
;ECGsynthetic_driver.c,3844 :: 		ButtonRound20.Order           = 7;
MOVS	R1, #7
MOVW	R0, #lo_addr(_ButtonRound20+4)
MOVT	R0, #hi_addr(_ButtonRound20+4)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,3845 :: 		ButtonRound20.Left            = 62;
MOVS	R1, #62
MOVW	R0, #lo_addr(_ButtonRound20+6)
MOVT	R0, #hi_addr(_ButtonRound20+6)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,3846 :: 		ButtonRound20.Top             = 403;
MOVW	R1, #403
MOVW	R0, #lo_addr(_ButtonRound20+8)
MOVT	R0, #hi_addr(_ButtonRound20+8)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,3847 :: 		ButtonRound20.Width           = 112;
MOVS	R1, #112
MOVW	R0, #lo_addr(_ButtonRound20+10)
MOVT	R0, #hi_addr(_ButtonRound20+10)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,3848 :: 		ButtonRound20.Height          = 57;
MOVS	R1, #57
MOVW	R0, #lo_addr(_ButtonRound20+12)
MOVT	R0, #hi_addr(_ButtonRound20+12)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,3849 :: 		ButtonRound20.Pen_Width       = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_ButtonRound20+14)
MOVT	R0, #hi_addr(_ButtonRound20+14)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,3850 :: 		ButtonRound20.Pen_Color       = 0xEB2F;
MOVW	R1, #60207
MOVW	R0, #lo_addr(_ButtonRound20+16)
MOVT	R0, #hi_addr(_ButtonRound20+16)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,3851 :: 		ButtonRound20.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_ButtonRound20+18)
MOVT	R0, #hi_addr(_ButtonRound20+18)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,3852 :: 		ButtonRound20.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_ButtonRound20+19)
MOVT	R0, #hi_addr(_ButtonRound20+19)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,3853 :: 		ButtonRound20.Transparent     = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_ButtonRound20+20)
MOVT	R0, #hi_addr(_ButtonRound20+20)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,3854 :: 		ButtonRound20.Caption         = ButtonRound20_Caption;
MOVW	R1, #lo_addr(_ButtonRound20_Caption+0)
MOVT	R1, #hi_addr(_ButtonRound20_Caption+0)
MOVW	R0, #lo_addr(_ButtonRound20+24)
MOVT	R0, #hi_addr(_ButtonRound20+24)
STR	R1, [R0, #0]
;ECGsynthetic_driver.c,3855 :: 		ButtonRound20.TextAlign       = _taCenter;
MOVS	R1, #1
MOVW	R0, #lo_addr(_ButtonRound20+28)
MOVT	R0, #hi_addr(_ButtonRound20+28)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,3856 :: 		ButtonRound20.TextAlignVertical= _tavMiddle;
MOVS	R1, #1
MOVW	R0, #lo_addr(_ButtonRound20+29)
MOVT	R0, #hi_addr(_ButtonRound20+29)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,3857 :: 		ButtonRound20.FontName        = Tahoma23x23_Bold;
MOVW	R0, #lo_addr(_ButtonRound20+32)
MOVT	R0, #hi_addr(_ButtonRound20+32)
STR	R2, [R0, #0]
;ECGsynthetic_driver.c,3858 :: 		ButtonRound20.PressColEnabled = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_ButtonRound20+49)
MOVT	R0, #hi_addr(_ButtonRound20+49)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,3859 :: 		ButtonRound20.Font_Color      = 0xFFFF;
MOVW	R1, #65535
MOVW	R0, #lo_addr(_ButtonRound20+36)
MOVT	R0, #hi_addr(_ButtonRound20+36)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,3860 :: 		ButtonRound20.VerticalText    = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_ButtonRound20+38)
MOVT	R0, #hi_addr(_ButtonRound20+38)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,3861 :: 		ButtonRound20.Gradient        = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_ButtonRound20+39)
MOVT	R0, #hi_addr(_ButtonRound20+39)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,3862 :: 		ButtonRound20.Gradient_Orientation = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_ButtonRound20+40)
MOVT	R0, #hi_addr(_ButtonRound20+40)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,3863 :: 		ButtonRound20.Gradient_Start_Color = 0xFFFF;
MOVW	R1, #65535
MOVW	R0, #lo_addr(_ButtonRound20+42)
MOVT	R0, #hi_addr(_ButtonRound20+42)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,3864 :: 		ButtonRound20.Gradient_End_Color = 0xC618;
MOVW	R1, #50712
MOVW	R0, #lo_addr(_ButtonRound20+44)
MOVT	R0, #hi_addr(_ButtonRound20+44)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,3865 :: 		ButtonRound20.Color           = 0xEB2F;
MOVW	R1, #60207
MOVW	R0, #lo_addr(_ButtonRound20+46)
MOVT	R0, #hi_addr(_ButtonRound20+46)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,3866 :: 		ButtonRound20.Press_Color     = 0xE71C;
MOVW	R1, #59164
MOVW	R0, #lo_addr(_ButtonRound20+50)
MOVT	R0, #hi_addr(_ButtonRound20+50)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,3867 :: 		ButtonRound20.Corner_Radius   = 3;
MOVS	R1, #3
MOVW	R0, #lo_addr(_ButtonRound20+48)
MOVT	R0, #hi_addr(_ButtonRound20+48)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,3868 :: 		ButtonRound20.OnClickPtr      = ButtonRound20OnClick;
MOVW	R1, #lo_addr(_ButtonRound20OnClick+0)
MOVT	R1, #hi_addr(_ButtonRound20OnClick+0)
MOVW	R0, #lo_addr(_ButtonRound20+60)
MOVT	R0, #hi_addr(_ButtonRound20+60)
STR	R1, [R0, #0]
;ECGsynthetic_driver.c,3869 :: 		}
L_end_InitializeObjects:
BX	LR
; end of ECGsynthetic_driver_InitializeObjects
ECGsynthetic_driver_IsInsideObject:
;ECGsynthetic_driver.c,3871 :: 		static char IsInsideObject (unsigned int X, unsigned int Y, unsigned int Left, unsigned int Top, unsigned int Width, unsigned int Height) { // static
; Top start address is: 12 (R3)
; Left start address is: 8 (R2)
; Y start address is: 4 (R1)
; X start address is: 0 (R0)
; Top end address is: 12 (R3)
; Left end address is: 8 (R2)
; Y end address is: 4 (R1)
; X end address is: 0 (R0)
; X start address is: 0 (R0)
; Y start address is: 4 (R1)
; Left start address is: 8 (R2)
; Top start address is: 12 (R3)
; Width start address is: 20 (R5)
LDRH	R5, [SP, #0]
; Height start address is: 24 (R6)
LDRH	R6, [SP, #4]
;ECGsynthetic_driver.c,3872 :: 		if ( (Left<= X) && (Left+ Width - 1 >= X) &&
CMP	R2, R0
IT	HI
BHI	L_ECGsynthetic_driver_IsInsideObject212
ADDS	R4, R2, R5
UXTH	R4, R4
; Left end address is: 8 (R2)
; Width end address is: 20 (R5)
SUBS	R4, R4, #1
UXTH	R4, R4
CMP	R4, R0
IT	CC
BCC	L_ECGsynthetic_driver_IsInsideObject211
; X end address is: 0 (R0)
;ECGsynthetic_driver.c,3873 :: 		(Top <= Y)  && (Top + Height - 1 >= Y) )
CMP	R3, R1
IT	HI
BHI	L_ECGsynthetic_driver_IsInsideObject210
ADDS	R4, R3, R6
UXTH	R4, R4
; Top end address is: 12 (R3)
; Height end address is: 24 (R6)
SUBS	R4, R4, #1
UXTH	R4, R4
CMP	R4, R1
IT	CC
BCC	L_ECGsynthetic_driver_IsInsideObject209
; Y end address is: 4 (R1)
L_ECGsynthetic_driver_IsInsideObject208:
;ECGsynthetic_driver.c,3874 :: 		return 1;
MOVS	R0, #1
IT	AL
BAL	L_end_IsInsideObject
;ECGsynthetic_driver.c,3872 :: 		if ( (Left<= X) && (Left+ Width - 1 >= X) &&
L_ECGsynthetic_driver_IsInsideObject212:
L_ECGsynthetic_driver_IsInsideObject211:
;ECGsynthetic_driver.c,3873 :: 		(Top <= Y)  && (Top + Height - 1 >= Y) )
L_ECGsynthetic_driver_IsInsideObject210:
L_ECGsynthetic_driver_IsInsideObject209:
;ECGsynthetic_driver.c,3876 :: 		return 0;
MOVS	R0, #0
;ECGsynthetic_driver.c,3877 :: 		}
L_end_IsInsideObject:
BX	LR
; end of ECGsynthetic_driver_IsInsideObject
_DrawRoundButton:
;ECGsynthetic_driver.c,3888 :: 		void DrawRoundButton(TButton_Round *Around_button) {
; Around_button start address is: 0 (R0)
SUB	SP, SP, #12
STR	LR, [SP, #0]
; Around_button end address is: 0 (R0)
; Around_button start address is: 0 (R0)
;ECGsynthetic_driver.c,3890 :: 		if (Around_button->Visible != 0) {
ADDW	R1, R0, #18
LDRB	R1, [R1, #0]
CMP	R1, #0
IT	EQ
BEQ	L_DrawRoundButton4
;ECGsynthetic_driver.c,3891 :: 		if (object_pressed == 1) {
MOVW	R1, #lo_addr(_object_pressed+0)
MOVT	R1, #hi_addr(_object_pressed+0)
LDRB	R1, [R1, #0]
CMP	R1, #1
IT	NE
BNE	L_DrawRoundButton5
;ECGsynthetic_driver.c,3892 :: 		object_pressed = 0;
MOVS	R2, #0
MOVW	R1, #lo_addr(_object_pressed+0)
MOVT	R1, #hi_addr(_object_pressed+0)
STRB	R2, [R1, #0]
;ECGsynthetic_driver.c,3894 :: 		Around_button->Gradient_End_Color, Around_button->Gradient_Start_Color);
ADDW	R1, R0, #42
LDRH	R1, [R1, #0]
UXTH	R6, R1
ADDW	R1, R0, #44
LDRH	R1, [R1, #0]
UXTH	R5, R1
;ECGsynthetic_driver.c,3893 :: 		TFT_Set_Brush(Around_button->Transparent, Around_button->Press_Color, Around_button->Gradient, Around_button->Gradient_Orientation,
ADDW	R1, R0, #40
LDRB	R1, [R1, #0]
UXTB	R4, R1
ADDW	R1, R0, #39
LDRB	R1, [R1, #0]
UXTB	R3, R1
ADDW	R1, R0, #50
LDRH	R1, [R1, #0]
UXTH	R2, R1
ADDW	R1, R0, #20
LDRB	R1, [R1, #0]
STR	R0, [SP, #4]
UXTB	R0, R1
UXTH	R1, R2
UXTB	R2, R3
UXTB	R3, R4
;ECGsynthetic_driver.c,3894 :: 		Around_button->Gradient_End_Color, Around_button->Gradient_Start_Color);
PUSH	(R6)
PUSH	(R5)
BL	_TFT_Set_Brush+0
ADD	SP, SP, #8
;ECGsynthetic_driver.c,3893 :: 		TFT_Set_Brush(Around_button->Transparent, Around_button->Press_Color, Around_button->Gradient, Around_button->Gradient_Orientation,
LDR	R0, [SP, #4]
;ECGsynthetic_driver.c,3895 :: 		}
IT	AL
BAL	L_DrawRoundButton6
L_DrawRoundButton5:
;ECGsynthetic_driver.c,3898 :: 		Around_button->Gradient_Start_Color, Around_button->Gradient_End_Color);
ADDW	R1, R0, #44
LDRH	R1, [R1, #0]
UXTH	R6, R1
ADDW	R1, R0, #42
LDRH	R1, [R1, #0]
UXTH	R5, R1
;ECGsynthetic_driver.c,3897 :: 		TFT_Set_Brush(Around_button->Transparent, Around_button->Color, Around_button->Gradient, Around_button->Gradient_Orientation,
ADDW	R1, R0, #40
LDRB	R1, [R1, #0]
UXTB	R4, R1
ADDW	R1, R0, #39
LDRB	R1, [R1, #0]
UXTB	R3, R1
ADDW	R1, R0, #46
LDRH	R1, [R1, #0]
UXTH	R2, R1
ADDW	R1, R0, #20
LDRB	R1, [R1, #0]
STR	R0, [SP, #4]
UXTB	R0, R1
UXTH	R1, R2
UXTB	R2, R3
UXTB	R3, R4
;ECGsynthetic_driver.c,3898 :: 		Around_button->Gradient_Start_Color, Around_button->Gradient_End_Color);
PUSH	(R6)
PUSH	(R5)
BL	_TFT_Set_Brush+0
ADD	SP, SP, #8
;ECGsynthetic_driver.c,3897 :: 		TFT_Set_Brush(Around_button->Transparent, Around_button->Color, Around_button->Gradient, Around_button->Gradient_Orientation,
LDR	R0, [SP, #4]
;ECGsynthetic_driver.c,3899 :: 		}
L_DrawRoundButton6:
;ECGsynthetic_driver.c,3900 :: 		TFT_Set_Pen(Around_button->Pen_Color, Around_button->Pen_Width);
ADDW	R1, R0, #14
LDRB	R1, [R1, #0]
UXTB	R2, R1
ADDW	R1, R0, #16
LDRH	R1, [R1, #0]
STR	R0, [SP, #4]
UXTH	R0, R1
UXTB	R1, R2
BL	_TFT_Set_Pen+0
LDR	R0, [SP, #4]
;ECGsynthetic_driver.c,3903 :: 		Around_button->Top + Around_button->Height - 2, Around_button->Corner_Radius);
ADDW	R1, R0, #48
LDRB	R1, [R1, #0]
UXTB	R6, R1
ADDW	R1, R0, #8
LDRH	R2, [R1, #0]
ADDW	R1, R0, #12
LDRH	R1, [R1, #0]
ADDS	R1, R2, R1
UXTH	R1, R1
SUBS	R5, R1, #2
;ECGsynthetic_driver.c,3902 :: 		Around_button->Left + Around_button->Width - 2,
ADDS	R1, R0, #6
LDRH	R4, [R1, #0]
ADDW	R1, R0, #10
LDRH	R1, [R1, #0]
ADDS	R1, R4, R1
UXTH	R1, R1
SUBS	R3, R1, #2
;ECGsynthetic_driver.c,3901 :: 		TFT_Rectangle_Round_Edges(Around_button->Left + 1, Around_button->Top + 1,
ADDS	R2, R2, #1
ADDS	R1, R4, #1
;ECGsynthetic_driver.c,3903 :: 		Around_button->Top + Around_button->Height - 2, Around_button->Corner_Radius);
STR	R0, [SP, #4]
;ECGsynthetic_driver.c,3901 :: 		TFT_Rectangle_Round_Edges(Around_button->Left + 1, Around_button->Top + 1,
UXTH	R0, R1
UXTH	R1, R2
;ECGsynthetic_driver.c,3902 :: 		Around_button->Left + Around_button->Width - 2,
UXTH	R2, R3
;ECGsynthetic_driver.c,3903 :: 		Around_button->Top + Around_button->Height - 2, Around_button->Corner_Radius);
UXTH	R3, R5
PUSH	(R6)
BL	_TFT_Rectangle_Round_Edges+0
ADD	SP, SP, #4
LDR	R0, [SP, #4]
;ECGsynthetic_driver.c,3904 :: 		if (Around_button->VerticalText != 0)
ADDW	R1, R0, #38
LDRB	R1, [R1, #0]
CMP	R1, #0
IT	EQ
BEQ	L_DrawRoundButton7
;ECGsynthetic_driver.c,3905 :: 		TFT_Set_Font(Around_button->FontName, Around_button->Font_Color, FO_VERTICAL_COLUMN);
ADDW	R1, R0, #36
LDRH	R1, [R1, #0]
UXTH	R2, R1
ADDW	R1, R0, #32
LDR	R1, [R1, #0]
STR	R0, [SP, #4]
MOV	R0, R1
UXTH	R1, R2
MOVS	R2, #2
BL	_TFT_Set_Font+0
LDR	R0, [SP, #4]
IT	AL
BAL	L_DrawRoundButton8
L_DrawRoundButton7:
;ECGsynthetic_driver.c,3907 :: 		TFT_Set_Font(Around_button->FontName, Around_button->Font_Color, FO_HORIZONTAL);
ADDW	R1, R0, #36
LDRH	R1, [R1, #0]
UXTH	R2, R1
ADDW	R1, R0, #32
LDR	R1, [R1, #0]
STR	R0, [SP, #4]
MOV	R0, R1
UXTH	R1, R2
MOVS	R2, #0
BL	_TFT_Set_Font+0
LDR	R0, [SP, #4]
L_DrawRoundButton8:
;ECGsynthetic_driver.c,3908 :: 		TFT_Write_Text_Return_Pos(Around_button->Caption, Around_button->Left, Around_button->Top);
ADDW	R1, R0, #8
LDRH	R1, [R1, #0]
UXTH	R3, R1
ADDS	R1, R0, #6
LDRH	R1, [R1, #0]
UXTH	R2, R1
ADDW	R1, R0, #24
LDR	R1, [R1, #0]
STR	R0, [SP, #4]
MOV	R0, R1
UXTH	R1, R2
UXTH	R2, R3
BL	_TFT_Write_Text_Return_Pos+0
LDR	R0, [SP, #4]
;ECGsynthetic_driver.c,3909 :: 		if (Around_button->TextAlign == _taLeft)
ADDW	R1, R0, #28
LDRB	R1, [R1, #0]
CMP	R1, #0
IT	NE
BNE	L_DrawRoundButton9
;ECGsynthetic_driver.c,3910 :: 		ALeft = Around_button->Left + 4;
ADDS	R1, R0, #6
LDRH	R1, [R1, #0]
ADDS	R1, R1, #4
STRH	R1, [SP, #8]
IT	AL
BAL	L_DrawRoundButton10
L_DrawRoundButton9:
;ECGsynthetic_driver.c,3911 :: 		else if (Around_button->TextAlign == _taCenter)
ADDW	R1, R0, #28
LDRB	R1, [R1, #0]
CMP	R1, #1
IT	NE
BNE	L_DrawRoundButton11
;ECGsynthetic_driver.c,3912 :: 		ALeft = Around_button->Left + (Around_button->Width - caption_length) / 2;
ADDS	R1, R0, #6
LDRH	R3, [R1, #0]
ADDW	R1, R0, #10
LDRH	R2, [R1, #0]
MOVW	R1, #lo_addr(_caption_length+0)
MOVT	R1, #hi_addr(_caption_length+0)
LDRH	R1, [R1, #0]
SUB	R1, R2, R1
UXTH	R1, R1
LSRS	R1, R1, #1
UXTH	R1, R1
ADDS	R1, R3, R1
STRH	R1, [SP, #8]
IT	AL
BAL	L_DrawRoundButton12
L_DrawRoundButton11:
;ECGsynthetic_driver.c,3913 :: 		else if (Around_button->TextAlign == _taRight)
ADDW	R1, R0, #28
LDRB	R1, [R1, #0]
CMP	R1, #2
IT	NE
BNE	L_DrawRoundButton13
;ECGsynthetic_driver.c,3914 :: 		ALeft = Around_button->Left + Around_button->Width - caption_length - 4;
ADDS	R1, R0, #6
LDRH	R2, [R1, #0]
ADDW	R1, R0, #10
LDRH	R1, [R1, #0]
ADDS	R2, R2, R1
UXTH	R2, R2
MOVW	R1, #lo_addr(_caption_length+0)
MOVT	R1, #hi_addr(_caption_length+0)
LDRH	R1, [R1, #0]
SUB	R1, R2, R1
UXTH	R1, R1
SUBS	R1, R1, #4
STRH	R1, [SP, #8]
L_DrawRoundButton13:
L_DrawRoundButton12:
L_DrawRoundButton10:
;ECGsynthetic_driver.c,3916 :: 		if (Around_button->TextAlignVertical == _tavTop)
ADDW	R1, R0, #29
LDRB	R1, [R1, #0]
CMP	R1, #0
IT	NE
BNE	L_DrawRoundButton14
;ECGsynthetic_driver.c,3917 :: 		ATop = Around_button->Top + 3;
ADDW	R1, R0, #8
LDRH	R1, [R1, #0]
ADDS	R1, R1, #3
STRH	R1, [SP, #10]
IT	AL
BAL	L_DrawRoundButton15
L_DrawRoundButton14:
;ECGsynthetic_driver.c,3918 :: 		else if (Around_button->TextAlignVertical == _tavMiddle)
ADDW	R1, R0, #29
LDRB	R1, [R1, #0]
CMP	R1, #1
IT	NE
BNE	L_DrawRoundButton16
;ECGsynthetic_driver.c,3919 :: 		ATop = Around_button->Top + (Around_button->Height - caption_height) / 2;
ADDW	R1, R0, #8
LDRH	R3, [R1, #0]
ADDW	R1, R0, #12
LDRH	R2, [R1, #0]
MOVW	R1, #lo_addr(_caption_height+0)
MOVT	R1, #hi_addr(_caption_height+0)
LDRH	R1, [R1, #0]
SUB	R1, R2, R1
UXTH	R1, R1
LSRS	R1, R1, #1
UXTH	R1, R1
ADDS	R1, R3, R1
STRH	R1, [SP, #10]
IT	AL
BAL	L_DrawRoundButton17
L_DrawRoundButton16:
;ECGsynthetic_driver.c,3920 :: 		else if (Around_button->TextAlignVertical == _tavBottom)
ADDW	R1, R0, #29
LDRB	R1, [R1, #0]
CMP	R1, #2
IT	NE
BNE	L_DrawRoundButton18
;ECGsynthetic_driver.c,3921 :: 		ATop  = Around_button->Top + Around_button->Height - caption_height - 4;
ADDW	R1, R0, #8
LDRH	R2, [R1, #0]
ADDW	R1, R0, #12
LDRH	R1, [R1, #0]
ADDS	R2, R2, R1
UXTH	R2, R2
MOVW	R1, #lo_addr(_caption_height+0)
MOVT	R1, #hi_addr(_caption_height+0)
LDRH	R1, [R1, #0]
SUB	R1, R2, R1
UXTH	R1, R1
SUBS	R1, R1, #4
STRH	R1, [SP, #10]
L_DrawRoundButton18:
L_DrawRoundButton17:
L_DrawRoundButton15:
;ECGsynthetic_driver.c,3923 :: 		TFT_Write_Text(Around_button->Caption, ALeft, ATop);
ADDW	R1, R0, #24
; Around_button end address is: 0 (R0)
LDR	R1, [R1, #0]
LDRH	R2, [SP, #10]
MOV	R0, R1
LDRH	R1, [SP, #8]
BL	_TFT_Write_Text+0
;ECGsynthetic_driver.c,3924 :: 		}
L_DrawRoundButton4:
;ECGsynthetic_driver.c,3925 :: 		}
L_end_DrawRoundButton:
LDR	LR, [SP, #0]
ADD	SP, SP, #12
BX	LR
; end of _DrawRoundButton
_DrawLabel:
;ECGsynthetic_driver.c,3927 :: 		void DrawLabel(TLabel *ALabel) {
; ALabel start address is: 0 (R0)
SUB	SP, SP, #8
STR	LR, [SP, #0]
; ALabel end address is: 0 (R0)
; ALabel start address is: 0 (R0)
;ECGsynthetic_driver.c,3928 :: 		if (ALabel->Visible != 0) {
ADDW	R1, R0, #27
LDRB	R1, [R1, #0]
CMP	R1, #0
IT	EQ
BEQ	L_DrawLabel19
;ECGsynthetic_driver.c,3929 :: 		if (ALabel->VerticalText != 0)
ADDW	R1, R0, #26
LDRB	R1, [R1, #0]
CMP	R1, #0
IT	EQ
BEQ	L_DrawLabel20
;ECGsynthetic_driver.c,3930 :: 		TFT_Set_Font(ALabel->FontName, ALabel->Font_Color, FO_VERTICAL_COLUMN);
ADDW	R1, R0, #24
LDRH	R1, [R1, #0]
UXTH	R2, R1
ADDW	R1, R0, #20
LDR	R1, [R1, #0]
STR	R0, [SP, #4]
MOV	R0, R1
UXTH	R1, R2
MOVS	R2, #2
BL	_TFT_Set_Font+0
LDR	R0, [SP, #4]
IT	AL
BAL	L_DrawLabel21
L_DrawLabel20:
;ECGsynthetic_driver.c,3932 :: 		TFT_Set_Font(ALabel->FontName, ALabel->Font_Color, FO_HORIZONTAL);
ADDW	R1, R0, #24
LDRH	R1, [R1, #0]
UXTH	R2, R1
ADDW	R1, R0, #20
LDR	R1, [R1, #0]
STR	R0, [SP, #4]
MOV	R0, R1
UXTH	R1, R2
MOVS	R2, #0
BL	_TFT_Set_Font+0
LDR	R0, [SP, #4]
L_DrawLabel21:
;ECGsynthetic_driver.c,3933 :: 		TFT_Write_Text(ALabel->Caption, ALabel->Left, ALabel->Top);
ADDW	R1, R0, #8
LDRH	R1, [R1, #0]
UXTH	R3, R1
ADDS	R1, R0, #6
LDRH	R1, [R1, #0]
UXTH	R2, R1
ADDW	R1, R0, #16
; ALabel end address is: 0 (R0)
LDR	R1, [R1, #0]
MOV	R0, R1
UXTH	R1, R2
UXTH	R2, R3
BL	_TFT_Write_Text+0
;ECGsynthetic_driver.c,3934 :: 		}
L_DrawLabel19:
;ECGsynthetic_driver.c,3935 :: 		}
L_end_DrawLabel:
LDR	LR, [SP, #0]
ADD	SP, SP, #8
BX	LR
; end of _DrawLabel
_DrawImage:
;ECGsynthetic_driver.c,3937 :: 		void DrawImage(TImage *AImage) {
; AImage start address is: 0 (R0)
SUB	SP, SP, #4
STR	LR, [SP, #0]
; AImage end address is: 0 (R0)
; AImage start address is: 0 (R0)
;ECGsynthetic_driver.c,3938 :: 		if (AImage->Visible != 0) {
ADDW	R1, R0, #20
LDRB	R1, [R1, #0]
CMP	R1, #0
IT	EQ
BEQ	L_DrawImage22
;ECGsynthetic_driver.c,3939 :: 		TFT_Image_Jpeg(AImage->Left, AImage->Top, AImage->Picture_Name);
ADDW	R1, R0, #16
LDR	R1, [R1, #0]
MOV	R3, R1
ADDW	R1, R0, #8
LDRH	R1, [R1, #0]
UXTH	R2, R1
ADDS	R1, R0, #6
; AImage end address is: 0 (R0)
LDRH	R1, [R1, #0]
UXTH	R0, R1
UXTH	R1, R2
MOV	R2, R3
BL	_TFT_Image_Jpeg+0
;ECGsynthetic_driver.c,3940 :: 		}
L_DrawImage22:
;ECGsynthetic_driver.c,3941 :: 		}
L_end_DrawImage:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _DrawImage
_DrawBox:
;ECGsynthetic_driver.c,3943 :: 		void DrawBox(TBox *ABox) {
; ABox start address is: 0 (R0)
SUB	SP, SP, #8
STR	LR, [SP, #0]
; ABox end address is: 0 (R0)
; ABox start address is: 0 (R0)
;ECGsynthetic_driver.c,3944 :: 		if (ABox->Visible != 0) {
ADDW	R1, R0, #18
LDRB	R1, [R1, #0]
CMP	R1, #0
IT	EQ
BEQ	L_DrawBox23
;ECGsynthetic_driver.c,3945 :: 		if (object_pressed == 1) {
MOVW	R1, #lo_addr(_object_pressed+0)
MOVT	R1, #hi_addr(_object_pressed+0)
LDRB	R1, [R1, #0]
CMP	R1, #1
IT	NE
BNE	L_DrawBox24
;ECGsynthetic_driver.c,3946 :: 		object_pressed = 0;
MOVS	R2, #0
MOVW	R1, #lo_addr(_object_pressed+0)
MOVT	R1, #hi_addr(_object_pressed+0)
STRB	R2, [R1, #0]
;ECGsynthetic_driver.c,3947 :: 		TFT_Set_Brush(ABox->Transparent, ABox->Press_Color, ABox->Gradient, ABox->Gradient_Orientation, ABox->Gradient_End_Color, ABox->Gradient_Start_Color);
ADDW	R1, R0, #24
LDRH	R1, [R1, #0]
UXTH	R6, R1
ADDW	R1, R0, #26
LDRH	R1, [R1, #0]
UXTH	R5, R1
ADDW	R1, R0, #22
LDRB	R1, [R1, #0]
UXTB	R4, R1
ADDW	R1, R0, #21
LDRB	R1, [R1, #0]
UXTB	R3, R1
ADDW	R1, R0, #32
LDRH	R1, [R1, #0]
UXTH	R2, R1
ADDW	R1, R0, #20
LDRB	R1, [R1, #0]
STR	R0, [SP, #4]
UXTB	R0, R1
UXTH	R1, R2
UXTB	R2, R3
UXTB	R3, R4
PUSH	(R6)
PUSH	(R5)
BL	_TFT_Set_Brush+0
ADD	SP, SP, #8
LDR	R0, [SP, #4]
;ECGsynthetic_driver.c,3948 :: 		}
IT	AL
BAL	L_DrawBox25
L_DrawBox24:
;ECGsynthetic_driver.c,3950 :: 		TFT_Set_Brush(ABox->Transparent, ABox->Color, ABox->Gradient, ABox->Gradient_Orientation, ABox->Gradient_Start_Color, ABox->Gradient_End_Color);
ADDW	R1, R0, #26
LDRH	R1, [R1, #0]
UXTH	R6, R1
ADDW	R1, R0, #24
LDRH	R1, [R1, #0]
UXTH	R5, R1
ADDW	R1, R0, #22
LDRB	R1, [R1, #0]
UXTB	R4, R1
ADDW	R1, R0, #21
LDRB	R1, [R1, #0]
UXTB	R3, R1
ADDW	R1, R0, #28
LDRH	R1, [R1, #0]
UXTH	R2, R1
ADDW	R1, R0, #20
LDRB	R1, [R1, #0]
STR	R0, [SP, #4]
UXTB	R0, R1
UXTH	R1, R2
UXTB	R2, R3
UXTB	R3, R4
PUSH	(R6)
PUSH	(R5)
BL	_TFT_Set_Brush+0
ADD	SP, SP, #8
LDR	R0, [SP, #4]
;ECGsynthetic_driver.c,3951 :: 		}
L_DrawBox25:
;ECGsynthetic_driver.c,3952 :: 		TFT_Set_Pen(ABox->Pen_Color, ABox->Pen_Width);
ADDW	R1, R0, #14
LDRB	R1, [R1, #0]
UXTB	R2, R1
ADDW	R1, R0, #16
LDRH	R1, [R1, #0]
STR	R0, [SP, #4]
UXTH	R0, R1
UXTB	R1, R2
BL	_TFT_Set_Pen+0
LDR	R0, [SP, #4]
;ECGsynthetic_driver.c,3953 :: 		TFT_Rectangle(ABox->Left, ABox->Top, ABox->Left + ABox->Width - 1, ABox->Top + ABox->Height - 1);
ADDW	R1, R0, #8
LDRH	R2, [R1, #0]
ADDW	R1, R0, #12
LDRH	R1, [R1, #0]
ADDS	R1, R2, R1
UXTH	R1, R1
SUBS	R5, R1, #1
ADDS	R1, R0, #6
LDRH	R4, [R1, #0]
ADDW	R1, R0, #10
; ABox end address is: 0 (R0)
LDRH	R1, [R1, #0]
ADDS	R1, R4, R1
UXTH	R1, R1
SUBS	R3, R1, #1
SXTH	R2, R2
SXTH	R1, R4
SXTH	R0, R1
SXTH	R1, R2
SXTH	R2, R3
SXTH	R3, R5
BL	_TFT_Rectangle+0
;ECGsynthetic_driver.c,3954 :: 		}
L_DrawBox23:
;ECGsynthetic_driver.c,3955 :: 		}
L_end_DrawBox:
LDR	LR, [SP, #0]
ADD	SP, SP, #8
BX	LR
; end of _DrawBox
_DrawRoundBox:
;ECGsynthetic_driver.c,3957 :: 		void DrawRoundBox(TBox_Round *Around_box) {
; Around_box start address is: 0 (R0)
SUB	SP, SP, #8
STR	LR, [SP, #0]
; Around_box end address is: 0 (R0)
; Around_box start address is: 0 (R0)
;ECGsynthetic_driver.c,3958 :: 		if (Around_box->Visible != 0) {
ADDW	R1, R0, #18
LDRB	R1, [R1, #0]
CMP	R1, #0
IT	EQ
BEQ	L_DrawRoundBox26
;ECGsynthetic_driver.c,3959 :: 		if (object_pressed == 1) {
MOVW	R1, #lo_addr(_object_pressed+0)
MOVT	R1, #hi_addr(_object_pressed+0)
LDRB	R1, [R1, #0]
CMP	R1, #1
IT	NE
BNE	L_DrawRoundBox27
;ECGsynthetic_driver.c,3960 :: 		object_pressed = 0;
MOVS	R2, #0
MOVW	R1, #lo_addr(_object_pressed+0)
MOVT	R1, #hi_addr(_object_pressed+0)
STRB	R2, [R1, #0]
;ECGsynthetic_driver.c,3962 :: 		Around_box->Gradient_End_Color, Around_box->Gradient_Start_Color);
ADDW	R1, R0, #24
LDRH	R1, [R1, #0]
UXTH	R6, R1
ADDW	R1, R0, #26
LDRH	R1, [R1, #0]
UXTH	R5, R1
;ECGsynthetic_driver.c,3961 :: 		TFT_Set_Brush(Around_box->Transparent, Around_box->Press_Color, Around_box->Gradient, Around_box->Gradient_Orientation,
ADDW	R1, R0, #22
LDRB	R1, [R1, #0]
UXTB	R4, R1
ADDW	R1, R0, #21
LDRB	R1, [R1, #0]
UXTB	R3, R1
ADDW	R1, R0, #32
LDRH	R1, [R1, #0]
UXTH	R2, R1
ADDW	R1, R0, #20
LDRB	R1, [R1, #0]
STR	R0, [SP, #4]
UXTB	R0, R1
UXTH	R1, R2
UXTB	R2, R3
UXTB	R3, R4
;ECGsynthetic_driver.c,3962 :: 		Around_box->Gradient_End_Color, Around_box->Gradient_Start_Color);
PUSH	(R6)
PUSH	(R5)
BL	_TFT_Set_Brush+0
ADD	SP, SP, #8
;ECGsynthetic_driver.c,3961 :: 		TFT_Set_Brush(Around_box->Transparent, Around_box->Press_Color, Around_box->Gradient, Around_box->Gradient_Orientation,
LDR	R0, [SP, #4]
;ECGsynthetic_driver.c,3963 :: 		}
IT	AL
BAL	L_DrawRoundBox28
L_DrawRoundBox27:
;ECGsynthetic_driver.c,3966 :: 		Around_box->Gradient_Start_Color, Around_box->Gradient_End_Color);
ADDW	R1, R0, #26
LDRH	R1, [R1, #0]
UXTH	R6, R1
ADDW	R1, R0, #24
LDRH	R1, [R1, #0]
UXTH	R5, R1
;ECGsynthetic_driver.c,3965 :: 		TFT_Set_Brush(Around_box->Transparent, Around_box->Color, Around_box->Gradient, Around_box->Gradient_Orientation,
ADDW	R1, R0, #22
LDRB	R1, [R1, #0]
UXTB	R4, R1
ADDW	R1, R0, #21
LDRB	R1, [R1, #0]
UXTB	R3, R1
ADDW	R1, R0, #28
LDRH	R1, [R1, #0]
UXTH	R2, R1
ADDW	R1, R0, #20
LDRB	R1, [R1, #0]
STR	R0, [SP, #4]
UXTB	R0, R1
UXTH	R1, R2
UXTB	R2, R3
UXTB	R3, R4
;ECGsynthetic_driver.c,3966 :: 		Around_box->Gradient_Start_Color, Around_box->Gradient_End_Color);
PUSH	(R6)
PUSH	(R5)
BL	_TFT_Set_Brush+0
ADD	SP, SP, #8
;ECGsynthetic_driver.c,3965 :: 		TFT_Set_Brush(Around_box->Transparent, Around_box->Color, Around_box->Gradient, Around_box->Gradient_Orientation,
LDR	R0, [SP, #4]
;ECGsynthetic_driver.c,3967 :: 		}
L_DrawRoundBox28:
;ECGsynthetic_driver.c,3968 :: 		TFT_Set_Pen(Around_box->Pen_Color, Around_box->Pen_Width);
ADDW	R1, R0, #14
LDRB	R1, [R1, #0]
UXTB	R2, R1
ADDW	R1, R0, #16
LDRH	R1, [R1, #0]
STR	R0, [SP, #4]
UXTH	R0, R1
UXTB	R1, R2
BL	_TFT_Set_Pen+0
LDR	R0, [SP, #4]
;ECGsynthetic_driver.c,3971 :: 		Around_box->Top + Around_box->Height - 2, Around_box->Corner_Radius);
ADDW	R1, R0, #30
LDRB	R1, [R1, #0]
UXTB	R6, R1
ADDW	R1, R0, #8
LDRH	R2, [R1, #0]
ADDW	R1, R0, #12
LDRH	R1, [R1, #0]
ADDS	R1, R2, R1
UXTH	R1, R1
SUBS	R5, R1, #2
;ECGsynthetic_driver.c,3970 :: 		Around_box->Left + Around_box->Width - 2,
ADDS	R1, R0, #6
LDRH	R4, [R1, #0]
ADDW	R1, R0, #10
; Around_box end address is: 0 (R0)
LDRH	R1, [R1, #0]
ADDS	R1, R4, R1
UXTH	R1, R1
SUBS	R3, R1, #2
;ECGsynthetic_driver.c,3969 :: 		TFT_Rectangle_Round_Edges(Around_box->Left + 1, Around_box->Top + 1,
ADDS	R2, R2, #1
ADDS	R1, R4, #1
UXTH	R0, R1
UXTH	R1, R2
;ECGsynthetic_driver.c,3970 :: 		Around_box->Left + Around_box->Width - 2,
UXTH	R2, R3
;ECGsynthetic_driver.c,3971 :: 		Around_box->Top + Around_box->Height - 2, Around_box->Corner_Radius);
UXTH	R3, R5
PUSH	(R6)
BL	_TFT_Rectangle_Round_Edges+0
ADD	SP, SP, #4
;ECGsynthetic_driver.c,3972 :: 		}
L_DrawRoundBox26:
;ECGsynthetic_driver.c,3973 :: 		}
L_end_DrawRoundBox:
LDR	LR, [SP, #0]
ADD	SP, SP, #8
BX	LR
; end of _DrawRoundBox
_DrawRadioButton:
;ECGsynthetic_driver.c,3975 :: 		void DrawRadioButton(TRadioButton *ARadioButton) {
; ARadioButton start address is: 0 (R0)
SUB	SP, SP, #12
STR	LR, [SP, #0]
; ARadioButton end address is: 0 (R0)
; ARadioButton start address is: 0 (R0)
;ECGsynthetic_driver.c,3976 :: 		int circleOffset = 0;
;ECGsynthetic_driver.c,3977 :: 		if (ARadioButton->Visible != 0) {
ADDW	R1, R0, #18
LDRB	R1, [R1, #0]
CMP	R1, #0
IT	EQ
BEQ	L_DrawRadioButton29
;ECGsynthetic_driver.c,3978 :: 		circleOffset = ARadioButton->Height / 5;
ADDW	R1, R0, #12
LDRH	R2, [R1, #0]
MOVS	R1, #5
UDIV	R1, R2, R1
; circleOffset start address is: 28 (R7)
SXTH	R7, R1
;ECGsynthetic_driver.c,3979 :: 		TFT_Set_Pen(ARadioButton->Pen_Color, ARadioButton->Pen_Width);
ADDW	R1, R0, #14
LDRB	R1, [R1, #0]
UXTB	R2, R1
ADDW	R1, R0, #16
LDRH	R1, [R1, #0]
STR	R0, [SP, #4]
UXTH	R0, R1
UXTB	R1, R2
BL	_TFT_Set_Pen+0
LDR	R0, [SP, #4]
;ECGsynthetic_driver.c,3980 :: 		TFT_Set_Font(ARadioButton->FontName, ARadioButton->Font_Color, FO_HORIZONTAL);
ADDW	R1, R0, #36
LDRH	R1, [R1, #0]
UXTH	R2, R1
ADDW	R1, R0, #32
LDR	R1, [R1, #0]
STR	R0, [SP, #4]
MOV	R0, R1
UXTH	R1, R2
MOVS	R2, #0
BL	_TFT_Set_Font+0
LDR	R0, [SP, #4]
;ECGsynthetic_driver.c,3981 :: 		if (ARadioButton->TextAlign == _taLeft) {
ADDW	R1, R0, #28
LDRB	R1, [R1, #0]
CMP	R1, #0
IT	NE
BNE	L_DrawRadioButton30
;ECGsynthetic_driver.c,3982 :: 		TFT_Set_Brush(ARadioButton->Transparent,ARadioButton->Background_Color,0,0,0,0);
MOVS	R4, #0
MOVS	R3, #0
ADDW	R1, R0, #46
LDRH	R1, [R1, #0]
UXTH	R2, R1
ADDW	R1, R0, #21
LDRB	R1, [R1, #0]
STR	R0, [SP, #4]
PUSH	(R4)
PUSH	(R3)
MOVS	R3, #0
UXTB	R0, R1
UXTH	R1, R2
MOVS	R2, #0
BL	_TFT_Set_Brush+0
ADD	SP, SP, #8
LDR	R0, [SP, #4]
;ECGsynthetic_driver.c,3983 :: 		TFT_Circle(ARadioButton->Left + ARadioButton->Height / 2, ARadioButton->Top + ARadioButton->Height / 2, ARadioButton->Height / 2);
ADDW	R1, R0, #12
LDRH	R1, [R1, #0]
LSRS	R3, R1, #1
UXTH	R3, R3
ADDW	R1, R0, #8
LDRH	R1, [R1, #0]
ADDS	R2, R1, R3
ADDS	R1, R0, #6
LDRH	R1, [R1, #0]
ADDS	R1, R1, R3
STRH	R7, [SP, #4]
STR	R0, [SP, #8]
SXTH	R0, R1
SXTH	R1, R2
SXTH	R2, R3
BL	_TFT_Circle+0
LDR	R0, [SP, #8]
LDRSH	R7, [SP, #4]
;ECGsynthetic_driver.c,3984 :: 		if (ARadioButton->Checked != 0) {
ADDW	R1, R0, #20
LDRB	R1, [R1, #0]
CMP	R1, #0
IT	EQ
BEQ	L_DrawRadioButton31
;ECGsynthetic_driver.c,3985 :: 		if (object_pressed == 1) {
MOVW	R1, #lo_addr(_object_pressed+0)
MOVT	R1, #hi_addr(_object_pressed+0)
LDRB	R1, [R1, #0]
CMP	R1, #1
IT	NE
BNE	L_DrawRadioButton32
;ECGsynthetic_driver.c,3986 :: 		object_pressed = 0;
MOVS	R2, #0
MOVW	R1, #lo_addr(_object_pressed+0)
MOVT	R1, #hi_addr(_object_pressed+0)
STRB	R2, [R1, #0]
;ECGsynthetic_driver.c,3987 :: 		TFT_Set_Brush(ARadioButton->Transparent, ARadioButton->Press_Color, ARadioButton->Gradient, ARadioButton->Gradient_Orientation, ARadioButton->Gradient_End_Color, ARadioButton->Gradient_Start_Color);
ADDW	R1, R0, #40
LDRH	R1, [R1, #0]
UXTH	R6, R1
ADDW	R1, R0, #42
LDRH	R1, [R1, #0]
UXTH	R5, R1
ADDW	R1, R0, #39
LDRB	R1, [R1, #0]
UXTB	R4, R1
ADDW	R1, R0, #38
LDRB	R1, [R1, #0]
UXTB	R3, R1
ADDW	R1, R0, #50
LDRH	R1, [R1, #0]
UXTH	R2, R1
ADDW	R1, R0, #21
LDRB	R1, [R1, #0]
STR	R0, [SP, #4]
UXTB	R0, R1
UXTH	R1, R2
UXTB	R2, R3
UXTB	R3, R4
PUSH	(R6)
PUSH	(R5)
BL	_TFT_Set_Brush+0
ADD	SP, SP, #8
LDR	R0, [SP, #4]
;ECGsynthetic_driver.c,3988 :: 		} else
IT	AL
BAL	L_DrawRadioButton33
L_DrawRadioButton32:
;ECGsynthetic_driver.c,3989 :: 		TFT_Set_Brush(ARadioButton->Transparent, ARadioButton->Color, ARadioButton->Gradient, ARadioButton->Gradient_Orientation, ARadioButton->Gradient_Start_Color, ARadioButton->Gradient_End_Color);
ADDW	R1, R0, #42
LDRH	R1, [R1, #0]
UXTH	R6, R1
ADDW	R1, R0, #40
LDRH	R1, [R1, #0]
UXTH	R5, R1
ADDW	R1, R0, #39
LDRB	R1, [R1, #0]
UXTB	R4, R1
ADDW	R1, R0, #38
LDRB	R1, [R1, #0]
UXTB	R3, R1
ADDW	R1, R0, #44
LDRH	R1, [R1, #0]
UXTH	R2, R1
ADDW	R1, R0, #21
LDRB	R1, [R1, #0]
STR	R0, [SP, #4]
UXTB	R0, R1
UXTH	R1, R2
UXTB	R2, R3
UXTB	R3, R4
PUSH	(R6)
PUSH	(R5)
BL	_TFT_Set_Brush+0
ADD	SP, SP, #8
LDR	R0, [SP, #4]
L_DrawRadioButton33:
;ECGsynthetic_driver.c,3990 :: 		TFT_Circle(ARadioButton->Left + ARadioButton->Height / 2 , ARadioButton->Top + ARadioButton->Height / 2, ARadioButton->Height / 2 - circleOffset);
ADDW	R1, R0, #12
LDRH	R1, [R1, #0]
LSRS	R4, R1, #1
UXTH	R4, R4
SUB	R3, R4, R7
; circleOffset end address is: 28 (R7)
ADDW	R1, R0, #8
LDRH	R1, [R1, #0]
ADDS	R2, R1, R4
ADDS	R1, R0, #6
LDRH	R1, [R1, #0]
ADDS	R1, R1, R4
STR	R0, [SP, #4]
SXTH	R0, R1
SXTH	R1, R2
SXTH	R2, R3
BL	_TFT_Circle+0
LDR	R0, [SP, #4]
;ECGsynthetic_driver.c,3991 :: 		}
IT	AL
BAL	L_DrawRadioButton34
L_DrawRadioButton31:
;ECGsynthetic_driver.c,3993 :: 		if (object_pressed == 1)
MOVW	R1, #lo_addr(_object_pressed+0)
MOVT	R1, #hi_addr(_object_pressed+0)
LDRB	R1, [R1, #0]
CMP	R1, #1
IT	NE
BNE	L_DrawRadioButton35
;ECGsynthetic_driver.c,3994 :: 		object_pressed = 0;
MOVS	R2, #0
MOVW	R1, #lo_addr(_object_pressed+0)
MOVT	R1, #hi_addr(_object_pressed+0)
STRB	R2, [R1, #0]
L_DrawRadioButton35:
;ECGsynthetic_driver.c,3995 :: 		}
L_DrawRadioButton34:
;ECGsynthetic_driver.c,3996 :: 		TFT_Write_Text_Return_Pos(ARadioButton->Caption, ARadioButton->Left + ARadioButton->Height + 4, ARadioButton->Top);
ADDW	R1, R0, #8
LDRH	R1, [R1, #0]
UXTH	R3, R1
ADDS	R1, R0, #6
LDRH	R2, [R1, #0]
ADDW	R1, R0, #12
LDRH	R1, [R1, #0]
ADDS	R1, R2, R1
UXTH	R1, R1
ADDS	R2, R1, #4
ADDW	R1, R0, #24
LDR	R1, [R1, #0]
STR	R0, [SP, #4]
MOV	R0, R1
UXTH	R1, R2
UXTH	R2, R3
BL	_TFT_Write_Text_Return_Pos+0
LDR	R0, [SP, #4]
;ECGsynthetic_driver.c,3997 :: 		TFT_Write_Text(ARadioButton->Caption, ARadioButton->Left + ARadioButton->Height + 4, (ARadioButton->Top + ((ARadioButton->Height - caption_height) / 2)));
ADDW	R1, R0, #8
LDRH	R3, [R1, #0]
ADDW	R1, R0, #12
LDRH	R2, [R1, #0]
MOVW	R1, #lo_addr(_caption_height+0)
MOVT	R1, #hi_addr(_caption_height+0)
LDRH	R1, [R1, #0]
SUB	R1, R2, R1
UXTH	R1, R1
LSRS	R1, R1, #1
UXTH	R1, R1
ADDS	R3, R3, R1
ADDS	R1, R0, #6
LDRH	R1, [R1, #0]
ADDS	R1, R1, R2
UXTH	R1, R1
ADDS	R2, R1, #4
ADDW	R1, R0, #24
; ARadioButton end address is: 0 (R0)
LDR	R1, [R1, #0]
MOV	R0, R1
UXTH	R1, R2
UXTH	R2, R3
BL	_TFT_Write_Text+0
;ECGsynthetic_driver.c,3998 :: 		} else {
IT	AL
BAL	L_DrawRadioButton36
L_DrawRadioButton30:
;ECGsynthetic_driver.c,3999 :: 		TFT_Set_Brush(ARadioButton->Transparent,ARadioButton->Background_Color,0,0,0,0);
; circleOffset start address is: 28 (R7)
; ARadioButton start address is: 0 (R0)
MOVS	R4, #0
MOVS	R3, #0
ADDW	R1, R0, #46
LDRH	R1, [R1, #0]
UXTH	R2, R1
ADDW	R1, R0, #21
LDRB	R1, [R1, #0]
STR	R0, [SP, #4]
PUSH	(R4)
PUSH	(R3)
MOVS	R3, #0
UXTB	R0, R1
UXTH	R1, R2
MOVS	R2, #0
BL	_TFT_Set_Brush+0
ADD	SP, SP, #8
LDR	R0, [SP, #4]
;ECGsynthetic_driver.c,4000 :: 		TFT_Circle(ARadioButton->Left  + ARadioButton->Width - ARadioButton->Height / 2, ARadioButton->Top + ARadioButton->Height / 2, ARadioButton->Height / 2);
ADDW	R1, R0, #12
LDRH	R1, [R1, #0]
LSRS	R4, R1, #1
UXTH	R4, R4
ADDW	R1, R0, #8
LDRH	R1, [R1, #0]
ADDS	R3, R1, R4
ADDS	R1, R0, #6
LDRH	R2, [R1, #0]
ADDW	R1, R0, #10
LDRH	R1, [R1, #0]
ADDS	R1, R2, R1
UXTH	R1, R1
SUB	R1, R1, R4
STRH	R7, [SP, #4]
STR	R0, [SP, #8]
SXTH	R2, R4
SXTH	R0, R1
SXTH	R1, R3
BL	_TFT_Circle+0
LDR	R0, [SP, #8]
LDRSH	R7, [SP, #4]
;ECGsynthetic_driver.c,4001 :: 		if (ARadioButton->Checked != 0) {
ADDW	R1, R0, #20
LDRB	R1, [R1, #0]
CMP	R1, #0
IT	EQ
BEQ	L_DrawRadioButton37
;ECGsynthetic_driver.c,4002 :: 		if (object_pressed == 1) {
MOVW	R1, #lo_addr(_object_pressed+0)
MOVT	R1, #hi_addr(_object_pressed+0)
LDRB	R1, [R1, #0]
CMP	R1, #1
IT	NE
BNE	L_DrawRadioButton38
;ECGsynthetic_driver.c,4003 :: 		object_pressed = 0;
MOVS	R2, #0
MOVW	R1, #lo_addr(_object_pressed+0)
MOVT	R1, #hi_addr(_object_pressed+0)
STRB	R2, [R1, #0]
;ECGsynthetic_driver.c,4004 :: 		TFT_Set_Brush(ARadioButton->Transparent, ARadioButton->Press_Color, ARadioButton->Gradient, ARadioButton->Gradient_Orientation, ARadioButton->Gradient_End_Color, ARadioButton->Gradient_Start_Color);
ADDW	R1, R0, #40
LDRH	R1, [R1, #0]
UXTH	R6, R1
ADDW	R1, R0, #42
LDRH	R1, [R1, #0]
UXTH	R5, R1
ADDW	R1, R0, #39
LDRB	R1, [R1, #0]
UXTB	R4, R1
ADDW	R1, R0, #38
LDRB	R1, [R1, #0]
UXTB	R3, R1
ADDW	R1, R0, #50
LDRH	R1, [R1, #0]
UXTH	R2, R1
ADDW	R1, R0, #21
LDRB	R1, [R1, #0]
STR	R0, [SP, #4]
UXTB	R0, R1
UXTH	R1, R2
UXTB	R2, R3
UXTB	R3, R4
PUSH	(R6)
PUSH	(R5)
BL	_TFT_Set_Brush+0
ADD	SP, SP, #8
LDR	R0, [SP, #4]
;ECGsynthetic_driver.c,4005 :: 		} else
IT	AL
BAL	L_DrawRadioButton39
L_DrawRadioButton38:
;ECGsynthetic_driver.c,4006 :: 		TFT_Set_Brush(ARadioButton->Transparent, ARadioButton->Color, ARadioButton->Gradient, ARadioButton->Gradient_Orientation, ARadioButton->Gradient_Start_Color, ARadioButton->Gradient_End_Color);
ADDW	R1, R0, #42
LDRH	R1, [R1, #0]
UXTH	R6, R1
ADDW	R1, R0, #40
LDRH	R1, [R1, #0]
UXTH	R5, R1
ADDW	R1, R0, #39
LDRB	R1, [R1, #0]
UXTB	R4, R1
ADDW	R1, R0, #38
LDRB	R1, [R1, #0]
UXTB	R3, R1
ADDW	R1, R0, #44
LDRH	R1, [R1, #0]
UXTH	R2, R1
ADDW	R1, R0, #21
LDRB	R1, [R1, #0]
STR	R0, [SP, #4]
UXTB	R0, R1
UXTH	R1, R2
UXTB	R2, R3
UXTB	R3, R4
PUSH	(R6)
PUSH	(R5)
BL	_TFT_Set_Brush+0
ADD	SP, SP, #8
LDR	R0, [SP, #4]
L_DrawRadioButton39:
;ECGsynthetic_driver.c,4007 :: 		TFT_Circle(ARadioButton->Left  + ARadioButton->Width - ARadioButton->Height / 2, ARadioButton->Top + ARadioButton->Height / 2, ARadioButton->Height / 2 - circleOffset);
ADDW	R1, R0, #12
LDRH	R1, [R1, #0]
LSRS	R5, R1, #1
UXTH	R5, R5
SUB	R4, R5, R7
; circleOffset end address is: 28 (R7)
ADDW	R1, R0, #8
LDRH	R1, [R1, #0]
ADDS	R3, R1, R5
ADDS	R1, R0, #6
LDRH	R2, [R1, #0]
ADDW	R1, R0, #10
LDRH	R1, [R1, #0]
ADDS	R1, R2, R1
UXTH	R1, R1
SUB	R1, R1, R5
STR	R0, [SP, #4]
SXTH	R2, R4
SXTH	R0, R1
SXTH	R1, R3
BL	_TFT_Circle+0
LDR	R0, [SP, #4]
;ECGsynthetic_driver.c,4008 :: 		}
IT	AL
BAL	L_DrawRadioButton40
L_DrawRadioButton37:
;ECGsynthetic_driver.c,4010 :: 		if (object_pressed == 1)
MOVW	R1, #lo_addr(_object_pressed+0)
MOVT	R1, #hi_addr(_object_pressed+0)
LDRB	R1, [R1, #0]
CMP	R1, #1
IT	NE
BNE	L_DrawRadioButton41
;ECGsynthetic_driver.c,4011 :: 		object_pressed = 0;
MOVS	R2, #0
MOVW	R1, #lo_addr(_object_pressed+0)
MOVT	R1, #hi_addr(_object_pressed+0)
STRB	R2, [R1, #0]
L_DrawRadioButton41:
;ECGsynthetic_driver.c,4012 :: 		}
L_DrawRadioButton40:
;ECGsynthetic_driver.c,4013 :: 		TFT_Write_Text_Return_Pos(ARadioButton->Caption, ARadioButton->Left + 3, ARadioButton->Top);
ADDW	R1, R0, #8
LDRH	R1, [R1, #0]
UXTH	R3, R1
ADDS	R1, R0, #6
LDRH	R1, [R1, #0]
ADDS	R2, R1, #3
ADDW	R1, R0, #24
LDR	R1, [R1, #0]
STR	R0, [SP, #4]
MOV	R0, R1
UXTH	R1, R2
UXTH	R2, R3
BL	_TFT_Write_Text_Return_Pos+0
LDR	R0, [SP, #4]
;ECGsynthetic_driver.c,4014 :: 		TFT_Write_Text(ARadioButton->Caption, ARadioButton->Left + 3, ARadioButton->Top + (ARadioButton->Height - caption_height) / 2);
ADDW	R1, R0, #8
LDRH	R3, [R1, #0]
ADDW	R1, R0, #12
LDRH	R2, [R1, #0]
MOVW	R1, #lo_addr(_caption_height+0)
MOVT	R1, #hi_addr(_caption_height+0)
LDRH	R1, [R1, #0]
SUB	R1, R2, R1
UXTH	R1, R1
LSRS	R1, R1, #1
UXTH	R1, R1
ADDS	R3, R3, R1
ADDS	R1, R0, #6
LDRH	R1, [R1, #0]
ADDS	R2, R1, #3
ADDW	R1, R0, #24
; ARadioButton end address is: 0 (R0)
LDR	R1, [R1, #0]
MOV	R0, R1
UXTH	R1, R2
UXTH	R2, R3
BL	_TFT_Write_Text+0
;ECGsynthetic_driver.c,4015 :: 		}
L_DrawRadioButton36:
;ECGsynthetic_driver.c,4016 :: 		}
L_DrawRadioButton29:
;ECGsynthetic_driver.c,4017 :: 		}
L_end_DrawRadioButton:
LDR	LR, [SP, #0]
ADD	SP, SP, #12
BX	LR
; end of _DrawRadioButton
_DrawScreen:
;ECGsynthetic_driver.c,4019 :: 		void DrawScreen(TScreen *aScreen) {
; aScreen start address is: 0 (R0)
SUB	SP, SP, #56
STR	LR, [SP, #0]
; aScreen end address is: 0 (R0)
; aScreen start address is: 0 (R0)
;ECGsynthetic_driver.c,4035 :: 		object_pressed = 0;
MOVS	R2, #0
MOVW	R1, #lo_addr(_object_pressed+0)
MOVT	R1, #hi_addr(_object_pressed+0)
STRB	R2, [R1, #0]
;ECGsynthetic_driver.c,4036 :: 		order = 0;
MOVS	R1, #0
STRH	R1, [SP, #4]
;ECGsynthetic_driver.c,4037 :: 		round_button_idx = 0;
MOVS	R1, #0
STRB	R1, [SP, #6]
;ECGsynthetic_driver.c,4038 :: 		label_idx = 0;
MOVS	R1, #0
STRB	R1, [SP, #12]
;ECGsynthetic_driver.c,4039 :: 		image_idx = 0;
MOVS	R1, #0
STRB	R1, [SP, #20]
;ECGsynthetic_driver.c,4040 :: 		box_idx = 0;
MOVS	R1, #0
STRB	R1, [SP, #28]
;ECGsynthetic_driver.c,4041 :: 		round_box_idx = 0;
MOVS	R1, #0
STRB	R1, [SP, #36]
;ECGsynthetic_driver.c,4042 :: 		radio_button_idx = 0;
MOVS	R1, #0
STRB	R1, [SP, #44]
;ECGsynthetic_driver.c,4043 :: 		CurrentScreen = aScreen;
MOVW	R1, #lo_addr(_CurrentScreen+0)
MOVT	R1, #hi_addr(_CurrentScreen+0)
STR	R0, [R1, #0]
;ECGsynthetic_driver.c,4045 :: 		if ((display_width != CurrentScreen->Width) || (display_height != CurrentScreen->Height)) {
ADDS	R1, R0, #2
; aScreen end address is: 0 (R0)
LDRH	R2, [R1, #0]
MOVW	R1, #lo_addr(_display_width+0)
MOVT	R1, #hi_addr(_display_width+0)
LDRH	R1, [R1, #0]
CMP	R1, R2
IT	NE
BNE	L__DrawScreen215
MOVW	R1, #lo_addr(_CurrentScreen+0)
MOVT	R1, #hi_addr(_CurrentScreen+0)
LDR	R1, [R1, #0]
ADDS	R1, R1, #4
LDRH	R2, [R1, #0]
MOVW	R1, #lo_addr(_display_height+0)
MOVT	R1, #hi_addr(_display_height+0)
LDRH	R1, [R1, #0]
CMP	R1, R2
IT	NE
BNE	L__DrawScreen214
IT	AL
BAL	L_DrawScreen44
L__DrawScreen215:
L__DrawScreen214:
;ECGsynthetic_driver.c,4046 :: 		save_bled = TFT_BLED;
MOVW	R2, #lo_addr(GPIOF_ODR+0)
MOVT	R2, #hi_addr(GPIOF_ODR+0)
_LX	[R2, ByteOffset(GPIOF_ODR+0)]
STRB	R1, [SP, #52]
;ECGsynthetic_driver.c,4047 :: 		TFT_BLED           = 0;
MOVS	R1, #0
SXTB	R1, R1
_SX	[R2, ByteOffset(GPIOF_ODR+0)]
;ECGsynthetic_driver.c,4048 :: 		TFT_Set_Active(Set_Index, Write_Command, Write_Data);
MOVW	R3, #lo_addr(_Write_Data+0)
MOVT	R3, #hi_addr(_Write_Data+0)
MOVW	R2, #lo_addr(_Write_Command+0)
MOVT	R2, #hi_addr(_Write_Command+0)
MOVW	R1, #lo_addr(_Set_Index+0)
MOVT	R1, #hi_addr(_Set_Index+0)
MOV	R0, R1
MOV	R1, R2
MOV	R2, R3
BL	_TFT_Set_Active+0
;ECGsynthetic_driver.c,4049 :: 		TFT_Init_SSD1963_Board_50(CurrentScreen->Width, CurrentScreen->Height);
MOVW	R3, #lo_addr(_CurrentScreen+0)
MOVT	R3, #hi_addr(_CurrentScreen+0)
LDR	R1, [R3, #0]
ADDS	R1, R1, #4
LDRH	R1, [R1, #0]
UXTH	R2, R1
MOV	R1, R3
LDR	R1, [R1, #0]
ADDS	R1, R1, #2
LDRH	R1, [R1, #0]
UXTH	R0, R1
UXTH	R1, R2
BL	_TFT_Init_SSD1963_Board_50+0
;ECGsynthetic_driver.c,4050 :: 		FT5XX6_SetSize(CurrentScreen->Width, CurrentScreen->Height);
MOVW	R3, #lo_addr(_CurrentScreen+0)
MOVT	R3, #hi_addr(_CurrentScreen+0)
LDR	R1, [R3, #0]
ADDS	R1, R1, #4
LDRH	R1, [R1, #0]
UXTH	R2, R1
MOV	R1, R3
LDR	R1, [R1, #0]
ADDS	R1, R1, #2
LDRH	R1, [R1, #0]
UXTH	R0, R1
UXTH	R1, R2
BL	_FT5XX6_SetSize+0
;ECGsynthetic_driver.c,4051 :: 		TFT_Fill_Screen(CurrentScreen->Color);
MOVW	R1, #lo_addr(_CurrentScreen+0)
MOVT	R1, #hi_addr(_CurrentScreen+0)
LDR	R1, [R1, #0]
LDRH	R1, [R1, #0]
UXTH	R0, R1
BL	_TFT_Fill_Screen+0
;ECGsynthetic_driver.c,4052 :: 		TFT_Set_DBC_SSD1963(255);
MOVS	R0, #255
BL	_TFT_Set_DBC_SSD1963+0
;ECGsynthetic_driver.c,4053 :: 		display_width = CurrentScreen->Width;
MOVW	R3, #lo_addr(_CurrentScreen+0)
MOVT	R3, #hi_addr(_CurrentScreen+0)
LDR	R1, [R3, #0]
ADDS	R1, R1, #2
LDRH	R2, [R1, #0]
MOVW	R1, #lo_addr(_display_width+0)
MOVT	R1, #hi_addr(_display_width+0)
STRH	R2, [R1, #0]
;ECGsynthetic_driver.c,4054 :: 		display_height = CurrentScreen->Height;
MOV	R1, R3
LDR	R1, [R1, #0]
ADDS	R1, R1, #4
LDRH	R2, [R1, #0]
MOVW	R1, #lo_addr(_display_height+0)
MOVT	R1, #hi_addr(_display_height+0)
STRH	R2, [R1, #0]
;ECGsynthetic_driver.c,4055 :: 		TFT_BLED           = save_bled;
LDRB	R2, [SP, #52]
MOVW	R1, #lo_addr(GPIOF_ODR+0)
MOVT	R1, #hi_addr(GPIOF_ODR+0)
_SX	[R1, ByteOffset(GPIOF_ODR+0)]
;ECGsynthetic_driver.c,4056 :: 		}
IT	AL
BAL	L_DrawScreen45
L_DrawScreen44:
;ECGsynthetic_driver.c,4058 :: 		TFT_Fill_Screen(CurrentScreen->Color);
MOVW	R1, #lo_addr(_CurrentScreen+0)
MOVT	R1, #hi_addr(_CurrentScreen+0)
LDR	R1, [R1, #0]
LDRH	R1, [R1, #0]
UXTH	R0, R1
BL	_TFT_Fill_Screen+0
L_DrawScreen45:
;ECGsynthetic_driver.c,4061 :: 		while (order < CurrentScreen->ObjectsCount) {
L_DrawScreen46:
MOVW	R1, #lo_addr(_CurrentScreen+0)
MOVT	R1, #hi_addr(_CurrentScreen+0)
LDR	R1, [R1, #0]
ADDS	R1, R1, #6
LDRH	R2, [R1, #0]
LDRH	R1, [SP, #4]
CMP	R1, R2
IT	CS
BCS	L_DrawScreen47
;ECGsynthetic_driver.c,4062 :: 		if (round_button_idx < CurrentScreen->Buttons_RoundCount) {
MOVW	R1, #lo_addr(_CurrentScreen+0)
MOVT	R1, #hi_addr(_CurrentScreen+0)
LDR	R1, [R1, #0]
ADDS	R1, #8
LDRH	R2, [R1, #0]
LDRB	R1, [SP, #6]
CMP	R1, R2
IT	CS
BCS	L_DrawScreen48
;ECGsynthetic_driver.c,4063 :: 		local_round_button = GetRoundButton(round_button_idx);
MOVW	R1, #lo_addr(_CurrentScreen+0)
MOVT	R1, #hi_addr(_CurrentScreen+0)
LDR	R1, [R1, #0]
ADDS	R1, #12
LDR	R2, [R1, #0]
LDRB	R1, [SP, #6]
LSLS	R1, R1, #2
ADDS	R1, R2, R1
LDR	R1, [R1, #0]
STR	R1, [SP, #8]
;ECGsynthetic_driver.c,4064 :: 		if (order == local_round_button->Order) {
ADDS	R1, R1, #4
LDRB	R2, [R1, #0]
LDRH	R1, [SP, #4]
CMP	R1, R2
IT	NE
BNE	L_DrawScreen49
;ECGsynthetic_driver.c,4065 :: 		round_button_idx++;
LDRB	R1, [SP, #6]
ADDS	R1, R1, #1
STRB	R1, [SP, #6]
;ECGsynthetic_driver.c,4066 :: 		order++;
LDRH	R1, [SP, #4]
ADDS	R1, R1, #1
STRH	R1, [SP, #4]
;ECGsynthetic_driver.c,4067 :: 		DrawRoundButton(local_round_button);
LDR	R0, [SP, #8]
BL	_DrawRoundButton+0
;ECGsynthetic_driver.c,4068 :: 		}
L_DrawScreen49:
;ECGsynthetic_driver.c,4069 :: 		}
L_DrawScreen48:
;ECGsynthetic_driver.c,4071 :: 		if (label_idx < CurrentScreen->LabelsCount) {
MOVW	R1, #lo_addr(_CurrentScreen+0)
MOVT	R1, #hi_addr(_CurrentScreen+0)
LDR	R1, [R1, #0]
ADDS	R1, #16
LDRH	R2, [R1, #0]
LDRB	R1, [SP, #12]
CMP	R1, R2
IT	CS
BCS	L_DrawScreen50
;ECGsynthetic_driver.c,4072 :: 		local_label = GetLabel(label_idx);
MOVW	R1, #lo_addr(_CurrentScreen+0)
MOVT	R1, #hi_addr(_CurrentScreen+0)
LDR	R1, [R1, #0]
ADDS	R1, #20
LDR	R2, [R1, #0]
LDRB	R1, [SP, #12]
LSLS	R1, R1, #2
ADDS	R1, R2, R1
LDR	R1, [R1, #0]
STR	R1, [SP, #16]
;ECGsynthetic_driver.c,4073 :: 		if (order == local_label->Order) {
ADDS	R1, R1, #4
LDRB	R2, [R1, #0]
LDRH	R1, [SP, #4]
CMP	R1, R2
IT	NE
BNE	L_DrawScreen51
;ECGsynthetic_driver.c,4074 :: 		label_idx++;
LDRB	R1, [SP, #12]
ADDS	R1, R1, #1
STRB	R1, [SP, #12]
;ECGsynthetic_driver.c,4075 :: 		order++;
LDRH	R1, [SP, #4]
ADDS	R1, R1, #1
STRH	R1, [SP, #4]
;ECGsynthetic_driver.c,4076 :: 		DrawLabel(local_label);
LDR	R0, [SP, #16]
BL	_DrawLabel+0
;ECGsynthetic_driver.c,4077 :: 		}
L_DrawScreen51:
;ECGsynthetic_driver.c,4078 :: 		}
L_DrawScreen50:
;ECGsynthetic_driver.c,4080 :: 		if (box_idx < CurrentScreen->BoxesCount) {
MOVW	R1, #lo_addr(_CurrentScreen+0)
MOVT	R1, #hi_addr(_CurrentScreen+0)
LDR	R1, [R1, #0]
ADDS	R1, #32
LDRH	R2, [R1, #0]
LDRB	R1, [SP, #28]
CMP	R1, R2
IT	CS
BCS	L_DrawScreen52
;ECGsynthetic_driver.c,4081 :: 		local_box = GetBox(box_idx);
MOVW	R1, #lo_addr(_CurrentScreen+0)
MOVT	R1, #hi_addr(_CurrentScreen+0)
LDR	R1, [R1, #0]
ADDS	R1, #36
LDR	R2, [R1, #0]
LDRB	R1, [SP, #28]
LSLS	R1, R1, #2
ADDS	R1, R2, R1
LDR	R1, [R1, #0]
STR	R1, [SP, #32]
;ECGsynthetic_driver.c,4082 :: 		if (order == local_box->Order) {
ADDS	R1, R1, #4
LDRB	R2, [R1, #0]
LDRH	R1, [SP, #4]
CMP	R1, R2
IT	NE
BNE	L_DrawScreen53
;ECGsynthetic_driver.c,4083 :: 		box_idx++;
LDRB	R1, [SP, #28]
ADDS	R1, R1, #1
STRB	R1, [SP, #28]
;ECGsynthetic_driver.c,4084 :: 		order++;
LDRH	R1, [SP, #4]
ADDS	R1, R1, #1
STRH	R1, [SP, #4]
;ECGsynthetic_driver.c,4085 :: 		DrawBox(local_box);
LDR	R0, [SP, #32]
BL	_DrawBox+0
;ECGsynthetic_driver.c,4086 :: 		}
L_DrawScreen53:
;ECGsynthetic_driver.c,4087 :: 		}
L_DrawScreen52:
;ECGsynthetic_driver.c,4089 :: 		if (round_box_idx < CurrentScreen->Boxes_RoundCount) {
MOVW	R1, #lo_addr(_CurrentScreen+0)
MOVT	R1, #hi_addr(_CurrentScreen+0)
LDR	R1, [R1, #0]
ADDS	R1, #40
LDRH	R2, [R1, #0]
LDRB	R1, [SP, #36]
CMP	R1, R2
IT	CS
BCS	L_DrawScreen54
;ECGsynthetic_driver.c,4090 :: 		local_round_box = GetBox_Round(round_box_idx);
MOVW	R1, #lo_addr(_CurrentScreen+0)
MOVT	R1, #hi_addr(_CurrentScreen+0)
LDR	R1, [R1, #0]
ADDS	R1, #44
LDR	R2, [R1, #0]
LDRB	R1, [SP, #36]
LSLS	R1, R1, #2
ADDS	R1, R2, R1
LDR	R1, [R1, #0]
STR	R1, [SP, #40]
;ECGsynthetic_driver.c,4091 :: 		if (order == local_round_box->Order) {
ADDS	R1, R1, #4
LDRB	R2, [R1, #0]
LDRH	R1, [SP, #4]
CMP	R1, R2
IT	NE
BNE	L_DrawScreen55
;ECGsynthetic_driver.c,4092 :: 		round_box_idx++;
LDRB	R1, [SP, #36]
ADDS	R1, R1, #1
STRB	R1, [SP, #36]
;ECGsynthetic_driver.c,4093 :: 		order++;
LDRH	R1, [SP, #4]
ADDS	R1, R1, #1
STRH	R1, [SP, #4]
;ECGsynthetic_driver.c,4094 :: 		DrawRoundBox(local_round_box);
LDR	R0, [SP, #40]
BL	_DrawRoundBox+0
;ECGsynthetic_driver.c,4095 :: 		}
L_DrawScreen55:
;ECGsynthetic_driver.c,4096 :: 		}
L_DrawScreen54:
;ECGsynthetic_driver.c,4098 :: 		if (image_idx < CurrentScreen->ImagesCount) {
MOVW	R1, #lo_addr(_CurrentScreen+0)
MOVT	R1, #hi_addr(_CurrentScreen+0)
LDR	R1, [R1, #0]
ADDS	R1, #24
LDRH	R2, [R1, #0]
LDRB	R1, [SP, #20]
CMP	R1, R2
IT	CS
BCS	L_DrawScreen56
;ECGsynthetic_driver.c,4099 :: 		local_image = GetImage(image_idx);
MOVW	R1, #lo_addr(_CurrentScreen+0)
MOVT	R1, #hi_addr(_CurrentScreen+0)
LDR	R1, [R1, #0]
ADDS	R1, #28
LDR	R2, [R1, #0]
LDRB	R1, [SP, #20]
LSLS	R1, R1, #2
ADDS	R1, R2, R1
LDR	R1, [R1, #0]
STR	R1, [SP, #24]
;ECGsynthetic_driver.c,4100 :: 		if (order == local_image->Order) {
ADDS	R1, R1, #4
LDRB	R2, [R1, #0]
LDRH	R1, [SP, #4]
CMP	R1, R2
IT	NE
BNE	L_DrawScreen57
;ECGsynthetic_driver.c,4101 :: 		image_idx++;
LDRB	R1, [SP, #20]
ADDS	R1, R1, #1
STRB	R1, [SP, #20]
;ECGsynthetic_driver.c,4102 :: 		order++;
LDRH	R1, [SP, #4]
ADDS	R1, R1, #1
STRH	R1, [SP, #4]
;ECGsynthetic_driver.c,4103 :: 		DrawImage(local_image);
LDR	R0, [SP, #24]
BL	_DrawImage+0
;ECGsynthetic_driver.c,4104 :: 		}
L_DrawScreen57:
;ECGsynthetic_driver.c,4105 :: 		}
L_DrawScreen56:
;ECGsynthetic_driver.c,4107 :: 		if (radio_button_idx < CurrentScreen->RadioButtonsCount) {
MOVW	R1, #lo_addr(_CurrentScreen+0)
MOVT	R1, #hi_addr(_CurrentScreen+0)
LDR	R1, [R1, #0]
ADDS	R1, #48
LDRH	R2, [R1, #0]
LDRB	R1, [SP, #44]
CMP	R1, R2
IT	CS
BCS	L_DrawScreen58
;ECGsynthetic_driver.c,4108 :: 		local_radio_button = GetRadioButton(radio_button_idx);
MOVW	R1, #lo_addr(_CurrentScreen+0)
MOVT	R1, #hi_addr(_CurrentScreen+0)
LDR	R1, [R1, #0]
ADDS	R1, #52
LDR	R2, [R1, #0]
LDRB	R1, [SP, #44]
LSLS	R1, R1, #2
ADDS	R1, R2, R1
LDR	R1, [R1, #0]
STR	R1, [SP, #48]
;ECGsynthetic_driver.c,4109 :: 		if (order == local_radio_button->Order) {
ADDS	R1, R1, #4
LDRB	R2, [R1, #0]
LDRH	R1, [SP, #4]
CMP	R1, R2
IT	NE
BNE	L_DrawScreen59
;ECGsynthetic_driver.c,4110 :: 		radio_button_idx++;
LDRB	R1, [SP, #44]
ADDS	R1, R1, #1
STRB	R1, [SP, #44]
;ECGsynthetic_driver.c,4111 :: 		order++;
LDRH	R1, [SP, #4]
ADDS	R1, R1, #1
STRH	R1, [SP, #4]
;ECGsynthetic_driver.c,4112 :: 		DrawRadioButton(local_radio_button);
LDR	R0, [SP, #48]
BL	_DrawRadioButton+0
;ECGsynthetic_driver.c,4113 :: 		}
L_DrawScreen59:
;ECGsynthetic_driver.c,4114 :: 		}
L_DrawScreen58:
;ECGsynthetic_driver.c,4116 :: 		}
IT	AL
BAL	L_DrawScreen46
L_DrawScreen47:
;ECGsynthetic_driver.c,4117 :: 		}
L_end_DrawScreen:
LDR	LR, [SP, #0]
ADD	SP, SP, #56
BX	LR
; end of _DrawScreen
_Get_Object:
;ECGsynthetic_driver.c,4119 :: 		void Get_Object(unsigned int X, unsigned int Y) {
; Y start address is: 4 (R1)
; X start address is: 0 (R0)
SUB	SP, SP, #8
STR	LR, [SP, #0]
; Y end address is: 4 (R1)
; X end address is: 0 (R0)
; X start address is: 0 (R0)
; Y start address is: 4 (R1)
;ECGsynthetic_driver.c,4120 :: 		round_button_order  = -1;
MOVW	R3, #65535
SXTH	R3, R3
MOVW	R2, #lo_addr(_round_button_order+0)
MOVT	R2, #hi_addr(_round_button_order+0)
STRH	R3, [R2, #0]
;ECGsynthetic_driver.c,4121 :: 		label_order         = -1;
MOVW	R3, #65535
SXTH	R3, R3
MOVW	R2, #lo_addr(_label_order+0)
MOVT	R2, #hi_addr(_label_order+0)
STRH	R3, [R2, #0]
;ECGsynthetic_driver.c,4122 :: 		image_order         = -1;
MOVW	R3, #65535
SXTH	R3, R3
MOVW	R2, #lo_addr(_image_order+0)
MOVT	R2, #hi_addr(_image_order+0)
STRH	R3, [R2, #0]
;ECGsynthetic_driver.c,4123 :: 		box_order           = -1;
MOVW	R3, #65535
SXTH	R3, R3
MOVW	R2, #lo_addr(_box_order+0)
MOVT	R2, #hi_addr(_box_order+0)
STRH	R3, [R2, #0]
;ECGsynthetic_driver.c,4124 :: 		box_round_order     = -1;
MOVW	R3, #65535
SXTH	R3, R3
MOVW	R2, #lo_addr(_box_round_order+0)
MOVT	R2, #hi_addr(_box_round_order+0)
STRH	R3, [R2, #0]
;ECGsynthetic_driver.c,4125 :: 		radio_button_order  = -1;
MOVW	R3, #65535
SXTH	R3, R3
MOVW	R2, #lo_addr(_radio_button_order+0)
MOVT	R2, #hi_addr(_radio_button_order+0)
STRH	R3, [R2, #0]
;ECGsynthetic_driver.c,4127 :: 		for ( _object_count = 0 ; _object_count < CurrentScreen->Buttons_RoundCount ; _object_count++ ) {
MOVS	R3, #0
SXTH	R3, R3
MOVW	R2, #lo_addr(__object_count+0)
MOVT	R2, #hi_addr(__object_count+0)
STRH	R3, [R2, #0]
; X end address is: 0 (R0)
; Y end address is: 4 (R1)
UXTH	R8, R0
UXTH	R7, R1
L_Get_Object60:
; Y start address is: 28 (R7)
; X start address is: 32 (R8)
MOVW	R2, #lo_addr(_CurrentScreen+0)
MOVT	R2, #hi_addr(_CurrentScreen+0)
LDR	R2, [R2, #0]
ADDS	R2, #8
LDRH	R3, [R2, #0]
MOVW	R2, #lo_addr(__object_count+0)
MOVT	R2, #hi_addr(__object_count+0)
LDRSH	R2, [R2, #0]
CMP	R2, R3
IT	CS
BCS	L_Get_Object61
;ECGsynthetic_driver.c,4128 :: 		local_round_button = GetRoundButton(_object_count);
MOVW	R2, #lo_addr(_CurrentScreen+0)
MOVT	R2, #hi_addr(_CurrentScreen+0)
LDR	R2, [R2, #0]
ADDS	R2, #12
LDR	R3, [R2, #0]
MOVW	R2, #lo_addr(__object_count+0)
MOVT	R2, #hi_addr(__object_count+0)
LDRSH	R2, [R2, #0]
LSLS	R2, R2, #2
ADDS	R2, R3, R2
LDR	R3, [R2, #0]
MOVW	R2, #lo_addr(_local_round_button+0)
MOVT	R2, #hi_addr(_local_round_button+0)
STR	R3, [R2, #0]
;ECGsynthetic_driver.c,4129 :: 		if (local_round_button->Active != 0) {
ADDW	R2, R3, #19
LDRB	R2, [R2, #0]
CMP	R2, #0
IT	EQ
BEQ	L_Get_Object63
;ECGsynthetic_driver.c,4131 :: 		local_round_button->Width, local_round_button->Height) == 1) {
MOVW	R6, #lo_addr(_local_round_button+0)
MOVT	R6, #hi_addr(_local_round_button+0)
LDR	R2, [R6, #0]
ADDS	R2, #12
LDRH	R2, [R2, #0]
UXTH	R5, R2
MOV	R2, R6
LDR	R2, [R2, #0]
ADDS	R2, #10
LDRH	R2, [R2, #0]
UXTH	R4, R2
;ECGsynthetic_driver.c,4130 :: 		if (IsInsideObject(X, Y, local_round_button->Left, local_round_button->Top,
MOV	R2, R6
LDR	R2, [R2, #0]
ADDS	R2, #8
LDRH	R2, [R2, #0]
UXTH	R3, R2
MOV	R2, R6
LDR	R2, [R2, #0]
ADDS	R2, R2, #6
LDRH	R2, [R2, #0]
UXTH	R1, R7
UXTH	R0, R8
;ECGsynthetic_driver.c,4131 :: 		local_round_button->Width, local_round_button->Height) == 1) {
PUSH	(R5)
PUSH	(R4)
BL	ECGsynthetic_driver_IsInsideObject+0
ADD	SP, SP, #8
CMP	R0, #1
IT	NE
BNE	L_Get_Object64
;ECGsynthetic_driver.c,4132 :: 		round_button_order = local_round_button->Order;
MOVW	R4, #lo_addr(_local_round_button+0)
MOVT	R4, #hi_addr(_local_round_button+0)
LDR	R2, [R4, #0]
ADDS	R2, R2, #4
LDRB	R3, [R2, #0]
MOVW	R2, #lo_addr(_round_button_order+0)
MOVT	R2, #hi_addr(_round_button_order+0)
STRH	R3, [R2, #0]
;ECGsynthetic_driver.c,4133 :: 		exec_round_button = local_round_button;
MOV	R2, R4
LDR	R3, [R2, #0]
MOVW	R2, #lo_addr(_exec_round_button+0)
MOVT	R2, #hi_addr(_exec_round_button+0)
STR	R3, [R2, #0]
;ECGsynthetic_driver.c,4134 :: 		}
L_Get_Object64:
;ECGsynthetic_driver.c,4135 :: 		}
L_Get_Object63:
;ECGsynthetic_driver.c,4127 :: 		for ( _object_count = 0 ; _object_count < CurrentScreen->Buttons_RoundCount ; _object_count++ ) {
MOVW	R3, #lo_addr(__object_count+0)
MOVT	R3, #hi_addr(__object_count+0)
LDRSH	R2, [R3, #0]
ADDS	R2, R2, #1
STRH	R2, [R3, #0]
;ECGsynthetic_driver.c,4136 :: 		}
IT	AL
BAL	L_Get_Object60
L_Get_Object61:
;ECGsynthetic_driver.c,4139 :: 		for ( _object_count = 0 ; _object_count < CurrentScreen->LabelsCount ; _object_count++ ) {
MOVS	R3, #0
SXTH	R3, R3
MOVW	R2, #lo_addr(__object_count+0)
MOVT	R2, #hi_addr(__object_count+0)
STRH	R3, [R2, #0]
; Y end address is: 28 (R7)
; X end address is: 32 (R8)
STRH	R8, [SP, #4]
UXTH	R8, R7
LDRH	R7, [SP, #4]
L_Get_Object65:
; X start address is: 28 (R7)
; Y start address is: 32 (R8)
MOVW	R2, #lo_addr(_CurrentScreen+0)
MOVT	R2, #hi_addr(_CurrentScreen+0)
LDR	R2, [R2, #0]
ADDS	R2, #16
LDRH	R3, [R2, #0]
MOVW	R2, #lo_addr(__object_count+0)
MOVT	R2, #hi_addr(__object_count+0)
LDRSH	R2, [R2, #0]
CMP	R2, R3
IT	CS
BCS	L_Get_Object66
;ECGsynthetic_driver.c,4140 :: 		local_label = GetLabel(_object_count);
MOVW	R2, #lo_addr(_CurrentScreen+0)
MOVT	R2, #hi_addr(_CurrentScreen+0)
LDR	R2, [R2, #0]
ADDS	R2, #20
LDR	R3, [R2, #0]
MOVW	R2, #lo_addr(__object_count+0)
MOVT	R2, #hi_addr(__object_count+0)
LDRSH	R2, [R2, #0]
LSLS	R2, R2, #2
ADDS	R2, R3, R2
LDR	R3, [R2, #0]
MOVW	R2, #lo_addr(_local_label+0)
MOVT	R2, #hi_addr(_local_label+0)
STR	R3, [R2, #0]
;ECGsynthetic_driver.c,4141 :: 		if (local_label->Active != 0) {
ADDW	R2, R3, #28
LDRB	R2, [R2, #0]
CMP	R2, #0
IT	EQ
BEQ	L_Get_Object68
;ECGsynthetic_driver.c,4143 :: 		local_label->Width, local_label->Height) == 1) {
MOVW	R6, #lo_addr(_local_label+0)
MOVT	R6, #hi_addr(_local_label+0)
LDR	R2, [R6, #0]
ADDS	R2, #12
LDRH	R2, [R2, #0]
UXTH	R5, R2
MOV	R2, R6
LDR	R2, [R2, #0]
ADDS	R2, #10
LDRH	R2, [R2, #0]
UXTH	R4, R2
;ECGsynthetic_driver.c,4142 :: 		if (IsInsideObject(X, Y, local_label->Left, local_label->Top,
MOV	R2, R6
LDR	R2, [R2, #0]
ADDS	R2, #8
LDRH	R2, [R2, #0]
UXTH	R3, R2
MOV	R2, R6
LDR	R2, [R2, #0]
ADDS	R2, R2, #6
LDRH	R2, [R2, #0]
UXTH	R1, R8
UXTH	R0, R7
;ECGsynthetic_driver.c,4143 :: 		local_label->Width, local_label->Height) == 1) {
PUSH	(R5)
PUSH	(R4)
BL	ECGsynthetic_driver_IsInsideObject+0
ADD	SP, SP, #8
CMP	R0, #1
IT	NE
BNE	L_Get_Object69
;ECGsynthetic_driver.c,4144 :: 		label_order = local_label->Order;
MOVW	R4, #lo_addr(_local_label+0)
MOVT	R4, #hi_addr(_local_label+0)
LDR	R2, [R4, #0]
ADDS	R2, R2, #4
LDRB	R3, [R2, #0]
MOVW	R2, #lo_addr(_label_order+0)
MOVT	R2, #hi_addr(_label_order+0)
STRH	R3, [R2, #0]
;ECGsynthetic_driver.c,4145 :: 		exec_label = local_label;
MOV	R2, R4
LDR	R3, [R2, #0]
MOVW	R2, #lo_addr(_exec_label+0)
MOVT	R2, #hi_addr(_exec_label+0)
STR	R3, [R2, #0]
;ECGsynthetic_driver.c,4146 :: 		}
L_Get_Object69:
;ECGsynthetic_driver.c,4147 :: 		}
L_Get_Object68:
;ECGsynthetic_driver.c,4139 :: 		for ( _object_count = 0 ; _object_count < CurrentScreen->LabelsCount ; _object_count++ ) {
MOVW	R3, #lo_addr(__object_count+0)
MOVT	R3, #hi_addr(__object_count+0)
LDRSH	R2, [R3, #0]
ADDS	R2, R2, #1
STRH	R2, [R3, #0]
;ECGsynthetic_driver.c,4148 :: 		}
IT	AL
BAL	L_Get_Object65
L_Get_Object66:
;ECGsynthetic_driver.c,4151 :: 		for ( _object_count = 0 ; _object_count < CurrentScreen->ImagesCount ; _object_count++ ) {
MOVS	R3, #0
SXTH	R3, R3
MOVW	R2, #lo_addr(__object_count+0)
MOVT	R2, #hi_addr(__object_count+0)
STRH	R3, [R2, #0]
; X end address is: 28 (R7)
; Y end address is: 32 (R8)
STRH	R8, [SP, #4]
UXTH	R8, R7
LDRH	R7, [SP, #4]
L_Get_Object70:
; Y start address is: 28 (R7)
; X start address is: 32 (R8)
MOVW	R2, #lo_addr(_CurrentScreen+0)
MOVT	R2, #hi_addr(_CurrentScreen+0)
LDR	R2, [R2, #0]
ADDS	R2, #24
LDRH	R3, [R2, #0]
MOVW	R2, #lo_addr(__object_count+0)
MOVT	R2, #hi_addr(__object_count+0)
LDRSH	R2, [R2, #0]
CMP	R2, R3
IT	CS
BCS	L_Get_Object71
;ECGsynthetic_driver.c,4152 :: 		local_image = GetImage(_object_count);
MOVW	R2, #lo_addr(_CurrentScreen+0)
MOVT	R2, #hi_addr(_CurrentScreen+0)
LDR	R2, [R2, #0]
ADDS	R2, #28
LDR	R3, [R2, #0]
MOVW	R2, #lo_addr(__object_count+0)
MOVT	R2, #hi_addr(__object_count+0)
LDRSH	R2, [R2, #0]
LSLS	R2, R2, #2
ADDS	R2, R3, R2
LDR	R3, [R2, #0]
MOVW	R2, #lo_addr(_local_image+0)
MOVT	R2, #hi_addr(_local_image+0)
STR	R3, [R2, #0]
;ECGsynthetic_driver.c,4153 :: 		if (local_image->Active != 0) {
ADDW	R2, R3, #21
LDRB	R2, [R2, #0]
CMP	R2, #0
IT	EQ
BEQ	L_Get_Object73
;ECGsynthetic_driver.c,4155 :: 		local_image->Width, local_image->Height) == 1) {
MOVW	R6, #lo_addr(_local_image+0)
MOVT	R6, #hi_addr(_local_image+0)
LDR	R2, [R6, #0]
ADDS	R2, #12
LDRH	R2, [R2, #0]
UXTH	R5, R2
MOV	R2, R6
LDR	R2, [R2, #0]
ADDS	R2, #10
LDRH	R2, [R2, #0]
UXTH	R4, R2
;ECGsynthetic_driver.c,4154 :: 		if (IsInsideObject(X, Y, local_image->Left, local_image->Top,
MOV	R2, R6
LDR	R2, [R2, #0]
ADDS	R2, #8
LDRH	R2, [R2, #0]
UXTH	R3, R2
MOV	R2, R6
LDR	R2, [R2, #0]
ADDS	R2, R2, #6
LDRH	R2, [R2, #0]
UXTH	R1, R7
UXTH	R0, R8
;ECGsynthetic_driver.c,4155 :: 		local_image->Width, local_image->Height) == 1) {
PUSH	(R5)
PUSH	(R4)
BL	ECGsynthetic_driver_IsInsideObject+0
ADD	SP, SP, #8
CMP	R0, #1
IT	NE
BNE	L_Get_Object74
;ECGsynthetic_driver.c,4156 :: 		image_order = local_image->Order;
MOVW	R4, #lo_addr(_local_image+0)
MOVT	R4, #hi_addr(_local_image+0)
LDR	R2, [R4, #0]
ADDS	R2, R2, #4
LDRB	R3, [R2, #0]
MOVW	R2, #lo_addr(_image_order+0)
MOVT	R2, #hi_addr(_image_order+0)
STRH	R3, [R2, #0]
;ECGsynthetic_driver.c,4157 :: 		exec_image = local_image;
MOV	R2, R4
LDR	R3, [R2, #0]
MOVW	R2, #lo_addr(_exec_image+0)
MOVT	R2, #hi_addr(_exec_image+0)
STR	R3, [R2, #0]
;ECGsynthetic_driver.c,4158 :: 		}
L_Get_Object74:
;ECGsynthetic_driver.c,4159 :: 		}
L_Get_Object73:
;ECGsynthetic_driver.c,4151 :: 		for ( _object_count = 0 ; _object_count < CurrentScreen->ImagesCount ; _object_count++ ) {
MOVW	R3, #lo_addr(__object_count+0)
MOVT	R3, #hi_addr(__object_count+0)
LDRSH	R2, [R3, #0]
ADDS	R2, R2, #1
STRH	R2, [R3, #0]
;ECGsynthetic_driver.c,4160 :: 		}
IT	AL
BAL	L_Get_Object70
L_Get_Object71:
;ECGsynthetic_driver.c,4163 :: 		for ( _object_count = 0 ; _object_count < CurrentScreen->BoxesCount ; _object_count++ ) {
MOVS	R3, #0
SXTH	R3, R3
MOVW	R2, #lo_addr(__object_count+0)
MOVT	R2, #hi_addr(__object_count+0)
STRH	R3, [R2, #0]
; Y end address is: 28 (R7)
; X end address is: 32 (R8)
STRH	R8, [SP, #4]
UXTH	R8, R7
LDRH	R7, [SP, #4]
L_Get_Object75:
; X start address is: 28 (R7)
; Y start address is: 32 (R8)
MOVW	R2, #lo_addr(_CurrentScreen+0)
MOVT	R2, #hi_addr(_CurrentScreen+0)
LDR	R2, [R2, #0]
ADDS	R2, #32
LDRH	R3, [R2, #0]
MOVW	R2, #lo_addr(__object_count+0)
MOVT	R2, #hi_addr(__object_count+0)
LDRSH	R2, [R2, #0]
CMP	R2, R3
IT	CS
BCS	L_Get_Object76
;ECGsynthetic_driver.c,4164 :: 		local_box = GetBox(_object_count);
MOVW	R2, #lo_addr(_CurrentScreen+0)
MOVT	R2, #hi_addr(_CurrentScreen+0)
LDR	R2, [R2, #0]
ADDS	R2, #36
LDR	R3, [R2, #0]
MOVW	R2, #lo_addr(__object_count+0)
MOVT	R2, #hi_addr(__object_count+0)
LDRSH	R2, [R2, #0]
LSLS	R2, R2, #2
ADDS	R2, R3, R2
LDR	R3, [R2, #0]
MOVW	R2, #lo_addr(_local_box+0)
MOVT	R2, #hi_addr(_local_box+0)
STR	R3, [R2, #0]
;ECGsynthetic_driver.c,4165 :: 		if (local_box->Active != 0) {
ADDW	R2, R3, #19
LDRB	R2, [R2, #0]
CMP	R2, #0
IT	EQ
BEQ	L_Get_Object78
;ECGsynthetic_driver.c,4167 :: 		local_box->Width, local_box->Height) == 1) {
MOVW	R6, #lo_addr(_local_box+0)
MOVT	R6, #hi_addr(_local_box+0)
LDR	R2, [R6, #0]
ADDS	R2, #12
LDRH	R2, [R2, #0]
UXTH	R5, R2
MOV	R2, R6
LDR	R2, [R2, #0]
ADDS	R2, #10
LDRH	R2, [R2, #0]
UXTH	R4, R2
;ECGsynthetic_driver.c,4166 :: 		if (IsInsideObject(X, Y, local_box->Left, local_box->Top,
MOV	R2, R6
LDR	R2, [R2, #0]
ADDS	R2, #8
LDRH	R2, [R2, #0]
UXTH	R3, R2
MOV	R2, R6
LDR	R2, [R2, #0]
ADDS	R2, R2, #6
LDRH	R2, [R2, #0]
UXTH	R1, R8
UXTH	R0, R7
;ECGsynthetic_driver.c,4167 :: 		local_box->Width, local_box->Height) == 1) {
PUSH	(R5)
PUSH	(R4)
BL	ECGsynthetic_driver_IsInsideObject+0
ADD	SP, SP, #8
CMP	R0, #1
IT	NE
BNE	L_Get_Object79
;ECGsynthetic_driver.c,4168 :: 		box_order = local_box->Order;
MOVW	R4, #lo_addr(_local_box+0)
MOVT	R4, #hi_addr(_local_box+0)
LDR	R2, [R4, #0]
ADDS	R2, R2, #4
LDRB	R3, [R2, #0]
MOVW	R2, #lo_addr(_box_order+0)
MOVT	R2, #hi_addr(_box_order+0)
STRH	R3, [R2, #0]
;ECGsynthetic_driver.c,4169 :: 		exec_box = local_box;
MOV	R2, R4
LDR	R3, [R2, #0]
MOVW	R2, #lo_addr(_exec_box+0)
MOVT	R2, #hi_addr(_exec_box+0)
STR	R3, [R2, #0]
;ECGsynthetic_driver.c,4170 :: 		}
L_Get_Object79:
;ECGsynthetic_driver.c,4171 :: 		}
L_Get_Object78:
;ECGsynthetic_driver.c,4163 :: 		for ( _object_count = 0 ; _object_count < CurrentScreen->BoxesCount ; _object_count++ ) {
MOVW	R3, #lo_addr(__object_count+0)
MOVT	R3, #hi_addr(__object_count+0)
LDRSH	R2, [R3, #0]
ADDS	R2, R2, #1
STRH	R2, [R3, #0]
;ECGsynthetic_driver.c,4172 :: 		}
IT	AL
BAL	L_Get_Object75
L_Get_Object76:
;ECGsynthetic_driver.c,4175 :: 		for ( _object_count = 0 ; _object_count < CurrentScreen->Boxes_RoundCount ; _object_count++ ) {
MOVS	R3, #0
SXTH	R3, R3
MOVW	R2, #lo_addr(__object_count+0)
MOVT	R2, #hi_addr(__object_count+0)
STRH	R3, [R2, #0]
; X end address is: 28 (R7)
; Y end address is: 32 (R8)
STRH	R8, [SP, #4]
UXTH	R8, R7
LDRH	R7, [SP, #4]
L_Get_Object80:
; Y start address is: 28 (R7)
; X start address is: 32 (R8)
MOVW	R2, #lo_addr(_CurrentScreen+0)
MOVT	R2, #hi_addr(_CurrentScreen+0)
LDR	R2, [R2, #0]
ADDS	R2, #40
LDRH	R3, [R2, #0]
MOVW	R2, #lo_addr(__object_count+0)
MOVT	R2, #hi_addr(__object_count+0)
LDRSH	R2, [R2, #0]
CMP	R2, R3
IT	CS
BCS	L_Get_Object81
;ECGsynthetic_driver.c,4176 :: 		local_round_box = GetBox_Round(_object_count);
MOVW	R2, #lo_addr(_CurrentScreen+0)
MOVT	R2, #hi_addr(_CurrentScreen+0)
LDR	R2, [R2, #0]
ADDS	R2, #44
LDR	R3, [R2, #0]
MOVW	R2, #lo_addr(__object_count+0)
MOVT	R2, #hi_addr(__object_count+0)
LDRSH	R2, [R2, #0]
LSLS	R2, R2, #2
ADDS	R2, R3, R2
LDR	R3, [R2, #0]
MOVW	R2, #lo_addr(_local_round_box+0)
MOVT	R2, #hi_addr(_local_round_box+0)
STR	R3, [R2, #0]
;ECGsynthetic_driver.c,4177 :: 		if (local_round_box->Active != 0) {
ADDW	R2, R3, #19
LDRB	R2, [R2, #0]
CMP	R2, #0
IT	EQ
BEQ	L_Get_Object83
;ECGsynthetic_driver.c,4179 :: 		local_round_box->Width, local_round_box->Height) == 1) {
MOVW	R6, #lo_addr(_local_round_box+0)
MOVT	R6, #hi_addr(_local_round_box+0)
LDR	R2, [R6, #0]
ADDS	R2, #12
LDRH	R2, [R2, #0]
UXTH	R5, R2
MOV	R2, R6
LDR	R2, [R2, #0]
ADDS	R2, #10
LDRH	R2, [R2, #0]
UXTH	R4, R2
;ECGsynthetic_driver.c,4178 :: 		if (IsInsideObject(X, Y, local_round_box->Left, local_round_box->Top,
MOV	R2, R6
LDR	R2, [R2, #0]
ADDS	R2, #8
LDRH	R2, [R2, #0]
UXTH	R3, R2
MOV	R2, R6
LDR	R2, [R2, #0]
ADDS	R2, R2, #6
LDRH	R2, [R2, #0]
UXTH	R1, R7
UXTH	R0, R8
;ECGsynthetic_driver.c,4179 :: 		local_round_box->Width, local_round_box->Height) == 1) {
PUSH	(R5)
PUSH	(R4)
BL	ECGsynthetic_driver_IsInsideObject+0
ADD	SP, SP, #8
CMP	R0, #1
IT	NE
BNE	L_Get_Object84
;ECGsynthetic_driver.c,4180 :: 		box_round_order = local_round_box->Order;
MOVW	R4, #lo_addr(_local_round_box+0)
MOVT	R4, #hi_addr(_local_round_box+0)
LDR	R2, [R4, #0]
ADDS	R2, R2, #4
LDRB	R3, [R2, #0]
MOVW	R2, #lo_addr(_box_round_order+0)
MOVT	R2, #hi_addr(_box_round_order+0)
STRH	R3, [R2, #0]
;ECGsynthetic_driver.c,4181 :: 		exec_round_box = local_round_box;
MOV	R2, R4
LDR	R3, [R2, #0]
MOVW	R2, #lo_addr(_exec_round_box+0)
MOVT	R2, #hi_addr(_exec_round_box+0)
STR	R3, [R2, #0]
;ECGsynthetic_driver.c,4182 :: 		}
L_Get_Object84:
;ECGsynthetic_driver.c,4183 :: 		}
L_Get_Object83:
;ECGsynthetic_driver.c,4175 :: 		for ( _object_count = 0 ; _object_count < CurrentScreen->Boxes_RoundCount ; _object_count++ ) {
MOVW	R3, #lo_addr(__object_count+0)
MOVT	R3, #hi_addr(__object_count+0)
LDRSH	R2, [R3, #0]
ADDS	R2, R2, #1
STRH	R2, [R3, #0]
;ECGsynthetic_driver.c,4184 :: 		}
IT	AL
BAL	L_Get_Object80
L_Get_Object81:
;ECGsynthetic_driver.c,4187 :: 		for ( _object_count = 0 ; _object_count < CurrentScreen->RadioButtonsCount ; _object_count++ ) {
MOVS	R3, #0
SXTH	R3, R3
MOVW	R2, #lo_addr(__object_count+0)
MOVT	R2, #hi_addr(__object_count+0)
STRH	R3, [R2, #0]
; Y end address is: 28 (R7)
; X end address is: 32 (R8)
STRH	R8, [SP, #4]
UXTH	R8, R7
LDRH	R7, [SP, #4]
L_Get_Object85:
; Y start address is: 32 (R8)
; X start address is: 28 (R7)
; X start address is: 28 (R7)
; X end address is: 28 (R7)
; Y start address is: 32 (R8)
; Y end address is: 32 (R8)
MOVW	R2, #lo_addr(_CurrentScreen+0)
MOVT	R2, #hi_addr(_CurrentScreen+0)
LDR	R2, [R2, #0]
ADDS	R2, #48
LDRH	R3, [R2, #0]
MOVW	R2, #lo_addr(__object_count+0)
MOVT	R2, #hi_addr(__object_count+0)
LDRSH	R2, [R2, #0]
CMP	R2, R3
IT	CS
BCS	L_Get_Object86
; X end address is: 28 (R7)
; Y end address is: 32 (R8)
;ECGsynthetic_driver.c,4188 :: 		local_radio_button = GetRadioButton(_object_count);
; Y start address is: 32 (R8)
; X start address is: 28 (R7)
MOVW	R2, #lo_addr(_CurrentScreen+0)
MOVT	R2, #hi_addr(_CurrentScreen+0)
LDR	R2, [R2, #0]
ADDS	R2, #52
LDR	R3, [R2, #0]
MOVW	R2, #lo_addr(__object_count+0)
MOVT	R2, #hi_addr(__object_count+0)
LDRSH	R2, [R2, #0]
LSLS	R2, R2, #2
ADDS	R2, R3, R2
LDR	R3, [R2, #0]
MOVW	R2, #lo_addr(_local_radio_button+0)
MOVT	R2, #hi_addr(_local_radio_button+0)
STR	R3, [R2, #0]
;ECGsynthetic_driver.c,4189 :: 		if (local_radio_button->Active != 0) {
ADDW	R2, R3, #19
LDRB	R2, [R2, #0]
CMP	R2, #0
IT	EQ
BEQ	L_Get_Object88
;ECGsynthetic_driver.c,4191 :: 		local_radio_button->Width, local_radio_button->Height) == 1) {
MOVW	R6, #lo_addr(_local_radio_button+0)
MOVT	R6, #hi_addr(_local_radio_button+0)
LDR	R2, [R6, #0]
ADDS	R2, #12
LDRH	R2, [R2, #0]
UXTH	R5, R2
MOV	R2, R6
LDR	R2, [R2, #0]
ADDS	R2, #10
LDRH	R2, [R2, #0]
UXTH	R4, R2
;ECGsynthetic_driver.c,4190 :: 		if (IsInsideObject(X, Y, local_radio_button->Left, local_radio_button->Top,
MOV	R2, R6
LDR	R2, [R2, #0]
ADDS	R2, #8
LDRH	R2, [R2, #0]
UXTH	R3, R2
MOV	R2, R6
LDR	R2, [R2, #0]
ADDS	R2, R2, #6
LDRH	R2, [R2, #0]
UXTH	R1, R8
UXTH	R0, R7
;ECGsynthetic_driver.c,4191 :: 		local_radio_button->Width, local_radio_button->Height) == 1) {
PUSH	(R5)
PUSH	(R4)
BL	ECGsynthetic_driver_IsInsideObject+0
ADD	SP, SP, #8
CMP	R0, #1
IT	NE
BNE	L_Get_Object89
;ECGsynthetic_driver.c,4192 :: 		radio_button_order = local_radio_button->Order;
MOVW	R4, #lo_addr(_local_radio_button+0)
MOVT	R4, #hi_addr(_local_radio_button+0)
LDR	R2, [R4, #0]
ADDS	R2, R2, #4
LDRB	R3, [R2, #0]
MOVW	R2, #lo_addr(_radio_button_order+0)
MOVT	R2, #hi_addr(_radio_button_order+0)
STRH	R3, [R2, #0]
;ECGsynthetic_driver.c,4193 :: 		exec_radio_button = local_radio_button;
MOV	R2, R4
LDR	R3, [R2, #0]
MOVW	R2, #lo_addr(_exec_radio_button+0)
MOVT	R2, #hi_addr(_exec_radio_button+0)
STR	R3, [R2, #0]
;ECGsynthetic_driver.c,4194 :: 		}
L_Get_Object89:
;ECGsynthetic_driver.c,4195 :: 		}
L_Get_Object88:
;ECGsynthetic_driver.c,4187 :: 		for ( _object_count = 0 ; _object_count < CurrentScreen->RadioButtonsCount ; _object_count++ ) {
MOVW	R3, #lo_addr(__object_count+0)
MOVT	R3, #hi_addr(__object_count+0)
LDRSH	R2, [R3, #0]
ADDS	R2, R2, #1
STRH	R2, [R3, #0]
;ECGsynthetic_driver.c,4196 :: 		}
; X end address is: 28 (R7)
; Y end address is: 32 (R8)
IT	AL
BAL	L_Get_Object85
L_Get_Object86:
;ECGsynthetic_driver.c,4198 :: 		_object_count = -1;
MOVW	R3, #65535
SXTH	R3, R3
MOVW	R2, #lo_addr(__object_count+0)
MOVT	R2, #hi_addr(__object_count+0)
STRH	R3, [R2, #0]
;ECGsynthetic_driver.c,4199 :: 		if (round_button_order >  _object_count )
MOVW	R2, #lo_addr(_round_button_order+0)
MOVT	R2, #hi_addr(_round_button_order+0)
LDRSH	R2, [R2, #0]
CMP	R2, #-1
IT	LE
BLE	L_Get_Object90
;ECGsynthetic_driver.c,4200 :: 		_object_count = round_button_order;
MOVW	R2, #lo_addr(_round_button_order+0)
MOVT	R2, #hi_addr(_round_button_order+0)
LDRSH	R3, [R2, #0]
MOVW	R2, #lo_addr(__object_count+0)
MOVT	R2, #hi_addr(__object_count+0)
STRH	R3, [R2, #0]
L_Get_Object90:
;ECGsynthetic_driver.c,4201 :: 		if (label_order >  _object_count )
MOVW	R2, #lo_addr(__object_count+0)
MOVT	R2, #hi_addr(__object_count+0)
LDRSH	R3, [R2, #0]
MOVW	R2, #lo_addr(_label_order+0)
MOVT	R2, #hi_addr(_label_order+0)
LDRSH	R2, [R2, #0]
CMP	R2, R3
IT	LE
BLE	L_Get_Object91
;ECGsynthetic_driver.c,4202 :: 		_object_count = label_order;
MOVW	R2, #lo_addr(_label_order+0)
MOVT	R2, #hi_addr(_label_order+0)
LDRSH	R3, [R2, #0]
MOVW	R2, #lo_addr(__object_count+0)
MOVT	R2, #hi_addr(__object_count+0)
STRH	R3, [R2, #0]
L_Get_Object91:
;ECGsynthetic_driver.c,4203 :: 		if (image_order >  _object_count )
MOVW	R2, #lo_addr(__object_count+0)
MOVT	R2, #hi_addr(__object_count+0)
LDRSH	R3, [R2, #0]
MOVW	R2, #lo_addr(_image_order+0)
MOVT	R2, #hi_addr(_image_order+0)
LDRSH	R2, [R2, #0]
CMP	R2, R3
IT	LE
BLE	L_Get_Object92
;ECGsynthetic_driver.c,4204 :: 		_object_count = image_order;
MOVW	R2, #lo_addr(_image_order+0)
MOVT	R2, #hi_addr(_image_order+0)
LDRSH	R3, [R2, #0]
MOVW	R2, #lo_addr(__object_count+0)
MOVT	R2, #hi_addr(__object_count+0)
STRH	R3, [R2, #0]
L_Get_Object92:
;ECGsynthetic_driver.c,4205 :: 		if (box_order >  _object_count )
MOVW	R2, #lo_addr(__object_count+0)
MOVT	R2, #hi_addr(__object_count+0)
LDRSH	R3, [R2, #0]
MOVW	R2, #lo_addr(_box_order+0)
MOVT	R2, #hi_addr(_box_order+0)
LDRSH	R2, [R2, #0]
CMP	R2, R3
IT	LE
BLE	L_Get_Object93
;ECGsynthetic_driver.c,4206 :: 		_object_count = box_order;
MOVW	R2, #lo_addr(_box_order+0)
MOVT	R2, #hi_addr(_box_order+0)
LDRSH	R3, [R2, #0]
MOVW	R2, #lo_addr(__object_count+0)
MOVT	R2, #hi_addr(__object_count+0)
STRH	R3, [R2, #0]
L_Get_Object93:
;ECGsynthetic_driver.c,4207 :: 		if (box_round_order >  _object_count )
MOVW	R2, #lo_addr(__object_count+0)
MOVT	R2, #hi_addr(__object_count+0)
LDRSH	R3, [R2, #0]
MOVW	R2, #lo_addr(_box_round_order+0)
MOVT	R2, #hi_addr(_box_round_order+0)
LDRSH	R2, [R2, #0]
CMP	R2, R3
IT	LE
BLE	L_Get_Object94
;ECGsynthetic_driver.c,4208 :: 		_object_count = box_round_order;
MOVW	R2, #lo_addr(_box_round_order+0)
MOVT	R2, #hi_addr(_box_round_order+0)
LDRSH	R3, [R2, #0]
MOVW	R2, #lo_addr(__object_count+0)
MOVT	R2, #hi_addr(__object_count+0)
STRH	R3, [R2, #0]
L_Get_Object94:
;ECGsynthetic_driver.c,4209 :: 		if (radio_button_order >  _object_count )
MOVW	R2, #lo_addr(__object_count+0)
MOVT	R2, #hi_addr(__object_count+0)
LDRSH	R3, [R2, #0]
MOVW	R2, #lo_addr(_radio_button_order+0)
MOVT	R2, #hi_addr(_radio_button_order+0)
LDRSH	R2, [R2, #0]
CMP	R2, R3
IT	LE
BLE	L_Get_Object95
;ECGsynthetic_driver.c,4210 :: 		_object_count = radio_button_order;
MOVW	R2, #lo_addr(_radio_button_order+0)
MOVT	R2, #hi_addr(_radio_button_order+0)
LDRSH	R3, [R2, #0]
MOVW	R2, #lo_addr(__object_count+0)
MOVT	R2, #hi_addr(__object_count+0)
STRH	R3, [R2, #0]
L_Get_Object95:
;ECGsynthetic_driver.c,4211 :: 		}
L_end_Get_Object:
LDR	LR, [SP, #0]
ADD	SP, SP, #8
BX	LR
; end of _Get_Object
_Process_TP_Press:
;ECGsynthetic_driver.c,4214 :: 		void Process_TP_Press(unsigned int X, unsigned int Y) {
; Y start address is: 4 (R1)
; X start address is: 0 (R0)
SUB	SP, SP, #4
STR	LR, [SP, #0]
; Y end address is: 4 (R1)
; X end address is: 0 (R0)
; X start address is: 0 (R0)
; Y start address is: 4 (R1)
;ECGsynthetic_driver.c,4215 :: 		exec_round_button   = 0;
MOVS	R3, #0
MOVW	R2, #lo_addr(_exec_round_button+0)
MOVT	R2, #hi_addr(_exec_round_button+0)
STR	R3, [R2, #0]
;ECGsynthetic_driver.c,4216 :: 		exec_label          = 0;
MOVS	R3, #0
MOVW	R2, #lo_addr(_exec_label+0)
MOVT	R2, #hi_addr(_exec_label+0)
STR	R3, [R2, #0]
;ECGsynthetic_driver.c,4217 :: 		exec_image          = 0;
MOVS	R3, #0
MOVW	R2, #lo_addr(_exec_image+0)
MOVT	R2, #hi_addr(_exec_image+0)
STR	R3, [R2, #0]
;ECGsynthetic_driver.c,4218 :: 		exec_box            = 0;
MOVS	R3, #0
MOVW	R2, #lo_addr(_exec_box+0)
MOVT	R2, #hi_addr(_exec_box+0)
STR	R3, [R2, #0]
;ECGsynthetic_driver.c,4219 :: 		exec_round_box      = 0;
MOVS	R3, #0
MOVW	R2, #lo_addr(_exec_round_box+0)
MOVT	R2, #hi_addr(_exec_round_box+0)
STR	R3, [R2, #0]
;ECGsynthetic_driver.c,4220 :: 		exec_radio_button   = 0;
MOVS	R3, #0
MOVW	R2, #lo_addr(_exec_radio_button+0)
MOVT	R2, #hi_addr(_exec_radio_button+0)
STR	R3, [R2, #0]
;ECGsynthetic_driver.c,4222 :: 		Get_Object(X, Y);
; Y end address is: 4 (R1)
; X end address is: 0 (R0)
BL	_Get_Object+0
;ECGsynthetic_driver.c,4224 :: 		if (_object_count != -1) {
MOVW	R2, #lo_addr(__object_count+0)
MOVT	R2, #hi_addr(__object_count+0)
LDRSH	R2, [R2, #0]
CMP	R2, #-1
IT	EQ
BEQ	L_Process_TP_Press96
;ECGsynthetic_driver.c,4225 :: 		if (_object_count == round_button_order) {
MOVW	R2, #lo_addr(_round_button_order+0)
MOVT	R2, #hi_addr(_round_button_order+0)
LDRSH	R3, [R2, #0]
MOVW	R2, #lo_addr(__object_count+0)
MOVT	R2, #hi_addr(__object_count+0)
LDRSH	R2, [R2, #0]
CMP	R2, R3
IT	NE
BNE	L_Process_TP_Press97
;ECGsynthetic_driver.c,4226 :: 		if (exec_round_button->Active != 0) {
MOVW	R2, #lo_addr(_exec_round_button+0)
MOVT	R2, #hi_addr(_exec_round_button+0)
LDR	R2, [R2, #0]
ADDS	R2, #19
LDRB	R2, [R2, #0]
CMP	R2, #0
IT	EQ
BEQ	L_Process_TP_Press98
;ECGsynthetic_driver.c,4227 :: 		if (exec_round_button->OnPressPtr != 0) {
MOVW	R4, #lo_addr(_exec_round_button+0)
MOVT	R4, #hi_addr(_exec_round_button+0)
LDR	R4, [R4, #0]
ADDS	R4, #64
LDR	R4, [R4, #0]
CMP	R4, #0
IT	EQ
BEQ	L_Process_TP_Press99
;ECGsynthetic_driver.c,4228 :: 		exec_round_button->OnPressPtr();
MOVW	R4, #lo_addr(_exec_round_button+0)
MOVT	R4, #hi_addr(_exec_round_button+0)
LDR	R4, [R4, #0]
ADDS	R4, #64
LDR	R2, [R4, #0]
BLX	R2
;ECGsynthetic_driver.c,4229 :: 		return;
IT	AL
BAL	L_end_Process_TP_Press
;ECGsynthetic_driver.c,4230 :: 		}
L_Process_TP_Press99:
;ECGsynthetic_driver.c,4231 :: 		}
L_Process_TP_Press98:
;ECGsynthetic_driver.c,4232 :: 		}
L_Process_TP_Press97:
;ECGsynthetic_driver.c,4234 :: 		if (_object_count == label_order) {
MOVW	R2, #lo_addr(_label_order+0)
MOVT	R2, #hi_addr(_label_order+0)
LDRSH	R3, [R2, #0]
MOVW	R2, #lo_addr(__object_count+0)
MOVT	R2, #hi_addr(__object_count+0)
LDRSH	R2, [R2, #0]
CMP	R2, R3
IT	NE
BNE	L_Process_TP_Press100
;ECGsynthetic_driver.c,4235 :: 		if (exec_label->Active != 0) {
MOVW	R2, #lo_addr(_exec_label+0)
MOVT	R2, #hi_addr(_exec_label+0)
LDR	R2, [R2, #0]
ADDS	R2, #28
LDRB	R2, [R2, #0]
CMP	R2, #0
IT	EQ
BEQ	L_Process_TP_Press101
;ECGsynthetic_driver.c,4236 :: 		if (exec_label->OnPressPtr != 0) {
MOVW	R4, #lo_addr(_exec_label+0)
MOVT	R4, #hi_addr(_exec_label+0)
LDR	R4, [R4, #0]
ADDS	R4, #44
LDR	R4, [R4, #0]
CMP	R4, #0
IT	EQ
BEQ	L_Process_TP_Press102
;ECGsynthetic_driver.c,4237 :: 		exec_label->OnPressPtr();
MOVW	R4, #lo_addr(_exec_label+0)
MOVT	R4, #hi_addr(_exec_label+0)
LDR	R4, [R4, #0]
ADDS	R4, #44
LDR	R2, [R4, #0]
BLX	R2
;ECGsynthetic_driver.c,4238 :: 		return;
IT	AL
BAL	L_end_Process_TP_Press
;ECGsynthetic_driver.c,4239 :: 		}
L_Process_TP_Press102:
;ECGsynthetic_driver.c,4240 :: 		}
L_Process_TP_Press101:
;ECGsynthetic_driver.c,4241 :: 		}
L_Process_TP_Press100:
;ECGsynthetic_driver.c,4243 :: 		if (_object_count == image_order) {
MOVW	R2, #lo_addr(_image_order+0)
MOVT	R2, #hi_addr(_image_order+0)
LDRSH	R3, [R2, #0]
MOVW	R2, #lo_addr(__object_count+0)
MOVT	R2, #hi_addr(__object_count+0)
LDRSH	R2, [R2, #0]
CMP	R2, R3
IT	NE
BNE	L_Process_TP_Press103
;ECGsynthetic_driver.c,4244 :: 		if (exec_image->Active != 0) {
MOVW	R2, #lo_addr(_exec_image+0)
MOVT	R2, #hi_addr(_exec_image+0)
LDR	R2, [R2, #0]
ADDS	R2, #21
LDRB	R2, [R2, #0]
CMP	R2, #0
IT	EQ
BEQ	L_Process_TP_Press104
;ECGsynthetic_driver.c,4245 :: 		if (exec_image->OnPressPtr != 0) {
MOVW	R4, #lo_addr(_exec_image+0)
MOVT	R4, #hi_addr(_exec_image+0)
LDR	R4, [R4, #0]
ADDS	R4, #36
LDR	R4, [R4, #0]
CMP	R4, #0
IT	EQ
BEQ	L_Process_TP_Press105
;ECGsynthetic_driver.c,4246 :: 		exec_image->OnPressPtr();
MOVW	R4, #lo_addr(_exec_image+0)
MOVT	R4, #hi_addr(_exec_image+0)
LDR	R4, [R4, #0]
ADDS	R4, #36
LDR	R2, [R4, #0]
BLX	R2
;ECGsynthetic_driver.c,4247 :: 		return;
IT	AL
BAL	L_end_Process_TP_Press
;ECGsynthetic_driver.c,4248 :: 		}
L_Process_TP_Press105:
;ECGsynthetic_driver.c,4249 :: 		}
L_Process_TP_Press104:
;ECGsynthetic_driver.c,4250 :: 		}
L_Process_TP_Press103:
;ECGsynthetic_driver.c,4252 :: 		if (_object_count == box_order) {
MOVW	R2, #lo_addr(_box_order+0)
MOVT	R2, #hi_addr(_box_order+0)
LDRSH	R3, [R2, #0]
MOVW	R2, #lo_addr(__object_count+0)
MOVT	R2, #hi_addr(__object_count+0)
LDRSH	R2, [R2, #0]
CMP	R2, R3
IT	NE
BNE	L_Process_TP_Press106
;ECGsynthetic_driver.c,4253 :: 		if (exec_box->Active != 0) {
MOVW	R2, #lo_addr(_exec_box+0)
MOVT	R2, #hi_addr(_exec_box+0)
LDR	R2, [R2, #0]
ADDS	R2, #19
LDRB	R2, [R2, #0]
CMP	R2, #0
IT	EQ
BEQ	L_Process_TP_Press107
;ECGsynthetic_driver.c,4254 :: 		if (exec_box->OnPressPtr != 0) {
MOVW	R4, #lo_addr(_exec_box+0)
MOVT	R4, #hi_addr(_exec_box+0)
LDR	R4, [R4, #0]
ADDS	R4, #48
LDR	R4, [R4, #0]
CMP	R4, #0
IT	EQ
BEQ	L_Process_TP_Press108
;ECGsynthetic_driver.c,4255 :: 		exec_box->OnPressPtr();
MOVW	R4, #lo_addr(_exec_box+0)
MOVT	R4, #hi_addr(_exec_box+0)
LDR	R4, [R4, #0]
ADDS	R4, #48
LDR	R2, [R4, #0]
BLX	R2
;ECGsynthetic_driver.c,4256 :: 		return;
IT	AL
BAL	L_end_Process_TP_Press
;ECGsynthetic_driver.c,4257 :: 		}
L_Process_TP_Press108:
;ECGsynthetic_driver.c,4258 :: 		}
L_Process_TP_Press107:
;ECGsynthetic_driver.c,4259 :: 		}
L_Process_TP_Press106:
;ECGsynthetic_driver.c,4261 :: 		if (_object_count == box_round_order) {
MOVW	R2, #lo_addr(_box_round_order+0)
MOVT	R2, #hi_addr(_box_round_order+0)
LDRSH	R3, [R2, #0]
MOVW	R2, #lo_addr(__object_count+0)
MOVT	R2, #hi_addr(__object_count+0)
LDRSH	R2, [R2, #0]
CMP	R2, R3
IT	NE
BNE	L_Process_TP_Press109
;ECGsynthetic_driver.c,4262 :: 		if (exec_round_box->Active != 0) {
MOVW	R2, #lo_addr(_exec_round_box+0)
MOVT	R2, #hi_addr(_exec_round_box+0)
LDR	R2, [R2, #0]
ADDS	R2, #19
LDRB	R2, [R2, #0]
CMP	R2, #0
IT	EQ
BEQ	L_Process_TP_Press110
;ECGsynthetic_driver.c,4263 :: 		if (exec_round_box->OnPressPtr != 0) {
MOVW	R4, #lo_addr(_exec_round_box+0)
MOVT	R4, #hi_addr(_exec_round_box+0)
LDR	R4, [R4, #0]
ADDS	R4, #48
LDR	R4, [R4, #0]
CMP	R4, #0
IT	EQ
BEQ	L_Process_TP_Press111
;ECGsynthetic_driver.c,4264 :: 		exec_round_box->OnPressPtr();
MOVW	R4, #lo_addr(_exec_round_box+0)
MOVT	R4, #hi_addr(_exec_round_box+0)
LDR	R4, [R4, #0]
ADDS	R4, #48
LDR	R2, [R4, #0]
BLX	R2
;ECGsynthetic_driver.c,4265 :: 		return;
IT	AL
BAL	L_end_Process_TP_Press
;ECGsynthetic_driver.c,4266 :: 		}
L_Process_TP_Press111:
;ECGsynthetic_driver.c,4267 :: 		}
L_Process_TP_Press110:
;ECGsynthetic_driver.c,4268 :: 		}
L_Process_TP_Press109:
;ECGsynthetic_driver.c,4270 :: 		if (_object_count == radio_button_order) {
MOVW	R2, #lo_addr(_radio_button_order+0)
MOVT	R2, #hi_addr(_radio_button_order+0)
LDRSH	R3, [R2, #0]
MOVW	R2, #lo_addr(__object_count+0)
MOVT	R2, #hi_addr(__object_count+0)
LDRSH	R2, [R2, #0]
CMP	R2, R3
IT	NE
BNE	L_Process_TP_Press112
;ECGsynthetic_driver.c,4271 :: 		if (exec_radio_button->Active != 0) {
MOVW	R2, #lo_addr(_exec_radio_button+0)
MOVT	R2, #hi_addr(_exec_radio_button+0)
LDR	R2, [R2, #0]
ADDS	R2, #19
LDRB	R2, [R2, #0]
CMP	R2, #0
IT	EQ
BEQ	L_Process_TP_Press113
;ECGsynthetic_driver.c,4272 :: 		if (exec_radio_button->OnPressPtr != 0) {
MOVW	R4, #lo_addr(_exec_radio_button+0)
MOVT	R4, #hi_addr(_exec_radio_button+0)
LDR	R4, [R4, #0]
ADDS	R4, #64
LDR	R4, [R4, #0]
CMP	R4, #0
IT	EQ
BEQ	L_Process_TP_Press114
;ECGsynthetic_driver.c,4273 :: 		exec_radio_button->OnPressPtr();
MOVW	R4, #lo_addr(_exec_radio_button+0)
MOVT	R4, #hi_addr(_exec_radio_button+0)
LDR	R4, [R4, #0]
ADDS	R4, #64
LDR	R2, [R4, #0]
BLX	R2
;ECGsynthetic_driver.c,4274 :: 		return;
IT	AL
BAL	L_end_Process_TP_Press
;ECGsynthetic_driver.c,4275 :: 		}
L_Process_TP_Press114:
;ECGsynthetic_driver.c,4276 :: 		}
L_Process_TP_Press113:
;ECGsynthetic_driver.c,4277 :: 		}
L_Process_TP_Press112:
;ECGsynthetic_driver.c,4279 :: 		}
L_Process_TP_Press96:
;ECGsynthetic_driver.c,4280 :: 		}
L_end_Process_TP_Press:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Process_TP_Press
_Process_TP_Up:
;ECGsynthetic_driver.c,4282 :: 		void Process_TP_Up(unsigned int X, unsigned int Y) {
; Y start address is: 4 (R1)
; X start address is: 0 (R0)
SUB	SP, SP, #12
STR	LR, [SP, #0]
; Y end address is: 4 (R1)
; X end address is: 0 (R0)
; X start address is: 0 (R0)
; Y start address is: 4 (R1)
;ECGsynthetic_driver.c,4284 :: 		switch (PressedObjectType) {
IT	AL
BAL	L_Process_TP_Up115
;ECGsynthetic_driver.c,4286 :: 		case 1: {
L_Process_TP_Up117:
;ECGsynthetic_driver.c,4287 :: 		if (PressedObject != 0) {
MOVW	R2, #lo_addr(_PressedObject+0)
MOVT	R2, #hi_addr(_PressedObject+0)
LDR	R2, [R2, #0]
CMP	R2, #0
IT	EQ
BEQ	L_Process_TP_Up118
;ECGsynthetic_driver.c,4288 :: 		exec_round_button = (TButton_Round*)PressedObject;
MOVW	R4, #lo_addr(_PressedObject+0)
MOVT	R4, #hi_addr(_PressedObject+0)
LDR	R3, [R4, #0]
MOVW	R2, #lo_addr(_exec_round_button+0)
MOVT	R2, #hi_addr(_exec_round_button+0)
STR	R3, [R2, #0]
;ECGsynthetic_driver.c,4289 :: 		if ((exec_round_button->PressColEnabled != 0) && (exec_round_button->OwnerScreen == CurrentScreen)) {
MOV	R2, R4
LDR	R2, [R2, #0]
ADDS	R2, #49
LDRB	R2, [R2, #0]
CMP	R2, #0
IT	EQ
BEQ	L__Process_TP_Up221
MOVW	R2, #lo_addr(_exec_round_button+0)
MOVT	R2, #hi_addr(_exec_round_button+0)
LDR	R2, [R2, #0]
LDR	R3, [R2, #0]
MOVW	R2, #lo_addr(_CurrentScreen+0)
MOVT	R2, #hi_addr(_CurrentScreen+0)
LDR	R2, [R2, #0]
CMP	R3, R2
IT	NE
BNE	L__Process_TP_Up220
L__Process_TP_Up219:
;ECGsynthetic_driver.c,4290 :: 		DrawRoundButton(exec_round_button);
MOVW	R2, #lo_addr(_exec_round_button+0)
MOVT	R2, #hi_addr(_exec_round_button+0)
LDR	R2, [R2, #0]
STRH	R1, [SP, #4]
STRH	R0, [SP, #8]
MOV	R0, R2
BL	_DrawRoundButton+0
LDRH	R0, [SP, #8]
LDRH	R1, [SP, #4]
;ECGsynthetic_driver.c,4289 :: 		if ((exec_round_button->PressColEnabled != 0) && (exec_round_button->OwnerScreen == CurrentScreen)) {
L__Process_TP_Up221:
L__Process_TP_Up220:
;ECGsynthetic_driver.c,4292 :: 		break;
IT	AL
BAL	L_Process_TP_Up116
;ECGsynthetic_driver.c,4293 :: 		}
L_Process_TP_Up118:
;ECGsynthetic_driver.c,4294 :: 		break;
IT	AL
BAL	L_Process_TP_Up116
;ECGsynthetic_driver.c,4297 :: 		case 6: {
L_Process_TP_Up122:
;ECGsynthetic_driver.c,4298 :: 		if (PressedObject != 0) {
MOVW	R2, #lo_addr(_PressedObject+0)
MOVT	R2, #hi_addr(_PressedObject+0)
LDR	R2, [R2, #0]
CMP	R2, #0
IT	EQ
BEQ	L_Process_TP_Up123
;ECGsynthetic_driver.c,4299 :: 		exec_box = (TBox*)PressedObject;
MOVW	R4, #lo_addr(_PressedObject+0)
MOVT	R4, #hi_addr(_PressedObject+0)
LDR	R3, [R4, #0]
MOVW	R2, #lo_addr(_exec_box+0)
MOVT	R2, #hi_addr(_exec_box+0)
STR	R3, [R2, #0]
;ECGsynthetic_driver.c,4300 :: 		if ((exec_box->PressColEnabled != 0) && (exec_box->OwnerScreen == CurrentScreen)) {
MOV	R2, R4
LDR	R2, [R2, #0]
ADDS	R2, #30
LDRB	R2, [R2, #0]
CMP	R2, #0
IT	EQ
BEQ	L__Process_TP_Up223
MOVW	R2, #lo_addr(_exec_box+0)
MOVT	R2, #hi_addr(_exec_box+0)
LDR	R2, [R2, #0]
LDR	R3, [R2, #0]
MOVW	R2, #lo_addr(_CurrentScreen+0)
MOVT	R2, #hi_addr(_CurrentScreen+0)
LDR	R2, [R2, #0]
CMP	R3, R2
IT	NE
BNE	L__Process_TP_Up222
L__Process_TP_Up218:
;ECGsynthetic_driver.c,4301 :: 		DrawBox(exec_box);
MOVW	R2, #lo_addr(_exec_box+0)
MOVT	R2, #hi_addr(_exec_box+0)
LDR	R2, [R2, #0]
STRH	R1, [SP, #4]
STRH	R0, [SP, #8]
MOV	R0, R2
BL	_DrawBox+0
LDRH	R0, [SP, #8]
LDRH	R1, [SP, #4]
;ECGsynthetic_driver.c,4300 :: 		if ((exec_box->PressColEnabled != 0) && (exec_box->OwnerScreen == CurrentScreen)) {
L__Process_TP_Up223:
L__Process_TP_Up222:
;ECGsynthetic_driver.c,4303 :: 		break;
IT	AL
BAL	L_Process_TP_Up116
;ECGsynthetic_driver.c,4304 :: 		}
L_Process_TP_Up123:
;ECGsynthetic_driver.c,4305 :: 		break;
IT	AL
BAL	L_Process_TP_Up116
;ECGsynthetic_driver.c,4308 :: 		case 7: {
L_Process_TP_Up127:
;ECGsynthetic_driver.c,4309 :: 		if (PressedObject != 0) {
MOVW	R2, #lo_addr(_PressedObject+0)
MOVT	R2, #hi_addr(_PressedObject+0)
LDR	R2, [R2, #0]
CMP	R2, #0
IT	EQ
BEQ	L_Process_TP_Up128
;ECGsynthetic_driver.c,4310 :: 		exec_round_box = (TBox_Round*)PressedObject;
MOVW	R4, #lo_addr(_PressedObject+0)
MOVT	R4, #hi_addr(_PressedObject+0)
LDR	R3, [R4, #0]
MOVW	R2, #lo_addr(_exec_round_box+0)
MOVT	R2, #hi_addr(_exec_round_box+0)
STR	R3, [R2, #0]
;ECGsynthetic_driver.c,4311 :: 		if ((exec_round_box->PressColEnabled != 0) && (exec_round_box->OwnerScreen == CurrentScreen)) {
MOV	R2, R4
LDR	R2, [R2, #0]
ADDS	R2, #31
LDRB	R2, [R2, #0]
CMP	R2, #0
IT	EQ
BEQ	L__Process_TP_Up225
MOVW	R2, #lo_addr(_exec_round_box+0)
MOVT	R2, #hi_addr(_exec_round_box+0)
LDR	R2, [R2, #0]
LDR	R3, [R2, #0]
MOVW	R2, #lo_addr(_CurrentScreen+0)
MOVT	R2, #hi_addr(_CurrentScreen+0)
LDR	R2, [R2, #0]
CMP	R3, R2
IT	NE
BNE	L__Process_TP_Up224
L__Process_TP_Up217:
;ECGsynthetic_driver.c,4312 :: 		DrawRoundBox(exec_round_box);
MOVW	R2, #lo_addr(_exec_round_box+0)
MOVT	R2, #hi_addr(_exec_round_box+0)
LDR	R2, [R2, #0]
STRH	R1, [SP, #4]
STRH	R0, [SP, #8]
MOV	R0, R2
BL	_DrawRoundBox+0
LDRH	R0, [SP, #8]
LDRH	R1, [SP, #4]
;ECGsynthetic_driver.c,4311 :: 		if ((exec_round_box->PressColEnabled != 0) && (exec_round_box->OwnerScreen == CurrentScreen)) {
L__Process_TP_Up225:
L__Process_TP_Up224:
;ECGsynthetic_driver.c,4314 :: 		break;
IT	AL
BAL	L_Process_TP_Up116
;ECGsynthetic_driver.c,4315 :: 		}
L_Process_TP_Up128:
;ECGsynthetic_driver.c,4316 :: 		break;
IT	AL
BAL	L_Process_TP_Up116
;ECGsynthetic_driver.c,4319 :: 		case 17: {
L_Process_TP_Up132:
;ECGsynthetic_driver.c,4320 :: 		if (PressedObject != 0) {
MOVW	R2, #lo_addr(_PressedObject+0)
MOVT	R2, #hi_addr(_PressedObject+0)
LDR	R2, [R2, #0]
CMP	R2, #0
IT	EQ
BEQ	L_Process_TP_Up133
;ECGsynthetic_driver.c,4321 :: 		exec_radio_button = (TRadioButton*)PressedObject;
MOVW	R4, #lo_addr(_PressedObject+0)
MOVT	R4, #hi_addr(_PressedObject+0)
LDR	R3, [R4, #0]
MOVW	R2, #lo_addr(_exec_radio_button+0)
MOVT	R2, #hi_addr(_exec_radio_button+0)
STR	R3, [R2, #0]
;ECGsynthetic_driver.c,4322 :: 		if ((exec_radio_button->PressColEnabled != 0) && (exec_radio_button->OwnerScreen == CurrentScreen)) {
MOV	R2, R4
LDR	R2, [R2, #0]
ADDS	R2, #48
LDRB	R2, [R2, #0]
CMP	R2, #0
IT	EQ
BEQ	L__Process_TP_Up227
MOVW	R2, #lo_addr(_exec_radio_button+0)
MOVT	R2, #hi_addr(_exec_radio_button+0)
LDR	R2, [R2, #0]
LDR	R3, [R2, #0]
MOVW	R2, #lo_addr(_CurrentScreen+0)
MOVT	R2, #hi_addr(_CurrentScreen+0)
LDR	R2, [R2, #0]
CMP	R3, R2
IT	NE
BNE	L__Process_TP_Up226
L__Process_TP_Up216:
;ECGsynthetic_driver.c,4323 :: 		DrawRadioButton(exec_radio_button);
MOVW	R2, #lo_addr(_exec_radio_button+0)
MOVT	R2, #hi_addr(_exec_radio_button+0)
LDR	R2, [R2, #0]
STRH	R1, [SP, #4]
STRH	R0, [SP, #8]
MOV	R0, R2
BL	_DrawRadioButton+0
LDRH	R0, [SP, #8]
LDRH	R1, [SP, #4]
;ECGsynthetic_driver.c,4322 :: 		if ((exec_radio_button->PressColEnabled != 0) && (exec_radio_button->OwnerScreen == CurrentScreen)) {
L__Process_TP_Up227:
L__Process_TP_Up226:
;ECGsynthetic_driver.c,4325 :: 		break;
IT	AL
BAL	L_Process_TP_Up116
;ECGsynthetic_driver.c,4326 :: 		}
L_Process_TP_Up133:
;ECGsynthetic_driver.c,4327 :: 		break;
IT	AL
BAL	L_Process_TP_Up116
;ECGsynthetic_driver.c,4329 :: 		}
L_Process_TP_Up115:
MOVW	R2, #lo_addr(_PressedObjectType+0)
MOVT	R2, #hi_addr(_PressedObjectType+0)
LDRSH	R2, [R2, #0]
CMP	R2, #1
IT	EQ
BEQ	L_Process_TP_Up117
MOVW	R2, #lo_addr(_PressedObjectType+0)
MOVT	R2, #hi_addr(_PressedObjectType+0)
LDRSH	R2, [R2, #0]
CMP	R2, #6
IT	EQ
BEQ	L_Process_TP_Up122
MOVW	R2, #lo_addr(_PressedObjectType+0)
MOVT	R2, #hi_addr(_PressedObjectType+0)
LDRSH	R2, [R2, #0]
CMP	R2, #7
IT	EQ
BEQ	L_Process_TP_Up127
MOVW	R2, #lo_addr(_PressedObjectType+0)
MOVT	R2, #hi_addr(_PressedObjectType+0)
LDRSH	R2, [R2, #0]
CMP	R2, #17
IT	EQ
BEQ	L_Process_TP_Up132
L_Process_TP_Up116:
;ECGsynthetic_driver.c,4331 :: 		exec_label          = 0;
MOVS	R3, #0
MOVW	R2, #lo_addr(_exec_label+0)
MOVT	R2, #hi_addr(_exec_label+0)
STR	R3, [R2, #0]
;ECGsynthetic_driver.c,4332 :: 		exec_image          = 0;
MOVS	R3, #0
MOVW	R2, #lo_addr(_exec_image+0)
MOVT	R2, #hi_addr(_exec_image+0)
STR	R3, [R2, #0]
;ECGsynthetic_driver.c,4334 :: 		Get_Object(X, Y);
; Y end address is: 4 (R1)
; X end address is: 0 (R0)
BL	_Get_Object+0
;ECGsynthetic_driver.c,4337 :: 		if (_object_count != -1) {
MOVW	R2, #lo_addr(__object_count+0)
MOVT	R2, #hi_addr(__object_count+0)
LDRSH	R2, [R2, #0]
CMP	R2, #-1
IT	EQ
BEQ	L_Process_TP_Up137
;ECGsynthetic_driver.c,4339 :: 		if (_object_count == round_button_order) {
MOVW	R2, #lo_addr(_round_button_order+0)
MOVT	R2, #hi_addr(_round_button_order+0)
LDRSH	R3, [R2, #0]
MOVW	R2, #lo_addr(__object_count+0)
MOVT	R2, #hi_addr(__object_count+0)
LDRSH	R2, [R2, #0]
CMP	R2, R3
IT	NE
BNE	L_Process_TP_Up138
;ECGsynthetic_driver.c,4340 :: 		if (exec_round_button->Active != 0) {
MOVW	R2, #lo_addr(_exec_round_button+0)
MOVT	R2, #hi_addr(_exec_round_button+0)
LDR	R2, [R2, #0]
ADDS	R2, #19
LDRB	R2, [R2, #0]
CMP	R2, #0
IT	EQ
BEQ	L_Process_TP_Up139
;ECGsynthetic_driver.c,4341 :: 		if (exec_round_button->OnUpPtr != 0)
MOVW	R4, #lo_addr(_exec_round_button+0)
MOVT	R4, #hi_addr(_exec_round_button+0)
LDR	R4, [R4, #0]
ADDS	R4, #52
LDR	R4, [R4, #0]
CMP	R4, #0
IT	EQ
BEQ	L_Process_TP_Up140
;ECGsynthetic_driver.c,4342 :: 		exec_round_button->OnUpPtr();
MOVW	R4, #lo_addr(_exec_round_button+0)
MOVT	R4, #hi_addr(_exec_round_button+0)
LDR	R4, [R4, #0]
ADDS	R4, #52
LDR	R2, [R4, #0]
BLX	R2
L_Process_TP_Up140:
;ECGsynthetic_driver.c,4343 :: 		if (PressedObject == (void *)exec_round_button)
MOVW	R2, #lo_addr(_exec_round_button+0)
MOVT	R2, #hi_addr(_exec_round_button+0)
LDR	R3, [R2, #0]
MOVW	R2, #lo_addr(_PressedObject+0)
MOVT	R2, #hi_addr(_PressedObject+0)
LDR	R2, [R2, #0]
CMP	R2, R3
IT	NE
BNE	L_Process_TP_Up141
;ECGsynthetic_driver.c,4344 :: 		if (exec_round_button->OnClickPtr != 0)
MOVW	R4, #lo_addr(_exec_round_button+0)
MOVT	R4, #hi_addr(_exec_round_button+0)
LDR	R4, [R4, #0]
ADDS	R4, #60
LDR	R4, [R4, #0]
CMP	R4, #0
IT	EQ
BEQ	L_Process_TP_Up142
;ECGsynthetic_driver.c,4345 :: 		exec_round_button->OnClickPtr();
MOVW	R4, #lo_addr(_exec_round_button+0)
MOVT	R4, #hi_addr(_exec_round_button+0)
LDR	R4, [R4, #0]
ADDS	R4, #60
LDR	R2, [R4, #0]
BLX	R2
L_Process_TP_Up142:
L_Process_TP_Up141:
;ECGsynthetic_driver.c,4346 :: 		PressedObject = 0;
MOVS	R3, #0
MOVW	R2, #lo_addr(_PressedObject+0)
MOVT	R2, #hi_addr(_PressedObject+0)
STR	R3, [R2, #0]
;ECGsynthetic_driver.c,4347 :: 		PressedObjectType = -1;
MOVW	R3, #65535
SXTH	R3, R3
MOVW	R2, #lo_addr(_PressedObjectType+0)
MOVT	R2, #hi_addr(_PressedObjectType+0)
STRH	R3, [R2, #0]
;ECGsynthetic_driver.c,4348 :: 		return;
IT	AL
BAL	L_end_Process_TP_Up
;ECGsynthetic_driver.c,4349 :: 		}
L_Process_TP_Up139:
;ECGsynthetic_driver.c,4350 :: 		}
L_Process_TP_Up138:
;ECGsynthetic_driver.c,4353 :: 		if (_object_count == label_order) {
MOVW	R2, #lo_addr(_label_order+0)
MOVT	R2, #hi_addr(_label_order+0)
LDRSH	R3, [R2, #0]
MOVW	R2, #lo_addr(__object_count+0)
MOVT	R2, #hi_addr(__object_count+0)
LDRSH	R2, [R2, #0]
CMP	R2, R3
IT	NE
BNE	L_Process_TP_Up143
;ECGsynthetic_driver.c,4354 :: 		if (exec_label->Active != 0) {
MOVW	R2, #lo_addr(_exec_label+0)
MOVT	R2, #hi_addr(_exec_label+0)
LDR	R2, [R2, #0]
ADDS	R2, #28
LDRB	R2, [R2, #0]
CMP	R2, #0
IT	EQ
BEQ	L_Process_TP_Up144
;ECGsynthetic_driver.c,4355 :: 		if (exec_label->OnUpPtr != 0)
MOVW	R4, #lo_addr(_exec_label+0)
MOVT	R4, #hi_addr(_exec_label+0)
LDR	R4, [R4, #0]
ADDS	R4, #32
LDR	R4, [R4, #0]
CMP	R4, #0
IT	EQ
BEQ	L_Process_TP_Up145
;ECGsynthetic_driver.c,4356 :: 		exec_label->OnUpPtr();
MOVW	R4, #lo_addr(_exec_label+0)
MOVT	R4, #hi_addr(_exec_label+0)
LDR	R4, [R4, #0]
ADDS	R4, #32
LDR	R2, [R4, #0]
BLX	R2
L_Process_TP_Up145:
;ECGsynthetic_driver.c,4357 :: 		if (PressedObject == (void *)exec_label)
MOVW	R2, #lo_addr(_exec_label+0)
MOVT	R2, #hi_addr(_exec_label+0)
LDR	R3, [R2, #0]
MOVW	R2, #lo_addr(_PressedObject+0)
MOVT	R2, #hi_addr(_PressedObject+0)
LDR	R2, [R2, #0]
CMP	R2, R3
IT	NE
BNE	L_Process_TP_Up146
;ECGsynthetic_driver.c,4358 :: 		if (exec_label->OnClickPtr != 0)
MOVW	R4, #lo_addr(_exec_label+0)
MOVT	R4, #hi_addr(_exec_label+0)
LDR	R4, [R4, #0]
ADDS	R4, #40
LDR	R4, [R4, #0]
CMP	R4, #0
IT	EQ
BEQ	L_Process_TP_Up147
;ECGsynthetic_driver.c,4359 :: 		exec_label->OnClickPtr();
MOVW	R4, #lo_addr(_exec_label+0)
MOVT	R4, #hi_addr(_exec_label+0)
LDR	R4, [R4, #0]
ADDS	R4, #40
LDR	R2, [R4, #0]
BLX	R2
L_Process_TP_Up147:
L_Process_TP_Up146:
;ECGsynthetic_driver.c,4360 :: 		PressedObject = 0;
MOVS	R3, #0
MOVW	R2, #lo_addr(_PressedObject+0)
MOVT	R2, #hi_addr(_PressedObject+0)
STR	R3, [R2, #0]
;ECGsynthetic_driver.c,4361 :: 		PressedObjectType = -1;
MOVW	R3, #65535
SXTH	R3, R3
MOVW	R2, #lo_addr(_PressedObjectType+0)
MOVT	R2, #hi_addr(_PressedObjectType+0)
STRH	R3, [R2, #0]
;ECGsynthetic_driver.c,4362 :: 		return;
IT	AL
BAL	L_end_Process_TP_Up
;ECGsynthetic_driver.c,4363 :: 		}
L_Process_TP_Up144:
;ECGsynthetic_driver.c,4364 :: 		}
L_Process_TP_Up143:
;ECGsynthetic_driver.c,4367 :: 		if (_object_count == image_order) {
MOVW	R2, #lo_addr(_image_order+0)
MOVT	R2, #hi_addr(_image_order+0)
LDRSH	R3, [R2, #0]
MOVW	R2, #lo_addr(__object_count+0)
MOVT	R2, #hi_addr(__object_count+0)
LDRSH	R2, [R2, #0]
CMP	R2, R3
IT	NE
BNE	L_Process_TP_Up148
;ECGsynthetic_driver.c,4368 :: 		if (exec_image->Active != 0) {
MOVW	R2, #lo_addr(_exec_image+0)
MOVT	R2, #hi_addr(_exec_image+0)
LDR	R2, [R2, #0]
ADDS	R2, #21
LDRB	R2, [R2, #0]
CMP	R2, #0
IT	EQ
BEQ	L_Process_TP_Up149
;ECGsynthetic_driver.c,4369 :: 		if (exec_image->OnUpPtr != 0)
MOVW	R4, #lo_addr(_exec_image+0)
MOVT	R4, #hi_addr(_exec_image+0)
LDR	R4, [R4, #0]
ADDS	R4, #24
LDR	R4, [R4, #0]
CMP	R4, #0
IT	EQ
BEQ	L_Process_TP_Up150
;ECGsynthetic_driver.c,4370 :: 		exec_image->OnUpPtr();
MOVW	R4, #lo_addr(_exec_image+0)
MOVT	R4, #hi_addr(_exec_image+0)
LDR	R4, [R4, #0]
ADDS	R4, #24
LDR	R2, [R4, #0]
BLX	R2
L_Process_TP_Up150:
;ECGsynthetic_driver.c,4371 :: 		if (PressedObject == (void *)exec_image)
MOVW	R2, #lo_addr(_exec_image+0)
MOVT	R2, #hi_addr(_exec_image+0)
LDR	R3, [R2, #0]
MOVW	R2, #lo_addr(_PressedObject+0)
MOVT	R2, #hi_addr(_PressedObject+0)
LDR	R2, [R2, #0]
CMP	R2, R3
IT	NE
BNE	L_Process_TP_Up151
;ECGsynthetic_driver.c,4372 :: 		if (exec_image->OnClickPtr != 0)
MOVW	R4, #lo_addr(_exec_image+0)
MOVT	R4, #hi_addr(_exec_image+0)
LDR	R4, [R4, #0]
ADDS	R4, #32
LDR	R4, [R4, #0]
CMP	R4, #0
IT	EQ
BEQ	L_Process_TP_Up152
;ECGsynthetic_driver.c,4373 :: 		exec_image->OnClickPtr();
MOVW	R4, #lo_addr(_exec_image+0)
MOVT	R4, #hi_addr(_exec_image+0)
LDR	R4, [R4, #0]
ADDS	R4, #32
LDR	R2, [R4, #0]
BLX	R2
L_Process_TP_Up152:
L_Process_TP_Up151:
;ECGsynthetic_driver.c,4374 :: 		PressedObject = 0;
MOVS	R3, #0
MOVW	R2, #lo_addr(_PressedObject+0)
MOVT	R2, #hi_addr(_PressedObject+0)
STR	R3, [R2, #0]
;ECGsynthetic_driver.c,4375 :: 		PressedObjectType = -1;
MOVW	R3, #65535
SXTH	R3, R3
MOVW	R2, #lo_addr(_PressedObjectType+0)
MOVT	R2, #hi_addr(_PressedObjectType+0)
STRH	R3, [R2, #0]
;ECGsynthetic_driver.c,4376 :: 		return;
IT	AL
BAL	L_end_Process_TP_Up
;ECGsynthetic_driver.c,4377 :: 		}
L_Process_TP_Up149:
;ECGsynthetic_driver.c,4378 :: 		}
L_Process_TP_Up148:
;ECGsynthetic_driver.c,4381 :: 		if (_object_count == box_order) {
MOVW	R2, #lo_addr(_box_order+0)
MOVT	R2, #hi_addr(_box_order+0)
LDRSH	R3, [R2, #0]
MOVW	R2, #lo_addr(__object_count+0)
MOVT	R2, #hi_addr(__object_count+0)
LDRSH	R2, [R2, #0]
CMP	R2, R3
IT	NE
BNE	L_Process_TP_Up153
;ECGsynthetic_driver.c,4382 :: 		if (exec_box->Active != 0) {
MOVW	R2, #lo_addr(_exec_box+0)
MOVT	R2, #hi_addr(_exec_box+0)
LDR	R2, [R2, #0]
ADDS	R2, #19
LDRB	R2, [R2, #0]
CMP	R2, #0
IT	EQ
BEQ	L_Process_TP_Up154
;ECGsynthetic_driver.c,4383 :: 		if (exec_box->OnUpPtr != 0)
MOVW	R4, #lo_addr(_exec_box+0)
MOVT	R4, #hi_addr(_exec_box+0)
LDR	R4, [R4, #0]
ADDS	R4, #36
LDR	R4, [R4, #0]
CMP	R4, #0
IT	EQ
BEQ	L_Process_TP_Up155
;ECGsynthetic_driver.c,4384 :: 		exec_box->OnUpPtr();
MOVW	R4, #lo_addr(_exec_box+0)
MOVT	R4, #hi_addr(_exec_box+0)
LDR	R4, [R4, #0]
ADDS	R4, #36
LDR	R2, [R4, #0]
BLX	R2
L_Process_TP_Up155:
;ECGsynthetic_driver.c,4385 :: 		if (PressedObject == (void *)exec_box)
MOVW	R2, #lo_addr(_exec_box+0)
MOVT	R2, #hi_addr(_exec_box+0)
LDR	R3, [R2, #0]
MOVW	R2, #lo_addr(_PressedObject+0)
MOVT	R2, #hi_addr(_PressedObject+0)
LDR	R2, [R2, #0]
CMP	R2, R3
IT	NE
BNE	L_Process_TP_Up156
;ECGsynthetic_driver.c,4386 :: 		if (exec_box->OnClickPtr != 0)
MOVW	R4, #lo_addr(_exec_box+0)
MOVT	R4, #hi_addr(_exec_box+0)
LDR	R4, [R4, #0]
ADDS	R4, #44
LDR	R4, [R4, #0]
CMP	R4, #0
IT	EQ
BEQ	L_Process_TP_Up157
;ECGsynthetic_driver.c,4387 :: 		exec_box->OnClickPtr();
MOVW	R4, #lo_addr(_exec_box+0)
MOVT	R4, #hi_addr(_exec_box+0)
LDR	R4, [R4, #0]
ADDS	R4, #44
LDR	R2, [R4, #0]
BLX	R2
L_Process_TP_Up157:
L_Process_TP_Up156:
;ECGsynthetic_driver.c,4388 :: 		PressedObject = 0;
MOVS	R3, #0
MOVW	R2, #lo_addr(_PressedObject+0)
MOVT	R2, #hi_addr(_PressedObject+0)
STR	R3, [R2, #0]
;ECGsynthetic_driver.c,4389 :: 		PressedObjectType = -1;
MOVW	R3, #65535
SXTH	R3, R3
MOVW	R2, #lo_addr(_PressedObjectType+0)
MOVT	R2, #hi_addr(_PressedObjectType+0)
STRH	R3, [R2, #0]
;ECGsynthetic_driver.c,4390 :: 		return;
IT	AL
BAL	L_end_Process_TP_Up
;ECGsynthetic_driver.c,4391 :: 		}
L_Process_TP_Up154:
;ECGsynthetic_driver.c,4392 :: 		}
L_Process_TP_Up153:
;ECGsynthetic_driver.c,4395 :: 		if (_object_count == box_round_order) {
MOVW	R2, #lo_addr(_box_round_order+0)
MOVT	R2, #hi_addr(_box_round_order+0)
LDRSH	R3, [R2, #0]
MOVW	R2, #lo_addr(__object_count+0)
MOVT	R2, #hi_addr(__object_count+0)
LDRSH	R2, [R2, #0]
CMP	R2, R3
IT	NE
BNE	L_Process_TP_Up158
;ECGsynthetic_driver.c,4396 :: 		if (exec_round_box->Active != 0) {
MOVW	R2, #lo_addr(_exec_round_box+0)
MOVT	R2, #hi_addr(_exec_round_box+0)
LDR	R2, [R2, #0]
ADDS	R2, #19
LDRB	R2, [R2, #0]
CMP	R2, #0
IT	EQ
BEQ	L_Process_TP_Up159
;ECGsynthetic_driver.c,4397 :: 		if (exec_round_box->OnUpPtr != 0)
MOVW	R4, #lo_addr(_exec_round_box+0)
MOVT	R4, #hi_addr(_exec_round_box+0)
LDR	R4, [R4, #0]
ADDS	R4, #36
LDR	R4, [R4, #0]
CMP	R4, #0
IT	EQ
BEQ	L_Process_TP_Up160
;ECGsynthetic_driver.c,4398 :: 		exec_round_box->OnUpPtr();
MOVW	R4, #lo_addr(_exec_round_box+0)
MOVT	R4, #hi_addr(_exec_round_box+0)
LDR	R4, [R4, #0]
ADDS	R4, #36
LDR	R2, [R4, #0]
BLX	R2
L_Process_TP_Up160:
;ECGsynthetic_driver.c,4399 :: 		if (PressedObject == (void *)exec_round_box)
MOVW	R2, #lo_addr(_exec_round_box+0)
MOVT	R2, #hi_addr(_exec_round_box+0)
LDR	R3, [R2, #0]
MOVW	R2, #lo_addr(_PressedObject+0)
MOVT	R2, #hi_addr(_PressedObject+0)
LDR	R2, [R2, #0]
CMP	R2, R3
IT	NE
BNE	L_Process_TP_Up161
;ECGsynthetic_driver.c,4400 :: 		if (exec_round_box->OnClickPtr != 0)
MOVW	R4, #lo_addr(_exec_round_box+0)
MOVT	R4, #hi_addr(_exec_round_box+0)
LDR	R4, [R4, #0]
ADDS	R4, #44
LDR	R4, [R4, #0]
CMP	R4, #0
IT	EQ
BEQ	L_Process_TP_Up162
;ECGsynthetic_driver.c,4401 :: 		exec_round_box->OnClickPtr();
MOVW	R4, #lo_addr(_exec_round_box+0)
MOVT	R4, #hi_addr(_exec_round_box+0)
LDR	R4, [R4, #0]
ADDS	R4, #44
LDR	R2, [R4, #0]
BLX	R2
L_Process_TP_Up162:
L_Process_TP_Up161:
;ECGsynthetic_driver.c,4402 :: 		PressedObject = 0;
MOVS	R3, #0
MOVW	R2, #lo_addr(_PressedObject+0)
MOVT	R2, #hi_addr(_PressedObject+0)
STR	R3, [R2, #0]
;ECGsynthetic_driver.c,4403 :: 		PressedObjectType = -1;
MOVW	R3, #65535
SXTH	R3, R3
MOVW	R2, #lo_addr(_PressedObjectType+0)
MOVT	R2, #hi_addr(_PressedObjectType+0)
STRH	R3, [R2, #0]
;ECGsynthetic_driver.c,4404 :: 		return;
IT	AL
BAL	L_end_Process_TP_Up
;ECGsynthetic_driver.c,4405 :: 		}
L_Process_TP_Up159:
;ECGsynthetic_driver.c,4406 :: 		}
L_Process_TP_Up158:
;ECGsynthetic_driver.c,4409 :: 		if (_object_count == radio_button_order) {
MOVW	R2, #lo_addr(_radio_button_order+0)
MOVT	R2, #hi_addr(_radio_button_order+0)
LDRSH	R3, [R2, #0]
MOVW	R2, #lo_addr(__object_count+0)
MOVT	R2, #hi_addr(__object_count+0)
LDRSH	R2, [R2, #0]
CMP	R2, R3
IT	NE
BNE	L_Process_TP_Up163
;ECGsynthetic_driver.c,4410 :: 		if (exec_radio_button->Active != 0) {
MOVW	R2, #lo_addr(_exec_radio_button+0)
MOVT	R2, #hi_addr(_exec_radio_button+0)
LDR	R2, [R2, #0]
ADDS	R2, #19
LDRB	R2, [R2, #0]
CMP	R2, #0
IT	EQ
BEQ	L_Process_TP_Up164
;ECGsynthetic_driver.c,4411 :: 		if (exec_radio_button->OnUpPtr != 0)
MOVW	R4, #lo_addr(_exec_radio_button+0)
MOVT	R4, #hi_addr(_exec_radio_button+0)
LDR	R4, [R4, #0]
ADDS	R4, #52
LDR	R4, [R4, #0]
CMP	R4, #0
IT	EQ
BEQ	L_Process_TP_Up165
;ECGsynthetic_driver.c,4412 :: 		exec_radio_button->OnUpPtr();
MOVW	R4, #lo_addr(_exec_radio_button+0)
MOVT	R4, #hi_addr(_exec_radio_button+0)
LDR	R4, [R4, #0]
ADDS	R4, #52
LDR	R2, [R4, #0]
BLX	R2
L_Process_TP_Up165:
;ECGsynthetic_driver.c,4413 :: 		if (PressedObject == (void *)exec_radio_button) {
MOVW	R2, #lo_addr(_exec_radio_button+0)
MOVT	R2, #hi_addr(_exec_radio_button+0)
LDR	R3, [R2, #0]
MOVW	R2, #lo_addr(_PressedObject+0)
MOVT	R2, #hi_addr(_PressedObject+0)
LDR	R2, [R2, #0]
CMP	R2, R3
IT	NE
BNE	L_Process_TP_Up166
;ECGsynthetic_driver.c,4414 :: 		if (exec_radio_button->Checked == 0) {
MOVW	R2, #lo_addr(_exec_radio_button+0)
MOVT	R2, #hi_addr(_exec_radio_button+0)
LDR	R2, [R2, #0]
ADDS	R2, #20
LDRB	R2, [R2, #0]
CMP	R2, #0
IT	NE
BNE	L_Process_TP_Up167
;ECGsynthetic_driver.c,4415 :: 		exec_radio_button->Checked = 1;
MOVW	R4, #lo_addr(_exec_radio_button+0)
MOVT	R4, #hi_addr(_exec_radio_button+0)
LDR	R2, [R4, #0]
ADDW	R3, R2, #20
MOVS	R2, #1
STRB	R2, [R3, #0]
;ECGsynthetic_driver.c,4416 :: 		DrawRadioButton(exec_radio_button);
MOV	R2, R4
LDR	R2, [R2, #0]
MOV	R0, R2
BL	_DrawRadioButton+0
;ECGsynthetic_driver.c,4417 :: 		}
L_Process_TP_Up167:
;ECGsynthetic_driver.c,4418 :: 		if (exec_radio_button->OnClickPtr != 0)
MOVW	R4, #lo_addr(_exec_radio_button+0)
MOVT	R4, #hi_addr(_exec_radio_button+0)
LDR	R4, [R4, #0]
ADDS	R4, #60
LDR	R4, [R4, #0]
CMP	R4, #0
IT	EQ
BEQ	L_Process_TP_Up168
;ECGsynthetic_driver.c,4419 :: 		exec_radio_button->OnClickPtr();
MOVW	R4, #lo_addr(_exec_radio_button+0)
MOVT	R4, #hi_addr(_exec_radio_button+0)
LDR	R4, [R4, #0]
ADDS	R4, #60
LDR	R2, [R4, #0]
BLX	R2
L_Process_TP_Up168:
;ECGsynthetic_driver.c,4420 :: 		}
L_Process_TP_Up166:
;ECGsynthetic_driver.c,4421 :: 		PressedObject = 0;
MOVS	R3, #0
MOVW	R2, #lo_addr(_PressedObject+0)
MOVT	R2, #hi_addr(_PressedObject+0)
STR	R3, [R2, #0]
;ECGsynthetic_driver.c,4422 :: 		PressedObjectType = -1;
MOVW	R3, #65535
SXTH	R3, R3
MOVW	R2, #lo_addr(_PressedObjectType+0)
MOVT	R2, #hi_addr(_PressedObjectType+0)
STRH	R3, [R2, #0]
;ECGsynthetic_driver.c,4423 :: 		return;
IT	AL
BAL	L_end_Process_TP_Up
;ECGsynthetic_driver.c,4424 :: 		}
L_Process_TP_Up164:
;ECGsynthetic_driver.c,4425 :: 		}
L_Process_TP_Up163:
;ECGsynthetic_driver.c,4427 :: 		}
L_Process_TP_Up137:
;ECGsynthetic_driver.c,4428 :: 		PressedObject = 0;
MOVS	R3, #0
MOVW	R2, #lo_addr(_PressedObject+0)
MOVT	R2, #hi_addr(_PressedObject+0)
STR	R3, [R2, #0]
;ECGsynthetic_driver.c,4429 :: 		PressedObjectType = -1;
MOVW	R3, #65535
SXTH	R3, R3
MOVW	R2, #lo_addr(_PressedObjectType+0)
MOVT	R2, #hi_addr(_PressedObjectType+0)
STRH	R3, [R2, #0]
;ECGsynthetic_driver.c,4430 :: 		}
L_end_Process_TP_Up:
LDR	LR, [SP, #0]
ADD	SP, SP, #12
BX	LR
; end of _Process_TP_Up
_Process_TP_Down:
;ECGsynthetic_driver.c,4432 :: 		void Process_TP_Down(unsigned int X, unsigned int Y) {
; Y start address is: 4 (R1)
; X start address is: 0 (R0)
SUB	SP, SP, #4
STR	LR, [SP, #0]
; Y end address is: 4 (R1)
; X end address is: 0 (R0)
; X start address is: 0 (R0)
; Y start address is: 4 (R1)
;ECGsynthetic_driver.c,4434 :: 		object_pressed      = 0;
MOVS	R3, #0
MOVW	R2, #lo_addr(_object_pressed+0)
MOVT	R2, #hi_addr(_object_pressed+0)
STRB	R3, [R2, #0]
;ECGsynthetic_driver.c,4435 :: 		exec_round_button   = 0;
MOVS	R3, #0
MOVW	R2, #lo_addr(_exec_round_button+0)
MOVT	R2, #hi_addr(_exec_round_button+0)
STR	R3, [R2, #0]
;ECGsynthetic_driver.c,4436 :: 		exec_label          = 0;
MOVS	R3, #0
MOVW	R2, #lo_addr(_exec_label+0)
MOVT	R2, #hi_addr(_exec_label+0)
STR	R3, [R2, #0]
;ECGsynthetic_driver.c,4437 :: 		exec_image          = 0;
MOVS	R3, #0
MOVW	R2, #lo_addr(_exec_image+0)
MOVT	R2, #hi_addr(_exec_image+0)
STR	R3, [R2, #0]
;ECGsynthetic_driver.c,4438 :: 		exec_box            = 0;
MOVS	R3, #0
MOVW	R2, #lo_addr(_exec_box+0)
MOVT	R2, #hi_addr(_exec_box+0)
STR	R3, [R2, #0]
;ECGsynthetic_driver.c,4439 :: 		exec_round_box      = 0;
MOVS	R3, #0
MOVW	R2, #lo_addr(_exec_round_box+0)
MOVT	R2, #hi_addr(_exec_round_box+0)
STR	R3, [R2, #0]
;ECGsynthetic_driver.c,4440 :: 		exec_radio_button   = 0;
MOVS	R3, #0
MOVW	R2, #lo_addr(_exec_radio_button+0)
MOVT	R2, #hi_addr(_exec_radio_button+0)
STR	R3, [R2, #0]
;ECGsynthetic_driver.c,4442 :: 		Get_Object(X, Y);
; Y end address is: 4 (R1)
; X end address is: 0 (R0)
BL	_Get_Object+0
;ECGsynthetic_driver.c,4444 :: 		if (_object_count != -1) {
MOVW	R2, #lo_addr(__object_count+0)
MOVT	R2, #hi_addr(__object_count+0)
LDRSH	R2, [R2, #0]
CMP	R2, #-1
IT	EQ
BEQ	L_Process_TP_Down169
;ECGsynthetic_driver.c,4445 :: 		if (_object_count == round_button_order) {
MOVW	R2, #lo_addr(_round_button_order+0)
MOVT	R2, #hi_addr(_round_button_order+0)
LDRSH	R3, [R2, #0]
MOVW	R2, #lo_addr(__object_count+0)
MOVT	R2, #hi_addr(__object_count+0)
LDRSH	R2, [R2, #0]
CMP	R2, R3
IT	NE
BNE	L_Process_TP_Down170
;ECGsynthetic_driver.c,4446 :: 		if (exec_round_button->Active != 0) {
MOVW	R2, #lo_addr(_exec_round_button+0)
MOVT	R2, #hi_addr(_exec_round_button+0)
LDR	R2, [R2, #0]
ADDS	R2, #19
LDRB	R2, [R2, #0]
CMP	R2, #0
IT	EQ
BEQ	L_Process_TP_Down171
;ECGsynthetic_driver.c,4447 :: 		if (exec_round_button->PressColEnabled != 0) {
MOVW	R2, #lo_addr(_exec_round_button+0)
MOVT	R2, #hi_addr(_exec_round_button+0)
LDR	R2, [R2, #0]
ADDS	R2, #49
LDRB	R2, [R2, #0]
CMP	R2, #0
IT	EQ
BEQ	L_Process_TP_Down172
;ECGsynthetic_driver.c,4448 :: 		object_pressed = 1;
MOVS	R3, #1
MOVW	R2, #lo_addr(_object_pressed+0)
MOVT	R2, #hi_addr(_object_pressed+0)
STRB	R3, [R2, #0]
;ECGsynthetic_driver.c,4449 :: 		DrawRoundButton(exec_round_button);
MOVW	R2, #lo_addr(_exec_round_button+0)
MOVT	R2, #hi_addr(_exec_round_button+0)
LDR	R2, [R2, #0]
MOV	R0, R2
BL	_DrawRoundButton+0
;ECGsynthetic_driver.c,4450 :: 		}
L_Process_TP_Down172:
;ECGsynthetic_driver.c,4451 :: 		PressedObject = (void *)exec_round_button;
MOVW	R4, #lo_addr(_exec_round_button+0)
MOVT	R4, #hi_addr(_exec_round_button+0)
LDR	R3, [R4, #0]
MOVW	R2, #lo_addr(_PressedObject+0)
MOVT	R2, #hi_addr(_PressedObject+0)
STR	R3, [R2, #0]
;ECGsynthetic_driver.c,4452 :: 		PressedObjectType = 1;
MOVS	R3, #1
SXTH	R3, R3
MOVW	R2, #lo_addr(_PressedObjectType+0)
MOVT	R2, #hi_addr(_PressedObjectType+0)
STRH	R3, [R2, #0]
;ECGsynthetic_driver.c,4453 :: 		if (exec_round_button->OnDownPtr != 0) {
LDR	R4, [R4, #0]
ADDS	R4, #56
LDR	R4, [R4, #0]
CMP	R4, #0
IT	EQ
BEQ	L_Process_TP_Down173
;ECGsynthetic_driver.c,4454 :: 		exec_round_button->OnDownPtr();
MOVW	R4, #lo_addr(_exec_round_button+0)
MOVT	R4, #hi_addr(_exec_round_button+0)
LDR	R4, [R4, #0]
ADDS	R4, #56
LDR	R2, [R4, #0]
BLX	R2
;ECGsynthetic_driver.c,4455 :: 		return;
IT	AL
BAL	L_end_Process_TP_Down
;ECGsynthetic_driver.c,4456 :: 		}
L_Process_TP_Down173:
;ECGsynthetic_driver.c,4457 :: 		}
L_Process_TP_Down171:
;ECGsynthetic_driver.c,4458 :: 		}
L_Process_TP_Down170:
;ECGsynthetic_driver.c,4460 :: 		if (_object_count == label_order) {
MOVW	R2, #lo_addr(_label_order+0)
MOVT	R2, #hi_addr(_label_order+0)
LDRSH	R3, [R2, #0]
MOVW	R2, #lo_addr(__object_count+0)
MOVT	R2, #hi_addr(__object_count+0)
LDRSH	R2, [R2, #0]
CMP	R2, R3
IT	NE
BNE	L_Process_TP_Down174
;ECGsynthetic_driver.c,4461 :: 		if (exec_label->Active != 0) {
MOVW	R2, #lo_addr(_exec_label+0)
MOVT	R2, #hi_addr(_exec_label+0)
LDR	R2, [R2, #0]
ADDS	R2, #28
LDRB	R2, [R2, #0]
CMP	R2, #0
IT	EQ
BEQ	L_Process_TP_Down175
;ECGsynthetic_driver.c,4462 :: 		PressedObject = (void *)exec_label;
MOVW	R4, #lo_addr(_exec_label+0)
MOVT	R4, #hi_addr(_exec_label+0)
LDR	R3, [R4, #0]
MOVW	R2, #lo_addr(_PressedObject+0)
MOVT	R2, #hi_addr(_PressedObject+0)
STR	R3, [R2, #0]
;ECGsynthetic_driver.c,4463 :: 		PressedObjectType = 2;
MOVS	R3, #2
SXTH	R3, R3
MOVW	R2, #lo_addr(_PressedObjectType+0)
MOVT	R2, #hi_addr(_PressedObjectType+0)
STRH	R3, [R2, #0]
;ECGsynthetic_driver.c,4464 :: 		if (exec_label->OnDownPtr != 0) {
LDR	R4, [R4, #0]
ADDS	R4, #36
LDR	R4, [R4, #0]
CMP	R4, #0
IT	EQ
BEQ	L_Process_TP_Down176
;ECGsynthetic_driver.c,4465 :: 		exec_label->OnDownPtr();
MOVW	R4, #lo_addr(_exec_label+0)
MOVT	R4, #hi_addr(_exec_label+0)
LDR	R4, [R4, #0]
ADDS	R4, #36
LDR	R2, [R4, #0]
BLX	R2
;ECGsynthetic_driver.c,4466 :: 		return;
IT	AL
BAL	L_end_Process_TP_Down
;ECGsynthetic_driver.c,4467 :: 		}
L_Process_TP_Down176:
;ECGsynthetic_driver.c,4468 :: 		}
L_Process_TP_Down175:
;ECGsynthetic_driver.c,4469 :: 		}
L_Process_TP_Down174:
;ECGsynthetic_driver.c,4471 :: 		if (_object_count == image_order) {
MOVW	R2, #lo_addr(_image_order+0)
MOVT	R2, #hi_addr(_image_order+0)
LDRSH	R3, [R2, #0]
MOVW	R2, #lo_addr(__object_count+0)
MOVT	R2, #hi_addr(__object_count+0)
LDRSH	R2, [R2, #0]
CMP	R2, R3
IT	NE
BNE	L_Process_TP_Down177
;ECGsynthetic_driver.c,4472 :: 		if (exec_image->Active != 0) {
MOVW	R2, #lo_addr(_exec_image+0)
MOVT	R2, #hi_addr(_exec_image+0)
LDR	R2, [R2, #0]
ADDS	R2, #21
LDRB	R2, [R2, #0]
CMP	R2, #0
IT	EQ
BEQ	L_Process_TP_Down178
;ECGsynthetic_driver.c,4473 :: 		PressedObject = (void *)exec_image;
MOVW	R4, #lo_addr(_exec_image+0)
MOVT	R4, #hi_addr(_exec_image+0)
LDR	R3, [R4, #0]
MOVW	R2, #lo_addr(_PressedObject+0)
MOVT	R2, #hi_addr(_PressedObject+0)
STR	R3, [R2, #0]
;ECGsynthetic_driver.c,4474 :: 		PressedObjectType = 3;
MOVS	R3, #3
SXTH	R3, R3
MOVW	R2, #lo_addr(_PressedObjectType+0)
MOVT	R2, #hi_addr(_PressedObjectType+0)
STRH	R3, [R2, #0]
;ECGsynthetic_driver.c,4475 :: 		if (exec_image->OnDownPtr != 0) {
LDR	R4, [R4, #0]
ADDS	R4, #28
LDR	R4, [R4, #0]
CMP	R4, #0
IT	EQ
BEQ	L_Process_TP_Down179
;ECGsynthetic_driver.c,4476 :: 		exec_image->OnDownPtr();
MOVW	R4, #lo_addr(_exec_image+0)
MOVT	R4, #hi_addr(_exec_image+0)
LDR	R4, [R4, #0]
ADDS	R4, #28
LDR	R2, [R4, #0]
BLX	R2
;ECGsynthetic_driver.c,4477 :: 		return;
IT	AL
BAL	L_end_Process_TP_Down
;ECGsynthetic_driver.c,4478 :: 		}
L_Process_TP_Down179:
;ECGsynthetic_driver.c,4479 :: 		}
L_Process_TP_Down178:
;ECGsynthetic_driver.c,4480 :: 		}
L_Process_TP_Down177:
;ECGsynthetic_driver.c,4482 :: 		if (_object_count == box_order) {
MOVW	R2, #lo_addr(_box_order+0)
MOVT	R2, #hi_addr(_box_order+0)
LDRSH	R3, [R2, #0]
MOVW	R2, #lo_addr(__object_count+0)
MOVT	R2, #hi_addr(__object_count+0)
LDRSH	R2, [R2, #0]
CMP	R2, R3
IT	NE
BNE	L_Process_TP_Down180
;ECGsynthetic_driver.c,4483 :: 		if (exec_box->Active != 0) {
MOVW	R2, #lo_addr(_exec_box+0)
MOVT	R2, #hi_addr(_exec_box+0)
LDR	R2, [R2, #0]
ADDS	R2, #19
LDRB	R2, [R2, #0]
CMP	R2, #0
IT	EQ
BEQ	L_Process_TP_Down181
;ECGsynthetic_driver.c,4484 :: 		if (exec_box->PressColEnabled != 0) {
MOVW	R2, #lo_addr(_exec_box+0)
MOVT	R2, #hi_addr(_exec_box+0)
LDR	R2, [R2, #0]
ADDS	R2, #30
LDRB	R2, [R2, #0]
CMP	R2, #0
IT	EQ
BEQ	L_Process_TP_Down182
;ECGsynthetic_driver.c,4485 :: 		object_pressed = 1;
MOVS	R3, #1
MOVW	R2, #lo_addr(_object_pressed+0)
MOVT	R2, #hi_addr(_object_pressed+0)
STRB	R3, [R2, #0]
;ECGsynthetic_driver.c,4486 :: 		DrawBox(exec_box);
MOVW	R2, #lo_addr(_exec_box+0)
MOVT	R2, #hi_addr(_exec_box+0)
LDR	R2, [R2, #0]
MOV	R0, R2
BL	_DrawBox+0
;ECGsynthetic_driver.c,4487 :: 		}
L_Process_TP_Down182:
;ECGsynthetic_driver.c,4488 :: 		PressedObject = (void *)exec_box;
MOVW	R4, #lo_addr(_exec_box+0)
MOVT	R4, #hi_addr(_exec_box+0)
LDR	R3, [R4, #0]
MOVW	R2, #lo_addr(_PressedObject+0)
MOVT	R2, #hi_addr(_PressedObject+0)
STR	R3, [R2, #0]
;ECGsynthetic_driver.c,4489 :: 		PressedObjectType = 6;
MOVS	R3, #6
SXTH	R3, R3
MOVW	R2, #lo_addr(_PressedObjectType+0)
MOVT	R2, #hi_addr(_PressedObjectType+0)
STRH	R3, [R2, #0]
;ECGsynthetic_driver.c,4490 :: 		if (exec_box->OnDownPtr != 0) {
LDR	R4, [R4, #0]
ADDS	R4, #40
LDR	R4, [R4, #0]
CMP	R4, #0
IT	EQ
BEQ	L_Process_TP_Down183
;ECGsynthetic_driver.c,4491 :: 		exec_box->OnDownPtr();
MOVW	R4, #lo_addr(_exec_box+0)
MOVT	R4, #hi_addr(_exec_box+0)
LDR	R4, [R4, #0]
ADDS	R4, #40
LDR	R2, [R4, #0]
BLX	R2
;ECGsynthetic_driver.c,4492 :: 		return;
IT	AL
BAL	L_end_Process_TP_Down
;ECGsynthetic_driver.c,4493 :: 		}
L_Process_TP_Down183:
;ECGsynthetic_driver.c,4494 :: 		}
L_Process_TP_Down181:
;ECGsynthetic_driver.c,4495 :: 		}
L_Process_TP_Down180:
;ECGsynthetic_driver.c,4497 :: 		if (_object_count == box_round_order) {
MOVW	R2, #lo_addr(_box_round_order+0)
MOVT	R2, #hi_addr(_box_round_order+0)
LDRSH	R3, [R2, #0]
MOVW	R2, #lo_addr(__object_count+0)
MOVT	R2, #hi_addr(__object_count+0)
LDRSH	R2, [R2, #0]
CMP	R2, R3
IT	NE
BNE	L_Process_TP_Down184
;ECGsynthetic_driver.c,4498 :: 		if (exec_round_box->Active != 0) {
MOVW	R2, #lo_addr(_exec_round_box+0)
MOVT	R2, #hi_addr(_exec_round_box+0)
LDR	R2, [R2, #0]
ADDS	R2, #19
LDRB	R2, [R2, #0]
CMP	R2, #0
IT	EQ
BEQ	L_Process_TP_Down185
;ECGsynthetic_driver.c,4499 :: 		if (exec_round_box->PressColEnabled != 0) {
MOVW	R2, #lo_addr(_exec_round_box+0)
MOVT	R2, #hi_addr(_exec_round_box+0)
LDR	R2, [R2, #0]
ADDS	R2, #31
LDRB	R2, [R2, #0]
CMP	R2, #0
IT	EQ
BEQ	L_Process_TP_Down186
;ECGsynthetic_driver.c,4500 :: 		object_pressed = 1;
MOVS	R3, #1
MOVW	R2, #lo_addr(_object_pressed+0)
MOVT	R2, #hi_addr(_object_pressed+0)
STRB	R3, [R2, #0]
;ECGsynthetic_driver.c,4501 :: 		DrawRoundBox(exec_round_box);
MOVW	R2, #lo_addr(_exec_round_box+0)
MOVT	R2, #hi_addr(_exec_round_box+0)
LDR	R2, [R2, #0]
MOV	R0, R2
BL	_DrawRoundBox+0
;ECGsynthetic_driver.c,4502 :: 		}
L_Process_TP_Down186:
;ECGsynthetic_driver.c,4503 :: 		PressedObject = (void *)exec_round_box;
MOVW	R4, #lo_addr(_exec_round_box+0)
MOVT	R4, #hi_addr(_exec_round_box+0)
LDR	R3, [R4, #0]
MOVW	R2, #lo_addr(_PressedObject+0)
MOVT	R2, #hi_addr(_PressedObject+0)
STR	R3, [R2, #0]
;ECGsynthetic_driver.c,4504 :: 		PressedObjectType = 7;
MOVS	R3, #7
SXTH	R3, R3
MOVW	R2, #lo_addr(_PressedObjectType+0)
MOVT	R2, #hi_addr(_PressedObjectType+0)
STRH	R3, [R2, #0]
;ECGsynthetic_driver.c,4505 :: 		if (exec_round_box->OnDownPtr != 0) {
LDR	R4, [R4, #0]
ADDS	R4, #40
LDR	R4, [R4, #0]
CMP	R4, #0
IT	EQ
BEQ	L_Process_TP_Down187
;ECGsynthetic_driver.c,4506 :: 		exec_round_box->OnDownPtr();
MOVW	R4, #lo_addr(_exec_round_box+0)
MOVT	R4, #hi_addr(_exec_round_box+0)
LDR	R4, [R4, #0]
ADDS	R4, #40
LDR	R2, [R4, #0]
BLX	R2
;ECGsynthetic_driver.c,4507 :: 		return;
IT	AL
BAL	L_end_Process_TP_Down
;ECGsynthetic_driver.c,4508 :: 		}
L_Process_TP_Down187:
;ECGsynthetic_driver.c,4509 :: 		}
L_Process_TP_Down185:
;ECGsynthetic_driver.c,4510 :: 		}
L_Process_TP_Down184:
;ECGsynthetic_driver.c,4512 :: 		if (_object_count == radio_button_order) {
MOVW	R2, #lo_addr(_radio_button_order+0)
MOVT	R2, #hi_addr(_radio_button_order+0)
LDRSH	R3, [R2, #0]
MOVW	R2, #lo_addr(__object_count+0)
MOVT	R2, #hi_addr(__object_count+0)
LDRSH	R2, [R2, #0]
CMP	R2, R3
IT	NE
BNE	L_Process_TP_Down188
;ECGsynthetic_driver.c,4513 :: 		if (exec_radio_button->Active != 0) {
MOVW	R2, #lo_addr(_exec_radio_button+0)
MOVT	R2, #hi_addr(_exec_radio_button+0)
LDR	R2, [R2, #0]
ADDS	R2, #19
LDRB	R2, [R2, #0]
CMP	R2, #0
IT	EQ
BEQ	L_Process_TP_Down189
;ECGsynthetic_driver.c,4514 :: 		if (exec_radio_button->PressColEnabled != 0) {
MOVW	R2, #lo_addr(_exec_radio_button+0)
MOVT	R2, #hi_addr(_exec_radio_button+0)
LDR	R2, [R2, #0]
ADDS	R2, #48
LDRB	R2, [R2, #0]
CMP	R2, #0
IT	EQ
BEQ	L_Process_TP_Down190
;ECGsynthetic_driver.c,4515 :: 		object_pressed = 1;
MOVS	R3, #1
MOVW	R2, #lo_addr(_object_pressed+0)
MOVT	R2, #hi_addr(_object_pressed+0)
STRB	R3, [R2, #0]
;ECGsynthetic_driver.c,4516 :: 		DrawRadioButton(exec_radio_button);
MOVW	R2, #lo_addr(_exec_radio_button+0)
MOVT	R2, #hi_addr(_exec_radio_button+0)
LDR	R2, [R2, #0]
MOV	R0, R2
BL	_DrawRadioButton+0
;ECGsynthetic_driver.c,4517 :: 		}
L_Process_TP_Down190:
;ECGsynthetic_driver.c,4518 :: 		PressedObject = (void *)exec_radio_button;
MOVW	R4, #lo_addr(_exec_radio_button+0)
MOVT	R4, #hi_addr(_exec_radio_button+0)
LDR	R3, [R4, #0]
MOVW	R2, #lo_addr(_PressedObject+0)
MOVT	R2, #hi_addr(_PressedObject+0)
STR	R3, [R2, #0]
;ECGsynthetic_driver.c,4519 :: 		PressedObjectType = 17;
MOVS	R3, #17
SXTH	R3, R3
MOVW	R2, #lo_addr(_PressedObjectType+0)
MOVT	R2, #hi_addr(_PressedObjectType+0)
STRH	R3, [R2, #0]
;ECGsynthetic_driver.c,4520 :: 		if (exec_radio_button->OnDownPtr != 0) {
LDR	R4, [R4, #0]
ADDS	R4, #56
LDR	R4, [R4, #0]
CMP	R4, #0
IT	EQ
BEQ	L_Process_TP_Down191
;ECGsynthetic_driver.c,4521 :: 		exec_radio_button->OnDownPtr();
MOVW	R4, #lo_addr(_exec_radio_button+0)
MOVT	R4, #hi_addr(_exec_radio_button+0)
LDR	R4, [R4, #0]
ADDS	R4, #56
LDR	R2, [R4, #0]
BLX	R2
;ECGsynthetic_driver.c,4522 :: 		return;
IT	AL
BAL	L_end_Process_TP_Down
;ECGsynthetic_driver.c,4523 :: 		}
L_Process_TP_Down191:
;ECGsynthetic_driver.c,4524 :: 		}
L_Process_TP_Down189:
;ECGsynthetic_driver.c,4525 :: 		}
L_Process_TP_Down188:
;ECGsynthetic_driver.c,4527 :: 		}
L_Process_TP_Down169:
;ECGsynthetic_driver.c,4528 :: 		}
L_end_Process_TP_Down:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Process_TP_Down
_Check_TP:
;ECGsynthetic_driver.c,4530 :: 		void Check_TP() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;ECGsynthetic_driver.c,4531 :: 		if (FT5XX6_PressDetect()) {
BL	_FT5XX6_PressDetect+0
CMP	R0, #0
IT	EQ
BEQ	L_Check_TP192
;ECGsynthetic_driver.c,4532 :: 		if (FT5XX6_GetCoordinates(&Xcoord, &Ycoord) == 0) {
MOVW	R1, #lo_addr(_Ycoord+0)
MOVT	R1, #hi_addr(_Ycoord+0)
MOVW	R0, #lo_addr(_Xcoord+0)
MOVT	R0, #hi_addr(_Xcoord+0)
BL	_FT5XX6_GetCoordinates+0
CMP	R0, #0
IT	NE
BNE	L_Check_TP193
;ECGsynthetic_driver.c,4534 :: 		Process_TP_Press(Xcoord, Ycoord);
MOVW	R0, #lo_addr(_Ycoord+0)
MOVT	R0, #hi_addr(_Ycoord+0)
LDRH	R1, [R0, #0]
MOVW	R0, #lo_addr(_Xcoord+0)
MOVT	R0, #hi_addr(_Xcoord+0)
LDRH	R0, [R0, #0]
BL	_Process_TP_Press+0
;ECGsynthetic_driver.c,4535 :: 		if (PenDown == 0) {
MOVW	R0, #lo_addr(_PenDown+0)
MOVT	R0, #hi_addr(_PenDown+0)
LDRB	R0, [R0, #0]
CMP	R0, #0
IT	NE
BNE	L_Check_TP194
;ECGsynthetic_driver.c,4536 :: 		PenDown = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_PenDown+0)
MOVT	R0, #hi_addr(_PenDown+0)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,4537 :: 		Process_TP_Down(Xcoord, Ycoord);
MOVW	R0, #lo_addr(_Ycoord+0)
MOVT	R0, #hi_addr(_Ycoord+0)
LDRH	R1, [R0, #0]
MOVW	R0, #lo_addr(_Xcoord+0)
MOVT	R0, #hi_addr(_Xcoord+0)
LDRH	R0, [R0, #0]
BL	_Process_TP_Down+0
;ECGsynthetic_driver.c,4538 :: 		}
L_Check_TP194:
;ECGsynthetic_driver.c,4539 :: 		}
L_Check_TP193:
;ECGsynthetic_driver.c,4540 :: 		}
IT	AL
BAL	L_Check_TP195
L_Check_TP192:
;ECGsynthetic_driver.c,4541 :: 		else if (PenDown == 1) {
MOVW	R0, #lo_addr(_PenDown+0)
MOVT	R0, #hi_addr(_PenDown+0)
LDRB	R0, [R0, #0]
CMP	R0, #1
IT	NE
BNE	L_Check_TP196
;ECGsynthetic_driver.c,4542 :: 		PenDown = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_PenDown+0)
MOVT	R0, #hi_addr(_PenDown+0)
STRB	R1, [R0, #0]
;ECGsynthetic_driver.c,4543 :: 		Process_TP_Up(Xcoord, Ycoord);
MOVW	R0, #lo_addr(_Ycoord+0)
MOVT	R0, #hi_addr(_Ycoord+0)
LDRH	R1, [R0, #0]
MOVW	R0, #lo_addr(_Xcoord+0)
MOVT	R0, #hi_addr(_Xcoord+0)
LDRH	R0, [R0, #0]
BL	_Process_TP_Up+0
;ECGsynthetic_driver.c,4544 :: 		}
L_Check_TP196:
L_Check_TP195:
;ECGsynthetic_driver.c,4545 :: 		}
L_end_Check_TP:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Check_TP
_Init_MCU:
;ECGsynthetic_driver.c,4547 :: 		void Init_MCU()
SUB	SP, SP, #4
STR	LR, [SP, #0]
;ECGsynthetic_driver.c,4549 :: 		GPIO_Digital_Output(&GPIOB_BASE, _GPIO_PINMASK_6);
MOVW	R1, #64
MOVW	R0, #lo_addr(GPIOB_BASE+0)
MOVT	R0, #hi_addr(GPIOB_BASE+0)
BL	_GPIO_Digital_Output+0
;ECGsynthetic_driver.c,4550 :: 		GPIO_Digital_Input(&GPIOB_BASE, _GPIO_PINMASK_7);
MOVW	R1, #128
MOVW	R0, #lo_addr(GPIOB_BASE+0)
MOVT	R0, #hi_addr(GPIOB_BASE+0)
BL	_GPIO_Digital_Input+0
;ECGsynthetic_driver.c,4551 :: 		GPIOB_ODR.B6 = 1;
MOVS	R1, #1
SXTB	R1, R1
MOVW	R0, #lo_addr(GPIOB_ODR+0)
MOVT	R0, #hi_addr(GPIOB_ODR+0)
_SX	[R0, ByteOffset(GPIOB_ODR+0)]
;ECGsynthetic_driver.c,4552 :: 		while (GPIOB_IDR.B7 == 0) {
L_Init_MCU197:
MOVW	R0, #lo_addr(GPIOB_IDR+0)
MOVT	R0, #hi_addr(GPIOB_IDR+0)
_LX	[R0, ByteOffset(GPIOB_IDR+0)]
CMP	R0, #0
IT	NE
BNE	L_Init_MCU198
;ECGsynthetic_driver.c,4553 :: 		GPIOB_ODR.B6 = 0;
MOVS	R1, #0
SXTB	R1, R1
MOVW	R0, #lo_addr(GPIOB_ODR+0)
MOVT	R0, #hi_addr(GPIOB_ODR+0)
_SX	[R0, ByteOffset(GPIOB_ODR+0)]
;ECGsynthetic_driver.c,4554 :: 		Delay_us(10);
MOVW	R7, #558
MOVT	R7, #0
NOP
NOP
L_Init_MCU199:
SUBS	R7, R7, #1
BNE	L_Init_MCU199
NOP
NOP
NOP
;ECGsynthetic_driver.c,4555 :: 		GPIOB_ODR.B6 = 1;
MOVS	R1, #1
SXTB	R1, R1
MOVW	R0, #lo_addr(GPIOB_ODR+0)
MOVT	R0, #hi_addr(GPIOB_ODR+0)
_SX	[R0, ByteOffset(GPIOB_ODR+0)]
;ECGsynthetic_driver.c,4556 :: 		Delay_us(10);
MOVW	R7, #558
MOVT	R7, #0
NOP
NOP
L_Init_MCU201:
SUBS	R7, R7, #1
BNE	L_Init_MCU201
NOP
NOP
NOP
;ECGsynthetic_driver.c,4557 :: 		}
IT	AL
BAL	L_Init_MCU197
L_Init_MCU198:
;ECGsynthetic_driver.c,4558 :: 		I2C1_Init_Advanced(400000, &_GPIO_MODULE_I2C1_PB67);
MOVW	R1, #lo_addr(__GPIO_MODULE_I2C1_PB67+0)
MOVT	R1, #hi_addr(__GPIO_MODULE_I2C1_PB67+0)
MOVW	R0, #6784
MOVT	R0, #6
BL	_I2C1_Init_Advanced+0
;ECGsynthetic_driver.c,4559 :: 		}
L_end_Init_MCU:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Init_MCU
_FT5XX6_Config:
;ECGsynthetic_driver.c,4561 :: 		char FT5XX6_Config()  {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;ECGsynthetic_driver.c,4562 :: 		FT5XX6_SetI2CAddress(0x38);
MOVS	R0, #56
BL	_FT5XX6_SetI2CAddress+0
;ECGsynthetic_driver.c,4563 :: 		if (FT5XX6_IsOperational() != FT5XX6_OK)
BL	_FT5XX6_IsOperational+0
CMP	R0, #0
IT	EQ
BEQ	L_FT5XX6_Config203
;ECGsynthetic_driver.c,4564 :: 		return  FT5XX6_FAILURE;
MOVS	R0, #1
IT	AL
BAL	L_end_FT5XX6_Config
L_FT5XX6_Config203:
;ECGsynthetic_driver.c,4565 :: 		FT5XX6_SetDefaultMode();
BL	_FT5XX6_SetDefaultMode+0
;ECGsynthetic_driver.c,4566 :: 		FT5XX6_SetController(_TC_FT5X06);
MOVS	R0, #1
BL	_FT5XX6_SetController+0
;ECGsynthetic_driver.c,4567 :: 		FT5XX6_SetSizeAndRotation(800,480,2);
MOVS	R2, #2
MOVW	R1, #480
MOVW	R0, #800
BL	_FT5XX6_SetSizeAndRotation+0
;ECGsynthetic_driver.c,4568 :: 		return FT5XX6_OK;
MOVS	R0, #0
;ECGsynthetic_driver.c,4569 :: 		}
L_end_FT5XX6_Config:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _FT5XX6_Config
_Start_TP:
;ECGsynthetic_driver.c,4571 :: 		void Start_TP() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;ECGsynthetic_driver.c,4572 :: 		Init_MCU();
BL	_Init_MCU+0
;ECGsynthetic_driver.c,4574 :: 		InitializeTouchPanel();
BL	ECGsynthetic_driver_InitializeTouchPanel+0
;ECGsynthetic_driver.c,4575 :: 		if (FT5XX6_Config() == FT5XX6_OK) {
BL	_FT5XX6_Config+0
CMP	R0, #0
IT	NE
BNE	L_Start_TP204
;ECGsynthetic_driver.c,4576 :: 		} else {
IT	AL
BAL	L_Start_TP205
L_Start_TP204:
;ECGsynthetic_driver.c,4577 :: 		while(1);
L_Start_TP206:
IT	AL
BAL	L_Start_TP206
;ECGsynthetic_driver.c,4578 :: 		}
L_Start_TP205:
;ECGsynthetic_driver.c,4581 :: 		InitializeObjects();
BL	ECGsynthetic_driver_InitializeObjects+0
;ECGsynthetic_driver.c,4582 :: 		display_width = Screen1.Width;
MOVW	R0, #lo_addr(_Screen1+2)
MOVT	R0, #hi_addr(_Screen1+2)
LDRH	R1, [R0, #0]
MOVW	R0, #lo_addr(_display_width+0)
MOVT	R0, #hi_addr(_display_width+0)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,4583 :: 		display_height = Screen1.Height;
MOVW	R0, #lo_addr(_Screen1+4)
MOVT	R0, #hi_addr(_Screen1+4)
LDRH	R1, [R0, #0]
MOVW	R0, #lo_addr(_display_height+0)
MOVT	R0, #hi_addr(_display_height+0)
STRH	R1, [R0, #0]
;ECGsynthetic_driver.c,4584 :: 		DrawScreen(&Screen1);
MOVW	R0, #lo_addr(_Screen1+0)
MOVT	R0, #hi_addr(_Screen1+0)
BL	_DrawScreen+0
;ECGsynthetic_driver.c,4585 :: 		}
L_end_Start_TP:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Start_TP
ECGsynthetic_driver____?ag:
L_end_ECGsynthetic_driver___?ag:
BX	LR
; end of ECGsynthetic_driver____?ag
