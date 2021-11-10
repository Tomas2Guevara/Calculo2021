function derivada1M
##  Se puede realizar con vectores o con punto inicial punto final y paso
  clc;
  xi=-2;
  xf=3;
  n=11;
  deltaX=1;%(xf-xi)/(n-1);
  vx=(xi:deltaX:xf);
  vy=(vx.**3)+(vx.**2)-vx-1; %vector vy simepre tiewne que ir como vector fila
  dxe(:,1)=3*(vx.**2)+2*vx-1 %verdadero vector derivada
  Vdx=dx(deltaX,vy)
  %Vddx=ddx(deltaX,vy);
  plot(vx,Vdx)
  hold on
  plot(vx,dxe)
  hold off
end
function d=dx(deltaX,vy) %devuele columna
 %deltaX=vx(2)-vx(1);
  n=length(vy);
  M=zeros(n,n);
  M(1,1)=-3;
  M(1,2)=4;
  M(1,3)=-1;
  for i=2:n-1
    M(i,i-1)=-1;
    M(i,i+1)=1;  
  endfor
  M(n,n)=3;
  M(n,n-1)=-4;
  M(n,n-2)=1;
  d=(1/(2*deltaX))*(M*vy');
end