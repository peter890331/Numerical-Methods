% Define variables
TU = 25; TD = 75; TL = 100; TR = 0;
n = 3;
[T, iter] = HW7rod(n, TU, TD, TL, TR, 0.01, 50);
% clear boundary values
T(n+1,:)=[]; T(1,:)=[]; T(:,n+1)=[]; T(:,1)=[];

fprintf("T11 = %.2f\nT12 = %.2f\nT21 = %.2f\nT22 = %.2f\n", T(1,1), T(1,2), T(2,1), T(2,2));
%fprintf(Iter = %d\n", iter);

n = 20;
[T, iter] = HW7rod(n, TU, TD, TL, TR, 0.01, 500);
figure(1), colormap jet;contour(T);
figure(2), colormap jet;fg2 = pcolor(0:1/2^4:n,0:1/2^4:n,interp2(T, 4));set(fg2, 'EdgeColor', 'none');
figure(3), colormap jet;surf(T);