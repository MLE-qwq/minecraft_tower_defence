#0: Creeper
    execute if score #global game.mechanism.mob_spawn_cd matches ..0 if score @e[tag=current_instructor_chosen,limit=1] game.data.wave.mob_type matches 0 as @e[tag=current_spawnpoint_chosen] at @s run summon creeper ~ ~-1 ~ {NoAI:1b,Invulnerable:1b,Tags:["mob","health_tracking","newbie"]}
    execute if score #global game.mechanism.mob_spawn_cd matches ..0 if score @e[tag=current_instructor_chosen,limit=1] game.data.wave.mob_type matches 0 run scoreboard players set @e[tag=mob,tag=newbie] game.data.mob.ticks_per_block 7
    execute if score #global game.mechanism.mob_spawn_cd matches ..0 if score @e[tag=current_instructor_chosen,limit=1] game.data.wave.mob_type matches 0 run scoreboard players set @e[tag=mob,tag=newbie] game.data.mob.ticks_per_block_original 7
    execute if score #global game.mechanism.mob_spawn_cd matches ..0 if score @e[tag=current_instructor_chosen,limit=1] game.data.wave.mob_type matches 0 run scoreboard players set @e[tag=mob,tag=newbie] game.data.mob.currency_drop 20
#1: Wolf
    execute if score #global game.mechanism.mob_spawn_cd matches ..0 if score @e[tag=current_instructor_chosen,limit=1] game.data.wave.mob_type matches 1 as @e[tag=current_spawnpoint_chosen] at @s run summon wolf ~ ~-1 ~ {NoAI:1b,Invulnerable:1b,Tags:["mob","health_tracking","newbie"],anger_end_time:9223372036854775807L}
    execute if score #global game.mechanism.mob_spawn_cd matches ..0 if score @e[tag=current_instructor_chosen,limit=1] game.data.wave.mob_type matches 1 run scoreboard players set @e[tag=mob,tag=newbie] game.data.mob.ticks_per_block 5
    execute if score #global game.mechanism.mob_spawn_cd matches ..0 if score @e[tag=current_instructor_chosen,limit=1] game.data.wave.mob_type matches 1 run scoreboard players set @e[tag=mob,tag=newbie] game.data.mob.ticks_per_block_original 5
    execute if score #global game.mechanism.mob_spawn_cd matches ..0 if score @e[tag=current_instructor_chosen,limit=1] game.data.wave.mob_type matches 1 run scoreboard players set @e[tag=mob,tag=newbie] game.data.mob.currency_drop 25
#2: Zombie
    execute if score #global game.mechanism.mob_spawn_cd matches ..0 if score @e[tag=current_instructor_chosen,limit=1] game.data.wave.mob_type matches 2 as @e[tag=current_spawnpoint_chosen] at @s run summon zombie ~ ~-1 ~ {NoAI:1b,Invulnerable:1b,Tags:["mob","health_tracking","newbie"]}
    execute if score #global game.mechanism.mob_spawn_cd matches ..0 if score @e[tag=current_instructor_chosen,limit=1] game.data.wave.mob_type matches 2 run scoreboard players set @e[tag=mob,tag=newbie] game.data.mob.ticks_per_block 10
    execute if score #global game.mechanism.mob_spawn_cd matches ..0 if score @e[tag=current_instructor_chosen,limit=1] game.data.wave.mob_type matches 2 run scoreboard players set @e[tag=mob,tag=newbie] game.data.mob.ticks_per_block_original 10
    execute if score #global game.mechanism.mob_spawn_cd matches ..0 if score @e[tag=current_instructor_chosen,limit=1] game.data.wave.mob_type matches 2 run scoreboard players set @e[tag=mob,tag=newbie] game.data.mob.currency_drop 10
