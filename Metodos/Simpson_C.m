function Simpson_C
  clc;
  vx=[0.25,0.5,0.75,1,1.25,1.5,1.75,2,2.25];
  vy=[-10,-5,10,25,30,22,18,15,12];
  dx=vx(2)-vx(1);
  I=SC(dx,vy)
end

function I=SC(dx,vy)
  n=length(vy)  
  coef=ones(1,n);
  coef(1)=1/3;
  coef(n)=1/3;
  I=0;
  %Si es impar es n, si es par es n-2
  for i=1:2:n-2
    coef(i)=2/3;
    coef(i+1)=4/3;
  endfor 
  for i=1:n
    I += dx*coef(i)*vy(i);
  endfor 
end