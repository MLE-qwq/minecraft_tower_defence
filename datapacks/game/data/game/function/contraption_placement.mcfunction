#this function processes how the player interacts with the contraptions

#recovery of items accidentally put in slots preserved for functional items
    function game:item_recovery_main

#recovery for egg dispensers in case they accidentally projected the egg by right clicking
    execute as @e[type=egg] at @s run give @p minecraft:egg[lore=["","\u00a7bFunction: Projects eggs in all 4 directions. Has \u00a7c150 Durability\u00a7b.","\u00a7eTrigger: Drop the item onto a block \u00a7aadjacent \u00a7eto a path block.","\u00a7eCannot be put on any path blocks."],custom_data={id:"cont_egg_disp",is_cont:true,item_recovery:true}] 1
    execute as @e[type=egg] as @p at @s run playsound entity.chicken.hurt master @s ~ ~1 ~
    execute as @e[type=egg] at @s run tellraw @p "\u00a7cTo place this contraption you shall drop it onto blocks adjacent to the path (default keybind: Q) instead of projecting it."
    execute as @e[type=egg] at @s run kill @s

#removes tools, bridging blocks and the outline at the block at the end of the path
    clear @a *[minecraft:custom_data~{id:"tool"}]
    clear @a *[minecraft:custom_data~{id:"bridging_block"}]
    #tps the outline to somewhere not visible
    tp @e[tag=block_outline] 0 -1 0
    effect clear @e[tag=block_outline] minecraft:glowing

function hardcode:generic.mob_cont_behavior_global

#process contraption upgrades
    function game:cont_upgrades

#removes all projectiles
    execute if score #global game.state.waves_have_started matches 0 run kill @e[tag=projectile]

