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

%% Desenhar a Arena

plot([-10, 10, 10, -10, -10], ...
     [10, 10, -10, -10, 10], ...
     '--k')
axis([-12 12 -12 12])
hold on;

%% Parâmetros do jogo
vmax = 0.6;

%% criar equipas e jogadores 
s = create_players(9)

%% Desenhar jogadores na posição inicial
for i=1:size(s,2) % size(s,2) dá o número de jogadores
    s(i).hcircle = plot(s(i).x, s(i).y, 'o', 'Color', s(i).color, 'MarkerSize', 12);
    s(i).htext = text(s(i).x, s(i).y + 0.5, s(i).name);
    s(i).harrow = plot([s(i).x, s(i).x +  vmax * cos(s(i).ang)], ...
        [s(i).y, s(i).y +  vmax * sin(s(i).ang)], '-', 'Color', s(i).color);
end

%% JOGO __________________________________________________
for k=1:50


    %% Movimentar Jogadores
    for i=1:size(s,2) % size(s,2) dá o número de jogadores
        s = move_player(s, i, vmax);
    end



    
    %% Desenhar jogadores
    for i=1:size(s,2) % size(s,2) dá o número de jogadores


        %% Jogador que caça outro
            % ver se o jogador está fora do mapa e se estiver metê-lo numa
            % posição aleatória
            s = check_bounds(s,i);

        %% grafical code
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

    pause(0.1)
    % pause
end