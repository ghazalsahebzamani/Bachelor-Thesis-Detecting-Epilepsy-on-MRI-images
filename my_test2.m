RTLE_gssegmented=zeros(5,218,182,146,3);
LTLE_gssegmented=zeros(5,218,182,146,3);
NL_gssegmented=zeros(7,218,182,146,3);

for i=1:1:7
    for k=1:1:4
        for j=1:1:146
     x1(i,k,1,j)=d_gm_NL2(i,k,j);
     x1(i,k,2,j)=d_wm_NL2(i,k,j);
     x1(i,k,3,j)=d_csf_NL2(i,k,j);
        end
    end
end


for i=1:1:5
    for k=1:1:4
        for j=1:1:146
     x2(i,k,1,j)=d_gm_RTLE2(i,k,j);
     x2(i,k,2,j)=d_wm_RTLE2(i,k,j);
     x2(i,k,3,j)=d_csf_RTLE2(i,k,j);
     
     x3(i,k,1,j)=d_gm_LTLE2(i,k,j);
     x3(i,k,2,j)=d_wm_LTLE2(i,k,j);
     x3(i,k,3,j)=d_csf_LTLE2(i,k,j);
        end
    end
end


Mult_NL=zeros(7,4,218,182,146);
Mult_RTLE=zeros(5,4,218,182,146);
Mult_LTLE=zeros(5,4,218,182,146);
for i=1:1:7
    for j=1:1:146
        for k=1:1:4
        Mult_NL(i,k,:,:,j)=NLT(i,k,:,:,j);
        end
    end
end
for i=1:1:5
    for j=1:1:146
        for k=1:1:4
        Mult_RTLE(i,k,:,:,j)=RTLET(i,k,:,:,j);
        Mult_LTLE(i,k,:,:,j)=LTLET(i,k,:,:,j);
        end
    end
end

