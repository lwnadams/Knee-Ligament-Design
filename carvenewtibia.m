function [Tx Ty] = carvenewtibia(Ax,Ay,Fx,Fy,Tx,Ty)

[x0, y0] = intersections(Fx,Fy,Tx,Ty); %finds positions of interpolation between
                                       %tibia and femur. x0 and y0 will come out as vectors if there are multiple interpolations

% plot(x0,y0,'-*');

    x0index = numel(x0); %calculates number of interpoations
    
if x0index == 0;
else
    
    if x0index > 1; %If statement makes sure if there's more than one
                    %interpolation, it'll use the interpoation closest to point A (ACL tibia attachment)      
    for i = 1:x0index;  
    magnitudes(i) = sqrt((Ty(1)-y0(i))^2+(Tx(1)-x0(i))^2);    
    end
[Min,Index] = min(magnitudes);
IPindex = Index;
x0 = x0(IPindex);
y0 = y0(IPindex);
    end


if x0index == 1; %condition that there is at least one interpolation.
                 %If tibia has flown off with no contact, x0index will be 0
       
for i = 1:length(Tx) %for loop that calculates distances of all tibia positions to interpolation  
    magnitudes(i) = sqrt((Ty(i)-y0)^2+(Tx(i)-x0)^2);    
end
[Min,Index] = min(magnitudes);
tibiaindex = Index;

for i = 1:length(Fx) %for loop that calculates distances of all femur positions to interpolation    
    magnitudes(i) = sqrt((Fy(i)-y0)^2+(Fx(i)-x0)^2);    
end
[Min,Index] = min(magnitudes);
femurindex = Index;

z = 0;
for i = tibiaindex:length(Tx); %draws tibia from point intersection to match femur
    if z+femurindex < length(Fx);
    Tx(i) = Fx(z+femurindex);
    Ty(i) = Fy(z+femurindex);
    end
    z = z + 1;
end
end
end
end


