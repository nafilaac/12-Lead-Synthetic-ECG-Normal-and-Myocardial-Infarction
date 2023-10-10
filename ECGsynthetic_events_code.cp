#line 1 "D:/ITS/AKADEMIK/TA/12-lead Synthetic ECG Normal and Myocardial Infarction/ECGsynthetic_events_code.c"
#line 1 "d:/its/akademik/ta/12-lead synthetic ecg normal and myocardial infarction/ecgsynthetic_objects.h"
typedef enum {_taLeft, _taCenter, _taRight} TTextAlign;
typedef enum {_tavTop, _tavMiddle, _tavBottom} TTextAlignVertical;

typedef struct Screen TScreen;

typedef struct Button_Round {
 TScreen* OwnerScreen;
 char Order;
 unsigned int Left;
 unsigned int Top;
 unsigned int Width;
 unsigned int Height;
 char Pen_Width;
 unsigned int Pen_Color;
 char Visible;
 char Active;
 char Transparent;
 char *Caption;
 TTextAlign TextAlign;
 TTextAlignVertical TextAlignVertical;
 const char *FontName;
 unsigned int Font_Color;
 char VerticalText;
 char Gradient;
 char Gradient_Orientation;
 unsigned int Gradient_Start_Color;
 unsigned int Gradient_End_Color;
 unsigned int Color;
 char Corner_Radius;
 char PressColEnabled;
 unsigned int Press_Color;
 void (*OnUpPtr)();
 void (*OnDownPtr)();
 void (*OnClickPtr)();
 void (*OnPressPtr)();
} TButton_Round;

typedef struct Label {
 TScreen* OwnerScreen;
 char Order;
 unsigned int Left;
 unsigned int Top;
 unsigned int Width;
 unsigned int Height;
 char *Caption;
 const char *FontName;
 unsigned int Font_Color;
 char VerticalText;
 char Visible;
 char Active;
 void (*OnUpPtr)();
 void (*OnDownPtr)();
 void (*OnClickPtr)();
 void (*OnPressPtr)();
} TLabel;

typedef struct Image {
 TScreen* OwnerScreen;
 char Order;
 unsigned int Left;
 unsigned int Top;
 unsigned int Width;
 unsigned int Height;
 const char *Picture_Name;
 char Visible;
 char Active;
 char Picture_Type;
 char Picture_Ratio;
 void (*OnUpPtr)();
 void (*OnDownPtr)();
 void (*OnClickPtr)();
 void (*OnPressPtr)();
} TImage;

typedef struct Box {
 TScreen* OwnerScreen;
 char Order;
 unsigned int Left;
 unsigned int Top;
 unsigned int Width;
 unsigned int Height;
 char Pen_Width;
 unsigned int Pen_Color;
 char Visible;
 char Active;
 char Transparent;
 char Gradient;
 char Gradient_Orientation;
 unsigned int Gradient_Start_Color;
 unsigned int Gradient_End_Color;
 unsigned int Color;
 char PressColEnabled;
 unsigned int Press_Color;
 void (*OnUpPtr)();
 void (*OnDownPtr)();
 void (*OnClickPtr)();
 void (*OnPressPtr)();
} TBox;

typedef struct Box_Round {
 TScreen* OwnerScreen;
 char Order;
 unsigned int Left;
 unsigned int Top;
 unsigned int Width;
 unsigned int Height;
 char Pen_Width;
 unsigned int Pen_Color;
 char Visible;
 char Active;
 char Transparent;
 char Gradient;
 char Gradient_Orientation;
 unsigned int Gradient_Start_Color;
 unsigned int Gradient_End_Color;
 unsigned int Color;
 char Corner_Radius;
 char PressColEnabled;
 unsigned int Press_Color;
 void (*OnUpPtr)();
 void (*OnDownPtr)();
 void (*OnClickPtr)();
 void (*OnPressPtr)();
} TBox_Round;

typedef struct RadioButton {
 TScreen* OwnerScreen;
 char Order;
 unsigned int Left;
 unsigned int Top;
 unsigned int Width;
 unsigned int Height;
 char Pen_Width;
 unsigned int Pen_Color;
 char Visible;
 char Active;
 char Checked;
 char Transparent;
 char *Caption;
 TTextAlign TextAlign;
 const char *FontName;
 unsigned int Font_Color;
 char Gradient;
 char Gradient_Orientation;
 unsigned int Gradient_Start_Color;
 unsigned int Gradient_End_Color;
 unsigned int Color;
 unsigned int Background_Color;
 char PressColEnabled;
 unsigned int Press_Color;
 void (*OnUpPtr)();
 void (*OnDownPtr)();
 void (*OnClickPtr)();
 void (*OnPressPtr)();
} TRadioButton;

struct Screen {
 unsigned int Color;
 unsigned int Width;
 unsigned int Height;
 unsigned int ObjectsCount;
 unsigned int Buttons_RoundCount;
 TButton_Round * const code *Buttons_Round;
 unsigned int LabelsCount;
 TLabel * const code *Labels;
 unsigned int ImagesCount;
 TImage * const code *Images;
 unsigned int BoxesCount;
 TBox * const code *Boxes;
 unsigned int Boxes_RoundCount;
 TBox_Round * const code *Boxes_Round;
 unsigned int RadioButtonsCount;
 TRadioButton * const code *RadioButtons;
 void (*OnSwipeLeftPtr)();
 void (*OnSwipeRightPtr)();
 void (*OnSwipeUpPtr)();
 void (*OnSwipeDownPtr)();
 void (*OnZoomInPtr)();
 void (*OnZoomOutPtr)();
};

extern TScreen Screen1;
extern TBox Box3;
extern TLabel Label1;
extern TButton_Round ButtonRound1;
extern TButton_Round ButtonRound2;
extern TLabel Label2;
extern TLabel Label3;
extern TLabel Label4;
extern TLabel Label5;
extern TLabel Label6;
extern TLabel Label7;
extern TLabel Label8;
extern TLabel Label9;
extern TLabel Label10;
extern TLabel Label11;
extern TImage Image1;
extern TLabel Label12;
extern TLabel Label13;
extern TImage Image2;
extern TLabel Label14;
extern TBox_Round BoxRound1;
extern TLabel Label19;
extern TButton_Round ButtonRound36;
extern TButton_Round ButtonRound37;
extern TButton_Round * const code Screen1_Buttons_Round[4];
extern TLabel * const code Screen1_Labels[15];
extern TImage * const code Screen1_Images[2];
extern TBox * const code Screen1_Boxes[1];
extern TBox_Round * const code Screen1_Boxes_Round[1];

extern TScreen Screen2;
extern TRadioButton RadioButton3;
extern TRadioButton RadioButton4;
extern TRadioButton RadioButton5;
extern TRadioButton RadioButton6;
extern TRadioButton RadioButton7;
extern TRadioButton RadioButton8;
extern TRadioButton RadioButton9;
extern TRadioButton RadioButton10;
extern TRadioButton RadioButton11;
extern TRadioButton RadioButton12;
extern TRadioButton RadioButton13;
extern TRadioButton RadioButton14;
extern TLabel Label15;
extern TButton_Round ButtonRound3;
extern TLabel Label16;
extern TButton_Round ButtonRound4;
extern TImage Image3;
extern TButton_Round * const code Screen2_Buttons_Round[2];
extern TLabel * const code Screen2_Labels[2];
extern TImage * const code Screen2_Images[1];
extern TRadioButton * const code Screen2_RadioButtons[12];

extern TScreen Screen3;
extern TRadioButton RadioButton1;
extern TRadioButton RadioButton2;
extern TRadioButton RadioButton15;
extern TRadioButton RadioButton16;
extern TRadioButton RadioButton17;
extern TRadioButton RadioButton18;
extern TRadioButton RadioButton19;
extern TRadioButton RadioButton20;
extern TRadioButton RadioButton21;
extern TRadioButton RadioButton22;
extern TRadioButton RadioButton23;
extern TRadioButton RadioButton24;
extern TLabel Label17;
extern TButton_Round ButtonRound5;
extern TLabel Label18;
extern TButton_Round ButtonRound6;
extern TImage Image4;
extern TButton_Round * const code Screen3_Buttons_Round[2];
extern TLabel * const code Screen3_Labels[2];
extern TImage * const code Screen3_Images[1];
extern TRadioButton * const code Screen3_RadioButtons[12];

extern TScreen Screen4;
extern TRadioButton RadioButton25;
extern TRadioButton RadioButton26;
extern TRadioButton RadioButton27;
extern TRadioButton RadioButton28;
extern TRadioButton RadioButton29;
extern TRadioButton RadioButton30;
extern TRadioButton RadioButton31;
extern TRadioButton RadioButton32;
extern TRadioButton RadioButton33;
extern TRadioButton RadioButton34;
extern TRadioButton RadioButton35;
extern TRadioButton RadioButton36;
extern TLabel Label20;
extern TButton_Round ButtonRound7;
extern TLabel Label21;
extern TButton_Round ButtonRound8;
extern TImage Image5;
extern TButton_Round * const code Screen4_Buttons_Round[2];
extern TLabel * const code Screen4_Labels[2];
extern TImage * const code Screen4_Images[1];
extern TRadioButton * const code Screen4_RadioButtons[12];

extern TScreen Screen5;
extern TRadioButton RadioButton37;
extern TRadioButton RadioButton38;
extern TRadioButton RadioButton39;
extern TRadioButton RadioButton40;
extern TRadioButton RadioButton41;
extern TRadioButton RadioButton42;
extern TRadioButton RadioButton43;
extern TRadioButton RadioButton44;
extern TRadioButton RadioButton45;
extern TRadioButton RadioButton46;
extern TRadioButton RadioButton47;
extern TRadioButton RadioButton48;
extern TLabel Label22;
extern TButton_Round ButtonRound9;
extern TLabel Label23;
extern TButton_Round ButtonRound10;
extern TImage Image6;
extern TButton_Round * const code Screen5_Buttons_Round[2];
extern TLabel * const code Screen5_Labels[2];
extern TImage * const code Screen5_Images[1];
extern TRadioButton * const code Screen5_RadioButtons[12];

extern TScreen Screen6;
extern TRadioButton RadioButton49;
extern TRadioButton RadioButton50;
extern TRadioButton RadioButton51;
extern TRadioButton RadioButton52;
extern TRadioButton RadioButton53;
extern TRadioButton RadioButton54;
extern TRadioButton RadioButton55;
extern TRadioButton RadioButton56;
extern TRadioButton RadioButton57;
extern TRadioButton RadioButton58;
extern TRadioButton RadioButton59;
extern TRadioButton RadioButton60;
extern TLabel Label24;
extern TButton_Round ButtonRound11;
extern TLabel Label25;
extern TButton_Round ButtonRound12;
extern TImage Image7;
extern TButton_Round * const code Screen6_Buttons_Round[2];
extern TLabel * const code Screen6_Labels[2];
extern TImage * const code Screen6_Images[1];
extern TRadioButton * const code Screen6_RadioButtons[12];

extern TScreen Screen7;
extern TRadioButton RadioButton61;
extern TRadioButton RadioButton62;
extern TRadioButton RadioButton63;
extern TRadioButton RadioButton64;
extern TRadioButton RadioButton65;
extern TRadioButton RadioButton66;
extern TRadioButton RadioButton67;
extern TRadioButton RadioButton68;
extern TRadioButton RadioButton69;
extern TRadioButton RadioButton70;
extern TRadioButton RadioButton71;
extern TRadioButton RadioButton72;
extern TLabel Label26;
extern TButton_Round ButtonRound13;
extern TLabel Label27;
extern TButton_Round ButtonRound14;
extern TImage Image8;
extern TButton_Round * const code Screen7_Buttons_Round[2];
extern TLabel * const code Screen7_Labels[2];
extern TImage * const code Screen7_Images[1];
extern TRadioButton * const code Screen7_RadioButtons[12];

extern TScreen Screen8;
extern TLabel Label28;
extern TBox Box1;
extern TButton_Round ButtonRound15;
extern TButton_Round ButtonRound16;
extern TButton_Round ButtonRound17;
extern TButton_Round ButtonRound18;
extern TButton_Round ButtonRound19;
extern TButton_Round ButtonRound20;
extern TButton_Round * const code Screen8_Buttons_Round[6];
extern TLabel * const code Screen8_Labels[1];
extern TBox * const code Screen8_Boxes[1];




void ButtonRound10OnClick();
void ButtonRound11OnClick();
void ButtonRound12OnClick();
void ButtonRound13OnClick();
void ButtonRound14OnClick();
void ButtonRound15OnClick();
void ButtonRound16OnClick();
void ButtonRound17OnClick();
void ButtonRound18OnClick();
void ButtonRound19OnClick();
void ButtonRound1OnClick();
void ButtonRound20OnClick();
void ButtonRound2OnClick();
void ButtonRound36OnClick();
void ButtonRound37OnClick();
void ButtonRound3OnClick();
void ButtonRound4OnClick();
void ButtonRound5OnClick();
void ButtonRound6OnClick();
void ButtonRound7OnClick();
void ButtonRound8OnClick();
void ButtonRound9OnClick();
void RadioButton10OnPress();
void RadioButton11OnPress();
void RadioButton12OnPress();
void RadioButton13OnPress();
void RadioButton14OnPress();
void RadioButton15OnPress();
void RadioButton16OnPress();
void RadioButton17OnPress();
void RadioButton18OnPress();
void RadioButton19OnPress();
void RadioButton1OnPress();
void RadioButton20OnPress();
void RadioButton21OnPress();
void RadioButton22OnPress();
void RadioButton23OnPress();
void RadioButton24OnPress();
void RadioButton25OnPress();
void RadioButton26OnPress();
void RadioButton27OnPress();
void RadioButton28OnPress();
void RadioButton29OnPress();
void RadioButton2OnPress();
void RadioButton30OnPress();
void RadioButton31OnPress();
void RadioButton32OnPress();
void RadioButton33OnPress();
void RadioButton34OnPress();
void RadioButton35OnPress();
void RadioButton36OnPress();
void RadioButton37OnPress();
void RadioButton38OnPress();
void RadioButton39OnPress();
void RadioButton3OnPress();
void RadioButton40OnPress();
void RadioButton41OnPress();
void RadioButton42OnPress();
void RadioButton43OnPress();
void RadioButton44OnPress();
void RadioButton45OnPress();
void RadioButton46OnPress();
void RadioButton47OnPress();
void RadioButton48OnPress();
void RadioButton49OnPress();
void RadioButton4OnPress();
void RadioButton50OnPress();
void RadioButton51OnPress();
void RadioButton52OnPress();
void RadioButton53OnPress();
void RadioButton54OnPress();
void RadioButton55OnPress();
void RadioButton56OnPress();
void RadioButton57OnPress();
void RadioButton58OnPress();
void RadioButton59OnPress();
void RadioButton5OnPress();
void RadioButton60OnPress();
void RadioButton61OnPress();
void RadioButton62OnPress();
void RadioButton63OnPress();
void RadioButton64OnPress();
void RadioButton65OnPress();
void RadioButton66OnPress();
void RadioButton67OnPress();
void RadioButton68OnPress();
void RadioButton69OnPress();
void RadioButton6OnPress();
void RadioButton70OnPress();
void RadioButton71OnPress();
void RadioButton72OnPress();
void RadioButton7OnPress();
void RadioButton8OnPress();
void RadioButton9OnPress();




extern char Box3_Caption[];
extern char Label1_Caption[];
extern char ButtonRound1_Caption[];
extern char ButtonRound2_Caption[];
extern char Label2_Caption[];
extern char Label3_Caption[];
extern char Label4_Caption[];
extern char Label5_Caption[];
extern char Label6_Caption[];
extern char Label7_Caption[];
extern char Label8_Caption[];
extern char Label9_Caption[];
extern char Label10_Caption[];
extern char Label11_Caption[];
extern char Image1_Caption[];
extern char Label12_Caption[];
extern char Label13_Caption[];
extern char Image2_Caption[];
extern char Label14_Caption[];
extern char BoxRound1_Caption[];
extern char Label19_Caption[];
extern char ButtonRound36_Caption[];
extern char ButtonRound37_Caption[];
extern char RadioButton3_Caption[];
extern char RadioButton4_Caption[];
extern char RadioButton5_Caption[];
extern char RadioButton6_Caption[];
extern char RadioButton7_Caption[];
extern char RadioButton8_Caption[];
extern char RadioButton9_Caption[];
extern char RadioButton10_Caption[];
extern char RadioButton11_Caption[];
extern char RadioButton12_Caption[];
extern char RadioButton13_Caption[];
extern char RadioButton14_Caption[];
extern char Label15_Caption[];
extern char ButtonRound3_Caption[];
extern char Label16_Caption[];
extern char ButtonRound4_Caption[];
extern char Image3_Caption[];
extern char RadioButton1_Caption[];
extern char RadioButton2_Caption[];
extern char RadioButton15_Caption[];
extern char RadioButton16_Caption[];
extern char RadioButton17_Caption[];
extern char RadioButton18_Caption[];
extern char RadioButton19_Caption[];
extern char RadioButton20_Caption[];
extern char RadioButton21_Caption[];
extern char RadioButton22_Caption[];
extern char RadioButton23_Caption[];
extern char RadioButton24_Caption[];
extern char Label17_Caption[];
extern char ButtonRound5_Caption[];
extern char Label18_Caption[];
extern char ButtonRound6_Caption[];
extern char Image4_Caption[];
extern char RadioButton25_Caption[];
extern char RadioButton26_Caption[];
extern char RadioButton27_Caption[];
extern char RadioButton28_Caption[];
extern char RadioButton29_Caption[];
extern char RadioButton30_Caption[];
extern char RadioButton31_Caption[];
extern char RadioButton32_Caption[];
extern char RadioButton33_Caption[];
extern char RadioButton34_Caption[];
extern char RadioButton35_Caption[];
extern char RadioButton36_Caption[];
extern char Label20_Caption[];
extern char ButtonRound7_Caption[];
extern char Label21_Caption[];
extern char ButtonRound8_Caption[];
extern char Image5_Caption[];
extern char RadioButton37_Caption[];
extern char RadioButton38_Caption[];
extern char RadioButton39_Caption[];
extern char RadioButton40_Caption[];
extern char RadioButton41_Caption[];
extern char RadioButton42_Caption[];
extern char RadioButton43_Caption[];
extern char RadioButton44_Caption[];
extern char RadioButton45_Caption[];
extern char RadioButton46_Caption[];
extern char RadioButton47_Caption[];
extern char RadioButton48_Caption[];
extern char Label22_Caption[];
extern char ButtonRound9_Caption[];
extern char Label23_Caption[];
extern char ButtonRound10_Caption[];
extern char Image6_Caption[];
extern char RadioButton49_Caption[];
extern char RadioButton50_Caption[];
extern char RadioButton51_Caption[];
extern char RadioButton52_Caption[];
extern char RadioButton53_Caption[];
extern char RadioButton54_Caption[];
extern char RadioButton55_Caption[];
extern char RadioButton56_Caption[];
extern char RadioButton57_Caption[];
extern char RadioButton58_Caption[];
extern char RadioButton59_Caption[];
extern char RadioButton60_Caption[];
extern char Label24_Caption[];
extern char ButtonRound11_Caption[];
extern char Label25_Caption[];
extern char ButtonRound12_Caption[];
extern char Image7_Caption[];
extern char RadioButton61_Caption[];
extern char RadioButton62_Caption[];
extern char RadioButton63_Caption[];
extern char RadioButton64_Caption[];
extern char RadioButton65_Caption[];
extern char RadioButton66_Caption[];
extern char RadioButton67_Caption[];
extern char RadioButton68_Caption[];
extern char RadioButton69_Caption[];
extern char RadioButton70_Caption[];
extern char RadioButton71_Caption[];
extern char RadioButton72_Caption[];
extern char Label26_Caption[];
extern char ButtonRound13_Caption[];
extern char Label27_Caption[];
extern char ButtonRound14_Caption[];
extern char Image8_Caption[];
extern char Label28_Caption[];
extern char Box1_Caption[];
extern char ButtonRound15_Caption[];
extern char ButtonRound16_Caption[];
extern char ButtonRound17_Caption[];
extern char ButtonRound18_Caption[];
extern char ButtonRound19_Caption[];
extern char ButtonRound20_Caption[];


void DrawScreen(TScreen *aScreen);
void DrawRoundButton(TButton_Round *Around_button);
void DrawLabel(TLabel *ALabel);
void DrawImage(TImage *AImage);
void DrawBox(TBox *ABox);
void DrawRoundBox(TBox_Round *Around_box);
void DrawRadioButton(TRadioButton *ARadioButton);
void Check_TP();
void Start_TP();
void Process_TP_Press(unsigned int X, unsigned int Y);
void Process_TP_Up(unsigned int X, unsigned int Y);
void Process_TP_Down(unsigned int X, unsigned int Y);
#line 1 "d:/its/akademik/ta/12-lead synthetic ecg normal and myocardial infarction/ecgsynthetic_resources.h"
const code char DejaVu_Serif16x19_Regular[];
const code char DejaVu_Serif22x24_Bold[];
const code char Tahoma15x18_Regular[];
const code char Tahoma18x18_Bold[];
const code char Tahoma19x19_Bold[];
const code char Tahoma19x23_Regular[];
const code char Tahoma23x23_Bold[];
const code char Tahoma25x25_Bold[];
const code char Tahoma32x33_Bold[];
const code char ITS1_jpg[3957];
const code char bme_jpg[2876];
const code char GridLine1_jpg[66862];
#line 1 "d:/its/akademik/ta/12-lead synthetic ecg normal and myocardial infarction/click_usb_uart_types.h"
#line 1 "c:/users/public/documents/mikroelektronika/mikroc pro for arm/include/stdint.h"





typedef signed char int8_t;
typedef signed int int16_t;
typedef signed long int int32_t;
typedef signed long long int64_t;


typedef unsigned char uint8_t;
typedef unsigned int uint16_t;
typedef unsigned long int uint32_t;
typedef unsigned long long uint64_t;


typedef signed char int_least8_t;
typedef signed int int_least16_t;
typedef signed long int int_least32_t;
typedef signed long long int_least64_t;


typedef unsigned char uint_least8_t;
typedef unsigned int uint_least16_t;
typedef unsigned long int uint_least32_t;
typedef unsigned long long uint_least64_t;



typedef signed long int int_fast8_t;
typedef signed long int int_fast16_t;
typedef signed long int int_fast32_t;
typedef signed long long int_fast64_t;


typedef unsigned long int uint_fast8_t;
typedef unsigned long int uint_fast16_t;
typedef unsigned long int uint_fast32_t;
typedef unsigned long long uint_fast64_t;


typedef signed long int intptr_t;
typedef unsigned long int uintptr_t;


typedef signed long long intmax_t;
typedef unsigned long long uintmax_t;
#line 1 "d:/its/akademik/ta/12-lead synthetic ecg normal and myocardial infarction/click_usb_uart_config.h"
#line 1 "d:/its/akademik/ta/12-lead synthetic ecg normal and myocardial infarction/click_usb_uart_types.h"
#line 3 "d:/its/akademik/ta/12-lead synthetic ecg normal and myocardial infarction/click_usb_uart_config.h"
const uint32_t _USB_UART_UART_CFG[ 4 ] =
{
 9600,
 _UART_8_BIT_DATA,
 _UART_NOPARITY,
 _UART_ONE_STOPBIT
};
#line 1 "d:/its/akademik/ta/12-lead synthetic ecg normal and myocardial infarction/click_dac_types.h"
#line 1 "c:/users/public/documents/mikroelektronika/mikroc pro for arm/include/stdint.h"
#line 1 "d:/its/akademik/ta/12-lead synthetic ecg normal and myocardial infarction/click_dac_config.h"
#line 1 "d:/its/akademik/ta/12-lead synthetic ecg normal and myocardial infarction/click_dac_types.h"
#line 4 "d:/its/akademik/ta/12-lead synthetic ecg normal and myocardial infarction/click_dac_config.h"
const uint32_t _DAC_SPI_CFG[ 2 ] =
{
 _SPI_FPCLK_DIV256,
 _SPI_FIRST_CLK_EDGE_TRANSITION |
 _SPI_CLK_IDLE_LOW |
 _SPI_MASTER |
 _SPI_MSB_FIRST |
 _SPI_8_BIT |
 _SPI_SSM_ENABLE |
 _SPI_SS_DISABLE |
 _SPI_SSI_1
};
#line 1 "d:/its/akademik/ta/12-lead synthetic ecg normal and myocardial infarction/variabel.h"


bit buttonFlag;

