function fitness = AccSz(x,feature_number)
%we used this function to calculate the fitness value as in the paper
global traindata trainlabel trn ;
k=1; 
x1=sort(x,'descend');
x=x>x1(feature_number+1);
x=logical(x);

if sum(x)==0
    fitness=inf;
    return;
end
trainData = traindata(1:trn,x);testData = traindata(trn+1:end,x);
trainLabel=trainlabel(1:trn);
testLabel=trainlabel(trn+1:end);
[predlabel,oa1]=knn_classifier(k,trainData,trainLabel,testData,testLabel);
num=1:length(testLabel);
a=logical(rem(num,2));
b=logical(rem(num+1,2));
% a: random training samples index of target training samples
% b: random test samples index of target training samples
[predlabel1,oa2]=knn_classifier(k,testData(a,:),testLabel(a),testData(b,:),testLabel(b));
fitness =8*oa2 + oa1;
end




