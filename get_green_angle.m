function final_ang = get_green_angle(s, i, hunt_ang, hunt_dst, flee_ang, flee_dst)

    
    % Green Team Logic: prioritize fleeing if a hunter is close
    if flee_dst < 0.7
        
        % --- SMART WALL TELEPORT TACTIC ---
        % 1. Calculate distance to the 4 walls
        dist_right = 10 - s(i).x;
        dist_left = s(i).x - (-10); 
        dist_top = 10 - s(i).y;
        dist_bottom = s(i).y - (-10); 
        
        % 2. Find the closest wall
        dists_to_walls = [dist_right, dist_top, dist_left, dist_bottom];
        [min_wall_dist, wall_idx] = min(dists_to_walls);
        
        % 3. If the wall is close, dive into it for teleportation!
        if min_wall_dist < 2.0
            wall_angles = [0, pi/2, pi, 3*pi/2];
            final_ang = wall_angles(wall_idx);
        else
            % Otherwise, standard flee
            final_ang = flee_ang;
        end

    else
        % If safe, just hunt
        final_ang = hunt_ang; 
    end
end