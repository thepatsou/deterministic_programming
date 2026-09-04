function [c,A,b] = light(P,k)
  % table P expresses the light parameters
  % vector k expresses the optimal light
  [n,m]=size(P);
%------table of constraints A---------------
  A=[P, -eye(n), eye(n)];
%------vector of the objective function------
  c=[zeros(1,m),-ones(1,n), -ones(1,n)];
%------vector for the constraints------------
  b=k;
end
  