% Copyright by Ye Zhu, Deakin University, 28 March 2018, version 1.0 (ye.zhu@ieee.org).
 
clear

%% Loading and normalising data

load('2T.mat') 

data=normalize(data); % min-max normalization

%% Scoring subspaces for each instances (either use DenScore or IsoScore)

  [ z,c ] = DenScore( data );  % Use this for CSSub
%  [ z,c ] = IsoScore( data ); % Use this for CSSub_I

%% Clustering by shared subspaces

inData=z-z;
for i=1:size(z,2)
    inData(z(:,i)>(mean(z(:,i))),i)=1;
end
inData(isnan(inData))=0;

% Identifying noise
N=find(sum(inData')==0); % find noise
I=find(sum(inData')>0); % find normal instances

NinData=inData;
inData(N,:)=[];

% Clustering non-noise instances
Tclass=class-class-1;
[TTclass,C] = kmedoids(inData,max(class),'Distance','jaccard');

% assgining labels to all instances
Tclass(I)=TTclass;

% identify the subspace for each cluster
 [ Tsubspace ] = RankingSub( c,C,NinData,Tclass );
 

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% The final outputs are Tclass and Tsubspace
% Tclass are cluster labels for all instances and Tsubspace are the subspaces  
% assigned to different clusters
 

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Followinig is the evaluation of the clustering result
 
%% Evaluation the clustering result  
% the result may be different in different run duo to the randomness of kmedoids

[ ~,~,~,~,~,~,~,~,Fmeasure,~] = evaluate(class,Tclass)


%% Get the highest F-measure of running kmedoids 10 times

[ Max_Fmeasure ] = clusub( z,class)


