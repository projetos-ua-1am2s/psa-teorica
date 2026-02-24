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
    
    is_taken = false; % assuming player is free to be hunted
    
    % Saves the potential preys
    for j = 1:size(s,2)
        is_taken = false;

        % Percorrer todos os jogadores para ver o que andam a caçar
        % searching every player to see what they are hunting 

        if s(i).color == 'g'
            for m = 1:size(s,2)
                
                % if it is from my team (same color) and not me (m ~= i), and
                % is hunting j
                if s(m).color == s(i).color && m ~= i && s(m).hunting == j
                    is_taken = true; % prey is already being hunted
                end
            end
        end

        % Saves the potential preys
    
        if s(j).color == target && s(j).killed == 0 && is_taken == false
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