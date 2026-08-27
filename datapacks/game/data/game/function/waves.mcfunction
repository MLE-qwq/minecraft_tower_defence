#this function processes the waves of mobs

difficulty normal

#progresses mob spawn cooldown
    execute if score #global game.mechanism.mob_spawn_cd matches 1.. run scoreboard players remove #global game.mechanism.mob_spawn_cd 1

#processes mob position progression
    #renews position anchor cd
        #as for the mobs being slowed down skip cd renewing if current tick is odd (%2==1)
            scoreboard objectives add _ dummy
            scoreboard players operation #global _ = #global game.mechanism.active_ticks
            scoreboard players operation #global _ %= #global const.2
        execute as @e[tag=mob,tag=!obstructed,tag=!riding] at @s if score @s game.data.mob.slowness_remaining_duration matches ..0 run scoreboard players remove @s game.data.mob.ticks_left_until_next_anchor 1
        execute as @e[tag=mob,tag=!obstructed,tag=!riding] at @s if score @s game.data.mob.slowness_remaining_duration matches 1.. if score #global _ matches 0 run scoreboard players remove @s game.data.mob.ticks_left_until_next_anchor 1
        #renewing slowness remaining duration
            execute as @e[tag=mob] at @s if score @s game.data.mob.slowness_remaining_duration matches 1.. run scoreboard players remove @s game.data.mob.slowness_remaining_duration 1
            
    function game:assign_rotation_tags
    function game:position_progression
    function game:position_progression_teleportation
    execute as @e[tag=mob] at @s if score @s game.data.mob.ticks_left_until_next_anchor matches ..0 run tp @s @n[tag=path_block]
    execute as @e[tag=mob] at @s if score @s game.data.mob.ticks_left_until_next_anchor matches ..0 if entity @e[tag=path_tracker,distance=..0.5] run tag @s add reached_the_end
    execute as @e[tag=mob] at @s if score @s game.data.mob.ticks_left_until_next_anchor matches ..0 run tp @s ~ ~1 ~
    execute as @e[tag=mob] at @s if score @s game.data.mob.ticks_left_until_next_anchor matches ..0 if entity @e[tag=path_tracker,distance=..0.5] run scoreboard players set @s game.data.mob.ticks_left_until_next_anchor 2147483647

    execute as @e[tag=mob,tag=reached_the_end] at @s run tp @s @e[tag=path_ending,limit=1]
    execute as @e[tag=mob,tag=reached_the_end] at @s run tp @s ~ ~1 ~
    function hardcode:cont.special.water_behavior
    #once mob reaches the end of the path
        execute if entity @a[nbt={HurtTime:0s}] run tag @e[tag=mob,tag=reached_the_end,limit=1] add settlement_selected
        #removing mob from any team
            team leave @e[tag=settlement_selected]
        #applies poisioning state when applicable
            execute if entity @e[tag=settlement_selected,tag=venomous] unless score #global game.data.poisoning matches 1 run scoreboard players set #global game.data.poisoning 2
        #damages the player(s)
            execute as @a at @s run damage @s 2 mob_attack by @e[tag=settlement_selected,type=!marker,tag=!being_ridden,limit=1]
            execute as @a at @s run damage @s 4 mob_attack by @e[tag=settlement_selected,type=!marker,tag=being_ridden,limit=1]
            execute as @e[tag=settlement_selected,type=marker,limit=1] at @s as @a run damage @s 2 mob_attack by @n[tag=display_entity]
        #damages the mannequin
            execute as @e[tag=settlement_selected] at @s run damage @e[tag=npc,limit=1] 1 out_of_world
        #tps the mob away and kills it
            execute as @e[tag=settlement_selected,tag=being_ridden] at @s run tp @n[tag=riding] 0 -100 0
            execute as @e[tag=settlement_selected] at @s run tp @s 0 -100 0
            execute as @e[tag=settlement_selected,tag=being_ridden] at @s run kill @n[tag=riding]
            execute as @e[tag=settlement_selected,tag=entity_anchor] at @s run function game:entity_pairing with entity @s
            kill @e[tag=settlement_selected]

    execute as @e[tag=mob] at @s if score @s game.data.mob.ticks_left_until_next_anchor matches ..0 run scoreboard players operation @s game.data.mob.ticks_left_until_next_anchor = @s game.data.mob.ticks_per_block

