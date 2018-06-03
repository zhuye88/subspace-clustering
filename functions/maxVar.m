function [oEps,SimMatrix,Y] = maxVar( data )
%MAXVAR Summary of this function goes here
%   Detailed explanation goes here


[n,d]=size(data);
SimMatrix=pdist2(data,data,'minkowski',2); % distance matrix
SimMatrix=SimMatrix./max(max(SimMatrix));
SimMatrix=roundn(SimMatrix,-3);


 range=unique(SimMatrix);
%range=0.01:0.01:0.2;
%c=[];
% for i=1:size(data,1)
%     a=SimMatrix(i,:);
%     b=sort(a);
%     c=[c b(ceil(0.5*size(data,1)))];
% end
% thre=min(c);

tr=sum(range<0.5);

div=[];
for i=1:tr
    eps=range(i);
    p=sum(SimMatrix<=eps)';
    p=p./sum(p);
    div(i)=std(p);
end

[Y,I]=max(div);
oEps=range(I);

end

