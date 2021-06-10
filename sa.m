function BestSol = sa(sol,dim, Max_iter,feature_number)
%% Problem Definition
global A trn vald acc a;

%% SA Parameters

MaxIt=30;     % Maximum Number of Iterations

MaxSubIt=10;    % Maximum Number of Sub-iterations

T0=0.1;       % Initial Temp.

alpha=0.99;     % Temp. Reduction Rate
%% Initialization
fitness = feval('AccSz',sol,feature_number);
BestSol = sol;
BestCost = fitness;
currentSol = sol;
currentCost = fitness;

% Array to Hold Best Cost Values
BestCostMat=zeros(MaxIt,1);
% Intialize Temp.
T=T0;

%% SA Main Loop
    for it=1:MaxIt
    %     fprintf('%d ',it);
        for subit=1:MaxSubIt
            % Create and Evaluate New Solution
            newSol = MutationU(dim,Max_iter,currentSol,subit);
            % Evaluation
            newCost=feval('AccSz',newSol,feature_number);
            % replace the best and the current solution if the new solution is better 
            if newCost > currentCost %&& sum(newSol(:)) < sum(currentSol(:))
                currentSol=newSol;
                currentCost = newCost;
                BestSol=currentSol;
                BestCost = newCost;              
             else % Accepting a worst solution
                 DELTA=(newCost-currentCost)/currentCost;
                 P=exp(-DELTA/T);
                 if rand<=P
                     currentSol=newSol;

                 end
             end   

        end
        % Store Best Cost Ever Found
        BestCostMat(it)=BestCost;
        % Display Iteration Information
    %      disp(['Iteration ' num2str(it) ': Best Cost = ' num2str(BestCostMat(it))]);
        % Update Temp.
        T=alpha*T ;   
    end

%% Results

% figure;
% %plot(BestCost,'LineWidth',2);
% semilogy(BestCostMat,'LineWidth',2);
% xlabel('Iteration');
% ylabel('Best Cost');
% grid on;
end