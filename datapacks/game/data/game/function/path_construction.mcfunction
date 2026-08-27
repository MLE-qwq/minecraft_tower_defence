#this function processes how the path is constructed from the initial position to the targer position

#initializes timer
    execute unless score #global game.state_prev matches 1 run time set 0
    execute unless score #global game.state_prev matches 1 run scoreboard objectives add game.mechanism.timer dummy
    # 1 min and 40 sec = 2000 ticks
    execute unless score #global game.state_prev matches 1 run scoreboard players set #global game.mechanism.timer 2000

    #teleports the tester to any player holding the tool
        tag @a remove tester_anchor
        execute as @a[x=-16,y=0,z=-16,dx=32,dy=16,dz=32,nbt={Dimension:"minecraft:overworld"}] at @s if items entity @s weapon.mainhand *[custom_data~{id:"tool"}] run tag @s add tester_anchor
        execute as @r[tag=tester_anchor] at @s run tp @e[tag=path_tester] ~ ~-1 ~
        tag @a remove tester_anchor

    #normalizing the coordinates of the tester
        scoreboard objectives add _ dummy
        execute as @e[tag=path_tester] at @s store result score #global _ run data get entity @s Pos[0] 1.0
        scoreboard players operation #global _ *= #global const.10
        scoreboard players operation #global _ += #global const.5
        execute store result entity @e[tag=path_tester,limit=1] Pos[0] double 0.1 run scoreboard players get #global _

        execute as @e[tag=path_tester] at @s store result score #global _ run data get entity @s Pos[1] 1.0 
        execute store result entity @e[tag=path_tester,limit=1] Pos[1] double 1 run scoreboard players get #global _

        execute as @e[tag=path_tester] at @s store result score #global _ run data get entity @s Pos[2] 1.0
        scoreboard players operation #global _ *= #global const.10
        scoreboard players operation #global _ += #global const.5
        execute store result entity @e[tag=path_tester,limit=1] Pos[2] double 0.1 run scoreboard players get #global _

    #if the tester is at a block other than the dedicated original block, water, air AND there are no markers indicating that the position is valid, then invalid
        execute as @e[tag=path_tester] at @s unless blocks ~ ~ ~ ~ ~ ~ 15 -2 -13 all unless block ~ ~ ~ water unless block ~ ~ ~ air unless entity @e[tag=path_validity,distance=..0.5] run tp @e[tag=path_tester] @e[tag=path_tracker,limit=1]

    #if the tester is at a block containing a marker with path_forbidden tag then invalid
        execute as @e[tag=path_tester] at @s if entity @e[tag=path_forbidden,distance=..0.5] run tp @e[tag=path_tester] @e[tag=path_tracker,limit=1]

    #but if there are adjacent blocks that are intended to be "auto-adsorped" then proceed
        execute as @e[tag=path_tracker] at @s positioned ~1 ~ ~ if entity @e[tag=auto_replace,distance=..0.5] run tp @e[tag=path_tester] ~ ~ ~
        execute as @e[tag=path_tracker] at @s positioned ~-1 ~ ~ if entity @e[tag=auto_replace,distance=..0.5] run tp @e[tag=path_tester] ~ ~ ~
        execute as @e[tag=path_tracker] at @s positioned ~ ~ ~1 if entity @e[tag=auto_replace,distance=..0.5] run tp @e[tag=path_tester] ~ ~ ~
        execute as @e[tag=path_tracker] at @s positioned ~ ~ ~-1 if entity @e[tag=auto_replace,distance=..0.5] run tp @e[tag=path_tester] ~ ~ ~

    #detects if the path_tester is at the same y level as the path_tracker if so legitimate so far
        scoreboard objectives add game.mechanism.path_tracker_y dummy
        execute as @e[tag=path_tracker] at @s store result score #global game.mechanism.path_tracker_y run data get entity @s Pos[1] 1.0
        scoreboard objectives add game.mechanism.path_tester_y dummy
        execute as @e[tag=path_tester] at @s store result score #global game.mechanism.path_tester_y run data get entity @s Pos[1] 1.0
        execute unless score #global game.mechanism.path_tracker_y = #global game.mechanism.path_tester_y run tp @e[tag=path_tester] @e[tag=path_tracker,limit=1]

    #detects if the path_tester is adjacent to the path_tracker if so legitimate so far
        scoreboard objectives add _ dummy
        scoreboard objectives add game.mechanism.path_tracker_x dummy
        scoreboard objectives add game.mechanism.path_tracker_z dummy
        scoreboard objectives add game.mechanism.path_tester_x dummy
        scoreboard objectives add game.mechanism.path_tester_z dummy

        execute as @e[tag=path_tracker] at @s store result score #global game.mechanism.path_tracker_x run data get entity @s Pos[0] 1.0
        execute as @e[tag=path_tracker] at @s store result score #global game.mechanism.path_tracker_z run data get entity @s Pos[2] 1.0

        execute as @e[tag=path_tester] at @s store result score #global game.mechanism.path_tester_x run data get entity @s Pos[0] 1.0
        execute as @e[tag=path_tester] at @s store result score #global game.mechanism.path_tester_z run data get entity @s Pos[2] 1.0

        scoreboard players set #global _ 0

        scoreboard players add #global game.mechanism.path_tracker_x 1
        execute if score #global game.mechanism.path_tester_x = #global game.mechanism.path_tracker_x if score #global game.mechanism.path_tester_z = #global game.mechanism.path_tracker_z run scoreboard players set #global _ 1

        scoreboard players remove #global game.mechanism.path_tracker_x 2
        execute if score #global game.mechanism.path_tester_x = #global game.mechanism.path_tracker_x if score #global game.mechanism.path_tester_z = #global game.mechanism.path_tracker_z run scoreboard players set #global _ 1

        scoreboard players add #global game.mechanism.path_tracker_x 1
        scoreboard players add #global game.mechanism.path_tracker_z 1
        execute if score #global game.mechanism.path_tester_x = #global game.mechanism.path_tracker_x if score #global game.mechanism.path_tester_z = #global game.mechanism.path_tracker_z run scoreboard players set #global _ 1

        scoreboard players remove #global game.mechanism.path_tracker_z 2
        execute if score #global game.mechanism.path_tester_x = #global game.mechanism.path_tracker_x if score #global game.mechanism.path_tester_z = #global game.mechanism.path_tracker_z run scoreboard players set #global _ 1

        #execute if score #global _ matches 1 run tellraw @a [{"score":{"objective":"game.mechanism.path_tracker_x","name":"#global"}}," ",{"score":{"objective":"game.mechanism.path_tracker_z","name":"#global"}}," / ",{"score":{"objective":"game.mechanism.path_tester_x","name":"#global"}}," ",{"score":{"objective":"game.mechanism.path_tester_z","name":"#global"}}]
        execute unless score #global _ matches 1 run tp @e[tag=path_tester] @e[tag=path_tracker,limit=1]
   
    #execute as @a at @s if items entity @s weapon.mainhand *[custom_data~{id:"tool"}] as @e[tag=path_tester] at @s run summon armor_stand

    scoreboard objectives add game.mechanism.adjacent_path_blocks dummy
    scoreboard players set #global game.mechanism.adjacent_path_blocks 0
    execute as @e[tag=path_tester] at @s positioned ~1 ~ ~ if entity @e[tag=path_block,tag=!additional,distance=..0.5] run scoreboard players add #global game.mechanism.adjacent_path_blocks 1
    execute as @e[tag=path_tester] at @s positioned ~-1 ~ ~ if entity @e[tag=path_block,tag=!additional,distance=..0.5] run scoreboard players add #global game.mechanism.adjacent_path_blocks 1
    execute as @e[tag=path_tester] at @s positioned ~ ~ ~1 if entity @e[tag=path_block,tag=!additional,distance=..0.5] run scoreboard players add #global game.mechanism.adjacent_path_blocks 1
    execute as @e[tag=path_tester] at @s positioned ~ ~ ~-1 if entity @e[tag=path_block,tag=!additional,distance=..0.5] run scoreboard players add #global game.mechanism.adjacent_path_blocks 1

    execute if score #global game.mechanism.adjacent_path_blocks matches 1 run tp @e[tag=path_tracker] @e[tag=path_tester,limit=1]
    execute if score #global game.mechanism.adjacent_path_blocks matches 1 as @e[tag=path_tracker,limit=1] at @s run rotate @n[tag=path_block,tag=!additional] facing entity @s
    execute unless score #global game.mechanism.adjacent_path_blocks matches 1 run tp @e[tag=path_tester] @e[tag=path_tracker,limit=1]
