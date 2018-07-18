%% Sphere
u = chebfun2(@(u,v) u, [0 2*pi pi/100 pi]); %horizontal angle
v = chebfun2(@(u,v) v, [0 2*pi pi/100 pi]); %vertical angle

x = cos(u).*sin(v);
%x = cos(v).*sin(u) gives spiral shape
y = sin(u).*sin(v);
z = cos(v);

F = [x;y;z];
N = -normal(F,'unit')/sin(v); %N(u,v): compute outward normal vectors based on given u,v

%for displaying all normal vectors
surf(F)
hold on;
quiver3(F(1),F(2),F(3),N,5);
hold off;
axis equal;
%

%for displaying an unit normal vector at a point on the sphere.
surf(F)
hold on
scatter3(x(pi/4,pi/4),y(pi/4,pi/4),z(pi/4,pi/4),'filled')
quiver3(x(pi/4,pi/4),y(pi/4,pi/4),z(pi/4,pi/4),N1(1),N1(2),N1(3),0)
axis equal
hold off
%

%% Cone
P.name = 'cone';
obj = chebFF(P);
F = obj.eq;
N = -normal(F,'unit');