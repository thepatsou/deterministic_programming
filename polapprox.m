function [c,A,b]= polapprox(x,y,k)
  n=length(x);
  A1=eye(n);
  A2=x;
  for i=2:k 
    A2=[A2, x.^i];
  end
  A3=-A2;
  A4=-eye(n);
  A5=zeros(n);
  A=[A1, A2, A3, A4, A5; -A1, A2, A3, A5, A4];
  
  c=[ones(n),zeros(1,2*k+2*n)];
  
  b=[y,y];
end