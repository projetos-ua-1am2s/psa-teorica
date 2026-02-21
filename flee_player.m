function s = flee_player(s, i, vmax)
    
    % stoping the player if player has lost
    if s(i).killed == 1 % to stop the movement
        return
    end

    %% team designation
    kill_dst = 0.3;
    k = 1;
    
    % Usamos 'predator_color' para não confundir com a lista de predadores
    if s(i).color == 'r'
        predator_color = 'b';
    elseif s(i).color == 'g'
        predator_color = 'r';
    else
        predator_color = 'g';
    end

    % Saves the potencial predators
    for j = 1:size(s,2)
        if s(j).color == predator_color && s(j).killed == 0
            % Guardamos numa lista chamada 'predators_list'
            predators_list(k).idx = j;
            predators_list(k).dst = sqrt((s(i).x - s(j).x)^2 + (s(i).y - s(j).y)^2);
            k = k + 1;
        end
    end

    % If there are no predators alive
    if k == 1
        return
    end

    % Closest predator
    dists = [predators_list.dst];
    [min_dst, idx_k] = min(dists);
    idx = predators_list(idx_k).idx;

    % Move AWAY from the predator
    predator_x = s(idx).x;
    predator_y = s(idx).y;
    
    % Ângulo NA DIREÇÃO do predador
    ang_to_predator = atan2( predator_y - s(i).y , predator_x - s(i).x);
    
    % Ângulo DE FUGA (meia-volta)
    flee_ang = ang_to_predator + pi; 

    % Agora sim, movemos o jogador usando o ângulo de fuga
    s(i).x = s(i).x + vmax * cos(flee_ang);
    s(i).y = s(i).y + vmax * sin(flee_ang);
    s(i).ang = flee_ang;
end