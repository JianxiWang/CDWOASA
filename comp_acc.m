clc
clear
exp_acc=zeros(10,3);
acc1=zeros(5,3);k=1;Max_iteration=100;u=8;
SearchAgents_no= 5;
for feature_number=5:5:25
    for exp_count = 1:10  %进行10次实
        load(fullfile('data2',sprintf('result-exp%d-feature_number=%d.mat',exp_count,feature_number)),  'oa','solution','predlabel','aa','kappa');
        exp_acc(exp_count,1) =oa;
        exp_acc(exp_count,2) =aa;
        exp_acc(exp_count,3) =kappa;
    end
    acc(feature_number/5,:)=mean(exp_acc);
end
acc1=mean(acc)
save(fullfile('acc',sprintf('acc.mat')),  'acc1');




