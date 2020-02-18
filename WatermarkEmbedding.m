[CA, CH, CV, CD] = lwt2(img,'haar');
%DCD = dct2(CD);
DCH = dct2(CH);
DCV = dct2(CV);
DCA = dct2(CA);

%[U0, S0, V0] = svd(DCD);
[U1, S1, V1] = svd(DCH);
[U2, S2, V2] = svd(DCV);
[U3, S3, V3] = svd(DCA);

[CA1, CH1, CV1, CD1] = lwt2(wimg,'haar');
%DCD1 = dct2(CD1);
DCH1 = dct2(CH1);
DCV1 = dct2(CV1);
DCA1 = dct2(CA1);

%[UW0, SW0, VW0] = svd(DCD1);
[UW1, SW1, VW1] = svd(DCH1);
[UW2, SW2, VW2] = svd(DCV1);
[UW3, SW3, VW3] = svd(DCA1);

alpha=0.001;
%SC0 = S0 + alpha *SW0;
SC1 = S1 + alpha * SW1;
SC2 = S2 + alpha * SW2;
SC3 = S3 + alpha * SW3;

%I1_s0 = U0 * SC0 * V0';
I1_s1 = U1 * SC1 * V1';
I1_s2 = U2 * SC2 * V2';
I1_s3 = U3 * SC3 * V3';

%I1_d0 = idct2(I1_s0);
I1_d1 = idct2(I1_s1);
I1_d2 = idct2(I1_s2);
I1_d3 = idct2(I1_s3);

WaterMarked = ilwt2(I1_d3, I1_d1, I1_d2, CD, 'haar');
%figure;imshow(WaterMarked);title('Image after watermarking');
