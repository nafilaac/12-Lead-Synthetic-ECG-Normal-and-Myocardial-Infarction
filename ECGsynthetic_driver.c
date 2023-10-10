#include "ECGsynthetic_objects.h"
#include "ECGsynthetic_resources.h"
#include "built_in.h"


// TFT module connections
sbit TFT_BLED at GPIOF_ODR.B10;
sbit TFT_CS at GPIOF_ODR.B13;
unsigned int TFT_DataPort at GPIOE_ODR;
sbit TFT_RD at GPIOF_ODR.B12;
sbit TFT_RS at GPIOF_ODR.B15;
sbit TFT_RST at GPIOF_ODR.B14;
sbit TFT_WR at GPIOF_ODR.B11;
// End TFT module connections

// Touch Panel module connections
// End Touch Panel module connections

// Global variables
unsigned int Xcoord, Ycoord;
char PenDown;
void *PressedObject;
int PressedObjectType;
unsigned int caption_length, caption_height;
unsigned int display_width, display_height;

int _object_count;
unsigned short object_pressed;
TButton_Round *local_round_button;
TButton_Round *exec_round_button;
int round_button_order;
TLabel *local_label;
TLabel *exec_label;
int label_order;
TImage *local_image;
TImage *exec_image;
int image_order;
TBox *local_box;
TBox *exec_box;
int box_order;
TBox_Round *local_round_box;
TBox_Round *exec_round_box;
int box_round_order;
TRadioButton *local_radio_button;
TRadioButton *exec_radio_button;
int radio_button_order;


void Write_to_Data_Lines(unsigned char _hi, unsigned char _lo) {
  GPIOE_ODR = (unsigned int) (_lo | (_hi << 8));
}

void Set_Index(unsigned short index) {
  TFT_RS = 0;
  Write_to_Data_Lines(0, index);
  TFT_WR = 0;
  asm nop;
  TFT_WR = 1;
}

void Write_Command(unsigned short cmd) {
  TFT_RS = 1;
  Write_to_Data_Lines(0, cmd);
  TFT_WR = 0;
  asm nop;
  TFT_WR = 1;
}

void Write_Data(unsigned int _data) {
  TFT_RS = 1;
  Write_to_Data_Lines(Hi(_data), Lo(_data));
  TFT_WR = 0;
  asm nop;
  TFT_WR = 1;
}

static void InitializeTouchPanel() {
  TFT_Set_Active(Set_Index, Write_Command, Write_Data);
  TFT_Init_SSD1963_Board_50(800, 480);

  TFT_Set_DBC_SSD1963(255);

  PenDown = 0;
  PressedObject = 0;
  PressedObjectType = -1;
}


/////////////////////////
  TScreen*  CurrentScreen;

  TScreen                Screen1;
  TBox                   Box3;
  TLabel                 Label1;
char Label1_Caption[19] = "TAMPILKAN SINYAL :";

  TButton_Round          ButtonRound1;
char ButtonRound1_Caption[7] = "Normal";

  TButton_Round          ButtonRound2;
char ButtonRound2_Caption[3] = "MI";

  TLabel                 Label2;
char Label2_Caption[21] = "Nafila Cahya Andanis";

  TLabel                 Label3;
char Label3_Caption[15] = "07311940000020";

  TLabel                 Label4;
char Label4_Caption[47] = "Pembimbing 1 : Dr. Rachmad Setiawan S.T., M.T.";

  TLabel                 Label5;
char Label5_Caption[51] = "Pembimbing 2 : Nada Fitrieyatul Hikmah, S.T., M.T.";

  TLabel                 Label6;
char Label6_Caption[34] = "Kelompok A : Instrumentasi Cerdas";

  TLabel                 Label7;
char Label7_Caption[16] = "Program Sarjana";

  TLabel                 Label8;
char Label8_Caption[27] = "Departemen Teknik Biomedik";

  TLabel                 Label9;
char Label9_Caption[50] = "Fakultas Teknologi Elektro dan Informatika Cerdas";

  TLabel                 Label10;
char Label10_Caption[36] = "Institut Teknologi Sepuluh Nopember";

  TLabel                 Label11;
char Label11_Caption[86] = "Rancang Bangun Electrocardiogram Sintetis ";

  TImage               Image1;
  TLabel                 Label12;
char Label12_Caption[47] = "Menggunakan Dynamical Model Berbasis Embedded ";

  TLabel                 Label13;
char Label13_Caption[22] = "System dan Visual TFT";

  TImage               Image2;
  TLabel                 Label14;
char Label14_Caption[19] = "Heart Rate (bpm) :";

  TBox_Round             BoxRound1;
  TLabel                 Label19;
char Label19_Caption[3] = "60";

  TButton_Round          ButtonRound36;
char ButtonRound36_Caption[2] = ">";

  TButton_Round          ButtonRound37;
char ButtonRound37_Caption[2] = "<";

  TButton_Round          * const code Screen1_Buttons_Round[4]=
         {
         &ButtonRound1,        
         &ButtonRound2,        
         &ButtonRound36,       
         &ButtonRound37        
         };
  TLabel                 * const code Screen1_Labels[15]=
         {
         &Label1,              
         &Label2,              
         &Label3,              
         &Label4,              
         &Label5,              
         &Label6,              
         &Label7,              
         &Label8,              
         &Label9,              
         &Label10,             
         &Label11,             
         &Label12,             
         &Label13,             
         &Label14,             
         &Label19              
         };
  TImage                 * const code Screen1_Images[2]=
         {
         &Image1,              
         &Image2               
         };
  TBox                   * const code Screen1_Boxes[1]=
         {
         &Box3                 
         };
  TBox_Round             * const code Screen1_Boxes_Round[1]=
         {
         &BoxRound1            
         };

  TScreen                Screen2;
  TRadioButton                 RadioButton3;
char RadioButton3_Caption[2] = "I";

  TRadioButton                 RadioButton4;
char RadioButton4_Caption[3] = "II";

  TRadioButton                 RadioButton5;
char RadioButton5_Caption[4] = "III";

  TRadioButton                 RadioButton6;
char RadioButton6_Caption[4] = "aVR";

  TRadioButton                 RadioButton7;
char RadioButton7_Caption[4] = "aVL";

  TRadioButton                 RadioButton8;
char RadioButton8_Caption[4] = "aVF";

  TRadioButton                 RadioButton9;
char RadioButton9_Caption[3] = "V1";

  TRadioButton                 RadioButton10;
char RadioButton10_Caption[3] = "V2";

  TRadioButton                 RadioButton11;
char RadioButton11_Caption[3] = "V3";

  TRadioButton                 RadioButton12;
char RadioButton12_Caption[3] = "V4";

  TRadioButton                 RadioButton13;
char RadioButton13_Caption[3] = "V5";

  TRadioButton                 RadioButton14;
char RadioButton14_Caption[3] = "V6";

  TLabel                 Label15;
char Label15_Caption[14] = "SINYAL NORMAL";

  TButton_Round          ButtonRound3;
char ButtonRound3_Caption[4] = "RUN";

  TLabel                 Label16;
char Label16_Caption[14] = "Pilih Lead : ";

  TButton_Round          ButtonRound4;
char ButtonRound4_Caption[5] = "BACK";

  TImage               Image3;
  TButton_Round          * const code Screen2_Buttons_Round[2]=
         {
         &ButtonRound3,        
         &ButtonRound4         
         };
  TLabel                 * const code Screen2_Labels[2]=
         {
         &Label15,             
         &Label16              
         };
  TImage                 * const code Screen2_Images[1]=
         {
         &Image3               
         };
  TRadioButton           * const code Screen2_RadioButtons[12]=
         {
         &RadioButton3,        
         &RadioButton4,        
         &RadioButton5,        
         &RadioButton6,        
         &RadioButton7,        
         &RadioButton8,        
         &RadioButton9,        
         &RadioButton10,       
         &RadioButton11,       
         &RadioButton12,       
         &RadioButton13,       
         &RadioButton14        
         };

  TScreen                Screen3;
  TRadioButton                 RadioButton1;
char RadioButton1_Caption[2] = "I";

  TRadioButton                 RadioButton2;
char RadioButton2_Caption[3] = "II";

  TRadioButton                 RadioButton15;
char RadioButton15_Caption[4] = "III";

  TRadioButton                 RadioButton16;
char RadioButton16_Caption[4] = "aVR";

  TRadioButton                 RadioButton17;
char RadioButton17_Caption[4] = "aVL";

  TRadioButton                 RadioButton18;
char RadioButton18_Caption[4] = "aVF";

  TRadioButton                 RadioButton19;
char RadioButton19_Caption[3] = "V1";

  TRadioButton                 RadioButton20;
char RadioButton20_Caption[3] = "V2";

  TRadioButton                 RadioButton21;
char RadioButton21_Caption[3] = "V3";

  TRadioButton                 RadioButton22;
char RadioButton22_Caption[3] = "V4";

  TRadioButton                 RadioButton23;
char RadioButton23_Caption[3] = "V5";

  TRadioButton                 RadioButton24;
char RadioButton24_Caption[3] = "V6";

  TLabel                 Label17;
char Label17_Caption[12] = "ANTERIOR MI";

  TButton_Round          ButtonRound5;
char ButtonRound5_Caption[4] = "RUN";

  TLabel                 Label18;
char Label18_Caption[14] = "Pilih Lead : ";

  TButton_Round          ButtonRound6;
char ButtonRound6_Caption[5] = "BACK";

  TImage               Image4;
  TButton_Round          * const code Screen3_Buttons_Round[2]=
         {
         &ButtonRound5,        
         &ButtonRound6         
         };
  TLabel                 * const code Screen3_Labels[2]=
         {
         &Label17,             
         &Label18              
         };
  TImage                 * const code Screen3_Images[1]=
         {
         &Image4               
         };
  TRadioButton           * const code Screen3_RadioButtons[12]=
         {
         &RadioButton1,        
         &RadioButton2,        
         &RadioButton15,       
         &RadioButton16,       
         &RadioButton17,       
         &RadioButton18,       
         &RadioButton19,       
         &RadioButton20,       
         &RadioButton21,       
         &RadioButton22,       
         &RadioButton23,       
         &RadioButton24        
         };

  TScreen                Screen4;
  TRadioButton                 RadioButton25;
char RadioButton25_Caption[2] = "I";

  TRadioButton                 RadioButton26;
char RadioButton26_Caption[3] = "II";

  TRadioButton                 RadioButton27;
char RadioButton27_Caption[4] = "III";

  TRadioButton                 RadioButton28;
char RadioButton28_Caption[4] = "aVR";

  TRadioButton                 RadioButton29;
char RadioButton29_Caption[4] = "aVL";

  TRadioButton                 RadioButton30;
char RadioButton30_Caption[4] = "aVF";

  TRadioButton                 RadioButton31;
char RadioButton31_Caption[3] = "V1";

  TRadioButton                 RadioButton32;
char RadioButton32_Caption[3] = "V2";

  TRadioButton                 RadioButton33;
char RadioButton33_Caption[3] = "V3";

  TRadioButton                 RadioButton34;
char RadioButton34_Caption[3] = "V4";

  TRadioButton                 RadioButton35;
char RadioButton35_Caption[3] = "V5";

  TRadioButton                 RadioButton36;
char RadioButton36_Caption[3] = "V6";

  TLabel                 Label20;
char Label20_Caption[12] = "INFERIOR MI";

  TButton_Round          ButtonRound7;
char ButtonRound7_Caption[4] = "RUN";

  TLabel                 Label21;
char Label21_Caption[14] = "Pilih Lead : ";

  TButton_Round          ButtonRound8;
char ButtonRound8_Caption[5] = "BACK";

  TImage               Image5;
  TButton_Round          * const code Screen4_Buttons_Round[2]=
         {
         &ButtonRound7,        
         &ButtonRound8         
         };
  TLabel                 * const code Screen4_Labels[2]=
         {
         &Label20,             
         &Label21              
         };
  TImage                 * const code Screen4_Images[1]=
         {
         &Image5               
         };
  TRadioButton           * const code Screen4_RadioButtons[12]=
         {
         &RadioButton25,       
         &RadioButton26,       
         &RadioButton27,       
         &RadioButton28,       
         &RadioButton29,       
         &RadioButton30,       
         &RadioButton31,       
         &RadioButton32,       
         &RadioButton33,       
         &RadioButton34,       
         &RadioButton35,       
         &RadioButton36        
         };

  TScreen                Screen5;
  TRadioButton                 RadioButton37;
char RadioButton37_Caption[2] = "I";

  TRadioButton                 RadioButton38;
char RadioButton38_Caption[3] = "II";

  TRadioButton                 RadioButton39;
char RadioButton39_Caption[4] = "III";

  TRadioButton                 RadioButton40;
char RadioButton40_Caption[4] = "aVR";

  TRadioButton                 RadioButton41;
char RadioButton41_Caption[4] = "aVL";

  TRadioButton                 RadioButton42;
char RadioButton42_Caption[4] = "aVF";

  TRadioButton                 RadioButton43;
char RadioButton43_Caption[3] = "V1";

  TRadioButton                 RadioButton44;
char RadioButton44_Caption[3] = "V2";

  TRadioButton                 RadioButton45;
char RadioButton45_Caption[3] = "V3";

  TRadioButton                 RadioButton46;
char RadioButton46_Caption[3] = "V4";

  TRadioButton                 RadioButton47;
char RadioButton47_Caption[3] = "V5";

  TRadioButton                 RadioButton48;
char RadioButton48_Caption[3] = "V6";

  TLabel                 Label22;
char Label22_Caption[10] = "SEPTAL MI";

  TButton_Round          ButtonRound9;
char ButtonRound9_Caption[4] = "RUN";

  TLabel                 Label23;
char Label23_Caption[14] = "Pilih Lead : ";

  TButton_Round          ButtonRound10;
char ButtonRound10_Caption[5] = "BACK";

  TImage               Image6;
  TButton_Round          * const code Screen5_Buttons_Round[2]=
         {
         &ButtonRound9,        
         &ButtonRound10        
         };
  TLabel                 * const code Screen5_Labels[2]=
         {
         &Label22,             
         &Label23              
         };
  TImage                 * const code Screen5_Images[1]=
         {
         &Image6               
         };
  TRadioButton           * const code Screen5_RadioButtons[12]=
         {
         &RadioButton37,       
         &RadioButton38,       
         &RadioButton39,       
         &RadioButton40,       
         &RadioButton41,       
         &RadioButton42,       
         &RadioButton43,       
         &RadioButton44,       
         &RadioButton45,       
         &RadioButton46,       
         &RadioButton47,       
         &RadioButton48        
         };

  TScreen                Screen6;
  TRadioButton                 RadioButton49;
char RadioButton49_Caption[2] = "I";

  TRadioButton                 RadioButton50;
char RadioButton50_Caption[3] = "II";

  TRadioButton                 RadioButton51;
char RadioButton51_Caption[4] = "III";

  TRadioButton                 RadioButton52;
char RadioButton52_Caption[4] = "aVR";

  TRadioButton                 RadioButton53;
char RadioButton53_Caption[4] = "aVL";

  TRadioButton                 RadioButton54;
char RadioButton54_Caption[4] = "aVF";

  TRadioButton                 RadioButton55;
char RadioButton55_Caption[3] = "V1";

  TRadioButton                 RadioButton56;
char RadioButton56_Caption[3] = "V2";

  TRadioButton                 RadioButton57;
char RadioButton57_Caption[3] = "V3";

  TRadioButton                 RadioButton58;
char RadioButton58_Caption[3] = "V4";

  TRadioButton                 RadioButton59;
char RadioButton59_Caption[3] = "V5";

  TRadioButton                 RadioButton60;
char RadioButton60_Caption[3] = "V6";

  TLabel                 Label24;
char Label24_Caption[11] = "LATERAL MI";

  TButton_Round          ButtonRound11;
char ButtonRound11_Caption[4] = "RUN";

  TLabel                 Label25;
char Label25_Caption[14] = "Pilih Lead : ";

  TButton_Round          ButtonRound12;
char ButtonRound12_Caption[5] = "BACK";

  TImage               Image7;
  TButton_Round          * const code Screen6_Buttons_Round[2]=
         {
         &ButtonRound11,       
         &ButtonRound12        
         };
  TLabel                 * const code Screen6_Labels[2]=
         {
         &Label24,             
         &Label25              
         };
  TImage                 * const code Screen6_Images[1]=
         {
         &Image7               
         };
  TRadioButton           * const code Screen6_RadioButtons[12]=
         {
         &RadioButton49,       
         &RadioButton50,       
         &RadioButton51,       
         &RadioButton52,       
         &RadioButton53,       
         &RadioButton54,       
         &RadioButton55,       
         &RadioButton56,       
         &RadioButton57,       
         &RadioButton58,       
         &RadioButton59,       
         &RadioButton60        
         };

  TScreen                Screen7;
  TRadioButton                 RadioButton61;
char RadioButton61_Caption[2] = "I";

  TRadioButton                 RadioButton62;
char RadioButton62_Caption[3] = "II";

  TRadioButton                 RadioButton63;
char RadioButton63_Caption[4] = "III";

  TRadioButton                 RadioButton64;
char RadioButton64_Caption[4] = "aVR";

  TRadioButton                 RadioButton65;
char RadioButton65_Caption[4] = "aVL";

  TRadioButton                 RadioButton66;
char RadioButton66_Caption[4] = "aVF";

  TRadioButton                 RadioButton67;
char RadioButton67_Caption[3] = "V1";

  TRadioButton                 RadioButton68;
char RadioButton68_Caption[3] = "V2";

  TRadioButton                 RadioButton69;
char RadioButton69_Caption[3] = "V3";

  TRadioButton                 RadioButton70;
char RadioButton70_Caption[3] = "V4";

  TRadioButton                 RadioButton71;
char RadioButton71_Caption[3] = "V5";

  TRadioButton                 RadioButton72;
char RadioButton72_Caption[3] = "V6";

  TLabel                 Label26;
char Label26_Caption[13] = "POSTERIOR MI";

  TButton_Round          ButtonRound13;
char ButtonRound13_Caption[4] = "RUN";

  TLabel                 Label27;
char Label27_Caption[14] = "Pilih Lead : ";

  TButton_Round          ButtonRound14;
char ButtonRound14_Caption[5] = "BACK";

  TImage               Image8;
  TButton_Round          * const code Screen7_Buttons_Round[2]=
         {
         &ButtonRound13,       
         &ButtonRound14        
         };
  TLabel                 * const code Screen7_Labels[2]=
         {
         &Label26,             
         &Label27              
         };
  TImage                 * const code Screen7_Images[1]=
         {
         &Image8               
         };
  TRadioButton           * const code Screen7_RadioButtons[12]=
         {
         &RadioButton61,       
         &RadioButton62,       
         &RadioButton63,       
         &RadioButton64,       
         &RadioButton65,       
         &RadioButton66,       
         &RadioButton67,       
         &RadioButton68,       
         &RadioButton69,       
         &RadioButton70,       
         &RadioButton71,       
         &RadioButton72        
         };

  TScreen                Screen8;
  TLabel                 Label28;
char Label28_Caption[29] = "Sinyal Myocardial Infarction";

  TBox                   Box1;
  TButton_Round          ButtonRound15;
char ButtonRound15_Caption[12] = "Anterior MI";

  TButton_Round          ButtonRound16;
char ButtonRound16_Caption[12] = "Inferior MI";

  TButton_Round          ButtonRound17;
char ButtonRound17_Caption[10] = "Septal MI";

  TButton_Round          ButtonRound18;
char ButtonRound18_Caption[11] = "Lateral MI";

  TButton_Round          ButtonRound19;
char ButtonRound19_Caption[13] = "Posterior MI";

  TButton_Round          ButtonRound20;
char ButtonRound20_Caption[5] = "BACK";

  TButton_Round          * const code Screen8_Buttons_Round[6]=
         {
         &ButtonRound15,       
         &ButtonRound16,       
         &ButtonRound17,       
         &ButtonRound18,       
         &ButtonRound19,       
         &ButtonRound20        
         };
  TLabel                 * const code Screen8_Labels[1]=
         {
         &Label28              
         };
  TBox                   * const code Screen8_Boxes[1]=
         {
         &Box1                 
         };