#3: Skeleton
    execute if score #global game.mechanism.mob_spawn_cd matches ..0 if score @e[tag=current_instructor_chosen,limit=1] game.data.wave.mob_type matches 3 as @e[tag=current_spawnpoint_chosen] at @s run summon skeleton ~ ~-1 ~ {NoAI:1b,Invulnerable:1b,Tags:["mob","health_tracking","newbie"]}
    execute if score #global game.mechanism.mob_spawn_cd matches ..0 if score @e[tag=current_instructor_chosen,limit=1] game.data.wave.mob_type matches 3 run scoreboard players set @e[tag=mob,tag=newbie] game.data.mob.ticks_per_block 8
    execute if score #global game.mechanism.mob_spawn_cd matches ..0 if score @e[tag=current_instructor_chosen,limit=1] game.data.wave.mob_type matches 3 run scoreboard players set @e[tag=mob,tag=newbie] game.data.mob.ticks_per_block_original 8
    execute if score #global game.mechanism.mob_spawn_cd matches ..0 if score @e[tag=current_instructor_chosen,limit=1] game.data.wave.mob_type matches 3 run scoreboard players set @e[tag=mob,tag=newbie] game.data.mob.currency_drop 15
#4: Spider
    execute if score #global game.mechanism.mob_spawn_cd matches ..0 if score @e[tag=current_instructor_chosen,limit=1] game.data.wave.mob_type matches 4 as @e[tag=current_spawnpoint_chosen] at @s run summon spider ~ ~-1 ~ {NoAI:1b,Invulnerable:1b,Tags:["mob","health_tracking","newbie"]}
    execute if score #global game.mechanism.mob_spawn_cd matches ..0 if score @e[tag=current_instructor_chosen,limit=1] game.data.wave.mob_type matches 4 run scoreboard players set @e[tag=mob,tag=newbie] game.data.mob.ticks_per_block 5
    execute if score #global game.mechanism.mob_spawn_cd matches ..0 if score @e[tag=current_instructor_chosen,limit=1] game.data.wave.mob_type matches 4 run scoreboard players set @e[tag=mob,tag=newbie] game.data.mob.ticks_per_block_original 5
    execute if score #global game.mechanism.mob_spawn_cd matches ..0 if score @e[tag=current_instructor_chosen,limit=1] game.data.wave.mob_type matches 4 run attribute @n[tag=newbie,tag=mob] scale base set 0.7
    execute if score #global game.mechanism.mob_spawn_cd matches ..0 if score @e[tag=current_instructor_chosen,limit=1] game.data.wave.mob_type matches 4 run scoreboard players set @e[tag=mob,tag=newbie] game.data.mob.currency_drop 25
#5: Spider Jockey
    execute if score #global game.mechanism.mob_spawn_cd matches ..0 if score @e[tag=current_instructor_chosen,limit=1] game.data.wave.mob_type matches 5 as @e[tag=current_spawnpoint_chosen] at @s run summon spider ~ ~-1 ~ {NoAI:1b,Invulnerable:1b,Tags:["mob","health_tracking","newbie","being_ridden"]}
    execute if score #global game.mechanism.mob_spawn_cd matches ..0 if score @e[tag=current_instructor_chosen,limit=1] game.data.wave.mob_type matches 5 as @e[tag=current_spawnpoint_chosen] at @s run summon skeleton ~ ~-1 ~ {NoAI:1b,Invulnerable:1b,Tags:["mob","health_tracking","newbie","riding"]}
    execute if score #global game.mechanism.mob_spawn_cd matches ..0 if score @e[tag=current_instructor_chosen,limit=1] game.data.wave.mob_type matches 5 run scoreboard players set @e[tag=mob,tag=newbie,tag=being_ridden] game.data.mob.ticks_per_block 5
    execute if score #global game.mechanism.mob_spawn_cd matches ..0 if score @e[tag=current_instructor_chosen,limit=1] game.data.wave.mob_type matches 5 run scoreboard players set @e[tag=mob,tag=newbie,tag=being_ridden] game.data.mob.ticks_per_block_original 5
    execute if score #global game.mechanism.mob_spawn_cd matches ..0 if score @e[tag=current_instructor_chosen,limit=1] game.data.wave.mob_type matches 5 run scoreboard players set @e[tag=mob,tag=newbie,tag=being_ridden] game.data.mob.currency_drop 25

    execute if score #global game.mechanism.mob_spawn_cd matches ..0 if score @e[tag=current_instructor_chosen,limit=1] game.data.wave.mob_type matches 5 run scoreboard players set @e[tag=mob,tag=newbie,tag=riding] game.data.mob.ticks_per_block 8
    execute if score #global game.mechanism.mob_spawn_cd matches ..0 if score @e[tag=current_instructor_chosen,limit=1] game.data.wave.mob_type matches 5 run scoreboard players set @e[tag=mob,tag=newbie,tag=riding] game.data.mob.ticks_per_block_original 8
    execute if score #global game.mechanism.mob_spawn_cd matches ..0 if score @e[tag=current_instructor_chosen,limit=1] game.data.wave.mob_type matches 5 run scoreboard players set @e[tag=mob,tag=newbie,tag=riding] game.data.mob.currency_drop 15
    
    
    #execute if score #global game.mechanism.mob_spawn_cd matches ..0 if score @e[tag=current_instructor_chosen,limit=1] game.data.wave.mob_type matches 5 run ride @e[tag=newbie,tag=riding,limit=1] mount @e[tag=newbie,tag=being_ridden,limit=1]

    execute if score #global game.mechanism.mob_spawn_cd matches ..0 if score @e[tag=current_instructor_chosen,limit=1] game.data.wave.mob_type matches 5 run attribute @n[tag=newbie,tag=mob,tag=being_ridden] scale base set 0.7

