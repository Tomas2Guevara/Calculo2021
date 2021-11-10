function p_fijo
  clc;
  a = input('ingrese a: ');
  e = 0.01;
  itmax = 100;
  [r,fin,mSol] = pf(a,e,itmax)
end
##si la a no es aproximación la it 1 no cuenta
function [x,fin,mSol] = pf(a,e,itmax)
## bloque de inicialización
  it = 1;  
  fin = 0;
  error=1;
  mSol(it,1)=it;
  mSol(it,2)=a;
  mSol(it,3)=f(a);
  mSol(it,4)=g(a);
  mSol(it,5)=error; 
  while fin == 0
    it = it+1;
## bolque intetivo
    x = g(a);
    error=abs(f(x));
## Matriz de soluciones
    mSol(it,1)=it;
    mSol(it,2)=x;
    mSol(it,3)=f(x);
    mSol(it,4)=g(x);
    mSol(it,5)=error; 
## DETENCIÓN Y ACTUALIZACIÓN  
    if ( error<e )
      fin = 1;
    else
      a=x;
    endif
    if (it==itmax)
      fin = 2;
    endif
  endwhile
end
function f=f(x)
  f=exp(-x)-x;
end
function g=g(x)
  g=exp(-x);
end