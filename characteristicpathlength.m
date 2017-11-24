%This function generates the average path length of the adjacancy matrix,
%that is input to dijkstras.m

function [c]=characteristicpathlength
n1=size(dijkstras(1));
n=n1(2);
X=zeros(0,n);
for i=1:n
    X=[X; dijkstras(i)];
end
% disp(X);
sumd=0;
for i=1:n
    for j=i:n
       sumd=sumd+X(i,j);
    end
end
avg=(2*sumd)/(n*(n-1));
disp('characteristic path length');
disp(avg);
dlmwrite('L0.txt', avg ,'-append', 'newline', 'pc');
end