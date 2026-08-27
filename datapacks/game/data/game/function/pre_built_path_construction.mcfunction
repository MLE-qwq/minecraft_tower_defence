#init
    #clear out any leftover markers from a previous execution or crash
        execute unless entity @e[tag=pbpc_processing] run kill @e[tag=pbpc_path_tracker]
        execute unless entity @e[tag=pbpc_processing] run kill @e[tag=pbpc_path_tester]
    #tags a certain unprocessed additional mob spawnpoint, pbpc for pre-built path construction
        execute unless entity @e[tag=pbpc_processing] run tag @e[tag=mob_spawnpoint,tag=additional,limit=1,tag=!pbpc_processed] add newbie
        execute unless entity @e[tag=pbpc_processing] as @e[tag=newbie,tag=additional,tag=mob_spawnpoint] at @s run summon marker ~ ~ ~ {Tags:["pbpc_path_tracker"],CustomName:"PBPC Path Tracker"}
        execute unless entity @e[tag=pbpc_processing] as @e[tag=newbie,tag=additional,tag=mob_spawnpoint] at @s run summon marker ~ ~ ~ {Tags:["pbpc_path_tester"],CustomName:"PBPC Path Tester"}
        execute unless entity @e[tag=pbpc_processing] as @e[tag=newbie,tag=additional,tag=mob_spawnpoint] at @s run summon marker ~ ~ ~ {Tags:["path_block","additional"],CustomName:"PBPC Path Block"}
        execute unless entity @e[tag=pbpc_processing] run tag @e[tag=mob_spawnpoint,tag=additional,tag=newbie] add pbpc_processing
        tag @e[tag=newbie,tag=mob_spawnpoint,tag=additional] remove newbie

#tests all 4 directions for available pre-built path blocks
    execute as @e[tag=pbpc_path_tracker] at @s run tp @e[tag=pbpc_path_tester,limit=1] ~ ~ ~

    #assume the tracker is stuck until a valid path block matches
        tag @e[tag=pbpc_path_tracker] add pbpc_stuck

    #testing +x
        execute as @e[tag=pbpc_path_tracker] at @s positioned ~1 ~ ~ if blocks ~ ~ ~ ~ ~ ~ 15 -2 -14 all unless entity @e[tag=path_block,tag=additional,distance=..0.5] run tp @e[tag=pbpc_path_tester,limit=1] ~ ~ ~
        execute as @e[tag=pbpc_path_tracker] at @s positioned ~1 ~ ~ if blocks ~ ~ ~ ~ ~ ~ 15 -2 -14 all unless entity @e[tag=path_block,tag=additional,distance=..0.5] run tag @s remove pbpc_stuck

    #testing -x
        execute as @e[tag=pbpc_path_tracker] at @s positioned ~-1 ~ ~ if blocks ~ ~ ~ ~ ~ ~ 15 -2 -14 all unless entity @e[tag=path_block,tag=additional,distance=..0.5] run tp @e[tag=pbpc_path_tester,limit=1] ~ ~ ~
        execute as @e[tag=pbpc_path_tracker] at @s positioned ~-1 ~ ~ if blocks ~ ~ ~ ~ ~ ~ 15 -2 -14 all unless entity @e[tag=path_block,tag=additional,distance=..0.5] run tag @s remove pbpc_stuck

    #testing +z
        execute as @e[tag=pbpc_path_tracker] at @s positioned ~ ~ ~1 if blocks ~ ~ ~ ~ ~ ~ 15 -2 -14 all unless entity @e[tag=path_block,tag=additional,distance=..0.5] run tp @e[tag=pbpc_path_tester,limit=1] ~ ~ ~
        execute as @e[tag=pbpc_path_tracker] at @s positioned ~ ~ ~1 if blocks ~ ~ ~ ~ ~ ~ 15 -2 -14 all unless entity @e[tag=path_block,tag=additional,distance=..0.5] run tag @s remove pbpc_stuck

    #testing -z
        execute as @e[tag=pbpc_path_tracker] at @s positioned ~ ~ ~-1 if blocks ~ ~ ~ ~ ~ ~ 15 -2 -14 all unless entity @e[tag=path_block,tag=additional,distance=..0.5] run tp @e[tag=pbpc_path_tester,limit=1] ~ ~ ~
        execute as @e[tag=pbpc_path_tracker] at @s positioned ~ ~ ~-1 if blocks ~ ~ ~ ~ ~ ~ 15 -2 -14 all unless entity @e[tag=path_block,tag=additional,distance=..0.5] run tag @s remove pbpc_stuck


#tracker catches up to the successful destination found by the tester
    tp @e[tag=pbpc_path_tracker] @e[tag=pbpc_path_tester,limit=1]
    execute as @e[tag=pbpc_path_tracker] at @s run rotate @n[tag=path_block,tag=additional,distance=0.5..] facing entity @s

#recursion
    #only loop if we successfully moved (!pbpc_stuck) and hasn't hit the end
        execute as @e[tag=pbpc_path_tracker,tag=!pbpc_stuck] at @s unless entity @e[tag=path_ending,distance=..0.5] run summon marker ~ ~ ~ {Tags:["path_block","additional","newbie"],CustomName:"PBPC Path Block"}
        execute as @e[tag=pbpc_path_tracker,tag=!pbpc_stuck] at @s unless entity @e[tag=path_ending,distance=..0.5] as @e[tag=path_block,tag=additional,tag=newbie] at @s run rotate @s facing entity @n[tag=path_block,tag=additional,tag=!newbie]
        execute as @e[tag=pbpc_path_tracker,tag=!pbpc_stuck] at @s unless entity @e[tag=path_ending,distance=..0.5] as @e[tag=path_block,tag=additional,tag=newbie] at @s run rotate @s ~180 ~
        tag @e[tag=path_block,tag=additional,tag=newbie] remove newbie
        execute as @e[tag=pbpc_path_tracker,tag=!pbpc_stuck] at @s unless entity @e[tag=path_ending,distance=..0.5] run return run function game:pre_built_path_construction

#cleaning up current markers because we either finished the path or hit a dead end
    kill @e[tag=pbpc_path_tester]
    kill @e[tag=pbpc_path_tracker]

    tag @e[tag=pbpc_processing] add pbpc_processed
    tag @e[tag=pbpc_processing] remove pbpc_processing

#making the most recent pbpc path block face the path ending
    execute as @e[tag=path_ending] at @s as @e[tag=path_block,tag=additional,distance=..1.5] at @s run rotate @s facing entity @n[tag=path_ending]

#find the next unprocessed mob spawnpoint and restart the function
    execute if entity @e[tag=mob_spawnpoint,tag=additional,tag=!pbpc_processed] run function game:pre_built_path_construction