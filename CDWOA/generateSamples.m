clc;
clear;

trainNumInClass1=200;
trainNumInClass2=5;

load('DataCube.mat');
DataCube1=double(DataCube1);
DataCube2=double(DataCube2);

for exp_count=1:10
    

    label1=gt1;
    [m,n]=size(label1);
    [posCol1,posRow1]=meshgrid(1:n,1:m);
    posCol1=posCol1(:);                         
    posRow1=posRow1(:);                           
    
    label1=label1(:);
    idx1=find(label1>0);                       
    label1=label1(idx1);                         
    label1_domain=ones(size(label1));            
    data1=reshape(DataCube1,size(DataCube1,1)*size(DataCube1,2),size(DataCube1,3));
    data1=data1(idx1,:);                        

    posCol1=posCol1(idx1);
    posRow1=posRow1(idx1);
    

    classes=unique(label1);
    classNum=length(classes);
    
    trainIdx1=[];
    testIdx1=[];
    for i=1:1:classNum
        index1=find(label1==classes(i));
        t=randsample(index1,trainNumInClass1);   
        trainIdx1=[trainIdx1;t];
        tt=setdiff(index1,t);    
        testIdx1=[testIdx1;tt];
    end
    
    trainData1=data1(trainIdx1,:);
    testData1=data1(testIdx1,:);
    trainLabel1=label1(trainIdx1);
    testLabel1=label1(testIdx1);
    trainPosCol1=posCol1(trainIdx1);
    testPosCol1=posCol1(testIdx1);
    trainPosRow1=posRow1(trainIdx1);
    testPosRow1=posRow1(testIdx1);
    label1_domain=label1_domain(trainIdx1);
    
    
    label2=gt2;
    [m,n]=size(label2);
    [posCol2,posRow2]=meshgrid(1:n,1:m);
    posCol2=posCol2(:);
    posRow2=posRow2(:);
    

    label2=label2(:);
    idx2=find(label2>0);                                  
    label2=label2(idx2);                                   
    label2_domain=ones(size(label2))*2;                     
    data2=reshape(DataCube2,size(DataCube2,1)*size(DataCube2,2),size(DataCube2,3));
    data2=data2(idx2,:);
    posCol2=posCol2(idx2);
    posRow2=posRow2(idx2);
    

    classes2=unique(label2);
    classNum2=length(classes2);
    
    
    trainIdx2=[];
    testIdx2=[];
    for i=1:1:classNum2
        index2=find(label2==classes2(i));
        t2=randsample(index2,trainNumInClass2);
        trainIdx2=[trainIdx2;t2];
        tt2=setdiff(index2,t2);
        testIdx2=[testIdx2;tt2];
    end
    
    trainData2=data2(trainIdx2,:);
    testData2=data2(testIdx2,:);
    trainLabel2=label2(trainIdx2);
    testLabel2=label2(testIdx2);
    trainPosCol2=posCol2(trainIdx2);
    testPosCol2=posCol2(testIdx2);
    trainPosRow2=posRow2(trainIdx2);
    testPosRow2=posRow2(testIdx2);
    label2_domain=label2_domain(trainIdx2);
    
    save(fullfile('data',sprintf('exp%d-sample.mat',exp_count)),'trainData1','testData1','trainLabel1', ...
        'testLabel1','trainPosCol1','testPosCol1','testPosCol1','trainPosRow1','testPosRow1','label1_domain',...
        'trainData2','testData2','trainLabel2', ...
        'testLabel2','trainPosCol2','testPosCol2','testPosCol2','trainPosRow2','testPosRow2','label2_domain');
    
end