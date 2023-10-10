#include "ECGsynthetic_objects.h"
#include "ECGsynthetic_resources.h"

//--------------------- User code ---------------------//
void InitTimer7(){
  RCC_APB1ENR.TIM7EN = 1;
  TIM7_CR1.CEN = 0;
  TIM7_PSC = 7;
  TIM7_ARR = 62999;
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
    dac_spiDriverInit( (T_DAC_P)&_MIKROBUS1_GPIO, (T_DAC_P)&_MIKROBUS1_SPI );
    Delay_100ms();
    usb_uart_uartDriverInit( (T_USB_UART_P)&_MIKROBUS2_GPIO, (T_USB_UART_P)&_MIKROBUS2_UART );
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

//----------------- End of User code ------------------//

// Event Handlers

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

    /*if(i%(int)(513*(60/hmean))==0){
         i=0;
         bingkai(227,86,740,380);
     }*/
     
     if(i%513==0){
         i=0;
         /*bingkai(227,86,740,380);*/
         DrawImage(&Image3);
     }
     
     /*if(i==(int)(513*(60/hmean))){
        i=0;
        bingkai(227,86,740,380);
     }*/
         
     TFT_Set_Pen(CL_RED,3);
     TFT_Line(227+((i%513)-1),250-(100*z[i-1]),(227+(i%513)),250-100*z[i]);
     /*TFT_Line(227+(i-1),250-(100*z[i-1]),(227+(i)),250-100*z[i]);*/
     //Delay_Us(4000);
         
     //PLOT DATA IN UART
     FloatToStr(z[i],text);
     mikrobus_logWrite(text, _LOG_LINE);
     //Delay_Us(4000);

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
  //Enter your code here
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

// SCREEN 2 SINYAL NORMAL

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

// SCREEN 3 SINYAL ANTERIOR

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

// SCREEN 4 SINYAL INFERIOR
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

// SCREEN 5 SINYAL SEPTAL

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

// SCREEN 6 SINYAL LATERAL
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

// SCREEN 7 SINYAL POSTERIOR
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