function game:load_level_generic.before

#set biome
    fillbiome -24 -8 -24 24 24 24 plains

#displaying instructions in chat
    tellraw @a "\u00a7bLevel 6: Mineshaft 2"

    tellraw @a "\u00a7aCredits:"
    tellraw @a "\u00a7a- Terrain: \u00a7fMLE_qwq"
    tellraw @a "\u00a7a- Code: \u00a7fMLE_qwq"
    
#specifying path blocks and pre-built path blocks
    setblock 15 -2 -15 sand
    setblock 15 -2 -14 minecraft:sand
#specifying dedicated original block
    setblock 15 -2 -13 stone

#marking
    summon minecraft:marker -16 -64 -48 {Tags:["terrain_origin"],CustomName:"Terrain Origin"}
    summon minecraft:marker 11 1 -10 {Tags:["path_start","mob_spawnpoint"],CustomName:"Path Start"}
    summon minecraft:marker -12 1 5 {Tags:["path_ending"],CustomName:"Path Ending"}

#initial currency
    scoreboard players set #global game.data.currency 350

#stores wave data
    scoreboard players set #global game.state.total_waves 10

    #wave 1: spider*6, slime *6
        summon marker 0 0 0 {Tags:["wave_data","newbie"],CustomName:"Wave Data"}
        scoreboard players set @e[tag=wave_data,tag=newbie,limit=1] game.data.wave.mob_count 6
        scoreboard players set @e[tag=wave_data,tag=newbie,limit=1] game.data.wave.mob_type 4
        scoreboard players set @e[tag=wave_data,tag=newbie,limit=1] game.data.wave.wave_number 1
        scoreboard players set @e[tag=wave_data,tag=newbie,limit=1] game.data.wave.mob_health 15
        scoreboard players set @e[tag=wave_data,tag=newbie,limit=1] game.data.wave.mob_spawnpoint 0
        tag @e[tag=wave_data,tag=newbie,limit=1] remove newbie
        
        summon marker 0 0 0 {Tags:["wave_data","newbie"],CustomName:"Wave Data"}
        scoreboard players set @e[tag=wave_data,tag=newbie,limit=1] game.data.wave.mob_count 6
        scoreboard players set @e[tag=wave_data,tag=newbie,limit=1] game.data.wave.mob_type 8
        scoreboard players set @e[tag=wave_data,tag=newbie,limit=1] game.data.wave.wave_number 1
        scoreboard players set @e[tag=wave_data,tag=newbie,limit=1] game.data.wave.mob_health 15
        scoreboard players set @e[tag=wave_data,tag=newbie,limit=1] game.data.wave.mob_spawnpoint 0
        tag @e[tag=wave_data,tag=newbie,limit=1] remove newbie

    #wave 2: slime *12
        summon marker 0 0 0 {Tags:["wave_data","newbie"],CustomName:"Wave Data"}
        scoreboard players set @e[tag=wave_data,tag=newbie,limit=1] game.data.wave.mob_count 12
        scoreboard players set @e[tag=wave_data,tag=newbie,limit=1] game.data.wave.mob_type 8
        scoreboard players set @e[tag=wave_data,tag=newbie,limit=1] game.data.wave.wave_number 2
        scoreboard players set @e[tag=wave_data,tag=newbie,limit=1] game.data.wave.mob_health 30
        scoreboard players set @e[tag=wave_data,tag=newbie,limit=1] game.data.wave.mob_spawnpoint 0
        tag @e[tag=wave_data,tag=newbie,limit=1] remove newbie

    #wave 3: spider*7, slime *7
        summon marker 0 0 0 {Tags:["wave_data","newbie"],CustomName:"Wave Data"}
        scoreboard players set @e[tag=wave_data,tag=newbie,limit=1] game.data.wave.mob_count 7
        scoreboard players set @e[tag=wave_data,tag=newbie,limit=1] game.data.wave.mob_type 4
        scoreboard players set @e[tag=wave_data,tag=newbie,limit=1] game.data.wave.wave_number 3
        scoreboard players set @e[tag=wave_data,tag=newbie,limit=1] game.data.wave.mob_health 50
        scoreboard players set @e[tag=wave_data,tag=newbie,limit=1] game.data.wave.mob_spawnpoint 0
        tag @e[tag=wave_data,tag=newbie,limit=1] remove newbie
        
        summon marker 0 0 0 {Tags:["wave_data","newbie"],CustomName:"Wave Data"}
        scoreboard players set @e[tag=wave_data,tag=newbie,limit=1] game.data.wave.mob_count 7
        scoreboard players set @e[tag=wave_data,tag=newbie,limit=1] game.data.wave.mob_type 8
        scoreboard players set @e[tag=wave_data,tag=newbie,limit=1] game.data.wave.wave_number 3
        scoreboard players set @e[tag=wave_data,tag=newbie,limit=1] game.data.wave.mob_health 50
        scoreboard players set @e[tag=wave_data,tag=newbie,limit=1] game.data.wave.mob_spawnpoint 0
        tag @e[tag=wave_data,tag=newbie,limit=1] remove newbie

    #wave 4: slime *14
        summon marker 0 0 0 {Tags:["wave_data","newbie"],CustomName:"Wave Data"}
        scoreboard players set @e[tag=wave_data,tag=newbie,limit=1] game.data.wave.mob_count 14
        scoreboard players set @e[tag=wave_data,tag=newbie,limit=1] game.data.wave.mob_type 8
        scoreboard players set @e[tag=wave_data,tag=newbie,limit=1] game.data.wave.wave_number 4
        scoreboard players set @e[tag=wave_data,tag=newbie,limit=1] game.data.wave.mob_health 90
        scoreboard players set @e[tag=wave_data,tag=newbie,limit=1] game.data.wave.mob_spawnpoint 0
        tag @e[tag=wave_data,tag=newbie,limit=1] remove newbie
    
    #wave 5: enderman *15
        summon marker 0 0 0 {Tags:["wave_data","newbie"],CustomName:"Wave Data"}
        scoreboard players set @e[tag=wave_data,tag=newbie,limit=1] game.data.wave.mob_count 15
        scoreboard players set @e[tag=wave_data,tag=newbie,limit=1] game.data.wave.mob_type 9
        scoreboard players set @e[tag=wave_data,tag=newbie,limit=1] game.data.wave.wave_number 5
        scoreboard players set @e[tag=wave_data,tag=newbie,limit=1] game.data.wave.mob_health 135
        scoreboard players set @e[tag=wave_data,tag=newbie,limit=1] game.data.wave.mob_spawnpoint 0
        tag @e[tag=wave_data,tag=newbie,limit=1] remove newbie

    #wave 6: slime *16
        summon marker 0 0 0 {Tags:["wave_data","newbie"],CustomName:"Wave Data"}
        scoreboard players set @e[tag=wave_data,tag=newbie,limit=1] game.data.wave.mob_count 16
        scoreboard players set @e[tag=wave_data,tag=newbie,limit=1] game.data.wave.mob_type 8
        scoreboard players set @e[tag=wave_data,tag=newbie,limit=1] game.data.wave.wave_number 6
        scoreboard players set @e[tag=wave_data,tag=newbie,limit=1] game.data.wave.mob_health 175
        scoreboard players set @e[tag=wave_data,tag=newbie,limit=1] game.data.wave.mob_spawnpoint 0
        tag @e[tag=wave_data,tag=newbie,limit=1] remove newbie
    
    #wave 7: spider*9, slime *9
        summon marker 0 0 0 {Tags:["wave_data","newbie"],CustomName:"Wave Data"}
        scoreboard players set @e[tag=wave_data,tag=newbie,limit=1] game.data.wave.mob_count 9
        scoreboard players set @e[tag=wave_data,tag=newbie,limit=1] game.data.wave.mob_type 4
        scoreboard players set @e[tag=wave_data,tag=newbie,limit=1] game.data.wave.wave_number 7
        scoreboard players set @e[tag=wave_data,tag=newbie,limit=1] game.data.wave.mob_health 215
        scoreboard players set @e[tag=wave_data,tag=newbie,limit=1] game.data.wave.mob_spawnpoint 0
        tag @e[tag=wave_data,tag=newbie,limit=1] remove newbie
        
        summon marker 0 0 0 {Tags:["wave_data","newbie"],CustomName:"Wave Data"}
        scoreboard players set @e[tag=wave_data,tag=newbie,limit=1] game.data.wave.mob_count 9
        scoreboard players set @e[tag=wave_data,tag=newbie,limit=1] game.data.wave.mob_type 8
        scoreboard players set @e[tag=wave_data,tag=newbie,limit=1] game.data.wave.wave_number 7
        scoreboard players set @e[tag=wave_data,tag=newbie,limit=1] game.data.wave.mob_health 215
        scoreboard players set @e[tag=wave_data,tag=newbie,limit=1] game.data.wave.mob_spawnpoint 0
        tag @e[tag=wave_data,tag=newbie,limit=1] remove newbie

    #wave 8: slime *18
        summon marker 0 0 0 {Tags:["wave_data","newbie"],CustomName:"Wave Data"}
        scoreboard players set @e[tag=wave_data,tag=newbie,limit=1] game.data.wave.mob_count 18
        scoreboard players set @e[tag=wave_data,tag=newbie,limit=1] game.data.wave.mob_type 8
        scoreboard players set @e[tag=wave_data,tag=newbie,limit=1] game.data.wave.wave_number 8
        scoreboard players set @e[tag=wave_data,tag=newbie,limit=1] game.data.wave.mob_health 250
        scoreboard players set @e[tag=wave_data,tag=newbie,limit=1] game.data.wave.mob_spawnpoint 0
        tag @e[tag=wave_data,tag=newbie,limit=1] remove newbie
        
    #wave 9: spider*10, slime *10
        summon marker 0 0 0 {Tags:["wave_data","newbie"],CustomName:"Wave Data"}
        scoreboard players set @e[tag=wave_data,tag=newbie,limit=1] game.data.wave.mob_count 10
        scoreboard players set @e[tag=wave_data,tag=newbie,limit=1] game.data.wave.mob_type 4
        scoreboard players set @e[tag=wave_data,tag=newbie,limit=1] game.data.wave.wave_number 9
        scoreboard players set @e[tag=wave_data,tag=newbie,limit=1] game.data.wave.mob_health 275
        scoreboard players set @e[tag=wave_data,tag=newbie,limit=1] game.data.wave.mob_spawnpoint 0
        tag @e[tag=wave_data,tag=newbie,limit=1] remove newbie
        
        summon marker 0 0 0 {Tags:["wave_data","newbie"],CustomName:"Wave Data"}
        scoreboard players set @e[tag=wave_data,tag=newbie,limit=1] game.data.wave.mob_count 10
        scoreboard players set @e[tag=wave_data,tag=newbie,limit=1] game.data.wave.mob_type 8
        scoreboard players set @e[tag=wave_data,tag=newbie,limit=1] game.data.wave.wave_number 9
        scoreboard players set @e[tag=wave_data,tag=newbie,limit=1] game.data.wave.mob_health 275
        scoreboard players set @e[tag=wave_data,tag=newbie,limit=1] game.data.wave.mob_spawnpoint 0
        tag @e[tag=wave_data,tag=newbie,limit=1] remove newbie

    #wave 10: enderman *20
        summon marker 0 0 0 {Tags:["wave_data","newbie"],CustomName:"Wave Data"}
        scoreboard players set @e[tag=wave_data,tag=newbie,limit=1] game.data.wave.mob_count 20
        scoreboard players set @e[tag=wave_data,tag=newbie,limit=1] game.data.wave.mob_type 9
        scoreboard players set @e[tag=wave_data,tag=newbie,limit=1] game.data.wave.wave_number 10
        scoreboard players set @e[tag=wave_data,tag=newbie,limit=1] game.data.wave.mob_health 300
        scoreboard players set @e[tag=wave_data,tag=newbie,limit=1] game.data.wave.mob_spawnpoint 0
        tag @e[tag=wave_data,tag=newbie,limit=1] remove newbie

function game:load_level_generic.after