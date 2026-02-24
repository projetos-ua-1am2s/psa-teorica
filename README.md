# psa-teorica


## Game play smoothing
When playing the game a low refresh rate makes the game seem unresponsive and slow, to solve this we changed the pause function to have a small interval and decreased the velocity of players which in result makes the game look much smoother.


https://github.com/user-attachments/assets/50028e29-f2e3-4e1e-8ca6-c8caf8b7b0ba


## Endless game loop bug
When 3 player are hunting each other there is a good chance that they might keep chasing each other in a endless loop since every player has the same speed. 


https://github.com/user-attachments/assets/6c010c3c-54ad-4630-ad42-1f8dba01dfc3

## Strategies Used

### Red Team

The red team tries to predict the prey's future position instead of simply chasing it. The predicted distance is 40% of the distance to the prey, allowing for a rapid approach when far away and a more cautious one as it gets closer. When it is already too close to the prey, it chases it directly without trying to predict its position.

As an escape strategy, the red team players try to evade the predators by moving at 60º angles relative to the predator. However, if the predator is too close, they flee in a straight line.

### Green Team

The main differentiator of the green team's strategy is taking advantage of the random position assignment that occurs when a player hits one of the walls. To do this, when a predator is nearby, the player looks for the nearest wall, and if it is close enough, heads directly towards it.

For hunting, the green team also uses the predicting strategy.

### Blue Team

The blue team uses a vector addition strategy, assigning them the appropriate weights. Hunting always has a constant weight, while fleeing becomes more urgent the closer the predator gets. If the predator is too far away, the weight for fleeing will be 0. However, if the predator is very close, the player abandons this strategy and flees at 90º angles.
