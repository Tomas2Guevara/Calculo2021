function New_Rap
  clc; 
  a= 3; 
  e=0.0001;
  itmax=4;
  [r,fin,mSol] = N_rap(a,e,itmax) 
##  Para graficar graficamos las aproximaciones en función de las it:  
  plot(mSol(:,1),mSol(:,2),'-g')
  hold on
  plot (vectorit,vectory)
end
##si la a no es aproximación la it 1 no cuenta
function [r,fin,mSol] = N_rap(a,e,itmax) 
## bloque de inicialización  
  it=1;
  fin=0;
  r0=a;  
  mSol(it,1)=it;
  mSol(it,2)=r0;
  mSol(it,3)=f(r0);
  mSol(it,4)=d(r0);
  mSol(it,5)=1; 
  while(fin==0)                                 
   it += 1;
## bolque intetivo
   m=d(a);
   r=a-f(a)/m;   
   error=abs((r-a)/r);  
## Matriz de soluciones
   mSol(it,1)=it;
   mSol(it,2)=r;
   mSol(it,3)=f(r);
   mSol(it,4)=d(r);
   mSol(it,5)=error;  
## DETENCIÓN Y ACTUALIZACIÓN   
   if((error)<e)
    fin=1;
   endif 
   if(it == itmax)
    fin = 2;
   endif                           %bloque actualización
   a=r;
  endwhile  
end
function f = f(x)
  f= 5*(x**3)+10*(x**2)-100;
end
function f = d(x)
  f = 15*(x**2)+20*x;
 end