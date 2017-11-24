%This function runs in two parts:
%First uncomment the for loop that iterates to get values of characteristic
%path length and comment other code. For this, please change the matrix in dijkstras.m to
%'adjws.txt' first. This will save verage path length in 'L1.txt'. Save
%just one case of probability p=0, to 'l0.txt'. For this please make
%changes in characteristicpathlength.m.
%
%Secondly, uncomment the rest of the code, comment the for loop. Thsi will
%generate the graph of L(p)/L(0)

function plotL
p=[0.0001,0.00011,0.00012,0.00015,0.00016,0.00019,0.0002,0.00025,0.00027,0.0003,0.00031,0.00035,0.00037,0.00039,0.0004,0.00041,0.00043,0.00045,0.00047,0.00049,0.0005,0.00052,0.00053,0.00055,0.00057,0.00059,0.0006,0.00062,0.00063,0.00067,0.00069,0.0007,0.00072,0.00075,0.00079,0.0008,0.00082,0.00084,0.00086,0.00088,0.0009,0.00092,0.00094,0.00096,0.00098,0.001,0.0014,0.0018,0.002,0.0024,0.0028,0.003,0.0034,0.0038,0.004,0.0042,0.0047,0.005,0.0053,0.0058,0.006,0.0063,0.0068,0.007,0.0073,0.0078,0.008,0.0082,0.0087,0.009,0.0093,0.0097,0.01,0.015,0.02,0.025,0.03,0.035,0.04,0.045,0.05,0.055,0.06,0.065,0.07,0.075,0.08,0.085,0.09,0.095,0.1,0.2,0.3,0.4,0.5,0.6,0.7,0.8,0.9,1];

r=size(p);
r=r(2);
% for i=1:r
%     wattsstrogatz(100,10,p(i));
%     Mat=dlmread('adjws.txt');
%     characteristicpathlength;
% end
L1=dlmread('L1.txt');
L0=dlmread('L0.txt');

X=zeros(0,1);
Y=zeros(0,1);
for i=1:r
    x=L1(i)/L0;
    X=[X;x];
end
disp(X);
figure(1);
plot(X);
end
