
float omega(float input)
{
    int i;
    i = (int)(floor(input / (float)(2.0 * fsecg)));
    return 2 * 3.141592653 / scale_sig[i];
}
float arctan2(float y, float x)
{
    return 2 * (atan(y / (sqrt(pow(x, 2) + pow(y, 2)) + x)));
}
float modul(float input1, float input2)
{
    float result = 0;
    if (fabs(input1) < input2)
    {
        if (input1 < 0)
        {
            result = input1 + input2;
        }
        else if (input1 == 0)
        {
            result = 0;
        }
        else if (input1 > 0)
        {
            result = input1;
        }
    }
    else if (input1 > 0)
    {
        while (input1 > input2)
        {
            input1 = input1 - input2;
        }
        result = input1;
    }
    else if (input1 < 0)
    {
        while (input1 < 0)
        {
            input1 = input1 + input2;
        }
        result = input1;
    }
    return result;
}

float Xdynamical(float t0, float x0, float y0)
{
    float alfa = 1 - sqrt(x0*x0) + (y0*y0);
    return (alfa * x0) - (omega(t0) * y0);
}
float Ydynamical(float t0, float x0, float y0)
{
    float alfa = 1 - sqrt(x0*x0) + (y0*y0);
    return (alfa * y0) + (omega(t0) * x0);
}
float Zdynamical(float t0, float x0, float y0, float z0)
{   float sum = 0.0;
    float sum1;
    float z_0 = 0.00015 * sin(6.283185306 * t0 * 0.25);
    float teta = arctan2(y0, x0);
    float delta, sq_delta, sq_b;
    int i;

    for (i = 0; i <= 6; i++)
    {
        delta = modul(teta - ti[i], 6.283185306) - 3.141592653;
        sq_delta = delta * delta;
        sq_b = bi[i] * bi[i];
        sum += (-ai[i] * delta * exp((-0.5 * sq_delta) / (float)(sq_b)));
    }

    sum1 = sum - (z0 - z_0);
    return sum1;
}

void rungekutta()
{
    int i = 0;
    float h = 1.0 / (float)(2.0 * fsecg) ;
    
    x[0] = 0.1;
    y[0] = 0.0;
    z[0] = 0.0;

    for(i = 0; i<(jumlah*2*fsecg) ;i++)
    {
        float num = (float)i / (float)(512.0);
        k1[1][1] = Xdynamical(num, x[i], y[i]);
        k1[1][2] = Ydynamical(num, x[i], y[i]);
        k1[1][3] = Zdynamical(num, x[i], y[i], z[i]);
        // k2 for x, y, and z
        k1[2][1] = Xdynamical(num, x[i] + (0.5 * h), (y[i] + 0.5 * k1[1][2] * h));
        k1[2][2] = Ydynamical(num, x[i] + (0.5 * h), (y[i] + 0.5 * k1[1][2] * h));
        k1[2][3] = Zdynamical(num, x[i] + (0.5 * h), (y[i] + 0.5 * k1[1][2] * h), (z[i] + (0.5 * k1[1][3] * h)));
        // k3 for x, y, and z
        k1[3][1] = Xdynamical(num, x[i] + (0.5 * h), (y[i] + 0.5 * k1[2][2] * h));
        k1[3][2] = Ydynamical(num, x[i] + (0.5 * h), (y[i] + 0.5 * k1[2][2] * h));
        k1[3][3] = Zdynamical(num, x[i] + (0.5 * h), (y[i] + 0.5 * k1[2][2] * h), (z[i] + (0.5 * k1[2][3] * h)));
        // k4 for x, y, and z
        k1[4][1] = Xdynamical(num, (x[i] + h), (y[i] + k1[3][2] * h));
        k1[4][2] = Ydynamical(num, (x[i] + h), (y[i] + k1[3][2] * h));
        k1[4][3] = Zdynamical(num, (x[i] + h), (y[i] + k1[3][2] * h), (z[i] + (k1[3][3] * h)));
        // x y z final
        x[i + 1] = x[i] + ((h / 6) * (k1[1][1] + (2 * k1[2][1]) + (2 * k1[3][1]) + k1[4][1]));
        y[i + 1] = y[i] + ((h / 6) * (k1[1][2] + (2 * k1[2][2]) + (2 * k1[3][2]) + k1[4][2]));
        z[i + 1] = z[i] + ((h / 6) * (k1[1][3] + (2 * k1[2][3]) + (2 * k1[3][3]) + k1[4][3]));

    }

}