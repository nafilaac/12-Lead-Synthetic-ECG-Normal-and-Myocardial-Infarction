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
        ti[i] = ti[i] * (pi / 180.0); // konversi ke radian
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
        ti[i] = ti[i] * (pi / 180.0); // konversi ke radian
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
        ti[i] = ti[i] * (pi / 180.0); // konversi ke radian
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
        ti[i] = ti[i] * (pi / 180.0); // konversi ke radian
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
        ti[i] = ti[i] * (pi / 180.0); // konversi ke radian
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
        ti[i] = ti[i] * (pi / 180.0); // konversi ke radian
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
        ti[i] = ti[i] * (pi / 180.0); // konversi ke radian
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
        ti[i] = ti[i] * (pi / 180.0); // konversi ke radian
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
        ti[i] = ti[i] * (pi / 180.0); // konversi ke radian
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
        ti[i] = ti[i] * (pi / 180.0); // konversi ke radian
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
        ti[i] = ti[i] * (pi / 180.0); // konversi ke radian
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
        ti[i] = ti[i] * (pi / 180.0); // konversi ke radian
    }
}