#6: Silverfish
    execute if score #global game.mechanism.mob_spawn_cd matches ..0 if score @e[tag=current_instructor_chosen,limit=1] game.data.wave.mob_type matches 6 as @e[tag=current_spawnpoint_chosen] at @s run summon silverfish ~ ~-1 ~ {NoAI:1b,Invulnerable:1b,Tags:["mob","health_tracking","newbie"]}
    execute if score #global game.mechanism.mob_spawn_cd matches ..0 if score @e[tag=current_instructor_chosen,limit=1] game.data.wave.mob_type matches 6 run scoreboard players set @e[tag=mob,tag=newbie] game.data.mob.ticks_per_block 7
    execute if score #global game.mechanism.mob_spawn_cd matches ..0 if score @e[tag=current_instructor_chosen,limit=1] game.data.wave.mob_type matches 6 run scoreboard players set @e[tag=mob,tag=newbie] game.data.mob.ticks_per_block_original 7
    execute if score #global game.mechanism.mob_spawn_cd matches ..0 if score @e[tag=current_instructor_chosen,limit=1] game.data.wave.mob_type matches 6 run scoreboard players set @e[tag=mob,tag=newbie] game.data.mob.currency_drop 5
#7: Silverfish Batch
    execute if score #global game.mechanism.mob_spawn_cd matches ..0 if score @e[tag=current_instructor_chosen,limit=1] game.data.wave.mob_type matches 7 as @e[tag=current_spawnpoint_chosen] at @s run summon silverfish ~ ~-1 ~ {NoAI:1b,Invulnerable:1b,Tags:["mob","health_tracking","newbie","batch_main"]}
    execute if score #global game.mechanism.mob_spawn_cd matches ..0 if score @e[tag=current_instructor_chosen,limit=1] game.data.wave.mob_type matches 7 as @e[tag=current_spawnpoint_chosen] at @s run summon silverfish ~ ~-1 ~ {NoAI:1b,Invulnerable:1b,Tags:["batch_sub","batch_sub_1","newbie"]}
    execute if score #global game.mechanism.mob_spawn_cd matches ..0 if score @e[tag=current_instructor_chosen,limit=1] game.data.wave.mob_type matches 7 as @e[tag=current_spawnpoint_chosen] at @s run summon silverfish ~ ~-1 ~ {NoAI:1b,Invulnerable:1b,Tags:["batch_sub","batch_sub_0","newbie"]}

    execute if score #global game.mechanism.mob_spawn_cd matches ..0 if score @e[tag=current_instructor_chosen,limit=1] game.data.wave.mob_type matches 7 run ride @e[tag=newbie,tag=batch_sub_0,limit=1] mount @n[tag=newbie,tag=batch_main]
    execute if score #global game.mechanism.mob_spawn_cd matches ..0 if score @e[tag=current_instructor_chosen,limit=1] game.data.wave.mob_type matches 7 run ride @e[tag=newbie,tag=batch_sub_1,limit=1] mount @n[tag=newbie,tag=batch_sub_0]
    execute if score #global game.mechanism.mob_spawn_cd matches ..0 if score @e[tag=current_instructor_chosen,limit=1] game.data.wave.mob_type matches 7 run tag @e[tag=batch_sub,tag=newbie] remove newbie

    execute if score #global game.mechanism.mob_spawn_cd matches ..0 if score @e[tag=current_instructor_chosen,limit=1] game.data.wave.mob_type matches 7 run scoreboard players set @e[tag=mob,tag=newbie] game.data.mob.ticks_per_block 7
    execute if score #global game.mechanism.mob_spawn_cd matches ..0 if score @e[tag=current_instructor_chosen,limit=1] game.data.wave.mob_type matches 7 run scoreboard players set @e[tag=mob,tag=newbie] game.data.mob.ticks_per_block_original 7
    execute if score #global game.mechanism.mob_spawn_cd matches ..0 if score @e[tag=current_instructor_chosen,limit=1] game.data.wave.mob_type matches 7 run scoreboard players set @e[tag=mob,tag=newbie] game.data.mob.currency_drop 25