float hmean = 60.0;
int fsecg = 256;
float f, fm;
const float pi = 3.14159265358979323846;
float scale_sig[300], s[300], sm[300];
float im[300], real[300], idft_re[300], idft_im[300], idft_sig[300];
float ai[7], bi[7], ti[7];
float x[5500], y[5500], z[5500];
float k1[5][5];
int jumlah = 10;
float modFactor;
char text[1600];
int i=0;
int n=0;
int size;
float minValue;
float maxValue;
int scale;
float output[5500];
int dac_value[5500];
int dacc;
int ndata;
#line 1 "d:/its/akademik/ta/12-lead synthetic ecg normal and myocardial infarction/step1.h"
void step1()
{
 float f1 = 0.1;
 float f2 = 0.25;
 float c1 = 0.01;
 float c2 = 0.01;
 float tau1 = 0.06;
 float tau2 = 0.0848;
 int scale = 1;
 int jumlahData = 256;
 int n, k = 0;


 for (n = 0; n < 256; n++)
 {
 f = (float)n / 255.0;
 s[n] = (((tau1*tau1) / (sqrt(2 * pi * (c1*c1)))) * exp(-((f - f1)*(f - f1)) / (2 * (c1*c1)))) +
 (((tau2*tau2) / (sqrt(2 * pi * (c2*c2)))) * exp(-((f - f2)*(f - f2)) / (2 * (c2*c2))));
 }

 for (n = 0; n <= 128; n++)
 {
 f = (float)n / 255.0;
 sm[n] = sqrt(s[n]);
 }

 for (n = 128; n < 256; n++)
 {
 f = (float)n / 255.0;
 fm = 1.0 - f;
 sm[n] = sqrt((((tau1*tau1) / (sqrt(2 * pi * (c1*c1)))) * exp(-((fm - f1)*(fm - f1)) / (2 * (c1*c1)))) +
 (((tau2*tau2) / (sqrt(2 * pi * (c2*c2)))) * exp(-((fm - f2)*(fm - f2)) / (2 * (c2*c2)))));
 }

 for (n = 0; n < 256; n++)
 {
 real[n] = sm[n] * (cosE3(2 * pi * rand())*0.001);
 im[n] = sm[n] * (sinE3(2 * pi * rand())*0.001);
 }


 for (n = 0; n < 256; n++)
 {
 idft_re[n] = 0;
 idft_im[n] = 0;

 for (k = 0; k < 256; k++)
 {
 idft_re[n] = idft_re[n] + ((cos((float)(2.0 * pi * n * k /256.0)))*(real[k])) + ((sin((float)(2.0 * pi * n * k /256.0)))*(im[k]));
 idft_im[n] = idft_im[n] + ((cos(2.0 * pi * n * k /256.0))*(real[k]) + (sin(2.0 * pi * n * k /256.0))*(im[k]));
 idft_sig[n] = (idft_re[n] + idft_im[n]) / (float)(256.0);
 }
 }

 for (n = 0; n < 256; n++)
 {
 scale_sig[n] = scale * idft_sig[n] + (float)(60.0 / (float)hmean);
 }


}
#line 1 "d:/its/akademik/ta/12-lead synthetic ecg normal and myocardial infarction/parameter_normal.h"
void normal1()
{
 int i;
 modFactor = sqrt((float)hmean / 60.0);

 ti[1] = -60 * sqrt(modFactor);
 ai[1] = 0.8 * 18;
 bi[1] = 0.2 * modFactor;
 ti[2] = -15 * modFactor;
 ai[2] = -5 * 18;
 bi[2] = 0.1 * modFactor;
 ti[3] = 0;
 ai[3] = 30 * 18;
 bi[3] = 0.1 * modFactor;
 ti[4] = 15 * modFactor;
 ai[4] = -7.5 * 18;
 bi[4] = 0.1 * modFactor;
 ti[5] = 97 * sqrt(modFactor);
 ai[5] = 0.5 * ((modFactor * modFactor)*sqrt(modFactor)) * 18;
 bi[5] = 0.4 / modFactor;
 ti[6] = 100 * sqrt(modFactor);
 ai[6] = 0.75 *((modFactor * modFactor)*sqrt(modFactor)) * 18;
 bi[6] = 0.2 * modFactor;


 for (i = 1; i <= 6; i++)
 {
 ti[i] = ti[i] * (pi / 180.0);
 }
}

void normal2()
{
 int i;
 modFactor = sqrt((float)hmean / 60.0);

 ti[1] = -60 * sqrt(modFactor);
 ai[1] = 1.2 * 18;
 bi[1] = 0.2 * modFactor;
 ti[2] = -15 * modFactor;
 ai[2] = -6 * 18;
 bi[2] = 0.1 * modFactor;
 ti[3] = 0;
 ai[3] = 52.5 * 18;
 bi[3] = 0.1 * modFactor;
 ti[4] = 15 * modFactor;
 ai[4] = 0.5 * 18;
 bi[4] = 0.1 * modFactor;
 ti[5] = 97 * sqrt(modFactor);
 ai[5] = 0.67 * ((modFactor * modFactor)*sqrt(modFactor)) * 18;
 bi[5] = 0.4 / modFactor;
 ti[6] = 100 * sqrt(modFactor);
 ai[6] = 1 *((modFactor * modFactor)*sqrt(modFactor)) * 18;
 bi[6] = 0.2 * modFactor;


 for (i = 1; i <= 6; i++)
 {
 ti[i] = ti[i] * (pi / 180.0);
 }
}

void normal3()
{
 int i;
 modFactor = sqrt((float)hmean / 60.0);

 ti[1] = -60 * sqrt(modFactor);
 ai[1] = 0.8 * 18;
 bi[1] = 0.2 * modFactor;
 ti[2] = -15 * modFactor;
 ai[2] = -6 * 18;
 bi[2] = 0.1 * modFactor;
 ti[3] = 0;
 ai[3] = 33.75 * 18;
 bi[3] = 0.1 * modFactor;
 ti[4] = 15 * modFactor;
 ai[4] = 0.5 * 18;
 bi[4] = 0.1 * modFactor;
 ti[5] = 97 * sqrt(modFactor);
 ai[5] = 0.3 * ((modFactor * modFactor)*sqrt(modFactor)) * 18;
 bi[5] = 0.4 / modFactor;
 ti[6] = 100 * sqrt(modFactor);
 ai[6] = 0.5 *((modFactor * modFactor)*sqrt(modFactor)) * 18;
 bi[6] = 0.2 * modFactor;


 for (i = 1; i <= 6; i++)
 {
 ti[i] = ti[i] * (pi / 180.0);
 }
}

void normalaVR()
{
 int i;
 modFactor = sqrt((float)hmean / 60.0);

 ti[1] = -60 * sqrt(modFactor);
 ai[1] = -0.8 * 18;
 bi[1] = 0.2 * modFactor;
 ti[2] = -15 * modFactor;
 ai[2] = 5 * 18;
 bi[2] = 0.1 * modFactor;
 ti[3] = 0;
 ai[3] = -30 * 18;
 bi[3] = 0.1 * modFactor;
 ti[4] = 15 * modFactor;
 ai[4] = -0.5 * 18;
 bi[4] = 0.1 * modFactor;
 ti[5] = 97 * sqrt(modFactor);
 ai[5] = -0.5 * ((modFactor * modFactor)*sqrt(modFactor)) * 18;
 bi[5] = 0.4 / modFactor;
 ti[6] = 100 * sqrt(modFactor);
 ai[6] = -0.75 *((modFactor * modFactor)*sqrt(modFactor)) * 18;
 bi[6] = 0.2 * modFactor;


 for (i = 1; i <= 6; i++)
 {
 ti[i] = ti[i] * (pi / 180.0);
 }
}

void normalaVL()
{
 int i;
 modFactor = sqrt((float)hmean / 60.0);

 ti[1] = -60 * sqrt(modFactor);
 ai[1] = -0.2 * 18;
 bi[1] = 0.2 * modFactor;
 ti[2] = -15 * modFactor;
 ai[2] = 7 * 18;
 bi[2] = 0.1 * modFactor;
 ti[3] = 0;
 ai[3] = -15 * 18;
 bi[3] = 0.1 * modFactor;
 ti[4] = 15 * modFactor;
 ai[4] = -0.5 * 18;
 bi[4] = 0.1 * modFactor;
 ti[5] = 97 * sqrt(modFactor);
 ai[5] = 0.17 * ((modFactor * modFactor)*sqrt(modFactor)) * 18;
 bi[5] = 0.4 / modFactor;
 ti[6] = 100 * sqrt(modFactor);
 ai[6] = 0.25 *((modFactor * modFactor)*sqrt(modFactor)) * 18;
 bi[6] = 0.2 * modFactor;


 for (i = 1; i <= 6; i++)
 {
 ti[i] = ti[i] * (pi / 180.0);
 }
}

void normalaVF()
{
 int i;
 modFactor = sqrt((float)hmean / 60.0);

 ti[1] = -60 * sqrt(modFactor);
 ai[1] = 1 * 18;
 bi[1] = 0.2 * modFactor;
 ti[2] = -15 * modFactor;
 ai[2] = -6 * 18;
 bi[2] = 0.1 * modFactor;
 ti[3] = 0;
 ai[3] = 40 * 18;
 bi[3] = 0.1 * modFactor;
 ti[4] = 15 * modFactor;
 ai[4] = 0.5 * 18;
 bi[4] = 0.1 * modFactor;
 ti[5] = 97 * sqrt(modFactor);
 ai[5] = 0.4 * ((modFactor * modFactor)*sqrt(modFactor)) * 18;
 bi[5] = 0.4 / modFactor;
 ti[6] = 100 * sqrt(modFactor);
 ai[6] = 0.6 *((modFactor * modFactor)*sqrt(modFactor)) * 18;
 bi[6] = 0.2 * modFactor;


 for (i = 1; i <= 6; i++)
 {
 ti[i] = ti[i] * (pi / 180.0);
 }
}

void normalV1()
{
 int i;
 modFactor = sqrt((float)hmean / 60.0);

 ti[1] = -60 * sqrt(modFactor);
 ai[1] = 0.8 * 18;
 bi[1] = 0.2 * modFactor;
 ti[2] = -15 * modFactor;
 ai[2] = 4 * 18;
 bi[2] = 0.1 * modFactor;
 ti[3] = 0;
 ai[3] = -37.5 * 18;
 bi[3] = 0.1 * modFactor;
 ti[4] = 15 * modFactor;
 ai[4] = -1 * 18;
 bi[4] = 0.1 * modFactor;
 ti[5] = 97 * sqrt(modFactor);
 ai[5] = 0.17 * ((modFactor * modFactor)*sqrt(modFactor)) * 18;
 bi[5] = 0.4 / modFactor;
 ti[6] = 100 * sqrt(modFactor);
 ai[6] = 0.25 *((modFactor * modFactor)*sqrt(modFactor)) * 18;
 bi[6] = 0.2 * modFactor;


 for (i = 1; i <= 6; i++)
 {
 ti[i] = ti[i] * (pi / 180.0);
 }
}

void normalV2()
{
 int i;
 modFactor = sqrt((float)hmean / 60.0);

 ti[1] = -60 * sqrt(modFactor);
 ai[1] = 0.8 * 18;
 bi[1] = 0.2 * modFactor;
 ti[2] = -15 * modFactor;
 ai[2] = 10 * 18;
 bi[2] = 0.1 * modFactor;
 ti[3] = 0;
 ai[3] = -67.5 * 18;
 bi[3] = 0.1 * modFactor;
 ti[4] = 15 * modFactor;
 ai[4] = -1 * 18;
 bi[4] = 0.1 * modFactor;
 ti[5] = 97 * sqrt(modFactor);
 ai[5] = 0.9 * ((modFactor * modFactor)*sqrt(modFactor)) * 18;
 bi[5] = 0.4 / modFactor;
 ti[6] = 100 * sqrt(modFactor);
 ai[6] = 1.5 *((modFactor * modFactor)*sqrt(modFactor)) * 18;
 bi[6] = 0.2 * modFactor;


 for (i = 1; i <= 6; i++)
 {
 ti[i] = ti[i] * (pi / 180.0);
 }
}

void normalV3()
{
 int i;
 modFactor = sqrt((float)hmean / 60.0);

 ti[1] = -60 * sqrt(modFactor);
 ai[1] = 0.8 * 18;
 bi[1] = 0.2 * modFactor;
 ti[2] = -15 * modFactor;
 ai[2] = 18 * 18;
 bi[2] = 0.1 * modFactor;
 ti[3] = 0;
 ai[3] = -33.75 * 18;
 bi[3] = 0.1 * modFactor;
 ti[4] = 15 * modFactor;
 ai[4] = -1 * 18;
 bi[4] = 0.1 * modFactor;
 ti[5] = 97 * sqrt(modFactor);
 ai[5] = 1 * ((modFactor * modFactor)*sqrt(modFactor)) * 18;
 bi[5] = 0.4 / modFactor;
 ti[6] = 100 * sqrt(modFactor);
 ai[6] = 2 *((modFactor * modFactor)*sqrt(modFactor)) * 18;
 bi[6] = 0.2 * modFactor;


 for (i = 1; i <= 6; i++)
 {
 ti[i] = ti[i] * (pi / 180.0);
 }
}

void normalV4()
{
 int i;
 modFactor = sqrt((float)hmean / 60.0);

 ti[1] = -60 * sqrt(modFactor);
 ai[1] = 0.8 * 18;
 bi[1] = 0.2 * modFactor;
 ti[2] = -15 * modFactor;
 ai[2] = 0.5 * 18;
 bi[2] = 0.1 * modFactor;
 ti[3] = 0;
 ai[3] = 45 * 18;
 bi[3] = 0.1 * modFactor;
 ti[4] = 15 * modFactor;
 ai[4] = -15 * 18;
 bi[4] = 0.1 * modFactor;
 ti[5] = 97 * sqrt(modFactor);
 ai[5] = 1 * ((modFactor * modFactor)*sqrt(modFactor)) * 18;
 bi[5] = 0.4 / modFactor;
 ti[6] = 100 * sqrt(modFactor);
 ai[6] = 2 *((modFactor * modFactor)*sqrt(modFactor)) * 18;
 bi[6] = 0.2 * modFactor;


 for (i = 1; i <= 6; i++)
 {
 ti[i] = ti[i] * (pi / 180.0);
 }
}

void normalV5()
{
 int i;
 modFactor = sqrt((float)hmean / 60.0);

 ti[1] = -60 * sqrt(modFactor);
 ai[1] = 0.8 * 18;
 bi[1] = 0.2 * modFactor;
 ti[2] = -15 * modFactor;
 ai[2] = -5 * 18;
 bi[2] = 0.1 * modFactor;
 ti[3] = 0;
 ai[3] = 48.75 * 18;
 bi[3] = 0.1 * modFactor;
 ti[4] = 15 * modFactor;
 ai[4] = -5 * 18;
 bi[4] = 0.1 * modFactor;
 ti[5] = 97 * sqrt(modFactor);
 ai[5] = 1 * ((modFactor * modFactor)*sqrt(modFactor)) * 18;
 bi[5] = 0.4 / modFactor;
 ti[6] = 100 * sqrt(modFactor);
 ai[6] = 1.5 *((modFactor * modFactor)*sqrt(modFactor)) * 18;
 bi[6] = 0.2 * modFactor;


 for (i = 1; i <= 6; i++)
 {
 ti[i] = ti[i] * (pi / 180.0);
 }
}

void normalV6()
{
 int i;
 modFactor = sqrt((float)hmean / 60.0);

 ti[1] = -60 * sqrt(modFactor);
 ai[1] = 0.8 * 18;
 bi[1] = 0.2 * modFactor;
 ti[2] = -15 * modFactor;
 ai[2] = -5 * 18;
 bi[2] = 0.1 * modFactor;
 ti[3] = 0;
 ai[3] = 45 * 18;
 bi[3] = 0.1 * modFactor;
 ti[4] = 15 * modFactor;
 ai[4] = 0.5 * 18;
 bi[4] = 0.1 * modFactor;
 ti[5] = 97 * sqrt(modFactor);
 ai[5] = 0.8 * ((modFactor * modFactor)*sqrt(modFactor)) * 18;
 bi[5] = 0.4 / modFactor;
 ti[6] = 100 * sqrt(modFactor);
 ai[6] = 0.9 *((modFactor * modFactor)*sqrt(modFactor)) * 18;
 bi[6] = 0.2 * modFactor;


 for (i = 1; i <= 6; i++)
 {
 ti[i] = ti[i] * (pi / 180.0);
 }
}
#line 1 "d:/its/akademik/ta/12-lead synthetic ecg normal and myocardial infarction/parameter_anterior.h"
void anterior1()
{
 int i;
 modFactor = sqrt((float)hmean / 60.0);

 ti[1] = -60 * sqrt(modFactor);
 ai[1] = 0.8 * 18;
 bi[1] = 0.2 * modFactor;
 ti[2] = -15 * modFactor;
 ai[2] = -5 * 18;
 bi[2] = 0.1 * modFactor;
 ti[3] = 0;
 ai[3] = 30 * 18;
 bi[3] = 0.1 * modFactor;
 ti[4] = 15 * modFactor;
 ai[4] = -7.5 * 18;
 bi[4] = 0.1 * modFactor;
 ti[5] = 97 * sqrt(modFactor);
 ai[5] = 0.5 * ((modFactor * modFactor)*sqrt(modFactor)) * 18;
 bi[5] = 0.4 / modFactor;
 ti[6] = 100 * sqrt(modFactor);
 ai[6] = 0.75 *((modFactor * modFactor)*sqrt(modFactor)) * 18;
 bi[6] = 0.2 * modFactor;


 for (i = 1; i <= 6; i++)
 {
 ti[i] = ti[i] * (pi / 180.0);
 }
}

void anterior2()
{
 int i;
 modFactor = sqrt((float)hmean / 60.0);

 ti[1] = -60 * sqrt(modFactor);
 ai[1] = 0.8 * 18;
 bi[1] = 0.2 * modFactor;
 ti[2] = -15 * modFactor;
 ai[2] = 0.5 * 18;
 bi[2] = 0.1 * modFactor;
 ti[3] = 0;
 ai[3] = 30 * 18;
 bi[3] = 0.1 * modFactor;
 ti[4] = 15 * modFactor;
 ai[4] = 0.5 * 18;
 bi[4] = 0.1 * modFactor;
 ti[5] = 97 * sqrt(modFactor);
 ai[5] = 0.2 * ((modFactor * modFactor)*sqrt(modFactor)) * 18;
 bi[5] = 0.4 / modFactor;
 ti[6] = 100 * sqrt(modFactor);
 ai[6] = 0.3 *((modFactor * modFactor)*sqrt(modFactor)) * 18;
 bi[6] = 0.2 * modFactor;


 for (i = 1; i <= 6; i++)
 {
 ti[i] = ti[i] * (pi / 180.0);
 }
}

void anterior3()
{
 int i;
 modFactor = sqrt((float)hmean / 60.0);

 ti[1] = -60 * sqrt(modFactor);
 ai[1] = 0.8 * 18;
 bi[1] = 0.2 * modFactor;
 ti[2] = -15 * modFactor;
 ai[2] = 9 * 18;
 bi[2] = 0.1 * modFactor;
 ti[3] = 0;
 ai[3] = -18.75 * 18;
 bi[3] = 0.1 * modFactor;
 ti[4] = 15 * modFactor;
 ai[4] = -0.5 * 18;
 bi[4] = 0.1 * modFactor;
 ti[5] = 97 * sqrt(modFactor);
 ai[5] = 0.15 * ((modFactor * modFactor)*sqrt(modFactor)) * 18;
 bi[5] = 0.4 / modFactor;
 ti[6] = 100 * sqrt(modFactor);
 ai[6] = 0.25 *((modFactor * modFactor)*sqrt(modFactor)) * 18;
 bi[6] = 0.2 * modFactor;


 for (i = 1; i <= 6; i++)
 {
 ti[i] = ti[i] * (pi / 180.0);
 }
}

void anterioraVR()
{
 int i;
 modFactor = sqrt((float)hmean / 60.0);

 ti[1] = -60 * sqrt(modFactor);
 ai[1] = -0.8 * 18;
 bi[1] = 0.2 * modFactor;
 ti[2] = -15 * modFactor;
 ai[2] = 5 * 18;
 bi[2] = 0.1 * modFactor;
 ti[3] = 0;
 ai[3] = -30 * 18;
 bi[3] = 0.1 * modFactor;
 ti[4] = 15 * modFactor;
 ai[4] = -0.5 * 18;
 bi[4] = 0.1 * modFactor;
 ti[5] = 97 * sqrt(modFactor);
 ai[5] = -0.5 * ((modFactor * modFactor)*sqrt(modFactor)) * 18;
 bi[5] = 0.4 / modFactor;
 ti[6] = 100 * sqrt(modFactor);
 ai[6] = -0.75 *((modFactor * modFactor)*sqrt(modFactor)) * 18;
 bi[6] = 0.2 * modFactor;


 for (i = 1; i <= 6; i++)
 {
 ti[i] = ti[i] * (pi / 180.0);
 }
}

void anterioraVL()
{
 int i;
 modFactor = sqrt((float)hmean / 60.0);

 ti[1] = -60 * sqrt(modFactor);
 ai[1] = 0.8 * 18;
 bi[1] = 0.2 * modFactor;
 ti[2] = -15 * modFactor;
 ai[2] = 0.5 * 18;
 bi[2] = 0.1 * modFactor;
 ti[3] = 0;
 ai[3] = 33.75 * 18;
 bi[3] = 0.1 * modFactor;
 ti[4] = 15 * modFactor;
 ai[4] = 0.5 * 18;
 bi[4] = 0.1 * modFactor;
 ti[5] = 97 * sqrt(modFactor);
 ai[5] = 0.2 * ((modFactor * modFactor)*sqrt(modFactor)) * 18;
 bi[5] = 0.4 / modFactor;
 ti[6] = 100 * sqrt(modFactor);
 ai[6] = 0.3 *((modFactor * modFactor)*sqrt(modFactor)) * 18;
 bi[6] = 0.2 * modFactor;


 for (i = 1; i <= 6; i++)
 {
 ti[i] = ti[i] * (pi / 180.0);
 }
}

void anterioraVF()
{
 int i;
 modFactor = sqrt((float)hmean / 60.0);

 ti[1] = -60 * sqrt(modFactor);
 ai[1] = 0.8 * 18;
 bi[1] = 0.2 * modFactor;
 ti[2] = -15 * modFactor;
 ai[2] = -4 * 18;
 bi[2] = 0.1 * modFactor;
 ti[3] = 0;
 ai[3] = 18.75 * 18;
 bi[3] = 0.1 * modFactor;
 ti[4] = 15 * modFactor;
 ai[4] = 0.5 * 18;
 bi[4] = 0.1 * modFactor;
 ti[5] = 97 * sqrt(modFactor);
 ai[5] = 0.2 * ((modFactor * modFactor)*sqrt(modFactor)) * 18;
 bi[5] = 0.4 / modFactor;
 ti[6] = 100 * sqrt(modFactor);
 ai[6] = 0.25 *((modFactor * modFactor)*sqrt(modFactor)) * 18;
 bi[6] = 0.2 * modFactor;


 for (i = 1; i <= 6; i++)
 {
 ti[i] = ti[i] * (pi / 180.0);
 }
}

void anteriorV1()
{
 int i;
 modFactor = sqrt((float)hmean / 60.0);

 ti[1] = -60 * sqrt(modFactor);
 ai[1] = -0.8 * 18;
 bi[1] = 0.2 * modFactor;
 ti[2] = -15 * modFactor;
 ai[2] = 0.5 * 18;
 bi[2] = 0.1 * modFactor;
 ti[3] = 0;
 ai[3] = -41.25 * 18;
 bi[3] = 0.1 * modFactor;
 ti[4] = 15 * modFactor;
 ai[4] = -1 * 18;
 bi[4] = 0.1 * modFactor;
 ti[5] = 97 * sqrt(modFactor);
 ai[5] = 0.75 * ((modFactor * modFactor)*sqrt(modFactor)) * 18;
 bi[5] = 0.4 / modFactor;
 ti[6] = 100 * sqrt(modFactor);
 ai[6] = 0.55 *((modFactor * modFactor)*sqrt(modFactor)) * 18;
 bi[6] = 0.2 * modFactor;


 for (i = 1; i <= 6; i++)
 {
 ti[i] = ti[i] * (pi / 180.0);
 }
}

