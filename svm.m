trainset=xlsread('traindata_35.xlsx');
testset=xlsread('final_data_35.xlsx');
trainset=trainset(:,1:35);
testset=testset(:,1:35);
numOfClass=16;
groups=[];
result=zeros(327,1);
train=zeros(208,1);
train(1:13,1)=1;
train(14:208,1)=-1;
models(1) = svmtrain(trainset,train);
%Group = svmclassify(model(1),testset);
for i=1:numOfClass-1
    train(1:13*i,1)=-1;
    train(13*i+1:13*i+13,1)=i+1;
    train(13*i+14:208,1)=-1;
    models(i+1)=svmtrain(trainset,train);
    %group=svmclassify(model(i+1),testset);
    %groups=vertcat(groups,group);
   
end
for i=1:16
    
group=svmclassify(models(i),testset);
groups=[groups group];
end
for i=1:327
    for k=1:16
        if(groups(i,k)==k)
            break;
        end
    end
    result(i,1)=k;
 end