static void InitializeObjects() {
  Screen1.Color                     = 0xFFFF;
  Screen1.Width                     = 800;
  Screen1.Height                    = 480;
  Screen1.Buttons_RoundCount        = 4;
  Screen1.Buttons_Round             = Screen1_Buttons_Round;
  Screen1.LabelsCount               = 15;
  Screen1.Labels                    = Screen1_Labels;
  Screen1.ImagesCount               = 2;
  Screen1.Images                    = Screen1_Images;
  Screen1.BoxesCount                = 1;
  Screen1.Boxes                     = Screen1_Boxes;
  Screen1.Boxes_RoundCount          = 1;
  Screen1.Boxes_Round               = Screen1_Boxes_Round;
  Screen1.RadioButtonsCount         = 0;
  Screen1.ObjectsCount              = 23;
  Screen1.OnSwipeUpPtr    = 0;
  Screen1.OnSwipeDownPtr  = 0;
  Screen1.OnSwipeLeftPtr  = 0;
  Screen1.OnSwipeRightPtr = 0;
  Screen1.OnZoomInPtr     = 0;
  Screen1.OnZoomOutPtr    = 0;

  Screen2.Color                     = 0xFFFF;
  Screen2.Width                     = 800;
  Screen2.Height                    = 480;
  Screen2.Buttons_RoundCount        = 2;
  Screen2.Buttons_Round             = Screen2_Buttons_Round;
  Screen2.LabelsCount               = 2;
  Screen2.Labels                    = Screen2_Labels;
  Screen2.ImagesCount               = 1;
  Screen2.Images                    = Screen2_Images;
  Screen2.BoxesCount                = 0;
  Screen2.Boxes_RoundCount          = 0;
  Screen2.RadioButtonsCount         = 12;
  Screen2.RadioButtons              = Screen2_RadioButtons;
  Screen2.ObjectsCount              = 17;
  Screen2.OnSwipeUpPtr    = 0;
  Screen2.OnSwipeDownPtr  = 0;
  Screen2.OnSwipeLeftPtr  = 0;
  Screen2.OnSwipeRightPtr = 0;
  Screen2.OnZoomInPtr     = 0;
  Screen2.OnZoomOutPtr    = 0;

  Screen3.Color                     = 0xFFFF;
  Screen3.Width                     = 800;
  Screen3.Height                    = 480;
  Screen3.Buttons_RoundCount        = 2;
  Screen3.Buttons_Round             = Screen3_Buttons_Round;
  Screen3.LabelsCount               = 2;
  Screen3.Labels                    = Screen3_Labels;
  Screen3.ImagesCount               = 1;
  Screen3.Images                    = Screen3_Images;
  Screen3.BoxesCount                = 0;
  Screen3.Boxes_RoundCount          = 0;
  Screen3.RadioButtonsCount         = 12;
  Screen3.RadioButtons              = Screen3_RadioButtons;
  Screen3.ObjectsCount              = 17;
  Screen3.OnSwipeUpPtr    = 0;
  Screen3.OnSwipeDownPtr  = 0;
  Screen3.OnSwipeLeftPtr  = 0;
  Screen3.OnSwipeRightPtr = 0;
  Screen3.OnZoomInPtr     = 0;
  Screen3.OnZoomOutPtr    = 0;

  Screen4.Color                     = 0xFFFF;
  Screen4.Width                     = 800;
  Screen4.Height                    = 480;
  Screen4.Buttons_RoundCount        = 2;
  Screen4.Buttons_Round             = Screen4_Buttons_Round;
  Screen4.LabelsCount               = 2;
  Screen4.Labels                    = Screen4_Labels;
  Screen4.ImagesCount               = 1;
  Screen4.Images                    = Screen4_Images;
  Screen4.BoxesCount                = 0;
  Screen4.Boxes_RoundCount          = 0;
  Screen4.RadioButtonsCount         = 12;
  Screen4.RadioButtons              = Screen4_RadioButtons;
  Screen4.ObjectsCount              = 17;
  Screen4.OnSwipeUpPtr    = 0;
  Screen4.OnSwipeDownPtr  = 0;
  Screen4.OnSwipeLeftPtr  = 0;
  Screen4.OnSwipeRightPtr = 0;
  Screen4.OnZoomInPtr     = 0;
  Screen4.OnZoomOutPtr    = 0;

  Screen5.Color                     = 0xFFFF;
  Screen5.Width                     = 800;
  Screen5.Height                    = 480;
  Screen5.Buttons_RoundCount        = 2;
  Screen5.Buttons_Round             = Screen5_Buttons_Round;
  Screen5.LabelsCount               = 2;
  Screen5.Labels                    = Screen5_Labels;
  Screen5.ImagesCount               = 1;
  Screen5.Images                    = Screen5_Images;
  Screen5.BoxesCount                = 0;
  Screen5.Boxes_RoundCount          = 0;
  Screen5.RadioButtonsCount         = 12;
  Screen5.RadioButtons              = Screen5_RadioButtons;
  Screen5.ObjectsCount              = 17;
  Screen5.OnSwipeUpPtr    = 0;
  Screen5.OnSwipeDownPtr  = 0;
  Screen5.OnSwipeLeftPtr  = 0;
  Screen5.OnSwipeRightPtr = 0;
  Screen5.OnZoomInPtr     = 0;
  Screen5.OnZoomOutPtr    = 0;

  Screen6.Color                     = 0xFFFF;
  Screen6.Width                     = 800;
  Screen6.Height                    = 480;
  Screen6.Buttons_RoundCount        = 2;
  Screen6.Buttons_Round             = Screen6_Buttons_Round;
  Screen6.LabelsCount               = 2;
  Screen6.Labels                    = Screen6_Labels;
  Screen6.ImagesCount               = 1;
  Screen6.Images                    = Screen6_Images;
  Screen6.BoxesCount                = 0;
  Screen6.Boxes_RoundCount          = 0;
  Screen6.RadioButtonsCount         = 12;
  Screen6.RadioButtons              = Screen6_RadioButtons;
  Screen6.ObjectsCount              = 17;
  Screen6.OnSwipeUpPtr    = 0;
  Screen6.OnSwipeDownPtr  = 0;
  Screen6.OnSwipeLeftPtr  = 0;
  Screen6.OnSwipeRightPtr = 0;
  Screen6.OnZoomInPtr     = 0;
  Screen6.OnZoomOutPtr    = 0;

  Screen7.Color                     = 0xFFFF;
  Screen7.Width                     = 800;
  Screen7.Height                    = 480;
  Screen7.Buttons_RoundCount        = 2;
  Screen7.Buttons_Round             = Screen7_Buttons_Round;
  Screen7.LabelsCount               = 2;
  Screen7.Labels                    = Screen7_Labels;
  Screen7.ImagesCount               = 1;
  Screen7.Images                    = Screen7_Images;
  Screen7.BoxesCount                = 0;
  Screen7.Boxes_RoundCount          = 0;
  Screen7.RadioButtonsCount         = 12;
  Screen7.RadioButtons              = Screen7_RadioButtons;
  Screen7.ObjectsCount              = 17;
  Screen7.OnSwipeUpPtr    = 0;
  Screen7.OnSwipeDownPtr  = 0;
  Screen7.OnSwipeLeftPtr  = 0;
  Screen7.OnSwipeRightPtr = 0;
  Screen7.OnZoomInPtr     = 0;
  Screen7.OnZoomOutPtr    = 0;

  Screen8.Color                     = 0xFFFF;
  Screen8.Width                     = 800;
  Screen8.Height                    = 480;
  Screen8.Buttons_RoundCount        = 6;
  Screen8.Buttons_Round             = Screen8_Buttons_Round;
  Screen8.LabelsCount               = 1;
  Screen8.Labels                    = Screen8_Labels;
  Screen8.ImagesCount               = 0;
  Screen8.BoxesCount                = 1;
  Screen8.Boxes                     = Screen8_Boxes;
  Screen8.Boxes_RoundCount          = 0;
  Screen8.RadioButtonsCount         = 0;
  Screen8.ObjectsCount              = 8;
  Screen8.OnSwipeUpPtr    = 0;
  Screen8.OnSwipeDownPtr  = 0;
  Screen8.OnSwipeLeftPtr  = 0;
  Screen8.OnSwipeRightPtr = 0;
  Screen8.OnZoomInPtr     = 0;
  Screen8.OnZoomOutPtr    = 0;


  Box3.OwnerScreen     = &Screen1;
  Box3.Order           = 0;
  Box3.Left            = 33;
  Box3.Top             = 35;
  Box3.Width           = 447;
  Box3.Height          = 407;
  Box3.Pen_Width       = 1;
  Box3.Pen_Color       = 0x0000;
  Box3.Visible         = 1;
  Box3.Active          = 1;
  Box3.Transparent     = 1;
  Box3.Gradient        = 0;
  Box3.Gradient_Orientation = 0;
  Box3.Gradient_Start_Color = 0xFFFF;
  Box3.Gradient_End_Color = 0xC618;
  Box3.Color           = 0x000C;
  Box3.PressColEnabled = 1;
  Box3.Press_Color     = 0xE71C;

  Label1.OwnerScreen     = &Screen1;
  Label1.Order           = 1;
  Label1.Left            = 528;
  Label1.Top             = 168;
  Label1.Width           = 184;
  Label1.Height          = 21;
  Label1.Visible         = 1;
  Label1.Active          = 1;
  Label1.Caption         = Label1_Caption;
  Label1.FontName        = Tahoma19x19_Bold;
  Label1.Font_Color      = 0x0000;
  Label1.VerticalText    = 0;

  ButtonRound1.OwnerScreen     = &Screen1;
  ButtonRound1.Order           = 2;
  ButtonRound1.Left            = 559;
  ButtonRound1.Top             = 200;
  ButtonRound1.Width           = 114;
  ButtonRound1.Height          = 53;
  ButtonRound1.Pen_Width       = 1;
  ButtonRound1.Pen_Color       = 0x0000;
  ButtonRound1.Visible         = 1;
  ButtonRound1.Active          = 1;
  ButtonRound1.Transparent     = 1;
  ButtonRound1.Caption         = ButtonRound1_Caption;
  ButtonRound1.TextAlign       = _taCenter;
  ButtonRound1.TextAlignVertical= _tavMiddle;
  ButtonRound1.FontName        = Tahoma19x23_Regular;
  ButtonRound1.PressColEnabled = 1;
  ButtonRound1.Font_Color      = 0xFFFF;
  ButtonRound1.VerticalText    = 0;
  ButtonRound1.Gradient        = 0;
  ButtonRound1.Gradient_Orientation = 0;
  ButtonRound1.Gradient_Start_Color = 0xFFFF;
  ButtonRound1.Gradient_End_Color = 0xC618;
  ButtonRound1.Color           = 0x3013;
  ButtonRound1.Press_Color     = 0xE71C;
  ButtonRound1.Corner_Radius   = 3;
  ButtonRound1.OnClickPtr      = ButtonRound1OnClick;

  ButtonRound2.OwnerScreen     = &Screen1;
  ButtonRound2.Order           = 3;
  ButtonRound2.Left            = 558;
  ButtonRound2.Top             = 267;
  ButtonRound2.Width           = 114;
  ButtonRound2.Height          = 53;
  ButtonRound2.Pen_Width       = 1;
  ButtonRound2.Pen_Color       = 0x3013;
  ButtonRound2.Visible         = 1;
  ButtonRound2.Active          = 1;
  ButtonRound2.Transparent     = 1;
  ButtonRound2.Caption         = ButtonRound2_Caption;
  ButtonRound2.TextAlign       = _taCenter;
  ButtonRound2.TextAlignVertical= _tavMiddle;
  ButtonRound2.FontName        = Tahoma19x23_Regular;
  ButtonRound2.PressColEnabled = 1;
  ButtonRound2.Font_Color      = 0xFFFF;
  ButtonRound2.VerticalText    = 0;
  ButtonRound2.Gradient        = 0;
  ButtonRound2.Gradient_Orientation = 0;
  ButtonRound2.Gradient_Start_Color = 0xFFFF;
  ButtonRound2.Gradient_End_Color = 0xC618;
  ButtonRound2.Color           = 0x3013;
  ButtonRound2.Press_Color     = 0xE71C;
  ButtonRound2.Corner_Radius   = 3;
  ButtonRound2.OnClickPtr      = ButtonRound2OnClick;

  Label2.OwnerScreen     = &Screen1;
  Label2.Order           = 4;
  Label2.Left            = 42;
  Label2.Top             = 148;
  Label2.Width           = 149;
  Label2.Height          = 20;
  Label2.Visible         = 1;
  Label2.Active          = 1;
  Label2.Caption         = Label2_Caption;
  Label2.FontName        = Tahoma15x18_Regular;
  Label2.Font_Color      = 0xFFFF;
  Label2.VerticalText    = 0;

  Label3.OwnerScreen     = &Screen1;
  Label3.Order           = 5;
  Label3.Left            = 42;
  Label3.Top             = 168;
  Label3.Width           = 123;
  Label3.Height          = 20;
  Label3.Visible         = 1;
  Label3.Active          = 1;
  Label3.Caption         = Label3_Caption;
  Label3.FontName        = Tahoma15x18_Regular;
  Label3.Font_Color      = 0xFFFF;
  Label3.VerticalText    = 0;

  Label4.OwnerScreen     = &Screen1;
  Label4.Order           = 6;
  Label4.Left            = 42;
  Label4.Top             = 214;
  Label4.Width           = 344;
  Label4.Height          = 20;
  Label4.Visible         = 1;
  Label4.Active          = 1;
  Label4.Caption         = Label4_Caption;
  Label4.FontName        = Tahoma15x18_Regular;
  Label4.Font_Color      = 0xFFFF;
  Label4.VerticalText    = 0;

  Label5.OwnerScreen     = &Screen1;
  Label5.Order           = 7;
  Label5.Left            = 42;
  Label5.Top             = 236;
  Label5.Width           = 357;
  Label5.Height          = 20;
  Label5.Visible         = 1;
  Label5.Active          = 1;
  Label5.Caption         = Label5_Caption;
  Label5.FontName        = Tahoma15x18_Regular;
  Label5.Font_Color      = 0xFFFF;
  Label5.VerticalText    = 0;

  Label6.OwnerScreen     = &Screen1;
  Label6.Order           = 8;
  Label6.Left            = 42;
  Label6.Top             = 286;
  Label6.Width           = 246;
  Label6.Height          = 20;
  Label6.Visible         = 1;
  Label6.Active          = 1;
  Label6.Caption         = Label6_Caption;
  Label6.FontName        = Tahoma15x18_Regular;
  Label6.Font_Color      = 0xFFFF;
  Label6.VerticalText    = 0;

  Label7.OwnerScreen     = &Screen1;
  Label7.Order           = 9;
  Label7.Left            = 42;
  Label7.Top             = 338;
  Label7.Width           = 119;
  Label7.Height          = 20;
  Label7.Visible         = 1;
  Label7.Active          = 1;
  Label7.Caption         = Label7_Caption;
  Label7.FontName        = Tahoma15x18_Regular;
  Label7.Font_Color      = 0xFFFF;
  Label7.VerticalText    = 0;

  Label8.OwnerScreen     = &Screen1;
  Label8.Order           = 10;
  Label8.Left            = 42;
  Label8.Top             = 358;
  Label8.Width           = 205;
  Label8.Height          = 20;
  Label8.Visible         = 1;
  Label8.Active          = 1;
  Label8.Caption         = Label8_Caption;
  Label8.FontName        = Tahoma15x18_Regular;
  Label8.Font_Color      = 0xFFFF;
  Label8.VerticalText    = 0;

  Label9.OwnerScreen     = &Screen1;
  Label9.Order           = 11;
  Label9.Left            = 42;
  Label9.Top             = 380;
  Label9.Width           = 349;
  Label9.Height          = 20;
  Label9.Visible         = 1;
  Label9.Active          = 1;
  Label9.Caption         = Label9_Caption;
  Label9.FontName        = Tahoma15x18_Regular;
  Label9.Font_Color      = 0xFFFF;
  Label9.VerticalText    = 0;

  Label10.OwnerScreen     = &Screen1;
  Label10.Order           = 12;
  Label10.Left            = 42;
  Label10.Top             = 402;
  Label10.Width           = 259;
  Label10.Height          = 20;
  Label10.Visible         = 1;
  Label10.Active          = 1;
  Label10.Caption         = Label10_Caption;
  Label10.FontName        = Tahoma15x18_Regular;
  Label10.Font_Color      = 0xFFFF;
  Label10.VerticalText    = 0;

  Label11.OwnerScreen     = &Screen1;
  Label11.Order           = 13;
  Label11.Left            = 42;
  Label11.Top             = 51;
  Label11.Width           = 370;
  Label11.Height          = 21;
  Label11.Visible         = 1;
  Label11.Active          = 1;
  Label11.Caption         = Label11_Caption;
  Label11.FontName        = Tahoma19x19_Bold;
  Label11.Font_Color      = 0xFFFF;
  Label11.VerticalText    = 0;

  Image1.OwnerScreen     = &Screen1;
  Image1.Order           = 14;
  Image1.Left            = 516;
  Image1.Top             = 39;
  Image1.Width           = 100;
  Image1.Height          = 100;
  Image1.Picture_Type    = 1;
  Image1.Picture_Ratio   = 1;
  Image1.Picture_Name    = ITS1_jpg;
  Image1.Visible         = 1;
  Image1.Active          = 1;

  Label12.OwnerScreen     = &Screen1;
  Label12.Order           = 15;
  Label12.Left            = 42;
  Label12.Top             = 71;
  Label12.Width           = 436;
  Label12.Height          = 21;
  Label12.Visible         = 1;
  Label12.Active          = 1;
  Label12.Caption         = Label12_Caption;
  Label12.FontName        = Tahoma19x19_Bold;
  Label12.Font_Color      = 0xFFFF;
  Label12.VerticalText    = 0;

  Label13.OwnerScreen     = &Screen1;
  Label13.Order           = 16;
  Label13.Left            = 42;
  Label13.Top             = 91;
  Label13.Width           = 191;
  Label13.Height          = 21;
  Label13.Visible         = 1;
  Label13.Active          = 1;
  Label13.Caption         = Label13_Caption;
  Label13.FontName        = Tahoma19x19_Bold;
  Label13.Font_Color      = 0xFFFF;
  Label13.VerticalText    = 0;

  Image2.OwnerScreen     = &Screen1;
  Image2.Order           = 17;
  Image2.Left            = 636;
  Image2.Top             = 43;
  Image2.Width           = 100;
  Image2.Height          = 100;
  Image2.Picture_Type    = 1;
  Image2.Picture_Ratio   = 1;
  Image2.Picture_Name    = bme_jpg;
  Image2.Visible         = 1;
  Image2.Active          = 1;

  Label14.OwnerScreen     = &Screen1;
  Label14.Order           = 18;
  Label14.Left            = 528;
  Label14.Top             = 344;
  Label14.Width           = 152;
  Label14.Height          = 20;
  Label14.Visible         = 1;
  Label14.Active          = 1;
  Label14.Caption         = Label14_Caption;
  Label14.FontName        = Tahoma18x18_Bold;
  Label14.Font_Color      = 0x0000;
  Label14.VerticalText    = 0;

  BoxRound1.OwnerScreen     = &Screen1;
  BoxRound1.Order           = 19;
  BoxRound1.Left            = 559;
  BoxRound1.Top             = 380;
  BoxRound1.Width           = 114;
  BoxRound1.Height          = 53;
  BoxRound1.Pen_Width       = 1;
  BoxRound1.Pen_Color       = 0x0000;
  BoxRound1.Visible         = 1;
  BoxRound1.Active          = 1;
  BoxRound1.Transparent     = 1;
  BoxRound1.Gradient        = 0;
  BoxRound1.Gradient_Orientation = 0;
  BoxRound1.Gradient_Start_Color = 0xFFFF;
  BoxRound1.Gradient_End_Color = 0xC618;
  BoxRound1.Color           = 0x0000;
  BoxRound1.PressColEnabled = 1;
  BoxRound1.Press_Color     = 0xE71C;
  BoxRound1.Corner_Radius   = 3;

  Label19.OwnerScreen     = &Screen1;
  Label19.Order           = 20;
  Label19.Left            = 603;
  Label19.Top             = 395;
  Label19.Width           = 28;
  Label19.Height          = 25;
  Label19.Visible         = 1;
  Label19.Active          = 1;
  Label19.Caption         = Label19_Caption;
  Label19.FontName        = Tahoma19x23_Regular;
  Label19.Font_Color      = 0xFFFF;
  Label19.VerticalText    = 0;

  ButtonRound36.OwnerScreen     = &Screen1;
  ButtonRound36.Order           = 21;
  ButtonRound36.Left            = 683;
  ButtonRound36.Top             = 382;
  ButtonRound36.Width           = 41;
  ButtonRound36.Height          = 46;
  ButtonRound36.Pen_Width       = 1;
  ButtonRound36.Pen_Color       = 0xFFFF;
  ButtonRound36.Visible         = 1;
  ButtonRound36.Active          = 1;
  ButtonRound36.Transparent     = 1;
  ButtonRound36.Caption         = ButtonRound36_Caption;
  ButtonRound36.TextAlign       = _taCenter;
  ButtonRound36.TextAlignVertical= _tavMiddle;
  ButtonRound36.FontName        = Tahoma32x33_Bold;
  ButtonRound36.PressColEnabled = 1;
  ButtonRound36.Font_Color      = 0x3013;
  ButtonRound36.VerticalText    = 0;
  ButtonRound36.Gradient        = 0;
  ButtonRound36.Gradient_Orientation = 0;
  ButtonRound36.Gradient_Start_Color = 0xFFFF;
  ButtonRound36.Gradient_End_Color = 0xC618;
  ButtonRound36.Color           = 0xFFFF;
  ButtonRound36.Press_Color     = 0xE71C;
  ButtonRound36.Corner_Radius   = 3;
  ButtonRound36.OnClickPtr      = ButtonRound36OnClick;

  ButtonRound37.OwnerScreen     = &Screen1;
  ButtonRound37.Order           = 22;
  ButtonRound37.Left            = 516;
  ButtonRound37.Top             = 382;
  ButtonRound37.Width           = 36;
  ButtonRound37.Height          = 43;
  ButtonRound37.Pen_Width       = 1;
  ButtonRound37.Pen_Color       = 0xFFFF;
  ButtonRound37.Visible         = 1;
  ButtonRound37.Active          = 1;
  ButtonRound37.Transparent     = 1;
  ButtonRound37.Caption         = ButtonRound37_Caption;
  ButtonRound37.TextAlign       = _taCenter;
  ButtonRound37.TextAlignVertical= _tavMiddle;
  ButtonRound37.FontName        = Tahoma32x33_Bold;
  ButtonRound37.PressColEnabled = 1;
  ButtonRound37.Font_Color      = 0x3013;
  ButtonRound37.VerticalText    = 0;
  ButtonRound37.Gradient        = 0;
  ButtonRound37.Gradient_Orientation = 0;
  ButtonRound37.Gradient_Start_Color = 0xFFFF;
  ButtonRound37.Gradient_End_Color = 0xC618;
  ButtonRound37.Color           = 0xFFFF;
  ButtonRound37.Press_Color     = 0xE71C;
  ButtonRound37.Corner_Radius   = 3;
  ButtonRound37.OnClickPtr      = ButtonRound37OnClick;

  RadioButton3.OwnerScreen     = &Screen2;
  RadioButton3.Order           = 0;
  RadioButton3.Left            = 42;
  RadioButton3.Top             = 134;
  RadioButton3.Width           = 41;
  RadioButton3.Height          = 25;
  RadioButton3.Pen_Width       = 1;
  RadioButton3.Pen_Color       = 0x0000;
  RadioButton3.Visible         = 1;
  RadioButton3.Active          = 1;
  RadioButton3.Checked         = 0;
  RadioButton3.Transparent     = 1;
  RadioButton3.Caption         = RadioButton3_Caption;
  RadioButton3.TextAlign       = _taLeft;
  RadioButton3.FontName        = DejaVu_Serif16x19_Regular;
  RadioButton3.PressColEnabled = 1;
  RadioButton3.Font_Color      = 0x0000;
  RadioButton3.Gradient        = 0;
  RadioButton3.Gradient_Orientation = 0;
  RadioButton3.Gradient_Start_Color = 0xFFFF;
  RadioButton3.Gradient_End_Color = 0xC618;
  RadioButton3.Color           = 0xFFFF;
  RadioButton3.Press_Color     = 0xC618;
  RadioButton3.Background_Color = 0x0000;
  RadioButton3.OnPressPtr      = RadioButton3OnPress;

  RadioButton4.OwnerScreen     = &Screen2;
  RadioButton4.Order           = 1;
  RadioButton4.Left            = 42;
  RadioButton4.Top             = 174;
  RadioButton4.Width           = 47;
  RadioButton4.Height          = 25;
  RadioButton4.Pen_Width       = 1;
  RadioButton4.Pen_Color       = 0x0000;
  RadioButton4.Visible         = 1;
  RadioButton4.Active          = 1;
  RadioButton4.Checked         = 0;
  RadioButton4.Transparent     = 1;
  RadioButton4.Caption         = RadioButton4_Caption;
  RadioButton4.TextAlign       = _taLeft;
  RadioButton4.FontName        = DejaVu_Serif16x19_Regular;
  RadioButton4.PressColEnabled = 1;
  RadioButton4.Font_Color      = 0x0000;
  RadioButton4.Gradient        = 0;
  RadioButton4.Gradient_Orientation = 0;
  RadioButton4.Gradient_Start_Color = 0xFFFF;
  RadioButton4.Gradient_End_Color = 0xC618;
  RadioButton4.Color           = 0xFFFF;
  RadioButton4.Press_Color     = 0xE71C;
  RadioButton4.Background_Color = 0x0000;
  RadioButton4.OnPressPtr      = RadioButton4OnPress;

  RadioButton5.OwnerScreen     = &Screen2;
  RadioButton5.Order           = 2;
  RadioButton5.Left            = 42;
  RadioButton5.Top             = 214;
  RadioButton5.Width           = 54;
  RadioButton5.Height          = 25;
  RadioButton5.Pen_Width       = 1;
  RadioButton5.Pen_Color       = 0x0000;
  RadioButton5.Visible         = 1;
  RadioButton5.Active          = 1;
  RadioButton5.Checked         = 0;
  RadioButton5.Transparent     = 1;
  RadioButton5.Caption         = RadioButton5_Caption;
  RadioButton5.TextAlign       = _taLeft;
  RadioButton5.FontName        = DejaVu_Serif16x19_Regular;
  RadioButton5.PressColEnabled = 1;
  RadioButton5.Font_Color      = 0x0000;
  RadioButton5.Gradient        = 0;
  RadioButton5.Gradient_Orientation = 0;
  RadioButton5.Gradient_Start_Color = 0xFFFF;
  RadioButton5.Gradient_End_Color = 0xC618;
  RadioButton5.Color           = 0xFFFF;
  RadioButton5.Press_Color     = 0xE71C;
  RadioButton5.Background_Color = 0x0000;
  RadioButton5.OnPressPtr      = RadioButton5OnPress;

  RadioButton6.OwnerScreen     = &Screen2;
  RadioButton6.Order           = 3;
  RadioButton6.Left            = 42;
  RadioButton6.Top             = 254;
  RadioButton6.Width           = 68;
  RadioButton6.Height          = 25;
  RadioButton6.Pen_Width       = 1;
  RadioButton6.Pen_Color       = 0x0000;
  RadioButton6.Visible         = 1;
  RadioButton6.Active          = 1;
  RadioButton6.Checked         = 0;
  RadioButton6.Transparent     = 1;
  RadioButton6.Caption         = RadioButton6_Caption;
  RadioButton6.TextAlign       = _taLeft;
  RadioButton6.FontName        = DejaVu_Serif16x19_Regular;
  RadioButton6.PressColEnabled = 1;
  RadioButton6.Font_Color      = 0x0000;
  RadioButton6.Gradient        = 0;
  RadioButton6.Gradient_Orientation = 0;
  RadioButton6.Gradient_Start_Color = 0xFFFF;
  RadioButton6.Gradient_End_Color = 0xC618;
  RadioButton6.Color           = 0xFFFF;
  RadioButton6.Press_Color     = 0xE71C;
  RadioButton6.Background_Color = 0x0000;
  RadioButton6.OnPressPtr      = RadioButton6OnPress;

  RadioButton7.OwnerScreen     = &Screen2;
  RadioButton7.Order           = 4;
  RadioButton7.Left            = 42;
  RadioButton7.Top             = 294;
  RadioButton7.Width           = 67;
  RadioButton7.Height          = 25;
  RadioButton7.Pen_Width       = 1;
  RadioButton7.Pen_Color       = 0x0000;
  RadioButton7.Visible         = 1;
  RadioButton7.Active          = 1;
  RadioButton7.Checked         = 0;
  RadioButton7.Transparent     = 1;
  RadioButton7.Caption         = RadioButton7_Caption;
  RadioButton7.TextAlign       = _taLeft;
  RadioButton7.FontName        = DejaVu_Serif16x19_Regular;
  RadioButton7.PressColEnabled = 1;
  RadioButton7.Font_Color      = 0x0000;
  RadioButton7.Gradient        = 0;
  RadioButton7.Gradient_Orientation = 0;
  RadioButton7.Gradient_Start_Color = 0xFFFF;
  RadioButton7.Gradient_End_Color = 0xC618;
  RadioButton7.Color           = 0xFFFF;
  RadioButton7.Press_Color     = 0xE71C;
  RadioButton7.Background_Color = 0x0000;
  RadioButton7.OnPressPtr      = RadioButton7OnPress;

  RadioButton8.OwnerScreen     = &Screen2;
  RadioButton8.Order           = 5;
  RadioButton8.Left            = 42;
  RadioButton8.Top             = 335;
  RadioButton8.Width           = 67;
  RadioButton8.Height          = 25;
  RadioButton8.Pen_Width       = 1;
  RadioButton8.Pen_Color       = 0x0000;
  RadioButton8.Visible         = 1;
  RadioButton8.Active          = 1;
  RadioButton8.Checked         = 0;
  RadioButton8.Transparent     = 1;
  RadioButton8.Caption         = RadioButton8_Caption;
  RadioButton8.TextAlign       = _taLeft;
  RadioButton8.FontName        = DejaVu_Serif16x19_Regular;
  RadioButton8.PressColEnabled = 1;
  RadioButton8.Font_Color      = 0x0000;
  RadioButton8.Gradient        = 0;
  RadioButton8.Gradient_Orientation = 0;
  RadioButton8.Gradient_Start_Color = 0xFFFF;
  RadioButton8.Gradient_End_Color = 0xC618;
  RadioButton8.Color           = 0xFFFF;
  RadioButton8.Press_Color     = 0xE71C;
  RadioButton8.Background_Color = 0x0000;
  RadioButton8.OnPressPtr      = RadioButton8OnPress;

  RadioButton9.OwnerScreen     = &Screen2;
  RadioButton9.Order           = 6;
  RadioButton9.Left            = 139;
  RadioButton9.Top             = 134;
  RadioButton9.Width           = 57;
  RadioButton9.Height          = 25;
  RadioButton9.Pen_Width       = 1;
  RadioButton9.Pen_Color       = 0x0000;
  RadioButton9.Visible         = 1;
  RadioButton9.Active          = 1;
  RadioButton9.Checked         = 0;
  RadioButton9.Transparent     = 1;
  RadioButton9.Caption         = RadioButton9_Caption;
  RadioButton9.TextAlign       = _taLeft;
  RadioButton9.FontName        = DejaVu_Serif16x19_Regular;
  RadioButton9.PressColEnabled = 1;
  RadioButton9.Font_Color      = 0x0000;
  RadioButton9.Gradient        = 0;
  RadioButton9.Gradient_Orientation = 0;
  RadioButton9.Gradient_Start_Color = 0xFFFF;
  RadioButton9.Gradient_End_Color = 0xC618;
  RadioButton9.Color           = 0xFFFF;
  RadioButton9.Press_Color     = 0xE71C;
  RadioButton9.Background_Color = 0x0000;
  RadioButton9.OnPressPtr      = RadioButton9OnPress;

  RadioButton10.OwnerScreen     = &Screen2;
  RadioButton10.Order           = 7;
  RadioButton10.Left            = 139;
  RadioButton10.Top             = 174;
  RadioButton10.Width           = 57;
  RadioButton10.Height          = 25;
  RadioButton10.Pen_Width       = 1;
  RadioButton10.Pen_Color       = 0x0000;
  RadioButton10.Visible         = 1;
  RadioButton10.Active          = 1;
  RadioButton10.Checked         = 0;
  RadioButton10.Transparent     = 1;
  RadioButton10.Caption         = RadioButton10_Caption;
  RadioButton10.TextAlign       = _taLeft;
  RadioButton10.FontName        = DejaVu_Serif16x19_Regular;
  RadioButton10.PressColEnabled = 1;
  RadioButton10.Font_Color      = 0x0000;
  RadioButton10.Gradient        = 0;
  RadioButton10.Gradient_Orientation = 0;
  RadioButton10.Gradient_Start_Color = 0xFFFF;
  RadioButton10.Gradient_End_Color = 0xC618;
  RadioButton10.Color           = 0xFFFF;
  RadioButton10.Press_Color     = 0xE71C;
  RadioButton10.Background_Color = 0x0000;
  RadioButton10.OnPressPtr      = RadioButton10OnPress;

  RadioButton11.OwnerScreen     = &Screen2;
  RadioButton11.Order           = 8;
  RadioButton11.Left            = 139;
  RadioButton11.Top             = 214;
  RadioButton11.Width           = 57;
  RadioButton11.Height          = 25;
  RadioButton11.Pen_Width       = 1;
  RadioButton11.Pen_Color       = 0x0000;
  RadioButton11.Visible         = 1;
  RadioButton11.Active          = 1;
  RadioButton11.Checked         = 0;
  RadioButton11.Transparent     = 1;
  RadioButton11.Caption         = RadioButton11_Caption;
  RadioButton11.TextAlign       = _taLeft;
  RadioButton11.FontName        = DejaVu_Serif16x19_Regular;
  RadioButton11.PressColEnabled = 1;
  RadioButton11.Font_Color      = 0x0000;
  RadioButton11.Gradient        = 0;
  RadioButton11.Gradient_Orientation = 0;
  RadioButton11.Gradient_Start_Color = 0xFFFF;
  RadioButton11.Gradient_End_Color = 0xC618;
  RadioButton11.Color           = 0xFFFF;
  RadioButton11.Press_Color     = 0xE71C;
  RadioButton11.Background_Color = 0x0000;
  RadioButton11.OnPressPtr      = RadioButton11OnPress;

  RadioButton12.OwnerScreen     = &Screen2;
  RadioButton12.Order           = 9;
  RadioButton12.Left            = 139;
  RadioButton12.Top             = 254;
  RadioButton12.Width           = 57;
  RadioButton12.Height          = 25;
  RadioButton12.Pen_Width       = 1;
  RadioButton12.Pen_Color       = 0x0000;
  RadioButton12.Visible         = 1;
  RadioButton12.Active          = 1;
  RadioButton12.Checked         = 0;
  RadioButton12.Transparent     = 1;
  RadioButton12.Caption         = RadioButton12_Caption;
  RadioButton12.TextAlign       = _taLeft;
  RadioButton12.FontName        = DejaVu_Serif16x19_Regular;
  RadioButton12.PressColEnabled = 1;
  RadioButton12.Font_Color      = 0x0000;
  RadioButton12.Gradient        = 0;
  RadioButton12.Gradient_Orientation = 0;
  RadioButton12.Gradient_Start_Color = 0xFFFF;
  RadioButton12.Gradient_End_Color = 0xC618;
  RadioButton12.Color           = 0xFFFF;
  RadioButton12.Press_Color     = 0xE71C;
  RadioButton12.Background_Color = 0x0000;
  RadioButton12.OnPressPtr      = RadioButton12OnPress;

  RadioButton13.OwnerScreen     = &Screen2;
  RadioButton13.Order           = 10;
  RadioButton13.Left            = 139;
  RadioButton13.Top             = 292;
  RadioButton13.Width           = 57;
  RadioButton13.Height          = 25;
  RadioButton13.Pen_Width       = 1;
  RadioButton13.Pen_Color       = 0x0000;
  RadioButton13.Visible         = 1;
  RadioButton13.Active          = 1;
  RadioButton13.Checked         = 0;
  RadioButton13.Transparent     = 1;
  RadioButton13.Caption         = RadioButton13_Caption;
  RadioButton13.TextAlign       = _taLeft;
  RadioButton13.FontName        = DejaVu_Serif16x19_Regular;
  RadioButton13.PressColEnabled = 1;
  RadioButton13.Font_Color      = 0x0000;
  RadioButton13.Gradient        = 0;
  RadioButton13.Gradient_Orientation = 0;
  RadioButton13.Gradient_Start_Color = 0xFFFF;
  RadioButton13.Gradient_End_Color = 0xC618;
  RadioButton13.Color           = 0xFFFF;
  RadioButton13.Press_Color     = 0xE71C;
  RadioButton13.Background_Color = 0x0000;
  RadioButton13.OnPressPtr      = RadioButton13OnPress;

  RadioButton14.OwnerScreen     = &Screen2;
  RadioButton14.Order           = 11;
  RadioButton14.Left            = 140;
  RadioButton14.Top             = 335;
  RadioButton14.Width           = 57;
  RadioButton14.Height          = 25;
  RadioButton14.Pen_Width       = 1;
  RadioButton14.Pen_Color       = 0x0000;
  RadioButton14.Visible         = 1;
  RadioButton14.Active          = 1;
  RadioButton14.Checked         = 0;
  RadioButton14.Transparent     = 1;
  RadioButton14.Caption         = RadioButton14_Caption;
  RadioButton14.TextAlign       = _taLeft;
  RadioButton14.FontName        = DejaVu_Serif16x19_Regular;
  RadioButton14.PressColEnabled = 1;
  RadioButton14.Font_Color      = 0x0000;
  RadioButton14.Gradient        = 0;
  RadioButton14.Gradient_Orientation = 0;
  RadioButton14.Gradient_Start_Color = 0xFFFF;
  RadioButton14.Gradient_End_Color = 0xC618;
  RadioButton14.Color           = 0xFFFF;
  RadioButton14.Press_Color     = 0xE71C;
  RadioButton14.Background_Color = 0x0000;
  RadioButton14.OnPressPtr      = RadioButton14OnPress;

  Label15.OwnerScreen     = &Screen2;
  Label15.Order           = 12;
  Label15.Left            = 376;
  Label15.Top             = 38;
  Label15.Width           = 201;
  Label15.Height          = 26;
  Label15.Visible         = 1;
  Label15.Active          = 1;
  Label15.Caption         = Label15_Caption;
  Label15.FontName        = DejaVu_Serif22x24_Bold;
  Label15.Font_Color      = 0x0000;
  Label15.VerticalText    = 0;

  ButtonRound3.OwnerScreen     = &Screen2;
  ButtonRound3.Order           = 13;
  ButtonRound3.Left            = 631;
  ButtonRound3.Top             = 402;
  ButtonRound3.Width           = 109;
  ButtonRound3.Height          = 53;
  ButtonRound3.Pen_Width       = 1;
  ButtonRound3.Pen_Color       = 0x07E0;
  ButtonRound3.Visible         = 1;
  ButtonRound3.Active          = 1;
  ButtonRound3.Transparent     = 1;
  ButtonRound3.Caption         = ButtonRound3_Caption;
  ButtonRound3.TextAlign       = _taCenter;
  ButtonRound3.TextAlignVertical= _tavMiddle;
  ButtonRound3.FontName        = Tahoma25x25_Bold;
  ButtonRound3.PressColEnabled = 1;
  ButtonRound3.Font_Color      = 0xFFFF;
  ButtonRound3.VerticalText    = 0;
  ButtonRound3.Gradient        = 0;
  ButtonRound3.Gradient_Orientation = 0;
  ButtonRound3.Gradient_Start_Color = 0xFFFF;
  ButtonRound3.Gradient_End_Color = 0xC618;
  ButtonRound3.Color           = 0x07E0;
  ButtonRound3.Press_Color     = 0xE71C;
  ButtonRound3.Corner_Radius   = 3;
  ButtonRound3.OnClickPtr      = ButtonRound3OnClick;

  Label16.OwnerScreen     = &Screen2;
  Label16.Order           = 14;
  Label16.Left            = 43;
  Label16.Top             = 81;
  Label16.Width           = 100;
  Label16.Height          = 21;
  Label16.Visible         = 1;
  Label16.Active          = 1;
  Label16.Caption         = Label16_Caption;
  Label16.FontName        = DejaVu_Serif16x19_Regular;
  Label16.Font_Color      = 0x0000;
  Label16.VerticalText    = 0;

  ButtonRound4.OwnerScreen     = &Screen2;
  ButtonRound4.Order           = 15;
  ButtonRound4.Left            = 227;
  ButtonRound4.Top             = 402;
  ButtonRound4.Width           = 109;
  ButtonRound4.Height          = 53;
  ButtonRound4.Pen_Width       = 1;
  ButtonRound4.Pen_Color       = 0xEB2F;
  ButtonRound4.Visible         = 1;
  ButtonRound4.Active          = 1;
  ButtonRound4.Transparent     = 1;
  ButtonRound4.Caption         = ButtonRound4_Caption;
  ButtonRound4.TextAlign       = _taCenter;
  ButtonRound4.TextAlignVertical= _tavMiddle;
  ButtonRound4.FontName        = Tahoma25x25_Bold;
  ButtonRound4.PressColEnabled = 1;
  ButtonRound4.Font_Color      = 0xFFFF;
  ButtonRound4.VerticalText    = 0;
  ButtonRound4.Gradient        = 0;
  ButtonRound4.Gradient_Orientation = 0;
  ButtonRound4.Gradient_Start_Color = 0xFFFF;
  ButtonRound4.Gradient_End_Color = 0xC618;
  ButtonRound4.Color           = 0xEB2F;
  ButtonRound4.Press_Color     = 0xE71C;
  ButtonRound4.Corner_Radius   = 3;
  ButtonRound4.OnClickPtr      = ButtonRound4OnClick;

  Image3.OwnerScreen     = &Screen2;
  Image3.Order           = 16;
  Image3.Left            = 225;
  Image3.Top             = 85;
  Image3.Width           = 517;
  Image3.Height          = 298;
  Image3.Picture_Type    = 1;
  Image3.Picture_Ratio   = 1;
  Image3.Picture_Name    = GridLine1_jpg;
  Image3.Visible         = 1;
  Image3.Active          = 1;

  RadioButton1.OwnerScreen     = &Screen3;
  RadioButton1.Order           = 0;
  RadioButton1.Left            = 42;
  RadioButton1.Top             = 134;
  RadioButton1.Width           = 41;
  RadioButton1.Height          = 25;
  RadioButton1.Pen_Width       = 1;
  RadioButton1.Pen_Color       = 0x0000;
  RadioButton1.Visible         = 1;
  RadioButton1.Active          = 1;
  RadioButton1.Checked         = 0;
  RadioButton1.Transparent     = 1;
  RadioButton1.Caption         = RadioButton1_Caption;
  RadioButton1.TextAlign       = _taLeft;
  RadioButton1.FontName        = DejaVu_Serif16x19_Regular;
  RadioButton1.PressColEnabled = 1;
  RadioButton1.Font_Color      = 0x0000;
  RadioButton1.Gradient        = 0;
  RadioButton1.Gradient_Orientation = 0;
  RadioButton1.Gradient_Start_Color = 0xFFFF;
  RadioButton1.Gradient_End_Color = 0xC618;
  RadioButton1.Color           = 0xFFFF;
  RadioButton1.Press_Color     = 0xC618;
  RadioButton1.Background_Color = 0x0000;
  RadioButton1.OnPressPtr      = RadioButton1OnPress;

  RadioButton2.OwnerScreen     = &Screen3;
  RadioButton2.Order           = 1;
  RadioButton2.Left            = 42;
  RadioButton2.Top             = 174;
  RadioButton2.Width           = 47;
  RadioButton2.Height          = 25;
  RadioButton2.Pen_Width       = 1;
  RadioButton2.Pen_Color       = 0x0000;
  RadioButton2.Visible         = 1;
  RadioButton2.Active          = 1;
  RadioButton2.Checked         = 0;
  RadioButton2.Transparent     = 1;
  RadioButton2.Caption         = RadioButton2_Caption;
  RadioButton2.TextAlign       = _taLeft;
  RadioButton2.FontName        = DejaVu_Serif16x19_Regular;
  RadioButton2.PressColEnabled = 1;
  RadioButton2.Font_Color      = 0x0000;
  RadioButton2.Gradient        = 0;
  RadioButton2.Gradient_Orientation = 0;
  RadioButton2.Gradient_Start_Color = 0xFFFF;
  RadioButton2.Gradient_End_Color = 0xC618;
  RadioButton2.Color           = 0xFFFF;
  RadioButton2.Press_Color     = 0xE71C;
  RadioButton2.Background_Color = 0x0000;
  RadioButton2.OnPressPtr      = RadioButton2OnPress;

  RadioButton15.OwnerScreen     = &Screen3;
  RadioButton15.Order           = 2;
  RadioButton15.Left            = 42;
  RadioButton15.Top             = 214;
  RadioButton15.Width           = 54;
  RadioButton15.Height          = 25;
  RadioButton15.Pen_Width       = 1;
  RadioButton15.Pen_Color       = 0x0000;
  RadioButton15.Visible         = 1;
  RadioButton15.Active          = 1;
  RadioButton15.Checked         = 0;
  RadioButton15.Transparent     = 1;
  RadioButton15.Caption         = RadioButton15_Caption;
  RadioButton15.TextAlign       = _taLeft;
  RadioButton15.FontName        = DejaVu_Serif16x19_Regular;
  RadioButton15.PressColEnabled = 1;
  RadioButton15.Font_Color      = 0x0000;
  RadioButton15.Gradient        = 0;
  RadioButton15.Gradient_Orientation = 0;
  RadioButton15.Gradient_Start_Color = 0xFFFF;
  RadioButton15.Gradient_End_Color = 0xC618;
  RadioButton15.Color           = 0xFFFF;
  RadioButton15.Press_Color     = 0xE71C;
  RadioButton15.Background_Color = 0x0000;
  RadioButton15.OnPressPtr      = RadioButton15OnPress;

  RadioButton16.OwnerScreen     = &Screen3;
  RadioButton16.Order           = 3;
  RadioButton16.Left            = 43;
  RadioButton16.Top             = 254;
  RadioButton16.Width           = 68;
  RadioButton16.Height          = 25;
  RadioButton16.Pen_Width       = 1;
  RadioButton16.Pen_Color       = 0x0000;
  RadioButton16.Visible         = 1;
  RadioButton16.Active          = 1;
  RadioButton16.Checked         = 0;
  RadioButton16.Transparent     = 1;
  RadioButton16.Caption         = RadioButton16_Caption;
  RadioButton16.TextAlign       = _taLeft;
  RadioButton16.FontName        = DejaVu_Serif16x19_Regular;
  RadioButton16.PressColEnabled = 1;
  RadioButton16.Font_Color      = 0x0000;
  RadioButton16.Gradient        = 0;
  RadioButton16.Gradient_Orientation = 0;
  RadioButton16.Gradient_Start_Color = 0xFFFF;
  RadioButton16.Gradient_End_Color = 0xC618;
  RadioButton16.Color           = 0xFFFF;
  RadioButton16.Press_Color     = 0xE71C;
  RadioButton16.Background_Color = 0x0000;
  RadioButton16.OnPressPtr      = RadioButton16OnPress;

  RadioButton17.OwnerScreen     = &Screen3;
  RadioButton17.Order           = 4;
  RadioButton17.Left            = 42;
  RadioButton17.Top             = 294;
  RadioButton17.Width           = 67;
  RadioButton17.Height          = 25;
  RadioButton17.Pen_Width       = 1;
  RadioButton17.Pen_Color       = 0x0000;
  RadioButton17.Visible         = 1;
  RadioButton17.Active          = 1;
  RadioButton17.Checked         = 0;
  RadioButton17.Transparent     = 1;
  RadioButton17.Caption         = RadioButton17_Caption;
  RadioButton17.TextAlign       = _taLeft;
  RadioButton17.FontName        = DejaVu_Serif16x19_Regular;
  RadioButton17.PressColEnabled = 1;
  RadioButton17.Font_Color      = 0x0000;
  RadioButton17.Gradient        = 0;
  RadioButton17.Gradient_Orientation = 0;
  RadioButton17.Gradient_Start_Color = 0xFFFF;
  RadioButton17.Gradient_End_Color = 0xC618;
  RadioButton17.Color           = 0xFFFF;
  RadioButton17.Press_Color     = 0xE71C;
  RadioButton17.Background_Color = 0x0000;
  RadioButton17.OnPressPtr      = RadioButton17OnPress;

  RadioButton18.OwnerScreen     = &Screen3;
  RadioButton18.Order           = 5;
  RadioButton18.Left            = 42;
  RadioButton18.Top             = 335;
  RadioButton18.Width           = 67;
  RadioButton18.Height          = 25;
  RadioButton18.Pen_Width       = 1;
  RadioButton18.Pen_Color       = 0x0000;
  RadioButton18.Visible         = 1;
  RadioButton18.Active          = 1;
  RadioButton18.Checked         = 0;
  RadioButton18.Transparent     = 1;
  RadioButton18.Caption         = RadioButton18_Caption;
  RadioButton18.TextAlign       = _taLeft;
  RadioButton18.FontName        = DejaVu_Serif16x19_Regular;
  RadioButton18.PressColEnabled = 1;
  RadioButton18.Font_Color      = 0x0000;
  RadioButton18.Gradient        = 0;
  RadioButton18.Gradient_Orientation = 0;
  RadioButton18.Gradient_Start_Color = 0xFFFF;
  RadioButton18.Gradient_End_Color = 0xC618;
  RadioButton18.Color           = 0xFFFF;
  RadioButton18.Press_Color     = 0xE71C;
  RadioButton18.Background_Color = 0x0000;
  RadioButton18.OnPressPtr      = RadioButton18OnPress;

  RadioButton19.OwnerScreen     = &Screen3;
  RadioButton19.Order           = 6;
  RadioButton19.Left            = 139;
  RadioButton19.Top             = 134;
  RadioButton19.Width           = 57;
  RadioButton19.Height          = 25;
  RadioButton19.Pen_Width       = 1;
  RadioButton19.Pen_Color       = 0x0000;
  RadioButton19.Visible         = 1;
  RadioButton19.Active          = 1;
  RadioButton19.Checked         = 0;
  RadioButton19.Transparent     = 1;
  RadioButton19.Caption         = RadioButton19_Caption;
  RadioButton19.TextAlign       = _taLeft;
  RadioButton19.FontName        = DejaVu_Serif16x19_Regular;
  RadioButton19.PressColEnabled = 1;
  RadioButton19.Font_Color      = 0x0000;
  RadioButton19.Gradient        = 0;
  RadioButton19.Gradient_Orientation = 0;
  RadioButton19.Gradient_Start_Color = 0xFFFF;
  RadioButton19.Gradient_End_Color = 0xC618;
  RadioButton19.Color           = 0xFFFF;
  RadioButton19.Press_Color     = 0xE71C;
  RadioButton19.Background_Color = 0x0000;
  RadioButton19.OnPressPtr      = RadioButton19OnPress;

  RadioButton20.OwnerScreen     = &Screen3;
  RadioButton20.Order           = 7;
  RadioButton20.Left            = 139;
  RadioButton20.Top             = 174;
  RadioButton20.Width           = 57;
  RadioButton20.Height          = 25;
  RadioButton20.Pen_Width       = 1;
  RadioButton20.Pen_Color       = 0x0000;
  RadioButton20.Visible         = 1;
  RadioButton20.Active          = 1;
  RadioButton20.Checked         = 0;
  RadioButton20.Transparent     = 1;
  RadioButton20.Caption         = RadioButton20_Caption;
  RadioButton20.TextAlign       = _taLeft;
  RadioButton20.FontName        = DejaVu_Serif16x19_Regular;
  RadioButton20.PressColEnabled = 1;
  RadioButton20.Font_Color      = 0x0000;
  RadioButton20.Gradient        = 0;
  RadioButton20.Gradient_Orientation = 0;
  RadioButton20.Gradient_Start_Color = 0xFFFF;
  RadioButton20.Gradient_End_Color = 0xC618;
  RadioButton20.Color           = 0xFFFF;
  RadioButton20.Press_Color     = 0xE71C;
  RadioButton20.Background_Color = 0x0000;
  RadioButton20.OnPressPtr      = RadioButton20OnPress;

  RadioButton21.OwnerScreen     = &Screen3;
  RadioButton21.Order           = 8;
  RadioButton21.Left            = 139;
  RadioButton21.Top             = 214;
  RadioButton21.Width           = 57;
  RadioButton21.Height          = 25;
  RadioButton21.Pen_Width       = 1;
  RadioButton21.Pen_Color       = 0x0000;
  RadioButton21.Visible         = 1;
  RadioButton21.Active          = 1;
  RadioButton21.Checked         = 0;
  RadioButton21.Transparent     = 1;
  RadioButton21.Caption         = RadioButton21_Caption;
  RadioButton21.TextAlign       = _taLeft;
  RadioButton21.FontName        = DejaVu_Serif16x19_Regular;
  RadioButton21.PressColEnabled = 1;
  RadioButton21.Font_Color      = 0x0000;
  RadioButton21.Gradient        = 0;
  RadioButton21.Gradient_Orientation = 0;
  RadioButton21.Gradient_Start_Color = 0xFFFF;
  RadioButton21.Gradient_End_Color = 0xC618;
  RadioButton21.Color           = 0xFFFF;
  RadioButton21.Press_Color     = 0xE71C;
  RadioButton21.Background_Color = 0x0000;
  RadioButton21.OnPressPtr      = RadioButton21OnPress;

  RadioButton22.OwnerScreen     = &Screen3;
  RadioButton22.Order           = 9;
  RadioButton22.Left            = 139;
  RadioButton22.Top             = 254;
  RadioButton22.Width           = 57;
  RadioButton22.Height          = 25;
  RadioButton22.Pen_Width       = 1;
  RadioButton22.Pen_Color       = 0x0000;
  RadioButton22.Visible         = 1;
  RadioButton22.Active          = 1;
  RadioButton22.Checked         = 0;
  RadioButton22.Transparent     = 1;
  RadioButton22.Caption         = RadioButton22_Caption;
  RadioButton22.TextAlign       = _taLeft;
  RadioButton22.FontName        = DejaVu_Serif16x19_Regular;
  RadioButton22.PressColEnabled = 1;
  RadioButton22.Font_Color      = 0x0000;
  RadioButton22.Gradient        = 0;
  RadioButton22.Gradient_Orientation = 0;
  RadioButton22.Gradient_Start_Color = 0xFFFF;
  RadioButton22.Gradient_End_Color = 0xC618;
  RadioButton22.Color           = 0xFFFF;
  RadioButton22.Press_Color     = 0xE71C;
  RadioButton22.Background_Color = 0x0000;
  RadioButton22.OnPressPtr      = RadioButton22OnPress;

  RadioButton23.OwnerScreen     = &Screen3;
  RadioButton23.Order           = 10;
  RadioButton23.Left            = 139;
  RadioButton23.Top             = 292;
  RadioButton23.Width           = 57;
  RadioButton23.Height          = 25;
  RadioButton23.Pen_Width       = 1;
  RadioButton23.Pen_Color       = 0x0000;
  RadioButton23.Visible         = 1;
  RadioButton23.Active          = 1;
  RadioButton23.Checked         = 0;
  RadioButton23.Transparent     = 1;
  RadioButton23.Caption         = RadioButton23_Caption;
  RadioButton23.TextAlign       = _taLeft;
  RadioButton23.FontName        = DejaVu_Serif16x19_Regular;
  RadioButton23.PressColEnabled = 1;
  RadioButton23.Font_Color      = 0x0000;
  RadioButton23.Gradient        = 0;
  RadioButton23.Gradient_Orientation = 0;
  RadioButton23.Gradient_Start_Color = 0xFFFF;
  RadioButton23.Gradient_End_Color = 0xC618;
  RadioButton23.Color           = 0xFFFF;
  RadioButton23.Press_Color     = 0xE71C;
  RadioButton23.Background_Color = 0x0000;
  RadioButton23.OnPressPtr      = RadioButton23OnPress;

  RadioButton24.OwnerScreen     = &Screen3;
  RadioButton24.Order           = 11;
  RadioButton24.Left            = 140;
  RadioButton24.Top             = 335;
  RadioButton24.Width           = 57;
  RadioButton24.Height          = 25;
  RadioButton24.Pen_Width       = 1;
  RadioButton24.Pen_Color       = 0x0000;
  RadioButton24.Visible         = 1;
  RadioButton24.Active          = 1;
  RadioButton24.Checked         = 0;
  RadioButton24.Transparent     = 1;
  RadioButton24.Caption         = RadioButton24_Caption;
  RadioButton24.TextAlign       = _taLeft;
  RadioButton24.FontName        = DejaVu_Serif16x19_Regular;
  RadioButton24.PressColEnabled = 1;
  RadioButton24.Font_Color      = 0x0000;
  RadioButton24.Gradient        = 0;
  RadioButton24.Gradient_Orientation = 0;
  RadioButton24.Gradient_Start_Color = 0xFFFF;
  RadioButton24.Gradient_End_Color = 0xC618;
  RadioButton24.Color           = 0xFFFF;
  RadioButton24.Press_Color     = 0xE71C;
  RadioButton24.Background_Color = 0x0000;
  RadioButton24.OnPressPtr      = RadioButton24OnPress;

  Label17.OwnerScreen     = &Screen3;
  Label17.Order           = 12;
  Label17.Left            = 391;
  Label17.Top             = 37;
  Label17.Width           = 164;
  Label17.Height          = 26;
  Label17.Visible         = 1;
  Label17.Active          = 1;
  Label17.Caption         = Label17_Caption;
  Label17.FontName        = DejaVu_Serif22x24_Bold;
  Label17.Font_Color      = 0x0000;
  Label17.VerticalText    = 0;

  ButtonRound5.OwnerScreen     = &Screen3;
  ButtonRound5.Order           = 13;
  ButtonRound5.Left            = 631;
  ButtonRound5.Top             = 402;
  ButtonRound5.Width           = 109;
  ButtonRound5.Height          = 53;
  ButtonRound5.Pen_Width       = 1;
  ButtonRound5.Pen_Color       = 0x07E0;
  ButtonRound5.Visible         = 1;
  ButtonRound5.Active          = 1;
  ButtonRound5.Transparent     = 1;
  ButtonRound5.Caption         = ButtonRound5_Caption;
  ButtonRound5.TextAlign       = _taCenter;
  ButtonRound5.TextAlignVertical= _tavMiddle;
  ButtonRound5.FontName        = Tahoma25x25_Bold;
  ButtonRound5.PressColEnabled = 1;
  ButtonRound5.Font_Color      = 0xFFFF;
  ButtonRound5.VerticalText    = 0;
  ButtonRound5.Gradient        = 0;
  ButtonRound5.Gradient_Orientation = 0;
  ButtonRound5.Gradient_Start_Color = 0xFFFF;
  ButtonRound5.Gradient_End_Color = 0xC618;
  ButtonRound5.Color           = 0x07E0;
  ButtonRound5.Press_Color     = 0xE71C;
  ButtonRound5.Corner_Radius   = 3;
  ButtonRound5.OnClickPtr      = ButtonRound5OnClick;

  Label18.OwnerScreen     = &Screen3;
  Label18.Order           = 14;
  Label18.Left            = 43;
  Label18.Top             = 81;
  Label18.Width           = 100;
  Label18.Height          = 21;
  Label18.Visible         = 1;
  Label18.Active          = 1;
  Label18.Caption         = Label18_Caption;
  Label18.FontName        = DejaVu_Serif16x19_Regular;
  Label18.Font_Color      = 0x0000;
  Label18.VerticalText    = 0;

  ButtonRound6.OwnerScreen     = &Screen3;
  ButtonRound6.Order           = 15;
  ButtonRound6.Left            = 227;
  ButtonRound6.Top             = 402;
  ButtonRound6.Width           = 109;
  ButtonRound6.Height          = 53;
  ButtonRound6.Pen_Width       = 1;
  ButtonRound6.Pen_Color       = 0xEB2F;
  ButtonRound6.Visible         = 1;
  ButtonRound6.Active          = 1;
  ButtonRound6.Transparent     = 1;
  ButtonRound6.Caption         = ButtonRound6_Caption;
  ButtonRound6.TextAlign       = _taCenter;
  ButtonRound6.TextAlignVertical= _tavMiddle;
  ButtonRound6.FontName        = Tahoma25x25_Bold;
  ButtonRound6.PressColEnabled = 1;
  ButtonRound6.Font_Color      = 0xFFFF;
  ButtonRound6.VerticalText    = 0;
  ButtonRound6.Gradient        = 0;
  ButtonRound6.Gradient_Orientation = 0;
  ButtonRound6.Gradient_Start_Color = 0xFFFF;
  ButtonRound6.Gradient_End_Color = 0xC618;
  ButtonRound6.Color           = 0xEB2F;
  ButtonRound6.Press_Color     = 0xE71C;
  ButtonRound6.Corner_Radius   = 3;
  ButtonRound6.OnClickPtr      = ButtonRound6OnClick;

  Image4.OwnerScreen     = &Screen3;
  Image4.Order           = 16;
  Image4.Left            = 225;
  Image4.Top             = 84;
  Image4.Width           = 517;
  Image4.Height          = 298;
  Image4.Picture_Type    = 1;
  Image4.Picture_Ratio   = 1;
  Image4.Picture_Name    = GridLine1_jpg;
  Image4.Visible         = 1;
  Image4.Active          = 1;

  RadioButton25.OwnerScreen     = &Screen4;
  RadioButton25.Order           = 0;
  RadioButton25.Left            = 42;
  RadioButton25.Top             = 134;
  RadioButton25.Width           = 41;
  RadioButton25.Height          = 25;
  RadioButton25.Pen_Width       = 1;
  RadioButton25.Pen_Color       = 0x0000;
  RadioButton25.Visible         = 1;
  RadioButton25.Active          = 1;
  RadioButton25.Checked         = 0;
  RadioButton25.Transparent     = 1;
  RadioButton25.Caption         = RadioButton25_Caption;
  RadioButton25.TextAlign       = _taLeft;
  RadioButton25.FontName        = DejaVu_Serif16x19_Regular;
  RadioButton25.PressColEnabled = 1;
  RadioButton25.Font_Color      = 0x0000;
  RadioButton25.Gradient        = 0;
  RadioButton25.Gradient_Orientation = 0;
  RadioButton25.Gradient_Start_Color = 0xFFFF;
  RadioButton25.Gradient_End_Color = 0xC618;
  RadioButton25.Color           = 0xFFFF;
  RadioButton25.Press_Color     = 0xC618;
  RadioButton25.Background_Color = 0x0000;
  RadioButton25.OnPressPtr      = RadioButton25OnPress;

  RadioButton26.OwnerScreen     = &Screen4;
  RadioButton26.Order           = 1;
  RadioButton26.Left            = 42;
  RadioButton26.Top             = 174;
  RadioButton26.Width           = 47;
  RadioButton26.Height          = 25;
  RadioButton26.Pen_Width       = 1;
  RadioButton26.Pen_Color       = 0x0000;
  RadioButton26.Visible         = 1;
  RadioButton26.Active          = 1;
  RadioButton26.Checked         = 0;
  RadioButton26.Transparent     = 1;
  RadioButton26.Caption         = RadioButton26_Caption;
  RadioButton26.TextAlign       = _taLeft;
  RadioButton26.FontName        = DejaVu_Serif16x19_Regular;
  RadioButton26.PressColEnabled = 1;
  RadioButton26.Font_Color      = 0x0000;
  RadioButton26.Gradient        = 0;
  RadioButton26.Gradient_Orientation = 0;
  RadioButton26.Gradient_Start_Color = 0xFFFF;
  RadioButton26.Gradient_End_Color = 0xC618;
  RadioButton26.Color           = 0xFFFF;
  RadioButton26.Press_Color     = 0xE71C;
  RadioButton26.Background_Color = 0x0000;
  RadioButton26.OnPressPtr      = RadioButton26OnPress;

  RadioButton27.OwnerScreen     = &Screen4;
  RadioButton27.Order           = 2;
  RadioButton27.Left            = 42;
  RadioButton27.Top             = 214;
  RadioButton27.Width           = 54;
  RadioButton27.Height          = 25;
  RadioButton27.Pen_Width       = 1;
  RadioButton27.Pen_Color       = 0x0000;
  RadioButton27.Visible         = 1;
  RadioButton27.Active          = 1;
  RadioButton27.Checked         = 0;
  RadioButton27.Transparent     = 1;
  RadioButton27.Caption         = RadioButton27_Caption;
  RadioButton27.TextAlign       = _taLeft;
  RadioButton27.FontName        = DejaVu_Serif16x19_Regular;
  RadioButton27.PressColEnabled = 1;
  RadioButton27.Font_Color      = 0x0000;
  RadioButton27.Gradient        = 0;
  RadioButton27.Gradient_Orientation = 0;
  RadioButton27.Gradient_Start_Color = 0xFFFF;
  RadioButton27.Gradient_End_Color = 0xC618;
  RadioButton27.Color           = 0xFFFF;
  RadioButton27.Press_Color     = 0xE71C;
  RadioButton27.Background_Color = 0x0000;
  RadioButton27.OnPressPtr      = RadioButton27OnPress;

  RadioButton28.OwnerScreen     = &Screen4;
  RadioButton28.Order           = 3;
  RadioButton28.Left            = 42;
  RadioButton28.Top             = 254;
  RadioButton28.Width           = 68;
  RadioButton28.Height          = 25;
  RadioButton28.Pen_Width       = 1;
  RadioButton28.Pen_Color       = 0x0000;
  RadioButton28.Visible         = 1;
  RadioButton28.Active          = 1;
  RadioButton28.Checked         = 0;
  RadioButton28.Transparent     = 1;
  RadioButton28.Caption         = RadioButton28_Caption;
  RadioButton28.TextAlign       = _taLeft;
  RadioButton28.FontName        = DejaVu_Serif16x19_Regular;
  RadioButton28.PressColEnabled = 1;
  RadioButton28.Font_Color      = 0x0000;
  RadioButton28.Gradient        = 0;
  RadioButton28.Gradient_Orientation = 0;
  RadioButton28.Gradient_Start_Color = 0xFFFF;
  RadioButton28.Gradient_End_Color = 0xC618;
  RadioButton28.Color           = 0xFFFF;
  RadioButton28.Press_Color     = 0xE71C;
  RadioButton28.Background_Color = 0x0000;
  RadioButton28.OnPressPtr      = RadioButton28OnPress;

  RadioButton29.OwnerScreen     = &Screen4;
  RadioButton29.Order           = 4;
  RadioButton29.Left            = 42;
  RadioButton29.Top             = 294;
  RadioButton29.Width           = 67;
  RadioButton29.Height          = 25;
  RadioButton29.Pen_Width       = 1;
  RadioButton29.Pen_Color       = 0x0000;
  RadioButton29.Visible         = 1;
  RadioButton29.Active          = 1;
  RadioButton29.Checked         = 0;
  RadioButton29.Transparent     = 1;
  RadioButton29.Caption         = RadioButton29_Caption;
  RadioButton29.TextAlign       = _taLeft;
  RadioButton29.FontName        = DejaVu_Serif16x19_Regular;
  RadioButton29.PressColEnabled = 1;
  RadioButton29.Font_Color      = 0x0000;
  RadioButton29.Gradient        = 0;
  RadioButton29.Gradient_Orientation = 0;
  RadioButton29.Gradient_Start_Color = 0xFFFF;
  RadioButton29.Gradient_End_Color = 0xC618;
  RadioButton29.Color           = 0xFFFF;
  RadioButton29.Press_Color     = 0xE71C;
  RadioButton29.Background_Color = 0x0000;
  RadioButton29.OnPressPtr      = RadioButton29OnPress;

  RadioButton30.OwnerScreen     = &Screen4;
  RadioButton30.Order           = 5;
  RadioButton30.Left            = 42;
  RadioButton30.Top             = 335;
  RadioButton30.Width           = 67;
  RadioButton30.Height          = 25;
  RadioButton30.Pen_Width       = 1;
  RadioButton30.Pen_Color       = 0x0000;
  RadioButton30.Visible         = 1;
  RadioButton30.Active          = 1;
  RadioButton30.Checked         = 0;
  RadioButton30.Transparent     = 1;
  RadioButton30.Caption         = RadioButton30_Caption;
  RadioButton30.TextAlign       = _taLeft;
  RadioButton30.FontName        = DejaVu_Serif16x19_Regular;
  RadioButton30.PressColEnabled = 1;
  RadioButton30.Font_Color      = 0x0000;
  RadioButton30.Gradient        = 0;
  RadioButton30.Gradient_Orientation = 0;
  RadioButton30.Gradient_Start_Color = 0xFFFF;
  RadioButton30.Gradient_End_Color = 0xC618;
  RadioButton30.Color           = 0xFFFF;
  RadioButton30.Press_Color     = 0xE71C;
  RadioButton30.Background_Color = 0x0000;
  RadioButton30.OnPressPtr      = RadioButton30OnPress;

  RadioButton31.OwnerScreen     = &Screen4;
  RadioButton31.Order           = 6;
  RadioButton31.Left            = 139;
  RadioButton31.Top             = 134;
  RadioButton31.Width           = 57;
  RadioButton31.Height          = 25;
  RadioButton31.Pen_Width       = 1;
  RadioButton31.Pen_Color       = 0x0000;
  RadioButton31.Visible         = 1;
  RadioButton31.Active          = 1;
  RadioButton31.Checked         = 0;
  RadioButton31.Transparent     = 1;
  RadioButton31.Caption         = RadioButton31_Caption;
  RadioButton31.TextAlign       = _taLeft;
  RadioButton31.FontName        = DejaVu_Serif16x19_Regular;
  RadioButton31.PressColEnabled = 1;
  RadioButton31.Font_Color      = 0x0000;
  RadioButton31.Gradient        = 0;
  RadioButton31.Gradient_Orientation = 0;
  RadioButton31.Gradient_Start_Color = 0xFFFF;
  RadioButton31.Gradient_End_Color = 0xC618;
  RadioButton31.Color           = 0xFFFF;
  RadioButton31.Press_Color     = 0xE71C;
  RadioButton31.Background_Color = 0x0000;
  RadioButton31.OnPressPtr      = RadioButton31OnPress;

  RadioButton32.OwnerScreen     = &Screen4;
  RadioButton32.Order           = 7;
  RadioButton32.Left            = 139;
  RadioButton32.Top             = 174;
  RadioButton32.Width           = 57;
  RadioButton32.Height          = 25;
  RadioButton32.Pen_Width       = 1;
  RadioButton32.Pen_Color       = 0x0000;
  RadioButton32.Visible         = 1;
  RadioButton32.Active          = 1;
  RadioButton32.Checked         = 0;
  RadioButton32.Transparent     = 1;
  RadioButton32.Caption         = RadioButton32_Caption;
  RadioButton32.TextAlign       = _taLeft;
  RadioButton32.FontName        = DejaVu_Serif16x19_Regular;
  RadioButton32.PressColEnabled = 1;
  RadioButton32.Font_Color      = 0x0000;
  RadioButton32.Gradient        = 0;
  RadioButton32.Gradient_Orientation = 0;
  RadioButton32.Gradient_Start_Color = 0xFFFF;
  RadioButton32.Gradient_End_Color = 0xC618;
  RadioButton32.Color           = 0xFFFF;
  RadioButton32.Press_Color     = 0xE71C;
  RadioButton32.Background_Color = 0x0000;
  RadioButton32.OnPressPtr      = RadioButton32OnPress;

  RadioButton33.OwnerScreen     = &Screen4;
  RadioButton33.Order           = 8;
  RadioButton33.Left            = 139;
  RadioButton33.Top             = 214;
  RadioButton33.Width           = 57;
  RadioButton33.Height          = 25;
  RadioButton33.Pen_Width       = 1;
  RadioButton33.Pen_Color       = 0x0000;
  RadioButton33.Visible         = 1;
  RadioButton33.Active          = 1;
  RadioButton33.Checked         = 0;
  RadioButton33.Transparent     = 1;
  RadioButton33.Caption         = RadioButton33_Caption;
  RadioButton33.TextAlign       = _taLeft;
  RadioButton33.FontName        = DejaVu_Serif16x19_Regular;
  RadioButton33.PressColEnabled = 1;
  RadioButton33.Font_Color      = 0x0000;
  RadioButton33.Gradient        = 0;
  RadioButton33.Gradient_Orientation = 0;
  RadioButton33.Gradient_Start_Color = 0xFFFF;
  RadioButton33.Gradient_End_Color = 0xC618;
  RadioButton33.Color           = 0xFFFF;
  RadioButton33.Press_Color     = 0xE71C;
  RadioButton33.Background_Color = 0x0000;
  RadioButton33.OnPressPtr      = RadioButton33OnPress;

  RadioButton34.OwnerScreen     = &Screen4;
  RadioButton34.Order           = 9;
  RadioButton34.Left            = 139;
  RadioButton34.Top             = 254;
  RadioButton34.Width           = 57;
  RadioButton34.Height          = 25;
  RadioButton34.Pen_Width       = 1;
  RadioButton34.Pen_Color       = 0x0000;
  RadioButton34.Visible         = 1;
  RadioButton34.Active          = 1;
  RadioButton34.Checked         = 0;
  RadioButton34.Transparent     = 1;
  RadioButton34.Caption         = RadioButton34_Caption;
  RadioButton34.TextAlign       = _taLeft;
  RadioButton34.FontName        = DejaVu_Serif16x19_Regular;
  RadioButton34.PressColEnabled = 1;
  RadioButton34.Font_Color      = 0x0000;
  RadioButton34.Gradient        = 0;
  RadioButton34.Gradient_Orientation = 0;
  RadioButton34.Gradient_Start_Color = 0xFFFF;
  RadioButton34.Gradient_End_Color = 0xC618;
  RadioButton34.Color           = 0xFFFF;
  RadioButton34.Press_Color     = 0xE71C;
  RadioButton34.Background_Color = 0x0000;
  RadioButton34.OnPressPtr      = RadioButton34OnPress;

  RadioButton35.OwnerScreen     = &Screen4;
  RadioButton35.Order           = 10;
  RadioButton35.Left            = 139;
  RadioButton35.Top             = 292;
  RadioButton35.Width           = 57;
  RadioButton35.Height          = 25;
  RadioButton35.Pen_Width       = 1;
  RadioButton35.Pen_Color       = 0x0000;
  RadioButton35.Visible         = 1;
  RadioButton35.Active          = 1;
  RadioButton35.Checked         = 0;
  RadioButton35.Transparent     = 1;
  RadioButton35.Caption         = RadioButton35_Caption;
  RadioButton35.TextAlign       = _taLeft;
  RadioButton35.FontName        = DejaVu_Serif16x19_Regular;
  RadioButton35.PressColEnabled = 1;
  RadioButton35.Font_Color      = 0x0000;
  RadioButton35.Gradient        = 0;
  RadioButton35.Gradient_Orientation = 0;
  RadioButton35.Gradient_Start_Color = 0xFFFF;
  RadioButton35.Gradient_End_Color = 0xC618;
  RadioButton35.Color           = 0xFFFF;
  RadioButton35.Press_Color     = 0xE71C;
  RadioButton35.Background_Color = 0x0000;
  RadioButton35.OnPressPtr      = RadioButton35OnPress;

  RadioButton36.OwnerScreen     = &Screen4;
  RadioButton36.Order           = 11;
  RadioButton36.Left            = 140;
  RadioButton36.Top             = 335;
  RadioButton36.Width           = 57;
  RadioButton36.Height          = 25;
  RadioButton36.Pen_Width       = 1;
  RadioButton36.Pen_Color       = 0x0000;
  RadioButton36.Visible         = 1;
  RadioButton36.Active          = 1;
  RadioButton36.Checked         = 0;
  RadioButton36.Transparent     = 1;
  RadioButton36.Caption         = RadioButton36_Caption;
  RadioButton36.TextAlign       = _taLeft;
  RadioButton36.FontName        = DejaVu_Serif16x19_Regular;
  RadioButton36.PressColEnabled = 1;
  RadioButton36.Font_Color      = 0x0000;
  RadioButton36.Gradient        = 0;
  RadioButton36.Gradient_Orientation = 0;
  RadioButton36.Gradient_Start_Color = 0xFFFF;
  RadioButton36.Gradient_End_Color = 0xC618;
  RadioButton36.Color           = 0xFFFF;
  RadioButton36.Press_Color     = 0xE71C;
  RadioButton36.Background_Color = 0x0000;
  RadioButton36.OnPressPtr      = RadioButton36OnPress;

  Label20.OwnerScreen     = &Screen4;
  Label20.Order           = 12;
  Label20.Left            = 391;
  Label20.Top             = 37;
  Label20.Width           = 158;
  Label20.Height          = 26;
  Label20.Visible         = 1;
  Label20.Active          = 1;
  Label20.Caption         = Label20_Caption;
  Label20.FontName        = DejaVu_Serif22x24_Bold;
  Label20.Font_Color      = 0x0000;
  Label20.VerticalText    = 0;

  ButtonRound7.OwnerScreen     = &Screen4;
  ButtonRound7.Order           = 13;
  ButtonRound7.Left            = 631;
  ButtonRound7.Top             = 402;
  ButtonRound7.Width           = 109;
  ButtonRound7.Height          = 53;
  ButtonRound7.Pen_Width       = 1;
  ButtonRound7.Pen_Color       = 0x07E0;
  ButtonRound7.Visible         = 1;
  ButtonRound7.Active          = 1;
  ButtonRound7.Transparent     = 1;
  ButtonRound7.Caption         = ButtonRound7_Caption;
  ButtonRound7.TextAlign       = _taCenter;
  ButtonRound7.TextAlignVertical= _tavMiddle;
  ButtonRound7.FontName        = Tahoma25x25_Bold;
  ButtonRound7.PressColEnabled = 1;
  ButtonRound7.Font_Color      = 0xFFFF;
  ButtonRound7.VerticalText    = 0;
  ButtonRound7.Gradient        = 0;
  ButtonRound7.Gradient_Orientation = 0;
  ButtonRound7.Gradient_Start_Color = 0xFFFF;
  ButtonRound7.Gradient_End_Color = 0xC618;
  ButtonRound7.Color           = 0x07E0;
  ButtonRound7.Press_Color     = 0xE71C;
  ButtonRound7.Corner_Radius   = 3;
  ButtonRound7.OnClickPtr      = ButtonRound7OnClick;

  Label21.OwnerScreen     = &Screen4;
  Label21.Order           = 14;
  Label21.Left            = 43;
  Label21.Top             = 81;
  Label21.Width           = 100;
  Label21.Height          = 21;
  Label21.Visible         = 1;
  Label21.Active          = 1;
  Label21.Caption         = Label21_Caption;
  Label21.FontName        = DejaVu_Serif16x19_Regular;
  Label21.Font_Color      = 0x0000;
  Label21.VerticalText    = 0;

  ButtonRound8.OwnerScreen     = &Screen4;
  ButtonRound8.Order           = 15;
  ButtonRound8.Left            = 227;
  ButtonRound8.Top             = 402;
  ButtonRound8.Width           = 109;
  ButtonRound8.Height          = 53;
  ButtonRound8.Pen_Width       = 1;
  ButtonRound8.Pen_Color       = 0xEB2F;
  ButtonRound8.Visible         = 1;
  ButtonRound8.Active          = 1;
  ButtonRound8.Transparent     = 1;
  ButtonRound8.Caption         = ButtonRound8_Caption;
  ButtonRound8.TextAlign       = _taCenter;
  ButtonRound8.TextAlignVertical= _tavMiddle;
  ButtonRound8.FontName        = Tahoma25x25_Bold;
  ButtonRound8.PressColEnabled = 1;
  ButtonRound8.Font_Color      = 0xFFFF;
  ButtonRound8.VerticalText    = 0;
  ButtonRound8.Gradient        = 0;
  ButtonRound8.Gradient_Orientation = 0;
  ButtonRound8.Gradient_Start_Color = 0xFFFF;
  ButtonRound8.Gradient_End_Color = 0xC618;
  ButtonRound8.Color           = 0xEB2F;
  ButtonRound8.Press_Color     = 0xE71C;
  ButtonRound8.Corner_Radius   = 3;
  ButtonRound8.OnClickPtr      = ButtonRound8OnClick;

  Image5.OwnerScreen     = &Screen4;
  Image5.Order           = 16;
  Image5.Left            = 225;
  Image5.Top             = 85;
  Image5.Width           = 517;
  Image5.Height          = 298;
  Image5.Picture_Type    = 1;
  Image5.Picture_Ratio   = 1;
  Image5.Picture_Name    = GridLine1_jpg;
  Image5.Visible         = 1;
  Image5.Active          = 1;

  RadioButton37.OwnerScreen     = &Screen5;
  RadioButton37.Order           = 0;
  RadioButton37.Left            = 42;
  RadioButton37.Top             = 134;
  RadioButton37.Width           = 41;
  RadioButton37.Height          = 25;
  RadioButton37.Pen_Width       = 1;
  RadioButton37.Pen_Color       = 0x0000;
  RadioButton37.Visible         = 1;
  RadioButton37.Active          = 1;
  RadioButton37.Checked         = 0;
  RadioButton37.Transparent     = 1;
  RadioButton37.Caption         = RadioButton37_Caption;
  RadioButton37.TextAlign       = _taLeft;
  RadioButton37.FontName        = DejaVu_Serif16x19_Regular;
  RadioButton37.PressColEnabled = 1;
  RadioButton37.Font_Color      = 0x0000;
  RadioButton37.Gradient        = 0;
  RadioButton37.Gradient_Orientation = 0;
  RadioButton37.Gradient_Start_Color = 0xFFFF;
  RadioButton37.Gradient_End_Color = 0xC618;
  RadioButton37.Color           = 0xFFFF;
  RadioButton37.Press_Color     = 0xC618;
  RadioButton37.Background_Color = 0x0000;
  RadioButton37.OnPressPtr      = RadioButton37OnPress;

  RadioButton38.OwnerScreen     = &Screen5;
  RadioButton38.Order           = 1;
  RadioButton38.Left            = 42;
  RadioButton38.Top             = 174;
  RadioButton38.Width           = 47;
  RadioButton38.Height          = 25;
  RadioButton38.Pen_Width       = 1;
  RadioButton38.Pen_Color       = 0x0000;
  RadioButton38.Visible         = 1;
  RadioButton38.Active          = 1;
  RadioButton38.Checked         = 0;
  RadioButton38.Transparent     = 1;
  RadioButton38.Caption         = RadioButton38_Caption;
  RadioButton38.TextAlign       = _taLeft;
  RadioButton38.FontName        = DejaVu_Serif16x19_Regular;
  RadioButton38.PressColEnabled = 1;
  RadioButton38.Font_Color      = 0x0000;
  RadioButton38.Gradient        = 0;
  RadioButton38.Gradient_Orientation = 0;
  RadioButton38.Gradient_Start_Color = 0xFFFF;
  RadioButton38.Gradient_End_Color = 0xC618;
  RadioButton38.Color           = 0xFFFF;
  RadioButton38.Press_Color     = 0xE71C;
  RadioButton38.Background_Color = 0x0000;
  RadioButton38.OnPressPtr      = RadioButton38OnPress;

  RadioButton39.OwnerScreen     = &Screen5;
  RadioButton39.Order           = 2;
  RadioButton39.Left            = 42;
  RadioButton39.Top             = 214;
  RadioButton39.Width           = 54;
  RadioButton39.Height          = 25;
  RadioButton39.Pen_Width       = 1;
  RadioButton39.Pen_Color       = 0x0000;
  RadioButton39.Visible         = 1;
  RadioButton39.Active          = 1;
  RadioButton39.Checked         = 0;
  RadioButton39.Transparent     = 1;
  RadioButton39.Caption         = RadioButton39_Caption;
  RadioButton39.TextAlign       = _taLeft;
  RadioButton39.FontName        = DejaVu_Serif16x19_Regular;
  RadioButton39.PressColEnabled = 1;
  RadioButton39.Font_Color      = 0x0000;
  RadioButton39.Gradient        = 0;
  RadioButton39.Gradient_Orientation = 0;
  RadioButton39.Gradient_Start_Color = 0xFFFF;
  RadioButton39.Gradient_End_Color = 0xC618;
  RadioButton39.Color           = 0xFFFF;
  RadioButton39.Press_Color     = 0xE71C;
  RadioButton39.Background_Color = 0x0000;
  RadioButton39.OnPressPtr      = RadioButton39OnPress;

  RadioButton40.OwnerScreen     = &Screen5;
  RadioButton40.Order           = 3;
  RadioButton40.Left            = 42;
  RadioButton40.Top             = 254;
  RadioButton40.Width           = 68;
  RadioButton40.Height          = 25;
  RadioButton40.Pen_Width       = 1;
  RadioButton40.Pen_Color       = 0x0000;
  RadioButton40.Visible         = 1;
  RadioButton40.Active          = 1;
  RadioButton40.Checked         = 0;
  RadioButton40.Transparent     = 1;
  RadioButton40.Caption         = RadioButton40_Caption;
  RadioButton40.TextAlign       = _taLeft;
  RadioButton40.FontName        = DejaVu_Serif16x19_Regular;
  RadioButton40.PressColEnabled = 1;
  RadioButton40.Font_Color      = 0x0000;
  RadioButton40.Gradient        = 0;
  RadioButton40.Gradient_Orientation = 0;
  RadioButton40.Gradient_Start_Color = 0xFFFF;
  RadioButton40.Gradient_End_Color = 0xC618;
  RadioButton40.Color           = 0xFFFF;
  RadioButton40.Press_Color     = 0xE71C;
  RadioButton40.Background_Color = 0x0000;
  RadioButton40.OnPressPtr      = RadioButton40OnPress;

  RadioButton41.OwnerScreen     = &Screen5;
  RadioButton41.Order           = 4;
  RadioButton41.Left            = 42;
  RadioButton41.Top             = 294;
  RadioButton41.Width           = 67;
  RadioButton41.Height          = 25;
  RadioButton41.Pen_Width       = 1;
  RadioButton41.Pen_Color       = 0x0000;
  RadioButton41.Visible         = 1;
  RadioButton41.Active          = 1;
  RadioButton41.Checked         = 0;
  RadioButton41.Transparent     = 1;
  RadioButton41.Caption         = RadioButton41_Caption;
  RadioButton41.TextAlign       = _taLeft;
  RadioButton41.FontName        = DejaVu_Serif16x19_Regular;
  RadioButton41.PressColEnabled = 1;
  RadioButton41.Font_Color      = 0x0000;
  RadioButton41.Gradient        = 0;
  RadioButton41.Gradient_Orientation = 0;
  RadioButton41.Gradient_Start_Color = 0xFFFF;
  RadioButton41.Gradient_End_Color = 0xC618;
  RadioButton41.Color           = 0xFFFF;
  RadioButton41.Press_Color     = 0xE71C;
  RadioButton41.Background_Color = 0x0000;
  RadioButton41.OnPressPtr      = RadioButton41OnPress;

  RadioButton42.OwnerScreen     = &Screen5;
  RadioButton42.Order           = 5;
  RadioButton42.Left            = 42;
  RadioButton42.Top             = 335;
  RadioButton42.Width           = 67;
  RadioButton42.Height          = 25;
  RadioButton42.Pen_Width       = 1;
  RadioButton42.Pen_Color       = 0x0000;
  RadioButton42.Visible         = 1;
  RadioButton42.Active          = 1;
  RadioButton42.Checked         = 0;
  RadioButton42.Transparent     = 1;
  RadioButton42.Caption         = RadioButton42_Caption;
  RadioButton42.TextAlign       = _taLeft;
  RadioButton42.FontName        = DejaVu_Serif16x19_Regular;
  RadioButton42.PressColEnabled = 1;
  RadioButton42.Font_Color      = 0x0000;
  RadioButton42.Gradient        = 0;
  RadioButton42.Gradient_Orientation = 0;
  RadioButton42.Gradient_Start_Color = 0xFFFF;
  RadioButton42.Gradient_End_Color = 0xC618;
  RadioButton42.Color           = 0xFFFF;
  RadioButton42.Press_Color     = 0xE71C;
  RadioButton42.Background_Color = 0x0000;
  RadioButton42.OnPressPtr      = RadioButton42OnPress;

  RadioButton43.OwnerScreen     = &Screen5;
  RadioButton43.Order           = 6;
  RadioButton43.Left            = 139;
  RadioButton43.Top             = 134;
  RadioButton43.Width           = 57;
  RadioButton43.Height          = 25;
  RadioButton43.Pen_Width       = 1;
  RadioButton43.Pen_Color       = 0x0000;
  RadioButton43.Visible         = 1;
  RadioButton43.Active          = 1;
  RadioButton43.Checked         = 0;
  RadioButton43.Transparent     = 1;
  RadioButton43.Caption         = RadioButton43_Caption;
  RadioButton43.TextAlign       = _taLeft;
  RadioButton43.FontName        = DejaVu_Serif16x19_Regular;
  RadioButton43.PressColEnabled = 1;
  RadioButton43.Font_Color      = 0x0000;
  RadioButton43.Gradient        = 0;
  RadioButton43.Gradient_Orientation = 0;
  RadioButton43.Gradient_Start_Color = 0xFFFF;
  RadioButton43.Gradient_End_Color = 0xC618;
  RadioButton43.Color           = 0xFFFF;
  RadioButton43.Press_Color     = 0xE71C;
  RadioButton43.Background_Color = 0x0000;
  RadioButton43.OnPressPtr      = RadioButton43OnPress;

  RadioButton44.OwnerScreen     = &Screen5;
  RadioButton44.Order           = 7;
  RadioButton44.Left            = 139;
  RadioButton44.Top             = 174;
  RadioButton44.Width           = 57;
  RadioButton44.Height          = 25;
  RadioButton44.Pen_Width       = 1;
  RadioButton44.Pen_Color       = 0x0000;
  RadioButton44.Visible         = 1;
  RadioButton44.Active          = 1;
  RadioButton44.Checked         = 0;
  RadioButton44.Transparent     = 1;
  RadioButton44.Caption         = RadioButton44_Caption;
  RadioButton44.TextAlign       = _taLeft;
  RadioButton44.FontName        = DejaVu_Serif16x19_Regular;
  RadioButton44.PressColEnabled = 1;
  RadioButton44.Font_Color      = 0x0000;
  RadioButton44.Gradient        = 0;
  RadioButton44.Gradient_Orientation = 0;
  RadioButton44.Gradient_Start_Color = 0xFFFF;
  RadioButton44.Gradient_End_Color = 0xC618;
  RadioButton44.Color           = 0xFFFF;
  RadioButton44.Press_Color     = 0xE71C;
  RadioButton44.Background_Color = 0x0000;
  RadioButton44.OnPressPtr      = RadioButton44OnPress;

  RadioButton45.OwnerScreen     = &Screen5;
  RadioButton45.Order           = 8;
  RadioButton45.Left            = 139;
  RadioButton45.Top             = 214;
  RadioButton45.Width           = 57;
  RadioButton45.Height          = 25;
  RadioButton45.Pen_Width       = 1;
  RadioButton45.Pen_Color       = 0x0000;
  RadioButton45.Visible         = 1;
  RadioButton45.Active          = 1;
  RadioButton45.Checked         = 0;
  RadioButton45.Transparent     = 1;
  RadioButton45.Caption         = RadioButton45_Caption;
  RadioButton45.TextAlign       = _taLeft;
  RadioButton45.FontName        = DejaVu_Serif16x19_Regular;
  RadioButton45.PressColEnabled = 1;
  RadioButton45.Font_Color      = 0x0000;
  RadioButton45.Gradient        = 0;
  RadioButton45.Gradient_Orientation = 0;
  RadioButton45.Gradient_Start_Color = 0xFFFF;
  RadioButton45.Gradient_End_Color = 0xC618;
  RadioButton45.Color           = 0xFFFF;
  RadioButton45.Press_Color     = 0xE71C;
  RadioButton45.Background_Color = 0x0000;
  RadioButton45.OnPressPtr      = RadioButton45OnPress;

  RadioButton46.OwnerScreen     = &Screen5;
  RadioButton46.Order           = 9;
  RadioButton46.Left            = 139;
  RadioButton46.Top             = 254;
  RadioButton46.Width           = 57;
  RadioButton46.Height          = 25;
  RadioButton46.Pen_Width       = 1;
  RadioButton46.Pen_Color       = 0x0000;
  RadioButton46.Visible         = 1;
  RadioButton46.Active          = 1;
  RadioButton46.Checked         = 0;
  RadioButton46.Transparent     = 1;
  RadioButton46.Caption         = RadioButton46_Caption;
  RadioButton46.TextAlign       = _taLeft;
  RadioButton46.FontName        = DejaVu_Serif16x19_Regular;
  RadioButton46.PressColEnabled = 1;
  RadioButton46.Font_Color      = 0x0000;
  RadioButton46.Gradient        = 0;
  RadioButton46.Gradient_Orientation = 0;
  RadioButton46.Gradient_Start_Color = 0xFFFF;
  RadioButton46.Gradient_End_Color = 0xC618;
  RadioButton46.Color           = 0xFFFF;
  RadioButton46.Press_Color     = 0xE71C;
  RadioButton46.Background_Color = 0x0000;
  RadioButton46.OnPressPtr      = RadioButton46OnPress;

  RadioButton47.OwnerScreen     = &Screen5;
  RadioButton47.Order           = 10;
  RadioButton47.Left            = 140;
  RadioButton47.Top             = 294;
  RadioButton47.Width           = 57;
  RadioButton47.Height          = 25;
  RadioButton47.Pen_Width       = 1;
  RadioButton47.Pen_Color       = 0x0000;
  RadioButton47.Visible         = 1;
  RadioButton47.Active          = 1;
  RadioButton47.Checked         = 0;
  RadioButton47.Transparent     = 1;
  RadioButton47.Caption         = RadioButton47_Caption;
  RadioButton47.TextAlign       = _taLeft;
  RadioButton47.FontName        = DejaVu_Serif16x19_Regular;
  RadioButton47.PressColEnabled = 1;
  RadioButton47.Font_Color      = 0x0000;
  RadioButton47.Gradient        = 0;
  RadioButton47.Gradient_Orientation = 0;
  RadioButton47.Gradient_Start_Color = 0xFFFF;
  RadioButton47.Gradient_End_Color = 0xC618;
  RadioButton47.Color           = 0xFFFF;
  RadioButton47.Press_Color     = 0xE71C;
  RadioButton47.Background_Color = 0x0000;
  RadioButton47.OnPressPtr      = RadioButton47OnPress;

  RadioButton48.OwnerScreen     = &Screen5;
  RadioButton48.Order           = 11;
  RadioButton48.Left            = 140;
  RadioButton48.Top             = 335;
  RadioButton48.Width           = 57;
  RadioButton48.Height          = 25;
  RadioButton48.Pen_Width       = 1;
  RadioButton48.Pen_Color       = 0x0000;
  RadioButton48.Visible         = 1;
  RadioButton48.Active          = 1;
  RadioButton48.Checked         = 0;
  RadioButton48.Transparent     = 1;
  RadioButton48.Caption         = RadioButton48_Caption;
  RadioButton48.TextAlign       = _taLeft;
  RadioButton48.FontName        = DejaVu_Serif16x19_Regular;
  RadioButton48.PressColEnabled = 1;
  RadioButton48.Font_Color      = 0x0000;
  RadioButton48.Gradient        = 0;
  RadioButton48.Gradient_Orientation = 0;
  RadioButton48.Gradient_Start_Color = 0xFFFF;
  RadioButton48.Gradient_End_Color = 0xC618;
  RadioButton48.Color           = 0xFFFF;
  RadioButton48.Press_Color     = 0xE71C;
  RadioButton48.Background_Color = 0x0000;
  RadioButton48.OnPressPtr      = RadioButton48OnPress;

  Label22.OwnerScreen     = &Screen5;
  Label22.Order           = 12;
  Label22.Left            = 412;
  Label22.Top             = 38;
  Label22.Width           = 131;
  Label22.Height          = 26;
  Label22.Visible         = 1;
  Label22.Active          = 1;
  Label22.Caption         = Label22_Caption;
  Label22.FontName        = DejaVu_Serif22x24_Bold;
  Label22.Font_Color      = 0x0000;
  Label22.VerticalText    = 0;

  ButtonRound9.OwnerScreen     = &Screen5;
  ButtonRound9.Order           = 13;
  ButtonRound9.Left            = 631;
  ButtonRound9.Top             = 402;
  ButtonRound9.Width           = 109;
  ButtonRound9.Height          = 53;
  ButtonRound9.Pen_Width       = 1;
  ButtonRound9.Pen_Color       = 0x07E0;
  ButtonRound9.Visible         = 1;
  ButtonRound9.Active          = 1;
  ButtonRound9.Transparent     = 1;
  ButtonRound9.Caption         = ButtonRound9_Caption;
  ButtonRound9.TextAlign       = _taCenter;
  ButtonRound9.TextAlignVertical= _tavMiddle;
  ButtonRound9.FontName        = Tahoma25x25_Bold;
  ButtonRound9.PressColEnabled = 1;
  ButtonRound9.Font_Color      = 0xFFFF;
  ButtonRound9.VerticalText    = 0;
  ButtonRound9.Gradient        = 0;
  ButtonRound9.Gradient_Orientation = 0;
  ButtonRound9.Gradient_Start_Color = 0xFFFF;
  ButtonRound9.Gradient_End_Color = 0xC618;
  ButtonRound9.Color           = 0x07E0;
  ButtonRound9.Press_Color     = 0xE71C;
  ButtonRound9.Corner_Radius   = 3;
  ButtonRound9.OnClickPtr      = ButtonRound9OnClick;

  Label23.OwnerScreen     = &Screen5;
  Label23.Order           = 14;
  Label23.Left            = 43;
  Label23.Top             = 81;
  Label23.Width           = 100;
  Label23.Height          = 21;
  Label23.Visible         = 1;
  Label23.Active          = 1;
  Label23.Caption         = Label23_Caption;
  Label23.FontName        = DejaVu_Serif16x19_Regular;
  Label23.Font_Color      = 0x0000;
  Label23.VerticalText    = 0;

  ButtonRound10.OwnerScreen     = &Screen5;
  ButtonRound10.Order           = 15;
  ButtonRound10.Left            = 226;
  ButtonRound10.Top             = 402;
  ButtonRound10.Width           = 109;
  ButtonRound10.Height          = 53;
  ButtonRound10.Pen_Width       = 1;
  ButtonRound10.Pen_Color       = 0xEB2F;
  ButtonRound10.Visible         = 1;
  ButtonRound10.Active          = 1;
  ButtonRound10.Transparent     = 1;
  ButtonRound10.Caption         = ButtonRound10_Caption;
  ButtonRound10.TextAlign       = _taCenter;
  ButtonRound10.TextAlignVertical= _tavMiddle;
  ButtonRound10.FontName        = Tahoma25x25_Bold;
  ButtonRound10.PressColEnabled = 1;
  ButtonRound10.Font_Color      = 0xFFFF;
  ButtonRound10.VerticalText    = 0;
  ButtonRound10.Gradient        = 0;
  ButtonRound10.Gradient_Orientation = 0;
  ButtonRound10.Gradient_Start_Color = 0xFFFF;
  ButtonRound10.Gradient_End_Color = 0xC618;
  ButtonRound10.Color           = 0xEB2F;
  ButtonRound10.Press_Color     = 0xE71C;
  ButtonRound10.Corner_Radius   = 3;
  ButtonRound10.OnClickPtr      = ButtonRound10OnClick;

  Image6.OwnerScreen     = &Screen5;
  Image6.Order           = 16;
  Image6.Left            = 225;
  Image6.Top             = 85;
  Image6.Width           = 517;
  Image6.Height          = 298;
  Image6.Picture_Type    = 1;
  Image6.Picture_Ratio   = 1;
  Image6.Picture_Name    = GridLine1_jpg;
  Image6.Visible         = 1;
  Image6.Active          = 1;

  RadioButton49.OwnerScreen     = &Screen6;
  RadioButton49.Order           = 0;
  RadioButton49.Left            = 42;
  RadioButton49.Top             = 134;
  RadioButton49.Width           = 41;
  RadioButton49.Height          = 25;
  RadioButton49.Pen_Width       = 1;
  RadioButton49.Pen_Color       = 0x0000;
  RadioButton49.Visible         = 1;
  RadioButton49.Active          = 1;
  RadioButton49.Checked         = 0;
  RadioButton49.Transparent     = 1;
  RadioButton49.Caption         = RadioButton49_Caption;
  RadioButton49.TextAlign       = _taLeft;
  RadioButton49.FontName        = DejaVu_Serif16x19_Regular;
  RadioButton49.PressColEnabled = 1;
  RadioButton49.Font_Color      = 0x0000;
  RadioButton49.Gradient        = 0;
  RadioButton49.Gradient_Orientation = 0;
  RadioButton49.Gradient_Start_Color = 0xFFFF;
  RadioButton49.Gradient_End_Color = 0xC618;
  RadioButton49.Color           = 0xFFFF;
  RadioButton49.Press_Color     = 0xC618;
  RadioButton49.Background_Color = 0x0000;
  RadioButton49.OnPressPtr      = RadioButton49OnPress;

  RadioButton50.OwnerScreen     = &Screen6;
  RadioButton50.Order           = 1;
  RadioButton50.Left            = 42;
  RadioButton50.Top             = 174;
  RadioButton50.Width           = 47;
  RadioButton50.Height          = 25;
  RadioButton50.Pen_Width       = 1;
  RadioButton50.Pen_Color       = 0x0000;
  RadioButton50.Visible         = 1;
  RadioButton50.Active          = 1;
  RadioButton50.Checked         = 0;
  RadioButton50.Transparent     = 1;
  RadioButton50.Caption         = RadioButton50_Caption;
  RadioButton50.TextAlign       = _taLeft;
  RadioButton50.FontName        = DejaVu_Serif16x19_Regular;
  RadioButton50.PressColEnabled = 1;
  RadioButton50.Font_Color      = 0x0000;
  RadioButton50.Gradient        = 0;
  RadioButton50.Gradient_Orientation = 0;
  RadioButton50.Gradient_Start_Color = 0xFFFF;
  RadioButton50.Gradient_End_Color = 0xC618;
  RadioButton50.Color           = 0xFFFF;
  RadioButton50.Press_Color     = 0xE71C;
  RadioButton50.Background_Color = 0x0000;
  RadioButton50.OnPressPtr      = RadioButton50OnPress;

  RadioButton51.OwnerScreen     = &Screen6;
  RadioButton51.Order           = 2;
  RadioButton51.Left            = 42;
  RadioButton51.Top             = 214;
  RadioButton51.Width           = 54;
  RadioButton51.Height          = 25;
  RadioButton51.Pen_Width       = 1;
  RadioButton51.Pen_Color       = 0x0000;
  RadioButton51.Visible         = 1;
  RadioButton51.Active          = 1;
  RadioButton51.Checked         = 0;
  RadioButton51.Transparent     = 1;
  RadioButton51.Caption         = RadioButton51_Caption;
  RadioButton51.TextAlign       = _taLeft;
  RadioButton51.FontName        = DejaVu_Serif16x19_Regular;
  RadioButton51.PressColEnabled = 1;
  RadioButton51.Font_Color      = 0x0000;
  RadioButton51.Gradient        = 0;
  RadioButton51.Gradient_Orientation = 0;
  RadioButton51.Gradient_Start_Color = 0xFFFF;
  RadioButton51.Gradient_End_Color = 0xC618;
  RadioButton51.Color           = 0xFFFF;
  RadioButton51.Press_Color     = 0xE71C;
  RadioButton51.Background_Color = 0x0000;
  RadioButton51.OnPressPtr      = RadioButton51OnPress;

  RadioButton52.OwnerScreen     = &Screen6;
  RadioButton52.Order           = 3;
  RadioButton52.Left            = 42;
  RadioButton52.Top             = 254;
  RadioButton52.Width           = 68;
  RadioButton52.Height          = 25;
  RadioButton52.Pen_Width       = 1;
  RadioButton52.Pen_Color       = 0x0000;
  RadioButton52.Visible         = 1;
  RadioButton52.Active          = 1;
  RadioButton52.Checked         = 0;
  RadioButton52.Transparent     = 1;
  RadioButton52.Caption         = RadioButton52_Caption;
  RadioButton52.TextAlign       = _taLeft;
  RadioButton52.FontName        = DejaVu_Serif16x19_Regular;
  RadioButton52.PressColEnabled = 1;
  RadioButton52.Font_Color      = 0x0000;
  RadioButton52.Gradient        = 0;
  RadioButton52.Gradient_Orientation = 0;
  RadioButton52.Gradient_Start_Color = 0xFFFF;
  RadioButton52.Gradient_End_Color = 0xC618;
  RadioButton52.Color           = 0xFFFF;
  RadioButton52.Press_Color     = 0xE71C;
  RadioButton52.Background_Color = 0x0000;
  RadioButton52.OnPressPtr      = RadioButton52OnPress;

  RadioButton53.OwnerScreen     = &Screen6;
  RadioButton53.Order           = 4;
  RadioButton53.Left            = 42;
  RadioButton53.Top             = 294;
  RadioButton53.Width           = 67;
  RadioButton53.Height          = 25;
  RadioButton53.Pen_Width       = 1;
  RadioButton53.Pen_Color       = 0x0000;
  RadioButton53.Visible         = 1;
  RadioButton53.Active          = 1;
  RadioButton53.Checked         = 0;
  RadioButton53.Transparent     = 1;
  RadioButton53.Caption         = RadioButton53_Caption;
  RadioButton53.TextAlign       = _taLeft;
  RadioButton53.FontName        = DejaVu_Serif16x19_Regular;
  RadioButton53.PressColEnabled = 1;
  RadioButton53.Font_Color      = 0x0000;
  RadioButton53.Gradient        = 0;
  RadioButton53.Gradient_Orientation = 0;
  RadioButton53.Gradient_Start_Color = 0xFFFF;
  RadioButton53.Gradient_End_Color = 0xC618;
  RadioButton53.Color           = 0xFFFF;
  RadioButton53.Press_Color     = 0xE71C;
  RadioButton53.Background_Color = 0x0000;
  RadioButton53.OnPressPtr      = RadioButton53OnPress;

  RadioButton54.OwnerScreen     = &Screen6;
  RadioButton54.Order           = 5;
  RadioButton54.Left            = 42;
  RadioButton54.Top             = 335;
  RadioButton54.Width           = 67;
  RadioButton54.Height          = 25;
  RadioButton54.Pen_Width       = 1;
  RadioButton54.Pen_Color       = 0x0000;
  RadioButton54.Visible         = 1;
  RadioButton54.Active          = 1;
  RadioButton54.Checked         = 0;
  RadioButton54.Transparent     = 1;
  RadioButton54.Caption         = RadioButton54_Caption;
  RadioButton54.TextAlign       = _taLeft;
  RadioButton54.FontName        = DejaVu_Serif16x19_Regular;
  RadioButton54.PressColEnabled = 1;
  RadioButton54.Font_Color      = 0x0000;
  RadioButton54.Gradient        = 0;
  RadioButton54.Gradient_Orientation = 0;
  RadioButton54.Gradient_Start_Color = 0xFFFF;
  RadioButton54.Gradient_End_Color = 0xC618;
  RadioButton54.Color           = 0xFFFF;
  RadioButton54.Press_Color     = 0xE71C;
  RadioButton54.Background_Color = 0x0000;
  RadioButton54.OnPressPtr      = RadioButton54OnPress;

  RadioButton55.OwnerScreen     = &Screen6;
  RadioButton55.Order           = 6;
  RadioButton55.Left            = 139;
  RadioButton55.Top             = 133;
  RadioButton55.Width           = 57;
  RadioButton55.Height          = 25;
  RadioButton55.Pen_Width       = 1;
  RadioButton55.Pen_Color       = 0x0000;
  RadioButton55.Visible         = 1;
  RadioButton55.Active          = 1;
  RadioButton55.Checked         = 0;
  RadioButton55.Transparent     = 1;
  RadioButton55.Caption         = RadioButton55_Caption;
  RadioButton55.TextAlign       = _taLeft;
  RadioButton55.FontName        = DejaVu_Serif16x19_Regular;
  RadioButton55.PressColEnabled = 1;
  RadioButton55.Font_Color      = 0x0000;
  RadioButton55.Gradient        = 0;
  RadioButton55.Gradient_Orientation = 0;
  RadioButton55.Gradient_Start_Color = 0xFFFF;
  RadioButton55.Gradient_End_Color = 0xC618;
  RadioButton55.Color           = 0xFFFF;
  RadioButton55.Press_Color     = 0xE71C;
  RadioButton55.Background_Color = 0x0000;
  RadioButton55.OnPressPtr      = RadioButton55OnPress;

  RadioButton56.OwnerScreen     = &Screen6;
  RadioButton56.Order           = 7;
  RadioButton56.Left            = 139;
  RadioButton56.Top             = 174;
  RadioButton56.Width           = 57;
  RadioButton56.Height          = 25;
  RadioButton56.Pen_Width       = 1;
  RadioButton56.Pen_Color       = 0x0000;
  RadioButton56.Visible         = 1;
  RadioButton56.Active          = 1;
  RadioButton56.Checked         = 0;
  RadioButton56.Transparent     = 1;
  RadioButton56.Caption         = RadioButton56_Caption;
  RadioButton56.TextAlign       = _taLeft;
  RadioButton56.FontName        = DejaVu_Serif16x19_Regular;
  RadioButton56.PressColEnabled = 1;
  RadioButton56.Font_Color      = 0x0000;
  RadioButton56.Gradient        = 0;
  RadioButton56.Gradient_Orientation = 0;
  RadioButton56.Gradient_Start_Color = 0xFFFF;
  RadioButton56.Gradient_End_Color = 0xC618;
  RadioButton56.Color           = 0xFFFF;
  RadioButton56.Press_Color     = 0xE71C;
  RadioButton56.Background_Color = 0x0000;
  RadioButton56.OnPressPtr      = RadioButton56OnPress;

  RadioButton57.OwnerScreen     = &Screen6;
  RadioButton57.Order           = 8;
  RadioButton57.Left            = 139;
  RadioButton57.Top             = 214;
  RadioButton57.Width           = 57;
  RadioButton57.Height          = 25;
  RadioButton57.Pen_Width       = 1;
  RadioButton57.Pen_Color       = 0x0000;
  RadioButton57.Visible         = 1;
  RadioButton57.Active          = 1;
  RadioButton57.Checked         = 0;
  RadioButton57.Transparent     = 1;
  RadioButton57.Caption         = RadioButton57_Caption;
  RadioButton57.TextAlign       = _taLeft;
  RadioButton57.FontName        = DejaVu_Serif16x19_Regular;
  RadioButton57.PressColEnabled = 1;
  RadioButton57.Font_Color      = 0x0000;
  RadioButton57.Gradient        = 0;
  RadioButton57.Gradient_Orientation = 0;
  RadioButton57.Gradient_Start_Color = 0xFFFF;
  RadioButton57.Gradient_End_Color = 0xC618;
  RadioButton57.Color           = 0xFFFF;
  RadioButton57.Press_Color     = 0xE71C;
  RadioButton57.Background_Color = 0x0000;
  RadioButton57.OnPressPtr      = RadioButton57OnPress;

  RadioButton58.OwnerScreen     = &Screen6;
  RadioButton58.Order           = 9;
  RadioButton58.Left            = 139;
  RadioButton58.Top             = 254;
  RadioButton58.Width           = 57;
  RadioButton58.Height          = 25;
  RadioButton58.Pen_Width       = 1;
  RadioButton58.Pen_Color       = 0x0000;
  RadioButton58.Visible         = 1;
  RadioButton58.Active          = 1;
  RadioButton58.Checked         = 0;
  RadioButton58.Transparent     = 1;
  RadioButton58.Caption         = RadioButton58_Caption;
  RadioButton58.TextAlign       = _taLeft;
  RadioButton58.FontName        = DejaVu_Serif16x19_Regular;
  RadioButton58.PressColEnabled = 1;
  RadioButton58.Font_Color      = 0x0000;
  RadioButton58.Gradient        = 0;
  RadioButton58.Gradient_Orientation = 0;
  RadioButton58.Gradient_Start_Color = 0xFFFF;
  RadioButton58.Gradient_End_Color = 0xC618;
  RadioButton58.Color           = 0xFFFF;
  RadioButton58.Press_Color     = 0xE71C;
  RadioButton58.Background_Color = 0x0000;
  RadioButton58.OnPressPtr      = RadioButton58OnPress;

  RadioButton59.OwnerScreen     = &Screen6;
  RadioButton59.Order           = 10;
  RadioButton59.Left            = 140;
  RadioButton59.Top             = 294;
  RadioButton59.Width           = 57;
  RadioButton59.Height          = 25;
  RadioButton59.Pen_Width       = 1;
  RadioButton59.Pen_Color       = 0x0000;
  RadioButton59.Visible         = 1;
  RadioButton59.Active          = 1;
  RadioButton59.Checked         = 0;
  RadioButton59.Transparent     = 1;
  RadioButton59.Caption         = RadioButton59_Caption;
  RadioButton59.TextAlign       = _taLeft;
  RadioButton59.FontName        = DejaVu_Serif16x19_Regular;
  RadioButton59.PressColEnabled = 1;
  RadioButton59.Font_Color      = 0x0000;
  RadioButton59.Gradient        = 0;
  RadioButton59.Gradient_Orientation = 0;
  RadioButton59.Gradient_Start_Color = 0xFFFF;
  RadioButton59.Gradient_End_Color = 0xC618;
  RadioButton59.Color           = 0xFFFF;
  RadioButton59.Press_Color     = 0xE71C;
  RadioButton59.Background_Color = 0x0000;
  RadioButton59.OnPressPtr      = RadioButton59OnPress;

  RadioButton60.OwnerScreen     = &Screen6;
  RadioButton60.Order           = 11;
  RadioButton60.Left            = 140;
  RadioButton60.Top             = 335;
  RadioButton60.Width           = 57;
  RadioButton60.Height          = 25;
  RadioButton60.Pen_Width       = 1;
  RadioButton60.Pen_Color       = 0x0000;
  RadioButton60.Visible         = 1;
  RadioButton60.Active          = 1;
  RadioButton60.Checked         = 0;
  RadioButton60.Transparent     = 1;
  RadioButton60.Caption         = RadioButton60_Caption;
  RadioButton60.TextAlign       = _taLeft;
  RadioButton60.FontName        = DejaVu_Serif16x19_Regular;
  RadioButton60.PressColEnabled = 1;
  RadioButton60.Font_Color      = 0x0000;
  RadioButton60.Gradient        = 0;
  RadioButton60.Gradient_Orientation = 0;
  RadioButton60.Gradient_Start_Color = 0xFFFF;
  RadioButton60.Gradient_End_Color = 0xC618;
  RadioButton60.Color           = 0xFFFF;
  RadioButton60.Press_Color     = 0xE71C;
  RadioButton60.Background_Color = 0x0000;
  RadioButton60.OnPressPtr      = RadioButton60OnPress;

  Label24.OwnerScreen     = &Screen6;
  Label24.Order           = 12;
  Label24.Left            = 412;
  Label24.Top             = 38;
  Label24.Width           = 148;
  Label24.Height          = 26;
  Label24.Visible         = 1;
  Label24.Active          = 1;
  Label24.Caption         = Label24_Caption;
  Label24.FontName        = DejaVu_Serif22x24_Bold;
  Label24.Font_Color      = 0x0000;
  Label24.VerticalText    = 0;

  ButtonRound11.OwnerScreen     = &Screen6;
  ButtonRound11.Order           = 13;
  ButtonRound11.Left            = 632;
  ButtonRound11.Top             = 402;
  ButtonRound11.Width           = 109;
  ButtonRound11.Height          = 53;
  ButtonRound11.Pen_Width       = 1;
  ButtonRound11.Pen_Color       = 0x07E0;
  ButtonRound11.Visible         = 1;
  ButtonRound11.Active          = 1;
  ButtonRound11.Transparent     = 1;
  ButtonRound11.Caption         = ButtonRound11_Caption;
  ButtonRound11.TextAlign       = _taCenter;
  ButtonRound11.TextAlignVertical= _tavMiddle;
  ButtonRound11.FontName        = Tahoma25x25_Bold;
  ButtonRound11.PressColEnabled = 1;
  ButtonRound11.Font_Color      = 0xFFFF;
  ButtonRound11.VerticalText    = 0;
  ButtonRound11.Gradient        = 0;
  ButtonRound11.Gradient_Orientation = 0;
  ButtonRound11.Gradient_Start_Color = 0xFFFF;
  ButtonRound11.Gradient_End_Color = 0xC618;
  ButtonRound11.Color           = 0x07E0;
  ButtonRound11.Press_Color     = 0xE71C;
  ButtonRound11.Corner_Radius   = 3;
  ButtonRound11.OnClickPtr      = ButtonRound11OnClick;

  Label25.OwnerScreen     = &Screen6;
  Label25.Order           = 14;
  Label25.Left            = 43;
  Label25.Top             = 81;
  Label25.Width           = 100;
  Label25.Height          = 21;
  Label25.Visible         = 1;
  Label25.Active          = 1;
  Label25.Caption         = Label25_Caption;
  Label25.FontName        = DejaVu_Serif16x19_Regular;
  Label25.Font_Color      = 0x0000;
  Label25.VerticalText    = 0;

  ButtonRound12.OwnerScreen     = &Screen6;
  ButtonRound12.Order           = 15;
  ButtonRound12.Left            = 227;
  ButtonRound12.Top             = 401;
  ButtonRound12.Width           = 109;
  ButtonRound12.Height          = 53;
  ButtonRound12.Pen_Width       = 1;
  ButtonRound12.Pen_Color       = 0xEB2F;
  ButtonRound12.Visible         = 1;
  ButtonRound12.Active          = 1;
  ButtonRound12.Transparent     = 1;
  ButtonRound12.Caption         = ButtonRound12_Caption;
  ButtonRound12.TextAlign       = _taCenter;
  ButtonRound12.TextAlignVertical= _tavMiddle;
  ButtonRound12.FontName        = Tahoma25x25_Bold;
  ButtonRound12.PressColEnabled = 1;
  ButtonRound12.Font_Color      = 0xFFFF;
  ButtonRound12.VerticalText    = 0;
  ButtonRound12.Gradient        = 0;
  ButtonRound12.Gradient_Orientation = 0;
  ButtonRound12.Gradient_Start_Color = 0xFFFF;
  ButtonRound12.Gradient_End_Color = 0xC618;
  ButtonRound12.Color           = 0xEB2F;
  ButtonRound12.Press_Color     = 0xE71C;
  ButtonRound12.Corner_Radius   = 3;
  ButtonRound12.OnClickPtr      = ButtonRound12OnClick;

  Image7.OwnerScreen     = &Screen6;
  Image7.Order           = 16;
  Image7.Left            = 225;
  Image7.Top             = 85;
  Image7.Width           = 517;
  Image7.Height          = 298;
  Image7.Picture_Type    = 1;
  Image7.Picture_Ratio   = 1;
  Image7.Picture_Name    = GridLine1_jpg;
  Image7.Visible         = 1;
  Image7.Active          = 1;

  RadioButton61.OwnerScreen     = &Screen7;
  RadioButton61.Order           = 0;
  RadioButton61.Left            = 42;
  RadioButton61.Top             = 134;
  RadioButton61.Width           = 41;
  RadioButton61.Height          = 25;
  RadioButton61.Pen_Width       = 1;
  RadioButton61.Pen_Color       = 0x0000;
  RadioButton61.Visible         = 1;
  RadioButton61.Active          = 1;
  RadioButton61.Checked         = 0;
  RadioButton61.Transparent     = 1;
  RadioButton61.Caption         = RadioButton61_Caption;
  RadioButton61.TextAlign       = _taLeft;
  RadioButton61.FontName        = DejaVu_Serif16x19_Regular;
  RadioButton61.PressColEnabled = 1;
  RadioButton61.Font_Color      = 0x0000;
  RadioButton61.Gradient        = 0;
  RadioButton61.Gradient_Orientation = 0;
  RadioButton61.Gradient_Start_Color = 0xFFFF;
  RadioButton61.Gradient_End_Color = 0xC618;
  RadioButton61.Color           = 0xFFFF;
  RadioButton61.Press_Color     = 0xC618;
  RadioButton61.Background_Color = 0x0000;
  RadioButton61.OnPressPtr      = RadioButton61OnPress;

  RadioButton62.OwnerScreen     = &Screen7;
  RadioButton62.Order           = 1;
  RadioButton62.Left            = 42;
  RadioButton62.Top             = 174;
  RadioButton62.Width           = 47;
  RadioButton62.Height          = 25;
  RadioButton62.Pen_Width       = 1;
  RadioButton62.Pen_Color       = 0x0000;
  RadioButton62.Visible         = 1;
  RadioButton62.Active          = 1;
  RadioButton62.Checked         = 0;
  RadioButton62.Transparent     = 1;
  RadioButton62.Caption         = RadioButton62_Caption;
  RadioButton62.TextAlign       = _taLeft;
  RadioButton62.FontName        = DejaVu_Serif16x19_Regular;
  RadioButton62.PressColEnabled = 1;
  RadioButton62.Font_Color      = 0x0000;
  RadioButton62.Gradient        = 0;
  RadioButton62.Gradient_Orientation = 0;
  RadioButton62.Gradient_Start_Color = 0xFFFF;
  RadioButton62.Gradient_End_Color = 0xC618;
  RadioButton62.Color           = 0xFFFF;
  RadioButton62.Press_Color     = 0xE71C;
  RadioButton62.Background_Color = 0x0000;
  RadioButton62.OnPressPtr      = RadioButton62OnPress;

  RadioButton63.OwnerScreen     = &Screen7;
  RadioButton63.Order           = 2;
  RadioButton63.Left            = 42;
  RadioButton63.Top             = 214;
  RadioButton63.Width           = 54;
  RadioButton63.Height          = 25;
  RadioButton63.Pen_Width       = 1;
  RadioButton63.Pen_Color       = 0x0000;
  RadioButton63.Visible         = 1;
  RadioButton63.Active          = 1;
  RadioButton63.Checked         = 0;
  RadioButton63.Transparent     = 1;
  RadioButton63.Caption         = RadioButton63_Caption;
  RadioButton63.TextAlign       = _taLeft;
  RadioButton63.FontName        = DejaVu_Serif16x19_Regular;
  RadioButton63.PressColEnabled = 1;
  RadioButton63.Font_Color      = 0x0000;
  RadioButton63.Gradient        = 0;
  RadioButton63.Gradient_Orientation = 0;
  RadioButton63.Gradient_Start_Color = 0xFFFF;
  RadioButton63.Gradient_End_Color = 0xC618;
  RadioButton63.Color           = 0xFFFF;
  RadioButton63.Press_Color     = 0xE71C;
  RadioButton63.Background_Color = 0x0000;
  RadioButton63.OnPressPtr      = RadioButton63OnPress;

  RadioButton64.OwnerScreen     = &Screen7;
  RadioButton64.Order           = 3;
  RadioButton64.Left            = 42;
  RadioButton64.Top             = 254;
  RadioButton64.Width           = 68;
  RadioButton64.Height          = 25;
  RadioButton64.Pen_Width       = 1;
  RadioButton64.Pen_Color       = 0x0000;
  RadioButton64.Visible         = 1;
  RadioButton64.Active          = 1;
  RadioButton64.Checked         = 0;
  RadioButton64.Transparent     = 1;
  RadioButton64.Caption         = RadioButton64_Caption;
  RadioButton64.TextAlign       = _taLeft;
  RadioButton64.FontName        = DejaVu_Serif16x19_Regular;
  RadioButton64.PressColEnabled = 1;
  RadioButton64.Font_Color      = 0x0000;
  RadioButton64.Gradient        = 0;
  RadioButton64.Gradient_Orientation = 0;
  RadioButton64.Gradient_Start_Color = 0xFFFF;
  RadioButton64.Gradient_End_Color = 0xC618;
  RadioButton64.Color           = 0xFFFF;
  RadioButton64.Press_Color     = 0xE71C;
  RadioButton64.Background_Color = 0x0000;
  RadioButton64.OnPressPtr      = RadioButton64OnPress;

  RadioButton65.OwnerScreen     = &Screen7;
  RadioButton65.Order           = 4;
  RadioButton65.Left            = 42;
  RadioButton65.Top             = 294;
  RadioButton65.Width           = 67;
  RadioButton65.Height          = 25;
  RadioButton65.Pen_Width       = 1;
  RadioButton65.Pen_Color       = 0x0000;
  RadioButton65.Visible         = 1;
  RadioButton65.Active          = 1;
  RadioButton65.Checked         = 0;
  RadioButton65.Transparent     = 1;
  RadioButton65.Caption         = RadioButton65_Caption;
  RadioButton65.TextAlign       = _taLeft;
  RadioButton65.FontName        = DejaVu_Serif16x19_Regular;
  RadioButton65.PressColEnabled = 1;
  RadioButton65.Font_Color      = 0x0000;
  RadioButton65.Gradient        = 0;
  RadioButton65.Gradient_Orientation = 0;
  RadioButton65.Gradient_Start_Color = 0xFFFF;
  RadioButton65.Gradient_End_Color = 0xC618;
  RadioButton65.Color           = 0xFFFF;
  RadioButton65.Press_Color     = 0xE71C;
  RadioButton65.Background_Color = 0x0000;
  RadioButton65.OnPressPtr      = RadioButton65OnPress;

  RadioButton66.OwnerScreen     = &Screen7;
  RadioButton66.Order           = 5;
  RadioButton66.Left            = 42;
  RadioButton66.Top             = 335;
  RadioButton66.Width           = 67;
  RadioButton66.Height          = 25;
  RadioButton66.Pen_Width       = 1;
  RadioButton66.Pen_Color       = 0x0000;
  RadioButton66.Visible         = 1;
  RadioButton66.Active          = 1;
  RadioButton66.Checked         = 0;
  RadioButton66.Transparent     = 1;
  RadioButton66.Caption         = RadioButton66_Caption;
  RadioButton66.TextAlign       = _taLeft;
  RadioButton66.FontName        = DejaVu_Serif16x19_Regular;
  RadioButton66.PressColEnabled = 1;
  RadioButton66.Font_Color      = 0x0000;
  RadioButton66.Gradient        = 0;
  RadioButton66.Gradient_Orientation = 0;
  RadioButton66.Gradient_Start_Color = 0xFFFF;
  RadioButton66.Gradient_End_Color = 0xC618;
  RadioButton66.Color           = 0xFFFF;
  RadioButton66.Press_Color     = 0xE71C;
  RadioButton66.Background_Color = 0x0000;
  RadioButton66.OnPressPtr      = RadioButton66OnPress;

  RadioButton67.OwnerScreen     = &Screen7;
  RadioButton67.Order           = 6;
  RadioButton67.Left            = 139;
  RadioButton67.Top             = 133;
  RadioButton67.Width           = 57;
  RadioButton67.Height          = 25;
  RadioButton67.Pen_Width       = 1;
  RadioButton67.Pen_Color       = 0x0000;
  RadioButton67.Visible         = 1;
  RadioButton67.Active          = 1;
  RadioButton67.Checked         = 0;
  RadioButton67.Transparent     = 1;
  RadioButton67.Caption         = RadioButton67_Caption;
  RadioButton67.TextAlign       = _taLeft;
  RadioButton67.FontName        = DejaVu_Serif16x19_Regular;
  RadioButton67.PressColEnabled = 1;
  RadioButton67.Font_Color      = 0x0000;
  RadioButton67.Gradient        = 0;
  RadioButton67.Gradient_Orientation = 0;
  RadioButton67.Gradient_Start_Color = 0xFFFF;
  RadioButton67.Gradient_End_Color = 0xC618;
  RadioButton67.Color           = 0xFFFF;
  RadioButton67.Press_Color     = 0xE71C;
  RadioButton67.Background_Color = 0x0000;
  RadioButton67.OnPressPtr      = RadioButton67OnPress;

  RadioButton68.OwnerScreen     = &Screen7;
  RadioButton68.Order           = 7;
  RadioButton68.Left            = 139;
  RadioButton68.Top             = 174;
  RadioButton68.Width           = 57;
  RadioButton68.Height          = 25;
  RadioButton68.Pen_Width       = 1;
  RadioButton68.Pen_Color       = 0x0000;
  RadioButton68.Visible         = 1;
  RadioButton68.Active          = 1;
  RadioButton68.Checked         = 0;
  RadioButton68.Transparent     = 1;
  RadioButton68.Caption         = RadioButton68_Caption;
  RadioButton68.TextAlign       = _taLeft;
  RadioButton68.FontName        = DejaVu_Serif16x19_Regular;
  RadioButton68.PressColEnabled = 1;
  RadioButton68.Font_Color      = 0x0000;
  RadioButton68.Gradient        = 0;
  RadioButton68.Gradient_Orientation = 0;
  RadioButton68.Gradient_Start_Color = 0xFFFF;
  RadioButton68.Gradient_End_Color = 0xC618;
  RadioButton68.Color           = 0xFFFF;
  RadioButton68.Press_Color     = 0xE71C;
  RadioButton68.Background_Color = 0x0000;
  RadioButton68.OnPressPtr      = RadioButton68OnPress;

  RadioButton69.OwnerScreen     = &Screen7;
  RadioButton69.Order           = 8;
  RadioButton69.Left            = 139;
  RadioButton69.Top             = 214;
  RadioButton69.Width           = 57;
  RadioButton69.Height          = 25;
  RadioButton69.Pen_Width       = 1;
  RadioButton69.Pen_Color       = 0x0000;
  RadioButton69.Visible         = 1;
  RadioButton69.Active          = 1;
  RadioButton69.Checked         = 0;
  RadioButton69.Transparent     = 1;
  RadioButton69.Caption         = RadioButton69_Caption;
  RadioButton69.TextAlign       = _taLeft;
  RadioButton69.FontName        = DejaVu_Serif16x19_Regular;
  RadioButton69.PressColEnabled = 1;
  RadioButton69.Font_Color      = 0x0000;
  RadioButton69.Gradient        = 0;
  RadioButton69.Gradient_Orientation = 0;
  RadioButton69.Gradient_Start_Color = 0xFFFF;
  RadioButton69.Gradient_End_Color = 0xC618;
  RadioButton69.Color           = 0xFFFF;
  RadioButton69.Press_Color     = 0xE71C;
  RadioButton69.Background_Color = 0x0000;
  RadioButton69.OnPressPtr      = RadioButton69OnPress;

  RadioButton70.OwnerScreen     = &Screen7;
  RadioButton70.Order           = 9;
  RadioButton70.Left            = 139;
  RadioButton70.Top             = 255;
  RadioButton70.Width           = 57;
  RadioButton70.Height          = 25;
  RadioButton70.Pen_Width       = 1;
  RadioButton70.Pen_Color       = 0x0000;
  RadioButton70.Visible         = 1;
  RadioButton70.Active          = 1;
  RadioButton70.Checked         = 0;
  RadioButton70.Transparent     = 1;
  RadioButton70.Caption         = RadioButton70_Caption;
  RadioButton70.TextAlign       = _taLeft;
  RadioButton70.FontName        = DejaVu_Serif16x19_Regular;
  RadioButton70.PressColEnabled = 1;
  RadioButton70.Font_Color      = 0x0000;
  RadioButton70.Gradient        = 0;
  RadioButton70.Gradient_Orientation = 0;
  RadioButton70.Gradient_Start_Color = 0xFFFF;
  RadioButton70.Gradient_End_Color = 0xC618;
  RadioButton70.Color           = 0xFFFF;
  RadioButton70.Press_Color     = 0xE71C;
  RadioButton70.Background_Color = 0x0000;
  RadioButton70.OnPressPtr      = RadioButton70OnPress;

  RadioButton71.OwnerScreen     = &Screen7;
  RadioButton71.Order           = 10;
  RadioButton71.Left            = 139;
  RadioButton71.Top             = 294;
  RadioButton71.Width           = 57;
  RadioButton71.Height          = 25;
  RadioButton71.Pen_Width       = 1;
  RadioButton71.Pen_Color       = 0x0000;
  RadioButton71.Visible         = 1;
  RadioButton71.Active          = 1;
  RadioButton71.Checked         = 0;
  RadioButton71.Transparent     = 1;
  RadioButton71.Caption         = RadioButton71_Caption;
  RadioButton71.TextAlign       = _taLeft;
  RadioButton71.FontName        = DejaVu_Serif16x19_Regular;
  RadioButton71.PressColEnabled = 1;
  RadioButton71.Font_Color      = 0x0000;
  RadioButton71.Gradient        = 0;
  RadioButton71.Gradient_Orientation = 0;
  RadioButton71.Gradient_Start_Color = 0xFFFF;
  RadioButton71.Gradient_End_Color = 0xC618;
  RadioButton71.Color           = 0xFFFF;
  RadioButton71.Press_Color     = 0xE71C;
  RadioButton71.Background_Color = 0x0000;
  RadioButton71.OnPressPtr      = RadioButton71OnPress;

  RadioButton72.OwnerScreen     = &Screen7;
  RadioButton72.Order           = 11;
  RadioButton72.Left            = 139;
  RadioButton72.Top             = 335;
  RadioButton72.Width           = 57;
  RadioButton72.Height          = 25;
  RadioButton72.Pen_Width       = 1;
  RadioButton72.Pen_Color       = 0x0000;
  RadioButton72.Visible         = 1;
  RadioButton72.Active          = 1;
  RadioButton72.Checked         = 0;
  RadioButton72.Transparent     = 1;
  RadioButton72.Caption         = RadioButton72_Caption;
  RadioButton72.TextAlign       = _taLeft;
  RadioButton72.FontName        = DejaVu_Serif16x19_Regular;
  RadioButton72.PressColEnabled = 1;
  RadioButton72.Font_Color      = 0x0000;
  RadioButton72.Gradient        = 0;
  RadioButton72.Gradient_Orientation = 0;
  RadioButton72.Gradient_Start_Color = 0xFFFF;
  RadioButton72.Gradient_End_Color = 0xC618;
  RadioButton72.Color           = 0xFFFF;
  RadioButton72.Press_Color     = 0xE71C;
  RadioButton72.Background_Color = 0x0000;
  RadioButton72.OnPressPtr      = RadioButton72OnPress;

  Label26.OwnerScreen     = &Screen7;
  Label26.Order           = 12;
  Label26.Left            = 403;
  Label26.Top             = 38;
  Label26.Width           = 177;
  Label26.Height          = 26;
  Label26.Visible         = 1;
  Label26.Active          = 1;
  Label26.Caption         = Label26_Caption;
  Label26.FontName        = DejaVu_Serif22x24_Bold;
  Label26.Font_Color      = 0x0000;
  Label26.VerticalText    = 0;

  ButtonRound13.OwnerScreen     = &Screen7;
  ButtonRound13.Order           = 13;
  ButtonRound13.Left            = 631;
  ButtonRound13.Top             = 402;
  ButtonRound13.Width           = 109;
  ButtonRound13.Height          = 53;
  ButtonRound13.Pen_Width       = 1;
  ButtonRound13.Pen_Color       = 0x07E0;
  ButtonRound13.Visible         = 1;
  ButtonRound13.Active          = 1;
  ButtonRound13.Transparent     = 1;
  ButtonRound13.Caption         = ButtonRound13_Caption;
  ButtonRound13.TextAlign       = _taCenter;
  ButtonRound13.TextAlignVertical= _tavMiddle;
  ButtonRound13.FontName        = Tahoma25x25_Bold;
  ButtonRound13.PressColEnabled = 1;
  ButtonRound13.Font_Color      = 0xFFFF;
  ButtonRound13.VerticalText    = 0;
  ButtonRound13.Gradient        = 0;
  ButtonRound13.Gradient_Orientation = 0;
  ButtonRound13.Gradient_Start_Color = 0xFFFF;
  ButtonRound13.Gradient_End_Color = 0xC618;
  ButtonRound13.Color           = 0x07E0;
  ButtonRound13.Press_Color     = 0xE71C;
  ButtonRound13.Corner_Radius   = 3;
  ButtonRound13.OnClickPtr      = ButtonRound13OnClick;

  Label27.OwnerScreen     = &Screen7;
  Label27.Order           = 14;
  Label27.Left            = 43;
  Label27.Top             = 81;
  Label27.Width           = 100;
  Label27.Height          = 21;
  Label27.Visible         = 1;
  Label27.Active          = 1;
  Label27.Caption         = Label27_Caption;
  Label27.FontName        = DejaVu_Serif16x19_Regular;
  Label27.Font_Color      = 0x0000;
  Label27.VerticalText    = 0;

  ButtonRound14.OwnerScreen     = &Screen7;
  ButtonRound14.Order           = 15;
  ButtonRound14.Left            = 227;
  ButtonRound14.Top             = 401;
  ButtonRound14.Width           = 109;
  ButtonRound14.Height          = 53;
  ButtonRound14.Pen_Width       = 1;
  ButtonRound14.Pen_Color       = 0xEB2F;
  ButtonRound14.Visible         = 1;
  ButtonRound14.Active          = 1;
  ButtonRound14.Transparent     = 1;
  ButtonRound14.Caption         = ButtonRound14_Caption;
  ButtonRound14.TextAlign       = _taCenter;
  ButtonRound14.TextAlignVertical= _tavMiddle;
  ButtonRound14.FontName        = Tahoma25x25_Bold;
  ButtonRound14.PressColEnabled = 1;
  ButtonRound14.Font_Color      = 0xFFFF;
  ButtonRound14.VerticalText    = 0;
  ButtonRound14.Gradient        = 0;
  ButtonRound14.Gradient_Orientation = 0;
  ButtonRound14.Gradient_Start_Color = 0xFFFF;
  ButtonRound14.Gradient_End_Color = 0xC618;
  ButtonRound14.Color           = 0xEB2F;
  ButtonRound14.Press_Color     = 0xE71C;
  ButtonRound14.Corner_Radius   = 3;
  ButtonRound14.OnClickPtr      = ButtonRound14OnClick;

  Image8.OwnerScreen     = &Screen7;
  Image8.Order           = 16;
  Image8.Left            = 225;
  Image8.Top             = 85;
  Image8.Width           = 517;
  Image8.Height          = 298;
  Image8.Picture_Type    = 1;
  Image8.Picture_Ratio   = 1;
  Image8.Picture_Name    = GridLine1_jpg;
  Image8.Visible         = 1;
  Image8.Active          = 1;

  Label28.OwnerScreen     = &Screen8;
  Label28.Order           = 0;
  Label28.Left            = 256;
  Label28.Top             = 40;
  Label28.Width           = 283;
  Label28.Height          = 25;
  Label28.Visible         = 1;
  Label28.Active          = 1;
  Label28.Caption         = Label28_Caption;
  Label28.FontName        = Tahoma23x23_Bold;
  Label28.Font_Color      = 0x0000;
  Label28.VerticalText    = 0;

  Box1.OwnerScreen     = &Screen8;
  Box1.Order           = 1;
  Box1.Left            = 63;
  Box1.Top             = 92;
  Box1.Width           = 681;
  Box1.Height          = 298;
  Box1.Pen_Width       = 1;
  Box1.Pen_Color       = 0x0000;
  Box1.Visible         = 1;
  Box1.Active          = 1;
  Box1.Transparent     = 1;
  Box1.Gradient        = 0;
  Box1.Gradient_Orientation = 0;
  Box1.Gradient_Start_Color = 0xFFFF;
  Box1.Gradient_End_Color = 0xC618;
  Box1.Color           = 0xFFFF;
  Box1.PressColEnabled = 1;
  Box1.Press_Color     = 0xE71C;

  ButtonRound15.OwnerScreen     = &Screen8;
  ButtonRound15.Order           = 2;
  ButtonRound15.Left            = 116;
  ButtonRound15.Top             = 131;
  ButtonRound15.Width           = 159;
  ButtonRound15.Height          = 74;
  ButtonRound15.Pen_Width       = 1;
  ButtonRound15.Pen_Color       = 0x0000;
  ButtonRound15.Visible         = 1;
  ButtonRound15.Active          = 1;
  ButtonRound15.Transparent     = 1;
  ButtonRound15.Caption         = ButtonRound15_Caption;
  ButtonRound15.TextAlign       = _taCenter;
  ButtonRound15.TextAlignVertical= _tavMiddle;
  ButtonRound15.FontName        = Tahoma23x23_Bold;
  ButtonRound15.PressColEnabled = 1;
  ButtonRound15.Font_Color      = 0xFFFF;
  ButtonRound15.VerticalText    = 0;
  ButtonRound15.Gradient        = 0;
  ButtonRound15.Gradient_Orientation = 0;
  ButtonRound15.Gradient_Start_Color = 0xFFFF;
  ButtonRound15.Gradient_End_Color = 0xC618;
  ButtonRound15.Color           = 0x3013;
  ButtonRound15.Press_Color     = 0xE71C;
  ButtonRound15.Corner_Radius   = 3;
  ButtonRound15.OnClickPtr      = ButtonRound15OnClick;

  ButtonRound16.OwnerScreen     = &Screen8;
  ButtonRound16.Order           = 3;
  ButtonRound16.Left            = 325;
  ButtonRound16.Top             = 131;
  ButtonRound16.Width           = 159;
  ButtonRound16.Height          = 74;
  ButtonRound16.Pen_Width       = 1;
  ButtonRound16.Pen_Color       = 0x0000;
  ButtonRound16.Visible         = 1;
  ButtonRound16.Active          = 1;
  ButtonRound16.Transparent     = 1;
  ButtonRound16.Caption         = ButtonRound16_Caption;
  ButtonRound16.TextAlign       = _taCenter;
  ButtonRound16.TextAlignVertical= _tavMiddle;
  ButtonRound16.FontName        = Tahoma23x23_Bold;
  ButtonRound16.PressColEnabled = 1;
  ButtonRound16.Font_Color      = 0xFFFF;
  ButtonRound16.VerticalText    = 0;
  ButtonRound16.Gradient        = 0;
  ButtonRound16.Gradient_Orientation = 0;
  ButtonRound16.Gradient_Start_Color = 0xFFFF;
  ButtonRound16.Gradient_End_Color = 0xC618;
  ButtonRound16.Color           = 0x3013;
  ButtonRound16.Press_Color     = 0xE71C;
  ButtonRound16.Corner_Radius   = 3;
  ButtonRound16.OnClickPtr      = ButtonRound16OnClick;

  ButtonRound17.OwnerScreen     = &Screen8;
  ButtonRound17.Order           = 4;
  ButtonRound17.Left            = 525;
  ButtonRound17.Top             = 132;
  ButtonRound17.Width           = 159;
  ButtonRound17.Height          = 74;
  ButtonRound17.Pen_Width       = 1;
  ButtonRound17.Pen_Color       = 0x0000;
  ButtonRound17.Visible         = 1;
  ButtonRound17.Active          = 1;
  ButtonRound17.Transparent     = 1;
  ButtonRound17.Caption         = ButtonRound17_Caption;
  ButtonRound17.TextAlign       = _taCenter;
  ButtonRound17.TextAlignVertical= _tavMiddle;
  ButtonRound17.FontName        = Tahoma23x23_Bold;
  ButtonRound17.PressColEnabled = 1;
  ButtonRound17.Font_Color      = 0xFFFF;
  ButtonRound17.VerticalText    = 0;
  ButtonRound17.Gradient        = 0;
  ButtonRound17.Gradient_Orientation = 0;
  ButtonRound17.Gradient_Start_Color = 0xFFFF;
  ButtonRound17.Gradient_End_Color = 0xC618;
  ButtonRound17.Color           = 0x3013;
  ButtonRound17.Press_Color     = 0xE71C;
  ButtonRound17.Corner_Radius   = 3;
  ButtonRound17.OnClickPtr      = ButtonRound17OnClick;

  ButtonRound18.OwnerScreen     = &Screen8;
  ButtonRound18.Order           = 5;
  ButtonRound18.Left            = 222;
  ButtonRound18.Top             = 256;
  ButtonRound18.Width           = 159;
  ButtonRound18.Height          = 74;
  ButtonRound18.Pen_Width       = 1;
  ButtonRound18.Pen_Color       = 0x0000;
  ButtonRound18.Visible         = 1;
  ButtonRound18.Active          = 1;
  ButtonRound18.Transparent     = 1;
  ButtonRound18.Caption         = ButtonRound18_Caption;
  ButtonRound18.TextAlign       = _taCenter;
  ButtonRound18.TextAlignVertical= _tavMiddle;
  ButtonRound18.FontName        = Tahoma23x23_Bold;
  ButtonRound18.PressColEnabled = 1;
  ButtonRound18.Font_Color      = 0xFFFF;
  ButtonRound18.VerticalText    = 0;
  ButtonRound18.Gradient        = 0;
  ButtonRound18.Gradient_Orientation = 0;
  ButtonRound18.Gradient_Start_Color = 0xFFFF;
  ButtonRound18.Gradient_End_Color = 0xC618;
  ButtonRound18.Color           = 0x3013;
  ButtonRound18.Press_Color     = 0xE71C;
  ButtonRound18.Corner_Radius   = 3;
  ButtonRound18.OnClickPtr      = ButtonRound18OnClick;

  ButtonRound19.OwnerScreen     = &Screen8;
  ButtonRound19.Order           = 6;
  ButtonRound19.Left            = 445;
  ButtonRound19.Top             = 256;
  ButtonRound19.Width           = 159;
  ButtonRound19.Height          = 74;
  ButtonRound19.Pen_Width       = 1;
  ButtonRound19.Pen_Color       = 0x0000;
  ButtonRound19.Visible         = 1;
  ButtonRound19.Active          = 1;
  ButtonRound19.Transparent     = 1;
  ButtonRound19.Caption         = ButtonRound19_Caption;
  ButtonRound19.TextAlign       = _taCenter;
  ButtonRound19.TextAlignVertical= _tavMiddle;
  ButtonRound19.FontName        = Tahoma23x23_Bold;
  ButtonRound19.PressColEnabled = 1;
  ButtonRound19.Font_Color      = 0xFFFF;
  ButtonRound19.VerticalText    = 0;
  ButtonRound19.Gradient        = 0;
  ButtonRound19.Gradient_Orientation = 0;
  ButtonRound19.Gradient_Start_Color = 0xFFFF;
  ButtonRound19.Gradient_End_Color = 0xC618;
  ButtonRound19.Color           = 0x3013;
  ButtonRound19.Press_Color     = 0xE71C;
  ButtonRound19.Corner_Radius   = 3;
  ButtonRound19.OnClickPtr      = ButtonRound19OnClick;

  ButtonRound20.OwnerScreen     = &Screen8;
  ButtonRound20.Order           = 7;
  ButtonRound20.Left            = 62;
  ButtonRound20.Top             = 403;
  ButtonRound20.Width           = 112;
  ButtonRound20.Height          = 57;
  ButtonRound20.Pen_Width       = 1;
  ButtonRound20.Pen_Color       = 0xEB2F;
  ButtonRound20.Visible         = 1;
  ButtonRound20.Active          = 1;
  ButtonRound20.Transparent     = 1;
  ButtonRound20.Caption         = ButtonRound20_Caption;
  ButtonRound20.TextAlign       = _taCenter;
  ButtonRound20.TextAlignVertical= _tavMiddle;
  ButtonRound20.FontName        = Tahoma23x23_Bold;
  ButtonRound20.PressColEnabled = 1;
  ButtonRound20.Font_Color      = 0xFFFF;
  ButtonRound20.VerticalText    = 0;
  ButtonRound20.Gradient        = 0;
  ButtonRound20.Gradient_Orientation = 0;
  ButtonRound20.Gradient_Start_Color = 0xFFFF;
  ButtonRound20.Gradient_End_Color = 0xC618;
  ButtonRound20.Color           = 0xEB2F;
  ButtonRound20.Press_Color     = 0xE71C;
  ButtonRound20.Corner_Radius   = 3;
  ButtonRound20.OnClickPtr      = ButtonRound20OnClick;
}

