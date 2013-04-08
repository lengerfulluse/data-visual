% matlab script to draw a 3-d directlet distribution function. 

alpha = [2, 2, 2];
x = linspace(0,1,100);
y = linspace(0,1,100);
[X, Y] = ndgrid(x, y);
Z = 1 - X - Y;   % represent the third variables.

bad = (X + Y > 1);
X(bad)=NaN;
Y(bad)=NaN;
Z(bad)=NaN;

betaConst = exp(sum(gammaln(alpha))-gammaln(sum(alpha)));
F = (X.^(alpha(1)-1) .* Y.^(alpha(2)-1) .* Z.^(alpha(3)-1)) / betaConst;

figure, surf(X,Y,F,'EdgeColor','none');
xlabel('x'); ylabel('y'); zlabel('f(x,y,1-x-y)');
view(-160,40);
figure, surf(X,Y,Z,F,'EdgeColor','none');
xlabel('x'); ylabel('y'); zlabel('z');
view(-160,40);

