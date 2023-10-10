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
        ti[i] = ti[i] * (pi / 180.0); // konversi ke radian
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
        ti[i] = ti[i] * (pi / 180.0); // konversi ke radian
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
        ti[i] = ti[i] * (pi / 180.0); // konversi ke radian
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
        ti[i] = ti[i] * (pi / 180.0); // konversi ke radian
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
        ti[i] = ti[i] * (pi / 180.0); // konversi ke radian
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
        ti[i] = ti[i] * (pi / 180.0); // konversi ke radian
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
        ti[i] = ti[i] * (pi / 180.0); // konversi ke radian
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
        ti[i] = ti[i] * (pi / 180.0); // konversi ke radian
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
        ti[i] = ti[i] * (pi / 180.0); // konversi ke radian
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
        ti[i] = ti[i] * (pi / 180.0); // konversi ke radian
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
        ti[i] = ti[i] * (pi / 180.0); // konversi ke radian
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
        ti[i] = ti[i] * (pi / 180.0); // konversi ke radian
    }
}