tic
for i=1:1:5
    for j=1:1:4
        tmp(:,:,:)=LTLET(i,j,:,:,5:150);
        LTLE_gm(i,j,:,:,:)=tmp.*roi_grey2;
        LTLE_wm(i,j,:,:,:)=tmp.*roi_white2;
        LTLE_csf(i,j,:,:,:)=tmp.*roi_csf2;
        tmp(:,:,:)=RTLET(i,j,:,:,5:150);
        RTLE_gm(i,j,:,:,:)=tmp.*roi_grey2;
        RTLE_wm(i,j,:,:,:)=tmp.*roi_white2;
        RTLE_csf(i,j,:,:,:)=tmp.*roi_csf2;
    end
end
toc

