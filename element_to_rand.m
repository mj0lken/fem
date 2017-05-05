function [ rand ] = element_to_rand( ex, ey)
%UNTITLED Summary of this function goes here
%   This is a function that checks which boundary the element belongs to
%   0 is for the boundary with qn = 0
%   1 is for the boundary with qn = qel
%   2 is for boundary with qn = alphac(T-Tinfty) and belongs to SMD
%   3 is for boundary with qn = alphac(T-Tinfty) and belongs to Solde
%   -1 is if it is not in the boundary

[Ymax, Iymax] = max(ey); [Ymin, Iymin] = min(ey);
[Xmax, Ixmax] = max(ex); [Xmin, Ixmin] = min(ex);


    
if (ey(Ixmin) == 0.6e-3 && ey(Ixmax) == 0.6e-3 && Xmax <= 0.20001e-3)
    rand = 1;
    
    elseif (ey(Ixmin) == 0.6e-3 && ey(Ixmax) == 0.6e-3 && Xmin >= 0.1999e-3)
        rand = 2;

    elseif (((ey(1) >= (-ex(1)+1.1999e-3) && (ey(1) <= (-ex(1)+1.2001e-3))) || ...
            (ey(2) >= (-ex(2)+1.1999e-3) && (ey(2) <= (-ex(2)+1.200e-3)))) && ...
            ((ey(2) >= (-ex(2)+1.1999e-3) && (ey(2) <= (-ex(2)+1.2001e-3))) || ...
            (ey(3) >= (-ex(3)+1.1999e-3) && (ey(3) <= (-ex(3)+1.2001e-3)))) && ...
            ((ey(3) >= (-ex(3)+1.1999e-3) && (ey(3) <= (-ex(3)+1.2001e-3))) || ...
            (ey(1) >= (-ex(1)+1.1999e-3) && (ey(1) <= (-ex(1)+1.2001e-3)))))
        % Ugly code.. some kind of and/or gate that makes sure
        % atleast two poins are on the line y = -x +1.2
        rand = 3;    
   
    elseif(Xmin == 0 || Ymin == 0 || (Xmax== 1e-3 && Ymax <= 0.2e-3))
          rand = 0;
    else
        rand = -1;
 end
       



end

