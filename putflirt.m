function X=putflirt
X=zeros(4,182,218,182);
%%%kolan bayad load_nii konam ke narine + imshow(a, [0 max(max(a))])
out = load_nii('PD_flirt.nii.gz');
out = out.img;
X(1,:,:,:)=(out);
out = load_nii('FLAIR_flirt.nii.gz');
out = out.img;
  X(2,:,:,:)=out;
out = load_nii('T1_flirt.nii.gz');
out = out.img;
X(3,:,:,:)=out;
out = load_nii('T2_flirt.nii.gz');
out = out.img;
X(4,:,:,:)=out;
end