static char IsInsideObject (unsigned int X, unsigned int Y, unsigned int Left, unsigned int Top, unsigned int Width, unsigned int Height) { // static
  if ( (Left<= X) && (Left+ Width - 1 >= X) &&
       (Top <= Y)  && (Top + Height - 1 >= Y) )
    return 1;
  else
    return 0;
}


#define GetRoundButton(index)         CurrentScreen->Buttons_Round[index]
#define GetLabel(index)               CurrentScreen->Labels[index]
#define GetImage(index)               CurrentScreen->Images[index]
#define GetBox(index)                 CurrentScreen->Boxes[index]
#define GetBox_Round(index)           CurrentScreen->Boxes_Round[index]
#define GetRadioButton(index)         CurrentScreen->RadioButtons[index]


void DrawRoundButton(TButton_Round *Around_button) {
unsigned int ALeft, ATop;
  if (Around_button->Visible != 0) {
    if (object_pressed == 1) {
      object_pressed = 0;
      TFT_Set_Brush(Around_button->Transparent, Around_button->Press_Color, Around_button->Gradient, Around_button->Gradient_Orientation,
                    Around_button->Gradient_End_Color, Around_button->Gradient_Start_Color);
    }
    else {
      TFT_Set_Brush(Around_button->Transparent, Around_button->Color, Around_button->Gradient, Around_button->Gradient_Orientation,
                    Around_button->Gradient_Start_Color, Around_button->Gradient_End_Color);
    }
    TFT_Set_Pen(Around_button->Pen_Color, Around_button->Pen_Width);
    TFT_Rectangle_Round_Edges(Around_button->Left + 1, Around_button->Top + 1,
      Around_button->Left + Around_button->Width - 2,
      Around_button->Top + Around_button->Height - 2, Around_button->Corner_Radius);
    if (Around_button->VerticalText != 0)
      TFT_Set_Font(Around_button->FontName, Around_button->Font_Color, FO_VERTICAL_COLUMN);
    else
      TFT_Set_Font(Around_button->FontName, Around_button->Font_Color, FO_HORIZONTAL);
    TFT_Write_Text_Return_Pos(Around_button->Caption, Around_button->Left, Around_button->Top);
    if (Around_button->TextAlign == _taLeft)
      ALeft = Around_button->Left + 4;
    else if (Around_button->TextAlign == _taCenter)
      ALeft = Around_button->Left + (Around_button->Width - caption_length) / 2;
    else if (Around_button->TextAlign == _taRight)
      ALeft = Around_button->Left + Around_button->Width - caption_length - 4;

    if (Around_button->TextAlignVertical == _tavTop)
      ATop = Around_button->Top + 3;
    else if (Around_button->TextAlignVertical == _tavMiddle)
      ATop = Around_button->Top + (Around_button->Height - caption_height) / 2;
    else if (Around_button->TextAlignVertical == _tavBottom)
      ATop  = Around_button->Top + Around_button->Height - caption_height - 4;

    TFT_Write_Text(Around_button->Caption, ALeft, ATop);
  }
}

