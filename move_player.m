function s = move_player(s, i, vmax)

if s(i).killed == 1 % to stop the movement
    return
end


% Defines the target color and the color to avoid
if s(i).color == 'r'
    target = 'g';
    avoid = 'b';
elseif s(i).color == 'g'
    target = 'b';
    avoid = 'r';
else
    target = 'r';
    avoid = 'g';
end


%% Estratégia simples de caça e fuga
% Tudo isto pode passar para dentro do "if s(i).color == 'r'" para termos
% outras estratégias para as outras cores


% ----- Saves the potencial preys and predators -----
k = 1;
r = 1;

for j = 1:size(s,2)
    % Saves the index and the distance of all the preys
    if s(j).color == target && s(j).killed == 0
        preys(k).idx = j;
        preys(k).dst = sqrt((s(i).x - s(j).x)^2 + (s(i).y - s(j).y)^2);
        k = k + 1;   
    % Saves the index and the distance of all the predators
    elseif s(j).color == avoid && s(j).killed == 0
        predators(r).idx = j;
        predators(r).dst = sqrt((s(i).x - s(j).x)^2 + (s(i).y - s(j).y)^2);
        r = r + 1;
    end
end


kill_dst = 1;             % kill range
avoid_dst = 4 * kill_dst;   % avoidance range

% ----- Closest prey (if any) -----
if k > 1
    dist_preys = [preys.dst];
    [min_dst_t, idx_k] = min(dist_preys);
    idx_t = preys(idx_k).idx;

    % Kills the prey if it is close enough
    if min_dst_t < kill_dst
        s(idx_t).killed = 1;
        return
    end
else
    idx_t = [];
end

% ----- Closest predator (if any) -----
if r > 1
    dist_pred = [predators.dst];
    [min_dst_a, idx_r] = min(dist_pred);
    idx_a = predators(idx_r).idx;
else
    min_dist_a = inf;
end

% ----- Defines the movement -----
% Check if the closest predator is within a certain distance
if min_dst_a < avoid_dst
    % Move away from the predator
    predator_x = s(idx_a).x;
    predator_y = s(idx_a).y;
    ang_to_predator = atan2(s(i).y - predator_y, s(i).x - predator_x);
    
    s(i).x = s(i).x + vmax * cos(ang_to_predator);
    s(i).y = s(i).y + vmax * sin(ang_to_predator);

elseif ~isempty(idx_t)
    % Move towards the prey
    prey_x = s(idx_t).x;
    prey_y = s(idx_t).y;
    ang_to_prey = atan2( prey_y - s(i).y , prey_x - s(i).x);
    
    s(i).x = s(i).x + vmax * cos(ang_to_prey);
    s(i).y = s(i).y + vmax * sin(ang_to_prey);
    s(i).ang = ang_to_prey;
    
else
    % Move in a random direction if no prey or predator is nearby
    s(i).ang = rand * 2 * pi;
    s(i).x = s(i).x + vmax * cos(s(i).ang);
    s(i).y = s(i).y + vmax * sin(s(i).ang);
end





% %{ commenting the directional movement
% %% move in the current direction
% xnew = s(i).x + vmax * cos(s(i).ang);
% ynew = s(i).y + vmax * sin(s(i).ang);
% s(i).x = xnew;
% s(i).y = ynew;
% %}
% 
% %% move in a random direction 
% % the new angle is 
% s(i).ang = rand * 2 * pi; % Random angle between 0 and 2*pi
% xnew = s(i).x + vmax * cos(s(i).ang);
% ynew = s(i).y + vmax * sin(s(i).ang);
% s(i).x = xnew;
% s(i).y = ynew;
