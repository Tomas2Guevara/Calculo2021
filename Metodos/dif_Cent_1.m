function dif_Cent_1
  clc;
  y0=2;
  x0=0;
  hs=1;
  h=0.01;%paso
  [x,y]=dif_c1(x0,y0,h,hs)
  plot(x,y)
end
##y(x0-dx)= y(x0)-h*dy(x0) ----> calcular anterior
function [x,y]=dif_c1(x0,y0,h,hs)
  %Aproximación de Tylor para el anterior
  yAnterior = y0-h*dy(x0,y0);
  x=x0:h:hs;
  y(1)=y0;
  for i=1:length(x)-1
    %ecuación de recurrencia/ Depende del ejercicio
    y(i+1)= 2*h*((2*y(i))-(2*x(i))-1)+yAnterior;
    %igualo la derivada central con la derivada que medan y despeje y(x0+h)
    yAnterior=y(i);
  endfor
end
%depende del ejercicio
function y1=dy(x0,y0)
  y1=2*y0-2*x0-1;
end