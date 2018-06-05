function [ score ] = my_fitness(x,feature,label)
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here

score=zeros(size(x,1),1);

if (size(x,2)==0)
    score=1000*ones(size(x,1),1);

else
%GenomeLength=size(x,2);
 for j=1:1:size(x,1)
     
%      size(find(x(j,:)==1))
%       while (size((find(x(j,:)==1)),2)==0)
%           kooft=de2bi(ceil(rand(1,1).*(2^GenomeLength-1)));
%            x(j)=kooft;
%       end
if(size((find(x(j,:)==1)),2)~=0 && (find(x(j,:)==1)),2)~=0)
     f4_indx=(find(x(j,:)==1));
     f4=feature(:,f4_indx);
                n=17;
                c=cvpartition(n,'LeaveOut');
                er=0;
                %er=zeros(n,1);
                for i=1:1:n
                    test_data=f4(c.test(i));
                    test_label=label(c.test(i));
                    train_data=f4(~(c.test(i)));
                    train_label=label(~(c.test(i)));
                    model = svmtrain(train_label,train_data);
                    [predicted_label] = svmpredict(test_label, test_data, model);
                    %er(i,1)=1-size(find(predicted_label==test_label),1)/size(test_label,1);
                    if(predicted_label~=test_label)
                        er=er+1;
                    end
                end
                er=er/n;
                e=exp(1);
                N=size(f4,2);
                %score(j,1)=er/N + e.^(-1/N);
                score(j,1)=er;
                %score(j,1)=er + e.^(-1/N);
else
    score(j,1)=1000;
end
     %scores(i,1)=my_fitness(er,size(f4,2));
 end
end
 %j



end



