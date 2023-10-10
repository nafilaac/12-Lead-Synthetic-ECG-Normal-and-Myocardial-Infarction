typedef enum {_taLeft, _taCenter, _taRight} TTextAlign;
typedef enum {_tavTop, _tavMiddle, _tavBottom} TTextAlignVertical;

typedef struct Screen TScreen;

typedef struct  Button_Round {
  TScreen*  OwnerScreen;
  char          Order;
  unsigned int  Left;
  unsigned int  Top;
  unsigned int  Width;
  unsigned int  Height;
  char          Pen_Width;
  unsigned int  Pen_Color;
  char          Visible;
  char          Active;
  char          Transparent;
  char          *Caption;
  TTextAlign    TextAlign;
  TTextAlignVertical TextAlignVertical;
  const char    *FontName;
  unsigned int  Font_Color;
  char          VerticalText;
  char          Gradient;
  char          Gradient_Orientation;
  unsigned int  Gradient_Start_Color;
  unsigned int  Gradient_End_Color;
  unsigned int  Color;
  char          Corner_Radius;
  char          PressColEnabled;
  unsigned int  Press_Color;
  void          (*OnUpPtr)();
  void          (*OnDownPtr)();
  void          (*OnClickPtr)();
  void          (*OnPressPtr)();
} TButton_Round;

typedef struct  Label {
  TScreen*  OwnerScreen;
  char          Order;
  unsigned int  Left;
  unsigned int  Top;
  unsigned int  Width;
  unsigned int  Height;
  char          *Caption;
  const char    *FontName;
  unsigned int  Font_Color;
  char          VerticalText;
  char          Visible;
  char          Active;
  void          (*OnUpPtr)();
  void          (*OnDownPtr)();
  void          (*OnClickPtr)();
  void          (*OnPressPtr)();
} TLabel;

typedef struct  Image {
  TScreen*  OwnerScreen;
  char          Order;
  unsigned int  Left;
  unsigned int  Top;
  unsigned int  Width;
  unsigned int  Height;
  const char    *Picture_Name;
  char          Visible;
  char          Active;
  char          Picture_Type;
  char          Picture_Ratio;
  void          (*OnUpPtr)();
  void          (*OnDownPtr)();
  void          (*OnClickPtr)();
  void          (*OnPressPtr)();
} TImage;

typedef struct  Box {
  TScreen*  OwnerScreen;
  char          Order;
  unsigned int  Left;
  unsigned int  Top;
  unsigned int  Width;
  unsigned int  Height;
  char          Pen_Width;
  unsigned int  Pen_Color;
  char          Visible;
  char          Active;
  char          Transparent;
  char          Gradient;
  char          Gradient_Orientation;
  unsigned int  Gradient_Start_Color;
  unsigned int  Gradient_End_Color;
  unsigned int  Color;
  char          PressColEnabled;
  unsigned int  Press_Color;
  void          (*OnUpPtr)();
  void          (*OnDownPtr)();
  void          (*OnClickPtr)();
  void          (*OnPressPtr)();
} TBox;

typedef struct  Box_Round {
  TScreen*  OwnerScreen;
  char          Order;
  unsigned int  Left;
  unsigned int  Top;
  unsigned int  Width;
  unsigned int  Height;
  char          Pen_Width;
  unsigned int  Pen_Color;
  char          Visible;
  char          Active;
  char          Transparent;
  char          Gradient;
  char          Gradient_Orientation;
  unsigned int  Gradient_Start_Color;
  unsigned int  Gradient_End_Color;
  unsigned int  Color;
  char          Corner_Radius;
  char          PressColEnabled;
  unsigned int  Press_Color;
  void          (*OnUpPtr)();
  void          (*OnDownPtr)();
  void          (*OnClickPtr)();
  void          (*OnPressPtr)();
} TBox_Round;

typedef struct RadioButton {
  TScreen*  OwnerScreen;
  char          Order;
  unsigned int  Left;
  unsigned int  Top;
  unsigned int  Width;
  unsigned int  Height;
  char          Pen_Width;
  unsigned int  Pen_Color;
  char          Visible;
  char          Active;
  char          Checked;
  char          Transparent;
  char          *Caption;
  TTextAlign    TextAlign;
  const char    *FontName;
  unsigned int  Font_Color;
  char          Gradient;
  char          Gradient_Orientation;
  unsigned int  Gradient_Start_Color;
  unsigned int  Gradient_End_Color;
  unsigned int  Color;
  unsigned int  Background_Color;
  char          PressColEnabled;
  unsigned int  Press_Color;
  void          (*OnUpPtr)();
  void          (*OnDownPtr)();
  void          (*OnClickPtr)();
  void          (*OnPressPtr)();
} TRadioButton;

