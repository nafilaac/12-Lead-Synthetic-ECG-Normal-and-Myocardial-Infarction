void normal1()
{
    float modFactor = sqrt((float)hmean / 60.0);
    int i;
    
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
        ti[i] = ti[i] * (3.14159265 / 180.0); // konversi ke radian
    }
}