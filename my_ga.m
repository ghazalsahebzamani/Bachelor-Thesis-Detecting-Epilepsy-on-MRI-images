% pop=zeros(size(f3,2),size(f3,2));
% scores=zeros(size(f3,2),1);
% f4=[];
% 
% for i=1:1:size(f3,2)
%     pop(i,i)=1;
% end
%  for i=1:1:size(f3,2)
%      f4_indx=(find(pop(i,:)==1));
%      f4=f3(:,f4_indx);
%      er= find_error(f4,l3);
%      scores(i,1)=my_fitness(er,size(f4,2));
%  end
%  
l = label;
feature=f3; % define constant values
FitnessFunction = @(x) my_fitness(x,f3,label);
%GenomeLength=480;
init_pop=myfun(size(f3,2));
%numberOfVariables = size(f5,2);
numberOfVariables = 16;
tic

options = optimoptions(@ga,'InitialPopulationMatrix',init_pop, 'PopulationSize', size(f3,2), 'PopulationType',...
    'bitstring', 'MaxGenerations', 50,'EliteCount',2,'CrossoverFcn',{'crossoverarithmetic'},'SelectionFcn',{'selectiontournament'},...
    'CrossoverFraction',0.8, 'MutationFcn', {'mutationuniform'}, 'UseVectorized', true);
[xx,fval] = ga(FitnessFunction,480,options);
toc
     
     