#proccesses usage of items
    item replace entity @a hotbar.8 with compass[enchantment_glint_override=true,minecraft:item_name="Game Menu",lore=["","\u00a7bFunction: Opens game menu.","\u00a7eTrigger: Drop the item."],minecraft:custom_data={id:"game_menu",kill_on_drop:1b}]

    item replace entity @a hotbar.7 with golden_hoe[damage_resistant={types:"#minecraft:is_fire"},enchantment_glint_override=true,item_name="Contraption Options",lore=["","\u00a7bFunction: Opens a menu of options you could do to a certain contraption.","\u00a7eTrigger: Drop the item onto the contraption of interest."],custom_data={id:"cont_options"}] 1

    #if paused, prevent interaction with contraptions
        execute if score #global game.state.paused matches 1 run item replace entity @a hotbar.7 with barrier[custom_name="Item Unavailable",lore=["","\u00a7cResume time to be able to continue to use the item."],custom_data={kill_on_drop:1b,id:"placeholder"}]

    #contraption upgrades & operations
        execute as @e[type=item] at @s if items entity @s contents *[custom_data~{id:"cont_options"}] if entity @e[tag=cont,distance=..0.5] run function game:assign_cont_to_thrower with entity @s
        #execute as @e[type=item] at @s if items entity @s contents *[custom_data~{id:"cont_options"}] if entity @e[tag=cont,distance=..0.5] run dialog clear @a
        execute as @e[type=item] at @s if items entity @s contents *[custom_data~{id:"cont_options"}] if entity @e[tag=cont,distance=..0.5] run kill @s
        execute as @e[type=item] at @s if items entity @s contents *[custom_data~{id:"cont_options"}] if entity @s[nbt={OnGround:1b}] run kill @s

    #processes game menu
        scoreboard players enable @a game.trigger.operation
        execute as @e[type=item] if items entity @s contents *[custom_data~{id:"game_menu"}] run dialog show @p game:contraption_placement_menu
        #processes countdown skipping: #1
            #succeeded
                execute as @a at @s if score @s game.trigger.operation matches 1 if score #global game.state.waves_have_started matches 0 run scoreboard players set #global game.state.paused 0
                execute as @a at @s if score @s game.trigger.operation matches 1 if score #global game.state.waves_have_started matches 0 run time set 14000
                execute as @a at @s if score @s game.trigger.operation matches 1 if score #global game.state.waves_have_started matches 0 run scoreboard players set #global game.mechanism.timer 0
                execute as @a at @s if score @s game.trigger.operation matches 1 if score #global game.state.waves_have_started matches 0 as @a at @s run playsound entity.bat.takeoff master @s ~ ~ ~ 1 1
                #announces who skipped the countdown (the player nearest to the item)
                    execute as @a at @s if score @s game.trigger.operation matches 1 if score #global game.state.waves_have_started matches 0 run tellraw @a ["",{"selector":"@s"},"\u00a7e has skipped the countdown."]
            
            #failed: waves already started
                execute unless score #global game.state.paused matches 1 as @a at @s if score @s game.trigger.operation matches 1 if score #global game.state.waves_have_started matches 1.. run tellraw @s "\u00a7cThere are currently no countdowns available to be skipped."
                execute unless score #global game.state.paused matches 1 as @a at @s if score @s game.trigger.operation matches 1 if score #global game.state.waves_have_started matches 1.. run playsound block.anvil.land master @s ~ ~ ~ 1 0.5
            execute as @a at @s if score @s game.trigger.operation matches 1 run scoreboard players set @s game.trigger.operation 0

        #processes purchase menu display: #2
            scoreboard players enable @a game.trigger.purchase
            execute if score #global game.state.paused matches 0 as @a at @s if score @s game.trigger.operation matches 2 run tag @s add show_purchase_menu
            execute if score #global game.state.paused matches 1 as @a at @s if score @s game.trigger.operation matches 2 run tellraw @s "\u00a7cYou may not open the purchase menu until you resume the game."
            execute if score #global game.state.paused matches 1 as @a at @s if score @s game.trigger.operation matches 2 run playsound block.anvil.land master @s ~ ~ ~ 1 0.5
            execute if entity @a[tag=show_purchase_menu] run function game:purchases
            execute unless entity @a[tag=show_purchase_menu] as @a at @s if score @s game.trigger.purchase matches 1.. run function game:purchases
            execute as @a at @s if score @s game.trigger.operation matches 2 run scoreboard players set @s game.trigger.operation 0
    

    #removes dropped items
    execute as @e[type=item] if items entity @s contents *[custom_data~{kill_on_drop:1b}] run kill @s

    #prevents duping
        scoreboard objectives add game.watchdog.excess_items dummy

        scoreboard players set @a game.watchdog.excess_items 0
        execute as @a at @s store result score @s game.watchdog.excess_items if items entity @s container.* *[minecraft:custom_data~{id:"game_menu"}]
        execute as @a at @s if score @s game.watchdog.excess_items matches 2.. run clear @s *[minecraft:custom_data~{id:"game_menu"}]

        scoreboard players set @a game.watchdog.excess_items 0
        execute as @a at @s store result score @s game.watchdog.excess_items if items entity @s container.* *[minecraft:custom_data~{id:"cont_options"}]
        execute as @a at @s if score @s game.watchdog.excess_items matches 2.. run clear @s *[minecraft:custom_data~{id:"cont_options"}]
        
        scoreboard players set @a game.watchdog.excess_items 0
        execute as @a at @s store result score @s game.watchdog.excess_items if items entity @s container.* *[minecraft:custom_data~{id:"placeholder"}]
        execute as @a at @s if score @s game.watchdog.excess_items matches 2.. run clear @s *[minecraft:custom_data~{id:"placeholder"}]

#processes the progress of time
    execute unless score #global game.state.paused matches 1 if score #global game.mechanism.timer matches 1.. run scoreboard players remove #global game.mechanism.timer 1
    #time progresses from 0 to 14000 in 1 min 40 sec, hence +7 per tick
    execute unless score #global game.state.paused matches 1 if score #global game.mechanism.timer matches 1.. run time add 7
    scoreboard objectives add game.mechanism.timer.sec dummy
    scoreboard objectives add game.mechanism.timer.min dummy
    scoreboard objectives add const.20 dummy
    scoreboard objectives add const.60 dummy
    scoreboard players set #global const.20 20
    scoreboard players set #global const.60 60
    scoreboard players operation #global game.mechanism.timer.sec = #global game.mechanism.timer
    scoreboard players operation #global game.mechanism.timer.sec /= #global const.20
    scoreboard players operation #global game.mechanism.timer.min = #global game.mechanism.timer.sec
    scoreboard players operation #global game.mechanism.timer.min /= #global const.60
    scoreboard players operation #global game.mechanism.timer.sec %= #global const.60

    function game:actionbar


