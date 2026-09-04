P=[12,31,54,23,76; 11,2,12,1,5; 12,35,2,23,53; 12,1,54,3,6; 3,45,23,12,7; 18,9,19,28,31; 11,12,12,21,25; 18,15,12,25,58];
k=zeros(1,8);
fmi=zeros(1,100);
d=1:100;
d=d/4;
for j=1:100
  for i=1:8
    k(i)=100-d(j)*abs(i-4);
  end
  [c,A,b]=light(P,k);
  [xopt, fmin, errnum, extra] = glpk(-c,A,b);
  fmi(j)=fmin;
end
plot(d,fmi);