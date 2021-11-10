function Biseccion
##  Dos absisas / entre ellos esté la raíz
  clc;
  a=-3;
  b=5;
  e=0.001;
  itmax=100;
  [r, fin, mSol] = biseccion(a,b,e,itmax)
##  Para graficar graficamos las aproximaciones en función de las it:
 plot(mSol(:,1),mSol(:,4))
end 
function [r, fin, mSol] = biseccion(a,b,e,itmax)
  fin=0;
  it=0;
  while (fin==0)
    it+=1;
##    RECURRENCIA
    r=(a+b)/2;
##    MATRIZ DE SOLUCIONES
    mSol(it,1)=it; 
    mSol(it,2)=a;
    mSol(it,3)=b;
    mSol(it,4)=r;
    error=abs(f(r));
    mSol(it,5)=error;
##    DETENCIÓN Y ACTUALIZACIÓN
    if (error<=e)
      fin=1;
    else
      if (f(a)*f(r)<0)
        b=r;
      else
        a=r;
      endif
      if it==itmax
        fin=2;
      endif
    endif    
   endwhile    
end
function f=f(x)
  f = (x**3)-27;
end