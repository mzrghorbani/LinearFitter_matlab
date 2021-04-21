function [rphi_n, rphi_x, rphi_y, rphi_xy, rphi_xx, rz_n, rz_x, rz_y, rz_xy, rz_xx] = updateSums(xmap, ymap, zmap, lmap, lp, T)
    rphi_n = cast(0,'like',T.l);
    rz_n = cast(0,'like',T.l);
    rphi_x = cast(0,'like',T.rphix);
    rphi_y = cast(0,'like',T.rphiy);
    rphi_xy = cast(0,'like',T.rphixy);
    rphi_xx = cast(0,'like',T.rphixx);
    rz_x = cast(0,'like',T.rzx);
    rz_y = cast(0,'like',T.rzy);
    rz_xy = cast(0,'like',T.rzxy);
    rz_xx = cast(0,'like',T.rzxx);
    for i=1:7
        if(lp(i,1) ~= 0)
            
            RPhi_layerMinPos = cast(max(xmap),'like',T.x);
            Phi_layerMinPos = cast(max(ymap),'like',T.y);
            RZ_layerMinPos = cast(max(xmap),'like',T.x);
            Z_layerMinPos = cast(max(zmap),'like',T.z);
            RPhi_layerMaxPos = cast(min(xmap),'like',T.x);
            Phi_layerMaxPos = cast(min(ymap),'like',T.y);
            RZ_layerMaxPos = cast(min(xmap),'like',T.x);
            Z_layerMaxPos = cast(min(zmap),'like',T.z);
            RPhi_layerPos = cast(0,'like',T.x);
            Phi_layerPos = cast(0,'like',T.y);
            RZ_layerPos = cast(0,'like',T.x);
            Z_layerPos = cast(0,'like',T.z);
            for j=1:4
                tmp = ((7 * j) - 7 ) + i;
                if(lmap(tmp,1) ~= 0)
                    rphix = cast(xmap(tmp,1),'like',T.x);
                    rphiy = cast(ymap(tmp,1),'like',T.y);
                    rzx = cast((rphix + 0) - 0,'like',T.x);
                    rzy = cast(zmap(tmp,1),'like',T.z);
                    if RPhi_layerMinPos > rphix
                        RPhi_layerMinPos = rphix;
                    end
                    if (Phi_layerMinPos > rphiy)
                        Phi_layerMinPos = rphiy;
                    end
                    if (RZ_layerMinPos > rzx)
                        RZ_layerMinPos = rzx;
                    end
                    if (Z_layerMinPos > rzy)
                        Z_layerMinPos = rzy;
                    end
                    if (RPhi_layerMaxPos < rphix)
                        RPhi_layerMaxPos = rphix;
                    end
                    if (Phi_layerMaxPos < rphiy)
                        Phi_layerMaxPos = rphiy;
                    end
                    if (RZ_layerMaxPos < rzx)
                        RZ_layerMaxPos = rzx;
                    end
                    if (Z_layerMaxPos < rzy)
                        Z_layerMaxPos = rzy;
                    end 
                    RPhi_pos = cast(0,'like',T.RPhiPos);
                    Phi_pos = cast(0,'like',T.PhiPos);
                    RZ_pos = cast(0,'like',T.RZPos);
                    Z_pos = cast(0,'like',T.ZPos);
                    RPhi_pos(:) = cast((RPhi_layerMinPos + RPhi_layerMaxPos),'like',T.RPhiPos);
                    Phi_pos(:) = cast((Phi_layerMinPos + Phi_layerMaxPos),'like',T.PhiPos);
                    RZ_pos(:) = cast((RZ_layerMinPos + RZ_layerMaxPos),'like',T.RZPos);
                    Z_pos(:) = cast((Z_layerMinPos + Z_layerMaxPos),'like',T.ZPos);

                    RPhi_layerPos(:) = RPhi_pos / 2;
                    Phi_layerPos(:) = Phi_pos / 2;
                    RZ_layerPos(:) = RZ_pos / 2;
                    Z_layerPos(:) = Z_pos / 2;
                end
            end

            rphi_n(:) = rphi_n + 1;
            rphi_xy(:) = rphi_xy + (RPhi_layerPos * Phi_layerPos);
            rphi_x(:) = rphi_x + RPhi_layerPos;
            rphi_y(:) = rphi_y + Phi_layerPos;
            rphi_xx(:) = rphi_xx + (RPhi_layerPos * RPhi_layerPos);

            rz_n(:) = rz_n + 1;
            rz_xy(:) = rz_xy + (RZ_layerPos * Z_layerPos);
            rz_x(:) = rz_x + RZ_layerPos;
            rz_y(:) = rz_y + Z_layerPos;
            rz_xx(:) = rz_xx + (RZ_layerPos * RZ_layerPos);
        end
    end
end