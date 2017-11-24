%This function read the adjacancy matrix from file and displays the degree
%of each node and plots the degree distribution of the network

function degree

Mat=dlmread('adjmatrix.txt');
%disp(Mat);
n=size(Mat(1,:))
k=n(2);
C=zeros(0,1);
i=1;
while i<=k
    count=0;
    for j=1:k
        if Mat(i,j)==1
            count=count+1;
        end
    end
    %disp(count);
    C=[C;count];
    i=i+1;
end
disp(C);
%dlmwrite('degree.txt',C,'newline', 'pc');

%degree distribution
M=zeros(0,1);
j=0;
while j<k
    count1=0;
    for i=1:k
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
Y=0:k-1;
disp('degree')
disp(Y);

frac=M/k;
disp('nodes with above degree');
disp(M);
disp('fraction of nodes with above degrees');
disp(frac);
figure;
plot(Y,frac,'-');
xlabel('degree');
ylabel('fraction of nodes');
end
