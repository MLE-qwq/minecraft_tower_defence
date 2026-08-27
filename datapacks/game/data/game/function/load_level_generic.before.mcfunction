#removing leftover entities
    tp @e[tag=block_outline] 0 -100 0
    tp @e[tag=block_outline2] 0 -100 0
    kill @e[tag=block_outline]
    kill @e[tag=block_outline2]
    kill @e[tag=terrain_origin]
    kill @e[tag=path_start]
    kill @e[tag=path_ending]
    kill @e[tag=path_tracker]
    kill @e[tag=path_tester]
    kill @e[tag=path_block]
    kill @e[tag=mob_spawnpoint]
    kill @e[tag=health_display]
    kill @e[tag=projectile]
    kill @e[tag=auto_replace]
    kill @e[tag=bonus_chest]
    kill @e[tag=bonus_chest_display]
    kill @e[tag=batch_sub]
    kill @e[tag=path_forbidden]
    kill @e[tag=path_validity]
    
    tp @e[tag=display_entity] 0 -100 0
    kill @e[tag=display_entity]
    
    kill @e[tag=cont]
    kill @e[tag=wave_data]

    tp @e[tag=npc] 0 -100 0
    kill @e[tag=npc]

    tp @e[tag=mob] 0 -100 0
    kill @e[tag=mob]

scoreboard players set #global game.mechanism.active_ticks 0

#wave data init
    scoreboard objectives add game.data.wave.mob_count dummy
    scoreboard objectives add game.data.wave.mob_type dummy
    scoreboard objectives add game.data.wave.mob_health dummy
    scoreboard objectives add game.data.wave.mob_spawnpoint dummy
    scoreboard objectives add game.data.wave.mob_has_mercy dummy
    scoreboard objectives add game.data.wave.wave_number dummy
    
    scoreboard players set #global game.state.current_wave 0

#resets player death
    scoreboard players set @a game.state.player_dead 0
    scoreboard players set * game.state.player_dead 0

#resets purchase info
    scoreboard players set @a game.trigger.purchase 0
    scoreboard players set * game.trigger.purchase 0

#pauses time if enabled in settings
    execute if score #global game.saves.pause_upon_join matches 1 run scoreboard players set #global game.state.paused 1
    execute unless score #global game.saves.pause_upon_join matches 1 run scoreboard players set #global game.state.paused 0

#clears operations to be done
    scoreboard players set @a game.trigger.operation 0
    scoreboard players set * game.trigger.operation 0

#removes bossbar
    bossbar remove current_wave

#removes poisoning state
    scoreboard players set #global game.data.poisoning 0
    effect clear @a poison

#removes items
    clear @a
    item replace entity @a player.cursor with air
    kill @e[type=item]

#sets player max health
    execute as @a at @s run attribute @s minecraft:max_health base set 14

#displaying instructions in chat
    tellraw @a "\n\u00a7d-----------------------------------------------------"

#removes mannequin of MLE_qwq the author
    tp @e[tag=npc0] 0 -100 0
    kill @e[tag=npc0]