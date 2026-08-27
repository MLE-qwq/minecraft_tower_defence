scoreboard objectives add game.trigger.upgrade trigger
scoreboard players enable @a game.trigger.upgrade

#contraption removal
    execute as @a at @s if score @s game.trigger.upgrade matches -1001 as @e[tag=cont] if score @p game.data.uuid = @s game.data.uuid run tellraw @a [{"selector":"@p"},"\u00a7e has removed a contraption."]
    execute as @a at @s if score @s game.trigger.upgrade matches -1001 as @e[tag=cont] if score @p game.data.uuid = @s game.data.uuid as @a at @s run playsound entity.experience_orb.pickup master @s ~ ~ ~
    execute as @a at @s if score @s game.trigger.upgrade matches -1001 as @e[tag=cont] if score @p game.data.uuid = @s game.data.uuid run tag @s add kill
    
    execute as @e[tag=cont,tag=kill] at @s run particle poof ~ ~ ~ 0 0 0 0.1 50
    function hardcode:cont.effects_upon_removal
    execute if entity @e[tag=cont,tag=kill] run dialog clear @a
    kill @e[tag=kill]

#dispensers
    #checks if any player has triggered dispenser upgrading
        execute as @a at @s if score @s game.trigger.upgrade matches 1 as @e[tag=cont,tag=disp] if score @p game.data.uuid = @s game.data.uuid run tag @s add upgrade_damage
        execute as @a at @s if score @s game.trigger.upgrade matches 2 as @e[tag=cont,tag=disp] if score @p game.data.uuid = @s game.data.uuid run tag @s add upgrade_range
        execute as @a at @s if score @s game.trigger.upgrade matches 3 as @e[tag=cont,tag=disp] if score @p game.data.uuid = @s game.data.uuid run tag @s add upgrade_fire_rate
        execute as @a at @s if score @s game.trigger.upgrade matches 5 as @e[tag=cont,tag=disp] if score @p game.data.uuid = @s game.data.uuid run tag @s add upgrade_duration

    #not enough (global) currency
        execute as @a at @s as @e[tag=disp,tag=upgrade_damage] if score @p game.data.uuid = @s game.data.uuid if score #global game.data.currency < @s game.data.disp_cont.damage_cost run tellraw @p ["\u00a7cYou don't have enough currency to upgrade the \u00a7b\u00a7oDamage\u00a7r\u00a7c: at least ",{"score":{"name":"@s","objective":"game.data.disp_cont.damage_cost"},"color":"green"}," \u00a7cis required while you only have ",{"score":{"name":"#global","objective":"game.data.currency"},"color":"green"},"\u00a7c."]
        execute as @a at @s as @e[tag=disp,tag=upgrade_damage] if score @p game.data.uuid = @s game.data.uuid if score #global game.data.currency < @s game.data.disp_cont.damage_cost run playsound block.anvil.land master @p ~ ~ ~ 1 0.5
        execute as @a at @s as @e[tag=disp,tag=upgrade_range] if score @p game.data.uuid = @s game.data.uuid if score #global game.data.currency < @s game.data.disp_cont.range_cost run tellraw @p ["\u00a7cYou don't have enough currency to upgrade the \u00a7a\u00a7oRange\u00a7r\u00a7c: at least ",{"score":{"name":"@s","objective":"game.data.disp_cont.range_cost"},"color":"green"}," \u00a7cis required while you only have ",{"score":{"name":"#global","objective":"game.data.currency"},"color":"green"},"\u00a7c."]
        execute as @a at @s as @e[tag=disp,tag=upgrade_range] if score @p game.data.uuid = @s game.data.uuid if score #global game.data.currency < @s game.data.disp_cont.range_cost run playsound block.anvil.land master @p ~ ~ ~ 1 0.5
        execute as @a at @s as @e[tag=disp,tag=upgrade_fire_rate] if score @p game.data.uuid = @s game.data.uuid if score #global game.data.currency < @s game.data.disp_cont.fire_rate_cost run tellraw @p ["\u00a7cYou don't have enough currency to upgrade the \u00a76\u00a7oFire Rate\u00a7r\u00a7c: at least ",{"score":{"name":"@s","objective":"game.data.disp_cont.fire_rate_cost"},"color":"green"}," \u00a7cis required while you only have ",{"score":{"name":"#global","objective":"game.data.currency"},"color":"green"},"\u00a7c."]
        execute as @a at @s as @e[tag=disp,tag=upgrade_fire_rate] if score @p game.data.uuid = @s game.data.uuid if score #global game.data.currency < @s game.data.disp_cont.fire_rate_cost run playsound block.anvil.land master @p ~ ~ ~ 1 0.5
        execute as @a at @s as @e[tag=disp,tag=upgrade_duration] if score @p game.data.uuid = @s game.data.uuid if score #global game.data.currency < @s game.data.disp_cont.duration_cost run tellraw @p ["\u00a7cYou don't have enough currency to upgrade the \u00a7d\u00a7oDuration\u00a7r\u00a7c: at least ",{"score":{"name":"@s","objective":"game.data.disp_cont.duration_cost"},"color":"green"}," \u00a7cis required while you only have ",{"score":{"name":"#global","objective":"game.data.currency"},"color":"green"},"\u00a7c."]
        execute as @a at @s as @e[tag=disp,tag=upgrade_duration] if score @p game.data.uuid = @s game.data.uuid if score #global game.data.currency < @s game.data.disp_cont.duration_cost run playsound block.anvil.land master @p ~ ~ ~ 1 0.5
    
    #no upgrades available
        execute as @a at @s as @e[tag=disp,tag=upgrade_damage] if score @p game.data.uuid = @s game.data.uuid if score @s game.data.disp_cont.damage_next matches -1 run tellraw @p "\u00a7cYou have already maxed out the \u00a7b\u00a7oDamage\u00a7r\u00a7c. There are no further upgrades."
        execute as @a at @s as @e[tag=disp,tag=upgrade_damage] if score @p game.data.uuid = @s game.data.uuid if score @s game.data.disp_cont.damage_next matches -1 run playsound block.anvil.land master @p ~ ~ ~ 1 0.5
        execute as @a at @s as @e[tag=disp,tag=upgrade_range] if score @p game.data.uuid = @s game.data.uuid if score @s game.data.disp_cont.range_next matches -1 run tellraw @p "\u00a7cYou have already maxed out the \u00a7a\u00a7oRange\u00a7r\u00a7c. There are no further upgrades."
        execute as @a at @s as @e[tag=disp,tag=upgrade_range] if score @p game.data.uuid = @s game.data.uuid if score @s game.data.disp_cont.range_next matches -1 run playsound block.anvil.land master @p ~ ~ ~ 1 0.5
        execute as @a at @s as @e[tag=disp,tag=upgrade_fire_rate] if score @p game.data.uuid = @s game.data.uuid if score @s game.data.disp_cont.fire_rate_next matches -1 run tellraw @p "\u00a7cYou have already maxed out the \u00a76\u00a7oFire Rate\u00a7r\u00a7c. There are no further upgrades."
        execute as @a at @s as @e[tag=disp,tag=upgrade_fire_rate] if score @p game.data.uuid = @s game.data.uuid if score @s game.data.disp_cont.fire_rate_next matches -1 run playsound block.anvil.land master @p ~ ~ ~ 1 0.5
        execute as @a at @s as @e[tag=disp,tag=upgrade_duration] if score @p game.data.uuid = @s game.data.uuid if score @s game.data.disp_cont.duration_next matches -1 run tellraw @p "\u00a7cYou have already maxed out the \u00a7d\u00a7oDuration\u00a7r\u00a7c. There are no further upgrades."
        execute as @a at @s as @e[tag=disp,tag=upgrade_duration] if score @p game.data.uuid = @s game.data.uuid if score @s game.data.disp_cont.duration_next matches -1 run playsound block.anvil.land master @p ~ ~ ~ 1 0.5

    #upgrading
        execute as @a at @s as @e[tag=disp,tag=upgrade_damage] if score @p game.data.uuid = @s game.data.uuid unless score @s game.data.disp_cont.damage_next matches -1 if score #global game.data.currency >= @s game.data.disp_cont.damage_cost run tag @s add confirmed
        execute as @a at @s as @e[tag=disp,tag=confirmed,tag=upgrade_damage] if score @p game.data.uuid = @s game.data.uuid at @s run scoreboard players operation #global game.data.currency -= @s game.data.disp_cont.damage_cost
        execute as @a at @s as @e[tag=disp,tag=confirmed,tag=upgrade_damage] if score @p game.data.uuid = @s game.data.uuid at @s as @a at @s run playsound entity.experience_orb.pickup master @s ~ ~ ~
        execute as @a at @s as @e[tag=disp,tag=confirmed,tag=upgrade_damage] if score @p game.data.uuid = @s game.data.uuid at @s run tellraw @a [{"selector":"@p"},"\u00a7e has upgraded the \u00a7b\u00a7oDamage\u00a7r\u00a7e from ",{"score":{"name":"@s","objective":"game.data.disp_cont.damage"},"color":"aqua"}," \u00a7eto ",{"score":{"name":"@s","objective":"game.data.disp_cont.damage_next"},"color":"aqua"},"\u00a7e (unit: \u00a7bHP\u00a7e) using \u00a7a$",{"score":{"name":"@s","objective":"game.data.disp_cont.damage_cost"},"color":"green"},"\u00a7e, with \u00a7a$",{"score":{"name":"#global","objective":"game.data.currency"},"color":"green"},"\u00a7e remaining."]
        execute as @a at @s as @e[tag=disp,tag=confirmed,tag=upgrade_damage] if score @p game.data.uuid = @s game.data.uuid at @s run scoreboard players operation @s game.data.disp_cont.damage = @s game.data.disp_cont.damage_next

        execute as @a at @s as @e[tag=disp,tag=upgrade_range] if score @p game.data.uuid = @s game.data.uuid unless score @s game.data.disp_cont.range_next matches -1 if score #global game.data.currency >= @s game.data.disp_cont.range_cost run tag @s add confirmed
        execute as @a at @s as @e[tag=disp,tag=confirmed,tag=upgrade_range] if score @p game.data.uuid = @s game.data.uuid run scoreboard players operation #global game.data.currency -= @s game.data.disp_cont.range_cost
        execute as @a at @s as @e[tag=disp,tag=confirmed,tag=upgrade_range] if score @p game.data.uuid = @s game.data.uuid as @a at @s run playsound entity.experience_orb.pickup master @s ~ ~ ~
        execute as @a at @s as @e[tag=disp,tag=confirmed,tag=upgrade_range] if score @p game.data.uuid = @s game.data.uuid run tellraw @a [{"selector":"@p"},"\u00a7e has upgraded the \u00a7a\u00a7oRange\u00a7r\u00a7e from ",{"score":{"name":"@s","objective":"game.data.disp_cont.range"},"color":"green"}," \u00a7eto ",{"score":{"name":"@s","objective":"game.data.disp_cont.range_next"},"color":"green"},"\u00a7e (unit: \u00a7am\u00a7e) using \u00a7a$",{"score":{"name":"@s","objective":"game.data.disp_cont.range_cost"},"color":"green"},"\u00a7e, with \u00a7a$",{"score":{"name":"#global","objective":"game.data.currency"},"color":"green"},"\u00a7e remaining."]
        execute as @a at @s as @e[tag=disp,tag=confirmed,tag=upgrade_range] if score @p game.data.uuid = @s game.data.uuid run scoreboard players operation @s game.data.disp_cont.range = @s game.data.disp_cont.range_next

        execute as @a at @s as @e[tag=disp,tag=upgrade_fire_rate] if score @p game.data.uuid = @s game.data.uuid unless score @s game.data.disp_cont.fire_rate_next matches -1 if score #global game.data.currency >= @s game.data.disp_cont.fire_rate_cost run tag @s add confirmed
        execute as @a at @s as @e[tag=disp,tag=confirmed,tag=upgrade_fire_rate] if score @p game.data.uuid = @s game.data.uuid run scoreboard players operation #global game.data.currency -= @s game.data.disp_cont.fire_rate_cost
        execute as @a at @s as @e[tag=disp,tag=confirmed,tag=upgrade_fire_rate] if score @p game.data.uuid = @s game.data.uuid as @a at @s run playsound entity.experience_orb.pickup master @s ~ ~ ~
        execute as @a at @s as @e[tag=disp,tag=confirmed,tag=upgrade_fire_rate] if score @p game.data.uuid = @s game.data.uuid run tellraw @a [{"selector":"@p"},"\u00a7e has upgraded the \u00a76\u00a7oFire Rate\u207b\u00b9\u00a7r\u00a7e from ",{"score":{"name":"@s","objective":"game.data.disp_cont.fire_rate"},"color":"gold"}," \u00a7eto ",{"score":{"name":"@s","objective":"game.data.disp_cont.fire_rate_next"},"color":"gold"},"\u00a7e (unit: \u00a76tick\u00a7e) using \u00a7a$",{"score":{"name":"@s","objective":"game.data.disp_cont.fire_rate_cost"},"color":"green"},"\u00a7e, with \u00a7a$",{"score":{"name":"#global","objective":"game.data.currency"},"color":"green"},"\u00a7e remaining."]
        execute as @a at @s as @e[tag=disp,tag=confirmed,tag=upgrade_fire_rate] if score @p game.data.uuid = @s game.data.uuid run scoreboard players operation @s game.data.disp_cont.fire_rate = @s game.data.disp_cont.fire_rate_next

        execute as @a at @s as @e[tag=disp,tag=upgrade_duration] if score @p game.data.uuid = @s game.data.uuid unless score @s game.data.disp_cont.duration_next matches -1 if score #global game.data.currency >= @s game.data.disp_cont.duration_cost run tag @s add confirmed
        execute as @a at @s as @e[tag=disp,tag=confirmed,tag=upgrade_duration] if score @p game.data.uuid = @s game.data.uuid run scoreboard players operation #global game.data.currency -= @s game.data.disp_cont.duration_cost
        execute as @a at @s as @e[tag=disp,tag=confirmed,tag=upgrade_duration] if score @p game.data.uuid = @s game.data.uuid as @a at @s run playsound entity.experience_orb.pickup master @s ~ ~ ~
        execute as @a at @s as @e[tag=disp,tag=confirmed,tag=upgrade_duration] if score @p game.data.uuid = @s game.data.uuid run tellraw @a [{"selector":"@p"},"\u00a7e has upgraded the \u00a7d\u00a7oDuration\u00a7r\u00a7e from ",{"score":{"name":"@s","objective":"game.data.disp_cont.duration"},"color":"gold"}," \u00a7eto ",{"score":{"name":"@s","objective":"game.data.disp_cont.duration_next"},"color":"gold"},"\u00a7e (unit: \u00a7dtick\u00a7e) using \u00a7a$",{"score":{"name":"@s","objective":"game.data.disp_cont.duration_cost"},"color":"green"},"\u00a7e, with \u00a7a$",{"score":{"name":"#global","objective":"game.data.currency"},"color":"green"},"\u00a7e remaining."]
        execute as @a at @s as @e[tag=disp,tag=confirmed,tag=upgrade_duration] if score @p game.data.uuid = @s game.data.uuid run scoreboard players operation @s game.data.disp_cont.duration = @s game.data.disp_cont.duration_next

