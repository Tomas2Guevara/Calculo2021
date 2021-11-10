function EDO2_inicial
  clc;
  t0=0;
  tf=1;
  tita0=pi/4;
  beta0=0;
  dt=0.01;
  w=0.5;
  [vt,vtita]=RK(t0,tita0,beta0,w,dt,tf)
  plot(vt,vtita);
end
%Ser oredenado con los nombres de las variables, y tener en cuenta lo que cambia
function [vt,vtita]=RK(t0,tita0,beta0,w,dt,tf)
  vt=t0:dt:tf;  
  vtita (1)=tita0;
  vbeta(1)=beta0;
  for i=1:length(vt)-1
    dtita=vbeta(i);
    dbeta=dB(vtita(i));
    k1t=dt*dtita;
    k1b=dt*dbeta;
    gxt=vt(i)+(dt/(2*w));
    gtita=vtita(i)+(k1t/(2*w));
    gbeta=dtita+(k1b/(2*w));
    k2t=dt*gbeta ; 
    k2b=dt*dB(vtita(i))*gtita; %dB depende del ej
    vtita(i+1)=vtita(i)+(1-w)*k1t+w*k2t;
    vbeta(i+1)=vbeta(i)+(1-w)*k1b+w*k2b;       
  endfor
end
%depende del la edo en cuestión
function B =dB(titap)
  L=10;
  g=9.81;
  B=-(g/L)*titap;
end
