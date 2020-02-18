% I = imread('C:\Users\hp\Desktop\testingg.png');
% results = ocr(I);
% imshow(I);
% word = results.Words{2};
I = imread('C:\Users\hp\Desktop\signature forgery\Dutch\TrainingSet\Offline Genuine\002_21.png');
figure;imshow(I);
%I = imsharpen(I, 'amount', 2);
I = imbinarize(rgb2gray(I));
%imhist(I);
bw = bwmorph(~I, 'thin', inf);
figure; imshow(~bw);
[m,n] = size(bw);
bw = ~bw;
l = -1;
for i = 1:n
    for j = 1:m
        if bw(m,n) == 0
            l = j;
        end
        bw(m,n) = 0
    end
    if l ~= -1
        i = n+5;
    end
end
bw