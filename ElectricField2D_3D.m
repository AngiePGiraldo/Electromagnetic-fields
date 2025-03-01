% Pedir al usuario que ingrese el radio y la densidad de carga en función de phi

a = input("Ingrese el radio del anillo: ");

% Pedir al usuario que ingrese el radio y la densidad de carga en función de phi

% rho_input = input('Ingrese la densidad de carga en función de phi (en términos de phi): ','s');
% rho = str2func(['@(phi)' rho_input]);


% lambda_input = input('Ingrese la densidad de carga en función de phi (en términos de phi): ','s');
% lambda = inline(rho_input, 'phi');

% lambda= @(phi) sin(phi); % función de densidad de carga

lambda_input = input('Ingrese la densidad de carga en función de phi (en términos de phi): ', 's');
lambda  = @(phi) eval(lambda_input);


% Creación de la malla de puntos
n = 100;  % número de puntos en cada dirección
lim = 2*a;  % radio máximo de la malla

[phi, r] = meshgrid(linspace(0, 2*pi, n), linspace(0, lim, n));
x = r.*cos(phi);
y = r.*sin(phi);


% Cálculo del potencial eléctrico
k = 9e9;  % constante de Coulomb
V = zeros(size(r));
for i = 1:n
    for j = 1:n
     potencial = @(p) lambda(p) ./ sqrt((r(i,j)*cos(phi(i,j)) - a*cos(p)).^2 + (r(i,j)*sin(phi(i,j)) - a*sin(p)).^2);
        [V(i,j),~] = quadgk( potencial, 0,2*pi);
        
        %quad: Este método utiliza una fórmula de cuadratura gaussiana 
        %quadl: Este método utiliza una fórmula de cuadratura gaussiana-legendre
        %quaddgk: Gauss-Kronrod.
        
    end
end

% Cálculo del campo eléctrico
[Ex, Ey] = gradient(-V);

% Grafica del anillo

centro = [0, 0]; % centro del círculo

theta = linspace(0, 2*pi,360);

x_c= a*cos(theta) + centro(1);
y_c = a*sin(theta) + centro(2);
plot(x_c, y_c, 'm', 'LineWidth', 2);
axis equal
title('Anillo')

% Graficar el potencial eléctrico en 2D
contour(x, y, V)
hold on
plot(x_c, y_c, 'm', 'LineWidth', 2)
axis equal
title('Potencial eléctrico en 2D')

% Graficar el campo eléctrico en 2D
quiver(x, y, Ex, Ey)
hold on
plot(x_c, y_c, 'm', 'LineWidth', 2)
axis equal
title('Campo eléctrico en 2D')


% Graficar el campo eléctrico en 3D
figure
quiver3(x, y, V, Ex, Ey, zeros(size(Ey)), 'LineWidth', 1)
hold on
plot3(x_c, y_c, zeros(size(x_c)), 'm', 'LineWidth', 2)
surf(x,y,V)
xlabel('x')
ylabel('y')
zlabel('Potencial eléctrico')
title('Campo eléctrico en 3D')