#end

#processes bonus chests
    execute as @e[tag=path_tracker] at @s if entity @e[tag=bonus_chest,distance=..0.5] run scoreboard players operation #global game.data.currency += @n[tag=bonus_chest] game.data.bonus_chest.currany

    execute as @e[tag=path_tracker] at @s if entity @e[tag=bonus_chest,distance=..0.5] run scoreboard players operation #global game.mechanism.new_currency_display = @n[tag=bonus_chest] game.data.bonus_chest.currany
    execute as @e[tag=path_tracker] at @s if entity @e[tag=bonus_chest,distance=..0.5] run scoreboard players set #global game.mechanism.new_currency_display_cd 40

    execute as @e[tag=path_tracker] at @s if entity @e[tag=bonus_chest,distance=..0.5] run playsound block.chest.open block @a ~ ~1 ~
    execute as @e[tag=path_tracker] at @s if entity @e[tag=bonus_chest,distance=..0.5] as @a at @s run playsound block.amethyst_block.hit master @s ~ ~ ~
    execute as @e[tag=path_tracker] at @s if entity @e[tag=bonus_chest,distance=..0.5] run kill @n[tag=bonus_chest_display]
    execute as @e[tag=path_tracker] at @s if entity @e[tag=bonus_chest,distance=..0.5] run kill @n[tag=bonus_chest]

