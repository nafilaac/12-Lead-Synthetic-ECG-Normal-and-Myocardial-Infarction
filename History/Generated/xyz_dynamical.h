float omega(float input)
{
    int j = (int)(floor(input / (2 * fsecg)));
    return 2 * pi / scale_sig[j];
}
float arctan2(float y, float x)
{
    return 2 * (atan(y / (sqrt(x*x) +(y*y)) + x));
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
    float alfaX = 1 - sqrt(x0*x0) + (y0*y0);
    return (alfaX * x0) - (omega(t0) * y0);
}
float Ydynamical(float t0, float x0, float y0)
{
    float alfaY = 1 - sqrt(x0*x0) + (y0*y0);
    return (alfaY * y0) + (omega(t0) * x0);
}
float Zdynamical(float t0, float x0, float y0, float z0)
{   float sum = 0.0;
    int parAmount = 6;
    float z_0 = 0.00015 * sin(2 * pi * t0 * f2);
    float teta = arctan2(y0, x0);
    float delta, sq_delta, sq_b;
    int i;
    
    for (i = 0; i < parAmount; i++)
    {
        delta = modul(teta - ti[i], 2 * pi) - pi;
        sq_delta = delta * delta;
        sq_b = bi[i] * bi[i];
        sum += (-ai[i] * delta * exp(-0.5 * sq_delta / sq_b));
    }

    sum = sum - (z0 - z_0);
    return sum;
}