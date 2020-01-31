nx=100;
ny=100;  
nit=500; 
dx=10/(nx-1); % step
dy=10/(ny-1); % step
x=0:dx:10;
y=0:dy:10;              

v=zeros(ny,nx);
vnew=zeros(ny,nx);

% boundary conditions
v(:,1)=1;
v(:,nx)=1;
v(1,:)=0;              
v(ny,:)=0;

% iteration
i=2:ny-1;
j=2:nx-1;
for it=1:nit
    v(i,j)=(((vnew(i+1,j)+vnew(i-1,j)))+((vnew(i,j+1)+vnew(i,j-1))))/4;
    vnew=v;
    % reset BCs
    v(:,1)=1;
    v(:,nx)=1;
    v(1,:)=0;
    v(ny,:)=0;
    
    
    figure(1);
    surf(x,y,v);
    
end

[Ex,Ey] = gradient(v); % E field

figure(2);
quiver(Ex,Ey);


