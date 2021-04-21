function [qOverPt, phiT, cotT, zT] = updateFit(rphi_n, rphi_x, rphi_y, rphi_xy, rphi_xx, rz_n, rz_x, rz_y, rz_xy, rz_xx, T)
    b = cast(32,'like',T.s);
    rphi_x(:) = rphi_x / b;
    rphi_xx(:) = rphi_xx / b;
    rphi_xy(:) = rphi_xy / b;
    rphi_y(:) = rphi_y / b;
    rz_x(:) = rz_x / b;
    rz_xx(:) = rz_xx / b;
    rz_xy(:) = rz_xy / b;
    rz_y(:) = rz_y / b;
    qOverPt = cast(0,'like',T.qOverPt);
    phiT = cast(0,'like',T.phiT);
    cotT = cast(0,'like',T.cotT);
    zT = cast(0,'like',T.zT);
    rphi_den = cast(0,'like',T.rphiden);
    rphi_den(:) = (rphi_n * rphi_xx) - (rphi_x * rphi_x);
%     if(rphi_den ~= 0)
        qOverPt(:) = ((rphi_n * rphi_xy) - (rphi_x * rphi_y)) / rphi_den;
        phiT(:) = ((rphi_xx * rphi_y) - (rphi_x * rphi_xy)) / rphi_den;
%     else
%         disp("divide by zero!");
%     end

    rz_den = cast(0,'like',T.rzden);
    rz_den(:) = (rz_n * rz_xx) - (rz_x * rz_x);
%     if(rz_den ~= 0)
        cotT(:) = ((rz_n * rz_xy) - (rz_x * rz_y)) / rz_den;
        zT(:) = ((rz_xx * rz_y) - (rz_x * rz_xy)) / rz_den; 
%      else
%         disp("divide by zero!");
%     end 
end