void anteriorV2()
{
 int i;
 modFactor = sqrt((float)hmean / 60.0);

 ti[1] = -60 * sqrt(modFactor);
 ai[1] = 0.8 * 18;
 bi[1] = 0.2 * modFactor;
 ti[2] = -15 * modFactor;
 ai[2] = 7 * 18;
 bi[2] = 0.1 * modFactor;
 ti[3] = 0;
 ai[3] = -67.5 * 18;
 bi[3] = 0.1 * modFactor;
 ti[4] = 15 * modFactor;
 ai[4] = -1 * 18;
 bi[4] = 0.1 * modFactor;
 ti[5] = 97 * sqrt(modFactor);
 ai[5] = 0.85 * ((modFactor * modFactor)*sqrt(modFactor)) * 18;
 bi[5] = 0.4 / modFactor;
 ti[6] = 100 * sqrt(modFactor);
 ai[6] = 1.25 *((modFactor * modFactor)*sqrt(modFactor)) * 18;
 bi[6] = 0.2 * modFactor;


 for (i = 1; i <= 6; i++)
 {
 ti[i] = ti[i] * (pi / 180.0);
 }
}

void anteriorV3()
{
 int i;
 modFactor = sqrt((float)hmean / 60.0);

 ti[1] = -60 * sqrt(modFactor);
 ai[1] = 0.8 * 18;
 bi[1] = 0.2 * modFactor;
 ti[2] = -15 * modFactor;
 ai[2] = 15 * 18;
 bi[2] = 0.1 * modFactor;
 ti[3] = 0;
 ai[3] = -37.5 * 18;
 bi[3] = 0.1 * modFactor;
 ti[4] = 25 * modFactor;
 ai[4] = 2.5 * 18;
 bi[4] = 0.2 * modFactor;
 ti[5] = 67 * sqrt(modFactor);
 ai[5] = 2.5 * ((modFactor * modFactor)*sqrt(modFactor)) * 18;
 bi[5] = 0.4 / modFactor;
 ti[6] = 70 * sqrt(modFactor);
 ai[6] = 2.7 *((modFactor * modFactor)*sqrt(modFactor)) * 18;
 bi[6] = 0.2 * modFactor;


 for (i = 1; i <= 6; i++)
 {
 ti[i] = ti[i] * (pi / 180.0);
 }
}

void anteriorV4()
{
 int i;
 modFactor = sqrt((float)hmean / 60.0);

 ti[1] = -60 * sqrt(modFactor);
 ai[1] = 0.8 * 18;
 bi[1] = 0.2 * modFactor;
 ti[2] = -15 * modFactor;
 ai[2] = 0.5 * 18;
 bi[2] = 0.1 * modFactor;
 ti[3] = 0;
 ai[3] = 45 * 18;
 bi[3] = 0.1 * modFactor;
 ti[4] = 15 * modFactor;
 ai[4] = -18.75 * 18;
 bi[4] = 0.13 * modFactor;
 ti[5] = 67 * sqrt(modFactor);
 ai[5] = 1.7 * ((modFactor * modFactor)*sqrt(modFactor)) * 18;
 bi[5] = 0.45 / modFactor;
 ti[6] = 70 * sqrt(modFactor);
 ai[6] = 2.5 *((modFactor * modFactor)*sqrt(modFactor)) * 18;
 bi[6] = 0.25 * modFactor;


 for (i = 1; i <= 6; i++)
 {
 ti[i] = ti[i] * (pi / 180.0);
 }
}

void anteriorV5()
{
 int i;
 modFactor = sqrt((float)hmean / 60.0);

 ti[1] = -60 * sqrt(modFactor);
 ai[1] = 0.8 * 18;
 bi[1] = 0.2 * modFactor;
 ti[2] = -15 * modFactor;
 ai[2] = -5 * 18;
 bi[2] = 0.1 * modFactor;
 ti[3] = 0;
 ai[3] = 48.75 * 18;
 bi[3] = 0.1 * modFactor;
 ti[4] = 15 * modFactor;
 ai[4] = -5 * 18;
 bi[4] = 0.1 * modFactor;
 ti[5] = 97 * sqrt(modFactor);
 ai[5] = 1 * ((modFactor * modFactor)*sqrt(modFactor)) * 18;
 bi[5] = 0.4 / modFactor;
 ti[6] = 100 * sqrt(modFactor);
 ai[6] = 1.5 *((modFactor * modFactor)*sqrt(modFactor)) * 18;
 bi[6] = 0.2 * modFactor;


 for (i = 1; i <= 6; i++)
 {
 ti[i] = ti[i] * (pi / 180.0);
 }
}

void anteriorV6()
{
 int i;
 modFactor = sqrt((float)hmean / 60.0);

 ti[1] = -60 * sqrt(modFactor);
 ai[1] = 0.8 * 18;
 bi[1] = 0.2 * modFactor;
 ti[2] = -15 * modFactor;
 ai[2] = -5 * 18;
 bi[2] = 0.1 * modFactor;
 ti[3] = 0;
 ai[3] = 45 * 18;
 bi[3] = 0.1 * modFactor;
 ti[4] = 15 * modFactor;
 ai[4] = 0.5 * 18;
 bi[4] = 0.1 * modFactor;
 ti[5] = 97 * sqrt(modFactor);
 ai[5] = 0.8 * ((modFactor * modFactor)*sqrt(modFactor)) * 18;
 bi[5] = 0.4 / modFactor;
 ti[6] = 100 * sqrt(modFactor);
 ai[6] = 0.9 *((modFactor * modFactor)*sqrt(modFactor)) * 18;
 bi[6] = 0.2 * modFactor;


 for (i = 1; i <= 6; i++)
 {
 ti[i] = ti[i] * (pi / 180.0);
 }
}
#line 1 "d:/its/akademik/ta/12-lead synthetic ecg normal and myocardial infarction/parameter_inferior.h"
void inferior1()
{
 int i;
 modFactor = sqrt((float)hmean / 60.0);

 ti[1] = -60 * sqrt(modFactor);
 ai[1] = 0.8 * 18;
 bi[1] = 0.2 * modFactor;
 ti[2] = -15 * modFactor;
 ai[2] = 0.5 * 18;
 bi[2] = 0.1 * modFactor;
 ti[3] = 0;
 ai[3] = 37.5 * 18;
 bi[3] = 0.1 * modFactor;
 ti[4] = 15 * modFactor;
 ai[4] = -7 * 18;
 bi[4] = 0.1 * modFactor;
 ti[5] = 97 * sqrt(modFactor);
 ai[5] = 0.25 * ((modFactor * modFactor)*sqrt(modFactor)) * 18;
 bi[5] = 0.4 / modFactor;
 ti[6] = 100 * sqrt(modFactor);
 ai[6] = 0.35 *((modFactor * modFactor)*sqrt(modFactor)) * 18;
 bi[6] = 0.2 * modFactor;


 for (i = 1; i <= 6; i++)
 {
 ti[i] = ti[i] * (pi / 180.0);
 }
}

void inferior2()
{
 int i;
 modFactor = sqrt((float)hmean / 60.0);

 ti[1] = -60 * sqrt(modFactor);
 ai[1] = 1.2 * 18;
 bi[1] = 0.2 * modFactor;
 ti[2] = -15 * modFactor;
 ai[2] = -6 * 18;
 bi[2] = 0.1 * modFactor;
 ti[3] = 0;
 ai[3] = 52.5 * 18;
 bi[3] = 0.1 * modFactor;
 ti[4] = 15 * modFactor;
 ai[4] = 0.5 * 18;
 bi[4] = 0.2 * modFactor;
 ti[5] = 67 * sqrt(modFactor);
 ai[5] = 1.67 * ((modFactor * modFactor)*sqrt(modFactor)) * 18;
 bi[5] = 0.4 / modFactor;
 ti[6] = 70 * sqrt(modFactor);
 ai[6] = 2.5 *((modFactor * modFactor)*sqrt(modFactor)) * 18;
 bi[6] = 0.2 * modFactor;


 for (i = 1; i <= 6; i++)
 {
 ti[i] = ti[i] * (pi / 180.0);
 }
}

void inferior3()
{
 int i;
 modFactor = sqrt((float)hmean / 60.0);

 ti[1] = -60 * sqrt(modFactor);
 ai[1] = 0.8 * 18;
 bi[1] = 0.2 * modFactor;
 ti[2] = -15 * modFactor;
 ai[2] = -6 * 18;
 bi[2] = 0.1 * modFactor;
 ti[3] = 0;
 ai[3] = 33.75 * 18;
 bi[3] = 0.1 * modFactor;
 ti[4] = 15 * modFactor;
 ai[4] = 0.5 * 18;
 bi[4] = 0.2 * modFactor;
 ti[5] = 67 * sqrt(modFactor);
 ai[5] = 0.9 * ((modFactor * modFactor)*sqrt(modFactor)) * 18;
 bi[5] = 0.45 / modFactor;
 ti[6] = 70 * sqrt(modFactor);
 ai[6] = 1.5 *((modFactor * modFactor)*sqrt(modFactor)) * 18;
 bi[6] = 0.25 * modFactor;


 for (i = 1; i <= 6; i++)
 {
 ti[i] = ti[i] * (pi / 180.0);
 }
}

void inferioraVR()
{
 int i;
 modFactor = sqrt((float)hmean / 60.0);

 ti[1] = -60 * sqrt(modFactor);
 ai[1] = -0.8 * 18;
 bi[1] = 0.2 * modFactor;
 ti[2] = -15 * modFactor;
 ai[2] = 0.5 * 18;
 bi[2] = 0.1 * modFactor;
 ti[3] = 0;
 ai[3] = -26.25 * 18;
 bi[3] = 0.1 * modFactor;
 ti[4] = 15 * modFactor;
 ai[4] = 2 * 18;
 bi[4] = 0.15 * modFactor;
 ti[5] = 97 * sqrt(modFactor);
 ai[5] = -0.3 * ((modFactor * modFactor)*sqrt(modFactor)) * 18;
 bi[5] = 0.4 / modFactor;
 ti[6] = 100 * sqrt(modFactor);
 ai[6] = -0.4 *((modFactor * modFactor)*sqrt(modFactor)) * 18;
 bi[6] = 0.2 * modFactor;


 for (i = 1; i <= 6; i++)
 {
 ti[i] = ti[i] * (pi / 180.0);
 }
}

void inferioraVL()
{
 int i;
 modFactor = sqrt((float)hmean / 60.0);

 ti[1] = -60 * sqrt(modFactor);
 ai[1] = 0.8 * 18;
 bi[1] = 0.2 * modFactor;
 ti[2] = -15 * modFactor;
 ai[2] = -0.5 * 18;
 bi[2] = 0.1 * modFactor;
 ti[3] = 0;
 ai[3] = 41.25 * 18;
 bi[3] = 0.1 * modFactor;
 ti[4] = 15 * modFactor;
 ai[4] = -0.5 * 18;
 bi[4] = 0.2 * modFactor;
 ti[5] = 97 * sqrt(modFactor);
 ai[5] = -0.8 * ((modFactor * modFactor)*sqrt(modFactor)) * 18;
 bi[5] = 0.4 / modFactor;
 ti[6] = 100 * sqrt(modFactor);
 ai[6] = -1 *((modFactor * modFactor)*sqrt(modFactor)) * 18;
 bi[6] = 0.2 * modFactor;


 for (i = 1; i <= 6; i++)
 {
 ti[i] = ti[i] * (pi / 180.0);
 }
}

void inferioraVF()
{
 int i;
 modFactor = sqrt((float)hmean / 60.0);

 ti[1] = -60 * sqrt(modFactor);
 ai[1] = 0.8 * 18;
 bi[1] = 0.2 * modFactor;
 ti[2] = -15 * modFactor;
 ai[2] = -6 * 18;
 bi[2] = 0.1 * modFactor;
 ti[3] = 0;
 ai[3] = 41.25 * 18;
 bi[3] = 0.1 * modFactor;
 ti[4] = 15 * modFactor;
 ai[4] = 0.5 * 18;
 bi[4] = 0.2 * modFactor;
 ti[5] = 67 * sqrt(modFactor);
 ai[5] = 1.2 * ((modFactor * modFactor)*sqrt(modFactor)) * 18;
 bi[5] = 0.4 / modFactor;
 ti[6] = 70 * sqrt(modFactor);
 ai[6] = 2 *((modFactor * modFactor)*sqrt(modFactor)) * 18;
 bi[6] = 0.2 * modFactor;


 for (i = 1; i <= 6; i++)
 {
 ti[i] = ti[i] * (pi / 180.0);
 }
}

void inferiorV1()
{
 int i;
 modFactor = sqrt((float)hmean / 60.0);

 ti[1] = -60 * sqrt(modFactor);
 ai[1] = 0.8 * 18;
 bi[1] = 0.2 * modFactor;
 ti[2] = -15 * modFactor;
 ai[2] = 0.5 * 18;
 bi[2] = 0.1 * modFactor;
 ti[3] = 0;
 ai[3] = -32 * 18;
 bi[3] = 0.1 * modFactor;
 ti[4] = 15 * modFactor;
 ai[4] = -1 * 18;
 bi[4] = 0.1 * modFactor;
 ti[5] = 97 * sqrt(modFactor);
 ai[5] = 0.51 * ((modFactor * modFactor)*sqrt(modFactor)) * 18;
 bi[5] = 0.4 / modFactor;
 ti[6] = 100 * sqrt(modFactor);
 ai[6] = 0.75 *((modFactor * modFactor)*sqrt(modFactor)) * 18;
 bi[6] = 0.2 * modFactor;


 for (i = 1; i <= 6; i++)
 {
 ti[i] = ti[i] * (pi / 180.0);
 }
}

void inferiorV2()
{
 int i;
 modFactor = sqrt((float)hmean / 60.0);

 ti[1] = -60 * sqrt(modFactor);
 ai[1] = 0.8 * 18;
 bi[1] = 0.2 * modFactor;
 ti[2] = -15 * modFactor;
 ai[2] = 15.75 * 18;
 bi[2] = 0.1 * modFactor;
 ti[3] = 0;
 ai[3] = -37.5 * 18;
 bi[3] = 0.1 * modFactor;
 ti[4] = 15 * modFactor;
 ai[4] = -1 * 18;
 bi[4] = 0.1 * modFactor;
 ti[5] = 97 * sqrt(modFactor);
 ai[5] = 0.56 * ((modFactor * modFactor)*sqrt(modFactor)) * 18;
 bi[5] = 0.4 / modFactor;
 ti[6] = 100 * sqrt(modFactor);
 ai[6] = 0.83 *((modFactor * modFactor)*sqrt(modFactor)) * 18;
 bi[6] = 0.2 * modFactor;


 for (i = 1; i <= 6; i++)
 {
 ti[i] = ti[i] * (pi / 180.0);
 }
}

void inferiorV3()
{
 int i;
 modFactor = sqrt((float)hmean / 60.0);

 ti[1] = -60 * sqrt(modFactor);
 ai[1] = 0.8 * 18;
 bi[1] = 0.2 * modFactor;
 ti[2] = -15 * modFactor;
 ai[2] = 23 * 18;
 bi[2] = 0.1 * modFactor;
 ti[3] = 0;
 ai[3] = -33.75 * 18;
 bi[3] = 0.1 * modFactor;
 ti[4] = 15 * modFactor;
 ai[4] = -1 * 18;
 bi[4] = 0.1 * modFactor;
 ti[5] = 97 * sqrt(modFactor);
 ai[5] = 0.7 * ((modFactor * modFactor)*sqrt(modFactor)) * 18;
 bi[5] = 0.4 / modFactor;
 ti[6] = 100 * sqrt(modFactor);
 ai[6] = 0.8 *((modFactor * modFactor)*sqrt(modFactor)) * 18;
 bi[6] = 0.2 * modFactor;


 for (i = 1; i <= 6; i++)
 {
 ti[i] = ti[i] * (pi / 180.0);
 }
}

void inferiorV4()
{
 int i;
 modFactor = sqrt((float)hmean / 60.0);

 ti[1] = -60 * sqrt(modFactor);
 ai[1] = 0.8 * 18;
 bi[1] = 0.2 * modFactor;
 ti[2] = -15 * modFactor;
 ai[2] = 0.5 * 18;
 bi[2] = 0.1 * modFactor;
 ti[3] = 0;
 ai[3] = 45 * 18;
 bi[3] = 0.1 * modFactor;
 ti[4] = 15 * modFactor;
 ai[4] = -15 * 18;
 bi[4] = 0.1 * modFactor;
 ti[5] = 97 * sqrt(modFactor);
 ai[5] = 1 * ((modFactor * modFactor)*sqrt(modFactor)) * 18;
 bi[5] = 0.4 / modFactor;
 ti[6] = 100 * sqrt(modFactor);
 ai[6] = 2 *((modFactor * modFactor)*sqrt(modFactor)) * 18;
 bi[6] = 0.2 * modFactor;


 for (i = 1; i <= 6; i++)
 {
 ti[i] = ti[i] * (pi / 180.0);
 }
}

void inferiorV5()
{
 int i;
 modFactor = sqrt((float)hmean / 60.0);

 ti[1] = -60 * sqrt(modFactor);
 ai[1] = 0.8 * 18;
 bi[1] = 0.2 * modFactor;
 ti[2] = -15 * modFactor;
 ai[2] = -5 * 18;
 bi[2] = 0.1 * modFactor;
 ti[3] = 0;
 ai[3] = 48.75 * 18;
 bi[3] = 0.1 * modFactor;
 ti[4] = 15 * modFactor;
 ai[4] = -5 * 18;
 bi[4] = 0.1 * modFactor;
 ti[5] = 97 * sqrt(modFactor);
 ai[5] = 1 * ((modFactor * modFactor)*sqrt(modFactor)) * 18;
 bi[5] = 0.4 / modFactor;
 ti[6] = 100 * sqrt(modFactor);
 ai[6] = 1.5 *((modFactor * modFactor)*sqrt(modFactor)) * 18;
 bi[6] = 0.2 * modFactor;


 for (i = 1; i <= 6; i++)
 {
 ti[i] = ti[i] * (pi / 180.0);
 }
}

void inferiorV6()
{
 int i;
 modFactor = sqrt((float)hmean / 60.0);

 ti[1] = -60 * sqrt(modFactor);
 ai[1] = 0.8 * 18;
 bi[1] = 0.2 * modFactor;
 ti[2] = -15 * modFactor;
 ai[2] = -5 * 18;
 bi[2] = 0.1 * modFactor;
 ti[3] = 0;
 ai[3] = 45 * 18;
 bi[3] = 0.1 * modFactor;
 ti[4] = 15 * modFactor;
 ai[4] = 0.5 * 18;
 bi[4] = 0.1 * modFactor;
 ti[5] = 97 * sqrt(modFactor);
 ai[5] = 0.8 * ((modFactor * modFactor)*sqrt(modFactor)) * 18;
 bi[5] = 0.4 / modFactor;
 ti[6] = 100 * sqrt(modFactor);
 ai[6] = 0.9 *((modFactor * modFactor)*sqrt(modFactor)) * 18;
 bi[6] = 0.2 * modFactor;


 for (i = 1; i <= 6; i++)
 {
 ti[i] = ti[i] * (pi / 180.0);
 }
}
#line 1 "d:/its/akademik/ta/12-lead synthetic ecg normal and myocardial infarction/parameter_lateral.h"
void lateral1()
{
 int i;
 modFactor = sqrt((float)hmean / 60.0);

 ti[1] = -60 * sqrt(modFactor);
 ai[1] = 0.8 * 18;
 bi[1] = 0.2 * modFactor;
 ti[2] = -15 * modFactor;
 ai[2] = -5 * 18;
 bi[2] = 0.1 * modFactor;
 ti[3] = 0;
 ai[3] = 30 * 18;
 bi[3] = 0.1 * modFactor;
 ti[4] = 15 * modFactor;
 ai[4] = -7.5 * 18;
 bi[4] = 0.1 * modFactor;
 ti[5] = 77 * sqrt(modFactor);
 ai[5] = 0.83 * ((modFactor * modFactor)*sqrt(modFactor)) * 18;
 bi[5] = 0.4 / modFactor;
 ti[6] = 80 * sqrt(modFactor);
 ai[6] = 1.25 *((modFactor * modFactor)*sqrt(modFactor)) * 18;
 bi[6] = 0.2 * modFactor;


 for (i = 1; i <= 6; i++)
 {
 ti[i] = ti[i] * (pi / 180.0);
 }
}

void lateral2()
{
 int i;
 modFactor = sqrt((float)hmean / 60.0);

 ti[1] = -60 * sqrt(modFactor);
 ai[1] = 1.2 * 18;
 bi[1] = 0.2 * modFactor;
 ti[2] = -15 * modFactor;
 ai[2] = -6 * 18;
 bi[2] = 0.1 * modFactor;
 ti[3] = 0;
 ai[3] = 22.5 * 18;
 bi[3] = 0.1 * modFactor;
 ti[4] = 15 * modFactor;
 ai[4] = 0.5 * 18;
 bi[4] = 0.1 * modFactor;
 ti[5] = 97 * sqrt(modFactor);
 ai[5] = 0.17 * ((modFactor * modFactor)*sqrt(modFactor)) * 18;
 bi[5] = 0.4 / modFactor;
 ti[6] = 100 * sqrt(modFactor);
 ai[6] = 0.25 *((modFactor * modFactor)*sqrt(modFactor)) * 18;
 bi[6] = 0.2 * modFactor;


 for (i = 1; i <= 6; i++)
 {
 ti[i] = ti[i] * (pi / 180.0);
 }
}

void lateral3()
{
 int i;
 modFactor = sqrt((float)hmean / 60.0);

 ti[1] = -60 * sqrt(modFactor);
 ai[1] = 0.8 * 18;
 bi[1] = 0.2 * modFactor;
 ti[2] = -15 * modFactor;
 ai[2] = -0.5 * 18;
 bi[2] = 0.1 * modFactor;
 ti[3] = 0;
 ai[3] = 26.25 * 18;
 bi[3] = 0.1 * modFactor;
 ti[4] = 15 * modFactor;
 ai[4] = -11.25 * 18;
 bi[4] = 0.1 * modFactor;
 ti[5] = 97 * sqrt(modFactor);
 ai[5] = 0.25 * ((modFactor * modFactor)*sqrt(modFactor)) * 18;
 bi[5] = 0.4 / modFactor;
 ti[6] = 100 * sqrt(modFactor);
 ai[6] = 0.3 *((modFactor * modFactor)*sqrt(modFactor)) * 18;
 bi[6] = 0.2 * modFactor;


 for (i = 1; i <= 6; i++)
 {
 ti[i] = ti[i] * (pi / 180.0);
 }
}

void lateralaVR()
{
 int i;
 modFactor = sqrt((float)hmean / 60.0);

 ti[1] = -60 * sqrt(modFactor);
 ai[1] = -0.8 * 18;
 bi[1] = 0.2 * modFactor;
 ti[2] = -15 * modFactor;
 ai[2] = 8 * 18;
 bi[2] = 0.1 * modFactor;
 ti[3] = 0;
 ai[3] = -37.5 * 18;
 bi[3] = 0.1 * modFactor;
 ti[4] = 15 * modFactor;
 ai[4] = -0.5 * 18;
 bi[4] = 0.1 * modFactor;
 ti[5] = 97 * sqrt(modFactor);
 ai[5] = -0.3 * ((modFactor * modFactor)*sqrt(modFactor)) * 18;
 bi[5] = 0.4 / modFactor;
 ti[6] = 100 * sqrt(modFactor);
 ai[6] = -0.5 *((modFactor * modFactor)*sqrt(modFactor)) * 18;
 bi[6] = 0.2 * modFactor;


 for (i = 1; i <= 6; i++)
 {
 ti[i] = ti[i] * (pi / 180.0);
 }
}

void lateralaVL()
{
 int i;
 modFactor = sqrt((float)hmean / 60.0);

 ti[1] = -60 * sqrt(modFactor);
 ai[1] = 0.8 * 18;
 bi[1] = 0.2 * modFactor;
 ti[2] = -15 * modFactor;
 ai[2] = -13 * 18;
 bi[2] = 0.1 * modFactor;
 ti[3] = 0;
 ai[3] = 38 * 18;
 bi[3] = 0.1 * modFactor;
 ti[4] = 15 * modFactor;
 ai[4] = 1 * 18;
 bi[4] = 0.2 * modFactor;
 ti[5] = 67 * sqrt(modFactor);
 ai[5] = 0.68 * ((modFactor * modFactor)*sqrt(modFactor)) * 18;
 bi[5] = 0.4 / modFactor;
 ti[6] = 70 * sqrt(modFactor);
 ai[6] = 1 *((modFactor * modFactor)*sqrt(modFactor)) * 18;
 bi[6] = 0.2 * modFactor;


 for (i = 1; i <= 6; i++)
 {
 ti[i] = ti[i] * (pi / 180.0);
 }
}

