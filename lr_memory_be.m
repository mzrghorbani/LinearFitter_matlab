function [x1, y1, z1, l1] = lr_memory_be(xmap, ymap, zmap, lmap, T)
    x1 = cast(zeros(16,1),'like',T.x);
    y1 = cast(zeros(16,1),'like',T.y);
    z1 = cast(zeros(16,1),'like',T.z);
    l1 = cast(zeros(16,1),'like',T.l);
    j = 1;
    for i=1:28
        tmp = lmap(i,1);
        if(tmp ~= 0)
            x1(j,1) = xmap(i,1);
            y1(j,1) = ymap(i,1);
            z1(j,1) = zmap(i,1);
            l1(j,1) = tmp;
            j = j+1;
        end
    end
end