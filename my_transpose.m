NLT=zeros(7,4,218,182,182);
RTLET=zeros(5,4,218,182,182);
LTLET=zeros(5,4,218,182,182);
b_csfT=zeros(218,182,182);
b_greyT=zeros(218,182,182);
b_whiteT=zeros(218,182,182);
cd('/Users/dayancolorado/Downloads/ICBM_Tissue_Prob');
b_csf = load_nii('csf3.nii.gz');
b_csf=b_csf.img;
%b_csf=uint8((b_csf)/255);
b_gray = load_nii('gray3.nii.gz');
b_gray=b_gray.img;
%b_gray=uint8(b_gray.vol/255);
b_white = load_nii('white3.nii.gz');
b_white=b_white.img;

tmp=zeros(182,218);

for i=1:1:182
tmp(:,:)=b_csf(:,:,i);
tmp2=tmp';
b_csfT(:,:,i)=tmp2;

tmp(:,:)=b_white(:,:,i);
tmp2=tmp';
b_whiteT(:,:,i)=tmp2;

tmp(:,:)=b_gray(:,:,i);
tmp2=tmp';
b_greyT(:,:,i)=tmp2;
end
    

for i=1:1:7
    for j=1:1:4
        for k=1:1:182
            tmp(:,:)=NL(i,j,:,:,k);
            tmp2=tmp';
            NLT(i,j,:,:,k)=tmp2;
        end
    end
end

for i=1:1:5
    for j=1:1:4
        for k=1:1:182
            tmp(:,:)=RTLE(i,j,:,:,k);
            tmp2=tmp';
            RTLET(i,j,:,:,k)=tmp2;
        end
    end
end
for i=1:1:5
    for j=1:1:4
        for k=1:1:182
            tmp(:,:)=LTLE(i,j,:,:,k);
            tmp2=tmp';
            LTLET(i,j,:,:,k)=tmp2;
        end
    end
end
            