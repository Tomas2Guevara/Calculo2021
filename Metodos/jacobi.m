function jacob
  clc;
##  Dados A*x=b
  A=[-400 200 0 0 ; 200 -400 200 0 ; 0 200 -400 200 ; 0 0 200 -400];
  b=[(1-(3/2)), 0, 5, 0]';
  x0=[0 ; 0 ; 0 ; 0]; % vector semilla
  e=0.01;
  itmax=5;
  [xr,mSol,fin]=jacobi(A,b,x0,e,itmax)
end



function [xn,mSol,fin] = jacobi(A,b,x0,e,itmax)
  n=length(A);
  it=1;
  fin=0;
  D=diag(diag(A));
  B=A-D;
  T=-inv(D)*B;
  c= inv(D)*b;
  error = e+1;
  mSol(it,1)=0;
  mSol(it,2:n+1)=x0;
  mSol(it,n+2)=error;
  while (fin==0)
    it += 1;
    xn = T*x0+c;
    error = max(abs(xn-x0))/max(abs(xn));
    mSol(it,1)=it-1;
    mSol(it,2:n+1)=xn;
    mSol(it,n+2) = error;
    if (error < e)
      fin=1;
    else
      x0=xn;
    endif
    if (it == itmax)
      fin=2;
    endif
  endwhile
end