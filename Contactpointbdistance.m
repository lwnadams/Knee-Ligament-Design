function [contactpointbdistance angle contact] = contactpointbdistance(x0,y0,Fx,Fy,Tx,Ty)

    z = 1; %defines start of varibales to be increased per loop
    contact = 1; %contact 0 means there is no contact between femur and tibia
   for k = 1:length(Ty); %two embedded for loops that calculate distance
                         %between each tibia point to nearest femur point
       for r = 1:length(Fy);
           magnitudes(r) = sqrt((Fy(r)-Ty(k))^2+(Fx(r)-Tx(k))^2);
       end
           magnitudestibia(k) = min(magnitudes); %finds point of minimum distance
   end
              for k = 1:length(Ty);
                  if magnitudestibia(k) == 0; %if magnitudes tibia is 0,
                                              %the tibia is in contact
                      index(z) = k; %index = number of points in contact
                      indexfinal = sum(index)/length(index); %finds average (middle distance)
                      z = z+1;
                      contact = 0;
                  end
              end
              
              if contact == 1; %if there was never contact, the closest tibia
                                %point to femur will be contact point marked for measurement
              [magnitude indexfinal] = min(magnitudestibia);
              end
              
              indexfinal = round(indexfinal,0);
              
              TibiaCPx = Tx(indexfinal);
              TibiaCPy = Ty(indexfinal);
    
    %calculates distance from ACL/femur intersect to contact point          
    contactpointbdistance = sqrt((y0-TibiaCPy)^2+(x0-TibiaCPx)^2); 
    angle = atan2((TibiaCPy-y0),(TibiaCPx-x0));


       
end

