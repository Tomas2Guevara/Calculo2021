 function gauss 
  clc;
  A=[-2 1 ; 3 4];
  b=[2 ;-1];
  n=length(A);
  e=0.000001;
  x0=ones(n,1);
  itmax=100;
  it=1;
  fin=0; 
  error=e+1;
  mSol(it,1)=it;
  mSol(it,2:n+1)=x0;
  mSol(it,n+2)=error;
  D=diag(diag(A));
  B=A-D;
  Ti=tril(B);
  Ts=triu(B);
  T=inv(D+Ti)*(-Ts);
  c=inv(D+Ti)*b;
  while (fin==0)
    it += 1;
    x0=T*x0+c;
    mSol(it,1)=it;
    mSol(it,2:n+1)=x0;
    error = max(abs(mSol(it,2:n+1)-mSol(it-1,2:n+1))/abs(mSol(it,2:n+1)));
    mSol(it,n+2)=error;
    if (error < e)
       fin=1;
    endif
    if (it == itmax)
       fin=2;
    endif
 endwhile
 fin 
 x0
 mSol
end