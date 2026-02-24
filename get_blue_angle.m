function final_ang = get_blue_angle(s, i, hunt_ang, hunt_dst, flee_ang, flee_dst)
    
    % Blue Team Logic: Vector Combination
    % Set the weights (importance) of hunting vs fleeing

    weight_hunt = 1.0;      % The desire to hunt is always constant
    
    % The desire to flee is dynamic
    if flee_dst < 1.5 
        weight_flee = 1 / (flee_dst + 0.1); 
    else
        weight_flee = 0;     % If the predator is far, there's no need to flee
    end
    
    % Calculate the X and Y components of the hunt vector
    hunt_x = cos(hunt_ang) * weight_hunt;
    hunt_y = sin(hunt_ang) * weight_hunt;
    
    % Calculate the X and Y components of the flee vector
    flee_x = cos(flee_ang) * weight_flee;
    flee_y = sin(flee_ang) * weight_flee;
    
    % Vector combination
    result_x = hunt_x + flee_x;
    result_y = hunt_y + flee_y;
    
    % If the predator is too close, tries to dodge it
    if flee_dst < 0.6
        % Add a perpendicular force to avoid fleeing in a straight line
        perp_x = -sin(flee_ang) * 1.5;
        perp_y = cos(flee_ang) * 1.5;
        
        result_x = result_x + perp_x;
        result_y = result_y + perp_y;
    end
    
    final_ang = atan2(result_y, result_x);
    
end