function s = check_bounds(s, i)
    % Verificação de limites (o teu código atual)
    if s(i).x < -10 || s(i).x > 10 || s(i).y < -10 || s(i).y > 10
        % Aqui em vez de s(i).killed = 1, vamos dar novas coordenadas
        % uma atualização para a tarefa 3 
        s(i).x = rand * 20 - 10 ; 
        s(i).y = rand * 20 - 10 ;
    end
end