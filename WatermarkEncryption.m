[mE,nE]=size(wimg);
j=wimg;
MatA=randn([4 4])*100;
g=UW;%use any of UW1,UW2,UW3,VW1,VW2 OR VW3
h=im2uint16(h);
for kkk=1:mE
    for kk=1:nE
        if(kk==1)
            h(kkk,1)=mod(h(kkk,1),4)+1;
        elseif(kkk==1)
            h(1,kk)=mod(h(1,kk),4)+1;
        else
            h(kkk,kk)=mod(h(kkk,kk)-h(kkk,kk-1)-h(kkk-1,kk)-h(kkk-1,kk-1),4)+1;
        end
    end
end
for kkk=1:mE
    for kk=1:4:nE
        j(kkk,kk:kk+3)=j(kkk,kk:kk+3)+MatA(h(kkk,kk),:);
    end
end
for kk=1:nE
    for kkk=1:4:mE
        j(kkk:kkk+3,kk)=j(kkk:kkk+3,kk)+MatA(:,h(kkk,kk));
    end
end
 figure;imshow(j);
 wimg=j;
