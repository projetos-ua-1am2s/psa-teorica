function [flee_ang, min_dst] = get_flee_info(s, i)
    
    k = 1;
    
    if s(i).color == 'r'
        predator_color = 'b';
    elseif s(i).color == 'g'
        predator_color = 'r';
    else
        predator_color = 'g';
    end

    for j = 1:size(s,2)
        if s(j).color == predator_color && s(j).killed == 0
            predators_list(k).idx = j;
            predators_list(k).dst = sqrt((s(i).x - s(j).x)^2 + (s(i).y - s(j).y)^2);
            k = k + 1;
        end
    end

    if k == 1
        flee_ang = 0;
        min_dst = inf; 
        return
    end

    dists = [predators_list.dst];
    [min_dst, idx_k] = min(dists);
    idx = predators_list(idx_k).idx;

    predator_x = s(idx).x;
    predator_y = s(idx).y;
    
    ang_to_predator = atan2( predator_y - s(i).y , predator_x - s(i).x);
    flee_ang = ang_to_predator + pi; 
end