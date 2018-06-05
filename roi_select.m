% %%%%%gram shmidt
% roi_gray=zeros(109,91,71);
% roi_white=zeros(109,91,71);
% roi_csf=zeros(109,91,71);
% for i=5:1:75
%     roi_gray(:,:,i-4)=roipoly(b_gray(:,:,i));
% end


%roi_gray.* zahre mar....

%%for gm, egm=roi_gray-roi_gray_p
NL_gm=zeros(7,4,218,182,146);
NL_wm=zeros(7,4,218,182,146); 
NL_csf=zeros(7,4,218,182,146);
LTLE_gm=zeros(5,4,218,182,146);
LTLE_wm=zeros(5,4,218,182,146); 
LTLE_csf=zeros(5,4,218,182,146);
RTLE_gm=zeros(5,4,218,182,146);
RTLE_wm=zeros(5,4,218,182,146); 
RTLE_csf=zeros(5,4,218,182,146);
tmp=zeros(218,182,146);
tic
for i=1:1:size(NL_gm,1)
    for j=1:1:size(NL_gm,2)
        tmp(:,:,:)=NLT(i,j,:,:,5:150);
        NL_gm(i,j,:,:,:)=tmp.*roi_grey2;
        NL_wm(i,j,:,:,:)=tmp.*roi_white2;
        NL_csf(i,j,:,:,:)=tmp.*roi_csf2;
    end
end
toc
 