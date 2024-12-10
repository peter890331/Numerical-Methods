function [a, Cond] = polynomial(x,y)
    s = size(y,1);
    for i=1:s
        for j=1:s
            f(i,j) = x(i)^(s-j);
        end
    end
    a = f\y;
    Cond = cond(f);
end