#dispenser gui removal
    scoreboard objectives add game.mechanism.dispenser_interaction minecraft.custom:minecraft.inspect_dispenser
    execute as @a at @s if score @s game.mechanism.dispenser_interaction matches 1.. as @e[tag=disp] at @s run setblock ~ ~-1 ~ air
    execute as @a at @s if score @s game.mechanism.dispenser_interaction matches 1.. as @e[tag=disp] at @s run setblock ~ ~-1 ~ minecraft:dispenser
    scoreboard players set * game.mechanism.dispenser_interaction 0

#chest gui removal
    scoreboard objectives add game.mechanism.chest_interaction minecraft.custom:minecraft.open_chest
    execute as @a at @s if score @s game.mechanism.chest_interaction matches 1.. as @e[tag=bonus_chest] at @s run setblock ~ ~1 ~ air
    execute as @a at @s if score @s game.mechanism.chest_interaction matches 1.. as @e[tag=bonus_chest] at @s run setblock ~ ~1 ~ minecraft:chest
    scoreboard players set * game.mechanism.chest_interaction 0

#detects sneaking - feature unused
    scoreboard objectives add game.mechanism.sneaking dummy

    scoreboard objectives add game.mechanism.player_sneak_time minecraft.custom:minecraft.sneak_time
    scoreboard objectives add game.mechanism.player_sneak_time_prev dummy
    scoreboard objectives add game.mechanism.player_sneak_time_prev_2 dummy
    scoreboard players set @a game.mechanism.sneaking 0
    execute as @a at @s unless score @s game.mechanism.player_sneak_time = @s game.mechanism.player_sneak_time_prev if score @s game.mechanism.player_sneak_time_prev = @s game.mechanism.player_sneak_time_prev_2 run scoreboard players set @s game.mechanism.sneaking 1
    execute as @a at @s store result score @s game.mechanism.player_sneak_time_prev_2 run scoreboard players get @s game.mechanism.player_sneak_time_prev
    execute as @a at @s store result score @s game.mechanism.player_sneak_time_prev run scoreboard players get @s game.mechanism.player_sneak_time