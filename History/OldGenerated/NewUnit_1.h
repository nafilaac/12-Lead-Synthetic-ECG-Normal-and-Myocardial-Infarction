void rungekutta()
{
    double h, k[4][4];
    int i, jumlah;
    x[0] = 0.1;
    y[0] = 0;
    z[0] = 0;
    fsecg = 256;
    h = 1.0 / (2 * fsecg);
    jumlah = 3;
    i = 0;
    while (i < (jumlah * 2 * fsecg) - 1)
    {
        // k1 for x, y, and z
        k[0][0] = Xdynamical(((float)i / (2 * fsecg)), x[i], y[i]);
        k[0][1] = Ydynamical(((float)i / (2 * fsecg)), x[i], y[i]);
        k[0][2] = Zdynamical(((float)i / (2 * fsecg)), x[i], y[i], z[i]);
        // k2 for x, y, and z
        k[1][0] = Xdynamical(((float)i / (2 * fsecg)), (x[i] + (0.5 * h)), (y[i] + (0.5 * k[0][1] * h)));
        k[1][1] = Ydynamical(((float)i / (2 * fsecg)), (x[i] + (0.5 * h)), (y[i] + (0.5 * k[0][1] * h)));
        k[1][2] = Zdynamical(((float)i / (2 * fsecg)), (x[i] + (0.5 * h)), (y[i] + (0.5 * k[0][1] * h)), (z[i] + (0.5 * k[0][2] * h)));
        // k3 for x, y, and z
        k[2][0] = Xdynamical(((float)i / (2 * fsecg)), (x[i] + (0.5 * h)), (y[i] + (0.5 * k[1][1] * h)));
        k[2][1] = Ydynamical(((float)i / (2 * fsecg)), (x[i] + (0.5 * h)), (y[i] + (0.5 * k[1][1] * h)));
        k[2][2] = Zdynamical(((float)i / (2 * fsecg)), (x[i] + (0.5 * h)), (y[i] + (0.5 * k[1][1] * h)), (z[i] + (0.5 * k[1][2] * h)));
        // k4 for x, y, and z
        k[3][0] = Xdynamical(((float)i / (2 * fsecg)), (x[i] + h), (y[i] + (k[2][1] * h)));
        k[3][1] = Ydynamical(((float)i / (2 * fsecg)), (x[i] + h), (y[i] + (k[2][1] * h)));
        k[3][2] = Zdynamical(((float)i / (2 * fsecg)), (x[i] + h), (y[i] + (k[2][1] * h)), (z[i] + (k[2][2] * h)));
        // x y z final
        x[i + 1] = x[i] + ((h / 6) * (k[0][0] + (2 * k[1][0]) + (2 * k[2][0]) + k[3][0]));
        y[i + 1] = y[i] + ((h / 6) * (k[0][1] + (2 * k[1][1]) + (2 * k[2][1]) + k[3][1]));
        z[i + 1] = z[i] + ((h / 6) * (k[0][2] + (2 * k[1][2]) + (2 * k[2][2]) + k[3][2]));

        i++;
    }

}