struct Screen {
  unsigned int           Color;
  unsigned int           Width;
  unsigned int           Height;
  unsigned int           ObjectsCount;
  unsigned int           Buttons_RoundCount;
  TButton_Round          * const code *Buttons_Round;
  unsigned int           LabelsCount;
  TLabel                 * const code *Labels;
  unsigned int           ImagesCount;
  TImage                 * const code *Images;
  unsigned int           BoxesCount;
  TBox                   * const code *Boxes;
  unsigned int           Boxes_RoundCount;
  TBox_Round             * const code *Boxes_Round;
  unsigned int           RadioButtonsCount;
  TRadioButton           * const code *RadioButtons;
  void          (*OnSwipeLeftPtr)();
  void          (*OnSwipeRightPtr)();
  void          (*OnSwipeUpPtr)();
  void          (*OnSwipeDownPtr)();
  void          (*OnZoomInPtr)();
  void          (*OnZoomOutPtr)();
};

extern   TScreen                Screen1;
extern   TBox                   Box3;
extern   TLabel                 Label1;
extern   TButton_Round          ButtonRound1;
extern   TButton_Round          ButtonRound2;
extern   TLabel                 Label2;
extern   TLabel                 Label3;
extern   TLabel                 Label4;
extern   TLabel                 Label5;
extern   TLabel                 Label6;
extern   TLabel                 Label7;
extern   TLabel                 Label8;
extern   TLabel                 Label9;
extern   TLabel                 Label10;
extern   TLabel                 Label11;
extern   TImage               Image1;
extern   TLabel                 Label12;
extern   TLabel                 Label13;
extern   TImage               Image2;
extern   TLabel                 Label14;
extern   TBox_Round             BoxRound1;
extern   TLabel                 Label19;
extern   TButton_Round          ButtonRound36;
extern   TButton_Round          ButtonRound37;
extern   TButton_Round          * const code Screen1_Buttons_Round[4];
extern   TLabel                 * const code Screen1_Labels[15];
extern   TImage                 * const code Screen1_Images[2];
extern   TBox                   * const code Screen1_Boxes[1];
extern   TBox_Round             * const code Screen1_Boxes_Round[1];

extern   TScreen                Screen2;
extern   TRadioButton                 RadioButton3;
extern   TRadioButton                 RadioButton4;
extern   TRadioButton                 RadioButton5;
extern   TRadioButton                 RadioButton6;
extern   TRadioButton                 RadioButton7;
extern   TRadioButton                 RadioButton8;
extern   TRadioButton                 RadioButton9;
extern   TRadioButton                 RadioButton10;
extern   TRadioButton                 RadioButton11;
extern   TRadioButton                 RadioButton12;
extern   TRadioButton                 RadioButton13;
extern   TRadioButton                 RadioButton14;
extern   TLabel                 Label15;
extern   TButton_Round          ButtonRound3;
extern   TLabel                 Label16;
extern   TButton_Round          ButtonRound4;
extern   TImage               Image3;
extern   TButton_Round          * const code Screen2_Buttons_Round[2];
extern   TLabel                 * const code Screen2_Labels[2];
extern   TImage                 * const code Screen2_Images[1];
extern   TRadioButton           * const code Screen2_RadioButtons[12];

extern   TScreen                Screen3;
extern   TRadioButton                 RadioButton1;
extern   TRadioButton                 RadioButton2;
extern   TRadioButton                 RadioButton15;
extern   TRadioButton                 RadioButton16;
extern   TRadioButton                 RadioButton17;
extern   TRadioButton                 RadioButton18;
extern   TRadioButton                 RadioButton19;
extern   TRadioButton                 RadioButton20;
extern   TRadioButton                 RadioButton21;
extern   TRadioButton                 RadioButton22;
extern   TRadioButton                 RadioButton23;
extern   TRadioButton                 RadioButton24;
extern   TLabel                 Label17;
extern   TButton_Round          ButtonRound5;
extern   TLabel                 Label18;
extern   TButton_Round          ButtonRound6;
extern   TImage               Image4;
extern   TButton_Round          * const code Screen3_Buttons_Round[2];
extern   TLabel                 * const code Screen3_Labels[2];
extern   TImage                 * const code Screen3_Images[1];
extern   TRadioButton           * const code Screen3_RadioButtons[12];

