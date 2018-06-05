 addpath('/Users/dayancolorado/Downloads/toolbox_matlab_nifti');
addpath('/Users/dayancolorado/Downloads/NIFTI');
cd('/Users/dayancolorado/Desktop/mri4/LTLE/EP0062');
LTLE=zeros(5,4,182,218,182);
RTLE=zeros(5,4,182,218,182);
NL=zeros(7,4,182,218,182);
LTLE(1,:,:,:,:)=putflirt;
cd('/Users/dayancolorado/Desktop/mri4/LTLE/EP0080');
LTLE(2,:,:,:,:)=putflirt;
cd('/Users/dayancolorado/Desktop/mri4/LTLE/EP0182');
LTLE(3,:,:,:,:)=putflirt;
cd('/Users/dayancolorado/Desktop/mri4/LTLE/EP0248');
LTLE(4,:,:,:,:)=putflirt;
cd('/Users/dayancolorado/Desktop/mri4/LTLE/EP1011');
LTLE(5,:,:,:,:)=putflirt;
cd('/Users/dayancolorado/Desktop/mri4/RTLE/EP0046');
RTLE(1,:,:,:,:)=putflirt;
cd('/Users/dayancolorado/Desktop/mri4/RTLE/EP0051');
RTLE(2,:,:,:,:)=putflirt;
cd('/Users/dayancolorado/Desktop/mri4/RTLE/EP0076');
RTLE(3,:,:,:,:)=putflirt;
cd('/Users/dayancolorado/Desktop/mri4/RTLE/EP0079');
RTLE(4,:,:,:,:)=putflirt;
cd('/Users/dayancolorado/Desktop/mri4/RTLE/EP0095');
RTLE(5,:,:,:,:)=putflirt;
cd('/Users/dayancolorado/Desktop/mri4/NL/NL0103');
NL(1,:,:,:,:)=putflirt;
cd('/Users/dayancolorado/Desktop/mri4/NL/NL0107');
NL(2,:,:,:,:)=putflirt;
cd('/Users/dayancolorado/Desktop/mri4/NL/NL0110');
NL(3,:,:,:,:)=putflirt;
cd('/Users/dayancolorado/Desktop/mri4/NL/NL0111');
NL(4,:,:,:,:)=putflirt;
cd('/Users/dayancolorado/Desktop/mri4/NL/NL0113');
NL(5,:,:,:,:)=putflirt;
cd('/Users/dayancolorado/Desktop/mri4/NL/NL0118');
NL(6,:,:,:,:)=putflirt;
cd('/Users/dayancolorado/Desktop/mri4/NL/NL0122');
NL(7,:,:,:,:)=putflirt;
% X=zeros(4,109,91,91);
% out = MRIread('EPPD_flirt.nii.gz');
% outVolume = out.vol;
% X(1,:,:,:)=uint8(outVolume);
% out = MRIread('EPFLAIR_flirt.nii.gz');
% outVolume = out.vol;
% X(2,:,:,:)=uint8(outVolume);
% out = MRIread('EPT1_flirt.nii.gz');
% outVolume = out.vol;
% X(3,:,:,:)=uint8(outVolume);
% out = MRIread('EPT2_flirt.nii.gz');
% outVolume = out.vol;
% X(4,:,:,:)=uint8(outVolume);
% 
% %X2=imshow(X(:,:,10));



%%%%%%%%%%%%%%%%%%roi %%%%%%%%%%%%%
