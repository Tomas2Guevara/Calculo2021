function derivada1M
  clc;
  vx=6.1:0.4:9.3;
  vy=[6,2,-3,5,-2,3,6,11,8]; %vector fila
  Vdx=ddx(vx,vy)
end

function d=ddx(deltaX,vy)
  %deltaX=vx(2)-vx(1);
  n=length(vy);
  M=zeros(n,n);
  M(1,1)=2;
  M(1,2)=-5;
  M(1,3)=4;
  M(1,4)=-1;
  for i=2:n-1
    M(i,i-1)=1;
    M(i,i)=-2;
    M(i,i+1)=1;  
  endfor
  M(n,n)=2;
  M(n,n-1)=-5;
  M(n,n-2)=4;
  M(n,n-3)=-1;  
  d=(1/(2*deltaX))*(M*vy');
end