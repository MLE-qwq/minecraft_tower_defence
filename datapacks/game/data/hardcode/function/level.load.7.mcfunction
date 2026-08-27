function game:load_level_generic.before

#set biome
    fillbiome -24 -8 -24 24 24 24 plains

#displaying instructions in chat
    tellraw @a "\u00a7bLevel 7: Spider Cavern"

    tellraw @a "\u00a7aCredits:"
    tellraw @a "\u00a7a- Terrain: \u00a7fMLE_qwq"
    tellraw @a "\u00a7a- Code: \u00a7fMLE_qwq"
    
#specifying path blocks and pre-built path blocks
    setblock 15 -2 -15 dirt
#specifying dedicated original block
    setblock 15 -2 -13 cobblestone

#marking
    summon minecraft:marker 16 -64 -48 {Tags:["terrain_origin"],CustomName:"Terrain Origin"}
    summon minecraft:marker 1 3 12 {Tags:["path_start","mob_spawnpoint"],CustomName:"Path Start"}
    summon minecraft:marker 1 3 -12 {Tags:["path_ending"],CustomName:"Path Ending"}

#initial currency
    scoreboard players set #global game.data.currency 0

#summoning markers that lets path tracker & tester identify as air blocks
    summon marker -2 3 1 {Tags:["auto_replace"],CustomName:"Auto Replace"}
    summon marker 8 3 -3 {Tags:["auto_replace"],CustomName:"Auto Replace"}
    summon marker -3 3 -7 {Tags:["auto_replace"],CustomName:"Auto Replace"}

#bonus chests
    summon marker -2 3 1 {Tags:["bonus_chest","newbie"],CustomName:"Bonus Chest"}
    scoreboard players set @e[tag=bonus_chest,tag=newbie] game.data.bonus_chest.currany 160
    tag @e[tag=bonus_chest,tag=newbie] remove newbie
    
    summon marker 8 3 -3 {Tags:["bonus_chest","newbie"],CustomName:"Bonus Chest"}
    scoreboard players set @e[tag=bonus_chest,tag=newbie] game.data.bonus_chest.currany 160
    tag @e[tag=bonus_chest,tag=newbie] remove newbie
    
    summon marker -3 3 -7 {Tags:["bonus_chest","newbie"],CustomName:"Bonus Chest"}
    scoreboard players set @e[tag=bonus_chest,tag=newbie] game.data.bonus_chest.currany 160
    tag @e[tag=bonus_chest,tag=newbie] remove newbie

#stores wave data
    scoreboard players set #global game.state.total_waves 5

    #wave 1: cave spider*12
        summon marker 0 0 0 {Tags:["wave_data","newbie"],CustomName:"Wave Data"}
        scoreboard players set @e[tag=wave_data,tag=newbie,limit=1] game.data.wave.mob_count 12
        scoreboard players set @e[tag=wave_data,tag=newbie,limit=1] game.data.wave.mob_type 10
        scoreboard players set @e[tag=wave_data,tag=newbie,limit=1] game.data.wave.wave_number 1
        scoreboard players set @e[tag=wave_data,tag=newbie,limit=1] game.data.wave.mob_health 15
        scoreboard players set @e[tag=wave_data,tag=newbie,limit=1] game.data.wave.mob_spawnpoint 0
        tag @e[tag=wave_data,tag=newbie,limit=1] remove newbie

    #wave 2: cave spider*14
        summon marker 0 0 0 {Tags:["wave_data","newbie"],CustomName:"Wave Data"}
        scoreboard players set @e[tag=wave_data,tag=newbie,limit=1] game.data.wave.mob_count 14
        scoreboard players set @e[tag=wave_data,tag=newbie,limit=1] game.data.wave.mob_type 10
        scoreboard players set @e[tag=wave_data,tag=newbie,limit=1] game.data.wave.wave_number 2
        scoreboard players set @e[tag=wave_data,tag=newbie,limit=1] game.data.wave.mob_health 35
        scoreboard players set @e[tag=wave_data,tag=newbie,limit=1] game.data.wave.mob_spawnpoint 0
        tag @e[tag=wave_data,tag=newbie,limit=1] remove newbie

    #wave 3: cave spider*16
        summon marker 0 0 0 {Tags:["wave_data","newbie"],CustomName:"Wave Data"}
        scoreboard players set @e[tag=wave_data,tag=newbie,limit=1] game.data.wave.mob_count 16
        scoreboard players set @e[tag=wave_data,tag=newbie,limit=1] game.data.wave.mob_type 10
        scoreboard players set @e[tag=wave_data,tag=newbie,limit=1] game.data.wave.wave_number 3
        scoreboard players set @e[tag=wave_data,tag=newbie,limit=1] game.data.wave.mob_health 65
        scoreboard players set @e[tag=wave_data,tag=newbie,limit=1] game.data.wave.mob_spawnpoint 0
        tag @e[tag=wave_data,tag=newbie,limit=1] remove newbie


    #wave 4: cave spider*18
        summon marker 0 0 0 {Tags:["wave_data","newbie"],CustomName:"Wave Data"}
        scoreboard players set @e[tag=wave_data,tag=newbie,limit=1] game.data.wave.mob_count 18
        scoreboard players set @e[tag=wave_data,tag=newbie,limit=1] game.data.wave.mob_type 10
        scoreboard players set @e[tag=wave_data,tag=newbie,limit=1] game.data.wave.wave_number 4
        scoreboard players set @e[tag=wave_data,tag=newbie,limit=1] game.data.wave.mob_health 100
        scoreboard players set @e[tag=wave_data,tag=newbie,limit=1] game.data.wave.mob_spawnpoint 0
        tag @e[tag=wave_data,tag=newbie,limit=1] remove newbie


    #wave 5: cave spider*20
        summon marker 0 0 0 {Tags:["wave_data","newbie"],CustomName:"Wave Data"}
        scoreboard players set @e[tag=wave_data,tag=newbie,limit=1] game.data.wave.mob_count 20
        scoreboard players set @e[tag=wave_data,tag=newbie,limit=1] game.data.wave.mob_type 10
        scoreboard players set @e[tag=wave_data,tag=newbie,limit=1] game.data.wave.wave_number 5
        scoreboard players set @e[tag=wave_data,tag=newbie,limit=1] game.data.wave.mob_health 150
        scoreboard players set @e[tag=wave_data,tag=newbie,limit=1] game.data.wave.mob_spawnpoint 0
        tag @e[tag=wave_data,tag=newbie,limit=1] remove newbie


function game:load_level_generic.after