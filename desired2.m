% new roi_select4
d_gm_NL2=zeros(7,4,146);
d_wm_NL2=zeros(7,4,146);
d_csf_NL2=zeros(7,4,146);

d_gm_RTLE2=zeros(5,4,146);
d_wm_RTLE2=zeros(5,4,146);
d_csf_RTLE2=zeros(5,4,146);

d_gm_LTLE2=zeros(5,4,146);
d_wm_LTLE2=zeros(5,4,146);
d_csf_LTLE2=zeros(5,4,146);

for i=1:1:7
    for j=1:1:4
        for k=1:1:146
        tmp=(roi_grey2==1);
        tmp3=tmp(:,:,k);
        tmp2=NL_gm(i,j,:,:,k);
        d_gm_NL2(i,j,k)=mean(tmp2(tmp3));
        tmp=(roi_white2==1);
        tmp3=tmp(:,:,k);
        tmp2=NL_wm(i,j,:,:,k);
        d_wm_NL2(i,j,k)=mean(tmp2(tmp3));
        tmp=(roi_csf2==1);
        tmp3=tmp(:,:,k);
        tmp2=NL_csf(i,j,:,:,k);
        d_csf_NL2(i,j,k)=mean(tmp2(tmp3));
        end
    end
end

for i=1:1:5
    for j=1:1:4
        for k=1:1:146
        tmp=(roi_grey2==1);
        tmp3=tmp(:,:,k);
        tmp2=RTLE_gm(i,j,:,:,k);
        d_gm_RTLE2(i,j,k)=mean(tmp2(tmp3));
        tmp2=LTLE_gm(i,j,:,:,k);
        d_gm_LTLE2(i,j,k)=mean(tmp2(tmp3));
        
        tmp=(roi_white2==1);
        tmp3=tmp(:,:,k);
        tmp2=RTLE_wm(i,j,:,:,k);
        d_wm_RTLE2(i,j,k)=mean(tmp2(tmp3));
        tmp2=LTLE_wm(i,j,:,:,k);
        d_wm_LTLE2(i,j,k)=mean(tmp2(tmp3));
        
        tmp=(roi_csf2==1);
        tmp3=tmp(:,:,k);
        tmp2=RTLE_csf(i,j,:,:,k);
        d_csf_RTLE2(i,j,k)=mean(tmp2(tmp3));
        tmp2=LTLE_csf(i,j,:,:,k);
        d_csf_LTLE2(i,j,k)=mean(tmp2(tmp3));
        end
    end
end