void lateralaVF()
{
 int i;
 modFactor = sqrt((float)hmean / 60.0);

 ti[1] = -60 * sqrt(modFactor);
 ai[1] = 0.8 * 18;
 bi[1] = 0.2 * modFactor;
 ti[2] = -15 * modFactor;
 ai[2] = 0.5 * 18;
 bi[2] = 0.1 * modFactor;
 ti[3] = 0;
 ai[3] = 30 * 18;
 bi[3] = 0.1 * modFactor;
 ti[4] = 15 * modFactor;
 ai[4] = -11.25 * 18;
 bi[4] = 0.1 * modFactor;
 ti[5] = 97 * sqrt(modFactor);
 ai[5] = 0.3 * ((modFactor * modFactor)*sqrt(modFactor)) * 18;
 bi[5] = 0.4 / modFactor;
 ti[6] = 100 * sqrt(modFactor);
 ai[6] = 0.5 *((modFactor * modFactor)*sqrt(modFactor)) * 18;
 bi[6] = 0.2 * modFactor;


 for (i = 1; i <= 6; i++)
 {
 ti[i] = ti[i] * (pi / 180.0);
 }
}

void lateralV1()
{
 int i;
 modFactor = sqrt((float)hmean / 60.0);

 ti[1] = -60 * sqrt(modFactor);
 ai[1] = 0.8 * 18;
 bi[1] = 0.2 * modFactor;
 ti[2] = -15 * modFactor;
 ai[2] = -5 * 18;
 bi[2] = 0.1 * modFactor;
 ti[3] = 0;
 ai[3] = -30 * 18;
 bi[3] = 0.1 * modFactor;
 ti[4] = 15 * modFactor;
 ai[4] = -0.5 * 18;
 bi[4] = 0.25 * modFactor;
 ti[5] = 97 * sqrt(modFactor);
 ai[5] = 0.25 * ((modFactor * modFactor)*sqrt(modFactor)) * 18;
 bi[5] = 0.4 / modFactor;
 ti[6] = 100 * sqrt(modFactor);
 ai[6] = 0.35 *((modFactor * modFactor)*sqrt(modFactor)) * 18;
 bi[6] = 0.2 * modFactor;


 for (i = 1; i <= 6; i++)
 {
 ti[i] = ti[i] * (pi / 180.0);
 }
}

void lateralV2()
{
 int i;
 modFactor = sqrt((float)hmean / 60.0);

 ti[1] = -60 * sqrt(modFactor);
 ai[1] = 0.8 * 18;
 bi[1] = 0.2 * modFactor;
 ti[2] = -15 * modFactor;
 ai[2] = 10 * 18;
 bi[2] = 0.1 * modFactor;
 ti[3] = 0;
 ai[3] = -53.3 * 18;
 bi[3] = 0.1 * modFactor;
 ti[4] = 15 * modFactor;
 ai[4] = -1 * 18;
 bi[4] = 0.2 * modFactor;
 ti[5] = 97 * sqrt(modFactor);
 ai[5] = 0.7 * ((modFactor * modFactor)*sqrt(modFactor)) * 18;
 bi[5] = 0.4 / modFactor;
 ti[6] = 100 * sqrt(modFactor);
 ai[6] = 1.04 *((modFactor * modFactor)*sqrt(modFactor)) * 18;
 bi[6] = 0.2 * modFactor;


 for (i = 1; i <= 6; i++)
 {
 ti[i] = ti[i] * (pi / 180.0);
 }
}

void lateralV3()
{
 int i;
 modFactor = sqrt((float)hmean / 60.0);

 ti[1] = -60 * sqrt(modFactor);
 ai[1] = 0.8 * 18;
 bi[1] = 0.2 * modFactor;
 ti[2] = -15 * modFactor;
 ai[2] = 15 * 18;
 bi[2] = 0.1 * modFactor;
 ti[3] = 0;
 ai[3] = -31 * 18;
 bi[3] = 0.1 * modFactor;
 ti[4] = 15 * modFactor;
 ai[4] = -1 * 18;
 bi[4] = 0.2 * modFactor;
 ti[5] = 97 * sqrt(modFactor);
 ai[5] = 0.9 * ((modFactor * modFactor)*sqrt(modFactor)) * 18;
 bi[5] = 0.4 / modFactor;
 ti[6] = 100 * sqrt(modFactor);
 ai[6] = 1.5 *((modFactor * modFactor)*sqrt(modFactor)) * 18;
 bi[6] = 0.2 * modFactor;


 for (i = 1; i <= 6; i++)
 {
 ti[i] = ti[i] * (pi / 180.0);
 }
}

void lateralV4()
{
 int i;
 modFactor = sqrt((float)hmean / 60.0);

 ti[1] = -60 * sqrt(modFactor);
 ai[1] = 0.8 * 18;
 bi[1] = 0.2 * modFactor;
 ti[2] = -15 * modFactor;
 ai[2] = 0.5 * 18;
 bi[2] = 0.1 * modFactor;
 ti[3] = 0;
 ai[3] = 45 * 18;
 bi[3] = 0.1 * modFactor;
 ti[4] = 15 * modFactor;
 ai[4] = -17 * 18;
 bi[4] = 0.1 * modFactor;
 ti[5] = 97 * sqrt(modFactor);
 ai[5] = 1 * ((modFactor * modFactor)*sqrt(modFactor)) * 18;
 bi[5] = 0.4 / modFactor;
 ti[6] = 100 * sqrt(modFactor);
 ai[6] = 2 *((modFactor * modFactor)*sqrt(modFactor)) * 18;
 bi[6] = 0.2 * modFactor;


 for (i = 1; i <= 6; i++)
 {
 ti[i] = ti[i] * (pi / 180.0);
 }
}


void lateralV5()
{
 int i;
 modFactor = sqrt((float)hmean / 60.0);

 ti[1] = -60 * sqrt(modFactor);
 ai[1] = 0.8 * 18;
 bi[1] = 0.2 * modFactor;
 ti[2] = -15 * modFactor;
 ai[2] = -5 * 18;
 bi[2] = 0.1 * modFactor;
 ti[3] = 0;
 ai[3] = 48.75 * 18;
 bi[3] = 0.1 * modFactor;
 ti[4] = 15 * modFactor;
 ai[4] = -7.5 * 18;
 bi[4] = 0.12 * modFactor;
 ti[5] = 87 * sqrt(modFactor);
 ai[5] = 1.34 * ((modFactor * modFactor)*sqrt(modFactor)) * 18;
 bi[5] = 0.45 / modFactor;
 ti[6] = 90 * sqrt(modFactor);
 ai[6] = 2 *((modFactor * modFactor)*sqrt(modFactor)) * 18;
 bi[6] = 0.25 * modFactor;


 for (i = 1; i <= 6; i++)
 {
 ti[i] = ti[i] * (pi / 180.0);
 }
}

void lateralV6()
{
 int i;
 modFactor = sqrt((float)hmean / 60.0);

 ti[1] = -60 * sqrt(modFactor);
 ai[1] = 0.8 * 18;
 bi[1] = 0.2 * modFactor;
 ti[2] = -15 * modFactor;
 ai[2] = -5 * 18;
 bi[2] = 0.1 * modFactor;
 ti[3] = 0;
 ai[3] = 45 * 18;
 bi[3] = 0.1 * modFactor;
 ti[4] = 15 * modFactor;
 ai[4] = 1 * 18;
 bi[4] = 0.2 * modFactor;
 ti[5] = 77 * sqrt(modFactor);
 ai[5] = 1.8 * ((modFactor * modFactor)*sqrt(modFactor)) * 18;
 bi[5] = 0.4 / modFactor;
 ti[6] = 80 * sqrt(modFactor);
 ai[6] = 2 *((modFactor * modFactor)*sqrt(modFactor)) * 18;
 bi[6] = 0.2 * modFactor;


 for (i = 1; i <= 6; i++)
 {
 ti[i] = ti[i] * (pi / 180.0);
 }
}
#line 1 "d:/its/akademik/ta/12-lead synthetic ecg normal and myocardial infarction/parameter_septal.h"
void septal1()
{
 int i;
 modFactor = sqrt((float)hmean / 60.0);

 ti[1] = -60 * sqrt(modFactor);
 ai[1] = 0.8 * 18;
 bi[1] = 0.2 * modFactor;
 ti[2] = -15 * modFactor;
 ai[2] = 0.5 * 18;
 bi[2] = 0.1 * modFactor;
 ti[3] = 0;
 ai[3] = 30 * 18;
 bi[3] = 0.1 * modFactor;
 ti[4] = 15 * modFactor;
 ai[4] = -7.5 * 18;
 bi[4] = 0.1 * modFactor;
 ti[5] = 97 * sqrt(modFactor);
 ai[5] = 0.5 * ((modFactor * modFactor)*sqrt(modFactor)) * 18;
 bi[5] = 0.4 / modFactor;
 ti[6] = 100 * sqrt(modFactor);
 ai[6] = 0.75 *((modFactor * modFactor)*sqrt(modFactor)) * 18;
 bi[6] = 0.2 * modFactor;


 for (i = 1; i <= 6; i++)
 {
 ti[i] = ti[i] * (pi / 180.0);
 }
}

void septal2()
{
 int i;
 modFactor = sqrt((float)hmean / 60.0);

 ti[1] = -60 * sqrt(modFactor);
 ai[1] = 1.2 * 18;
 bi[1] = 0.2 * modFactor;
 ti[2] = -15 * modFactor;
 ai[2] = 0.5 * 18;
 bi[2] = 0.1 * modFactor;
 ti[3] = 0;
 ai[3] = 52.5 * 18;
 bi[3] = 0.1 * modFactor;
 ti[4] = 15 * modFactor;
 ai[4] = 0.5 * 18;
 bi[4] = 0.1 * modFactor;
 ti[5] = 97 * sqrt(modFactor);
 ai[5] = 0.67 * ((modFactor * modFactor)*sqrt(modFactor)) * 18;
 bi[5] = 0.4 / modFactor;
 ti[6] = 100 * sqrt(modFactor);
 ai[6] = 1 *((modFactor * modFactor)*sqrt(modFactor)) * 18;
 bi[6] = 0.2 * modFactor;


 for (i = 1; i <= 6; i++)
 {
 ti[i] = ti[i] * (pi / 180.0);
 }
}

void septal3()
{
 int i;
 modFactor = sqrt((float)hmean / 60.0);

 ti[1] = -60 * sqrt(modFactor);
 ai[1] = 0.8 * 18;
 bi[1] = 0.2 * modFactor;
 ti[2] = -15 * modFactor;
 ai[2] = 0.5 * 18;
 bi[2] = 0.1 * modFactor;
 ti[3] = 0;
 ai[3] = 33.75 * 18;
 bi[3] = 0.1 * modFactor;
 ti[4] = 15 * modFactor;
 ai[4] = 0.5 * 18;
 bi[4] = 0.1 * modFactor;
 ti[5] = 97 * sqrt(modFactor);
 ai[5] = 0.3 * ((modFactor * modFactor)*sqrt(modFactor)) * 18;
 bi[5] = 0.4 / modFactor;
 ti[6] = 100 * sqrt(modFactor);
 ai[6] = 0.5 *((modFactor * modFactor)*sqrt(modFactor)) * 18;
 bi[6] = 0.2 * modFactor;


 for (i = 1; i <= 6; i++)
 {
 ti[i] = ti[i] * (pi / 180.0);
 }
}

void septalaVR()
{
 int i;
 modFactor = sqrt((float)hmean / 60.0);

 ti[1] = -60 * sqrt(modFactor);
 ai[1] = -0.8 * 18;
 bi[1] = 0.2 * modFactor;
 ti[2] = -15 * modFactor;
 ai[2] = 0.5 * 18;
 bi[2] = 0.1 * modFactor;
 ti[3] = 0;
 ai[3] = -30 * 18;
 bi[3] = 0.1 * modFactor;
 ti[4] = 15 * modFactor;
 ai[4] = 0.5 * 18;
 bi[4] = 0.1 * modFactor;
 ti[5] = 97 * sqrt(modFactor);
 ai[5] = -0.5 * ((modFactor * modFactor)*sqrt(modFactor)) * 18;
 bi[5] = 0.4 / modFactor;
 ti[6] = 100 * sqrt(modFactor);
 ai[6] = -0.75 *((modFactor * modFactor)*sqrt(modFactor)) * 18;
 bi[6] = 0.2 * modFactor;


 for (i = 1; i <= 6; i++)
 {
 ti[i] = ti[i] * (pi / 180.0);
 }
}

void septalaVL()
{
 int i;
 modFactor = sqrt((float)hmean / 60.0);

 ti[1] = -60 * sqrt(modFactor);
 ai[1] = -0.2 * 18;
 bi[1] = 0.2 * modFactor;
 ti[2] = -15 * modFactor;
 ai[2] = 7 * 18;
 bi[2] = 0.1 * modFactor;
 ti[3] = 0;
 ai[3] = -15 * 18;
 bi[3] = 0.1 * modFactor;
 ti[4] = 15 * modFactor;
 ai[4] = -0.5 * 18;
 bi[4] = 0.1 * modFactor;
 ti[5] = 97 * sqrt(modFactor);
 ai[5] = 0.17 * ((modFactor * modFactor)*sqrt(modFactor)) * 18;
 bi[5] = 0.4 / modFactor;
 ti[6] = 100 * sqrt(modFactor);
 ai[6] = 0.25 *((modFactor * modFactor)*sqrt(modFactor)) * 18;
 bi[6] = 0.2 * modFactor;


 for (i = 1; i <= 6; i++)
 {
 ti[i] = ti[i] * (pi / 180.0);
 }
}

void septalaVF()
{
 int i;
 modFactor = sqrt((float)hmean / 60.0);

 ti[1] = -60 * sqrt(modFactor);
 ai[1] = 1 * 18;
 bi[1] = 0.2 * modFactor;
 ti[2] = -15 * modFactor;
 ai[2] = 0.5 * 18;
 bi[2] = 0.1 * modFactor;
 ti[3] = 0;
 ai[3] = 40 * 18;
 bi[3] = 0.1 * modFactor;
 ti[4] = 15 * modFactor;
 ai[4] = 0.5 * 18;
 bi[4] = 0.1 * modFactor;
 ti[5] = 97 * sqrt(modFactor);
 ai[5] = 0.4 * ((modFactor * modFactor)*sqrt(modFactor)) * 18;
 bi[5] = 0.4 / modFactor;
 ti[6] = 100 * sqrt(modFactor);
 ai[6] = 0.6 *((modFactor * modFactor)*sqrt(modFactor)) * 18;
 bi[6] = 0.2 * modFactor;


 for (i = 1; i <= 6; i++)
 {
 ti[i] = ti[i] * (pi / 180.0);
 }
}

void septalV1()
{
 int i;
 modFactor = sqrt((float)hmean / 60.0);

 ti[1] = -60 * sqrt(modFactor);
 ai[1] = 0.8 * 18;
 bi[1] = 0.2 * modFactor;
 ti[2] = -15 * modFactor;
 ai[2] = -1 * 18;
 bi[2] = 0.1 * modFactor;
 ti[3] = 0;
 ai[3] = -37.5 * 18;
 bi[3] = 0.1 * modFactor;
 ti[4] = 15 * modFactor;
 ai[4] = 1 * 18;
 bi[4] = 0.3 * modFactor;
 ti[5] = 67 * sqrt(modFactor);
 ai[5] = 1.02 * ((modFactor * modFactor)*sqrt(modFactor)) * 18;
 bi[5] = 0.4 / modFactor;
 ti[6] = 70 * sqrt(modFactor);
 ai[6] = 1.5 *((modFactor * modFactor)*sqrt(modFactor)) * 18;
 bi[6] = 0.2 * modFactor;


 for (i = 1; i <= 6; i++)
 {
 ti[i] = ti[i] * (pi / 180.0);
 }
}

void septalV2()
{
 int i;
 modFactor = sqrt((float)hmean / 60.0);

 ti[1] = -60 * sqrt(modFactor);
 ai[1] = 0.8 * 18;
 bi[1] = 0.2 * modFactor;
 ti[2] = -15 * modFactor;
 ai[2] = 0.5 * 18;
 bi[2] = 0.1 * modFactor;
 ti[3] = 0;
 ai[3] = -49.7 * 18;
 bi[3] = 0.1 * modFactor;
 ti[4] = 15 * modFactor;
 ai[4] = 1 * 18;
 bi[4] = 0.2 * modFactor;
 ti[5] = 67 * sqrt(modFactor);
 ai[5] = 1.5 * ((modFactor * modFactor)*sqrt(modFactor)) * 18;
 bi[5] = 0.4 / modFactor;
 ti[6] = 70 * sqrt(modFactor);
 ai[6] = 1.85 *((modFactor * modFactor)*sqrt(modFactor)) * 18;
 bi[6] = 0.2 * modFactor;


 for (i = 1; i <= 6; i++)
 {
 ti[i] = ti[i] * (pi / 180.0);
 }
}

void septalV3()
{
 int i;
 modFactor = sqrt((float)hmean / 60.0);

 ti[1] = -60 * sqrt(modFactor);
 ai[1] = 0.8 * 18;
 bi[1] = 0.2 * modFactor;
 ti[2] = -15 * modFactor;
 ai[2] = 18 * 18;
 bi[2] = 0.1 * modFactor;
 ti[3] = 0;
 ai[3] = -33.75 * 18;
 bi[3] = 0.1 * modFactor;
 ti[4] = 15 * modFactor;
 ai[4] = -1 * 18;
 bi[4] = 0.1 * modFactor;
 ti[5] = 97 * sqrt(modFactor);
 ai[5] = 1 * ((modFactor * modFactor)*sqrt(modFactor)) * 18;
 bi[5] = 0.4 / modFactor;
 ti[6] = 100 * sqrt(modFactor);
 ai[6] = 2 *((modFactor * modFactor)*sqrt(modFactor)) * 18;
 bi[6] = 0.2 * modFactor;


 for (i = 1; i <= 6; i++)
 {
 ti[i] = ti[i] * (pi / 180.0);
 }
}

void septalV4()
{
 int i;
 modFactor = sqrt((float)hmean / 60.0);

 ti[1] = -60 * sqrt(modFactor);
 ai[1] = 0.8 * 18;
 bi[1] = 0.2 * modFactor;
 ti[2] = -15 * modFactor;
 ai[2] = 0.5 * 18;
 bi[2] = 0.1 * modFactor;
 ti[3] = 0;
 ai[3] = 45 * 18;
 bi[3] = 0.1 * modFactor;
 ti[4] = 15 * modFactor;
 ai[4] = -15 * 18;
 bi[4] = 0.1 * modFactor;
 ti[5] = 97 * sqrt(modFactor);
 ai[5] = 1 * ((modFactor * modFactor)*sqrt(modFactor)) * 18;
 bi[5] = 0.4 / modFactor;
 ti[6] = 100 * sqrt(modFactor);
 ai[6] = 2 *((modFactor * modFactor)*sqrt(modFactor)) * 18;
 bi[6] = 0.2 * modFactor;


 for (i = 1; i <= 6; i++)
 {
 ti[i] = ti[i] * (pi / 180.0);
 }
}

void septalV5()
{
 int i;
 modFactor = sqrt((float)hmean / 60.0);

 ti[1] = -60 * sqrt(modFactor);
 ai[1] = 0.8 * 18;
 bi[1] = 0.2 * modFactor;
 ti[2] = -15 * modFactor;
 ai[2] = 0.5 * 18;
 bi[2] = 0.1 * modFactor;
 ti[3] = 0;
 ai[3] = 48.75 * 18;
 bi[3] = 0.1 * modFactor;
 ti[4] = 15 * modFactor;
 ai[4] = -5 * 18;
 bi[4] = 0.1 * modFactor;
 ti[5] = 97 * sqrt(modFactor);
 ai[5] = 1 * ((modFactor * modFactor)*sqrt(modFactor)) * 18;
 bi[5] = 0.4 / modFactor;
 ti[6] = 100 * sqrt(modFactor);
 ai[6] = 1.5 *((modFactor * modFactor)*sqrt(modFactor)) * 18;
 bi[6] = 0.2 * modFactor;


 for (i = 1; i <= 6; i++)
 {
 ti[i] = ti[i] * (pi / 180.0);
 }
}

void septalV6()
{
 int i;
 modFactor = sqrt((float)hmean / 60.0);

 ti[1] = -60 * sqrt(modFactor);
 ai[1] = 0.8 * 18;
 bi[1] = 0.2 * modFactor;
 ti[2] = -15 * modFactor;
 ai[2] = 0.5 * 18;
 bi[2] = 0.1 * modFactor;
 ti[3] = 0;
 ai[3] = 45 * 18;
 bi[3] = 0.1 * modFactor;
 ti[4] = 15 * modFactor;
 ai[4] = 0.5 * 18;
 bi[4] = 0.1 * modFactor;
 ti[5] = 97 * sqrt(modFactor);
 ai[5] = 0.8 * ((modFactor * modFactor)*sqrt(modFactor)) * 18;
 bi[5] = 0.4 / modFactor;
 ti[6] = 100 * sqrt(modFactor);
 ai[6] = 0.9 *((modFactor * modFactor)*sqrt(modFactor)) * 18;
 bi[6] = 0.2 * modFactor;


 for (i = 1; i <= 6; i++)
 {
 ti[i] = ti[i] * (pi / 180.0);
 }
}
#line 1 "d:/its/akademik/ta/12-lead synthetic ecg normal and myocardial infarction/parameter_posterior.h"
void posterior1()
{
 int i;
 modFactor = sqrt((float)hmean / 60.0);

 ti[1] = -60 * sqrt(modFactor);
 ai[1] = 0.8 * 18;
 bi[1] = 0.2 * modFactor;
 ti[2] = -15 * modFactor;
 ai[2] = -5 * 18;
 bi[2] = 0.1 * modFactor;
 ti[3] = 0;
 ai[3] = 33 * 18;
 bi[3] = 0.1 * modFactor;
 ti[4] = 15 * modFactor;
 ai[4] = 0.5 * 18;
 bi[4] = 0.1 * modFactor;
 ti[5] = 97 * sqrt(modFactor);
 ai[5] = 0.4 * ((modFactor * modFactor)*sqrt(modFactor)) * 18;
 bi[5] = 0.4 / modFactor;
 ti[6] = 100 * sqrt(modFactor);
 ai[6] = 0.6 *((modFactor * modFactor)*sqrt(modFactor)) * 18;
 bi[6] = 0.2 * modFactor;


 for (i = 1; i <= 6; i++)
 {
 ti[i] = ti[i] * (pi / 180.0);
 }
}

void posterior2()
{
 int i;
 modFactor = sqrt((float)hmean / 60.0);

 ti[1] = -60 * sqrt(modFactor);
 ai[1] = 0.8 * 18;
 bi[1] = 0.2 * modFactor;
 ti[2] = -15 * modFactor;
 ai[2] = 7 * 18;
 bi[2] = 0.1 * modFactor;
 ti[3] = 0;
 ai[3] = -13.8 * 18;
 bi[3] = 0.1 * modFactor;
 ti[4] = 15 * modFactor;
 ai[4] = -0.5 * 18;
 bi[4] = 0.1 * modFactor;
 ti[5] = 97 * sqrt(modFactor);
 ai[5] = 0.17 * ((modFactor * modFactor)*sqrt(modFactor)) * 18;
 bi[5] = 0.4 / modFactor;
 ti[6] = 100 * sqrt(modFactor);
 ai[6] = 0.25 *((modFactor * modFactor)*sqrt(modFactor)) * 18;
 bi[6] = 0.2 * modFactor;


 for (i = 1; i <= 6; i++)
 {
 ti[i] = ti[i] * (pi / 180.0);
 }
}

void posterior3()
{
 int i;
 modFactor = sqrt((float)hmean / 60.0);

 ti[1] = -60 * sqrt(modFactor);
 ai[1] = 1.2 * 18;
 bi[1] = 0.2 * modFactor;
 ti[2] = -15 * modFactor;
 ai[2] = 5 * 18;
 bi[2] = 0.1 * modFactor;
 ti[3] = 0;
 ai[3] = -30 * 18;
 bi[3] = 0.1 * modFactor;
 ti[4] = 15 * modFactor;
 ai[4] = -0.5 * 18;
 bi[4] = 0.1 * modFactor;
 ti[5] = 97 * sqrt(modFactor);
 ai[5] = 0.23 * ((modFactor * modFactor)*sqrt(modFactor)) * 18;
 bi[5] = 0.4 / modFactor;
 ti[6] = 100 * sqrt(modFactor);
 ai[6] = 0.36 *((modFactor * modFactor)*sqrt(modFactor)) * 18;
 bi[6] = 0.2 * modFactor;


 for (i = 1; i <= 6; i++)
 {
 ti[i] = ti[i] * (pi / 180.0);
 }
}

