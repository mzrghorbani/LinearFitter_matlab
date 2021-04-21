function [index] = calcResiduals(qOverPt, phiT, cotT, zT, xmap, ymap, zmap, lmap, T)
    index = cast(0,'like',T.s);
    phi_largestResid = cast(-1,'like',T.phiLargest);
    z_largestResid = cast(-1,'like',T.zLargest);
    for i=1:28
        if(lmap(i,1) ~= 0)
            xtmp = xmap(i,1);
            phi_resid = cast(0,'like',T.phiResid);
            phi_resid(:) = abs(ymap(i,1) - (phiT + qOverPt * xtmp));
            z_resid = cast(0,'like',T.zResid);
            z_resid(:) = abs(zmap(i,1) - (zT + cotT * xtmp));
            phiz_resid = cast(0,'like',T.phizResid);
            phiz_resid(:) = phi_resid + z_resid;
            phiz_largestResid = cast(0,'like',T.phizLargest);
            phiz_largestResid(:) = phi_largestResid + z_largestResid;
            if phiz_resid > phiz_largestResid
                phi_largestResid(:) = phi_resid;
                z_largestResid(:) = z_resid;
                index(:) = i;
            end
        end
    end
    % d0 = sprintf("%d, %d", largestResidIdx_row, largestResidIdx_col);
    % disp(d0)
end