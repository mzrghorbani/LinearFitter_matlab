function [xmap, ymap, zmap, lmap, lp] = lr_memory_fe(x0, y0, z0, l0, T) 
    xmap = cast(zeros(28,1),'like',T.x);
    ymap = cast(zeros(28,1),'like',T.y);
    zmap = cast(zeros(28,1),'like',T.z);
    lmap = cast(zeros(28,1),'like',T.l);
    lp   = cast(zeros(7,1),'like',T.l);
    k = cast(7,'like',T.l);
    for i=1:1:16
       switch l0(i,1)
           case 1
               tmp = k * lp(1,1) + 1;
               xmap(tmp,1) = x0(i,1);
               ymap(tmp,1) = y0(i,1);
               zmap(tmp,1) = z0(i,1);
               lmap(tmp,1) = 1;
               lp(1,1) = lp(1,1) + 1;
           case 2
               tmp = k * lp(2,1) + 2;
               xmap(tmp,1) = x0(i,1);
               ymap(tmp,1) = y0(i,1);
               zmap(tmp,1) = z0(i,1);
               lmap(tmp,1) = 1;
               lp(2,1) = lp(2,1) + 1;
           case 3
               tmp = k * lp(3,1) + 3;
               xmap(tmp,1) = x0(i,1);
               ymap(tmp,1) = y0(i,1);
               zmap(tmp,1) = z0(i,1);
               lmap(tmp,1) = 1;
               lp(3,1) = lp(3,1) + 1;
           case 4
               tmp = k * lp(4,1) + 4;
               xmap(tmp,1) = x0(i,1);
               ymap(tmp,1) = y0(i,1);
               zmap(tmp,1) = z0(i,1);
               lmap(tmp,1) = 1;
               lp(4,1) = lp(4,1) + 1;
           case 5
               tmp = k * lp(5,1) + 5;
               xmap(tmp,1) = x0(i,1);
               ymap(tmp,1) = y0(i,1);
               zmap(tmp,1) = z0(i,1);
               lmap(tmp,1) = 1;
               lp(5,1) = lp(5,1) + 1;
           case 6
               tmp = k * lp(6,1) + 6;
               xmap(tmp,1) = x0(i,1);
               ymap(tmp,1) = y0(i,1);
               zmap(tmp,1) = z0(i,1);
               lmap(tmp,1) = 1;
               lp(6,1) = lp(6,1) + 1;
           case 7
               tmp = k * lp(7,1) + 7;
               xmap(tmp,1) = x0(i,1);
               ymap(tmp,1) = y0(i,1);
               zmap(tmp,1) = z0(i,1);
               lmap(tmp,1) = 1;
               lp(7,1) = lp(7,1) + 1;
       end     
    end
end