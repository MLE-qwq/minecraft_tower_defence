function game:load_level_generic.before

#set biome
    fillbiome -24 -8 -24 24 24 24 forest

#displaying instructions in chat
    tellraw @a "\u00a7bLevel 2: Forest"

    tellraw @a "\u00a7aCredits:"
    tellraw @a "\u00a7a- Terrain: \u00a7fMLE_qwq"
    tellraw @a "\u00a7a- Code: \u00a7fMLE_qwq"
    
#specifying path blocks and pre-built path blocks
    setblock 15 -2 -15 gravel
    setblock 15 -2 -14 minecraft:dirt_path
#specifying dedicated original block
    setblock 15 -2 -13 grass_block

#marking
    summon minecraft:marker -16 -64 16 {Tags:["terrain_origin"],CustomName:"Terrain Origin"}
    summon minecraft:marker -15 5 -8 {Tags:["path_start","mob_spawnpoint"],CustomName:"Path Start"}
    summon minecraft:marker 6 5 -8 {Tags:["path_ending"],CustomName:"Path Ending"}

#additional mob spawnpoints
    summon minecraft:marker 12 5 15 {Tags:["additional","mob_spawnpoint","newbie"],CustomName:"Additional Mob Spawnpoint"}
    scoreboard players set @e[tag=mob_spawnpoint,tag=newbie] game.data.spawnpoint.mob_spawnpoint 1
    tag @e[tag=mob_spawnpoint,tag=newbie] remove newbie

#initial currency
    scoreboard players set #global game.data.currency 350

#stores wave data
    scoreboard players set #global game.state.total_waves 5

    #wave 1: Wolf *7, spawn 0
        summon marker 0 0 0 {Tags:["wave_data","newbie"],CustomName:"Wave Data"}
        scoreboard players set @e[tag=wave_data,tag=newbie,limit=1] game.data.wave.mob_count 7
        scoreboard players set @e[tag=wave_data,tag=newbie,limit=1] game.data.wave.mob_type 1
        scoreboard players set @e[tag=wave_data,tag=newbie,limit=1] game.data.wave.wave_number 1
        scoreboard players set @e[tag=wave_data,tag=newbie,limit=1] game.data.wave.mob_health 5
        scoreboard players set @e[tag=wave_data,tag=newbie,limit=1] game.data.wave.mob_has_mercy 0
        scoreboard players set @e[tag=wave_data,tag=newbie,limit=1] game.data.wave.mob_spawnpoint 0
        tag @e[tag=wave_data,tag=newbie,limit=1] remove newbie

    #wave 2: Wolf *7, spawn 1
        summon marker 0 0 0 {Tags:["wave_data","newbie"],CustomName:"Wave Data"}
        scoreboard players set @e[tag=wave_data,tag=newbie,limit=1] game.data.wave.mob_count 7
        scoreboard players set @e[tag=wave_data,tag=newbie,limit=1] game.data.wave.mob_type 1
        scoreboard players set @e[tag=wave_data,tag=newbie,limit=1] game.data.wave.wave_number 2
        scoreboard players set @e[tag=wave_data,tag=newbie,limit=1] game.data.wave.mob_health 15
        scoreboard players set @e[tag=wave_data,tag=newbie,limit=1] game.data.wave.mob_has_mercy 0
        scoreboard players set @e[tag=wave_data,tag=newbie,limit=1] game.data.wave.mob_spawnpoint 1
        tag @e[tag=wave_data,tag=newbie,limit=1] remove newbie

    #wave 3: Creeper *12, spawn 0
        summon marker 0 0 0 {Tags:["wave_data","newbie"],CustomName:"Wave Data"}
        scoreboard players set @e[tag=wave_data,tag=newbie,limit=1] game.data.wave.mob_count 12
        scoreboard players set @e[tag=wave_data,tag=newbie,limit=1] game.data.wave.mob_type 0
        scoreboard players set @e[tag=wave_data,tag=newbie,limit=1] game.data.wave.wave_number 3
        scoreboard players set @e[tag=wave_data,tag=newbie,limit=1] game.data.wave.mob_health 25
        scoreboard players set @e[tag=wave_data,tag=newbie,limit=1] game.data.wave.mob_has_mercy 0
        scoreboard players set @e[tag=wave_data,tag=newbie,limit=1] game.data.wave.mob_spawnpoint 0
        tag @e[tag=wave_data,tag=newbie,limit=1] remove newbie

    #wave 4: Creeper *12, spawn 0
        summon marker 0 0 0 {Tags:["wave_data","newbie"],CustomName:"Wave Data"}
        scoreboard players set @e[tag=wave_data,tag=newbie,limit=1] game.data.wave.mob_count 12
        scoreboard players set @e[tag=wave_data,tag=newbie,limit=1] game.data.wave.mob_type 0
        scoreboard players set @e[tag=wave_data,tag=newbie,limit=1] game.data.wave.wave_number 4
        scoreboard players set @e[tag=wave_data,tag=newbie,limit=1] game.data.wave.mob_health 35
        scoreboard players set @e[tag=wave_data,tag=newbie,limit=1] game.data.wave.mob_has_mercy 0
        scoreboard players set @e[tag=wave_data,tag=newbie,limit=1] game.data.wave.mob_spawnpoint 1
        tag @e[tag=wave_data,tag=newbie,limit=1] remove newbie

    #wave 5: Creeper *10, spawn -1 (random)
        summon marker 0 0 0 {Tags:["wave_data","newbie"],CustomName:"Wave Data"}
        scoreboard players set @e[tag=wave_data,tag=newbie,limit=1] game.data.wave.mob_count 10
        scoreboard players set @e[tag=wave_data,tag=newbie,limit=1] game.data.wave.mob_type 0
        scoreboard players set @e[tag=wave_data,tag=newbie,limit=1] game.data.wave.wave_number 5
        scoreboard players set @e[tag=wave_data,tag=newbie,limit=1] game.data.wave.mob_health 45
        scoreboard players set @e[tag=wave_data,tag=newbie,limit=1] game.data.wave.mob_has_mercy 0
        scoreboard players set @e[tag=wave_data,tag=newbie,limit=1] game.data.wave.mob_spawnpoint -1
        tag @e[tag=wave_data,tag=newbie,limit=1] remove newbie

    #also wave 5: Wolves *10, spawn -1 (random)
        summon marker 0 0 0 {Tags:["wave_data","newbie"],CustomName:"Wave Data"}
        scoreboard players set @e[tag=wave_data,tag=newbie,limit=1] game.data.wave.mob_count 10
        scoreboard players set @e[tag=wave_data,tag=newbie,limit=1] game.data.wave.mob_type 1
        scoreboard players set @e[tag=wave_data,tag=newbie,limit=1] game.data.wave.wave_number 5
        scoreboard players set @e[tag=wave_data,tag=newbie,limit=1] game.data.wave.mob_health 45
        scoreboard players set @e[tag=wave_data,tag=newbie,limit=1] game.data.wave.mob_has_mercy 0
        scoreboard players set @e[tag=wave_data,tag=newbie,limit=1] game.data.wave.mob_spawnpoint -1
        tag @e[tag=wave_data,tag=newbie,limit=1] remove newbie

function game:load_level_generic.after