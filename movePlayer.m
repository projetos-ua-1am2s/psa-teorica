function s = psa_w8_function_movePlayer(s, i, vmax)

if s(i).killed == 1 % to stop the movement
    return
end


%% move in the current direction
xnew = s(i).x + vmax * cos(s(i).ang);
ynew = s(i).y + vmax * sin(s(i).ang);
s(i).x = xnew;
s(i).y = ynew;

