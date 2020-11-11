data = rand(100,3) ;
x = data(:,1) ; y = data(:,2) ; z = data(:,3) ;
dt = delaunayTriangulation(x,y) ;
tri = dt.ConnectivityList ;
xi = dt.Points(:,1) ; yi = dt.Points(:,2) ;
F = scatteredInterpolant(x,y,z);
zi = F(xi,yi) ;
trisurf(tri,xi,yi,zi) 

shading interp