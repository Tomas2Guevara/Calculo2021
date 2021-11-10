function RK_EDP
  clear
  clc 
##  Datos del esapcio
  xi=0;
  xf=1;
  dx=0.25;
  vx=xi:dx:xf;
  
##  Datos del teimpo 
  ti=0;
  dt=0.001;
  tf=1.5;
  
##  Matrices coeficientes (dependen del ejercicio)
  M=[2,-1,0;-1,2,-1;0,-1,2];
  M=(12/dx^2)*M;
  K=zeros(3);
  K(1,1)=vx(2)^2;K(2,2)=vx(3)^2;K(3,3)=vx(4)^2;
  
  %y0 condicion inicial t=0 para todos los "x"
  y0=sin(pi*vx(2:4))'; %vector columna de la variable dependiente principal
  b0=3*ones(3,1); %vector columna de la variable dependiente auxiliar
  
  w=0.5;
  it=0;
 

  for i=ti:dt:tf %varia en función del TIEMPO"""
##    Datos iniciales
    fy=b0;
    fb=inv(K)*(-M)*y0; %depende el ejercicio (despejar)
    
##    Vectores k1
    k1y=dt*fy;
    k1b=dt*fb;
    
##    Puntos Auxiliares
    tg=ti+dt/(2*w); %variable independiente
    yg=y0+k1y/(2*w);
    bg=b0+k1b/(2*w);
##    Gerero K2
    fyg=bg;
    fbg=inv(K)*(-M)*yg;%%%%%
    k2y=dt*fyg;
    k2b=dt*fbg;
    
##    Iteraciones y recurrencia
    it=it+1;
    yn=y0+(1-w)*k1y+w*k2y; %rec RK
    bn=b0+(1-w)*k1b+w*k2b; %rec RK
    vt(it)=i;
    My(:,it)=y0;
    y0=yn;
    b0=bn;
    ti=ti+dt;
  endfor
  a=sum(My(2,:))
  plot(vt,My(2,:))
end
