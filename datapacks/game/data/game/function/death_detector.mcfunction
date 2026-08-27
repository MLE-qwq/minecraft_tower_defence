#this function detects whether a player has died and if so processes the game over event

execute if entity @a[scores={game.state.player_dead=1}] run tellraw @a "\u00a7cYou failed the level!"
#execute if entity @a[scores={game.state.player_dead=1}] run title @a title "\u00a7cYou Died!"
execute if entity @a[scores={game.state.player_dead=1}] run title @a subtitle ""

execute if entity @a[scores={game.state.player_dead=1}] run function game:quit_level
execute if entity @a[scores={game.state.player_dead=1}] run schedule function game:tick_after_death 1 append

execute if entity @a[scores={game.state.player_dead=1}] run scoreboard players set * game.state.player_dead 0