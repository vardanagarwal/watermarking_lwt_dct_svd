[CA, CH, CV, CD] = lwt2(img,'haar');
[rows,col]=size(wimg);
blocks=cell(floor(rows/8),floor(col/8));
blocks2=cell(floor(rows/8),floor(col/8));
blocks3=cell(floor(rows/8),floor(col/8));
blocks4=cell(floor(rows/8),floor(col/8));
blocks5=cell(floor(rows/8),floor(col/8));

ci=0;
for i=1:8:rows-7
    ci=ci+1;
    cj=0;
    for j=1:8:col-7
        cj=cj+1;
        blocks{ci,cj}=CA(i:i+7,j:j+7);
        blocks2{ci,cj}=wimg(i:i+7,j:j+7);
    end
end
I1_d3=zeros(rows,col);
UW=zeros(rows,col);
VW=zeros(rows,col);
alpha=1;
for i=1:rows/8
    for j=1:col/8
        blocks{i,j} = dct2(blocks{i,j});
        [blocks3{i,j}, blocks{i,j}, blocks4{i,j}] = svd(blocks{i,j});
        [UW((i-1)*8+1:i*8,((j-1)*8+1:j*8)),blocks2{i,j},VW((i-1)*8+1:i*8,((j-1)*8+1:j*8))]=svd(blocks2{i,j});
        blocks3{i,j} = blocks{i,j} + alpha * blocks2{i,j};
        blocks5{i,j} = blocks3{i,j} * blocks{i,j} * blocks4{i,j}';
        blocks5{i,j} = idct2(blocks5{i,j});
        I1_d3((i-1)*8+1:i*8,((j-1)*8+1:j*8))=blocks{i,j};
    end
end

WaterMarked = ilwt2(I1_d3, CH, CV, CD, 'haar');
figure;imshow(WaterMarked);title('Image after watermarking');
