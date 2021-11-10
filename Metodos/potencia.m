function potencia
  clc;
##  Matriz A nos la dan
  A = [40 -20 0 0 ; -20 80 -20 0 ; 0 -20 80 -20 ; 0 0 -20 40];
##  Vector semilla (dado)
  y0 = [2; -4; 4; -4];  
  itmax=1000;
  e=0.001;
  [my,vLanda,vit] = pot(A,y0,e,itmax)
  plot(vit,vLanda)
end
function [my,vLanda,vit] = pot(A,y0,e,itmax)
  %Inicialización
  n=length(A);
  alfa0 = ones(n,1);
  fin=0;
  it=0;
  while (fin==0)
    it += 1;
    %Recurrencia
    xn = y0/max(abs(y0));
    y0 = A*xn;
    alfa = (y0'*xn)./(xn'*xn) ;
    error = max(abs(alfa-alfa0))/max(abs(alfa));
##  Detención y actualización
    if (error < e)
      fin=1;
    endif
    alfa0=alfa;
    mxn(it,:)=xn;
    %Matriz que guarda las apriximaciones de V
    my(it,:)=y0;
    MA(:,it)=alfa;
    %vector de aproximaciones de landa
    vLanda(it,1) = max(alfa);
    %vector itenreciones
    vit(it) = it;
   
    if (it == itmax)
      fin=2;
    endif
  endwhile
end