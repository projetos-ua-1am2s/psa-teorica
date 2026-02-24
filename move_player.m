function s = move_player(s, i, vmax)
    % Stop if the player is already dead
    if s(i).killed == 1 
        return
    end

    % Universal game rules
    kill_dst = 0.3;

    %% 1. Gather info from our "radars"
    [hunt_ang, hunt_dst, prey_idx] = get_hunt_info(s, i);
    s(i).hunting = prey_idx; % stores who the player is hunting

    [flee_ang, flee_dst] = get_flee_info(s, i);

    %% Game rule: if hunter is close -- slow down player
    % to avoid endless loops of players circling
    if flee_dst < 0.6
        s(i).fatigue = s(i).fatigue + 1;

        if s(i).fatigue >= 50
            s(i).speed = vmax * 0.9;
        elseif s(i).fatigue >= 500
            s(i).speed = vmax * 0.5;
        end
    else 
        s(i).fatigue = max(s(i).fatigue - 1, 0); % Reset fatigue if fleeing
    

    %% 2. Check kill condition (Applies to everyone)
    if hunt_dst < kill_dst
        s(prey_idx).killed = 1;
        return % We killed, so we stop moving this turn
    end

    %% 3. DECISION TIME: Ask the specific team AI for the desired angle
    if s(i).color == 'r'
        final_ang = get_red_angle(s, i, hunt_ang, hunt_dst, flee_ang, flee_dst, prey_idx);
    elseif s(i).color == 'g'
        final_ang = get_green_angle(s, i, hunt_ang, hunt_dst, flee_ang, flee_dst);
    elseif s(i).color == 'b'
        final_ang = get_blue_angle(s, i, hunt_ang, hunt_dst, flee_ang, flee_dst);
    end

    %% 3.1. Normalize the final angle
    final_ang = mod(final_ang, 2 * pi);
    
    % 4. Finally, move the player using the chosen angle (Applies to everyone)
    s(i).x = s(i).x + vmax * cos(final_ang);
    s(i).y = s(i).y + vmax * sin(final_ang);
    s(i).ang = final_ang;
end