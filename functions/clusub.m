function [ FT ] = clusub( z,class )
%CLUSUB Summary of this function goes here
%   Detailed explanation goes here

inData=z-z;
for i=1:size(z,2)
    inData(z(:,i)>(mean(z(:,i))),i)=1;
end
inData(isnan(inData))=0;

N=find(sum(inData')==0); % noise
I=find(sum(inData')>0); % normal

NinData=inData;
inData(N,:)=[];

TT=[];
for j=1:10
    Tclass=class-class-1;
    [TTclass,C] = kmedoids(inData,max(class),'Distance','jaccard');
    Tclass(I)=TTclass;
    [ ~,~,~,~,~,~,~,~,T,~] = evaluate(class,Tclass);
    TT(j)=T; 
end
FT=max(TT);


end

