function [x1, y1, z1, l1] = LinearFitter_top(x0, y0, z0, l0, T)

    [xmap, ymap, zmap, lmap, lp] = lr_memory_fe(x0, y0, z0, l0, T);

    for k=1:12
        [rphi_n, rphi_x, rphi_y, rphi_xy, rphi_xx, rz_n, rz_x, rz_y, rz_xy, rz_xx] = updateSums(xmap, ymap, zmap, lmap, lp, T);
        [qOverPt, phiT, cotT, zT] = updateFit(rphi_n, rphi_x, rphi_y, rphi_xy, rphi_xx, rz_n, rz_x, rz_y, rz_xy, rz_xx, T);
        [index] = calcResiduals(qOverPt, phiT, cotT, zT, xmap, ymap, zmap, lmap, T);
        [xmap, ymap, zmap, lmap]  = updateMemory(index, xmap, ymap, zmap, lmap, T);
        disp(index)
    end

    [x1, y1, z1, l1] = lr_memory_be(xmap, ymap, zmap, lmap, T);
end