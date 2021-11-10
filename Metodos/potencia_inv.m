function potencia_inv
  clc;
  M=inv([20 0 0 0 ; 0 40 0 0 ; 0 0 40 0 ; 0 0 0 20]);
  K=[-400 200 0 0 ; 200 -400 200 0 ; 0 200 -400 200 ; 0 0 200 -400];
  A = M*K; 
  itmax=100;
  y0 = zeros(n,1)
  [y0,Landa] = potenciaInvnv(A,y0,itmax)
end
function [y0,Landa] = potenciaInv(A,y0,itmax)
  alfa0 = ones(n,1);
  n=length(A);
  e=0.001;
  fin=0;
  it=0;
  while (fin==0)
    it += 1;
    xn = y0/max(abs(y0));
    y0 = A*xn;
    alfa = y0./xn;
    error = max(abs(alfa-alfa0))/max(abs(alfa));
    if (error < e)
      fin=1;
    endif
    alfa0=alfa;
    mxn(it,:)=xn;
    my(it,:)=y0;
    MA(it,:)=1./alfa;
    vLanda(it,1)=1/max(alfa);
    vit(it)=it;
    if (it == itmax)
      fin=2;
    endif
  endwhile
  Landa=1/max(alfa);

end