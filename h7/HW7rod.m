function [T iter] = HW7rod(n, TU, TD, TL, TR, es, maxit)
    T = zeros(n+1,n+1);
	% 邊界條件由低往高設，避免出現奇怪狀況
	T(n+1,:) = TR;
	T(:,n+1) = TU;
	T(:,1) = TD;
	T(1,:) = TL;
	iter = 0; ea = 100;
    
	while (ea > es && iter < maxit)
		Told = T;
		ea = 0;
		
        % NMCh9 p17, approximate solution / ref HW5_2(rod.m)
		% 由上下左右4點去近似出該點的值
		% T(x+1) - 2T(x) + T(x-1) + T(y+1) - 2T(y) + T(y-1) = 0
		% ex: T(x,y) = (T(x,y+1)+T(x+1,y)+T(x-1,y)+T(x,y-1))/4;		
        for i = 2:n
            for j = 2:n
				T(i,j) = (T(i,j+1)+T(i+1,j)+T(i-1,j)+T(i,j-1))/4;
                if T(i,j) ~= 0,ea = max([ea, abs((T(i,j) - Told(i,j))/T(i,j)) * 100]);end
            end
        end
        iter=iter+1;
	end
end