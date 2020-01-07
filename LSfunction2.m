function [ N ] = LSfunction2( Z, F );
%UNTITLED5 Summary of this function goes here
%   Detailed explanation goes here

Xa1 = F(1); %Input varibales
Xb1	= F(2);
Ya1	= F(3);
Yb1	= F(4);
Xa2	= F(5);
Xb2	= F(6);
Ya2	= F(7);
Yb2	= F(8);
Ye1 = F(9);
Xe1 = F(10);

Mac1 = (Ye1-Ya1)/(Xe1-Xa1); %Uses substitution to reduce 14 equations to 10
Zac1 = Ye1-Mac1*Xe1;
Mbd1 = (Ye1-Yb1)/(Xe1-Xb1);
Zbd1 = Ye1-Mbd1*Xe1;


Ye2 = Z(1); %Output Variables
Xe2 = Z(2);
Yc = Z(3);
Xc = Z(4);
Yd = Z(5);
Xd = Z(6);
Mac2 = Z(7);
Mbd2 = Z(8);
Zac2 = Z(9);
Zbd2 = Z(10);


N(1) = (Yc-Ya2)^2+(Xc-Xa2)^2-(Yc-Ya1)^2-(Xc-Xa1)^2; %list of 10 equations to solve
N(2) = (Yd-Yb2)^2+(Xd-Xb2)^2-(Yd-Yb1)^2-(Xd-Xb1)^2;
N(3) = Mac1*Xc+Zac1-Yc;
N(4) = Mbd1*Xd+Zbd1-Yd;
N(5) = Mac2*Xa2+Zac2-Ya2;
N(6) = Mac2*Xe2+Zac2-Ye2;
N(7) = Mac2*Xc+Zac2-Yc;
N(8) = Mbd2*Xb2+Zbd2-Yb2;
N(9) = Mbd2*Xb2+Zbd2-Ye2;
N(10) = Mbd2*Xd+Zbd2-Yd;


end

