c=(1:100);
for (i=1:100)
    y(i)=HeatTransfer_1(i);
    s(i)=HeatTransfer_2(i);
    w(i)=HeatTransfer_3(i);
end
plot (c,y)
xlabel ('DT')
hold on 
plot (c,s)
plot (c,w)