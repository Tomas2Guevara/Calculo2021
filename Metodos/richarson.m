function richarson
end
function I = rich(I1,I2,dx1,dx2,e)%e es el orden de error del método
  b = (dx1/dx2)**e;
  I = (b*I2-I1)/(e-1);
end
