%figure;imshow(WaterMarkedatt);
[CA, CH, CV, CD] = lwt2(WaterMarkedatt,'haar');
DCH = dct2(CH);
DCV = dct2(CV);
DCA = dct2(CA);

[U1, S1, V1] = svd(DCH);
[U2, S2, V2] = svd(DCV);
[U3, S3, V3] = svd(DCA);

[CAI1, CHI1, CVI1, CDI1] = lwt2(img,'haar');
DCH1 = dct2(CHI1);
DCV1 = dct2(CVI1);
DCA1 = dct2(CAI1);

[UI1, SI1, VI1] = svd(DCH1);
[UI2, SI2, VI2] = svd(DCV1);
[UI3, SI3, VI3] = svd(DCA1);

SR1 = (S1 - SI1) /alpha;
SR2 = (S2 - SI2) /alpha;
SR3 = (S3 - SI3) /alpha;

I1_s11 = UW1 * SR1 * VW1';
I1_s22 = UW2 * SR2 * VW2';
I1_s33 = UW3 * SR3 * VW3';

I1_d11 = idct2(I1_s11);
I1_d22 = idct2(I1_s22);
I1_d33 = idct2(I1_s33);

ExWaterMarked = ilwt2(I1_d33, I1_d11, I1_d22, CD1, 'haar');
figure;imshow(ExWaterMarked);title('Extracted Watermark');