extern   TScreen                Screen4;
extern   TRadioButton                 RadioButton25;
extern   TRadioButton                 RadioButton26;
extern   TRadioButton                 RadioButton27;
extern   TRadioButton                 RadioButton28;
extern   TRadioButton                 RadioButton29;
extern   TRadioButton                 RadioButton30;
extern   TRadioButton                 RadioButton31;
extern   TRadioButton                 RadioButton32;
extern   TRadioButton                 RadioButton33;
extern   TRadioButton                 RadioButton34;
extern   TRadioButton                 RadioButton35;
extern   TRadioButton                 RadioButton36;
extern   TLabel                 Label20;
extern   TButton_Round          ButtonRound7;
extern   TLabel                 Label21;
extern   TButton_Round          ButtonRound8;
extern   TImage               Image5;
extern   TButton_Round          * const code Screen4_Buttons_Round[2];
extern   TLabel                 * const code Screen4_Labels[2];
extern   TImage                 * const code Screen4_Images[1];
extern   TRadioButton           * const code Screen4_RadioButtons[12];

extern   TScreen                Screen5;
extern   TRadioButton                 RadioButton37;
extern   TRadioButton                 RadioButton38;
extern   TRadioButton                 RadioButton39;
extern   TRadioButton                 RadioButton40;
extern   TRadioButton                 RadioButton41;
extern   TRadioButton                 RadioButton42;
extern   TRadioButton                 RadioButton43;
extern   TRadioButton                 RadioButton44;
extern   TRadioButton                 RadioButton45;
extern   TRadioButton                 RadioButton46;
extern   TRadioButton                 RadioButton47;
extern   TRadioButton                 RadioButton48;
extern   TLabel                 Label22;
extern   TButton_Round          ButtonRound9;
extern   TLabel                 Label23;
extern   TButton_Round          ButtonRound10;
extern   TImage               Image6;
extern   TButton_Round          * const code Screen5_Buttons_Round[2];
extern   TLabel                 * const code Screen5_Labels[2];
extern   TImage                 * const code Screen5_Images[1];
extern   TRadioButton           * const code Screen5_RadioButtons[12];

extern   TScreen                Screen6;
extern   TRadioButton                 RadioButton49;
extern   TRadioButton                 RadioButton50;
extern   TRadioButton                 RadioButton51;
extern   TRadioButton                 RadioButton52;
extern   TRadioButton                 RadioButton53;
extern   TRadioButton                 RadioButton54;
extern   TRadioButton                 RadioButton55;
extern   TRadioButton                 RadioButton56;
extern   TRadioButton                 RadioButton57;
extern   TRadioButton                 RadioButton58;
extern   TRadioButton                 RadioButton59;
extern   TRadioButton                 RadioButton60;
extern   TLabel                 Label24;
extern   TButton_Round          ButtonRound11;
extern   TLabel                 Label25;
extern   TButton_Round          ButtonRound12;
extern   TImage               Image7;
extern   TButton_Round          * const code Screen6_Buttons_Round[2];
extern   TLabel                 * const code Screen6_Labels[2];
extern   TImage                 * const code Screen6_Images[1];
extern   TRadioButton           * const code Screen6_RadioButtons[12];

extern   TScreen                Screen7;
extern   TRadioButton                 RadioButton61;
extern   TRadioButton                 RadioButton62;
extern   TRadioButton                 RadioButton63;
extern   TRadioButton                 RadioButton64;
extern   TRadioButton                 RadioButton65;
extern   TRadioButton                 RadioButton66;
extern   TRadioButton                 RadioButton67;
extern   TRadioButton                 RadioButton68;
extern   TRadioButton                 RadioButton69;
extern   TRadioButton                 RadioButton70;
extern   TRadioButton                 RadioButton71;
extern   TRadioButton                 RadioButton72;
extern   TLabel                 Label26;
extern   TButton_Round          ButtonRound13;
extern   TLabel                 Label27;
extern   TButton_Round          ButtonRound14;
extern   TImage               Image8;
extern   TButton_Round          * const code Screen7_Buttons_Round[2];
extern   TLabel                 * const code Screen7_Labels[2];
extern   TImage                 * const code Screen7_Images[1];
extern   TRadioButton           * const code Screen7_RadioButtons[12];

extern   TScreen                Screen8;
extern   TLabel                 Label28;
extern   TBox                   Box1;
extern   TButton_Round          ButtonRound15;
extern   TButton_Round          ButtonRound16;
extern   TButton_Round          ButtonRound17;
extern   TButton_Round          ButtonRound18;
extern   TButton_Round          ButtonRound19;
extern   TButton_Round          ButtonRound20;
extern   TButton_Round          * const code Screen8_Buttons_Round[6];
extern   TLabel                 * const code Screen8_Labels[1];
extern   TBox                   * const code Screen8_Boxes[1];


/////////////////////////
// Events Code Declarations
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
/////////////////////////

/////////////////////////////////
// Caption variables Declarations
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
/////////////////////////////////

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