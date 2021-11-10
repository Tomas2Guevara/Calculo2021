function  dif_Cent_2
  y0=pi/4;
  dy0=0;
  x0=0;
  L=10;
  g=9.81;
  h=0.01;
  hs=1;
  [x,y]=dif_c2(x0,y0,dy0,h,hs,L,g)
  plot(x,y)
  
end
function [x,y]=dif_c2(x0,y0,dy0,h,hs,L,g)
  %La deririvada segunda depende de la ecuación
  %se obtiene despenjado la derivada segunda de la ecuación original
  %y(x0-dx)= y(x0)-h*dy(x0)+(1/2)*(h^2)*derivada2
  yAnterior = y0-h*dy0+(1/2)*(h^2)*(g/L)*y0;
  x=x0:h:hs;
  y(1)=y0;  
  for i=1:length(x)-1
    %depende totalmente del ejercicio
    %hay que reemplazar derivada segunda central en la ecuación y despejar
    y(i+1)= (-g/L)*y(i)*h^2+2*y(i)-yAnterior;
    yAnterior=y(i);
  endfor
end  