function game:load_level_generic.before

#set biome
    fillbiome -24 -8 -24 24 24 24 plains

#displaying instructions in chat
    tellraw @a "\u00a7bLevel 8: Underground Ravine"

    tellraw @a "\u00a7aCredits:"
    tellraw @a "\u00a7a- Terrain: \u00a7fNotch, MLE_qwq"
    tellraw @a "\u00a77> (For copy-pasting from vanilla terrain =w=)"
    tellraw @a "\u00a7a- Code: \u00a7fMLE_qwq"
    
#specifying path blocks and pre-built path blocks
    setblock 15 -2 -15 dirt
#specifying dedicated original block
    setblock 15 -2 -13 stone

#marking
    summon minecraft:marker 16 -64 -16 {Tags:["terrain_origin"],CustomName:"Terrain Origin"}
    summon minecraft:marker 14 8 6 {Tags:["path_start","mob_spawnpoint"],CustomName:"Path Start"}
    summon minecraft:marker -14 8 -12 {Tags:["path_ending"],CustomName:"Path Ending"}

#marking blocks that are valid to construct the path on in addition
    summon minecraft:marker -5 8 -1 {Tags:["path_validity"],CustomName:"Path Validity"} 
    summon minecraft:marker -5 8 -2 {Tags:["path_validity"],CustomName:"Path Validity"} 
    summon minecraft:marker -6 8 -2 {Tags:["path_validity"],CustomName:"Path Validity"} 
    summon minecraft:marker -6 8 -3 {Tags:["path_validity"],CustomName:"Path Validity"} 
    summon minecraft:marker -7 8 -3 {Tags:["path_validity"],CustomName:"Path Validity"} 
    summon minecraft:marker -8 8 -3 {Tags:["path_validity"],CustomName:"Path Validity"} 
    summon minecraft:marker -8 8 -4 {Tags:["path_validity"],CustomName:"Path Validity"} 
    summon minecraft:marker -9 8 -4 {Tags:["path_validity"],CustomName:"Path Validity"} 
    summon minecraft:marker -9 8 -5 {Tags:["path_validity"],CustomName:"Path Validity"} 
    summon minecraft:marker -10 8 -5 {Tags:["path_validity"],CustomName:"Path Validity"} 
    summon minecraft:marker -11 8 -5 {Tags:["path_validity"],CustomName:"Path Validity"} 
    summon minecraft:marker -12 8 -5 {Tags:["path_validity"],CustomName:"Path Validity"} 
    summon minecraft:marker -12 8 -6 {Tags:["path_validity"],CustomName:"Path Validity"} 
    summon minecraft:marker 4 8 -4 {Tags:["path_validity"],CustomName:"Path Validity"} 
    summon minecraft:marker 3 8 -5 {Tags:["path_validity"],CustomName:"Path Validity"} 
    summon minecraft:marker 3 8 -6 {Tags:["path_validity"],CustomName:"Path Validity"} 
    summon minecraft:marker 2 8 -6 {Tags:["path_validity"],CustomName:"Path Validity"} 
    summon minecraft:marker 2 8 -7 {Tags:["path_validity"],CustomName:"Path Validity"} 
    summon minecraft:marker 0 8 -8 {Tags:["path_validity"],CustomName:"Path Validity"} 
    summon minecraft:marker -3 8 -10 {Tags:["path_validity"],CustomName:"Path Validity"} 
    summon minecraft:marker -4 8 -10 {Tags:["path_validity"],CustomName:"Path Validity"} 
    summon minecraft:marker -4 8 -11 {Tags:["path_validity"],CustomName:"Path Validity"} 
    summon minecraft:marker -5 8 -11 {Tags:["path_validity"],CustomName:"Path Validity"} 
    summon minecraft:marker -5 8 -12 {Tags:["path_validity"],CustomName:"Path Validity"} 
    summon minecraft:marker -6 8 -12 {Tags:["path_validity"],CustomName:"Path Validity"} 
    summon minecraft:marker -7 8 -12 {Tags:["path_validity"],CustomName:"Path Validity"} 
    summon minecraft:marker -7 8 -13 {Tags:["path_validity"],CustomName:"Path Validity"} 
    summon minecraft:marker -8 8 -13 {Tags:["path_validity"],CustomName:"Path Validity"} 
    summon minecraft:marker -9 8 -13 {Tags:["path_validity"],CustomName:"Path Validity"} 
    summon minecraft:marker -10 8 -13 {Tags:["path_validity"],CustomName:"Path Validity"} 

