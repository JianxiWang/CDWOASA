
clear all;
clc;

parfor exp_count = 1:10 
    for feature_number=5:5:25
        Woasa(exp_count,feature_number);
    end
end

% exp_count: the number of experiments