#wave init
    #applies poison damage to the player
        execute if score #global game.state.waves_have_started matches 2 if score #global game.data.poisoning matches 1.. as @a at @s run damage @s 2 dry_out
    
    #resets mob uuid - used for pairing mobs that involve multiple entities
        execute if score #global game.state.waves_have_started matches 2 run scoreboard players set #global game.data.mob_uuid 1

    #announce wave starting and wave number
        execute if score #global game.state.waves_have_started matches 2 run scoreboard players add #global game.state.current_wave 1
        execute if score #global game.state.waves_have_started matches 2 run title @a title ""
        execute if score #global game.state.waves_have_started matches 2 run title @a subtitle ["\u00a7bWave ",{"score":{"name":"#global","objective":"game.state.current_wave"},"color":"#ffff00"},"\u00a7b of ",{"score":{"name":"#global","objective":"game.state.total_waves"},"color":"#ffff00"},"\u00a7r\u00a7r\u00a7r"]
        execute if score #global game.state.waves_have_started matches 2 as @a at @s run playsound ambient.cave ambient @s ~ ~ ~
        execute if score #global game.state.waves_have_started matches 2 run scoreboard players set #global game.mechanism.mob_spawn_cd 30
    
    #tags all instruction markers for the current wave "current_wave"
        execute if score #global game.state.waves_have_started matches 2 as @e[tag=wave_data] at @s if score @s game.data.wave.wave_number = #global game.state.current_wave run tag @s add current_wave

    #generates bossbar
        execute if score #global game.state.waves_have_started matches 2 run bossbar remove current_wave
        execute if score #global game.state.waves_have_started matches 2 run bossbar add current_wave ["\u00a7bWave ",{"score":{"name":"#global","objective":"game.state.current_wave"},"color":"#ffff00"},"\u00a7b of ",{"score":{"name":"#global","objective":"game.state.total_waves"},"color":"#ffff00"},"\u00a7r\u00a7r\u00a7r"]
        execute if score #global game.state.waves_have_started matches 2 run bossbar set current_wave color red
        
        #counts the total number of mobs in this wave summing from all instruction markers with current_wave tag
            scoreboard players set #global game.data.wave.mob_count 0
            execute if score #global game.state.waves_have_started matches 2 as @e[tag=current_wave] at @s run scoreboard players operation #global game.data.wave.mob_count += @s game.data.wave.mob_count

        execute if score #global game.state.waves_have_started matches 2 store result bossbar current_wave max run scoreboard players get #global game.data.wave.mob_count
        execute if score #global game.state.waves_have_started matches 2 run bossbar set current_wave visible true
        execute if score #global game.state.waves_have_started matches 2 run bossbar set current_wave players @a
    
    #resets number of mobs trapped of trapdoors
        execute if score #global game.state.waves_have_started matches 2 as @e[tag=cont,tag=trapdoor] at @s run scoreboard players set @s game.data.cont.mobs_trapped 0

    #finishing up
        execute if score #global game.state.waves_have_started matches 2 run scoreboard players set #global game.state.waves_have_started 1

#updates bossbar
    scoreboard objectives add game.mechanism.mobs_remaining dummy
    scoreboard players set #global game.mechanism.mobs_remaining 0
    execute as @e[tag=current_wave] at @s run scoreboard players operation #global game.mechanism.mobs_remaining += @s game.data.wave.mob_count
    execute as @e[tag=mob] at @s run scoreboard players add #global game.mechanism.mobs_remaining 1
    execute store result bossbar current_wave value run scoreboard players get #global game.mechanism.mobs_remaining


