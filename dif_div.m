function [c] = dif_div(x, y)
  %c es un vector con los coecientes del polinomio interpolante en la forma de Newton
  %x es un vector con las abcisas de interpolacion y
  %y tiene los valores de la funci´on en dichas abcisas
  n = length(x);
  c = y;
  for j = 2:n
    for i = n:-1:j
      c(i) = (c(i) - c(i-1)) / (x(i) - x(i-j+1));
    end
  end
end

% Como usarlo:
% x = [0, 1, 1.5, 2];
% y = [3, 3, 13/4, 5/3];
% c = dif_div(x, y);

