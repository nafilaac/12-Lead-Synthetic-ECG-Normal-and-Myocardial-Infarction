// Deklarasi variabel global

bit buttonFlag;
//bit buttonFlag1;
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