Z1=zeros(7,218,182,146,4);
Z2=zeros(5,218,182,146,4);
Z3=zeros(5,218,182,146,4);
for i=1:1:7
    for j=1:1:146
        u=GE([x1(i,:,1,j)',x1(i,:,2,j)',x1(i,:,3,j)']);
        W1=u(:,3);
        W1=W1./(x1(i,:,3,j)*W1);
        W1_NL(i,j,:)=W1;
        u=GE([x1(i,:,3,j)',x1(i,:,1,j)',x1(i,:,2,j)']);
        W2=u(:,3);
        W2=W2./(x1(i,:,2,j)*W2);
        W2_NL(i,j,:)=W2;
        u=GE([x1(i,:,2,j)',x1(i,:,3,j)',x1(i,:,1,j)']);
        W3=u(:,3);
        W3=W3./(x1(i,:,1,j)*W3);
        W3_NL(i,j,:)=W3;
    end
end
for i=1:1:5
    for j=1:1:146  
        u=GE([x2(i,:,1,j)',x2(i,:,2,j)',x2(i,:,3,j)']);
        W1=u(:,3);
        W1=W1./(x2(i,:,3,j)*W1);
        W1_RTLE(i,j,:)=W1;
        u=GE([x2(i,:,3,j)',x2(i,:,1,j)',x2(i,:,2,j)']);
        W2=u(:,3);
        W2=W2./(x2(i,:,2,j)*W2);
        W2_RTLE(i,j,:)=W2;
        u=GE([x2(i,:,2,j)',x2(i,:,3,j)',x2(i,:,1,j)']);
        W3=u(:,3);
        W3=W3./(x2(i,:,1,j)*W3);
        W3_RTLE(i,j,:)=W3;
    end
end
for i=1:1:5
    for j=1:1:146
        u=GE([x3(i,:,1,j)',x3(i,:,2,j)',x3(i,:,3,j)']);
        W1=u(:,3);
        W1=W1./(x3(i,:,3,j)*W1);
        W1_LTLE(i,j,:)=W1;
        u=GE([x3(i,:,3,j)',x3(i,:,1,j)',x3(i,:,2,j)']);
        W2=u(:,3);
        W2=W2./(x3(i,:,2,j)*W2);
        W2_LTLE(i,j,:)=W2;
        u=GE([x3(i,:,2,j)',x3(i,:,3,j)',x3(i,:,1,j)']);
        W3=u(:,3);
        W3=W3./(x3(i,:,1,j)*W3);
        W3_LTLE(i,j,:)=W3;
    end
end



        

        %% Eigen Images %%   
for i=1:1:7
    for j=1:1:146
        for k=1:4
           Z1(i,:,:,j,k)=Mult_NL(i,k,:,:,j);
        end
    end
end
for i=1:1:5
    for j=1:1:146
        for k=1:4
           Z2(i,:,:,j,k)=Mult_RTLE(i,k,:,:,j);
           Z3(i,:,:,j,k)=Mult_LTLE(i,k,:,:,j);
        end
    end
end
for m=1:1:7
    for n=1:1:146
            for i=1:218
                for j=1:182
                    tmp=zeros(1,4);
                    tmp(:,:)=Z1(m,i,j,n,:);
                    t2=zeros(4,1);
                    t2(:,:)=W3_NL(m,n,:);
                     NL_gssegmented(m,i,j,n,2)=tmp*t2;
                     t2(:,:)=W2_NL(m,n,:);
                     NL_gssegmented(m,i,j,n,3)=tmp*t2;
                     t2(:,:)=W1_NL(m,n,:);
                     NL_gssegmented(m,i,j,n,1)=tmp*t2;

            %          for k=1:4
            %          R(i,j,k)=Mult(i,j,k)-(GM(i,j).*W3(k))-(WM(i,j).*W2(k))-(CSF(i,j).*W1(k));
            %          end
            %       Remainder(i,j)=sqrt((R(i,j,1).^2)+(R(i,j,2).^2)+(R(i,j,3).^2)+(R(i,j,4).^2));
            %     
                end
            end
    end
end

for m=1:1:5
    for n=1:1:146
            for i=1:218
                for j=1:182
                    tmp=zeros(1,4);
                    tmp(:,:)=Z2(m,i,j,n,:);
                    t2=zeros(4,1);
                    t2(:,:)=W3_RTLE(m,n,:);
                     RTLE_gssegmented(m,i,j,n,2)=tmp*t2;
                     t2(:,:)=W2_RTLE(m,n,:);
                     RTLE_gssegmented(m,i,j,n,3)=tmp*t2;
                     t2(:,:)=W1_RTLE(m,n,:);
                     RTLE_gssegmented(m,i,j,n,1)=tmp*t2;

            %          for k=1:4
            %          R(i,j,k)=Mult(i,j,k)-(GM(i,j).*W3(k))-(WM(i,j).*W2(k))-(CSF(i,j).*W1(k));
            %          end
            %       Remainder(i,j)=sqrt((R(i,j,1).^2)+(R(i,j,2).^2)+(R(i,j,3).^2)+(R(i,j,4).^2));
            %     
                end
            end
    end
end

for m=1:1:5
    for n=1:1:146
            for i=1:218
                for j=1:182
                    tmp=zeros(1,4);
                    tmp(:,:)=Z3(m,i,j,n,:);
                    t2=zeros(4,1);
                    t2(:,:)=W3_LTLE(m,n,:);
                     LTLE_gssegmented(m,i,j,n,2)=tmp*t2;
                     t2(:,:)=W2_LTLE(m,n,:);
                     LTLE_gssegmented(m,i,j,n,3)=tmp*t2;
                     t2(:,:)=W1_LTLE(m,n,:);
                     LTLE_gssegmented(m,i,j,n,1)=tmp*t2;

            %          for k=1:4
            %          R(i,j,k)=Mult(i,j,k)-(GM(i,j).*W3(k))-(WM(i,j).*W2(k))-(CSF(i,j).*W1(k));
            %          end
            %       Remainder(i,j)=sqrt((R(i,j,1).^2)+(R(i,j,2).^2)+(R(i,j,3).^2)+(R(i,j,4).^2));
            %     
                end
            end
    end
end


close all
zzz=zeros(218,182);
zzz(:,:)=NL_gssegmented(1,:,:,100,2);

imshow(zzz,[0 max(max(zzz))]);
title('GrayMatter Eigen Image')
figure,
zzz(:,:)=NL_gssegmented(1,:,:,100,3);
imshow(zzz,[0 max(max(zzz))]);
title('WhiteMatter Eigen Image')
figure,
zzz(:,:)=NL_gssegmented(1,:,:,100,1);
imshow(zzz,[0 max(max(zzz))]);
title('CSF Eigen Image');
% figure,
% imshow(Remainder,[]);
% title('Remainder Image');
%      GM(:,:)=Z(:,:)*(W3);
%      WM(:,:)=Z(:,:)*(W2);
%      CSF(:,:)=Z(:,:)*(W1);
%  for k=1:4
%      R(:,:,k)=Mult(:,:,k)-(GM.*W3(k))-(WM.*W2(k))-(CSF.*W1(k));
%  end
%       Remainder(:,:)=sqrt((R(:,:,1).^2)+(R(:,:,2).^2)+(R(:,:,3).^2)+(R(:,:,4).^2));
% 
% 
% 
% figure,
% imshow(GM,[]);
% title('GrayMatter Eigen Image')
% figure,
% imshow(WM,[]);
% title('WhiteMatter Eigen Image')
% figure,
% imshow(CSF,[]);
% title('CSF Eigen Image');
% figure,
% imshow(Remainder,[]);
% title('Remainder Image');
