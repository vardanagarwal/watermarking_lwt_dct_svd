% for choice=12:12
%     for ch=1:1
%%%%%%%% 1 for rotation%%%%%%%
%%%WaterMarked=im2double(rgb2gray(imread('2.1.01.tiff')));
if(choice==1)
    if(ch==1)
        WaterMarkedatt=imrotate(WaterMarked,45);
    elseif(ch==2)
        WaterMarkedatt=imrotate(WaterMarked,2);
    elseif(ch==3)
        WaterMarkedatt=imrotate(WaterMarked,70);
    elseif(ch==4)
        WaterMarkedatt=imrotate(WaterMarked,110);
    elseif(ch==5)
        WaterMarkedatt=imrotate(WaterMarked,-270);
    elseif(ch==6)
        WaterMarkedatt=imrotate(WaterMarked,-2);
    elseif(ch==7)
        WaterMarkedatt=imrotate(WaterMarked,180);
    else
        WaterMarkedatt=imrotate(WaterMarked,270);
    end
    %%%%% 2 for crop%%%%%%
elseif(choice==2)
    if(ch==1)
        WaterMarkedatt=imcrop(WaterMarked,[5 5 507 507] );
    elseif(ch==2)
        WaterMarkedatt=imcrop(WaterMarked,[10 10 502 502]);
    elseif(ch==3)
        WaterMarkedatt=imcrop(WaterMarked,[15 15 497 497]);
    elseif(ch==4)
        WaterMarkedatt=imcrop(WaterMarked,[20 20 492 492]);
    elseif(ch==5)
        WaterMarkedatt=imcrop(WaterMarked,[25 25 487 487]);
    elseif(ch==6)
        WaterMarkedatt=imcrop(WaterMarked,[30 30 482 482]);
    elseif(ch==7)
        WaterMarkedatt=imcrop(WaterMarked,[64 64 448 448]);
    else
        WaterMarkedatt=imcrop(WaterMarked,[128 128 384 384]);
    end
    %%%%%3 for resize%%%%%%
elseif(choice==3)
    if(ch==1)
        WaterMarkedatt=imresize(WaterMarked,.125);
    elseif(ch==2)
        WaterMarkedatt=imresize(WaterMarked,.25);
    elseif(ch==3)
        WaterMarkedatt=imresize(WaterMarked,.5);
    elseif(ch==4)
        WaterMarkedatt=imresize(WaterMarked, 2);
    elseif(ch==5)
        WaterMarkedatt=imresize(WaterMarked,4);
    elseif(ch==6)
        WaterMarkedatt=imresize(WaterMarked,8);
    elseif(ch==7)
        WaterMarkedatt=imresize(WaterMarked,4.0);
    else
        WaterMarkedatt=imresize(WaterMarked,8.0);
    end
    %%%%4 for salt pepper noise
elseif(choice==4)
    if(ch==1)
        WaterMarkedatt=imnoise(WaterMarked,'speckle',0.001);
    elseif(ch==2)
        WaterMarkedatt=imnoise(WaterMarked,'salt & pepper',0.005);
    elseif(ch==3)
        WaterMarkedatt=imnoise(WaterMarked,'salt & pepper',0.01);
    elseif(ch==4)
        WaterMarkedatt=imnoise(WaterMarked,'salt & pepper',0.1);
    elseif(ch==5)
        WaterMarkedatt=imnoise(WaterMarked,'salt & pepper',0.3);
    elseif(ch==6)
        WaterMarkedatt=imnoise(WaterMarked,'salt & pepper',0.5);
    elseif(ch==7)
        WaterMarkedatt=imnoise(WaterMarked,'salt & pepper',0.2);
    else
        WaterMarkedatt=imnoise(WaterMarked,'salt & pepper', 0.25);
    end
    %%%% 5 for gaussian noise%%%%%%
elseif(choice==5)
    if(ch==1)
        WaterMarkedatt=imnoise(WaterMarked,'gaussian',0.01);
    elseif(ch==2)
        WaterMarkedatt=imnoise(WaterMarked,'gaussian',0.02);
    elseif(ch==3)
        WaterMarkedatt=imnoise(WaterMarked,'gaussian',0.03);
    elseif(ch==4)
        WaterMarkedatt=imnoise(WaterMarked,'gaussian',0.04);
    elseif(ch==5)
        WaterMarkedatt=imnoise(WaterMarked,'gaussian',0.05);
    elseif(ch==6)
        WaterMarkedatt=imnoise(WaterMarked,'gaussian',0.1);
    elseif(ch==7)
        WaterMarkedatt=imnoise(WaterMarked,'gaussian',0.2);
    else
        WaterMarkedatt=imnoise(WaterMarked,'gaussian',0.25);
    end
    %%%%6 for translate%%%%%