#initial currency
    scoreboard players set #global game.data.currency 350

#stores wave data
    scoreboard players set #global game.state.total_waves 5
    #wave 1: enderman * 10
        summon marker 0 0 0 {Tags:["wave_data","newbie"],CustomName:"Wave Data"}
        scoreboard players set @e[tag=wave_data,tag=newbie,limit=1] game.data.wave.mob_count 10
        scoreboard players set @e[tag=wave_data,tag=newbie,limit=1] game.data.wave.mob_type 9
        scoreboard players set @e[tag=wave_data,tag=newbie,limit=1] game.data.wave.wave_number 1
        scoreboard players set @e[tag=wave_data,tag=newbie,limit=1] game.data.wave.mob_health 10
        scoreboard players set @e[tag=wave_data,tag=newbie,limit=1] game.data.wave.mob_spawnpoint 0
        tag @e[tag=wave_data,tag=newbie,limit=1] remove newbie

    #wave 2: spider * 15
        summon marker 0 0 0 {Tags:["wave_data","newbie"],CustomName:"Wave Data"}
        scoreboard players set @e[tag=wave_data,tag=newbie,limit=1] game.data.wave.mob_count 15
        scoreboard players set @e[tag=wave_data,tag=newbie,limit=1] game.data.wave.mob_type 4
        scoreboard players set @e[tag=wave_data,tag=newbie,limit=1] game.data.wave.wave_number 2
        scoreboard players set @e[tag=wave_data,tag=newbie,limit=1] game.data.wave.mob_health 20
        scoreboard players set @e[tag=wave_data,tag=newbie,limit=1] game.data.wave.mob_spawnpoint 0
        tag @e[tag=wave_data,tag=newbie,limit=1] remove newbie
    
    #wave 3: spider jockey * 3
        summon marker 0 0 0 {Tags:["wave_data","newbie"],CustomName:"Wave Data"}
        scoreboard players set @e[tag=wave_data,tag=newbie,limit=1] game.data.wave.mob_count 3
        scoreboard players set @e[tag=wave_data,tag=newbie,limit=1] game.data.wave.mob_type 5
        scoreboard players set @e[tag=wave_data,tag=newbie,limit=1] game.data.wave.wave_number 3
        scoreboard players set @e[tag=wave_data,tag=newbie,limit=1] game.data.wave.mob_health 40
        scoreboard players set @e[tag=wave_data,tag=newbie,limit=1] game.data.wave.mob_spawnpoint 0
        tag @e[tag=wave_data,tag=newbie,limit=1] remove newbie
        
    #wave 4: enderman * 18
        summon marker 0 0 0 {Tags:["wave_data","newbie"],CustomName:"Wave Data"}
        scoreboard players set @e[tag=wave_data,tag=newbie,limit=1] game.data.wave.mob_count 18
        scoreboard players set @e[tag=wave_data,tag=newbie,limit=1] game.data.wave.mob_type 9
        scoreboard players set @e[tag=wave_data,tag=newbie,limit=1] game.data.wave.wave_number 4
        scoreboard players set @e[tag=wave_data,tag=newbie,limit=1] game.data.wave.mob_health 70
        scoreboard players set @e[tag=wave_data,tag=newbie,limit=1] game.data.wave.mob_spawnpoint 0
        tag @e[tag=wave_data,tag=newbie,limit=1] remove newbie

    #wave 5: spider jockey * 5
        summon marker 0 0 0 {Tags:["wave_data","newbie"],CustomName:"Wave Data"}
        scoreboard players set @e[tag=wave_data,tag=newbie,limit=1] game.data.wave.mob_count 5
        scoreboard players set @e[tag=wave_data,tag=newbie,limit=1] game.data.wave.mob_type 5
        scoreboard players set @e[tag=wave_data,tag=newbie,limit=1] game.data.wave.wave_number 5
        scoreboard players set @e[tag=wave_data,tag=newbie,limit=1] game.data.wave.mob_health 100
        scoreboard players set @e[tag=wave_data,tag=newbie,limit=1] game.data.wave.mob_spawnpoint 0
        tag @e[tag=wave_data,tag=newbie,limit=1] remove newbie

function game:load_level_generic.after