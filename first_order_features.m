%%1st order statistical features
f2=zeros(17,48);
z=zeros(218,182,182);
for i=1:1:size(NL,1)
    for j=1:1:3
        for k=1:1:4
            z(:,:,:)=NL_segmented(i,k,:,:,:,j);
            z=z/max(max(max(z)));
            m=my_mean(z);
            s=my_var(z,m);
            sq=my_skewness(z,m);
            kurt=my_kurt(z,m);
            f2(i,(j-1)*16+(k-1)*4+1:(j-1)*16+k*4)=[m,s,sq,kurt];
        end
    end
end

for i=1:1:size(LTLE,1)
    for j=1:1:3
        for k=1:1:4
            z(:,:,:)=LTLE_segmented(i,k,:,:,:,j);
            z=z/max(max(max(z)));
            m=my_mean(z);
            s=my_var(z,m);
            sq=my_skewness(z,m);
            kurt=my_kurt(z,m);
            f2(i+7,(j-1)*16+(k-1)*4+1:(j-1)*16+k*4)=[m,s,sq,kurt];
        end
    end
end

for i=1:1:size(RTLE,1)
    for j=1:1:3
        for k=1:1:4
            z(:,:,:)=RTLE_segmented(i,k,:,:,:,j);
            z=z/max(max(max(z)));
            m=my_mean(z);
            s=my_var(z,m);
            sq=my_skewness(z,m);
            kurt=my_kurt(z,m);
            f2(i+12,(j-1)*16+(k-1)*4+1:(j-1)*16+k*4)=[m,s,sq,kurt];
        end
    end
end

