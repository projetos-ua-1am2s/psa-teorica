# psa-teorica
This game is a team tag game in which the teams have their own artificial inteligence, Ruled Based-AI. Each team hunts another, for example blue hunts red, and when a player is close they can catch the other. 
When a player touches the edges of the map he is positioned in a random position inside the map. When a entire team is caught the game ends.
Game file is: "psa_hunting_game.m"


## Game play smoothing
When playing the game a low refresh rate makes the game seem unresponsive and slow, to solve this we changed the pause function to have a small interval and decreased the velocity of players which in result makes the game look much smoother.


https://github.com/user-attachments/assets/50028e29-f2e3-4e1e-8ca6-c8caf8b7b0ba

We can see the change @ [Result](#result)

### Efficiency and code organization
To avoid the alteration of the size of a structure we preloaded its size, this avoids dynamic growth when adding players to the game. 
To make the code cleaner we separated the move function from main, we can determine which priority is higher—escaping or chasing—and thus choose the action the player should perform first. This also works by team, we can simply use diferent funcions for each team thus changing their behavior in a simple way. 
We also separated most features in to fuctions in a effort to also clean up the code. Like player creation, movement and more.

## Endless game loop bug
When 3 player are hunting each other there is a good chance that they might keep chasing each other in a endless loop since every player has the same speed. 


https://github.com/user-attachments/assets/6c010c3c-54ad-4630-ad42-1f8dba01dfc3

To solve this we created a fatigue system that checks if a player has a hunter chasing him for a extended period of time, and if he does, a fatigue value is added and the speed of the hunted player is decreased. This, together with hunting strategies changes avoid the game to fall in to a endless loop.

## Strategies Used
Every team uses diferent Rule-Based AI which is a common strategy used in old games, like Pac-Man, and is a very efficient and simple strategy to implement an AI system.

### Red Team

The red team tries to predict the prey's future position instead of simply chasing it. The predicted distance is 40% of the distance to the prey, allowing for a rapid approach when far away and a more cautious one as it gets closer. When it is already too close to the prey, it chases it directly without trying to predict its position.

As an escape strategy, the red team players try to evade the predators by moving at 60º angles relative to the predator. However, if the predator is too close, they flee in a straight line.

### Green Team

The main differentiator of the green team's strategy is taking advantage of the random position assignment that occurs when a player hits one of the walls. To do this, when a predator is nearby, the player looks for the nearest wall, and if it is close enough, heads directly towards it.

For hunting, the green team also uses the predicting strategy. And has a Pack-Hunting Strategy, which avoids players hunting the same player. To do this the attackers hunted player is stored in a new field in the main structure and in the movement function we check if a player from the hunted team is already being hunted and if it is the current hunter does not hunt him. 

### Blue Team

The blue team uses a vector addition strategy, assigning them the appropriate weights. Hunting always has a constant weight, while fleeing becomes more urgent the closer the predator gets. If the predator is too far away, the weight for fleeing will be 0. However, if the predator is very close, the player abandons this strategy and flees at 90º angles.

# Result


https://github.com/user-attachments/assets/4f07d7fe-24e0-4f25-8d9c-f906561a6b0c

# Ps 
If you need a wallpaper we made one accidentally.


https://github.com/user-attachments/assets/8662e0cf-6b5d-4496-afb2-fb7dacabaa09



