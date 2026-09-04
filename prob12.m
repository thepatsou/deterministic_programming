

c = [15,28,17,19,26,27,17,20,28,19];  %the production costs
d = [13,20,27,31,36,26,13,14,36,29];  %the demand
h = [0.3,0.2,0.1,0.15,0.3,0.5,0.8,0.3,0.5,0.4]; %the storing costs

D = sum(d);
M = zeros(1,20);
z=zeros(1,20);
m=0
for i= 1:20
  M(i) = m+ 7*D/100;
  m=M(i);
  [f,A,b] = stock(d,c,h,M(i));
  [xopt, fmin, errnum, extra] = glpk(-f,A,b);
  z(i)= fmin;
end

plot(M,z);