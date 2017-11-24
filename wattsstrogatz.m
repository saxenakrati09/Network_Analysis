%This function creates a watts-strogatz graph. Input is:
%   n:number of nodes in the graph
%   k:number of nearest neighbours
%   p:probability of rewiring
%
%The function creates two networks, one is the regular network, with n
%nodes and k nearest neighbors, and saves its adjacancy matrix in
%'adjws0.txt'. Another network is the rewired network, saves its adjacancy
%matrix in 'adjws.txt'.
%These two files are used in functions plotl.m,plotws.m,etc

function wattsstrogatz(n,k,p)
adj=zeros(n,n);

if n<4
    disp('error, enter n>=4');
end
if k<2
    disp('error, enter k>=2');
end
if rem(k,2)~=0
    disp('Enter even k');
end

for i=1:n
    if n-i-k/2 >= 0
        for m=1:k/2
            adj(i,i+m)=1;
            adj(i+m,i)=1;
        end
    end
    if n-i-k/2<0
        for c=1:n-i
            adj(i,i+c)=1;
            adj(i+c,i)=1;
        end
        for c=1:k/2-(n-i)
            adj(i,c)=1;
            adj(c,i)=1;
        end
    end
end
disp(adj);
% figure(1);
% coords = [cos(2*pi*(1:n)/n); sin(2*pi*(1:n)/n)]';
% gplot(adj, coords, '-*');
Mat=adj;
dlmwrite('adjws0.txt',Mat,'delimiter','\t', 'newline', 'pc');
i=1;
while i<n
    for l=1:k/2
        x=rand(1);
        if x <= p
            neighbour = i+l;
            if neighbour > n
                neighbour = neighbour-n;
            end
            adj(i,neighbour)=0;
            adj(neighbour,i)=0;
            num=randi([1,n],1); 
            while adj(i,num)==1 || num == i
                num=randi([1,n],1); 
            end
            adj(num,i)=1;
            adj(i,num)=1;
            break;
        end
    end

    i=i+1;
end
    

% figure(2);
% coords = [cos(2*pi*(1:n)/n); sin(2*pi*(1:n)/n)]';
% gplot(adj, coords, '-*');
disp(adj);
dlmwrite('adjws.txt',adj,'delimiter','\t', 'newline', 'pc');

end