#Water
    #checks if any player has triggered upgrading
        execute as @a at @s if score @s game.trigger.upgrade matches 4 as @e[tag=cont,tag=water] if score @p game.data.uuid = @s game.data.uuid run tag @s add upgrade_viscosity

    #not enough (global) currency
        execute as @a at @s as @e[tag=water,tag=upgrade_viscosity] if score @p game.data.uuid = @s game.data.uuid if score #global game.data.currency < @s game.data.cont.viscosity_cost run tellraw @p ["\u00a7cYou don't have enough currency to upgrade the \u00a7f\u00a7oViscosity\u00a7r\u00a7c: at least ",{"score":{"name":"@s","objective":"game.data.cont.viscosity_cost"},"color":"green"}," \u00a7cis required while you only have ",{"score":{"name":"#global","objective":"game.data.currency"},"color":"green"},"\u00a7c."]
        execute as @a at @s as @e[tag=water,tag=upgrade_viscosity] if score @p game.data.uuid = @s game.data.uuid if score #global game.data.currency < @s game.data.cont.viscosity_cost run playsound block.anvil.land master @p ~ ~ ~ 1 0.5
    
    #no upgrades available
        execute as @a at @s as @e[tag=water,tag=upgrade_viscosity] if score @p game.data.uuid = @s game.data.uuid if score @s game.data.cont.viscosity_next matches -1 run tellraw @p "\u00a7cYou have already maxed out the \u00a7f\u00a7oViscosity\u00a7r\u00a7c. There are no further upgrades."
        execute as @a at @s as @e[tag=water,tag=upgrade_viscosity] if score @p game.data.uuid = @s game.data.uuid if score @s game.data.cont.viscosity_next matches -1 run playsound block.anvil.land master @p ~ ~ ~ 1 0.5

    #upgrading
        execute as @a at @s as @e[tag=water,tag=upgrade_viscosity] if score @p game.data.uuid = @s game.data.uuid unless score @s game.data.cont.viscosity_next matches -1 if score #global game.data.currency >= @s game.data.cont.viscosity_cost run tag @s add confirmed
        execute as @a at @s as @e[tag=water,tag=upgrade_viscosity,tag=confirmed] if score @p game.data.uuid = @s game.data.uuid run scoreboard players operation #global game.data.currency -= @s game.data.cont.viscosity_cost
        execute as @a at @s as @e[tag=water,tag=upgrade_viscosity,tag=confirmed] if score @p game.data.uuid = @s game.data.uuid as @a at @s run playsound entity.experience_orb.pickup master @s ~ ~ ~
        execute as @a at @s as @e[tag=water,tag=upgrade_viscosity,tag=confirmed] if score @p game.data.uuid = @s game.data.uuid run tellraw @a [{"selector":"@p"},"\u00a7e has upgraded the \u00a7f\u00a7oViscosity\u00a7r\u00a7e from ",{"score":{"name":"@s","objective":"game.data.cont.viscosity"},"color":"white"}," \u00a7eto ",{"score":{"name":"@s","objective":"game.data.cont.viscosity_next"},"color":"white"},"\u00a7e using \u00a7a$",{"score":{"name":"@s","objective":"game.data.cont.viscosity_cost"},"color":"green"},"\u00a7e, with \u00a7a$",{"score":{"name":"#global","objective":"game.data.currency"},"color":"green"},"\u00a7e remaining."]
        execute as @a at @s as @e[tag=water,tag=upgrade_viscosity,tag=confirmed] if score @p game.data.uuid = @s game.data.uuid run scoreboard players operation @s game.data.cont.viscosity = @s game.data.cont.viscosity_next