#mob spawning
    tag @e[tag=current_wave] remove current_instructor_chosen
    tag @e[tag=current_wave,sort=random,limit=1] add current_instructor_chosen
    
    tag @e[tag=mob_spawnpoint] remove current_spawnpoint_chosen
    execute as @e[tag=mob_spawnpoint] at @s if score @e[tag=current_instructor_chosen,limit=1] game.data.wave.mob_spawnpoint = @s game.data.spawnpoint.mob_spawnpoint run tag @s add current_spawnpoint_chosen
    execute if score @e[tag=current_instructor_chosen,limit=1] game.data.wave.mob_spawnpoint matches -1 run tag @e[tag=mob_spawnpoint,sort=random,limit=1] add current_spawnpoint_chosen

    function hardcode:mob.spawning
    
    execute if score #global game.mechanism.mob_spawn_cd matches ..0 run scoreboard players add #global game.data.mob_uuid 1

    execute as @e[tag=mob,tag=newbie] at @s run tp @s ~ ~1 ~

    #copies the scoreboard of the wave data marker to the mob
        execute if score #global game.mechanism.mob_spawn_cd matches ..0 run scoreboard players operation @e[tag=mob,tag=newbie] game.data.health = @e[tag=current_instructor_chosen,limit=1] game.data.wave.mob_health
        execute if score #global game.mechanism.mob_spawn_cd matches ..0 run scoreboard players operation @e[tag=mob,tag=newbie] game.data.max_health = @e[tag=current_instructor_chosen,limit=1] game.data.wave.mob_health
        execute if score #global game.mechanism.mob_spawn_cd matches ..0 run scoreboard players operation @e[tag=mob,tag=newbie] game.data.mob.has_mercy = @e[tag=current_instructor_chosen,limit=1] game.data.wave.mob_has_mercy
        execute if score #global game.mechanism.mob_spawn_cd matches ..0 run scoreboard players set @e[tag=mob,tag=newbie] game.data.mob.ticks_left_until_next_anchor 0
        execute if score #global game.mechanism.mob_spawn_cd matches ..0 run scoreboard players set @e[tag=mob,tag=newbie] game.data.mob.slowness_remaining_duration 0

    #atmospheric effects and misc
        execute if score #global game.mechanism.mob_spawn_cd matches ..0 as @e[tag=mob,tag=newbie] at @s run particle minecraft:flame ~ ~ ~ 0 0 0 0.1 25
        execute if score #global game.mechanism.mob_spawn_cd matches ..0 as @e[tag=mob,tag=newbie] at @s run playsound minecraft:block.trial_spawner.spawn_mob ambient @a ~ ~ ~

    #removes newbie tag of the new mob
        execute if score #global game.mechanism.mob_spawn_cd matches ..0 run tag @e[tag=mob,tag=newbie] remove newbie

    #deducts the mob count of the wave data marker by 1 and if reached 0 remove the marker
        execute if score #global game.mechanism.mob_spawn_cd matches ..0 run scoreboard players remove @e[tag=current_instructor_chosen,limit=1] game.data.wave.mob_count 1
        execute if score #global game.mechanism.mob_spawn_cd matches ..0 if score @e[tag=current_instructor_chosen,limit=1] game.data.wave.mob_count matches ..0 run kill @e[tag=current_instructor_chosen,limit=1]

    #resets mob spawn cooldown timer
        execute if score #global game.mechanism.mob_spawn_cd matches ..0 run scoreboard players set #global game.mechanism.mob_spawn_cd 20

#if wave data marker of current wave and all mobs are gone no longer exists then the wave is finished
    execute unless entity @e[tag=mob] unless entity @e[tag=current_wave] run scoreboard players set #global game.state.waves_have_started 0

    #if current wave not the last wave
        execute unless entity @e[tag=mob] unless entity @e[tag=current_wave] if score #global game.state.current_wave < #global game.state.total_waves run time set 11200
        #20 seconds preparation time till next wave
        execute unless entity @e[tag=mob] unless entity @e[tag=current_wave] if score #global game.state.current_wave < #global game.state.total_waves run scoreboard players set #global game.mechanism.timer 400
        
    #if current wave is the last wave
        execute unless entity @e[tag=mob] unless entity @e[tag=current_wave] if score #global game.state.current_wave >= #global game.state.total_waves run scoreboard players set #global game.state 0

        execute unless entity @e[tag=mob] unless entity @e[tag=current_wave] if score #global game.state.current_wave >= #global game.state.total_waves run function hardcode:level.end

        execute unless entity @e[tag=mob] unless entity @e[tag=current_wave] if score #global game.state.current_wave >= #global game.state.total_waves run function game:quit_level
        execute unless entity @e[tag=mob] unless entity @e[tag=current_wave] if score #global game.state.current_wave >= #global game.state.total_waves run tellraw @a "\u00a7aCongrats! You finished the level!"
        execute unless entity @e[tag=mob] unless entity @e[tag=current_wave] if score #global game.state.current_wave >= #global game.state.total_waves run title @a title "\u00a76\u00a7lVICTORY!"
        execute unless entity @e[tag=mob] unless entity @e[tag=current_wave] if score #global game.state.current_wave >= #global game.state.total_waves run title @a subtitle ""
        execute unless entity @e[tag=mob] unless entity @e[tag=current_wave] if score #global game.state.current_wave >= #global game.state.total_waves as @a at @s run playsound minecraft:ui.toast.challenge_complete master @s ~ ~ ~

#processes mob & cont behavior
    function hardcode:generic.mob_cont_behavior