#8: Slime
    #note: the marker act as an anchor of the actual position of the slime as the slime bounces and affects the judgements of the distances of contraptions towards the slime
    execute if score #global game.mechanism.mob_spawn_cd matches ..0 if score @e[tag=current_instructor_chosen,limit=1] game.data.wave.mob_type matches 8 as @e[tag=current_spawnpoint_chosen] at @s run summon marker ~ ~-1 ~ {Invulnerable:1b,CustomName:"Slime Anchor",Tags:["entity_anchor","slime_behavior","jumping","mob","newbie"]}
    execute if score #global game.mechanism.mob_spawn_cd matches ..0 if score @e[tag=current_instructor_chosen,limit=1] game.data.wave.mob_type matches 8 as @e[tag=current_spawnpoint_chosen] at @s run summon slime ~ ~-1 ~ {NoAI:1b,Size:0,Invulnerable:1b,Tags:["display_entity","newbie","health_tracking"]}
    
    execute if score #global game.mechanism.mob_spawn_cd matches ..0 if score @e[tag=current_instructor_chosen,limit=1] game.data.wave.mob_type matches 8 run attribute @e[tag=display_entity,tag=newbie,limit=1] scale base set 2.0
    execute if score #global game.mechanism.mob_spawn_cd matches ..0 if score @e[tag=current_instructor_chosen,limit=1] game.data.wave.mob_type matches 8 run attribute @e[tag=display_entity,tag=newbie,limit=1] max_health base set 10.0
    execute if score #global game.mechanism.mob_spawn_cd matches ..0 if score @e[tag=current_instructor_chosen,limit=1] game.data.wave.mob_type matches 8 run scoreboard players set @e[tag=mob,tag=newbie] game.data.slime_size 2
    execute if score #global game.mechanism.mob_spawn_cd matches ..0 if score @e[tag=current_instructor_chosen,limit=1] game.data.wave.mob_type matches 8 run scoreboard players operation @e[tag=mob,tag=newbie] game.data.mob_uuid = #global game.data.mob_uuid
    execute if score #global game.mechanism.mob_spawn_cd matches ..0 if score @e[tag=current_instructor_chosen,limit=1] game.data.wave.mob_type matches 8 run scoreboard players operation @e[tag=display_entity,tag=newbie] game.data.mob_uuid = #global game.data.mob_uuid
    
    execute if score #global game.mechanism.mob_spawn_cd matches ..0 if score @e[tag=current_instructor_chosen,limit=1] game.data.wave.mob_type matches 8 run tag @e[tag=newbie,tag=display_entity] remove newbie

    execute if score #global game.mechanism.mob_spawn_cd matches ..0 if score @e[tag=current_instructor_chosen,limit=1] game.data.wave.mob_type matches 8 run scoreboard players set @e[tag=mob,tag=newbie] game.data.mob.ticks_per_block 9
    execute if score #global game.mechanism.mob_spawn_cd matches ..0 if score @e[tag=current_instructor_chosen,limit=1] game.data.wave.mob_type matches 8 run scoreboard players set @e[tag=mob,tag=newbie] game.data.mob.ticks_per_block_original 9
    execute if score #global game.mechanism.mob_spawn_cd matches ..0 if score @e[tag=current_instructor_chosen,limit=1] game.data.wave.mob_type matches 8 run scoreboard players set @e[tag=mob,tag=newbie] game.data.mob.currency_drop 20