#Trapdoor
    #checks if any player has triggered upgrading
        execute as @a at @s if score @s game.trigger.upgrade matches 5 as @e[tag=cont,tag=trapdoor] if score @p game.data.uuid = @s game.data.uuid run tag @s add upgrade_capacity

    #not enough (global) currency
        execute as @a at @s as @e[tag=trapdoor,tag=upgrade_capacity] if score @p game.data.uuid = @s game.data.uuid if score #global game.data.currency < @s game.data.cont.capacity_cost run tellraw @p ["\u00a7cYou don't have enough currency to upgrade the \u00a7f\u00a7oCapacity\u00a7r\u00a7c: at least ",{"score":{"name":"@s","objective":"game.data.cont.capacity_cost"},"color":"green"}," \u00a7cis required while you only have ",{"score":{"name":"#global","objective":"game.data.currency"},"color":"green"},"\u00a7c."]
        execute as @a at @s as @e[tag=trapdoor,tag=upgrade_capacity] if score @p game.data.uuid = @s game.data.uuid if score #global game.data.currency < @s game.data.cont.capacity_cost run playsound block.anvil.land master @p ~ ~ ~ 1 0.5
    
    #no upgrades available
        execute as @a at @s as @e[tag=trapdoor,tag=upgrade_capacity] if score @p game.data.uuid = @s game.data.uuid if score @s game.data.cont.capacity_next matches -1 run tellraw @p "\u00a7cYou have already maxed out the \u00a7f\u00a7oCapacity\u00a7r\u00a7c. There are no further upgrades."
        execute as @a at @s as @e[tag=trapdoor,tag=upgrade_capacity] if score @p game.data.uuid = @s game.data.uuid if score @s game.data.cont.capacity_next matches -1 run playsound block.anvil.land master @p ~ ~ ~ 1 0.5

    #upgrading
        execute as @a at @s as @e[tag=trapdoor,tag=upgrade_capacity] if score @p game.data.uuid = @s game.data.uuid unless score @s game.data.cont.capacity_next matches -1 if score #global game.data.currency >= @s game.data.cont.capacity_cost run tag @s add confirmed
        execute as @a at @s as @e[tag=trapdoor,tag=upgrade_capacity,tag=confirmed] if score @p game.data.uuid = @s game.data.uuid run scoreboard players operation #global game.data.currency -= @s game.data.cont.capacity_cost
        execute as @a at @s as @e[tag=trapdoor,tag=upgrade_capacity,tag=confirmed] if score @p game.data.uuid = @s game.data.uuid as @a at @s run playsound entity.experience_orb.pickup master @s ~ ~ ~
        execute as @a at @s as @e[tag=trapdoor,tag=upgrade_capacity,tag=confirmed] if score @p game.data.uuid = @s game.data.uuid run tellraw @a [{"selector":"@p"},"\u00a7e has upgraded the \u00a7f\u00a7oCapacity\u00a7r\u00a7e from ",{"score":{"name":"@s","objective":"game.data.cont.capacity"},"color":"white"}," \u00a7eto ",{"score":{"name":"@s","objective":"game.data.cont.capacity_next"},"color":"white"},"\u00a7e using \u00a7a$",{"score":{"name":"@s","objective":"game.data.cont.capacity_cost"},"color":"green"},"\u00a7e, with \u00a7a$",{"score":{"name":"#global","objective":"game.data.currency"},"color":"green"},"\u00a7e remaining."]
        execute as @a at @s as @e[tag=trapdoor,tag=upgrade_capacity,tag=confirmed] if score @p game.data.uuid = @s game.data.uuid run scoreboard players operation @s game.data.cont.capacity = @s game.data.cont.capacity_next

