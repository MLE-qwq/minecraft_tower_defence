#gamerules
    gamerule advance_time false
    gamerule advance_weather false
    gamerule allow_entering_nether_using_portals false
    gamerule drowning_damage false
    gamerule entity_drops false
    gamerule fall_damage true
    gamerule fire_damage true
    gamerule freeze_damage false
    gamerule immediate_respawn false
    gamerule keep_inventory true
    gamerule mob_drops false
    gamerule mob_griefing false
    gamerule natural_health_regeneration false
    gamerule pvp false
    gamerule players_sleeping_percentage 101
    gamerule show_death_messages true
    gamerule spawn_mobs false
    gamerule spawn_monsters false
    gamerule spawn_patrols false
    gamerule spawn_phantoms false
    gamerule spawn_wandering_traders false
    gamerule spawn_wardens false
    gamerule spread_vines false
    #switch the following to false after debugging
    #also clear all scoreboard objectives in saves file. better to let them know how to preserve their progress through guiding them copy-paste that file.
        gamerule send_command_feedback true

#end

#scoreboards
    function hardcode:cont.purchase.unlocked_scoreboards
    
    scoreboard objectives add game.level dummy
    scoreboard objectives add game.state dummy
    scoreboard players set #global game.state 0
    scoreboard objectives add game.state_prev dummy
    scoreboard players set #global game.state_prev -1
    scoreboard players set @a game.trigger.level_chosen 0
    scoreboard players set * game.trigger.level_chosen 0
    scoreboard objectives add game.trigger.level_chosen trigger
    
    scoreboard objectives add game.state.current_wave dummy
    scoreboard players set #global game.state.current_wave 0
    scoreboard objectives add game.state.total_waves dummy
    scoreboard objectives add game.state.waves_have_started dummy
    scoreboard players set #global game.state.waves_have_started 0

    scoreboard objectives add game.data.currency dummy
    scoreboard objectives add game.trigger.purchase trigger

    #health does not fall within the mob class since durability of contraptions share the same variable
    scoreboard objectives add game.data.health dummy
    scoreboard objectives add game.data.max_health dummy
    scoreboard objectives add game.data.mob.has_mercy dummy
    scoreboard objectives add game.data.mob.currency_drop dummy
    #the speed of the mob: how many ticks it takes for it to progress one block
        scoreboard objectives add game.data.mob.ticks_per_block dummy
        scoreboard objectives add game.data.mob.ticks_per_block_original dummy
    #once reaches zero, the mob will be anchored onto the next path block marker
        scoreboard objectives add game.data.mob.ticks_left_until_next_anchor dummy
        scoreboard objectives add game.data.spawnpoint.mob_spawnpoint dummy
    #size of slime
        scoreboard objectives add game.data.slime_size dummy

    scoreboard objectives add game.mechanism.mob_spawn_cd dummy

    scoreboard objectives add game.state.player_dead deathCount
    scoreboard players set * game.state.player_dead 0

    scoreboard objectives add game.data.cont.damage_cd dummy

    scoreboard objectives add game.state.paused dummy

    scoreboard objectives add game.data.uuid dummy
    scoreboard objectives add game.data.mob_uuid dummy

    scoreboard objectives add game.data.disp_cont.damage dummy
    scoreboard objectives add game.data.disp_cont.damage_next dummy
    scoreboard objectives add game.data.disp_cont.damage_cost dummy
    scoreboard objectives add game.data.disp_cont.range dummy
    scoreboard objectives add game.data.disp_cont.range_next dummy
    scoreboard objectives add game.data.disp_cont.range_cost dummy
    scoreboard objectives add game.data.disp_cont.fire_rate dummy
    scoreboard objectives add game.data.disp_cont.fire_rate_next dummy
    scoreboard objectives add game.data.disp_cont.fire_rate_cost dummy
    scoreboard objectives add game.data.cont.viscosity dummy
    scoreboard objectives add game.data.cont.viscosity_next dummy
    scoreboard objectives add game.data.cont.viscosity_cost dummy
    scoreboard objectives add game.data.disp_cont.duration dummy
    scoreboard objectives add game.data.disp_cont.duration_next dummy
    scoreboard objectives add game.data.disp_cont.duration_cost dummy
    
    scoreboard objectives add game.data.cont.mobs_trapped dummy
    scoreboard objectives add game.data.cont.capacity dummy
    scoreboard objectives add game.data.cont.capacity_next dummy
    scoreboard objectives add game.data.cont.capacity_cost dummy
    
    scoreboard objectives add game.mechanism.disp_cont.fire_cd dummy
    scoreboard objectives add game.mechanism.projectile.init_xz dummy

    scoreboard objectives add game.data.bonus_chest.currany dummy

    
    scoreboard objectives add game.trigger.operation trigger
    scoreboard players set @a game.trigger.operation 0
    scoreboard players set * game.trigger.operation 0

    scoreboard objectives add game.mechanism.new_currency_display dummy
    scoreboard objectives add game.mechanism.new_currency_display_cd dummy
    scoreboard players set #global game.mechanism.new_currency_display_cd 0

    gamerule max_block_modifications 114514

    
    scoreboard objectives add const.1000000 dummy
    scoreboard players set #global const.1000000 1000000
    scoreboard objectives add const.100 dummy
    scoreboard players set #global const.100 100
    scoreboard objectives add const.80 dummy
    scoreboard players set #global const.80 80
    scoreboard objectives add const.70 dummy
    scoreboard players set #global const.70 70
    scoreboard objectives add const.55 dummy
    scoreboard players set #global const.55 55
    scoreboard objectives add const.40 dummy
    scoreboard players set #global const.40 40
    scoreboard objectives add const.30 dummy
    scoreboard players set #global const.30 30
    scoreboard objectives add const.67 dummy
    scoreboard players set #global const.67 67
    scoreboard objectives add const.35 dummy
    scoreboard players set #global const.35 35
    scoreboard objectives add const.25 dummy
    scoreboard players set #global const.25 25
    scoreboard objectives add const.57 dummy
    scoreboard players set #global const.57 57
    scoreboard objectives add const.45 dummy
    scoreboard players set #global const.45 45
    scoreboard objectives add const.33 dummy
    scoreboard players set #global const.33 33
    scoreboard objectives add const.-1 dummy
    scoreboard players set #global const.-1 -1
    scoreboard objectives add const.10 dummy
    scoreboard players set #global const.10 10
    scoreboard objectives add const.5 dummy
    scoreboard players set #global const.5 5
    scoreboard objectives add const.2 dummy
    scoreboard players set #global const.2 2
    
    scoreboard objectives add game.saves.easter_egg.count dummy
    scoreboard players set #global game.saves.easter_egg.count -1
    scoreboard objectives add game.saves.easter_egg.0 dummy
    scoreboard objectives add game.saves.easter_egg.1 dummy
    execute unless score #global game.saves.easter_egg.0 matches 1 run scoreboard players set #global game.saves.easter_egg.0 0
    execute unless score #global game.saves.easter_egg.1 matches 1 run scoreboard players set #global game.saves.easter_egg.1 0

    scoreboard objectives add game.saves.pause_upon_join dummy
    scoreboard objectives add game.saves.night_vision dummy
    scoreboard objectives add game.saves.display_health_bar_for_contraptions dummy
    execute unless score #global game.saves.pause_upon_join matches 0 run scoreboard players set #global game.saves.pause_upon_join 1
    execute unless score #global game.saves.night_vision matches 1 run scoreboard players set #global game.saves.night_vision 0
    execute unless score #global game.saves.display_health_bar_for_contraptions matches 1 run scoreboard players set #global game.saves.display_health_bar_for_contraptions 0

    scoreboard objectives add game.data.mob.slowness_remaining_duration dummy
    scoreboard objectives add game.data.poisoning dummy

    scoreboard objectives add game.mechanism.active_ticks dummy
    scoreboard players set #global game.mechanism.active_ticks 0

    difficulty normal
#end

function game:quit_level
tellraw @a "\u00a7aInitialized command set."