%% notes from class 
%{
when you use a pause command you have to terminate the execution for you to
be abble to run the code again.




tarefas
    if player out of arena killed == 1 
    and hunting other players 

tarefa -- jogo a funcionar
    comportamento de caça e fuga
    3 payers 
    com limites
   
extra 
podemos fazer cada um uma inteligência
%}


% usar F5 para executar
clc % limpar o command window
clear all % limpar todas as variaveis da memoria
close all % limpar todas as figuras

%% Draw the arena

plot([-10, 10, 10, -10, -10], ...
     [10, 10, -10, -10, 10], ...
     '--k')
axis([-12 12 -12 12])
hold on;

%% Game Parameters
vmax = 0.1;

%% Create teams and players
n_pts_color = 3;      % Number of players per team
colors = ['r', 'g', 'b'];
total_pts = n_pts_color * length(colors);

idx = 1;

for c = 1:length(colors)
    for i = 1:n_pts_color

        s(idx).color = colors(c);
        s(idx).x = rand * 16 -8;     % rand generates values between 0 and 1
        s(idx).y = rand * 16 -8;     % values between -8 and 8
        s(idx).ang = rand * 2 * pi;
        s(idx).killed = 0;
        s(idx).name = colors(c) + "-" + i;      % name the player (r-1, r-2...)
        
        idx = idx + 1;

    end
end

%% Drawing players in their initial position
for i=1:size(s,2) % size(s,2) gives the number of players
    % creating players in the graph with solid colors
    s(i).hcircle = plot(s(i).x, s(i).y, 'o', ...
    'Color', s(i).color, ...
    'MarkerSize', 12, ...
    'MarkerFaceColor', s(i).color);

    s(i).htext = text(s(i).x, s(i).y + 0.5, s(i).name);
    s(i).harrow = plot([s(i).x, s(i).x +  vmax * cos(s(i).ang)], ...
        [s(i).y, s(i).y +  vmax * sin(s(i).ang)], '-', 'Color', s(i).color);
end

%% GAME __________________________________________________
% this while is responsible to stop the game when a team has lost all of
% its players.
while check_game_over(s) == false

    % Move the players
    for i=1:size(s,2)
        s = move_player(s, i, vmax);
    end

    
    %% Draw the players in their new positions
    for i=1:size(s,2)

        % Jogador que caça outro
            % ver se o jogador está fora do mapa e se estiver metê-lo numa
            % posição aleatória
            s = check_bounds(s,i);

        % grafical code
            if isgraphics(s(i).hcircle) 
                % this prevents error in set command due to the window being
                % closed
                set(s(i).hcircle, 'XData', s(i).x , 'YData', s(i).y)
                
                xtip = s(i).x +  vmax * cos(s(i).ang);
                ytip = s(i).y +  vmax * sin(s(i).ang);
                set(s(i).harrow,  'XData', [s(i).x, xtip] , ...
                    'YData', [s(i).y, ytip])
              
                set(s(i).htext, 'Position', [s(i).x, s(i).y+0.5, 0]);
                if s(i).killed == 1
                    set(s(i).htext, 'String', [s(i).name ' (killed)']);
                end
            end  
        
    end

    pause(0.01)
    % pause
end

%% FIM DO JOGO - Descobrir e anunciar o perdedor
killed_r = 0;
killed_g = 0;
killed_b = 0;

% Count the dead players one last time
for i = 1:size(s,2)
    if s(i).killed == 1
        if s(i).color == 'r'
            killed_r = killed_r + 1;
        elseif s(i).color == 'g'
            killed_g = killed_g + 1;
        elseif s(i).color == 'b'
            killed_b = killed_b + 1;
        end
    end
end

% Print the losing team to the Command Window
if killed_r == 3
    disp('Game Over! Red Team lost! 🔴')
    text(0, 0, 'GAME OVER - Red Team Lost!', 'HorizontalAlignment', ...
        'center', 'FontSize', 16, 'Color', 'r', 'FontWeight', 'bold');
elseif killed_g == 3
    disp('O jogo acabou! A equipa que perdeu foi a Verde (Green)! 🟢')
    text(0, 0, 'GAME OVER - Green Team Lost!', 'HorizontalAlignment', ...
        'center', 'FontSize', 16, 'Color', 'g', 'FontWeight', 'bold');
elseif killed_b == 3
    disp('O jogo acabou! A equipa que perdeu foi a Azul (Blue)! 🔵')
    text(0, 0, 'GAME OVER - Blue Team Lost!', 'HorizontalAlignment', ...
        'center', 'FontSize', 16, 'Color', 'b', 'FontWeight', 'bold');
end