#9: Enderman
    #note that they fucking teleport away upon taking damage, even when NoAI:1b, for some reason, so we still had to use the anchor system
    execute if score #global game.mechanism.mob_spawn_cd matches ..0 if score @e[tag=current_instructor_chosen,limit=1] game.data.wave.mob_type matches 9 as @e[tag=current_spawnpoint_chosen] at @s run summon marker ~ ~-1 ~ {Invulnerable:1b,CustomName:"Enderman Anchor",Tags:["entity_anchor","trapdoor_immune","move_by_teleportation","water_damage","mob","newbie"]}
    execute if score #global game.mechanism.mob_spawn_cd matches ..0 if score @e[tag=current_instructor_chosen,limit=1] game.data.wave.mob_type matches 9 as @e[tag=current_spawnpoint_chosen] at @s run summon enderman ~ ~-1 ~ {NoAI:1b,Invulnerable:1b,Tags:["display_entity","health_tracking","newbie"]}
    
    execute if score #global game.mechanism.mob_spawn_cd matches ..0 if score @e[tag=current_instructor_chosen,limit=1] game.data.wave.mob_type matches 9 run scoreboard players operation @e[tag=mob,tag=newbie] game.data.mob_uuid = #global game.data.mob_uuid
    execute if score #global game.mechanism.mob_spawn_cd matches ..0 if score @e[tag=current_instructor_chosen,limit=1] game.data.wave.mob_type matches 9 run scoreboard players operation @e[tag=display_entity,tag=newbie] game.data.mob_uuid = #global game.data.mob_uuid
    execute if score #global game.mechanism.mob_spawn_cd matches ..0 if score @e[tag=current_instructor_chosen,limit=1] game.data.wave.mob_type matches 9 run tag @e[tag=newbie,tag=display_entity] remove newbie

    execute if score #global game.mechanism.mob_spawn_cd matches ..0 if score @e[tag=current_instructor_chosen,limit=1] game.data.wave.mob_type matches 9 run scoreboard players set @e[tag=mob,tag=newbie] game.data.mob.ticks_per_block 20
    execute if score #global game.mechanism.mob_spawn_cd matches ..0 if score @e[tag=current_instructor_chosen,limit=1] game.data.wave.mob_type matches 9 run scoreboard players set @e[tag=mob,tag=newbie] game.data.mob.ticks_per_block_original 20
    execute if score #global game.mechanism.mob_spawn_cd matches ..0 if score @e[tag=current_instructor_chosen,limit=1] game.data.wave.mob_type matches 9 run scoreboard players set @e[tag=mob,tag=newbie] game.data.mob.currency_drop 25

#10: Cave Spider
    execute if score #global game.mechanism.mob_spawn_cd matches ..0 if score @e[tag=current_instructor_chosen,limit=1] game.data.wave.mob_type matches 10 as @e[tag=current_spawnpoint_chosen] at @s run summon cave_spider ~ ~-1 ~ {NoAI:1b,Invulnerable:1b,Tags:["mob","health_tracking","newbie","venomous"]}
    execute if score #global game.mechanism.mob_spawn_cd matches ..0 if score @e[tag=current_instructor_chosen,limit=1] game.data.wave.mob_type matches 10 run scoreboard players set @e[tag=mob,tag=newbie] game.data.mob.ticks_per_block 5
    execute if score #global game.mechanism.mob_spawn_cd matches ..0 if score @e[tag=current_instructor_chosen,limit=1] game.data.wave.mob_type matches 10 run scoreboard players set @e[tag=mob,tag=newbie] game.data.mob.ticks_per_block_original 5
    execute if score #global game.mechanism.mob_spawn_cd matches ..0 if score @e[tag=current_instructor_chosen,limit=1] game.data.wave.mob_type matches 10 run scoreboard players set @e[tag=mob,tag=newbie] game.data.mob.currency_drop 30
