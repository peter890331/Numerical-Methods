function [x,fx,iteration] = parab(f,x1,x2,x3,es)
if nargin<4
    error('at least 4 input arguments required');
end
if nargin < 5 ||isempty(es), es=0.0001;end

iteration = 0;
while(1)
    x4 = x2-((x2-x1)^2*(f(x2)-f(x3))-(x2-x3)^2*(f(x2)-f(x1)))/(2*(x2-x1)*(f(x2)-f(x3))-(x2-x3)*(f(x2)-f(x1)));
    iteration = iteration + 1;
    
    if abs((x4-x3)/x4)*100 < es
       root = x4;
       break;
    end
    
    if (x2 < x4 && f(x2) > f(x4)) || (x2 > x4 && f(x2) < f(x4))
        if x2 > x4
            x3 = x2;
            x2 = x4;
        else
            x3 = x4;
        end
    else
        if x2 < x4
            x1 = x2;
            x2 = x4;
        else
            x1 = x4;
        end
    end   

end
x = root;
fx = f(x);