function EDO1_inicial
##  Eulere 
  clc;
  y0=2;
  x0=0;
  w=0.5;
  h=0.10;
  hs=1;
  [vx,vy]=euler(x0,y0,w,h,hs)
  plot(vx,vy,'*')
end
function [vx,vy]=euler(x0,y0,w,h,hs)
  vx=x0:h:hs;  
  vy(1)=y0;
  for i=1:length(vx)-1
    yp=dy(vx(i),vy(i));
    k1=h*yp;
    gx=vx(i)+(h/(2*w));
    gy=vy(i)+(k1/(2*w));
    k2=h*dy(gx,gy);
    vy(i+1)=vy(i)+(1-w)*k1+w*k2;
  endfor
end
function dy=dy(x0,y0)
  dy=2*y0-2*x0-1;
end