void DrawLabel(TLabel *ALabel) {
  if (ALabel->Visible != 0) {
    if (ALabel->VerticalText != 0)
      TFT_Set_Font(ALabel->FontName, ALabel->Font_Color, FO_VERTICAL_COLUMN);
    else
      TFT_Set_Font(ALabel->FontName, ALabel->Font_Color, FO_HORIZONTAL);
    TFT_Write_Text(ALabel->Caption, ALabel->Left, ALabel->Top);
  }
}

void DrawImage(TImage *AImage) {
  if (AImage->Visible != 0) {
    TFT_Image_Jpeg(AImage->Left, AImage->Top, AImage->Picture_Name);
  }
}

void DrawBox(TBox *ABox) {
  if (ABox->Visible != 0) {
    if (object_pressed == 1) {
      object_pressed = 0;
      TFT_Set_Brush(ABox->Transparent, ABox->Press_Color, ABox->Gradient, ABox->Gradient_Orientation, ABox->Gradient_End_Color, ABox->Gradient_Start_Color);
    }
    else {
      TFT_Set_Brush(ABox->Transparent, ABox->Color, ABox->Gradient, ABox->Gradient_Orientation, ABox->Gradient_Start_Color, ABox->Gradient_End_Color);
    }
    TFT_Set_Pen(ABox->Pen_Color, ABox->Pen_Width);
    TFT_Rectangle(ABox->Left, ABox->Top, ABox->Left + ABox->Width - 1, ABox->Top + ABox->Height - 1);
  }
}

