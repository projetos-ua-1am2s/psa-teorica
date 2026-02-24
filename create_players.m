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
            s(i).color = 'r'; % Vermelho
        elseif i <= 2*a/3
            s(i).team = 'green';
            s(i).color = 'g'; % Verde
        else
            s(i).team = 'blue';
            s(i).color = 'b'; % Azul
        end
    end
end