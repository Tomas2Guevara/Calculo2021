function m_NewLag
  clc;
##  vx[x0,x1,x2,...,xn]
##  vy[y0,y1,y1,...,yn]
  x=0:2:60;
  for i=1:length(x)
    vecy(i)=fcd(x(i));
  endfor
  plot(x,vecy)
end
## Se recomienda hacer el trabajo algebraico a mano
##y solamente graficar
##P(x)= a0*L0+a1*L1+...+an*Ln
%-----------------------------------
##Lo mismo con el método de newton, conviene trabarjo
##e introducir la función
##a0=f(x0)
##estructura primidal a partir de la tablra x|y
##n0 =1
##n(k)= n(k-1)*(x-x(k-1))
##P(x)=a0+a1*(x-x0)+a2*n1*(x-x1)+...
function y = fcd(x)
  y=5*-(3/2)*(x-3);
end