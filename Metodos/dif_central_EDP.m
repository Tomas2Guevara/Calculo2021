function  dif_Cent_EDP
  clear
  clc 
##  Datos del esapcio
  xi=0;
  xf=1;
  np=6;
  dx=(xf-xi)/(np-1);
  vx=xi:dx:xf;
  
##  Datos del tiempo 
  ti=0;
  dt=0.01; %menos sensible a los pasos
  tf=1.5;
  
##  Matrices coeficientes (dependen del ejercicio)
  M=[2,-1,0;-1,2,-1;0,-1,2];
  M=(12/dx^2)*M;
  K=zeros(3);
  K(1,1)=vx(2)^2;K(2,2)=vx(3)^2;K(3,3)=vx(4)^2;
  
  %y0 condicion inicial t=0 para todos los "x"
  y0=sin(pi*vx(2:4))'; %vector columna de la variable dependiente principal
  b0=3*ones(3,1); %vector columna de la variable dependiente auxiliar
  
  w=1;
  it=0;
 
  %La deririvada segunda depende de la ecuación
  %se obtiene despenjado la derivada segunda de la ecuación original
  %!!y(x0-dx)= y(x0)-h*dy(x0)+(1/2)*(h^2)*derivada2!!
  yv = y0-dt*b0+0.5*dt^2*(inv(K)*(-M)*y0); 
  for i=ti:dt:tf
    %depende totalmente del ejercicio
    %hay que reemplazar derivada segunda central en la ecuación y despejar
    yn = dt^2*inv(K)*(-M)*y0-yv+2*y0;
    
    it+=1;
    vt(it)=i;
    My(:,it)=y0;
    yv=y0;
    y0=yn;
  endfor
  plot(vt,My(2,:))
  
##  Si nos piden integrar 
  %completamos la matriz con la fila inicial y la final
  n=length(vt);
  Myc = zeros(5,n); %analizar como va a ser nuestra matriz particular
  Myc(2:4,:)=My; %cada fila representa un tiempo, y cada columna un x
  I=TC(dx, Myc(:,end))
end  
function I=TC(dx,vy)
  n=length(vy); 
  coef=ones(1,n);
  coef(1)=1/2;
  coef(n)=1/2;
  I=0;
  for i=1:n
    I+=dx*coef(i)*vy(i);
  endfor 
 end