function [traindata trainlabel testdata testlabel]=newpretreat(exp_count)
load(fullfile('data',sprintf('exp%d-sample.mat',exp_count)),'trainData1','trainLabel1', ...
        'testData2', 'testLabel2','trainData2','trainLabel2');
%源图像数据特征归一化处理
mu1=mean(trainData1,1);
sigma1=std(trainData1,0,1);
trainData1=bsxfun(@rdivide,bsxfun(@minus,trainData1,mu1),sigma1);


%目标图像数据特征归一化处理
mu2=mean(trainData2,1);
sigma2=std(trainData2,0,1);
trainData2=bsxfun(@rdivide,bsxfun(@minus,trainData2,mu2),sigma2);
testData2=bsxfun(@rdivide,bsxfun(@minus,testData2,mu2),sigma2);

% A = [trainData1,trainLabel1;trainData2,trainLabel2];
% B = [testData2,testLabel2];
traindata=[trainData1;trainData2];
trainlabel=[trainLabel1;trainLabel2];
testdata=testData2;
testlabel=testLabel2;



