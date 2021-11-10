function mDirecto
  clc;
##  Recibo los vectores de x y f(x)
  vx=[3;7;6];
  vy=[5;-1;4];
## Genero el dominiop de f()x
  x=0:2:60;
  for i=1:length(x)
##    Guardamos en un vector las imagenres f(x) que necesitamos
    vecy(i)=fcd(x(i),vx,vy );
  endfor
  plot(x,vecy)
  hold on
  plot(vx,vy,'*r')
  hold off
end

function y = fcd(x,vx,vy)
  n=length(vx);
  M=zeros(n,n);
  for i=1:n
    M(:,i)=(vx.**(i-1));
  endfor
  y=0;
  a=inv(M)*vy;
  for i=1:n
    y=y+a(i,1)*(x.^(i-1));
  endfor
end