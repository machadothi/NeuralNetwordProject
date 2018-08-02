data = [0 30 104;0 21 104 ;0 137 153 ;1	247	21;...
    1 183 50 ;1 159 32; 1 172 45; 1	203	58 ;0	35	185];
r = zeros(5,3);
g = zeros(5,3);


ri = 1;
g1 = 1;
for i = 1:9
if(data(i)==0)
    g(g1,:) = data(i,:);
    g1 = g1+1;
else
    r(ri,:) = data(i,:);
    ri=(ri)+1;
end
end

xr = r(:,2);
yr = r(:,3);
xg = g(:,2);
yg = g(:,3);
plot(xr,yr,'ro',xg,yg,'go')
xlabel('MAX RED COMP')
ylabel('MAX GREEN COMP')
legend('STOP SIGNS','GO SIGNS')