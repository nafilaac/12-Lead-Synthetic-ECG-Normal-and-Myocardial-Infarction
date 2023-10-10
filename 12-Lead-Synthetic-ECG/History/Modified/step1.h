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
    // mirroring
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
    // random phase
    for (n = 0; n < 256; n++)
    {
        real[n] = sm[n] * (cosE3(2 * pi * rand())*0.001);
        im[n] = sm[n] * (sinE3(2 * pi * rand())*0.001);
    }
    // IDFT

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
    // scaling
    for (n = 0; n < 256; n++)
    {
        scale_sig[n] = scale * idft_sig[n] + (float)(60.0 / (float)hmean);
    }
    

}