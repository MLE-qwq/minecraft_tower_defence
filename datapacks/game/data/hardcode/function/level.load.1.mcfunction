function game:load_level_generic.before

#set biome
    fillbiome -24 -8 -24 24 24 24 beach

#display
    tellraw @a "\u00a7bLevel 1: Desert"
    
    tellraw @a "\u00a7aCredits:"
    tellraw @a "\u00a7a- Terrain: \u00a7fMLE_qwq"
    tellraw @a "\u00a7a- Code: \u00a7fMLE_qwq"
    

#specifying path blocks
    setblock 15 -2 -15 gravel
#specifying dedicated original block
    setblock 15 -2 -13 sand

#marking
    summon minecraft:marker -16 -64 -16 {Tags:["terrain_origin"],CustomName:"Terrain Origin"}
    summon minecraft:marker 15 4 2 {Tags:["path_start","mob_spawnpoint"],CustomName:"Path Start"}
    summon minecraft:marker -4 4 -15 {Tags:["path_ending"],CustomName:"Path Ending"}

#initial currency
    scoreboard players set #global game.data.currency 80

#unlock contraptions
    scoreboard players set #global game.saves.cont_unlocked.cactus 1

#stores wave data
    scoreboard players set #global game.state.total_waves 3

    #wave 1: Creeper *5
        summon marker 0 0 0 {Tags:["wave_data","newbie"],CustomName:"Wave Data"}
        scoreboard players set @e[tag=wave_data,tag=newbie,limit=1] game.data.wave.mob_count 5
        scoreboard players set @e[tag=wave_data,tag=newbie,limit=1] game.data.wave.mob_type 0
        scoreboard players set @e[tag=wave_data,tag=newbie,limit=1] game.data.wave.wave_number 1
        scoreboard players set @e[tag=wave_data,tag=newbie,limit=1] game.data.wave.mob_health 10
        scoreboard players set @e[tag=wave_data,tag=newbie,limit=1] game.data.wave.mob_has_mercy 1
        scoreboard players set @e[tag=wave_data,tag=newbie,limit=1] game.data.wave.mob_spawnpoint 0
        tag @e[tag=wave_data,tag=newbie,limit=1] remove newbie
    #wave 2: Creeper *10
        summon marker 0 0 0 {Tags:["wave_data","newbie"],CustomName:"Wave Data"}
        scoreboard players set @e[tag=wave_data,tag=newbie,limit=1] game.data.wave.mob_count 10
        scoreboard players set @e[tag=wave_data,tag=newbie,limit=1] game.data.wave.mob_type 0
        scoreboard players set @e[tag=wave_data,tag=newbie,limit=1] game.data.wave.wave_number 2
        scoreboard players set @e[tag=wave_data,tag=newbie,limit=1] game.data.wave.mob_health 20
        scoreboard players set @e[tag=wave_data,tag=newbie,limit=1] game.data.wave.mob_has_mercy 0
        scoreboard players set @e[tag=wave_data,tag=newbie,limit=1] game.data.wave.mob_spawnpoint 0
        tag @e[tag=wave_data,tag=newbie,limit=1] remove newbie
    #wave 3: Creeper *15
        summon marker 0 0 0 {Tags:["wave_data","newbie"],CustomName:"Wave Data"}
        scoreboard players set @e[tag=wave_data,tag=newbie,limit=1] game.data.wave.mob_count 15
        scoreboard players set @e[tag=wave_data,tag=newbie,limit=1] game.data.wave.mob_type 0
        scoreboard players set @e[tag=wave_data,tag=newbie,limit=1] game.data.wave.wave_number 3
        scoreboard players set @e[tag=wave_data,tag=newbie,limit=1] game.data.wave.mob_health 30
        scoreboard players set @e[tag=wave_data,tag=newbie,limit=1] game.data.wave.mob_has_mercy 0
        scoreboard players set @e[tag=wave_data,tag=newbie,limit=1] game.data.wave.mob_spawnpoint 0
        tag @e[tag=wave_data,tag=newbie,limit=1] remove newbie

function game:load_level_generic.after

