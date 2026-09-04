function [b,A,c] = transfer(av,de,V,C) 
  % vector av expresses the amount available in a station
  % vector de expresses the demand in a station
  % table V expresses the capacity of each path (=0 when there is no path)
  % table C expresses the cost of each path (=0 when there is no path)
 
  ab=de-av;
  n=length(de);
  c1=zeros(1,n*n);
  b1=zeros(1,n*n);
  for j=1:n
    for i=1:n
      c1((j-1)*n+i)=C(i,j);
      b1((j-1)*n+i)=V(i,j);
    end
  end
  %------vector for the constraints------------
   b=[ab,b1];
   
  %------vector of the objective function------ 
  c=[c1,zeros(1,n+n*n);
  
  %------table of constraints A----------
  A1=zeros(n,n*n);
  
  for i=1:n
    for j= ((i-1)*n+1):((i-1)*n+n)
      A1(i,j)=1;
    end
  end
  
  B=eye(n);
  for i=1:n-1
    B=[B,eye(n)];
  end
  A1=A1-B;
  A2=-eye(n);  
  A3=zeros(n,n*n);
  A4=eye(n*n);
  A5=zeros(n*n,n);
  A6=eye(n*n);
  A=[A1 A2 A3 ; A4 A5 A6];
  
end
    