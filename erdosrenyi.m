%This function takes in value of n (number of nodes) and e (number of
%edges) and compute Erdos-Renyi graph with number of edges equal to
%e and number of nodes equal to n. It displays the edgelist, adjacancy 
%matrix and the network. It also save the edge list to text file that will
%be used in cytoscape to visualize the network. It saves adjacancy matrix
%to file that will be used in degree function.

function [b]=erdosrenyi(n,e)
adj=zeros(n,n);
edgelist=zeros(0,2);
count=0;
while count<e
A=randi([1,n],1);
B=randi([1,n],1);
        if A~=B && adj(A,B)==0
            adj(A,B)=1;
            adj(B,A)=1;
            count=count+1;
            edgelist=[edgelist; A B];
        end
end
coords = [cos(2*pi*(1:n)/n); sin(2*pi*(1:n)/n)]';
disp('edgelist');
disp(edgelist);
dlmwrite('edgelist.txt', edgelist,'delimiter','\t', 'newline', 'pc');
disp('adjacancy matrix');
disp(adj);
dlmwrite('adjmatrix.txt', adj,'delimiter','\t', 'newline', 'pc');
gplot(adj, coords, '-*');
end