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
        ti[i] = ti[i] * (pi / 180.0); // konversi ke radian
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
        ti[i] = ti[i] * (pi / 180.0); // konversi ke radian
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
        ti[i] = ti[i] * (pi / 180.0); // konversi ke radian
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
        ti[i] = ti[i] * (pi / 180.0); // konversi ke radian
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
        ti[i] = ti[i] * (pi / 180.0); // konversi ke radian
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
        ti[i] = ti[i] * (pi / 180.0); // konversi ke radian
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
        ti[i] = ti[i] * (pi / 180.0); // konversi ke radian
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
        ti[i] = ti[i] * (pi / 180.0); // konversi ke radian
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
        ti[i] = ti[i] * (pi / 180.0); // konversi ke radian
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
        ti[i] = ti[i] * (pi / 180.0); // konversi ke radian
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
        ti[i] = ti[i] * (pi / 180.0); // konversi ke radian
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
        ti[i] = ti[i] * (pi / 180.0); // konversi ke radian
    }
}



