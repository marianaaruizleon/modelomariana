function [hc, qc] = HeatTransfer_2(DT)
if (DT<=0)
    a0 = 0;
    a1 = 0;
    a2 = 0;
    a3 = 0;
    a4 = 0;
    a5 = 0;
elseif (DT<=4.6)
    a5 = 0.001680087;
    a4 = -0.019242022;
    a3 = 0.087095646;
    a2 = -0.074037883;
    a1 = 0.057917877;
    a0 = 0;
elseif (DT<=10)
    a5 = 0.001523743;
    a4 = -0.042849971;
    a3 = 0.443404076;
    a2 = -1.846635116;
    a1 = 3.046099292;
    a0 = 0;
elseif (DT<=18.9)
    a5 = 0;
    a4 = 0;
    a3 = 0.030698456;
    a2 = -1.696351705;
    a1 = 28.57852002;
    a0 = -133.0831413;
elseif (DT<=22.8)
    a5 = 0;
    a4 = 0;
    a3 = -0.019815625;
    a2 = 1.546287856;
    a1 = -40.11763931;
    a0 = 347.5715056;
elseif (DT<=89.9)
    a5 = -7.8404488e-9;
    a4 = 2.8840356e-6;
    a3 = -0.0004118;
    a2 = 0.028566069;
    a1 = -0.952535697;
    a0 = 12.89616643;
else
    a5 = -3.37683125e-13;
    a4 = 4.008429818e-10;
    a3 = -1.60665804e-7;
    a2 = 3.053044558e-5;
    a1 = 0.009349036;
    a0 = 0.240726932;
end
q=a0+a1*DT+a2*DT^2+a3*DT^3+a4*DT^4+a5*DT^5;
qc= q*1e4;
if (DT == 0)
    hc = 0;
else
    hc = qc/DT;
end
end