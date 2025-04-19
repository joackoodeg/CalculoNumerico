function [x] = susti_adelante(A,b,n)

x = zeros(n,1);

for i = 1:n
    s = b(i);
    for j = 1:i-1
        s = s - A(i,j)*x(j);
    end % j
    x(i) = s/A(i,i);
end % i