#processes contraction placement
    function hardcode:cont.new

    #items dropped must not be in batches if so then return it to the player
        execute as @e[type=item] at @s if items entity @s contents *[custom_data~{is_cont:true}] unless items entity @s contents *[count=1] run data merge entity @s {PickupDelay:0s}
        execute as @e[type=item] at @s if items entity @s contents *[custom_data~{is_cont:true}] unless items entity @s contents *[count=1] run tellraw @p "\u00a7cYou may only drop one item at a time."
        execute as @e[type=item] at @s if items entity @s contents *[custom_data~{is_cont:true}] unless items entity @s contents *[count=1] as @p at @s run playsound entity.experience_orb.pickup master @s ~ ~ ~ 1 0.5
        execute as @e[type=item] at @s if items entity @s contents *[custom_data~{is_cont:true}] unless items entity @s contents *[count=1] run tp @p

    #once item falls onto the ground, or when game paused give it back to the player
        execute as @e[type=item,nbt={OnGround:1b}] at @s if items entity @s contents *[count=1] if items entity @s contents *[custom_data~{is_cont:true}] run data merge entity @s {PickupDelay:0s}
        execute as @e[type=item,nbt={OnGround:1b}] at @s if items entity @s contents *[count=1] if items entity @s contents *[custom_data~{is_cont:true}] run tellraw @p "\u00a7cInvalid position."
        execute as @e[type=item,nbt={OnGround:1b}] at @s if items entity @s contents *[count=1] if items entity @s contents *[custom_data~{is_cont:true}] as @p at @s run playsound entity.experience_orb.pickup master @s ~ ~ ~ 1 0.5
        execute as @e[type=item,nbt={OnGround:1b}] at @s if items entity @s contents *[count=1] if items entity @s contents *[custom_data~{is_cont:true}] run tp @p

        execute if score #global game.state.paused matches 1 as @e[type=item] at @s if items entity @s contents *[count=1] if items entity @s contents *[custom_data~{is_cont:true}] run data merge entity @s {PickupDelay:0s}
        execute if score #global game.state.paused matches 1 as @e[type=item] at @s if items entity @s contents *[count=1] if items entity @s contents *[custom_data~{is_cont:true}] run tellraw @p "\u00a7cYou may not place contraptions until you resume time."
        execute if score #global game.state.paused matches 1 as @e[type=item] at @s if items entity @s contents *[count=1] if items entity @s contents *[custom_data~{is_cont:true}] as @p at @s run playsound entity.experience_orb.pickup master @s ~ ~ ~ 1 0.5
        execute if score #global game.state.paused matches 1 as @e[type=item] at @s if items entity @s contents *[count=1] if items entity @s contents *[custom_data~{is_cont:true}] run tp @p

#processes level quitting
    #displays which player triggered level quitting in chat
        execute as @a at @s if score @s game.trigger.operation matches -1 as @a at @s run playsound minecraft:entity.experience_orb.pickup master @s ~ ~ ~ 1 0.5
        execute as @a at @s if score @s game.trigger.operation matches -1 run tellraw @a ["",{"selector":"@s"},"\u00a7e decided to terminate the level."]
        execute as @a at @s if score @s game.trigger.operation matches -1 run tellraw @a "\u00a7cLevel terminated."
    execute as @a at @s if score @s game.trigger.operation matches -1 run function game:quit_level
    execute as @a at @s if score @s game.trigger.operation matches -1 run scoreboard players set @s game.trigger.operation 0

#tps mannequin to the ending of the path
    execute as @e[tag=path_tracker] at @s run tp @e[tag=npc] ~ ~1 ~ facing entity @n[tag=path_block,tag=!additional,distance=0.5..]
    execute as @e[tag=npc] at @s run rotate @s ~ 0

#gives players effects
effect give @a saturation infinite 255 true
effect clear @a resistance