void DrawRoundBox(TBox_Round *Around_box) {
  if (Around_box->Visible != 0) {
    if (object_pressed == 1) {
      object_pressed = 0;
      TFT_Set_Brush(Around_box->Transparent, Around_box->Press_Color, Around_box->Gradient, Around_box->Gradient_Orientation,
                    Around_box->Gradient_End_Color, Around_box->Gradient_Start_Color);
    }
    else {
      TFT_Set_Brush(Around_box->Transparent, Around_box->Color, Around_box->Gradient, Around_box->Gradient_Orientation,
                    Around_box->Gradient_Start_Color, Around_box->Gradient_End_Color);
    }
    TFT_Set_Pen(Around_box->Pen_Color, Around_box->Pen_Width);
    TFT_Rectangle_Round_Edges(Around_box->Left + 1, Around_box->Top + 1,
      Around_box->Left + Around_box->Width - 2,
      Around_box->Top + Around_box->Height - 2, Around_box->Corner_Radius);
  }
}

void DrawRadioButton(TRadioButton *ARadioButton) {
int circleOffset = 0;
  if (ARadioButton->Visible != 0) {
    circleOffset = ARadioButton->Height / 5;
    TFT_Set_Pen(ARadioButton->Pen_Color, ARadioButton->Pen_Width);
    TFT_Set_Font(ARadioButton->FontName, ARadioButton->Font_Color, FO_HORIZONTAL);
    if (ARadioButton->TextAlign == _taLeft) {
      TFT_Set_Brush(ARadioButton->Transparent,ARadioButton->Background_Color,0,0,0,0);
      TFT_Circle(ARadioButton->Left + ARadioButton->Height / 2, ARadioButton->Top + ARadioButton->Height / 2, ARadioButton->Height / 2);
      if (ARadioButton->Checked != 0) {
        if (object_pressed == 1) {
          object_pressed = 0;
          TFT_Set_Brush(ARadioButton->Transparent, ARadioButton->Press_Color, ARadioButton->Gradient, ARadioButton->Gradient_Orientation, ARadioButton->Gradient_End_Color, ARadioButton->Gradient_Start_Color);
        } else
          TFT_Set_Brush(ARadioButton->Transparent, ARadioButton->Color, ARadioButton->Gradient, ARadioButton->Gradient_Orientation, ARadioButton->Gradient_Start_Color, ARadioButton->Gradient_End_Color);
        TFT_Circle(ARadioButton->Left + ARadioButton->Height / 2 , ARadioButton->Top + ARadioButton->Height / 2, ARadioButton->Height / 2 - circleOffset);
      }
      else {
        if (object_pressed == 1)
          object_pressed = 0;
      }
      TFT_Write_Text_Return_Pos(ARadioButton->Caption, ARadioButton->Left + ARadioButton->Height + 4, ARadioButton->Top);
      TFT_Write_Text(ARadioButton->Caption, ARadioButton->Left + ARadioButton->Height + 4, (ARadioButton->Top + ((ARadioButton->Height - caption_height) / 2)));
    } else {
      TFT_Set_Brush(ARadioButton->Transparent,ARadioButton->Background_Color,0,0,0,0);
      TFT_Circle(ARadioButton->Left  + ARadioButton->Width - ARadioButton->Height / 2, ARadioButton->Top + ARadioButton->Height / 2, ARadioButton->Height / 2);
      if (ARadioButton->Checked != 0) {
        if (object_pressed == 1) {
          object_pressed = 0;
          TFT_Set_Brush(ARadioButton->Transparent, ARadioButton->Press_Color, ARadioButton->Gradient, ARadioButton->Gradient_Orientation, ARadioButton->Gradient_End_Color, ARadioButton->Gradient_Start_Color);
        } else
          TFT_Set_Brush(ARadioButton->Transparent, ARadioButton->Color, ARadioButton->Gradient, ARadioButton->Gradient_Orientation, ARadioButton->Gradient_Start_Color, ARadioButton->Gradient_End_Color);
        TFT_Circle(ARadioButton->Left  + ARadioButton->Width - ARadioButton->Height / 2, ARadioButton->Top + ARadioButton->Height / 2, ARadioButton->Height / 2 - circleOffset);
      }
      else {
        if (object_pressed == 1)
          object_pressed = 0;
      }
      TFT_Write_Text_Return_Pos(ARadioButton->Caption, ARadioButton->Left + 3, ARadioButton->Top);
      TFT_Write_Text(ARadioButton->Caption, ARadioButton->Left + 3, ARadioButton->Top + (ARadioButton->Height - caption_height) / 2);
    }
  }
}