void posterioraVR()
{
 int i;
 modFactor = sqrt((float)hmean / 60.0);

 ti[1] = -60 * sqrt(modFactor);
 ai[1] = -0.8 * 18;
 bi[1] = 0.2 * modFactor;
 ti[2] = -15 * modFactor;
 ai[2] = 10 * 18;
 bi[2] = 0.1 * modFactor;
 ti[3] = 0;
 ai[3] = -26.3 * 18;
 bi[3] = 0.1 * modFactor;
 ti[4] = 15 * modFactor;
 ai[4] = -0.5 * 18;
 bi[4] = 0.1 * modFactor;
 ti[5] = 97 * sqrt(modFactor);
 ai[5] = -0.17 * ((modFactor * modFactor)*sqrt(modFactor)) * 18;
 bi[5] = 0.4 / modFactor;
 ti[6] = 100 * sqrt(modFactor);
 ai[6] = -0.25 *((modFactor * modFactor)*sqrt(modFactor)) * 18;
 bi[6] = 0.2 * modFactor;


 for (i = 1; i <= 6; i++)
 {
 ti[i] = ti[i] * (pi / 180.0);
 }
}

void posterioraVL()
{
 int i;
 modFactor = sqrt((float)hmean / 60.0);

 ti[1] = -60 * sqrt(modFactor);
 ai[1] = 0.8 * 18;
 bi[1] = 0.2 * modFactor;
 ti[2] = -15 * modFactor;
 ai[2] = -7 * 18;
 bi[2] = 0.1 * modFactor;
 ti[3] = 0;
 ai[3] = 30 * 18;
 bi[3] = 0.1 * modFactor;
 ti[4] = 15 * modFactor;
 ai[4] = 0.5 * 18;
 bi[4] = 0.1 * modFactor;
 ti[5] = 97 * sqrt(modFactor);
 ai[5] = -0.17 * ((modFactor * modFactor)*sqrt(modFactor)) * 18;
 bi[5] = 0.4 / modFactor;
 ti[6] = 100 * sqrt(modFactor);
 ai[6] = -0.25 *((modFactor * modFactor)*sqrt(modFactor)) * 18;
 bi[6] = 0.2 * modFactor;


 for (i = 1; i <= 6; i++)
 {
 ti[i] = ti[i] * (pi / 180.0);
 }
}

void posterioraVF()
{
 int i;
 modFactor = sqrt((float)hmean / 60.0);

 ti[1] = -60 * sqrt(modFactor);
 ai[1] = 0.8 * 18;
 bi[1] = 0.2 * modFactor;
 ti[2] = -15 * modFactor;
 ai[2] = 4 * 18;
 bi[2] = 0.1 * modFactor;
 ti[3] = 0;
 ai[3] = -22.5 * 18;
 bi[3] = 0.1 * modFactor;
 ti[4] = 15 * modFactor;
 ai[4] = -0.5 * 18;
 bi[4] = 0.1 * modFactor;
 ti[5] = 97 * sqrt(modFactor);
 ai[5] = 0.15 * ((modFactor * modFactor)*sqrt(modFactor)) * 18;
 bi[5] = 0.4 / modFactor;
 ti[6] = 100 * sqrt(modFactor);
 ai[6] = 0.25 *((modFactor * modFactor)*sqrt(modFactor)) * 18;
 bi[6] = 0.2 * modFactor;


 for (i = 1; i <= 6; i++)
 {
 ti[i] = ti[i] * (pi / 180.0);
 }
}

void posteriorV1()
{
 int i;
 modFactor = sqrt((float)hmean / 60.0);

 ti[1] = -60 * sqrt(modFactor);
 ai[1] = 0.8 * 18;
 bi[1] = 0.2 * modFactor;
 ti[2] = -15 * modFactor;
 ai[2] = 0.5 * 18;
 bi[2] = 0.1 * modFactor;
 ti[3] = 0;
 ai[3] = 45 * 18;
 bi[3] = 0.1 * modFactor;
 ti[4] = 15 * modFactor;
 ai[4] = -15 * 18;
 bi[4] = 0.1 * modFactor;
 ti[5] = 97 * sqrt(modFactor);
 ai[5] = 0.68 * ((modFactor * modFactor)*sqrt(modFactor)) * 18;
 bi[5] = 0.4 / modFactor;
 ti[6] = 100 * sqrt(modFactor);
 ai[6] = 1 *((modFactor * modFactor)*sqrt(modFactor)) * 18;
 bi[6] = 0.2 * modFactor;


 for (i = 1; i <= 6; i++)
 {
 ti[i] = ti[i] * (pi / 180.0);
 }
}

void posteriorV2()
{
 int i;
 modFactor = sqrt((float)hmean / 60.0);

 ti[1] = -60 * sqrt(modFactor);
 ai[1] = 0.8 * 18;
 bi[1] = 0.2 * modFactor;
 ti[2] = -15 * modFactor;
 ai[2] = 0.5 * 18;
 bi[2] = 0.1 * modFactor;
 ti[3] = 0;
 ai[3] = 35 * 18;
 bi[3] = 0.1 * modFactor;
 ti[4] = 15 * modFactor;
 ai[4] = -17* 18;
 bi[4] = 0.1 * modFactor;
 ti[5] = 97 * sqrt(modFactor);
 ai[5] = 0.7 * ((modFactor * modFactor)*sqrt(modFactor)) * 18;
 bi[5] = 0.4 / modFactor;
 ti[6] = 100 * sqrt(modFactor);
 ai[6] = 1.04 *((modFactor * modFactor)*sqrt(modFactor)) * 18;
 bi[6] = 0.2 * modFactor;


 for (i = 1; i <= 6; i++)
 {
 ti[i] = ti[i] * (pi / 180.0);
 }
}

void posteriorV3()
{
 int i;
 modFactor = sqrt((float)hmean / 60.0);

 ti[1] = -60 * sqrt(modFactor);
 ai[1] = 0.8 * 18;
 bi[1] = 0.2 * modFactor;
 ti[2] = -15 * modFactor;
 ai[2] = 0.5 * 18;
 bi[2] = 0.1 * modFactor;
 ti[3] = 0;
 ai[3] = 30 * 18;
 bi[3] = 0.1 * modFactor;
 ti[4] = 15 * modFactor;
 ai[4] = -17 * 18;
 bi[4] = 0.1 * modFactor;
 ti[5] = 97 * sqrt(modFactor);
 ai[5] = 0.7 * ((modFactor * modFactor)*sqrt(modFactor)) * 18;
 bi[5] = 0.4 / modFactor;
 ti[6] = 100 * sqrt(modFactor);
 ai[6] = 0.83 *((modFactor * modFactor)*sqrt(modFactor)) * 18;
 bi[6] = 0.2 * modFactor;


 for (i = 1; i <= 6; i++)
 {
 ti[i] = ti[i] * (pi / 180.0);
 }
}

void posteriorV4()
{
 int i;
 modFactor = sqrt((float)hmean / 60.0);

 ti[1] = -60 * sqrt(modFactor);
 ai[1] = 0.8 * 18;
 bi[1] = 0.2 * modFactor;
 ti[2] = -15 * modFactor;
 ai[2] = 0.5 * 18;
 bi[2] = 0.1 * modFactor;
 ti[3] = 0;
 ai[3] = 56.25 * 18;
 bi[3] = 0.1 * modFactor;
 ti[4] = 15 * modFactor;
 ai[4] = 0.5 * 18;
 bi[4] = 0.1 * modFactor;
 ti[5] = 97 * sqrt(modFactor);
 ai[5] = 0.4 * ((modFactor * modFactor)*sqrt(modFactor)) * 18;
 bi[5] = 0.4 / modFactor;
 ti[6] = 100 * sqrt(modFactor);
 ai[6] = 0.5 *((modFactor * modFactor)*sqrt(modFactor)) * 18;
 bi[6] = 0.2 * modFactor;


 for (i = 1; i <= 6; i++)
 {
 ti[i] = ti[i] * (pi / 180.0);
 }
}

void posteriorV5()
{
 int i;
 modFactor = sqrt((float)hmean / 60.0);

 ti[1] = -60 * sqrt(modFactor);
 ai[1] = 0.8 * 18;
 bi[1] = 0.2 * modFactor;
 ti[2] = -15 * modFactor;
 ai[2] = -10 * 18;
 bi[2] = 0.1 * modFactor;
 ti[3] = 0;
 ai[3] = 56.25 * 18;
 bi[3] = 0.1 * modFactor;
 ti[4] = 15 * modFactor;
 ai[4] = 0.5 * 18;
 bi[4] = 0.1 * modFactor;
 ti[5] = 97 * sqrt(modFactor);
 ai[5] = 0.17 * ((modFactor * modFactor)*sqrt(modFactor)) * 18;
 bi[5] = 0.4 / modFactor;
 ti[6] = 100 * sqrt(modFactor);
 ai[6] = 0.25 *((modFactor * modFactor)*sqrt(modFactor)) * 18;
 bi[6] = 0.2 * modFactor;


 for (i = 1; i <= 6; i++)
 {
 ti[i] = ti[i] * (pi / 180.0);
 }
}

void posteriorV6()
{
 int i;
 modFactor = sqrt((float)hmean / 60.0);

 ti[1] = -60 * sqrt(modFactor);
 ai[1] = 0.8 * 18;
 bi[1] = 0.2 * modFactor;
 ti[2] = -15 * modFactor;
 ai[2] = -10 * 18;
 bi[2] = 0.1 * modFactor;
 ti[3] = 0;
 ai[3] = 37.5 * 18;
 bi[3] = 0.1 * modFactor;
 ti[4] = 15 * modFactor;
 ai[4] = 0.5 * 18;
 bi[4] = 0.1 * modFactor;
 ti[5] = 97 * sqrt(modFactor);
 ai[5] = -0.17 * ((modFactor * modFactor)*sqrt(modFactor)) * 18;
 bi[5] = 0.4 / modFactor;
 ti[6] = 100 * sqrt(modFactor);
 ai[6] = -0.25 *((modFactor * modFactor)*sqrt(modFactor)) * 18;
 bi[6] = 0.2 * modFactor;


 for (i = 1; i <= 6; i++)
 {
 ti[i] = ti[i] * (pi / 180.0);
 }
}
#line 1 "d:/its/akademik/ta/12-lead synthetic ecg normal and myocardial infarction/rungekutta.h"

float omega(float input)
{
 int i;
 i = (int)(floor(input / (float)(2.0 * fsecg)));
 return 2 * 3.141592653 / scale_sig[i];
}
float arctan2(float y, float x)
{
 return 2 * (atan(y / (sqrt(pow(x, 2) + pow(y, 2)) + x)));
}
float modul(float input1, float input2)
{
 float result = 0;
 if (fabs(input1) < input2)
 {
 if (input1 < 0)
 {
 result = input1 + input2;
 }
 else if (input1 == 0)
 {
 result = 0;
 }
 else if (input1 > 0)
 {
 result = input1;
 }
 }
 else if (input1 > 0)
 {
 while (input1 > input2)
 {
 input1 = input1 - input2;
 }
 result = input1;
 }
 else if (input1 < 0)
 {
 while (input1 < 0)
 {
 input1 = input1 + input2;
 }
 result = input1;
 }
 return result;
}

float Xdynamical(float t0, float x0, float y0)
{
 float alfa = 1 - sqrt(x0*x0) + (y0*y0);
 return (alfa * x0) - (omega(t0) * y0);
}
float Ydynamical(float t0, float x0, float y0)
{
 float alfa = 1 - sqrt(x0*x0) + (y0*y0);
 return (alfa * y0) + (omega(t0) * x0);
}
float Zdynamical(float t0, float x0, float y0, float z0)
{ float sum = 0.0;
 float sum1;

 float z_0 = 0.1 * sin(6.283185306 * t0 * 0.25);
 float teta = arctan2(y0, x0);
 float delta, sq_delta, sq_b;
 int i;

 for (i = 0; i <= 6; i++)
 {
 delta = modul(teta - ti[i], 6.283185306) - 3.141592653;
 sq_delta = delta * delta;
 sq_b = bi[i] * bi[i];
 sum += (-ai[i] * delta * exp((-0.5 * sq_delta) / (float)(sq_b)));
 }

 sum1 = sum - (z0-z_0);
 return sum1;
}

void rungekutta()
{
 int i = 0;
 float h = 1.0 / (float)(2.0 * fsecg) ;

 x[0] = 0.1;
 y[0] = 0.0;
 z[0] = 0.0;

 for(i = 0; i<(jumlah*2*fsecg) ;i++)
 {
 float num = (float)i / (float)(512.0);
 k1[1][1] = Xdynamical(num, x[i], y[i]);
 k1[1][2] = Ydynamical(num, x[i], y[i]);
 k1[1][3] = Zdynamical(num, x[i], y[i], z[i]);

 k1[2][1] = Xdynamical(num, x[i] + (0.5 * h), (y[i] + 0.5 * k1[1][2] * h));
 k1[2][2] = Ydynamical(num, x[i] + (0.5 * h), (y[i] + 0.5 * k1[1][2] * h));
 k1[2][3] = Zdynamical(num, x[i] + (0.5 * h), (y[i] + 0.5 * k1[1][2] * h), (z[i] + (0.5 * k1[1][3] * h)));

 k1[3][1] = Xdynamical(num, x[i] + (0.5 * h), (y[i] + 0.5 * k1[2][2] * h));
 k1[3][2] = Ydynamical(num, x[i] + (0.5 * h), (y[i] + 0.5 * k1[2][2] * h));
 k1[3][3] = Zdynamical(num, x[i] + (0.5 * h), (y[i] + 0.5 * k1[2][2] * h), (z[i] + (0.5 * k1[2][3] * h)));

 k1[4][1] = Xdynamical(num, (x[i] + h), (y[i] + k1[3][2] * h));
 k1[4][2] = Ydynamical(num, (x[i] + h), (y[i] + k1[3][2] * h));
 k1[4][3] = Zdynamical(num, (x[i] + h), (y[i] + k1[3][2] * h), (z[i] + (k1[3][3] * h)));

 x[i + 1] = x[i] + ((h / 6) * (k1[1][1] + (2 * k1[2][1]) + (2 * k1[3][1]) + k1[4][1]));
 y[i + 1] = y[i] + ((h / 6) * (k1[1][2] + (2 * k1[2][2]) + (2 * k1[3][2]) + k1[4][2]));
 z[i + 1] = z[i] + ((h / 6) * (k1[1][3] + (2 * k1[2][3]) + (2 * k1[3][3]) + k1[4][3]));

 }

}
#line 18 "D:/ITS/AKADEMIK/TA/12-lead Synthetic ECG Normal and Myocardial Infarction/ECGsynthetic_events_code.c"
void InitTimer7(){
 RCC_APB1ENR.TIM7EN = 1;
 TIM7_CR1.CEN = 0;
 TIM7_PSC = 13;
 TIM7_ARR = 46874;
 NVIC_IntEnable(IVT_INT_TIM7);
 TIM7_DIER.UIE = 1;
 TIM7_CR1.CEN = 1;

}

void systemInit()
{
 mikrobus_gpioInit( _MIKROBUS1, _MIKROBUS_CS_PIN, _GPIO_OUTPUT );
 mikrobus_spiInit( _MIKROBUS1, &_DAC_SPI_CFG[0] );
 Delay_100ms();
 mikrobus_uartInit(_MIKROBUS2, &_USB_UART_UART_CFG[0] );
 mikrobus_logInit( _MIKROBUS2, 115200 );
 Delay_ms( 100 );
}

void applicationInit()
{
 dac_spiDriverInit( ( const uint8_t* )&_MIKROBUS1_GPIO, ( const uint8_t* )&_MIKROBUS1_SPI );
 Delay_100ms();
 usb_uart_uartDriverInit( ( const uint8_t* )&_MIKROBUS2_GPIO, ( const uint8_t* )&_MIKROBUS2_UART );
 mikrobus_logWrite( "Initialized", _LOG_LINE );
 Delay_ms( 100 );
 InitTimer7();

}

void bingkai(int X1, int Y1, int X2, int Y2)
{
 TFT_Set_Pen(CL_RED, 3);
 TFT_Set_Brush(1,CL_BLACK,0,LEFT_TO_RIGHT,CL_WHITE,CL_WHITE);
 TFT_Rectangle(X1,Y1,X2,Y2);

}





void ButtonRound3OnClick() {
 buttonFlag = !buttonFlag;

 if(!buttonFlag){
 ButtonRound3.Caption = "RUN";
 ButtonRound3.Color = CL_LIME;

 }
 else{
 ButtonRound3.Caption = "STOP";
 ButtonRound3.Color = CL_RED;
 }
 DrawRoundButton(&ButtonRound3);
}

void ButtonRound5OnClick() {
 buttonFlag = !buttonFlag;

 if(!buttonFlag){
 ButtonRound5.Caption = "RUN";
 ButtonRound5.Color = CL_LIME;

 }
 else{
 ButtonRound5.Caption = "STOP";
 ButtonRound5.Color = CL_RED;
 }
 DrawRoundButton(&ButtonRound5);
}

void ButtonRound7OnClick() {
 buttonFlag = !buttonFlag;

 if(!buttonFlag){
 ButtonRound7.Caption = "RUN";
 ButtonRound7.Color = CL_LIME;

 }
 else{
 ButtonRound7.Caption = "STOP";
 ButtonRound7.Color = CL_RED;
 }
 DrawRoundButton(&ButtonRound7);
}

void ButtonRound9OnClick() {
 buttonFlag = !buttonFlag;

 if(!buttonFlag){
 ButtonRound9.Caption = "RUN";
 ButtonRound9.Color = CL_LIME;

 }
 else{
 ButtonRound9.Caption = "STOP";
 ButtonRound9.Color = CL_RED;
 }
 DrawRoundButton(&ButtonRound9);
}


void ButtonRound11OnClick() {
 buttonFlag = !buttonFlag;

 if(!buttonFlag){
 ButtonRound11.Caption = "RUN";
 ButtonRound11.Color = CL_LIME;

 }
 else{
 ButtonRound11.Caption = "STOP";
 ButtonRound11.Color = CL_RED;
 }
 DrawRoundButton(&ButtonRound11);
}

void ButtonRound13OnClick() {
 buttonFlag = !buttonFlag;

 if(!buttonFlag){
 ButtonRound13.Caption = "RUN";
 ButtonRound13.Color = CL_LIME;

 }
 else{
 ButtonRound13.Caption = "STOP";
 ButtonRound13.Color = CL_RED;
 }
 DrawRoundButton(&ButtonRound13);
}

void ClearRect(int x1, int y1, int x2, int y2)
{
 TFT_Set_Pen(CL_BLACK, 1);
 TFT_Set_Brush(1, CL_BLACK, 0, TOP_TO_BOTTOM, CL_BLACK, CL_BLACK);
 TFT_Rectangle(x1,y1,x2,y2);
}

void ButtonRound36OnClick()
{
 hmean+=10;
 IntToStr(hmean,Label19_Caption);
 ClearRect(559,380,673,433);
 TFT_Set_Font(Tahoma19x23_Regular,CL_WHITE,FO_HORIZONTAL);
 TFT_Write_Text(Label19_Caption,590,395);
 DrawRoundButton(&ButtonRound36);
 ButtonRound36.Caption = ">";
}
void ButtonRound37OnClick() {
 hmean-=10;
 IntToStr(hmean,Label19_Caption);
 ClearRect(559,380,673,433);
 TFT_Set_Font(Tahoma19x23_Regular,CL_WHITE,FO_HORIZONTAL);
 TFT_Write_Text(Label19_Caption,590,395);
 DrawRoundButton(&ButtonRound37);
 ButtonRound37.Caption = "<";
}
void ButtonRound1OnClick() {
 DrawScreen(&Screen2);
}

float findMin(float array[], int sizearray)
{
 float min = array[0];

 for (i = 0; i < sizearray; i++) {
 if (array[i] < min) {
 min = array[i];
 }
 }
 return min;
}

float findMax(float array[], int sizearray)
{
 float max = array[0];

 for (i = 0; i < sizearray; i++) {
 if (array[i] > max) {
 max = array[i];
 }
 }
 return max;
}

void sinyal(){
#line 214 "D:/ITS/AKADEMIK/TA/12-lead Synthetic ECG Normal and Myocardial Infarction/ECGsynthetic_events_code.c"
 if(i%513==0){
 i=0;

 DrawImage(&Image3);
 }
#line 225 "D:/ITS/AKADEMIK/TA/12-lead Synthetic ECG Normal and Myocardial Infarction/ECGsynthetic_events_code.c"
 TFT_Set_Pen(CL_RED,3);
 TFT_Line(227+((i%513)-1),250-(100*z[i-1]),(227+(i%513)),250-100*z[i]);




 FloatToStr(z[i],text);
 mikrobus_logWrite(text, _LOG_LINE);


 dac_value[i]= (int)(output[i]*(scale));
 dac_setOutVoltage( dac_value[i] );
 Delay_ms(1);

 i++;

}

void applicationTaskDAC(){

 step1();
 rungekutta();

 minValue = findMin(z, 513);

 for (i = 0; i < 513 ; i ++)
 {
 output[i] = (z[i]-(minValue));
 }

 maxValue = findMax(output, 513);
 scale = (int)(4095/maxValue);

}

void Timer7_interrupt() iv IVT_INT_TIM7 {
 TIM7_SR.UIF = 0;

 Check_TP();

 if(buttonFlag){
 sinyal();
 }

}

void ButtonRound4OnClick() {
 i = 0;
 DrawScreen(&Screen1);
 RadioButton3.Checked = 0;
 RadioButton4.Checked = 0;
 RadioButton5.Checked = 0;
 RadioButton6.Checked = 0;
 RadioButton7.Checked = 0;
 RadioButton8.Checked = 0;
 RadioButton9.Checked = 0;
 RadioButton10.Checked = 0;
 RadioButton11.Checked = 0;
 RadioButton12.Checked = 0;
 RadioButton13.Checked = 0;
 RadioButton14.Checked = 0;
}



void RadioButton3OnPress() {
 normal1();
 applicationTaskDAC();
 RadioButton4.Checked = 0;
 RadioButton5.Checked = 0;
 RadioButton6.Checked = 0;
 RadioButton7.Checked = 0;
 RadioButton8.Checked = 0;
 RadioButton9.Checked = 0;
 RadioButton10.Checked = 0;
 RadioButton11.Checked = 0;
 RadioButton12.Checked = 0;
 RadioButton13.Checked = 0;
 RadioButton14.Checked = 0;
 DrawRadioButton(&RadioButton4);
 DrawRadioButton(&RadioButton5);
 DrawRadioButton(&RadioButton6);
 DrawRadioButton(&RadioButton7);
 DrawRadioButton(&RadioButton8);
 DrawRadioButton(&RadioButton9);
 DrawRadioButton(&RadioButton10);
 DrawRadioButton(&RadioButton11);
 DrawRadioButton(&RadioButton12);
 DrawRadioButton(&RadioButton13);
 DrawRadioButton(&RadioButton14);
}

void RadioButton4OnPress() {
 normal2();
 applicationTaskDAC();
 RadioButton3.Checked = 0;
 RadioButton5.Checked = 0;
 RadioButton6.Checked = 0;
 RadioButton7.Checked = 0;
 RadioButton8.Checked = 0;
 RadioButton9.Checked = 0;
 RadioButton10.Checked = 0;
 RadioButton11.Checked = 0;
 RadioButton12.Checked = 0;
 RadioButton13.Checked = 0;
 RadioButton14.Checked = 0;
 DrawRadioButton(&RadioButton3);
 DrawRadioButton(&RadioButton5);
 DrawRadioButton(&RadioButton6);
 DrawRadioButton(&RadioButton7);
 DrawRadioButton(&RadioButton8);
 DrawRadioButton(&RadioButton9);
 DrawRadioButton(&RadioButton10);
 DrawRadioButton(&RadioButton11);
 DrawRadioButton(&RadioButton12);
 DrawRadioButton(&RadioButton13);
 DrawRadioButton(&RadioButton14);
}

void RadioButton5OnPress() {
 normal3();
 applicationTaskDAC();
 RadioButton4.Checked = 0;
 RadioButton3.Checked = 0;
 RadioButton6.Checked = 0;
 RadioButton7.Checked = 0;
 RadioButton8.Checked = 0;
 RadioButton9.Checked = 0;
 RadioButton10.Checked = 0;
 RadioButton11.Checked = 0;
 RadioButton12.Checked = 0;
 RadioButton13.Checked = 0;
 RadioButton14.Checked = 0;
 DrawRadioButton(&RadioButton4);
 DrawRadioButton(&RadioButton3);
 DrawRadioButton(&RadioButton6);
 DrawRadioButton(&RadioButton7);
 DrawRadioButton(&RadioButton8);
 DrawRadioButton(&RadioButton9);
 DrawRadioButton(&RadioButton10);
 DrawRadioButton(&RadioButton11);
 DrawRadioButton(&RadioButton12);
 DrawRadioButton(&RadioButton13);
 DrawRadioButton(&RadioButton14);

}

