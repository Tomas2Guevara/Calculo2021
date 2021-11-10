function secante
##  Dos absisas cercanas a la raíz (puede no contenerla)
  clc;
  a=-7.0;
  b=-5.0;
  e=0.0001;  
  itmax=100;
  [r,fin,mSol] = sec(a,b,e,itmax)
##  Para graficar graficamos las aproximaciones en función de las it:
  plot(mSol(:,1),mSol(:,5))
 end
## IMPORTANTE: si los puntos dados son aproximaciones, la it1
## tambien cuenta, pero si son nuemor x no cuenta
 function [r,fin,mSol] = sec(a,b,e,itmax)
   fin=0;
   it=0;
  while (fin == 0)
    it+=1;
##    RECURRENCIA
    m= (f(b)-f(a))/(b-a);
    r = b-f(b)/m;
##    MATRIZ DE SOLUCIONES
    mSol(it,1)=it-1;
    mSol(it,2)=a;
    mSol(it,3)=b;
    mSol(it,4)=m;
    mSol(it,5)=r;
    error=f(r);
    mSol(it,6)=error;
##    DETENCIÓN Y ACTUALIZACIÓN
    if (abs(error)<e) 
       fin=1;
    else
       a=b;
       b=r;
       if (it==itmax)
        fin=2;
       endif
    endif     
  endwhile
end

function f=f(x)
  f=5*(x^3)+10*(x^2)-100;
end
