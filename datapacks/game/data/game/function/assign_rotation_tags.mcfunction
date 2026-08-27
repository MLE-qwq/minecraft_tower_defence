tag @e[tag=mob] add rotation_assignment

tag @e[tag=rotation_assignment] remove +x
tag @e[tag=rotation_assignment] remove -x
tag @e[tag=rotation_assignment] remove +z
tag @e[tag=rotation_assignment] remove -z
tag @e[tag=rotation_assignment] remove x
tag @e[tag=rotation_assignment] remove z
tag @e[tag=rotation_assignment] remove -
execute as @e[tag=rotation_assignment,y_rotation=-45..45] at @s run tag @s add +z
execute as @e[tag=rotation_assignment,y_rotation=-45..45] at @s run tag @s add z
execute as @e[tag=rotation_assignment,y_rotation=45..135] at @s run tag @s add -x
execute as @e[tag=rotation_assignment,y_rotation=45..135] at @s run tag @s add x
execute as @e[tag=rotation_assignment,y_rotation=45..135] at @s run tag @s add -
execute as @e[tag=rotation_assignment,y_rotation=135..-135] at @s run tag @s add -z
execute as @e[tag=rotation_assignment,y_rotation=135..-135] at @s run tag @s add z
execute as @e[tag=rotation_assignment,y_rotation=135..-135] at @s run tag @s add -
execute as @e[tag=rotation_assignment,y_rotation=-135..-45] at @s run tag @s add +x
execute as @e[tag=rotation_assignment,y_rotation=-135..-45] at @s run tag @s add x

tag @e[tag=rotation_assignment] remove rotation_assignment