void RadioButton6OnPress() {
 normalavr();
 applicationTaskDAC();
 RadioButton4.Checked = 0;
 RadioButton5.Checked = 0;
 RadioButton3.Checked = 0;
 RadioButton7.Checked = 0;
 RadioButton8.Checked = 0;
 RadioButton9.Checked = 0;
 RadioButton10.Checked = 0;
 RadioButton11.Checked = 0;
 RadioButton12.Checked = 0;
 RadioButton13.Checked = 0;
 RadioButton14.Checked = 0;
 DrawRadioButton(&RadioButton4);
 DrawRadioButton(&RadioButton5);
 DrawRadioButton(&RadioButton3);
 DrawRadioButton(&RadioButton7);
 DrawRadioButton(&RadioButton8);
 DrawRadioButton(&RadioButton9);
 DrawRadioButton(&RadioButton10);
 DrawRadioButton(&RadioButton11);
 DrawRadioButton(&RadioButton12);
 DrawRadioButton(&RadioButton13);
 DrawRadioButton(&RadioButton14);

}

void RadioButton7OnPress() {
 normalavl();
 applicationTaskDAC();
 RadioButton4.Checked = 0;
 RadioButton5.Checked = 0;
 RadioButton6.Checked = 0;
 RadioButton3.Checked = 0;
 RadioButton8.Checked = 0;
 RadioButton9.Checked = 0;
 RadioButton10.Checked = 0;
 RadioButton11.Checked = 0;
 RadioButton12.Checked = 0;
 RadioButton13.Checked = 0;
 RadioButton14.Checked = 0;
 DrawRadioButton(&RadioButton4);
 DrawRadioButton(&RadioButton5);
 DrawRadioButton(&RadioButton6);
 DrawRadioButton(&RadioButton3);
 DrawRadioButton(&RadioButton8);
 DrawRadioButton(&RadioButton9);
 DrawRadioButton(&RadioButton10);
 DrawRadioButton(&RadioButton11);
 DrawRadioButton(&RadioButton12);
 DrawRadioButton(&RadioButton13);
 DrawRadioButton(&RadioButton14);
}

void RadioButton8OnPress() {
 normalavf();
 applicationTaskDAC();
 RadioButton4.Checked = 0;
 RadioButton5.Checked = 0;
 RadioButton6.Checked = 0;
 RadioButton7.Checked = 0;
 RadioButton3.Checked = 0;
 RadioButton9.Checked = 0;
 RadioButton10.Checked = 0;
 RadioButton11.Checked = 0;
 RadioButton12.Checked = 0;
 RadioButton13.Checked = 0;
 RadioButton14.Checked = 0;
 DrawRadioButton(&RadioButton4);
 DrawRadioButton(&RadioButton5);
 DrawRadioButton(&RadioButton6);
 DrawRadioButton(&RadioButton7);
 DrawRadioButton(&RadioButton3);
 DrawRadioButton(&RadioButton9);
 DrawRadioButton(&RadioButton10);
 DrawRadioButton(&RadioButton11);
 DrawRadioButton(&RadioButton12);
 DrawRadioButton(&RadioButton13);
 DrawRadioButton(&RadioButton14);
}

void RadioButton9OnPress() {
 normalv1();
 applicationTaskDAC();
 RadioButton4.Checked = 0;
 RadioButton5.Checked = 0;
 RadioButton6.Checked = 0;
 RadioButton7.Checked = 0;
 RadioButton8.Checked = 0;
 RadioButton3.Checked = 0;
 RadioButton10.Checked = 0;
 RadioButton11.Checked = 0;
 RadioButton12.Checked = 0;
 RadioButton13.Checked = 0;
 RadioButton14.Checked = 0;
 DrawRadioButton(&RadioButton4);
 DrawRadioButton(&RadioButton5);
 DrawRadioButton(&RadioButton6);
 DrawRadioButton(&RadioButton7);
 DrawRadioButton(&RadioButton8);
 DrawRadioButton(&RadioButton3);
 DrawRadioButton(&RadioButton10);
 DrawRadioButton(&RadioButton11);
 DrawRadioButton(&RadioButton12);
 DrawRadioButton(&RadioButton13);
 DrawRadioButton(&RadioButton14);
}

void RadioButton10OnPress() {
 normalv2();
 applicationTaskDAC();
 RadioButton4.Checked = 0;
 RadioButton5.Checked = 0;
 RadioButton6.Checked = 0;
 RadioButton7.Checked = 0;
 RadioButton8.Checked = 0;
 RadioButton9.Checked = 0;
 RadioButton3.Checked = 0;
 RadioButton11.Checked = 0;
 RadioButton12.Checked = 0;
 RadioButton13.Checked = 0;
 RadioButton14.Checked = 0;
 DrawRadioButton(&RadioButton4);
 DrawRadioButton(&RadioButton5);
 DrawRadioButton(&RadioButton6);
 DrawRadioButton(&RadioButton7);
 DrawRadioButton(&RadioButton8);
 DrawRadioButton(&RadioButton9);
 DrawRadioButton(&RadioButton3);
 DrawRadioButton(&RadioButton11);
 DrawRadioButton(&RadioButton12);
 DrawRadioButton(&RadioButton13);
 DrawRadioButton(&RadioButton14);
}

void RadioButton11OnPress() {
 normalv3();
 applicationTaskDAC();
 RadioButton4.Checked = 0;
 RadioButton5.Checked = 0;
 RadioButton6.Checked = 0;
 RadioButton7.Checked = 0;
 RadioButton8.Checked = 0;
 RadioButton9.Checked = 0;
 RadioButton10.Checked = 0;
 RadioButton3.Checked = 0;
 RadioButton12.Checked = 0;
 RadioButton13.Checked = 0;
 RadioButton14.Checked = 0;
 DrawRadioButton(&RadioButton4);
 DrawRadioButton(&RadioButton5);
 DrawRadioButton(&RadioButton6);
 DrawRadioButton(&RadioButton7);
 DrawRadioButton(&RadioButton8);
 DrawRadioButton(&RadioButton9);
 DrawRadioButton(&RadioButton10);
 DrawRadioButton(&RadioButton3);
 DrawRadioButton(&RadioButton12);
 DrawRadioButton(&RadioButton13);
 DrawRadioButton(&RadioButton14);
}

void RadioButton12OnPress() {
 normalv4();
 applicationTaskDAC();
 RadioButton4.Checked = 0;
 RadioButton5.Checked = 0;
 RadioButton6.Checked = 0;
 RadioButton7.Checked = 0;
 RadioButton8.Checked = 0;
 RadioButton9.Checked = 0;
 RadioButton10.Checked = 0;
 RadioButton11.Checked = 0;
 RadioButton3.Checked = 0;
 RadioButton13.Checked = 0;
 RadioButton14.Checked = 0;
 DrawRadioButton(&RadioButton4);
 DrawRadioButton(&RadioButton5);
 DrawRadioButton(&RadioButton6);
 DrawRadioButton(&RadioButton7);
 DrawRadioButton(&RadioButton8);
 DrawRadioButton(&RadioButton9);
 DrawRadioButton(&RadioButton10);
 DrawRadioButton(&RadioButton11);
 DrawRadioButton(&RadioButton3);
 DrawRadioButton(&RadioButton13);
 DrawRadioButton(&RadioButton14);
}

void RadioButton13OnPress() {
 normalv5();
 applicationTaskDAC();
 RadioButton4.Checked = 0;
 RadioButton5.Checked = 0;
 RadioButton6.Checked = 0;
 RadioButton7.Checked = 0;
 RadioButton8.Checked = 0;
 RadioButton9.Checked = 0;
 RadioButton10.Checked = 0;
 RadioButton11.Checked = 0;
 RadioButton12.Checked = 0;
 RadioButton3.Checked = 0;
 RadioButton14.Checked = 0;
 DrawRadioButton(&RadioButton4);
 DrawRadioButton(&RadioButton5);
 DrawRadioButton(&RadioButton6);
 DrawRadioButton(&RadioButton7);
 DrawRadioButton(&RadioButton8);
 DrawRadioButton(&RadioButton9);
 DrawRadioButton(&RadioButton10);
 DrawRadioButton(&RadioButton11);
 DrawRadioButton(&RadioButton12);
 DrawRadioButton(&RadioButton3);
 DrawRadioButton(&RadioButton14);

}

void RadioButton14OnPress() {
 normalv6();
 applicationTaskDAC();
 RadioButton4.Checked = 0;
 RadioButton5.Checked = 0;
 RadioButton6.Checked = 0;
 RadioButton7.Checked = 0;
 RadioButton8.Checked = 0;
 RadioButton9.Checked = 0;
 RadioButton10.Checked = 0;
 RadioButton11.Checked = 0;
 RadioButton12.Checked = 0;
 RadioButton13.Checked = 0;
 RadioButton3.Checked = 0;
 DrawRadioButton(&RadioButton4);
 DrawRadioButton(&RadioButton5);
 DrawRadioButton(&RadioButton6);
 DrawRadioButton(&RadioButton7);
 DrawRadioButton(&RadioButton8);
 DrawRadioButton(&RadioButton9);
 DrawRadioButton(&RadioButton10);
 DrawRadioButton(&RadioButton11);
 DrawRadioButton(&RadioButton12);
 DrawRadioButton(&RadioButton13);
 DrawRadioButton(&RadioButton3);
}



void RadioButton1OnPress() {
 anterior1();
 applicationTaskDAC();
 RadioButton2.Checked = 0;
 RadioButton15.Checked = 0;
 RadioButton16.Checked = 0;
 RadioButton17.Checked = 0;
 RadioButton18.Checked = 0;
 RadioButton19.Checked = 0;
 RadioButton20.Checked = 0;
 RadioButton21.Checked = 0;
 RadioButton22.Checked = 0;
 RadioButton23.Checked = 0;
 RadioButton24.Checked = 0;
 DrawRadioButton(&RadioButton2);
 DrawRadioButton(&RadioButton15);
 DrawRadioButton(&RadioButton16);
 DrawRadioButton(&RadioButton17);
 DrawRadioButton(&RadioButton18);
 DrawRadioButton(&RadioButton19);
 DrawRadioButton(&RadioButton20);
 DrawRadioButton(&RadioButton21);
 DrawRadioButton(&RadioButton22);
 DrawRadioButton(&RadioButton23);
 DrawRadioButton(&RadioButton24);

}

void RadioButton2OnPress() {
 anterior2();
 applicationTaskDAC();
 RadioButton1.Checked = 0;
 RadioButton15.Checked = 0;
 RadioButton16.Checked = 0;
 RadioButton17.Checked = 0;
 RadioButton18.Checked = 0;
 RadioButton19.Checked = 0;
 RadioButton20.Checked = 0;
 RadioButton21.Checked = 0;
 RadioButton22.Checked = 0;
 RadioButton23.Checked = 0;
 RadioButton24.Checked = 0;
 DrawRadioButton(&RadioButton1);
 DrawRadioButton(&RadioButton15);
 DrawRadioButton(&RadioButton16);
 DrawRadioButton(&RadioButton17);
 DrawRadioButton(&RadioButton18);
 DrawRadioButton(&RadioButton19);
 DrawRadioButton(&RadioButton20);
 DrawRadioButton(&RadioButton21);
 DrawRadioButton(&RadioButton22);
 DrawRadioButton(&RadioButton23);
 DrawRadioButton(&RadioButton24);

}

void RadioButton15OnPress() {
 anterior3();
 applicationTaskDAC();
 RadioButton2.Checked = 0;
 RadioButton1.Checked = 0;
 RadioButton16.Checked = 0;
 RadioButton17.Checked = 0;
 RadioButton18.Checked = 0;
 RadioButton19.Checked = 0;
 RadioButton20.Checked = 0;
 RadioButton21.Checked = 0;
 RadioButton22.Checked = 0;
 RadioButton23.Checked = 0;
 RadioButton24.Checked = 0;
 DrawRadioButton(&RadioButton2);
 DrawRadioButton(&RadioButton1);
 DrawRadioButton(&RadioButton16);
 DrawRadioButton(&RadioButton17);
 DrawRadioButton(&RadioButton18);
 DrawRadioButton(&RadioButton19);
 DrawRadioButton(&RadioButton20);
 DrawRadioButton(&RadioButton21);
 DrawRadioButton(&RadioButton22);
 DrawRadioButton(&RadioButton23);
 DrawRadioButton(&RadioButton24);

}

void RadioButton16OnPress() {
 anterioravr();
 applicationTaskDAC();
 RadioButton2.Checked = 0;
 RadioButton15.Checked = 0;
 RadioButton1.Checked = 0;
 RadioButton17.Checked = 0;
 RadioButton18.Checked = 0;
 RadioButton19.Checked = 0;
 RadioButton20.Checked = 0;
 RadioButton21.Checked = 0;
 RadioButton22.Checked = 0;
 RadioButton23.Checked = 0;
 RadioButton24.Checked = 0;
 DrawRadioButton(&RadioButton2);
 DrawRadioButton(&RadioButton15);
 DrawRadioButton(&RadioButton1);
 DrawRadioButton(&RadioButton17);
 DrawRadioButton(&RadioButton18);
 DrawRadioButton(&RadioButton19);
 DrawRadioButton(&RadioButton20);
 DrawRadioButton(&RadioButton21);
 DrawRadioButton(&RadioButton22);
 DrawRadioButton(&RadioButton23);
 DrawRadioButton(&RadioButton24);
}

void RadioButton17OnPress() {
 anterioravl();
 applicationTaskDAC();
 RadioButton2.Checked = 0;
 RadioButton15.Checked = 0;
 RadioButton16.Checked = 0;
 RadioButton1.Checked = 0;
 RadioButton18.Checked = 0;
 RadioButton19.Checked = 0;
 RadioButton20.Checked = 0;
 RadioButton21.Checked = 0;
 RadioButton22.Checked = 0;
 RadioButton23.Checked = 0;
 RadioButton24.Checked = 0;
 DrawRadioButton(&RadioButton2);
 DrawRadioButton(&RadioButton15);
 DrawRadioButton(&RadioButton16);
 DrawRadioButton(&RadioButton1);
 DrawRadioButton(&RadioButton18);
 DrawRadioButton(&RadioButton19);
 DrawRadioButton(&RadioButton20);
 DrawRadioButton(&RadioButton21);
 DrawRadioButton(&RadioButton22);
 DrawRadioButton(&RadioButton23);
 DrawRadioButton(&RadioButton24);
}

void RadioButton18OnPress() {
 anterioravf();
 applicationTaskDAC();
 RadioButton2.Checked = 0;
 RadioButton15.Checked = 0;
 RadioButton16.Checked = 0;
 RadioButton17.Checked = 0;
 RadioButton1.Checked = 0;
 RadioButton19.Checked = 0;
 RadioButton20.Checked = 0;
 RadioButton21.Checked = 0;
 RadioButton22.Checked = 0;
 RadioButton23.Checked = 0;
 RadioButton24.Checked = 0;
 DrawRadioButton(&RadioButton2);
 DrawRadioButton(&RadioButton15);
 DrawRadioButton(&RadioButton16);
 DrawRadioButton(&RadioButton17);
 DrawRadioButton(&RadioButton1);
 DrawRadioButton(&RadioButton19);
 DrawRadioButton(&RadioButton20);
 DrawRadioButton(&RadioButton21);
 DrawRadioButton(&RadioButton22);
 DrawRadioButton(&RadioButton23);
 DrawRadioButton(&RadioButton24);
}

void RadioButton19OnPress() {
 anteriorv1();
 applicationTaskDAC();
 RadioButton2.Checked = 0;
 RadioButton15.Checked = 0;
 RadioButton16.Checked = 0;
 RadioButton17.Checked = 0;
 RadioButton18.Checked = 0;
 RadioButton1.Checked = 0;
 RadioButton20.Checked = 0;
 RadioButton21.Checked = 0;
 RadioButton22.Checked = 0;
 RadioButton23.Checked = 0;
 RadioButton24.Checked = 0;
 DrawRadioButton(&RadioButton2);
 DrawRadioButton(&RadioButton15);
 DrawRadioButton(&RadioButton16);
 DrawRadioButton(&RadioButton17);
 DrawRadioButton(&RadioButton18);
 DrawRadioButton(&RadioButton1);
 DrawRadioButton(&RadioButton20);
 DrawRadioButton(&RadioButton21);
 DrawRadioButton(&RadioButton22);
 DrawRadioButton(&RadioButton23);
 DrawRadioButton(&RadioButton24);
}

void RadioButton20OnPress() {
 anteriorv2();
 applicationTaskDAC();
 RadioButton2.Checked = 0;
 RadioButton15.Checked = 0;
 RadioButton16.Checked = 0;
 RadioButton17.Checked = 0;
 RadioButton18.Checked = 0;
 RadioButton19.Checked = 0;
 RadioButton1.Checked = 0;
 RadioButton21.Checked = 0;
 RadioButton22.Checked = 0;
 RadioButton23.Checked = 0;
 RadioButton24.Checked = 0;
 DrawRadioButton(&RadioButton2);
 DrawRadioButton(&RadioButton15);
 DrawRadioButton(&RadioButton16);
 DrawRadioButton(&RadioButton17);
 DrawRadioButton(&RadioButton18);
 DrawRadioButton(&RadioButton19);
 DrawRadioButton(&RadioButton1);
 DrawRadioButton(&RadioButton21);
 DrawRadioButton(&RadioButton22);
 DrawRadioButton(&RadioButton23);
 DrawRadioButton(&RadioButton24);
}

void RadioButton21OnPress() {
 anteriorv3();
 applicationTaskDAC();
 RadioButton2.Checked = 0;
 RadioButton15.Checked = 0;
 RadioButton16.Checked = 0;
 RadioButton17.Checked = 0;
 RadioButton18.Checked = 0;
 RadioButton19.Checked = 0;
 RadioButton20.Checked = 0;
 RadioButton1.Checked = 0;
 RadioButton22.Checked = 0;
 RadioButton23.Checked = 0;
 RadioButton24.Checked = 0;
 DrawRadioButton(&RadioButton2);
 DrawRadioButton(&RadioButton15);
 DrawRadioButton(&RadioButton16);
 DrawRadioButton(&RadioButton17);
 DrawRadioButton(&RadioButton18);
 DrawRadioButton(&RadioButton19);
 DrawRadioButton(&RadioButton20);
 DrawRadioButton(&RadioButton1);
 DrawRadioButton(&RadioButton22);
 DrawRadioButton(&RadioButton23);
 DrawRadioButton(&RadioButton24);
}

void RadioButton22OnPress() {
 anteriorv4();
 applicationTaskDAC();
 RadioButton2.Checked = 0;
 RadioButton15.Checked = 0;
 RadioButton16.Checked = 0;
 RadioButton17.Checked = 0;
 RadioButton18.Checked = 0;
 RadioButton19.Checked = 0;
 RadioButton20.Checked = 0;
 RadioButton21.Checked = 0;
 RadioButton1.Checked = 0;
 RadioButton23.Checked = 0;
 RadioButton24.Checked = 0;
 DrawRadioButton(&RadioButton2);
 DrawRadioButton(&RadioButton15);
 DrawRadioButton(&RadioButton16);
 DrawRadioButton(&RadioButton17);
 DrawRadioButton(&RadioButton18);
 DrawRadioButton(&RadioButton19);
 DrawRadioButton(&RadioButton20);
 DrawRadioButton(&RadioButton21);
 DrawRadioButton(&RadioButton1);
 DrawRadioButton(&RadioButton23);
 DrawRadioButton(&RadioButton24);
}

void RadioButton23OnPress() {
 anteriorv5();
 applicationTaskDAC();
 RadioButton2.Checked = 0;
 RadioButton15.Checked = 0;
 RadioButton16.Checked = 0;
 RadioButton17.Checked = 0;
 RadioButton18.Checked = 0;
 RadioButton19.Checked = 0;
 RadioButton20.Checked = 0;
 RadioButton21.Checked = 0;
 RadioButton22.Checked = 0;
 RadioButton1.Checked = 0;
 RadioButton24.Checked = 0;
 DrawRadioButton(&RadioButton2);
 DrawRadioButton(&RadioButton15);
 DrawRadioButton(&RadioButton16);
 DrawRadioButton(&RadioButton17);
 DrawRadioButton(&RadioButton18);
 DrawRadioButton(&RadioButton19);
 DrawRadioButton(&RadioButton20);
 DrawRadioButton(&RadioButton21);
 DrawRadioButton(&RadioButton22);
 DrawRadioButton(&RadioButton1);
 DrawRadioButton(&RadioButton24);

}

void RadioButton24OnPress() {
 anteriorv6();
 applicationTaskDAC();
 RadioButton2.Checked = 0;
 RadioButton15.Checked = 0;
 RadioButton16.Checked = 0;
 RadioButton17.Checked = 0;
 RadioButton18.Checked = 0;
 RadioButton19.Checked = 0;
 RadioButton20.Checked = 0;
 RadioButton21.Checked = 0;
 RadioButton22.Checked = 0;
 RadioButton23.Checked = 0;
 RadioButton1.Checked = 0;
 DrawRadioButton(&RadioButton2);
 DrawRadioButton(&RadioButton15);
 DrawRadioButton(&RadioButton16);
 DrawRadioButton(&RadioButton17);
 DrawRadioButton(&RadioButton18);
 DrawRadioButton(&RadioButton19);
 DrawRadioButton(&RadioButton20);
 DrawRadioButton(&RadioButton21);
 DrawRadioButton(&RadioButton22);
 DrawRadioButton(&RadioButton23);
 DrawRadioButton(&RadioButton1);

}


void RadioButton25OnPress() {
 inferior1();
 applicationTaskDAC();
 RadioButton26.Checked = 0;
 RadioButton27.Checked = 0;
 RadioButton28.Checked = 0;
 RadioButton29.Checked = 0;
 RadioButton30.Checked = 0;
 RadioButton31.Checked = 0;
 RadioButton32.Checked = 0;
 RadioButton33.Checked = 0;
 RadioButton34.Checked = 0;
 RadioButton35.Checked = 0;
 RadioButton36.Checked = 0;
 DrawRadioButton(&RadioButton26);
 DrawRadioButton(&RadioButton27);
 DrawRadioButton(&RadioButton28);
 DrawRadioButton(&RadioButton29);
 DrawRadioButton(&RadioButton30);
 DrawRadioButton(&RadioButton31);
 DrawRadioButton(&RadioButton32);
 DrawRadioButton(&RadioButton33);
 DrawRadioButton(&RadioButton34);
 DrawRadioButton(&RadioButton35);
 DrawRadioButton(&RadioButton36);

}

void RadioButton26OnPress() {
 inferior2();
 applicationTaskDAC();
 RadioButton25.Checked = 0;
 RadioButton27.Checked = 0;
 RadioButton28.Checked = 0;
 RadioButton29.Checked = 0;
 RadioButton30.Checked = 0;
 RadioButton31.Checked = 0;
 RadioButton32.Checked = 0;
 RadioButton33.Checked = 0;
 RadioButton34.Checked = 0;
 RadioButton35.Checked = 0;
 RadioButton36.Checked = 0;
 DrawRadioButton(&RadioButton25);
 DrawRadioButton(&RadioButton27);
 DrawRadioButton(&RadioButton28);
 DrawRadioButton(&RadioButton29);
 DrawRadioButton(&RadioButton30);
 DrawRadioButton(&RadioButton31);
 DrawRadioButton(&RadioButton32);
 DrawRadioButton(&RadioButton33);
 DrawRadioButton(&RadioButton34);
 DrawRadioButton(&RadioButton35);
 DrawRadioButton(&RadioButton36);

}

void RadioButton27OnPress() {
 inferior3();
 applicationTaskDAC();
 RadioButton26.Checked = 0;
 RadioButton25.Checked = 0;
 RadioButton28.Checked = 0;
 RadioButton29.Checked = 0;
 RadioButton30.Checked = 0;
 RadioButton31.Checked = 0;
 RadioButton32.Checked = 0;
 RadioButton33.Checked = 0;
 RadioButton34.Checked = 0;
 RadioButton35.Checked = 0;
 RadioButton36.Checked = 0;
 DrawRadioButton(&RadioButton26);
 DrawRadioButton(&RadioButton25);
 DrawRadioButton(&RadioButton28);
 DrawRadioButton(&RadioButton29);
 DrawRadioButton(&RadioButton30);
 DrawRadioButton(&RadioButton31);
 DrawRadioButton(&RadioButton32);
 DrawRadioButton(&RadioButton33);
 DrawRadioButton(&RadioButton34);
 DrawRadioButton(&RadioButton35);
 DrawRadioButton(&RadioButton36);

}

