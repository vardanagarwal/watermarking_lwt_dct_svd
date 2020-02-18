%LWT
wimg=imread('Capture.PNG');
wimg=im2double(wimg);
wimg=rgb2gray(wimg);
wimg=imresize(wimg,[256 256]);
img=imread('SIG.jpg');
img=rgb2gray(img);
img = imresize(img, [512 512]);
img=im2double(img);
[CA, CH, CV, CD] = lwt2(img,'haar');
DCA = dct2(CA);
[U, S, V] = svd(DCA);
[UW,SW,VW]=svd(wimg);
SC = S+SW;
for i=1:256
    SC(i,i)=SC(i,i)-100/(i*i*i*i);
end
IS=U*SC*V';
ID= idct2(IS);
emb = ilwt2(ID, CH, CV, CD, 'haar');
imshow(emb);


[CA2, CH2, CV2, CD2] = lwt2(emb,'haar');
DCA2 = dct2(CA2);
[U2, S2, V2] = svd(DCA2);
for i=1:256
    S2(i,i)=S2(i,i)+100/(i*i*i*i);
end
SW=S2-S;
ext = UW*SW*VW';
figure;
imshow(ext);
p=psnr(wimg,ext);

% %DWT-------------------------------------------------------------------
% wimg=imread('lake.tif');
% wimg=im2double(wimg);
% wimg=wimg(:,:,1);
% wimg=imresize(wimg,[256 256]);
% img=imread('mandril_color.tif');
% img=rgb2gray(img);
% img=im2double(img);
% [CA, CH, CV, CD] = dwt2(img,'haar');
% DCA = dct2(CA);
% [U, S, V] = svd(DCA);
% [UW,SW,VW]=svd(wimg);
% SC = S+SW;
% for i=1:256
%     SC(i,i)=SC(i,i)-100/(i*i*i*i);
% end
% IS=U*SC*V';
% ID= idct2(IS);
% emb = idwt2(ID, CH, CV, CD, 'haar');
% 
% 
% [CA2, CH2, CV2, CD2] = dwt2(emb,'haar');
% DCA2 = dct2(CA2);
% [U2, S2, V2] = svd(DCA2);
% for i=1:256
%     S2(i,i)=S2(i,i)+100/(i*i*i*i);
% end
% SW=S2-S;
% ext = UW*SW*VW';
% p1=psnr(wimg,ext);

% %swt-------------------------------------------------------------------------------
% wimg=imread('lake.tif');
% wimg=im2double(wimg);
% wimg=wimg(:,:,1);
% img=imread('mandril_color.tif');
% img=rgb2gray(img);
% img=im2double(img);
% [CA, CH, CV, CD] = swt2(img,1,'haar');
% DCA = dct2(CA);
% [U, S, V] = svd(DCA);
% [UW,SW,VW]=svd(wimg);
% SC = S+SW;
% for i=1:512
%     SC(i,i)=SC(i,i)-100/(i*i*i*i);
% end
% IS=U*SC*V';
% ID= idct2(IS);
% emb = iswt2(ID, CH, CV, CD, 'haar');
% 
% 
% 
% [CA2, CH2, CV2, CD2] = swt2(emb,1,'haar');
% DCA2 = dct2(CA2);
% [U2, S2, V2] = svd(DCA2);
% for i=1:512
%     S2(i,i)=S2(i,i)+100/(i*i*i*i);
% end
% SW=S2-S;
% ext = UW*SW*VW';
% p2=psnr(wimg,ext);

% %dtcwt----------------------------------------------------------------------------
% wimg=imread('lake.tif');
% wimg=im2double(wimg);
% wimg=wimg(:,:,1);
% wimg=imresize(wimg,[256 256]);
% img=imread('mandril_color.tif');
% img=rgb2gray(img);
% img=im2double(img);
% df = dtfilters('dtf2');
% ndt = dddtree2('cplxdt',img,1,df{1},df{2});
% b1=ndt.cfs{1,2};
% DCA = dct2(b1(:,:,1));
% [U, S, V] = svd(DCA);
% [UW,SW,VW]=svd(wimg);
% SC = S+SW;
% for i=1:256
%     SC(i,i)=SC(i,i)-100/(i*i*i*i);
% end
% IS=U*SC*V';
% b1(:,:,1)= idct2(IS);
% ndt.cfs{1,2}=b1;
% emb = idddtree2(ndt);
% 
% 
% ndt2 = dddtree2('cplxdt',emb,1,df{1},df{2});
% b2=ndt2.cfs{1,2};
% DCA2 = dct2(b2(:,:,1));
% [U2, S2, V2] = svd(DCA2);
% for i=1:256
%     S2(i,i)=S2(i,i)+100/(i*i*i*i);
% end
% SW=S2-S;
% ext = UW*SW*VW';
% p3=psnr(wimg,ext);

% %dtddt-----------------------------------------------------------------------------
% wimg=imread('lake.tif');
% wimg=im2double(wimg);
% wimg=wimg(:,:,1);
% wimg=imresize(wimg,[256 256]);
% img=imread('mandril_color.tif');
% img=rgb2gray(img);
% img=im2double(img);
% df = dtfilters('dtf2');
% ndt = dddtree2('ddt',img,1,'filters1');
% b1=ndt.cfs{1,2};
% DCA = dct2(b1(:,:,1));
% [U, S, V] = svd(DCA);
% [UW,SW,VW]=svd(wimg);
% SC = S+SW;
% for i=1:256
%     SC(i,i)=SC(i,i)-100/(i*i*i*i);
% end
% IS=U*SC*V';
% b1(:,:,1)= idct2(IS);
% ndt.cfs{1,2}=b1;
% emb = idddtree2(ndt);
% 
% emb = imsharpen(emb,'amount', 2);
% emb = imresize(emb, [512 512]);
% 
% ndt2 = dddtree2('ddt',emb,1,'filters1');
% b2=ndt2.cfs{1,2};
% DCA2 = dct2(b2(:,:,1));
% [U2, S2, V2] = svd(DCA2);
% for i=1:256
%     S2(i,i)=S2(i,i)+100/(i*i*i*i);
% end
% SW=S2-S;
% ext = UW*SW*VW';
% p4=psnr(wimg,ext);