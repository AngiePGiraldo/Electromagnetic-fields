% [X,Y,Z] = peaks(25);
% [DX,DY] = gradient(Z);
% quiver(X,Y,DX,DY)

% [X,Y,Z] = peaks(25);
% [DX,DY,DZ] = gradient(Z);
% figure
% quiver3(X,Y,Z,DX,DY,DZ)
[X,Y,Z] = peaks(25);
CO(:,:,1) = zeros(25); % red
CO(:,:,2) = ones(25).*linspace(0.5,0.6,25); % green
CO(:,:,3) = ones(25).*linspace(0,1,25); % blue
mesh(X,Y,Z,CO)

% % Calculamos el vector gradiente
% [Gx,Gy] = gradient(Z);
% 
% % Graficamos el vector gradiente
% figure;
% quiver3(X,Y,Gx,Gy);
% title('Vector Gradiente');
% xlabel('X');
% ylabel('Y');
% zlabel('Z');
% 
% % Calculamos la divergencia
% div = divergence(X,Y,Gx,Gy);
% 
% % Graficamos la divergencia
% figure;
% contour3(X,Y,div);
% title('Divergencia');
% xlabel('X');
% ylabel('Y');
% zlabel('Z');
% 
% 

[X,Y,Z] = peaks(25);

% Encuentra los componentes x, y, y z de la matriz tridimensional
[dX,dY,dZ] = gradient(Z,X,Y);

% Grafica el gradiente de la función
figure;
quiver3(X,Y,Z,dX,dY,dZ);

% Calcula la divergencia de la función
div_Z = divergence(X,Y,Z,dX,dY,dZ);

% Grafica la divergencia de la función
figure;
mesh(X,Y,Z,div_Z);


