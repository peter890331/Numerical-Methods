function T=rod(T0, Tn, Ta, h, n, L)
    A= zeros(n-1,n-1);
    B= zeros(n-1,1);
    Am= -2-h*(L/n)^2;
    Bm= -h*(L/n)^2*Ta;
    for i=1:n-1
        B(i) = Bm;
        for j=1:n-1
            if i==j
                A(i,j)= Am;
                if(i < n-1)&&(j < n-1)
                    A(i,j+1)= 1;
                    A(i+1,j)= 1;
                end
            end
        end
    end
    
    B(1)= B(1)-T0;
    B(n-1)= B(n-1)-Tn;
    T(1)= T0;
    T= [T (A\B)'];
    T(n+1)=Tn;
    
    A1= ((Tn-Ta)-(T0-Ta)*exp(-sqrt(h)*L))/(exp(sqrt(h)*L)-exp(-sqrt(h)*L));
    B1= ((T0-Ta)*exp(sqrt(h)*L)-(Tn-Ta))/(exp(sqrt(h)*L)-exp(-sqrt(h)*L));
    k=[0:0.5:L];
    T1=A1*exp(sqrt(h)*k)+B1*exp(-sqrt(h)*k)+Ta;
    
    x=linspace(0,L,n+1);
    plot(x,T,k,T1)
end