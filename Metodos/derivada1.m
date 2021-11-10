function derivada1
  %clc;
  %tabla de valore
  vx=6.1:0.4:9.3;
  vy=[6,2,-3,5,-2,3,6,11,8];
  Vdx=dx(vx,vy)
  Vddx=dx(vx,Vdx)'
  
end

function d=dx(vx,vy)
  deltaX=vx(2)-vx(1);
  n=length(vy);
  d(1)=(-3/(2*deltaX))*vy(1)+(2/deltaX)*vy(2)+(-1/(2*deltaX))*vy(3);
  for i=2:n-1
    d(i)=(1/(2*deltaX))*(vy(i+1)-vy(i-1));
  endfor
  d(n)=(-3/(2*deltaX))*vy(n)+(2/deltaX)*vy(n-1)+(-1/(2*deltaX))*vy(n-2);
end