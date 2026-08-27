execute unless entity @e[tag=instant_progression_processing] run tag @e[tag=instant_progression,tag=!instant_progression_done,limit=1] add instant_progression_processing

execute as @e[tag=instant_progression_processing] at @s run tp @s ^ ^ ^1
execute as @e[tag=instant_progression_processing] at @s positioned ~ ~-1 ~ if entity @e[tag=path_block,distance=..0.5] run return run function game:position_progression_teleportation_sub

execute as @e[tag=instant_progression_processing] at @s run tp @s ^ ^ ^-1

execute as @e[tag=instant_progression_processing,tag=!seen_ending] at @s positioned ~ ~-1 ~ if entity @e[tag=path_ending,distance=..0.5] positioned ~ ~1 ~ run tag @s add seen_ending_tmp
execute as @e[tag=instant_progression_processing,tag=seen_ending_tmp] at @s run tp @s ^ ^ ^-1

tag @e[tag=seen_ending_tmp] add seen_ending
tag @e[tag=seen_ending_tmp] remove seen_ending_tmp

execute as @e[tag=instant_progression_processing] at @s run playsound entity.enderman.teleport hostile @a ~ ~ ~

#execute as @e[tag=instant_progression_processing] at @s run summon armor_stand
execute as @e[tag=instant_progression_processing] at @s run tag @s add instant_progression_done
execute as @e[tag=instant_progression_processing] at @s run tag @s remove instant_progression_processing

execute if entity @e[tag=instant_progression,tag=!instant_progression_done] run function game:position_progression_teleportation_sub