function edgelist
BAmat=dlmread('bamodel.txt');
edgelist=zeros(0,2);
s=size(BAmat);
s=s(1);
for i=1:s
    for j=i:s
        if BAmat(i,j)==1
            edgelist=[edgelist; i,j];
        end
    end
end
dlmwrite('edgeBAmodel.txt',edgelist,'delimiter','\t', 'newline', 'pc');
end