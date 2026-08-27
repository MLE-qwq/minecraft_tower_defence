#this function tags the mob or contraption being targeted by the crosshair of the player (such that their health could be shown above them)

#adding eligiblility tag to contraptions if enabled in settings
    tag @e[tag=cont] remove health_tracking
    execute if score #global game.saves.display_health_bar_for_contraptions matches 1 run tag @e[tag=cont] add health_tracking
#termination
    execute unless entity @a[tag=!raycast_done] as @e[tag=health_display,tag=!hd_processed] at @s run data merge entity @s {text:""}
    execute unless entity @a[tag=!raycast_done] run return run tag @a remove raycast_done

#init
    execute unless entity @a[tag=raycast_done] run tag @e[tag=health_display] remove hd_processed
    
tag @a[limit=1,tag=!raycast_done] add raycast_target_player

function game:raycasting_sub

tag @a[tag=raycast_target_player] add raycast_done
tag @a remove raycast_target_player

function game:raycasting_main