function s = create_players(a)
    for i = 1:a
        % Posição e direção aleatórias (conforme o teu código original)
        s(i).x = rand * 16 - 8;
        s(i).y = rand * 16 - 8;
        s(i).ang = rand * 2 * pi;
        
        % Estado inicial do jogador
        s(i).killed = 0;
        
        % Aqui falta a lógica para:
        s(i).name = num2str(i);
        
        %% cor e equipa 
        if i <= a/3
            s(i).team = 'red';
            s(i).color = [1 0 0]; % Vermelho 🔴
        elseif i <= 2*a/3
            s(i).team = 'green';
            s(i).color = [0 0.5 0]; % Verde 🟢
        else
            s(i).team = 'blue';
            s(i).color = [0 0 1]; % Azul 🔵
        end
    end
end