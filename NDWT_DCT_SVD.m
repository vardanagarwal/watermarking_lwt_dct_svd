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
    %%%%%%%figure;imshow(wimg);title('Watermarking image');ndt=ndwt2(img,1,'haar');
    ndt=ndwt2(img,1,'haar');
%DLL = dct2(ndt.dec{1,1});
DHL = dct2(ndt.dec{2,1});
DLH = dct2(ndt.dec{3,1});
DHH = dct2(ndt.dec{4,1});

%[U0, S0, V0] = svd(DLL);
[U1, S1, V1] = svd(DHL);
[U2, S2, V2] = svd(DLH);
[U3, S3, V3] = svd(DHH);

ndt2 = ndwt2(wimg,1,'haar');
%DLL1 = dct2(ndt2.dec{1,1});
DHL1 = dct2(ndt2.dec{2,1});
DLH1 = dct2(ndt2.dec{3,1});
DHH1 = dct2(ndt2.dec{4,1});

%[UW0, SW0, VW0] = svd(DLL1);
[UW1, SW1, VW1] = svd(DHL1);
[UW2, SW2, VW2] = svd(DLH1);
[UW3, SW3, VW3] = svd(DHH1);

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

%ndt.dec{1,1}=I1_d0;
ndt.dec{2,1}=I1_d1;
ndt.dec{3,1}=I1_d2;
ndt.dec{4,1}=I1_d3;
WaterMarked = indwt2(ndt, 'haar', 1);
%Watermarked_image=cat(3,WaterMarked,IG,IB);
%WaterMarked1 = uint8(WaterMarked); 
% figure;imshow(WaterMarked);title('Image after watermarking');
% xx=abs(img-WaterMarked);
% p=psnr(img,WaterMarked);%to calculate psnr
% s=ssim(img,WaterMarked);%to calculate structural similarity index measurement
% n=normxcorr2(img,WaterMarked);
% m=mse(img,WaterMarked);%to calculate mean square error
% z=im2uint8(img);
% x=im2uint8(WaterMarked);%bit error ratio using integers
% [b,r]=biterr(z,x);
% z2=im2bw(img);
% x2=im2bw(WaterMarked);%bit error ratio using binary
% [b2,r2]=biterr(z2,x2);
% fprintf('original image and watermarked image\npsnr=%d \nssim=%d \nmean square error=%d \nbit error ratio using integer numbers and ratio=%d,%d \nusing binary=%d,%d\n',p,s,m,b,r,b2,r2)

%watermark extraction
I1=WaterMarked;
I2=img;

ndt3 = ndwt2(I1,1,'haar');
DHL = dct2(ndt3.dec{2,1});
DLH = dct2(ndt3.dec{3,1});
DHH = dct2(ndt3.dec{4,1});

[U1, S1, V1] = svd(DHL);
[U2, S2, V2] = svd(DLH);
[U3, S3, V3] = svd(DHH);

ndt4 = ndwt2(I2,1,'haar');
DHL1 = dct2(ndt4.dec{2,1});
DLH1 = dct2(ndt4.dec{3,1});
DHH1 = dct2(ndt4.dec{4,1});

[UI1, SI1, VI1] = svd(DHL1);
[UI2, SI2, VI2] = svd(DLH1);
[UI3, SI3, VI3] = svd(DHH1);

SR1 = (S1 - SI1) /alpha;
SR2 = (S2 - SI2) /alpha;
SR3 = (S3 - SI3) /alpha;

I1_s11 = UW1 * SR1 * VW1';
I1_s22 = UW2 * SR2 * VW2';
I1_s33 = UW3 * SR3 * VW3';

I1_d11 = idct2(I1_s11);
I1_d22 = idct2(I1_s22);
I1_d33 = idct2(I1_s33);

ndt4.dec{1,1}=ndt2.dec{1,1};
ndt4.dec{2,1}=I1_d11;
ndt4.dec{3,1}=I1_d22;
ndt4.dec{4,1}=I1_d33;

ExWaterMarked = indwt2(ndt4, 'haar',1);
figure;imshow(ExWaterMarked);title('Extracted Watermark');
%yy=abs(ExWaterMarked-wimg);
 p{k,1}=psnr(wimg,ExWaterMarked);%to calculate psnr
    s{k,1}=ssim(wimg,ExWaterMarked);%to calculate structural similarity index measurement
    n=normxcorr2(wimg,ExWaterMarked);
    ncc=max(max(n));
    m{k,1}=mse(wimg,ExWaterMarked);%to calculate mean square error
    z=im2uint8(wimg);
    x=im2uint8(ExWaterMarked);%bit error ratio using integers
    [b{k,1},r{k,1}]=biterr(z,x);
    z2=im2bw(wimg);
    x2=im2bw(ExWaterMarked);%bit error ratio using binary
    [b2{k,1},r2{k,1}]=biterr(z2,x2);
   % fprintf('==watermarking image and extracted watermarked==\npsnr=%d \nssim=%d \nmean square error=%d \nbit error ratio using integer numbers and ratio=%d,%d \nusing binary=%d,%d\n',p,s,m,b,r,b2,r2)
end
xlswrite('C:\Users\hp\Desktop\project on watermarking\excel_sheets\psnr.xls',p,'D1:D10');
xlswrite('C:\Users\hp\Desktop\project on watermarking\excel_sheets\ssim.xls',s,'D1:D10');
xlswrite('C:\Users\hp\Desktop\project on watermarking\excel_sheets\mse.xls',m,'D1:D10');
xlswrite('C:\Users\hp\Desktop\project on watermarking\excel_sheets\ber_int.xls',b,'G1:G10');
xlswrite('C:\Users\hp\Desktop\project on watermarking\excel_sheets\ber_int.xls',r,'H1:H10');
xlswrite('C:\Users\hp\Desktop\project on watermarking\excel_sheets\ber_binary.xls',b2,'G1:G10');
xlswrite('C:\Users\hp\Desktop\project on watermarking\excel_sheets\ber_binary.xls',r2,'H1:H10');