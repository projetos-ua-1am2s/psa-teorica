function s = move_player(s, i, vmax)
    if s(i).killed == 1 
        return
    end

    kill_dst = 0.3;

    % 1. Gather info from our "radars"
    [hunt_ang, hunt_dst, prey_idx] = get_hunt_info(s, i);
    [flee_ang, flee_dst] = get_flee_info(s, i);

    % 2. Check if we are close enough to kill a prey right now!
    if hunt_dst < kill_dst
        s(prey_idx).killed = 1;
        return % We killed, so we stop moving this turn
    end

    % 3. DECISION TIME: Hunt or Flee?
    % We need to choose the final_ang based on the distances
        
    if flee_dst < 0.5
        final_ang = flee_ang;
    else
        final_ang = hunt_ang;
    end

    % 3.1. Normalize the final angle to ensure it is within the range [0, 2*pi]
    final_ang = mod(final_ang, 2 * pi);
    
    % 4. Finally, move the player using the chosen angle
    s(i).x = s(i).x + vmax * cos(final_ang);
    s(i).y = s(i).y + vmax * sin(final_ang);
    s(i).ang = final_ang;
end