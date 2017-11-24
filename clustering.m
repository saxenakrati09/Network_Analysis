%This function calculates the clustering coefficient, its distribution and
%displays a plot between clustering coeff and degree
%Uncomment the code in the later part if you want to visualize
%relationships between clustering coeff and degree and the clustering coeff
%distribution.

function coeff = clustering(A)
n = size(A,1);

if (nargin>1)
    if strcmp(type,'directed')
        digraph = true;
    elseif strcmp(type,'undirected')
        digraph = false;
    else
        error('Type must be either "directed" or "undirected"')
    end
else
    if all(all(A == A'))
        digraph = false;
    else
        digraph = true;
    end
end

if digraph
    c = sum((A^2) .* A, 2);
else
    c = sum((A^3) .* eye(n), 2);
end

% Calculate the out degree of the nodes
out = sum(A,2);

% Calculate the clustering coefficient
s = warning('off','MATLAB:divideByZero');
coeff = c ./ (out .* (out - 1));
warning(s);

% Remove the Inf's from the possible divide by 0
coeff(out == 0) = 0;
coeff(out == 1) = 0;

%clustering coeff distribution
M=zeros(0,1);
j=0;
while j<=1
    count1=0;
    for i=1:n
        if coeff(i)<=j
            count1=count1+1;
            %disp(count1);
            %M=[M;count1];
        end
        %disp(count1);
        %M=[M;count1];
    end
    M=[M, count1];
    
    j=j+0.1;
end
disp('M');
disp(M);
frac=M/n;
disp('frac');
disp(frac);
X=0:0.1:1;
% figure;
% plot(X,frac,'-');
% xlabel('clustering coefficient');
% ylabel('prob(nodes having clustering coeff less than c)');
%plot clustering coeff vs degree plot
Y=0:n-1;
% figure;
% plot(Y, coeff);
% xlabel('degree');
% ylabel('clustering coeff');
q=size(coeff);
w=q(1);
ccsum=0;
for i=1:w
    ccsum=ccsum+coeff(i);
end
avg=ccsum/w;
disp('avg');
disp(avg);
dlmwrite('clusteringcoeffavg0.txt', avg,'-append', 'newline', 'pc');
end