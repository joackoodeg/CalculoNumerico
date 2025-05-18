function [c, dv] = dif_div(x,y)
n = length(x);
dv = zeros(n,n);
dv(1:n,1) = y;
for i = 2:n
dv(1:n-i+1,i) = ( dv(2:n-i+2,i-1) -dv(1:n-i+1,i-1) )./ ( x(i:n) - x(1:n-i+1) );
# for j = 1:n-i+1
# dv(j,i) = ( dv(j+1,i-1) - dv(j,i-1) )/ ( x(i+j-1) - x(j) );
# endfor
endfor
c = dv(1,1:n)';

endfunction