i=imread('C:\Users\hp\Desktop\project on watermarking\database\standard_test_images\lena_color_512.tif');
i=rgb2gray(i);
i=im2double(i);
imshow(i);
i=imresize(i,[12 12]);
[CA,CH,CV,CD]=lwt2(i,'haar');
% imshow(CA);title('CA');
% figure;
% imshow(CH);title('CH');
% figure;
% imshow(CV);title('CV');
% figure;
% imshow(CD);title('CD');
 d=dct2(CA);
% figure;
% imshow(d);
[u,s,v]=svd(d);
% figure;
% imshow(s);
wimg=imread('lake.tif');
wimg=im2double(wimg);
wimg=wimg(:,:,1);
wimg=imresize(wimg,[6 6]);
% figure;
% imshow(wimg);
[u2,s2,v2]=svd(wimg);
% xlswrite('C:\Users\hp\Desktop\flowchart images\d-s.xls',d);
% xlswrite('C:\Users\hp\Desktop\flowchart images\d-s.xls',s,'A8:F13');
% xlswrite('C:\Users\hp\Desktop\flowchart images\d-s.xls',s2,'A15:F20');
 s222=s+s2;
 for i=1:6
    s222(i,i)=s222(i,i)-100/(i*i*i*i);
end
 xlswrite('C:\Users\hp\Desktop\flowchart images\d-s.xls',s222,'A22:F27');
is=u*s222*v';
id=idct2(is);
wimg1=ilwt2(id,CH,CV,CD,'haar');
figure;
imshow(wimg1);
[CA2,CH2,CV2,CD2]=lwt2(wimg1,'haar');
d=dct2(CA2);
[u22,s22,v22]=svd(d);
s21=s22-s;
for i=1:256
    s21(i,i)=s21(i,i)+100/(i*i*i*i);
end
wimg2=u2*s21*v2';
figure; imshow(wimg2);
