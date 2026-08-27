#assign a unique id for each player
    scoreboard players set @a game.data.uuid 0
    scoreboard players set * game.data.uuid 0
    scoreboard players set #global game.data.uuid 1

    execute as @a at @s run function game:assign_unique_id with entity @s

#tps player to the beginning of the path
    execute as @e[tag=path_start] at @s run tp @a ~ ~1 ~ facing entity @n[tag=path_ending]

#terrain init
    execute as @e[tag=terrain_origin,limit=1] at @s run clone ~ ~ ~ ~32 ~17 ~32 -16 0 -16

#displays text above bonus chests
    execute as @e[tag=bonus_chest] at @s run summon text_display ~ ~2 ~ {Tags:["bonus_chest_display"],billboard:"center","text":["\u00a7a$",{"score":{"name":"@n[tag=bonus_chest]","objective":"game.data.bonus_chest.currany"},"color":"green"}]}

#scoreboard
    scoreboard players set @e[tag=path_start] game.data.spawnpoint.mob_spawnpoint 0

#giving outline to the target block
    summon minecraft:shulker 0 -1 0 {NoAI:1b,Tags:["block_outline2"],CustomName:"Block Outline 2"}
    summon minecraft:shulker 0 -1 0 {NoAI:1b,Tags:["block_outline"],CustomName:"Block Outline"}
        effect give @e[tag=block_outline] minecraft:invisibility infinite 255 true
        effect give @e[tag=block_outline] minecraft:glowing infinite 255 true
        effect give @e[tag=block_outline] minecraft:resistance infinite 255 true

        effect give @e[tag=block_outline2] minecraft:invisibility infinite 255 true
        effect give @e[tag=block_outline2] minecraft:glowing infinite 255 true
        effect give @e[tag=block_outline2] minecraft:resistance infinite 255 true
    attribute @e[tag=block_outline,limit=1] scale base set 0.9999
    attribute @e[tag=block_outline2,limit=1] scale base set 0.9999
    team add game.green_outline
        team modify game.green_outline color green
        team join game.green_outline @e[tag=block_outline]
    team add game.yellow_outline
        team modify game.yellow_outline color yellow
        team join game.yellow_outline @e[tag=block_outline2]
    tp @e[tag=block_outline] @e[tag=path_ending,limit=1]
    tp @e[tag=block_outline2] @e[tag=path_start,limit=1]

#spawnpoint
    execute as @e[tag=path_start] at @s run spawnpoint @a ~ ~1 ~ 0.0 0.0
    execute as @e[tag=path_start] at @s run setworldspawn ~ ~1 ~

#constructing pre-build path(s)
    execute if entity @e[tag=additional,tag=mob_spawnpoint] run function game:pre_built_path_construction

#setting up path construction system
#path_tracker: a marker that indicates the most recent path block
#path_tester: a marker that will be teleported in all 4 directions around the path_tracker looking for legitimate air blocks

    execute as @e[tag=path_start] at @s run summon minecraft:marker ~ ~ ~ {Tags:["path_tracker"],CustomName:"Path Tracker"}
    execute as @e[tag=path_start] at @s run summon minecraft:marker ~ ~ ~ {Tags:["path_tester"],CustomName:"Path Tester"}
    #generates path block marker
    execute as @e[tag=path_tracker] at @s run summon minecraft:marker ~ ~ ~ {Tags:["path_block"],CustomName:"Path Block"}

#displaying instructions in chat
    tellraw @a "\n\u00a7eObjective: Construct a path towards the \u00a7agreen glowing block \u00a7eand defend yourself by purchasing and upgrading contraptions.\n- You have\u00a7b 1 \u00a7emin \u00a7b40 \u00a7esec \u00a7bpreparation time \u00a7euntil the sky darkens and the waves start.\n- You have \u00a7b20 \u00a7esec \u00a7bpreparation time\u00a7e between waves.\n- You may \u00a7bopen game menu\u00a7e by \u00a7bdropping \u00a7ethe \u00a7bcompass\u00a7e in your hotbar.\n- You will gain currency upon killing a mob."

    tellraw @a "\n\u00a77You may dismiss by pressing F3+D.\n\u00a7eGood luck."
    
    tellraw @a "\u00a7d-----------------------------------------------------"
    execute as @a at @s run playsound entity.experience_orb.pickup master @s ~ ~ ~

#sets the loop function to path_construction
    scoreboard players set #global game.state 1
    scoreboard players set #global game.state.waves_have_started 0

#removes player on fire state
    gamemode spectator @a