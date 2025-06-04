function [p,rh,E_rel,it]=rcubica(a,xa,xb)
  
  % GENERAMOS LA FUNCION PARA EL CALCULO DE LA RAIZ CUBICA
  f = @(x) x.^3 -a;

  maxit = 100; % fijamos un numero de iteraciones
  tol=1e-12; % tolerancia pedida
  
  %[p, rh, it, tiempo] = biseccion2(f, xa, xb, maxit, tol);
  
 [p, rh, it, E_rel,tiempo] = biseccion3(f, xa, xb, maxit, tol);
  
  disp('comprobamos la solucion de la raiz cubica: ')
  disp(p)
  valor = p^3;
  
  disp('cantidad de iteraciones para calcular la raiz cubica: ')
  disp(it);
  
  x=linspace(xa,xb,100);
  
  z=@(x) 0.*x;
  z=z(x);
  
  figure(1)
  plot(x,f(x),'r-','linewidth', 3,x,z,'k-','linewidth', 3)
  grid on
  grid minor
  xlabel('x')
  ylabel('y=f(x)')
  title('Grafica de la funcion rcubica')
  
  figure(2)
  semilogy(E_rel,'b-d')
  grid on
  xlabel('iteraciones')
  ylabel('E_rel(it)')
  title('Convergencia del metodo de biseccion')
  hold on
  semilogy(rh,'r-*')
  hold off
  
endfunction
