function [predlabel oa aa kappa solution]=Acc(x,feature_number)
%we used this function to calculate the accuracy 
global traindata trainlabel testdata testlabel trn;
k=1;
x1=sort(x,'descend');
x=x>x1(feature_number+1);
x=logical(x);
if sum(x)==0
    y=inf;
    return;
end

trainData = traindata(trn+1:end,x);testData = testdata(:,x);
trainLabel=trainlabel(trn+1:end);
[predlabel,oa1]=knn_classifier(k,trainData,trainLabel,testData,testlabel);
oa = oa1;
aa = average_accuracy(testlabel,predlabel);
kappa=compute_kappa(testlabel,predlabel);
solution=x;