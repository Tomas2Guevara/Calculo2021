function EDO2_inicial
  clc;
  t0=0;
  tf=6;
  tita0=5;
  beta0=2;
  A=5;
  B=2;
  C=12;
  D=15;
  dt=0.2;
  w=0.5;
  [vt,vtita]=RK(t0,tita0,beta0,A,B,C,D,w,dt,tf)
  plot(vt,vtita);
end
function [vt,vtita]=RK(t0,tita0,beta0,A,B,C,D,w,dt,tf)
  vt(1)=t0;
  vec_A= (t0+dt):dt:tf;
  for i=1:length(vec_A)
    vt(i+1)=vec_A(i);
  endfor
  vtita (1)=tita0;
  vbeta(1)=beta0;
  for i=1:length(vt)-1
    tita=vbeta(i);
    beta=dB(vtita(i),vt(i),tita);
    k1t=dt*tita;
    k1b=dt*beta;
    gxt=vt(i)+(dt/(2*w));
    gtita=vtita(i)+(k1t/(2*w));
    gbeta=tita+(k1b/(2*w));
    k2t=dt*gbeta;
    k2b=dt*dB(vtita(i),vt(i),tita)*gtita;
    vtita(i+1)=vtita(i)+(1-w)*k1t+w*k2t;
    vbeta(i+1)=vbeta(i)+(1-w)*k1b+w*k2b;       
  endfor
end
function B =dB(y0,p,b)
  B=(1/5)*(15*p*sin(3*p)-12*y0-2*b);
end