void DrawScreen(TScreen *aScreen) {
 unsigned int order;
  unsigned short round_button_idx;
  TButton_Round *local_round_button;
  unsigned short label_idx;
  TLabel *local_label;
  unsigned short image_idx;
  TImage *local_image;
  unsigned short box_idx;
  TBox *local_box;
  unsigned short round_box_idx;
  TBox_Round *local_round_box;
  unsigned short radio_button_idx;
  TRadioButton *local_radio_button;
  char save_bled;

  object_pressed = 0;
  order = 0;
  round_button_idx = 0;
  label_idx = 0;
  image_idx = 0;
  box_idx = 0;
  round_box_idx = 0;
  radio_button_idx = 0;
  CurrentScreen = aScreen;

  if ((display_width != CurrentScreen->Width) || (display_height != CurrentScreen->Height)) {
    save_bled = TFT_BLED;
    TFT_BLED           = 0;
    TFT_Set_Active(Set_Index, Write_Command, Write_Data);
    TFT_Init_SSD1963_Board_50(CurrentScreen->Width, CurrentScreen->Height);
    FT5XX6_SetSize(CurrentScreen->Width, CurrentScreen->Height);
    TFT_Fill_Screen(CurrentScreen->Color);
    TFT_Set_DBC_SSD1963(255);
    display_width = CurrentScreen->Width;
    display_height = CurrentScreen->Height;
    TFT_BLED           = save_bled;
  }
  else
    TFT_Fill_Screen(CurrentScreen->Color);


  while (order < CurrentScreen->ObjectsCount) {
    if (round_button_idx < CurrentScreen->Buttons_RoundCount) {
      local_round_button = GetRoundButton(round_button_idx);
      if (order == local_round_button->Order) {
        round_button_idx++;
        order++;
        DrawRoundButton(local_round_button);
      }
    }

    if (label_idx < CurrentScreen->LabelsCount) {
      local_label = GetLabel(label_idx);
      if (order == local_label->Order) {
        label_idx++;
        order++;
        DrawLabel(local_label);
      }
    }

    if (box_idx < CurrentScreen->BoxesCount) {
      local_box = GetBox(box_idx);
      if (order == local_box->Order) {
        box_idx++;
        order++;
        DrawBox(local_box);
      }
    }

    if (round_box_idx < CurrentScreen->Boxes_RoundCount) {
      local_round_box = GetBox_Round(round_box_idx);
      if (order == local_round_box->Order) {
        round_box_idx++;
        order++;
        DrawRoundBox(local_round_box);
      }
    }

    if (image_idx < CurrentScreen->ImagesCount) {
      local_image = GetImage(image_idx);
      if (order == local_image->Order) {
        image_idx++;
        order++;
        DrawImage(local_image);
      }
    }

    if (radio_button_idx < CurrentScreen->RadioButtonsCount) {
      local_radio_button = GetRadioButton(radio_button_idx);
      if (order == local_radio_button->Order) {
        radio_button_idx++;
        order++;
        DrawRadioButton(local_radio_button);
      }
    }

  }
}

