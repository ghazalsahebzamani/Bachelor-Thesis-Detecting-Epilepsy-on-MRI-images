%feature extraction%  %2nd order
features=zeros(17,36*3*4);
count=0;
z=zeros(218,182,182);
tic
for i=1:1:size(NL,1)
    for j=1:1:3
        for k=1:1:4
            z(:,:,:)=NL_segmented(i,k,:,:,:,j);
            tic
[f, coocMat] = cooc3d (z, 'distance', 1,'direction', [0 1 0;1 1 0; 0 1 -1], 'numGrey', 256);
toc
count=count+1
features(i,(j-1)*144+(k-1)*36+1:(j-1)*144+k*36)= f;
        end
    end
end
toc
tic
for i=1:1:size(LTLE,1)
    for j=1:1:3
        for k=1:1:4
            z(:,:,:)=LTLE_segmented(i,k,:,:,:,j);
[f, coocMat] = cooc3d (z, 'distance', 1,'direction', [0 1 0;1 1 0; 0 1 -1], 'numGrey', 256);
count=count+1;
features(i+7,(j-1)*144+(k-1)*36+1:(j-1)*144+k*36)=f;
        end
    end
end
toc
tic
for i=1:1:size(RTLE,1)
    for j=1:1:3
        for k=1:1:4
            z(:,:,:)=RTLE_segmented(i,k,:,:,:,j);
[f, coocMat] = cooc3d (z, 'distance', 1,'direction', [0 1 0;1 1 0; 0 1 -1], 'numGrey', 256);
count=count+1
    features(i+12,(j-1)*144+(k-1)*36+1:(j-1)*144+k*36)=f;
        end
    end
end
toc
%
