function [S,dS,ddS]=funcion_spline(x1,y1,df1,df2)

% Calculo de los coeficientes caso: Natural
if (nargin==2)
  [a,b,c,d] = cubic_spline_natural(x1,y1);
  dS= @(x) b(1)*(x==x1(1));
  % Calculo de los coeficientes caso: Sujeto
elseif (nargin==4)
  [a,b,c,d] = cubic_spline_clamped(x1,y1,df1,df2);
  dS= @(x) df1*(x==x1(1));
else
  printf("Faltan argumentos: 2 para natural, 4 para sujeto");
endif

%Armamos la Spline cubica
S=@(x) a(1)*(x==x1(1));
ddS= @(x) (2*c(1))*(x==x1(1));
M=[d c b a];
dM=[];
ddM=[];
for i=1:length(x1)-1
  dM=[dM;polyder(M(i,:))];
  ddM=[ddM;polyder(dM(i,:))];
  S=@(x) S(x) +...
  polyval(M(i,:),x-x1(i)).*(x>x1(i)).*(x<=x1(i+1));
  dS=@(x) dS(x) +...
  polyval(dM(i,:),x-x1(i)).*(x>x1(i)).*(x<=x1(i+1));
  ddS=@(x) ddS(x) +...
  polyval(ddM(i,:),x-x1(i)).*(x>x1(i)).*(x<=x1(i+1));
endfor