#generates path block marker
    tag @e[tag=path_tracker] remove on_bridge
    execute as @e[tag=path_tracker] at @s if block ~ ~ ~ air run tag @s add on_bridge
    execute as @e[tag=path_tracker] at @s if block ~ ~ ~ water run tag @s add on_bridge

    execute as @e[tag=path_tracker] at @s unless entity @e[distance=..0.5,tag=path_block] if entity @e[tag=auto_replace,distance=..0.5] run summon minecraft:marker ~ ~ ~ {Tags:["path_block","newbie"],CustomName:"Path Block"}
    execute as @e[tag=path_tracker,tag=!on_bridge] at @s unless entity @e[distance=..0.5,tag=path_block] run summon minecraft:marker ~ ~ ~ {Tags:["path_block","newbie"],CustomName:"Path Block"}
    execute as @e[tag=path_tracker,tag=on_bridge] at @s unless entity @e[distance=..0.5,tag=path_block] run summon minecraft:marker ~ ~ ~ {Tags:["path_block","bridged","newbie"],CustomName:"Path Block"}
    execute as @e[tag=path_block,tag=newbie,tag=!bridged] at @s run setblock ~ ~ ~ air destroy
    execute as @e[tag=path_block,tag=newbie,tag=!bridged] at @s run playsound minecraft:block.gravel.place block @a ~ ~ ~ 1 0.8
    execute as @e[tag=path_block,tag=newbie,tag=bridged] at @s run playsound block.wood.place block @a ~ ~ ~
    tag @e[tag=path_block,tag=newbie] remove newbie
    execute as @e[tag=path_tracker] at @s run kill @e[tag=auto_replace,distance=..0.5]

    tp @e[tag=block_outline2] @e[tag=path_tracker,limit=1]

#displays path blocks
    execute as @e[tag=!additional,tag=path_block] at @s unless block ~ ~1 ~ cobweb run fill ~ ~1 ~ ~ ~2 ~ air
    execute as @e[tag=!additional,tag=path_block,tag=bridged] at @s run setblock ~ ~ ~ oak_planks
    execute as @e[tag=!additional,tag=path_block,tag=!bridged] at @s run clone 15 -2 -15 15 -2 -15 ~ ~ ~

#manages items

    execute as @a at @s run item replace entity @s hotbar.0 with minecraft:iron_shovel[minecraft:lore=["","\u00a7bFunction: To construct a path.","\u00a7eTrigger: Hold the item and walk onto","\u00a7ethe block which you wish to construct the path on. ","\u00a7eIf you wish to bridge, sneak and walk onto","\u00a7ethe edge of the block. ","\u00a7eYou can only construct on the four adjacent","\u00a7eblocks of the yellow glowing block, and","\u00a7ethe path constructed cannot overlap","\u00a7ewith any previous sections."],custom_data={kill_on_drop:1b,id:"tool"}]

    #if paused, prevent interaction with terrain
        execute if score #global game.state.paused matches 1 run item replace entity @a hotbar.0 with barrier[custom_name="Item Unavailable",lore=["","\u00a7cResume time to be able to continue to use the item."],custom_data={kill_on_drop:1b,id:"placeholder"}]

    #processes the usage of tools
    item replace entity @a hotbar.8 with compass[enchantment_glint_override=true,minecraft:item_name="Game Memu",lore=["","\u00a7bFunction: Displays game menu.","\u00a7eTrigger: Drop the item."],minecraft:custom_data={id:"game_menu",kill_on_drop:1b}]

    #processes game menu
        scoreboard players enable @a game.trigger.operation
        execute as @e[type=item] if items entity @s contents *[custom_data~{id:"game_menu"}] run dialog show @p game:path_construction_menu

    #removes dropped items
    execute as @e[type=item] if items entity @s contents *[custom_data~{kill_on_drop:1b}] run kill @s
    
    #duping prevention
        scoreboard objectives add game.watchdog.excess_items dummy

        scoreboard players set @a game.watchdog.excess_items 0
        execute as @a at @s store result score @s game.watchdog.excess_items if items entity @s container.* *[minecraft:custom_data~{id:"tool"}]
        execute as @a at @s if score @s game.watchdog.excess_items matches 2.. run clear @s *[minecraft:custom_data~{id:"tool"}]

        scoreboard players set @a game.watchdog.excess_items 0
        execute as @a at @s store result score @s game.watchdog.excess_items if items entity @s container.* *[minecraft:custom_data~{id:"game_menu"}]
        execute as @a at @s if score @s game.watchdog.excess_items matches 2.. run clear @s *[minecraft:custom_data~{id:"game_menu"}]
        
        scoreboard players set @a game.watchdog.excess_items 0
        execute as @a at @s store result score @s game.watchdog.excess_items if items entity @s container.* *[minecraft:custom_data~{id:"placeholder"}]
        execute as @a at @s if score @s game.watchdog.excess_items matches 3.. run clear @s *[minecraft:custom_data~{id:"placeholder"}]