execute as @a at @s as @e[tag=disp,tag=upgrade_damage] if score @p game.data.uuid = @s game.data.uuid run tag @s add display_options_menu
execute as @a at @s as @e[tag=disp,tag=upgrade_range] if score @p game.data.uuid = @s game.data.uuid run tag @s add display_options_menu
execute as @a at @s as @e[tag=disp,tag=upgrade_fire_rate] if score @p game.data.uuid = @s game.data.uuid run tag @s add display_options_menu
execute as @a at @s as @e[tag=water,tag=upgrade_viscosity] if score @p game.data.uuid = @s game.data.uuid run tag @s add display_options_menu
execute as @a at @s as @e[tag=trapdoor,tag=upgrade_capacity] if score @p game.data.uuid = @s game.data.uuid run tag @s add display_options_menu
execute as @a at @s as @e[tag=disp,tag=upgrade_duration] if score @p game.data.uuid = @s game.data.uuid run tag @s add display_options_menu
tag @e[tag=disp] remove upgrade_damage
tag @e[tag=disp] remove upgrade_range
tag @e[tag=disp] remove upgrade_fire_rate
tag @e[tag=disp] remove upgrade_duration
tag @e[tag=disp] remove confirmed
tag @e[tag=water] remove upgrade_viscosity
tag @e[tag=water] remove confirmed
tag @e[tag=trapdoor] remove upgrade_capacity
tag @e[tag=trapdoor] remove confirmed
scoreboard players set * game.trigger.upgrade 0
scoreboard players set @a game.trigger.upgrade 0