elseif(choice==6)
    if(ch==1)
        WaterMarkedatt=imtranslate(WaterMarked,[10 10]);
    elseif(ch==2)
        WaterMarkedatt=imtranslate(WaterMarked,[10 20]);
    elseif(ch==3)
        WaterMarkedatt=imtranslate(WaterMarked,[20 35]);
    elseif(ch==4)
        WaterMarkedatt=imtranslate(WaterMarked,[35 40]);
    elseif(ch==5)
        WaterMarkedatt=imtranslate(WaterMarked,[40 40]);
    elseif(ch==6)
        WaterMarkedatt=imtranslate(WaterMarked,[50 50]);
    elseif(ch==7)
        WaterMarkedatt=imtranslate(WaterMarked,[40 -40]);
    else
        WaterMarkedatt=imtranslate(WaterMarked,[-50 50]);
    end
    %%%%%7 for average filtering%%%%%
elseif(choice==7)
    if(ch==1)
        WaterMarkedatt=imfilter(WaterMarked,fspecial('average',[2 2]));
    elseif(ch==2)
        WaterMarkedatt=imfilter(WaterMarked,fspecial('average',[3 3]));
    elseif(ch==3)
        WaterMarkedatt=imfilter(WaterMarked,fspecial('average',[5 5]));
    elseif(ch==4)
        WaterMarkedatt=imfilter(WaterMarked,fspecial('average',[7 7]));
    elseif(ch==5)
        WaterMarkedatt=imfilter(WaterMarked,fspecial('average',[9 9]));
    elseif(ch==6)
        WaterMarkedatt=imfilter(WaterMarked,fspecial('average',[11 11]));
    elseif(ch==7)
        WaterMarkedatt=imfilter(WaterMarked,fspecial('average',[8 8]));        
    else
        WaterMarkedatt=imfilter(WaterMarked,fspecial('average',[10 10]));
    end
    %%%%%8 for gaussian filtering%%%%%
elseif(choice==8)
    if(ch==1)
        WaterMarkedatt=imfilter(WaterMarked,fspecial('gaussian',2 ,2));
    elseif(ch==2)
        WaterMarkedatt=imfilter(WaterMarked,fspecial('gaussian',3, 3));
    elseif(ch==3)
        WaterMarkedatt=imfilter(WaterMarked,fspecial('gaussian',5, 5));
    elseif(ch==4)
        WaterMarkedatt=imfilter(WaterMarked,fspecial('gaussian',7, 7));
    elseif(ch==5)
        WaterMarkedatt=imfilter(WaterMarked,fspecial('gaussian',9, 9));
    elseif(ch==6)
        WaterMarkedatt=imfilter(WaterMarked,fspecial('gaussian',11, 11));
    elseif(ch==7)
        WaterMarkedatt=imfilter(WaterMarked,fspecial('gaussian',8, 8));    
    else
        WaterMarkedatt=imfilter(WaterMarked,fspecial('gaussian',10,10));
    end
    %%%%%9 for motion blur%%%%%
elseif(choice==9)
    if(ch==1)
        WaterMarkedatt=imfilter(WaterMarked,fspecial('motion',2 ,2),'conv', 'circular');
    elseif(ch==2)
        WaterMarkedatt=imfilter(WaterMarked,fspecial('motion',4, 4),'conv', 'circular');
    elseif(ch==3)
        WaterMarkedatt=imfilter(WaterMarked,fspecial('motion',6, 6),'conv', 'circular');
    elseif(ch==4)
        WaterMarkedatt=imfilter(WaterMarked,fspecial('motion',8, 8),'conv', 'circular');
    elseif(ch==5)
        WaterMarkedatt=imfilter(WaterMarked,fspecial('motion',10, 10),'conv', 'circular');
    elseif(ch==6)
        WaterMarkedatt=imfilter(WaterMarked,fspecial('motion',15, 15),'conv', 'circular');
    elseif(ch==7)
        WaterMarkedatt=imfilter(WaterMarked,fspecial('motion',20, 20),'conv', 'circular');    
    else
        WaterMarkedatt=imfilter(WaterMarked,fspecial('motion',25,25),'conv', 'circular');
    end
    %%%%%10 for sharpening
