%%%gs feature extraction
%feature extraction%  %2nd order

% RTLE_gssegmented=zeros(5,218,182,146,3);
% LTLE_gssegmented=zeros(5,218,182,146,3);
% NL_gssegmented=zeros(7,218,182,146,3);
gs_features=zeros(17,36*3);
count=0;
z=zeros(218,182,146);
tic
for i=1:1:size(NL,1)
    for j=1:1:3
            z(:,:,:)=NL_gssegmented(i,:,:,:,j);
            tic
[f, coocMat] = cooc3d (z, 'distance', 1,'direction', [0 1 0;1 1 0; 0 1 -1], 'numGrey', 256);
toc
count=count+1
gs_features(i,(j-1)*36+1:j*36)= f;
    end
end
toc
tic
for i=1:1:size(LTLE,1)
    for j=1:1:3
            z(:,:,:)=LTLE_gssegmented(i,:,:,:,j);
[f, coocMat] = cooc3d (z, 'distance', 1,'direction', [0 1 0;1 1 0; 0 1 -1], 'numGrey', 256);
count=count+1;
gs_features(i+7,(j-1)*36+1:j*36)=f;
    end
end
toc
tic
for i=1:1:size(RTLE,1)
    for j=1:1:3
            z(:,:,:)=RTLE_gssegmented(i,:,:,:,j);
[f, coocMat] = cooc3d (z, 'distance', 1,'direction', [0 1 0;1 1 0; 0 1 -1], 'numGrey', 256);
count=count+1
    gs_features(i+12,(j-1)*36+1:j*36)=f;
    end
end
toc
%
