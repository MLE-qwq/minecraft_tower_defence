#resets terrain
    execute as @e[tag=terrain_origin,limit=1] at @s run clone ~ ~ ~ ~32 ~17 ~32 -16 0 -16

#kills markers & block outline
    tp @e[tag=block_outline] 0 -100 0
    tp @e[tag=block_outline2] 0 -100 0
    tp @e[tag=npc] 0 -100 0
    tp @e[tag=display_entity] 0 -100 0
    tp @e[tag=mob] 0 -100 0
    effect clear @e[tag=block_outline] minecraft:glowing
    effect clear @e[tag=block_outline2] minecraft:glowing
    kill @e[tag=block_outline]
    kill @e[tag=block_outline2]
    kill @e[tag=npc]
    kill @e[tag=terrain_origin]
    kill @e[tag=path_start]
    kill @e[tag=path_ending]
    kill @e[tag=path_tracker]
    kill @e[tag=path_tester]
    kill @e[tag=path_block]
    kill @e[tag=mob_spawnpoint]
    kill @e[tag=projectile]
    kill @e[tag=auto_replace]
    kill @e[tag=bonus_chest]
    kill @e[tag=bonus_chest_display]
    kill @e[tag=batch_sub]
    kill @e[tag=display_entity]
    kill @e[tag=path_forbidden]
    kill @e[tag=path_validity]

    kill @e[tag=health_display]
    kill @e[tag=cont]
    kill @e[tag=wave_data]

    tp @e[tag=mob] 0 -100 0
    kill @e[tag=mob]

    time set 0

#clears items from players
    clear @a
    item replace entity @a player.cursor with air
    kill @e[type=item]

#removes bossbar
    bossbar remove current_wave

#resets scoreboards
    scoreboard players set #global game.state 0
    scoreboard players set #global game.state.waves_have_started 0
    scoreboard players set #global game.level 0
    scoreboard players set @a game.trigger.level_chosen 0
    scoreboard players set * game.trigger.level_chosen 0

    scoreboard players set #global game.state.paused 0
    title @a actionbar ""

#removes poisoning state
    scoreboard players set #global game.data.poisoning 0
    effect clear @a poison