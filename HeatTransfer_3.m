function [hc, qc] = HeatTransfer_3(DT)
if (DT <= 0)
    q = 0;
elseif (DT <= 4)
    q = 21.945*DT;
elseif (DT <= 19.6)
    q = 82.74-131.22*DT+37.64*DT^2-1.13*DT^3;
elseif (DT <= 52)
    q = 13087.8-723.04*DT+13.48*DT^2-0.084*DT^3;
else
    q = 125 + 0.069*DT;
end
qc = q*DT;
hc = q;
end