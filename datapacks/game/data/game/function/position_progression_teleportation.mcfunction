tag @e remove instant_progression
tag @e remove instant_progression_done

execute as @e[tag=move_by_teleportation] at @s if score @s game.data.mob.ticks_left_until_next_anchor matches ..0 run tag @s add instant_progression
execute as @e[tag=move_by_teleportation] at @s if entity @e[tag=path_start,distance=..0.5] run tag @s remove instant_progression
execute if entity @e[tag=instant_progression] run function game:position_progression_teleportation_sub