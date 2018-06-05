%%%%%new feature selection algorithm
 [ranks,weights] = relieff(f3,label,10);
 r_features=ranks(1:240);
 log_important_features=ranks(1:240);
 log_important_features=log_important_features';
 r_features=f3(:,r_features);
 %label2=label()
 r_features=r_features';
f4=f3';
rng('default');  % For reproducibility
%eva = evalclusters(r_features,'kmeans','CalinskiHarabasz','KList',[1:211]);
% kk=zeros(1,211);
 for k=1:1:211
    k
    clust(:,k) = kmeans(r_features,k,'Distance','correlation','emptyaction','singleton');
% %kk(1,k)=sum(sumd);
% % for i=1:1:size(sumd,1)
% %     kk(:,i)=sumd(i,1)*ones(size(D,1),1);
% % end
% % cor=D./kk;
% kk(1,k)=size(find(abs(D)>0.97),1);
% % if (size(find(abs(D)>0.97),1)==0)
% %     break
% % end
 end
 eva = evalclusters(r_features,clust,'CalinskiHarabasz');
 %%% num of clusters: 210
 [idx,C,sumd,d]=kmeans(r_features,210,'Distance','correlation','emptyaction','error');
 f5=zeros(17,210);
 log2=zeros(1,210);
for i=1:1:210
    tmp=log_important_features(idx==i);
    k=r_features(idx==i,:);
    k2=k';
    [ranks2,weights2] = relieff(k2,label,10);
    f5(:,i)=k2(:,ranks2(1));
    log2(1,i)=tmp(ranks2(1),1);
end
% new_x=zeros(1,480);
% for i=1:1:210
%     new_x(1,log2(1,i))=1;
% end;
%%%%%%%%%%%%