void RadioButton28OnPress() {
 inferioravr();
 applicationTaskDAC();
 RadioButton26.Checked = 0;
 RadioButton27.Checked = 0;
 RadioButton25.Checked = 0;
 RadioButton29.Checked = 0;
 RadioButton30.Checked = 0;
 RadioButton31.Checked = 0;
 RadioButton32.Checked = 0;
 RadioButton33.Checked = 0;
 RadioButton34.Checked = 0;
 RadioButton35.Checked = 0;
 RadioButton36.Checked = 0;
 DrawRadioButton(&RadioButton26);
 DrawRadioButton(&RadioButton27);
 DrawRadioButton(&RadioButton25);
 DrawRadioButton(&RadioButton29);
 DrawRadioButton(&RadioButton30);
 DrawRadioButton(&RadioButton31);
 DrawRadioButton(&RadioButton32);
 DrawRadioButton(&RadioButton33);
 DrawRadioButton(&RadioButton34);
 DrawRadioButton(&RadioButton35);
 DrawRadioButton(&RadioButton36);

}

void RadioButton29OnPress() {
 inferioravl();
 applicationTaskDAC();
 RadioButton26.Checked = 0;
 RadioButton27.Checked = 0;
 RadioButton28.Checked = 0;
 RadioButton25.Checked = 0;
 RadioButton30.Checked = 0;
 RadioButton31.Checked = 0;
 RadioButton32.Checked = 0;
 RadioButton33.Checked = 0;
 RadioButton34.Checked = 0;
 RadioButton35.Checked = 0;
 RadioButton36.Checked = 0;
 DrawRadioButton(&RadioButton26);
 DrawRadioButton(&RadioButton27);
 DrawRadioButton(&RadioButton28);
 DrawRadioButton(&RadioButton25);
 DrawRadioButton(&RadioButton30);
 DrawRadioButton(&RadioButton31);
 DrawRadioButton(&RadioButton32);
 DrawRadioButton(&RadioButton33);
 DrawRadioButton(&RadioButton34);
 DrawRadioButton(&RadioButton35);
 DrawRadioButton(&RadioButton36);

}

void RadioButton30OnPress() {
 inferioravf();
 applicationTaskDAC();
 RadioButton26.Checked = 0;
 RadioButton27.Checked = 0;
 RadioButton28.Checked = 0;
 RadioButton29.Checked = 0;
 RadioButton25.Checked = 0;
 RadioButton31.Checked = 0;
 RadioButton32.Checked = 0;
 RadioButton33.Checked = 0;
 RadioButton34.Checked = 0;
 RadioButton35.Checked = 0;
 RadioButton36.Checked = 0;
 DrawRadioButton(&RadioButton26);
 DrawRadioButton(&RadioButton27);
 DrawRadioButton(&RadioButton28);
 DrawRadioButton(&RadioButton29);
 DrawRadioButton(&RadioButton25);
 DrawRadioButton(&RadioButton31);
 DrawRadioButton(&RadioButton32);
 DrawRadioButton(&RadioButton33);
 DrawRadioButton(&RadioButton34);
 DrawRadioButton(&RadioButton35);
 DrawRadioButton(&RadioButton36);
}

void RadioButton31OnPress() {
 inferiorv1();
 applicationTaskDAC();
 RadioButton26.Checked = 0;
 RadioButton27.Checked = 0;
 RadioButton28.Checked = 0;
 RadioButton29.Checked = 0;
 RadioButton30.Checked = 0;
 RadioButton25.Checked = 0;
 RadioButton32.Checked = 0;
 RadioButton33.Checked = 0;
 RadioButton34.Checked = 0;
 RadioButton35.Checked = 0;
 RadioButton36.Checked = 0;
 DrawRadioButton(&RadioButton26);
 DrawRadioButton(&RadioButton27);
 DrawRadioButton(&RadioButton28);
 DrawRadioButton(&RadioButton29);
 DrawRadioButton(&RadioButton30);
 DrawRadioButton(&RadioButton25);
 DrawRadioButton(&RadioButton32);
 DrawRadioButton(&RadioButton33);
 DrawRadioButton(&RadioButton34);
 DrawRadioButton(&RadioButton35);
 DrawRadioButton(&RadioButton36);

}

void RadioButton32OnPress() {
 inferiorv2();
 applicationTaskDAC();
 RadioButton26.Checked = 0;
 RadioButton27.Checked = 0;
 RadioButton28.Checked = 0;
 RadioButton29.Checked = 0;
 RadioButton30.Checked = 0;
 RadioButton31.Checked = 0;
 RadioButton25.Checked = 0;
 RadioButton33.Checked = 0;
 RadioButton34.Checked = 0;
 RadioButton35.Checked = 0;
 RadioButton36.Checked = 0;
 DrawRadioButton(&RadioButton26);
 DrawRadioButton(&RadioButton27);
 DrawRadioButton(&RadioButton28);
 DrawRadioButton(&RadioButton29);
 DrawRadioButton(&RadioButton30);
 DrawRadioButton(&RadioButton31);
 DrawRadioButton(&RadioButton25);
 DrawRadioButton(&RadioButton33);
 DrawRadioButton(&RadioButton34);
 DrawRadioButton(&RadioButton35);
 DrawRadioButton(&RadioButton36);

}

void RadioButton33OnPress() {
 inferiorv3();
 applicationTaskDAC();
 RadioButton26.Checked = 0;
 RadioButton27.Checked = 0;
 RadioButton28.Checked = 0;
 RadioButton29.Checked = 0;
 RadioButton30.Checked = 0;
 RadioButton31.Checked = 0;
 RadioButton32.Checked = 0;
 RadioButton25.Checked = 0;
 RadioButton34.Checked = 0;
 RadioButton35.Checked = 0;
 RadioButton36.Checked = 0;
 DrawRadioButton(&RadioButton26);
 DrawRadioButton(&RadioButton27);
 DrawRadioButton(&RadioButton28);
 DrawRadioButton(&RadioButton29);
 DrawRadioButton(&RadioButton30);
 DrawRadioButton(&RadioButton31);
 DrawRadioButton(&RadioButton32);
 DrawRadioButton(&RadioButton25);
 DrawRadioButton(&RadioButton34);
 DrawRadioButton(&RadioButton35);
 DrawRadioButton(&RadioButton36);
}

void RadioButton34OnPress() {
 inferiorv4();
 applicationTaskDAC();
 RadioButton26.Checked = 0;
 RadioButton27.Checked = 0;
 RadioButton28.Checked = 0;
 RadioButton29.Checked = 0;
 RadioButton30.Checked = 0;
 RadioButton31.Checked = 0;
 RadioButton32.Checked = 0;
 RadioButton33.Checked = 0;
 RadioButton25.Checked = 0;
 RadioButton35.Checked = 0;
 RadioButton36.Checked = 0;
 DrawRadioButton(&RadioButton26);
 DrawRadioButton(&RadioButton27);
 DrawRadioButton(&RadioButton28);
 DrawRadioButton(&RadioButton29);
 DrawRadioButton(&RadioButton30);
 DrawRadioButton(&RadioButton31);
 DrawRadioButton(&RadioButton32);
 DrawRadioButton(&RadioButton33);
 DrawRadioButton(&RadioButton25);
 DrawRadioButton(&RadioButton35);
 DrawRadioButton(&RadioButton36);
}

void RadioButton35OnPress() {
 inferiorv5();
 applicationTaskDAC();
 RadioButton26.Checked = 0;
 RadioButton27.Checked = 0;
 RadioButton28.Checked = 0;
 RadioButton29.Checked = 0;
 RadioButton30.Checked = 0;
 RadioButton31.Checked = 0;
 RadioButton32.Checked = 0;
 RadioButton33.Checked = 0;
 RadioButton34.Checked = 0;
 RadioButton25.Checked = 0;
 RadioButton36.Checked = 0;
 DrawRadioButton(&RadioButton26);
 DrawRadioButton(&RadioButton27);
 DrawRadioButton(&RadioButton28);
 DrawRadioButton(&RadioButton29);
 DrawRadioButton(&RadioButton30);
 DrawRadioButton(&RadioButton31);
 DrawRadioButton(&RadioButton32);
 DrawRadioButton(&RadioButton33);
 DrawRadioButton(&RadioButton34);
 DrawRadioButton(&RadioButton25);
 DrawRadioButton(&RadioButton36);
}

void RadioButton36OnPress() {
 inferiorv6();
 applicationTaskDAC();
 RadioButton26.Checked = 0;
 RadioButton27.Checked = 0;
 RadioButton28.Checked = 0;
 RadioButton29.Checked = 0;
 RadioButton30.Checked = 0;
 RadioButton31.Checked = 0;
 RadioButton32.Checked = 0;
 RadioButton33.Checked = 0;
 RadioButton34.Checked = 0;
 RadioButton35.Checked = 0;
 RadioButton25.Checked = 0;
 DrawRadioButton(&RadioButton26);
 DrawRadioButton(&RadioButton27);
 DrawRadioButton(&RadioButton28);
 DrawRadioButton(&RadioButton29);
 DrawRadioButton(&RadioButton30);
 DrawRadioButton(&RadioButton31);
 DrawRadioButton(&RadioButton32);
 DrawRadioButton(&RadioButton33);
 DrawRadioButton(&RadioButton34);
 DrawRadioButton(&RadioButton35);
 DrawRadioButton(&RadioButton25);
}



void RadioButton37OnPress() {
 septal1();
 applicationTaskDAC();
 RadioButton38.Checked = 0;
 RadioButton39.Checked = 0;
 RadioButton40.Checked = 0;
 RadioButton41.Checked = 0;
 RadioButton42.Checked = 0;
 RadioButton43.Checked = 0;
 RadioButton44.Checked = 0;
 RadioButton45.Checked = 0;
 RadioButton46.Checked = 0;
 RadioButton47.Checked = 0;
 RadioButton48.Checked = 0;
 DrawRadioButton(&RadioButton38);
 DrawRadioButton(&RadioButton39);
 DrawRadioButton(&RadioButton40);
 DrawRadioButton(&RadioButton41);
 DrawRadioButton(&RadioButton42);
 DrawRadioButton(&RadioButton43);
 DrawRadioButton(&RadioButton44);
 DrawRadioButton(&RadioButton45);
 DrawRadioButton(&RadioButton46);
 DrawRadioButton(&RadioButton47);
 DrawRadioButton(&RadioButton48);
}

void RadioButton38OnPress() {
 septal2();
 applicationTaskDAC();
 RadioButton37.Checked = 0;
 RadioButton39.Checked = 0;
 RadioButton40.Checked = 0;
 RadioButton41.Checked = 0;
 RadioButton42.Checked = 0;
 RadioButton43.Checked = 0;
 RadioButton44.Checked = 0;
 RadioButton45.Checked = 0;
 RadioButton46.Checked = 0;
 RadioButton47.Checked = 0;
 RadioButton48.Checked = 0;
 DrawRadioButton(&RadioButton37);
 DrawRadioButton(&RadioButton39);
 DrawRadioButton(&RadioButton40);
 DrawRadioButton(&RadioButton41);
 DrawRadioButton(&RadioButton42);
 DrawRadioButton(&RadioButton43);
 DrawRadioButton(&RadioButton44);
 DrawRadioButton(&RadioButton45);
 DrawRadioButton(&RadioButton46);
 DrawRadioButton(&RadioButton47);
 DrawRadioButton(&RadioButton48);

}

void RadioButton39OnPress() {
 septal3();
 applicationTaskDAC();
 RadioButton38.Checked = 0;
 RadioButton37.Checked = 0;
 RadioButton40.Checked = 0;
 RadioButton41.Checked = 0;
 RadioButton42.Checked = 0;
 RadioButton43.Checked = 0;
 RadioButton44.Checked = 0;
 RadioButton45.Checked = 0;
 RadioButton46.Checked = 0;
 RadioButton47.Checked = 0;
 RadioButton48.Checked = 0;
 DrawRadioButton(&RadioButton38);
 DrawRadioButton(&RadioButton37);
 DrawRadioButton(&RadioButton40);
 DrawRadioButton(&RadioButton41);
 DrawRadioButton(&RadioButton42);
 DrawRadioButton(&RadioButton43);
 DrawRadioButton(&RadioButton44);
 DrawRadioButton(&RadioButton45);
 DrawRadioButton(&RadioButton46);
 DrawRadioButton(&RadioButton47);
 DrawRadioButton(&RadioButton48);
}

void RadioButton40OnPress() {
 septalavr();
 applicationTaskDAC();
 RadioButton38.Checked = 0;
 RadioButton39.Checked = 0;
 RadioButton37.Checked = 0;
 RadioButton41.Checked = 0;
 RadioButton42.Checked = 0;
 RadioButton43.Checked = 0;
 RadioButton44.Checked = 0;
 RadioButton45.Checked = 0;
 RadioButton46.Checked = 0;
 RadioButton47.Checked = 0;
 RadioButton48.Checked = 0;
 DrawRadioButton(&RadioButton38);
 DrawRadioButton(&RadioButton39);
 DrawRadioButton(&RadioButton37);
 DrawRadioButton(&RadioButton41);
 DrawRadioButton(&RadioButton42);
 DrawRadioButton(&RadioButton43);
 DrawRadioButton(&RadioButton44);
 DrawRadioButton(&RadioButton45);
 DrawRadioButton(&RadioButton46);
 DrawRadioButton(&RadioButton47);
 DrawRadioButton(&RadioButton48);
}

void RadioButton41OnPress() {
 septalavl();
 applicationTaskDAC();
 RadioButton38.Checked = 0;
 RadioButton39.Checked = 0;
 RadioButton40.Checked = 0;
 RadioButton37.Checked = 0;
 RadioButton42.Checked = 0;
 RadioButton43.Checked = 0;
 RadioButton44.Checked = 0;
 RadioButton45.Checked = 0;
 RadioButton46.Checked = 0;
 RadioButton47.Checked = 0;
 RadioButton48.Checked = 0;
 DrawRadioButton(&RadioButton38);
 DrawRadioButton(&RadioButton39);
 DrawRadioButton(&RadioButton40);
 DrawRadioButton(&RadioButton37);
 DrawRadioButton(&RadioButton42);
 DrawRadioButton(&RadioButton43);
 DrawRadioButton(&RadioButton44);
 DrawRadioButton(&RadioButton45);
 DrawRadioButton(&RadioButton46);
 DrawRadioButton(&RadioButton47);
 DrawRadioButton(&RadioButton48);
}

void RadioButton42OnPress() {
 septalavf();
 applicationTaskDAC();
 RadioButton38.Checked = 0;
 RadioButton39.Checked = 0;
 RadioButton40.Checked = 0;
 RadioButton41.Checked = 0;
 RadioButton37.Checked = 0;
 RadioButton43.Checked = 0;
 RadioButton44.Checked = 0;
 RadioButton45.Checked = 0;
 RadioButton46.Checked = 0;
 RadioButton47.Checked = 0;
 RadioButton48.Checked = 0;
 DrawRadioButton(&RadioButton38);
 DrawRadioButton(&RadioButton39);
 DrawRadioButton(&RadioButton40);
 DrawRadioButton(&RadioButton41);
 DrawRadioButton(&RadioButton37);
 DrawRadioButton(&RadioButton43);
 DrawRadioButton(&RadioButton44);
 DrawRadioButton(&RadioButton45);
 DrawRadioButton(&RadioButton46);
 DrawRadioButton(&RadioButton47);
 DrawRadioButton(&RadioButton48);
}

void RadioButton43OnPress() {
 septalv1();
 applicationTaskDAC();
 RadioButton38.Checked = 0;
 RadioButton39.Checked = 0;
 RadioButton40.Checked = 0;
 RadioButton41.Checked = 0;
 RadioButton42.Checked = 0;
 RadioButton37.Checked = 0;
 RadioButton44.Checked = 0;
 RadioButton45.Checked = 0;
 RadioButton46.Checked = 0;
 RadioButton47.Checked = 0;
 RadioButton48.Checked = 0;
 DrawRadioButton(&RadioButton38);
 DrawRadioButton(&RadioButton39);
 DrawRadioButton(&RadioButton40);
 DrawRadioButton(&RadioButton41);
 DrawRadioButton(&RadioButton42);
 DrawRadioButton(&RadioButton37);
 DrawRadioButton(&RadioButton44);
 DrawRadioButton(&RadioButton45);
 DrawRadioButton(&RadioButton46);
 DrawRadioButton(&RadioButton47);
 DrawRadioButton(&RadioButton48);
}

void RadioButton44OnPress() {
 septalv2();
 applicationTaskDAC();
 RadioButton38.Checked = 0;
 RadioButton39.Checked = 0;
 RadioButton40.Checked = 0;
 RadioButton41.Checked = 0;
 RadioButton42.Checked = 0;
 RadioButton43.Checked = 0;
 RadioButton37.Checked = 0;
 RadioButton45.Checked = 0;
 RadioButton46.Checked = 0;
 RadioButton47.Checked = 0;
 RadioButton48.Checked = 0;
 DrawRadioButton(&RadioButton38);
 DrawRadioButton(&RadioButton39);
 DrawRadioButton(&RadioButton40);
 DrawRadioButton(&RadioButton41);
 DrawRadioButton(&RadioButton42);
 DrawRadioButton(&RadioButton43);
 DrawRadioButton(&RadioButton37);
 DrawRadioButton(&RadioButton45);
 DrawRadioButton(&RadioButton46);
 DrawRadioButton(&RadioButton47);
 DrawRadioButton(&RadioButton48);
}

void RadioButton45OnPress() {
 septalv3();
 applicationTaskDAC();
 RadioButton38.Checked = 0;
 RadioButton39.Checked = 0;
 RadioButton40.Checked = 0;
 RadioButton41.Checked = 0;
 RadioButton42.Checked = 0;
 RadioButton43.Checked = 0;
 RadioButton44.Checked = 0;
 RadioButton37.Checked = 0;
 RadioButton46.Checked = 0;
 RadioButton47.Checked = 0;
 RadioButton48.Checked = 0;
 DrawRadioButton(&RadioButton38);
 DrawRadioButton(&RadioButton39);
 DrawRadioButton(&RadioButton40);
 DrawRadioButton(&RadioButton41);
 DrawRadioButton(&RadioButton42);
 DrawRadioButton(&RadioButton43);
 DrawRadioButton(&RadioButton44);
 DrawRadioButton(&RadioButton37);
 DrawRadioButton(&RadioButton46);
 DrawRadioButton(&RadioButton47);
 DrawRadioButton(&RadioButton48);
}

void RadioButton46OnPress() {
 septalv4();
 applicationTaskDAC();
 RadioButton38.Checked = 0;
 RadioButton39.Checked = 0;
 RadioButton40.Checked = 0;
 RadioButton41.Checked = 0;
 RadioButton42.Checked = 0;
 RadioButton43.Checked = 0;
 RadioButton44.Checked = 0;
 RadioButton45.Checked = 0;
 RadioButton37.Checked = 0;
 RadioButton47.Checked = 0;
 RadioButton48.Checked = 0;
 DrawRadioButton(&RadioButton38);
 DrawRadioButton(&RadioButton39);
 DrawRadioButton(&RadioButton40);
 DrawRadioButton(&RadioButton41);
 DrawRadioButton(&RadioButton42);
 DrawRadioButton(&RadioButton43);
 DrawRadioButton(&RadioButton44);
 DrawRadioButton(&RadioButton45);
 DrawRadioButton(&RadioButton37);
 DrawRadioButton(&RadioButton47);
 DrawRadioButton(&RadioButton48);
}

void RadioButton47OnPress() {
 septalv5();
 applicationTaskDAC();
 RadioButton38.Checked = 0;
 RadioButton39.Checked = 0;
 RadioButton40.Checked = 0;
 RadioButton41.Checked = 0;
 RadioButton42.Checked = 0;
 RadioButton43.Checked = 0;
 RadioButton44.Checked = 0;
 RadioButton45.Checked = 0;
 RadioButton46.Checked = 0;
 RadioButton37.Checked = 0;
 RadioButton48.Checked = 0;
 DrawRadioButton(&RadioButton38);
 DrawRadioButton(&RadioButton39);
 DrawRadioButton(&RadioButton40);
 DrawRadioButton(&RadioButton41);
 DrawRadioButton(&RadioButton42);
 DrawRadioButton(&RadioButton43);
 DrawRadioButton(&RadioButton44);
 DrawRadioButton(&RadioButton45);
 DrawRadioButton(&RadioButton46);
 DrawRadioButton(&RadioButton37);
 DrawRadioButton(&RadioButton48);
}

void RadioButton48OnPress() {
 septalv6();
 applicationTaskDAC();
 RadioButton38.Checked = 0;
 RadioButton39.Checked = 0;
 RadioButton40.Checked = 0;
 RadioButton41.Checked = 0;
 RadioButton42.Checked = 0;
 RadioButton43.Checked = 0;
 RadioButton44.Checked = 0;
 RadioButton45.Checked = 0;
 RadioButton46.Checked = 0;
 RadioButton47.Checked = 0;
 RadioButton37.Checked = 0;
 DrawRadioButton(&RadioButton38);
 DrawRadioButton(&RadioButton39);
 DrawRadioButton(&RadioButton40);
 DrawRadioButton(&RadioButton41);
 DrawRadioButton(&RadioButton42);
 DrawRadioButton(&RadioButton43);
 DrawRadioButton(&RadioButton44);
 DrawRadioButton(&RadioButton45);
 DrawRadioButton(&RadioButton46);
 DrawRadioButton(&RadioButton47);
 DrawRadioButton(&RadioButton37);
}


void RadioButton49OnPress() {
 lateral1();
 applicationTaskDAC();
 RadioButton50.Checked = 0;
 RadioButton51.Checked = 0;
 RadioButton52.Checked = 0;
 RadioButton53.Checked = 0;
 RadioButton54.Checked = 0;
 RadioButton55.Checked = 0;
 RadioButton56.Checked = 0;
 RadioButton57.Checked = 0;
 RadioButton58.Checked = 0;
 RadioButton59.Checked = 0;
 RadioButton60.Checked = 0;
 DrawRadioButton(&RadioButton50);
 DrawRadioButton(&RadioButton51);
 DrawRadioButton(&RadioButton52);
 DrawRadioButton(&RadioButton53);
 DrawRadioButton(&RadioButton54);
 DrawRadioButton(&RadioButton55);
 DrawRadioButton(&RadioButton56);
 DrawRadioButton(&RadioButton57);
 DrawRadioButton(&RadioButton58);
 DrawRadioButton(&RadioButton59);
 DrawRadioButton(&RadioButton60);
}

void RadioButton50OnPress() {
 lateral2();
 applicationTaskDAC();
 RadioButton49.Checked = 0;
 RadioButton51.Checked = 0;
 RadioButton52.Checked = 0;
 RadioButton53.Checked = 0;
 RadioButton54.Checked = 0;
 RadioButton55.Checked = 0;
 RadioButton56.Checked = 0;
 RadioButton57.Checked = 0;
 RadioButton58.Checked = 0;
 RadioButton59.Checked = 0;
 RadioButton60.Checked = 0;
 DrawRadioButton(&RadioButton49);
 DrawRadioButton(&RadioButton51);
 DrawRadioButton(&RadioButton52);
 DrawRadioButton(&RadioButton53);
 DrawRadioButton(&RadioButton54);
 DrawRadioButton(&RadioButton55);
 DrawRadioButton(&RadioButton56);
 DrawRadioButton(&RadioButton57);
 DrawRadioButton(&RadioButton58);
 DrawRadioButton(&RadioButton59);
 DrawRadioButton(&RadioButton60);
}
void RadioButton51OnPress() {
 lateral3();
 applicationTaskDAC();
 RadioButton50.Checked = 0;
 RadioButton49.Checked = 0;
 RadioButton52.Checked = 0;
 RadioButton53.Checked = 0;
 RadioButton54.Checked = 0;
 RadioButton55.Checked = 0;
 RadioButton56.Checked = 0;
 RadioButton57.Checked = 0;
 RadioButton58.Checked = 0;
 RadioButton59.Checked = 0;
 RadioButton60.Checked = 0;
 DrawRadioButton(&RadioButton50);
 DrawRadioButton(&RadioButton49);
 DrawRadioButton(&RadioButton52);
 DrawRadioButton(&RadioButton53);
 DrawRadioButton(&RadioButton54);
 DrawRadioButton(&RadioButton55);
 DrawRadioButton(&RadioButton56);
 DrawRadioButton(&RadioButton57);
 DrawRadioButton(&RadioButton58);
 DrawRadioButton(&RadioButton59);
 DrawRadioButton(&RadioButton60);
}

