scoreboard objectives add game.mechanism.position_progression_block_count dummy
scoreboard objectives add game.mechanism.cur_position dummy

execute as @e[tag=mob] at @s run scoreboard players operation @s game.mechanism.position_progression_block_count = #global const.1000000
execute as @e[tag=mob] at @s run scoreboard players operation @s game.mechanism.position_progression_block_count /= @s game.data.mob.ticks_per_block

#if the mob is currently slowed down then halve the distance moving
    execute as @e[tag=mob] at @s if score @s game.data.mob.slowness_remaining_duration matches 1.. run scoreboard players operation @s game.mechanism.position_progression_block_count /= #global const.2
    #along with visual effects
    execute as @e[tag=mob] at @s if score @s game.data.mob.slowness_remaining_duration matches 1.. run particle item_slime ~ ~ ~ 0 0 0 0.1 5

execute as @e[tag=mob,tag=x] at @s store result score @s game.mechanism.cur_position run data get entity @s Pos[0] 1000000
execute as @e[tag=mob,tag=z] at @s store result score @s game.mechanism.cur_position run data get entity @s Pos[2] 1000000

execute as @e[tag=mob,tag=-] at @s run scoreboard players operation @s game.mechanism.position_progression_block_count *= #global const.-1

execute as @e[tag=mob] at @s run scoreboard players operation @s game.mechanism.cur_position += @s game.mechanism.position_progression_block_count

execute as @e[tag=x,tag=mob,tag=!obstructed,tag=!riding,tag=!reached_the_end,tag=!move_by_teleportation] at @s if score @s game.data.mob.ticks_left_until_next_anchor matches 1.. store result entity @s Pos[0] double 0.000001 run scoreboard players get @s game.mechanism.cur_position
execute as @e[tag=z,tag=mob,tag=!obstructed,tag=!riding,tag=!reached_the_end,tag=!move_by_teleportation] at @s if score @s game.data.mob.ticks_left_until_next_anchor matches 1.. store result entity @s Pos[2] double 0.000001 run scoreboard players get @s game.mechanism.cur_position