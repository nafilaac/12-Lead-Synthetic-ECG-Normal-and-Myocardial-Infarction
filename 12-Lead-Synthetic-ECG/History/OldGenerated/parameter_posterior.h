void posterior1()
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
    ai[3] = 33 * 18;
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

void posterior2()
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
    ai[3] = -13.8 * 18;
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

void posterior3()
{
    int i;
    modFactor = sqrt((float)hmean / 60.0);

    ti[1] = -60 * sqrt(modFactor);
    ai[1] = 1.2 * 18;
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
    ai[5] = 0.23 * ((modFactor * modFactor)*sqrt(modFactor)) * 18;
    bi[5] = 0.4 / modFactor;
    ti[6] = 100 * sqrt(modFactor);
    ai[6] = 0.36 *((modFactor * modFactor)*sqrt(modFactor)) * 18;
    bi[6] = 0.2 * modFactor;


    for (i = 1; i <= 6; i++)
    {
        ti[i] = ti[i] * (pi / 180.0); // konversi ke radian
    }
}

void posterioraVR()
{
    int i;
    modFactor = sqrt((float)hmean / 60.0);

    ti[1] = -60 * sqrt(modFactor);
    ai[1] = -0.8 * 18;
    bi[1] = 0.2 * modFactor;
    ti[2] = -15 * modFactor;
    ai[2] = 10 * 18;
    bi[2] = 0.1 * modFactor;
    ti[3] = 0;
    ai[3] = -26.3 * 18;
    bi[3] = 0.1 * modFactor;
    ti[4] = 15 * modFactor;
    ai[4] = -0.5 * 18;
    bi[4] = 0.1 * modFactor;
    ti[5] = 97 * sqrt(modFactor);
    ai[5] = -0.17 * ((modFactor * modFactor)*sqrt(modFactor)) * 18;
    bi[5] = 0.4 / modFactor;
    ti[6] = 100 * sqrt(modFactor);
    ai[6] = -0.25 *((modFactor * modFactor)*sqrt(modFactor)) * 18;
    bi[6] = 0.2 * modFactor;


    for (i = 1; i <= 6; i++)
    {
        ti[i] = ti[i] * (pi / 180.0); // konversi ke radian
    }
}

void posterioraVL()
{
    int i;
    modFactor = sqrt((float)hmean / 60.0);

    ti[1] = -60 * sqrt(modFactor);
    ai[1] = 0.8 * 18;
    bi[1] = 0.2 * modFactor;
    ti[2] = -15 * modFactor;
    ai[2] = -7 * 18;
    bi[2] = 0.1 * modFactor;
    ti[3] = 0;
    ai[3] = 30 * 18;
    bi[3] = 0.1 * modFactor;
    ti[4] = 15 * modFactor;
    ai[4] = 0.5 * 18;
    bi[4] = 0.1 * modFactor;
    ti[5] = 97 * sqrt(modFactor);
    ai[5] = -0.17 * ((modFactor * modFactor)*sqrt(modFactor)) * 18;
    bi[5] = 0.4 / modFactor;
    ti[6] = 100 * sqrt(modFactor);
    ai[6] = -0.25 *((modFactor * modFactor)*sqrt(modFactor)) * 18;
    bi[6] = 0.2 * modFactor;


    for (i = 1; i <= 6; i++)
    {
        ti[i] = ti[i] * (pi / 180.0); // konversi ke radian
    }
}

void posterioraVF()
{
    int i;
    modFactor = sqrt((float)hmean / 60.0);

    ti[1] = -60 * sqrt(modFactor);
    ai[1] = 0.8 * 18;
    bi[1] = 0.2 * modFactor;
    ti[2] = -15 * modFactor;
    ai[2] = 4 * 18;
    bi[2] = 0.1 * modFactor;
    ti[3] = 0;
    ai[3] = -22.5 * 18;
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

void posteriorV1()
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
    ai[5] = 0.68 * ((modFactor * modFactor)*sqrt(modFactor)) * 18;
    bi[5] = 0.4 / modFactor;
    ti[6] = 100 * sqrt(modFactor);
    ai[6] = 1 *((modFactor * modFactor)*sqrt(modFactor)) * 18;
    bi[6] = 0.2 * modFactor;


    for (i = 1; i <= 6; i++)
    {
        ti[i] = ti[i] * (pi / 180.0); // konversi ke radian
    }
}

void posteriorV2()
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
    ai[3] = 35 * 18;
    bi[3] = 0.1 * modFactor;
    ti[4] = 15 * modFactor;
    ai[4] = -17* 18;
    bi[4] = 0.1 * modFactor;
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

void posteriorV3()
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
    ai[4] = -17 * 18;
    bi[4] = 0.1 * modFactor;
    ti[5] = 97 * sqrt(modFactor);
    ai[5] = 0.7 * ((modFactor * modFactor)*sqrt(modFactor)) * 18;
    bi[5] = 0.4 / modFactor;
    ti[6] = 100 * sqrt(modFactor);
    ai[6] = 0.83 *((modFactor * modFactor)*sqrt(modFactor)) * 18;
    bi[6] = 0.2 * modFactor;


    for (i = 1; i <= 6; i++)
    {
        ti[i] = ti[i] * (pi / 180.0); // konversi ke radian
    }
}

void posteriorV4()
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
    ai[3] = 56.25 * 18;
    bi[3] = 0.1 * modFactor;
    ti[4] = 15 * modFactor;
    ai[4] = 0.5 * 18;
    bi[4] = 0.1 * modFactor;
    ti[5] = 97 * sqrt(modFactor);
    ai[5] = 0.4 * ((modFactor * modFactor)*sqrt(modFactor)) * 18;
    bi[5] = 0.4 / modFactor;
    ti[6] = 100 * sqrt(modFactor);
    ai[6] = 0.5 *((modFactor * modFactor)*sqrt(modFactor)) * 18;
    bi[6] = 0.2 * modFactor;


    for (i = 1; i <= 6; i++)
    {
        ti[i] = ti[i] * (pi / 180.0); // konversi ke radian
    }
}

void posteriorV5()
{
    int i;
    modFactor = sqrt((float)hmean / 60.0);

    ti[1] = -60 * sqrt(modFactor);
    ai[1] = 0.8 * 18;
    bi[1] = 0.2 * modFactor;
    ti[2] = -15 * modFactor;
    ai[2] = -10 * 18;
    bi[2] = 0.1 * modFactor;
    ti[3] = 0;
    ai[3] = 56.25 * 18;
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

void posteriorV6()
{
    int i;
    modFactor = sqrt((float)hmean / 60.0);

    ti[1] = -60 * sqrt(modFactor);
    ai[1] = 0.8 * 18;
    bi[1] = 0.2 * modFactor;
    ti[2] = -15 * modFactor;
    ai[2] = -10 * 18;
    bi[2] = 0.1 * modFactor;
    ti[3] = 0;
    ai[3] = 37.5 * 18;
    bi[3] = 0.1 * modFactor;
    ti[4] = 15 * modFactor;
    ai[4] = 0.5 * 18;
    bi[4] = 0.1 * modFactor;
    ti[5] = 97 * sqrt(modFactor);
    ai[5] = -0.17 * ((modFactor * modFactor)*sqrt(modFactor)) * 18;
    bi[5] = 0.4 / modFactor;
    ti[6] = 100 * sqrt(modFactor);
    ai[6] = -0.25 *((modFactor * modFactor)*sqrt(modFactor)) * 18;
    bi[6] = 0.2 * modFactor;


    for (i = 1; i <= 6; i++)
    {
        ti[i] = ti[i] * (pi / 180.0); // konversi ke radian
    }
}