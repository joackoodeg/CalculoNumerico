function [c, dv]=dif_div_inc(x, y, dv)
n = length(x);
m = length(dv);
dv(n,n) = 0;
dv(m+1:n,1) = y(m+1:n);
for i = 1:n-1
dv(m-i:n-i,i+1) = ( dv(m-i+1:n-i+1,i)-dv(m-i:n-i,i) )./(x(m:n) - x(m-i:n-i));
end
c = dv(1,:)';
endfunction