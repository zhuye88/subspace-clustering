function [ Tsubspace ] = RankingSub( c,C,inData, Tclass )
%RANKINGSUB Summary of this function goes here
%   Detailed explanation goes here

FreC=[];
rankInfo={};
SubDim={};
for i=1:size(C,1)
    iC=C(i,:);
    FreC(i,:)=sum(inData(Tclass==i,:))./sum(Tclass==i);
    SubDim{i}=c(:,iC==1);
    rankInfo{i}=[FreC(i,iC==1)];
end

Tsubspace={};
for i=1:size(C,1)
    rank=rankInfo{i};
    [I,Y]=sort(rank(1,:),'descend');
    Isubspace=SubDim{i};
    r=rank(:,Y);
    
    s=Isubspace(:,Y);
    Tsubspace{i}=find(s(:,1)==1)';
end

end

