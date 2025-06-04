function x = sust_atras_aum(A)
    n = size(A, 1);
    x = zeros(n, 1);
    x(n) = A(n, end) / A(n, n);
    for i = n-1:-1:1
        x(i) = (A(i, end) - A(i, i+1:n) * x(i+1:n)) / A(i, i);
    end
end

