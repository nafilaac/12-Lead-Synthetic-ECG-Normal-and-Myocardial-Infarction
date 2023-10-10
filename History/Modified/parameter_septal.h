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
        ti[i] = ti[i] * (pi / 180.0); // konversi ke radian
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
        ti[i] = ti[i] * (pi / 180.0); // konversi ke radian
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
        ti[i] = ti[i] * (pi / 180.0); // konversi ke radian
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
        ti[i] = ti[i] * (pi / 180.0); // konversi ke radian
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
        ti[i] = ti[i] * (pi / 180.0); // konversi ke radian
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
        ti[i] = ti[i] * (pi / 180.0); // konversi ke radian
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
        ti[i] = ti[i] * (pi / 180.0); // konversi ke radian
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
        ti[i] = ti[i] * (pi / 180.0); // konversi ke radian
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
        ti[i] = ti[i] * (pi / 180.0); // konversi ke radian
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
        ti[i] = ti[i] * (pi / 180.0); // konversi ke radian
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
        ti[i] = ti[i] * (pi / 180.0); // konversi ke radian
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
        ti[i] = ti[i] * (pi / 180.0); // konversi ke radian
    }
}