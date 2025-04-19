function [x] = susti_atras(A,b,n)

x = zeros(n,1);

for i = n:-1:1
    s = b(i);
    for j = i+1:n
        s = s - A(i,j)*x(j);
    end % j
    x(i) = s/A(i,i);
end % i
