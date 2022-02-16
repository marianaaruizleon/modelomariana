clear all

syms w

A = 1.0
H = 0.001

LHS = (w)/(H)
RHS = besselj(0,A*w)/ besselj(1,A*w)

h=fplot(LHS)
h.Color = 'r'
hold on
fplot(RHS)
grid on

root=vpasolve(RHS==LHS,w,[0, 10])