function hardcode:cont.upgrades

team add game.red_outline
team modify game.red_outline color red
execute as @e[team=game.red_outline] run team leave @s
execute as @e[tag=raycast_selected] at @s run team join game.red_outline @s
effect clear @e[tag=health_tracking,team=!game.red_outline] glowing
effect give @e[team=game.red_outline] glowing infinite 255 true

#-----------------------Text------------------------
    #Cactus
        execute as @a at @s as @e[tag=cont,tag=display_options_menu,tag=cactus] if score @p game.data.uuid = @s game.data.uuid run tellraw @p "\u00a7d-----------------------------------------------------"
        execute as @a at @s as @e[tag=cont,tag=display_options_menu,tag=cactus] if score @p game.data.uuid = @s game.data.uuid run tellraw @p "\u00a7eCactus"
        execute as @a at @s as @e[tag=cont,tag=display_options_menu,tag=cactus] if score @p game.data.uuid = @s game.data.uuid as @p at @s run playsound ui.button.click master @s ~ ~ ~
        execute as @a at @s as @e[tag=cont,tag=display_options_menu,tag=cactus] if score @p game.data.uuid = @s game.data.uuid run dialog show @p game:generic_contraption

    #Egg Dispensers
        #note: after assigning the command executer to the contraption, the position of execution is still located at the player so using @p would select the player unless multiple players are at the exact same position and if that does occur it is a rare case that is not worth consideration, yet.
        execute as @a at @s as @e[tag=cont,tag=display_options_menu,tag=egg_disp] if score @p game.data.uuid = @s game.data.uuid run tellraw @p "\u00a7d-----------------------------------------------------"
        execute as @a at @s as @e[tag=cont,tag=display_options_menu,tag=egg_disp] if score @p game.data.uuid = @s game.data.uuid run tellraw @p "\u00a7eEgg Dispenser"

        execute as @a at @s as @e[tag=cont,tag=display_options_menu,tag=egg_disp] if score @p game.data.uuid = @s game.data.uuid unless score @s game.data.disp_cont.damage_next matches -1 run tellraw @p ["\u00a7bDamage (HP)\u00a7e: \u00a7a",{"score":{"name":"@s","objective":"game.data.disp_cont.damage"},"color":"aqua"},"\u00a7e -> \u00a7a",{"score":{"name":"@s","objective":"game.data.disp_cont.damage_next"},"color":"aqua"}," \u00a7e(Cost: \u00a7a",{"score":{"name":"@s","objective":"game.data.disp_cont.damage_cost"},"color":"green"},"\u00a7e)"]
        execute as @a at @s as @e[tag=cont,tag=display_options_menu,tag=egg_disp] if score @p game.data.uuid = @s game.data.uuid if score @s game.data.disp_cont.damage_next matches -1 run tellraw @p ["\u00a7bDamage (HP)\u00a7e: \u00a7a",{"score":{"name":"@s","objective":"game.data.disp_cont.damage"},"color":"aqua"},"\u00a7e -> \u00a7c\u00a7oNo Upgrades"]

        execute as @a at @s as @e[tag=cont,tag=display_options_menu,tag=egg_disp] if score @p game.data.uuid = @s game.data.uuid unless score @s game.data.disp_cont.range_next matches -1 run tellraw @p ["\u00a7aRange (m)\u00a7e: \u00a7a",{"score":{"name":"@s","objective":"game.data.disp_cont.range"},"color":"green"},"\u00a7e -> \u00a7a",{"score":{"name":"@s","objective":"game.data.disp_cont.range_next"},"color":"green"}," \u00a7e(Cost: \u00a7a",{"score":{"name":"@s","objective":"game.data.disp_cont.range_cost"},"color":"green"},"\u00a7e)"]
        execute as @a at @s as @e[tag=cont,tag=display_options_menu,tag=egg_disp] if score @p game.data.uuid = @s game.data.uuid if score @s game.data.disp_cont.range_next matches -1 run tellraw @p ["\u00a7aRange (m)\u00a7e: \u00a7a",{"score":{"name":"@s","objective":"game.data.disp_cont.range"},"color":"green"},"\u00a7e -> \u00a7c\u00a7oNo Upgrades"]

        execute as @a at @s as @e[tag=cont,tag=display_options_menu,tag=egg_disp] if score @p game.data.uuid = @s game.data.uuid unless score @s game.data.disp_cont.fire_rate_next matches -1 run tellraw @p ["\u00a76Fire Rate\u207b\u00b9 (tick)\u00a7e: \u00a7a",{"score":{"name":"@s","objective":"game.data.disp_cont.fire_rate"},"color":"gold"},"\u00a7e -> \u00a7a",{"score":{"name":"@s","objective":"game.data.disp_cont.fire_rate_next"},"color":"gold"}," \u00a7e(Cost: \u00a7a",{"score":{"name":"@s","objective":"game.data.disp_cont.fire_rate_cost"},"color":"green"},"\u00a7e)"]
        execute as @a at @s as @e[tag=cont,tag=display_options_menu,tag=egg_disp] if score @p game.data.uuid = @s game.data.uuid if score @s game.data.disp_cont.fire_rate_next matches -1 run tellraw @p ["\u00a76Fire Rate\u207b\u00b9 (tick)\u00a7e: \u00a7a",{"score":{"name":"@s","objective":"game.data.disp_cont.fire_rate"},"color":"gold"},"\u00a7e -> \u00a7c\u00a7oNo Upgrades"]

        execute as @a at @s as @e[tag=cont,tag=display_options_menu,tag=egg_disp] if score @p game.data.uuid = @s game.data.uuid as @p at @s run playsound ui.button.click master @s ~ ~ ~
        execute as @a at @s as @e[tag=cont,tag=display_options_menu,tag=egg_disp] if score @p game.data.uuid = @s game.data.uuid run dialog show @p game:dispenser_upgrade
    
    #Arrow Dispensers
        #note: after assigning the command executer to the contraption, the position of execution is still located at the player so using @p would select the player unless multiple players are at the exact same position and if that does occur it is a rare case that is not worth consideration, yet.
        execute as @a at @s as @e[tag=cont,tag=display_options_menu,tag=arrow_disp] if score @p game.data.uuid = @s game.data.uuid run tellraw @p "\u00a7d-----------------------------------------------------"
        execute as @a at @s as @e[tag=cont,tag=display_options_menu,tag=arrow_disp] if score @p game.data.uuid = @s game.data.uuid run tellraw @p "\u00a7eArrow Dispenser"

        execute as @a at @s as @e[tag=cont,tag=display_options_menu,tag=arrow_disp] if score @p game.data.uuid = @s game.data.uuid unless score @s game.data.disp_cont.damage_next matches -1 run tellraw @p ["\u00a7bDamage (HP)\u00a7e: \u00a7a",{"score":{"name":"@s","objective":"game.data.disp_cont.damage"},"color":"aqua"},"\u00a7e -> \u00a7a",{"score":{"name":"@s","objective":"game.data.disp_cont.damage_next"},"color":"aqua"}," \u00a7e(Cost: \u00a7a",{"score":{"name":"@s","objective":"game.data.disp_cont.damage_cost"},"color":"green"},"\u00a7e)"]
        execute as @a at @s as @e[tag=cont,tag=display_options_menu,tag=arrow_disp] if score @p game.data.uuid = @s game.data.uuid if score @s game.data.disp_cont.damage_next matches -1 run tellraw @p ["\u00a7bDamage (HP)\u00a7e: \u00a7a",{"score":{"name":"@s","objective":"game.data.disp_cont.damage"},"color":"aqua"},"\u00a7e -> \u00a7c\u00a7oNo Upgrades"]

        execute as @a at @s as @e[tag=cont,tag=display_options_menu,tag=arrow_disp] if score @p game.data.uuid = @s game.data.uuid unless score @s game.data.disp_cont.range_next matches -1 run tellraw @p ["\u00a7aRange (m)\u00a7e: \u00a7a",{"score":{"name":"@s","objective":"game.data.disp_cont.range"},"color":"green"},"\u00a7e -> \u00a7a",{"score":{"name":"@s","objective":"game.data.disp_cont.range_next"},"color":"green"}," \u00a7e(Cost: \u00a7a",{"score":{"name":"@s","objective":"game.data.disp_cont.range_cost"},"color":"green"},"\u00a7e)"]
        execute as @a at @s as @e[tag=cont,tag=display_options_menu,tag=arrow_disp] if score @p game.data.uuid = @s game.data.uuid if score @s game.data.disp_cont.range_next matches -1 run tellraw @p ["\u00a7aRange (m)\u00a7e: \u00a7a",{"score":{"name":"@s","objective":"game.data.disp_cont.range"},"color":"green"},"\u00a7e -> \u00a7c\u00a7oNo Upgrades"]

        execute as @a at @s as @e[tag=cont,tag=display_options_menu,tag=arrow_disp] if score @p game.data.uuid = @s game.data.uuid unless score @s game.data.disp_cont.fire_rate_next matches -1 run tellraw @p ["\u00a76Fire Rate\u207b\u00b9 (tick): \u00a7a",{"score":{"name":"@s","objective":"game.data.disp_cont.fire_rate"},"color":"gold"},"\u00a7e -> \u00a7a",{"score":{"name":"@s","objective":"game.data.disp_cont.fire_rate_next"},"color":"gold"}," \u00a7e(Cost: \u00a7a",{"score":{"name":"@s","objective":"game.data.disp_cont.fire_rate_cost"},"color":"green"},"\u00a7e)"]
        execute as @a at @s as @e[tag=cont,tag=display_options_menu,tag=arrow_disp] if score @p game.data.uuid = @s game.data.uuid if score @s game.data.disp_cont.fire_rate_next matches -1 run tellraw @p ["\u00a76Fire Rate\u207b\u00b9 (tick)\u00a7e: \u00a7a",{"score":{"name":"@s","objective":"game.data.disp_cont.fire_rate"},"color":"gold"},"\u00a7e -> \u00a7c\u00a7oNo Upgrades"]

        execute as @a at @s as @e[tag=cont,tag=display_options_menu,tag=arrow_disp] if score @p game.data.uuid = @s game.data.uuid as @p at @s run playsound ui.button.click master @s ~ ~ ~
        execute as @a at @s as @e[tag=cont,tag=display_options_menu,tag=arrow_disp] if score @p game.data.uuid = @s game.data.uuid run dialog show @p game:dispenser_upgrade
    
    #Slime Dispensers
        execute as @a at @s as @e[tag=cont,tag=display_options_menu,tag=slime_disp] if score @p game.data.uuid = @s game.data.uuid run tellraw @p "\u00a7d-----------------------------------------------------"
        execute as @a at @s as @e[tag=cont,tag=display_options_menu,tag=slime_disp] if score @p game.data.uuid = @s game.data.uuid run tellraw @p "\u00a7eSlime Dispenser"

        execute as @a at @s as @e[tag=cont,tag=display_options_menu,tag=slime_disp] if score @p game.data.uuid = @s game.data.uuid unless score @s game.data.disp_cont.duration_next matches -1 run tellraw @p ["\u00a7dDuration (tick)\u00a7e: \u00a7a",{"score":{"name":"@s","objective":"game.data.disp_cont.duration"},"color":"light_purple"},"\u00a7e -> \u00a7a",{"score":{"name":"@s","objective":"game.data.disp_cont.duration_next"},"color":"light_purple"}," \u00a7e(Cost: \u00a7a",{"score":{"name":"@s","objective":"game.data.disp_cont.duration_cost"},"color":"green"},"\u00a7e)"]
        execute as @a at @s as @e[tag=cont,tag=display_options_menu,tag=slime_disp] if score @p game.data.uuid = @s game.data.uuid if score @s game.data.disp_cont.duration_next matches -1 run tellraw @p ["\u00a7dDuration (tick)\u00a7e: \u00a7a",{"score":{"name":"@s","objective":"game.data.disp_cont.duration"},"color":"light_purple"},"\u00a7e -> \u00a7c\u00a7oNo Upgrades"]

        execute as @a at @s as @e[tag=cont,tag=display_options_menu,tag=slime_disp] if score @p game.data.uuid = @s game.data.uuid unless score @s game.data.disp_cont.range_next matches -1 run tellraw @p ["\u00a7aRange (m)\u00a7e: \u00a7a",{"score":{"name":"@s","objective":"game.data.disp_cont.range"},"color":"green"},"\u00a7e -> \u00a7a",{"score":{"name":"@s","objective":"game.data.disp_cont.range_next"},"color":"green"}," \u00a7e(Cost: \u00a7a",{"score":{"name":"@s","objective":"game.data.disp_cont.range_cost"},"color":"green"},"\u00a7e)"]
        execute as @a at @s as @e[tag=cont,tag=display_options_menu,tag=slime_disp] if score @p game.data.uuid = @s game.data.uuid if score @s game.data.disp_cont.range_next matches -1 run tellraw @p ["\u00a7aRange (m)\u00a7e: \u00a7a",{"score":{"name":"@s","objective":"game.data.disp_cont.range"},"color":"green"},"\u00a7e -> \u00a7c\u00a7oNo Upgrades"]

        execute as @a at @s as @e[tag=cont,tag=display_options_menu,tag=slime_disp] if score @p game.data.uuid = @s game.data.uuid unless score @s game.data.disp_cont.fire_rate_next matches -1 run tellraw @p ["\u00a76Fire Rate\u207b\u00b9 (tick): \u00a7a",{"score":{"name":"@s","objective":"game.data.disp_cont.fire_rate"},"color":"gold"},"\u00a7e -> \u00a7a",{"score":{"name":"@s","objective":"game.data.disp_cont.fire_rate_next"},"color":"gold"}," \u00a7e(Cost: \u00a7a",{"score":{"name":"@s","objective":"game.data.disp_cont.fire_rate_cost"},"color":"green"},"\u00a7e)"]
        execute as @a at @s as @e[tag=cont,tag=display_options_menu,tag=slime_disp] if score @p game.data.uuid = @s game.data.uuid if score @s game.data.disp_cont.fire_rate_next matches -1 run tellraw @p ["\u00a76Fire Rate\u207b\u00b9 (tick)\u00a7e: \u00a7a",{"score":{"name":"@s","objective":"game.data.disp_cont.fire_rate"},"color":"gold"},"\u00a7e -> \u00a7c\u00a7oNo Upgrades"]

        execute as @a at @s as @e[tag=cont,tag=display_options_menu,tag=slime_disp] if score @p game.data.uuid = @s game.data.uuid as @p at @s run playsound ui.button.click master @s ~ ~ ~
        execute as @a at @s as @e[tag=cont,tag=display_options_menu,tag=slime_disp] if score @p game.data.uuid = @s game.data.uuid run dialog show @p game:dispenser_upgrade_slime

    #Water
        execute as @a at @s as @e[tag=cont,tag=display_options_menu,tag=water] if score @p game.data.uuid = @s game.data.uuid run tellraw @p "\u00a7d-----------------------------------------------------"
        execute as @a at @s as @e[tag=cont,tag=display_options_menu,tag=water] if score @p game.data.uuid = @s game.data.uuid run tellraw @p "\u00a7eWater"

        execute as @a at @s as @e[tag=cont,tag=display_options_menu,tag=water] if score @p game.data.uuid = @s game.data.uuid unless score @s game.data.cont.viscosity_next matches -1 run tellraw @p ["\u00a7fViscosity\u00a7e: \u00a7f",{"score":{"name":"@s","objective":"game.data.cont.viscosity"},"color":"white"},"\u00a7e -> \u00a7a",{"score":{"name":"@s","objective":"game.data.cont.viscosity_next"},"color":"white"}," \u00a7e(Cost: \u00a7a",{"score":{"name":"@s","objective":"game.data.cont.viscosity_cost"},"color":"green"},"\u00a7e)"]
        execute as @a at @s as @e[tag=cont,tag=display_options_menu,tag=water] if score @p game.data.uuid = @s game.data.uuid if score @s game.data.cont.viscosity_next matches -1 run tellraw @p ["\u00a7fViscosity\u00a7e: \u00a7a",{"score":{"name":"@s","objective":"game.data.cont.viscosity"},"color":"white"},"\u00a7e -> \u00a7c\u00a7oNo Upgrades"]

        execute as @a at @s as @e[tag=cont,tag=display_options_menu,tag=water] if score @p game.data.uuid = @s game.data.uuid as @p at @s run playsound ui.button.click master @s ~ ~ ~
        execute as @a at @s as @e[tag=cont,tag=display_options_menu,tag=water] if score @p game.data.uuid = @s game.data.uuid run dialog show @p game:water_upgrade

    #Trapdoor
        execute as @a at @s as @e[tag=cont,tag=display_options_menu,tag=trapdoor] if score @p game.data.uuid = @s game.data.uuid run tellraw @p "\u00a7d-----------------------------------------------------"
        execute as @a at @s as @e[tag=cont,tag=display_options_menu,tag=trapdoor] if score @p game.data.uuid = @s game.data.uuid run tellraw @p "\u00a7eTrapdoor"

        execute as @a at @s as @e[tag=cont,tag=display_options_menu,tag=trapdoor,tag=!on_bridge] if score @p game.data.uuid = @s game.data.uuid run tellraw @p ["\u00a7bMobs Trapped\u00a7e: \u00a7f",{"score":{"name":"@s","objective":"game.data.cont.mobs_trapped"},"color":"white"},"\u00a7e / ",{"score":{"name":"@s","objective":"game.data.cont.capacity"},"color":"white"}]
        execute as @a at @s as @e[tag=cont,tag=display_options_menu,tag=trapdoor,tag=on_bridge] if score @p game.data.uuid = @s game.data.uuid run tellraw @p ["\u00a7bMobs Trapped\u00a7e: \u00a7f",{"score":{"name":"@s","objective":"game.data.cont.mobs_trapped"},"color":"white"},"\u00a7e / \u00a7f\u221e"]

        execute as @a at @s as @e[tag=cont,tag=display_options_menu,tag=trapdoor,tag=!on_bridge] if score @p game.data.uuid = @s game.data.uuid unless score @s game.data.cont.capacity_next matches -1 run tellraw @p ["\u00a7fCapacity\u00a7e: \u00a7f",{"score":{"name":"@s","objective":"game.data.cont.capacity"},"color":"white"},"\u00a7e -> \u00a7a",{"score":{"name":"@s","objective":"game.data.cont.capacity_next"},"color":"white"}," \u00a7e(Cost: \u00a7a",{"score":{"name":"@s","objective":"game.data.cont.capacity_cost"},"color":"green"},"\u00a7e)"]
        execute as @a at @s as @e[tag=cont,tag=display_options_menu,tag=trapdoor,tag=!on_bridge] if score @p game.data.uuid = @s game.data.uuid if score @s game.data.cont.capacity_next matches -1 run tellraw @p ["\u00a7fCapacity\u00a7e: \u00a7a",{"score":{"name":"@s","objective":"game.data.cont.capacity"},"color":"white"},"\u00a7e -> \u00a7c\u00a7oNo Upgrades"]

        execute as @a at @s as @e[tag=cont,tag=display_options_menu,tag=trapdoor,tag=on_bridge] if score @p game.data.uuid = @s game.data.uuid run tellraw @p ["\u00a7fCapacity\u00a7e: \u00a7f\u221e\u00a7e -> \u00a7c\u00a7oNo Upgrades"]

        execute as @a at @s as @e[tag=cont,tag=display_options_menu,tag=trapdoor] if score @p game.data.uuid = @s game.data.uuid as @p at @s run playsound ui.button.click master @s ~ ~ ~
        execute as @a at @s as @e[tag=cont,tag=display_options_menu,tag=trapdoor,tag=!on_bridge] if score @p game.data.uuid = @s game.data.uuid run dialog show @p game:trapdoor_upgrade
        execute as @a at @s as @e[tag=cont,tag=display_options_menu,tag=trapdoor,tag=on_bridge] if score @p game.data.uuid = @s game.data.uuid run dialog show @p game:generic_contraption

    #Iron Bars
        execute as @a at @s as @e[tag=cont,tag=display_options_menu,tag=iron_bars] if score @p game.data.uuid = @s game.data.uuid run tellraw @p "\u00a7d-----------------------------------------------------"
        execute as @a at @s as @e[tag=cont,tag=display_options_menu,tag=iron_bars] if score @p game.data.uuid = @s game.data.uuid run tellraw @p "\u00a7eIron Bars"
        execute as @a at @s as @e[tag=cont,tag=display_options_menu,tag=iron_bars] if score @p game.data.uuid = @s game.data.uuid as @p at @s run playsound ui.button.click master @s ~ ~ ~
        execute as @a at @s as @e[tag=cont,tag=display_options_menu,tag=iron_bars] if score @p game.data.uuid = @s game.data.uuid run dialog show @p game:generic_contraption

    execute as @a at @s as @e[tag=cont,tag=display_options_menu] if score @p game.data.uuid = @s game.data.uuid run tellraw @p ["\n\u00a7cDurability: ",{"score":{"name":"@s","objective":"game.data.health"},"color":"red"},"\u00a7c/",{"score":{"name":"@s","objective":"game.data.max_health"},"color":"red"}]
    execute as @a at @s as @e[tag=cont,tag=display_options_menu] if score @p game.data.uuid = @s game.data.uuid run tellraw @p "\u00a7d-----------------------------------------------------\n"
    
    tag @e[tag=display_options_menu] remove display_options_menu

#instruct them to turn off background blur beforehand