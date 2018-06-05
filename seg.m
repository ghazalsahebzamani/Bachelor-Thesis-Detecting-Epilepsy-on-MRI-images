%function (M1,M2,M3,S1,S2,S3,y1,y2,y3)=seg(img)
%%%%%%segmentation%%%%%
%

b_csfT2=b_csfT/double(max(max(max(b_csfT))));
b_whiteT2=b_whiteT/double(max(max(max(b_whiteT))));
b_greyT2=b_greyT/double(max(max(max(b_greyT))));
%b_white=uint8((b_white.vol)/255);

LTLE_segmented=zeros(5,4,218,182,182,3);

%RTLE_segmented=zeros(5,4,182,218,182,3);
xxx=zeros(218,182,182);
y1=sum(sum(sum(b_csfT2)))/(182*218*182); %*double(max(max(max(b_csfT)))));
y2=sum(sum(sum(b_greyT2)))/(182*218*182);%*double(max(max(max(b_greyT)))));
y3=sum(sum(sum(b_whiteT2)))/(182*218*182);
%       M1=mean(mean(mean(b_csfT2)));
%         M2=mean(mean(mean(b_gray)));
%         M3=mean(mean(mean(b_white)));
%         S1=(sum(sum(sum(((b_csf-M1).^2)))))/(182*218*182-1);
%         S2=(sum(sum(sum(((b_gray-M2).^2)))))/(182*218*182-1);
%         S3=(sum(sum(sum(((b_white-M3).^2)))))/(182*218*182-1);
%        y1=sum(sum(sum(b_csf)))/(182*218*182*double(max(max(max(b_csf)))));
%        y2=sum(sum(sum(b_gray)))/(182*218*182*double(max(max(max(b_gray)))));
%        y3=sum(sum(sum(b_white)))/(182*218*182*double(max(max(max(b_white)))));
 tic     
for i=1:1:5
    for j=1:1:4
        xxx(:,:,:)=LTLET(i,j,:,:,:);
        q10=b_csfT2;%/double(max(max(max(b_csfT))));
        q20=b_greyT2;%/double(max(max(max(b_greyT))));
        q30=b_whiteT2;%/double(max(max(max(b_whiteT))));
        nom1=sum(sum(sum(q10.*xxx)));
        denom1=sum(sum(sum((q10))));
        M1=nom1/denom1;
        nom2=sum(sum(sum(q20.*xxx)));
        denom2=sum(sum(sum((q20))));
        M2=nom2/denom2;
        nom3=sum(sum(sum(q30.*xxx)));
        denom3=sum(sum(sum((q30))));
        M3=nom3/denom3;
        S1=((sum(sum(sum(q10.*((M1-xxx).^2)))))/(sum(sum(sum(q10)))));
        S2=((sum(sum(sum(q20.*((M2-xxx).^2)))))/(sum(sum(sum(q20)))));
        S3=((sum(sum(sum(q30.*((M3-xxx).^2)))))/(sum(sum(sum(q30))))); 


        for k=1:1:10
            [M1,M2,M3,S1,S2,S3,y1,y2,y3,q1,q2,q3]=segment(xxx,b_csfT2,b_whiteT2,b_greyT2,M1,M2,M3,S1,S2,S3,y1,y2,y3);

        end
        aa=zeros(218,182,182);
        aa(:,:,:)=LTLET(i,j,:,:,:);
        LTLE_segmented(i,j,:,:,:,1)=q1(:,:,:).*aa(:,:,:);
        LTLE_segmented(i,j,:,:,:,2)=q2(:,:,:).*aa(:,:,:);
        %LTLE_segmented(i,j,:,:,:,3)=q3(:,:,:).*aa(:,:,:);
        LTLE_segmented(i,j,:,:,:,3)=q3(:,:,:).*b_whiteT2(:,:,:);
    end
end
toc









