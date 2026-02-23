function final_ang = get_red_angle(s, i, hunt_ang, hunt_dst, flee_ang, flee_dst)
    
    % Green Team Logic: prioritize fleeing if a hunter is close
    if flee_dst < 0.5
        final_ang = flee_ang; 
    else
        % If safe, just hunt
        final_ang = hunt_ang; 
    end
    
end