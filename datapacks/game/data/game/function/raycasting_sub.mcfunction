#this function belongs to raycasting_main

#init
execute unless entity @e[tag=raycaster,tag=!newbie] run summon marker 0 0 0 {Tags:["raycaster","newbie"],CustomName:"Raycaster"}
execute unless entity @e[tag=raycaster,tag=!newbie] as @a[tag=raycast_target_player,limit=1] at @s run tp @e[tag=raycaster] ~ ~1.5 ~ ~ ~
tag @e[tag=raycaster,tag=newbie] remove newbie

#raycast step
tag @e remove raycast_selected
execute as @e[tag=raycaster] at @s run tp @s ^ ^ ^0.25
execute as @e[tag=raycaster] at @s unless entity @a[distance=..12] run kill @s

execute as @e[tag=raycaster] at @s positioned ~ ~-0.5 ~ if entity @e[tag=health_tracking,distance=..0.75,tag=cont] run tag @n[tag=health_tracking,tag=cont] add raycast_selected
execute unless entity @e[tag=raycast_selected] as @e[tag=raycaster] at @s positioned ~ ~-0.5 ~ if entity @e[tag=health_tracking,distance=..1.5,tag=!cont] run tag @n[tag=health_tracking,tag=!cont] add raycast_selected

#upon hit
    execute if entity @e[tag=raycast_selected] as @e[tag=health_display] at @s if score @s game.data.uuid = @a[tag=raycast_target_player,limit=1] game.data.uuid run tag @s add newbie

    execute as @e[tag=raycast_selected] at @s run tp @e[tag=health_display,tag=newbie] ~ ~2 ~
    
    #adjusting the height of the label depending on the target type (health bar position = hitbox height + 0.1)
        execute as @e[tag=raycast_selected,tag=cont] at @s run tp @e[tag=health_display,tag=newbie] ~ ~1.1 ~
        execute as @e[tag=raycast_selected,tag=cont,tag=disp] at @s run tp @e[tag=health_display,tag=newbie] ~ ~0.2 ~
        execute as @e[tag=raycast_selected,tag=cont,tag=trapdoor] at @s run tp @e[tag=health_display,tag=newbie] ~ ~0.2 ~

        execute as @e[tag=raycast_selected,type=creeper] at @s run tp @e[tag=health_display,tag=newbie] ~ ~1.8 ~
        execute as @e[tag=raycast_selected,type=wolf] at @s run tp @e[tag=health_display,tag=newbie] ~ ~0.95 ~
        execute as @e[tag=raycast_selected,type=zombie] at @s run tp @e[tag=health_display,tag=newbie] ~ ~2.05 ~
        execute as @e[tag=raycast_selected,type=skeleton] at @s run tp @e[tag=health_display,tag=newbie] ~ ~2.09 ~
        execute as @e[tag=raycast_selected,type=spider] at @s run tp @e[tag=health_display,tag=newbie] ~ ~1.0 ~
        execute as @e[tag=raycast_selected,type=silverfish,tag=!batch_main] at @s run tp @e[tag=health_display,tag=newbie] ~ ~0.4 ~
        execute as @e[tag=raycast_selected,type=silverfish,tag=batch_main] at @s run tp @e[tag=health_display,tag=newbie] ~ ~0.8 ~
        execute as @e[tag=raycast_selected,type=slime,nbt={attributes:[{id:"minecraft:scale",base:2.0d}]}] at @s run tp @e[tag=health_display,tag=newbie] ~ ~1.1 ~
        execute as @e[tag=raycast_selected,type=slime,nbt={attributes:[{id:"minecraft:scale",base:1.5d}]}] at @s run tp @e[tag=health_display,tag=newbie] ~ ~0.85 ~
        execute as @e[tag=raycast_selected,type=slime,nbt={attributes:[{id:"minecraft:scale",base:1.0d}]}] at @s run tp @e[tag=health_display,tag=newbie] ~ ~0.6 ~
        execute as @e[tag=raycast_selected,type=enderman] at @s run tp @e[tag=health_display,tag=newbie] ~ ~3.0 ~
        execute as @e[tag=raycast_selected,type=cave_spider] at @s run tp @e[tag=health_display,tag=newbie] ~ ~1.0 ~
        
    execute if entity @e[tag=raycast_selected,tag=!cont] run data merge entity @e[tag=health_display,tag=newbie,limit=1] {billboard:"center","text":[{"score":{"name":"@n[tag=raycast_selected]","objective":"game.data.health"},"color":"red"},"\u00a7c / ",{"score":{"name":"@n[tag=raycast_selected]","objective":"game.data.max_health"},"color":"red"},"\u2665"]}
    execute if entity @e[tag=raycast_selected,tag=cont] run data merge entity @e[tag=health_display,tag=newbie,limit=1] {billboard:"center","text":[{"score":{"name":"@n[tag=raycast_selected]","objective":"game.data.health"},"color":"aqua"},"\u00a7b / ",{"score":{"name":"@n[tag=raycast_selected]","objective":"game.data.max_health"},"color":"aqua"},"\u2665"]}

    tag @e[tag=health_display,tag=newbie] add hd_processed
    tag @e[tag=health_display] remove newbie


execute if entity @e[tag=raycast_selected] run kill @e[tag=raycaster]
execute as @e[tag=raycaster] at @s unless block ~ 0 ~ bedrock run kill @s
execute as @e[tag=raycaster] at @s if entity @a[tag=raycast_debug] run particle minecraft:happy_villager ~ ~ ~

execute unless entity @e[tag=raycast_selected] as @e[tag=raycaster] at @s if block ~ 0 ~ bedrock run function game:raycasting_sub