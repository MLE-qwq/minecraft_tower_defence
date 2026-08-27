#resetting result of level choosing
    execute unless score #global game.state_prev matches 0 run scoreboard players set @a game.trigger.level_chosen 0
    execute unless score #global game.state_prev matches 0 run scoreboard players set * game.trigger.level_chosen 0

#menu-displaying item and its prevention of duping
    scoreboard objectives add game.watchdog.excess_items dummy
    scoreboard players set @a game.watchdog.excess_items 0
    item replace entity @a hotbar.8 with minecraft:compass[minecraft:item_name="Game Menu",lore=["","\u00a7bFunction: Shows game menu.","\u00a7eTrigger: Drop the item."],minecraft:custom_data={id:"show_menu",kill_on_drop:1b}]
    execute as @a at @s store result score @s game.watchdog.excess_items if items entity @s container.* *[minecraft:custom_data~{id:"show_menu"}]
    execute as @a at @s if score @s game.watchdog.excess_items matches 2.. run clear @s *[minecraft:custom_data~{id:"show_menu"}]


#displaying menu
    execute as @e[type=item] if items entity @s contents *[custom_data~{id:"show_menu"}] run dialog show @p game:game_menu
    execute as @e[type=item] if items entity @s contents *[custom_data~{kill_on_drop:1b}] run kill @s

#loading level
    scoreboard players enable @a game.trigger.level_chosen
    execute as @a at @s if score @s game.trigger.level_chosen matches 1.. run tellraw @a ["",{"selector":"@s"},"\u00a7e selected a level."]
    execute as @a at @s if score @s game.trigger.level_chosen matches 1.. run clear @a *[minecraft:custom_data~{id:"show_menu"}]
    execute as @a at @s if score @s game.trigger.level_chosen matches 1.. run scoreboard players operation #global game.level = @s game.trigger.level_chosen
    
    execute as @a at @s if score @s game.trigger.level_chosen matches -1001 run dialog show @s game:level_selection
    execute as @a at @s if score @s game.trigger.level_chosen matches -1002 run dialog show @s game:settings
    execute as @a at @s if score @s game.trigger.level_chosen matches -2999..-2000 run dialog show @s game:settings

    execute as @a at @s if score @s game.trigger.level_chosen matches -2001 run scoreboard players add #global game.saves.night_vision 1
    execute as @a at @s if score @s game.trigger.level_chosen matches -2002 run scoreboard players add #global game.saves.display_health_bar_for_contraptions 1
    execute as @a at @s if score @s game.trigger.level_chosen matches -2003 run scoreboard players add #global game.saves.pause_upon_join 1

    execute if score #global game.saves.pause_upon_join matches 2.. run scoreboard players set #global game.saves.pause_upon_join 0
    execute if score #global game.saves.night_vision matches 2.. run scoreboard players set #global game.saves.night_vision 0
    execute if score #global game.saves.display_health_bar_for_contraptions matches 2.. run scoreboard players set #global game.saves.display_health_bar_for_contraptions 0

    execute as @a at @s if score @s game.trigger.level_chosen matches -2001 if score #global game.saves.night_vision matches 0 run tellraw @a ["",{"selector":"@s"},"\u00a7e has toggled \u00a7bNight Vision \u00a7eto \u00a7cOFF\u00a7e."]
    execute as @a at @s if score @s game.trigger.level_chosen matches -2001 if score #global game.saves.night_vision matches 1 run tellraw @a ["",{"selector":"@s"},"\u00a7e has toggled \u00a7bNight Vision \u00a7eto \u00a7aON\u00a7e."]
    
    execute as @a at @s if score @s game.trigger.level_chosen matches -2002 if score #global game.saves.display_health_bar_for_contraptions matches 0 run tellraw @a ["",{"selector":"@s"},"\u00a7e has toggled \u00a7bDisplay Health Bars for Contraptions \u00a7eto \u00a7cOFF\u00a7e."]
    execute as @a at @s if score @s game.trigger.level_chosen matches -2002 if score #global game.saves.display_health_bar_for_contraptions matches 1 run tellraw @a ["",{"selector":"@s"},"\u00a7e has toggled \u00a7bDisplay Health Bars for Contraptions \u00a7eto \u00a7aON\u00a7e."]

    execute as @a at @s if score @s game.trigger.level_chosen matches -2003 if score #global game.saves.pause_upon_join matches 0 run tellraw @a ["",{"selector":"@s"},"\u00a7e has toggled \u00a7bPause Upon Join \u00a7eto \u00a7cOFF\u00a7e."]
    execute as @a at @s if score @s game.trigger.level_chosen matches -2003 if score #global game.saves.pause_upon_join matches 1 run tellraw @a ["",{"selector":"@s"},"\u00a7e has toggled \u00a7bPause Upon Join \u00a7eto \u00a7aON\u00a7e."]

    execute as @a at @s if score @s game.trigger.level_chosen matches -2001 if score #global game.saves.night_vision matches 0 run playsound entity.experience_orb.pickup master @s ~ ~ ~ 1 0.5
    execute as @a at @s if score @s game.trigger.level_chosen matches -2002 if score #global game.saves.display_health_bar_for_contraptions matches 0 run playsound entity.experience_orb.pickup master @s ~ ~ ~ 1 0.5
    execute as @a at @s if score @s game.trigger.level_chosen matches -2003 if score #global game.saves.pause_upon_join matches 0 run playsound entity.experience_orb.pickup master @s ~ ~ ~ 1 0.5
    execute as @a at @s if score @s game.trigger.level_chosen matches -2001 if score #global game.saves.night_vision matches 1 run playsound entity.experience_orb.pickup master @s ~ ~ ~ 1 1
    execute as @a at @s if score @s game.trigger.level_chosen matches -2002 if score #global game.saves.display_health_bar_for_contraptions matches 1 run playsound entity.experience_orb.pickup master @s ~ ~ ~ 1 1
    execute as @a at @s if score @s game.trigger.level_chosen matches -2003 if score #global game.saves.pause_upon_join matches 1 run playsound entity.experience_orb.pickup master @s ~ ~ ~ 1 1

    execute as @a at @s if score @s game.trigger.level_chosen matches ..-1 run scoreboard players set @s game.trigger.level_chosen 0

    function hardcode:level.load

#giving players effects
    effect give @a resistance infinite 255 true
    effect give @a instant_health 1 100 true
    effect give @a saturation infinite 255 true