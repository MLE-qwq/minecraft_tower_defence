function game:load_level_generic.before

#set biome
    fillbiome -24 -8 -24 24 24 24 plains

#displaying instructions in chat
    tellraw @a "\u00a7bLevel 4: Ravine"

    tellraw @a "\u00a7aCredits:"
    tellraw @a "\u00a7a- Terrain: \u00a7fMLE_qwq"
    tellraw @a "\u00a7a- Code: \u00a7fMLE_qwq"
    
#specifying path blocks and pre-built path blocks
    setblock 15 -2 -15 gravel
    setblock 15 -2 -14 minecraft:dirt_path
#specifying dedicated original block
    setblock 15 -2 -13 grass_block

#marking
    summon minecraft:marker -48 -64 -16 {Tags:["terrain_origin"],CustomName:"Terrain Origin"}
    summon minecraft:marker -4 12 12 {Tags:["path_start","mob_spawnpoint"],CustomName:"Path Start"}
    summon minecraft:marker -4 12 -15 {Tags:["path_ending"],CustomName:"Path Ending"}


#initial currency
    scoreboard players set #global game.data.currency 200

#stores wave data
    scoreboard players set #global game.state.total_waves 10

    #wave 1: creeper*12
    summon marker 0 0 0 {Tags:["wave_data","newbie"],CustomName:"Wave Data"}
    scoreboard players set @e[tag=wave_data,tag=newbie,limit=1] game.data.wave.mob_count 12
    scoreboard players set @e[tag=wave_data,tag=newbie,limit=1] game.data.wave.mob_type 0
    scoreboard players set @e[tag=wave_data,tag=newbie,limit=1] game.data.wave.wave_number 1
    scoreboard players set @e[tag=wave_data,tag=newbie,limit=1] game.data.wave.mob_health 10
    scoreboard players set @e[tag=wave_data,tag=newbie,limit=1] game.data.wave.mob_has_mercy 0
    scoreboard players set @e[tag=wave_data,tag=newbie,limit=1] game.data.wave.mob_spawnpoint 0
    tag @e[tag=wave_data,tag=newbie,limit=1] remove newbie

    #wave 2: zombie*14
    summon marker 0 0 0 {Tags:["wave_data","newbie"],CustomName:"Wave Data"}
    scoreboard players set @e[tag=wave_data,tag=newbie,limit=1] game.data.wave.mob_count 14
    scoreboard players set @e[tag=wave_data,tag=newbie,limit=1] game.data.wave.mob_type 2
    scoreboard players set @e[tag=wave_data,tag=newbie,limit=1] game.data.wave.wave_number 2
    scoreboard players set @e[tag=wave_data,tag=newbie,limit=1] game.data.wave.mob_health 20
    scoreboard players set @e[tag=wave_data,tag=newbie,limit=1] game.data.wave.mob_has_mercy 0
    scoreboard players set @e[tag=wave_data,tag=newbie,limit=1] game.data.wave.mob_spawnpoint 0
    tag @e[tag=wave_data,tag=newbie,limit=1] remove newbie

    #wave 3: skeleton*16
    summon marker 0 0 0 {Tags:["wave_data","newbie"],CustomName:"Wave Data"}
    scoreboard players set @e[tag=wave_data,tag=newbie,limit=1] game.data.wave.mob_count 16
    scoreboard players set @e[tag=wave_data,tag=newbie,limit=1] game.data.wave.mob_type 3
    scoreboard players set @e[tag=wave_data,tag=newbie,limit=1] game.data.wave.wave_number 3
    scoreboard players set @e[tag=wave_data,tag=newbie,limit=1] game.data.wave.mob_health 30
    scoreboard players set @e[tag=wave_data,tag=newbie,limit=1] game.data.wave.mob_has_mercy 0
    scoreboard players set @e[tag=wave_data,tag=newbie,limit=1] game.data.wave.mob_spawnpoint 0
    tag @e[tag=wave_data,tag=newbie,limit=1] remove newbie

    #wave 4: creeper*18
    summon marker 0 0 0 {Tags:["wave_data","newbie"],CustomName:"Wave Data"}
    scoreboard players set @e[tag=wave_data,tag=newbie,limit=1] game.data.wave.mob_count 18
    scoreboard players set @e[tag=wave_data,tag=newbie,limit=1] game.data.wave.mob_type 0
    scoreboard players set @e[tag=wave_data,tag=newbie,limit=1] game.data.wave.wave_number 4
    scoreboard players set @e[tag=wave_data,tag=newbie,limit=1] game.data.wave.mob_health 40
    scoreboard players set @e[tag=wave_data,tag=newbie,limit=1] game.data.wave.mob_has_mercy 0
    scoreboard players set @e[tag=wave_data,tag=newbie,limit=1] game.data.wave.mob_spawnpoint 0
    tag @e[tag=wave_data,tag=newbie,limit=1] remove newbie

    #wave 5: zombie*20
    summon marker 0 0 0 {Tags:["wave_data","newbie"],CustomName:"Wave Data"}
    scoreboard players set @e[tag=wave_data,tag=newbie,limit=1] game.data.wave.mob_count 20
    scoreboard players set @e[tag=wave_data,tag=newbie,limit=1] game.data.wave.mob_type 2
    scoreboard players set @e[tag=wave_data,tag=newbie,limit=1] game.data.wave.wave_number 5
    scoreboard players set @e[tag=wave_data,tag=newbie,limit=1] game.data.wave.mob_health 50
    scoreboard players set @e[tag=wave_data,tag=newbie,limit=1] game.data.wave.mob_has_mercy 0
    scoreboard players set @e[tag=wave_data,tag=newbie,limit=1] game.data.wave.mob_spawnpoint 0
    tag @e[tag=wave_data,tag=newbie,limit=1] remove newbie

    #wave 6: skeleton*22
    summon marker 0 0 0 {Tags:["wave_data","newbie"],CustomName:"Wave Data"}
    scoreboard players set @e[tag=wave_data,tag=newbie,limit=1] game.data.wave.mob_count 22
    scoreboard players set @e[tag=wave_data,tag=newbie,limit=1] game.data.wave.mob_type 3
    scoreboard players set @e[tag=wave_data,tag=newbie,limit=1] game.data.wave.wave_number 6
    scoreboard players set @e[tag=wave_data,tag=newbie,limit=1] game.data.wave.mob_health 60
    scoreboard players set @e[tag=wave_data,tag=newbie,limit=1] game.data.wave.mob_has_mercy 0
    scoreboard players set @e[tag=wave_data,tag=newbie,limit=1] game.data.wave.mob_spawnpoint 0
    tag @e[tag=wave_data,tag=newbie,limit=1] remove newbie

    #wave 7: creeper*24
    summon marker 0 0 0 {Tags:["wave_data","newbie"],CustomName:"Wave Data"}
    scoreboard players set @e[tag=wave_data,tag=newbie,limit=1] game.data.wave.mob_count 24
    scoreboard players set @e[tag=wave_data,tag=newbie,limit=1] game.data.wave.mob_type 0
    scoreboard players set @e[tag=wave_data,tag=newbie,limit=1] game.data.wave.wave_number 7
    scoreboard players set @e[tag=wave_data,tag=newbie,limit=1] game.data.wave.mob_health 70
    scoreboard players set @e[tag=wave_data,tag=newbie,limit=1] game.data.wave.mob_has_mercy 0
    scoreboard players set @e[tag=wave_data,tag=newbie,limit=1] game.data.wave.mob_spawnpoint 0
    tag @e[tag=wave_data,tag=newbie,limit=1] remove newbie

    #wave 8: zombie*26
    summon marker 0 0 0 {Tags:["wave_data","newbie"],CustomName:"Wave Data"}
    scoreboard players set @e[tag=wave_data,tag=newbie,limit=1] game.data.wave.mob_count 26
    scoreboard players set @e[tag=wave_data,tag=newbie,limit=1] game.data.wave.mob_type 2
    scoreboard players set @e[tag=wave_data,tag=newbie,limit=1] game.data.wave.wave_number 8
    scoreboard players set @e[tag=wave_data,tag=newbie,limit=1] game.data.wave.mob_health 80
    scoreboard players set @e[tag=wave_data,tag=newbie,limit=1] game.data.wave.mob_has_mercy 0
    scoreboard players set @e[tag=wave_data,tag=newbie,limit=1] game.data.wave.mob_spawnpoint 0
    tag @e[tag=wave_data,tag=newbie,limit=1] remove newbie

    #wave 9: skeleton*28
    summon marker 0 0 0 {Tags:["wave_data","newbie"],CustomName:"Wave Data"}
    scoreboard players set @e[tag=wave_data,tag=newbie,limit=1] game.data.wave.mob_count 28
    scoreboard players set @e[tag=wave_data,tag=newbie,limit=1] game.data.wave.mob_type 3
    scoreboard players set @e[tag=wave_data,tag=newbie,limit=1] game.data.wave.wave_number 9
    scoreboard players set @e[tag=wave_data,tag=newbie,limit=1] game.data.wave.mob_health 90
    scoreboard players set @e[tag=wave_data,tag=newbie,limit=1] game.data.wave.mob_has_mercy 0
    scoreboard players set @e[tag=wave_data,tag=newbie,limit=1] game.data.wave.mob_spawnpoint 0
    tag @e[tag=wave_data,tag=newbie,limit=1] remove newbie


    #wave 10: spider jockey*5
    summon marker 0 0 0 {Tags:["wave_data","newbie"],CustomName:"Wave Data"}
    scoreboard players set @e[tag=wave_data,tag=newbie,limit=1] game.data.wave.mob_count 5
    scoreboard players set @e[tag=wave_data,tag=newbie,limit=1] game.data.wave.mob_type 5
    scoreboard players set @e[tag=wave_data,tag=newbie,limit=1] game.data.wave.wave_number 10
    scoreboard players set @e[tag=wave_data,tag=newbie,limit=1] game.data.wave.mob_health 100
    scoreboard players set @e[tag=wave_data,tag=newbie,limit=1] game.data.wave.mob_has_mercy 0
    scoreboard players set @e[tag=wave_data,tag=newbie,limit=1] game.data.wave.mob_spawnpoint 0
    tag @e[tag=wave_data,tag=newbie,limit=1] remove newbie

function game:load_level_generic.after