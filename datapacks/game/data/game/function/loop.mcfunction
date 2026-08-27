#processing time pause
    execute as @a at @s if score @s game.trigger.operation matches -2 run scoreboard players add #global game.state.paused 1
    execute if score #global game.state.paused matches 2.. run scoreboard players set #global game.state.paused 0
    #announcing which player paused/resumed time
        execute as @a at @s if score @s game.trigger.operation matches -2 if score #global game.state.paused matches 0 run tellraw @a ["",{"selector":"@s"},"\u00a7e has \u00a7aresumed \u00a7etime."]
        execute as @a at @s if score @s game.trigger.operation matches -2 if score #global game.state.paused matches 1 run tellraw @a ["",{"selector":"@s"},"\u00a7e has \u00a7cpaused \u00a7etime."]
    execute as @a at @s if score @s game.trigger.operation matches -2 if score #global game.state.paused matches 0 as @a at @s run playsound minecraft:entity.enderman.teleport master @s ~ ~ ~ 1 1
    execute as @a at @s if score @s game.trigger.operation matches -2 if score #global game.state.paused matches 1 as @a at @s run playsound minecraft:entity.enderman.teleport master @s ~ ~ ~ 1 0.5
    execute if score #global game.state.paused matches 1 run title @a actionbar "\u00a7cTime paused. Operate in game menu to resume." 
    execute as @a at @s if score @s game.trigger.operation matches -2 run scoreboard players set @s game.trigger.operation 0

    execute if score #global game.mechanism.timer matches ..0 if score #global game.state.waves_have_started matches 0 run scoreboard players set #global game.state.waves_have_started 2

#starting other functions
    execute if score #global game.state matches 0 run function game:game_menu
    execute if score #global game.state matches 1 run function game:path_construction
    execute if score #global game.state matches 2 run function game:contraption_placement
    execute if score #global game.state matches 1..2 run function game:players_joining_or_quitting_within_a_round
    execute if score #global game.state matches 1..2 run function game:raycasting_main
    execute if score #global game.state.paused matches 0 if score #global game.state matches 1..2 if score #global game.state.waves_have_started matches 1.. run function game:waves
    execute if score #global game.state matches 1..2 run function game:death_detector

    execute if score #global game.state matches 1..2 run function hardcode:level.special_effects
    execute if score #global game.state matches 1..2 run function game:interactions
#gives players night vision if enabled in settings
    execute if score #global game.saves.night_vision matches 1 run effect give @a night_vision infinite 255 true
    execute unless score #global game.saves.night_vision matches 1 run effect clear @a night_vision

#disabling offhand and crafting slots
    item replace entity @a weapon.offhand with air

#syncing previous state with current state, such that when they are different the subfunction knows that it needs to initialize
    scoreboard players operation #global game.state_prev = #global game.state

scoreboard players add #global game.mechanism.active_ticks 1
function game:easter_eggs