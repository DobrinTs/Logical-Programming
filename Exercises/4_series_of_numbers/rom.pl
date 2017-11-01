%% converter to roman digits

r(m,1000).
r(cm,900).
r(d,500).
r(cd,400).
r(c,100).
r(xc,90).
r(l,50).
r(xl,40).
r(x,10).
r(ix,9).
r(v,5).
r(iv,4).
r(i,1).

rom(0).
rom(X) :- r(Z,Y), Y=<X, write(Z), X1 is X-Y, rom(X1).
