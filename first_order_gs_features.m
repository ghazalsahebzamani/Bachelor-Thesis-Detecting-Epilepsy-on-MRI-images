%%1st order gs statistical features
f2_gs=zeros(17,12);
z=zeros(218,182,146);
for i=1:1:size(NL,1)
    for j=1:1:3
            z(:,:,:)=NL_gssegmented(i,:,:,:,j);
            z=z/max(max(max(z)));
            m=my_mean(z);
            s=my_var(z,m);
            sq=my_skewness(z,m);
            kurt=my_kurt(z,m);
            f2_gs(i,(j-1)*4+1:j*4)=[m,s,sq,kurt];
    end
end

for i=1:1:size(LTLE,1)
    for j=1:1:3
            z(:,:,:)=LTLE_gssegmented(i,:,:,:,j);
            z=z/max(max(max(z)));
            m=my_mean(z);
            s=my_var(z,m);
            sq=my_skewness(z,m);
            kurt=my_kurt(z,m);
            f2_gs(i+7,(j-1)*4+1:j*4)=[m,s,sq,kurt];
    end
end

for i=1:1:size(RTLE,1)
    for j=1:1:3
            z(:,:,:)=RTLE_gssegmented(i,:,:,:,j);
            z=z/max(max(max(z)));
            m=my_mean(z);
            s=my_var(z,m);
            sq=my_skewness(z,m);
            kurt=my_kurt(z,m);
            f2_gs(i+12,(j-1)*4+1:j*4)=[m,s,sq,kurt];
    end
end

