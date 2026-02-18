function s = move_player(s, i, vmax)

if s(i).killed == 1 % to stop the movement
    return
end

%{ commenting the directional movement
%% move in the current direction
xnew = s(i).x + vmax * cos(s(i).ang);
ynew = s(i).y + vmax * sin(s(i).ang);
s(i).x = xnew;
s(i).y = ynew;
%}

%% move in a random direction 
% the new angle is 
s(i).ang = rand * 2 * pi; % Random angle between 0 and 2*pi
xnew = s(i).x + vmax * cos(s(i).ang);
ynew = s(i).y + vmax * sin(s(i).ang);
s(i).x = xnew;
s(i).y = ynew;
