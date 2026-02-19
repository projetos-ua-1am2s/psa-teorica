function game_over = check_game_over(s)
    % We start by assuming the game is not over
    game_over = false; 

    % Counters for killed players in each team
    killed_r = 0;
    killed_g = 0;
    killed_b = 0;

    % Iterate through all players to count the dead ones
    for i = 1:size(s,2)
        if s(i).killed == 1
            % Check which team the killed player belongs to
            if s(i).color == 'r'
                killed_r = killed_r + 1;
            elseif s(i).color == 'g'
                killed_g = killed_g + 1;
            elseif s(i).color == 'b'
                killed_b = killed_b + 1;
            end
        end
    end
    
    % Check if any team has all 3 players killed
    if killed_r == 3 || killed_g == 3 || killed_b == 3
        game_over = true;
    end
end