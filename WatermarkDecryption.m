j=ExWaterMarked;
for kkk=1:mE
    for kk=1:4:nE
        j(kkk,kk:kk+3)=j(kkk,kk:kk+3)-MatA(h(kkk,kk),:);
    end
end
for kk=1:nE
    for kkk=1:4:mE
        j(kkk:kkk+3,kk)=j(kkk:kkk+3,kk)-MatA(:,h(kkk,kk));
    end
end
ExWaterMarked=j;
%     sheet='C:\Users\hp\Desktop\project on watermarking\excel_sheets\attack';
    %     cha=int2str(choice);
    %     sheet=strcat(sheet,cha,'.xls');
    %     xlswrite(sheet,p,'B3:G12');
    %     xlswrite(sheet,s,'B16:G25');
    %     xlswrite(sheet,m,'B29:G38');
    %     xlswrite(sheet,b,'B42:G51');
    %     xlswrite(sheet,r,'I42:M51');
    %     xlswrite(sheet,b2,'B55:G64');
    %     xlswrite(sheet,r2,'I55:M64');
    %     xlswrite(sheet,nCC,'B68:G77')'