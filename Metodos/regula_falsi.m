function regula_farsi
  clc;
  a=0;
  b=5;
  e=0.1;
  itmax=100;
  [r,fin,mSol] = reg_fal(a,b,e,itmax)
##  Para graficar graficamos las aproximaciones en función de las it:
  plot(mSol(:,1),mSol(:,5))  
  
end
function [r,fin,mSol] = reg_fal(a,b,e,itmax)
  it=0;
  fin=0;
  while (fin==0)
    it+=1;
    m=(f(b)-f(a))/(b-a);
    r=b-f(b)/m;
    error = abs(f(r));
    mSol(it,1)=it;
    mSol(it,2)=a;
    mSol(it,3)=b;       
    mSol(it,4)=r;    
    mSol(it,5)=error;
    if (error<e)
      fin=1;
    else
      if (f(a)*f(r)<0)
          b=r;
      else
          a=r;
      endif   
      if (it==itmax)
        fin=2;
      endif 
    endif    
  endwhile  
end
function f=f(x)
  f=x**2-3;
end 