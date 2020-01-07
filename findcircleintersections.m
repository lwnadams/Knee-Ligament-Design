function [I1x I1y I2x I2y] = findcircleintersections(C1x,C1y,C2x,C2y,r1,r2)

%defines equation of a circle where C1 and C2 are the centres, d is the diameter

d = sqrt((C2y-C1y)^2+(C2x-C1x)^2); 

%breaks circle into different elements

a = (d^2+r1^2-r2^2)/(2*d);
h = sqrt(r1^2-a^2);

theta = atan2((C2y-C1y),(C2x-C1x));

%calculates both intersects

I1x = a*cos(theta)+h*sin(theta)+C1x;
I1y = a*sin(theta)-h*cos(theta)+C1y;
I2x = a*cos(theta)-h*sin(theta)+C1x;
I2y = a*sin(theta)+h*cos(theta)+C1y;

end
