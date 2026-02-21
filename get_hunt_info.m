function [hunt_ang, min_dst, prey_idx] = get_hunt_info(s, i)
    k = 1;
    
    % Defines the target color
    if s(i).color == 'r'
        target = 'g';
    elseif s(i).color == 'g'
        target = 'b';
    else
        target = 'r';
    end
    
    % Saves the potencial preys
    for j = 1:size(s,2)
        if s(j).color == target && s(j).killed == 0
            preys(k).idx = j;
            preys(k).dst = sqrt((s(i).x - s(j).x)^2 + (s(i).y - s(j).y)^2);
            k = k + 1;
        end
    end
    
    % If there are no preys alive, return infinity distance
    if k == 1
        hunt_ang = 0;
        min_dst = inf; 
        prey_idx = -1;
        return
    end
    
    % Closest prey
    dists = [preys.dst];
    [min_dst, idx_k] = min(dists);
    prey_idx = preys(idx_k).idx;
    
    prey_x = s(prey_idx).x;
    prey_y = s(prey_idx).y;
    hunt_ang = atan2( prey_y - s(i).y , prey_x - s(i).x);
end