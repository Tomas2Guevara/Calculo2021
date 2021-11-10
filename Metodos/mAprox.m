function mAprox
  clc;
  vx=[0;30;60];
  vy=[0;0.5;0];
  x=0:100:600;
  for i=1:length(x)
    vecy(i)=fca(x(i),vx,vy);
  endfor
 plot(x,vecy)
end

function y = fca(x,vx,vy)  
  %Elijo las funciones a elelcion
  f1=[1;1;1];
  f2=sin(vx);
  n=length(vx);
  phi(:,1)=f1; % funciones arbitrarias
  phi(:,2)=f2;
  y=0;
  a=inv(phi'*phi)*(phi'*vy);%vy tiene que ser columna
  y=a(1)*1+a(2)*sin(x); % coeficiente n * f'n'
end