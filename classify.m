%%%
f3_gs=[gs_features,f2_gs];

n=17;
c=cvpartition(n,'LeaveOut');
l1=1*ones(7,1);
l2=2*ones(5,1);
l3=2*ones(5,1);
label=[l1;l2;l3];
er=0;
%er=zeros(n,1);
for i=1:1:n
    test_data=f3_gs(c.test(i));
    test_label=label(c.test(i));
    train_data=f3_gs(~(c.test(i)));
    train_label=label(~(c.test(i)));
    model = svmtrain(train_label,train_data);
    [predicted_label] = svmpredict(test_label, test_data, model)
    %er(i,1)=1-size(find(predicted_label==test_label),1)/size(test_label,1);
    if(predicted_label~=test_label)
        er=er+1;
    end
end
er=er/n;
%model = svmtrain(label, f3, ,c);
