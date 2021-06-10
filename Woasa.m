function Woasa(exp_count,feature_number)
global traindata trainlabel testdata testlabel trn ;
% trn: the number of training samples in source scene

[traindata trainlabel testdata testlabel] = pretreat(exp_count);
traindata=double(traindata);
testdata=double(testdata);
sumScore = 0;
minScore = 1;
maxScore = 0;
trn = length(unique(trainlabel))*200;
Max_iteration=100 ;SearchAgents_no=5;

[Best_score,Best_pos,WOA_cg_curve,fName]=Woa(SearchAgents_no,(Max_iteration),0,1,size(testdata,2),'AccSz',feature_number);
[predlabel oa aa kappa solution] = Acc(Best_pos,feature_number);

save(fullfile('data2',sprintf('result-exp%d-feature_number=%d.mat',exp_count,feature_number)),  'oa','solution','predlabel','aa','kappa');


