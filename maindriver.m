close all;
imagefolder=('C:\Users\hp\Desktop\project on watermarking\database\standard_test_images');
filename=dir(fullfile(imagefolder,'*.tif'));
totalimages=numel(filename);
wimg=imread('lake.tif');
wimg=im2double(wimg);
wimg=wimg(:,:,1);
wimg=imresize(wimg,[256 256]);
%figure;imshow(wimg);title('Watermarking image');
%imwrite(imresize(wimg,[120 120]),'C:\Users\hp\Desktop\project on watermarking\paper images\watermarking.png');
p=cell(totalimages,8);
s=cell(totalimages,8);
% m=cell(totalimages,8);
nCC=cell(totalimages,8);
% b=cell(totalimages,8);
% r=cell(totalimages,8);
% b2=cell(totalimages,8);
% r2=cell(totalimages,8);
for choice=11:11
    for k=1:1%totalimages
         f=fullfile(imagefolder,filename(k).name);
         img=imread(f);
        % img=imread('2.1.01.tiff');
         img=im2double(img);
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
        imshow(img);title('original')
%         f=fullfile(imagefolder,filename(1).name);
%         wimg=imread(f);
%         wimg=im2double(wimg);
%         siz=size(wimg);
%         siz2=size(siz);
%         if(siz2(1,2)==3)
%             if(siz(1,3)==3)
%                 wimg=rgb2gray(wimg);
%             end
%             if(siz(1,3)==2)
%                 wimg=wimg(:,:,1);
%             end
%         end
%         wimg=imresize(wimg,[256 256]);
        %figure;imshow(wimg);
        %figure;imshow(img);title('Cover image');
       % imwrite(imresize(img,[100 100]),'C:\Users\hp\Desktop\project on watermarking\paper images\Cover.png');
        WatermarkEmbeddingLLONLY;
        figure;imshow(WaterMarked);title('Image after watermarking');
        for ch=1:6
            Attacks;
            WatermarkExtractionLLONLY;
          %  figure;imshow(ExWaterMarked);title('Extracted Watermark');
           % imwrite(imresize(ExWaterMarked,[100 100]),'C:\Users\hp\Desktop\project on watermarking\paper images\Extractedwatermarking.png');
            p{k,ch}=psnr(wimg,ExWaterMarked);%to calculate psnr
            s{k,ch}=ssim(wimg,ExWaterMarked);%to calculate structural similarity index measurement
             nCC{k,ch}=max(max(normxcorr2(wimg,ExWaterMarked)));
%             m{k,ch}=mse(wimg,ExWaterMarked);%to calculate mean square error
%             z=im2uint8(wimg);
%             x=im2uint8(ExWaterMarked);%bit error ratio using integers
%             [b{k,ch},r{k,ch}]=biterr(z,x);
%             z2=imbinarize(wimg);
%             x2=imbinarize(ExWaterMarked);%bit error ratio using binary
%             [b2{k,ch},r2{k,ch}]=biterr(z2,x2);
            %fprintf('==watermarking image and extracted watermarked==\npsnr=%d \nssim=%d \nmean square error=%d \nbit error ratio using integer numbers and ratio=%d,%d \nusing binary=%d,%d\n',p,s,m,b,r,b2,r2)
        end
    end
%         names={'cameraman';'house';'jetplane';'lena';'livingroom';'mandril';'pirate';'walkbridge';'woman_blonde'};
%         sheet='C:\Users\hp\Desktop\project on watermarking\excel_sheets\attack';
%         cha=int2str(choice);
%         sheet=strcat(sheet,cha,'.xls');
%         xlswrite(sheet,names,'A3:A11');
%         xlswrite(sheet,names,'A14:A22');
%         xlswrite(sheet,names,'A25:A33');
%         xlswrite(sheet,p,'B3:I11');
%         xlswrite(sheet,s,'B14:I22');
%         xlswrite(sheet,nCC,'B25:I33');
end
