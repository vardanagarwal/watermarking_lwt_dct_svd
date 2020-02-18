%watermark embedding
imagefolder=('C:\Users\hp\Desktop\project on watermarking\database\standard_test_images');
filename=dir(fullfile(imagefolder,'*.tif'));
totalimages=numel(filename);
p=cell(totalimages,1);
s=cell(totalimages,1);
m=cell(totalimages,1);
b=cell(totalimages,1);
r=cell(totalimages,1);
b22=cell(totalimages,1);
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

ndt = dddtree2('ddt',img,1,'filters1');
b1=ndt.cfs{1,2};
% DLL = dct2(b1(:,:,1));
% DHL = dct2(b1(:,:,2));
% DLH = dct2(b1(:,:,3));
% DHH = dct2(b1(:,:,4));
% 
% [U0, S0, V0] = svd(DLL);
% [U1, S1, V1] = svd(DHL);
% [U2, S2, V2] = svd(DLH);
% [U3, S3, V3] = svd(DHH);
DLL=dct2(b1);
[U0, S0, V0] = svd(DLL);

ndt2 = dddtree2('ddt',wimg,1,'filters1');
b2=ndt2.cfs{1,2};
% DLL1 = dct2(b2(:,:,1));
% DHL1 = dct2(b2(:,:,2));
% DLH1 = dct2(b2(:,:,3));
% DHH1 = dct2(b2(:,:,4));
% 
% [UW0, SW0, VW0] = svd(DLL1);
% [UW1, SW1, VW1] = svd(DHL1);
% [UW2, SW2, VW2] = svd(DLH1);
% [UW3, SW3, VW3] = svd(DHH1);
DLL1=dct2(b2);
[UW0, SW0, VW0] = svd(DLL1);

alpha=0.001;
SC0 = S0 + alpha *SW0;
% SC1 = S1 + alpha * SW1;
% SC2 = S2 + alpha * SW2;
% SC3 = S3 + alpha * SW3;

I1_s0 = U0 * SC0 * V0';
% I1_s1 = U1 * SC1 * V1';
% I1_s2 = U2 * SC2 * V2';
% I1_s3 = U3 * SC3 * V3';

I1_d0 = idct2(I1_s0);
% I1_d1 = idct2(I1_s1);
% I1_d2 = idct2(I1_s2);
% I1_d3 = idct2(I1_s3);

% b1(:,:,1)=I1_d0;
% b1(:,:,2)=I1_d1;
% b1(:,:,3)=I1_d2;
% b1(:,:,4)=I1_d3;
b1=I1_d0;
ndt.cfs{1,2}=b1;

WaterMarked = idddtree2(ndt);
%Watermarked_image=cat(3,WaterMarked,IG,IB);
%WaterMarked1 = uint8(WaterMarked); 
%figure;imshow(WaterMarked);title('Image after watermarking');
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

ndt3 = dddtree2('ddt',I1,1,'filters1');
b3=ndt3.cfs{1,2};

% DLL = dct2(b3(:,:,1));
% DHL = dct2(b3(:,:,2));
% DLH = dct2(b3(:,:,3));
% DHH = dct2(b3(:,:,4));
% 
% [U0,S0,V0]=svd(DLL);
% [U1, S1, V1] = svd(DHL);
% [U2, S2, V2] = svd(DLH);
% [U3, S3, V3] = svd(DHH);
DLL=dct2(b3);
[U0,S0,V0]=svd(DLL);

ndt4 = dddtree2('ddt',I2,1,'filters1');
b4=ndt4.cfs{1,2};
% DLL1 = dct2(b4(:,:,1));
% DHL1 = dct2(b4(:,:,2));
% DLH1 = dct2(b4(:,:,3));
% DHH1 = dct2(b4(:,:,4));
% 
% [UI0, SI0, VI0] = svd(DLL1);
% [UI1, SI1, VI1] = svd(DHL1);
% [UI2, SI2, VI2] = svd(DLH1);
% [UI3, SI3, VI3] = svd(DHH1);
DLL1=dct2(b4);
[UI0, SI0, VI0] = svd(DLL1);

SR0 = (S0 - SI0) /alpha;
% SR1 = (S1 - SI1) /alpha;
% SR2 = (S2 - SI2) /alpha;
% SR3 = (S3 - SI3) /alpha;

I1_s00 = UW0 * SR0 * VW0';
% I1_s11 = UW1 * SR1 * VW1';
% I1_s22 = UW2 * SR2 * VW2';
% I1_s33 = UW3 * SR3 * VW3';

I1_d00 = idct2(I1_s00);
% I1_d11 = idct2(I1_s11);
% I1_d22 = idct2(I1_s22);
% I1_d33 = idct2(I1_s33);

% b4(:,:,1)=I1_d00;
% b4(:,:,2)=I1_d11;
% b4(:,:,3)=I1_d22;
% b4(:,:,4)=I1_d33;
%b4(:,:,5)=b2(:,:,5);
b4=I1_d00;
ndt4.cfs{1,1}=ndt2.cfs{1,1};
ndt4.cfs{1,2}=b4;

ndt4.filters=ndt2.filters;
ExWaterMarked = idddtree2(ndt4);
figure;imshow(ExWaterMarked);title('Extracted Watermark');
%yy=abs(ExWaterMarked-wimg);
 p{k,1}=psnr(wimg,ExWaterMarked);%to calculate psnr
    s{k,1}=ssim(wimg,ExWaterMarked);%to calculate structural similarity index measurement
    n=normxcorr2(wimg,ExWaterMarked);
    m{k,1}=mse(wimg,ExWaterMarked);%to calculate mean square error
    z=im2uint8(wimg);
    x=im2uint8(ExWaterMarked);%bit error ratio using integers
    [b{k,1},r{k,1}]=biterr(z,x);
    z2=im2bw(wimg);
    x2=im2bw(ExWaterMarked);%bit error ratio using binary
    [b22{k,1},r2{k,1}]=biterr(z2,x2);
%     fprintf('==watermarking image and extracted watermarked==\npsnr=%d \nssim=%d \nmean square error=%d \nbit error ratio using integer numbers and ratio=%d,%d \nusing binary=%d,%d\n',p,s,m,b,r,b2,r2)
end
xlswrite('C:\Users\hp\Desktop\project on watermarking\excel_sheets\psnr.xls',p,'F1:F10');
xlswrite('C:\Users\hp\Desktop\project on watermarking\excel_sheets\ssim.xls',s,'F1:F10');
xlswrite('C:\Users\hp\Desktop\project on watermarking\excel_sheets\mse.xls',m,'F1:F10');
xlswrite('C:\Users\hp\Desktop\project on watermarking\excel_sheets\ber_int.xls',b,'K1:K10');
xlswrite('C:\Users\hp\Desktop\project on watermarking\excel_sheets\ber_int.xls',r,'L1:L10');
xlswrite('C:\Users\hp\Desktop\project on watermarking\excel_sheets\ber_binary.xls',b22,'K1:K10');
xlswrite('C:\Users\hp\Desktop\project on watermarking\excel_sheets\ber_binary.xls',r2,'L1:L10');