void RadioButton52OnPress() {
 lateralavr();
 applicationTaskDAC();
 RadioButton50.Checked = 0;
 RadioButton51.Checked = 0;
 RadioButton49.Checked = 0;
 RadioButton53.Checked = 0;
 RadioButton54.Checked = 0;
 RadioButton55.Checked = 0;
 RadioButton56.Checked = 0;
 RadioButton57.Checked = 0;
 RadioButton58.Checked = 0;
 RadioButton59.Checked = 0;
 RadioButton60.Checked = 0;
 DrawRadioButton(&RadioButton50);
 DrawRadioButton(&RadioButton51);
 DrawRadioButton(&RadioButton49);
 DrawRadioButton(&RadioButton53);
 DrawRadioButton(&RadioButton54);
 DrawRadioButton(&RadioButton55);
 DrawRadioButton(&RadioButton56);
 DrawRadioButton(&RadioButton57);
 DrawRadioButton(&RadioButton58);
 DrawRadioButton(&RadioButton59);
 DrawRadioButton(&RadioButton60);
}

void RadioButton53OnPress() {
 lateralavl();
 applicationTaskDAC();
 RadioButton50.Checked = 0;
 RadioButton51.Checked = 0;
 RadioButton52.Checked = 0;
 RadioButton49.Checked = 0;
 RadioButton54.Checked = 0;
 RadioButton55.Checked = 0;
 RadioButton56.Checked = 0;
 RadioButton57.Checked = 0;
 RadioButton58.Checked = 0;
 RadioButton59.Checked = 0;
 RadioButton60.Checked = 0;
 DrawRadioButton(&RadioButton50);
 DrawRadioButton(&RadioButton51);
 DrawRadioButton(&RadioButton52);
 DrawRadioButton(&RadioButton49);
 DrawRadioButton(&RadioButton54);
 DrawRadioButton(&RadioButton55);
 DrawRadioButton(&RadioButton56);
 DrawRadioButton(&RadioButton57);
 DrawRadioButton(&RadioButton58);
 DrawRadioButton(&RadioButton59);
 DrawRadioButton(&RadioButton60);
}

void RadioButton54OnPress() {
 lateralavf();
 applicationTaskDAC();
 RadioButton50.Checked = 0;
 RadioButton51.Checked = 0;
 RadioButton52.Checked = 0;
 RadioButton53.Checked = 0;
 RadioButton49.Checked = 0;
 RadioButton55.Checked = 0;
 RadioButton56.Checked = 0;
 RadioButton57.Checked = 0;
 RadioButton58.Checked = 0;
 RadioButton59.Checked = 0;
 RadioButton60.Checked = 0;
 DrawRadioButton(&RadioButton50);
 DrawRadioButton(&RadioButton51);
 DrawRadioButton(&RadioButton52);
 DrawRadioButton(&RadioButton53);
 DrawRadioButton(&RadioButton49);
 DrawRadioButton(&RadioButton55);
 DrawRadioButton(&RadioButton56);
 DrawRadioButton(&RadioButton57);
 DrawRadioButton(&RadioButton58);
 DrawRadioButton(&RadioButton59);
 DrawRadioButton(&RadioButton60);
}

void RadioButton55OnPress() {
 lateralv1();
 applicationTaskDAC();
 RadioButton50.Checked = 0;
 RadioButton51.Checked = 0;
 RadioButton52.Checked = 0;
 RadioButton53.Checked = 0;
 RadioButton54.Checked = 0;
 RadioButton49.Checked = 0;
 RadioButton56.Checked = 0;
 RadioButton57.Checked = 0;
 RadioButton58.Checked = 0;
 RadioButton59.Checked = 0;
 RadioButton60.Checked = 0;
 DrawRadioButton(&RadioButton50);
 DrawRadioButton(&RadioButton51);
 DrawRadioButton(&RadioButton52);
 DrawRadioButton(&RadioButton53);
 DrawRadioButton(&RadioButton54);
 DrawRadioButton(&RadioButton49);
 DrawRadioButton(&RadioButton56);
 DrawRadioButton(&RadioButton57);
 DrawRadioButton(&RadioButton58);
 DrawRadioButton(&RadioButton59);
 DrawRadioButton(&RadioButton60);
}

void RadioButton56OnPress() {
 lateralv2();
 applicationTaskDAC();
 RadioButton50.Checked = 0;
 RadioButton51.Checked = 0;
 RadioButton52.Checked = 0;
 RadioButton53.Checked = 0;
 RadioButton54.Checked = 0;
 RadioButton55.Checked = 0;
 RadioButton49.Checked = 0;
 RadioButton57.Checked = 0;
 RadioButton58.Checked = 0;
 RadioButton59.Checked = 0;
 RadioButton60.Checked = 0;
 DrawRadioButton(&RadioButton50);
 DrawRadioButton(&RadioButton51);
 DrawRadioButton(&RadioButton52);
 DrawRadioButton(&RadioButton53);
 DrawRadioButton(&RadioButton54);
 DrawRadioButton(&RadioButton55);
 DrawRadioButton(&RadioButton49);
 DrawRadioButton(&RadioButton57);
 DrawRadioButton(&RadioButton58);
 DrawRadioButton(&RadioButton59);
 DrawRadioButton(&RadioButton60);
}

void RadioButton57OnPress() {
 lateralv3();
 applicationTaskDAC();
 RadioButton50.Checked = 0;
 RadioButton51.Checked = 0;
 RadioButton52.Checked = 0;
 RadioButton53.Checked = 0;
 RadioButton54.Checked = 0;
 RadioButton55.Checked = 0;
 RadioButton56.Checked = 0;
 RadioButton49.Checked = 0;
 RadioButton58.Checked = 0;
 RadioButton59.Checked = 0;
 RadioButton60.Checked = 0;
 DrawRadioButton(&RadioButton50);
 DrawRadioButton(&RadioButton51);
 DrawRadioButton(&RadioButton52);
 DrawRadioButton(&RadioButton53);
 DrawRadioButton(&RadioButton54);
 DrawRadioButton(&RadioButton55);
 DrawRadioButton(&RadioButton56);
 DrawRadioButton(&RadioButton49);
 DrawRadioButton(&RadioButton58);
 DrawRadioButton(&RadioButton59);
 DrawRadioButton(&RadioButton60);
}

void RadioButton58OnPress() {
 lateralv4();
 applicationTaskDAC();
 RadioButton50.Checked = 0;
 RadioButton51.Checked = 0;
 RadioButton52.Checked = 0;
 RadioButton53.Checked = 0;
 RadioButton54.Checked = 0;
 RadioButton55.Checked = 0;
 RadioButton56.Checked = 0;
 RadioButton57.Checked = 0;
 RadioButton49.Checked = 0;
 RadioButton59.Checked = 0;
 RadioButton60.Checked = 0;
 DrawRadioButton(&RadioButton50);
 DrawRadioButton(&RadioButton51);
 DrawRadioButton(&RadioButton52);
 DrawRadioButton(&RadioButton53);
 DrawRadioButton(&RadioButton54);
 DrawRadioButton(&RadioButton55);
 DrawRadioButton(&RadioButton56);
 DrawRadioButton(&RadioButton57);
 DrawRadioButton(&RadioButton49);
 DrawRadioButton(&RadioButton59);
 DrawRadioButton(&RadioButton60);
}

void RadioButton59OnPress() {
 lateralv5();
 applicationTaskDAC();
 RadioButton50.Checked = 0;
 RadioButton51.Checked = 0;
 RadioButton52.Checked = 0;
 RadioButton53.Checked = 0;
 RadioButton54.Checked = 0;
 RadioButton55.Checked = 0;
 RadioButton56.Checked = 0;
 RadioButton57.Checked = 0;
 RadioButton58.Checked = 0;
 RadioButton49.Checked = 0;
 RadioButton60.Checked = 0;
 DrawRadioButton(&RadioButton50);
 DrawRadioButton(&RadioButton51);
 DrawRadioButton(&RadioButton52);
 DrawRadioButton(&RadioButton53);
 DrawRadioButton(&RadioButton54);
 DrawRadioButton(&RadioButton55);
 DrawRadioButton(&RadioButton56);
 DrawRadioButton(&RadioButton57);
 DrawRadioButton(&RadioButton58);
 DrawRadioButton(&RadioButton49);
 DrawRadioButton(&RadioButton60);
}

void RadioButton60OnPress() {
 lateralv6();
 applicationTaskDAC();
 RadioButton50.Checked = 0;
 RadioButton51.Checked = 0;
 RadioButton52.Checked = 0;
 RadioButton53.Checked = 0;
 RadioButton54.Checked = 0;
 RadioButton55.Checked = 0;
 RadioButton56.Checked = 0;
 RadioButton57.Checked = 0;
 RadioButton58.Checked = 0;
 RadioButton59.Checked = 0;
 RadioButton49.Checked = 0;
 DrawRadioButton(&RadioButton50);
 DrawRadioButton(&RadioButton51);
 DrawRadioButton(&RadioButton52);
 DrawRadioButton(&RadioButton53);
 DrawRadioButton(&RadioButton54);
 DrawRadioButton(&RadioButton55);
 DrawRadioButton(&RadioButton56);
 DrawRadioButton(&RadioButton57);
 DrawRadioButton(&RadioButton58);
 DrawRadioButton(&RadioButton59);
 DrawRadioButton(&RadioButton49);
}


void RadioButton61OnPress() {
 posterior1();
 applicationTaskDAC();
 RadioButton62.Checked = 0;
 RadioButton63.Checked = 0;
 RadioButton64.Checked = 0;
 RadioButton65.Checked = 0;
 RadioButton66.Checked = 0;
 RadioButton67.Checked = 0;
 RadioButton68.Checked = 0;
 RadioButton69.Checked = 0;
 RadioButton70.Checked = 0;
 RadioButton71.Checked = 0;
 RadioButton72.Checked = 0;
 DrawRadioButton(&RadioButton62);
 DrawRadioButton(&RadioButton63);
 DrawRadioButton(&RadioButton64);
 DrawRadioButton(&RadioButton65);
 DrawRadioButton(&RadioButton66);
 DrawRadioButton(&RadioButton67);
 DrawRadioButton(&RadioButton68);
 DrawRadioButton(&RadioButton69);
 DrawRadioButton(&RadioButton70);
 DrawRadioButton(&RadioButton71);
 DrawRadioButton(&RadioButton72);
}

void RadioButton62OnPress() {
 posterior2();
 applicationTaskDAC();
 RadioButton61.Checked = 0;
 RadioButton63.Checked = 0;
 RadioButton64.Checked = 0;
 RadioButton65.Checked = 0;
 RadioButton66.Checked = 0;
 RadioButton67.Checked = 0;
 RadioButton68.Checked = 0;
 RadioButton69.Checked = 0;
 RadioButton70.Checked = 0;
 RadioButton71.Checked = 0;
 RadioButton72.Checked = 0;
 DrawRadioButton(&RadioButton61);
 DrawRadioButton(&RadioButton63);
 DrawRadioButton(&RadioButton64);
 DrawRadioButton(&RadioButton65);
 DrawRadioButton(&RadioButton66);
 DrawRadioButton(&RadioButton67);
 DrawRadioButton(&RadioButton68);
 DrawRadioButton(&RadioButton69);
 DrawRadioButton(&RadioButton70);
 DrawRadioButton(&RadioButton71);
 DrawRadioButton(&RadioButton72);

}

void RadioButton63OnPress() {
 posterior3();
 applicationTaskDAC();
 RadioButton62.Checked = 0;
 RadioButton61.Checked = 0;
 RadioButton64.Checked = 0;
 RadioButton65.Checked = 0;
 RadioButton66.Checked = 0;
 RadioButton67.Checked = 0;
 RadioButton68.Checked = 0;
 RadioButton69.Checked = 0;
 RadioButton70.Checked = 0;
 RadioButton71.Checked = 0;
 RadioButton72.Checked = 0;
 DrawRadioButton(&RadioButton62);
 DrawRadioButton(&RadioButton61);
 DrawRadioButton(&RadioButton64);
 DrawRadioButton(&RadioButton65);
 DrawRadioButton(&RadioButton66);
 DrawRadioButton(&RadioButton67);
 DrawRadioButton(&RadioButton68);
 DrawRadioButton(&RadioButton69);
 DrawRadioButton(&RadioButton70);
 DrawRadioButton(&RadioButton71);
 DrawRadioButton(&RadioButton72);
}

void RadioButton64OnPress() {
 posterioravr();
 applicationTaskDAC();
 RadioButton62.Checked = 0;
 RadioButton63.Checked = 0;
 RadioButton61.Checked = 0;
 RadioButton65.Checked = 0;
 RadioButton66.Checked = 0;
 RadioButton67.Checked = 0;
 RadioButton68.Checked = 0;
 RadioButton69.Checked = 0;
 RadioButton70.Checked = 0;
 RadioButton71.Checked = 0;
 RadioButton72.Checked = 0;
 DrawRadioButton(&RadioButton62);
 DrawRadioButton(&RadioButton63);
 DrawRadioButton(&RadioButton61);
 DrawRadioButton(&RadioButton65);
 DrawRadioButton(&RadioButton66);
 DrawRadioButton(&RadioButton67);
 DrawRadioButton(&RadioButton68);
 DrawRadioButton(&RadioButton69);
 DrawRadioButton(&RadioButton70);
 DrawRadioButton(&RadioButton71);
 DrawRadioButton(&RadioButton72);
}

void RadioButton65OnPress() {
 posterioravl();
 applicationTaskDAC();
 RadioButton62.Checked = 0;
 RadioButton63.Checked = 0;
 RadioButton64.Checked = 0;
 RadioButton61.Checked = 0;
 RadioButton66.Checked = 0;
 RadioButton67.Checked = 0;
 RadioButton68.Checked = 0;
 RadioButton69.Checked = 0;
 RadioButton70.Checked = 0;
 RadioButton71.Checked = 0;
 RadioButton72.Checked = 0;
 DrawRadioButton(&RadioButton62);
 DrawRadioButton(&RadioButton63);
 DrawRadioButton(&RadioButton64);
 DrawRadioButton(&RadioButton61);
 DrawRadioButton(&RadioButton66);
 DrawRadioButton(&RadioButton67);
 DrawRadioButton(&RadioButton68);
 DrawRadioButton(&RadioButton69);
 DrawRadioButton(&RadioButton70);
 DrawRadioButton(&RadioButton71);
 DrawRadioButton(&RadioButton72);
}

void RadioButton66OnPress() {
 posterioravf();
 applicationTaskDAC();
 RadioButton62.Checked = 0;
 RadioButton63.Checked = 0;
 RadioButton64.Checked = 0;
 RadioButton65.Checked = 0;
 RadioButton61.Checked = 0;
 RadioButton67.Checked = 0;
 RadioButton68.Checked = 0;
 RadioButton69.Checked = 0;
 RadioButton70.Checked = 0;
 RadioButton71.Checked = 0;
 RadioButton72.Checked = 0;
 DrawRadioButton(&RadioButton62);
 DrawRadioButton(&RadioButton63);
 DrawRadioButton(&RadioButton64);
 DrawRadioButton(&RadioButton65);
 DrawRadioButton(&RadioButton61);
 DrawRadioButton(&RadioButton67);
 DrawRadioButton(&RadioButton68);
 DrawRadioButton(&RadioButton69);
 DrawRadioButton(&RadioButton70);
 DrawRadioButton(&RadioButton71);
 DrawRadioButton(&RadioButton72);
}

void RadioButton67OnPress() {
 posteriorv1();
 applicationTaskDAC();
 RadioButton62.Checked = 0;
 RadioButton63.Checked = 0;
 RadioButton64.Checked = 0;
 RadioButton65.Checked = 0;
 RadioButton66.Checked = 0;
 RadioButton61.Checked = 0;
 RadioButton68.Checked = 0;
 RadioButton69.Checked = 0;
 RadioButton70.Checked = 0;
 RadioButton71.Checked = 0;
 RadioButton72.Checked = 0;
 DrawRadioButton(&RadioButton62);
 DrawRadioButton(&RadioButton63);
 DrawRadioButton(&RadioButton64);
 DrawRadioButton(&RadioButton65);
 DrawRadioButton(&RadioButton66);
 DrawRadioButton(&RadioButton61);
 DrawRadioButton(&RadioButton68);
 DrawRadioButton(&RadioButton69);
 DrawRadioButton(&RadioButton70);
 DrawRadioButton(&RadioButton71);
 DrawRadioButton(&RadioButton72);
}

void RadioButton68OnPress() {
 posteriorv2();
 applicationTaskDAC();
 RadioButton62.Checked = 0;
 RadioButton63.Checked = 0;
 RadioButton64.Checked = 0;
 RadioButton65.Checked = 0;
 RadioButton66.Checked = 0;
 RadioButton67.Checked = 0;
 RadioButton61.Checked = 0;
 RadioButton69.Checked = 0;
 RadioButton70.Checked = 0;
 RadioButton71.Checked = 0;
 RadioButton72.Checked = 0;
 DrawRadioButton(&RadioButton62);
 DrawRadioButton(&RadioButton63);
 DrawRadioButton(&RadioButton64);
 DrawRadioButton(&RadioButton65);
 DrawRadioButton(&RadioButton66);
 DrawRadioButton(&RadioButton67);
 DrawRadioButton(&RadioButton61);
 DrawRadioButton(&RadioButton69);
 DrawRadioButton(&RadioButton70);
 DrawRadioButton(&RadioButton71);
 DrawRadioButton(&RadioButton72);
}

void RadioButton69OnPress() {
 posteriorv3();
 applicationTaskDAC();
 RadioButton62.Checked = 0;
 RadioButton63.Checked = 0;
 RadioButton64.Checked = 0;
 RadioButton65.Checked = 0;
 RadioButton66.Checked = 0;
 RadioButton67.Checked = 0;
 RadioButton68.Checked = 0;
 RadioButton61.Checked = 0;
 RadioButton70.Checked = 0;
 RadioButton71.Checked = 0;
 RadioButton72.Checked = 0;
 DrawRadioButton(&RadioButton62);
 DrawRadioButton(&RadioButton63);
 DrawRadioButton(&RadioButton64);
 DrawRadioButton(&RadioButton65);
 DrawRadioButton(&RadioButton66);
 DrawRadioButton(&RadioButton67);
 DrawRadioButton(&RadioButton68);
 DrawRadioButton(&RadioButton61);
 DrawRadioButton(&RadioButton70);
 DrawRadioButton(&RadioButton71);
 DrawRadioButton(&RadioButton72);
}

void RadioButton70OnPress() {
 posteriorv4();
 applicationTaskDAC();
 RadioButton62.Checked = 0;
 RadioButton63.Checked = 0;
 RadioButton64.Checked = 0;
 RadioButton65.Checked = 0;
 RadioButton66.Checked = 0;
 RadioButton67.Checked = 0;
 RadioButton68.Checked = 0;
 RadioButton69.Checked = 0;
 RadioButton61.Checked = 0;
 RadioButton71.Checked = 0;
 RadioButton72.Checked = 0;
 DrawRadioButton(&RadioButton62);
 DrawRadioButton(&RadioButton63);
 DrawRadioButton(&RadioButton64);
 DrawRadioButton(&RadioButton65);
 DrawRadioButton(&RadioButton66);
 DrawRadioButton(&RadioButton67);
 DrawRadioButton(&RadioButton68);
 DrawRadioButton(&RadioButton69);
 DrawRadioButton(&RadioButton61);
 DrawRadioButton(&RadioButton71);
 DrawRadioButton(&RadioButton72);
}

void RadioButton71OnPress() {
 posteriorv5();
 applicationTaskDAC();
 RadioButton62.Checked = 0;
 RadioButton63.Checked = 0;
 RadioButton64.Checked = 0;
 RadioButton65.Checked = 0;
 RadioButton66.Checked = 0;
 RadioButton67.Checked = 0;
 RadioButton68.Checked = 0;
 RadioButton69.Checked = 0;
 RadioButton70.Checked = 0;
 RadioButton61.Checked = 0;
 RadioButton72.Checked = 0;
 DrawRadioButton(&RadioButton62);
 DrawRadioButton(&RadioButton63);
 DrawRadioButton(&RadioButton64);
 DrawRadioButton(&RadioButton65);
 DrawRadioButton(&RadioButton66);
 DrawRadioButton(&RadioButton67);
 DrawRadioButton(&RadioButton68);
 DrawRadioButton(&RadioButton69);
 DrawRadioButton(&RadioButton70);
 DrawRadioButton(&RadioButton61);
 DrawRadioButton(&RadioButton72);
}

void RadioButton72OnPress() {
 posteriorv6();
 applicationTaskDAC();
 RadioButton62.Checked = 0;
 RadioButton63.Checked = 0;
 RadioButton64.Checked = 0;
 RadioButton65.Checked = 0;
 RadioButton66.Checked = 0;
 RadioButton67.Checked = 0;
 RadioButton68.Checked = 0;
 RadioButton69.Checked = 0;
 RadioButton70.Checked = 0;
 RadioButton71.Checked = 0;
 RadioButton61.Checked = 0;
 DrawRadioButton(&RadioButton62);
 DrawRadioButton(&RadioButton63);
 DrawRadioButton(&RadioButton64);
 DrawRadioButton(&RadioButton65);
 DrawRadioButton(&RadioButton66);
 DrawRadioButton(&RadioButton67);
 DrawRadioButton(&RadioButton68);
 DrawRadioButton(&RadioButton69);
 DrawRadioButton(&RadioButton70);
 DrawRadioButton(&RadioButton71);
 DrawRadioButton(&RadioButton61);

}
void ButtonRound6OnClick() {
 i = 0;
 DrawScreen(&Screen8);
 RadioButton1.Checked = 0;
 RadioButton2.Checked = 0;
 RadioButton15.Checked = 0;
 RadioButton16.Checked = 0;
 RadioButton17.Checked = 0;
 RadioButton18.Checked = 0;
 RadioButton19.Checked = 0;
 RadioButton20.Checked = 0;
 RadioButton21.Checked = 0;
 RadioButton22.Checked = 0;
 RadioButton23.Checked = 0;
 RadioButton24.Checked = 0;

}
void ButtonRound2OnClick() {
 DrawScreen(&Screen8);
}
void ButtonRound20OnClick() {
 DrawScreen(&Screen1);
}
void ButtonRound15OnClick() {
 DrawScreen(&Screen3);
}
void ButtonRound16OnClick() {
 DrawScreen(&Screen4);
}
void ButtonRound17OnClick() {
 DrawScreen(&Screen5);
}
void ButtonRound18OnClick() {
 DrawScreen(&Screen6);
}
void ButtonRound19OnClick() {
 DrawScreen(&Screen7);
}
void ButtonRound8OnClick() {
 i = 0;
 DrawScreen(&Screen8);
 RadioButton25.Checked = 0;
 RadioButton26.Checked = 0;
 RadioButton27.Checked = 0;
 RadioButton28.Checked = 0;
 RadioButton29.Checked = 0;
 RadioButton30.Checked = 0;
 RadioButton31.Checked = 0;
 RadioButton32.Checked = 0;
 RadioButton33.Checked = 0;
 RadioButton34.Checked = 0;
 RadioButton35.Checked = 0;
 RadioButton36.Checked = 0;
}

void ButtonRound10OnClick() {
 i = 0;
 DrawScreen(&Screen8);
 RadioButton37.Checked = 0;
 RadioButton38.Checked = 0;
 RadioButton39.Checked = 0;
 RadioButton40.Checked = 0;
 RadioButton41.Checked = 0;
 RadioButton42.Checked = 0;
 RadioButton43.Checked = 0;
 RadioButton44.Checked = 0;
 RadioButton45.Checked = 0;
 RadioButton46.Checked = 0;
 RadioButton47.Checked = 0;
 RadioButton48.Checked = 0;
}

void ButtonRound12OnClick() {
 i = 0;
 DrawScreen(&Screen8);
 RadioButton49.Checked = 0;
 RadioButton50.Checked = 0;
 RadioButton51.Checked = 0;
 RadioButton52.Checked = 0;
 RadioButton53.Checked = 0;
 RadioButton54.Checked = 0;
 RadioButton55.Checked = 0;
 RadioButton56.Checked = 0;
 RadioButton57.Checked = 0;
 RadioButton58.Checked = 0;
 RadioButton59.Checked = 0;
 RadioButton60.Checked = 0;
}

void ButtonRound14OnClick() {
 i = 0;
 DrawScreen(&Screen8);
 RadioButton61.Checked = 0;
 RadioButton62.Checked = 0;
 RadioButton63.Checked = 0;
 RadioButton64.Checked = 0;
 RadioButton65.Checked = 0;
 RadioButton66.Checked = 0;
 RadioButton67.Checked = 0;
 RadioButton68.Checked = 0;
 RadioButton69.Checked = 0;
 RadioButton70.Checked = 0;
 RadioButton71.Checked = 0;
 RadioButton72.Checked = 0;
}
