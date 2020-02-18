% wtmark function performs watermarking in DCT domain
% it processes the image into 8x8 blocks.

% im     = Input Image
% wt     = Watermark
% embimg = Output Embedded image
% p      = PSNR of Embedded image

% Checking Dimnesions
im=imread('2.1.01.tiff');
if length(size(im))>2
    im=rgb2gray(im);
end
wt=imread('screenshot.png');
im        = imresize(im,[512 512]); % Resize image
watermark = imresize(im2bw((wt)),[32 32]);% Resize and Change in binary 

x={}; % empty cell which will consist all blocks
dct_img=blkproc(im,[8,8],@dct2);% DCT of image using 8X8 block
m=dct_img; % Sorce image in which watermark will be inserted 

k=1; dr=0; dc=0;
% dr is to address 1:8 row every time for new block in x
% dc is to address 1:8 column every time for new block in x
% k is to change the no. of cell

%%%%%%%%%%%%%%%%% To divide image in to 4096---8X8 blocks %%%%%%%%%%%%%%%%%%
for ii=1:8:512 % To address row -- 8X8 blocks of image
    for jj=1:8:512 % To address columns -- 8X8 blocks of image
        for i=ii:(ii+7) % To address rows of blocks
            dr=dr+1;
            for j=jj:(jj+7) % To address columns of block
                dc=dc+1;
                z(dr,dc)=m(i,j);
            end
            dc=0;
        end
        x{k}=z; k=k+1;
        z=[]; dr=0;
    end
end
nn=x;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% To insert watermark in to  blocks %%%%%
i=[]; j=[]; w=1; wmrk=watermark; welem=numel(wmrk); % welem - no. of elements
for k=1:4096
    kx=(x{k}); % Extracting block into kx for processing
    for i=1:8 % To address row of block
        for j=1:8 % To adress column of block
            if (i==8) && (j==8) && (w<=welem) % Eligiblity condition to insert watremark
                % i=1 and j=1 - means embedding element in first bit of every block                             
                 if wmrk(w)==0
                    kx(i,j)=kx(i,j)+35;
                elseif wmrk(w)==1
                    kx(i,j)=kx(i,j)-35;
                 end                                
            end            
        end        
    end
    w=w+1;
    x{k}=kx; kx=[]; % Watermark value will be replaced in block
end     

%%%%%%%%%%%%%%%%%%%%%%%%%%%% To recombine cells in to image %%%%%%%%%
i=[]; j=[]; data=[]; count=0;
embimg1={}; % Changing complete row cell of 4096 into 64 row cell 
for j=1:64:4096
    count=count+1;
    for i=j:(j+63)
        data=[data,x{i}];
    end
    embimg1{count}=data;
    data=[];
end

% Change 64 row cell in to particular columns to form image
i=[]; j=[]; data=[]; 
embimg=[];  % final watermark image 
for i=1:64
    embimg=[embimg;embimg1{i}];
end
embimg=(uint8(blkproc(embimg,[8 8],@idct2)));
figure;imshow(embimg);
p=psnr(im,embimg);

%watermark extraction
[row clm]=size(embimg);
m=embimg;

%%%%%%%%%%%%%%%%% To divide image in to 4096---8X8 blocks %%%%%%%%%%%%%%%%%%
k=1; dr=0; dc=0;
% dr is to address 1:8 row every time for new block in x
% dc is to address 1:8 column every time for new block in x
% k is to change the no. of cell
for ii=1:8:row % To address row -- 8X8 blocks of image
    for jj=1:8:clm % To address columns -- 8X8 blocks of image
        for i=ii:(ii+7) % To address rows of blocks
            dr=dr+1;
            for j=jj:(jj+7) % To address columns of block
                dc=dc+1;
                z(dr,dc)=m(i,j);
            end
            dc=0;
        end
        x{k}=z; k=k+1;
        z=[]; dr=0;
    end
end
nn=x;

%% Extract water mark %%
wm=[]; wm1=[]; k=1; wmwd=[]; wmwd1=[];
while(k<1025)
    for i=1:32
    kx=x{k}; % Extracting Blocks one by one
    dkx=blkproc(kx,[8 8],@dct2); % Applying Dct
    nn{k}=dkx; % Save DCT values in new block to cross check
    
    %% Change me for pixel location
    wm1=[wm1 dkx(8,8)]; % Forming a row of 32 by 8,8 element
   
    % Extracting water mark without dct
     wmwd1=[wmwd1 kx(8,8)];
      k=k+1;
    end
    wm=[wm;wm1]; wm1=[]; % Forming columns of 32x32
    wmwd=[wmwd;wmwd1]; wmwd1=[];
end

for i=1:32
    for j=1:32
        diff=wm(i,j); 
        if diff >=0
            wm(i,j)=0;
        elseif diff < 0
            wm(i,j)=1;
        end
    end
end

wm=wm';
figure;imshow(wm);
