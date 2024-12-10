t = [200 202 204 206 208 210];
th = [0.75 0.72 0.70 0.68 0.67 0.66];
r = [5120 5370 5560 5800 6030 6240];

% At 206 second, t(4)
i = 4;

% NMCh19 p6、p8, Centered Finite-Difference
h = t(i+1)-t(i);

% 1-th order
dr(i) = (r(i+1)-r(i))/h;
dth(i) = (th(i+1)-th(i))/h;

% 2-th order
ddr(i) = (r(i+1)-2*r(i)+r(i-1))/(h^2);
ddth(i) = (th(i+1)-2*th(i)+th(i-1))/(h^2);

% er = cos(θ)i + sin(θ)j, eθ = − sin(θ)i + cos(θ)j, https://neil-strickland.staff.shef.ac.uk/courses/MAS243/lectures/handout15.pdf
er = [cos(th(i)) sin(th(i))];
eth = [-sin(th(i)) cos(th(i))];
V = dr(i)*er + r(i)*eth*dth(i);
A = (ddr(i)-r(i)*dth(i)^2)*er + (r(i)*ddth(i) + 2*dr(i)*dth(i))*eth;
fprintf("Velocity1 : %.3f\nVelocity2 : %.3f\n",V);
fprintf("Acceleration1 : %.3f\nAcceleration2 : %.3f\n",A);

//////////////////////////////////////////

p = [0.1 5 10 20 25 30 40 45 50];
T350 = [220 4.1 2.2 1.35 1.1 0.9 0.68 0.61 0.54];
T400 = [250 4.7 2.5 1.49 1.2 0.99 0.75 0.675 0.6];
T450 = [282.5 5.23 2.7 1.55 1.24 1.03 0.78 0.7 0.62];

% Centered Finite-Difference (要對題目給的P0~50範圍內的所有資料去積)
dT = (T450-T350)/(450-350);  %f'(xi)=(f(xi+1)-f(xi-1))/2h
H = trapz(p,(T400-400*dT));
fprintf("H : %.3f\n",H);
