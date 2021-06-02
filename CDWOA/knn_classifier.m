function [predlabel,oa]=knn_classifier(k,trainData,trainLabel,testData,testLabel)


classes=unique(trainLabel);
trainLabel=trainLabel';

D = distance(trainData,testData);
[~,idx]=sort(D,1);
idx=idx(1:k,:);
nn_label=trainLabel(idx);
count=bsxfun(@eq,nn_label,reshape(classes,1,1,length(classes)));
count=sum(count,1);
count=permute(count,[3,2,1]);
[~,idx]=max(count,[],1);
predlabel=classes(idx);
oa=mean(testLabel==predlabel);


function d = distance(a,b)

if (nargin ~= 2)
   error('Not enough input arguments');
end
if (size(a,2) ~= size(b,2))
   error('A and B should be of same dimensionality');
end
aa=sum(a.*a,2); bb=sum(b.*b,2); ab=a*b'; 
d = sqrt(abs(repmat(aa,[1 size(bb,2)]) + repmat(bb',[size(aa,2) 1]) - 2*ab));
