function [  z,c  ] = IsoScore( data )
%ISOSCORE Summary of this function goes here
%   Detailed explanation goes here%   data - input n*d matrix  
%   z - subspace scores for each instance
%   c - generated subspaces for scoring

[n,d]=size(data);

%% Identifying the maximal dimensionality 

dex=zeros(1,d);
l=0;
c=[];
for maxD=1:d
    cIndex=nchoosek(1:d,maxD);
    l=length(cIndex)+l;    
    if l>n && maxD>1
        maxD=maxD-1;
        break
    else
        for j=1:size(cIndex,1)            
            cdex=dex;
            cdex(cIndex(j,:))=1;
            c=[c cdex'];
            indi=cIndex(j,:);
        end
    end
end
maxD

%% scoring subspace for each instance
tic
[n,d]=size(data);

NumTree=100;
NumSub=256;

z=zeros(n,size(c,2));
parfor i=1:size(c,2)    
    cdata=data(:,c(:,i)==1);    
    Forest = IsolationForest(cdata, NumTree, NumSub,sum(100 * (clock+i)));
    [Mass, ~] = IsolationEstimation(cdata, Forest);
    z(:,i)= mean(Mass, 2);    
end
toc

end