elseif(choice==10)
    if(ch==1)
        WaterMarkedatt=imsharpen(WaterMarked,'Amount',.25);
    elseif(ch==2)
        WaterMarkedatt=imsharpen(WaterMarked,'Amount',.5);
    elseif(ch==3)
        WaterMarkedatt=imsharpen(WaterMarked,'Amount',.75);
    elseif(ch==4)
        WaterMarkedatt=imsharpen(WaterMarked,'Amount',1);
    elseif(ch==5)
        WaterMarkedatt=imsharpen(WaterMarked,'Amount',1.25);
    elseif(ch==6)
        WaterMarkedatt=imsharpen(WaterMarked,'Amount',1.5);
    elseif(ch==7)
        WaterMarkedatt=imsharpen(WaterMarked,'Amount',1.75);
    else
        WaterMarkedatt=imsharpen(WaterMarked,'Amount', 2.0);
    end
    %%%%%%11 for gamma correction
elseif(choice==11)
    if(ch==1)
        WaterMarkedatt(1:5, :) = 0;
        WaterMarkedatt(508:512, :) = 0;
    elseif(ch==2)
        WaterMarkedatt(:, 1:5) = 0;
        WaterMarkedatt(:, 508:512) = 0;
    elseif(ch==3)
        WaterMarkedatt(1:10, :) = 0;
        WaterMarkedatt(503:512, :) = 0;
    elseif(ch==4)
        WaterMarkedatt(:, 1:10) = 0;
        WaterMarkedatt(:, 503:512) = 0;
    elseif(ch==5)
        WaterMarkedatt(1:15, :) = 0;
        WaterMarkedatt(498:512, :) = 0;
    elseif(ch==6)
        WaterMarkedatt(:, 1:15) = 0;
        WaterMarkedatt(:, 498:512) = 0;
    elseif(ch==7)
        WaterMarkedatt=imadjust(WaterMarked,[],[],0.3);
    else
        WaterMarkedatt=imadjust(WaterMarked,[],[],0.1);
    end
    %%%%%%12 for jpeg compression
elseif(choice==12)
    if(ch==1)
        imwrite(WaterMarked,'C:\Users\hp\Desktop\WaterMarkedatt2.jpg','jpg','Quality',90);
        WaterMarkedatt=imread('C:\Users\hp\Desktop\WaterMarkedatt2.jpg');
    elseif(ch==2)
        imwrite(WaterMarked,'C:\Users\hp\Desktop\WaterMarkedatt2.jpg','jpg','Quality',70);
        WaterMarkedatt=imread('C:\Users\hp\Desktop\WaterMarkedatt2.jpg');
    elseif(ch==3)
        imwrite(WaterMarked,'C:\Users\hp\Desktop\WaterMarkedatt2.jpg','jpg','Quality',50);
        WaterMarkedatt=imread('C:\Users\hp\Desktop\WaterMarkedatt2.jpg');
    elseif(ch==4)
        imwrite(WaterMarked,'C:\Users\hp\Desktop\WaterMarkedatt2.jpg','jpg','Quality',40);
        WaterMarkedatt=imread('C:\Users\hp\Desktop\WaterMarkedatt2.jpg');
    elseif(ch==5)
        imwrite(WaterMarked,'C:\Users\hp\Desktop\WaterMarkedatt2.jpg','jpg','Quality',30);
        WaterMarkedatt=imread('C:\Users\hp\Desktop\WaterMarkedatt2.jpg');
    elseif(ch==6)
        imwrite(WaterMarked,'C:\Users\hp\Desktop\WaterMarkedatt2.jpg','jpg','Quality',20);
        WaterMarkedatt=imread('C:\Users\hp\Desktop\WaterMarkedatt2.jpg');
    elseif(ch==7)
        imwrite(WaterMarked,'C:\Users\hp\Desktop\WaterMarkedatt2.jpg','jpg','Quality',10);
        WaterMarkedatt=imread('C:\Users\hp\Desktop\WaterMarkedatt2.jpg');
    else
        imwrite(WaterMarked,'C:\Users\hp\Desktop\WaterMarkedatt2.jpg','jpg','Quality',5);
        WaterMarkedatt=imread('C:\Users\hp\Desktop\WaterMarkedatt2.jpg');
    end
    %%%%%13 for histogram equilization
elseif(choice==13)
if(ch==1)
    WaterMarkedatt=histeq(WaterMarked);
else
    WaterMarkedatt=adapthisteq(WaterMarked);
end
end
WaterMarkedatt=im2double(WaterMarkedatt);
WaterMarkedatt=imresize(WaterMarkedatt,[512 512]);
%figure;imshow(WaterMarkedatt);
%     end
% end




