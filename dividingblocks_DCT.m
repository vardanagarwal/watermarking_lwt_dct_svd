%watermark embedding
img=imread('2.1.01.tiff');
img=im2double(img);
img=rgb2gray(img);
originalimg=img;
[m,n]=size(img);
blocks=cell(floor(m/8),floor(n/8));
ci=0;
for i=1:8:m-7
    ci=ci+1;
    cj=0;
    for j=1:8:n-7
        cj=cj+1;
        blocks{ci,cj}=img(i:i+7,j:j+7);
    end
end
figure;imshow(img);title('original image');
%figure; imshow(blocks{1,1})
for i=1:m/8
    for j=1:n/8
        blocks{i,j}=dct(blocks{i,j});
    end
end
img2=imread('C:\Users\hp\Desktop\project on watermarking\database\misc\4.2.07.tiff');
img2=im2double(img2);
img2=rgb2gray(img2);
figure ;imshow(img2);title('Watermarking image');
blocks2=cell(floor(m/8),floor(n/8));
ci=0;
for i=1:8:m-7
    ci=ci+1;
    cj=0;
    for j=1:8:n-7
        cj=cj+1;
        blocks2{ci,cj}=img2(i:i+7,j:j+7);
    end
end
for i=1:m/8
    for j=1:n/8
        blocks{i,j}=blocks{i,j}+blocks2{i,j}*0.0001;
    end
end
for i=1:m/8
    for j=1:n/8
        blocks{i,j}=idct(blocks{i,j});
    end
end
%figure; imshow(blocks{1,1})
img=(zeros(m,n));
for i=1:m/8
    for j=1:n/8
        img((i-1)*8+1:i*8,(j-1)*8+1:j*8)=blocks{i,j};
    end
end
figure;imshow(img); title('image after watermarking');
xyz=abs(img-originalimg);
%figure;imshow(xyz*100)
%watermark extraction
[m,n]=size(originalimg);
blocks3=cell(floor(m/8),floor(n/8));
ci=0;
for i=1:8:m-7
    ci=ci+1;
    cj=0;
    for j=1:8:n-7
        cj=cj+1;
        blocks3{ci,cj}=originalimg(i:i+7,j:j+7);
    end
end
for i=1:m/8
    for j=1:n/8
        blocks3{i,j}=dct(blocks3{i,j});
    end
end
for i=1:m/8
    for j=1:n/8
        blocks{i,j}=dct(blocks{i,j});
    end
end
blocks4=cell(floor(m/8),floor(n/8));
for i=1:m/8
    for j=1:n/8
        blocks4{i,j}=(blocks{i,j}-blocks3{i,j})/0.0001;
    end
end
wimg2=(zeros(m,n));
for i=1:m/8
    for j=1:n/8
        wimg2((i-1)*8+1:i*8,(j-1)*8+1:j*8)=blocks4{i,j};
    end
end
figure;imshow(wimg2);title('watermark image after extraction');
xyz2=abs(wimg2-img2);
%16=0.887s,8=1.951s,4=5.912s