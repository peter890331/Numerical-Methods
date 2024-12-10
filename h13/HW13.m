% x -> (Avg(x) / Sum(pt-x))
% 2 2.5 3 5 -> 3.12 / 4.3
% 2 2.5 4 5 -> 3.38 / 4.5
% 2 3 4 5 -> 3.5 / 4
% 2.5 3 4 5 -> 3.6 / 3.5
x = [2.5 3 4 5];
y = [7 6.5 2 0];
pt = 3.4;

% Newint, NMCh15 p12
ypt = Newint(x,y,pt);
fprintf("f(3.4) Order 1 = %.4f, 2 = %.4f, 3 = %.4f\n", ypt);

k = 0; xp = 1:0.05:5;
for t=xp
    k = k+1;
    yp1(k,:) = Newint(x,y,t);
end
hold on
plot(x,y,"o",xp,yp1(:,1));
plot(xp,yp1(:,2));
plot(xp,yp1(:,3));
legend("Data","1","2","3","Location","south");

/////////////////////////////////////////////////

% Inverse interpolation, NMCh15 p17
x = [3 4 5];
y = [0.9 0.941176 0.961538];
c = 0.93;

p = polyfit(x,y,2);
f = @(x) p(1)*x^2+p(2)*x+p(3)-c;

xl = 3; xu = 4;
root2 = secant(f, xl, xu);

x = [2 3 4 5];
y = [0.8 0.9 0.941176 0.961538];

p = polyfit(x,y,3);
f = @(x) p(1)*x^3+p(2)*x^2+p(3)*x+p(4)-c;
root3 = secant(f, xl, xu);

% f = x^2/(1+x^2) -> 0.07x^2 = 0.93
fprintf("x = %.4f, ", sqrt(0.93/0.07));
fprintf("Root Order 2 = %.4f, 3 = %.4f\n", root2, root3);