#progresses the timer
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

#detects if the path construction is complete
    execute as @e[tag=path_tracker,tag=!path_construction_complete] at @s if entity @e[tag=path_ending,distance=..0.5] as @e[tag=path_ending] at @s run tp @s @n[tag=path_block]
    execute as @e[tag=path_tracker,tag=!path_construction_complete] at @s if entity @e[tag=path_ending,distance=..0.5] run scoreboard players set #global game.state 2

    #execute as @e[tag=path_tracker,tag=!path_construction_complete] at @s if entity @e[tag=path_ending,distance=..0.5] as @e[tag=!additional,tag=path_block] at @s run fill ~ ~1 ~ ~ ~2 ~ air

    execute as @e[tag=path_tracker,tag=!path_construction_complete] at @s if entity @e[tag=path_ending,distance=..0.5] run function game:summon_mannequin with entity @a[limit=1]
    execute as @e[tag=path_tracker,tag=!path_construction_complete] at @s if entity @e[tag=path_ending,distance=..0.5] run tp @e[tag=npc] ~ ~1 ~ facing entity @n[tag=path_block,distance=0.5..]
    execute as @e[tag=path_tracker,tag=!path_construction_complete] at @s if entity @e[tag=path_ending,distance=..0.5] as @e[tag=npc] at @s run rotate @s ~ 0
    execute as @e[tag=path_tracker,tag=!path_construction_complete] at @s if entity @e[tag=path_ending,distance=..0.5] run effect clear @e[tag=block_outline2] glowing
    execute as @e[tag=path_tracker,tag=!path_construction_complete] at @s if entity @e[tag=path_ending,distance=..0.5] run tp @e[tag=block_outline2] 0 -100 0
    execute as @e[tag=path_tracker,tag=!path_construction_complete] at @s if entity @e[tag=path_ending,distance=..0.5] run kill @e[tag=block_outline2]
    execute as @e[tag=path_tracker,tag=!path_construction_complete] at @s if entity @e[tag=path_ending,distance=..0.5] run tag @s add path_construction_complete

#adjusts rotation of bonus chests
    execute as @e[tag=bonus_chest] at @s run rotate @s facing entity @p
    tag @e[tag=bonus_chest] add rotation_assignment
    function game:assign_rotation_tags
    execute as @e[tag=bonus_chest,tag=+x] at @s run setblock ~ ~1 ~ chest[facing=east]
    execute as @e[tag=bonus_chest,tag=-x] at @s run setblock ~ ~1 ~ chest[facing=west]
    execute as @e[tag=bonus_chest,tag=+z] at @s run setblock ~ ~1 ~ chest[facing=south]
    execute as @e[tag=bonus_chest,tag=-z] at @s run setblock ~ ~1 ~ chest[facing=north]


#processes level quitting
    #displays which player triggered level quitting in chat
        execute as @a at @s if score @s game.trigger.operation matches -1 as @a at @s run playsound minecraft:entity.experience_orb.pickup master @s ~ ~ ~ 1 0.5
        execute as @a at @s if score @s game.trigger.operation matches -1 run tellraw @a ["",{"selector":"@s"},"\u00a7e decided to terminate the level."]
        execute as @a at @s if score @s game.trigger.operation matches -1 run tellraw @a "\u00a7cLevel terminated."
    execute as @a at @s if score @s game.trigger.operation matches -1 run function game:quit_level
    execute as @a at @s if score @s game.trigger.operation matches -1 run scoreboard players set @s game.trigger.operation 0
#gives players effects
    effect give @a saturation infinite 255 true
    effect clear @a resistance