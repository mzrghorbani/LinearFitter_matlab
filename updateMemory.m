function [xmap, ymap, zmap, lmap]  = updateMemory(index, xmap, ymap, zmap, lmap, T)
    xmap(index,1) = cast(0,'like',T.x);
    ymap(index,1) = cast(0,'like',T.y);
    zmap(index,1) = cast(0,'like',T.z);
    lmap(index,1) = cast(0,'like',T.l);
end