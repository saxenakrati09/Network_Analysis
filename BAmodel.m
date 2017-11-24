%This function generates Barabasi-Albert model.
%Inputs are: 
%   n:number of nodes that are going to enter in the network
%   m:Number of nodes in the initial network
%   e:number of edges in the initial nework
%
%This function also shows the degree, degree distribution and average clusering
%coefficients of the network nodes.

function BAmodel(n,m,e)
adj=zeros(m,m);
count=0;
while count<e
A=randi([1,m],1);
B=randi([1,m],1);
        if A~=B && adj(A,B)==0
            adj(A,B)=1;
            adj(B,A)=1;
            count=count+1;
        end
end
C=zeros(0,1);
figure(1);
coords = [cos(2*pi*(1:m)/m); sin(2*pi*(1:m)/m)]';
gplot(adj, coords, '-*');
for k=1:n 
    s0=size(adj);
m=s0(1);
i=1;
while i<=m
    count=0;
    for j=1:m
        if adj(i,j)==1
            count=count+1;
        end
    end
    %disp(count);
    C=[C;count];
    i=i+1;
end
% disp(C);
sumdegree=0;
for i=1:m
    sumdegree=sumdegree+C(i);
end
prob=zeros(0,1);
for i=1:m
    p=C(i)/sumdegree;
    prob=[prob; p];
end
disp('probability');
% disp(prob);

k=1;   
x=rand(1);
% disp(x);
y=x-prob(1);
if y<0
    disp('1');
end
for i=2:m
    y=y-prob(i);
    if y<0
        disp(i);
        break;
    end
end
z=i;    
    [row_size, col_size]=size(adj);
    zeros_row=zeros(1,col_size);
    zeros_col=zeros(row_size+1,1);
    adj=[adj; zeros_row];
    adj=[adj, zeros_col];
%     disp(adj);
    adj(m+k,z)=1;
    adj(z,m+k)=1;
%     disp(adj);
end
disp(adj);
s0=size(adj);
s=s0(1);
figure(2);
coords = [cos(2*pi*(1:s)/s); sin(2*pi*(1:s)/s)]';
gplot(adj, coords, '-*');
dlmwrite('bamodel.txt',adj,'delimiter','\t', 'newline', 'pc');
Cnew=zeros(0,1);
i=1;
while i<=s
    count=0;
    for j=1:s
        if adj(i,j)==1
            count=count+1;
        end
    end
    %disp(count);
    Cnew=[Cnew;count];
    i=i+1;
end
disp('degree');
disp(Cnew);
%degree distribution
M=zeros(0,1);
j=0;
while j<s
    count1=0;
    for i=1:s
        if C(i)==j
            count1=count1+1;
            %disp(count1);
            %M=[M;count1];
        end
        %disp(count1);
        %M=[M;count1];
    end
    M=[M, count1];
    
    j=j+1;
end
Y=0:1:s-1;
frac=M/k;
% disp('nodes with above degree');
% disp(M);
% disp('fraction of nodes with above degrees');
% disp(frac);
figure;
plot(Y,frac,'-');
xlabel('degree');
ylabel('fraction of nodes');
clustering(adj);
characteristicpathlength;
end