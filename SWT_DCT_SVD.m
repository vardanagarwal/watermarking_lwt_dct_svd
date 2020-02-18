%watermark embedding
imagefolder=('C:\Users\hp\Desktop\project on watermarking\database\standard_test_images');
filename=dir(fullfile(imagefolder,'*.tif'));
totalimages=numel(filename);
p=cell(totalimages,1);
s=cell(totalimages,1);
m=cell(totalimages,1);
b=cell(totalimages,1);
r=cell(totalimages,1);
b2=cell(totalimages,1);
r2=cell(totalimages,1);
for k=1:totalimages
    f=fullfile(imagefolder,filename(k).name);
    img=imread(f);
   % img=imread('2.1.01.tiff');
    img=im2double(img);
    wimg=imread('lake.tif');
    wimg=im2double(wimg);
    siz=size(img);
    siz2=size(siz);
    if(siz2(1,2)==3)
    if(siz(1,3)==3)
        img=rgb2gray(img);
    end
    if(siz(1,3)==2)
        img=img(:,:,1);
    end
    end
    %%%%%%%%figure;imshow(img);title('Cover image');
    %I1=img(:,:,1);%get the first color in case of RGB image
    %IG=img(:,:,2);
    %IB=img(:,:,3);

    %wimg=rgb2gray(wimg);
    wimg=wimg(:,:,1);
    %%%%%%%figure;imshow(wimg);title('Watermarking image');

[CA, CH, CV, CD] = swt2(img,1,'haar');
%DCA = dct2(CA);
DCH = dct2(CH);
DCV = dct2(CV);
DCD = dct2(CD);

%[U0, S0, V0] = svd(DCA);
[U1, S1, V1] = svd(DCH);
[U2, S2, V2] = svd(DCV);
[U3, S3, V3] = svd(DCD);

[CA1, CH1, CV1, CD1] = swt2(wimg,1,'haar');
%DCA1 = dct2(CA1);
DCH1 = dct2(CH1);
DCV1 = dct2(CV1);
DCD1 = dct2(CD1);

%[UW0, SW0, VW0] = svd(DCA1);
[UW1, SW1, VW1] = svd(DCH1);
[UW2, SW2, VW2] = svd(DCV1);
[UW3, SW3, VW3] = svd(DCD1);

alpha=0.001;
%SC0 = S0 + alpha *SW0;
SC1 = S1 + alpha * SW1;
SC2 = S2 + alpha * SW2;
SC3 = S3 + alpha * SW3;

%I1_s0 = U1 * SC0 * V0';
I1_s1 = U1 * SC1 * V1';
I1_s2 = U2 * SC2 * V2';
I1_s3 = U3 * SC3 * V3';

%I1_d0 = idct2(I1_s0);
I1_d1 = idct2(I1_s1);
I1_d2 = idct2(I1_s2);
I1_d3 = idct2(I1_s3);

WaterMarked = iswt2(CA, I1_d1, I1_d2, I1_d3, 'haar');
%Watermarked_image=cat(3,WaterMarked,IG,IB);
%WaterMarked1 = uint8(WaterMarked); 
%%%%%%figure;imshow(WaterMarked);title('Image after watermarking');
% xx=abs(img-WaterMarked);
% p=psnr(img,WaterMarked);%to calculate psnr
% s=ssim(img,WaterMarked);%to calculate structural similarity index measurement
% n=normxcorr2(img,WaterMarked);
% m=mse(img,WaterMarked);%to calculate mean square error
% z=im2uint8(img);
% x=im2uint8(WaterMarked);
% [b,r]=biterr(z,x);%bit error ratio using integers
% z2=im2bw(img);
% x2=im2bw(WaterMarked);
% [b2,r2]=biterr(z2,x2);%bit error ratio using binary
% fprintf('original image and watermarked image\npsnr=%d \nssim=%d \nmean square error=%d \nbit error ratio using integer numbers and ratio=%d,%d \nusing binary=%d,%d\n',p,s,m,b,r,b2,r2)
%figure;imshow(n);

%watermark extraction
I1=WaterMarked;
I2=img;

[CA, CH, CV, CD,] = swt2(I1,1,'haar');
%DCA = dct2(CA);
DCH = dct2(CH);
DCV = dct2(CV);
DCD = dct2(CD);

[U1, S1, V1] = svd(DCH);
[U2, S2, V2] = svd(DCV);
[U3, S3, V3] = svd(DCD);

[CAI1, CHI1, CVI1, CDI1] = swt2(I2,1,'haar');
DCH1 = dct2(CHI1);
DCV1 = dct2(CVI1);
DCD1 = dct2(CDI1);

[UI1, SI1, VI1] = svd(DCH1);
[UI2, SI2, VI2] = svd(DCV1);
[UI3, SI3, VI3] = svd(DCD1);

SR1 = (S1 - SI1) /alpha;
SR2 = (S2 - SI2) /alpha;
SR3 = (S3 - SI3) /alpha;

I1_s11 = UW1 * SR1 * VW1';
I1_s22 = UW2 * SR2 * VW2';
I1_s33 = UW3 * SR3 * VW3';

I1_d11 = idct2(I1_s11);
I1_d22 = idct2(I1_s22);
I1_d33 = idct2(I1_s33);

ExWaterMarked = iswt2(CA1, I1_d11, I1_d22, I1_d33, 'haar');
figure;imshow(ExWaterMarked);title('Extracted Watermark');
%yy=abs(ExWaterMarked-wimg);
 p{k,1}=psnr(wimg,ExWaterMarked);%to calculate psnr
    s{k,1}=ssim(wimg,ExWaterMarked);%to calculate structural similarity index measurement
    n=normxcorr2(wimg,ExWaterMarked);
%     m{k,1}=mse(wimg,ExWaterMarked);%to calculate mean square error
%     z=im2uint8(wimg);
%     x=im2uint8(ExWaterMarked);%bit error ratio using integers
%     [b{k,1},r{k,1}]=biterr(z,x);
%     z2=im2bw(wimg);
%     x2=im2bw(ExWaterMarked);%bit error ratio using binary
%     [b2{k,1},r2{k,1}]=biterr(z2,x2);
%fprintf('==watermarking image and extracted watermarked==\npsnr=%d \nssim=%d \nmean square error=%d \nbit error ratio using integer numbers and ratio=%d,%d \nusing binary=%d,%d\n',p,s,m,b,r,b2,r2)
end
% xlswrite('C:\Users\hp\Desktop\project on watermarking\excel_sheets\psnr.xls',p,'B1:B10');
% xlswrite('C:\Users\hp\Desktop\project on watermarking\excel_sheets\ssim.xls',s,'B1:B10');
% xlswrite('C:\Users\hp\Desktop\project on watermarking\excel_sheets\mse.xls',m,'B1:B10');
% xlswrite('C:\Users\hp\Desktop\project on watermarking\excel_sheets\ber_int.xls',b,'C1:C10');
% xlswrite('C:\Users\hp\Desktop\project on watermarking\excel_sheets\ber_int.xls',r,'D1:D10');
% xlswrite('C:\Users\hp\Desktop\project on watermarking\excel_sheets\ber_binary.xls',b2,'C1:C10');
% xlswrite('C:\Users\hp\Desktop\project on watermarking\excel_sheets\ber_binary.xls',r2,'D1:D10');