void Get_Object(unsigned int X, unsigned int Y) {
  round_button_order  = -1;
  label_order         = -1;
  image_order         = -1;
  box_order           = -1;
  box_round_order     = -1;
  radio_button_order  = -1;
  //  Buttons with Round Edges
  for ( _object_count = 0 ; _object_count < CurrentScreen->Buttons_RoundCount ; _object_count++ ) {
    local_round_button = GetRoundButton(_object_count);
    if (local_round_button->Active != 0) {
      if (IsInsideObject(X, Y, local_round_button->Left, local_round_button->Top,
                         local_round_button->Width, local_round_button->Height) == 1) {
        round_button_order = local_round_button->Order;
        exec_round_button = local_round_button;
      }
    }
  }

  //  Labels
  for ( _object_count = 0 ; _object_count < CurrentScreen->LabelsCount ; _object_count++ ) {
    local_label = GetLabel(_object_count);
    if (local_label->Active != 0) {
      if (IsInsideObject(X, Y, local_label->Left, local_label->Top,
                         local_label->Width, local_label->Height) == 1) {
        label_order = local_label->Order;
        exec_label = local_label;
      }
    }
  }

  //  Images
  for ( _object_count = 0 ; _object_count < CurrentScreen->ImagesCount ; _object_count++ ) {
    local_image = GetImage(_object_count);
    if (local_image->Active != 0) {
      if (IsInsideObject(X, Y, local_image->Left, local_image->Top,
                         local_image->Width, local_image->Height) == 1) {
        image_order = local_image->Order;
        exec_image = local_image;
      }
    }
  }

  //  Boxes
  for ( _object_count = 0 ; _object_count < CurrentScreen->BoxesCount ; _object_count++ ) {
    local_box = GetBox(_object_count);
    if (local_box->Active != 0) {
      if (IsInsideObject(X, Y, local_box->Left, local_box->Top,
                         local_box->Width, local_box->Height) == 1) {
        box_order = local_box->Order;
        exec_box = local_box;
      }
    }
  }

  //  Boxes with Round Edges
  for ( _object_count = 0 ; _object_count < CurrentScreen->Boxes_RoundCount ; _object_count++ ) {
    local_round_box = GetBox_Round(_object_count);
    if (local_round_box->Active != 0) {
      if (IsInsideObject(X, Y, local_round_box->Left, local_round_box->Top,
                         local_round_box->Width, local_round_box->Height) == 1) {
        box_round_order = local_round_box->Order;
        exec_round_box = local_round_box;
      }
    }
  }

  // RadioButtons
  for ( _object_count = 0 ; _object_count < CurrentScreen->RadioButtonsCount ; _object_count++ ) {
    local_radio_button = GetRadioButton(_object_count);
    if (local_radio_button->Active != 0) {
      if (IsInsideObject(X, Y, local_radio_button->Left, local_radio_button->Top,
                         local_radio_button->Width, local_radio_button->Height) == 1) {
        radio_button_order = local_radio_button->Order;
        exec_radio_button = local_radio_button;
      }
    }
  }

  _object_count = -1;
  if (round_button_order >  _object_count )
    _object_count = round_button_order;
  if (label_order >  _object_count )
    _object_count = label_order;
  if (image_order >  _object_count )
    _object_count = image_order;
  if (box_order >  _object_count )
    _object_count = box_order;
  if (box_round_order >  _object_count )
    _object_count = box_round_order;
  if (radio_button_order >  _object_count )
    _object_count = radio_button_order;
}


