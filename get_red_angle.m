function final_ang = get_red_angle(s, i, hunt_ang, hunt_dst, flee_ang, flee_dst, prey_idx)
    
    % Red Team Logic: hunts trying to antecipate the prey's position

    % Flees if too close to the predator
    if flee_dst < 1.5
        % If the predator is too close, tries to dodge it
        if flee_dst < 0.7
            final_ang = flee_ang + (pi/3);
        else
            % If the predator is just getting close, flees in a straight
            % line
            final_ang = flee_ang; 
        end

    % Hunts trying to predict the future location of the prey
    elseif hunt_dst > 0.7 && prey_idx ~= -1
        d = hunt_dst * 0.4;     % Predict 40% of the current distance
        
        predict_x = s(prey_idx).x + d * cos(s(prey_idx).ang);
        predict_y = s(prey_idx).y + d * sin(s(prey_idx).ang);
        final_ang = atan2(predict_y - s(i).y, predict_x - s(i).x);
    
    % If too close to the prey, goes directly towards it
    else
        final_ang = hunt_ang; 

    end
    
end