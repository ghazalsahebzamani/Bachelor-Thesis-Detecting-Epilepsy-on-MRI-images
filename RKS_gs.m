%%%%%new feature selection algorithm
 [ranks_gs,weights_gs] = relieff(f3_gs,label,10);
 r_features_gs=ranks_gs(1:60);
 log_important_features_gs=ranks_gs(1:60);
 log_important_features_gs=log_important_features_gs';
 r_features_gs=f3_gs(:,r_features_gs);
 %label2=label()
 r_features_gs=r_features_gs';
f4_gs=f3_gs';
rng('default');  % For reproducibility
%eva = evalclusters(r_features,'kmeans','CalinskiHarabasz','KList',[1:211]);
% kk=zeros(1,211);
 for k=1:1:53
    k
    clust(:,k) = kmeans(r_features_gs,k,'Distance','correlation','emptyaction','error');
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
 eva = evalclusters(r_features_gs,clust,'CalinskiHarabasz');
 %%% num of clusters: 53
 [idx,C,sumd,d]=kmeans(r_features_gs,53,'Distance','correlation','emptyaction','error');
 f5_gs=zeros(17,53);
 log2_gs=zeros(1,53);
for i=1:1:53
    tmp=log_important_features_gs(idx==i);
    k=r_features_gs(idx==i,:);
    k2=k';
    [ranks2,weights2] = relieff(k2,label,10);
    f5_gs(:,i)=k2(:,ranks2(1));
    log2_gs(1,i)=tmp(ranks2(1),1);
end
% new_x=zeros(1,480);
% for i=1:1:210
%     new_x(1,log2(1,i))=1;
% end;
%%%%%%%%%%%%

