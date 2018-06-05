function [ xk ] = my_sffs( x,f,l,num )
    xk=zeros(1,size(x,2));
    x_remain=x;
    n=size(find(xk==1),2);
    old_m=1000;
    while(n<num)
        nn=size(find(x_remain==1),2);
        temp=find(x_remain==1);
        er1=zeros(1,nn);
        for i=1:1:nn
            xk(1,temp(1,i))=1;
            er1(1,i)=evaluate_xx(xk,f,l);
            xk(1,temp(1,i))=0;
        end
        [m, id]=min(er1);
        if(old_m<m || old_m==m)
            break
        end
        old_m=m;
        idx=find(er1==min(er1));
        xk(1,temp(1,idx))=1;
        x_remain(1,temp(1,idx))=0;
        %if(size(find(xk==1),2)>1)
        while(size(find(xk==1),2)>1)
            temp2=find(xk==1);
            nn2=size(temp2,2);
            er2=zeros(1,nn2);
           for j=1:1:nn2
               xk(1,temp2(1,j))=0;
               er2(1,j)=evaluate_xx(xk,f,l);
              xk(1,temp2(1,j))=1;
           end
           [m2, id2]=min(er2);
%            xk(1,temp2(1,idx2))=0;
            idx2=find(er2==m2);
           if(m2<m)
               xk(1,temp2(1,idx2))=0;
           else
               break;
            end
        end
    n=size(find(xk==1),2);

    if(size(find(x_remain==1),2)==0)
        break
    end
    end
end


