function [ er ] = evaluate_xx( xx,feature,label )
%UNTITLED4 Summary of this function goes here
%   Detailed explanation goes here

%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here




     f4_indx=(find(xx(1,:)==1));
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
                        er=er+1
                    end
                end
                er=er/n;
     %scores(i,1)=my_fitness(er,size(f4,2));
 end




