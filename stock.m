function [f, A, b] = stock(d,c,h,M)
  
  % vector d expresses the demand for the product in each period  
  % vector c expresses the production costs for the product in each period  
  % vector h expresses the storing costs for the product in each period  
  % M is the available space for storing the product in each period
  
  N=length(d);
%------table of constraints A----------------------
  A1=-eye(N);
  A2=eye(N)+[zeros(1,N);[-eye(N-1),zeros(N-1,1)]];
  A3=zeros(N);
  A4=eye(N);
  A=[A1, A2, A3; A3, A4, A4];
%------vector of the objective function-------  
  f=[-c,-h,zeros(1,N)];
%------vector for the constraints------------
  b=[-d,M*ones(1,N)];
end