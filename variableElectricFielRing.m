

% Generar la función Z
[X,Y,Z] = peaks(25);

% Calcular el gradiente de la función Z
[Gx,Gy] = gradient(-Z);

% Crear una figura
figure;
contourf(X,Y,Z,10);

% Trazar la superficie Z con colores personalizados
CO(:,:,1) = zeros(25); % red
CO(:,:,2) = ones(25).*linspace(0.5,0.6,25); % green
CO(:,:,3) = ones(25).*linspace(0,1,25); % blue




% Trazar el gradiente como vectores
% surf(X,Y,Z);
% hold on
% 
% scale = 6; % escala de los vectores
% quiver3(X,Y,Z,-Gx,-Gy,zeros(size(Z)),scale,'color','b');
% hold off
% 
% % Configurar la figura
% title('Superficie 3D con gradiente');
% xlabel('X');
% ylabel('Y');
% zlabel('Z');
% % colorbar;
% 