void Process_TP_Press(unsigned int X, unsigned int Y) {
  exec_round_button   = 0;
  exec_label          = 0;
  exec_image          = 0;
  exec_box            = 0;
  exec_round_box      = 0;
  exec_radio_button   = 0;

  Get_Object(X, Y);

  if (_object_count != -1) {
    if (_object_count == round_button_order) {
      if (exec_round_button->Active != 0) {
        if (exec_round_button->OnPressPtr != 0) {
          exec_round_button->OnPressPtr();
          return;
        }
      }
    }

    if (_object_count == label_order) {
      if (exec_label->Active != 0) {
        if (exec_label->OnPressPtr != 0) {
          exec_label->OnPressPtr();
          return;
        }
      }
    }

    if (_object_count == image_order) {
      if (exec_image->Active != 0) {
        if (exec_image->OnPressPtr != 0) {
          exec_image->OnPressPtr();
          return;
        }
      }
    }

    if (_object_count == box_order) {
      if (exec_box->Active != 0) {
        if (exec_box->OnPressPtr != 0) {
          exec_box->OnPressPtr();
          return;
        }
      }
    }

    if (_object_count == box_round_order) {
      if (exec_round_box->Active != 0) {
        if (exec_round_box->OnPressPtr != 0) {
          exec_round_box->OnPressPtr();
          return;
        }
      }
    }

    if (_object_count == radio_button_order) {
      if (exec_radio_button->Active != 0) {
        if (exec_radio_button->OnPressPtr != 0) {
          exec_radio_button->OnPressPtr();
          return;
        }
      }
    }

  }
}

void Process_TP_Up(unsigned int X, unsigned int Y) {

  switch (PressedObjectType) {
    // Round Button
    case 1: {
      if (PressedObject != 0) {
        exec_round_button = (TButton_Round*)PressedObject;
        if ((exec_round_button->PressColEnabled != 0) && (exec_round_button->OwnerScreen == CurrentScreen)) {
          DrawRoundButton(exec_round_button);
        }
        break;
      }
      break;
    }
    // Box
    case 6: {
      if (PressedObject != 0) {
        exec_box = (TBox*)PressedObject;
        if ((exec_box->PressColEnabled != 0) && (exec_box->OwnerScreen == CurrentScreen)) {
          DrawBox(exec_box);
        }
        break;
      }
      break;
    }
    // Round Box
    case 7: {
      if (PressedObject != 0) {
        exec_round_box = (TBox_Round*)PressedObject;
        if ((exec_round_box->PressColEnabled != 0) && (exec_round_box->OwnerScreen == CurrentScreen)) {
          DrawRoundBox(exec_round_box);
        }
        break;
      }
      break;
    }
    // Radio Button
    case 17: {
      if (PressedObject != 0) {
        exec_radio_button = (TRadioButton*)PressedObject;
        if ((exec_radio_button->PressColEnabled != 0) && (exec_radio_button->OwnerScreen == CurrentScreen)) {
          DrawRadioButton(exec_radio_button);
        }
        break;
      }
      break;
    }
  }

  exec_label          = 0;
  exec_image          = 0;

  Get_Object(X, Y);


  if (_object_count != -1) {
  // Buttons with Round Edges
    if (_object_count == round_button_order) {
      if (exec_round_button->Active != 0) {
        if (exec_round_button->OnUpPtr != 0)
          exec_round_button->OnUpPtr();
        if (PressedObject == (void *)exec_round_button)
          if (exec_round_button->OnClickPtr != 0)
            exec_round_button->OnClickPtr();
        PressedObject = 0;
        PressedObjectType = -1;
        return;
      }
    }

  // Labels
    if (_object_count == label_order) {
      if (exec_label->Active != 0) {
        if (exec_label->OnUpPtr != 0)
          exec_label->OnUpPtr();
        if (PressedObject == (void *)exec_label)
          if (exec_label->OnClickPtr != 0)
            exec_label->OnClickPtr();
        PressedObject = 0;
        PressedObjectType = -1;
        return;
      }
    }

  // Images
    if (_object_count == image_order) {
      if (exec_image->Active != 0) {
        if (exec_image->OnUpPtr != 0)
          exec_image->OnUpPtr();
        if (PressedObject == (void *)exec_image)
          if (exec_image->OnClickPtr != 0)
            exec_image->OnClickPtr();
        PressedObject = 0;
        PressedObjectType = -1;
        return;
      }
    }

  // Boxes
    if (_object_count == box_order) {
      if (exec_box->Active != 0) {
        if (exec_box->OnUpPtr != 0)
          exec_box->OnUpPtr();
        if (PressedObject == (void *)exec_box)
          if (exec_box->OnClickPtr != 0)
            exec_box->OnClickPtr();
        PressedObject = 0;
        PressedObjectType = -1;
        return;
      }
    }

  // Boxes with Round Edges
    if (_object_count == box_round_order) {
      if (exec_round_box->Active != 0) {
        if (exec_round_box->OnUpPtr != 0)
          exec_round_box->OnUpPtr();
        if (PressedObject == (void *)exec_round_box)
          if (exec_round_box->OnClickPtr != 0)
            exec_round_box->OnClickPtr();
        PressedObject = 0;
        PressedObjectType = -1;
        return;
      }
    }

  // RadioButtons
    if (_object_count == radio_button_order) {
      if (exec_radio_button->Active != 0) {
        if (exec_radio_button->OnUpPtr != 0)
          exec_radio_button->OnUpPtr();
        if (PressedObject == (void *)exec_radio_button) {
          if (exec_radio_button->Checked == 0) {
            exec_radio_button->Checked = 1;
            DrawRadioButton(exec_radio_button);
          }
          if (exec_radio_button->OnClickPtr != 0)
            exec_radio_button->OnClickPtr();
        }
        PressedObject = 0;
        PressedObjectType = -1;
        return;
      }
    }

  }
  PressedObject = 0;
  PressedObjectType = -1;
}

void Process_TP_Down(unsigned int X, unsigned int Y) {

  object_pressed      = 0;
  exec_round_button   = 0;
  exec_label          = 0;
  exec_image          = 0;
  exec_box            = 0;
  exec_round_box      = 0;
  exec_radio_button   = 0;

  Get_Object(X, Y);

  if (_object_count != -1) {
    if (_object_count == round_button_order) {
      if (exec_round_button->Active != 0) {
        if (exec_round_button->PressColEnabled != 0) {
          object_pressed = 1;
          DrawRoundButton(exec_round_button);
        }
        PressedObject = (void *)exec_round_button;
        PressedObjectType = 1;
        if (exec_round_button->OnDownPtr != 0) {
          exec_round_button->OnDownPtr();
          return;
        }
      }
    }

    if (_object_count == label_order) {
      if (exec_label->Active != 0) {
        PressedObject = (void *)exec_label;
        PressedObjectType = 2;
        if (exec_label->OnDownPtr != 0) {
          exec_label->OnDownPtr();
          return;
        }
      }
    }

    if (_object_count == image_order) {
      if (exec_image->Active != 0) {
        PressedObject = (void *)exec_image;
        PressedObjectType = 3;
        if (exec_image->OnDownPtr != 0) {
          exec_image->OnDownPtr();
          return;
        }
      }
    }

    if (_object_count == box_order) {
      if (exec_box->Active != 0) {
        if (exec_box->PressColEnabled != 0) {
          object_pressed = 1;
          DrawBox(exec_box);
        }
        PressedObject = (void *)exec_box;
        PressedObjectType = 6;
        if (exec_box->OnDownPtr != 0) {
          exec_box->OnDownPtr();
          return;
        }
      }
    }

    if (_object_count == box_round_order) {
      if (exec_round_box->Active != 0) {
        if (exec_round_box->PressColEnabled != 0) {
          object_pressed = 1;
          DrawRoundBox(exec_round_box);
        }
        PressedObject = (void *)exec_round_box;
        PressedObjectType = 7;
        if (exec_round_box->OnDownPtr != 0) {
          exec_round_box->OnDownPtr();
          return;
        }
      }
    }

    if (_object_count == radio_button_order) {
      if (exec_radio_button->Active != 0) {
        if (exec_radio_button->PressColEnabled != 0) {
          object_pressed = 1;
          DrawRadioButton(exec_radio_button);
        }
        PressedObject = (void *)exec_radio_button;
        PressedObjectType = 17;
        if (exec_radio_button->OnDownPtr != 0) {
          exec_radio_button->OnDownPtr();
          return;
        }
      }
    }

  }
}

void Check_TP() {
  if (FT5XX6_PressDetect()) {
    if (FT5XX6_GetCoordinates(&Xcoord, &Ycoord) == 0) {
    // After a PRESS is detected read X-Y and convert it to Display dimensions space
      Process_TP_Press(Xcoord, Ycoord);
      if (PenDown == 0) {
        PenDown = 1;
        Process_TP_Down(Xcoord, Ycoord);
      }
    }
  }
  else if (PenDown == 1) {
    PenDown = 0;
    Process_TP_Up(Xcoord, Ycoord);
  }
}

void Init_MCU()
{
  GPIO_Digital_Output(&GPIOB_BASE, _GPIO_PINMASK_6);
  GPIO_Digital_Input(&GPIOB_BASE, _GPIO_PINMASK_7);
  GPIOB_ODR.B6 = 1;
  while (GPIOB_IDR.B7 == 0) {
    GPIOB_ODR.B6 = 0;
    Delay_us(10);
    GPIOB_ODR.B6 = 1;
    Delay_us(10);
  }
   I2C1_Init_Advanced(400000, &_GPIO_MODULE_I2C1_PB67);
}

char FT5XX6_Config()  {
  FT5XX6_SetI2CAddress(0x38);
  if (FT5XX6_IsOperational() != FT5XX6_OK)
    return  FT5XX6_FAILURE;
  FT5XX6_SetDefaultMode();
  FT5XX6_SetController(_TC_FT5X06);
  FT5XX6_SetSizeAndRotation(800,480,2);
return FT5XX6_OK;
}

void Start_TP() {
  Init_MCU();

  InitializeTouchPanel();
  if (FT5XX6_Config() == FT5XX6_OK) {
  } else {
    while(1);
  }


  InitializeObjects();
  display_width = Screen1.Width;
  display_height = Screen1.Height;
  DrawScreen(&Screen1);
}