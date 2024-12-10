function x = lusolve(A,B)
	% NMCh10 p4, https://zh.wikipedia.org/wiki/LU%E5%88%86%E8%A7%A3
	% PLU Decomposition
    [L,U,P] = lu(A);
	PB = P*B;
    p是轉換矩陣，要乘上b(結果)再拆lu
	% forward substitution, Ld = B
	% d1 = PB1/L11, d2 = (PB2 - L21*d1)/L22, ...
	N = size(L,1);
	d(1,:) = PB(1,:)/L(1,1);
	for m = 2:N
		d(m,:) = (PB(m,:)-L(m,1:m - 1)*d(1:m-1,:))/L(m,m);
	end
    
	% backward substitution, Ux = d
	% x1 = d1/U11, x2 = (d2 - U21*d1)/U22, ...
	N = size(U,2);
	x(N,:) = d(N,:)/U(N,N);
	for m = N-1: -1:1
		x(m,:) = (d(m,:) - U(m,m + 1:N)*x(m + 1:N,:))/U(m,m);
	end
end